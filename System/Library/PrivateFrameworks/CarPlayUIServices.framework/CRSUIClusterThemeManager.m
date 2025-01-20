@interface CRSUIClusterThemeManager
- (BOOL)isReady;
- (BSServiceConnection)connection;
- (CRSUIClusterThemeManager)init;
- (CRSUIClusterThemeManagerDelegate)delegate;
- (CRSUIWallpaperDataProvidingDelegate)dataProviderDelegate;
- (NSArray)displays;
- (NSDictionary)themeData;
- (NSSecurityScopedURLWrapper)assetBaseURL;
- (NSSecurityScopedURLWrapper)extraAssetsURL;
- (NSUUID)identifier;
- (OS_dispatch_queue)connectionQueue;
- (id)defaultWallpapers;
- (id)displayID;
- (id)dynamicAppearanceWallpapersForVehicle:(id)a3;
- (id)loadWallpaperFromData:(id)a3;
- (id)resolveWallpaper:(id)a3;
- (id)wallpapers;
- (unint64_t)assetVersion;
- (unint64_t)version;
- (void)_getURLForAssetWithIdentifier:(id)a3 displayID:(id)a4 completion:(id)a5;
- (void)_handleConnectionActivated;
- (void)_processThemeLayoutData:(id)a3 error:(id)a4;
- (void)_setThemeData:(id)a3 completion:(id)a4;
- (void)getURLForAssetWithIdentifier:(id)a3 displayID:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)setAssetBaseURL:(id)a3;
- (void)setAssetVersion:(unint64_t)a3;
- (void)setConnection:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setDataProviderDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplays:(id)a3;
- (void)setExtraAssetsURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setThemeData:(id)a3;
- (void)setThemeData:(id)a3 completion:(id)a4;
- (void)updateExtraAssetsURL:(id)a3;
@end

@implementation CRSUIClusterThemeManager

- (CRSUIClusterThemeManager)init
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)CRSUIClusterThemeManager;
  v2 = [(CRSUIClusterThemeManager *)&v23 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263F08C38] UUID];
    identifier = v3->_identifier;
    v3->_identifier = (NSUUID *)v4;

    v6 = [MEMORY[0x263F29C50] serial];
    uint64_t v7 = BSDispatchQueueCreate();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)MEMORY[0x263F3F690];
    v10 = +[CRSUIClusterThemeSpecification identifier];
    v11 = [(NSUUID *)v3->_identifier UUIDString];
    v12 = [v9 endpointForMachName:@"com.apple.CarPlayApp.cluster-theme-service" service:v10 instance:v11];

    uint64_t v13 = [MEMORY[0x263F3F688] connectionWithEndpoint:v12];
    connection = v3->_connection;
    v3->_connection = (BSServiceConnection *)v13;

    objc_initWeak(&location, v3);
    v15 = v3->_connection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __32__CRSUIClusterThemeManager_init__block_invoke;
    v19[3] = &unk_264307720;
    v20 = v3;
    objc_copyWeak(&v21, &location);
    [(BSServiceConnection *)v15 configureConnection:v19];
    v16 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v3->_connection;
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_21817A000, v16, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    [(BSServiceConnection *)v3->_connection activate];
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }
  return v3;
}

void __32__CRSUIClusterThemeManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[CRSUIClusterThemeSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[CRSUIClusterThemeSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__CRSUIClusterThemeManager_init__block_invoke_2;
  v8[3] = &unk_2643076F8;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  [v3 setActivationHandler:v8];
  [v3 setInterruptionHandler:&__block_literal_global_6];
  [v3 setInvalidationHandler:&__block_literal_global_33];
  id WeakRetained = objc_loadWeakRetained((id *)a1);
  uint64_t v7 = [WeakRetained connectionQueue];
  [v3 setTargetQueue:v7];

  objc_destroyWeak(&v9);
}

void __32__CRSUIClusterThemeManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Connection activated! %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionActivated];
}

void __32__CRSUIClusterThemeManager_init__block_invoke_30(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __32__CRSUIClusterThemeManager_init__block_invoke_30_cold_1();
  }
}

