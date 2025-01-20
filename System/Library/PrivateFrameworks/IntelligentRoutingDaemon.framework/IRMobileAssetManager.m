@interface IRMobileAssetManager
- (IRBackgroundActivitiesManager)backgroundActivitiesManager;
- (IRMobileAssetClient)mobileAssetClient;
- (IRMobileAssetManager)initWithBackgroundActivitiesManager:(id)a3;
- (OS_dispatch_queue)queue;
- (void)_handleMobileAssetLoadXPCActivity;
- (void)_loadAvailableMobileAsset;
- (void)_loadMobileAssetAtPath:(id)a3 assetVersion:(id)a4;
- (void)setBackgroundActivitiesManager:(id)a3;
- (void)setMobileAssetClient:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation IRMobileAssetManager

- (IRMobileAssetManager)initWithBackgroundActivitiesManager:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IRMobileAssetManager;
  v5 = [(IRMobileAssetManager *)&v17 init];
  if (v5)
  {
    v6 = +[IRPreferences shared];
    v7 = [v6 loadMobileAssetXPCActivityInterval];
    uint64_t v8 = [v7 longLongValue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60__IRMobileAssetManager_initWithBackgroundActivitiesManager___block_invoke;
    v15[3] = &unk_26539FCE8;
    v9 = v5;
    v16 = v9;
    [v4 registerForRepeatingBackgroundXPCActivityWithIdentifier:@"com.apple.intelligentroutingd.MALoaderXPCActivityIdentifier" interval:v8 isDiskIntensive:1 isMemoryIntensive:1 handler:v15];

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.intelligentroutingd.mobileAssetLoader", v10);
    [(IRMobileAssetManager *)v9 setQueue:v11];

    [(IRMobileAssetManager *)v9 setBackgroundActivitiesManager:v4];
    v12 = objc_alloc_init(IRMobileAssetClient);
    [(IRMobileAssetManager *)v9 setMobileAssetClient:v12];

    v13 = [(IRMobileAssetManager *)v9 mobileAssetClient];

    if (v13) {
      [(IRMobileAssetManager *)v9 _loadAvailableMobileAsset];
    }
  }
  return v5;
}

uint64_t __60__IRMobileAssetManager_initWithBackgroundActivitiesManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMobileAssetLoadXPCActivity];
}

- (void)_handleMobileAssetLoadXPCActivity
{
  id v3 = [(IRMobileAssetManager *)self queue];
  IRDispatchAsyncWithStrongSelf(v3, self, &__block_literal_global_10);
}

void __57__IRMobileAssetManager__handleMobileAssetLoadXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)os_transaction_create();
  id v4 = [v2 mobileAssetClient];

  if (!v4)
  {
    v5 = objc_alloc_init(IRMobileAssetClient);
    [v2 setMobileAssetClient:v5];
  }
  v6 = [v2 mobileAssetClient];

  if (v6)
  {
    [v2 _loadAvailableMobileAsset];
  }
  else
  {
    v7 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_INFO, "#mobile-asset-manager, Skipping MobileAsset load since MobileAsset client failed to initialize", v8, 2u);
    }
  }
}

- (void)_loadAvailableMobileAsset
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(IRMobileAssetManager *)self mobileAssetClient];
  id v4 = [v3 lockAssetContent];

  if (v4)
  {
    v5 = [(IRMobileAssetManager *)self mobileAssetClient];
    v6 = [v5 getLockedAssetVersion];

    if (v6
      && (+[IRPreferences shared],
          v7 = objc_claimAutoreleasedReturnValue(),
          [v7 mobileAssetVersion],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v6 isEqual:v8],
          v8,
          v7,
          (v9 & 1) == 0))
    {
      [(IRMobileAssetManager *)self _loadMobileAssetAtPath:v4 assetVersion:v6];
    }
    else
    {
      v10 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        v13 = v6;
        _os_log_impl(&dword_25418E000, v10, OS_LOG_TYPE_INFO, "#mobile-asset-manager, Locked Mobile Asset is same as current version or nil: %@. Skipping load", (uint8_t *)&v12, 0xCu);
      }
    }
    dispatch_queue_t v11 = [(IRMobileAssetManager *)self mobileAssetClient];
    [v11 unlockAssetContent];
  }
}

- (void)_loadMobileAssetAtPath:(id)a3 assetVersion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = *MEMORY[0x263F50098];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50098], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#mobile-asset-manager, Loading MobileAsset. Version %@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  char v9 = [v5 stringByAppendingPathComponent:@"settings.plist"];
  if ([v8 fileExistsAtPath:v9])
  {
    v10 = [NSDictionary dictionaryWithContentsOfFile:v9];
    dispatch_queue_t v11 = +[IRPreferences shared];
    [v11 setMobileAssetSettingsWithMobileAssetDict:v10 assetVersion:v6];
  }
  else
  {
    int v12 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRMobileAssetManager _loadMobileAssetAtPath:assetVersion:]((uint64_t)v6, v12);
    }
  }
}

- (IRBackgroundActivitiesManager)backgroundActivitiesManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundActivitiesManager);

  return (IRBackgroundActivitiesManager *)WeakRetained;
}

- (void)setBackgroundActivitiesManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IRMobileAssetClient)mobileAssetClient
{
  return self->_mobileAssetClient;
}

- (void)setMobileAssetClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_backgroundActivitiesManager);
}

- (void)_loadMobileAssetAtPath:(uint64_t)a1 assetVersion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25418E000, a2, OS_LOG_TYPE_ERROR, "#mobile-asset-manager, [ErrorId - load MobileAsset error] Could not find content of MobileAsset version %@", (uint8_t *)&v2, 0xCu);
}

@end