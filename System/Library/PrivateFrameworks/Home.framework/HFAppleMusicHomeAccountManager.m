@interface HFAppleMusicHomeAccountManager
+ (id)sharedInstance;
- (HFAppleMusicHomeAccountManager)init;
- (NSMutableDictionary)homeIdentifierToActiveAMSQueriesMapping;
- (NSMutableDictionary)homeIdentifierToFuturePromiseMapping;
- (NSMutableDictionary)homeIdentifierToMediaAccountMapping;
- (OS_dispatch_queue)concurrentQueryQueue;
- (OS_dispatch_queue)dataModelUpdateQueue;
- (id)_fetchMediaAccountForHome:(id)a3;
- (id)_futureForQueryLimitForHome:(id)a3;
- (id)mediaAccountForHomeIdentifier:(id)a3;
- (void)_finishPendingPromisesWithMediaAccountInfo:(id)a3 forHome:(id)a4;
- (void)executeHomeMediaAccountFetchForAllHomes;
- (void)getHomeMediaAccountForHome:(id)a3 withCompletion:(id)a4;
- (void)setAMSiTunesAccount:(id)a3 forHome:(id)a4 completion:(id)a5;
- (void)setConcurrentQueryQueue:(id)a3;
- (void)setDataModelUpdateQueue:(id)a3;
- (void)setHomeIdentifierToActiveAMSQueriesMapping:(id)a3;
- (void)setHomeIdentifierToFuturePromiseMapping:(id)a3;
- (void)setHomeIdentifierToMediaAccountMapping:(id)a3;
@end

@implementation HFAppleMusicHomeAccountManager

void __85__HFAppleMusicHomeAccountManager__finishPendingPromisesWithMediaAccountInfo_forHome___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [a1[4] homeIdentifierToActiveAMSQueriesMapping];
  v3 = [a1[5] uniqueIdentifier];
  v4 = [v3 UUIDString];
  v5 = [v2 objectForKey:v4];

  uint64_t v6 = [v5 unsignedIntegerValue];
  v7 = [a1[4] homeIdentifierToActiveAMSQueriesMapping];
  if (v6 == 1)
  {
    v8 = objc_msgSend(a1[5], "uniqueIdentifier", v5);
    v9 = [v8 UUIDString];
    [v7 removeObjectForKey:v9];
  }
  else
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "unsignedIntegerValue", v5) - 1);
    v9 = [a1[5] uniqueIdentifier];
    v10 = [v9 UUIDString];
    [v7 setObject:v8 forKey:v10];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v11 = [a1[4] homeIdentifierToFuturePromiseMapping];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v17 = [a1[4] homeIdentifierToFuturePromiseMapping];
        v18 = [v17 objectForKeyedSubscript:v16];

        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __85__HFAppleMusicHomeAccountManager__finishPendingPromisesWithMediaAccountInfo_forHome___block_invoke_2;
        v21[3] = &unk_26408E4E0;
        id v22 = a1[6];
        objc_msgSend(v18, "na_each:", v21);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  v19 = [a1[4] homeIdentifierToFuturePromiseMapping];
  [v19 removeAllObjects];
}

- (NSMutableDictionary)homeIdentifierToFuturePromiseMapping
{
  return self->_homeIdentifierToFuturePromiseMapping;
}

void __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained homeIdentifierToActiveAMSQueriesMapping];

  if (!v2)
  {
    v3 = objc_opt_new();
    [WeakRetained setHomeIdentifierToActiveAMSQueriesMapping:v3];
  }
  v4 = [WeakRetained homeIdentifierToActiveAMSQueriesMapping];
  v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = [v5 UUIDString];
  v7 = [v4 objectForKey:v6];

  if ((unint64_t)[v7 unsignedIntegerValue] > 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v8 = [WeakRetained homeIdentifierToActiveAMSQueriesMapping];
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + 1);
    v10 = [*(id *)(a1 + 32) uniqueIdentifier];
    v11 = [v10 UUIDString];
    [v8 setObject:v9 forKey:v11];
  }
}

- (NSMutableDictionary)homeIdentifierToActiveAMSQueriesMapping
{
  return self->_homeIdentifierToActiveAMSQueriesMapping;
}

- (void)setHomeIdentifierToActiveAMSQueriesMapping:(id)a3
{
}

