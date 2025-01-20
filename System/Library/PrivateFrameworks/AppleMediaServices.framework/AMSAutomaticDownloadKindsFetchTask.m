@interface AMSAutomaticDownloadKindsFetchTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSAutomaticDownloadKindsFetchTask)initWithAccount:(id)a3 bag:(id)a4;
- (AMSBagProtocol)bag;
- (id)perform;
@end

@implementation AMSAutomaticDownloadKindsFetchTask

- (AMSAutomaticDownloadKindsFetchTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAutomaticDownloadKindsFetchTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)perform
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSAutomaticDownloadKindsFetchTask *)self account];

  if (!v3)
  {
    v6 = @"An account is required.";
    goto LABEL_5;
  }
  v4 = [(AMSAutomaticDownloadKindsFetchTask *)self account];
  int v5 = objc_msgSend(v4, "ams_isLocalAccount");

  if (v5)
  {
    v6 = @"We cannot sync the local account's automatic download kinds.";
LABEL_5:
    AMSError(2, @"Invalid Parameter", v6, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = +[AMSPromise promiseWithError:v7];
    goto LABEL_21;
  }
  v9 = [(AMSAutomaticDownloadKindsFetchTask *)self account];
  v10 = [v9 objectForKeyedSubscript:0x1EDCA6D88];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v10;
  }
  else {
    id v7 = 0;
  }

  uint64_t v11 = [v7 count];
  uint64_t v12 = +[AMSLogConfig sharedConfig];
  v13 = (void *)v12;
  if (v11)
  {
    if (!v12)
    {
      v13 = +[AMSLogConfig sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = objc_opt_class();
      v16 = AMSLogKey();
      v17 = [(AMSAutomaticDownloadKindsFetchTask *)self account];
      v18 = AMSHashIfNeeded(v17);
      *(_DWORD *)buf = 138543874;
      uint64_t v39 = v15;
      __int16 v40 = 2114;
      v41 = v16;
      __int16 v42 = 2114;
      v43 = v18;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Returning cached automatic download kinds. account = %{public}@", buf, 0x20u);
    }
    v19 = [AMSAutomaticDownloadKindsResult alloc];
    v20 = [(AMSAutomaticDownloadKindsFetchTask *)self account];
    v21 = [(AMSAutomaticDownloadKindsResult *)v19 initWithAccount:v20 andEnabledMediaKinds:v7];

    id v8 = +[AMSPromise promiseWithResult:v21];
  }
  else
  {
    if (!v12)
    {
      v13 = +[AMSLogConfig sharedConfig];
    }
    v22 = [v13 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      v24 = AMSLogKey();
      v25 = [(AMSAutomaticDownloadKindsFetchTask *)self account];
      v26 = AMSHashIfNeeded(v25);
      *(_DWORD *)buf = 138543874;
      uint64_t v39 = v23;
      __int16 v40 = 2114;
      v41 = v24;
      __int16 v42 = 2114;
      v43 = v26;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Syncing automatic download kinds. account = %{public}@", buf, 0x20u);
    }
    v27 = [AMSURLRequestEncoder alloc];
    v28 = [(AMSAutomaticDownloadKindsFetchTask *)self bag];
    v21 = [(AMSURLRequestEncoder *)v27 initWithBag:v28];

    v29 = [(AMSAutomaticDownloadKindsFetchTask *)self account];
    [(AMSAutomaticDownloadKindsResult *)v21 setAccount:v29];

    [(AMSAutomaticDownloadKindsResult *)v21 setRequestEncoding:2];
    v30 = AMSLogKey();
    [(AMSAutomaticDownloadKindsResult *)v21 setLogUUID:v30];

    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v32 = +[AMSDevice deviceGUID];
    objc_msgSend(v31, "ams_setNullableObject:forKey:", v32, @"guid");

    v33 = [(AMSBagProtocol *)self->_bag URLForKey:@"enabled-media-types-url"];
    v34 = [(AMSAutomaticDownloadKindsResult *)v21 requestWithMethod:2 bagURL:v33 parameters:v31];
    v35 = [v34 thenWithBlock:&__block_literal_global_13];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __45__AMSAutomaticDownloadKindsFetchTask_perform__block_invoke_2;
    v37[3] = &unk_1E559F348;
    v37[4] = self;
    id v8 = [v35 thenWithBlock:v37];
  }
LABEL_21:

  return v8;
}

id __45__AMSAutomaticDownloadKindsFetchTask_perform__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[AMSURLSession defaultSession];
  v4 = [v3 dataTaskPromiseWithRequest:v2];

  return v4;
}

id __45__AMSAutomaticDownloadKindsFetchTask_perform__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [a2 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  int v5 = [v4 objectForKeyedSubscript:@"enabled-media-kinds"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    id v6 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_8;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) account];
    [v7 setObject:v6 forKeyedSubscript:0x1EDCA6D88];

    int v5 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    id v8 = [*(id *)(a1 + 32) account];
    id v9 = (id)objc_msgSend(v5, "ams_saveAccount:verifyCredentials:", v8, 0);

    v10 = v6;
LABEL_8:

    goto LABEL_9;
  }
  v10 = 0;
  id v6 = (id)MEMORY[0x1E4F1CBF0];
LABEL_9:
  uint64_t v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    uint64_t v11 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    AMSLogKey();
    v14 = id v23 = v4;
    uint64_t v15 = [*(id *)(a1 + 32) account];
    v16 = AMSHashIfNeeded(v15);
    v17 = AMSHashIfNeeded(v10);
    *(_DWORD *)buf = 138544130;
    uint64_t v25 = v13;
    __int16 v26 = 2114;
    v27 = v14;
    __int16 v28 = 2114;
    v29 = v16;
    __int16 v30 = 2114;
    id v31 = v17;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetched automatic download kinds. account = %{public}@ | enabled media kinds = %{public}@", buf, 0x2Au);

    id v4 = v23;
  }

  v18 = [AMSAutomaticDownloadKindsResult alloc];
  v19 = [*(id *)(a1 + 32) account];
  v20 = [(AMSAutomaticDownloadKindsResult *)v18 initWithAccount:v19 andEnabledMediaKinds:v6];

  v21 = +[AMSPromise promiseWithResult:v20];

  return v21;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_2 != -1) {
    dispatch_once(&_MergedGlobals_1_2, &__block_literal_global_23);
  }
  id v2 = (void *)qword_1EB38D058;
  return (NSString *)v2;
}

void __51__AMSAutomaticDownloadKindsFetchTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D058;
  qword_1EB38D058 = @"AMSAutomaticDownloadKinds";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D060 != -1) {
    dispatch_once(&qword_1EB38D060, &__block_literal_global_28);
  }
  id v2 = (void *)qword_1EB38D068;
  return (NSString *)v2;
}

void __58__AMSAutomaticDownloadKindsFetchTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D068;
  qword_1EB38D068 = @"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(AMSBagKeySet);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end