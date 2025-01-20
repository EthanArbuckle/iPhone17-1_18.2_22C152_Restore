@interface AXUIClientConnection
+ (id)sharedClientConnection;
- (AXAccessQueue)connectionAccessQueue;
- (AXAccessQueue)registeredClientsAccessQueue;
- (AXUIClientConnection)init;
- (BOOL)isConnected;
- (BSServiceConnectionClient)serviceConnection;
- (NSHashTable)stateObservers;
- (NSMutableArray)serviceRequests;
- (NSMutableDictionary)registeredClients;
- (OS_dispatch_queue)serviceConnectionQueue;
- (OS_dispatch_queue)stateObserverQueue;
- (id)_clientWithIdentifier:(id)a3;
- (int64_t)connectionState;
- (void)_broadcastConnectedStateChange;
- (void)_initializeServiceConnection;
- (void)_processXPCReply:(id)a3 context:(id)a4;
- (void)cleanUp;
- (void)dealloc;
- (void)performLaunchAngelQueuedTasks;
- (void)performLaunchAngelTask:(id)a3;
- (void)registerClient:(id)a3 withIdentifier:(id)a4;
- (void)registerConnectionStateObserver:(id)a3;
- (void)sendBoardServiceMessage:(id)a3 callback:(id)a4;
- (void)setConnectionAccessQueue:(id)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setRegisteredClients:(id)a3;
- (void)setRegisteredClientsAccessQueue:(id)a3;
- (void)setServiceConnection:(id)a3;
- (void)setServiceConnectionQueue:(id)a3;
- (void)setServiceRequests:(id)a3;
- (void)setStateObserverQueue:(id)a3;
- (void)setStateObservers:(id)a3;
- (void)tearDownConnection;
- (void)unregisterClient:(id)a3 withIdentifier:(id)a4;
- (void)unregisterConnectionStateObserver:(id)a3;
@end

@implementation AXUIClientConnection

+ (id)sharedClientConnection
{
  if (sharedClientConnection__AXUIClientSharedConnectionOnceToken != -1) {
    dispatch_once(&sharedClientConnection__AXUIClientSharedConnectionOnceToken, &__block_literal_global);
  }
  v2 = (void *)sharedClientConnection__AXUIClientSharedConnection;

  return v2;
}

uint64_t __46__AXUIClientConnection_sharedClientConnection__block_invoke()
{
  sharedClientConnection__AXUIClientSharedConnection = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (AXUIClientConnection)init
{
  v14.receiver = self;
  v14.super_class = (Class)AXUIClientConnection;
  v2 = [(AXUIClientConnection *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    v4 = (void *)[objc_alloc(MEMORY[0x263F21380]) initWithParentClass:v3 description:@"ConnectionAccessQueue" appendUUIDToLabel:0];
    v5 = (void *)[objc_alloc(MEMORY[0x263F21380]) initWithParentClass:v3 description:@"RegisteredClientsAccessQueue" appendUUIDToLabel:0];
    v2->_serverConnectionLock._os_unfair_lock_opaque = 0;
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v7 = dispatch_queue_create("accessibilityUIServer.handler", v6);
    serviceConnectionQueue = v2->_serviceConnectionQueue;
    v2->_serviceConnectionQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = objc_opt_new();
    serviceRequests = v2->_serviceRequests;
    v2->_serviceRequests = (NSMutableArray *)v9;

    if (v4 && v5)
    {
      [(AXUIClientConnection *)v2 setConnectionAccessQueue:v4];
      [(AXUIClientConnection *)v2 setRegisteredClientsAccessQueue:v5];
      v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      [(AXUIClientConnection *)v2 setStateObservers:v11];

      dispatch_queue_t p_super = dispatch_queue_create("com.apple.AXUIClientConnection.stateObservers", 0);
      [(AXUIClientConnection *)v2 setStateObserverQueue:p_super];
    }
    else
    {
      dispatch_queue_t p_super = &v2->super;
      v2 = 0;
    }
  }
  return v2;
}

- (BOOL)isConnected
{
  return self->_connectionState == 2;
}

- (BSServiceConnectionClient)serviceConnection
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  dispatch_queue_t v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  AX_PERFORM_WITH_LOCK();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (BSServiceConnectionClient *)v2;
}

void __41__AXUIClientConnection_serviceConnection__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[8];
  if (!v3)
  {
    [v2 _initializeServiceConnection];
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 64);
  }
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v4, v3);
}