void __32__CRSUIClusterThemeManager_init__block_invoke_31(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __32__CRSUIClusterThemeManager_init__block_invoke_31_cold_1();
  }
}

- (NSArray)displays
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_displays;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSSecurityScopedURLWrapper)extraAssetsURL
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_extraAssetsURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setThemeData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_connectionActivated && !self->_lock_invalidated)
  {
    [(CRSUIClusterThemeManager *)self _setThemeData:v6 completion:v7];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__CRSUIClusterThemeManager_setThemeData_completion___block_invoke;
    block[3] = &unk_264307920;
    id v9 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __52__CRSUIClusterThemeManager_setThemeData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getURLForAssetWithIdentifier:(id)a3 displayID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_connectionActivated && !self->_lock_invalidated)
  {
    [(CRSUIClusterThemeManager *)self _getURLForAssetWithIdentifier:v8 displayID:v9 completion:v10];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__CRSUIClusterThemeManager_getURLForAssetWithIdentifier_displayID_completion___block_invoke;
    block[3] = &unk_264307920;
    id v12 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __78__CRSUIClusterThemeManager_getURLForAssetWithIdentifier_displayID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    uint64_t v4 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(CRSUIClusterThemeManager *)self connection];
      int v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection! %@", (uint8_t *)&v10, 0xCu);
    }
    id v6 = [(CRSUIClusterThemeManager *)self connection];
    [v6 invalidate];

    *(_WORD *)&self->_lock_connectionActivated = 256;
    id v7 = [(CRSUIClusterThemeManager *)self assetBaseURL];
    id v8 = [v7 url];

    id v9 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21817A000, v9, OS_LOG_TYPE_DEFAULT, "Stopping secure access to %{public}@", (uint8_t *)&v10, 0xCu);
    }

    [v8 stopAccessingSecurityScopedResource];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)updateExtraAssetsURL:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_21817A000, v6, OS_LOG_TYPE_DEFAULT, "manager extraAssetsURL=%@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_extraAssetsURL, a3);
  os_unfair_lock_unlock(&self->_lock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__CRSUIClusterThemeManager_updateExtraAssetsURL___block_invoke;
  v8[3] = &unk_264307890;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __49__CRSUIClusterThemeManager_updateExtraAssetsURL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 clusterThemeManager:*(void *)(a1 + 32) didUpdateExtraAssetsURL:*(void *)(a1 + 40)];
  }
}

- (void)_handleConnectionActivated
{
  BSDispatchQueueAssert();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_connectionActivated = 1;
  id v4 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Requesting cluster layouts", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v5 = [(CRSUIClusterThemeManager *)self connection];
  id v6 = [v5 remoteTarget];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__CRSUIClusterThemeManager__handleConnectionActivated__block_invoke;
  v7[3] = &unk_264307948;
  objc_copyWeak(&v8, buf);
  [v6 getClusterThemeLayoutData:v7];
  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v8);

  objc_destroyWeak(buf);
}

void __54__CRSUIClusterThemeManager__handleConnectionActivated__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _processThemeLayoutData:v6 error:v5];
}

