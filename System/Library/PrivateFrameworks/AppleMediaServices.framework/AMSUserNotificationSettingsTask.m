@interface AMSUserNotificationSettingsTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSUserNotificationSettingsTask)initWithIdentifier:(id)a3 clientIdentifier:(id)a4 account:(id)a5 bag:(id)a6;
- (NSString)clientIdentifier;
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

@implementation AMSUserNotificationSettingsTask

- (AMSUserNotificationSettingsTask)initWithIdentifier:(id)a3 clientIdentifier:(id)a4 account:(id)a5 bag:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AMSUserNotificationSettingsTask;
  v15 = [(AMSTask *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_account, a5);
    objc_storeStrong((id *)&v16->_bag, a6);
    objc_storeStrong((id *)&v16->_clientIdentifier, a4);
    objc_storeStrong((id *)&v16->_identifier, a3);
  }

  return v16;
}

- (id)fetchAllSettings
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AMSUserNotificationSettingsTask_fetchAllSettings__block_invoke;
  v5[3] = &unk_1E55A4EE8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = [(AMSTask *)self performTaskWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

AMSUserNotificationSettingsResult *__51__AMSUserNotificationSettingsTask_fetchAllSettings__block_invoke(uint64_t a1, void *a2)
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
    id v13 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v70 = v15;
    __int16 v71 = 2114;
    v72 = v13;
    id v14 = "%{public}@ [%{public}@] Unable to sync notification settings without an account.";
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
    id v13 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v70 = v12;
    __int16 v71 = 2114;
    v72 = v13;
    id v14 = "%{public}@ [%{public}@] Unable to sync notification settings without a local account.";
LABEL_11:
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);

LABEL_12:
    v16 = 0;
    goto LABEL_34;
  }
  v59 = a2;
  uint64_t v17 = AMSLogKey();
  objc_super v18 = +[AMSLogConfig sharedAccountsConfig];
  if (!v18)
  {
    objc_super v18 = +[AMSLogConfig sharedConfig];
  }
  v63 = v17;
  v19 = [v18 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_opt_class();
    id v61 = objc_loadWeakRetained(v4);
    v21 = [v61 account];
    v22 = AMSHashIfNeeded(v21);
    id v23 = objc_loadWeakRetained(v4);
    v24 = [v23 identifier];
    v25 = AMSHashIfNeeded(v24);
    *(_DWORD *)buf = 138544130;
    uint64_t v70 = v20;
    __int16 v71 = 2114;
    v72 = v63;
    __int16 v73 = 2114;
    id v74 = v22;
    __int16 v75 = 2114;
    v76 = v25;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching Granular Push Notification Settings. account = %{public}@ | identifier = %{public}@", buf, 0x2Au);
  }
  v26 = +[AMSMediaSharedProperties propertiesForUserNotificationSettingsTask:*(void *)(a1 + 32)];
  v27 = [AMSMediaRequestEncoder alloc];
  v28 = [v26 tokenService];
  v29 = [*(id *)(a1 + 32) bag];
  v30 = [(AMSMediaRequestEncoder *)v27 initWithTokenService:v28 bag:v29];

  id v31 = objc_loadWeakRetained(v4);
  v32 = [v31 account];
  [(AMSMediaRequestEncoder *)v30 setAccount:v32];

  id v33 = objc_loadWeakRetained(v4);
  v34 = [v33 clientInfo];
  [(AMSMediaRequestEncoder *)v30 setClientInfo:v34];

  v35 = objc_alloc_init(AMSMediaResponseDecoder);
  [(AMSMediaRequestEncoder *)v30 setResponseDecoder:v35];
  uint64_t v36 = [*(id *)(a1 + 32) _url];
  [(AMSMediaRequestEncoder *)v30 requestWithURL:v36];
  v60 = id v68 = 0;
  v37 = [v60 resultWithTimeout:&v68 error:60.0];
  id v38 = v68;
  v39 = v38;
  v62 = (void *)v36;
  if (!v37 || v38)
  {
    v47 = v26;
    v48 = +[AMSLogConfig sharedUserNotificationConfig];
    if (!v48)
    {
      v48 = +[AMSLogConfig sharedConfig];
    }
    v49 = [v48 OSLogObject];
    id v11 = v63;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v50 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v70 = (uint64_t)v50;
      __int16 v71 = 2114;
      v72 = v63;
      __int16 v73 = 2114;
      id v74 = v39;
      id v51 = v50;
      _os_log_impl(&dword_18D554000, v49, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating media request: %{public}@", buf, 0x20u);

      id v11 = v63;
    }

    id v10 = v39;
    v16 = 0;
    void *v59 = v10;
    v26 = v47;
  }
  else
  {
    v58 = v35;
    v40 = [AMSMutableLazyPromise alloc];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __51__AMSUserNotificationSettingsTask_fetchAllSettings__block_invoke_35;
    v65[3] = &unk_1E55A39B8;
    id v66 = v26;
    id v67 = v37;
    v41 = [(AMSMutableLazyPromise *)v40 initWithBlock:v65];
    id v64 = 0;
    v42 = [(AMSLazyPromise *)v41 resultWithError:&v64];
    id v43 = v64;
    id v10 = v43;
    if (!v42 || v43)
    {
      v52 = v26;
      v53 = +[AMSLogConfig sharedUserNotificationConfig];
      if (!v53)
      {
        v53 = +[AMSLogConfig sharedConfig];
      }
      v54 = [v53 OSLogObject];
      id v11 = v63;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v70 = (uint64_t)v55;
        __int16 v71 = 2114;
        v72 = v63;
        __int16 v73 = 2114;
        id v74 = v10;
        id v56 = v55;
        _os_log_impl(&dword_18D554000, v54, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error getting result: %{public}@", buf, 0x20u);

        id v11 = v63;
      }

      v16 = 0;
      void *v59 = v10;
      v26 = v52;
    }
    else
    {
      v44 = [AMSUserNotificationSettingsResult alloc];
      v45 = [*(id *)(a1 + 32) identifier];
      v46 = [v42 responseDictionary];
      v16 = [(AMSUserNotificationSettingsResult *)v44 initWithServiceIdentifier:v45 dictionaryRepresentation:v46];

      id v11 = v63;
    }

    v35 = v58;
  }

