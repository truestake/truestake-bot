FROM python:3.11-slim
WORKDIR /app
RUN python -m pip install --no-cache-dir aiohttp
EXPOSE 9100
CMD ["bash","-lc","python - << 'PY'\nfrom aiohttp import web\nasync def webhook(request): return web.json_response({'status':'ok','service':'bot'})\napp=web.Application(); app.router.add_post('/telegram/webhook', webhook)\nweb.run_app(app, host='0.0.0.0', port=9100)\nPY"]
