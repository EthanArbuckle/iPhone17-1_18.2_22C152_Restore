@interface ANAccessorySettingsCache
- (ANAccessorySettingsCache)initWithAccessorySettingsDataSource:(id)a3;
- (HMAccessorySettingsDataSource)accessorySettingsDataSource;
- (NSMutableDictionary)cachedAccessorySettings;
- (NSMutableDictionary)lastAccessorySettingsFetch;
- (OS_dispatch_queue)settingsQueue;
- (OS_os_log)log;
- (id)_fetchSettingsForAccessory:(id)a3 useCache:(BOOL)a4;
- (id)settingsForAccessory:(id)a3;
- (void)_removeSettingsForAccessoryWithIdentifier:(id)a3;
- (void)_updateSettings:(id)a3 forAccessoryWithIdentifier:(id)a4;
- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5;
@end

@implementation ANAccessorySettingsCache

- (ANAccessorySettingsCache)initWithAccessorySettingsDataSource:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ANAccessorySettingsCache;
  v6 = [(ANAccessorySettingsCache *)&v16 init];
  if (v6)
  {
    uint64_t v7 = ANLogWithCategory();
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.announce.settingsCache", 0);
    settingsQueue = v6->_settingsQueue;
    v6->_settingsQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    cachedAccessorySettings = v6->_cachedAccessorySettings;
    v6->_cachedAccessorySettings = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    lastAccessorySettingsFetch = v6->_lastAccessorySettingsFetch;
    v6->_lastAccessorySettingsFetch = (NSMutableDictionary *)v13;

    objc_storeStrong((id *)&v6->_accessorySettingsDataSource, a3);
    [v5 setDelegate:v6];
  }

  return v6;
}

- (id)settingsForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  objc_super v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  objc_initWeak(&location, self);
  id v5 = [(ANAccessorySettingsCache *)self settingsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__ANAccessorySettingsCache_settingsForAccessory___block_invoke;
  block[3] = &unk_1E6BCE078;
  objc_copyWeak(&v13, &location);
  id v6 = v4;
  uint64_t v11 = self;
  v12 = &v15;
  id v10 = v6;
  dispatch_sync(v5, block);

  uint64_t v7 = [(ANAccessorySettingsCache *)self _fetchSettingsForAccessory:v6 useCache:*((unsigned __int8 *)v16 + 24)];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __49__ANAccessorySettingsCache_settingsForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = [WeakRetained lastAccessorySettingsFetch];
  id v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v5 = [v3 objectForKeyedSubscript:v4];

  id v6 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  uint64_t v7 = [v6 numberForDefault:*MEMORY[0x1E4F4A578]];
  [v7 doubleValue];
  double v9 = v8;

  if (v5
    && ([MEMORY[0x1E4F1C9C8] now],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 timeIntervalSinceDate:v5],
        double v12 = v11,
        v10,
        v12 < v9))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v13 = [*(id *)(a1 + 40) log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [*(id *)(a1 + 32) name];
      uint64_t v15 = [*(id *)(a1 + 32) uniqueIdentifier];
      int v17 = 138412546;
      char v18 = v14;
      __int16 v19 = 2112;
      v20 = v15;
      objc_super v16 = "WARNING: Using cached settings for accessory. Value may be stale. %@, %@";
LABEL_7:
      _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    id v13 = [*(id *)(a1 + 40) log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [*(id *)(a1 + 32) name];
      uint64_t v15 = [*(id *)(a1 + 32) uniqueIdentifier];
      int v17 = 138412546;
      char v18 = v14;
      __int16 v19 = 2112;
      v20 = v15;
      objc_super v16 = "Settings need refresh for accessory %@, %@";
      goto LABEL_7;
    }
  }
}

- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  double v11 = [(ANAccessorySettingsCache *)self settingsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__ANAccessorySettingsCache_accessorySettingsDataSource_didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke;
  block[3] = &unk_1E6BCE0A0;
  void block[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  objc_copyWeak(&v17, &location);
  dispatch_async(v11, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __117__ANAccessorySettingsCache_accessorySettingsDataSource_didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "Received Settings Updates for Accessory Identifier %@: %@", (uint8_t *)&v6, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _updateSettings:*(void *)(a1 + 48) forAccessoryWithIdentifier:*(void *)(a1 + 40)];
}

- (id)_fetchSettingsForAccessory:(id)a3 useCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ANAccessorySettingsCache *)self settingsQueue];
  dispatch_assert_queue_not_V2(v7);

  __int16 v8 = @"Settings";
  if (v4) {
    __int16 v8 = @"Cached Settings";
  }
  uint64_t v9 = v8;
  uint64_t v10 = [(ANAccessorySettingsCache *)self log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = [v6 name];
    id v12 = [v6 uniqueIdentifier];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v50 = v12;
    _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "Fetching %{public}@ for Accessory %@, %@", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  id v52 = 0;
  objc_initWeak(&location, self);
  id v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke;
  aBlock[3] = &unk_1E6BCE118;
  objc_copyWeak(&v39, &location);
  aBlock[4] = self;
  v14 = v9;
  v35 = v14;
  id v15 = v6;
  id v36 = v15;
  v38 = buf;
  id v16 = v13;
  v37 = v16;
  id v17 = _Block_copy(aBlock);
  [(ANAccessorySettingsCache *)self accessorySettingsDataSource];
  if (v4) {
    char v18 = {;
  }
    __int16 v19 = [v15 home];
    v20 = [v19 uniqueIdentifier];
    uint64_t v21 = [v15 uniqueIdentifier];
    v48 = @"root.announce.enabled";
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    [v18 fetchCachedAccessorySettingsWithHomeIdentifier:v20 accessoryIdentifier:v21 keyPaths:v22 completionHandler:v17];
  }
  else {
    char v18 = {;
  }
    __int16 v19 = [v15 home];
    v20 = [v19 uniqueIdentifier];
    uint64_t v21 = [v15 uniqueIdentifier];
    v47 = @"root.announce.enabled";
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [v18 fetchAccessorySettingsWithHomeIdentifier:v20 accessoryIdentifier:v21 keyPaths:v22 completionHandler:v17];
  }

  dispatch_time_t v23 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v16, v23))
  {
    v24 = [(ANAccessorySettingsCache *)self log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v28 = [v15 name];
      v29 = [v15 uniqueIdentifier];
      *(_DWORD *)v41 = 138543874;
      v42 = v14;
      __int16 v43 = 2112;
      v44 = v28;
      __int16 v45 = 2112;
      v46 = v29;
      _os_log_error_impl(&dword_1DA5ED000, v24, OS_LOG_TYPE_ERROR, "Timed-out waiting for Accessory %{public}@ for %@, %@", v41, 0x20u);
    }
    v25 = [(ANAccessorySettingsCache *)self settingsQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_13;
    block[3] = &unk_1E6BCE140;
    objc_copyWeak(&v33, &location);
    v32 = buf;
    id v31 = v15;
    dispatch_sync(v25, block);

    objc_destroyWeak(&v33);
  }
  id v26 = *(id *)(*(void *)&buf[8] + 40);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

  return v26;
}