LABEL_34:
  return v16;
}

void __51__AMSUserNotificationSettingsTask_fetchAllSettings__block_invoke_35(uint64_t a1, void *a2)
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
  v8[2] = __50__AMSUserNotificationSettingsTask_updateSettings___block_invoke;
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

uint64_t __50__AMSUserNotificationSettingsTask_updateSettings___block_invoke(id *a1, void *a2)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
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
    id v13 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v76 = v15;
    __int16 v77 = 2114;
    v78 = v13;
    id v14 = "%{public}@ [%{public}@] Unable to sync notification settings without an account.";
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
    id v13 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v76 = v12;
    __int16 v77 = 2114;
    v78 = v13;
    id v14 = "%{public}@ [%{public}@] Unable to sync notification settings without a local account.";
LABEL_11:
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);

LABEL_12:
    uint64_t v16 = 0;
    goto LABEL_45;
  }
  v69 = a2;
  id v11 = AMSLogKey();
  uint64_t v17 = +[AMSLogConfig sharedAccountsConfig];
  if (!v17)
  {
    uint64_t v17 = +[AMSLogConfig sharedConfig];
  }
  objc_super v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v63 = objc_opt_class();
    id v67 = objc_loadWeakRetained(v4);
    v65 = [v67 account];
    v19 = AMSHashIfNeeded(v65);
    id v20 = objc_loadWeakRetained(v4);
    v21 = [v20 identifier];
    AMSHashIfNeeded(v21);
    id v23 = v22 = v11;
    v24 = AMSHashIfNeeded(a1[5]);
    *(_DWORD *)buf = 138544386;
    uint64_t v76 = v63;
    __int16 v77 = 2114;
    v78 = v22;
    __int16 v79 = 2114;
    id v80 = v19;
    __int16 v81 = 2114;
    v82 = v23;
    __int16 v83 = 2114;
    v84 = v24;
    _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating Granular Push Notification Setting. account = %{public}@ | identifier = %{public}@ | items = %{public}@", buf, 0x34u);

    id v11 = v22;
  }

  v25 = +[AMSMediaSharedProperties propertiesForUserNotificationSettingsTask:a1[4]];
  v26 = [AMSMediaRequestEncoder alloc];
  v27 = [v25 tokenService];
  v28 = [a1[4] bag];
  v29 = [(AMSMediaRequestEncoder *)v26 initWithTokenService:v27 bag:v28];

  id v30 = objc_loadWeakRetained(v4);
  id v31 = [v30 account];
  [(AMSMediaRequestEncoder *)v29 setAccount:v31];

  id v32 = objc_loadWeakRetained(v4);
  id v33 = [v32 clientInfo];
  [(AMSMediaRequestEncoder *)v29 setClientInfo:v33];

  [(AMSMediaRequestEncoder *)v29 setRequestEncoding:3];
  v34 = [a1[4] _url];
  if (v34)
  {
    v35 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v34];
    [v35 setHTTPMethod:@"PATCH"];
    [a1[4] _generateParametersForItems:a1[5]];
    v68 = id v64 = v35;
    -[AMSMediaRequestEncoder requestByEncodingRequest:parameters:](v29, "requestByEncodingRequest:parameters:", v35);
    id v66 = v74 = 0;
    uint64_t v36 = [v66 resultWithTimeout:&v74 error:60.0];
    id v37 = v74;
    id v38 = v37;
    if (!v36 || v37)
    {
      v62 = v25;
      v55 = +[AMSLogConfig sharedUserNotificationConfig];
      if (!v55)
      {
        v55 = +[AMSLogConfig sharedConfig];
      }
      id v56 = [v55 OSLogObject];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v76 = (uint64_t)v57;
        __int16 v77 = 2114;
        v78 = v11;
        __int16 v79 = 2114;
        id v80 = v38;
        id v58 = v57;
        _os_log_impl(&dword_18D554000, v56, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error generating media request: %{public}@", buf, 0x20u);
      }
      id v10 = v38;
      uint64_t v16 = 0;
      void *v69 = v10;
      v25 = v62;
    }
    else
    {
      v39 = v11;
      v40 = [AMSMutableLazyPromise alloc];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __50__AMSUserNotificationSettingsTask_updateSettings___block_invoke_49;
      v71[3] = &unk_1E55A39B8;
      id v72 = v25;
      id v73 = v36;
      v41 = [(AMSMutableLazyPromise *)v40 initWithBlock:v71];
      id v70 = 0;
      v42 = [(AMSLazyPromise *)v41 resultWithError:&v70];
      id v43 = v70;
      id v10 = v43;
      if (v42) {
        BOOL v44 = v43 == 0;
      }
      else {
        BOOL v44 = 0;
      }
      uint64_t v16 = v44;
      if (!v44)
      {
        v60 = v41;
        id v61 = v25;
        v45 = +[AMSLogConfig sharedUserNotificationConfig];
        if (!v45)
        {
          v45 = +[AMSLogConfig sharedConfig];
        }
        v46 = [v45 OSLogObject];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          uint64_t v76 = (uint64_t)v47;
          __int16 v77 = 2114;
          v78 = v39;
          __int16 v79 = 2114;
          id v80 = v10;
          v48 = v46;
          id v49 = v47;
          _os_log_impl(&dword_18D554000, v48, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error getting result: %{public}@", buf, 0x20u);

          v46 = v48;
        }

        void *v69 = v10;
        v41 = v60;
        v25 = v61;
      }

      id v11 = v39;
    }
  }
  else
  {
    v50 = v25;
    id v51 = +[AMSLogConfig sharedUserNotificationConfig];
    if (!v51)
    {
      id v51 = +[AMSLogConfig sharedConfig];
    }
    v52 = [v51 OSLogObject];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v76 = (uint64_t)v53;
      __int16 v77 = 2114;
      v78 = v11;
      id v54 = v53;
      _os_log_impl(&dword_18D554000, v52, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Bag missing URL", buf, 0x16u);
    }
    AMSError(204, @"Could not build user notification task URL", @"Bag is missing URL components", 0);
    id v10 = 0;
    uint64_t v16 = 0;
    void *v69 = (id)objc_claimAutoreleasedReturnValue();
    v25 = v50;
  }

