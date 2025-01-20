@interface CARThemeAssetLibraryAgent
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CARThemeAssetLibraryAgent)init;
- (CARThemeAssetLibraryAgentDelegate)delegate;
- (NSMutableSet)connections;
- (void)_addConnection:(id)a3;
- (void)_performObserverAction:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)invalidate;
- (void)notifyAttemptingDownloadForAssetVersion:(id)a3;
- (void)notifyCompletedDownloadOfAsset:(id)a3;
- (void)notifyDidUpdateFromAsset:(id)a3 toAsset:(id)a4 forVehicleIdentifier:(id)a5;
- (void)notifyFailedDownloadForAssetVersion:(id)a3 error:(id)a4;
- (void)service_applyOverrideAsset:(id)a3 forVehicleIdentifier:(id)a4 reply:(id)a5;
- (void)service_currentAssetsForVehicleIdentifier:(id)a3 reply:(id)a4;
- (void)service_startObservingWithReply:(id)a3;
- (void)service_stopObservingWithReply:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CARThemeAssetLibraryAgent

- (CARThemeAssetLibraryAgent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CARThemeAssetLibraryAgent;
  v2 = [(CARThemeAssetLibraryAgent *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA80] set];
    [(CARThemeAssetLibraryAgent *)v2 setConnections:v3];
  }
  return v2;
}

- (void)invalidate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(CARThemeAssetLibraryAgent *)self connections];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(CARThemeAssetLibraryAgent *)self _removeConnection:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 valueForEntitlement:@"com.apple.private.carkit.themeAssetLibrary"];
  char v8 = [v7 BOOLValue];

  if (v8)
  {
    long long v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F03197A0];
    [v6 setExportedInterface:v9];
    [v6 setExportedObject:self];
    long long v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F031AA58];
    [v6 setRemoteObjectInterface:v10];
    objc_initWeak(&location, v6);
    objc_initWeak(&from, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __64__CARThemeAssetLibraryAgent_listener_shouldAcceptNewConnection___block_invoke;
    v17[3] = &unk_1E5E3A7D8;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    long long v11 = (void *)MEMORY[0x1AD1140A0](v17);
    [v6 setInterruptionHandler:v11];
    [v6 setInvalidationHandler:v11];
    v12 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v6 serviceName];
      v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "processIdentifier"));
      *(_DWORD *)buf = 138412802;
      id v23 = v6;
      __int16 v24 = 2112;
      v25 = v13;
      __int16 v26 = 2112;
      v27 = v14;
      _os_log_impl(&dword_1ABB00000, v12, OS_LOG_TYPE_DEFAULT, "receiving a service connection %@ to service %@ from %@", buf, 0x20u);
    }
    [v6 resume];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v9 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CARThemeAssetLibraryAgent listener:shouldAcceptNewConnection:](v6, v9);
    }
  }

  return v8;
}

void __64__CARThemeAssetLibraryAgent_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_DEFAULT, "theme asset library connection interrupted or invalidated; removing connection.",
      v7,
      2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = v4;
  if (v4 && WeakRetained)
  {
    id v6 = [v4 connections];
    objc_sync_enter(v6);
    [v5 _removeConnection:WeakRetained];
    objc_sync_exit(v6);
  }
}

- (void)service_currentAssetsForVehicleIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_INFO, "requesting current asset for vehicleID: %@", (uint8_t *)&v12, 0xCu);
  }

  long long v9 = [(CARThemeAssetLibraryAgent *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    long long v11 = [(CARThemeAssetLibraryAgent *)self delegate];
    [v11 libraryAgent:self requestsCurrentAssetsForVehicleIdentifier:v6 completion:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)service_applyOverrideAsset:(id)a3 forVehicleIdentifier:(id)a4 reply:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(void))a5;
  long long v11 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v15 = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1ABB00000, v11, OS_LOG_TYPE_INFO, "applying override asset: %@ for vehicleID: %@", (uint8_t *)&v15, 0x16u);
  }

  int v12 = [(CARThemeAssetLibraryAgent *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    uint64_t v14 = [(CARThemeAssetLibraryAgent *)self delegate];
    [v14 libraryAgent:self receivedOverrideAsset:v8 forVehicleIdentifier:v9];
  }
  v10[2](v10);
}