- (void)setServiceConnection:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AX_PERFORM_WITH_LOCK();
}

void __45__AXUIClientConnection_setServiceConnection___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v1 != *(void **)(v2 + 64))
  {
    id v4 = AXLogIPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 64);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21F6DC000, v4, OS_LOG_TYPE_INFO, "Invalidating old connection: %@", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 40) + 64) invalidate];
    v1 = *(void **)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
  }
  objc_storeStrong((id *)(v2 + 64), v1);
}

- (void)_initializeServiceConnection
{
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = AXLogIPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__AXUIClientConnection__initializeServiceConnection__block_invoke_cold_1(a1, v4);
  }

  uint64_t v5 = [MEMORY[0x263F2B9F0] userInitiated];
  [v3 setServiceQuality:v5];

  [v3 setInterface:*(void *)(a1 + 40)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 72)];
  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__AXUIClientConnection__initializeServiceConnection__block_invoke_283;
  v10[3] = &unk_26451FA80;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  [v3 setActivationHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__AXUIClientConnection__initializeServiceConnection__block_invoke_286;
  v8[3] = &unk_26451FA80;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__AXUIClientConnection__initializeServiceConnection__block_invoke_288;
  v6[3] = &unk_26451FA80;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_283(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [v4 connectionAccessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2;
  v7[3] = &unk_26451FA58;
  v7[4] = v4;
  id v6 = v3;
  id v8 = v6;
  id v9 = &v10;
  [v5 performSynchronousWritingBlock:v7];

  if (*((unsigned char *)v11 + 24)) {
    [v4 performLaunchAngelQueuedTasks];
  }

  _Block_object_dispose(&v10, 8);
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v3 = [*(id *)(a1 + 40) isEqual:*(void *)(v2 + 64)];
    id v4 = AXLogIPC();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        uint64_t v6 = *(void *)(a1 + 40);
        int v10 = 138412290;
        uint64_t v11 = v6;
        _os_log_impl(&dword_21F6DC000, v4, OS_LOG_TYPE_DEFAULT, "Connection activated to %@", (uint8_t *)&v10, 0xCu);
      }

      [*(id *)(a1 + 32) setConnectionState:2];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      if (v5)
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 64);
        int v10 = 138412546;
        uint64_t v11 = v7;
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        _os_log_impl(&dword_21F6DC000, v4, OS_LOG_TYPE_DEFAULT, "Got activation for connection we were not tracking, ignoring. Connection: %@, actively tracked connection: %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  id v9 = AXLogIPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_cold_1();
  }
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_286(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = [WeakRetained connectionAccessQueue];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_287;
  int v10 = &unk_26451F998;
  id v11 = WeakRetained;
  id v12 = v3;
  id v6 = v3;
  [v5 performSynchronousWritingBlock:&v7];

  objc_msgSend(v6, "activate", v7, v8, v9, v10, v11);
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_287(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (id *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if ([*(id *)(a1 + 40) isEqual:*(void *)(v2 + 64)])
    {
      [*v3 setConnectionState:0];
      id v4 = AXLogIPC();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v10 = 138412290;
        uint64_t v11 = v5;
        _os_log_impl(&dword_21F6DC000, v4, OS_LOG_TYPE_DEFAULT, "Connection interrupted to %@", (uint8_t *)&v10, 0xCu);
      }

      [*v3 _broadcastConnectedStateChange];
    }
    else
    {
      id v6 = AXLogIPC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 64);
        int v10 = 138412546;
        uint64_t v11 = v7;
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        _os_log_impl(&dword_21F6DC000, v6, OS_LOG_TYPE_DEFAULT, "Got interruption for connection we were not tracking, ignoring. Connection: %@, actively tracked connection: %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  id v9 = AXLogIPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_287_cold_1();
  }
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_288(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = AXLogIPC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __52__AXUIClientConnection__initializeServiceConnection__block_invoke_288_cold_1((uint64_t)v3, (uint64_t)WeakRetained, v5);
  }
  else
  {

    if (!WeakRetained) {
      goto LABEL_10;
    }
  }
  int v6 = [v3 isEqual:WeakRetained[8]];
  uint64_t v7 = AXLogIPC();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_21F6DC000, v7, OS_LOG_TYPE_DEFAULT, "Connection Invalidated to %@", (uint8_t *)&v10, 0xCu);
    }

    [WeakRetained tearDownConnection];
    [WeakRetained performLaunchAngelQueuedTasks];
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = WeakRetained[8];
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_21F6DC000, v7, OS_LOG_TYPE_DEFAULT, "Got invalidation for connection we were not tracking, ignoring. Connection: %@, actively tracked connection: %@", (uint8_t *)&v10, 0x16u);
    }
  }
