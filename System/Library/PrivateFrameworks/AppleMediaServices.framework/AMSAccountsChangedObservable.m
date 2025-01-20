@interface AMSAccountsChangedObservable
+ (AMSAccountsChangedObservable)sharedInstance;
+ (AMSAccountsChangedObservable)sharedLocalAccountInstance;
+ (NSPointerArray)createdObservables;
+ (OS_dispatch_queue)createdObservablesAccessQueue;
+ (void)_processChangedAccount:(id)a3;
- (ACAccount)account;
- (AMSAccountsChangedObservable)initWithAccount:(id)a3;
- (AMSAccountsChangedObservable)initWithAccountTypeIdentifier:(id)a3;
- (AMSObservable)observable;
- (BOOL)_shouldNotifyObserversForChangedAccount:(id)a3;
- (NSString)accountTypeIdentifier;
- (id)_initWithAccount:(id)a3 accountTypeIdentifier:(id)a4;
- (os_unfair_lock_s)notificationsLock;
- (void)_accountStoreDidChange:(id)a3;
- (void)_processChangedAccount:(id)a3;
- (void)dealloc;
- (void)setObservable:(id)a3;
- (void)subscribe:(id)a3;
- (void)unsubscribe:(id)a3;
@end

@implementation AMSAccountsChangedObservable

uint64_t __46__AMSAccountsChangedObservable_sharedInstance__block_invoke()
{
  qword_1EB38D5A8 = [[AMSAccountsChangedObservable alloc] _initWithAccount:0 accountTypeIdentifier:0];
  return MEMORY[0x1F41817F8]();
}

- (id)_initWithAccount:(id)a3 accountTypeIdentifier:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)AMSAccountsChangedObservable;
  v9 = [(AMSAccountsChangedObservable *)&v32 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    if (v8)
    {
      v11 = (NSString *)v8;
      accountTypeIdentifier = v10->_accountTypeIdentifier;
      v10->_accountTypeIdentifier = v11;
    }
    else
    {
      accountTypeIdentifier = [v7 accountType];
      uint64_t v13 = [accountTypeIdentifier identifier];
      v14 = v10->_accountTypeIdentifier;
      v10->_accountTypeIdentifier = (NSString *)v13;
    }
    v10->_notificationsLock._os_unfair_lock_opaque = 0;
    v15 = objc_alloc_init(AMSObservable);
    observable = v10->_observable;
    v10->_observable = v15;

    v17 = +[AMSProcessInfo currentProcess];
    char v18 = [v17 isAccountsDaemon];

    if (v18)
    {
      v19 = +[AMSLogConfig sharedAccountsConfig];
      if (!v19)
      {
        v19 = +[AMSLogConfig sharedConfig];
      }
      v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = objc_opt_class();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEBUG, "[%{public}@] Running in accountsd.", (uint8_t *)&buf, 0xCu);
      }

      v22 = +[AMSAccountsChangedObservable createdObservablesAccessQueue];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __71__AMSAccountsChangedObservable__initWithAccount_accountTypeIdentifier___block_invoke;
      v30[3] = &unk_1E559EA90;
      v31 = v10;
      v23 = v30;
      v24 = AMSLogKey();
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v34 = __AMSDispatchAsync_block_invoke;
      v35 = &unk_1E559EAE0;
      id v36 = v24;
      id v37 = v23;
      id v25 = v24;
      dispatch_async(v22, &buf);

      v26 = v31;
    }
    else
    {
      v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v27 = *MEMORY[0x1E4F17728];
      v28 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      [v26 addObserver:v10 selector:sel__accountStoreDidChange_ name:v27 object:v28];
    }
  }

  return v10;
}

- (void)subscribe:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSAccountsChangedObservable *)self observable];
  [v5 subscribe:v4];
}

- (AMSObservable)observable
{
  return self->_observable;
}

+ (AMSAccountsChangedObservable)sharedInstance
{
  if (qword_1EB38D5A0 != -1) {
    dispatch_once(&qword_1EB38D5A0, &__block_literal_global_15_0);
  }
  v2 = (void *)qword_1EB38D5A8;
  return (AMSAccountsChangedObservable *)v2;
}

- (AMSAccountsChangedObservable)initWithAccount:(id)a3
{
  return (AMSAccountsChangedObservable *)[(AMSAccountsChangedObservable *)self _initWithAccount:a3 accountTypeIdentifier:0];
}

