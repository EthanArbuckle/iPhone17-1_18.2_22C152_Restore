@interface ATXAssets2
+ (id)dictionaryForClass:(Class)a3;
+ (id)dictionaryForClassName:(id)a3;
+ (id)dictionaryForResource:(id)a3 ofType:(id)a4 specifiedABGroup:(id)a5;
+ (id)dictionaryFromLazyPlistForClass:(Class)a3;
+ (id)dictionaryFromLazyPlistForClassName:(id)a3;
+ (id)dictionaryFromLazyPlistWithLegacyPathForClass:(Class)a3;
+ (id)dictionaryWithLegacyPathForClass:(Class)a3;
+ (id)pathForResource:(id)a3 ofType:(id)a4 isDirectory:(BOOL)a5;
+ (id)rawDictionaryForResource:(id)a3 ofType:(id)a4;
+ (id)rawDictionaryUsingMobileAssetsForResource:(id)a3 ofType:(id)a4;
+ (id)rawDictionaryUsingTrialForResource:(id)a3 ofType:(id)a4;
+ (void)addOverridePath:(id)a3 forResource:(id)a4 ofType:(id)a5;
+ (void)clearOverrides;
+ (void)onUpdateRestartThisProcess;
+ (void)updateMobileAssetMetadata;
@end

@implementation ATXAssets2

+ (void)addOverridePath:(id)a3 forResource:(id)a4 ofType:(id)a5
{
  id v14 = a3;
  v7 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[[v7 alloc] initWithFirst:v9 second:v8];

  pthread_mutex_lock(&overridesLock);
  v11 = (void *)overrides;
  if (!overrides)
  {
    uint64_t v12 = objc_opt_new();
    v13 = (void *)overrides;
    overrides = v12;

    v11 = (void *)overrides;
  }
  [v11 setObject:v14 forKeyedSubscript:v10];
  pthread_mutex_unlock(&overridesLock);
}

+ (void)clearOverrides
{
  pthread_mutex_lock(&overridesLock);
  v2 = (void *)overrides;
  overrides = 0;

  pthread_mutex_unlock(&overridesLock);
}

+ (void)onUpdateRestartThisProcess
{
  if (onUpdateRestartThisProcess_onceToken != -1) {
    dispatch_once(&onUpdateRestartThisProcess_onceToken, &__block_literal_global_93);
  }
}

void __40__ATXAssets2_onUpdateRestartThisProcess__block_invoke()
{
  v0 = getAsset();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __40__ATXAssets2_onUpdateRestartThisProcess__block_invoke_cold_1((uint64_t)v0);
  }
  id v1 = (id)[v0 registerUpdateHandler:&__block_literal_global_9_0];
  v2 = +[ATXAssetsABHelper decDeviceId];
  v3 = (void *)MEMORY[0x1E4F93B10];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__ATXAssets2_onUpdateRestartThisProcess__block_invoke_2;
  v6[3] = &unk_1E5D05300;
  id v7 = v2;
  id v4 = v2;
  [v3 runBlockWhenDeviceIsClassCUnlocked:v6];
  v5 = getTrialAssets();
  [v5 addUpdateHandlerWithBlock:&__block_literal_global_13_4];
}

uint64_t __40__ATXAssets2_onUpdateRestartThisProcess__block_invoke_2(uint64_t a1)
{
  v2 = +[ATXAssetsABHelper decDeviceId];
  v6 = v2;
  if (!v2 || (v3 = [v2 isEqual:*(void *)(a1 + 32)], id v4 = v6, (v3 & 1) == 0))
  {
    uint64_t v3 = xpc_transaction_exit_clean();
    id v4 = v6;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

+ (id)pathForResource:(id)a3 ofType:(id)a4 isDirectory:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v7 second:v8];
  pthread_mutex_lock(&overridesLock);
  v34 = (void *)v9;
  v10 = [(id)overrides objectForKeyedSubscript:v9];
  pthread_mutex_unlock(&overridesLock);
  uint64_t v11 = [v7 stringByAppendingPathExtension:v8];
  uint64_t v12 = getAsset();
  v33 = (void *)v11;
  id v13 = [v12 filesystemPathForAssetDataRelativePath:v11];
  id v14 = getTrialAssets();
  if (([v8 isEqualToString:@"mlmodelc"] & 1) != 0 || v5)
  {
    objc_msgSend(v14, "directoryPathForTrialResource:", v7, a1);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    char v35 = 0;
    id v19 = v13;
    if (v15)
    {
      v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v21 = [v20 fileExistsAtPath:v15 isDirectory:&v35];

      id v19 = v13;
      if (v21)
      {
        id v19 = v13;
        if (v35)
        {
          id v19 = v15;

          v22 = __atxlog_handle_trial_assets();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v37 = v19;
            __int16 v38 = 2112;
            id v39 = v7;
            _os_log_impl(&dword_1A790D000, v22, OS_LOG_TYPE_DEFAULT, "Using Trial directory path: %@ for resource: %@", buf, 0x16u);
          }
        }
      }
    }
  }
  else
  {
    id v15 = [v14 filePathForResource:v7];
    if (v15
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          v16 = objc_claimAutoreleasedReturnValue(),
          int v17 = [v16 fileExistsAtPath:v15],
          v16,
          v17))
    {
      id v15 = v15;

      v18 = __atxlog_handle_trial_assets();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v37 = v15;
        __int16 v38 = 2112;
        id v39 = v7;
        _os_log_impl(&dword_1A790D000, v18, OS_LOG_TYPE_DEFAULT, "Using Trial file path: %@ for resource: %@", buf, 0x16u);
      }

      id v19 = v15;
    }
    else
    {
      id v19 = v13;
    }
  }

  if (!v19)
  {
    v23 = __atxlog_handle_default();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138412802;
      id v37 = v31;
      __int16 v38 = 2112;
      id v39 = v7;
      __int16 v40 = 2112;
      id v41 = v8;
      _os_log_fault_impl(&dword_1A790D000, v23, OS_LOG_TYPE_FAULT, "%@ - could not find path for resource: %@ with extension: %@", buf, 0x20u);
    }
  }
  if (v10) {
    v24 = v10;
  }
  else {
    v24 = v19;
  }
  id v25 = v24;
  v26 = __atxlog_handle_default();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138412802;
    id v37 = v28;
    __int16 v38 = 2112;
    id v39 = v25;
    __int16 v40 = 2112;
    id v41 = v7;
    _os_log_impl(&dword_1A790D000, v26, OS_LOG_TYPE_DEFAULT, "%@ - using path: %@ for resource name: %@", buf, 0x20u);
  }

  return v25;
}