- (void)_processThemeLayoutData:(id)a3 error:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BSDispatchQueueAssert();
  displays = self->_displays;
  v22 = v7;
  if (v6)
  {
    id v9 = [v6 themeData];
    int v10 = [v6 displays];
    id v11 = [v6 assetBaseURL];
    uint64_t v12 = [v6 extraAssetsURL];
    uint64_t v13 = [v6 assetVersion];
    v14 = CRSUILogForCategory(6uLL);
    unint64_t v21 = v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v28 = [v10 count];
      _os_log_impl(&dword_21817A000, v14, OS_LOG_TYPE_INFO, "Received %d displays", buf, 8u);
    }
  }
  else
  {
    v14 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CRSUIClusterThemeManager _processThemeLayoutData:error:]();
    }
    id v11 = 0;
    uint64_t v12 = 0;
    unint64_t v21 = 0;
    id v9 = (NSDictionary *)MEMORY[0x263EFFA78];
    int v10 = (void *)MEMORY[0x263EFFA68];
  }

  os_unfair_lock_lock(&self->_lock);
  themeData = self->_themeData;
  self->_themeData = v9;
  v16 = v9;

  objc_storeStrong((id *)&self->_displays, v10);
  assetBaseURL = self->_assetBaseURL;
  self->_assetBaseURL = v11;
  v18 = v11;

  objc_storeStrong((id *)&self->_extraAssetsURL, v12);
  self->_assetVersion = v21;
  os_unfair_lock_unlock(&self->_lock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CRSUIClusterThemeManager__processThemeLayoutData_error___block_invoke;
  block[3] = &unk_264307970;
  void block[4] = self;
  id v24 = v12;
  BOOL v26 = displays != 0;
  id v25 = v10;
  id v19 = v10;
  id v20 = v12;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__CRSUIClusterThemeManager__processThemeLayoutData_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) assetBaseURL];
  char v3 = [v2 url];

  id v4 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    v15 = v3;
    _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Starting secure access to %{public}@", (uint8_t *)&v14, 0xCu);
  }

  [v3 startAccessingSecurityScopedResource];
  id v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    [v7 clusterThemeManagerDidFinishLoading:*(void *)(a1 + 32)];
  }
  id v8 = [*(id *)(a1 + 32) delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = [*(id *)(a1 + 32) delegate];
    [v10 clusterThemeManager:*(void *)(a1 + 32) didUpdateExtraAssetsURL:*(void *)(a1 + 40)];
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    if (*(void *)(a1 + 48))
    {
      id v11 = [*(id *)(a1 + 32) dataProviderDelegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        uint64_t v13 = [*(id *)(a1 + 32) dataProviderDelegate];
        [v13 dataProviderIsReady:*(void *)(a1 + 32)];
      }
    }
  }
}

- (void)_setThemeData:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = CRSUILogForCategory(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_21817A000, v8, OS_LOG_TYPE_DEFAULT, "Setting theme data: %@", buf, 0xCu);
  }

  char v9 = [[_CRSUIClusterThemeData alloc] initWithThemeData:v6];
  int v10 = [(CRSUIClusterThemeManager *)self connection];
  id v11 = [v10 remoteTarget];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke;
  v13[3] = &unk_264307770;
  id v14 = v7;
  id v12 = v7;
  [v11 setThemeData:v9 reply:v13];
}

void __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CRSUILogForCategory(6uLL);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21817A000, v5, OS_LOG_TYPE_DEFAULT, "Successfully set theme data", buf, 2u);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke_44;
  v6[3] = &unk_264307998;
  id v7 = *(id *)(a1 + 32);
  BOOL v8 = v3 == 0;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_getURLForAssetWithIdentifier:(id)a3 displayID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CRSUIClusterThemeManager *)self connection];
  id v12 = [v11 remoteTarget];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke;
  v16[3] = &unk_2643079E8;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  [v12 getURLForAssetWithIdentifier:v14 displayID:v15 reply:v16];
}

void __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke_cold_1(a1, (uint64_t)v6, v7);
    }
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke_46;
  v10[3] = &unk_2643079C0;
  id v8 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)isReady
{
  return self->_displays != 0;
}

- (unint64_t)version
{
  return self->_assetVersion;
}

- (id)displayID
{
  return 0;
}

