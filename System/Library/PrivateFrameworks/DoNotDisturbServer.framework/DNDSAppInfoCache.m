@interface DNDSAppInfoCache
+ (id)_fallbackAppInfoByBundleIdentifier;
- (DNDSAppInfoCache)initWithKeybag:(id)a3;
- (id)_cacheURL;
- (id)_fallbackAppInfoForBundleIdentifier:(id)a3;
- (id)_installedBundleIdentifiers;
- (id)_parseAppStoreResponseForBundleIdentifiers:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6;
- (id)_queue_bundleIdentifiersWithMissingInfo;
- (id)_sanitizeAppInfo:(id)a3;
- (id)appInfoForBundleIdentifier:(id)a3;
- (id)appInfoForBundleIdentifiers:(id)a3;
- (void)_fetchAppStoreInfoForBundleIdentifiers:(id)a3 timeoutInterval:(double)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)_fetchIconForAppInfo:(id)a3 timeoutInterval:(double)a4 completionHandler:(id)a5;
- (void)_fetchIconsForAppInfo:(id)a3 timeoutInterval:(double)a4 completionHandler:(id)a5;
- (void)_queue_fetchMissingAppInfo;
- (void)_queue_monitorBundleIdentifiers:(id)a3;
- (void)_queue_read;
- (void)_queue_removeCachedDataForAppInfo:(id)a3;
- (void)_queue_removeUnusedAppInfo;
- (void)_queue_write;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)keybagDidUnlockForTheFirstTime:(id)a3;
- (void)monitorApplicationIdentifiers:(id)a3;
@end

@implementation DNDSAppInfoCache

- (DNDSAppInfoCache)initWithKeybag:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DNDSAppInfoCache;
  v6 = [(DNDSAppInfoCache *)&v23 init];
  if (v6)
  {
    uint64_t v7 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.server.AppInfoCache"];
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    inflightBundleIdentifiers = v6->_inflightBundleIdentifiers;
    v6->_inflightBundleIdentifiers = (NSMutableSet *)v9;

    v11 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    v12 = [MEMORY[0x1E4F29078] sharedURLCache];
    [v11 setURLCache:v12];

    [v11 setRequestCachePolicy:2];
    [v11 setHTTPShouldUsePipelining:1];
    v13 = objc_opt_new();
    [v13 setName:@"com.apple.donotdisturb.iconcache"];
    [v13 setUnderlyingQueue:v6->_queue];
    uint64_t v14 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v11 delegate:0 delegateQueue:v13];
    urlSession = v6->_urlSession;
    v6->_urlSession = (NSURLSession *)v14;

    v16 = v6->_urlSession;
    v17 = [v13 name];
    [(NSURLSession *)v16 setSessionDescription:v17];

    objc_storeStrong((id *)&v6->_keybag, a3);
    [(DNDSKeybagStateProviding *)v6->_keybag addObserver:v6];
    v18 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v18 addObserver:v6];

    v19 = v6->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__DNDSAppInfoCache_initWithKeybag___block_invoke;
    block[3] = &unk_1E6973540;
    v22 = v6;
    dispatch_async(v19, block);
  }
  return v6;
}

uint64_t __35__DNDSAppInfoCache_initWithKeybag___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_read");
}

- (void)monitorApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__DNDSAppInfoCache_monitorApplicationIdentifiers___block_invoke;
  v7[3] = &unk_1E69735B8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__DNDSAppInfoCache_monitorApplicationIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA80] set];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "bundleID", (void)v9);
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "_queue_monitorBundleIdentifiers:", v2);
}

- (id)appInfoForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__DNDSAppInfoCache_appInfoForBundleIdentifier___block_invoke;
  block[3] = &unk_1E6974340;
  id v10 = v4;
  long long v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __47__DNDSAppInfoCache_appInfoForBundleIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = (void *)a1[4];
  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    objc_msgSend(v5, "_sanitizeAppInfo:");
  }
  else {
  uint64_t v6 = [v5 _fallbackAppInfoForBundleIdentifier:a1[5]];
  }
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = a1[4];
  id v10 = *(NSObject **)(v9 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__DNDSAppInfoCache_appInfoForBundleIdentifier___block_invoke_2;
  block[3] = &unk_1E6973540;
  void block[4] = v9;
  dispatch_async(v10, block);
}

