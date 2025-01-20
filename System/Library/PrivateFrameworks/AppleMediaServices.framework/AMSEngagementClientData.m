@interface AMSEngagementClientData
+ (BOOL)_isDaemon;
+ (NSURL)clientDataURL;
+ (id)_fetchClientData;
+ (id)_sharedQueue;
+ (id)loadFromDisk;
+ (void)_registerNotifications;
+ (void)erase;
- (AMSEngagementClientData)initWithCacheObject:(id)a3;
- (BOOL)destination:(id)a3 allowsEvent:(id)a4;
- (NSMutableDictionary)apps;
- (NSString)lastSyncedBuild;
- (id)_appForIdentifier:(id)a3;
- (id)cachedResponseDataForEvent:(id)a3;
- (id)destinationsForEvent:(id)a3;
- (void)_enumerateAppsWithBlock:(id)a3;
- (void)_setApp:(id)a3 forIdentifier:(id)a4;
- (void)addCachedResponseData:(id)a3 cacheInfo:(id)a4 appIdentifier:(id)a5;
- (void)saveToDisk;
- (void)setAllowedEvents:(id)a3 appIdentifier:(id)a4;
- (void)setApps:(id)a3;
- (void)setLastSyncedBuild:(id)a3;
@end

@implementation AMSEngagementClientData

- (BOOL)destination:(id)a3 allowsEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v8 = [(id)objc_opt_class() _sharedQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__AMSEngagementClientData_destination_allowsEvent___block_invoke;
  v12[3] = &unk_1E55A2660;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

void __51__AMSEngagementClientData_destination_allowsEvent___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) apps];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = objc_msgSend(v3, "eventFilters", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) matchesEvent:*(void *)(a1 + 48)])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __48__AMSEngagementClientData_destinationsForEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v13 = a3;
  uint64_t v6 = [v13 eventFilters];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 matchesEvent:*(void *)(a1 + 32)])
        {
          if (!v9)
          {
            long long v9 = [[AMSEngagementDestination alloc] initWithIdentifier:v5];
            [(AMSEngagementDestination *)v9 setAllowsResponse:0];
            [(AMSEngagementDestination *)v9 setComponents:0];
            [*(id *)(a1 + 40) addObject:v9];
          }
          -[AMSEngagementDestination setAllowsResponse:](v9, "setAllowsResponse:", [v12 allowsResponse] | -[AMSEngagementDestination allowsResponse](v9, "allowsResponse"));
          -[AMSEngagementDestination setComponents:](v9, "setComponents:", -[AMSEngagementDestination components](v9, "components") | [v12 components]);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    long long v9 = 0;
  }
}

void __51__AMSEngagementClientData__enumerateAppsWithBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) apps];
  [v2 enumerateKeysAndObjectsUsingBlock:*(void *)(a1 + 40)];
}

- (NSMutableDictionary)apps
{
  return self->_apps;
}

- (id)destinationsForEvent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__AMSEngagementClientData_destinationsForEvent___block_invoke;
  v11[3] = &unk_1E55A2688;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [(AMSEngagementClientData *)self _enumerateAppsWithBlock:v11];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

- (void)_enumerateAppsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _sharedQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__AMSEngagementClientData__enumerateAppsWithBlock___block_invoke;
  v7[3] = &unk_1E559EAE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

+ (id)loadFromDisk
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__29;
  long long v11 = __Block_byref_object_dispose__29;
  id v12 = 0;
  v3 = [a1 _sharedQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__AMSEngagementClientData_loadFromDisk__block_invoke;
  v6[3] = &unk_1E55A1220;
  v6[4] = &v7;
  v6[5] = a1;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)_sharedQueue
{
  if (_MergedGlobals_103 != -1) {
    dispatch_once(&_MergedGlobals_103, &__block_literal_global_47);
  }
  id v2 = (void *)qword_1EB38D888;
  return v2;
}

- (NSString)lastSyncedBuild
{
  return self->_lastSyncedBuild;
}