- (id)wallpapers
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = [(CRSUIClusterThemeManager *)self displays];
  uint64_t v23 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v41;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v3;
        id v4 = *(void **)(*((void *)&v40 + 1) + 8 * v3);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v31 = v4;
        id v25 = [v4 layouts];
        uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v27)
        {
          uint64_t v26 = *(void *)v37;
          do
          {
            uint64_t v5 = 0;
            do
            {
              if (*(void *)v37 != v26) {
                objc_enumerationMutation(v25);
              }
              uint64_t v28 = v5;
              id v6 = *(void **)(*((void *)&v36 + 1) + 8 * v5);
              long long v32 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              id v29 = [v6 wallpapers];
              uint64_t v7 = [v29 countByEnumeratingWithState:&v32 objects:v44 count:16];
              if (v7)
              {
                uint64_t v8 = v7;
                uint64_t v9 = *(void *)v33;
                do
                {
                  for (uint64_t i = 0; i != v8; ++i)
                  {
                    if (*(void *)v33 != v9) {
                      objc_enumerationMutation(v29);
                    }
                    id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                    id v12 = [CRSUIAssetWallpaper alloc];
                    id v13 = [v11 identifier];
                    id v14 = [v31 identifier];
                    id v15 = [v6 identifier];
                    id v16 = [v11 cacheID];
                    id v17 = [v11 traits];
                    id v18 = [(CRSUIAssetWallpaper *)v12 initWithIdentifier:v13 displayID:v14 layoutID:v15 cacheID:v16 traits:v17];
                    [v30 addObject:v18];
                  }
                  uint64_t v8 = [v29 countByEnumeratingWithState:&v32 objects:v44 count:16];
                }
                while (v8);
              }

              uint64_t v5 = v28 + 1;
            }
            while (v28 + 1 != v27);
            uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v27);
        }

        uint64_t v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v23);
  }

  id v19 = (void *)[v30 copy];
  return v19;
}

- (id)defaultWallpapers
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(CRSUIClusterThemeManager *)self displays];
  uint64_t v24 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v42;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v3;
        id v4 = *(void **)(*((void *)&v41 + 1) + 8 * v3);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v31 = v4;
        id v26 = [v4 layouts];
        uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v28)
        {
          uint64_t v27 = *(void *)v38;
          do
          {
            uint64_t v5 = 0;
            do
            {
              if (*(void *)v38 != v27) {
                objc_enumerationMutation(v26);
              }
              uint64_t v29 = v5;
              id v6 = *(void **)(*((void *)&v37 + 1) + 8 * v5);
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v32 = v6;
              uint64_t v7 = [v6 wallpapers];
              uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v45 count:16];
              if (v8)
              {
                uint64_t v9 = v8;
                uint64_t v10 = *(void *)v34;
                do
                {
                  for (uint64_t i = 0; i != v9; ++i)
                  {
                    if (*(void *)v34 != v10) {
                      objc_enumerationMutation(v7);
                    }
                    id v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                    if ([v12 isDefault])
                    {
                      id v13 = [CRSUIAssetWallpaper alloc];
                      id v14 = [v12 identifier];
                      id v15 = [v31 identifier];
                      id v16 = [v32 identifier];
                      id v17 = [v12 cacheID];
                      id v18 = [v12 traits];
                      id v19 = [(CRSUIAssetWallpaper *)v13 initWithIdentifier:v14 displayID:v15 layoutID:v16 cacheID:v17 traits:v18];
                      [v30 addObject:v19];
                    }
                  }
                  uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v45 count:16];
                }
                while (v9);
              }

              uint64_t v5 = v29 + 1;
            }
            while (v29 + 1 != v28);
            uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v46 count:16];
          }
          while (v28);
        }

        uint64_t v3 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v24);
  }

  id v20 = (void *)[v30 copy];
  return v20;
}

- (id)dynamicAppearanceWallpapersForVehicle:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = [a3 displayThemeData];
  if (v4)
  {
    id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = [(CRSUIClusterThemeManager *)self displays];
    uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v31;
      *(void *)&long long v6 = 138412546;
      long long v25 = v6;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
          id v11 = objc_msgSend(v10, "identifier", v25);
          id v12 = [v4 objectForKey:v11];

          if (v12)
          {
            id v13 = [v10 layouts];
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = __66__CRSUIClusterThemeManager_dynamicAppearanceWallpapersForVehicle___block_invoke;
            v28[3] = &unk_264307A10;
            id v29 = v12;
            id v14 = objc_msgSend(v13, "bs_firstObjectPassingTest:", v28);

            if (v14)
            {
              id v15 = [v14 wallpapers];
              id v16 = objc_msgSend(v15, "bs_firstObjectPassingTest:", &__block_literal_global_53);

              if (v16
                || ([v14 wallpapers],
                    id v17 = objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v17, "bs_firstObjectPassingTest:", &__block_literal_global_55),
                    id v16 = objc_claimAutoreleasedReturnValue(),
                    v17,
                    v16))
              {
                id v18 = [v16 data];
                id v19 = [(CRSUIClusterThemeManager *)self loadWallpaperFromData:v18];

                if (v19) {
                  [v26 addObject:v19];
                }
              }
              else
              {
                id v16 = CRSUILogForCategory(6uLL);
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  id v20 = [v10 identifier];
                  unint64_t v21 = [v14 displayName];
                  *(_DWORD *)buf = v25;
                  long long v35 = v20;
                  __int16 v36 = 2112;
                  long long v37 = v21;
                  _os_log_impl(&dword_21817A000, v16, OS_LOG_TYPE_DEFAULT, "No wallpaper supports dynamic appearance for %@:%@", buf, 0x16u);
                }
              }
            }
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
        uint64_t v7 = v22;
      }
      while (v22);
    }

    uint64_t v23 = (void *)[v26 copy];
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x263EFFA68];
  }

  return v23;
}

