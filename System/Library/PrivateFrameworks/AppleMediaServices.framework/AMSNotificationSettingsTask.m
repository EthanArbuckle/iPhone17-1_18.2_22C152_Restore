@interface AMSNotificationSettingsTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSNotificationSettingsTask)initWithIdentifier:(id)a3 account:(id)a4 bag:(id)a5;
- (AMSProcessInfo)clientInfo;
- (NSString)identifier;
- (id)_countryCodeFromBag:(id)a3;
- (id)_generateParametersForItems:(id)a3;
- (id)_stringForKey:(id)a3 fromBag:(id)a4;
- (id)_url;
- (id)fetchAllSettings;
- (id)updateSettings:(id)a3;
- (void)setAccount:(id)a3;
- (void)setBag:(id)a3;
- (void)setClientInfo:(id)a3;
@end

@implementation AMSNotificationSettingsTask

- (AMSNotificationSettingsTask)initWithIdentifier:(id)a3 account:(id)a4 bag:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSNotificationSettingsTask;
  v12 = [(AMSTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a4);
    objc_storeStrong((id *)&v13->_bag, a5);
    objc_storeStrong((id *)&v13->_identifier, a3);
  }

  return v13;
}

- (id)fetchAllSettings
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__AMSNotificationSettingsTask_fetchAllSettings__block_invoke;
  v5[3] = &unk_1E55A4EE8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = [(AMSTask *)self performTaskWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

AMSNotificationSettingsResult *__47__AMSNotificationSettingsTask_fetchAllSettings__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained account];

  if (!v6)
  {
    AMSError(2, @"Invalid Parameter", @"We cannot sync settings without an account.", 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = +[AMSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v15 = objc_opt_class();
    v13 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v70 = v15;
    __int16 v71 = 2114;
    v72 = v13;
    v14 = "%{public}@ [%{public}@] Unable to sync notification settings without an account.";
    goto LABEL_11;
  }
  id v7 = objc_loadWeakRetained(v4);
  v8 = [v7 account];
  int v9 = objc_msgSend(v8, "ams_isLocalAccount");

  if (v9)
  {
    AMSError(2, @"Invalid Parameter", @"We cannot sync the local account's push notification settings.", 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = +[AMSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v12 = objc_opt_class();
    v13 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v70 = v12;
    __int16 v71 = 2114;
    v72 = v13;
    v14 = "%{public}@ [%{public}@] Unable to sync notification settings without a local account.";
LABEL_11:
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);

LABEL_12:
    v16 = 0;
    goto LABEL_34;
  }
  v59 = a2;
  id v11 = AMSLogKey();
  v17 = +[AMSLogConfig sharedAccountsConfig];
  if (!v17)
  {
    v17 = +[AMSLogConfig sharedConfig];
  }
  v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v60 = objc_opt_class();
    id v62 = objc_loadWeakRetained(v4);
    [v62 account];
    v20 = v19 = v11;
    v21 = AMSHashIfNeeded(v20);
    id v22 = objc_loadWeakRetained(v4);
    v23 = [v22 identifier];
    v24 = AMSHashIfNeeded(v23);
    *(_DWORD *)buf = 138544130;
    uint64_t v70 = v60;
    __int16 v71 = 2114;
    v72 = v19;
    __int16 v73 = 2114;
    id v74 = v21;
    __int16 v75 = 2114;
    v76 = v24;
    _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching Granular Push Notification Settings. account = %{public}@ | identifier = %{public}@", buf, 0x2Au);

    id v11 = v19;
  }

  v25 = +[AMSMediaSharedProperties propertiesForNotificationSettingsTask:*(void *)(a1 + 32)];
  v26 = [AMSMediaRequestEncoder alloc];
  v27 = [v25 tokenService];
  v28 = [*(id *)(a1 + 32) bag];
  v29 = [(AMSMediaRequestEncoder *)v26 initWithTokenService:v27 bag:v28];

  id v30 = objc_loadWeakRetained(v4);
  v31 = [v30 account];
  [(AMSMediaRequestEncoder *)v29 setAccount:v31];

  id v32 = objc_loadWeakRetained(v4);
  v33 = [v32 clientInfo];
  [(AMSMediaRequestEncoder *)v29 setClientInfo:v33];

  v34 = objc_alloc_init(AMSMediaResponseDecoder);
  [(AMSMediaRequestEncoder *)v29 setResponseDecoder:v34];
  uint64_t v61 = [*(id *)(a1 + 32) _url];
  -[AMSMediaRequestEncoder requestWithURL:](v29, "requestWithURL:");
  v63 = id v68 = 0;
  v35 = [v63 resultWithTimeout:&v68 error:60.0];
  id v36 = v68;
  v37 = v36;
  if (!v35 || v36)
  {
    v57 = v25;
    v44 = +[AMSLogConfig sharedUserNotificationConfig];
    if (!v44)
    {
      v44 = +[AMSLogConfig sharedConfig];
    }
    v45 = [v44 OSLogObject];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v70 = (uint64_t)v46;
      __int16 v71 = 2114;
      v72 = v11;
      __int16 v73 = 2114;
      id v74 = v37;
      v47 = v34;
      id v48 = v46;
      _os_log_impl(&dword_18D554000, v45, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating media request: %{public}@", buf, 0x20u);

      v34 = v47;
    }

    id v10 = v37;
    v16 = 0;
    void *v59 = v10;
    v25 = v57;
    v49 = (void *)v61;
  }
  else
  {
    v56 = v34;
    v38 = [AMSMutableLazyPromise alloc];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __47__AMSNotificationSettingsTask_fetchAllSettings__block_invoke_20;
    v65[3] = &unk_1E55A39B8;
    id v66 = v25;
    id v67 = v35;
    v39 = [(AMSMutableLazyPromise *)v38 initWithBlock:v65];
    id v64 = 0;
    v40 = [(AMSLazyPromise *)v39 resultWithError:&v64];
    id v41 = v64;
    id v10 = v41;
    if (!v40 || v41)
    {
      v58 = v25;
      v50 = +[AMSLogConfig sharedUserNotificationConfig];
      if (!v50)
      {
        v50 = +[AMSLogConfig sharedConfig];
      }
      v51 = [v50 OSLogObject];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v70 = (uint64_t)v52;
        __int16 v71 = 2114;
        v72 = v55;
        __int16 v73 = 2114;
        id v74 = v10;
        id v53 = v52;
        _os_log_impl(&dword_18D554000, v51, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error getting result: %{public}@", buf, 0x20u);
      }
      v16 = 0;
      v25 = v58;
      void *v59 = v10;
      id v11 = v55;
    }
    else
    {
      v42 = [AMSNotificationSettingsResult alloc];
      v43 = [v40 responseDictionary];
      v16 = [(AMSNotificationSettingsResult *)v42 initWithDictionaryRepresentation:v43];
    }
    v34 = v56;
    v49 = (void *)v61;
  }
LABEL_34:

  return v16;
}

void __47__AMSNotificationSettingsTask_fetchAllSettings__block_invoke_20(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 session];
  v5 = [v6 dataTaskPromiseWithRequest:*(void *)(a1 + 40)];
  [v4 finishWithPromise:v5];
}