LABEL_10:
}

- (void)dealloc
{
  [(BSServiceConnectionClient *)self->_serviceConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AXUIClientConnection;
  [(AXUIClientConnection *)&v3 dealloc];
}

- (void)performLaunchAngelTask:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v5 = [(AXUIClientConnection *)self connectionAccessQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__AXUIClientConnection_performLaunchAngelTask___block_invoke;
  v8[3] = &unk_26451FAD0;
  void v8[4] = self;
  int v10 = &v11;
  int v6 = (void (**)(void))v4;
  id v9 = v6;
  [v5 performSynchronousWritingBlock:v8];

  if (v12[5])
  {
    v6[2](v6);
    uint64_t v7 = AXLogIPC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AXUIClientConnection performLaunchAngelTask:]();
    }
  }
  _Block_object_dispose(&v11, 8);
}

void __47__AXUIClientConnection_performLaunchAngelTask___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = AXLogIPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_4(a1);
  }

  objc_super v3 = (id *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 32) connectionState];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v5 connectionState];
    id v7 = *v3;
    if (v6 == 2)
    {
      BOOL v8 = [v7 serviceConnection];
      uint64_t v9 = [v8 remoteTarget];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      __int16 v12 = AXLogIPC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_2();
      }
    }
    else
    {
      v19 = [v7 serviceRequests];
      uint64_t v21 = *(void *)(a1 + 40);
      v20 = (void *)(a1 + 40);
      v22 = (void *)MEMORY[0x223C51A40](v21);
      [v19 axSafelyAddObject:v22];

      __int16 v12 = AXLogIPC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_3(v20, v3, v12);
      }
    }
  }
  else
  {
    uint64_t v13 = [v5 serviceConnection];
    uint64_t v14 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
    v23[0] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    uint64_t v16 = [v13 remoteTargetWithLaunchingAssertionAttributes:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    [*(id *)(a1 + 32) setConnectionState:1];
    __int16 v12 = AXLogIPC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_1();
    }
  }
}

- (void)performLaunchAngelQueuedTasks
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21F6DC000, a2, OS_LOG_TYPE_DEBUG, "performLaunchAngelQueuedTasks: %@", (uint8_t *)&v3, 0xCu);
}

void __53__AXUIClientConnection_performLaunchAngelQueuedTasks__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serviceRequests];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) serviceRequests];
  [v6 removeAllObjects];
}

- (void)sendBoardServiceMessage:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setXpc_handler:", v6);

  BOOL v8 = [MEMORY[0x263F2B9B8] currentContext];
  uint64_t v9 = [v8 remoteProcess];
  [v11 setProcessHandle:v9];

  uint64_t v10 = [MEMORY[0x263F2B9B8] currentContext];
  [v11 setServiceConnection:v10];

  [(AXUIClientConnection *)self _processXPCReply:v7 context:v11];
}

- (void)tearDownConnection
{
  uint64_t v3 = AXLogAssertions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F6DC000, v3, OS_LOG_TYPE_DEFAULT, "ClientConnection teared down xpc connection", buf, 2u);
  }

  uint64_t v4 = [(AXUIClientConnection *)self connectionAccessQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__AXUIClientConnection_tearDownConnection__block_invoke;
  v5[3] = &unk_26451F9E8;
  v5[4] = self;
  [v4 performSynchronousWritingBlock:v5];
}

uint64_t __42__AXUIClientConnection_tearDownConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = AXLogIPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__AXUIClientConnection_tearDownConnection__block_invoke_cold_1(a1);
  }

  [*(id *)(a1 + 32) setServiceConnection:0];
  [*(id *)(a1 + 32) setConnectionState:0];
  return [*(id *)(a1 + 32) _broadcastConnectedStateChange];
}