uint64_t __66__CRSUIClusterThemeManager_dynamicAppearanceWallpapersForVehicle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) currentLayoutID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __66__CRSUIClusterThemeManager_dynamicAppearanceWallpapersForVehicle___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isDefault])
  {
    uint64_t v3 = [v2 traits];
    uint64_t v4 = [v3 supportsDynamicAppearance];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __66__CRSUIClusterThemeManager_dynamicAppearanceWallpapersForVehicle___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 traits];
  uint64_t v3 = [v2 supportsDynamicAppearance];

  return v3;
}

- (id)loadWallpaperFromData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    long long v6 = [(CRSUIClusterThemeManager *)self displays];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke;
    v26[3] = &unk_264307A58;
    uint64_t v7 = v5;
    uint64_t v27 = v7;
    uint64_t v8 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v26);

    if (v8)
    {
      uint64_t v9 = [v8 layouts];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke_2;
      v24[3] = &unk_264307A10;
      uint64_t v10 = v7;
      long long v25 = v10;
      id v11 = objc_msgSend(v9, "bs_firstObjectPassingTest:", v24);

      if (v11)
      {
        id v12 = [v11 wallpapers];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke_3;
        v22[3] = &unk_264307A80;
        uint64_t v23 = v10;
        id v13 = objc_msgSend(v12, "bs_firstObjectPassingTest:", v22);

        if (v13)
        {
          unint64_t v21 = [CRSUIAssetWallpaper alloc];
          id v20 = [v13 identifier];
          id v14 = [v8 identifier];
          id v15 = [v11 identifier];
          id v16 = [v13 cacheID];
          id v17 = [v13 traits];
          id v18 = [(CRSUIAssetWallpaper *)v21 initWithIdentifier:v20 displayID:v14 layoutID:v15 cacheID:v16 traits:v17];
        }
        else
        {
          id v18 = 0;
        }
      }
      else
      {
        id v18 = 0;
      }
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {

    uint64_t v7 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[CRSUIClusterThemeManager loadWallpaperFromData:]((uint64_t)v5, v7);
    }
    id v18 = 0;
  }

  return v18;
}

