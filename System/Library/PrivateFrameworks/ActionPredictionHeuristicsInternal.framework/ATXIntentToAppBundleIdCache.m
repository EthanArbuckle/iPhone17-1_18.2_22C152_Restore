@interface ATXIntentToAppBundleIdCache
+ (id)sharedInstance;
- (ATXIntentToAppBundleIdCache)init;
- (void)_appRegistrationDidChange:(id)a3;
- (void)_slowlyFetchBundleIdsForIntent:(id)a3 completionHandler:(id)a4;
- (void)fetchBundleIdsForIntent:(id)a3 completionHandler:(id)a4;
@end

@implementation ATXIntentToAppBundleIdCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedInstance_cache;

  return v2;
}

uint64_t __45__ATXIntentToAppBundleIdCache_sharedInstance__block_invoke()
{
  sharedInstance_cache = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (ATXIntentToAppBundleIdCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXIntentToAppBundleIdCache;
  v2 = [(ATXIntentToAppBundleIdCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    intentTypeToBundleIdsCache = v2->_intentTypeToBundleIdsCache;
    v2->_intentTypeToBundleIdsCache = (NSMutableDictionary *)v3;

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__appRegistrationDidChange_ name:@"com.apple.LaunchServices.applicationRegistered" object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__appRegistrationDidChange_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  }
  return v2;
}

- (void)_appRegistrationDidChange:(id)a3
{
  id v4 = a3;
  v5 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ATXIntentToAppBundleIdCache _appRegistrationDidChange:](v5);
  }

  v6 = self;
  objc_sync_enter(v6);
  [(NSMutableDictionary *)v6->_intentTypeToBundleIdsCache removeAllObjects];
  objc_sync_exit(v6);
}

- (void)fetchBundleIdsForIntent:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  objc_super v8 = self;
  objc_sync_enter(v8);
  intentTypeToBundleIdsCache = v8->_intentTypeToBundleIdsCache;
  v10 = [v6 _className];
  v11 = [(NSMutableDictionary *)intentTypeToBundleIdsCache objectForKey:v10];
  v12 = (void *)[v11 copy];

  objc_sync_exit(v8);
  if (v12)
  {
    v13 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ATXIntentToAppBundleIdCache fetchBundleIdsForIntent:completionHandler:](v6, (uint64_t)v12, v13);
    }

    v7[2](v7, v12, 0);
  }
  else
  {
    [(ATXIntentToAppBundleIdCache *)v8 _slowlyFetchBundleIdsForIntent:v6 completionHandler:v7];
  }
}

- (void)_slowlyFetchBundleIdsForIntent:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)os_transaction_create();
  v9 = [v6 _className];
  v10 = (void *)[v9 copy];

  v11 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ATXIntentToAppBundleIdCache _slowlyFetchBundleIdsForIntent:completionHandler:]((uint64_t)v10, v11);
  }

  v12 = (void *)MEMORY[0x1E4F28C70];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__ATXIntentToAppBundleIdCache__slowlyFetchBundleIdsForIntent_completionHandler___block_invoke;
  v16[3] = &unk_1E68A57B0;
  v16[4] = self;
  id v17 = v10;
  id v18 = v8;
  id v19 = v7;
  id v13 = v8;
  id v14 = v7;
  id v15 = v10;
  objc_msgSend(v12, "_intents_matchExtensionsForIntent:completion:", v6, v16);
}

void __80__ATXIntentToAppBundleIdCache__slowlyFetchBundleIdsForIntent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v28 = a3;
  v29 = v5;
  if (v5)
  {
    id v6 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v7;
      __int16 v37 = 2112;
      id v38 = v5;
      _os_log_impl(&dword_1D0F43000, v6, OS_LOG_TYPE_INFO, "ATXIntentToAppBundleIdCache: intent type %{public}@ has extensions %@", buf, 0x16u);
    }

    v27 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_14);
    objc_super v8 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v9;
      __int16 v37 = 2112;
      id v38 = v27;
      _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_INFO, "ATXIntentToAppBundleIdCache: intent type %{public}@ has bundle ids %@", buf, 0x16u);
    }

    v10 = objc_opt_new();
    [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1E4F4AF00];
          id v17 = [v15 bundleIdentifier];
          id v18 = [v16 appInfoForBundle:v17];

          id v19 = [v18 supportedActions];
          if ([v19 containsObject:*(void *)(a1 + 40)])
          {
            v20 = [v15 bundleIdentifier];
            [v10 addObject:v20];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v12);
    }

    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v27];
    [v21 addObjectsFromArray:v10];
    v22 = [v21 array];
    id v23 = *(id *)(a1 + 32);
    objc_sync_enter(v23);
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v22 forKey:*(void *)(a1 + 40)];
    objc_sync_exit(v23);

    id v24 = self;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v25 = *(id *)(a1 + 32);
    objc_sync_enter(v25);
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
    objc_sync_exit(v25);

    v26 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      __80__ATXIntentToAppBundleIdCache__slowlyFetchBundleIdsForIntent_completionHandler___block_invoke_cold_1((uint64_t *)(a1 + 40), (uint64_t)v28, v26);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id __80__ATXIntentToAppBundleIdCache__slowlyFetchBundleIdsForIntent_completionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F223A0];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 identifier];

  id v6 = (void *)[v4 initWithBundleIdentifier:v5 error:0];
  uint64_t v7 = [v6 containingBundleRecord];
  objc_super v8 = [v7 bundleIdentifier];

  return v8;
}

- (void).cxx_destruct
{
}

- (void)_appRegistrationDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0F43000, log, OS_LOG_TYPE_DEBUG, "ATXIntentToAppBundleIdCache: clearing cache", v1, 2u);
}

- (void)fetchBundleIdsForIntent:(NSObject *)a3 completionHandler:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 _className];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D0F43000, a3, OS_LOG_TYPE_DEBUG, "ATXIntentToAppBundleIdCache: using cached value for %{public}@: %@", (uint8_t *)&v6, 0x16u);
}

- (void)_slowlyFetchBundleIdsForIntent:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_DEBUG, "ATXIntentToAppBundleIdCache: fetching value for %{public}@", (uint8_t *)&v2, 0xCu);
}

void __80__ATXIntentToAppBundleIdCache__slowlyFetchBundleIdsForIntent_completionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D0F43000, log, OS_LOG_TYPE_ERROR, "ATXIntentToAppBundleIdCache: error getting extensions for intent of type %{public}@: %@", (uint8_t *)&v4, 0x16u);
}

@end