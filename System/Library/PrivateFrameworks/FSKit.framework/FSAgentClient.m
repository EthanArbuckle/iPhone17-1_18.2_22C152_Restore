@interface FSAgentClient
- (FSAgentClientDelegate)delegate;
- (NSXPCConnection)conn;
- (id)initToUser:(unsigned int)a3;
- (id)instanceDeathHandler;
- (id)interruptionHandler;
- (void)dealloc;
- (void)getNSXPCListenerEndpoint:(id)a3 instanceID:(id)a4 replyHandler:(id)a5;
- (void)handleInvalidated;
- (void)installedExtensions:(id)a3;
- (void)setConn:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabledState:(id)a3 newState:(BOOL)a4 replyHandler:(id)a5;
- (void)setInstanceDeathHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setupHandlers;
- (void)startExtension:(id)a3 instanceID:(id)a4 replyHandler:(id)a5;
- (void)stopExtension:(id)a3 instanceID:(id)a4 replyHandler:(id)a5;
@end

@implementation FSAgentClient

- (void)setupHandlers
{
  objc_initWeak(&location, self);
  conn = self->_conn;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__FSAgentClient_setupHandlers__block_invoke;
  v7[3] = &unk_26530B130;
  objc_copyWeak(&v8, &location);
  [(NSXPCConnection *)conn setInterruptionHandler:v7];
  v4 = self->_conn;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__FSAgentClient_setupHandlers__block_invoke_3;
  v5[3] = &unk_26530B130;
  objc_copyWeak(&v6, &location);
  [(NSXPCConnection *)v4 setInvalidationHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __30__FSAgentClient_setupHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__FSAgentClient_setupHandlers__block_invoke_2;
    block[3] = &unk_26530B5D8;
    block[4] = WeakRetained;
    dispatch_async(v2, block);
  }
}

uint64_t __30__FSAgentClient_setupHandlers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInvalidated];
}

void __30__FSAgentClient_setupHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__FSAgentClient_setupHandlers__block_invoke_4;
    block[3] = &unk_26530B5D8;
    block[4] = WeakRetained;
    dispatch_async(v2, block);
  }
}

uint64_t __30__FSAgentClient_setupHandlers__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInvalidated];
}

- (void)handleInvalidated
{
  v2 = self;
  objc_sync_enter(v2);
  v5 = _Block_copy(v2->_interruptionHandler);
  id interruptionHandler = v2->_interruptionHandler;
  v2->_id interruptionHandler = 0;

  objc_sync_exit(v2);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(void *))v5 + 2))(v5);
    v4 = v5;
  }
}

- (id)initToUser:(unsigned int)a3
{
  v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[FSAgentClient initToUser:](v4);
  }

  return 0;
}

- (void)dealloc
{
  conn = self->_conn;
  if (conn)
  {
    [(NSXPCConnection *)conn invalidate];
    v4 = self->_conn;
    self->_conn = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)FSAgentClient;
  [(FSAgentClient *)&v5 dealloc];
}

- (void)setInstanceDeathHandler:(id)a3
{
  id v6 = a3;
  v4 = _Block_copy(v6);
  id instanceDeathHandler = self->_instanceDeathHandler;
  self->_id instanceDeathHandler = v4;

  [(FSAgentClientDelegate *)self->_delegate setInstanceDeathHandler:v6];
}

- (void)installedExtensions:(id)a3
{
  id v4 = a3;
  conn = self->_conn;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__FSAgentClient_installedExtensions___block_invoke;
  v8[3] = &unk_26530B198;
  id v9 = v4;
  id v6 = v4;
  v7 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v8];
  [v7 installedExtensions:v6];
}

uint64_t __37__FSAgentClient_installedExtensions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startExtension:(id)a3 instanceID:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  conn = self->_conn;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__FSAgentClient_startExtension_instanceID_replyHandler___block_invoke;
  v14[3] = &unk_26530B198;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  v13 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v14];
  [v13 startExtension:v12 instanceID:v11 replyHandler:v10];
}

uint64_t __56__FSAgentClient_startExtension_instanceID_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getNSXPCListenerEndpoint:(id)a3 instanceID:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  conn = self->_conn;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__FSAgentClient_getNSXPCListenerEndpoint_instanceID_replyHandler___block_invoke;
  v14[3] = &unk_26530B198;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  v13 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v14];
  [v13 getNSXPCListenerEndpoint:v12 instanceID:v11 replyHandler:v10];
}

uint64_t __66__FSAgentClient_getNSXPCListenerEndpoint_instanceID_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopExtension:(id)a3 instanceID:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  conn = self->_conn;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__FSAgentClient_stopExtension_instanceID_replyHandler___block_invoke;
  v14[3] = &unk_26530B198;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  v13 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v14];
  [v13 stopExtension:v12 instanceID:v11 replyHandler:v10];
}

uint64_t __55__FSAgentClient_stopExtension_instanceID_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setEnabledState:(id)a3 newState:(BOOL)a4 replyHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  conn = self->_conn;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__FSAgentClient_setEnabledState_newState_replyHandler___block_invoke;
  v13[3] = &unk_26530B198;
  id v14 = v8;
  id v10 = v8;
  id v11 = a3;
  id v12 = [(NSXPCConnection *)conn remoteObjectProxyWithErrorHandler:v13];
  [v12 setEnabledState:v11 newState:v5 replyHandler:v10];
}

uint64_t __55__FSAgentClient_setEnabledState_newState_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)interruptionHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)instanceDeathHandler
{
  return self->_instanceDeathHandler;
}

- (NSXPCConnection)conn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConn:(id)a3
{
}

- (FSAgentClientDelegate)delegate
{
  return (FSAgentClientDelegate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong(&self->_instanceDeathHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
}

- (void)initToUser:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_24DDB2000, log, OS_LOG_TYPE_FAULT, "Initialization of FSAgentClient on iOS", v1, 2u);
}

@end