- (void)_processXPCReply:(id)a3 context:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MEMORY[0x223C51BC0](v6);
  if (v8 != MEMORY[0x263EF8708])
  {
    if (v8 == MEMORY[0x263EF8720])
    {
      id v20 = (id)MEMORY[0x263EF86A8];
      if (v6 == (id)MEMORY[0x263EF86A8])
      {
        v23 = AXLogUI();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[AXUIClientConnection _processXPCReply:context:](v23, v31, v32, v33, v34, v35, v36, v37);
        }
      }
      else
      {
        BOOL v21 = v6 == (id)MEMORY[0x263EF86A0];
        v22 = AXLogUI();
        v23 = v22;
        if (v21)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            uint64_t v40 = *MEMORY[0x263F22208];
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v40;
            _os_log_impl(&dword_21F6DC000, v23, OS_LOG_TYPE_INFO, "Connection to %{public}@ was interrupted.", (uint8_t *)&buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          -[AXUIClientConnection _processXPCReply:context:](v6, v23);
        }
      }

      v41 = AXLogIPC();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[AXUIClientConnection _processXPCReply:context:](v6 == v20, (uint64_t)v6, v41);
      }

      objc_initWeak((id *)&buf, self);
      v42 = [(AXUIClientConnection *)self connectionAccessQueue];
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __49__AXUIClientConnection__processXPCReply_context___block_invoke_329;
      v51[3] = &unk_26451FB70;
      objc_copyWeak(&v52, (id *)&buf);
      [v42 performSynchronousWritingBlock:v51];

      objc_destroyWeak(&v52);
      objc_destroyWeak((id *)&buf);
    }
    else
    {
      if (v6) {
        uint64_t v9 = (void *)MEMORY[0x223C51B50](v6);
      }
      else {
        uint64_t v9 = 0;
      }
      v24 = AXLogUI();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[AXUIClientConnection _processXPCReply:context:].cold.4((uint64_t)v9, v24, v25, v26, v27, v28, v29, v30);
      }

      if (v9) {
        free(v9);
      }
    }
    goto LABEL_60;
  }
  id v10 = v6;
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __49__AXUIClientConnection__processXPCReply_context___block_invoke;
  v56[3] = &unk_26451FAF8;
  id v57 = v7;
  id v11 = v10;
  id v58 = v11;
  __int16 v12 = (void (**)(void, void))MEMORY[0x223C51A40](v56);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy_;
  v62 = __Block_byref_object_dispose_;
  id v63 = 0;
  string = xpc_dictionary_get_string(v11, (const char *)*MEMORY[0x263F22210]);
  if (!string || (uint64_t v14 = (void *)[[NSString alloc] initWithUTF8String:string]) == 0)
  {
    if (v11) {
      uint64_t v14 = (void *)MEMORY[0x223C51B50](v11);
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v38 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221B8], @"Couldn't find client identifier in incoming message: %s.", v14);
    v39 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v38;

    if (v14)
    {
      free(v14);
      uint64_t v14 = 0;
    }
    goto LABEL_57;
  }
  v15 = (void *)MEMORY[0x223C51890]();
  uint64_t v16 = [(AXUIClientConnection *)self _clientWithIdentifier:v14];
  if (v16)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v11, (const char *)*MEMORY[0x263F22220]);
    if (uint64)
    {
      v18 = [v16 delegate];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (objc_opt_respondsToSelector() & 1) != 0
        && ([v18 userInterfaceClient:v16 messageFromServerForWithIdentifierShouldBeProcessedAsynchronously:uint64] & 1) != 0)
      {
        int v19 = 1;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          uint64_t v44 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221B8], @"Delegate of client %@ cannot process any messages: %@", v16, v18);
          v45 = *(void **)(*((void *)&buf + 1) + 40);
          *(void *)(*((void *)&buf + 1) + 40) = v44;
