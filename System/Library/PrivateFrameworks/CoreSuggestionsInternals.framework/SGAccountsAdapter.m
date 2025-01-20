@interface SGAccountsAdapter
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (SGAccountsAdapter)sharedInstance;
- (BOOL)hasCalendarAccount:(id)a3;
- (BOOL)readCachedAccounts;
- (SGAccountsAdapter)init;
- (id)primaryICloudCalendarAccount;
- (id)serverIdentifierForAccount:(id)a3;
- (void)accountsStoreDidChange:(id)a3;
- (void)cancelUpdateTimer;
- (void)dealloc;
- (void)refreshCacheFromAccountsService;
- (void)registerNotificationObserver;
- (void)removeNotificationObserver;
- (void)setCachedAccounts;
- (void)setUpdateTimerWithDelaySeconds:(unint64_t)a3;
@end

@implementation SGAccountsAdapter

- (id)primaryICloudCalendarAccount
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_cachedPrimaryICloudAccount;
  objc_sync_exit(v2);

  return v3;
}

+ (SGAccountsAdapter)sharedInstance
{
  if (sharedInstance__pasOnceToken2_6699 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_6699, &__block_literal_global_6700);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_6701;
  return (SGAccountsAdapter *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimerSource, 0);
  objc_storeStrong((id *)&self->_updateTimerQueue, 0);
  objc_storeStrong((id *)&self->_updateSource, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_cachedPrimaryICloudAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_usernamesCache, 0);
}

- (id)serverIdentifierForAccount:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(ACAccountStore *)v5->_accountStore accountWithIdentifier:v4];
  v7 = v6;
  if (!v6)
  {
    uint64_t v19 = 0;
    goto LABEL_9;
  }
  v8 = [v6 parentAccount];
  if (v8)
  {
    v9 = [v7 parentAccount];
    v10 = [v9 accountType];
    v11 = [v10 identifier];
    v12 = (void *)*MEMORY[0x1E4F17750];
    int v13 = [v11 isEqualToString:*MEMORY[0x1E4F17750]];

    if (v13)
    {
      id v14 = v12;
LABEL_7:
      uint64_t v19 = (uint64_t)v14;
LABEL_9:
      LODWORD(v20) = 1;
      goto LABEL_14;
    }
  }
  v15 = [v7 accountType];
  v16 = [v15 identifier];
  v17 = (void *)*MEMORY[0x1E4F177C0];
  int v18 = [v16 isEqualToString:*MEMORY[0x1E4F177C0]];

  if (v18)
  {
    id v14 = v17;
    goto LABEL_7;
  }
  v21 = [v7 accountProperties];
  uint64_t v19 = *MEMORY[0x1E4F176A8];
  v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F176A8]];

  if (v22
    || (uint64_t v19 = *MEMORY[0x1E4F176B0],
        [v21 objectForKeyedSubscript:*MEMORY[0x1E4F176B0]],
        v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v20))
  {
    uint64_t v19 = [v21 objectForKeyedSubscript:v19];
    LODWORD(v20) = 1;
  }

LABEL_14:
  objc_sync_exit(v5);

  if (v20) {
    v23 = (void *)v19;
  }
  else {
    v23 = 0;
  }

  return v23;
}

- (BOOL)hasCalendarAccount:(id)a3
{
  id v4 = self;
  id v5 = a3;
  objc_sync_enter(v4);
  v6 = v4->_usernamesCache;
  objc_sync_exit(v4);

  LOBYTE(v4) = [(NSSet *)v6 containsObject:v5];
  return (char)v4;
}

- (void)removeNotificationObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)dealloc
{
  [(SGAccountsAdapter *)self removeNotificationObserver];
  v3.receiver = self;
  v3.super_class = (Class)SGAccountsAdapter;
  [(SGAccountsAdapter *)&v3 dealloc];
}

- (void)registerNotificationObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_accountsStoreDidChange_ name:*MEMORY[0x1E4F178D8] object:self->_accountStore];
}

