@interface AMSAgeVerificationTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_errorCheckWithAccount:(id)a3 bag:(id)a4;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSAgeVerificationTask)initWithAccount:(id)a3 bag:(id)a4 options:(id)a5 presentationDelegate:(id)a6;
- (AMSBagProtocol)bag;
- (AMSQRCodeDialogTask)task;
- (AMSRequestPresentationDelegate)presentationDelegate;
- (NSDictionary)options;
- (NSString)pincode;
- (id)_performTaskForAccount:(id)a3 withBag:(id)a4;
- (id)isVerificationNeeded;
- (id)performTask;
- (void)_handleAccountStoreDidChangeNotification:(id)a3;
- (void)_handleAccountStoreDidChangeNotification:(id)a3 at:(id)a4;
- (void)_startObservingAccountStoreChanges;
- (void)_stopObservingAccountStoreChanges;
- (void)setOptions:(id)a3;
- (void)setPincode:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation AMSAgeVerificationTask

- (AMSAgeVerificationTask)initWithAccount:(id)a3 bag:(id)a4 options:(id)a5 presentationDelegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AMSAgeVerificationTask;
  v15 = [(AMSTask *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a3);
    objc_storeStrong((id *)&v16->_bag, a4);
    objc_storeStrong((id *)&v16->_options, a5);
    objc_storeStrong((id *)&v16->_presentationDelegate, a6);
  }

  return v16;
}

- (id)isVerificationNeeded
{
  v3 = objc_opt_class();
  v4 = [(AMSAgeVerificationTask *)self account];
  v5 = [(AMSAgeVerificationTask *)self bag];
  v6 = [v3 _errorCheckWithAccount:v4 bag:v5];

  if (v6)
  {
    v7 = +[AMSPromise promiseWithError:v6];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1C9C8] date];
    v9 = [(AMSAgeVerificationTask *)self account];
    v10 = objc_msgSend(v9, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagAgeVerificationExpiration);

    id v11 = [(AMSAgeVerificationTask *)self bag];
    id v12 = [v11 BOOLForKey:@"isExplicitContentAgeVerificationRequired"];
    id v13 = [v12 valuePromise];

    id v14 = [(AMSAgeVerificationTask *)self bag];
    v15 = [v14 integerForKey:@"korAgeVerificationWarningThresholdDays"];
    v16 = [v15 valuePromise];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __46__AMSAgeVerificationTask_isVerificationNeeded__block_invoke;
    v21[3] = &unk_1E559ECF8;
    id v22 = v16;
    id v23 = v10;
    id v24 = v8;
    v25 = self;
    id v17 = v8;
    id v18 = v10;
    id v19 = v16;
    v7 = [v13 thenWithBlock:v21];
  }
  return v7;
}

id __46__AMSAgeVerificationTask_isVerificationNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__AMSAgeVerificationTask_isVerificationNeeded__block_invoke_2;
  v10[3] = &unk_1E559ECD0;
  v4 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v3;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v13 = v5;
  uint64_t v14 = v6;
  id v7 = v3;
  v8 = [v4 continueWithBlock:v10];

  return v8;
}

id __46__AMSAgeVerificationTask_isVerificationNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSAgeVerificationCore _resultForAccountVerificationExpirationTimestamp:*(void *)(a1 + 32) withBagControlledAgeVerificationRequired:*(void *)(a1 + 40) bagWarningThresholdDays:v3 at:*(void *)(a1 + 48)];
  id v5 = +[AMSLogConfig sharedAccountsConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = [*(id *)(a1 + 56) account];
    id v11 = AMSAccountFlagAgeVerificationExpiration;
    uint64_t v15 = *(void *)(a1 + 32);
    id v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "requiredType"));
    *(_DWORD *)buf = 138545666;
    uint64_t v17 = v7;
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 2114;
    v21 = @"isExplicitContentAgeVerificationRequired";
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    __int16 v24 = 2114;
    v25 = @"korAgeVerificationWarningThresholdDays";
    __int16 v26 = 2114;
    id v27 = v3;
    __int16 v28 = 2114;
    v29 = v10;
    __int16 v30 = 2114;
    v31 = v11;
    __int16 v32 = 2114;
    uint64_t v33 = v15;
    __int16 v34 = 2114;
    v35 = v12;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@=%{public}@ and %{public}@=%{public}@. For account %{public}@, %{public}@=%{public}@, therefore requiredType=%{public}@", buf, 0x66u);
  }
  id v13 = +[AMSPromise promiseWithResult:v4];

  return v13;
}

