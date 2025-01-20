@interface ATStatusObserverListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation ATStatusObserverListener

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = [v5 processIdentifier];
  v7 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    __int16 v21 = 1024;
    int v22 = v6;
    _os_log_impl(&dword_1D9BC7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Got connection from pid %i", buf, 0x12u);
  }

  v8 = [[ATStatusObserverConnection alloc] initWithConnection:v5];
  v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33EB0D8];
  [v5 setRemoteObjectInterface:v9];

  v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33E50F0];
  [v5 setExportedInterface:v10];

  [v5 setExportedObject:v8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__ATStatusObserverListener_listener_shouldAcceptNewConnection___block_invoke;
  v17[3] = &unk_1E6B8C2E8;
  v17[4] = self;
  int v18 = v6;
  [v5 setInterruptionHandler:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__ATStatusObserverListener_listener_shouldAcceptNewConnection___block_invoke_52;
  v14[3] = &unk_1E6B8C0A0;
  int v16 = v6;
  v14[4] = self;
  v15 = v8;
  v11 = v8;
  [v5 setInvalidationHandler:v14];
  v12 = +[ATStatusMonitor sharedMonitor];
  [v12 addObserver:v11];

  [v5 resume];
  return 1;
}

void __63__ATStatusObserverListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
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

void __63__ATStatusObserverListener_listener_shouldAcceptNewConnection___block_invoke_52(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 48);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection invalidated from pid: %i", (uint8_t *)&v6, 0x12u);
  }

  int v5 = +[ATStatusMonitor sharedMonitor];
  [v5 removeObserver:*(void *)(a1 + 40)];
}

- (void)stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", (uint8_t *)&v6, 0xCu);
  }

  listener = self->_listener;
  if (listener)
  {
    [(NSXPCListener *)listener invalidate];
    [(NSXPCListener *)self->_listener setDelegate:0];
    int v5 = self->_listener;
    self->_listener = 0;
  }
}

- (void)start
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&v7, 0xCu);
  }

  id v4 = objc_alloc(MEMORY[0x1E4F29290]);
  int v5 = (NSXPCListener *)[v4 initWithMachServiceName:*MEMORY[0x1E4F4A268]];
  listener = self->_listener;
  self->_listener = v5;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
}

@end