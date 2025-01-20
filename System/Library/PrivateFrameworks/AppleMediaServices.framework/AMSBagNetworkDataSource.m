@interface AMSBagNetworkDataSource
+ (id)requestPartialIdentifierForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5;
+ (id)valueForURLVariable:(id)a3 account:(id)a4 clientInfo:(id)a5;
+ (void)_valueForURLVariable:(id)a3 account:(id)a4 clientInfo:(id)a5 sync:(BOOL)a6 completion:(id)a7;
+ (void)valueForURLVariable:(id)a3 account:(id)a4 clientInfo:(id)a5 completion:(id)a6;
- (AMSBagAccountProvider)accountProvider;
- (AMSBagNetworkDataSource)initWithProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5;
- (AMSBagNetworkDataSource)initWithProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5 accountProvider:(id)a6;
- (AMSBagNetworkTask)currentLoadTask;
- (AMSBagNetworkTaskResult)cachedResult;
- (AMSObserver)accountsChangedObserver;
- (AMSProcessInfo)processInfo;
- (BOOL)isLoaded;
- (NSDate)expirationDate;
- (NSMutableDictionary)defaultValues;
- (NSString)bagLoadingPartialIdentifier;
- (NSString)cachedStorefront;
- (NSString)description;
- (NSString)descriptionExtended;
- (NSString)profile;
- (NSString)profileVersion;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)processAccountStoreDidChangeNotificationQueue;
- (id)_fetchBag;
- (id)_newCompletionQueue;
- (id)dataSourceChangedHandler;
- (id)dataSourceDataInvalidatedHandler;
- (id)defaultValueForKey:(id)a3;
- (id)loadedValuesForKeys:(id)a3 outExpirationDate:(id *)a4;
- (id)valueForURLVariable:(id)a3 account:(id)a4;
- (os_unfair_recursive_lock_s)cachedDataAccessLock;
- (void)_accountStoreDidChange;
- (void)_invalidateCacheNotification:(id)a3;
- (void)_updateCachedResult:(id)a3;
- (void)dealloc;
- (void)loadWithCompletion:(id)a3;
- (void)setAccountsChangedObserver:(id)a3;
- (void)setCachedResult:(id)a3;
- (void)setCachedStorefront:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setCurrentLoadTask:(id)a3;
- (void)setDataSourceChangedHandler:(id)a3;
- (void)setDataSourceDataInvalidatedHandler:(id)a3;
- (void)setDefaultValue:(id)a3 forKey:(id)a4;
- (void)setDefaultValues:(id)a3;
- (void)valueForURLVariable:(id)a3 account:(id)a4 completion:(id)a5;
@end

@implementation AMSBagNetworkDataSource

void __83__AMSBagNetworkDataSource__valueForURLVariable_account_clientInfo_sync_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[AMSLogConfig sharedBagConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = AMSLogKey();
      v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      v23 = (void *)v9;
      if (v9)
      {
        uint64_t v22 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, v22];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      v13 = };
      v18 = AMSHashIfNeeded(*(void **)(a1 + 32));
      v19 = [v5 identifier];
      v20 = AMSHashIfNeeded(v19);
      v21 = AMSLogableError(v6);
      *(_DWORD *)buf = 138544130;
      v27 = v13;
      __int16 v28 = 2114;
      v29 = v18;
      __int16 v30 = 2114;
      v31 = v20;
      __int16 v32 = 2114;
      v33 = v21;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch value for URL variable. variable = %{public}@ | account ID = %{public}@ | error = %{public}@.", buf, 0x2Au);

      if (v23)
      {

        v13 = (void *)v22;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v14 = objc_msgSend(v5, "ams_cookies");
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __83__AMSBagNetworkDataSource__valueForURLVariable_account_clientInfo_sync_completion___block_invoke_47;
    v24[3] = &unk_1E559E270;
    id v25 = *(id *)(a1 + 32);
    v15 = objc_msgSend(v14, "ams_firstObjectPassingTest:", v24);

    uint64_t v16 = *(void *)(a1 + 40);
    v17 = [v15 value];
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
  }
}

