@interface ACMonitoredAccountStore
- (ACMonitoredAccountStore)initWithAccountTypes:(id)a3 delegate:(id)a4;
- (ACMonitoredAccountStore)initWithAccountTypes:(id)a3 propertiesToPrefetch:(id)a4 delegate:(id)a5;
- (ACMonitoredAccountStore)initWithWithRemoteEndpoint:(id)a3 effectiveBundleID:(id)a4 accountTypes:(id)a5 propertiesToPrefetch:(id)a6 delegate:(id)a7;
- (NSArray)monitoredAccounts;
- (id)_allDelegates;
- (id)monitoredAccountWithIdentifier:(id)a3;
- (void)_accountsListPopulated:(id)a3;
- (void)_processAccountsListForNotifications:(id)a3 forType:(id)a4;
- (void)_registerAccountMonitorSynchronouslyWithCompletion:(id)a3;
- (void)_registerAccountMonitorWithCompletion:(id)a3;
- (void)_registerForApplicationStateDidChangeNotification;
- (void)_registerForCredentialChangedNotifications;
- (void)_registerNotifyReaders;
- (void)_reregisterForAccountType:(id)a3;
- (void)_sendNotificationOfChange;
- (void)accountWasAdded:(id)a3;
- (void)accountWasModified:(id)a3;
- (void)accountWasRemoved:(id)a3;
- (void)addDelegate:(id)a3;
- (void)credentialsChangedNotification:(id)a3;
- (void)dealloc;
- (void)registerSynchronouslyWithError:(id *)a3;
- (void)registerWithCompletion:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation ACMonitoredAccountStore

uint64_t __78__ACMonitoredAccountStore__registerAccountMonitorSynchronouslyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 registerMonitorForAccountsOfTypes:*(void *)(*(void *)(a1 + 32) + 112) propertiesToPrefetch:*(void *)(*(void *)(a1 + 32) + 128) completion:*(void *)(a1 + 40)];
}

- (NSArray)monitoredAccounts
{
  v3 = self->_accountsByID;
  objc_sync_enter(v3);
  v4 = [(NSMutableDictionary *)self->_accountsByID allValues];
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

void __50__ACMonitoredAccountStore_registerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 56), *(void *)(a1 + 64));
  v8 = _ACSignpostLogSystem();
  v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 56);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = &stru_1EFA0AB58;
    if (v6) {
      v11 = v6;
    }
    int v18 = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    double v21 = *(double *)&v11;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v9, OS_SIGNPOST_INTERVAL_END, v10, "RegisterTypesToMonitor", "%@%@", (uint8_t *)&v18, 0x16u);
  }

  v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v16 = *(void **)(a1 + 56);
    int v18 = 134218754;
    id v19 = v16;
    v17 = &stru_1EFA0AB58;
    __int16 v20 = 2048;
    double v21 = (double)Nanoseconds / 1000000000.0;
    __int16 v22 = 2112;
    id v23 = v5;
    if (v6) {
      v17 = v6;
    }
    __int16 v24 = 2112;
    v25 = v17;
    _os_log_debug_impl(&dword_1A57C5000, v12, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RegisterTypesToMonitor %@%@", (uint8_t *)&v18, 0x2Au);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _registerNotifyReaders];
    if (v6 && [(__CFString *)v6 code] == 7)
    {
      v15 = _ACLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __50__ACMonitoredAccountStore_registerWithCompletion___block_invoke_cold_1(a1, v15);
      }
    }
    else if (v5)
    {
      [v14 _accountsListPopulated:v5];
      [v14 _registerForCredentialChangedNotifications];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __58__ACMonitoredAccountStore_registerSynchronouslyWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  unint64_t Nanoseconds = _ACSignpostGetNanoseconds(*(void *)(a1 + 48), *(void *)(a1 + 56));
  v8 = _ACSignpostLogSystem();
  v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = &stru_1EFA0AB58;
    if (v6) {
      v11 = v6;
    }
    int v19 = 138412546;
    id v20 = v5;
    __int16 v21 = 2112;
    double v22 = *(double *)&v11;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v9, OS_SIGNPOST_INTERVAL_END, v10, "RegisterTypesToMonitorSync", "%@%@", (uint8_t *)&v19, 0x16u);
  }

  v12 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v17 = *(void **)(a1 + 48);
    int v19 = 134218754;
    id v20 = v17;
    int v18 = &stru_1EFA0AB58;
    __int16 v21 = 2048;
    double v22 = (double)Nanoseconds / 1000000000.0;
    __int16 v23 = 2112;
    id v24 = v5;
    if (v6) {
      int v18 = v6;
    }
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    _os_log_debug_impl(&dword_1A57C5000, v12, OS_LOG_TYPE_DEBUG, "END [%lld] %fs: RegisterTypesToMonitorSync %@%@", (uint8_t *)&v19, 0x2Au);
  }

  v13 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) _registerNotifyReaders];
  if (v6 && [(__CFString *)v6 code] == 7)
  {
    v14 = _ACLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __58__ACMonitoredAccountStore_registerSynchronouslyWithError___block_invoke_cold_1(a1 + 32, v14);
    }
  }
  else if (v5)
  {
    [*v13 _accountsListPopulated:v5];
    [*v13 _registerForCredentialChangedNotifications];
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v6;
}

