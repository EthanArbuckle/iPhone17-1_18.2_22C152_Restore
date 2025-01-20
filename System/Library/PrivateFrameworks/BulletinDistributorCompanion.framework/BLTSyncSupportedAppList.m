@interface BLTSyncSupportedAppList
- (BLTSyncSupportedAppList)init;
- (BLTSyncSupportedAppListDelegate)delegate;
- (BOOL)_handleAppListInstalled:(id)a3 removed:(id)a4;
- (NSDictionary)installed;
- (NSSet)removed;
- (id)_syncSupportedAppListStoreURL;
- (id)supportedBundleIDsFromRecords:(id)a3 nonSyncSupportedBundleIDs:(id *)a4;
- (void)applicationIconDidChange:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)dealloc;
- (void)init;
- (void)setDelegate:(id)a3;
- (void)updateStoreWithInstalled:(id)a3 removed:(id)a4;
@end

@implementation BLTSyncSupportedAppList

- (BLTSyncSupportedAppList)init
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v52.receiver = self;
  v52.super_class = (Class)BLTSyncSupportedAppList;
  v2 = [(BLTSyncSupportedAppList *)&v52 init];
  if (!v2) {
    return v2;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.private.bulletindistributor.siriActionAppListQueue", v3);
  appListQueue = v2->_appListQueue;
  v2->_appListQueue = (OS_dispatch_queue *)v4;

  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  installed = v2->_installed;
  v2->_installed = v6;

  v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  removed = v2->_removed;
  v2->_removed = v8;

  CFPreferencesAppSynchronize(@"com.apple.bulletindistributor");
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppIntegerValue(@"BLTSiriActionAppListVersion", @"com.apple.bulletindistributor", &keyExistsAndHasValidFormat);
  uint64_t v10 = [(BLTSyncSupportedAppList *)v2 _syncSupportedAppListStoreURL];
  v11 = (void *)v10;
  unint64_t v12 = 0x263EFF000uLL;
  v42 = (void *)v10;
  if (keyExistsAndHasValidFormat)
  {
    v13 = (void *)MEMORY[0x263EFF9C0];
    id v49 = 0;
    v14 = [MEMORY[0x263EFF8C0] arrayWithContentsOfURL:v10 error:&v49];
    id v15 = v49;
    uint64_t v16 = [v13 setWithArray:v14];
    appListStore = v2->_appListStore;
    v2->_appListStore = (NSMutableSet *)v16;

    if (v15)
    {
      v18 = blt_general_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        [(BLTSyncSupportedAppList *)(uint64_t)v11 init];
      }
    }
  }
  else
  {
    if (v10)
    {
      v19 = [MEMORY[0x263F08850] defaultManager];
      v20 = [v11 path];
      int v21 = [v19 fileExistsAtPath:v20];

      if (v21)
      {
        v22 = [MEMORY[0x263F08850] defaultManager];
        id v50 = 0;
        int v23 = [v22 removeItemAtURL:v11 error:&v50];
        id v24 = v50;

        if (!v23)
        {
          v41 = blt_general_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            [(BLTSyncSupportedAppList *)(uint64_t)v24 init];
          }

          goto LABEL_13;
        }
      }
    }
    CFPreferencesSetAppValue(@"BLTSiriActionAppListVersion", &unk_26D607DB0, @"com.apple.bulletindistributor");
    CFPreferencesAppSynchronize(@"com.apple.bulletindistributor");
  }
LABEL_13:
  v25 = [MEMORY[0x263F01880] defaultWorkspace];
  [v25 addObserver:v2];

  v26 = [MEMORY[0x263EFF9C0] set];
  [MEMORY[0x263F01878] enumeratorWithOptions:0];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v46 != v29) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v32 = (void *)MEMORY[0x223CAC5D0]();
        v33 = [v31 bundleIdentifier];
        [v26 addObject:v33];

        v53 = v31;
        v34 = [*(id *)(v12 + 2240) arrayWithObjects:&v53 count:1];
        id v44 = 0;
        v35 = [(BLTSyncSupportedAppList *)v2 supportedBundleIDsFromRecords:v34 nonSyncSupportedBundleIDs:&v44];
        unint64_t v36 = v12;
        id v37 = v44;

        [(BLTSyncSupportedAppList *)v2 _handleAppListInstalled:v35 removed:v37];
        unint64_t v12 = v36;
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v28);
  }

  v38 = (void *)[(NSMutableSet *)v2->_appListStore mutableCopy];
  [v38 minusSet:v26];
  if ([v38 count])
  {
    v39 = [v38 allObjects];
    [(BLTSyncSupportedAppList *)v2 _handleAppListInstalled:0 removed:v39];
  }
  return v2;
}