- (id)updateSettings:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__AMSNotificationSettingsTask_updateSettings___block_invoke;
  v8[3] = &unk_1E55A4F10;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v6 = [(AMSTask *)self performBinaryTaskWithBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

uint64_t __46__AMSNotificationSettingsTask_updateSettings___block_invoke(id *a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v6 = [WeakRetained account];

  if (!v6)
  {
    AMSError(2, @"Invalid Parameter", @"We cannot sync settings without an account.", 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = +[AMSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v15 = objc_opt_class();
    v13 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v63 = v15;
    __int16 v64 = 2114;
    v65 = v13;
    v14 = "%{public}@ [%{public}@] Unable to sync notification settings without an account.";
    goto LABEL_11;
  }
  id v7 = objc_loadWeakRetained(v4);
  v8 = [v7 account];
  int v9 = objc_msgSend(v8, "ams_isLocalAccount");

  if (!v9)
  {
    id v11 = AMSLogKey();
    v17 = +[AMSLogConfig sharedAccountsConfig];
    if (!v17)
    {
      v17 = +[AMSLogConfig sharedConfig];
    }
    v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v51 = objc_opt_class();
      id v54 = objc_loadWeakRetained(v4);
      v52 = [v54 account];
      v19 = AMSHashIfNeeded(v52);
      id v20 = objc_loadWeakRetained(v4);
      v21 = [v20 identifier];
      AMSHashIfNeeded(v21);
      id v22 = v56 = a2;
      v23 = AMSHashIfNeeded(a1[5]);
      *(_DWORD *)buf = 138544386;
      uint64_t v63 = v51;
      __int16 v64 = 2114;
      v65 = v11;
      __int16 v66 = 2114;
      id v67 = v19;
      __int16 v68 = 2114;
      v69 = v22;
      __int16 v70 = 2114;
      __int16 v71 = v23;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating Granular Push Notification Setting. account = %{public}@ | identifier = %{public}@ | items = %{public}@", buf, 0x34u);

      a2 = v56;
    }

    v24 = [AMSURLRequestEncoder alloc];
    id v25 = objc_loadWeakRetained(v4);
    v26 = [v25 bag];
    v27 = [(AMSURLRequestEncoder *)v24 initWithBag:v26];

    id v28 = objc_loadWeakRetained(v4);
    v29 = [v28 account];
    [(AMSURLRequestEncoder *)v27 setAccount:v29];

    [(AMSURLRequestEncoder *)v27 setRequestEncoding:3];
    [(AMSURLRequestEncoder *)v27 setLogUUID:v11];
    id v30 = objc_loadWeakRetained(v4);
    v31 = [v30 bag];
    id v32 = [v31 URLForKey:@"setGranularNotificationSettings"];

    id v60 = 0;
    v33 = [v32 valueWithError:&v60];
    id v34 = v60;
    if (v34)
    {
      id v10 = v34;
      uint64_t v16 = 0;
      *a2 = v10;
LABEL_24:

      goto LABEL_25;
    }
    v55 = v32;
    v57 = a2;
    v35 = [MEMORY[0x1E4F29088] componentsWithURL:v33 resolvingAgainstBaseURL:1];
    id v53 = [v35 queryItems];
    id v36 = (void *)MEMORY[0x1E4F290C8];
    id v37 = objc_loadWeakRetained(v4);
    v38 = [v37 identifier];
    v39 = [v36 queryItemWithName:@"serviceId" value:v38];
    uint64_t v61 = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
    id v41 = [v53 arrayByAddingObjectsFromArray:v40];
    [v35 setQueryItems:v41];

    uint64_t v42 = [v35 URL];

    v43 = [a1[4] _generateParametersForItems:a1[5]];
    v44 = [(AMSURLRequestEncoder *)v27 requestWithMethod:4 URL:v42 parameters:v43];

    id v59 = 0;
    v45 = [v44 resultWithError:&v59];
    id v46 = v59;
    if (v46)
    {
      id v10 = v46;
      v47 = 0;
    }
    else
    {
      id v48 = +[AMSURLSession defaultSession];
      v49 = [v48 dataTaskPromiseWithRequest:v45];
      id v58 = 0;
      v47 = [v49 resultWithError:&v58];
      id v10 = v58;

      if (!v10)
      {
        uint64_t v16 = 1;
        id v32 = v55;
        goto LABEL_23;
      }
    }
    id v32 = v55;
    id v10 = v10;
    uint64_t v16 = 0;
    void *v57 = v10;
LABEL_23:

    v33 = (void *)v42;
    goto LABEL_24;
  }
  AMSError(2, @"Invalid Parameter", @"We cannot sync the local account's push notification settings.", 0);
  *a2 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = +[AMSLogConfig sharedAccountsConfig];
  if (!v10)
  {
    id v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    goto LABEL_12;
  }
  uint64_t v12 = objc_opt_class();
  v13 = AMSLogKey();
  *(_DWORD *)buf = 138543618;
  uint64_t v63 = v12;
  __int16 v64 = 2114;
  v65 = v13;
  v14 = "%{public}@ [%{public}@] Unable to sync notification settings without a local account.";
LABEL_11:
  _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);

LABEL_12:
  uint64_t v16 = 0;
LABEL_25:

  return v16;
}

- (id)_url
{
  v3 = objc_opt_new();
  id v4 = [(AMSNotificationSettingsTask *)self identifier];
  [v3 setObject:v4 forKeyedSubscript:@"service"];

  id v5 = [(AMSNotificationSettingsTask *)self bag];
  id v6 = [(AMSNotificationSettingsTask *)self _stringForKey:@"getGranularNotificationSettings" fromBag:v5];

  id v7 = [(AMSNotificationSettingsTask *)self bag];
  v8 = [(AMSNotificationSettingsTask *)self _countryCodeFromBag:v7];

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v19 = 0;
  }
  else
  {
    id v10 = [v6 stringByReplacingOccurrencesOfString:@"{cc}" withString:v8];
    id v11 = objc_opt_new();
    uint64_t v12 = [(AMSNotificationSettingsTask *)self bag];
    v13 = [(AMSNotificationSettingsTask *)self _stringForKey:@"notification-settings-media-api-host" fromBag:v12];
    [v11 setHost:v13];

    [v11 setPath:v10];
    v14 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v15 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v16 = (void *)[v3 copy];
    v17 = [v15 queryItemsFromDictionary:v16];
    v18 = [v14 arrayWithArray:v17];
    [v11 setQueryItems:v18];

    [v11 setScheme:@"https"];
    v19 = [v11 URL];
  }
  return v19;
}

- (id)_countryCodeFromBag:(id)a3
{
  return [(AMSNotificationSettingsTask *)self _stringForKey:@"countryCode" fromBag:a3];
}

- (id)_stringForKey:(id)a3 fromBag:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [a4 stringForKey:a3];
  id v13 = 0;
  id v5 = [v4 valueWithError:&v13];
  id v6 = v13;

  if (v6)
  {
    id v7 = +[AMSLogConfig sharedUserNotificationConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      id v11 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      v17 = v10;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
    }
  }

  return v5;
}

- (id)_generateParametersForItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"settings"];

  return v11;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_14 != -1) {
    dispatch_once(&_MergedGlobals_1_14, &__block_literal_global_103);
  }
  v2 = (void *)qword_1EB38D1C8;
  return (NSString *)v2;
}

void __44__AMSNotificationSettingsTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D1C8;
  qword_1EB38D1C8 = @"GranularNotificationSettings";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D1D0 != -1) {
    dispatch_once(&qword_1EB38D1D0, &__block_literal_global_44);
  }
  v2 = (void *)qword_1EB38D1D8;
  return (NSString *)v2;
}

void __51__AMSNotificationSettingsTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D1D8;
  qword_1EB38D1D8 = @"1";
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

- (void)setAccount:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end