LABEL_55:

          goto LABEL_56;
        }
        int v19 = 0;
      }
      if (xpc_dictionary_get_BOOL(v11, (const char *)*MEMORY[0x263F22228]))
      {
        v50 = 0;
      }
      else
      {
        uint64_t v46 = *((void *)&buf + 1);
        id v55 = *(id *)(*((void *)&buf + 1) + 40);
        v50 = [MEMORY[0x263F21408] dictionaryFromXPCMessage:v11 error:&v55];
        objc_storeStrong((id *)(v46 + 40), v55);
      }
      if (!*(void *)(*((void *)&buf + 1) + 40))
      {
        if (v19)
        {
          v47 = (id *)v54;
          v54[0] = MEMORY[0x263EF8330];
          v54[1] = 3221225472;
          v54[2] = __49__AXUIClientConnection__processXPCReply_context___block_invoke_2;
          v54[3] = &unk_26451FB20;
          v54[4] = v18;
          v54[5] = v16;
          v54[6] = v50;
          v54[8] = uint64;
        }
        else
        {
          v47 = (id *)v53;
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __49__AXUIClientConnection__processXPCReply_context___block_invoke_3;
          v53[3] = &unk_26451FB48;
          v53[4] = v18;
          v53[5] = v16;
          v53[6] = v50;
          v53[8] = &buf;
          v53[9] = uint64;
        }
        v47[7] = v12;
        v49 = (void (**)(void))MEMORY[0x223C51A40](v47);

        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v18 userInterfaceClient:v16 accessQueueForProcessingMessageWithIdentifier:uint64],
              (v48 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ![v18 userInterfaceClient:v16 messageWithIdentifierRequiresWritingBlock:uint64])
          {
            [v48 performAsynchronousReadingBlock:v49];
          }
          else
          {
            [v48 performAsynchronousWritingBlock:v49];
          }
        }
        else
        {
          v49[2]();
          v48 = 0;
        }
      }
      v45 = v50;
      goto LABEL_55;
    }
    uint64_t v43 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221B8], @"AXUIClientConnection: Got invalid value for message identifier in client connection event handler: 0.");
  }
  else
  {
    uint64_t v43 = objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", *MEMORY[0x263F221B8], @"Couldn't find client for identifier: %@.", v14);
  }
  v18 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v43;
LABEL_56:

LABEL_57:
  if (*(void *)(*((void *)&buf + 1) + 40)) {
    v12[2](v12, 0);
  }

  _Block_object_dispose(&buf, 8);
LABEL_60:
}

void __49__AXUIClientConnection__processXPCReply_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) connection];

  if (v6)
  {
    [MEMORY[0x263F221E8] sendReply:v11 withError:v5 andOriginalXPCMessage:*(void *)(a1 + 40) usingConnection:*(void *)(a1 + 32) customDataAddingBlock:0];
  }
  else
  {
    if (v11)
    {
      id v7 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    }
    else
    {
      uint64_t v8 = [NSDictionary dictionary];
      id v7 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    }
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "xpc_handler");

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "xpc_handler");
      id v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void *, id))v10)[2](v10, v7, v5);
    }
  }
}

uint64_t __49__AXUIClientConnection__processXPCReply_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) userInterfaceClient:*(void *)(a1 + 40) processMessageFromServerAsynchronously:*(void *)(a1 + 48) withIdentifier:*(void *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

void __49__AXUIClientConnection__processXPCReply_context___block_invoke_3(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [v2 userInterfaceClient:v3 processMessageFromServer:v4 withIdentifier:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  (*(void (**)(void))(a1[7] + 16))();
  uint64_t v8 = *(void *)(a1[8] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

void __49__AXUIClientConnection__processXPCReply_context___block_invoke_329(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnectionState:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _broadcastConnectedStateChange];
}

- (void)registerClient:(id)a3 withIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AXLogAssertions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_21F6DC000, v8, OS_LOG_TYPE_DEFAULT, "ClientConnection registered client %@", buf, 0xCu);
  }

  uint64_t v9 = [(AXUIClientConnection *)self registeredClientsAccessQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__AXUIClientConnection_registerClient_withIdentifier___block_invoke;
  v12[3] = &unk_26451FB98;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 performSynchronousWritingBlock:v12];
}

void __54__AXUIClientConnection_registerClient_withIdentifier___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) registeredClients];
  if (!v3)
  {
    id v3 = (id)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setRegisteredClients:");
  }
  uint64_t v2 = [MEMORY[0x263F08D40] valueWithNonretainedObject:*(void *)(a1 + 40)];
  [v3 setObject:v2 forKey:*(void *)(a1 + 48)];
}