uint64_t __47__DNDSAppInfoCache_appInfoForBundleIdentifier___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_monitorBundleIdentifiers:", *(void *)(*(void *)(a1 + 32) + 8));
}

- (id)appInfoForBundleIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__DNDSAppInfoCache_appInfoForBundleIdentifiers___block_invoke;
  block[3] = &unk_1E69734A0;
  id v13 = v4;
  uint64_t v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  dispatch_sync(queue, block);
  uint64_t v9 = v15;
  id v10 = v7;

  return v10;
}

void __48__DNDSAppInfoCache_appInfoForBundleIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v8 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v7];
        uint64_t v9 = *(void **)(a1 + 40);
        if (v8)
        {
          id v10 = [v9 _sanitizeAppInfo:v8];
        }
        else
        {
          id v10 = [v9 _fallbackAppInfoForBundleIdentifier:v7];
        }
        [*(id *)(a1 + 48) setObject:v10 forKeyedSubscript:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(NSObject **)(v11 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__DNDSAppInfoCache_appInfoForBundleIdentifiers___block_invoke_2;
  block[3] = &unk_1E6973540;
  void block[4] = v11;
  dispatch_async(v12, block);
}

uint64_t __48__DNDSAppInfoCache_appInfoForBundleIdentifiers___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_monitorBundleIdentifiers:", *(void *)(*(void *)(a1 + 32) + 8));
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__DNDSAppInfoCache_keybagDidUnlockForTheFirstTime___block_invoke;
  block[3] = &unk_1E6973540;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __51__DNDSAppInfoCache_keybagDidUnlockForTheFirstTime___block_invoke(uint64_t a1)
{
  id v3 = *(id *)(*(void *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 32), "_queue_read");
  id v2 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_monitorBundleIdentifiers:", v3);
    id v2 = v3;
  }
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v4 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "App was installed", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__DNDSAppInfoCache_applicationsDidInstall___block_invoke;
  block[3] = &unk_1E6973540;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __43__DNDSAppInfoCache_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_monitorBundleIdentifiers:", *(void *)(*(void *)(a1 + 32) + 8));
}

- (void)applicationsDidUninstall:(id)a3
{
  uint64_t v4 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "App was removed", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__DNDSAppInfoCache_applicationsDidUninstall___block_invoke;
  block[3] = &unk_1E6973540;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__DNDSAppInfoCache_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_monitorBundleIdentifiers:", *(void *)(*(void *)(a1 + 32) + 8));
}

- (id)_cacheURL
{
  v7[5] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = BSCurrentUserDirectory();
  v7[0] = v3;
  v7[1] = @"Library";
  v7[2] = @"DoNotDisturb";
  v7[3] = @"DB";
  void v7[4] = @"IconCache";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  uint64_t v5 = [v2 fileURLWithPathComponents:v4];

  return v5;
}

- (void)_queue_write
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to serialize metadata store: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_queue_read
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    appInfoByBundleIdentifier = self->_appInfoByBundleIdentifier;
    self->_appInfoByBundleIdentifier = v3;

    objc_super v23 = [(DNDSAppInfoCache *)self _cacheURL];
    v22 = [v23 URLByAppendingPathComponent:@"AppInfoMetadata.plist"];
    v21 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfURL:");
    uint64_t v5 = [v21 objectForKeyedSubscript:@"appInfo"];
    uint8_t v6 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:3 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = (void *)[MEMORY[0x1E4F5F588] newWithDictionaryRepresentation:*(void *)(*((void *)&v24 + 1) + 8 * i) context:v6];
          id v13 = [v12 applicationIdentifier];
          long long v14 = [v13 bundleID];

          [(NSMutableDictionary *)self->_appInfoByBundleIdentifier setObject:v12 forKeyedSubscript:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    long long v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = [v21 objectForKeyedSubscript:@"monitoredBundleIdentifiers"];
    long long v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = MEMORY[0x1E4F1CBF0];
    }
    uint64_t v19 = [v15 setWithArray:v18];

    [(DNDSAppInfoCache *)self _queue_monitorBundleIdentifiers:v19];
  }
  else
  {
    v20 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Will not read cache as keybag is locked", buf, 2u);
    }
  }
}

