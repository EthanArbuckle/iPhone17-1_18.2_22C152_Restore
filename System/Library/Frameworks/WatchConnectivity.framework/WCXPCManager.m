@interface WCXPCManager
+ (id)clientInterface;
+ (id)daemonInterface;
+ (id)sharedManager;
+ (void)initialize;
- (BOOL)connectionInvalidated;
- (BOOL)reconnectFailed;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)workQueue;
- (WCXPCManager)init;
- (WCXPCManagerDelegate)delegate;
- (int)listenerResumedToken;
- (unint64_t)reconnectRetryCount;
- (void)acknowledgeFileIndexWithIdentifier:(id)a3 clientPairingID:(id)a4;
- (void)acknowledgeFileResultIndexWithIdentifier:(id)a3 clientPairingID:(id)a4;
- (void)acknowledgeUserInfoIndexWithIdentifier:(id)a3 clientPairingID:(id)a4;
- (void)acknowledgeUserInfoResultIndexWithIdentifier:(id)a3 clientPairingID:(id)a4;
- (void)cancelAllOutstandingMessages;
- (void)cancelSendWithIdentifier:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)handleActiveDeviceSwitchStarted;
- (void)handleApplicationContextWithPairingID:(id)a3;
- (void)handleFileResultWithPairingID:(id)a3;
- (void)handleIncomingFileWithPairingID:(id)a3;
- (void)handleIncomingUserInfoWithPairingID:(id)a3;
- (void)handleInterruptedConnection;
- (void)handleMessageSendingAllowed;
- (void)handleRequest:(id)a3;
- (void)handleResponse:(id)a3;
- (void)handleSentMessageWithIdentifier:(id)a3 error:(id)a4;
- (void)handleSessionStateChanged:(id)a3;
- (void)handleUserInfoResultWithPairingID:(id)a3;
- (void)interruptionHandler;
- (void)invalidateConnection;
- (void)onqueue_reconnect;
- (void)onqueue_retryConnectIfNecessary;
- (void)sendMessage:(id)a3 clientPairingID:(id)a4 acceptanceHandler:(id)a5;
- (void)sendMessage:(id)a3 clientPairingID:(id)a4 acceptanceHandler:(id)a5 errorHandler:(id)a6;
- (void)sessionReadyForInitialStateForClientPairingID:(id)a3 supportsActiveDeviceSwitch:(BOOL)a4 withErrorHandler:(id)a5;
- (void)setConnectionInvalidated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setListenerResumedToken:(int)a3;
- (void)setReconnectFailed:(BOOL)a3;
- (void)setReconnectRetryCount:(unint64_t)a3;
- (void)setupConnection;
- (void)transferFile:(id)a3 sandboxToken:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6;
- (void)transferUserInfo:(id)a3 withURL:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6;
- (void)updateApplicationContext:(id)a3 clientPairingID:(id)a4 errorHandler:(id)a5;
@end

@implementation WCXPCManager

uint64_t __52__WCXPCManager_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

+ (id)daemonInterface
{
  return (id)sXPCManagerDaemonInterface;
}

+ (id)clientInterface
{
  return (id)sXPCManagerClientInterface;
}

