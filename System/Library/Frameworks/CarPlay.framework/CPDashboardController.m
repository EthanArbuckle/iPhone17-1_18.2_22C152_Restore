@interface CPDashboardController
+ (id)_dashboardClientInterface;
+ (id)_dashboardProvidingInterface;
- (CPDashboardProviding)dashboardProvider;
- (NSArray)shortcutButtons;
- (NSXPCConnection)connection;
- (id)_init;
- (void)_connectToListenerEndpoint:(id)a3;
- (void)_invalidate;
- (void)_sceneConnect:(id)a3;
- (void)handleActionForControlIdentifier:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDashboardProvider:(id)a3;
- (void)setShortcutButtons:(NSArray *)shortcutButtons;
@end

@implementation CPDashboardController

+ (id)_dashboardProvidingInterface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C97EA20];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_hostSetShortcutButtons_completion_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_dashboardClientInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C978430];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CPDashboardController;
  return [(CPDashboardController *)&v3 init];
}

- (void)setShortcutButtons:(NSArray *)shortcutButtons
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = shortcutButtons;
  v5 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "%@: Setting shortcut buttons: %@", (uint8_t *)&v9, 0x16u);
  }

  v6 = (NSArray *)[(NSArray *)v4 copy];
  v7 = self->_shortcutButtons;
  self->_shortcutButtons = v6;

  v8 = [(CPDashboardController *)self dashboardProvider];
  [v8 hostSetShortcutButtons:v4 completion:&__block_literal_global_16];
}

- (void)_sceneConnect:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 _FBSScene];
  if (CPCurrentProcessHasMapsEntitlement()
    && ([v5 settings],
        v6 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    v8 = [v5 settings];
    int v9 = [v8 templateEndpoint];

    v10 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [v4 _identifier];
      int v20 = 138543618;
      v21 = v11;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_2181A5000, v10, OS_LOG_TYPE_DEFAULT, "Connecting to dashboard listener endpoint for scene identifier: %{public}@ endpoint %@", (uint8_t *)&v20, 0x16u);
    }
    id v12 = objc_alloc_init(MEMORY[0x263F08D98]);
    [v12 _setEndpoint:v9];
    [(CPDashboardController *)self _connectToListenerEndpoint:v12];
  }
  else
  {
    int v9 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CPDashboardController _sceneConnect:](v9, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)_connectToListenerEndpoint:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v4];
  v6 = [(id)objc_opt_class() _dashboardProvidingInterface];
  [v5 setRemoteObjectInterface:v6];
  v7 = [(id)objc_opt_class() _dashboardClientInterface];
  [v5 setExportedInterface:v7];
  [v5 setExportedObject:self];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__CPDashboardController__connectToListenerEndpoint___block_invoke;
  v11[3] = &unk_264309E98;
  objc_copyWeak(&v12, &location);
  [v5 setInterruptionHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__CPDashboardController__connectToListenerEndpoint___block_invoke_57;
  v9[3] = &unk_264309E98;
  objc_copyWeak(&v10, &location);
  [v5 setInvalidationHandler:v9];
  [v5 resume];
  [(CPDashboardController *)self setConnection:v5];
  v8 = [v5 remoteObjectProxy];
  [(CPDashboardController *)self setDashboardProvider:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __52__CPDashboardController__connectToListenerEndpoint___block_invoke(uint64_t a1)
{
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __52__CPDashboardController__connectToListenerEndpoint___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __52__CPDashboardController__connectToListenerEndpoint___block_invoke_57(uint64_t a1)
{
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __52__CPDashboardController__connectToListenerEndpoint___block_invoke_57_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)_invalidate
{
  uint64_t v3 = [(CPDashboardController *)self connection];
  [v3 invalidate];

  [(CPDashboardController *)self setConnection:0];

  [(CPDashboardController *)self setDashboardProvider:0];
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__CPDashboardController_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __58__CPDashboardController_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__8;
  int v20 = __Block_byref_object_dispose__8;
  id v21 = 0;
  v2 = [*(id *)(a1 + 32) shortcutButtons];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __58__CPDashboardController_handleActionForControlIdentifier___block_invoke_58;
  uint64_t v13 = &unk_26430AEE0;
  id v14 = *(id *)(a1 + 40);
  uint64_t v15 = &v16;
  [v2 enumerateObjectsUsingBlock:&v10];

  if (v17[5])
  {
    uint64_t v3 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = v17[5];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = v5;
      __int16 v24 = 2112;
      uint64_t v25 = v4;
      __int16 v26 = 2112;
      uint64_t v27 = v6;
      _os_log_impl(&dword_2181A5000, v3, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    objc_msgSend((id)v17[5], "handlePrimaryAction", v10, v11, v12, v13);
  }
  else
  {
    id v7 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v8;
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_INFO, "%@: No button found for control identifier: %@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v16, 8);
}

void __58__CPDashboardController_handleActionForControlIdentifier___block_invoke_58(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 identifier];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (NSArray)shortcutButtons
{
  return self->_shortcutButtons;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (CPDashboardProviding)dashboardProvider
{
  return self->_dashboardProvider;
}

- (void)setDashboardProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashboardProvider, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_shortcutButtons, 0);
}

- (void)_sceneConnect:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__CPDashboardController__connectToListenerEndpoint___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __52__CPDashboardController__connectToListenerEndpoint___block_invoke_57_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end