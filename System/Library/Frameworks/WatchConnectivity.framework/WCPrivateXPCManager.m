@interface WCPrivateXPCManager
+ (id)privateClientInterface;
+ (id)privateDaemonInterface;
+ (id)sharedManager;
+ (void)initialize;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)delegateQueue;
- (WCPrivateXPCManager)init;
- (WCPrivateXPCManagerDelegate)delegate;
- (int)listenerResumedToken;
- (int)privateServiceShouldConnectToken;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)fakeIncomingPayloadOnSubService:(id)a3 ofType:(id)a4 clientData:(id)a5 resource:(id)a6 resourceSandboxToken:(id)a7 completionHandler:(id)a8;
- (void)handlePairedSyncComplicationsStartedWithCompletionHandler:(id)a3;
- (void)handlePingForExtensionBundleID:(id)a3;
- (void)isExtensionPrivileged:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setListenerResumedToken:(int)a3;
- (void)setPrivateServiceShouldConnectToken:(int)a3;
- (void)setupConnection;
@end

@implementation WCPrivateXPCManager

+ (void)initialize
{
  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D531318];
  v3 = (void *)sXPCPrivateManagerDaemonInterface;
  sXPCPrivateManagerDaemonInterface = v2;

  sXPCPrivateManagerClientInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D52E8E0];

  MEMORY[0x270F9A758]();
}

+ (id)privateDaemonInterface
{
  return (id)sXPCPrivateManagerDaemonInterface;
}

+ (id)privateClientInterface
{
  return (id)sXPCPrivateManagerClientInterface;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__WCPrivateXPCManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  uint64_t v2 = (void *)sharedManager_manager;

  return v2;
}

uint64_t __36__WCPrivateXPCManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (WCPrivateXPCManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)WCPrivateXPCManager;
  uint64_t v2 = [(WCPrivateXPCManager *)&v17 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.private.watchconnectivity.xpc.delegate-queue", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __27__WCPrivateXPCManager_init__block_invoke;
    v14 = &unk_26463C698;
    objc_copyWeak(&v15, &location);
    v5 = (void *)MEMORY[0x223CA3B50](&v11);
    v6 = (const char *)objc_msgSend(@"com.apple.wcd.listener.resumed", "UTF8String", v11, v12, v13, v14);
    v7 = MEMORY[0x263EF83A0];
    id v8 = MEMORY[0x263EF83A0];
    notify_register_dispatch(v6, &v2->_listenerResumedToken, v7, v5);

    v9 = (const char *)[@"com.apple.wcd.listener.private.should-connect" UTF8String];
    notify_register_dispatch(v9, &v2->_privateServiceShouldConnectToken, MEMORY[0x263EF83A0], v5);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__WCPrivateXPCManager_init__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446210;
    v10 = "-[WCPrivateXPCManager init]_block_invoke";
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s service listener resumed, attempting to re-establish XPC connection", (uint8_t *)&v9, 0xCu);
  }

  dispatch_queue_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained connection];

  id v6 = objc_loadWeakRetained(v3);
  v7 = [v6 connection];
  id v8 = [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_1];

  [v8 reconnect];
}

void __27__WCPrivateXPCManager_init__block_invoke_59(uint64_t a1, void *a2)
{
  id v2 = a2;
  dispatch_queue_t v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __27__WCPrivateXPCManager_init__block_invoke_59_cold_1((uint64_t)v2);
  }
}

- (void)dealloc
{
  notify_cancel(self->_listenerResumedToken);
  notify_cancel(self->_privateServiceShouldConnectToken);
  v3.receiver = self;
  v3.super_class = (Class)WCPrivateXPCManager;
  [(WCPrivateXPCManager *)&v3 dealloc];
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    [(WCPrivateXPCManager *)self setupConnection];
    connection = self->_connection;
  }

  return connection;
}