- (void)_accountsListPopulated:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_accountsByID;
  objc_sync_enter(v5);
  [(NSMutableDictionary *)self->_accountsByID removeAllObjects];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        os_signpost_id_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "_setAccountStore:", self, (void)v13);
        accountsByID = self->_accountsByID;
        v12 = [v10 identifier];
        [(NSMutableDictionary *)accountsByID setObject:v10 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
  [(ACMonitoredAccountStore *)self _sendNotificationOfChange];
}

- (void)_sendNotificationOfChange
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ACMonitoredAccountStoreDidChangeNotification" object:self];
}

void __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_2;
  block[3] = &unk_1E5BCCBF0;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

- (void)_registerNotifyReaders
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v14 = [MEMORY[0x1E4F1CA80] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_accountTypesToMonitor;
  uint64_t v3 = [(NSSet *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v7 = +[ACNotifyAccountCache suffixForAccountsForAccountType:v6 fetchOptions:0];
        id v8 = +[ACNotifyAccountCache cacheKeyForSuffix:v7];

        objc_initWeak(&location, self);
        id v9 = [ACNotifyReader alloc];
        id v10 = [(ACAccountStore *)self replyQueue];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __49__ACMonitoredAccountStore__registerNotifyReaders__block_invoke;
        v15[3] = &unk_1E5BCCC90;
        objc_copyWeak(&v16, &location);
        v15[4] = v6;
        v11 = [(ACNotifyReader *)v9 initWithKey:v8 updateQueue:v10 updateBlock:v15];
        [(NSSet *)v14 addObject:v11];

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
      uint64_t v3 = [(NSSet *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v3);
  }

  monitoringReaders = self->_monitoringReaders;
  self->_monitoringReaders = v14;
}

- (ACMonitoredAccountStore)initWithWithRemoteEndpoint:(id)a3 effectiveBundleID:(id)a4 accountTypes:(id)a5 propertiesToPrefetch:(id)a6 delegate:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ACMonitoredAccountStore;
  id v16 = [(ACAccountStore *)&v22 initWithRemoteEndpoint:a3 effectiveBundleID:a4];
  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    accountsByID = v16->_accountsByID;
    v16->_accountsByID = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v16->_delegates;
    v16->_delegates = (NSHashTable *)v19;

    [(NSHashTable *)v16->_delegates addObject:v15];
    objc_storeStrong((id *)&v16->_accountTypesToMonitor, a5);
    objc_storeStrong((id *)&v16->_propertiesToPrefetch, a6);
    [(ACMonitoredAccountStore *)v16 _registerForApplicationStateDidChangeNotification];
  }

  return v16;
}

- (void)_registerForApplicationStateDidChangeNotification
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__ACMonitoredAccountStore__registerForApplicationStateDidChangeNotification__block_invoke;
  v6[3] = &unk_1E5BCCD30;
  v6[4] = self;
  uint64_t v4 = [v3 addObserverForName:@"UIApplicationWillResignActiveNotification" object:0 queue:0 usingBlock:v6];
  didBecomeActiveObserver = self->_didBecomeActiveObserver;
  self->_didBecomeActiveObserver = v4;
}

