@interface LNExtensionConnectionHandler
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (LNAppContext)appContext;
- (LNExtensionConnectionHandler)init;
- (LNExtensionConnectionHandler)initWithPrincipalObject:(id)a3;
- (NSMutableSet)clientConnections;
- (id)principalObject;
- (void)addClientConnection:(id)a3;
- (void)removeClientConnection:(id)a3;
- (void)setAppContext:(id)a3;
- (void)setPrincipalObject:(id)a3;
@end

@implementation LNExtensionConnectionHandler

void __58__LNExtensionConnectionHandler_shouldAcceptXPCConnection___block_invoke_11(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 xpcConnection];
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_23624D000, v4, OS_LOG_TYPE_INFO, "XPC connection has been invalidated: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  v6 = [WeakRetained appContext];
  v7 = [v3 xpcConnection];
  [v6 removeAllDeferredOutputsFor:v7];

  if (v3) {
    [WeakRetained removeClientConnection:v3];
  }
}

- (LNAppContext)appContext
{
  appContext = self->_appContext;
  if (!appContext)
  {
    v4 = objc_alloc_init(LNAppContext);
    v5 = self->_appContext;
    self->_appContext = v4;

    appContext = self->_appContext;
  }

  return appContext;
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_23624D000, v5, OS_LOG_TYPE_INFO, "Resuming new XPC connection: %{public}@", buf, 0xCu);
  }

  v6 = [LNClientConnection alloc];
  v7 = +[LNAppConnectionListener sharedListener];
  int v8 = [v4 _queue];
  v9 = [(LNExtensionConnectionHandler *)self appContext];
  uint64_t v10 = [(LNClientConnection *)v6 initWithConnection:v4 connectionListener:v7 queue:v8 appContext:v9];

  [(LNExtensionConnectionHandler *)self addClientConnection:v10];
  objc_initWeak((id *)buf, v10);
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__LNExtensionConnectionHandler_shouldAcceptXPCConnection___block_invoke;
  v15[3] = &unk_264CA9358;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, (id *)buf);
  [v4 setInterruptionHandler:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__LNExtensionConnectionHandler_shouldAcceptXPCConnection___block_invoke_11;
  v12[3] = &unk_264CA9358;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, (id *)buf);
  [v4 setInvalidationHandler:v12];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)removeClientConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__LNExtensionConnectionHandler_removeClientConnection___block_invoke;
  aBlock[3] = &unk_264CA9330;
  aBlock[4] = self;
  v5 = (void (**)(void))_Block_copy(aBlock);
  v6 = [(LNExtensionConnectionHandler *)self clientConnections];
  [v6 removeObject:v4];

  v5[2](v5);
}

- (NSMutableSet)clientConnections
{
  os_unfair_lock_assert_owner(&self->_lock);
  clientConnections = self->_clientConnections;

  return clientConnections;
}

void __55__LNExtensionConnectionHandler_removeClientConnection___block_invoke(uint64_t a1)
{
}

- (void)addClientConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__LNExtensionConnectionHandler_addClientConnection___block_invoke;
  aBlock[3] = &unk_264CA9330;
  aBlock[4] = self;
  v5 = (void (**)(void))_Block_copy(aBlock);
  v6 = [(LNExtensionConnectionHandler *)self clientConnections];
  [v6 addObject:v4];

  v5[2](v5);
}

void __52__LNExtensionConnectionHandler_addClientConnection___block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_principalObject, 0);
  objc_storeStrong((id *)&self->_appContext, 0);

  objc_storeStrong((id *)&self->_clientConnections, 0);
}

- (void)setPrincipalObject:(id)a3
{
}

- (id)principalObject
{
  return self->_principalObject;
}

- (void)setAppContext:(id)a3
{
}

void __58__LNExtensionConnectionHandler_shouldAcceptXPCConnection___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = [v3 xpcConnection];
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_23624D000, v4, OS_LOG_TYPE_ERROR, "XPC connection has been interrupted: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  v6 = [WeakRetained appContext];
  v7 = [v3 xpcConnection];
  [v6 removeAllDeferredOutputsFor:v7];

  if (v3) {
    [WeakRetained removeClientConnection:v3];
  }
}

- (LNExtensionConnectionHandler)initWithPrincipalObject:(id)a3
{
  id v5 = a3;
  v6 = [(LNExtensionConnectionHandler *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_principalObject, a3);
    int v8 = v7;
  }

  return v7;
}

- (LNExtensionConnectionHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)LNExtensionConnectionHandler;
  v2 = [(LNExtensionConnectionHandler *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = (NSMutableSet *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    id v5 = v2;
  }

  return v2;
}

@end