- (id)supportedBundleIDsFromRecords:(id)a3 nonSyncSupportedBundleIDs:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
        unint64_t v12 = [MEMORY[0x263F0F998] appInfoWithApplicationRecord:v11];
        v13 = [v12 supportedActions];
        if ([v13 count])
        {

LABEL_9:
          uint64_t v16 = [v11 localizedName];
          v17 = v16;
          if (!v16)
          {
            dispatch_queue_t v4 = [MEMORY[0x263EFF9D0] null];
            v17 = v4;
          }
          v18 = [v11 bundleIdentifier];
          [v6 setObject:v17 forKeyedSubscript:v18];

          if (!v16) {
LABEL_13:
          }

          goto LABEL_14;
        }
        v14 = [v12 supportedActionsByExtensions];
        uint64_t v15 = [v14 count];

        if (v15) {
          goto LABEL_9;
        }
        if ([v11 supportsLiveActivities])
        {
          uint64_t v16 = [v11 localizedName];
          uint64_t v19 = (uint64_t)v16;
          if (!v16)
          {
            uint64_t v19 = [MEMORY[0x263EFF9D0] null];
            id v24 = (void *)v19;
          }
          v20 = [v11 bundleIdentifier];
          [v6 setObject:v19 forKeyedSubscript:v20];

          if (!v16) {
          goto LABEL_13;
          }
        }
        if (a4)
        {
          id v21 = *a4;
          if (!*a4)
          {
            id v21 = [MEMORY[0x263EFF980] array];
            *a4 = v21;
          }
          uint64_t v16 = [v11 bundleIdentifier];
          [v21 addObject:v16];
          goto LABEL_13;
        }
LABEL_14:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v8 = v22;
    }
    while (v22);
  }

  return v6;
}

- (id)_syncSupportedAppListStoreURL
{
  syncSupportedAppListStoreURL = self->_syncSupportedAppListStoreURL;
  if (!syncSupportedAppListStoreURL)
  {
    BLTFileURLInPairingPath(@"siriActionAppListStore.plist");
    dispatch_queue_t v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_syncSupportedAppListStoreURL;
    self->_syncSupportedAppListStoreURL = v4;

    syncSupportedAppListStoreURL = self->_syncSupportedAppListStoreURL;
  }
  return syncSupportedAppListStoreURL;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BLTSyncSupportedAppList;
  [(BLTSyncSupportedAppList *)&v4 dealloc];
}

- (NSDictionary)installed
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  appListQueue = self->_appListQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__BLTSyncSupportedAppList_installed__block_invoke;
  v5[3] = &unk_264683E00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(appListQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

uint64_t __36__BLTSyncSupportedAppList_installed__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  return MEMORY[0x270F9A758]();
}

- (NSSet)removed
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  appListQueue = self->_appListQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__BLTSyncSupportedAppList_removed__block_invoke;
  v5[3] = &unk_264683E00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(appListQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

uint64_t __34__BLTSyncSupportedAppList_removed__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  return MEMORY[0x270F9A758]();
}

- (BOOL)_handleAppListInstalled:(id)a3 removed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  appListQueue = self->_appListQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__BLTSyncSupportedAppList__handleAppListInstalled_removed___block_invoke;
  v12[3] = &unk_2646845B8;
  id v13 = v6;
  v14 = self;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(appListQueue, v12);
  LOBYTE(appListQueue) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)appListQueue;
}

void __59__BLTSyncSupportedAppList__handleAppListInstalled_removed___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v2 = [*(id *)(a1 + 32) allKeys];
    id v3 = [MEMORY[0x263EFF9C0] setWithArray:v2];
    objc_super v4 = (void *)[v3 mutableCopy];
    [v3 minusSet:*(void *)(*(void *)(a1 + 40) + 40)];
    if ([v3 count])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      id v5 = *(void **)(a1 + 32);
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __59__BLTSyncSupportedAppList__handleAppListInstalled_removed___block_invoke_2;
      v18 = &unk_264684590;
      id v6 = v3;
      uint64_t v7 = *(void *)(a1 + 40);
      id v19 = v6;
      uint64_t v20 = v7;
      [v5 enumerateKeysAndObjectsUsingBlock:&v15];
    }
    objc_msgSend(v4, "intersectSet:", *(void *)(*(void *)(a1 + 40) + 16), v15, v16, v17, v18);
    if ([v4 count])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      [*(id *)(*(void *)(a1 + 40) + 16) minusSet:v4];
    }
  }
  if ([*(id *)(a1 + 48) count])
  {
    uint64_t v8 = [MEMORY[0x263EFF9C0] setWithArray:*(void *)(a1 + 48)];
    id v9 = (void *)[v8 mutableCopy];
    [v8 intersectSet:*(void *)(*(void *)(a1 + 40) + 40)];
    if ([v8 count])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      [*(id *)(*(void *)(a1 + 40) + 16) unionSet:v8];
    }
    id v10 = (void *)MEMORY[0x263EFFA08];
    id v11 = [*(id *)(*(void *)(a1 + 40) + 8) allKeys];
    unint64_t v12 = [v10 setWithArray:v11];
    [v9 intersectSet:v12];

    if ([v9 count])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      id v13 = *(void **)(*(void *)(a1 + 40) + 8);
      v14 = [v9 allObjects];
      [v13 removeObjectsForKeys:v14];
    }
  }
}