- (void)_registerForCredentialChangedNotifications
{
  objc_initWeak(&location, self);
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__ACMonitoredAccountStore__registerForCredentialChangedNotifications__block_invoke;
  v6[3] = &unk_1E5BCCD08;
  objc_copyWeak(&v7, &location);
  uint64_t v4 = [v3 addObserverForName:@"ACAccountCredentialsDidChangeNotification" object:0 queue:0 usingBlock:v6];
  credentialsDidChangeObserver = self->_credentialsDidChangeObserver;
  self->_credentialsDidChangeObserver = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (ACMonitoredAccountStore)initWithAccountTypes:(id)a3 delegate:(id)a4
{
  return [(ACMonitoredAccountStore *)self initWithAccountTypes:a3 propertiesToPrefetch:0 delegate:a4];
}

- (ACMonitoredAccountStore)initWithAccountTypes:(id)a3 propertiesToPrefetch:(id)a4 delegate:(id)a5
{
  return [(ACMonitoredAccountStore *)self initWithWithRemoteEndpoint:0 effectiveBundleID:0 accountTypes:a3 propertiesToPrefetch:a4 delegate:a5];
}

- (void)registerWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/register-types-to-monitor", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = _ACSignpostLogSystem();
  id v7 = (char *)_ACSignpostCreate(v6);
  id v9 = v8;

  id v10 = _ACSignpostLogSystem();
  v11 = v10;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    accountTypesToMonitor = self->_accountTypesToMonitor;
    *(_DWORD *)buf = 138412290;
    long long v20 = accountTypesToMonitor;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "RegisterTypesToMonitor", "%@", buf, 0xCu);
  }

  id v13 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ACMonitoredAccountStore registerWithCompletion:]();
  }

  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__ACMonitoredAccountStore_registerWithCompletion___block_invoke;
  v15[3] = &unk_1E5BCCBA0;
  v17[1] = v7;
  v17[2] = v9;
  objc_copyWeak(v17, (id *)buf);
  v15[4] = self;
  id v14 = v4;
  id v16 = v14;
  [(ACMonitoredAccountStore *)self _registerAccountMonitorWithCompletion:v15];

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

- (void)_registerAccountMonitorWithCompletion:(id)a3
{
  id v4 = a3;
  accountTypesToMonitor = self->_accountTypesToMonitor;
  if (!accountTypesToMonitor)
  {
    id v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    id v12 = @"_accountTypesToMonitor must be non-nil";
    goto LABEL_6;
  }
  if (![(NSSet *)accountTypesToMonitor count])
  {
    id v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    id v12 = @"_accountTypesToMonitor must not be empty";
LABEL_6:
    id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];
    objc_exception_throw(v13);
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke;
  v18[3] = &unk_1E5BCCC18;
  v18[4] = self;
  id v19 = v4;
  id v6 = v4;
  id v7 = (void *)MEMORY[0x1A626DA80](v18);
  id v8 = [(ACAccountStore *)self remoteAccountStoreSession];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_3;
  v16[3] = &unk_1E5BCCC40;
  v16[4] = self;
  id v17 = v7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_4;
  v14[3] = &unk_1E5BCCC68;
  v14[4] = self;
  id v15 = v17;
  id v9 = v17;
  ac_dispatch_remote(v8, v16, v14);
}

uint64_t __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 registerMonitorForAccountsOfTypes:*(void *)(*(void *)(a1 + 32) + 112) propertiesToPrefetch:*(void *)(*(void *)(a1 + 32) + 128) completion:*(void *)(a1 + 40)];
}

uint64_t __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)registerSynchronouslyWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_1A57C5000, "accounts/register-types-to-monitor-sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = _ACSignpostLogSystem();
  os_signpost_id_t v7 = _ACSignpostCreate(v6);
  uint64_t v9 = v8;

  id v10 = _ACSignpostLogSystem();
  uint64_t v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    accountTypesToMonitor = self->_accountTypesToMonitor;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = accountTypesToMonitor;
    _os_signpost_emit_with_name_impl(&dword_1A57C5000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RegisterTypesToMonitorSync", "%@", (uint8_t *)&buf, 0xCu);
  }

  id v13 = _ACSignpostLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ACMonitoredAccountStore registerSynchronouslyWithError:]();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__ACMonitoredAccountStore_registerSynchronouslyWithError___block_invoke;
  v14[3] = &unk_1E5BCCBC8;
  v14[6] = v7;
  v14[7] = v9;
  v14[4] = self;
  void v14[5] = &buf;
  [(ACMonitoredAccountStore *)self _registerAccountMonitorSynchronouslyWithCompletion:v14];
  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  _Block_object_dispose(&buf, 8);

  os_activity_scope_leave(&state);
}

- (void)_registerAccountMonitorSynchronouslyWithCompletion:(id)a3
{
  id v4 = a3;
  accountTypesToMonitor = self->_accountTypesToMonitor;
  if (!accountTypesToMonitor)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    id v10 = @"_accountTypesToMonitor must be non-nil";
    goto LABEL_6;
  }
  if (![(NSSet *)accountTypesToMonitor count])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    id v10 = @"_accountTypesToMonitor must not be empty";
