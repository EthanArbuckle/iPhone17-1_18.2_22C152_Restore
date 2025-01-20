@interface ATServiceProxyListener
- (ATService)service;
- (ATServiceProxyListener)initWithService:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)setService:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ATServiceProxyListener

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)setService:(id)a3
{
}

- (ATService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (ATService *)WeakRetained;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [v5 processIdentifier];
  v7 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = self;
    __int16 v25 = 1024;
    int v26 = v6;
    _os_log_impl(&dword_1D9BC7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ got connection from pid %i", buf, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  v9 = [[ATServiceProxyConnection alloc] initWithService:WeakRetained connection:v5];
  [v5 setExportedObject:v9];
  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33EB078];
  [v5 setRemoteObjectInterface:v10];
  v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33E6240];
  [v5 setExportedInterface:v11];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__ATServiceProxyListener_listener_shouldAcceptNewConnection___block_invoke;
  v21[3] = &__block_descriptor_36_e5_v8__0l;
  int v22 = v6;
  [v5 setInterruptionHandler:v21];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __61__ATServiceProxyListener_listener_shouldAcceptNewConnection___block_invoke_54;
  v17 = &unk_1E6B8C0A0;
  int v20 = v6;
  v18 = self;
  v19 = v9;
  v12 = v9;
  [v5 setInvalidationHandler:&v14];
  objc_msgSend(WeakRetained, "addObserver:", v12, v14, v15, v16, v17, v18);
  [v5 resume];

  return 1;
}

void __61__ATServiceProxyListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "connection interrupted from pid: %i", (uint8_t *)v4, 8u);
  }
}

void __61__ATServiceProxyListener_listener_shouldAcceptNewConnection___block_invoke_54(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated from pid: %i", (uint8_t *)v5, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained removeObserver:*(void *)(a1 + 40)];
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", (uint8_t *)&v6, 0xCu);
  }

  listener = self->_listener;
  if (listener)
  {
    [(NSXPCListener *)listener invalidate];
    [(NSXPCListener *)self->_listener setDelegate:0];
    uint64_t v5 = self->_listener;
    self->_listener = 0;
  }
}

- (void)start
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&v7, 0xCu);
  }

  id v4 = objc_alloc(MEMORY[0x1E4F29290]);
  uint64_t v5 = (NSXPCListener *)[v4 initWithMachServiceName:*MEMORY[0x1E4F4A270]];
  listener = self->_listener;
  self->_listener = v5;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
}

- (ATServiceProxyListener)initWithService:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATServiceProxyListener;
  uint64_t v5 = [(ATServiceProxyListener *)&v8 init];
  int v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_service, v4);
  }

  return v6;
}

@end