- (void)_fetchAppStoreInfoForBundleIdentifiers:(id)a3 timeoutInterval:(double)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot])
  {
    if ([v10 count])
    {
      uint64_t v12 = [MEMORY[0x1E4F29088] componentsWithString:@"https://itunes.apple.com/lookup"];
      id v13 = (void *)MEMORY[0x1E4F290C8];
      long long v14 = [v10 allObjects];
      long long v15 = [v14 componentsJoinedByString:@","];
      uint64_t v16 = [v13 queryItemWithName:@"bundleId" value:v15];

      long long v17 = (void *)MEMORY[0x1E4F290C8];
      uint64_t v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v19 = [v18 countryCode];
      v20 = [v17 queryItemWithName:@"country" value:v19];

      v21 = [MEMORY[0x1E4F290C8] queryItemWithName:@"entity" value:@"software,iPadSoftware,macSoftware"];
      v22 = (void *)MEMORY[0x1E4F290C8];
      objc_super v23 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a5);
      long long v24 = [v22 queryItemWithName:@"limit" value:v23];

      v37[0] = v16;
      v37[1] = v20;
      v37[2] = v21;
      v37[3] = v24;
      long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
      [v12 setQueryItems:v25];

      objc_initWeak(&location, self);
      long long v26 = (void *)MEMORY[0x1E4F290D0];
      long long v27 = [v12 URL];
      if (a4 <= 0.0) {
        [v26 requestWithURL:v27];
      }
      else {
      v29 = [v26 requestWithURL:v27 cachePolicy:2 timeoutInterval:a4];
      }

      urlSession = self->_urlSession;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __99__DNDSAppInfoCache__fetchAppStoreInfoForBundleIdentifiers_timeoutInterval_limit_completionHandler___block_invoke;
      v32[3] = &unk_1E6974A60;
      objc_copyWeak(&v35, &location);
      id v33 = v10;
      id v34 = v11;
      v31 = [(NSURLSession *)urlSession dataTaskWithRequest:v29 completionHandler:v32];
      [v31 resume];

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v28 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location) = 0;
      _os_log_impl(&dword_1D3052000, v28, OS_LOG_TYPE_DEFAULT, "Will not fetch app info as keybag is locked", (uint8_t *)&location, 2u);
    }
  }
}

void __99__DNDSAppInfoCache__fetchAppStoreInfoForBundleIdentifiers_timeoutInterval_limit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = (id *)(a1 + 48);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  id v11 = [WeakRetained _parseAppStoreResponseForBundleIdentifiers:*(void *)(a1 + 32) response:v9 data:v10 error:v8];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_fetchIconsForAppInfo:(id)a3 timeoutInterval:(double)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v21 = a5;
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  id v10 = dispatch_group_create();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * v15);
        dispatch_group_enter(v10);
        long long v17 = [v11 objectForKeyedSubscript:v16];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __76__DNDSAppInfoCache__fetchIconsForAppInfo_timeoutInterval_completionHandler___block_invoke;
        v25[3] = &unk_1E6974A88;
        id v26 = v9;
        uint64_t v27 = v16;
        v28 = v10;
        [(DNDSAppInfoCache *)self _fetchIconForAppInfo:v17 timeoutInterval:v25 completionHandler:a4];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__DNDSAppInfoCache__fetchIconsForAppInfo_timeoutInterval_completionHandler___block_invoke_2;
  block[3] = &unk_1E6974AB0;
  id v23 = v9;
  id v24 = v21;
  id v19 = v9;
  id v20 = v21;
  dispatch_group_notify(v10, queue, block);
}

void __76__DNDSAppInfoCache__fetchIconsForAppInfo_timeoutInterval_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v3);
}

uint64_t __76__DNDSAppInfoCache__fetchIconsForAppInfo_timeoutInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_fetchIconForAppInfo:(id)a3 timeoutInterval:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)[v8 mutableCopy];
  id v11 = [v10 storeIconURL];

  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F290D0];
    uint64_t v13 = [v8 storeIconURL];
    if (a4 <= 0.0) {
      [v12 requestWithURL:v13];
    }
    else {
    id v16 = [v12 requestWithURL:v13 cachePolicy:2 timeoutInterval:a4];
    }

    urlSession = self->_urlSession;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __75__DNDSAppInfoCache__fetchIconForAppInfo_timeoutInterval_completionHandler___block_invoke;
    v23[3] = &unk_1E6974AD8;
    id v24 = v8;
    long long v25 = self;
    id v26 = v10;
    id v27 = v9;
    id v17 = v9;
    id v15 = v10;
    id v19 = [(NSURLSession *)urlSession downloadTaskWithRequest:v16 completionHandler:v23];
    [v19 resume];
  }
  else
  {
    queue = self->_queue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__DNDSAppInfoCache__fetchIconForAppInfo_timeoutInterval_completionHandler___block_invoke_78;
    v20[3] = &unk_1E6974AB0;
    id v21 = v10;
    id v22 = v9;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(queue, v20);

    id v17 = v22;
  }
}

