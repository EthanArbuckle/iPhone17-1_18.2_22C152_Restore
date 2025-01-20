@interface HearingMLHelperService
- (HearingMLHelperService)init;
- (HearingMLHelperServiceDelegate)delegate;
- (NSXPCConnection)xpcConnection;
- (id)_serviceProxy;
- (void)_destroyXPCConnection;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)trainWithDetectorID:(id)a3 hallucinatorPath:(id)a4 pretrainedWeightsPath:(id)a5 resultHandler:(id)a6;
@end

@implementation HearingMLHelperService

- (HearingMLHelperService)init
{
  v6.receiver = self;
  v6.super_class = (Class)HearingMLHelperService;
  v2 = [(HearingMLHelperService *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("HearingMLHelperService Connection", 0);
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
  uint64_t v7 = *MEMORY[0x263EF8340];
  dispatch_queue_t v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v6 = self;
    _os_log_impl(&dword_22504B000, v3, OS_LOG_TYPE_DEFAULT, "HearingMLHelperService being deallocated: %@", buf, 0xCu);
  }

  [(HearingMLHelperService *)self _destroyXPCConnection];
  v4.receiver = self;
  v4.super_class = (Class)HearingMLHelperService;
  [(HearingMLHelperService *)&v4 dealloc];
}

- (NSXPCConnection)xpcConnection
{
  objc_initWeak(&location, self);
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__HearingMLHelperService_xpcConnection__block_invoke;
  block[3] = &unk_2647175A8;
  block[4] = self;
  objc_copyWeak(&v7, &location);
  dispatch_sync(xpcConnectionQueue, block);
  objc_super v4 = self->_xpcConnection;
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __39__HearingMLHelperService_xpcConnection__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.accessibility.HearingMLHelperService"];
    dispatch_queue_t v3 = HearingMLHelperServiceInterface();
    [v2 setRemoteObjectInterface:v3];

    objc_super v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D86F998];
    [v2 setExportedInterface:v4];

    [v2 setExportedObject:*(void *)(a1 + 32)];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __39__HearingMLHelperService_xpcConnection__block_invoke_2;
    v12[3] = &unk_264717580;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    [v2 setInterruptionHandler:v12];
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __39__HearingMLHelperService_xpcConnection__block_invoke_47;
    v10 = &unk_264717580;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    [v2 setInvalidationHandler:&v7];
    objc_msgSend(v2, "resume", v7, v8, v9, v10);
    uint64_t v5 = *(void *)(a1 + 32);
    objc_super v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v2;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
  }
}

void __39__HearingMLHelperService_xpcConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = AXLogUltronKShot();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_22504B000, v2, OS_LOG_TYPE_DEFAULT, "Connection to service interrupted. client: %@", (uint8_t *)&v4, 0xCu);
  }

  dispatch_queue_t v3 = [WeakRetained delegate];
  [v3 hearingMLHelperService:WeakRetained eventOccurred:1];

  [WeakRetained _destroyXPCConnection];
}

void __39__HearingMLHelperService_xpcConnection__block_invoke_47(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = AXLogUltronKShot();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __39__HearingMLHelperService_xpcConnection__block_invoke_47_cold_1((uint64_t)WeakRetained, v2);
  }

  dispatch_queue_t v3 = [WeakRetained delegate];
  [v3 hearingMLHelperService:WeakRetained eventOccurred:2];

  [WeakRetained _destroyXPCConnection];
}

- (id)_serviceProxy
{
  objc_initWeak(&location, self);
  dispatch_queue_t v3 = [(HearingMLHelperService *)self xpcConnection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__HearingMLHelperService__serviceProxy__block_invoke;
  v6[3] = &unk_2647175D0;
  objc_copyWeak(&v7, &location);
  int v4 = [v3 remoteObjectProxyWithErrorHandler:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

void __39__HearingMLHelperService__serviceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = AXLogUltronKShot();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __39__HearingMLHelperService__serviceProxy__block_invoke_cold_1((uint64_t)v3, v5);
  }

  uint64_t v6 = [WeakRetained delegate];
  [v6 hearingMLHelperService:WeakRetained eventOccurred:3];
}

- (void)trainWithDetectorID:(id)a3 hallucinatorPath:(id)a4 pretrainedWeightsPath:(id)a5 resultHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(HearingMLHelperService *)self _serviceProxy];
  [v14 trainWithDetectorID:v13 hallucinatorPath:v12 pretrainedWeightsPath:v11 resultHandler:v10];
}

- (HearingMLHelperServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HearingMLHelperServiceDelegate *)WeakRetained;
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

void __39__HearingMLHelperService_xpcConnection__block_invoke_47_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22504B000, a2, OS_LOG_TYPE_ERROR, "Connection to service invalidated. client: %@", (uint8_t *)&v2, 0xCu);
}

void __39__HearingMLHelperService__serviceProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22504B000, a2, OS_LOG_TYPE_ERROR, "Failed to get service proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end