+ (void)initialize
{
  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D52FBD8];
  v3 = (void *)sXPCManagerDaemonInterface;
  sXPCManagerDaemonInterface = v2;

  v4 = (void *)sXPCManagerDaemonInterface;
  v5 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v4 setClasses:v5 forSelector:sel_sendMessage_clientPairingID_acceptanceHandler_ argumentIndex:0 ofReply:0];

  v6 = (void *)sXPCManagerDaemonInterface;
  v7 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v6 setClasses:v7 forSelector:sel_transferFile_sandboxToken_clientPairingID_errorHandler_ argumentIndex:0 ofReply:0];

  v8 = (void *)sXPCManagerDaemonInterface;
  v9 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v8 setClasses:v9 forSelector:sel_transferUserInfo_withURL_clientPairingID_errorHandler_ argumentIndex:0 ofReply:0];

  v10 = (void *)sXPCManagerDaemonInterface;
  v11 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v10 setClasses:v11 forSelector:sel_transferUserInfo_withURL_clientPairingID_errorHandler_ argumentIndex:1 ofReply:0];

  uint64_t v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D52F910];
  v13 = (void *)sXPCManagerClientInterface;
  sXPCManagerClientInterface = v12;

  v14 = (void *)sXPCManagerClientInterface;
  v15 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v14 setClasses:v15 forSelector:sel_handleSessionStateChanged_ argumentIndex:0 ofReply:0];

  v16 = (void *)sXPCManagerClientInterface;
  v17 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v16 setClasses:v17 forSelector:sel_handleRequest_ argumentIndex:0 ofReply:0];

  v18 = (void *)sXPCManagerClientInterface;
  id v19 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v18 setClasses:v19 forSelector:sel_handleResponse_ argumentIndex:0 ofReply:0];
}

uint64_t __29__WCXPCManager_sharedManager__block_invoke()
{
  sharedManager_manager_0 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (WCXPCManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)WCXPCManager;
  uint64_t v2 = [(WCXPCManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_reconnectRetryCount = 0;
    *(_WORD *)&v2->_connectionInvalidated = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.private.watchconnectivity.work-queue", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v3);
    v6 = (const char *)[@"com.apple.wcd.listener.resumed" UTF8String];
    v7 = v3->_workQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __20__WCXPCManager_init__block_invoke;
    handler[3] = &unk_26463C7D0;
    v10 = v3;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch(v6, &v3->_listenerResumedToken, v7, handler);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    [(WCXPCManager *)self setupConnection];
    connection = self->_connection;
  }

  return connection;
}

- (void)setupConnection
{
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.wcd" options:0];
  connection = self->_connection;
  self->_connection = v3;

  [(NSXPCConnection *)self->_connection setDelegate:self];
  [(NSXPCConnection *)self->_connection setExportedInterface:sXPCManagerClientInterface];
  [(NSXPCConnection *)self->_connection setExportedObject:self];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:sXPCManagerDaemonInterface];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__WCXPCManager_setupConnection__block_invoke;
  v6[3] = &unk_26463C6C0;
  objc_copyWeak(&v7, &location);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__WCXPCManager_setupConnection__block_invoke_3;
  v5[3] = &unk_26463C168;
  v5[4] = self;
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v5];
  [(NSXPCConnection *)self->_connection resume];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)handleSessionStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(WCXPCManager *)self delegate];
  [v5 handleSessionStateChanged:v4];
}

- (WCXPCManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WCXPCManagerDelegate *)WeakRetained;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6 = a4;
  [v6 retainArguments];
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__WCXPCManager_connection_handleInvocation_isReply___block_invoke;
  block[3] = &unk_26463C168;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workQueue, block);
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__WCXPCManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, block);
  }
  uint64_t v2 = (void *)sharedManager_manager_0;

  return v2;
}

- (void)sessionReadyForInitialStateForClientPairingID:(id)a3 supportsActiveDeviceSwitch:(BOOL)a4 withErrorHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(WCXPCManager *)self connection];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __106__WCXPCManager_sessionReadyForInitialStateForClientPairingID_supportsActiveDeviceSwitch_withErrorHandler___block_invoke;
  v17[3] = &unk_26463C820;
  objc_copyWeak(&v19, &location);
  id v11 = v9;
  id v18 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v17];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __106__WCXPCManager_sessionReadyForInitialStateForClientPairingID_supportsActiveDeviceSwitch_withErrorHandler___block_invoke_2;
  v14[3] = &unk_26463C820;
  objc_copyWeak(&v16, &location);
  id v13 = v11;
  id v15 = v13;
  [v12 sessionReadyForInitialStateForClientPairingID:v8 supportsActiveDeviceSwitch:v6 withErrorHandler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __106__WCXPCManager_sessionReadyForInitialStateForClientPairingID_supportsActiveDeviceSwitch_withErrorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = a2 != 0;
  id v4 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained setReconnectFailed:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setReconnectFailed:(BOOL)a3
{
  self->_reconnectFailed = a3;
}

void __20__WCXPCManager_init__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setReconnectRetryCount:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "onqueue_retryConnectIfNecessary");
}