void __75__DNDSAppInfoCache__fetchIconForAppInfo_timeoutInterval_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (!a4)
  {
    id v7 = [*(id *)(a1 + 32) storeIconURL];
    id v8 = [v7 pathExtension];

    id v9 = NSString;
    id v10 = [*(id *)(a1 + 32) applicationIdentifier];
    id v11 = [v10 bundleID];
    uint64_t v12 = NSNumber;
    uint64_t v13 = [*(id *)(a1 + 32) applicationIdentifier];
    uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "platform"));
    id v15 = [v9 stringWithFormat:@"%@_%@.%@", v11, v14, v8];

    id v16 = [*(id *)(a1 + 40) _cacheURL];
    id v17 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v18 = [v16 path];
    v38[0] = v18;
    v38[1] = v15;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    id v20 = [v17 fileURLWithPathComponents:v19];

    id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v31 = 0;
    [v21 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v31];
    id v22 = v31;

    if (v22)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
        -[DNDSAppInfoCache _queue_write]();
      }
      id v23 = 0;
    }
    else
    {
      id v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v24 removeItemAtURL:v20 error:0];

      long long v25 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v30 = 0;
      [v25 copyItemAtURL:v6 toURL:v20 error:&v30];
      id v23 = v30;

      if (v23)
      {
        id v26 = (void *)DNDSLogGeneral;
        if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
        {
          id v27 = *(void **)(a1 + 32);
          v28 = v26;
          long long v29 = [v27 applicationIdentifier];
          *(_DWORD *)buf = 138478339;
          id v33 = v29;
          __int16 v34 = 2113;
          id v35 = v20;
          __int16 v36 = 2114;
          id v37 = v23;
          _os_log_error_impl(&dword_1D3052000, v28, OS_LOG_TYPE_ERROR, "Could not copy icon for %{private}@ to %{private}@: %{public}@", buf, 0x20u);
        }
      }
      else
      {
        [*(id *)(a1 + 48) setCachedIconURL:v20];
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __75__DNDSAppInfoCache__fetchIconForAppInfo_timeoutInterval_completionHandler___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_parseAppStoreResponseForBundleIdentifiers:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  if (!v11 || v12)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
      -[DNDSAppInfoCache _parseAppStoreResponseForBundleIdentifiers:response:data:error:]();
    }
    id v42 = 0;
  }
  else
  {
    id v49 = 0;
    uint64_t v14 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:0 error:&v49];
    id v15 = v49;
    id v16 = v15;
    if (v14)
    {
      id v37 = v15;
      id v39 = v11;
      id v40 = v10;
      id v41 = v9;
      id v42 = [MEMORY[0x1E4F1CA60] dictionary];
      v38 = v14;
      objc_msgSend(v14, "bs_safeArrayForKey:", @"results");
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      if (!v17) {
        goto LABEL_30;
      }
      uint64_t v18 = v17;
      id v19 = @"bundleId";
      uint64_t v44 = *(void *)v46;
      while (1)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v46 != v44) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v22 = objc_msgSend(v21, "bs_safeStringForKey:", v19);
          id v23 = objc_msgSend(v21, "bs_safeStringForKey:", @"trackName");
          id v24 = objc_msgSend(v21, "bs_safeStringForKey:", @"artworkUrl100");
          long long v25 = objc_msgSend(v21, "bs_safeStringForKey:", @"kind");
          if (![v22 length])
          {
            uint64_t v27 = DNDSLogGeneral;
            if (!os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
              goto LABEL_28;
            }
            *(_DWORD *)buf = 138543362;
            v51 = v21;
            v28 = v27;
            long long v29 = "Unable to parse store response, bundle identifier is missing: %{public}@";
LABEL_18:
            _os_log_error_impl(&dword_1D3052000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);
            goto LABEL_28;
          }
          if (![v23 length])
          {
            uint64_t v30 = DNDSLogGeneral;
            if (!os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
              goto LABEL_28;
            }
            *(_DWORD *)buf = 138543362;
            v51 = v21;
            v28 = v30;
            long long v29 = "Unable to parse store response, display name is missing: %{public}@";
            goto LABEL_18;
          }
          if (([v25 isEqualToString:@"software"] & 1) != 0
            || ([v25 isEqualToString:@"ipad-software"] & 1) != 0)
          {
            uint64_t v26 = 1;
          }
          else if ([v25 isEqualToString:@"mac-software"])
          {
            uint64_t v26 = 2;
          }
          else
          {
            uint64_t v26 = 0;
          }
          id v31 = v19;
          long long v32 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v22 platform:v26];
          id v33 = objc_alloc_init(MEMORY[0x1E4F5F6C0]);
          [v33 setSource:2];
          [v33 setDisplayName:v23];
          [v33 setApplicationIdentifier:v32];
          if ([v24 length])
          {
            __int16 v34 = [MEMORY[0x1E4F1CB10] URLWithString:v24];
            [v33 setStoreIconURL:v34];
          }
          else
          {
            [v33 setStoreIconURL:0];
          }
          [v42 setObject:v33 forKeyedSubscript:v22];
          id v35 = DNDSLogGeneral;
          if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138478083;
            v51 = v22;
            __int16 v52 = 2113;
            id v53 = v33;
            _os_log_impl(&dword_1D3052000, v35, OS_LOG_TYPE_DEFAULT, "Got app %{private}@ details from the store: %{private}@", buf, 0x16u);
          }

          id v19 = v31;