- (void)setUpdateTimerWithDelaySeconds:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  id v4 = obj;
  if (obj->_updateTimerIsSet)
  {
    dispatch_suspend((dispatch_object_t)obj->_updateTimerSource);
    id v4 = obj;
  }
  updateTimerSource = v4->_updateTimerSource;
  double v6 = (double)a3;
  if (a3)
  {
    if (a3 <= 0x225C17D04) {
      dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    }
    else {
      dispatch_time_t v7 = -1;
    }
  }
  else
  {
    dispatch_time_t v7 = 0;
  }
  dispatch_source_set_timer(updateTimerSource, v7, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v6 * 0.1 * 1000000000.0));
  dispatch_resume((dispatch_object_t)obj->_updateTimerSource);
  obj->_updateTimerIsSet = 1;
  objc_sync_exit(obj);
}

- (void)cancelUpdateTimer
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_updateTimerIsSet)
  {
    dispatch_suspend((dispatch_object_t)obj->_updateTimerSource);
    obj->_updateTimerIsSet = 0;
  }
  objc_sync_exit(obj);
}

- (void)refreshCacheFromAccountsService
{
  v41[1] = *MEMORY[0x1E4F143B8];
  [(SGAccountsAdapter *)self cancelUpdateTimer];
  accountStore = self->_accountStore;
  v41[0] = *MEMORY[0x1E4F17770];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  uint64_t v40 = *MEMORY[0x1E4F17958];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  id v36 = 0;
  double v6 = [(ACAccountStore *)accountStore accountsWithAccountTypeIdentifiers:v4 preloadedProperties:v5 error:&v36];
  id v7 = v36;

  if (v7)
  {
    v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v7;
      _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "Failed to fetch CalDAV accounts: %@", buf, 0xCu);
    }

    [(SGAccountsAdapter *)self setUpdateTimerWithDelaySeconds:3600];
    goto LABEL_25;
  }
  id obj = (id)objc_opt_new();
  v29 = self;
  location = (id *)&self->_cachedPrimaryICloudAccount;
  v28 = self->_cachedPrimaryICloudAccount;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v30 = v6;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (!v10)
  {
    v12 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  v12 = 0;
  uint64_t v13 = *(void *)v33;
  uint64_t v14 = *MEMORY[0x1E4F17A80];
  uint64_t v15 = *MEMORY[0x1E4F4BF38];
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(v9);
      }
      v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      int v18 = objc_msgSend(v17, "enabledDataclasses", location);
      if (![v18 containsObject:v14]) {
        goto LABEL_14;
      }
      uint64_t v19 = [v17 username];

      if (v19)
      {
        v20 = [v17 username];
        [obj addObject:v20];

        v21 = [v17 parentAccount];
        int v22 = objc_msgSend(v21, "aa_isAccountClass:", v15);

        if (v22)
        {
          [v17 identifier];
          int v18 = v12;
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_14:

          continue;
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  }
  while (v11);
LABEL_19:

  v23 = sgLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138739971;
    id v39 = obj;
    _os_log_debug_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEBUG, "Calendar accounts updated: %{sensitive}@", buf, 0xCu);
  }

  v24 = v29;
  objc_sync_enter(v24);
  objc_storeStrong(v24 + 1, obj);
  objc_sync_exit(v24);

  if (v12 != v28 && ([(NSString *)v12 isEqual:v28] & 1) == 0)
  {
    v25 = NSStringFromSelector(sel_primaryICloudCalendarAccount);
    [v24 willChangeValueForKey:v25];
    v26 = v24;
    objc_sync_enter(v26);
    objc_storeStrong(location, v12);
    objc_sync_exit(v26);

    [v26 didChangeValueForKey:v25];
  }
  objc_msgSend(v24, "setCachedAccounts", location);

  id v7 = 0;
  double v6 = v30;
LABEL_25:
}