LABEL_45:
  return v16;
}

void __50__AMSUserNotificationSettingsTask_updateSettings___block_invoke_49(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 session];
  id v5 = [v6 dataTaskPromiseWithRequest:*(void *)(a1 + 40)];
  [v4 finishWithPromise:v5];
}

- (id)_generateParametersForItems:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(a3, "ams_dictionaryUsingTransform:", &__block_literal_global_142);
  id v5 = objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_54);
  uint64_t v12 = @"notification-preferences";
  id v6 = [(AMSUserNotificationSettingsTask *)self identifier];
  id v10 = v6;
  id v11 = v5;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  return v8;
}

uint64_t __63__AMSUserNotificationSettingsTask__generateParametersForItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

AMSPair *__63__AMSUserNotificationSettingsTask__generateParametersForItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [AMSPair alloc];
  id v7 = [v4 updateDictionary];

  v8 = [(AMSPair *)v6 initWithFirst:v5 second:v7];
  return v8;
}

- (id)_url
{
  v3 = objc_opt_new();
  [v3 setObject:@"notification-preferences" forKeyedSubscript:@"kinds"];
  id v4 = [(AMSUserNotificationSettingsTask *)self identifier];
  [v3 setObject:v4 forKeyedSubscript:@"service"];

  [v3 setObject:@"explicit" forKeyedSubscript:@"action"];
  id v5 = +[AMSMediaURLBuilderUtility devicePlatform];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"platform"];
  }
  id v6 = [(AMSUserNotificationSettingsTask *)self bag];
  id v7 = [(AMSUserNotificationSettingsTask *)self _stringForKey:@"notification-settings-media-api-path" fromBag:v6];

  v8 = [(AMSUserNotificationSettingsTask *)self bag];
  int v9 = [(AMSUserNotificationSettingsTask *)self _countryCodeFromBag:v8];

  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    id v20 = 0;
  }
  else
  {
    id v11 = [v7 stringByReplacingOccurrencesOfString:@"{cc}" withString:v9];
    uint64_t v12 = objc_opt_new();
    id v13 = [(AMSUserNotificationSettingsTask *)self bag];
    id v14 = [(AMSUserNotificationSettingsTask *)self _stringForKey:@"notification-settings-media-api-host" fromBag:v13];
    [v12 setHost:v14];

    [v12 setPath:v11];
    uint64_t v15 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v16 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v17 = (void *)[v3 copy];
    objc_super v18 = [v16 queryItemsFromDictionary:v17];
    v19 = [v15 arrayWithArray:v18];
    [v12 setQueryItems:v19];

    [v12 setScheme:@"https"];
    id v20 = [v12 URL];
  }
  return v20;
}

- (id)_countryCodeFromBag:(id)a3
{
  return [(AMSUserNotificationSettingsTask *)self _stringForKey:@"countryCode" fromBag:a3];
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
      BOOL v10 = AMSLogKey();
      id v11 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
    }
  }

  return v5;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_1_18 != -1) {
    dispatch_once(&_MergedGlobals_1_18, &__block_literal_global_64_0);
  }
  v2 = (void *)qword_1EB38D238;
  return (NSString *)v2;
}

void __48__AMSUserNotificationSettingsTask_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D238;
  qword_1EB38D238 = @"GranularNotificationSettings";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D240 != -1) {
    dispatch_once(&qword_1EB38D240, &__block_literal_global_69_1);
  }
  v2 = (void *)qword_1EB38D248;
  return (NSString *)v2;
}

void __55__AMSUserNotificationSettingsTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D248;
  qword_1EB38D248 = @"1";
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
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
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end