LABEL_28:
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (!v18)
        {
LABEL_30:

          id v10 = v40;
          id v9 = v41;
          uint64_t v13 = 0;
          id v11 = v39;
          id v16 = v37;
          uint64_t v14 = v38;
          goto LABEL_37;
        }
      }
    }
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
      -[DNDSAppInfoCache _parseAppStoreResponseForBundleIdentifiers:response:data:error:]();
    }
    id v42 = 0;
LABEL_37:
  }
  return v42;
}

- (void)_queue_removeCachedDataForAppInfo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  appInfoByBundleIdentifier = self->_appInfoByBundleIdentifier;
  id v6 = [v4 applicationIdentifier];
  id v7 = [v6 bundleID];
  [(NSMutableDictionary *)appInfoByBundleIdentifier setObject:0 forKeyedSubscript:v7];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [v4 cachedIconURL];
  id v14 = 0;
  [v8 removeItemAtURL:v9 error:&v14];
  id v10 = v14;

  id v11 = (void *)DNDSLogGeneral;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR)) {
      [(DNDSAppInfoCache *)v11 _queue_removeCachedDataForAppInfo:(uint64_t)v10];
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    uint64_t v13 = [v4 applicationIdentifier];
    *(_DWORD *)buf = 138477827;
    id v16 = v13;
    _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "Cleaned up %{private}@", buf, 0xCu);
  }
}

- (void)_queue_removeUnusedAppInfo
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(NSMutableDictionary *)self->_appInfoByBundleIdentifier allKeys];
  uint64_t v5 = [v3 setWithArray:v4];

  id v6 = (void *)[v5 mutableCopy];
  [v6 minusSet:self->_relevantBundleIdentifiers];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_appInfoByBundleIdentifier, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
        [(DNDSAppInfoCache *)self _queue_removeCachedDataForAppInfo:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_queue_monitorBundleIdentifiers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSSet *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    long long v13 = v5;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "Monitoring bundle identifiers: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  monitoredBundleIdentifiers = self->_monitoredBundleIdentifiers;
  if (monitoredBundleIdentifiers == v5)
  {
    int v8 = 0;
  }
  else
  {
    int v8 = 1;
    if (v5 && monitoredBundleIdentifiers) {
      int v8 = [(NSSet *)monitoredBundleIdentifiers isEqual:v5] ^ 1;
    }
  }
  objc_storeStrong((id *)&self->_monitoredBundleIdentifiers, a3);
  uint64_t v9 = [(DNDSAppInfoCache *)self _installedBundleIdentifiers];
  uint64_t v10 = (NSSet *)[(NSSet *)v5 mutableCopy];
  [(NSSet *)v10 minusSet:v9];
  objc_storeStrong((id *)&self->_relevantBundleIdentifiers, v10);
  uint64_t v11 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    long long v13 = v10;
    _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Relevant bundle identifiers: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  [(DNDSAppInfoCache *)self _queue_removeUnusedAppInfo];
  if ([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot])
  {
    if (v8) {
      [(DNDSAppInfoCache *)self _queue_write];
    }
    [(DNDSAppInfoCache *)self _queue_fetchMissingAppInfo];
  }
}

