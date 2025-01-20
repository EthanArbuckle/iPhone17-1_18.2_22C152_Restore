@interface DDSInterface
+ (id)interface;
+ (unint64_t)xpcConnectionOptionsForServer;
- (DDSInterface)initWithXPCServiceName:(id)a3;
- (DDSInterface)sharedInstance;
- (DDSManaging)serverOverride;
- (DDSManagingDelegate)delegate;
- (NSString)xpcServiceName;
- (NSXPCConnection)remoteServer;
- (OS_dispatch_queue)connectionUsageQueue;
- (id)server;
- (id)serviceObjectProxy;
- (id)syncServer;
- (id)syncServiceObjectProxy;
- (void)_teardownXPCConnection;
- (void)addAssertionForQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6;
- (void)assertionIDsForClientID:(id)a3 reply:(id)a4;
- (void)createConnectionIfNecessary;
- (void)dealloc;
- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4;
- (void)removeAssertionWithID:(id)a3;
- (void)server;
- (void)setDelegate:(id)a3;
- (void)setRemoteServer:(id)a3;
- (void)setServerOverride:(id)a3;
- (void)syncServer;
- (void)teardownXPCConnection;
- (void)triggerDump;
- (void)triggerUpdate;
- (void)updateAssetForQuery:(id)a3 callback:(id)a4;
@end

@implementation DDSInterface

- (NSString)xpcServiceName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (DDSInterface)initWithXPCServiceName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DDSInterface;
  v5 = [(DDSInterface *)&v11 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.DataDeliveryServices.ddsinterface.queue", 0);
    connectionUsageQueue = v5->_connectionUsageQueue;
    v5->_connectionUsageQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [v4 copy];
    xpcServiceName = v5->_xpcServiceName;
    v5->_xpcServiceName = (NSString *)v8;
  }
  return v5;
}

- (void)addAssertionForQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(DDSInterface *)self connectionUsageQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__DDSInterface_addAssertionForQuery_policy_assertionID_clientID___block_invoke;
  block[3] = &unk_1E6E3A418;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_sync(v14, block);
}

void __65__DDSInterface_addAssertionForQuery_policy_assertionID_clientID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 addAssertionForQuery:*(void *)(a1 + 40) policy:*(void *)(a1 + 48) assertionID:*(void *)(a1 + 56) clientID:*(void *)(a1 + 64)];
}

- (void)removeAssertionWithID:(id)a3
{
  id v4 = a3;
  v5 = [(DDSInterface *)self connectionUsageQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__DDSInterface_removeAssertionWithID___block_invoke;
  v7[3] = &unk_1E6E39F58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __38__DDSInterface_removeAssertionWithID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 removeAssertionWithID:*(void *)(a1 + 40)];
}

- (void)assertionIDsForClientID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DDSInterface *)self connectionUsageQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__DDSInterface_assertionIDsForClientID_reply___block_invoke;
  block[3] = &unk_1E6E39F30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __46__DDSInterface_assertionIDsForClientID_reply___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) syncServer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__DDSInterface_assertionIDsForClientID_reply___block_invoke_2;
  v4[3] = &unk_1E6E3A440;
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 assertionIDsForClientID:v3 reply:v4];
}

uint64_t __46__DDSInterface_assertionIDsForClientID_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DDSInterface *)self connectionUsageQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__DDSInterface_fetchAssetUpdateStatusForQuery_callback___block_invoke;
  block[3] = &unk_1E6E39F30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __56__DDSInterface_fetchAssetUpdateStatusForQuery_callback___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 fetchAssetUpdateStatusForQuery:*(void *)(a1 + 40) callback:*(void *)(a1 + 48)];
}

- (void)updateAssetForQuery:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DDSInterface *)self connectionUsageQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__DDSInterface_updateAssetForQuery_callback___block_invoke;
  block[3] = &unk_1E6E39F30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __45__DDSInterface_updateAssetForQuery_callback___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) server];
  [v2 updateAssetForQuery:*(void *)(a1 + 40) callback:*(void *)(a1 + 48)];
}

- (void)triggerDump
{
  uint64_t v3 = [(DDSInterface *)self connectionUsageQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__DDSInterface_triggerDump__block_invoke;
  block[3] = &unk_1E6E39DE0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __27__DDSInterface_triggerDump__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) server];
  [v1 triggerDump];
}

- (void)triggerUpdate
{
  uint64_t v3 = [(DDSInterface *)self connectionUsageQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__DDSInterface_triggerUpdate__block_invoke;
  block[3] = &unk_1E6E39DE0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __29__DDSInterface_triggerUpdate__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) server];
  [v1 triggerUpdate];
}

- (void)createConnectionIfNecessary
{
  uint64_t v3 = [(DDSInterface *)self connectionUsageQueue];
  dispatch_assert_queue_V2(v3);

  if (!self->_remoteServer)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    id v5 = [(DDSInterface *)self xpcServiceName];
    id v6 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", v5, objc_msgSend((id)objc_opt_class(), "xpcConnectionOptionsForServer"));
    remoteServer = self->_remoteServer;
    self->_remoteServer = v6;

    [(NSXPCConnection *)self->_remoteServer setExportedObject:self];
    id v8 = [(id)objc_opt_class() interface];
    [(NSXPCConnection *)self->_remoteServer setExportedInterface:v8];

    id v9 = +[DDSServer interface];
    [(NSXPCConnection *)self->_remoteServer setRemoteObjectInterface:v9];

    objc_initWeak(&location, self);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __43__DDSInterface_createConnectionIfNecessary__block_invoke;
    id v13 = &unk_1E6E3A468;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)self->_remoteServer setInvalidationHandler:&v10];
    -[NSXPCConnection setInterruptionHandler:](self->_remoteServer, "setInterruptionHandler:", &__block_literal_global_2, v10, v11, v12, v13);
    [(NSXPCConnection *)self->_remoteServer resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __43__DDSInterface_createConnectionIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = DefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1E41D6000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection to server invalidated.", v3, 2u);
    }

    [WeakRetained teardownXPCConnection];
  }
}