- (AMSAccountsChangedObservable)initWithAccountTypeIdentifier:(id)a3
{
  return (AMSAccountsChangedObservable *)[(AMSAccountsChangedObservable *)self _initWithAccount:0 accountTypeIdentifier:a3];
}

void __71__AMSAccountsChangedObservable__initWithAccount_accountTypeIdentifier___block_invoke(uint64_t a1)
{
  id v2 = +[AMSAccountsChangedObservable createdObservables];
  [v2 addPointer:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AMSAccountsChangedObservable;
  [(AMSAccountsChangedObservable *)&v4 dealloc];
}

+ (NSPointerArray)createdObservables
{
  id v2 = +[AMSProcessInfo currentProcess];
  int v3 = [v2 isAccountsDaemon];

  if (v3)
  {
    if (_MergedGlobals_77 != -1) {
      dispatch_once(&_MergedGlobals_77, &__block_literal_global_3);
    }
    id v4 = (id)qword_1EB38D588;
  }
  else
  {
    id v4 = 0;
  }
  return (NSPointerArray *)v4;
}

uint64_t __50__AMSAccountsChangedObservable_createdObservables__block_invoke()
{
  qword_1EB38D588 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  return MEMORY[0x1F41817F8]();
}

+ (OS_dispatch_queue)createdObservablesAccessQueue
{
  id v2 = +[AMSProcessInfo currentProcess];
  int v3 = [v2 isAccountsDaemon];

  if (v3)
  {
    if (qword_1EB38D590 != -1) {
      dispatch_once(&qword_1EB38D590, &__block_literal_global_12);
    }
    id v4 = (id)qword_1EB38D598;
  }
  else
  {
    id v4 = 0;
  }
  return (OS_dispatch_queue *)v4;
}

uint64_t __61__AMSAccountsChangedObservable_createdObservablesAccessQueue__block_invoke()
{
  qword_1EB38D598 = (uint64_t)dispatch_queue_create("com.apple.AppleMediaServices.AMSAccountsChangedObservable.createdObservables", 0);
  return MEMORY[0x1F41817F8]();
}

+ (AMSAccountsChangedObservable)sharedLocalAccountInstance
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v4 = objc_msgSend(v3, "ams_localiTunesAccount");

  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__AMSAccountsChangedObservable_sharedLocalAccountInstance__block_invoke;
    block[3] = &unk_1E559EA90;
    id v12 = v4;
    if (qword_1EB38D5B0 != -1) {
      dispatch_once(&qword_1EB38D5B0, block);
    }
    id v5 = (id)qword_1EB38D5B8;
  }
  else
  {
    v6 = +[AMSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the local account.", buf, 0x16u);
    }
    id v5 = [a1 sharedInstance];
  }

  return (AMSAccountsChangedObservable *)v5;
}

uint64_t __58__AMSAccountsChangedObservable_sharedLocalAccountInstance__block_invoke(uint64_t a1)
{
  qword_1EB38D5B8 = [[AMSAccountsChangedObservable alloc] initWithAccount:*(void *)(a1 + 32)];
  return MEMORY[0x1F41817F8]();
}

- (void)unsubscribe:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSAccountsChangedObservable *)self observable];
  [v5 unsubscribe:v4];
}

