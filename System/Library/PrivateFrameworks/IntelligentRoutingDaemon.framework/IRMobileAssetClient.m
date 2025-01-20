@interface IRMobileAssetClient
- (BOOL)_createInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4;
- (IRMobileAssetClient)init;
- (MAAutoAssetSelector)currentAssetSelector;
- (id)getLockedAssetVersion;
- (id)lockAssetContent;
- (void)lockAssetContent;
- (void)setCurrentAssetSelector:(id)a3;
- (void)unlockAssetContent;
@end

@implementation IRMobileAssetClient

- (IRMobileAssetClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)IRMobileAssetClient;
  v2 = [(IRMobileAssetClient *)&v6 init];
  v3 = v2;
  if (v2
    && ![(IRMobileAssetClient *)v2 _createInterestInAssetType:@"com.apple.MobileAsset.IntelligentRouting" withAssetSpecifier:@"IntelligentRoutingSettingsAsset"])
  {
    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (BOOL)_createInterestInAssetType:(id)a3 withAssetSpecifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  objc_super v6 = (objc_class *)MEMORY[0x263F55978];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initForAssetType:v8 withAssetSpecifier:v7];

  [(IRMobileAssetClient *)self setCurrentAssetSelector:v9];
  id v10 = objc_alloc(MEMORY[0x263F55960]);
  v11 = [(IRMobileAssetClient *)self currentAssetSelector];
  id v22 = 0;
  v12 = (void *)[v10 initForClientName:@"IntelligentRoutingDaemon" selectingAsset:v11 error:&v22];
  id v13 = v22;

  if (v13)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRMobileAssetClient _createInterestInAssetType:withAssetSpecifier:]();
    }
    BOOL v14 = 0;
  }
  else
  {
    v15 = [v12 interestInContentSync:@"Adapting IntelligentRouting performance"];
    BOOL v14 = v15 == 0;
    v16 = (os_log_t *)MEMORY[0x263F50090];
    v17 = *MEMORY[0x263F50090];
    if (v15)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
        -[IRMobileAssetClient _createInterestInAssetType:withAssetSpecifier:]();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25418E000, v17, OS_LOG_TYPE_INFO, "#mobile-asset-client, Successfully set interest in MobileAsset content", buf, 2u);
      }
      os_log_t v18 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_INFO))
      {
        v19 = v18;
        v20 = [v12 description];
        *(_DWORD *)buf = 138412290;
        v24 = v20;
        _os_log_impl(&dword_25418E000, v19, OS_LOG_TYPE_INFO, "#mobile-asset-client, %@", buf, 0xCu);
      }
    }
  }
  return v14;
}

- (id)lockAssetContent
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F55978]) initForAssetType:@"com.apple.MobileAsset.IntelligentRouting" withAssetSpecifier:@"IntelligentRoutingSettingsAsset"];
  id v28 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x263F55960]) initForClientName:@"IntelligentRoutingDaemon" selectingAsset:v3 error:&v28];
  id v5 = v28;
  if (v5)
  {
    objc_super v6 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      [(IRMobileAssetClient *)v6 lockAssetContent];
    }
    id v7 = 0;
  }
  else
  {
    id v8 = objc_opt_new();
    id v26 = 0;
    id v27 = 0;
    id v25 = 0;
    v9 = [v4 lockContentSync:@"Adapting IntelligentRouting performance" withUsagePolicy:v8 withTimeout:0 lockedAssetSelector:&v27 newerInProgress:&v26 error:&v25];
    id v10 = v27;
    id v11 = v26;
    id v12 = v25;
    id v13 = (void *)*MEMORY[0x263F50090];
    BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v14)
      {
        v15 = v13;
        v16 = [v12 description];
        *(_DWORD *)buf = 138412290;
        v30 = v16;
        _os_log_impl(&dword_25418E000, v15, OS_LOG_TYPE_INFO, "#mobile-asset-client, Unable to lock any version of auto-asset content: %@", buf, 0xCu);
      }
      id v7 = 0;
    }
    else
    {
      id v24 = v11;
      if (v14)
      {
        v17 = v13;
        os_log_t v18 = [v10 assetVersion];
        *(_DWORD *)buf = 138412290;
        v30 = v18;
        _os_log_impl(&dword_25418E000, v17, OS_LOG_TYPE_INFO, "#mobile-asset-client, MobileAsset Locked. Version %@", buf, 0xCu);

        id v11 = v24;
      }
      v19 = (void *)*MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        v21 = [v4 description];
        *(_DWORD *)buf = 138412290;
        v30 = v21;
        _os_log_impl(&dword_25418E000, v20, OS_LOG_TYPE_INFO, "#mobile-asset-client, %@", buf, 0xCu);

        id v11 = v24;
      }
      if (v10)
      {
        [(IRMobileAssetClient *)self setCurrentAssetSelector:v10];
      }
      else
      {
        id v22 = *MEMORY[0x263F50090];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
          -[IRMobileAssetClient lockAssetContent](v22);
        }
      }
      id v7 = [v9 path];
    }
  }

  return v7;
}

- (void)unlockAssetContent
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#mobile-asset-client, [ErrorId - AutoAsset end lock error] Failed to end asset locks: %@", v2, v3, v4, v5, v6);
}

- (id)getLockedAssetVersion
{
  uint64_t v2 = [(IRMobileAssetClient *)self currentAssetSelector];
  uint64_t v3 = [v2 assetVersion];

  return v3;
}

- (MAAutoAssetSelector)currentAssetSelector
{
  return self->_currentAssetSelector;
}

- (void)setCurrentAssetSelector:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_createInterestInAssetType:withAssetSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#mobile-asset-client, [ErrorId - AutoAsset set interest error] Failed to set interest in content: %@", v2, v3, v4, v5, v6);
}

- (void)_createInterestInAssetType:withAssetSpecifier:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#mobile-asset-client, [ErrorId - AutoAsset init error] Unable to create auto-asset instance: %@", v2, v3, v4, v5, v6);
}

- (void)lockAssetContent
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 description];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_25418E000, v3, OS_LOG_TYPE_ERROR, "#mobile-asset-client, [ErrorId - AutoAsset init error] Unable to create auto-asset instance for locking: %@", v5, 0xCu);
}

@end