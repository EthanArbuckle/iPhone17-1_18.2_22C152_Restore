@interface LNConnectionListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (LNAppContext)appContext;
- (LNConnectionListener)initWithListener:(id)a3;
- (NSMutableSet)clientConnections;
- (NSXPCListener)xpcListener;
- (void)addClientConnection:(id)a3;
- (void)cleanUp:(void *)a1;
- (void)removeClientConnection:(id)a3;
@end

@implementation LNConnectionListener

void __59__LNConnectionListener_listener_shouldAcceptNewConnection___block_invoke_13(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 xpcConnection];
    int v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_23624D000, v4, OS_LOG_TYPE_INFO, "XPC connection has been invalidated: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[LNConnectionListener cleanUp:](WeakRetained, v3);
}

- (void)cleanUp:(void *)a1
{
  if (a1 && a2)
  {
    id v3 = a2;
    [a1 removeClientConnection:v3];
    v4 = [a1 appContext];
    v5 = [v3 xpcConnection];
    [v4 removeAllDeferredOutputsFor:v5];

    id v7 = [a1 appContext];
    int v6 = [v3 xpcConnection];

    [v7 removeContextForConnection:v6];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v7;
    _os_log_impl(&dword_23624D000, v8, OS_LOG_TYPE_INFO, "Resuming new XPC connection: %{public}@", buf, 0xCu);
  }

  v9 = [LNClientConnection alloc];
  v10 = [v7 _queue];
  v11 = [(LNConnectionListener *)self appContext];
  v12 = [(LNClientConnection *)v9 initWithConnection:v7 connectionListener:self queue:v10 appContext:v11];

  [(LNConnectionListener *)self addClientConnection:v12];
  objc_initWeak((id *)buf, v12);
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__LNConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
  v17[3] = &unk_264CA9358;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, (id *)buf);
  [v7 setInterruptionHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__LNConnectionListener_listener_shouldAcceptNewConnection___block_invoke_13;
  v14[3] = &unk_264CA9358;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, (id *)buf);
  [v7 setInvalidationHandler:v14];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (LNAppContext)appContext
{
  return self->_appContext;
}

- (void)addClientConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__LNConnectionListener_addClientConnection___block_invoke;
  aBlock[3] = &unk_264CA9330;
  aBlock[4] = self;
  v5 = (void (**)(void))_Block_copy(aBlock);
  id v6 = [(LNConnectionListener *)self clientConnections];
  [v6 addObject:v4];

  v5[2](v5);
}

- (NSMutableSet)clientConnections
{
  os_unfair_lock_assert_owner(&self->_lock);
  clientConnections = self->_clientConnections;

  return clientConnections;
}

void __44__LNConnectionListener_addClientConnection___block_invoke(uint64_t a1)
{
}

- (void)removeClientConnection:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__LNConnectionListener_removeClientConnection___block_invoke;
  aBlock[3] = &unk_264CA9330;
  aBlock[4] = self;
  v5 = (void (**)(void))_Block_copy(aBlock);
  id v6 = [(LNConnectionListener *)self clientConnections];
  [v6 removeObject:v4];

  v5[2](v5);
}

void __47__LNConnectionListener_removeClientConnection___block_invoke(uint64_t a1)
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_clientConnections, 0);
}

void __59__LNConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = [v3 xpcConnection];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_23624D000, v4, OS_LOG_TYPE_ERROR, "XPC connection has been interrupted: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[LNConnectionListener cleanUp:](WeakRetained, v3);
}

- (LNConnectionListener)initWithListener:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)LNConnectionListener;
  int v6 = [(LNConnectionListener *)&v15 init];
  if (v6)
  {
    id v7 = objc_alloc_init(LNAppContext);
    appContext = v6->_appContext;
    v6->_appContext = v7;

    uint64_t v9 = objc_opt_new();
    clientConnections = v6->_clientConnections;
    v6->_clientConnections = (NSMutableSet *)v9;

    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_xpcListener, a3);
    [(NSXPCListener *)v6->_xpcListener setDelegate:v6];
    [(NSXPCListener *)v6->_xpcListener resume];
    if (NSClassFromString(&cfstr_Uiview.isa))
    {
      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x2050000000;
      v11 = (void *)get_AppIntentsUIKitBridgeLoaderClass_softClass;
      uint64_t v20 = get_AppIntentsUIKitBridgeLoaderClass_softClass;
      if (!get_AppIntentsUIKitBridgeLoaderClass_softClass)
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __get_AppIntentsUIKitBridgeLoaderClass_block_invoke;
        v16[3] = &unk_264CA92D0;
        v16[4] = &v17;
        __get_AppIntentsUIKitBridgeLoaderClass_block_invoke((uint64_t)v16);
        v11 = (void *)v18[3];
      }
      id v12 = v11;
      _Block_object_dispose(&v17, 8);
      [v12 loadBridge];
    }
    v13 = v6;
  }

  return v6;
}

@end