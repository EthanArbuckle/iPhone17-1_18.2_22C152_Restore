@interface CNContactProviderSupportModerator
+ (CNContactProviderSupportModerator)sharedInstance;
+ (OS_os_log)log;
+ (id)synchronizeAllUsingSession:(id)a3;
- (CNCache)cache;
- (CNContactProviderSupportModerator)init;
- (CNScheduler)workQueue;
- (CNUnfairLock)lock;
- (OS_dispatch_semaphore)workSemaphore;
- (id)synchronizeProviderDomainUsingSession:(id)a3 bundleIdentifier:(id)a4 providerHost:(id)a5;
- (void)evictPromiseForBundleIdentifier:(id)a3;
@end

@implementation CNContactProviderSupportModerator

+ (CNContactProviderSupportModerator)sharedInstance
{
  if (sharedInstance_cn_once_token_1 != -1) {
    dispatch_once(&sharedInstance_cn_once_token_1, &__block_literal_global_4_7);
  }
  v2 = (void *)sharedInstance_cn_once_object_1;

  return (CNContactProviderSupportModerator *)v2;
}

+ (OS_os_log)log
{
  if (log_cn_once_token_0_5 != -1) {
    dispatch_once(&log_cn_once_token_0_5, &__block_literal_global_82);
  }
  v2 = (void *)log_cn_once_object_0_5;

  return (OS_os_log *)v2;
}

uint64_t __40__CNContactProviderSupportModerator_log__block_invoke()
{
  log_cn_once_object_0_5 = (uint64_t)os_log_create("com.apple.contacts.provider", "moderator");

  return MEMORY[0x1F41817F8]();
}

uint64_t __51__CNContactProviderSupportModerator_sharedInstance__block_invoke()
{
  sharedInstance_cn_once_object_1 = objc_alloc_init(CNContactProviderSupportModerator);

  return MEMORY[0x1F41817F8]();
}

- (CNContactProviderSupportModerator)init
{
  v17.receiver = self;
  v17.super_class = (Class)CNContactProviderSupportModerator;
  v2 = [(CNContactProviderSupportModerator *)&v17 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F5A360]);
    v4 = [MEMORY[0x1E4F5A360] nonatomicCacheScheduler];
    uint64_t v5 = [v3 initWithResourceScheduler:v4];
    cache = v2->_cache;
    v2->_cache = (CNCache *)v5;

    v7 = (CNUnfairLock *)objc_alloc_init(MEMORY[0x1E4F5A558]);
    lock = v2->_lock;
    v2->_lock = v7;

    v9 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v10 = [v9 schedulerProvider];
    uint64_t v11 = [v10 newSerialSchedulerWithName:@"com.apple.contacts.provider.moderator"];
    workQueue = v2->_workQueue;
    v2->_workQueue = (CNScheduler *)v11;

    dispatch_semaphore_t v13 = dispatch_semaphore_create(1);
    workSemaphore = v2->_workSemaphore;
    v2->_workSemaphore = (OS_dispatch_semaphore *)v13;

    v15 = v2;
  }

  return v2;
}

- (id)synchronizeProviderDomainUsingSession:(id)a3 bundleIdentifier:(id)a4 providerHost:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = v9;
    __int16 v31 = 2114;
    id v32 = v8;
    _os_log_impl(&dword_1909E3000, v11, OS_LOG_TYPE_INFO, "Sync session requested for %{public}@ (%{public}@)", buf, 0x16u);
  }
  if (!v9)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_55);
    }
    v12 = CNGuardOSLog_cn_once_object_0_4;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT)) {
      -[CNContactProviderSupportModerator synchronizeProviderDomainUsingSession:bundleIdentifier:providerHost:](v12);
    }
  }
  objc_opt_class();
  id v13 = v10;
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (!v15)
  {
    if (CNGuardOSLog_cn_once_token_0_4 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_4, &__block_literal_global_55);
    }
    v16 = CNGuardOSLog_cn_once_object_0_4;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_4, OS_LOG_TYPE_FAULT)) {
      -[CNContactProviderSupportModerator synchronizeProviderDomainUsingSession:bundleIdentifier:providerHost:](v16);
    }
  }
  objc_super v17 = [(CNContactProviderSupportModerator *)self lock];
  v25 = v9;
  v26 = v11;
  v27 = v15;
  v28 = v8;
  id v18 = v8;
  id v19 = v15;
  v20 = v11;
  id v21 = v9;
  v22 = CNResultWithLock();

  v23 = [v22 future];

  return v23;
}

id __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke(id *a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] cache];
  id v3 = [v2 objectForKeyedSubscript:a1[5]];

  v4 = a1[6];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      id v6 = a1[5];
      *(_DWORD *)buf = 138543362;
      id v34 = v6;
      _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_INFO, "Joining existing sync session for %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      id v7 = a1[5];
      *(_DWORD *)buf = 138543362;
      id v34 = v7;
      _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_INFO, "Creating new sync session for %{public}@", buf, 0xCu);
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
    id v9 = [a1[4] cache];
    [v9 setObject:v8 forKeyedSubscript:a1[5]];

    id v10 = [a1[4] workSemaphore];
    uint64_t v11 = [a1[4] workQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_11;
    v26[3] = &unk_1E56B7648;
    id v12 = v10;
    id v27 = v12;
    id v28 = a1[6];
    id v29 = a1[5];
    id v30 = a1[7];
    id v31 = a1[8];
    id v3 = v8;
    id v32 = v3;
    [v11 performBlock:v26];

    objc_initWeak((id *)buf, a1[4]);
    id v13 = [v3 future];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_2;
    v21[3] = &unk_1E56B7670;
    id v22 = a1[6];
    id v23 = a1[5];
    id v24 = a1[8];
    objc_copyWeak(&v25, (id *)buf);
    [v13 addSuccessBlock:v21];

    v14 = [v3 future];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_15;
    v16[3] = &unk_1E56B7698;
    id v17 = a1[6];
    id v18 = a1[5];
    id v19 = a1[8];
    objc_copyWeak(&v20, (id *)buf);
    [v14 addFailureBlock:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v25);

    objc_destroyWeak((id *)buf);
  }

  return v3;
}

