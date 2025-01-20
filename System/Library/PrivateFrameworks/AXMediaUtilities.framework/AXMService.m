@interface AXMService
- (AXMService)init;
- (AXMServiceDelegate)delegate;
- (NSXPCConnection)xpcConnection;
- (id)_serviceProxy;
- (void)_destroyXPCConnection;
- (void)dealloc;
- (void)prewarmVisionEngineService;
- (void)setDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)visionEngine:(id)a3 evaluateSource:(id)a4 context:(id)a5 options:(int64_t)a6 result:(id)a7;
@end

@implementation AXMService

- (AXMService)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXMService;
  v2 = [(AXMService *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXMServiceConnection", 0);
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)_destroyXPCConnection
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = AXMediaLogService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v6 = self;
    _os_log_impl(&dword_1B57D5000, v3, OS_LOG_TYPE_DEFAULT, "AXMService being deallocated: %@", buf, 0xCu);
  }

  [(AXMService *)self _destroyXPCConnection];
  v4.receiver = self;
  v4.super_class = (Class)AXMService;
  [(AXMService *)&v4 dealloc];
}

- (NSXPCConnection)xpcConnection
{
  objc_initWeak(&location, self);
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__AXMService_xpcConnection__block_invoke;
  block[3] = &unk_1E6116E70;
  block[4] = self;
  objc_copyWeak(&v7, &location);
  dispatch_sync(xpcConnectionQueue, block);
  objc_super v4 = self->_xpcConnection;
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __27__AXMService_xpcConnection__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F29268]);
    dispatch_queue_t v3 = (void *)[v2 initWithServiceName:AXMServiceIdentifier];
    objc_super v4 = AXMServiceInterface();
    [v3 setRemoteObjectInterface:v4];

    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E97EA0];
    [v3 setExportedInterface:v5];

    [v3 setExportedObject:*(void *)(a1 + 32)];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __27__AXMService_xpcConnection__block_invoke_2;
    v13[3] = &unk_1E6116E48;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    [v3 setInterruptionHandler:v13];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __27__AXMService_xpcConnection__block_invoke_71;
    v11 = &unk_1E6116E48;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    [v3 setInvalidationHandler:&v8];
    objc_msgSend(v3, "resume", v8, v9, v10, v11);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v3;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
  }
}

void __27__AXMService_xpcConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = AXMediaLogService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_1B57D5000, v2, OS_LOG_TYPE_DEFAULT, "Connection to service interrupted. client: %@", (uint8_t *)&v4, 0xCu);
  }

  dispatch_queue_t v3 = [WeakRetained delegate];
  [v3 axMediaUtilitiesService:WeakRetained eventOccurred:1];

  [WeakRetained _destroyXPCConnection];
}

void __27__AXMService_xpcConnection__block_invoke_71(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = AXMediaLogService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __27__AXMService_xpcConnection__block_invoke_71_cold_1((uint64_t)WeakRetained, v2);
  }

  dispatch_queue_t v3 = [WeakRetained delegate];
  [v3 axMediaUtilitiesService:WeakRetained eventOccurred:2];

  [WeakRetained _destroyXPCConnection];
}

- (id)_serviceProxy
{
  objc_initWeak(&location, self);
  dispatch_queue_t v3 = [(AXMService *)self xpcConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__AXMService__serviceProxy__block_invoke;
  v6[3] = &unk_1E6116E98;
  objc_copyWeak(&v7, &location);
  int v4 = [v3 remoteObjectProxyWithErrorHandler:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);

  return v4;
}

void __27__AXMService__serviceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = AXMediaLogService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __27__AXMService__serviceProxy__block_invoke_cold_1((uint64_t)v3, v5);
  }

  uint64_t v6 = [WeakRetained delegate];
  [v6 axMediaUtilitiesService:WeakRetained eventOccurred:3];
}

- (void)prewarmVisionEngineService
{
  id v2 = [(AXMService *)self _serviceProxy];
  [v2 prewarmVisionEngineService];
}

- (void)visionEngine:(id)a3 evaluateSource:(id)a4 context:(id)a5 options:(int64_t)a6 result:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(AXMService *)self _serviceProxy];
  [v16 visionEngine:v15 evaluateSource:v14 context:v13 options:a6 result:v12];
}

- (AXMServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
}

void __27__AXMService_xpcConnection__block_invoke_71_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Connection to service invalidated. client: %@", (uint8_t *)&v2, 0xCu);
}

void __27__AXMService__serviceProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Failed to get service proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end