uint64_t __83__AMSBagNetworkDataSource__valueForURLVariable_account_clientInfo_sync_completion___block_invoke_47(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "ams_isCookieValidForBag"))
  {
    v4 = [v3 name];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __46__AMSBagNetworkDataSource_loadWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [AMSBagDataSourceLoadResult alloc];
    id v3 = [*(id *)(a1 + 32) data];
    v4 = [*(id *)(a1 + 32) expirationDate];
    uint64_t v5 = [*(id *)(a1 + 32) loadedBagIdentifier];
    id v6 = [*(id *)(a1 + 32) loadedBagPartialIdentifier];
    v7 = [(AMSBagDataSourceLoadResult *)v2 initWithData:v3 expirationDate:v4 loadedBagIdentifier:v5 loadedBagPartialIdentifier:v6];
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)loadWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v5 = [(AMSBagNetworkDataSource *)self cachedResult];
  id v6 = v5;
  if (v5) {
    int v7 = [v5 expired] ^ 1;
  }
  else {
    int v7 = 0;
  }
  if ([v6 expired])
  {
    v8 = +[AMSLogConfig sharedBagConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      v10 = AMSLogKey();
      uint64_t v11 = [(AMSBagNetworkDataSource *)self profile];
      uint64_t v12 = [(AMSBagNetworkDataSource *)self profileVersion];
      *(_DWORD *)buf = 138544130;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      uint64_t v22 = v10;
      __int16 v23 = 2114;
      v24 = v11;
      __int16 v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The backing data for the bag is expired. profile = %{public}@ | profileVersion = %{public}@", buf, 0x2Au);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__AMSBagNetworkDataSource_loadWithCompletion___block_invoke;
  aBlock[3] = &unk_1E559F818;
  aBlock[4] = self;
  id v18 = v4;
  id v13 = v4;
  v14 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  if (v7)
  {
    os_unfair_recursive_lock_unlock();
    v14[2](v14, v6, 0);
  }
  else
  {
    v15 = [(AMSBagNetworkDataSource *)self _fetchBag];
    os_unfair_recursive_lock_unlock();
    [v15 addFinishBlock:v14];
  }
}

- (AMSBagNetworkTaskResult)cachedResult
{
  return self->_cachedResult;
}

void __46__AMSBagNetworkDataSource_loadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = (void *)[*(id *)(a1 + 32) _newCompletionQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__AMSBagNetworkDataSource_loadWithCompletion___block_invoke_2;
  v15[3] = &unk_1E559F7F0;
  id v16 = v5;
  id v8 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v8;
  uint64_t v9 = v15;
  v10 = v7;
  id v11 = v6;
  id v12 = v5;
  id v13 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_0;
  block[3] = &unk_1E559EAE0;
  id v20 = v13;
  id v21 = v9;
  id v14 = v13;
  dispatch_async(v10, block);
}

- (id)_newCompletionQueue
{
  objc_msgSend(NSString, "stringWithFormat:", @"com.apple.AppleMediaServices.AMSBagNetworkDataSource.loadCompletionQueue.%lx", self);
  id v2 = objc_claimAutoreleasedReturnValue();
  id v3 = (const char *)[v2 UTF8String];
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create(v3, v4);

  return v5;
}

- (id)defaultValueForKey:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  dispatch_queue_t v5 = [(AMSBagNetworkDataSource *)self defaultValues];
  id v6 = [v5 objectForKeyedSubscript:v4];

  os_unfair_recursive_lock_unlock();
  if (!v6)
  {
    int v7 = [(AMSBagNetworkDataSource *)self profile];
    id v8 = [(AMSBagNetworkDataSource *)self profileVersion];
    id v6 = +[AMSBagKeySet defaultValueForKey:v4 profile:v7 profileVersion:v8];
  }
  return v6;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  dispatch_queue_t v5 = [(AMSBagNetworkDataSource *)self profile];
  id v6 = [(AMSBagNetworkDataSource *)self profileVersion];
  int v7 = [(AMSBagNetworkDataSource *)self processInfo];
  id v8 = [v7 accountMediaType];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; profile: %@; version: %@; sandbox: %d>",
    v4,
    self,
    v5,
    v6,
  uint64_t v9 = v8 == AMSAccountMediaTypeAppStoreSandbox);

  return (NSString *)v9;
}