LABEL_6:
    id v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  id v6 = [(ACAccountStore *)self remoteAccountStoreSession];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__ACMonitoredAccountStore__registerAccountMonitorSynchronouslyWithCompletion___block_invoke;
  v14[3] = &unk_1E5BCCC40;
  v14[4] = self;
  id v15 = v4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__ACMonitoredAccountStore__registerAccountMonitorSynchronouslyWithCompletion___block_invoke_2;
  v12[3] = &unk_1E5BCCC68;
  v12[4] = self;
  id v13 = v15;
  id v7 = v15;
  ac_dispatch_remote_sync(v6, v14, v12);
}

- (void)dealloc
{
  if (self->_credentialsDidChangeObserver)
  {
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_credentialsDidChangeObserver];
  }
  if (self->_remoteAccountDidChangeObserver)
  {
    id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 removeObserver:self->_remoteAccountDidChangeObserver];
  }
  if (self->_didBecomeActiveObserver)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self->_didBecomeActiveObserver];
  }
  v6.receiver = self;
  v6.super_class = (Class)ACMonitoredAccountStore;
  [(ACAccountStore *)&v6 dealloc];
}

- (id)monitoredAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self->_accountsByID;
  objc_sync_enter(v5);
  objc_super v6 = [(NSMutableDictionary *)self->_accountsByID objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)addDelegate:(id)a3
{
  id v5 = a3;
  id v4 = self->_delegates;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_delegates addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeDelegate:(id)a3
{
  id v5 = a3;
  id v4 = self->_delegates;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_delegates removeObject:v5];
  objc_sync_exit(v4);
}

void __65__ACMonitoredAccountStore__registerAccountMonitorWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __78__ACMonitoredAccountStore__registerAccountMonitorSynchronouslyWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _connectionFailureError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __49__ACMonitoredAccountStore__registerNotifyReaders__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _reregisterForAccountType:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_reregisterForAccountType:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A57C5000, v5, OS_LOG_TYPE_DEFAULT, "\"ACMonitoredAccountStore: Attempting to reconnect to accountsd...\"", buf, 2u);
  }

  if (v4)
  {
    v12[0] = v4;
    objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    propertiesToPrefetch = self->_propertiesToPrefetch;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke;
    v9[3] = &unk_1E5BCCCB8;
    v9[4] = self;
    id v10 = v4;
    [(ACAccountStore *)self accountsWithAccountTypeIdentifiers:v6 preloadedProperties:propertiesToPrefetch completion:v9];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke_2;
    v8[3] = &unk_1E5BCCCE0;
    v8[4] = self;
    [(ACMonitoredAccountStore *)self _registerAccountMonitorWithCompletion:v8];
  }
}

uint64_t __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _processAccountsListForNotifications:a2 forType:*(void *)(a1 + 40)];
}

void __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _ACLogSystem();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke_2_cold_1((uint64_t)v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A57C5000, v8, OS_LOG_TYPE_DEFAULT, "\"ACMonitoredAccountStore: Reconnected to accountsd\"", v9, 2u);
    }

    [*(id *)(a1 + 32) _processAccountsListForNotifications:v5 forType:0];
  }
}

- (void)_processAccountsListForNotifications:(id)a3 forType:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  v30 = [(ACMonitoredAccountStore *)self monitoredAccounts];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v13 = [v12 identifier];
        id v14 = [(ACMonitoredAccountStore *)self monitoredAccountWithIdentifier:v13];

        if (v14)
        {
          id v15 = [v12 modificationID];
          id v16 = [v14 modificationID];
          char v17 = [v15 isEqualToString:v16];

          if ((v17 & 1) == 0) {
            [(ACMonitoredAccountStore *)self accountWasModified:v12];
          }
        }
        else
        {
          [(ACMonitoredAccountStore *)self accountWasAdded:v12];
        }
        long long v18 = [v12 identifier];
        [v7 addObject:v18];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v9);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = v30;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        if (v32)
        {
          __int16 v25 = [*(id *)(*((void *)&v33 + 1) + 8 * j) accountType];
          uint64_t v26 = [v25 identifier];
          int v27 = [v32 isEqualToString:v26];

          if (!v27) {
            continue;
          }
        }
        v28 = [v24 identifier];
        char v29 = [v7 containsObject:v28];

        if ((v29 & 1) == 0) {
          [(ACMonitoredAccountStore *)self accountWasRemoved:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v21);
  }
}