void __43__DDSInterface_createConnectionIfNecessary__block_invoke_5()
{
  v0 = DefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_DEFAULT, "XPC connection to server interrupted.", v1, 2u);
  }
}

+ (unint64_t)xpcConnectionOptionsForServer
{
  id v2 = DefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E41D6000, v2, OS_LOG_TYPE_DEFAULT, "Using NSXPCConnectionPrivileged for iOS connection", v4, 2u);
  }

  return 4096;
}

- (void)teardownXPCConnection
{
  uint64_t v3 = [(DDSInterface *)self connectionUsageQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__DDSInterface_teardownXPCConnection__block_invoke;
  block[3] = &unk_1E6E39DE0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __37__DDSInterface_teardownXPCConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _teardownXPCConnection];
}

- (void)_teardownXPCConnection
{
  [(NSXPCConnection *)self->_remoteServer setInvalidationHandler:0];
  [(NSXPCConnection *)self->_remoteServer setInterruptionHandler:0];
  [(NSXPCConnection *)self->_remoteServer invalidate];
  remoteServer = self->_remoteServer;
  self->_remoteServer = 0;
}

- (id)serviceObjectProxy
{
  uint64_t v3 = [(DDSInterface *)self connectionUsageQueue];
  dispatch_assert_queue_V2(v3);

  [(DDSInterface *)self createConnectionIfNecessary];
  remoteServer = self->_remoteServer;
  return [(NSXPCConnection *)remoteServer remoteObjectProxyWithErrorHandler:&__block_literal_global_8];
}

void __34__DDSInterface_serviceObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = DefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __34__DDSInterface_serviceObjectProxy__block_invoke_cold_1();
  }
}

- (id)syncServiceObjectProxy
{
  uint64_t v3 = [(DDSInterface *)self connectionUsageQueue];
  dispatch_assert_queue_V2(v3);

  [(DDSInterface *)self createConnectionIfNecessary];
  remoteServer = self->_remoteServer;
  return [(NSXPCConnection *)remoteServer synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_10];
}

void __38__DDSInterface_syncServiceObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = DefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__DDSInterface_syncServiceObjectProxy__block_invoke_cold_1();
  }
}

- (id)server
{
  uint64_t v3 = [(DDSInterface *)self connectionUsageQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(DDSInterface *)self serverOverride];

  if (v4)
  {
    id v5 = DefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Using test local server", v9, 2u);
    }

    id v6 = [(DDSInterface *)self serverOverride];
  }
  else
  {
    id v6 = [(DDSInterface *)self serviceObjectProxy];
    id v7 = DefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DDSInterface server]();
    }
  }
  return v6;
}

- (id)syncServer
{
  uint64_t v3 = [(DDSInterface *)self connectionUsageQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(DDSInterface *)self serverOverride];

  if (v4)
  {
    id v5 = DefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Using test local server", v9, 2u);
    }

    id v6 = [(DDSInterface *)self serverOverride];
  }
  else
  {
    id v6 = [(DDSInterface *)self syncServiceObjectProxy];
    id v7 = DefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DDSInterface syncServer]();
    }
  }
  return v6;
}

+ (id)interface
{
  if (interface_onceToken_0 != -1) {
    dispatch_once(&interface_onceToken_0, &__block_literal_global_12);
  }
  id v2 = (void *)interface_xpcInterface;
  return v2;
}

uint64_t __25__DDSInterface_interface__block_invoke()
{
  interface_xpcInterface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3FB37C8];
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  [(DDSInterface *)self _teardownXPCConnection];
  v3.receiver = self;
  v3.super_class = (Class)DDSInterface;
  [(DDSInterface *)&v3 dealloc];
}

- (DDSManagingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDSManagingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DDSManaging)serverOverride
{
  return self->_serverOverride;
}

- (void)setServerOverride:(id)a3
{
}

- (NSXPCConnection)remoteServer
{
  return self->_remoteServer;
}

- (void)setRemoteServer:(id)a3
{
}

- (DDSInterface)sharedInstance
{
  return self->_sharedInstance;
}

- (OS_dispatch_queue)connectionUsageQueue
{
  return self->_connectionUsageQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionUsageQueue, 0);
  objc_storeStrong((id *)&self->_sharedInstance, 0);
  objc_storeStrong((id *)&self->_remoteServer, 0);
  objc_storeStrong((id *)&self->_serverOverride, 0);
  objc_storeStrong((id *)&self->_xpcServiceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __34__DDSInterface_serviceObjectProxy__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_ERROR, "Error creating proxy (%{public}@)", v1, 0xCu);
}

void __38__DDSInterface_syncServiceObjectProxy__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_ERROR, "Error creating sync proxy (%{public}@)", v1, 0xCu);
}

- (void)server
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_DEBUG, "Interface is using remote server: (%{public}@)", v1, 0xCu);
}

- (void)syncServer
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_DEBUG, "Interface is using sync remote server: (%{public}@)", v1, 0xCu);
}

@end