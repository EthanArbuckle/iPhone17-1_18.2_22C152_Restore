@interface CRSAppHistoryService
- (BSServiceConnectionListener)listener;
- (CRCarPlayAppPolicyEvaluator)policyEvaluator;
- (CRSAppHistoryDataProviding)dataProvider;
- (CRSAppHistoryService)initWithDataProvider:(id)a3 applicationLibrary:(id)a4 policyEvaluator:(id)a5;
- (FBSALOToken)installToken;
- (FBSALOToken)replaceToken;
- (FBSALOToken)uninstallToken;
- (FBSApplicationLibrary)applicationLibrary;
- (NSArray)instrumentClusterURLs;
- (NSHashTable)connections;
- (OS_dispatch_queue)connectionQueue;
- (void)_appLibraryUpdated:(id)a3;
- (void)_connectionQueue_addConnection:(id)a3;
- (void)_connectionQueue_removeConnection:(id)a3;
- (void)_setupApplicationLibraryObservations;
- (void)fetchDockAppInCategory:(id)a3 completion:(id)a4;
- (void)fetchSessionEchoContextStatesWithCompletion:(id)a3;
- (void)fetchSessionUIContextStatesWithCompletion:(id)a3;
- (void)fetchUIContextStatesWithCompletion:(id)a3;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)serviceFetchInstrumentClusterURLs:(id)a3;
- (void)setAnalyticsValues:(id)a3 onEvent:(id)a4 completion:(id)a5;
- (void)setApplicationLibrary:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setInstallToken:(id)a3;
- (void)setInstrumentClusterURLs:(id)a3;
- (void)setListener:(id)a3;
- (void)setPolicyEvaluator:(id)a3;
- (void)setReplaceToken:(id)a3;
- (void)setUninstallToken:(id)a3;
@end

@implementation CRSAppHistoryService

- (CRSAppHistoryService)initWithDataProvider:(id)a3 applicationLibrary:(id)a4 policyEvaluator:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CRSAppHistoryService;
  v11 = [(CRSAppHistoryService *)&v27 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataProvider, v8);
    objc_storeStrong((id *)&v12->_applicationLibrary, a4);
    objc_storeStrong((id *)&v12->_policyEvaluator, a5);
    [(CRSAppHistoryService *)v12 _setupApplicationLibraryObservations];
    [(CRSAppHistoryService *)v12 _appLibraryUpdated:v12->_applicationLibrary];
    v13 = [MEMORY[0x263F29C50] serial];
    uint64_t v14 = BSDispatchQueueCreate();
    connectionQueue = v12->_connectionQueue;
    v12->_connectionQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    connections = v12->_connections;
    v12->_connections = (NSHashTable *)v16;

    v18 = (void *)MEMORY[0x263F2B9E0];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __80__CRSAppHistoryService_initWithDataProvider_applicationLibrary_policyEvaluator___block_invoke;
    v25[3] = &unk_264443130;
    v19 = v12;
    v26 = v19;
    uint64_t v20 = [v18 listenerWithConfigurator:v25];
    id v21 = v19[2];
    v19[2] = (id)v20;

    v22 = CRSLogForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = v19[2];
      *(_DWORD *)buf = 138412290;
      id v29 = v23;
      _os_log_impl(&dword_21D3CC000, v22, OS_LOG_TYPE_INFO, "Activating listener! %@", buf, 0xCu);
    }

    [v19[2] activate];
  }

  return v12;
}

void __80__CRSAppHistoryService_initWithDataProvider_applicationLibrary_policyEvaluator___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.CarPlay"];
  v3 = [MEMORY[0x263F30DF0] identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)setInstrumentClusterURLs:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSArray *)self->_instrumentClusterURLs isEqualToArray:v4])
  {
    v5 = CRSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "Cluster URLs updated: %@", buf, 0xCu);
    }

    v6 = (NSArray *)[v4 copy];
    instrumentClusterURLs = self->_instrumentClusterURLs;
    self->_instrumentClusterURLs = v6;

    id v8 = self->_instrumentClusterURLs;
    if (v8)
    {
      uint64_t v11 = *MEMORY[0x263F30DC8];
      v12 = v8;
      id v9 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    }
    else
    {
      id v9 = 0;
    }
    id v10 = [MEMORY[0x263F087C8] defaultCenter];
    [v10 postNotificationName:@"CRInstrumentClusterURLsDidChangeNotification" object:0 userInfo:v9];
  }
}