- (void)_accountStoreDidChange:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F17810]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (([v8 isEqualToString:*MEMORY[0x1E4F17890]] & 1) != 0
    || ([v8 isEqualToString:*MEMORY[0x1E4F17898]] & 1) != 0)
  {
    v9 = [v5 userInfo];
    v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F17648]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    uint64_t v12 = +[AMSLogConfig sharedAccountsConfig];
    uint64_t v13 = v12;
    if (!v11)
    {
      if (!v12)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      v20 = [v13 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = AMSLogKey();
        v22 = NSString;
        uint64_t v23 = objc_opt_class();
        uint64_t v24 = v23;
        if (v21)
        {
          AMSLogKey();
          self = (AMSAccountsChangedObservable *)objc_claimAutoreleasedReturnValue();
          [v22 stringWithFormat:@"%@: [%@] ", v24, self];
        }
        else
        {
          [v22 stringWithFormat:@"%@: ", v23];
        id v25 = };
        v57 = AMSHashIfNeeded(0);
        *(_DWORD *)long long buf = 138543618;
        v69 = v25;
        __int16 v70 = 2114;
        v71 = v57;
        _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring an ACAccountStoreDidChangeNotification. accountIdentifier = %{public}@", buf, 0x16u);
        if (v21)
        {

          id v25 = self;
        }
      }
      goto LABEL_75;
    }
    if (!v12)
    {
      uint64_t v13 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __int16 v15 = AMSLogKey();
      v16 = NSString;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = v17;
      if (v15)
      {
        uint64_t v3 = AMSLogKey();
        [v16 stringWithFormat:@"%@: [%@] ", v18, v3];
      }
      else
      {
        [v16 stringWithFormat:@"%@: ", v17];
      v19 = };
      *(_DWORD *)long long buf = 138543362;
      v69 = v19;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Received an ACAccountStoreDidChangeNotification.", buf, 0xCu);
      if (v15)
      {

        v19 = (void *)v3;
      }
    }
    v31 = [v5 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = v31;

      if (v13)
      {
LABEL_43:
        uint64_t v41 = [v13 _ams_fetchAccountWithIdentifier:v11];
        if (v41)
        {
          v20 = v41;
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __55__AMSAccountsChangedObservable__accountStoreDidChange___block_invoke;
          v66[3] = &unk_1E559EAB8;
          v66[4] = self;
          id v67 = v11;
          [v20 addFinishBlock:v66];
        }
        else
        {
          BOOL v42 = +[AMSUnitTests isRunningUnitTests];
          uint64_t v43 = +[AMSLogConfig sharedAccountsConfig];
          v44 = (void *)v43;
          if (v42)
          {
            if (!v43)
            {
              v44 = +[AMSLogConfig sharedConfig];
            }
            v45 = [v44 OSLogObject];
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              v46 = AMSLogKey();
              v47 = NSString;
              uint64_t v48 = objc_opt_class();
              uint64_t v49 = v48;
              if (v46)
              {
                AMSLogKey();
                v65 = (AMSAccountsChangedObservable *)objc_claimAutoreleasedReturnValue();
                [v47 stringWithFormat:@"%@: [%@] ", v49, v65];
              }
              else
              {
                [v47 stringWithFormat:@"%@: ", v48];
              v50 = };
              v59 = AMSHashIfNeeded(v13);
              v60 = AMSHashIfNeeded(v11);
              *(_DWORD *)long long buf = 138543874;
              v69 = v50;
              __int16 v70 = 2114;
              v71 = v59;
              __int16 v72 = 2114;
              v73 = v60;
              _os_log_impl(&dword_18D554000, v45, OS_LOG_TYPE_ERROR, "%{public}@Could not create account promise. accountStore = %{public}@ | accountIdentifier = %{public}@", buf, 0x20u);
              if (v46)
              {

                v50 = v65;
              }
            }
            v61 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v62 = +[AMSLogConfig sharedAccountsConfig];
            [v61 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v62 userInfo:0];
          }
          else
          {
            if (!v43)
            {
              v44 = +[AMSLogConfig sharedConfig];
            }
            v51 = [v44 OSLogObject];
            if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            {
              v52 = AMSLogKey();
              v53 = NSString;
              uint64_t v54 = objc_opt_class();
              uint64_t v55 = v54;
              if (v52)
              {
                AMSLogKey();
                v65 = (AMSAccountsChangedObservable *)objc_claimAutoreleasedReturnValue();
                [v53 stringWithFormat:@"%@: [%@] ", v55, v65];
              }
              else
              {
                [v53 stringWithFormat:@"%@: ", v54];
              v56 = };
              v63 = AMSHashIfNeeded(v13);
              v64 = AMSHashIfNeeded(v11);
              *(_DWORD *)long long buf = 138543874;
              v69 = v56;
              __int16 v70 = 2114;
              v71 = v63;
              __int16 v72 = 2114;
              v73 = v64;
              _os_log_impl(&dword_18D554000, v51, OS_LOG_TYPE_FAULT, "%{public}@Could not create account promise. accountStore = %{public}@ | accountIdentifier = %{public}@", buf, 0x20u);
              if (v52)
              {

                v56 = v65;
              }
            }
          }
          v20 = 0;
        }
LABEL_75:

        goto LABEL_76;
      }
    }
    else
    {
    }
    objc_super v32 = +[AMSLogConfig sharedAccountsConfig];
    if (!v32)
    {
      objc_super v32 = +[AMSLogConfig sharedConfig];
    }
    v33 = [v32 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = AMSLogKey();
      v35 = NSString;
      uint64_t v36 = objc_opt_class();
      uint64_t v37 = v36;
      v65 = self;
      if (v34)
      {
        uint64_t v3 = AMSLogKey();
        [v35 stringWithFormat:@"%@: [%@] ", v37, v3];
      }
      else
      {
        [v35 stringWithFormat:@"%@: ", v36];
      uint64_t v38 = };
      v39 = [v5 object];
      v40 = AMSHashIfNeeded(v39);
      *(_DWORD *)long long buf = 138543618;
      v69 = v38;
      __int16 v70 = 2114;
      v71 = v40;
      _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_ERROR, "%{public}@The notification’s object was not an ACAccountStore. object = %{public}@", buf, 0x16u);

      if (v34)
      {

        uint64_t v38 = (void *)v3;
      }

      self = v65;
    }

    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    goto LABEL_43;
  }
  id v11 = +[AMSLogConfig sharedAccountsConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v13 = [v11 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v26 = AMSLogKey();
    uint64_t v27 = NSString;
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = v28;
    if (v26)
    {
      AMSLogKey();
      self = (AMSAccountsChangedObservable *)objc_claimAutoreleasedReturnValue();
      [v27 stringWithFormat:@"%@: [%@] ", v29, self];
    }
    else
    {
      [v27 stringWithFormat:@"%@: ", v28];
    v30 = };
    v58 = AMSHashIfNeeded(v8);
    *(_DWORD *)long long buf = 138543618;
    v69 = v30;
    __int16 v70 = 2114;
    v71 = v58;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring an ACAccountStoreDidChangeNotification. accountType = %{public}@", buf, 0x16u);
    if (v26)
    {

      v30 = self;
    }
  }
LABEL_76:
}