uint64_t __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) displayID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) layoutID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) wallpaperID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)resolveWallpaper:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 data];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v7 = [(CRSUIClusterThemeManager *)self displays];
    uint64_t v58 = [v7 countByEnumeratingWithState:&v79 objects:v85 count:16];
    if (v58)
    {
      uint64_t v8 = *(void *)v80;
      id v61 = v4;
      v62 = v7;
      uint64_t v57 = *(void *)v80;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v80 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void **)(*((void *)&v79 + 1) + 8 * v9);
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          uint64_t v59 = v9;
          v60 = v10;
          id obj = [v10 layouts];
          uint64_t v11 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v76;
            uint64_t v64 = *(void *)v76;
            do
            {
              uint64_t v14 = 0;
              uint64_t v65 = v12;
              do
              {
                if (*(void *)v76 != v13) {
                  objc_enumerationMutation(obj);
                }
                id v15 = *(void **)(*((void *)&v75 + 1) + 8 * v14);
                id v16 = [v15 identifier];
                id v17 = [v6 layoutID];
                int v18 = [v16 isEqualToString:v17];

                if (!v18) {
                  goto LABEL_27;
                }
                long long v73 = 0u;
                long long v74 = 0u;
                long long v71 = 0u;
                long long v72 = 0u;
                id v19 = [v15 wallpapers];
                uint64_t v20 = [v19 countByEnumeratingWithState:&v71 objects:v83 count:16];
                if (!v20) {
                  goto LABEL_25;
                }
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v72;
                while (2)
                {
                  for (uint64_t i = 0; i != v21; ++i)
                  {
                    if (*(void *)v72 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v24 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                    long long v25 = [v24 identifier];
                    id v26 = [v6 wallpaperID];
                    char v27 = [v25 isEqualToString:v26];

                    if (v27)
                    {
                      id v28 = v24;

                      uint64_t v13 = v64;
                      uint64_t v12 = v65;
                      if (!v28) {
                        goto LABEL_27;
                      }

                      id v29 = v60;
                      if (!v29) {
                        goto LABEL_42;
                      }
                      long long v31 = [v28 color];

                      if (v31)
                      {
                        long long v32 = [CRSUIResolvedWallpaper alloc];
                        uint64_t v7 = [v28 color];
                        long long v33 = v32;
                        id v4 = v61;
                        long long v30 = [(CRSUIResolvedWallpaper *)v33 initWithWallpaperInformation:v61 color:v7];
                        goto LABEL_49;
                      }
                      long long v34 = [v28 image];

                      if (v34)
                      {
                        long long v35 = [CRSUIResolvedWallpaper alloc];
                        v69[0] = MEMORY[0x263EF8330];
                        v69[1] = 3221225472;
                        v69[2] = __45__CRSUIClusterThemeManager_resolveWallpaper___block_invoke;
                        v69[3] = &unk_264307AA8;
                        id v28 = v28;
                        id v70 = v28;
                        __int16 v36 = v35;
                        id v4 = v61;
                        long long v30 = [(CRSUIResolvedWallpaper *)v36 initWithWallpaperInformation:v61 imageResolver:v69];
                        uint64_t v7 = v70;
                        goto LABEL_49;
                      }
                      long long v37 = [v28 package];

                      if (!v37)
                      {
LABEL_42:
                        long long v30 = 0;
                        id v4 = v61;
                        goto LABEL_50;
                      }
                      long long v38 = (void *)MEMORY[0x263F15838];
                      id obja = [v28 package];
                      uint64_t v39 = [obja asset];
                      long long v40 = [v39 url];
                      long long v41 = [v40 url];
                      long long v42 = [v28 package];
                      long long v43 = [v42 asset];
                      long long v44 = [v43 packageType];
                      id v68 = 0;
                      uint64_t v45 = [v38 packageWithContentsOfURL:v41 type:v44 options:0 error:&v68];
                      id v63 = v68;

                      v46 = (void *)v45;
                      if (v45)
                      {
                        uint64_t v47 = [v28 traits];
                        int v48 = [v47 supportsDynamicAppearance];

                        v49 = [CRSUIStatefulCAPackage alloc];
                        v50 = [v28 package];
                        v51 = v50;
                        if (v48)
                        {
                          v52 = [v50 stateForInterfaceStyle:1];
                          v53 = [v28 package];
                          v54 = [v53 stateForInterfaceStyle:2];
                          v55 = [(CRSUIStatefulCAPackage *)v49 initWithPackage:v46 lightModeState:v52 darkModeState:v54];
                        }
                        else
                        {
                          v52 = [v50 stateForInterfaceStyle:0];
                          v55 = [(CRSUIStatefulCAPackage *)v49 initWithPackage:v46 state:v52];
                        }
                        id v4 = v61;

                        long long v30 = [[CRSUIResolvedWallpaper alloc] initWithWallpaperInformation:v61 statefulPackage:v55];
LABEL_47:
                        uint64_t v7 = v63;
                      }
                      else
                      {
                        v55 = CRSUILogForCategory(6uLL);
                        if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                        {
                          long long v30 = 0;
                          id v4 = v61;
                          goto LABEL_47;
                        }
                        uint64_t v7 = v63;
                        [(CRSUIClusterThemeManager *)v28 resolveWallpaper:v55];
                        long long v30 = 0;
                        id v4 = v61;
                      }

                      goto LABEL_49;
                    }
                  }
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v71 objects:v83 count:16];
                  if (v21) {
                    continue;
                  }
                  break;
                }
LABEL_25:

                uint64_t v13 = v64;
                uint64_t v12 = v65;
LABEL_27:
                ++v14;
              }
              while (v14 != v12);
              uint64_t v12 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
            }
            while (v12);
          }

          uint64_t v9 = v59 + 1;
          id v4 = v61;
          uint64_t v7 = v62;
          uint64_t v8 = v57;
        }
        while (v59 + 1 != v58);
        uint64_t v58 = [v62 countByEnumeratingWithState:&v79 objects:v85 count:16];
      }
      while (v58);
    }
    id v29 = 0;
    id v28 = 0;
    long long v30 = 0;