- (id)cachedResponseDataForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__29;
  uint64_t v18 = __Block_byref_object_dispose__29;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __54__AMSEngagementClientData_cachedResponseDataForEvent___block_invoke;
  long long v11 = &unk_1E55A2638;
  id v5 = v4;
  id v12 = v5;
  id v13 = &v14;
  [(AMSEngagementClientData *)self _enumerateAppsWithBlock:&v8];
  id v6 = objc_msgSend((id)v15[5], "responseData", v8, v9, v10, v11);

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __54__AMSEngagementClientData_cachedResponseDataForEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(a3, "cachedResponses", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 matchesEvent:*(void *)(a1 + 32)])
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v11);
          *a4 = 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void __39__AMSEngagementClientData_loadFromDisk__block_invoke(uint64_t a1)
{
  id v2 = (void *)kSharedInstance;
  if (!kSharedInstance)
  {
    uint64_t v3 = [*(id *)(a1 + 40) _fetchClientData];
    id v4 = (void *)v3;
    id v5 = (void *)MEMORY[0x1E4F1CC08];
    if (v3) {
      id v5 = (void *)v3;
    }
    id v6 = v5;

    uint64_t v7 = [[AMSEngagementClientData alloc] initWithCacheObject:v6];
    uint64_t v8 = (void *)kSharedInstance;
    kSharedInstance = (uint64_t)v7;

    id v2 = (void *)kSharedInstance;
  }
  uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_storeStrong(v9, v2);
}

- (AMSEngagementClientData)initWithCacheObject:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSEngagementClientData;
  id v5 = [(AMSEngagementClientData *)&v18 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:@"lastSyncedBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }

    lastSyncedBuild = v5->_lastSyncedBuild;
    v5->_lastSyncedBuild = v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"apps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__AMSEngagementClientData_initWithCacheObject___block_invoke;
    v16[3] = &unk_1E55A0958;
    long long v12 = (NSMutableDictionary *)v11;
    uint64_t v17 = v12;
    [v10 enumerateKeysAndObjectsUsingBlock:v16];
    apps = v5->_apps;
    v5->_apps = v12;
    long long v14 = v12;

    +[AMSEngagementClientData _registerNotifications];
  }

  return v5;
}

+ (void)_registerNotifications
{
  if (!+[AMSEngagementClientData _isDaemon])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__AMSEngagementClientData__registerNotifications__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_registerNotifications_onceToken != -1) {
      dispatch_once(&_registerNotifications_onceToken, block);
    }
  }
}

+ (BOOL)_isDaemon
{
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v3 = [v2 processName];
  char v4 = [v3 isEqualToString:@"amsengagementd"];

  return v4;
}

+ (id)_fetchClientData
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 clientDataURL];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v2 path];
  char v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v22 = 0;
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:0 error:&v22];
    id v7 = v22;
    if (v7)
    {
      id v8 = v7;
      id v9 = +[AMSLogConfig sharedEngagementConfig];
      if (!v9)
      {
        id v9 = +[AMSLogConfig sharedConfig];
      }
      id v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = objc_opt_class();
        long long v12 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v24 = v11;
        __int16 v25 = 2114;
        v26 = v12;
        __int16 v27 = 2114;
        id v28 = v8;
        _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to lookup client data. %{public}@", buf, 0x20u);
      }
      id v13 = 0;
      goto LABEL_8;
    }
    if (v6)
    {
      id v21 = 0;
      uint64_t v16 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v21];
      id v8 = v21;
      id v9 = v16;
      objc_opt_class();
      id v13 = 0;
      if (objc_opt_isKindOfClass()) {
        id v13 = v9;
      }

      if (!v8) {
        goto LABEL_9;
      }
      id v10 = +[AMSLogConfig sharedEngagementConfig];
      if (!v10)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v17 = [v10 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = objc_opt_class();
        id v19 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v24 = v18;
        __int16 v25 = 2114;
        v26 = v19;
        __int16 v27 = 2114;
        id v28 = v8;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to decode client data. %{public}@", buf, 0x20u);
      }