- (NSString)profile
{
  return self->_profile;
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (AMSProcessInfo)processInfo
{
  return self->_processInfo;
}

+ (id)requestPartialIdentifierForClientInfo:(id)a3 profile:(id)a4 profileVersion:(id)a5
{
  return +[AMSBagNetworkTask requestPartialIdentifierForClientInfo:a3 profile:a4 profileVersion:a5];
}

- (NSMutableDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void)setDataSourceDataInvalidatedHandler:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  dispatch_queue_t v5 = (void *)[v4 copy];

  id dataSourceDataInvalidatedHandler = self->_dataSourceDataInvalidatedHandler;
  self->_id dataSourceDataInvalidatedHandler = v5;

  os_unfair_recursive_lock_unlock();
}

- (void)setDataSourceChangedHandler:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  dispatch_queue_t v5 = (void *)[v4 copy];

  id dataSourceChangedHandler = self->_dataSourceChangedHandler;
  self->_id dataSourceChangedHandler = v5;

  os_unfair_recursive_lock_unlock();
}

- (AMSBagNetworkDataSource)initWithProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5 accountProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v39.receiver = self;
  v39.super_class = (Class)AMSBagNetworkDataSource;
  v15 = [(AMSBagNetworkDataSource *)&v39 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountProvider, a6);
    v16->_cachedDataAccessLock = 0;
    id v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    defaultValues = v16->_defaultValues;
    v16->_defaultValues = v17;

    objc_storeStrong((id *)&v16->_profile, a3);
    objc_storeStrong((id *)&v16->_profileVersion, a4);
    objc_storeStrong((id *)&v16->_processInfo, a5);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.AppleMediaServices.AMSBagNetworkDataSource.processAccountStoreDidChangeNotification", v19);
    processAccountStoreDidChangeNotificationQueue = v16->_processAccountStoreDidChangeNotificationQueue;
    v16->_processAccountStoreDidChangeNotificationQueue = (OS_dispatch_queue *)v20;

    cachedStorefront = v16->_cachedStorefront;
    v16->_cachedStorefront = 0;

    objc_initWeak(&location, v16);
    __int16 v23 = v16->_processAccountStoreDidChangeNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__AMSBagNetworkDataSource_initWithProfile_profileVersion_processInfo_accountProvider___block_invoke;
    block[3] = &unk_1E559F7A0;
    objc_copyWeak(&v37, &location);
    id v36 = v13;
    dispatch_async(v23, block);
    v24 = [AMSObserver alloc];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    __int16 v32 = __86__AMSBagNetworkDataSource_initWithProfile_profileVersion_processInfo_accountProvider___block_invoke_13;
    v33 = &unk_1E559F7C8;
    objc_copyWeak(&v34, &location);
    uint64_t v25 = [(AMSObserver *)v24 initWithResultBlock:&v30];
    accountsChangedObserver = v16->_accountsChangedObserver;
    v16->_accountsChangedObserver = (AMSObserver *)v25;

    uint64_t v27 = +[AMSAccountsChangedObservable sharedInstance];
    [v27 subscribe:v16->_accountsChangedObserver];

    __int16 v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v16 selector:sel__invalidateCacheNotification_ name:@"AMSBagNetworkDataSourceInvalidateCacheNotification" object:0];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __36__AMSBagNetworkDataSource__fetchBag__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = AMSSetLogKey(*(void **)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (v3) {
      [WeakRetained _updateCachedResult:v3];
    }
    [WeakRetained setCurrentLoadTask:0];
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    id v6 = +[AMSLogConfig sharedBagConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    int v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      v10 = AMSLogKey();
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2114;
      id v14 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Someone is loading the bag but not retaining the data source object.", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)_updateCachedResult:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_cachedDataAccessLock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__AMSBagNetworkDataSource__updateCachedResult___block_invoke;
  aBlock[3] = &unk_1E559F1E0;
  aBlock[4] = self;
  id v45 = v5;
  id v47 = v45;
  v42 = (void (**)(void))_Block_copy(aBlock);
  v41 = [(AMSBagNetworkDataSource *)self dataSourceChangedHandler];
  if (v41)
  {
    id v6 = [(AMSBagNetworkDataSource *)self cachedResult];
    v43 = [v6 data];

    int v7 = [v45 data];
    id v8 = v7;
    if (v43) {
      id v9 = v43;
    }
    else {
      id v9 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_msgSend(v7, "ams_keysForChangedValuesComparedToDictionary:", v9);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();

    if (![log count])
    {
      id v21 = +[AMSLogConfig sharedBagConfig];
      if (!v21)
      {
        id v21 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v22 = [(AMSBagDataSourceChange *)v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = AMSLogKey();
        v24 = NSString;
        if (v23)
        {
          uint64_t v25 = objc_opt_class();
          uint64_t v3 = AMSLogKey();
          [v24 stringWithFormat:@"%@: [%@] ", v25, v3];
        }
        else
        {
          [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        v26 = };
        *(_DWORD *)buf = 138543362;
        v49 = v26;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded bag is equal to the previous bag. dataSourceChangedHandler won't be called.", buf, 0xCu);
        if (v23)
        {

          v26 = (void *)v3;
        }
      }
      goto LABEL_45;
    }
    if (v43)
    {
      v10 = +[AMSLogConfig sharedBagConfig];
      if (!v10)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      int v11 = [v10 OSLogObject];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_44;
      }
      id v12 = AMSLogKey();
      __int16 v13 = NSString;
      if (v12)
      {
        uint64_t v14 = objc_opt_class();
        uint64_t v3 = AMSLogKey();
        [v13 stringWithFormat:@"%@: [%@] ", v14, v3];
      }
      else
      {
        [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      uint64_t v15 = };
      *(_DWORD *)buf = 138543362;
      v49 = v15;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Bag data has changed. dataSourceChangedHandler will be called.", buf, 0xCu);
      if (v12)
      {

        uint64_t v15 = (void *)v3;
      }
    }
    else
    {
      v10 = +[AMSLogConfig sharedBagConfig];
      if (!v10)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      int v11 = [v10 OSLogObject];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_44;
      }
      id v12 = AMSLogKey();
      uint64_t v27 = NSString;
      if (v12)
      {
        uint64_t v28 = objc_opt_class();
        uint64_t v3 = AMSLogKey();
        [v27 stringWithFormat:@"%@: [%@] ", v28, v3];
      }
      else
      {
        [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      uint64_t v15 = };
      *(_DWORD *)buf = 138543362;
      v49 = v15;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Bag data was initially loaded. dataSourceChangedHandler will be called.", buf, 0xCu);
      if (v12)
      {

        uint64_t v15 = (void *)v3;
      }
    }

LABEL_44:
    v29 = [AMSBagDataSourceChange alloc];
    v40 = [(AMSBagNetworkDataSource *)self profile];
    objc_super v39 = [(AMSBagNetworkDataSource *)self profileVersion];
    uint64_t v30 = [(AMSBagNetworkDataSource *)self cachedResult];
    uint64_t v31 = [v30 data];
    __int16 v32 = [(AMSBagNetworkDataSource *)self cachedResult];
    v33 = [v32 expirationDate];
    id v34 = [v45 data];
    v35 = [v45 expirationDate];
    id v36 = [v45 loadedBagIdentifier];
    id v37 = [v45 loadedBagPartialIdentifier];
    v38 = [v45 accountIdentifier];
    id v21 = [(AMSBagDataSourceChange *)v29 initWithProfile:v40 profileVersion:v39 originalData:v31 originalExpirationDate:v33 updatedData:v34 updatedExpirationDate:v35 changedKeys:log loadedBagIdentifier:v36 loadedBagPartialIdentifier:v37 accountIdentifier:v38];

    ((void (**)(void, AMSBagDataSourceChange *))v41)[2](v41, v21);
LABEL_45:

    goto LABEL_46;
  }
  id v16 = +[AMSLogConfig sharedBagConfig];
  if (!v16)
  {
    id v16 = +[AMSLogConfig sharedConfig];
  }
  v43 = v16;
  os_log_t log = [v16 OSLogObject];
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = AMSLogKey();
    id v18 = NSString;
    if (v17)
    {
      uint64_t v19 = objc_opt_class();
      uint64_t v3 = AMSLogKey();
      [v18 stringWithFormat:@"%@: [%@] ", v19, v3];
    }
    else
    {
      [NSString stringWithFormat:@"%@: ", objc_opt_class()];
    dispatch_queue_t v20 = };
    *(_DWORD *)buf = 138543362;
    v49 = v20;
    _os_log_impl(&dword_18D554000, log, OS_LOG_TYPE_DEFAULT, "%{public}@dataSourceChangedHandler won't be called as one wasn't provided.", buf, 0xCu);
    if (v17)
    {

      dispatch_queue_t v20 = (void *)v3;
    }
  }
LABEL_46:

  v42[2]();
}

uint64_t __47__AMSBagNetworkDataSource__updateCachedResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCachedResult:*(void *)(a1 + 40)];
}

- (void)setCachedResult:(id)a3
{
}

- (id)dataSourceChangedHandler
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = _Block_copy(self->_dataSourceChangedHandler);
  os_unfair_recursive_lock_unlock();
  id v4 = _Block_copy(v3);

  return v4;
}