- (void)accountsStoreDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    double v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F17810]];

    if (v7 && [v7 isEqual:*MEMORY[0x1E4F17770]])
    {
      v8 = sgLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [v5 userInfo];
        int v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "Refreshing due to account change: %@", (uint8_t *)&v11, 0xCu);
      }
      dispatch_source_merge_data((dispatch_source_t)self->_updateSource, 1uLL);
      goto LABEL_10;
    }
  }
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v5 userInfo];
    int v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_INFO, "Filtering account change that we don't care about: %@", (uint8_t *)&v11, 0xCu);
  }
LABEL_10:
}

- (void)setCachedAccounts
{
  id v5 = (id)objc_opt_new();
  id v3 = self;
  objc_sync_enter(v3);
  if (v3->_cachedPrimaryICloudAccount && v3->_usernamesCache)
  {
    objc_msgSend(v5, "addObject:");
    id v4 = [(NSSet *)v3->_usernamesCache allObjects];
    [v5 addObjectsFromArray:v4];
  }
  [MEMORY[0x1E4F5DAF0] setUserAccountsPersistedState:v5];
  objc_sync_exit(v3);
}

- (BOOL)readCachedAccounts
{
  id v3 = [MEMORY[0x1E4F5DAF0] userAccountsPersistedState];
  id v4 = self;
  objc_sync_enter(v4);
  if (v3 && [v3 count])
  {
    uint64_t v5 = [v3 firstObject];
    cachedPrimaryICloudAccount = v4->_cachedPrimaryICloudAccount;
    v4->_cachedPrimaryICloudAccount = (NSString *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v8 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    uint64_t v9 = [v7 initWithArray:v8];
    usernamesCache = v4->_usernamesCache;
    v4->_usernamesCache = (NSSet *)v9;
  }
  else
  {
    int v11 = v4->_cachedPrimaryICloudAccount;
    v4->_cachedPrimaryICloudAccount = 0;

    uint64_t v12 = objc_opt_new();
    v8 = v4->_usernamesCache;
    v4->_usernamesCache = (NSSet *)v12;
  }

  objc_sync_exit(v4);
  return v3 != 0;
}

- (SGAccountsAdapter)init
{
  v28.receiver = self;
  v28.super_class = (Class)SGAccountsAdapter;
  id v2 = [(SGAccountsAdapter *)&v28 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    id v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    uint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    double v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v8 = dispatch_queue_create((const char *)[v7 UTF8String], v5);
    uint64_t v9 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v8;

    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14440], 0, 0, *((dispatch_queue_t *)v2 + 4));
    int v11 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v10;

    id v12 = [NSString alloc];
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    id v15 = (id) [v12 initWithFormat:@"%@-timer", v14];
    dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], v5);
    v17 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v16;

    dispatch_source_t v18 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 7));
    uint64_t v19 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v18;

    id location = 0;
    objc_initWeak(&location, v2);
    v20 = *((void *)v2 + 5);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __25__SGAccountsAdapter_init__block_invoke;
    handler[3] = &unk_1E65C0018;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v20, handler);
    v21 = *((void *)v2 + 8);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __25__SGAccountsAdapter_init__block_invoke_2;
    v23[3] = &unk_1E65C0018;
    objc_copyWeak(&v24, &location);
    dispatch_source_set_event_handler(v21, v23);
    if (([v2 readCachedAccounts] & 1) == 0) {
      [v2 refreshCacheFromAccountsService];
    }
    dispatch_activate(*((dispatch_object_t *)v2 + 5));
    [v2 registerNotificationObserver];
    [v2 setUpdateTimerWithDelaySeconds:10];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return (SGAccountsAdapter *)v2;
}

void __25__SGAccountsAdapter_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshCacheFromAccountsService];
}

void __25__SGAccountsAdapter_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    dispatch_source_merge_data(WeakRetained[5], 1uLL);
    id WeakRetained = v2;
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_primaryICloudCalendarAccount);
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___SGAccountsAdapter;
    unsigned __int8 v7 = objc_msgSendSuper2(&v9, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v7;
}

void __35__SGAccountsAdapter_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)sharedInstance__pasExprOnceResult_6701;
  sharedInstance__pasExprOnceResult_6701 = v1;
}

@end