void __55__AMSAccountsChangedObservable__accountStoreDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [*(id *)(a1 + 32) _processChangedAccount:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
  else
  {
    id v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = AMSLogKey();
      id v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v12;
      if (v10)
      {
        uint64_t v3 = AMSLogKey();
        [v11 stringWithFormat:@"%@: [%@] ", v13, v3];
      }
      else
      {
        [v11 stringWithFormat:@"%@: ", v12];
      uint64_t v14 = };
      __int16 v15 = AMSHashIfNeeded(*(void **)(a1 + 40));
      v16 = AMSLogableError(v7);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      v20 = v15;
      __int16 v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error fetching account. identifier = %{public}@ | error = %{public}@", buf, 0x20u);
      if (v10)
      {

        uint64_t v14 = (void *)v3;
      }
    }
  }
}

- (void)_processChangedAccount:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(AMSAccountsChangedObservable *)self _shouldNotifyObserversForChangedAccount:v4];
  uint64_t v6 = +[AMSLogConfig sharedAccountsConfig];
  id v7 = (AMSAccountsChangedResult *)v6;
  if (v5)
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [(AMSAccountsChangedResult *)v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = objc_opt_class();
      v10 = AMSLogKey();
      id v11 = AMSHashIfNeeded(v4);
      int v16 = 138543874;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      __int16 v19 = v10;
      __int16 v20 = 2114;
      __int16 v21 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] [%{public}@] Notifying observers of a changed account. changedAccount = %{public}@", (uint8_t *)&v16, 0x20u);
    }
    id v7 = [[AMSAccountsChangedResult alloc] initWithAccount:v4];
    uint64_t v12 = [(AMSAccountsChangedObservable *)self observable];
    [v12 sendResult:v7];
  }
  else
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [(AMSAccountsChangedResult *)v7 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = AMSLogKey();
      __int16 v15 = AMSHashIfNeeded(v4);
      int v16 = 138543874;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      __int16 v19 = v14;
      __int16 v20 = 2114;
      __int16 v21 = v15;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] [%{public}@] Ignoring a change account. account = %{public}@", (uint8_t *)&v16, 0x20u);
    }
  }
}