+ (void)valueForURLVariable:(id)a3 account:(id)a4 clientInfo:(id)a5 completion:(id)a6
{
}

+ (void)_valueForURLVariable:(id)a3 account:(id)a4 clientInfo:(id)a5 sync:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v13)
  {
    id v16 = +[AMSPromise promiseWithResult:v13];
  }
  else
  {
    id v17 = [AMSBagActiveAccountProvider alloc];
    id v18 = [v14 accountMediaType];
    if (v8)
    {
      uint64_t v19 = [(AMSBagActiveAccountProvider *)v17 bagAccountForAccountMediaType:v18];

      if (v19)
      {
        id v16 = +[AMSPromise promiseWithResult:v19];
      }
      else
      {
        dispatch_queue_t v20 = AMSError(7, @"No account found", @"The active account provider didn't provide an account", 0);
        id v16 = +[AMSPromise promiseWithError:v20];
      }
    }
    else
    {
      id v16 = [(AMSBagActiveAccountProvider *)v17 bagAccountPromiseForAccountMediaType:v18];
    }
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __83__AMSBagNetworkDataSource__valueForURLVariable_account_clientInfo_sync_completion___block_invoke;
  v23[3] = &unk_1E559F8E0;
  id v25 = v15;
  id v26 = a1;
  id v24 = v12;
  id v21 = v15;
  id v22 = v12;
  [v16 addFinishBlock:v23];
}