+ (id)sharedInstance
{
  if (qword_26AB2EE98 != -1) {
    dispatch_once(&qword_26AB2EE98, &__block_literal_global_38);
  }
  v2 = (void *)_MergedGlobals_231;
  return v2;
}

void __64__HFAppleMusicHomeAccountManager_mediaAccountForHomeIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) homeIdentifierToMediaAccountMapping];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSMutableDictionary)homeIdentifierToMediaAccountMapping
{
  return self->_homeIdentifierToMediaAccountMapping;
}

- (id)_fetchMediaAccountForHome:(id)a3
{
  id v5 = a3;
  if (![v5 isMultiUserEnabled]
    || ([(HFAppleMusicHomeAccountManager *)self _futureForQueryLimitForHome:v5],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x263F58190];
    uint64_t v10 = MEMORY[0x263EF8330];
    objc_copyWeak(v12, &location);
    id v11 = v5;
    v12[1] = (id)a2;
    v8 = objc_msgSend(MEMORY[0x263F581B8], "globalAsyncScheduler", v10, 3221225472, __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke, &unk_26408FC88);
    uint64_t v6 = [v7 futureWithBlock:&v10 scheduler:v8];

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke(uint64_t a1, void *a2)
{
  v61[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    char v7 = [v6 isMultiUserEnabled];
    v8 = HFLogForCategory(5uLL);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
        id v11 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v53 = v10;
        __int16 v54 = 2112;
        v55 = v11;
        __int16 v56 = 1024;
        LODWORD(v57) = [v11 isMultiUserEnabled];
        _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@ Now Fetching ams_iTunesAccount for Home [%@] MU enabled = %d", buf, 0x1Cu);
      }
      uint64_t v12 = [*(id *)(a1 + 32) uniqueIdentifier];
      uint64_t v13 = objc_msgSend(v5, "ams_mediaAccountForHomeWithIdentifier:", v12);

      id v49 = 0;
      uint64_t v14 = [v13 resultWithTimeout:&v49 error:2.0];
      id v15 = v49;
      uint64_t v16 = v15;
      if (!v14 || v15)
      {
        if (v15)
        {
          if ([v15 code] == 13)
          {
            v33 = [WeakRetained concurrentQueryQueue];
            v44[0] = MEMORY[0x263EF8330];
            v44[1] = 3221225472;
            v44[2] = __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke_2;
            v44[3] = &unk_26408D388;
            v44[4] = WeakRetained;
            id v45 = *(id *)(a1 + 32);
            id v46 = v3;
            dispatch_sync(v33, v44);

            v34 = HFLogForCategory(5uLL);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              v35 = NSStringFromSelector(*(SEL *)(a1 + 48));
              v36 = *(void **)(a1 + 32);
              *(_DWORD *)buf = 138412546;
              v53 = v35;
              __int16 v54 = 2112;
              v55 = v36;
              _os_log_impl(&dword_20B986000, v34, OS_LOG_TYPE_DEFAULT, "%@ams_iTunesAccount migration is in flight for Home [%@]. We will finish the promise later when the information is available. Right now, returning...", buf, 0x16u);
            }
            id v24 = 0;
            goto LABEL_26;
          }
          v43 = v13;
          v37 = [*(id *)(a1 + 32) uniqueIdentifier];
          v38 = [v37 UUIDString];
          v50 = v38;
          v39 = [MEMORY[0x263EFF9D0] null];
          v51 = v39;
          id v24 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];

          v40 = HFLogForCategory(5uLL);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = NSStringFromSelector(*(SEL *)(a1 + 48));
            v42 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138412802;
            v53 = v41;
            __int16 v54 = 2112;
            v55 = v42;
            __int16 v56 = 2112;
            v57 = v16;
            _os_log_impl(&dword_20B986000, v40, OS_LOG_TYPE_DEFAULT, "%@ Failed to fetch ams_iTunesAccount for Home [%@] - [%@]", buf, 0x20u);
          }
          [v3 finishWithResult:v24];
          uint64_t v13 = v43;
        }
        else
        {
          id v24 = 0;
        }
      }
      else
      {
        v17 = [*(id *)(a1 + 32) uniqueIdentifier];
        v18 = [v17 UUIDString];
        v58 = v18;
        v59 = v14;
        v19 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];

        v20 = HFLogForCategory(5uLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = NSStringFromSelector(*(SEL *)(a1 + 48));
          id v22 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412802;
          v53 = v21;
          __int16 v54 = 2112;
          v55 = v19;
          __int16 v56 = 2112;
          v57 = v22;
          _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "%@ Successfully fetched ams_iTunesAccount [%@] for Home [%@]", buf, 0x20u);
        }
        long long v23 = [WeakRetained dataModelUpdateQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke_17;
        block[3] = &unk_26408D450;
        block[4] = WeakRetained;
        id v24 = v19;
        id v48 = v24;
        dispatch_barrier_sync(v23, block);

        [v3 finishWithResult:v24];
      }
      [WeakRetained _finishPendingPromisesWithMediaAccountInfo:v24 forHome:*(void *)(a1 + 32)];
