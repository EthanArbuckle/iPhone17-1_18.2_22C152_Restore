@interface AMSUIWebJSAppQueryManager
- (AMSUIWebJSAppQueryManager)initWithDelegate:(id)a3;
- (AMSUIWebJSAppQueryManagerDelegate)delegate;
- (NSMutableDictionary)observingQueries;
- (id)_encodeApp:(id)a3;
- (id)_executeAppQuery:(id)a3;
- (id)queryAppsWithBundleIDs:(id)a3 startObserving:(BOOL)a4;
- (id)queryAppsWithStoreItemIDs:(id)a3 startObserving:(BOOL)a4;
- (void)_postMediaQueryResultsChangeEventWithApps:(id)a3;
- (void)appQuery:(id)a3 resultsDidChange:(id)a4;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)stopObservingAllApps;
- (void)stopObservingAppsWithBundleIDs:(id)a3;
- (void)stopObservingAppsWithStoreItemIDs:(id)a3;
@end

@implementation AMSUIWebJSAppQueryManager

- (AMSUIWebJSAppQueryManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSUIWebJSAppQueryManager;
  v5 = [(AMSUIWebJSAppQueryManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    observingQueries = v6->_observingQueries;
    v6->_observingQueries = v7;
  }
  return v6;
}

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(AMSUIWebJSAppQueryManager *)v2 observingQueries];
  [v3 removeAllObjects];

  objc_sync_exit(v2);
  [(AMSUIWebJSAppQueryManager *)v2 setDelegate:0];
}

- (id)queryAppsWithBundleIDs:(id)a3 startObserving:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [getASDAppQueryClass() queryForBundleIDs:v6];
  v8 = v7;
  if (v4)
  {
    [v7 setObserver:self];
    v9 = self;
    objc_sync_enter(v9);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v15 = [(AMSUIWebJSAppQueryManager *)v9 observingQueries];
          [v15 setObject:v8 forKey:v14];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v11);
    }

    objc_sync_exit(v9);
  }
  v16 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", (void)v22);
  if (!v16)
  {
    v16 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_opt_class();
    v19 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v18;
    __int16 v28 = 2114;
    v29 = v19;
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Executing app query for bundle identifiers %{public}@", buf, 0x20u);
  }
  v20 = [(AMSUIWebJSAppQueryManager *)self _executeAppQuery:v8];

  return v20;
}

- (id)queryAppsWithStoreItemIDs:(id)a3 startObserving:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [getASDAppQueryClass() queryForStoreItemIDs:v6];
  v8 = v7;
  if (v4)
  {
    [v7 setObserver:self];
    v9 = self;
    objc_sync_enter(v9);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v15 = [(AMSUIWebJSAppQueryManager *)v9 observingQueries];
          [v15 setObject:v8 forKey:v14];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v11);
    }

    objc_sync_exit(v9);
  }
  v16 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", (void)v22);
  if (!v16)
  {
    v16 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_opt_class();
    v19 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v18;
    __int16 v28 = 2114;
    v29 = v19;
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Executing app query for store item identifiers %{public}@", buf, 0x20u);
  }
  v20 = [(AMSUIWebJSAppQueryManager *)self _executeAppQuery:v8];

  return v20;
}

- (void)stopObservingAllApps
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(AMSUIWebJSAppQueryManager *)obj observingQueries];
  [v2 removeAllObjects];

  objc_sync_exit(obj);
}

- (void)stopObservingAppsWithBundleIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        uint64_t v11 = [(AMSUIWebJSAppQueryManager *)v5 observingQueries];
        [v11 removeObjectForKey:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)stopObservingAppsWithStoreItemIDs:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        uint64_t v11 = [(AMSUIWebJSAppQueryManager *)v5 observingQueries];
        [v11 removeObjectForKey:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
}

- (id)_encodeApp:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF9A0]);
  v5 = [v3 bundleID];
  id v6 = objc_msgSend(v4, "initWithObjectsAndKeys:", v5, @"bundleID", 0);

  uint64_t v7 = [v3 bundleShortVersion];
  [v6 setValue:v7 forKey:@"bundleShortVersion"];

  uint64_t v8 = [v3 bundleVersion];
  [v6 setValue:v8 forKey:@"bundleVersion"];

  uint64_t v9 = [v3 installError];
  uint64_t v10 = [v9 description];
  [v6 setValue:v10 forKey:@"installError"];

  uint64_t v11 = [v3 installID];
  long long v12 = [v11 UUIDString];
  [v6 setValue:v12 forKey:@"installID"];

  long long v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isInstalled"));
  [v6 setValue:v13 forKey:@"isInstalled"];

  long long v14 = [v3 progress];
  long long v15 = v14;
  if (v14)
  {
    v16 = NSNumber;
    [v14 fractionCompleted];
    uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
    [v6 setValue:v17 forKey:@"progress"];
  }
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "storeItemID"));
  [v6 setValue:v18 forKey:@"storeItemID"];

  v19 = [v3 storeFront];
  [v6 setValue:v19 forKey:@"storeFront"];

  return v6;
}

- (id)_executeAppQuery:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F27B58]);
  objc_initWeak(&location, self);
  id v6 = AMSLogKey();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__AMSUIWebJSAppQueryManager__executeAppQuery___block_invoke;
  v12[3] = &unk_2643E5168;
  objc_copyWeak(&v15, &location);
  id v7 = v6;
  id v13 = v7;
  id v8 = v5;
  id v14 = v8;
  [v4 executeQueryWithResultHandler:v12];
  uint64_t v9 = v14;
  id v10 = v8;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

void __46__AMSUIWebJSAppQueryManager__executeAppQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = (id)AMSSetLogKey();
  uint64_t v9 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  id v10 = (void *)v9;
  if (v5)
  {
    if (!v9)
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      int v17 = 138543618;
      uint64_t v18 = v12;
      __int16 v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App query succeeded.", (uint8_t *)&v17, 0x16u);
    }
    [WeakRetained _postMediaQueryResultsChangeEventWithApps:v5];
    [*(id *)(a1 + 40) finishWithSuccess];
  }
  else
  {
    if (!v9)
    {
      id v10 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v14 = [v10 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      v16 = AMSLogKey();
      int v17 = 138543874;
      uint64_t v18 = v15;
      __int16 v19 = 2114;
      v20 = v16;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] App query failed %{public}@", (uint8_t *)&v17, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v6];
  }
}

- (void)_postMediaQueryResultsChangeEventWithApps:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebJSAppQueryManager *)self delegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__AMSUIWebJSAppQueryManager__postMediaQueryResultsChangeEventWithApps___block_invoke;
  v7[3] = &unk_2643E5190;
  v7[4] = self;
  id v6 = objc_msgSend(v4, "ams_mapWithTransform:", v7);

  [v5 appQueryManager:self didReceiveApps:v6];
}

uint64_t __71__AMSUIWebJSAppQueryManager__postMediaQueryResultsChangeEventWithApps___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _encodeApp:a2];
}

- (AMSUIWebJSAppQueryManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSUIWebJSAppQueryManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)observingQueries
{
  return self->_observingQueries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observingQueries, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end