void __31__WCXPCManager_setupConnection__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__WCXPCManager_setupConnection__block_invoke_2;
  block[3] = &unk_26463C6C0;
  objc_copyWeak(&v5, v1);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __31__WCXPCManager_setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained interruptionHandler];
}

void __31__WCXPCManager_setupConnection__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_222A02000, v2, OS_LOG_TYPE_DEFAULT, "xpc connection invalidated", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;
}

- (void)onqueue_retryConnectIfNecessary
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(WCXPCManager *)self reconnectFailed])
  {
    if ([(WCXPCManager *)self reconnectRetryCount] > 4)
    {
      id v4 = wc_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136446466;
        id v6 = "-[WCXPCManager onqueue_retryConnectIfNecessary]";
        __int16 v7 = 1024;
        int v8 = [(WCXPCManager *)self reconnectRetryCount];
        _os_log_impl(&dword_222A02000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s failed to reconnect to daemon (%d attempts)", (uint8_t *)&v5, 0x12u);
      }
    }
    else
    {
      [(WCXPCManager *)self setReconnectRetryCount:[(WCXPCManager *)self reconnectRetryCount] + 1];
      uint64_t v3 = wc_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136446466;
        id v6 = "-[WCXPCManager onqueue_retryConnectIfNecessary]";
        __int16 v7 = 1024;
        int v8 = [(WCXPCManager *)self reconnectRetryCount];
        _os_log_impl(&dword_222A02000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s retrying previously failed reconnect (%d attempt)", (uint8_t *)&v5, 0x12u);
      }

      [(WCXPCManager *)self setReconnectFailed:0];
      [(WCXPCManager *)self onqueue_reconnect];
    }
  }
}

- (void)onqueue_reconnect
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v11 = "-[WCXPCManager onqueue_reconnect]";
    _os_log_impl(&dword_222A02000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s ", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v4 = [(WCXPCManager *)self delegate];
  int v5 = [v4 currentPairingID];
  id v6 = [(WCXPCManager *)self delegate];
  uint64_t v7 = [v6 supportsActiveDeviceSwitch];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__WCXPCManager_onqueue_reconnect__block_invoke;
  v8[3] = &unk_26463C7F8;
  objc_copyWeak(&v9, (id *)buf);
  v8[4] = self;
  [(WCXPCManager *)self sessionReadyForInitialStateForClientPairingID:v5 supportsActiveDeviceSwitch:v7 withErrorHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __33__WCXPCManager_onqueue_reconnect__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = wc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __33__WCXPCManager_onqueue_reconnect__block_invoke_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    uint64_t v7 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) setReconnectRetryCount:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    uint64_t v7 = 0;
  }
  [WeakRetained setReconnectFailed:v7];
}

- (void)interruptionHandler
{
  if ([(WCXPCManager *)self connectionInvalidated])
  {
    id v3 = [(WCXPCManager *)self connection];
    [v3 invalidate];
  }
  else
  {
    [(WCXPCManager *)self handleInterruptedConnection];
    if ([(WCXPCManager *)self reconnectFailed])
    {
      [(WCXPCManager *)self onqueue_retryConnectIfNecessary];
    }
    else
    {
      [(WCXPCManager *)self onqueue_reconnect];
    }
  }
}

- (void)handleInterruptedConnection
{
  id v2 = [(WCXPCManager *)self delegate];
  [v2 xpcConnectionInterrupted];
}

void __106__WCXPCManager_sessionReadyForInitialStateForClientPairingID_supportsActiveDeviceSwitch_withErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2 != 0;
  id v4 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained setReconnectFailed:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendMessage:(id)a3 clientPairingID:(id)a4 acceptanceHandler:(id)a5
{
}

