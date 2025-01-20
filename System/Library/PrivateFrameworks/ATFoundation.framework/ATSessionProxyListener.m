@interface ATSessionProxyListener
- (ATSession)session;
- (ATSessionProxyListener)initWithSession:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)sessionDidFinish:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ATSessionProxyListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connections, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (ATSession)session
{
  return self->_session;
}

- (void)sessionDidFinish:(id)a3
{
  id v4 = +[ATSessionServerListener sharedSessionServer];
  [v4 removeSession:self->_session];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 processIdentifier];
  v9 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = self;
    __int16 v23 = 1024;
    int v24 = v8;
    _os_log_impl(&dword_1D9BC7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Got connection from pid %i", buf, 0x12u);
  }

  v10 = [[ATSessionProxyConnection alloc] initWithSession:self->_session connection:v7];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E6B8C5A0;
  block[4] = self;
  v12 = v10;
  v20 = v12;
  dispatch_sync(queue, block);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v17[3] = &unk_1E6B8C2E8;
  v17[4] = self;
  int v18 = v8;
  [v7 setInterruptionHandler:v17];
  objc_initWeak((id *)buf, v12);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_3;
  v14[3] = &unk_1E6B8C380;
  v14[4] = self;
  int v16 = v8;
  objc_copyWeak(&v15, (id *)buf);
  [v7 setInvalidationHandler:v14];
  [(ATSessionProxyConnection *)v12 start];
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return 1;
}

uint64_t __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

void __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection interrupted from pid: %i", (uint8_t *)&v5, 0x12u);
  }
}

void __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v3;
    __int16 v13 = 1024;
    int v14 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection invalidated from pid: %i", buf, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained stop];
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(NSObject **)(v7 + 24);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_4;
    v9[3] = &unk_1E6B8C5A0;
    v9[4] = v7;
    id v10 = v6;
    dispatch_sync(v8, v9);
  }
}

uint64_t __61__ATSessionProxyListener_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)stop
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    int v5 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stop", (uint8_t *)&v4, 0xCu);
  }

  [(NSXPCListener *)self->_listener invalidate];
}

- (void)start
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    int v5 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&v4, 0xCu);
  }

  [(ATSession *)self->_session addObserver:self];
  [(NSXPCListener *)self->_listener resume];
}

- (ATSessionProxyListener)initWithSession:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATSessionProxyListener;
  uint64_t v6 = [(ATSessionProxyListener *)&v17 init];
  if (v6)
  {
    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    connections = v6->_connections;
    v6->_connections = v7;

    objc_storeStrong((id *)&v6->_session, a3);
    uint64_t v9 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v9;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    v11 = [(NSXPCListener *)v6->_listener endpoint];
    [(ATSession *)v6->_session setEndpoint:v11];

    uint64_t v12 = (objc_class *)objc_opt_class();
    Name = class_getName(v12);
    dispatch_queue_t v14 = dispatch_queue_create(Name, 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v14;
  }
  return v6;
}

@end