- (void)unregisterClient:(id)a3 withIdentifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = AXLogAssertions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_21F6DC000, v6, OS_LOG_TYPE_DEFAULT, "ClientConnection unregistered client %@", buf, 0xCu);
  }

  id v7 = [(AXUIClientConnection *)self registeredClientsAccessQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__AXUIClientConnection_unregisterClient_withIdentifier___block_invoke;
  v9[3] = &unk_26451F998;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 performSynchronousWritingBlock:v9];
}

void __56__AXUIClientConnection_unregisterClient_withIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registeredClients];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
  if (![v2 count]) {
    [*(id *)(a1 + 32) setRegisteredClients:0];
  }
}

- (id)_clientWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = [(AXUIClientConnection *)self registeredClientsAccessQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__AXUIClientConnection__clientWithIdentifier___block_invoke;
  v9[3] = &unk_26451FBC0;
  v9[4] = self;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 performSynchronousWritingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__AXUIClientConnection__clientWithIdentifier___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) registeredClients];
  id v2 = [v6 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 nonretainedObjectValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_broadcastConnectedStateChange
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  id v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v3 = [(AXUIClientConnection *)self stateObserverQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__AXUIClientConnection__broadcastConnectedStateChange__block_invoke;
  block[3] = &unk_26451F9C0;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(v3, block);

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v14[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "clientConnection:didChangeConnectedState:", self, -[AXUIClientConnection isConnected](self, "isConnected", (void)v8));
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

void __54__AXUIClientConnection__broadcastConnectedStateChange__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) stateObservers];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)registerConnectionStateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(AXUIClientConnection *)self stateObserverQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__AXUIClientConnection_registerConnectionStateObserver___block_invoke;
  v7[3] = &unk_26451F998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __56__AXUIClientConnection_registerConnectionStateObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateObservers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)unregisterConnectionStateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(AXUIClientConnection *)self stateObserverQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__AXUIClientConnection_unregisterConnectionStateObserver___block_invoke;
  v7[3] = &unk_26451F998;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __58__AXUIClientConnection_unregisterConnectionStateObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateObservers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)cleanUp
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v3 = [(AXUIClientConnection *)self stateObserverQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__AXUIClientConnection_cleanUp__block_invoke;
  v6[3] = &unk_26451FA30;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = AXLogAssertions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *((unsigned __int8 *)v8 + 24);
    *(_DWORD *)long long buf = 67109120;
    int v12 = v5;
    _os_log_impl(&dword_21F6DC000, v4, OS_LOG_TYPE_DEFAULT, "ClientConnection cleanup, no clients: %d", buf, 8u);
  }

  if (*((unsigned char *)v8 + 24)) {
    [(AXUIClientConnection *)self tearDownConnection];
  }
  _Block_object_dispose(&v7, 8);
}

void __31__AXUIClientConnection_cleanUp__block_invoke(uint64_t a1)
{
  id v2 = AXLogIPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __31__AXUIClientConnection_cleanUp__block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 32) stateObservers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count] == 0;
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (AXAccessQueue)connectionAccessQueue
{
  return self->_connectionAccessQueue;
}

- (void)setConnectionAccessQueue:(id)a3
{
}

- (NSMutableDictionary)registeredClients
{
  return self->_registeredClients;
}

- (void)setRegisteredClients:(id)a3
{
}

- (AXAccessQueue)registeredClientsAccessQueue
{
  return self->_registeredClientsAccessQueue;
}

- (void)setRegisteredClientsAccessQueue:(id)a3
{
}

- (NSHashTable)stateObservers
{
  return self->_stateObservers;
}

- (void)setStateObservers:(id)a3
{
}

- (OS_dispatch_queue)stateObserverQueue
{
  return self->_stateObserverQueue;
}

- (void)setStateObserverQueue:(id)a3
{
}

- (OS_dispatch_queue)serviceConnectionQueue
{
  return self->_serviceConnectionQueue;
}

- (void)setServiceConnectionQueue:(id)a3
{
}

- (NSMutableArray)serviceRequests
{
  return self->_serviceRequests;
}