- (void)setupConnection
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  objc_super v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = "-[WCPrivateXPCManager setupConnection]";
    _os_log_impl(&dword_222A02000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s setting up private xpc connection", buf, 0xCu);
  }

  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.wcd.private" options:0];
  connection = self->_connection;
  self->_connection = v4;

  [(NSXPCConnection *)self->_connection setDelegate:self];
  [(NSXPCConnection *)self->_connection setExportedInterface:sXPCPrivateManagerClientInterface];
  [(NSXPCConnection *)self->_connection setExportedObject:self];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:sXPCPrivateManagerDaemonInterface];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__WCPrivateXPCManager_setupConnection__block_invoke;
  v7[3] = &unk_26463C6C0;
  objc_copyWeak(&v8, &location);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__WCPrivateXPCManager_setupConnection__block_invoke_67;
  v6[3] = &unk_26463C168;
  v6[4] = self;
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v6];
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __38__WCPrivateXPCManager_setupConnection__block_invoke(uint64_t a1)
{
  id v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __38__WCPrivateXPCManager_setupConnection__block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained connection];
  [v4 invalidate];
}

void __38__WCPrivateXPCManager_setupConnection__block_invoke_67(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6 = a4;
  [v6 retainArguments];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__WCPrivateXPCManager_connection_handleInvocation_isReply___block_invoke;
  block[3] = &unk_26463C168;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(delegateQueue, block);
}

uint64_t __59__WCPrivateXPCManager_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

- (void)fakeIncomingPayloadOnSubService:(id)a3 ofType:(id)a4 clientData:(id)a5 resource:(id)a6 resourceSandboxToken:(id)a7 completionHandler:(id)a8
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  v20 = wc_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (v19) {
      v21 = "YES";
    }
    else {
      v21 = "NO";
    }
    v22 = [v16 path];
    int v25 = 136447234;
    v26 = "-[WCPrivateXPCManager fakeIncomingPayloadOnSubService:ofType:clientData:resource:resourceSandboxToken:completionHandler:]";
    __int16 v27 = 2114;
    id v28 = v14;
    __int16 v29 = 2114;
    id v30 = v15;
    __int16 v31 = 2080;
    v32 = v21;
    __int16 v33 = 2114;
    v34 = v22;
    _os_log_impl(&dword_222A02000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@, transferType: %{public}@, clientData: %s, URL: %{public}@", (uint8_t *)&v25, 0x34u);
  }
  v23 = [(WCPrivateXPCManager *)self connection];
  v24 = [v23 remoteObjectProxyWithErrorHandler:&__block_literal_global_71];

  [v24 fakeIncomingPayloadOnSubService:v14 ofType:v15 clientData:v19 resource:v16 resourceSandboxToken:v18 completionHandler:v17];
}

void __121__WCPrivateXPCManager_fakeIncomingPayloadOnSubService_ofType_clientData_resource_resourceSandboxToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __121__WCPrivateXPCManager_fakeIncomingPayloadOnSubService_ofType_clientData_resource_resourceSandboxToken_completionHandler___block_invoke_cold_1((uint64_t)v2);
  }
}

- (void)handlePingForExtensionBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(WCPrivateXPCManager *)self delegate];
  [v5 xpcManager:self handlePingForExtensionBundleID:v4];
}

- (void)isExtensionPrivileged:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WCPrivateXPCManager *)self delegate];
  [v8 xpcManager:self isExtensionPrivileged:v7 completionHandler:v6];
}

- (void)handlePairedSyncComplicationsStartedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WCPrivateXPCManager *)self delegate];
  [v5 xpcManager:self handlePairedSyncComplicationsStartedWithCompletionHandler:v4];
}

- (WCPrivateXPCManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WCPrivateXPCManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (int)listenerResumedToken
{
  return self->_listenerResumedToken;
}

- (void)setListenerResumedToken:(int)a3
{
  self->_listenerResumedToken = a3;
}

- (int)privateServiceShouldConnectToken
{
  return self->_privateServiceShouldConnectToken;
}

- (void)setPrivateServiceShouldConnectToken:(int)a3
{
  self->_privateServiceShouldConnectToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __27__WCPrivateXPCManager_init__block_invoke_59_cold_1(uint64_t a1)
{
  uint64_t v1 = NSPrintF();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_222A02000, v2, v3, "%{public}s failed to retrieve remote object proxy %{public}@", v4, v5, v6, v7, a1, v9, 2u);
}

void __38__WCPrivateXPCManager_setupConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_222A02000, log, OS_LOG_TYPE_ERROR, "private xpc connection interrupted", v1, 2u);
}

void __121__WCPrivateXPCManager_fakeIncomingPayloadOnSubService_ofType_clientData_resource_resourceSandboxToken_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = NSPrintF();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_222A02000, v2, v3, "%{public}s failed to retrieve remote object proxy %{public}@", v4, v5, v6, v7, a1, v9, 2u);
}

@end