- (void)service_startObservingWithReply:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F29268], "currentConnection", a3);
  uint64_t v5 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "start observing theme library for connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(CARThemeAssetLibraryAgent *)self _addConnection:v4];
}

- (void)service_stopObservingWithReply:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F29268], "currentConnection", a3);
  uint64_t v5 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "stop observing theme library for connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(CARThemeAssetLibraryAgent *)self _removeConnection:v4];
}

- (void)notifyAttemptingDownloadForAssetVersion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "notifying theme asset observers of attempting download for asset: %{public}@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CARThemeAssetLibraryAgent_notifyAttemptingDownloadForAssetVersion___block_invoke;
  v7[3] = &unk_1E5E3A828;
  id v8 = v4;
  id v6 = v4;
  [(CARThemeAssetLibraryAgent *)self _performObserverAction:v7];
}

void __69__CARThemeAssetLibraryAgent_notifyAttemptingDownloadForAssetVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__CARThemeAssetLibraryAgent_notifyAttemptingDownloadForAssetVersion___block_invoke_2;
  v6[3] = &unk_1E5E3A800;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = v4;
  id v5 = v3;
  objc_msgSend(v5, "service_attemptingDownloadForAssetVersion:reply:", v4, v6);
}

void __69__CARThemeAssetLibraryAgent_notifyAttemptingDownloadForAssetVersion___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_INFO, "did notify theme asset observer %@ of attempting download for %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)notifyFailedDownloadForAssetVersion:(id)a3 error:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_INFO, "notifying theme asset observers of failed download for asset: %{public}@ error: %@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__CARThemeAssetLibraryAgent_notifyFailedDownloadForAssetVersion_error___block_invoke;
  v11[3] = &unk_1E5E3A878;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(CARThemeAssetLibraryAgent *)self _performObserverAction:v11];
}

void __71__CARThemeAssetLibraryAgent_notifyFailedDownloadForAssetVersion_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CARThemeAssetLibraryAgent_notifyFailedDownloadForAssetVersion_error___block_invoke_2;
  v7[3] = &unk_1E5E3A850;
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  objc_msgSend(v6, "service_failedDownloadForAssetVersion:error:reply:", v5, v4, v7);
}

void __71__CARThemeAssetLibraryAgent_notifyFailedDownloadForAssetVersion_error___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    int v6 = 138412802;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_INFO, "did notify theme asset observer %@ of failed download for asset: %{public}@ error: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)notifyCompletedDownloadOfAsset:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "notifying theme asset observers of completed download for asset: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CARThemeAssetLibraryAgent_notifyCompletedDownloadOfAsset___block_invoke;
  v7[3] = &unk_1E5E3A828;
  id v8 = v4;
  id v6 = v4;
  [(CARThemeAssetLibraryAgent *)self _performObserverAction:v7];
}

void __60__CARThemeAssetLibraryAgent_notifyCompletedDownloadOfAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CARThemeAssetLibraryAgent_notifyCompletedDownloadOfAsset___block_invoke_2;
  v6[3] = &unk_1E5E3A800;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = v4;
  id v5 = v3;
  objc_msgSend(v5, "service_completedDownloadForAsset:reply:", v4, v6);
}