- (id)_queue_bundleIdentifiersWithMissingInfo
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_relevantBundleIdentifiers;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_appInfoByBundleIdentifier, "objectForKeyedSubscript:", v9, (void)v14);
        uint64_t v11 = v10;
        if (!v10
          || ([v10 cachedIconURL],
              int v12 = objc_claimAutoreleasedReturnValue(),
              v12,
              !v12))
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_queue_fetchMissingAppInfo
{
  uint64_t v3 = [(DNDSAppInfoCache *)self _queue_bundleIdentifiersWithMissingInfo];
  id v4 = [v3 allObjects];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke;
  v5[3] = &unk_1E6974B28;
  v5[4] = self;
  [v4 enumerateBatchesOfSize:50 handler:v5];
}

void __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] setWithArray:a2];
  [v3 minusSet:*(void *)(*(void *)(a1 + 32) + 24)];
  [*(id *)(*(void *)(a1 + 32) + 24) unionSet:v3];
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke_2;
  v6[3] = &unk_1E6974B00;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 _fetchAppStoreInfoForBundleIdentifiers:v5 timeoutInterval:50 limit:v6 completionHandler:10.0];
}

void __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke_3;
  v4[3] = &unk_1E6974B00;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  [v3 _fetchIconsForAppInfo:a2 timeoutInterval:v4 completionHandler:10.0];
}

void __46__DNDSAppInfoCache__queue_fetchMissingAppInfo__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 48));
  [*(id *)(*(void *)(a1 + 32) + 24) minusSet:*(void *)(a1 + 40)];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        int v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "containsObject:", v9, (void)v13);
        uint64_t v11 = [v4 objectForKeyedSubscript:v9];
        int v12 = *(id **)(a1 + 32);
        if (v10) {
          [v12[4] setObject:v11 forKeyedSubscript:v9];
        }
        else {
          objc_msgSend(v12, "_queue_removeCachedDataForAppInfo:", v11);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_write");
}

- (id)_installedBundleIdentifiers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  id v3 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) bundleIdentifier];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)_sanitizeAppInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 applicationIdentifier];
  uint64_t v6 = [v5 bundleID];
  uint64_t v7 = [(DNDSAppInfoCache *)self _fallbackAppInfoForBundleIdentifier:v6];

  if (v7)
  {
    int v8 = (void *)[v4 mutableCopy];
    uint64_t v9 = [v7 displayName];
    [v8 setDisplayName:v9];

    id v10 = (id)[v8 copy];
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

- (id)_fallbackAppInfoForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _fallbackAppInfoByBundleIdentifier];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

+ (id)_fallbackAppInfoByBundleIdentifier
{
  if (_fallbackAppInfoByBundleIdentifier_fallbackAppInfoByBundleIdentifierOnceToken != -1) {
    dispatch_once(&_fallbackAppInfoByBundleIdentifier_fallbackAppInfoByBundleIdentifierOnceToken, &__block_literal_global_20);
  }
  uint64_t v2 = (void *)_fallbackAppInfoByBundleIdentifier___fallbackAppInfoByBundleIdentifier;
  return v2;
}