+ (void)_processChangedAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[AMSProcessInfo currentProcess];
  int v5 = [v4 isAccountsDaemon];

  if (v5)
  {
    uint64_t v6 = +[AMSAccountsChangedObservable createdObservablesAccessQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__AMSAccountsChangedObservable__processChangedAccount___block_invoke;
    v10[3] = &unk_1E559EA90;
    id v11 = v3;
    id v7 = v10;
    id v8 = AMSLogKey();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke;
    block[3] = &unk_1E559EAE0;
    id v13 = v8;
    id v14 = v7;
    id v9 = v8;
    dispatch_async(v6, block);
  }
}

void __55__AMSAccountsChangedObservable__processChangedAccount___block_invoke(uint64_t a1)
{
  id v5 = +[AMSAccountsChangedObservable createdObservables];
  if ([v5 count])
  {
    unint64_t v2 = 0;
    do
    {
      id v3 = [v5 pointerAtIndex:v2];
      id v4 = v3;
      if (v3) {
        [v3 _processChangedAccount:*(void *)(a1 + 32)];
      }

      ++v2;
    }
    while (v2 < [v5 count]);
  }
  [v5 compact];
}

- (BOOL)_shouldNotifyObserversForChangedAccount:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AMSAccountsChangedObservable *)self account];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = [(AMSAccountsChangedObservable *)self accountTypeIdentifier];

    if (!v6)
    {
      id v14 = +[AMSLogConfig sharedAccountsConfig];
      if (!v14)
      {
        id v14 = +[AMSLogConfig sharedConfig];
      }
      __int16 v15 = [v14 OSLogObject];
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      uint64_t v27 = objc_opt_class();
      uint64_t v17 = AMSLogKey();
      int v29 = 138543618;
      uint64_t v30 = v27;
      __int16 v31 = 2114;
      objc_super v32 = v17;
      __int16 v18 = "[%{public}@] [%{public}@] The observable responds to all account changes.";
      goto LABEL_23;
    }
  }
  uint64_t v7 = [(AMSAccountsChangedObservable *)self account];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [(AMSAccountsChangedObservable *)self account];
    v10 = [v9 identifier];
    id v11 = [v4 identifier];
    if ([v10 isEqualToString:v11])
    {

LABEL_8:
      id v14 = +[AMSLogConfig sharedAccountsConfig];
      if (!v14)
      {
        id v14 = +[AMSLogConfig sharedConfig];
      }
      __int16 v15 = [v14 OSLogObject];
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = AMSLogKey();
      int v29 = 138543618;
      uint64_t v30 = v16;
      __int16 v31 = 2114;
      objc_super v32 = v17;
      __int16 v18 = "[%{public}@] [%{public}@] The observable matches the changed account.";
LABEL_23:
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v29, 0x16u);

LABEL_24:
      BOOL v26 = 1;
      goto LABEL_25;
    }
    uint64_t v12 = [(AMSAccountsChangedObservable *)self account];
    char v13 = objc_msgSend(v12, "ams_isDuplicate:", v4);

    if (v13) {
      goto LABEL_8;
    }
  }
  uint64_t v19 = [(AMSAccountsChangedObservable *)self accountTypeIdentifier];
  if (v19)
  {
    __int16 v20 = (void *)v19;
    __int16 v21 = [(AMSAccountsChangedObservable *)self accountTypeIdentifier];
    uint64_t v22 = [v4 accountType];
    uint64_t v23 = [v22 identifier];
    int v24 = [v21 isEqualToString:v23];

    if (v24)
    {
      id v14 = +[AMSLogConfig sharedAccountsConfig];
      if (!v14)
      {
        id v14 = +[AMSLogConfig sharedConfig];
      }
      __int16 v15 = [v14 OSLogObject];
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_24;
      }
      uint64_t v25 = objc_opt_class();
      uint64_t v17 = AMSLogKey();
      int v29 = 138543618;
      uint64_t v30 = v25;
      __int16 v31 = 2114;
      objc_super v32 = v17;
      __int16 v18 = "[%{public}@] [%{public}@] The observable matches the changed account type.";
      goto LABEL_23;
    }
  }
  BOOL v26 = 0;
LABEL_25:

  return v26;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)accountTypeIdentifier
{
  return self->_accountTypeIdentifier;
}

- (void)setObservable:(id)a3
{
}

- (os_unfair_lock_s)notificationsLock
{
  return self->_notificationsLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_accountTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end