LABEL_8:

LABEL_9:
      goto LABEL_25;
    }
    id v8 = 0;
  }
  else
  {
    id v8 = +[AMSLogConfig sharedEngagementConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v8 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      long long v15 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v14;
      __int16 v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No client data", buf, 0x16u);
    }
  }
  id v13 = 0;
LABEL_25:

  return v13;
}

void __47__AMSEngagementClientData_initWithCacheObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v12 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v12;
  }
  else {
    id v7 = 0;
  }

  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  uint64_t v10 = [v7 length];
  if (v9 && v10)
  {
    uint64_t v11 = [[AMSEngagementAppData alloc] initWithIdentifier:v7 cacheObject:v9];
    if (v11) {
      [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v7];
    }
  }
}

+ (NSURL)clientDataURL
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "ams_engagementDirectory");
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"clientData.txt"];

  return (NSURL *)v3;
}

void __49__AMSEngagementClientData__registerNotifications__block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v3 = *(const void **)(a1 + 32);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_handleClearCachesNotification, @"AMSEngagementClientDataChanged", 0, CFNotificationSuspensionBehaviorDrop);
}

void __39__AMSEngagementClientData__sharedQueue__block_invoke()
{
  id v2 = dispatch_get_global_queue(0, 0);
  dispatch_queue_t v0 = dispatch_queue_create_with_target_V2("com.apple.AMSEngagementClientData", 0, v2);
  v1 = (void *)qword_1EB38D888;
  qword_1EB38D888 = (uint64_t)v0;
}

- (void)addCachedResponseData:(id)a3 cacheInfo:(id)a4 appIdentifier:(id)a5
{
  id v15 = a5;
  id v8 = a4;
  id v9 = a3;
  +[AMSEngagementClientData _assertEngagementd];
  uint64_t v10 = [(AMSEngagementClientData *)self _appForIdentifier:v15];
  uint64_t v11 = (AMSEngagementAppData *)[v10 copy];

  if (!v11) {
    uint64_t v11 = [[AMSEngagementAppData alloc] initWithIdentifier:v15 cacheObject:0];
  }
  id v12 = [[AMSEngagementAppResponseModel alloc] initWithData:v9 cacheInfo:v8];

  if (v12)
  {
    id v13 = [(AMSEngagementAppData *)v11 cachedResponses];
    uint64_t v14 = [v13 arrayByAddingObject:v12];
    [(AMSEngagementAppData *)v11 setCachedResponses:v14];
  }
  [(AMSEngagementClientData *)self _setApp:v11 forIdentifier:v15];
}

- (void)setAllowedEvents:(id)a3 appIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  +[AMSEngagementClientData _assertEngagementd];
  id v8 = [(AMSEngagementClientData *)self _appForIdentifier:v7];
  id v9 = (AMSEngagementAppData *)[v8 copy];

  if (!v9) {
    id v9 = [[AMSEngagementAppData alloc] initWithIdentifier:v7 cacheObject:0];
  }
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
        uint64_t v17 = [AMSEngagementAppEventFilterModel alloc];
        uint64_t v18 = -[AMSEngagementAppEventFilterModel initWithDefinition:](v17, "initWithDefinition:", v16, (void)v19);
        if (v18) {
          [v10 addObject:v18];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  [(AMSEngagementAppData *)v9 setEventFilters:v10];
  [(AMSEngagementClientData *)self _setApp:v9 forIdentifier:v7];
}

+ (void)erase
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [a1 clientDataURL];
  id v13 = 0;
  char v5 = [v3 removeItemAtURL:v4 error:&v13];
  id v6 = v13;

  if ((v5 & 1) == 0)
  {
    if (([v6 code] & 0xFFFFFFFFFFFFFEFFLL) != 4
      || ([v6 domain],
          id v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 isEqual:*MEMORY[0x1E4F281F8]],
          v7,
          (v8 & 1) == 0))
    {
      id v9 = +[AMSLogConfig sharedEngagementConfig];
      if (!v9)
      {
        id v9 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v15 = v11;
        __int16 v16 = 2114;
        uint64_t v17 = v12;
        __int16 v18 = 2114;
        id v19 = v6;
        _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to erase client data: %{public}@", buf, 0x20u);
      }
    }
  }
}

