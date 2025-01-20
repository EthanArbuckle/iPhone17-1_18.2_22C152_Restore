@interface CRSUIClusterThemeService
- (BSServiceConnectionListener)listener;
- (CRSUIClusterThemeDataProviding)themeDataProvider;
- (CRSUIClusterThemeService)init;
- (CRSUIClusterThemeServiceDelegate)delegate;
- (NSHashTable)connections;
- (OS_dispatch_queue)connectionQueue;
- (void)_connectionQueue_addConnection:(id)a3;
- (void)_connectionQueue_removeConnection:(id)a3;
- (void)getClusterThemeLayoutData:(id)a3;
- (void)getURLForAssetWithIdentifier:(id)a3 displayID:(id)a4 reply:(id)a5;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setConnectionQueue:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListener:(id)a3;
- (void)setThemeData:(id)a3 reply:(id)a4;
- (void)setThemeDataProvider:(id)a3;
- (void)updateExtraAssetsURL:(id)a3;
@end

@implementation CRSUIClusterThemeService

- (CRSUIClusterThemeService)init
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)CRSUIClusterThemeService;
  v2 = [(CRSUIClusterThemeService *)&v18 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = [MEMORY[0x263F29C50] serial];
    uint64_t v5 = BSDispatchQueueCreate();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    connections = v3->_connections;
    v3->_connections = (NSHashTable *)v7;

    v9 = (void *)MEMORY[0x263F3F6A0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __32__CRSUIClusterThemeService_init__block_invoke;
    v16[3] = &unk_2643076D0;
    v10 = v3;
    v17 = v10;
    uint64_t v11 = [v9 listenerWithConfigurator:v16];
    id v12 = v10[4];
    v10[4] = (id)v11;

    v13 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v10[4];
      *(_DWORD *)buf = 138412290;
      id v20 = v14;
      _os_log_impl(&dword_21817A000, v13, OS_LOG_TYPE_DEFAULT, "Activating listener! %@", buf, 0xCu);
    }

    [v10[4] activate];
  }
  return v3;
}

void __32__CRSUIClusterThemeService_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.CarPlay.ClusterTheme"];
  v3 = +[CRSUIClusterThemeSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CRSUIClusterThemeService *)self listener];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_21817A000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating listener! %@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = [(CRSUIClusterThemeService *)self listener];
  [v5 invalidate];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v9;
    _os_log_impl(&dword_21817A000, v11, OS_LOG_TYPE_DEFAULT, "Received connection! %@", buf, 0xCu);
  }

  id v12 = [v9 remoteProcess];
  if (v12
    && ([v9 remoteProcess],
        v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 hasEntitlement:@"com.apple.private.CarPlayUIServices.cluster-theme"],
        v13,
        v12,
        (v14 & 1) != 0))
  {
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke;
    v22[3] = &unk_264307720;
    v22[4] = self;
    objc_copyWeak(&v23, &location);
    [v9 configureConnection:v22];
    v15 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v9;
      _os_log_impl(&dword_21817A000, v15, OS_LOG_TYPE_DEFAULT, "Activating connection... %@", buf, 0xCu);
    }

    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_13;
    block[3] = &unk_264307748;
    objc_copyWeak(&v21, &location);
    id v17 = v9;
    id v20 = v17;
    dispatch_async(connectionQueue, block);
    [v17 activate];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_super v18 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CRSUIClusterThemeService listener:didReceiveConnection:withContext:](v9, v18);
    }

    [v9 invalidate];
  }
}

void __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CRSUIClusterThemeSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  uint64_t v5 = +[CRSUIClusterThemeSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_2643076F8;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  [v3 setInvalidationHandler:v8];
  id WeakRetained = objc_loadWeakRetained((id *)a1);
  uint64_t v7 = [WeakRetained connectionQueue];
  [v3 setTargetQueue:v7];

  objc_destroyWeak(&v9);
}

void __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionQueue_removeConnection:", v3);
}

void __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_connectionQueue_addConnection:", *(void *)(a1 + 32));
}