LABEL_26:

      goto LABEL_27;
    }
    if (v9)
    {
      v27 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v28 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v53 = v27;
      __int16 v54 = 2112;
      v55 = v28;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@ This Home [%@] does NOT have Multi-User enabled, returning", buf, 0x16u);
    }
    v29 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 57);
    [v3 finishWithError:v29];

    v30 = [*(id *)(a1 + 32) uniqueIdentifier];
    v31 = [v30 UUIDString];
    v60 = v31;
    v32 = [MEMORY[0x263EFF9D0] null];
    v61[0] = v32;
    id v24 = [NSDictionary dictionaryWithObjects:v61 forKeys:&v60 count:1];

    [v3 finishWithResult:v24];
  }
  else
  {
    long long v25 = HFLogForCategory(5uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      long long v26 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412290;
      v53 = v26;
      _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_DEFAULT, "%@ This Home no longer exists, returning", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 59);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    [v3 finishWithError:v24];
  }
LABEL_27:
}

- (id)_futureForQueryLimitForHome:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  objc_initWeak(&location, self);
  uint64_t v6 = [(HFAppleMusicHomeAccountManager *)self concurrentQueryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke;
  block[3] = &unk_26408FCB0;
  objc_copyWeak(&v21, &location);
  id v7 = v5;
  id v19 = v7;
  v20 = &v23;
  dispatch_sync(v6, block);

  if (*((unsigned char *)v24 + 24))
  {
    v8 = [(HFAppleMusicHomeAccountManager *)self homeIdentifierToFuturePromiseMapping];
    BOOL v9 = v8 == 0;

    if (v9)
    {
      uint64_t v10 = objc_opt_new();
      [(HFAppleMusicHomeAccountManager *)self setHomeIdentifierToFuturePromiseMapping:v10];
    }
    id v11 = HFLogForCategory(5uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v12;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "%@ Unable to query Home Media Account for Home [%@] query limit reached.\nWe will callback the request later when the information is available.", buf, 0x16u);
    }
    uint64_t v13 = (void *)MEMORY[0x263F58190];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke_22;
    v16[3] = &unk_26408F0C8;
    v16[4] = self;
    id v17 = v7;
    uint64_t v14 = [v13 futureWithBlock:v16];
  }
  else
  {
    uint64_t v14 = 0;
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v23, 8);

  return v14;
}

- (void)_finishPendingPromisesWithMediaAccountInfo:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HFAppleMusicHomeAccountManager *)self concurrentQueryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__HFAppleMusicHomeAccountManager__finishPendingPromisesWithMediaAccountInfo_forHome___block_invoke;
  block[3] = &unk_26408D388;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (OS_dispatch_queue)concurrentQueryQueue
{
  return self->_concurrentQueryQueue;
}

uint64_t __48__HFAppleMusicHomeAccountManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(HFAppleMusicHomeAccountManager);
  uint64_t v1 = _MergedGlobals_231;
  _MergedGlobals_231 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFAppleMusicHomeAccountManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)HFAppleMusicHomeAccountManager;
  uint64_t v2 = [(HFAppleMusicHomeAccountManager *)&v11 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create((const char *)kHomeMediaAccountsDataModelUpdateQueue, 0);
    dataModelUpdateQueue = v2->_dataModelUpdateQueue;
    v2->_dataModelUpdateQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create((const char *)kHomeMediaAccountsQueriesQueue, 0);
    concurrentQueryQueue = v2->_concurrentQueryQueue;
    v2->_concurrentQueryQueue = (OS_dispatch_queue *)v5;

    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_applicationWillEnterForeground name:*MEMORY[0x263F1D0D0] object:0];

    uint64_t v8 = objc_opt_new();
    homeIdentifierToMediaAccountMapping = v2->_homeIdentifierToMediaAccountMapping;
    v2->_homeIdentifierToMediaAccountMapping = (NSMutableDictionary *)v8;
  }
  return v2;
}