- (void)sendMessage:(id)a3 clientPairingID:(id)a4 acceptanceHandler:(id)a5 errorHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(WCXPCManager *)self onqueue_retryConnectIfNecessary];
  v14 = [(WCXPCManager *)self connection];
  id v15 = [v14 remoteObjectProxyWithErrorHandler:v10];

  [v15 sendMessage:v13 clientPairingID:v12 acceptanceHandler:v11];
}

- (void)updateApplicationContext:(id)a3 clientPairingID:(id)a4 errorHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(WCXPCManager *)self onqueue_retryConnectIfNecessary];
  id v11 = [(WCXPCManager *)self connection];
  id v12 = [v11 remoteObjectProxyWithErrorHandler:v8];

  [v12 updateApplicationContext:v10 clientPairingID:v9 errorHandler:v8];
}

- (void)transferFile:(id)a3 sandboxToken:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(WCXPCManager *)self onqueue_retryConnectIfNecessary];
  v14 = [(WCXPCManager *)self connection];
  id v15 = [v14 remoteObjectProxyWithErrorHandler:v10];

  [v15 transferFile:v13 sandboxToken:v12 clientPairingID:v11 errorHandler:v10];
}

- (void)transferUserInfo:(id)a3 withURL:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(WCXPCManager *)self onqueue_retryConnectIfNecessary];
  v14 = [(WCXPCManager *)self connection];
  id v15 = [v14 remoteObjectProxyWithErrorHandler:v10];

  [v15 transferUserInfo:v13 withURL:v12 clientPairingID:v11 errorHandler:v10];
}

- (void)cancelSendWithIdentifier:(id)a3
{
  id v4 = a3;
  [(WCXPCManager *)self onqueue_retryConnectIfNecessary];
  int v5 = [(WCXPCManager *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_4];

  [v6 cancelSendWithIdentifier:v4];
}

void __41__WCXPCManager_cancelSendWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __41__WCXPCManager_cancelSendWithIdentifier___block_invoke_cold_1();
  }
}

- (void)cancelAllOutstandingMessages
{
  [(WCXPCManager *)self onqueue_retryConnectIfNecessary];
  BOOL v3 = [(WCXPCManager *)self connection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_106];

  [v4 cancelAllOutstandingMessages];
}

void __44__WCXPCManager_cancelAllOutstandingMessages__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__WCXPCManager_cancelAllOutstandingMessages__block_invoke_cold_1();
  }
}

- (void)acknowledgeFileIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WCXPCManager *)self onqueue_retryConnectIfNecessary];
  id v8 = [(WCXPCManager *)self connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_108];

  [v9 acknowledgeFileIndexWithIdentifier:v7 clientPairingID:v6];
}

void __67__WCXPCManager_acknowledgeFileIndexWithIdentifier_clientPairingID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__WCXPCManager_acknowledgeFileIndexWithIdentifier_clientPairingID___block_invoke_cold_1();
  }
}

- (void)acknowledgeFileResultIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WCXPCManager *)self onqueue_retryConnectIfNecessary];
  id v8 = [(WCXPCManager *)self connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_110];

  [v9 acknowledgeFileResultIndexWithIdentifier:v7 clientPairingID:v6];
}

void __73__WCXPCManager_acknowledgeFileResultIndexWithIdentifier_clientPairingID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__WCXPCManager_acknowledgeFileResultIndexWithIdentifier_clientPairingID___block_invoke_cold_1();
  }
}

- (void)acknowledgeUserInfoIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WCXPCManager *)self onqueue_retryConnectIfNecessary];
  id v8 = [(WCXPCManager *)self connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_112];

  [v9 acknowledgeUserInfoIndexWithIdentifier:v7 clientPairingID:v6];
}

void __71__WCXPCManager_acknowledgeUserInfoIndexWithIdentifier_clientPairingID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__WCXPCManager_acknowledgeUserInfoIndexWithIdentifier_clientPairingID___block_invoke_cold_1();
  }
}

- (void)acknowledgeUserInfoResultIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WCXPCManager *)self onqueue_retryConnectIfNecessary];
  id v8 = [(WCXPCManager *)self connection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_114];

  [v9 acknowledgeUserInfoResultIndexWithIdentifier:v7 clientPairingID:v6];
}

void __77__WCXPCManager_acknowledgeUserInfoResultIndexWithIdentifier_clientPairingID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __77__WCXPCManager_acknowledgeUserInfoResultIndexWithIdentifier_clientPairingID___block_invoke_cold_1();
  }
}

- (void)invalidateConnection
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    id v6 = "-[WCXPCManager invalidateConnection]";
    _os_log_impl(&dword_222A02000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s ", (uint8_t *)&v5, 0xCu);
  }

  if (![(WCXPCManager *)self connectionInvalidated])
  {
    [(WCXPCManager *)self setConnectionInvalidated:1];
    id v4 = [(WCXPCManager *)self connection];
    [v4 invalidate];
  }
}

- (void)handleMessageSendingAllowed
{
  id v2 = [(WCXPCManager *)self delegate];
  [v2 handleMessageSendingAllowed];
}

- (void)handleSentMessageWithIdentifier:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WCXPCManager *)self delegate];
  [v8 handleSentMessageWithIdentifier:v7 error:v6];
}

- (void)handleRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(WCXPCManager *)self delegate];
  [v5 handleRequest:v4];
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  id v5 = [(WCXPCManager *)self delegate];
  [v5 handleResponse:v4];
}

- (void)handleApplicationContextWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = [(WCXPCManager *)self delegate];
  [v5 handleApplicationContextWithPairingID:v4];
}

- (void)handleIncomingFileWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = [(WCXPCManager *)self delegate];
  [v5 handleIncomingFileWithPairingID:v4];
}

- (void)handleIncomingUserInfoWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = [(WCXPCManager *)self delegate];
  [v5 handleIncomingUserInfoWithPairingID:v4];
}

- (void)handleFileResultWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = [(WCXPCManager *)self delegate];
  [v5 handleFileResultWithPairingID:v4];
}

- (void)handleUserInfoResultWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = [(WCXPCManager *)self delegate];
  [v5 handleUserInfoResultWithPairingID:v4];
}

- (void)handleActiveDeviceSwitchStarted
{
  id v2 = [(WCXPCManager *)self delegate];
  [v2 handleActiveDeviceSwitchStarted];
}

- (OS_dispatch_queue)workQueue
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

- (BOOL)connectionInvalidated
{
  return self->_connectionInvalidated;
}

- (void)setConnectionInvalidated:(BOOL)a3
{
  self->_connectionInvalidated = a3;
}

- (BOOL)reconnectFailed
{
  return self->_reconnectFailed;
}

- (unint64_t)reconnectRetryCount
{
  return self->_reconnectRetryCount;
}

- (void)setReconnectRetryCount:(unint64_t)a3
{
  self->_reconnectRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __33__WCXPCManager_onqueue_reconnect__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_222A02000, v1, v2, "%{public}s error reconnecting to daemon due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void __41__WCXPCManager_cancelSendWithIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_222A02000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void __44__WCXPCManager_cancelAllOutstandingMessages__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_222A02000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void __67__WCXPCManager_acknowledgeFileIndexWithIdentifier_clientPairingID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_222A02000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void __73__WCXPCManager_acknowledgeFileResultIndexWithIdentifier_clientPairingID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_222A02000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void __71__WCXPCManager_acknowledgeUserInfoIndexWithIdentifier_clientPairingID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_222A02000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

void __77__WCXPCManager_acknowledgeUserInfoResultIndexWithIdentifier_clientPairingID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x263EF8340]);
  v0 = NSPrintF();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_222A02000, v1, v2, "%{public}s remote object error due to %{public}@", v3, v4, v5, v6, v7, v8, 2u);
}

@end