LABEL_49:

LABEL_50:
  }
  else
  {
    long long v30 = 0;
  }

  return v30;
}

id __45__CRSUIClusterThemeManager_resolveWallpaper___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 image];
  uint64_t v5 = [v3 userInterfaceStyle];

  id v6 = [v4 assetForInterfaceStyle:v5];

  uint64_t v7 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v8 = [v6 url];
  uint64_t v9 = [v8 url];
  uint64_t v10 = [v7 dataWithContentsOfURL:v9];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x263F1C6B0] imageWithData:v10];
  }
  else
  {
    uint64_t v12 = CRSUILogForCategory(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __45__CRSUIClusterThemeManager_resolveWallpaper___block_invoke_cold_1(v6, v12);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (CRSUIWallpaperDataProvidingDelegate)dataProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
  return (CRSUIWallpaperDataProvidingDelegate *)WeakRetained;
}

- (void)setDataProviderDelegate:(id)a3
{
}

- (CRSUIClusterThemeManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRSUIClusterThemeManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)themeData
{
  return self->_themeData;
}

- (void)setThemeData:(id)a3
{
}

- (void)setDisplays:(id)a3
{
}

- (void)setExtraAssetsURL:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSSecurityScopedURLWrapper)assetBaseURL
{
  return self->_assetBaseURL;
}

- (void)setAssetBaseURL:(id)a3
{
}

- (unint64_t)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(unint64_t)a3
{
  self->_assetVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetBaseURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_extraAssetsURL, 0);
  objc_storeStrong((id *)&self->_displays, 0);
  objc_storeStrong((id *)&self->_themeData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataProviderDelegate);
}

void __32__CRSUIClusterThemeManager_init__block_invoke_30_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21817A000, v0, v1, "Connection interrupted! %@", v2, v3, v4, v5, v6);
}

void __32__CRSUIClusterThemeManager_init__block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21817A000, v0, v1, "Connection invalidated! %@", v2, v3, v4, v5, v6);
}

- (void)_processThemeLayoutData:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21817A000, v0, v1, "Error retrieving cluster layouts: %@", v2, v3, v4, v5, v6);
}

void __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21817A000, v0, v1, "Error setting theme data: %@", v2, v3, v4, v5, v6);
}

void __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_21817A000, log, OS_LOG_TYPE_ERROR, "Error getting url of %@:%@: %@", (uint8_t *)&v5, 0x20u);
}

- (void)loadWallpaperFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_21817A000, a2, OS_LOG_TYPE_FAULT, "Unsupported wallpaper type: %{public}@", v5, 0xCu);
}

- (void)resolveWallpaper:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = [a1 package];
  uint64_t v6 = [v5 asset];
  __int16 v7 = [v6 url];
  uint64_t v8 = [v7 url];
  OUTLINED_FUNCTION_0_0();
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_21817A000, a3, OS_LOG_TYPE_ERROR, "Error loading CAPackage from %@: %@", v9, 0x16u);
}

void __45__CRSUIClusterThemeManager_resolveWallpaper___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 url];
  uint64_t v4 = [v3 url];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21817A000, a2, OS_LOG_TYPE_ERROR, "Error loading image from %@", v5, 0xCu);
}

@end