- (id)mediaAccountForHomeIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  uint64_t v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  dispatch_queue_t v5 = [(HFAppleMusicHomeAccountManager *)self dataModelUpdateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HFAppleMusicHomeAccountManager_mediaAccountForHomeIdentifier___block_invoke;
  block[3] = &unk_26408FC10;
  id v10 = v4;
  objc_super v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_barrier_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (OS_dispatch_queue)dataModelUpdateQueue
{
  return self->_dataModelUpdateQueue;
}

- (void)executeHomeMediaAccountFetchForAllHomes
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v4 = HFLogForCategory(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@ Fetching Media Accounts for All Homes", buf, 0xCu);
  }
  id v6 = [(HFAppleMusicHomeAccountManager *)self homeIdentifierToMediaAccountMapping];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    [(HFAppleMusicHomeAccountManager *)self setHomeIdentifierToMediaAccountMapping:v8];
  }
  id v9 = +[HFHomeKitDispatcher sharedDispatcher];
  id v10 = [v9 homeManager];
  objc_super v11 = [v10 homes];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  id v12[2] = __73__HFAppleMusicHomeAccountManager_executeHomeMediaAccountFetchForAllHomes__block_invoke;
  v12[3] = &unk_26408FBE8;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a2;
  objc_msgSend(v11, "na_each:", v12);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __73__HFAppleMusicHomeAccountManager_executeHomeMediaAccountFetchForAllHomes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v5 = HFLogForCategory(5uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "%@ Fetching ams_iTunesAccount for Home  %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = (id)[WeakRetained executeHomeMediaAccountFetchForHome:v3];
}

- (void)setAMSiTunesAccount:(id)a3 forHome:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  id v13 = [v10 uniqueIdentifier];
  uint64_t v14 = objc_msgSend(v12, "ams_setiTunesAccount:forHomeWithIdentifier:", v9, v13);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __73__HFAppleMusicHomeAccountManager_setAMSiTunesAccount_forHome_completion___block_invoke;
  v18[3] = &unk_26408FC60;
  id v22 = v11;
  SEL v23 = a2;
  id v19 = v10;
  v20 = self;
  id v21 = v9;
  id v15 = v9;
  id v16 = v11;
  id v17 = v10;
  [v14 addFinishBlock:v18];
}

void __73__HFAppleMusicHomeAccountManager_setAMSiTunesAccount_forHome_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_t v5 = HFLogForCategory(5uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "%@ Error setting amsMediaAccount for home %@", buf, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F58190];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    id v13[2] = __73__HFAppleMusicHomeAccountManager_setAMSiTunesAccount_forHome_completion___block_invoke_11;
    v13[3] = &unk_26408FC38;
    int v8 = *(void **)(a1 + 48);
    v13[4] = *(void *)(a1 + 40);
    id v14 = v8;
    id v15 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 56);
    id v16 = 0;
    id v17 = v9;
    id v10 = (id)[v7 futureWithBlock:v13];
  }
}

void __73__HFAppleMusicHomeAccountManager_setAMSiTunesAccount_forHome_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) homeIdentifierToMediaAccountMapping];
  uint64_t v4 = *(void *)(a1 + 40);
  dispatch_queue_t v5 = [*(id *)(a1 + 48) uniqueIdentifier];
  uint64_t v6 = [v5 UUIDString];
  [v3 setObject:v4 forKey:v6];

  uint64_t v7 = *(void *)(a1 + 64);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 56));
  }
  [v8 finishWithNoResult];
}

void __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke_17(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeIdentifierToMediaAccountMapping];
  [v2 addEntriesFromDictionary:*(void *)(a1 + 40)];
}