void __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_11(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v2, v3))
  {
    v4 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_11_cold_1(a1, v4);
    }
  }
  BOOL v5 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Performing sync session for %{public}@", buf, 0xCu);
  }
  id v8 = *(void **)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_12;
  v10[3] = &unk_1E56B6638;
  id v11 = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 32);
  [v8 synchronizeUsing:v7 bundleIdentifier:v9 completionHandler:v10];
}

intptr_t __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_12(uint64_t a1, void *a2)
{
  dispatch_time_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v3 errorOnlyCompletionHandlerAdapter];
  ((void (**)(void, id))v5)[2](v5, v4);

  uint64_t v6 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v6);
}

void __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    dispatch_time_t v3 = *(void **)(a1 + 48);
    BOOL v5 = v2;
    uint64_t v6 = [v3 synchronizationReason];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Sync session completed successfully for %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained evictPromiseForBundleIdentifier:*(void *)(a1 + 40)];
}

void __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_15_cold_1(a1, v4, (uint64_t)v3);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained evictPromiseForBundleIdentifier:*(void *)(a1 + 40)];
}

- (void)evictPromiseForBundleIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNContactProviderSupportModerator *)self lock];
  id v6 = v4;
  CNRunWithLock();
}

void __69__CNContactProviderSupportModerator_evictPromiseForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1909E3000, v2, OS_LOG_TYPE_INFO, "Clearing existing sync session for %{public}@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) cache];
  [v4 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

+ (id)synchronizeAllUsingSession:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1E4F5A408];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CNContactProviderSupportModerator_synchronizeAllUsingSession___block_invoke;
  v9[3] = &unk_1E56B76E8;
  id v10 = v4;
  id v11 = a1;
  id v6 = v4;
  uint64_t v7 = [v5 futureWithBlock:v9];

  return v7;
}

uint64_t __64__CNContactProviderSupportModerator_synchronizeAllUsingSession___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v1 = [(id)objc_opt_class() log];
  v2 = +[CNContactProviderSupportCache sharedCache];
  uint64_t v3 = [v2 cachedBundleIdentifiers];

  id v28 = +[CNContactProviderSupportModerator sharedInstance];
  id v27 = objc_alloc_init(_TtC8Contacts28CNContactProviderSupportHost);
  id v4 = v1;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v35 = [v3 count];
    _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_INFO, "Will synchronize %lu providers", buf, 0xCu);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v31;
    *(void *)&long long v6 = 138543362;
    long long v24 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8 * v9);
        id v11 = objc_msgSend(MEMORY[0x1E4F5A3D8], "currentEnvironment", v24);
        uint64_t v12 = [v11 timeProvider];
        [v12 timestamp];
        double v14 = v13;

        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v24;
          uint64_t v35 = v10;
          _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "Will sync %{public}@", buf, 0xCu);
        }
        uint64_t v15 = [v28 synchronizeProviderDomainUsingSession:*(void *)(a1 + 32) bundleIdentifier:v10 providerHost:v27];
        id v29 = 0;
        id v16 = (id)[v15 result:&v29];
        id v17 = v29;
        id v18 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
        id v19 = [v18 timeProvider];
        [v19 timestamp];
        double v21 = v20;

        id v22 = [MEMORY[0x1E4F5A530] stringForTimeInterval:v21 - v14];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v35 = v10;
          __int16 v36 = 2114;
          id v37 = v22;
          _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "Did sync %{public}@ (%{public}@)", buf, 0x16u);
        }
        if (v17 && os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v35 = v10;
          __int16 v36 = 2114;
          id v37 = v17;
          _os_log_error_impl(&dword_1909E3000, v4, OS_LOG_TYPE_ERROR, "Error syncing %{public}@: %{public}@", buf, 0x16u);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v7);
  }

  return MEMORY[0x1E4F1CC38];
}

- (CNCache)cache
{
  return self->_cache;
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_semaphore)workSemaphore
{
  return self->_workSemaphore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workSemaphore, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)synchronizeProviderDomainUsingSession:(os_log_t)log bundleIdentifier:providerHost:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "parameter ‘providerHost’ must be nonnull", v1, 2u);
}

- (void)synchronizeProviderDomainUsingSession:(os_log_t)log bundleIdentifier:providerHost:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "parameter ‘bundleIdentifier’ must be nonnull", v1, 2u);
}

void __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_11_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Timeout waiting to perform sync session for %{public}@", (uint8_t *)&v3, 0xCu);
}

void __105__CNContactProviderSupportModerator_synchronizeProviderDomainUsingSession_bundleIdentifier_providerHost___block_invoke_15_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  long long v6 = a2;
  uint64_t v7 = [v4 synchronizationReason];
  int v8 = 138543874;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1909E3000, v6, OS_LOG_TYPE_ERROR, "Sync session failed for %{public}@ (%{public}@) with error: %{public}@", (uint8_t *)&v8, 0x20u);
}

@end