void __59__BLTSyncSupportedAppList__handleAppListInstalled_removed___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6]) {
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v5 forKeyedSubscript:v6];
  }
}

- (void)applicationsDidInstall:(id)a3
{
  id v7 = 0;
  objc_super v4 = BLTSyncSupportedBundleIDsFromProxies(a3, &v7);
  id v5 = v7;
  if ([(BLTSyncSupportedAppList *)self _handleAppListInstalled:v4 removed:v5])
  {
    id v6 = [(BLTSyncSupportedAppList *)self delegate];
    [v6 syncSupportedAppListUpdated:self];
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  BLTSyncSupportedBundleIDsFromProxies(a3, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v4 = [v7 allKeys];
  BOOL v5 = [(BLTSyncSupportedAppList *)self _handleAppListInstalled:0 removed:v4];

  if (v5)
  {
    id v6 = [(BLTSyncSupportedAppList *)self delegate];
    [v6 syncSupportedAppListUpdated:self];
  }
}

- (void)applicationIconDidChange:(id)a3
{
  objc_super v4 = BLTSyncSupportedBundleIDsFromProxies(a3, 0);
  if ([v4 count])
  {
    appListQueue = self->_appListQueue;
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    id v9 = __52__BLTSyncSupportedAppList_applicationIconDidChange___block_invoke;
    id v10 = &unk_264683BB0;
    id v11 = self;
    id v12 = v4;
    dispatch_sync(appListQueue, &v7);
    id v6 = [(BLTSyncSupportedAppList *)self delegate];
    [v6 syncSupportedAppListUpdated:self];
  }
}

uint64_t __52__BLTSyncSupportedAppList_applicationIconDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addEntriesFromDictionary:*(void *)(a1 + 40)];
}

- (void)updateStoreWithInstalled:(id)a3 removed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  appListQueue = self->_appListQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__BLTSyncSupportedAppList_updateStoreWithInstalled_removed___block_invoke;
  block[3] = &unk_264683E78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(appListQueue, block);
}

void __60__BLTSyncSupportedAppList_updateStoreWithInstalled_removed___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [*(id *)(a1 + 40) allObjects];
  [v2 removeObjectsForKeys:v3];

  [*(id *)(*(void *)(a1 + 32) + 16) minusSet:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 40) unionSet:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 40) minusSet:*(void *)(a1 + 48)];
  objc_super v4 = (void *)MEMORY[0x263F08AC0];
  BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 40) allObjects];
  id v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:0];

  id v7 = [*(id *)(a1 + 32) _syncSupportedAppListStoreURL];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF8F8] data];
    id v20 = 0;
    int v9 = [v8 writeToURL:v7 options:0 error:&v20];
    id v10 = (__CFString *)v20;

    if (v9)
    {
      uint64_t v11 = *MEMORY[0x263EFF6B0];
      id v19 = v10;
      int v12 = [v7 setResourceValue:MEMORY[0x263EFFA88] forKey:v11 error:&v19];
      id v13 = v19;

      if (v12)
      {
        v18 = v13;
        char v14 = [v6 writeToURL:v7 options:0x10000000 error:&v18];
        id v10 = v18;

        if (v14)
        {
          uint64_t v15 = blt_general_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            __int16 v17 = 0;
            _os_log_impl(&dword_222F4C000, v15, OS_LOG_TYPE_INFO, "Sync supported app list written.", (uint8_t *)&v17, 2u);
          }
          goto LABEL_11;
        }
      }
      else
      {
        id v10 = v13;
      }
    }
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
  [v16 removeItemAtURL:v7 error:0];

  uint64_t v15 = blt_general_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    __60__BLTSyncSupportedAppList_updateStoreWithInstalled_removed___block_invoke_cold_1(v10, v7 == 0, v15);
  }
LABEL_11:
}

- (BLTSyncSupportedAppListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTSyncSupportedAppListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appListStore, 0);
  objc_storeStrong((id *)&self->_syncSupportedAppListStoreURL, 0);
  objc_storeStrong((id *)&self->_appListQueue, 0);
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_installed, 0);
}

- (void)init
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Error reading %@: %@", (uint8_t *)&v3, 0x16u);
}

void __60__BLTSyncSupportedAppList_updateStoreWithInstalled_removed___block_invoke_cold_1(__CFString *a1, char a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = @"Unknown error";
  if (a2) {
    int v3 = @"file URL is empty. Are the devices paired?";
  }
  if (a1) {
    int v3 = a1;
  }
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Error storing sync supported app list. %@", (uint8_t *)&v4, 0xCu);
}

@end