- (void)invalidate
{
  [(FBSApplicationLibrary *)self->_applicationLibrary removeObserverForToken:self->_installToken];
  [(FBSApplicationLibrary *)self->_applicationLibrary removeObserverForToken:self->_uninstallToken];
  [(FBSApplicationLibrary *)self->_applicationLibrary removeObserverForToken:self->_replaceToken];
  listener = self->_listener;
  [(BSServiceConnectionListener *)listener invalidate];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = CRSLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_21D3CC000, v7, OS_LOG_TYPE_INFO, "Received connection! %@", buf, 0xCu);
  }

  id v8 = [v6 remoteProcess];
  char v9 = [v8 hasEntitlement:@"com.apple.private.CarPlayServices.app-history"];

  if ((v9 & 1) == 0)
  {
    id v10 = CRSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CRSAppHistoryService listener:didReceiveConnection:withContext:](v6);
    }
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke;
  v16[3] = &unk_264443180;
  v16[4] = self;
  [v6 configureConnection:v16];
  uint64_t v11 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_21D3CC000, v11, OS_LOG_TYPE_INFO, "Activating connection... %@", buf, 0xCu);
  }

  v12 = [(CRSAppHistoryService *)self connectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke_87;
  block[3] = &unk_2644431A8;
  block[4] = self;
  id v15 = v6;
  id v13 = v6;
  dispatch_async(v12, block);
}

void __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F30DF0];
  id v4 = a2;
  v5 = [v3 serviceQuality];
  [v4 setServiceQuality:v5];

  id v6 = [MEMORY[0x263F30DF0] interface];
  [v4 setInterface:v6];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_264443158;
  v8[4] = *(void *)(a1 + 32);
  [v4 setInvalidationHandler:v8];
  v7 = [*(id *)(a1 + 32) connectionQueue];
  [v4 setTargetQueue:v7];
}

void __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_21D3CC000, v4, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __66__CRSAppHistoryService_listener_didReceiveConnection_withContext___block_invoke_87(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  return [v2 activate];
}

- (void)fetchUIContextStatesWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = CRSLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "Received request for UI context states.", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CRSAppHistoryService_fetchUIContextStatesWithCompletion___block_invoke;
  v7[3] = &unk_264443498;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __59__CRSAppHistoryService_fetchUIContextStatesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataProvider];
  [v2 getUIContextStatesWithCompletion:*(void *)(a1 + 40)];
}

- (void)fetchSessionUIContextStatesWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = CRSLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "Received request for session UI context states.", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__CRSAppHistoryService_fetchSessionUIContextStatesWithCompletion___block_invoke;
  v7[3] = &unk_264443498;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __66__CRSAppHistoryService_fetchSessionUIContextStatesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataProvider];
  [v2 getSessionUIContextStatesWithCompletion:*(void *)(a1 + 40)];
}

- (void)fetchSessionEchoContextStatesWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = CRSLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "Received request for session UI context states.", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__CRSAppHistoryService_fetchSessionEchoContextStatesWithCompletion___block_invoke;
  v7[3] = &unk_264443498;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __68__CRSAppHistoryService_fetchSessionEchoContextStatesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataProvider];
  [v2 getSessionEchoContextStatesWithCompletion:*(void *)(a1 + 40)];
}

- (void)setAnalyticsValues:(id)a3 onEvent:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = CRSLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    *(_DWORD *)buf = 138412290;
    id v21 = v12;
    _os_log_impl(&dword_21D3CC000, v11, OS_LOG_TYPE_DEFAULT, "Received analytics values for current session, with %@ item(s).", buf, 0xCu);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__CRSAppHistoryService_setAnalyticsValues_onEvent_completion___block_invoke;
  v16[3] = &unk_2644434C0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v16);
}

void __62__CRSAppHistoryService_setAnalyticsValues_onEvent_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataProvider];
  objc_msgSend(v2, "setAnalyticsValues:onEvent:completion:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "unsignedIntegerValue"), *(void *)(a1 + 56));
}

- (void)serviceFetchInstrumentClusterURLs:(id)a3
{
  id v4 = a3;
  int v5 = CRSLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "serviceFetchInstrumentClusterURLs: updating geo", buf, 2u);
  }

  id v6 = [(CRSAppHistoryService *)self policyEvaluator];
  char v7 = [v6 isGeoSupported];

  id v8 = [(CRSAppHistoryService *)self policyEvaluator];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__CRSAppHistoryService_serviceFetchInstrumentClusterURLs___block_invoke;
  v10[3] = &unk_264443510;
  char v12 = v7;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 updateGeoSupportedWithCompletion:v10];
}