- (NSDate)expirationDate
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = [(AMSBagNetworkDataSource *)self cachedResult];
  id v4 = [v3 expirationDate];

  os_unfair_recursive_lock_unlock();
  return (NSDate *)v4;
}

- (id)_fetchBag
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_cachedDataAccessLock);
  uint64_t v3 = AMSSetLogKeyIfNeeded();
  id v4 = AMSSetLogKey(v3);
  id v5 = [(AMSBagNetworkDataSource *)self currentLoadTask];

  BOOL v6 = v5 == 0;
  uint64_t v7 = +[AMSLogConfig sharedBagConfig];
  BOOL v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      BOOL v8 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v8 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_opt_class();
      id v17 = v16;
      id v18 = AMSLogKey();
      uint64_t v19 = [(AMSBagNetworkDataSource *)self description];
      *(_DWORD *)buf = 138543874;
      __int16 v32 = v16;
      __int16 v33 = 2114;
      id v34 = v18;
      __int16 v35 = 2114;
      id v36 = v19;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Loading bag from the network. %{public}@", buf, 0x20u);
    }
    dispatch_queue_t v20 = [AMSBagNetworkTask alloc];
    id v21 = [(AMSBagNetworkDataSource *)self processInfo];
    id v22 = [(AMSBagNetworkDataSource *)self profile];
    __int16 v23 = [(AMSBagNetworkDataSource *)self profileVersion];
    id v24 = [(AMSBagNetworkDataSource *)self accountProvider];
    id v25 = [(AMSBagNetworkTask *)v20 initWithClientInfo:v21 profile:v22 profileVersion:v23 accountProvider:v24];
    [(AMSBagNetworkDataSource *)self setCurrentLoadTask:v25];

    id v26 = [(AMSBagNetworkDataSource *)self currentLoadTask];
    id v14 = [v26 performFetch];

    objc_initWeak((id *)buf, self);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __36__AMSBagNetworkDataSource__fetchBag__block_invoke;
    v28[3] = &unk_1E559F8B8;
    objc_copyWeak(&v30, (id *)buf);
    id v29 = v3;
    [v14 addFinishBlock:v28];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (!v7)
    {
      BOOL v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      id v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      __int16 v32 = v10;
      __int16 v33 = 2114;
      id v34 = v12;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Awaiting bag load", buf, 0x16u);
    }
    id v13 = [(AMSBagNetworkDataSource *)self currentLoadTask];
    id v14 = [v13 performFetch];
  }
  return v14;
}