- (void)saveToDisk
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  +[AMSEngagementClientData _assertEngagementd];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v4 = [(AMSEngagementClientData *)self lastSyncedBuild];
  [v3 setObject:v4 forKeyedSubscript:@"lastSyncedBuild"];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __37__AMSEngagementClientData_saveToDisk__block_invoke;
  v30[3] = &unk_1E55A26B0;
  id v6 = v5;
  id v31 = v6;
  [(AMSEngagementClientData *)self _enumerateAppsWithBlock:v30];
  [v3 setObject:v6 forKeyedSubscript:@"apps"];
  id v7 = +[AMSEngagementClientData clientDataURL];
  char v8 = [v7 URLByDeletingLastPathComponent];
  id v9 = [v8 path];

  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v11 = [v10 fileExistsAtPath:v9];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v29 = 0;
    char v13 = [v12 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v29];
    id v14 = v29;

    if (v14 || (v13 & 1) == 0)
    {
      uint64_t v15 = +[AMSLogConfig sharedEngagementConfig];
      if (!v15)
      {
        uint64_t v15 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v17 = [v15 OSLogObject];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      uint64_t v22 = objc_opt_class();
      __int16 v18 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v33 = v22;
      __int16 v34 = 2114;
      v35 = v18;
      __int16 v36 = 2114;
      id v37 = v14;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error creating directory. %{public}@", buf, 0x20u);
      goto LABEL_18;
    }
  }
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v3])
  {
    id v28 = 0;
    uint64_t v15 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v28];
    id v14 = v28;
    uint64_t v16 = +[AMSLogConfig sharedEngagementConfig];
    uint64_t v17 = v16;
    if (v14)
    {
      if (!v16)
      {
        uint64_t v17 = +[AMSLogConfig sharedConfig];
      }
      __int16 v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v19;
        __int16 v34 = 2114;
        v35 = v20;
        __int16 v36 = 2114;
        id v37 = v14;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failing to serialize client data. %{public}@", buf, 0x20u);
      }
LABEL_18:

      goto LABEL_19;
    }
    if (!v16)
    {
      uint64_t v17 = +[AMSLogConfig sharedConfig];
    }
    v23 = [v17 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = objc_opt_class();
      __int16 v25 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v24;
      __int16 v34 = 2114;
      v35 = v25;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overwriting client data.", buf, 0x16u);
    }
    v26 = [v7 path];
    [v15 writeToFile:v26 atomically:1];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AMSEngagementClientDataChanged", 0, 0, 1u);
    id v14 = 0;
  }
  else
  {
    id v14 = +[AMSLogConfig sharedEngagementConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_opt_class();
      uint64_t v17 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v21;
      __int16 v34 = 2114;
      v35 = v17;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failing to validate client data, invalid format.", buf, 0x16u);
LABEL_19:
    }
  }
}

void __37__AMSEngagementClientData_saveToDisk__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 exportObject];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (id)_appForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__29;
  uint64_t v16 = __Block_byref_object_dispose__29;
  id v17 = 0;
  id v5 = [(id)objc_opt_class() _sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AMSEngagementClientData__appForIdentifier___block_invoke;
  block[3] = &unk_1E55A26D8;
  id v10 = v4;
  char v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__AMSEngagementClientData__appForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) apps];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_setApp:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(id)objc_opt_class() _sharedQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AMSEngagementClientData__setApp_forIdentifier___block_invoke;
  block[3] = &unk_1E55A22D0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __49__AMSEngagementClientData__setApp_forIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) apps];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)setLastSyncedBuild:(id)a3
{
}

- (void)setApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_lastSyncedBuild, 0);
}

@end