+ (void)updateMobileAssetMetadata
{
  v2 = getAsset();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Kicking off mobile asset metadata download.", v3, 2u);
  }
  [v2 downloadMetadataWithCompletion:0];
}

+ (id)rawDictionaryUsingTrialForResource:(id)a3 ofType:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v7 = a4;
  id v8 = (void *)[[v6 alloc] initWithFirst:v5 second:v7];

  pthread_mutex_lock(&overridesLock);
  uint64_t v9 = [(id)overrides objectForKeyedSubscript:v8];
  pthread_mutex_unlock(&overridesLock);
  id v10 = v9;
  uint64_t v11 = getTrialAssets();
  uint64_t v12 = [v11 filePathForResource:v5];
  if (v12)
  {
    id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v14 = [v13 fileExistsAtPath:v12];

    if (v14)
    {
      id v15 = v12;

LABEL_8:
      int v17 = loadLazyOrRegularPlist_0(v15);
      goto LABEL_10;
    }
  }
  else
  {
    v16 = __atxlog_handle_trial_assets();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543362;
      id v20 = v5;
      _os_log_impl(&dword_1A790D000, v16, OS_LOG_TYPE_DEFAULT, "Unable to locate Trial resource: %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }
  id v15 = v10;
  if (v10) {
    goto LABEL_8;
  }
  int v17 = 0;
LABEL_10:

  return v17;
}

+ (id)rawDictionaryUsingMobileAssetsForResource:(id)a3 ofType:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithFirst:v7 second:v6];
  pthread_mutex_lock(&overridesLock);
  uint64_t v9 = [(id)overrides objectForKeyedSubscript:v8];
  pthread_mutex_unlock(&overridesLock);
  id v10 = [v7 stringByAppendingPathExtension:v6];

  uint64_t v11 = getAsset();
  uint64_t v12 = [v11 filesystemPathForAssetDataRelativePath:v10];
  id v13 = v12;
  if (v9) {
    uint64_t v12 = v9;
  }
  if (v12)
  {
    int v14 = loadLazyOrRegularPlist_0(v12);
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

+ (id)rawDictionaryForResource:(id)a3 ofType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"mlmodelc"])
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [a1 pathForResource:v6 ofType:v7 isDirectory:0];
    id v10 = v9;
    if (v9)
    {
      id v8 = loadLazyOrRegularPlist_0(v9);
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

+ (id)dictionaryForResource:(id)a3 ofType:(id)a4 specifiedABGroup:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a1 rawDictionaryForResource:a3 ofType:a4];
  id v10 = [[ATXAssetsABHelper alloc] initWithAssetContents:v9 specifiedABGroup:v8 indexForDevice:+[ATXAssetsABHelper indexForDevice]];

  uint64_t v11 = [(ATXAssetsABHelper *)v10 abGroupContents];

  return v11;
}

+ (id)dictionaryWithLegacyPathForClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  id v5 = [a1 dictionaryForResource:v4 ofType:@"plist" specifiedABGroup:0];

  return v5;
}

+ (id)dictionaryFromLazyPlistWithLegacyPathForClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  id v5 = [a1 dictionaryForResource:v4 ofType:@"plplist" specifiedABGroup:0];

  return v5;
}

+ (id)dictionaryForClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  id v5 = [a1 dictionaryForClassName:v4];

  return v5;
}

+ (id)dictionaryForClassName:(id)a3
{
  return (id)[a1 dictionaryForResource:a3 ofType:@"plist"];
}

+ (id)dictionaryFromLazyPlistForClass:(Class)a3
{
  id v4 = NSStringFromClass(a3);
  id v5 = [a1 dictionaryFromLazyPlistForClassName:v4];

  return v5;
}

+ (id)dictionaryFromLazyPlistForClassName:(id)a3
{
  return (id)[a1 dictionaryForResource:a3 ofType:@"plplist"];
}

void __40__ATXAssets2_onUpdateRestartThisProcess__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1A790D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Registering to quit on update of asset %@", (uint8_t *)&v1, 0xCu);
}

@end