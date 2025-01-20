@interface EDServer
+ (OS_os_log)log;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (EDDaemonInterfaceFactory)daemonInterfaceFactory;
- (EDServer)initWithDaemonInterfaceFactory:(id)a3;
- (EDServer)initWithDaemonInterfaceFactory:(id)a3 listener:(id)a4;
- (EFLocked)connectedClients;
- (NSArray)remoteClients;
- (NSXPCListener)listener;
- (NSXPCListenerEndpoint)serverXPCEndpoint;
- (id)messageReconciliationQueries;
- (id)threadReconciliationQueries;
- (void)addRemoteClient:(id)a3;
- (void)removeRemoteClient:(id)a3;
- (void)setDaemonInterfaceFactory:(id)a3;
- (void)setListener:(id)a3;
- (void)start;
- (void)test_tearDown;
@end

@implementation EDServer

uint64_t __28__EDServer_addRemoteClient___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = +[EDServer log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v5;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_INFO, "received a new connection request %@", buf, 0xCu);
  }

  v7 = [v5 valueForEntitlement:@"com.apple.private.email"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v7 = 0;
  }
  v8 = [v5 valueForEntitlement:@"com.apple.mobilemail.mailservices"];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v8 = 0;
  }
  if ([v7 BOOLValue] & 1) != 0 || (objc_msgSend(v8, "BOOLValue"))
  {
    v9 = (void *)MEMORY[0x1E0190280]();
    v10 = [EDRemoteClient alloc];
    v11 = [(EDServer *)self daemonInterfaceFactory];
    v12 = [(EDRemoteClient *)v10 initWithConnection:v5 daemonInterfaceFactory:v11 serverRemoteClientsProvider:self];

    v13 = +[EDRemoteClient exportedInterface];
    [v5 setExportedInterface:v13];

    [v5 setExportedObject:v12];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v12);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__EDServer_listener_shouldAcceptNewConnection___block_invoke;
    v23[3] = &unk_1E6BFF198;
    objc_copyWeak(&v24, (id *)buf);
    v23[4] = self;
    [v5 setInterruptionHandler:v23];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __47__EDServer_listener_shouldAcceptNewConnection___block_invoke_19;
    v20 = &unk_1E6BFF198;
    objc_copyWeak(&v22, (id *)buf);
    v21 = self;
    [v5 setInvalidationHandler:&v17];
    -[EDServer addRemoteClient:](self, "addRemoteClient:", v12, v17, v18, v19, v20);
    [v5 resume];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);

    BOOL v14 = 1;
  }
  else
  {
    v15 = +[EDServer log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[EDServer listener:shouldAcceptNewConnection:](v15);
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (EDDaemonInterfaceFactory)daemonInterfaceFactory
{
  return self->_daemonInterfaceFactory;
}

- (void)addRemoteClient:(id)a3
{
  id v4 = a3;
  id v5 = [(EDServer *)self connectedClients];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__EDServer_addRemoteClient___block_invoke;
  v7[3] = &unk_1E6C01D98;
  id v6 = v4;
  id v8 = v6;
  [v5 performWhileLocked:v7];
}

- (EFLocked)connectedClients
{
  return self->_connectedClients;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __15__EDServer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_89 != -1) {
    dispatch_once(&log_onceToken_89, block);
  }
  v2 = (void *)log_log_89;

  return (OS_os_log *)v2;
}

void __15__EDServer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_89;
  log_log_89 = (uint64_t)v1;
}

- (EDServer)initWithDaemonInterfaceFactory:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F29290]);
  id v6 = (void *)[v5 initWithMachServiceName:*MEMORY[0x1E4F5FCC0]];
  v7 = [(EDServer *)self initWithDaemonInterfaceFactory:v4 listener:v6];

  return v7;
}

- (EDServer)initWithDaemonInterfaceFactory:(id)a3 listener:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)EDServer;
  v9 = [(EDServer *)&v15 init];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = [v10 initWithObject:v11];
    connectedClients = v9->_connectedClients;
    v9->_connectedClients = (EFLocked *)v12;

    objc_storeStrong((id *)&v9->_daemonInterfaceFactory, a3);
    objc_storeStrong((id *)&v9->_listener, a4);
    [(NSXPCListener *)v9->_listener setDelegate:v9];
  }

  return v9;
}

- (void)test_tearDown
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EDServer.m", 51, @"%s can only be called from unit tests", "-[EDServer test_tearDown]");
  }
  id v4 = [(EDServer *)self connectedClients];
  id v5 = [v4 getObject];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9++), "test_tearDown");
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  id v10 = [(EDServer *)self daemonInterfaceFactory];
  objc_msgSend(v10, "test_tearDown");

  [(NSXPCListener *)self->_listener invalidate];
}

- (void)start
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = +[EDServer log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    listener = self->_listener;
    int v5 = 138412290;
    id v6 = listener;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "starting listener %@", (uint8_t *)&v5, 0xCu);
  }

  [(NSXPCListener *)self->_listener resume];
  notify_post((const char *)[(id)*MEMORY[0x1E4F5FCB8] UTF8String]);
}

void __47__EDServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[EDServer log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Remote Client Interrupted %@", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) removeRemoteClient:WeakRetained];
}

void __47__EDServer_listener_shouldAcceptNewConnection___block_invoke_19(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[EDServer log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Remote Client Invalidated %@", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) removeRemoteClient:WeakRetained];
}

- (void)removeRemoteClient:(id)a3
{
  id v4 = a3;
  id v5 = [(EDServer *)self connectedClients];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__EDServer_removeRemoteClient___block_invoke;
  v7[3] = &unk_1E6C01D98;
  id v6 = v4;
  id v8 = v6;
  [v5 performWhileLocked:v7];
}

uint64_t __31__EDServer_removeRemoteClient___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (NSXPCListenerEndpoint)serverXPCEndpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (id)messageReconciliationQueries
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__37;
  id v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  v2 = [(EDServer *)self connectedClients];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__EDServer_messageReconciliationQueries__block_invoke;
  v5[3] = &unk_1E6C04EC0;
  v5[4] = &v6;
  [v2 performWhileLocked:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__EDServer_messageReconciliationQueries__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_78);
  uint64_t v4 = objc_msgSend(v3, "ef_flatten");

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)threadReconciliationQueries
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__37;
  id v10 = __Block_byref_object_dispose__37;
  id v11 = 0;
  v2 = [(EDServer *)self connectedClients];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__EDServer_threadReconciliationQueries__block_invoke;
  v5[3] = &unk_1E6C04EC0;
  v5[4] = &v6;
  [v2 performWhileLocked:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__EDServer_threadReconciliationQueries__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_115);
  uint64_t v4 = objc_msgSend(v3, "ef_flatten");

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (NSArray)remoteClients
{
  v2 = [(EDServer *)self connectedClients];
  id v3 = [v2 getObject];

  return (NSArray *)v3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void)setDaemonInterfaceFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonInterfaceFactory, 0);
  objc_storeStrong((id *)&self->_connectedClients, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "connection rejected because of missing entitlement", v1, 2u);
}

@end