- (void)setServiceRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceRequests, 0);
  objc_storeStrong((id *)&self->_serviceConnectionQueue, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_stateObserverQueue, 0);
  objc_storeStrong((id *)&self->_stateObservers, 0);
  objc_storeStrong((id *)&self->_registeredClientsAccessQueue, 0);
  objc_storeStrong((id *)&self->_registeredClients, 0);

  objc_storeStrong((id *)&self->_connectionAccessQueue, 0);
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 64);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21F6DC000, a2, OS_LOG_TYPE_DEBUG, "Configure connection %@", (uint8_t *)&v3, 0xCu);
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  v0 = NSNumber;
  [*v1 connectionState];
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21F6DC000, v2, v3, "Connection Activated connectionState: %@\nconnection: %@\nself.connection: %@", v4, v5, v6, v7, v8);
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_2_287_cold_1()
{
  OUTLINED_FUNCTION_4();
  v0 = NSNumber;
  [*v1 connectionState];
  objc_msgSend((id)OUTLINED_FUNCTION_9(), "numberWithInteger:");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21F6DC000, v2, v3, "Connection Interrupted connectionState: %@\nconnection: %@\nself.connection: %@", v4, v5, v6, v7, v8);
}

void __52__AXUIClientConnection__initializeServiceConnection__block_invoke_288_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_21F6DC000, v4, OS_LOG_TYPE_DEBUG, "Connection Invalidated\nconnection: %@\nself.connection: %@", v5, 0x16u);
}

- (void)performLaunchAngelTask:.cold.1()
{
  v0 = (void *)MEMORY[0x223C51A40]();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21F6DC000, v1, v2, "Executed block: %@ on target: %@", v3, v4, v5, v6, v7);
}

void __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  [*v1 connectionState];
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_9(), "numberWithInteger:");
  [*v0 serviceConnection];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21F6DC000, v3, v4, "Requested remote target with assertion, connectionState: %@ connection: %@, target: %@", v5, v6, v7, v8, v9);
}

void __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  [*v1 connectionState];
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_9(), "numberWithInteger:");
  [*v0 serviceConnection];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21F6DC000, v3, v4, "Requested remote target, connectionState: %@ connection: %@, target: %@", v5, v6, v7, v8, v9);
}

void __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_3(void *a1, id *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x223C51A40](*a1);
  uint64_t v6 = [*a2 serviceRequests];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*a2, "connectionState"));
  uint64_t v8 = [*a2 serviceConnection];
  int v9 = 138413058;
  char v10 = v5;
  __int16 v11 = 2112;
  int v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v7;
  __int16 v15 = 2112;
  id v16 = v8;
  _os_log_debug_impl(&dword_21F6DC000, a3, OS_LOG_TYPE_DEBUG, "Added block: %@ to queue: %@, connectionState: %@ connection: %@", (uint8_t *)&v9, 0x2Au);
}

void __47__AXUIClientConnection_performLaunchAngelTask___block_invoke_cold_4(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "connectionState"));
  uint64_t v3 = [*(id *)(a1 + 32) serviceConnection];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_21F6DC000, v4, v5, "performLaunchAngelTask connectionState: %@ connection: %@", v6, v7, v8, v9, v10);
}

void __42__AXUIClientConnection_tearDownConnection__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "connectionState"));
  uint64_t v3 = [*(id *)(a1 + 32) serviceConnection];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_21F6DC000, v4, v5, "tearDownConnection, connectionState: %@ connection: %@", v6, v7, v8, v9, v10);
}

- (void)_processXPCReply:(os_log_t)log context:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  BOOL v5 = a2 == MEMORY[0x263EF86A0];
  _os_log_debug_impl(&dword_21F6DC000, log, OS_LOG_TYPE_DEBUG, "XPC Error Invalid: %d Interrupted: %d", (uint8_t *)v3, 0xEu);
}

- (void)_processXPCReply:(uint64_t)a3 context:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_processXPCReply:(void *)a1 context:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F22208];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2082;
  uint64_t v8 = string;
  _os_log_error_impl(&dword_21F6DC000, a2, OS_LOG_TYPE_ERROR, "Unexpected error connecting to %{public}@: %{public}s", (uint8_t *)&v5, 0x16u);
}

- (void)_processXPCReply:(uint64_t)a3 context:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __31__AXUIClientConnection_cleanUp__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) stateObservers];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_debug_impl(&dword_21F6DC000, a2, OS_LOG_TYPE_DEBUG, "cleanUp stateObservers: %@", (uint8_t *)&v4, 0xCu);
}

@end