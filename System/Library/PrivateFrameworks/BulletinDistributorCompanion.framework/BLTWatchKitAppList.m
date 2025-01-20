@interface BLTWatchKitAppList
- (BLTWatchKitAppList)init;
- (BLTWatchKitAppListDelegate)delegate;
- (BOOL)isLoaded;
- (id)watchKitAppDefinitionWithBundleID:(id)a3;
- (void)_fetchWatchKitInfo;
- (void)_fetchWatchKitInfoWithForce:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)fetchWatchKitInfoWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLoaded:(BOOL)a3;
@end

@implementation BLTWatchKitAppList

- (BLTWatchKitAppList)init
{
  v7.receiver = self;
  v7.super_class = (Class)BLTWatchKitAppList;
  v2 = [(BLTWatchKitAppList *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    loadingCompletionHandlers = v2->_loadingCompletionHandlers;
    v2->_loadingCompletionHandlers = (NSMutableArray *)v3;

    pthread_mutex_init(&v2->_lock, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)ApplicationsChanged, (CFStringRef)*MEMORY[0x263F1F340], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F1F340], 0);
  pthread_mutex_destroy(&self->_lock);
  v4.receiver = self;
  v4.super_class = (Class)BLTWatchKitAppList;
  [(BLTWatchKitAppList *)&v4 dealloc];
}

- (id)watchKitAppDefinitionWithBundleID:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    pthread_mutex_lock(p_lock);
    v6 = [(NSDictionary *)self->_appsByAppBundleID objectForKeyedSubscript:v5];

    pthread_mutex_unlock(p_lock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_fetchWatchKitInfoWithForce:(BOOL)a3 completion:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_super v7 = +[BLTTransaction transactionWithDescription:@"BLTWatchKitAppList _fetchWatchKitInfoWithForce:completion:"];
  if (!a3)
  {
    pthread_mutex_lock(&self->_lock);
    if (v6)
    {
      loadingCompletionHandlers = self->_loadingCompletionHandlers;
      v9 = (void *)[v6 copy];
      [(NSMutableArray *)loadingCompletionHandlers addObject:v9];
    }
    if (self->_loading)
    {
      pthread_mutex_unlock(&self->_lock);
      goto LABEL_10;
    }
    self->_loading = 1;
    pthread_mutex_unlock(&self->_lock);
  }
  v10 = [MEMORY[0x263EFF9A0] dictionary];
  v25 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
  v11 = objc_msgSend(MEMORY[0x263F57730], "blt_boundedWaitForActivePairedDevice");
  v12 = blt_general_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v11 valueForProperty:*MEMORY[0x263F57620]];
    *(_DWORD *)buf = 134218242;
    v41 = v11;
    __int16 v42 = 2112;
    v43 = v13;
    _os_log_impl(&dword_222F4C000, v12, OS_LOG_TYPE_DEFAULT, "Fetching apps for paired device %p id: %@", buf, 0x16u);
  }
  v14 = [MEMORY[0x263EFF9C0] set];
  pthread_mutex_lock(&self->_lock);
  appsByAppBundleID = self->_appsByAppBundleID;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke;
  v38[3] = &unk_264684020;
  id v16 = v14;
  id v39 = v16;
  [(NSDictionary *)appsByAppBundleID enumerateKeysAndObjectsUsingBlock:v38];
  pthread_mutex_unlock(&self->_lock);
  v17 = [MEMORY[0x263EFF9C0] set];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2;
  v30[3] = &unk_264684070;
  id v18 = v10;
  id v31 = v18;
  v32 = self;
  BOOL v37 = a3;
  id v36 = v6;
  id v19 = v17;
  id v33 = v19;
  id v34 = v16;
  id v35 = v7;
  id v20 = v16;
  v21 = (void *)MEMORY[0x223CAC810](v30);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2_36;
  v26[3] = &unk_264684098;
  id v28 = v19;
  id v29 = v21;
  id v27 = v18;
  id v22 = v19;
  id v23 = v18;
  id v24 = v21;
  [v25 enumerateLocallyAvailableApplicationsForPairedDevice:v11 options:0 withBlock:v26];

LABEL_10:
}

void __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isInstalled]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = blt_general_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) allKeys];
    *(_DWORD *)buf = 134217984;
    uint64_t v27 = [v3 count];
    _os_log_impl(&dword_222F4C000, v2, OS_LOG_TYPE_DEFAULT, "Fetched watchkit apps count: %lu", buf, 0xCu);
  }
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 40) + 16));
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 8), *(id *)(a1 + 32));
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 40) + 16));
  [*(id *)(a1 + 40) setLoaded:1];
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v4 = *(void *)(a1 + 72);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }
  }
  else
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 40) + 16));
    id v5 = (void *)[*(id *)(*(void *)(a1 + 40) + 80) copy];
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = *(void **)(v7 + 80);
    *(void *)(v7 + 80) = v6;

    *(unsigned char *)(*(void *)(a1 + 40) + 88) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 40) + 16));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * i) + 16))();
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }
  }
  v14 = (void *)[*(id *)(a1 + 48) mutableCopy];
  [v14 minusSet:*(void *)(a1 + 56)];
  v15 = (void *)[*(id *)(a1 + 56) mutableCopy];
  [v15 minusSet:*(void *)(a1 + 48)];
  if ([v15 count] || objc_msgSend(v14, "count"))
  {
    id v16 = BLTWorkQueue();
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_34;
    v17[3] = &unk_264684048;
    v17[4] = *(void *)(a1 + 40);
    id v18 = v14;
    id v19 = v15;
    id v20 = *(id *)(a1 + 64);
    dispatch_async(v16, v17);
  }
}

void __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) allObjects];
  uint64_t v4 = [*(id *)(a1 + 48) allObjects];
  [WeakRetained watchKitAppList:v2 added:v3 removed:v4];
}

uint64_t __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2_36(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = blt_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2_36_cold_1((uint64_t)v6, v7);
    }
  }
  if (v5)
  {
    if ([v5 applicationType] == 2)
    {
      v8 = [v5 bundleIdentifier];
      id v9 = [v5 counterpartIdentifiers];
      uint64_t v10 = [v9 firstObject];

      uint64_t v11 = [v5 deviceStatus];
      uint64_t v12 = [v11 installStatus];

      v13 = -[BLTWatchKitAppDefinition initWithContainerBundleID:watchKitAppBundleID:isInstalled:runsIndependently:]([BLTWatchKitAppDefinition alloc], "initWithContainerBundleID:watchKitAppBundleID:isInstalled:runsIndependently:", v10, v8, v12 == 2, [v5 applicationMode] == 2);
      [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v10];
      if ([(BLTWatchKitAppDefinition *)v13 isInstalled]) {
        [*(id *)(a1 + 40) addObject:v10];
      }
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

  return 1;
}

- (void)fetchWatchKitInfoWithCompletion:(id)a3
{
}

- (void)_fetchWatchKitInfo
{
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (BLTWatchKitAppListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTWatchKitAppListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_appsByAppBundleID, 0);
}

void __61__BLTWatchKitAppList__fetchWatchKitInfoWithForce_completion___block_invoke_2_36_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Error enumerating WatchKit apps: %@", (uint8_t *)&v2, 0xCu);
}

@end