void __60__CARThemeAssetLibraryAgent_notifyCompletedDownloadOfAsset___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_INFO, "did notify theme asset observer %@ of completed download for asset: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)notifyDidUpdateFromAsset:(id)a3 toAsset:(id)a4 forVehicleIdentifier:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    id v20 = v8;
    __int16 v21 = 2114;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_1ABB00000, v11, OS_LOG_TYPE_INFO, "notifiying theme asset observers of update from asset %{public}@ to asset: %{public}@ for vehicleID: %@", buf, 0x20u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__CARThemeAssetLibraryAgent_notifyDidUpdateFromAsset_toAsset_forVehicleIdentifier___block_invoke;
  v15[3] = &unk_1E5E3A8C8;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(CARThemeAssetLibraryAgent *)self _performObserverAction:v15];
}

void __83__CARThemeAssetLibraryAgent_notifyDidUpdateFromAsset_toAsset_forVehicleIdentifier___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__CARThemeAssetLibraryAgent_notifyDidUpdateFromAsset_toAsset_forVehicleIdentifier___block_invoke_2;
  v8[3] = &unk_1E5E3A8A0;
  id v9 = v3;
  uint64_t v6 = (void *)a1[4];
  id v10 = v6;
  id v11 = (id)a1[5];
  id v12 = (id)a1[6];
  id v7 = v3;
  objc_msgSend(v7, "service_didUpdateFromAsset:toAsset:forVehicleIdentifier:reply:", v6, v4, v5, v8);
}

void __83__CARThemeAssetLibraryAgent_notifyDidUpdateFromAsset_toAsset_forVehicleIdentifier___block_invoke_2(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    int v7 = 138413058;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_INFO, "did notify theme asset observer %@ of update from asset %{public}@ to asset %{public}@ for vehicleID: %@", (uint8_t *)&v7, 0x2Au);
  }
}

- (void)_addConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CARThemeAssetLibraryAgent *)self connections];
  objc_sync_enter(v5);
  uint64_t v6 = [v4 userInfo];

  if (!v6)
  {
    int v7 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "holding a theme library observing transaction for %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v8 = (void *)os_transaction_create();
    [v4 setUserInfo:v8];
  }
  __int16 v9 = [(CARThemeAssetLibraryAgent *)self connections];
  [v9 addObject:v4];

  objc_sync_exit(v5);
}

- (void)_removeConnection:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CARThemeAssetLibraryAgent *)self connections];
  objc_sync_enter(v5);
  uint64_t v6 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1ABB00000, v6, OS_LOG_TYPE_DEFAULT, "releasing a theme library observing transaction for %@", (uint8_t *)&v11, 0xCu);
  }

  [v4 setUserInfo:0];
  int v7 = [(CARThemeAssetLibraryAgent *)self connections];
  int v8 = [v7 containsObject:v4];

  if (v8)
  {
    __int16 v9 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1ABB00000, v9, OS_LOG_TYPE_DEFAULT, "Removing theme library connection %@", (uint8_t *)&v11, 0xCu);
    }

    int v10 = [(CARThemeAssetLibraryAgent *)self connections];
    [v10 removeObject:v4];
  }
  else
  {
    int v10 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1ABB00000, v10, OS_LOG_TYPE_DEFAULT, "Connection %@ was not observing theme library", (uint8_t *)&v11, 0xCu);
    }
  }

  objc_sync_exit(v5);
}

- (void)_performObserverAction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(CARThemeAssetLibraryAgent *)self connections];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) remoteObjectProxyWithErrorHandler:&__block_literal_global];
        if (v4) {
          v4[2](v4, v10);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

void __52__CARThemeAssetLibraryAgent__performObserverAction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __52__CARThemeAssetLibraryAgent__performObserverAction___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (CARThemeAssetLibraryAgentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CARThemeAssetLibraryAgentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = [a1 processIdentifier];
  __int16 v4 = 2112;
  uint64_t v5 = @"com.apple.private.carkit.themeAssetLibrary";
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "Process %i does not have the %@ entitlement", (uint8_t *)v3, 0x12u);
}

void __52__CARThemeAssetLibraryAgent__performObserverAction___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "failed to connect to theme library observer service %@", (uint8_t *)&v2, 0xCu);
}

@end