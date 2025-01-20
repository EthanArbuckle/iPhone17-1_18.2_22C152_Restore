@interface CARThemeAssetLibraryObserverProxy
- (CARObserverHashTable)observers;
- (CARThemeAssetLibrary)assetLibrary;
- (CARThemeAssetLibraryObserverProxy)init;
- (void)service_attemptingDownloadForAssetVersion:(id)a3 reply:(id)a4;
- (void)service_completedDownloadForAsset:(id)a3 reply:(id)a4;
- (void)service_didUpdateFromAsset:(id)a3 toAsset:(id)a4 forVehicleIdentifier:(id)a5 reply:(id)a6;
- (void)service_failedDownloadForAssetVersion:(id)a3 error:(id)a4 reply:(id)a5;
- (void)setAssetLibrary:(id)a3;
@end

@implementation CARThemeAssetLibraryObserverProxy

- (CARThemeAssetLibraryObserverProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)CARThemeAssetLibraryObserverProxy;
  v2 = [(CARThemeAssetLibraryObserverProxy *)&v6 init];
  if (v2)
  {
    v3 = [[CARObserverHashTable alloc] initWithProtocol:&unk_1F0327360];
    observers = v2->_observers;
    v2->_observers = v3;
  }
  return v2;
}

- (void)service_attemptingDownloadForAssetVersion:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CARThemeAssetLibraryObserverProxy *)self assetLibrary];
  v9 = [v8 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__CARThemeAssetLibraryObserverProxy_service_attemptingDownloadForAssetVersion_reply___block_invoke;
  block[3] = &unk_1E5E3ACD8;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

uint64_t __85__CARThemeAssetLibraryObserverProxy_service_attemptingDownloadForAssetVersion_reply___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v16 = 138543362;
    uint64_t v17 = v3;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_INFO, "received attempting download for theme asset: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  v4 = [*(id *)(a1 + 32) identifier];
  v5 = [*(id *)(a1 + 40) assetLibrary];
  id v6 = [v5 assetIdentifier];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    v8 = [*(id *)(a1 + 40) observers];
    v9 = [*(id *)(a1 + 40) assetLibrary];
    [v8 themeAssetLibrary:v9 attemptingDownloadOfAssetWithVersion:*(void *)(a1 + 32)];

    id v10 = NSNumber;
    id v11 = [*(id *)(a1 + 32) iOSContentVersion];
    v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue"));

    id v13 = [*(id *)(a1 + 40) observers];
    v14 = [*(id *)(a1 + 40) assetLibrary];
    [v13 themeAssetLibrary:v14 attemptingDownloadForAssetVersion:v12];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)service_failedDownloadForAssetVersion:(id)a3 error:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CARThemeAssetLibraryObserverProxy *)self assetLibrary];
  v12 = [v11 queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__CARThemeAssetLibraryObserverProxy_service_failedDownloadForAssetVersion_error_reply___block_invoke;
  v16[3] = &unk_1E5E3AD00;
  id v17 = v8;
  id v18 = v9;
  v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

uint64_t __87__CARThemeAssetLibraryObserverProxy_service_failedDownloadForAssetVersion_error_reply___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v17 = 138543618;
    uint64_t v18 = v3;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_INFO, "received failed download for theme asset: %{public}@ error: %@", (uint8_t *)&v17, 0x16u);
  }

  v5 = [*(id *)(a1 + 32) identifier];
  id v6 = [*(id *)(a1 + 48) assetLibrary];
  int v7 = [v6 assetIdentifier];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 48) observers];
    id v10 = [*(id *)(a1 + 48) assetLibrary];
    [v9 themeAssetLibrary:v10 failedDownloadOfAssetWithVersion:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];

    id v11 = NSNumber;
    v12 = [*(id *)(a1 + 32) iOSContentVersion];
    id v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "integerValue"));

    id v14 = [*(id *)(a1 + 48) observers];
    id v15 = [*(id *)(a1 + 48) assetLibrary];
    [v14 themeAssetLibrary:v15 failedDownloadForAssetVersion:v13 error:*(void *)(a1 + 40)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)service_completedDownloadForAsset:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CARThemeAssetLibraryObserverProxy *)self assetLibrary];
  id v9 = [v8 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__CARThemeAssetLibraryObserverProxy_service_completedDownloadForAsset_reply___block_invoke;
  block[3] = &unk_1E5E3ACD8;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

uint64_t __77__CARThemeAssetLibraryObserverProxy_service_completedDownloadForAsset_reply___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_INFO, "received completed download for theme asset %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  v5 = [*(id *)(a1 + 40) assetLibrary];
  id v6 = [v5 assetIdentifier];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    int v8 = [*(id *)(a1 + 40) observers];
    id v9 = [*(id *)(a1 + 40) assetLibrary];
    [v8 themeAssetLibrary:v9 completedDownloadOfAsset:*(void *)(a1 + 32)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)service_didUpdateFromAsset:(id)a3 toAsset:(id)a4 forVehicleIdentifier:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CARThemeAssetLibraryObserverProxy *)self assetLibrary];
  id v15 = [v14 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__CARThemeAssetLibraryObserverProxy_service_didUpdateFromAsset_toAsset_forVehicleIdentifier_reply___block_invoke;
  block[3] = &unk_1E5E3AC88;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  v24 = self;
  id v25 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(v15, block);
}

uint64_t __99__CARThemeAssetLibraryObserverProxy_service_didUpdateFromAsset_toAsset_forVehicleIdentifier_reply___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = CarThemeAssetsLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v12 = 138412802;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_1ABB00000, v2, OS_LOG_TYPE_INFO, "received didUpdateFromAsset: %@ toAsset: %@ forVehicleID: %@", (uint8_t *)&v12, 0x20u);
  }

  id v6 = *(void **)(a1 + 48);
  int v7 = [*(id *)(a1 + 56) assetLibrary];
  int v8 = [v7 vehicleIdentifier];
  LODWORD(v6) = [v6 isEqual:v8];

  if (v6)
  {
    id v9 = [*(id *)(a1 + 56) observers];
    id v10 = [*(id *)(a1 + 56) assetLibrary];
    [v9 themeAssetLibrary:v10 didUpdateFromAsset:*(void *)(a1 + 32) toAsset:*(void *)(a1 + 40)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (CARThemeAssetLibrary)assetLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetLibrary);
  return (CARThemeAssetLibrary *)WeakRetained;
}

- (void)setAssetLibrary:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_assetLibrary);
}

@end