void __58__CRSAppHistoryService_serviceFetchInstrumentClusterURLs___block_invoke(uint64_t a1, char a2)
{
  id v4 = CRSLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D3CC000, v4, OS_LOG_TYPE_DEFAULT, "Geo support updated, updating URLs", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CRSAppHistoryService_serviceFetchInstrumentClusterURLs___block_invoke_90;
  block[3] = &unk_2644434E8;
  char v8 = a2;
  char v9 = *(unsigned char *)(a1 + 48);
  int v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__CRSAppHistoryService_serviceFetchInstrumentClusterURLs___block_invoke_90(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(unsigned __int8 *)(a1 + 48) != *(unsigned __int8 *)(a1 + 49))
  {
    id v2 = CRSLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21D3CC000, v2, OS_LOG_TYPE_DEFAULT, "Geo support changed, updating urls", (uint8_t *)&v9, 2u);
    }

    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 applicationLibrary];
    [v3 _appLibraryUpdated:v4];
  }
  int v5 = CRSLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) instrumentClusterURLs];
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "serviceFetchInstrumentClusterURLs: URLs supported: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  char v8 = [*(id *)(a1 + 32) instrumentClusterURLs];
  (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
}

- (void)fetchDockAppInCategory:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = CRSLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_21D3CC000, v8, OS_LOG_TYPE_DEFAULT, "Received request for dock app in category %@.", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CRSAppHistoryService_fetchDockAppInCategory_completion___block_invoke;
  block[3] = &unk_264443538;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__CRSAppHistoryService_fetchDockAppInCategory_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataProvider];
  objc_msgSend(v2, "fetchDockAppInCategory:completion:", objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"), *(void *)(a1 + 48));
}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSAppHistoryService *)self connections];
  [v5 addObject:v4];
}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSAppHistoryService *)self connections];
  [v5 removeObject:v4];
}

- (void)_setupApplicationLibraryObservations
{
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke;
  v15[3] = &unk_264443560;
  objc_copyWeak(&v16, &location);
  id v3 = (void *)MEMORY[0x21D4BD310](v15);
  id v4 = [(CRSAppHistoryService *)self applicationLibrary];
  id v5 = [v4 observeDidAddApplicationsWithBlock:v3];
  installToken = self->_installToken;
  self->_installToken = v5;

  id v7 = [(CRSAppHistoryService *)self applicationLibrary];
  char v8 = [v7 observeDidRemoveApplicationsWithBlock:v3];
  uninstallToken = self->_uninstallToken;
  self->_uninstallToken = v8;

  id v10 = [(CRSAppHistoryService *)self applicationLibrary];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_3;
  v13[3] = &unk_264443588;
  objc_copyWeak(&v14, &location);
  uint64_t v11 = [v10 observeDidReplaceApplicationsWithBlock:v13];
  replaceToken = self->_replaceToken;
  self->_replaceToken = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_2;
  block[3] = &unk_264443420;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 applicationLibrary];
  [v1 _appLibraryUpdated:v2];
}

void __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_4;
  block[3] = &unk_264443420;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__CRSAppHistoryService__setupApplicationLibraryObservations__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 applicationLibrary];
  [v1 _appLibraryUpdated:v2];
}

- (void)_appLibraryUpdated:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = CRSLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "App library updated", buf, 2u);
  }

  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v7 = [v4 applicationInfoForBundleIdentifier:@"com.apple.Maps"];
    if (v7)
    {
      char v8 = [(CRSAppHistoryService *)self policyEvaluator];
      int v9 = [v8 isGeoSupported];

      if (v9)
      {
        id v25 = 0;
        id v10 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:@"com.apple.Maps" allowPlaceholder:0 error:&v25];
        id v11 = v25;
        id v12 = [v10 carPlayInstrumentClusterURLSchemes];
        id v13 = CRSLogForCategory(0);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          objc_super v27 = v12;
          _os_log_impl(&dword_21D3CC000, v13, OS_LOG_TYPE_DEFAULT, "Adding Maps URLs %{public}@", buf, 0xCu);
        }

        [v6 addObjectsFromArray:v12];
      }
    }
    id v14 = [v4 allInstalledApplications];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __43__CRSAppHistoryService__appLibraryUpdated___block_invoke;
    id v23 = &unk_2644435B0;
    id v15 = v6;
    id v24 = v15;
    [v14 enumerateObjectsUsingBlock:&v20];

    id v16 = CRSLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_msgSend(v15, "allObjects", v20, v21, v22, v23);
      *(_DWORD *)buf = 138543362;
      objc_super v27 = v17;
      _os_log_impl(&dword_21D3CC000, v16, OS_LOG_TYPE_DEFAULT, "Setting new cluster URLs: %{public}@", buf, 0xCu);
    }
    id v18 = [v15 allObjects];
    [(CRSAppHistoryService *)self setInstrumentClusterURLs:v18];
  }
  else
  {
    id v19 = CRSLogForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CRSAppHistoryService _appLibraryUpdated:](v19);
    }

    [(CRSAppHistoryService *)self setInstrumentClusterURLs:MEMORY[0x263EFFA68]];
  }
}