void __69__ACMonitoredAccountStore__registerForCredentialChangedNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained credentialsChangedNotification:v3];
}

uint64_t __76__ACMonitoredAccountStore__registerForApplicationStateDidChangeNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reregisterForAccountType:0];
}

- (void)credentialsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(ACAccountStore *)self replyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ACMonitoredAccountStore_credentialsChangedNotification___block_invoke;
  v7[3] = &unk_1E5BCCD58;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__ACMonitoredAccountStore_credentialsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:@"ACAccountIdentifierKey"];

  id v4 = [*(id *)(a1 + 40) monitoredAccountWithIdentifier:v3];
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(*(id *)(a1 + 40), "_allDelegates", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 accountCredentialChanged:v4];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (id)_allDelegates
{
  id v3 = self->_delegates;
  objc_sync_enter(v3);
  id v4 = [(NSHashTable *)self->_delegates allObjects];
  objc_sync_exit(v3);

  return v4;
}

- (void)accountWasAdded:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_1A57C5000, v5, OS_LOG_TYPE_DEFAULT, "\"ACMonitoredAccountStore: account was added: %@\"", buf, 0xCu);
  }

  uint64_t v6 = self->_accountsByID;
  objc_sync_enter(v6);
  [v4 _setAccountStore:self];
  accountsByID = self->_accountsByID;
  uint64_t v8 = [v4 identifier];
  [(NSMutableDictionary *)accountsByID setObject:v4 forKeyedSubscript:v8];

  objc_sync_exit(v6);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [(ACMonitoredAccountStore *)self _allDelegates];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 accountWasAdded:v4];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(ACMonitoredAccountStore *)self _sendNotificationOfChange];
}

- (void)accountWasModified:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_1A57C5000, v5, OS_LOG_TYPE_DEFAULT, "\"ACMonitoredAccountStore: account was modified: %@\"", buf, 0xCu);
  }

  uint64_t v6 = self->_accountsByID;
  objc_sync_enter(v6);
  [v4 _setAccountStore:self];
  accountsByID = self->_accountsByID;
  uint64_t v8 = [v4 identifier];
  [(NSMutableDictionary *)accountsByID setObject:v4 forKeyedSubscript:v8];

  objc_sync_exit(v6);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [(ACMonitoredAccountStore *)self _allDelegates];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 accountWasModified:v4];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(ACMonitoredAccountStore *)self _sendNotificationOfChange];
}

- (void)accountWasRemoved:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ACLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_1A57C5000, v5, OS_LOG_TYPE_DEFAULT, "\"ACMonitoredAccountStore: account was removed: %@\"", buf, 0xCu);
  }

  uint64_t v6 = self->_accountsByID;
  objc_sync_enter(v6);
  [v4 _setAccountStore:self];
  accountsByID = self->_accountsByID;
  uint64_t v8 = [v4 identifier];
  [(NSMutableDictionary *)accountsByID setObject:0 forKeyedSubscript:v8];

  objc_sync_exit(v6);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [(ACMonitoredAccountStore *)self _allDelegates];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 accountWasRemoved:v4];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(ACMonitoredAccountStore *)self _sendNotificationOfChange];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didBecomeActiveObserver, 0);
  objc_storeStrong((id *)&self->_remoteAccountDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_credentialsDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_accountsByID, 0);
  objc_storeStrong((id *)&self->_propertiesToPrefetch, 0);
  objc_storeStrong((id *)&self->_monitoringReaders, 0);

  objc_storeStrong((id *)&self->_accountTypesToMonitor, 0);
}

- (void)registerWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: RegisterTypesToMonitor %@");
}

void __50__ACMonitoredAccountStore_registerWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 112);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_FAULT, "Attempted to register account monitor for types client is not authorized to access: %@", (uint8_t *)&v3, 0xCu);
}

- (void)registerSynchronouslyWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A57C5000, v0, v1, "BEGIN [%lld]: RegisterTypesToMonitorSync %@");
}

void __58__ACMonitoredAccountStore_registerSynchronouslyWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 112);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_FAULT, "Attempted to register account monitor for types client is not authorized to access: %@", (uint8_t *)&v3, 0xCu);
}

void __53__ACMonitoredAccountStore__reregisterForAccountType___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_ERROR, "\"ACMonitoredAccountStore: Failed to reconnect to accountsd: %@\"", (uint8_t *)&v2, 0xCu);
}

@end