void __54__DNDSAppInfoCache__fallbackAppInfoByBundleIdentifier__block_invoke()
{
  v66[21] = *MEMORY[0x1E4F143B8];
  v65[0] = @"com.apple.NanoStopwatch";
  id v0 = objc_alloc(MEMORY[0x1E4F5F588]);
  v64 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.NanoStopwatch" platform:3];
  v63 = (void *)[v0 initWithSource:0 applicationIdentifier:v64 displayName:@"APP_NAME_STOPWATCH" storeIconURL:0 cachedIconURL:0];
  v66[0] = v63;
  v65[1] = @"com.apple.NanoMenstrualCycles";
  id v1 = objc_alloc(MEMORY[0x1E4F5F588]);
  v62 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.NanoMenstrualCycles" platform:3];
  v61 = (void *)[v1 initWithSource:0 applicationIdentifier:v62 displayName:@"APP_NAME_CYCLE_TRACKING" storeIconURL:0 cachedIconURL:0];
  v66[1] = v61;
  v65[2] = @"com.apple.watchmemojieditor";
  id v2 = objc_alloc(MEMORY[0x1E4F5F588]);
  v60 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.watchmemojieditor" platform:3];
  v59 = (void *)[v2 initWithSource:0 applicationIdentifier:v60 displayName:@"APP_NAME_MEMOJI" storeIconURL:0 cachedIconURL:0];
  v66[2] = v59;
  v65[3] = @"com.apple.NanoHeartRhythm";
  id v3 = objc_alloc(MEMORY[0x1E4F5F588]);
  v58 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.NanoHeartRhythm" platform:3];
  v57 = (void *)[v3 initWithSource:0 applicationIdentifier:v58 displayName:@"APP_NAME_ECG" storeIconURL:0 cachedIconURL:0];
  v66[3] = v57;
  v65[4] = @"com.apple.private.NanoTimer";
  id v4 = objc_alloc(MEMORY[0x1E4F5F588]);
  v56 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.private.NanoTimer" platform:3];
  uint64_t v55 = (void *)[v4 initWithSource:0 applicationIdentifier:v56 displayName:@"APP_NAME_TIMER" storeIconURL:0 cachedIconURL:0];
  v66[4] = v55;
  v65[5] = @"com.apple.NanoOxygenSaturation.watchkitapp";
  id v5 = objc_alloc(MEMORY[0x1E4F5F588]);
  v54 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.NanoOxygenSaturation.watchkitapp" platform:3];
  id v53 = (void *)[v5 initWithSource:0 applicationIdentifier:v54 displayName:@"APP_NAME_BLOOD_OXYGEN" storeIconURL:0 cachedIconURL:0];
  v66[5] = v53;
  v65[6] = @"com.apple.NanoAlarm";
  id v6 = objc_alloc(MEMORY[0x1E4F5F588]);
  __int16 v52 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.NanoAlarm" platform:3];
  v51 = (void *)[v6 initWithSource:0 applicationIdentifier:v52 displayName:@"APP_NAME_ALARMS" storeIconURL:0 cachedIconURL:0];
  v66[6] = v51;
  v65[7] = @"com.apple.NanoTips";
  id v7 = objc_alloc(MEMORY[0x1E4F5F588]);
  v50 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.NanoTips" platform:3];
  id v49 = (void *)[v7 initWithSource:0 applicationIdentifier:v50 displayName:@"APP_NAME_TIPS" storeIconURL:0 cachedIconURL:0];
  v66[7] = v49;
  v65[8] = @"com.apple.NanoSleep.watchkitapp";
  id v8 = objc_alloc(MEMORY[0x1E4F5F588]);
  long long v48 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.NanoSleep.watchkitapp" platform:3];
  long long v47 = (void *)[v8 initWithSource:0 applicationIdentifier:v48 displayName:@"APP_NAME_SLEEP" storeIconURL:0 cachedIconURL:0];
  v66[8] = v47;
  v65[9] = @"com.apple.Mind";
  id v9 = objc_alloc(MEMORY[0x1E4F5F588]);
  long long v46 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.Mind" platform:3];
  long long v45 = (void *)[v9 initWithSource:0 applicationIdentifier:v46 displayName:@"APP_NAME_MINDFULNESS" storeIconURL:0 cachedIconURL:0];
  v66[9] = v45;
  v65[10] = @"com.apple.NanoNowPlaying";
  id v10 = objc_alloc(MEMORY[0x1E4F5F588]);
  uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.NanoNowPlaying" platform:3];
  v43 = (void *)[v10 initWithSource:0 applicationIdentifier:v44 displayName:@"APP_NAME_NOW_PLAYING" storeIconURL:0 cachedIconURL:0];
  v66[10] = v43;
  v65[11] = @"com.apple.Noise";
  id v11 = objc_alloc(MEMORY[0x1E4F5F588]);
  id v42 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.Noise" platform:3];
  id v41 = (void *)[v11 initWithSource:0 applicationIdentifier:v42 displayName:@"APP_NAME_NOISE" storeIconURL:0 cachedIconURL:0];
  v66[11] = v41;
  v65[12] = @"com.apple.NanoRemote";
  id v12 = objc_alloc(MEMORY[0x1E4F5F588]);
  id v40 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.NanoRemote" platform:3];
  id v39 = (void *)[v12 initWithSource:0 applicationIdentifier:v40 displayName:@"APP_NAME_REMOTE" storeIconURL:0 cachedIconURL:0];
  v66[12] = v39;
  v65[13] = @"com.apple.HeartRate";
  id v13 = objc_alloc(MEMORY[0x1E4F5F588]);
  v38 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.HeartRate" platform:3];
  id v37 = (void *)[v13 initWithSource:0 applicationIdentifier:v38 displayName:@"APP_NAME_HEART_RATE" storeIconURL:0 cachedIconURL:0];
  v66[13] = v37;
  v65[14] = @"com.apple.MobileStore";
  id v14 = objc_alloc(MEMORY[0x1E4F5F588]);
  __int16 v36 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.MobileStore" platform:1];
  id v35 = (void *)[v14 initWithSource:0 applicationIdentifier:v36 displayName:@"APP_NAME_ITUNES_STORE" storeIconURL:0 cachedIconURL:0];
  v66[14] = v35;
  v65[15] = @"com.apple.Health";
  id v15 = objc_alloc(MEMORY[0x1E4F5F588]);
  __int16 v34 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.Health" platform:1];
  id v33 = (void *)[v15 initWithSource:0 applicationIdentifier:v34 displayName:@"APP_NAME_HEALTH" storeIconURL:0 cachedIconURL:0];
  v66[15] = v33;
  v65[16] = @"com.apple.Bridge";
  id v16 = objc_alloc(MEMORY[0x1E4F5F588]);
  long long v32 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.Bridge" platform:1];
  long long v17 = (void *)[v16 initWithSource:0 applicationIdentifier:v32 displayName:@"APP_NAME_WATCH" storeIconURL:0 cachedIconURL:0];
  v66[16] = v17;
  v65[17] = @"com.apple.Passbook";
  id v18 = objc_alloc(MEMORY[0x1E4F5F588]);
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.Passbook" platform:1];
  id v20 = (void *)[v18 initWithSource:0 applicationIdentifier:v19 displayName:@"APP_NAME_WALLET" storeIconURL:0 cachedIconURL:0];
  v66[17] = v20;
  v65[18] = @"com.apple.camera";
  id v21 = objc_alloc(MEMORY[0x1E4F5F588]);
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.camera" platform:1];
  id v23 = (void *)[v21 initWithSource:0 applicationIdentifier:v22 displayName:@"APP_NAME_CAMERA" storeIconURL:0 cachedIconURL:0];
  v66[18] = v23;
  v65[19] = @"com.apple.store.Jolly";
  id v24 = objc_alloc(MEMORY[0x1E4F5F588]);
  long long v25 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.store.Jolly" platform:1];
  uint64_t v26 = (void *)[v24 initWithSource:0 applicationIdentifier:v25 displayName:@"APP_NAME_APPLE_STORE" storeIconURL:0 cachedIconURL:0];
  v66[19] = v26;
  v65[20] = @"com.apple.mobilephone";
  id v27 = objc_alloc(MEMORY[0x1E4F5F588]);
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.mobilephone" platform:1];
  long long v29 = (void *)[v27 initWithSource:0 applicationIdentifier:v28 displayName:@"APP_NAME_PHONE" storeIconURL:0 cachedIconURL:0];
  v66[20] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:21];
  id v31 = (void *)_fallbackAppInfoByBundleIdentifier___fallbackAppInfoByBundleIdentifier;
  _fallbackAppInfoByBundleIdentifier___fallbackAppInfoByBundleIdentifier = v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_appInfoByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_inflightBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_relevantBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_monitoredBundleIdentifiers, 0);
}

- (void)_parseAppStoreResponseForBundleIdentifiers:response:data:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "App lookup of %{private}@ from store failed: %{public}@");
}

- (void)_queue_removeCachedDataForAppInfo:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = [a2 cachedIconURL];
  int v7 = 138478083;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_1D3052000, v5, OS_LOG_TYPE_ERROR, "Failed to removed cached icon at %{private}@: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end