- (AMSBagNetworkTask)currentLoadTask
{
  return self->_currentLoadTask;
}

- (AMSBagAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (void)setCurrentLoadTask:(id)a3
{
}

void __86__AMSBagNetworkDataSource_initWithProfile_profileVersion_processInfo_accountProvider___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained accountProvider];
  id v5 = [*(id *)(a1 + 32) accountMediaType];
  BOOL v6 = [v4 bagStorefrontForAccountMediaType:v5];

  if (v6)
  {
    [WeakRetained setCachedStorefront:v6];
  }
  else
  {
    uint64_t v7 = +[AMSLogConfig sharedBagConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    BOOL v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = AMSLogKey();
      v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        uint64_t v1 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, v1];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      id v13 = };
      id v14 = AMSLogableError(0);
      *(_DWORD *)buf = 138543618;
      id v16 = v13;
      __int16 v17 = 2114;
      id v18 = v14;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@Could not fetch initial cached storefront. error = %{public}@", buf, 0x16u);
      if (v9)
      {

        id v13 = (void *)v1;
      }
    }
  }
}

- (void)setCachedStorefront:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSBagNetworkDataSource *)self processAccountStoreDidChangeNotificationQueue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = (NSString *)[v4 copy];
  cachedStorefront = self->_cachedStorefront;
  self->_cachedStorefront = v6;
}

- (OS_dispatch_queue)processAccountStoreDidChangeNotificationQueue
{
  return self->_processAccountStoreDidChangeNotificationQueue;
}

- (id)loadedValuesForKeys:(id)a3 outExpirationDate:(id *)a4
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v7 = [(AMSBagNetworkDataSource *)self cachedResult];
  BOOL v8 = [v7 data];

  if (v8)
  {
    id v9 = [(AMSBagNetworkDataSource *)self cachedResult];
    v10 = [v9 data];
    uint64_t v11 = objc_msgSend(v10, "ams_valuesForKeys:", v6);

    if (a4)
    {
      uint64_t v12 = [(AMSBagNetworkDataSource *)self cachedResult];
      *a4 = [v12 expirationDate];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  os_unfair_recursive_lock_unlock();

  return v11;
}

- (NSString)bagLoadingPartialIdentifier
{
  uint64_t v3 = [(AMSBagNetworkDataSource *)self processInfo];
  id v4 = [(AMSBagNetworkDataSource *)self profile];
  id v5 = [(AMSBagNetworkDataSource *)self profileVersion];
  id v6 = +[AMSBagNetworkTask requestPartialIdentifierForClientInfo:v3 profile:v4 profileVersion:v5];

  return (NSString *)v6;
}

- (AMSBagNetworkDataSource)initWithProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(AMSBagActiveAccountProvider);
  uint64_t v12 = [(AMSBagNetworkDataSource *)self initWithProfile:v10 profileVersion:v9 processInfo:v8 accountProvider:v11];

  return v12;
}