void __60__HFAppleMusicHomeAccountManager__fetchMediaAccountForHome___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeIdentifierToFuturePromiseMapping];

  if (!v2)
  {
    id v3 = objc_opt_new();
    [*(id *)(a1 + 32) setHomeIdentifierToFuturePromiseMapping:v3];
  }
  uint64_t v4 = [*(id *)(a1 + 32) homeIdentifierToFuturePromiseMapping];
  dispatch_queue_t v5 = [*(id *)(a1 + 40) uniqueIdentifier];
  uint64_t v6 = [v5 UUIDString];
  uint64_t v7 = [v4 objectForKey:v6];

  objc_opt_class();
  id v18 = v7;
  if (objc_opt_isKindOfClass()) {
    id v8 = v18;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = (void *)[v9 mutableCopy];
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_opt_new();
  }
  id v13 = v12;

  [v13 addObject:*(void *)(a1 + 48)];
  id v14 = [*(id *)(a1 + 32) homeIdentifierToFuturePromiseMapping];
  id v15 = (void *)[v13 copy];
  id v16 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v17 = [v16 UUIDString];
  [v14 setObject:v15 forKey:v17];
}

void __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) concurrentQueryQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke_2;
  block[3] = &unk_26408D388;
  dispatch_queue_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_sync(v4, block);
}

void __62__HFAppleMusicHomeAccountManager__futureForQueryLimitForHome___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeIdentifierToFuturePromiseMapping];
  id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  uint64_t v4 = [v3 UUIDString];
  dispatch_queue_t v5 = [v2 objectForKey:v4];

  objc_opt_class();
  id v16 = v5;
  if (objc_opt_isKindOfClass()) {
    id v6 = v16;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = (void *)[v7 mutableCopy];
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  id v11 = v10;

  [v11 addObject:*(void *)(a1 + 48)];
  id v12 = [*(id *)(a1 + 32) homeIdentifierToFuturePromiseMapping];
  id v13 = (void *)[v11 copy];
  id v14 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v15 = [v14 UUIDString];
  [v12 setObject:v13 forKey:v15];
}

uint64_t __85__HFAppleMusicHomeAccountManager__finishPendingPromisesWithMediaAccountInfo_forHome___block_invoke_2(uint64_t result, void *a2)
{
  if (a2) {
    return [a2 finishWithResult:*(void *)(result + 32)];
  }
  return result;
}

- (void)getHomeMediaAccountForHome:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  id v9 = [v7 uniqueIdentifier];
  id v10 = [v9 UUIDString];
  id v11 = [(HFAppleMusicHomeAccountManager *)self mediaAccountForHomeIdentifier:v10];

  if (v11)
  {
    v8[2](v8, v11);
  }
  else
  {
    id v12 = [(HFAppleMusicHomeAccountManager *)self executeHomeMediaAccountFetchForHome:v7];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __76__HFAppleMusicHomeAccountManager_getHomeMediaAccountForHome_withCompletion___block_invoke;
    v14[3] = &unk_26408FCD8;
    SEL v17 = a2;
    v14[4] = self;
    id v15 = v7;
    id v16 = v8;
    id v13 = (id)[v12 addCompletionBlock:v14];
  }
}

void __76__HFAppleMusicHomeAccountManager_getHomeMediaAccountForHome_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory(5uLL);
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v18 = 138412546;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "%@ Error fetching mediaAccount [%@]", (uint8_t *)&v18, 0x16u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = *(void **)(a1 + 32);
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v11 = [*(id *)(a1 + 40) uniqueIdentifier];
    id v12 = [v11 UUIDString];
    id v13 = [v5 objectForKeyedSubscript:v12];
    int v18 = 138412802;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    SEL v23 = v13;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Fetched Home Media Account [%@]", (uint8_t *)&v18, 0x20u);

    goto LABEL_6;
  }

  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v16 = [v15 UUIDString];
  SEL v17 = [v5 objectForKeyedSubscript:v16];
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v17);
}

- (void)setHomeIdentifierToMediaAccountMapping:(id)a3
{
}

- (void)setDataModelUpdateQueue:(id)a3
{
}

- (void)setConcurrentQueryQueue:(id)a3
{
}

- (void)setHomeIdentifierToFuturePromiseMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeIdentifierToFuturePromiseMapping, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToActiveAMSQueriesMapping, 0);
  objc_storeStrong((id *)&self->_concurrentQueryQueue, 0);
  objc_storeStrong((id *)&self->_dataModelUpdateQueue, 0);
  objc_storeStrong((id *)&self->_homeIdentifierToMediaAccountMapping, 0);
}

@end