void __43__CRSAppHistoryService__appLibraryUpdated___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [v6 bundleIdentifier];
  char v8 = [v7 isEqualToString:@"com.apple.Maps"];

  if ((v8 & 1) == 0)
  {
    id v9 = objc_alloc(MEMORY[0x263F01878]);
    id v10 = [v6 bundleIdentifier];
    id v18 = 0;
    id v11 = (void *)[v9 initWithBundleIdentifier:v10 allowPlaceholder:0 error:&v18];
    id v12 = v18;

    if (v12)
    {
      id v13 = CRSLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __43__CRSAppHistoryService__appLibraryUpdated___block_invoke_cold_1(v6);
      }
    }
    else if ([v11 supportsCarPlayInstrumentClusterScene])
    {
      id v14 = CRSLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v6 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v15;
        _os_log_impl(&dword_21D3CC000, v14, OS_LOG_TYPE_DEFAULT, "Adding default URLs for %{public}@", buf, 0xCu);
      }
      id v16 = *(void **)(a1 + 32);
      v19[0] = @"maps:/car/instrumentcluster/instructioncard";
      v19[1] = @"maps:/car/instrumentcluster/map";
      v19[2] = @"maps:/car/instrumentcluster";
      id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
      [v16 addObjectsFromArray:v17];

      *a4 = 1;
    }
  }
}

- (CRSAppHistoryDataProviding)dataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
  return (CRSAppHistoryDataProviding *)WeakRetained;
}

- (void)setDataProvider:(id)a3
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

- (FBSApplicationLibrary)applicationLibrary
{
  return self->_applicationLibrary;
}

- (void)setApplicationLibrary:(id)a3
{
}

- (CRCarPlayAppPolicyEvaluator)policyEvaluator
{
  return self->_policyEvaluator;
}

- (void)setPolicyEvaluator:(id)a3
{
}

- (FBSALOToken)installToken
{
  return self->_installToken;
}

- (void)setInstallToken:(id)a3
{
}

- (FBSALOToken)uninstallToken
{
  return self->_uninstallToken;
}

- (void)setUninstallToken:(id)a3
{
}

- (FBSALOToken)replaceToken
{
  return self->_replaceToken;
}

- (void)setReplaceToken:(id)a3
{
}

- (NSArray)instrumentClusterURLs
{
  return self->_instrumentClusterURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentClusterURLs, 0);
  objc_storeStrong((id *)&self->_replaceToken, 0);
  objc_storeStrong((id *)&self->_uninstallToken, 0);
  objc_storeStrong((id *)&self->_installToken, 0);
  objc_storeStrong((id *)&self->_policyEvaluator, 0);
  objc_storeStrong((id *)&self->_applicationLibrary, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_dataProvider);
}

- (void)listener:(void *)a1 didReceiveConnection:withContext:.cold.1(void *a1)
{
  v1 = [a1 remoteProcess];
  OUTLINED_FUNCTION_0(&dword_21D3CC000, v2, v3, "Process does not have the required entitlement: %@", v4, v5, v6, v7, 2u);
}

- (void)_appLibraryUpdated:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D3CC000, log, OS_LOG_TYPE_ERROR, "Unable to update instrument cluster URLs, no application library available", v1, 2u);
}

void __43__CRSAppHistoryService__appLibraryUpdated___block_invoke_cold_1(void *a1)
{
  v1 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_0(&dword_21D3CC000, v2, v3, "Error fetching app record for %{public}@", v4, v5, v6, v7, 2u);
}

@end