void __86__AMSBagNetworkDataSource_initWithProfile_profileVersion_processInfo_accountProvider___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained accountProvider];
  id v6 = [v3 account];

  uint64_t v7 = [WeakRetained processInfo];
  id v8 = [v7 accountMediaType];
  int v9 = [v5 associatedAccountIsEqualToAccount:v6 forMediaType:v8];

  if (v9)
  {
    id v10 = +[AMSLogConfig sharedBagConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = v12;
      id v14 = AMSLogKey();
      int v15 = 138543618;
      id v16 = v12;
      __int16 v17 = 2114;
      id v18 = v14;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] An account changed.", (uint8_t *)&v15, 0x16u);
    }
    [WeakRetained _accountStoreDidChange];
  }
}

- (void)dealloc
{
  id v3 = +[AMSAccountsChangedObservable sharedInstance];
  id v4 = [(AMSBagNetworkDataSource *)self accountsChangedObserver];
  [v3 unsubscribe:v4];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)AMSBagNetworkDataSource;
  [(AMSBagNetworkDataSource *)&v6 dealloc];
}

- (NSString)cachedStorefront
{
  id v3 = [(AMSBagNetworkDataSource *)self processAccountStoreDidChangeNotificationQueue];
  dispatch_assert_queue_V2(v3);

  cachedStorefront = self->_cachedStorefront;
  return cachedStorefront;
}

- (id)dataSourceDataInvalidatedHandler
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = _Block_copy(self->_dataSourceDataInvalidatedHandler);
  os_unfair_recursive_lock_unlock();
  id v4 = _Block_copy(v3);

  return v4;
}

- (BOOL)isLoaded
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(AMSBagNetworkDataSource *)self cachedResult];
  id v4 = [v3 data];
  BOOL v5 = v4 != 0;

  os_unfair_recursive_lock_unlock();
  return v5;
}

- (NSString)descriptionExtended
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(AMSBagNetworkDataSource *)self description];
  [v3 appendString:v4];

  os_unfair_recursive_lock_lock_with_options();
  BOOL v5 = [(AMSBagNetworkDataSource *)self cachedResult];
  objc_super v6 = [v5 data];

  os_unfair_recursive_lock_unlock();
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:1 error:0];
    if (v7) {
      id v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
    uint64_t v7 = 0;
  }
  [v3 appendFormat:@"\n%@", v8];

  return (NSString *)v3;
}

- (void)setDefaultValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v8 = [(AMSBagNetworkDataSource *)self defaultValues];
  [v8 setObject:v7 forKeyedSubscript:v6];

  os_unfair_recursive_lock_unlock();
}

- (id)valueForURLVariable:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMSBagNetworkDataSource *)self processInfo];
  int v9 = +[AMSBagNetworkDataSource valueForURLVariable:v7 account:v6 clientInfo:v8];

  return v9;
}

- (void)valueForURLVariable:(id)a3 account:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AMSBagNetworkDataSource *)self processInfo];
  +[AMSBagNetworkDataSource valueForURLVariable:v10 account:v9 clientInfo:v11 completion:v8];
}