void __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  __int16 v8 = [*(id *)(a1 + 32) log];
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_cold_1(a1, (uint64_t)v5, v9);
    }

    uint64_t v10 = [WeakRetained settingsQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_9;
    block[3] = &unk_1E6BCE0C8;
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 64);
    void block[4] = v11;
    void block[5] = WeakRetained;
    id v27 = *(id *)(a1 + 48);
    id v28 = *(id *)(a1 + 56);
    dispatch_async(v10, block);

    id v12 = v27;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      v14 = [*(id *)(a1 + 48) name];
      id v15 = [*(id *)(a1 + 48) uniqueIdentifier];
      *(_DWORD *)buf = 138544130;
      uint64_t v31 = v13;
      __int16 v32 = 2112;
      id v33 = v14;
      __int16 v34 = 2112;
      v35 = v15;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl(&dword_1DA5ED000, v9, OS_LOG_TYPE_DEFAULT, "Fetched %{public}@ for Accessory %@, %@: %@", buf, 0x2Au);
    }
    id v16 = [WeakRetained settingsQueue];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_10;
    v21[3] = &unk_1E6BCE0F0;
    v21[4] = WeakRetained;
    id v22 = v6;
    id v17 = *(id *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 32);
    id v23 = v17;
    uint64_t v24 = v18;
    long long v20 = *(_OWORD *)(a1 + 56);
    id v19 = (id)v20;
    long long v25 = v20;
    dispatch_async(v16, v21);

    id v12 = v22;
  }
}

void __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_9(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to use locally-cached settings", v9, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 40) cachedAccessorySettings];
  BOOL v4 = [*(id *)(a1 + 48) uniqueIdentifier];
  id v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_10(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = [*(id *)(a1 + 48) uniqueIdentifier];
  [v2 _updateSettings:v3 forAccessoryWithIdentifier:v4];

  id v5 = [*(id *)(a1 + 32) cachedAccessorySettings];
  uint64_t v6 = [*(id *)(a1 + 48) uniqueIdentifier];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 copy];
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  id v12 = [*(id *)(a1 + 56) lastAccessorySettingsFetch];
  uint64_t v13 = [*(id *)(a1 + 48) uniqueIdentifier];
  [v12 setObject:v11 forKeyedSubscript:v13];

  v14 = *(NSObject **)(a1 + 64);
  dispatch_group_leave(v14);
}

void __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to use locally-cached settings", v10, 2u);
  }

  BOOL v4 = [WeakRetained cachedAccessorySettings];
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 copy];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)_updateSettings:(id)a3 forAccessoryWithIdentifier:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ANAccessorySettingsCache *)self settingsQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(ANAccessorySettingsCache *)self cachedAccessorySettings];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  id v22 = (void *)v10;
  if (!v10)
  {
    uint64_t v11 = objc_opt_new();
    id v12 = [(ANAccessorySettingsCache *)self cachedAccessorySettings];
    [v12 setObject:v11 forKeyedSubscript:v7];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v19 = [(ANAccessorySettingsCache *)self cachedAccessorySettings];
        long long v20 = [v19 objectForKeyedSubscript:v7];
        uint64_t v21 = [v18 keyPath];
        [v20 setObject:v18 forKeyedSubscript:v21];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }
}

- (void)_removeSettingsForAccessoryWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ANAccessorySettingsCache *)self settingsQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ANAccessorySettingsCache *)self cachedAccessorySettings];
  [v6 setObject:0 forKeyedSubscript:v4];
}

- (OS_dispatch_queue)settingsQueue
{
  return self->_settingsQueue;
}

- (HMAccessorySettingsDataSource)accessorySettingsDataSource
{
  return self->_accessorySettingsDataSource;
}

- (NSMutableDictionary)cachedAccessorySettings
{
  return self->_cachedAccessorySettings;
}

- (NSMutableDictionary)lastAccessorySettingsFetch
{
  return self->_lastAccessorySettingsFetch;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lastAccessorySettingsFetch, 0);
  objc_storeStrong((id *)&self->_cachedAccessorySettings, 0);
  objc_storeStrong((id *)&self->_accessorySettingsDataSource, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);
}

void __64__ANAccessorySettingsCache__fetchSettingsForAccessory_useCache___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) name];
  uint64_t v8 = [*(id *)(a1 + 48) uniqueIdentifier];
  int v9 = 138544130;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  id v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  __int16 v15 = 2112;
  uint64_t v16 = a2;
  _os_log_error_impl(&dword_1DA5ED000, a3, OS_LOG_TYPE_ERROR, "Failed to retrieve %{public}@ for Accessory %@, %@: %@", (uint8_t *)&v9, 0x2Au);
}

@end