- (id)performTask
{
  id v3 = objc_opt_class();
  v4 = [(AMSAgeVerificationTask *)self account];
  id v5 = [(AMSAgeVerificationTask *)self bag];
  uint64_t v6 = [v3 _errorCheckWithAccount:v4 bag:v5];

  if (v6)
  {
    uint64_t v7 = +[AMSPromise promiseWithError:v6];
  }
  else
  {
    v8 = [(AMSAgeVerificationTask *)self account];
    uint64_t v9 = [(AMSAgeVerificationTask *)self bag];
    uint64_t v7 = [(AMSAgeVerificationTask *)self _performTaskForAccount:v8 withBag:v9];
  }
  return v7;
}

+ (id)_errorCheckWithAccount:(id)a3 bag:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v8 = 0;
      goto LABEL_7;
    }
    uint64_t v9 = @"Age Verification requires a bag";
  }
  else
  {
    uint64_t v9 = @"Age Verification requires an account";
  }
  v8 = AMSCustomError(@"AMSErrorDomain", 2, v9, 0, 0, 0);
LABEL_7:

  return v8;
}

- (id)_performTaskForAccount:(id)a3 withBag:(id)a4
{
  v4 = AMSCustomError(@"AMSErrorDomain", 12, @"Not available on this platform, try AMSUIAgeVerificationTask", 0, 0, 0);
  id v5 = +[AMSPromise promiseWithError:v4];

  return v5;
}

- (void)_startObservingAccountStoreChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleAccountStoreDidChangeNotification_ name:*MEMORY[0x1E4F178D8] object:0];
}

- (void)_stopObservingAccountStoreChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F178D8] object:0];
}

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  [(AMSAgeVerificationTask *)self _handleAccountStoreDidChangeNotification:v5 at:v6];
}

- (void)_handleAccountStoreDidChangeNotification:(id)a3 at:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(AMSAgeVerificationTask *)self account];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v8 = objc_msgSend(v7, "ams_activeiTunesAccount");

  uint64_t v9 = objc_msgSend(v8, "ams_altDSID");
  v10 = objc_msgSend(v6, "ams_altDSID");
  if ([v9 isEqualToString:v10])
  {
  }
  else
  {
    id v11 = objc_msgSend(v8, "ams_DSID");
    id v12 = objc_msgSend(v6, "ams_DSID");
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_5;
    }
  }
  id v14 = v8;

  id v6 = v14;
LABEL_5:
  uint64_t v15 = objc_msgSend(v6, "ams_accountFlagValueForAccountFlag:", AMSAccountFlagAgeVerificationExpiration);
  BOOL v16 = +[AMSAgeVerificationCore _isAgeVerificationNeededForExpiration:v15 at:v5];

  if (!v16)
  {
    uint64_t v17 = +[AMSLogConfig sharedAccountsConfig];
    if (!v17)
    {
      uint64_t v17 = +[AMSLogConfig sharedConfig];
    }
    __int16 v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      __int16 v20 = AMSLogKey();
      int v22 = 138543618;
      uint64_t v23 = v19;
      __int16 v24 = 2114;
      v25 = v20;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismissing System Alert Dialog", (uint8_t *)&v22, 0x16u);
    }
    [(AMSAgeVerificationTask *)self _stopObservingAccountStoreChanges];
    v21 = [(AMSAgeVerificationTask *)self task];
    [v21 _dismiss];
  }
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1 != -1) {
    dispatch_once(&_MergedGlobals_1, &__block_literal_global_5);
  }
  v2 = (void *)qword_1EB38D018;
  return (NSString *)v2;
}

void __39__AMSAgeVerificationTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D018;
  qword_1EB38D018 = @"AMSAgeVerification";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D020 != -1) {
    dispatch_once(&qword_1EB38D020, &__block_literal_global_31);
  }
  v2 = (void *)qword_1EB38D028;
  return (NSString *)v2;
}

void __46__AMSAgeVerificationTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D028;
  qword_1EB38D028 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSString)pincode
{
  return self->_pincode;
}

- (void)setPincode:(id)a3
{
}

- (AMSRequestPresentationDelegate)presentationDelegate
{
  return self->_presentationDelegate;
}

- (AMSQRCodeDialogTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_presentationDelegate, 0);
  objc_storeStrong((id *)&self->_pincode, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end