- (void)getClusterThemeLayoutData:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, _CRSUIClusterThemeLayoutData *, void *))a3;
  uint64_t v5 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [MEMORY[0x263F3F688] currentContext];
    *(_DWORD *)buf = 138412290;
    v24 = v6;
    _os_log_impl(&dword_21817A000, v5, OS_LOG_TYPE_DEFAULT, "Received request for cluster layouts (connection: %@)", buf, 0xCu);
  }
  uint64_t v7 = [(CRSUIClusterThemeService *)self themeDataProvider];

  if (v7)
  {
    id v8 = [(CRSUIClusterThemeService *)self themeDataProvider];
    id v9 = [v8 themeData];

    id v10 = [(CRSUIClusterThemeService *)self themeDataProvider];
    uint64_t v11 = [v10 clusterThemeDisplays];

    id v12 = [(CRSUIClusterThemeService *)self themeDataProvider];
    v13 = [v12 assetBaseURL];

    char v14 = [(CRSUIClusterThemeService *)self themeDataProvider];
    v15 = [v14 extraAssetsURL];

    v16 = objc_alloc_init(_CRSUIClusterThemeLayoutData);
    [(_CRSUIClusterThemeLayoutData *)v16 setThemeData:v9];
    [(_CRSUIClusterThemeLayoutData *)v16 setDisplays:v11];
    [(_CRSUIClusterThemeLayoutData *)v16 setAssetBaseURL:v13];
    [(_CRSUIClusterThemeLayoutData *)v16 setExtraAssetsURL:v15];
    id v17 = [(CRSUIClusterThemeService *)self themeDataProvider];
    -[_CRSUIClusterThemeLayoutData setAssetVersion:](v16, "setAssetVersion:", [v17 assetVersion]);

    objc_super v18 = 0;
  }
  else
  {
    v19 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CRSUIClusterThemeService getClusterThemeLayoutData:](v19);
    }

    id v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08320];
    v22 = @"Unable to retrieve cluster theme data";
    id v9 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    objc_super v18 = [v20 errorWithDomain:@"com.apple.CarPlayUIServices.cluster-theme-service" code:1 userInfo:v9];
    v16 = 0;
  }

  v4[2](v4, v16, v18);
}

- (void)getURLForAssetWithIdentifier:(id)a3 displayID:(id)a4 reply:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void *))a5;
  uint64_t v11 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [MEMORY[0x263F3F688] currentContext];
    *(_DWORD *)buf = 138412802;
    v22 = v12;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v8;
    _os_log_impl(&dword_21817A000, v11, OS_LOG_TYPE_DEFAULT, "Received request for asset url (connection: %@): %@:%@", buf, 0x20u);
  }
  v13 = [(CRSUIClusterThemeService *)self themeDataProvider];

  if (v13)
  {
    char v14 = [(CRSUIClusterThemeService *)self themeDataProvider];
    v15 = [v14 getURLForAssetWithIdentifier:v8 displayID:v9];
    v16 = 0;
  }
  else
  {
    id v17 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CRSUIClusterThemeService getURLForAssetWithIdentifier:displayID:reply:](v17);
    }

    objc_super v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    id v20 = @"Unable to retrieve asset url";
    char v14 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v16 = [v18 errorWithDomain:@"com.apple.CarPlayUIServices.cluster-theme-service" code:1 userInfo:v14];
    v15 = 0;
  }

  v10[2](v10, v15, v16);
}

- (void)setThemeData:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x263F3F688] currentContext];
    id v10 = [v6 themeData];
    *(_DWORD *)buf = 138412546;
    id v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    _os_log_impl(&dword_21817A000, v8, OS_LOG_TYPE_DEFAULT, "Received request to set theme data (connection: %@): %@", buf, 0x16u);
  }
  uint64_t v11 = [(CRSUIClusterThemeService *)self delegate];
  id v12 = [v6 themeData];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__CRSUIClusterThemeService_setThemeData_reply___block_invoke;
  v14[3] = &unk_264307770;
  id v15 = v7;
  id v13 = v7;
  [v11 clusterThemeService:self didSetThemeData:v12 completion:v14];
}

uint64_t __47__CRSUIClusterThemeService_setThemeData_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateExtraAssetsURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_21817A000, v5, OS_LOG_TYPE_DEFAULT, "service extraAssetsURL=%@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__CRSUIClusterThemeService_updateExtraAssetsURL___block_invoke;
  v8[3] = &unk_264307748;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __49__CRSUIClusterThemeService_updateExtraAssetsURL___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(WeakRetained, "connections", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) remoteTarget];
        [v8 updateExtraAssetsURL:*(void *)(a1 + 32)];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssert();
  id v5 = [(CRSUIClusterThemeService *)self connections];
  [v5 addObject:v4];
}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssert();
  id v5 = [(CRSUIClusterThemeService *)self connections];
  [v5 removeObject:v4];
}

- (CRSUIClusterThemeDataProviding)themeDataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_themeDataProvider);
  return (CRSUIClusterThemeDataProviding *)WeakRetained;
}

- (void)setThemeDataProvider:(id)a3
{
}

- (CRSUIClusterThemeServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRSUIClusterThemeServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (NSHashTable)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_themeDataProvider);
}

- (void)listener:(void *)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 remoteProcess];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_21817A000, a2, OS_LOG_TYPE_ERROR, "Process does not have the required entitlement: %@", (uint8_t *)&v4, 0xCu);
}

void __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21817A000, a2, OS_LOG_TYPE_ERROR, "Connection invalidated! %@", (uint8_t *)&v2, 0xCu);
}

- (void)getClusterThemeLayoutData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21817A000, log, OS_LOG_TYPE_ERROR, "No theme data provider set! Unable to complete request for cluster layouts", v1, 2u);
}

- (void)getURLForAssetWithIdentifier:(os_log_t)log displayID:reply:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21817A000, log, OS_LOG_TYPE_ERROR, "No theme data provider set! Unable to complete request for assert URL", v1, 2u);
}

@end