+ (id)valueForURLVariable:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__9;
  id v18 = __Block_byref_object_dispose__9;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__AMSBagNetworkDataSource_valueForURLVariable_account_clientInfo___block_invoke;
  v13[3] = &unk_1E559F840;
  v13[4] = &v14;
  [a1 _valueForURLVariable:v8 account:v9 clientInfo:v10 sync:1 completion:v13];
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __66__AMSBagNetworkDataSource_valueForURLVariable_account_clientInfo___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_accountStoreDidChange
{
  id v3 = [(AMSBagNetworkDataSource *)self processAccountStoreDidChangeNotificationQueue];
  dispatch_assert_queue_not_V2(v3);

  objc_initWeak(&location, self);
  id v4 = [(AMSBagNetworkDataSource *)self processAccountStoreDidChangeNotificationQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__AMSBagNetworkDataSource__accountStoreDidChange__block_invoke;
  v9[3] = &unk_1E559F890;
  objc_copyWeak(&v10, &location);
  BOOL v5 = v9;
  id v6 = v4;
  id v7 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_0;
  block[3] = &unk_1E559EAE0;
  id v13 = v7;
  id v14 = v5;
  id v8 = v7;
  dispatch_async(v6, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __49__AMSBagNetworkDataSource__accountStoreDidChange__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained cachedStorefront];
    id v4 = [v2 accountProvider];
    BOOL v5 = [v2 processInfo];
    id v6 = [v5 accountMediaType];
    uint64_t v7 = [v4 bagStorefrontForAccountMediaType:v6];

    if (v3 | v7 && ([(id)v3 isEqualToString:v7] & 1) == 0)
    {
      id v8 = +[AMSLogConfig sharedBagConfig];
      if (!v8)
      {
        id v8 = +[AMSLogConfig sharedConfig];
      }
      id v9 = [v8 OSLogObject];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = objc_opt_class();
        id v11 = AMSLogKey();
        uint64_t v12 = AMSHashIfNeeded((void *)v3);
        id v13 = AMSHashIfNeeded((void *)v7);
        *(_DWORD *)buf = 138544130;
        uint64_t v19 = v10;
        __int16 v20 = 2114;
        id v21 = v11;
        __int16 v22 = 2114;
        __int16 v23 = v12;
        __int16 v24 = 2114;
        id v25 = v13;
        _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The storefront changed. Clearing the bag from the in-memory cache. oldStorefront = %{public}@ | newStorefront = %{public}@", buf, 0x2Au);
      }
      [v2 setCachedStorefront:v7];
      os_unfair_recursive_lock_lock_with_options();
      [v2 setCachedResult:0];
      id v14 = [v2 dataSourceDataInvalidatedHandler];
      os_unfair_recursive_lock_unlock();
      if (v14)
      {
        int v15 = [v2 processAccountStoreDidChangeNotificationQueue];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __49__AMSBagNetworkDataSource__accountStoreDidChange__block_invoke_35;
        v16[3] = &unk_1E559F868;
        v16[4] = v2;
        id v17 = v14;
        dispatch_async(v15, v16);
      }
    }
  }
}

void __49__AMSBagNetworkDataSource__accountStoreDidChange__block_invoke_35(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) profile];
  uint64_t v3 = [*(id *)(a1 + 32) profileVersion];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)_invalidateCacheNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = +[AMSLogConfig sharedBagConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  BOOL v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = AMSLogKey();
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Notification received to invalidate cache", (uint8_t *)&v8, 0x16u);
  }
  os_unfair_recursive_lock_lock_with_options();
  [(AMSBagNetworkDataSource *)self setCachedResult:0];
  os_unfair_recursive_lock_unlock();
}

- (AMSObserver)accountsChangedObserver
{
  return self->_accountsChangedObserver;
}

- (void)setAccountsChangedObserver:(id)a3
{
}

- (os_unfair_recursive_lock_s)cachedDataAccessLock
{
  return self->_cachedDataAccessLock;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (void)setDefaultValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAccountStoreDidChangeNotificationQueue, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_currentLoadTask, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_cachedResult, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_accountsChangedObserver, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong(&self->_dataSourceDataInvalidatedHandler, 0);
  objc_storeStrong(&self->_dataSourceChangedHandler, 0);
  objc_storeStrong((id *)&self->_cachedStorefront, 0);
}

@end