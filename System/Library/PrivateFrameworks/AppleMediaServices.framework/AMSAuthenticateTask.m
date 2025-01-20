@interface AMSAuthenticateTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_accountStoreForOptions:(id)a3;
+ (id)_createFallbackBag;
+ (id)createBagForSubProfile;
+ (id)loadCreateAppleIDWithClientInfo:(id)a3 bag:(id)a4;
+ (id)loadCreateAppleIDWithClientInfo:(id)a3 url:(id)a4 bag:(id)a5;
- (ACAccountStore)accountStore;
- (AMSAuthenticateMetricsProtocol)metrics;
- (AMSAuthenticateOptions)options;
- (AMSAuthenticateTask)init;
- (AMSAuthenticateTask)initWithAccount:(id)a3 accountStore:(id)a4 options:(id)a5;
- (AMSAuthenticateTask)initWithAccount:(id)a3 accountStore:(id)a4 options:(id)a5 bag:(id)a6;
- (AMSAuthenticateTask)initWithAccount:(id)a3 options:(id)a4;
- (AMSAuthenticateTask)initWithAccount:(id)a3 options:(id)a4 bag:(id)a5;
- (AMSAuthenticateTask)initWithAuthenticationResults:(id)a3 accountStore:(id)a4 options:(id)a5;
- (AMSAuthenticateTask)initWithAuthenticationResults:(id)a3 accountStore:(id)a4 options:(id)a5 bag:(id)a6;
- (AMSAuthenticateTask)initWithAuthenticationResults:(id)a3 options:(id)a4;
- (AMSAuthenticateTask)initWithAuthenticationResults:(id)a3 options:(id)a4 bag:(id)a5;
- (AMSAuthenticateTask)initWithRequest:(id)a3;
- (AMSAuthenticateTask)initWithRequest:(id)a3 accountStore:(id)a4;
- (AMSAuthenticateTask)initWithRequest:(id)a3 accountStore:(id)a4 bag:(id)a5;
- (AMSAuthenticateTask)initWithRequest:(id)a3 bag:(id)a4;
- (AMSAuthenticateTaskDelegate)delegate;
- (AMSBagProtocol)bag;
- (AMSMutablePromise)resultPromise;
- (BOOL)_isMetricsEnabled;
- (BOOL)isLocalAccountProvided;
- (BOOL)isServerRequested;
- (NSDictionary)initialAuthenticationResults;
- (NSMutableArray)errors;
- (NSNumber)DSID;
- (NSString)altDSID;
- (NSString)multiUserToken;
- (NSString)password;
- (NSString)rawPassword;
- (NSString)username;
- (NSUUID)homeIdentifier;
- (NSUUID)homeUserIdentifier;
- (id)_accountForAuthenticationWithError:(id *)a3;
- (id)_attemptCompanionAuthenticationForAccount:(id)a3;
- (id)_attemptPasswordReuseAuthenticationForAccount:(id)a3;
- (id)_createAuthKitUpdateTaskForAccount:(id)a3;
- (id)_finishWithVerifiedAccount:(id)a3 andAuthKitUpdateResult:(id)a4;
- (id)_performAuthenticationUsingAccount:(id)a3 credentialSource:(unint64_t)a4;
- (id)_runCreateAccountDialog;
- (id)_runCreateAccountDialogWithBag:(id)a3;
- (id)_runDialogRequest:(id)a3;
- (id)_sanitizeError:(id)a3;
- (id)homeID;
- (id)performAuthentication;
- (void)_attemptMultiUserTokenAuthenticationForAccount:(id)a3 completion:(id)a4;
- (void)_handleDialogFromError:(id)a3 completion:(id)a4;
- (void)_performAuthenticationAndGeneratePasswordWithAccount:(id)a3;
- (void)_performAuthenticationWithInitialResultsAndAccount:(id)a3;
- (void)_postFollowUpForFailedAuthenticationWithAccount:(id)a3;
- (void)_processAuthKitUpdateResult:(id)a3 error:(id)a4;
- (void)_updateAccountWithProvidedInformation:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setBag:(id)a3;
- (void)setDSID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrors:(id)a3;
- (void)setHomeID:(id)a3;
- (void)setHomeIdentifier:(id)a3;
- (void)setHomeUserIdentifier:(id)a3;
- (void)setIsLocalAccountProvided:(BOOL)a3;
- (void)setIsServerRequested:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRawPassword:(id)a3;
- (void)setResultPromise:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation AMSAuthenticateTask

- (AMSAuthenticateTask)init
{
  return [(AMSAuthenticateTask *)self initWithAccount:0 options:0];
}

- (AMSAuthenticateTask)initWithAccount:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() _createFallbackBag];
  v9 = [(AMSAuthenticateTask *)self initWithAccount:v7 options:v6 bag:v8];

  return v9;
}

- (AMSAuthenticateTask)initWithAccount:(id)a3 accountStore:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _createFallbackBag];
  v12 = [(AMSAuthenticateTask *)self initWithAccount:v10 accountStore:v9 options:v8 bag:v11];

  return v12;
}

- (AMSAuthenticateTask)initWithAccount:(id)a3 options:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _accountStoreForOptions:v9];
  v12 = [(AMSAuthenticateTask *)self initWithAccount:v10 accountStore:v11 options:v9 bag:v8];

  return v12;
}

- (AMSAuthenticateTask)initWithAccount:(id)a3 accountStore:(id)a4 options:(id)a5 bag:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (AMSAuthenticateOptions *)a5;
  id v13 = a6;
  id v14 = AMSSetLogKeyIfNeeded();
  v41.receiver = self;
  v41.super_class = (Class)AMSAuthenticateTask;
  v15 = [(AMSTask *)&v41 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountStore, a4);
    objc_storeStrong((id *)&v16->_bag, a6);
    v17 = objc_alloc_init(AMSMutablePromise);
    resultPromise = v16->_resultPromise;
    v16->_resultPromise = v17;

    v19 = v12;
    if (!v12) {
      v19 = objc_alloc_init(AMSAuthenticateOptions);
    }
    objc_storeStrong((id *)&v16->_options, v19);
    if (!v12) {

    }
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    errors = v16->_errors;
    v16->_errors = v20;

    v22 = [[AMSAuthenticateMetrics alloc] initWithBag:v13];
    metrics = v16->_metrics;
    v16->_metrics = (AMSAuthenticateMetricsProtocol *)v22;

    v24 = [v10 credential];
    v25 = [v24 password];
    uint64_t v26 = [v25 copy];
    password = v16->_password;
    v16->_password = (NSString *)v26;

    v28 = [v10 credential];
    v29 = [v28 credentialItemForKey:*MEMORY[0x1E4F17970]];
    uint64_t v30 = [v29 copy];
    rawPassword = v16->_rawPassword;
    v16->_rawPassword = (NSString *)v30;

    v32 = objc_msgSend(v10, "ams_altDSID");
    uint64_t v33 = [v32 copy];
    altDSID = v16->_altDSID;
    v16->_altDSID = (NSString *)v33;

    uint64_t v35 = objc_msgSend(v10, "ams_DSID");
    DSID = v16->_DSID;
    v16->_DSID = (NSNumber *)v35;

    v37 = [v10 username];
    uint64_t v38 = [v37 copy];
    username = v16->_username;
    v16->_username = (NSString *)v38;

    v16->_isLocalAccountProvided = objc_msgSend(v10, "ams_isLocalAccount");
  }

  return v16;
}

- (AMSAuthenticateTask)initWithAuthenticationResults:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() _createFallbackBag];
  id v9 = [(AMSAuthenticateTask *)self initWithAuthenticationResults:v7 options:v6 bag:v8];

  return v9;
}

- (AMSAuthenticateTask)initWithAuthenticationResults:(id)a3 accountStore:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() _createFallbackBag];
  v12 = [(AMSAuthenticateTask *)self initWithAuthenticationResults:v10 accountStore:v9 options:v8 bag:v11];

  return v12;
}

- (AMSAuthenticateTask)initWithAuthenticationResults:(id)a3 options:(id)a4 bag:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() _accountStoreForOptions:v9];
  v12 = [(AMSAuthenticateTask *)self initWithAuthenticationResults:v10 accountStore:v11 options:v9 bag:v8];

  return v12;
}

- (AMSAuthenticateTask)initWithAuthenticationResults:(id)a3 accountStore:(id)a4 options:(id)a5 bag:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (AMSAuthenticateOptions *)a5;
  id v13 = a6;
  id v14 = AMSSetLogKeyIfNeeded();
  v27.receiver = self;
  v27.super_class = (Class)AMSAuthenticateTask;
  v15 = [(AMSTask *)&v27 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountStore, a4);
    objc_storeStrong((id *)&v16->_bag, a6);
    uint64_t v17 = [v10 copy];
    initialAuthenticationResults = v16->_initialAuthenticationResults;
    v16->_initialAuthenticationResults = (NSDictionary *)v17;

    v19 = objc_alloc_init(AMSMutablePromise);
    resultPromise = v16->_resultPromise;
    v16->_resultPromise = v19;

    v21 = v12;
    if (!v12) {
      v21 = objc_alloc_init(AMSAuthenticateOptions);
    }
    objc_storeStrong((id *)&v16->_options, v21);
    if (!v12) {

    }
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    errors = v16->_errors;
    v16->_errors = v22;

    v24 = [[AMSAuthenticateMetrics alloc] initWithBag:v13];
    metrics = v16->_metrics;
    v16->_metrics = (AMSAuthenticateMetricsProtocol *)v24;
  }
  return v16;
}

- (AMSAuthenticateTask)initWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() _createFallbackBag];
  id v6 = [(AMSAuthenticateTask *)self initWithRequest:v4 bag:v5];

  return v6;
}

- (AMSAuthenticateTask)initWithRequest:(id)a3 accountStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() _createFallbackBag];
  id v9 = [(AMSAuthenticateTask *)self initWithRequest:v7 accountStore:v6 bag:v8];

  return v9;
}

- (AMSAuthenticateTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  id v9 = [v7 options];
  id v10 = [v8 _accountStoreForOptions:v9];
  id v11 = [(AMSAuthenticateTask *)self initWithRequest:v7 accountStore:v10 bag:v6];

  return v11;
}

- (AMSAuthenticateTask)initWithRequest:(id)a3 accountStore:(id)a4 bag:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 logKey];

  if (v9)
  {
    id v10 = [v7 logKey];
    id v11 = AMSSetLogKey(v10);
  }
  self->_isServerRequested = [v7 isServerRequested];
  v12 = [v7 account];
  id v13 = [v7 options];
  id v14 = [(AMSAuthenticateTask *)self initWithAccount:v12 options:v13 bag:v8];

  return v14;
}

- (id)performAuthentication
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AMSAuthenticateTask_performAuthentication__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __44__AMSAuthenticateTask_performAuthentication__block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) initialAuthenticationResults];
  BOOL v3 = v2 == 0;

  uint64_t v4 = +[AMSLogConfig sharedAccountsOversizeConfig];
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v48 = objc_opt_class();
      v49 = AMSLogKey();
      id v13 = [*(id *)(a1 + 32) altDSID];
      id v14 = AMSHashIfNeeded(v13);
      v15 = [*(id *)(a1 + 32) DSID];
      v16 = AMSHashIfNeeded(v15);
      uint64_t v17 = [*(id *)(a1 + 32) username];
      v18 = AMSHashIfNeeded(v17);
      v19 = [*(id *)(a1 + 32) options];
      *(_DWORD *)buf = 138544642;
      uint64_t v56 = v48;
      __int16 v57 = 2114;
      v58 = v49;
      __int16 v59 = 2114;
      v60 = v14;
      __int16 v61 = 2114;
      v62 = v16;
      __int16 v63 = 2114;
      v64 = v18;
      __int16 v65 = 2114;
      v66 = v19;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing an iTunes authentication. altDSID = %{public}@ | DSID = %{public}@ | username = %{public}@ | options = %{public}@", buf, 0x3Eu);
    }
  }
  else
  {
    if (!v4)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = AMSLogKey();
      id v9 = [*(id *)(a1 + 32) initialAuthenticationResults];
      id v10 = objc_msgSend(v9, "ak_redactedCopy");
      id v11 = AMSHashIfNeeded(v10);
      v12 = [*(id *)(a1 + 32) options];
      *(_DWORD *)buf = 138544130;
      uint64_t v56 = v7;
      __int16 v57 = 2114;
      v58 = v8;
      __int16 v59 = 2114;
      v60 = v11;
      __int16 v61 = 2114;
      v62 = v12;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing an authentication with pre-initialized authentication results. authenticationResults = %{public}@ | options = %{public}@", buf, 0x2Au);
    }
  }

  if (![*(id *)(a1 + 32) isLocalAccountProvided])
  {
    objc_super v27 = *(void **)(a1 + 32);
    id v54 = 0;
    v28 = [v27 _accountForAuthenticationWithError:&v54];
    id v29 = v54;
    uint64_t v30 = *(void **)(a1 + 32);
    if (v29)
    {
      v31 = [v30 resultPromise];
      [v31 finishWithError:v29];

      v32 = [*(id *)(a1 + 32) resultPromise];
LABEL_32:

      goto LABEL_33;
    }
    if ([v30 _isMetricsEnabled])
    {
      v36 = [AMSAuthenticateMetricsContext alloc];
      v37 = [*(id *)(a1 + 32) options];
      uint64_t v38 = [(AMSAuthenticateMetricsContext *)v36 initWithOptions:v37 account:v28];

      -[AMSAuthenticateMetricsContext setIsServerRequested:](v38, "setIsServerRequested:", [*(id *)(a1 + 32) isServerRequested]);
      v39 = [*(id *)(a1 + 32) metrics];
      id v40 = (id)[v39 enqueueWithEvent:0 context:v38];
    }
    objc_super v41 = objc_alloc_init(AMSMutablePromise);
    v42 = [*(id *)(a1 + 32) options];
    if ([v42 enableAccountCreation])
    {
      v43 = [v28 username];
      BOOL v44 = v43 == 0;

      if (v44)
      {
        v45 = [*(id *)(a1 + 32) _runCreateAccountDialog];
        [(AMSMutablePromise *)v41 finishWithPromise:v45];

LABEL_31:
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __44__AMSAuthenticateTask_performAuthentication__block_invoke_56;
        v52[3] = &unk_1E559EF60;
        v52[4] = *(void *)(a1 + 32);
        id v53 = v28;
        [(AMSPromise *)v41 resultWithCompletion:v52];
        objc_initWeak((id *)buf, *(id *)(a1 + 32));
        v46 = [*(id *)(a1 + 32) resultPromise];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __44__AMSAuthenticateTask_performAuthentication__block_invoke_2;
        v50[3] = &unk_1E559EF88;
        objc_copyWeak(&v51, (id *)buf);
        [v46 addFinishBlock:v50];

        v32 = [*(id *)(a1 + 32) resultPromise];
        objc_destroyWeak(&v51);
        objc_destroyWeak((id *)buf);

        goto LABEL_32;
      }
    }
    else
    {
    }
    -[AMSMutablePromise finishWithResult:](v41, "finishWithResult:", MEMORY[0x1E4F1CC38], v48);
    goto LABEL_31;
  }
  BOOL v20 = +[AMSUnitTests isRunningUnitTests];
  uint64_t v21 = +[AMSLogConfig sharedAccountsConfig];
  v22 = (void *)v21;
  if (v20)
  {
    if (!v21)
    {
      v22 = +[AMSLogConfig sharedConfig];
    }
    v23 = objc_msgSend(v22, "OSLogObject", v48);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_opt_class();
      v25 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v56 = v24;
      __int16 v57 = 2114;
      v58 = v25;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Local account provided. Unable to proceed with the authentication because the account provided is a local account.", buf, 0x16u);
    }
    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v26 = +[AMSLogConfig sharedAccountsConfig];
    [v22 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v26 userInfo:0];
  }
  else
  {
    if (!v21)
    {
      v22 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v26 = objc_msgSend(v22, "OSLogObject", v48);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      uint64_t v33 = objc_opt_class();
      v34 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v56 = v33;
      __int16 v57 = 2114;
      v58 = v34;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Local account provided. Unable to proceed with the authentication because the account provided is a local account.", buf, 0x16u);
    }
  }

  AMSError(2, @"Local Account Provided", @"Unable to proceed with the authentication because the account provided is a local account.", 0);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [*(id *)(a1 + 32) resultPromise];
  [v35 finishWithError:v29];

  v32 = [*(id *)(a1 + 32) resultPromise];
LABEL_33:

  return v32;
}

void __44__AMSAuthenticateTask_performAuthentication__block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = *(void **)(a1 + 32);
  id v10 = v4;
  if (v4)
  {
    id v6 = [v5 resultPromise];
    [v6 finishWithError:v10];
  }
  else
  {
    uint64_t v7 = [v5 initialAuthenticationResults];

    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    if (v7) {
      [v8 _performAuthenticationWithInitialResultsAndAccount:v9];
    }
    else {
      [v8 _performAuthenticationAndGeneratePasswordWithAccount:v9];
    }
  }
}

void __44__AMSAuthenticateTask_performAuthentication__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _isMetricsEnabled])
  {
    v1 = [WeakRetained metrics];
    [v1 flushEvents];
  }
}

+ (NSString)bagSubProfile
{
  return +[AMSURLRequestEncoder bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSURLRequestEncoder bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  return +[AMSURLRequestEncoder createBagForSubProfile];
}

- (id)_accountForAuthenticationWithError:(id *)a3
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v4 = [(AMSAuthenticateTask *)self accountStore];
  v5 = [(AMSAuthenticateTask *)self initialAuthenticationResults];

  id v6 = off_1E559C000;
  uint64_t v7 = +[AMSLogConfig sharedAccountsConfig];
  id v8 = (void *)v7;
  if (v5)
  {
    if (!v7)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      v12 = [(AMSAuthenticateTask *)self initialAuthenticationResults];
      objc_msgSend(v12, "ak_redactedCopy");
      v14 = id v13 = v4;
      v15 = AMSHashIfNeeded(v14);
      *(_DWORD *)buf = 138543874;
      uint64_t v105 = v10;
      __int16 v106 = 2114;
      v107 = v11;
      __int16 v108 = 2114;
      v109 = v15;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking for an existing account matching authentication results. authenticationResults = %{public}@", buf, 0x20u);

      id v4 = v13;
      id v6 = off_1E559C000;
    }
    v16 = (void *)MEMORY[0x1E4F179C8];
    uint64_t v17 = objc_msgSend(v4, "ams_mediaType");
    v18 = objc_msgSend(v16, "ams_accountTypeIdentifierForMediaType:", v17);

    v19 = [(AMSAuthenticateTask *)self initialAuthenticationResults];
    BOOL v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F4ED98]];

    uint64_t v21 = objc_msgSend(v4, "ams_accountWithAltDSID:DSID:username:accountTypeIdentifier:", v20, 0, 0, v18);
    if (v21)
    {
      v22 = v21;
      v23 = [v21 username];

      if (v23)
      {
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v24 = +[AMSLogConfig sharedAccountsConfig];
      if (!v24)
      {
        uint64_t v24 = +[AMSLogConfig sharedConfig];
      }
      v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v97 = objc_opt_class();
        uint64_t v26 = AMSLogKey();
        v98 = [(AMSAuthenticateTask *)self initialAuthenticationResults];
        objc_super v27 = objc_msgSend(v98, "ak_redactedCopy");
        AMSHashIfNeeded(v27);
        v28 = v100 = v4;
        id v29 = AMSHashIfNeeded(v22);
        *(_DWORD *)buf = 138544130;
        uint64_t v105 = v97;
        __int16 v106 = 2114;
        v107 = v26;
        __int16 v108 = 2114;
        v109 = v28;
        __int16 v110 = 2114;
        v111 = v29;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Found an account matching the given authentication results’ altDSID, but it has no username. authenticationResults = %{public}@ | account = %{public}@", buf, 0x2Au);

        id v6 = off_1E559C000;
        id v4 = v100;
      }
    }
    else
    {
      v22 = +[AMSLogConfig sharedAccountsConfig];
      if (!v22)
      {
        v22 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v24 = [v22 OSLogObject];
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      v102 = v4;
      uint64_t v42 = objc_opt_class();
      v25 = AMSLogKey();
      v43 = [(AMSAuthenticateTask *)self initialAuthenticationResults];
      BOOL v44 = objc_msgSend(v43, "ak_redactedCopy");
      v45 = AMSHashIfNeeded(v44);
      *(_DWORD *)buf = 138543874;
      uint64_t v105 = v42;
      id v4 = v102;
      __int16 v106 = 2114;
      v107 = v25;
      __int16 v108 = 2114;
      v109 = v45;
      _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did not find an account matching the given authentication results. authenticationResults = %{public}@", buf, 0x20u);

      id v6 = off_1E559C000;
    }

LABEL_26:
    goto LABEL_27;
  }
  if (!v7)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v30 = [v8 OSLogObject];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v99 = objc_opt_class();
    v31 = AMSLogKey();
    v32 = [(AMSAuthenticateTask *)self altDSID];
    uint64_t v33 = AMSHashIfNeeded(v32);
    v34 = [(AMSAuthenticateTask *)self DSID];
    AMSHashIfNeeded(v34);
    uint64_t v35 = v101 = v4;
    v36 = [(AMSAuthenticateTask *)self username];
    v37 = AMSHashIfNeeded(v36);
    *(_DWORD *)buf = 138544386;
    uint64_t v105 = v99;
    __int16 v106 = 2114;
    v107 = v31;
    __int16 v108 = 2114;
    v109 = v33;
    __int16 v110 = 2114;
    v111 = v35;
    __int16 v112 = 2114;
    v113 = v37;
    _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Looking for an existing account. altDSID = %{public}@ | DSID = %{public}@ | username = %{public}@", buf, 0x34u);

    id v6 = off_1E559C000;
    id v4 = v101;
  }
  uint64_t v38 = [(AMSAuthenticateTask *)self altDSID];
  if (v38) {
    goto LABEL_18;
  }
  uint64_t v38 = [(AMSAuthenticateTask *)self DSID];
  if (v38) {
    goto LABEL_18;
  }
  v71 = [(AMSAuthenticateTask *)self username];

  if (!v71)
  {
    v72 = objc_msgSend(v4, "ams_demoAccount");
    v73 = [v72 username];
    [(AMSAuthenticateTask *)self setUsername:v73];

    v74 = [(AMSAuthenticateTask *)self username];

    if (v74)
    {
      uint64_t v38 = +[AMSLogConfig sharedAccountsConfig];
      if (!v38)
      {
        uint64_t v38 = +[AMSLogConfig sharedConfig];
      }
      v75 = [v38 OSLogObject];
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v76 = objc_opt_class();
        v77 = AMSLogKey();
        v78 = [(AMSAuthenticateTask *)self username];
        v79 = AMSHashIfNeeded(v78);
        *(_DWORD *)buf = 138543874;
        uint64_t v105 = v76;
        __int16 v106 = 2114;
        v107 = v77;
        __int16 v108 = 2114;
        v109 = v79;
        _os_log_impl(&dword_18D554000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Using the device's demo account. username = %{public}@", buf, 0x20u);
      }
LABEL_18:
    }
  }
  v39 = [(AMSAuthenticateTask *)self altDSID];
  id v40 = [(AMSAuthenticateTask *)self DSID];
  objc_super v41 = [(AMSAuthenticateTask *)self username];
  v22 = objc_msgSend(v4, "ams_iTunesAccountWithAltDSID:DSID:username:", v39, v40, v41);

  if (v22)
  {
LABEL_34:
    if (([v22 isActive] & 1) == 0)
    {
      uint64_t v56 = [MEMORY[0x1E4FB36F8] sharedManager];
      __int16 v57 = [v56 currentPersona];

      if ([v57 isEnterprisePersona])
      {
        v58 = [v57 userPersonaUniqueString];
        __int16 v59 = [(__objc2_class *)v6[17] sharedAccountsConfig];
        if (!v59)
        {
          __int16 v59 = [(__objc2_class *)v6[17] sharedConfig];
        }
        v60 = [v59 OSLogObject];
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v61 = v4;
          v62 = AMSLogKey();
          __int16 v63 = NSString;
          uint64_t v64 = objc_opt_class();
          uint64_t v65 = v64;
          if (v62)
          {
            AMSLogKey();
            a3 = (id *)objc_claimAutoreleasedReturnValue();
            [v63 stringWithFormat:@"%@: [%@] ", v65, a3];
          }
          else
          {
            [v63 stringWithFormat:@"%@: ", v64];
          v66 = };
          v80 = AMSHashIfNeeded(v58);
          *(_DWORD *)buf = 138543618;
          uint64_t v105 = (uint64_t)v66;
          __int16 v106 = 2114;
          v107 = v80;
          _os_log_impl(&dword_18D554000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@The current persona is an enterprise persona. Adding a persona identifier to the account. personaIdentifier = %{public}@", buf, 0x16u);
          if (v62)
          {

            v66 = a3;
          }

          id v4 = v61;
          id v6 = off_1E559C000;
        }

        [v22 setObject:v58 forKeyedSubscript:*MEMORY[0x1E4F176E8]];
      }
    }
    v81 = [(AMSAuthenticateTask *)self options];
    v82 = [v81 clientInfo];
    v83 = [v82 accountMediaType];

    v84 = [(AMSAuthenticateTask *)self accountStore];
    v85 = objc_msgSend(v84, "ams_activeiTunesAccount");

    if (!v85)
    {
      v86 = [(AMSAuthenticateTask *)self options];
      int v87 = [v86 canMakeAccountActive];

      uint64_t v88 = [(__objc2_class *)v6[17] sharedAccountsConfig];
      v89 = (void *)v88;
      if (v87)
      {
        if (!v88)
        {
          v89 = [(__objc2_class *)v6[17] sharedConfig];
        }
        v90 = [v89 OSLogObject];
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v91 = objc_opt_class();
          v92 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          uint64_t v105 = v91;
          __int16 v106 = 2114;
          v107 = v92;
          __int16 v108 = 2114;
          v109 = v83;
          _os_log_impl(&dword_18D554000, v90, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The device doesn't have an active account for %{public}@. We'll make the account active if we successfully authenticate it.", buf, 0x20u);
        }
        objc_msgSend(v22, "ams_setActive:forMediaType:", 1, v83);
      }
      else
      {
        if (!v88)
        {
          v89 = [(__objc2_class *)v6[17] sharedConfig];
        }
        v93 = [v89 OSLogObject];
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v94 = objc_opt_class();
          v95 = AMSLogKey();
          *(_DWORD *)buf = 138543618;
          uint64_t v105 = v94;
          __int16 v106 = 2114;
          v107 = v95;
          _os_log_impl(&dword_18D554000, v93, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We would normally make the account active, but canMakeAccountActive is set to false.", buf, 0x16u);
        }
      }
    }
    [(AMSAuthenticateTask *)self _updateAccountWithProvidedInformation:v22];
    id v70 = v22;

    goto LABEL_74;
  }
LABEL_27:
  BOOL v46 = +[AMSRestrictions allowActiveAccountModifications];
  uint64_t v47 = [(__objc2_class *)v6[17] sharedAccountsConfig];
  uint64_t v48 = (void *)v47;
  if (v46)
  {
    if (!v47)
    {
      uint64_t v48 = [(__objc2_class *)v6[17] sharedConfig];
    }
    v49 = [v48 OSLogObject];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v50 = objc_opt_class();
      id v51 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v105 = v50;
      __int16 v106 = 2114;
      v107 = v51;
      _os_log_impl(&dword_18D554000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to find an existing account. We'll create a new one instead.", buf, 0x16u);
    }
    v52 = (void *)MEMORY[0x1E4F179C8];
    id v53 = [(AMSAuthenticateTask *)self options];
    id v54 = [v53 clientInfo];
    v55 = [v54 accountMediaType];
    v18 = objc_msgSend(v52, "ams_accountTypeIdentifierForMediaType:", v55);

    BOOL v20 = objc_msgSend(v4, "_ams_accountTypeWithAccountTypeIdentifier:error:", v18, 0);
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v20];
    [v22 setActive:0];
    goto LABEL_33;
  }
  if (!v47)
  {
    uint64_t v48 = [(__objc2_class *)v6[17] sharedConfig];
  }
  uint64_t v67 = [v48 OSLogObject];
  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
  {
    uint64_t v68 = objc_opt_class();
    v69 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v105 = v68;
    __int16 v106 = 2114;
    v107 = v69;
    _os_log_impl(&dword_18D554000, v67, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find an existing account. Unable to proceed with the authentication because account modifications are not allowed.", buf, 0x16u);
  }
  if (a3)
  {
    AMSError(8, @"Account Modifications Disabled", @"Account modifications are disabled. Unable to sign into a new account.", 0);
    id v70 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v70 = 0;
  }
LABEL_74:

  return v70;
}

+ (id)_accountStoreForOptions:(id)a3
{
  id v3 = a3;
  id v4 = [v3 clientInfo];
  v5 = [v4 accountMediaType];
  id v6 = (void *)MEMORY[0x1E4F179C8];
  if (v5)
  {
    uint64_t v7 = [v3 clientInfo];
    id v8 = [v7 accountMediaType];
    uint64_t v9 = objc_msgSend(v6, "ams_sharedAccountStoreForMediaType:", v8);
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  }

  return v9;
}

- (id)_attemptCompanionAuthenticationForAccount:(id)a3
{
  id v3 = AMSError(5, @"Platform not supported", 0, 0);
  id v4 = +[AMSPromise promiseWithError:v3];

  return v4;
}

- (void)_attemptMultiUserTokenAuthenticationForAccount:(id)a3 completion:(id)a4
{
}

- (id)_attemptPasswordReuseAuthenticationForAccount:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  id v6 = [(AMSAuthenticateTask *)self options];
  if ([v6 authenticationType] == 2
    || (objc_msgSend(v4, "ams_password"), (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_10;
  }
  id v8 = (void *)v7;
  uint64_t v9 = [(AMSAuthenticateTask *)self options];
  uint64_t v10 = [v9 serviceIdentifier];

  if (v10)
  {
LABEL_10:
    v18 = AMSError(2, @"Password reuse not available for account", @"The account state does not support password reuse.", 0);
    [(AMSMutablePromise *)v5 finishWithError:v18];

    goto LABEL_11;
  }
  id v11 = +[AMSLogConfig sharedAccountsOversizeConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    id v14 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v13;
    __int16 v26 = 2114;
    objc_super v27 = v14;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to authenticate the account by reusing its password.", buf, 0x16u);
  }
  v15 = [(AMSAuthenticateTask *)self options];
  uint64_t v16 = [v15 credentialSource];

  uint64_t v17 = [(AMSAuthenticateTask *)self _performAuthenticationUsingAccount:v4 credentialSource:v16];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__AMSAuthenticateTask__attemptPasswordReuseAuthenticationForAccount___block_invoke;
  v20[3] = &unk_1E559EB80;
  uint64_t v21 = v5;
  id v22 = v4;
  v23 = self;
  [v17 resultWithCompletion:v20];

LABEL_11:
  return v5;
}

void __69__AMSAuthenticateTask__attemptPasswordReuseAuthenticationForAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithResult:a2];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "ams_setPassword:", 0);
    id v6 = +[AMSLogConfig sharedAccountsOversizeConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      uint64_t v10 = AMSLogableError(v5);
      int v13 = 138543874;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to authenticate the account by reusing its password. error = %{public}@", (uint8_t *)&v13, 0x20u);
    }
    if (v5)
    {
      id v11 = v5;
    }
    else
    {
      AMSError(2, @"Password reuse not available for account", @"Password reuse failed however verify credentials did not return an error", 0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    [*(id *)(a1 + 32) finishWithError:v11];
  }
}

- (id)_createAuthKitUpdateTaskForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [AMSAuthKitUpdateTask alloc];
  id v6 = [(AMSAuthenticateTask *)self options];
  uint64_t v7 = [(AMSAuthKitUpdateTask *)v5 initWithAccount:v4 options:v6];

  uint64_t v8 = +[AMSPromise promiseWithResult:v7];

  return v8;
}

+ (id)_createFallbackBag
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = AMSLogKey();
    uint64_t v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      uint64_t v2 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, v2];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    uint64_t v10 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v10;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Falling back to sub profile bag", buf, 0xCu);
    if (v6)
    {

      uint64_t v10 = (void *)v2;
    }
  }
  id v11 = [a1 createBagForSubProfile];
  return v11;
}

- (id)_finishWithVerifiedAccount:(id)a3 andAuthKitUpdateResult:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v10;
      __int16 v46 = 2114;
      uint64_t v47 = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully authenticated the account.", buf, 0x16u);
    }
    v12 = [(AMSAuthenticateTask *)self accountStore];
    int v13 = [(AMSAuthenticateTask *)self options];
    uint64_t v14 = [v13 clientInfo];
    uint64_t v15 = [v14 accountMediaType];

    uint64_t v16 = objc_msgSend(v12, "ams_activeiTunesAccountForMediaType:", v15);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __73__AMSAuthenticateTask__finishWithVerifiedAccount_andAuthKitUpdateResult___block_invoke;
    v39[3] = &unk_1E559EFB0;
    v39[4] = self;
    id v40 = v6;
    id v41 = v15;
    id v42 = v12;
    id v43 = v7;
    id v17 = v12;
    id v18 = v15;
    [v16 addFinishBlock:v39];

    uint64_t v19 = [(AMSAuthenticateTask *)self resultPromise];

    goto LABEL_25;
  }
  BOOL v20 = [(AMSAuthenticateTask *)self errors];
  unint64_t v21 = [v20 count];

  id v22 = [(AMSAuthenticateTask *)self errors];
  v23 = v22;
  if (v21 < 2)
  {
    uint64_t v26 = [v22 count];

    if (v26 != 1)
    {
      AMSError(100, @"Authentication Failed", @"The authentication failed with an unknown error.", 0);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v23 = [(AMSAuthenticateTask *)self errors];
    uint64_t v24 = [v23 objectAtIndexedSubscript:0];
    uint64_t v25 = AMSError(100, @"Authentication Failed", @"The authentication failed.", v24);
  }
  else
  {
    uint64_t v24 = (void *)[v22 copy];
    uint64_t v25 = AMSErrorWithMultipleUnderlyingErrors(100, @"Authentication Failed", @"The authentication failed.", v24);
  }
  id v18 = (id)v25;

LABEL_13:
  id v17 = [(AMSAuthenticateTask *)self _sanitizeError:v18];
  objc_super v27 = +[AMSLogConfig sharedAccountsConfig];
  if (!v27)
  {
    objc_super v27 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v28 = [v27 OSLogObject];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    id v29 = AMSLogKey();
    uint64_t v30 = NSString;
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = v31;
    if (v29)
    {
      uint64_t v38 = AMSLogKey();
      [v30 stringWithFormat:@"%@: [%@] ", v32, v38];
    }
    else
    {
      [v30 stringWithFormat:@"%@: ", v31];
    uint64_t v33 = };
    v34 = AMSLogableError(v17);
    *(_DWORD *)buf = 138543618;
    uint64_t v45 = (uint64_t)v33;
    __int16 v46 = 2114;
    uint64_t v47 = v34;
    _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@The authentication failed. error = %{public}@", buf, 0x16u);
    if (v29)
    {

      uint64_t v33 = (void *)v38;
    }
  }
  uint64_t v35 = [(AMSAuthenticateTask *)self resultPromise];
  [v35 finishWithError:v17];

  if ((objc_msgSend(v18, "ams_recursiveHasDomain:code:", @"AMSErrorDomain", 308) & 1) == 0)
  {
    v36 = [v7 account];
    [(AMSAuthenticateTask *)self _postFollowUpForFailedAuthenticationWithAccount:v36];
  }
  uint64_t v19 = [(AMSAuthenticateTask *)self resultPromise];
LABEL_25:

  return v19;
}

void __73__AMSAuthenticateTask__finishWithVerifiedAccount_andAuthKitUpdateResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = [*(id *)(a1 + 32) options];
  int v6 = [v5 canMakeAccountActive];
  if (v4 || !v6)
  {

LABEL_10:
    uint64_t v15 = [*(id *)(a1 + 32) options];
    if ([v15 canMakeAccountActive])
    {
      char v16 = [*(id *)(a1 + 40) isActive];

      if (v16)
      {
LABEL_28:
        uint64_t v28 = [[AMSAuthenticateResult alloc] initWithAccount:*(void *)(a1 + 40)];
        [(AMSAuthenticateResult *)v28 setAuthKitUpdateResult:*(void *)(a1 + 64)];
        id v29 = [*(id *)(a1 + 32) resultPromise];
        [v29 finishWithResult:v28];

        goto LABEL_29;
      }
      uint64_t v15 = +[AMSLogConfig sharedAccountsConfig];
      if (!v15)
      {
        uint64_t v15 = +[AMSLogConfig sharedConfig];
      }
      id v17 = [v15 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = AMSLogKey();
        uint64_t v19 = NSString;
        uint64_t v20 = objc_opt_class();
        uint64_t v21 = v20;
        if (v18)
        {
          uint64_t v2 = AMSLogKey();
          [v19 stringWithFormat:@"%@: [%@] ", v21, v2];
        }
        else
        {
          [v19 stringWithFormat:@"%@: ", v20];
        id v22 = };
        uint64_t v26 = AMSHashIfNeeded(*(void **)(a1 + 40));
        objc_super v27 = AMSHashIfNeeded(v4);
        *(_DWORD *)buf = 138543874;
        v34 = v22;
        __int16 v35 = 2114;
        v36 = v26;
        __int16 v37 = 2114;
        uint64_t v38 = v27;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@We tried to make the account active, but after authentication a different account is active. account = %{public}@ | activeAccount = %{public}@", buf, 0x20u);
        if (v18)
        {

          id v22 = (void *)v2;
        }
      }
    }

    goto LABEL_28;
  }
  char v7 = [*(id *)(a1 + 40) isActive];

  if (v7) {
    goto LABEL_10;
  }
  uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
  if (!v8)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = AMSLogKey();
    id v11 = NSString;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = v12;
    if (v10)
    {
      uint64_t v2 = AMSLogKey();
      [v11 stringWithFormat:@"%@: [%@] ", v13, v2];
    }
    else
    {
      [v11 stringWithFormat:@"%@: ", v12];
    uint64_t v14 = };
    v23 = AMSHashIfNeeded(*(void **)(a1 + 40));
    *(_DWORD *)buf = 138543618;
    v34 = v14;
    __int16 v35 = 2114;
    v36 = v23;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@We tried to make the account active, but after authentication it isn’t active. Making it active and saving it. account = %{public}@", buf, 0x16u);
    if (v10)
    {

      uint64_t v14 = (void *)v2;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "ams_setActive:forMediaType:", 1, *(void *)(a1 + 48));
  uint64_t v24 = objc_msgSend(*(id *)(a1 + 56), "ams_saveAccount:withOptions:", *(void *)(a1 + 40), 1);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __73__AMSAuthenticateTask__finishWithVerifiedAccount_andAuthKitUpdateResult___block_invoke_93;
  v30[3] = &unk_1E559E9E8;
  uint64_t v25 = *(void **)(a1 + 40);
  v30[4] = *(void *)(a1 + 32);
  id v31 = v25;
  id v32 = *(id *)(a1 + 64);
  [v24 addFinishBlock:v30];

LABEL_29:
}

void __73__AMSAuthenticateTask__finishWithVerifiedAccount_andAuthKitUpdateResult___block_invoke_93(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    int v6 = +[AMSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      int v6 = +[AMSLogConfig sharedConfig];
    }
    char v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = AMSLogKey();
      uint64_t v9 = NSString;
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = v10;
      if (v8)
      {
        uint64_t v3 = AMSLogKey();
        [v9 stringWithFormat:@"%@: [%@] ", v11, v3];
      }
      else
      {
        [v9 stringWithFormat:@"%@: ", v10];
      uint64_t v12 = };
      uint64_t v15 = AMSLogableError(v5);
      *(_DWORD *)buf = 138543618;
      id v18 = v12;
      __int16 v19 = 2114;
      uint64_t v20 = v15;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@There was a problem saving the verified active account. error: %{public}@", buf, 0x16u);
      if (v8)
      {

        uint64_t v12 = (void *)v3;
      }
    }
    char v16 = [*(id *)(a1 + 32) resultPromise];
    [v16 finishWithError:v5];
  }
  else
  {
    uint64_t v13 = [[AMSAuthenticateResult alloc] initWithAccount:*(void *)(a1 + 40)];
    [(AMSAuthenticateResult *)v13 setAuthKitUpdateResult:*(void *)(a1 + 48)];
    uint64_t v14 = [*(id *)(a1 + 32) resultPromise];
    [v14 finishWithResult:v13];
  }
}

- (void)_handleDialogFromError:(id)a3 completion:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (void (**)(id, id))a4;
  uint64_t v8 = [v6 userInfo];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"AMSAuthenticateErrorDialog"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  id v10 = v9;

  if (!v10)
  {
LABEL_9:
    v7[2](v7, v6);
    id v10 = 0;
    goto LABEL_38;
  }
  uint64_t v11 = +[AMSLogConfig sharedAccountsConfig];
  if (!v11)
  {
    uint64_t v11 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = AMSLogKey();
    uint64_t v14 = NSString;
    BOOL v44 = self;
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = v15;
    if (v13)
    {
      AMSLogKey();
      self = (AMSAuthenticateTask *)objc_claimAutoreleasedReturnValue();
      [v14 stringWithFormat:@"%@: [%@] ", v16, self];
    }
    else
    {
      [v14 stringWithFormat:@"%@: ", v15];
    id v17 = };
    *(_DWORD *)buf = 138543362;
    id v54 = v17;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@The authentication's error contained an encoded AMSDialogRequest. Decoding it.", buf, 0xCu);
    if (v13)
    {

      id v17 = self;
    }

    self = v44;
  }

  id v50 = 0;
  id v18 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v50];
  id v19 = v50;
  if (v18)
  {
    uint64_t v20 = [(AMSAuthenticateTask *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = +[AMSLogConfig sharedAccountsConfig];
      if (!v22)
      {
        id v22 = +[AMSLogConfig sharedConfig];
      }
      v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = AMSLogKey();
        uint64_t v25 = self;
        uint64_t v26 = (void *)v24;
        objc_super v27 = NSString;
        uint64_t v45 = v25;
        uint64_t v28 = objc_opt_class();
        uint64_t v29 = v28;
        if (v26)
        {
          uint64_t v43 = AMSLogKey();
          [v27 stringWithFormat:@"%@: [%@] ", v29, v43];
        }
        else
        {
          [v27 stringWithFormat:@"%@: ", v28];
        uint64_t v30 = };
        *(_DWORD *)buf = 138543362;
        id v54 = v30;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Sending dialog request to delegate.", buf, 0xCu);
        if (v26)
        {

          uint64_t v30 = (void *)v43;
        }

        self = v45;
      }

      id v41 = [(AMSAuthenticateTask *)self _runDialogRequest:v18];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __57__AMSAuthenticateTask__handleDialogFromError_completion___block_invoke;
      v49[3] = &unk_1E559EFD8;
      v49[4] = self;
      id v42 = [v41 thenWithBinaryPromiseBlock:v49];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __57__AMSAuthenticateTask__handleDialogFromError_completion___block_invoke_2;
      v46[3] = &unk_1E559F000;
      v46[4] = self;
      id v47 = v6;
      uint64_t v48 = v7;
      [v42 addFinishBlock:v46];
    }
    else
    {
      id v51 = @"AMSAuthenticateErrorDialog";
      v52 = v18;
      uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      uint64_t v39 = objc_msgSend(v6, "ams_errorByAddingUserInfo:", v38);
      v7[2](v7, v39);
    }
  }
  else
  {
    id v31 = +[AMSLogConfig sharedAccountsConfig];
    if (!v31)
    {
      id v31 = +[AMSLogConfig sharedConfig];
    }
    id v32 = [v31 OSLogObject];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = AMSLogKey();
      v34 = NSString;
      uint64_t v35 = objc_opt_class();
      uint64_t v36 = v35;
      if (v33)
      {
        AMSLogKey();
        BOOL v44 = (AMSAuthenticateTask *)objc_claimAutoreleasedReturnValue();
        [v34 stringWithFormat:@"%@: [%@] ", v36, v44];
      }
      else
      {
        [v34 stringWithFormat:@"%@: ", v35];
      __int16 v37 = };
      id v40 = AMSLogableError(v19);
      *(_DWORD *)buf = 138543618;
      id v54 = v37;
      __int16 v55 = 2114;
      uint64_t v56 = v40;
      _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode the AMSDialogRequest. error = %{public}@", buf, 0x16u);
      if (v33)
      {

        __int16 v37 = v44;
      }
    }
    v7[2](v7, v6);
  }

LABEL_38:
}

id __57__AMSAuthenticateTask__handleDialogFromError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [AMSHandleDialogResultTask alloc];
  id v5 = [*(id *)(a1 + 32) bag];
  id v6 = [(AMSHandleDialogResultTask *)v4 initWithResult:v3 bag:v5];

  char v7 = [(AMSHandleDialogResultTask *)v6 perform];

  return v7;
}

void __57__AMSAuthenticateTask__handleDialogFromError_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[AMSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    char v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = AMSLogKey();
      uint64_t v9 = NSString;
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = v10;
      if (v8)
      {
        uint64_t v3 = AMSLogKey();
        [v9 stringWithFormat:@"%@: [%@] ", v11, v3];
      }
      else
      {
        [v9 stringWithFormat:@"%@: ", v10];
      uint64_t v12 = };
      uint64_t v13 = AMSLogableError(v5);
      *(_DWORD *)buf = 138543618;
      objc_super v27 = v12;
      __int16 v28 = 2114;
      uint64_t v29 = v13;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to handle the dialog. error = %{public}@", buf, 0x16u);
      if (v8)
      {

        uint64_t v12 = (void *)v3;
      }
    }
  }
  uint64_t v14 = [*(id *)(a1 + 40) userInfo];
  uint64_t v15 = (void *)[v14 mutableCopy];
  uint64_t v16 = v15;
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v18 = v17;

  [v18 setObject:0 forKeyedSubscript:@"AMSAuthenticateErrorDialog"];
  uint64_t v19 = *(void *)(a1 + 48);
  uint64_t v20 = [*(id *)(a1 + 40) domain];
  uint64_t v21 = [*(id *)(a1 + 40) code];
  id v22 = objc_msgSend(*(id *)(a1 + 40), "ams_title");
  v23 = objc_msgSend(*(id *)(a1 + 40), "ams_message");
  uint64_t v24 = objc_msgSend(*(id *)(a1 + 40), "ams_underlyingError");
  uint64_t v25 = AMSCustomError(v20, v21, v22, v23, v18, v24);
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v25);
}

- (BOOL)_isMetricsEnabled
{
  uint64_t v3 = [(AMSAuthenticateTask *)self options];
  id v4 = [v3 metricsIdentifier];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(AMSAuthenticateTask *)self options];
    id v6 = [v5 metricsIdentifier];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_performAuthenticationAndGeneratePasswordWithAccount:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke;
  v6[3] = &unk_1E559EAB8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AMSAuthenticateTask *)self _attemptMultiUserTokenAuthenticationForAccount:v5 completion:v6];
}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) errors];
    objc_msgSend(v7, "ams_addNullableObject:", v6);
  }
  if (v5)
  {
    uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully authenticated the account.", buf, 0x16u);
    }
    id v12 = (id)[*(id *)(a1 + 32) _finishWithVerifiedAccount:v5 andAuthKitUpdateResult:0];
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 32) _attemptCompanionAuthenticationForAccount:*(void *)(a1 + 40)];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_107;
    v15[3] = &unk_1E559EAB8;
    uint64_t v14 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v14;
    [v13 resultWithCompletion:v15];
  }
}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_107(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _attemptPasswordReuseAuthenticationForAccount:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_108;
  v4[3] = &unk_1E559EAB8;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 resultWithCompletion:v4];
}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_108(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v10;
      __int16 v43 = 2114;
      BOOL v44 = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully authenticated the account.", buf, 0x16u);
    }
    id v12 = (id)[*(id *)(a1 + 32) _finishWithVerifiedAccount:v5 andAuthKitUpdateResult:0];
    goto LABEL_24;
  }
  if (objc_msgSend(v6, "ams_hasDomain:code:", @"AMSServerErrorDomain", 5001))
  {
    uint64_t v13 = [*(id *)(a1 + 32) errors];
    objc_msgSend(v13, "ams_addNullableObject:", v7);

LABEL_10:
    [*(id *)(a1 + 32) _processAuthKitUpdateResult:0 error:v7];
    goto LABEL_24;
  }
  char v14 = objc_msgSend(v7, "ams_hasDomain:code:", @"AMSServerErrorDomain", 5304);
  uint64_t v15 = [*(id *)(a1 + 32) errors];
  objc_msgSend(v15, "ams_addNullableObject:", v7);

  if (v14) {
    goto LABEL_10;
  }
  id v16 = +[AMSLogConfig sharedAccountsConfig];
  if (!v16)
  {
    id v16 = +[AMSLogConfig sharedConfig];
  }
  id v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_opt_class();
    __int16 v19 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v42 = v18;
    __int16 v43 = 2114;
    BOOL v44 = v19;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initial authentication results not present, generating a password for authentication.", buf, 0x16u);
  }
  uint64_t v20 = [*(id *)(a1 + 32) options];
  if ([v20 authenticationType] == 2)
  {
    uint64_t v21 = objc_msgSend(*(id *)(a1 + 40), "ams_rawPassword");

    if (v21)
    {
      id v22 = +[AMSLogConfig sharedAccountsConfig];
      if (!v22)
      {
        id v22 = +[AMSLogConfig sharedConfig];
      }
      v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v24;
        __int16 v43 = 2114;
        BOOL v44 = v25;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing the account's raw password to force an interactive authentication.", buf, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 40), "ams_setRawPassword:", 0);
    }
  }
  else
  {
  }
  uint64_t v26 = objc_alloc_init(AMSMutablePromise);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_109;
  v40[3] = &unk_1E559F028;
  v40[4] = *(void *)(a1 + 32);
  [(AMSPromise *)v26 addErrorBlock:v40];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_111;
  v39[3] = &unk_1E559F050;
  v39[4] = *(void *)(a1 + 32);
  [(AMSPromise *)v26 addSuccessBlock:v39];
  objc_super v27 = [*(id *)(a1 + 32) _createAuthKitUpdateTaskForAccount:*(void *)(a1 + 40)];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_113;
  v36[3] = &unk_1E559F078;
  __int16 v28 = *(void **)(a1 + 40);
  v36[4] = *(void *)(a1 + 32);
  id v37 = v28;
  uint64_t v29 = v26;
  uint64_t v38 = v29;
  [v27 addSuccessBlock:v36];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_2;
  v34[3] = &unk_1E559F028;
  uint64_t v35 = v29;
  uint64_t v30 = v29;
  [v27 addErrorBlock:v34];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_3;
  v32[3] = &unk_1E559F0A0;
  id v31 = *(void **)(a1 + 40);
  v32[4] = *(void *)(a1 + 32);
  id v33 = v31;
  [(AMSPromise *)v30 addFinishBlock:v32];

LABEL_24:
}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_109(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = +[AMSLogConfig sharedAccountsConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = AMSLogKey();
    uint64_t v8 = NSString;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = v9;
    if (v7)
    {
      uint64_t v2 = AMSLogKey();
      [v8 stringWithFormat:@"%@: [%@] ", v10, v2];
    }
    else
    {
      [v8 stringWithFormat:@"%@: ", v9];
    uint64_t v11 = };
    id v12 = AMSLogableError(v4);
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v11;
    __int16 v16 = 2114;
    id v17 = v12;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to generate a password. error = %{public}@", buf, 0x16u);
    if (v7)
    {

      uint64_t v11 = (void *)v2;
    }
  }
  uint64_t v13 = [*(id *)(a1 + 32) errors];
  [v13 addObject:v4];

  [*(id *)(a1 + 32) _processAuthKitUpdateResult:0 error:v4];
}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_111(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedAccountsConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully generated a password. Performing the authentication.", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) _processAuthKitUpdateResult:v3 error:0];
}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_113(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([*(id *)(a1 + 32) _isMetricsEnabled])
  {
    id v3 = [*(id *)(a1 + 32) metrics];
    id v4 = [AMSAuthenticateMetricsContext alloc];
    id v5 = [*(id *)(a1 + 32) options];
    uint64_t v6 = [(AMSAuthenticateMetricsContext *)v4 initWithOptions:v5 account:*(void *)(a1 + 40)];
    id v7 = (id)[v3 enqueueWithEvent:1 context:v6];
  }
  int v8 = *(void **)(a1 + 48);
  uint64_t v9 = [v10 performAuthKitUpdate];
  [v8 finishWithPromise:v9];
}

uint64_t __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __76__AMSAuthenticateTask__performAuthenticationAndGeneratePasswordWithAccount___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  if ([*(id *)(a1 + 32) _isMetricsEnabled])
  {
    id v4 = [AMSAuthenticateMetricsContext alloc];
    id v5 = [*(id *)(a1 + 32) options];
    uint64_t v6 = [(AMSAuthenticateMetricsContext *)v4 initWithOptions:v5 account:*(void *)(a1 + 40)];

    [(AMSAuthenticateMetricsContext *)v6 setError:v9];
    id v7 = [*(id *)(a1 + 32) metrics];
    id v8 = (id)[v7 enqueueWithEvent:2 context:v6];
  }
}

- (id)_performAuthenticationUsingAccount:(id)a3 credentialSource:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = objc_alloc_init(AMSMutablePromise);
  if (!a4)
  {
    id v9 = +[AMSLogConfig sharedAccountsConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = AMSLogKey();
      uint64_t v12 = NSString;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = v13;
      if (v11)
      {
        uint64_t v4 = AMSLogKey();
        [v12 stringWithFormat:@"%@: [%@] ", v14, v4];
      }
      else
      {
        [v12 stringWithFormat:@"%@: ", v13];
      uint64_t v15 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v15;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@The account’s credential source is unknown.", buf, 0xCu);
      if (v11)
      {

        uint64_t v15 = (void *)v4;
      }
    }
  }
  __int16 v16 = [(AMSAuthenticateTask *)self options];
  id v17 = (void *)[v16 copy];

  [v17 setCredentialSource:a4];
  uint64_t v18 = [v17 optionsDictionary];
  __int16 v19 = (void *)[v18 mutableCopy];

  [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F17A48]];
  uint64_t v20 = [(AMSAuthenticateTask *)self accountStore];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __75__AMSAuthenticateTask__performAuthenticationUsingAccount_credentialSource___block_invoke;
  v24[3] = &unk_1E559E550;
  unint64_t v27 = a4;
  uint64_t v21 = v8;
  uint64_t v25 = v21;
  uint64_t v26 = self;
  [v20 verifyCredentialsForAccount:v7 options:v19 completion:v24];

  id v22 = v21;
  return v22;
}

void __75__AMSAuthenticateTask__performAuthenticationUsingAccount_credentialSource___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "ams_setLastAuthenticationCredentialSource:", *(void *)(a1 + 48));
    [*(id *)(a1 + 32) finishWithResult:v6];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__AMSAuthenticateTask__performAuthenticationUsingAccount_credentialSource___block_invoke_2;
    v8[3] = &unk_1E559F028;
    id v7 = *(void **)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    [v7 _handleDialogFromError:a3 completion:v8];
  }
}

uint64_t __75__AMSAuthenticateTask__performAuthenticationUsingAccount_credentialSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (void)_performAuthenticationWithInitialResultsAndAccount:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [AMSAuthKitUpdateResult alloc];
  uint64_t v6 = [(AMSAuthenticateTask *)self initialAuthenticationResults];
  id v7 = [(AMSAuthenticateTask *)self options];
  id v8 = [(AMSAuthKitUpdateResult *)v5 initWithAccount:v4 authenticationResults:v6 options:v7];

  id v9 = +[AMSLogConfig sharedAccountsConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = AMSLogKey();
    int v13 = 138543618;
    uint64_t v14 = v11;
    __int16 v15 = 2114;
    __int16 v16 = v12;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing the authentication with initial authentication results.", (uint8_t *)&v13, 0x16u);
  }
  [(AMSAuthenticateTask *)self _processAuthKitUpdateResult:v8 error:0];
}

- (void)_postFollowUpForFailedAuthenticationWithAccount:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v6;
  }
}

- (void)_processAuthKitUpdateResult:(id)a3 error:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [v6 credentialSource];
    __int16 v9 = [(AMSAuthenticateTask *)self options];
    [v9 setCredentialSource:v8];

    id v10 = [(AMSAuthenticateTask *)self options];
    LODWORD(v9) = [v10 serviceTokenOnly];

    if (v9)
    {
      uint64_t v11 = +[AMSLogConfig sharedAccountsConfig];
      if (!v11)
      {
        uint64_t v11 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v13;
        __int16 v25 = 2114;
        uint64_t v26 = v14;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request only requires service token; skipping credential verification",
          buf,
          0x16u);
      }
      __int16 v15 = [v6 account];
      id v16 = [(AMSAuthenticateTask *)self _finishWithVerifiedAccount:v15 andAuthKitUpdateResult:v6];
    }
    else
    {
      uint64_t v18 = [v6 account];
      __int16 v19 = [(AMSAuthenticateTask *)self options];
      uint64_t v20 = -[AMSAuthenticateTask _performAuthenticationUsingAccount:credentialSource:](self, "_performAuthenticationUsingAccount:credentialSource:", v18, [v19 credentialSource]);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __57__AMSAuthenticateTask__processAuthKitUpdateResult_error___block_invoke;
      v21[3] = &unk_1E559EAB8;
      v21[4] = self;
      id v22 = v6;
      [v20 resultWithCompletion:v21];
    }
  }
  else
  {
    id v17 = [(AMSAuthenticateTask *)self _finishWithVerifiedAccount:0 andAuthKitUpdateResult:0];
  }
}

void __57__AMSAuthenticateTask__processAuthKitUpdateResult_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v10 = v5;
  if (!v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = a3;
    uint64_t v8 = [v6 errors];
    objc_msgSend(v8, "ams_addNullableObject:", v7);

    id v5 = 0;
  }
  id v9 = (id)[*(id *)(a1 + 32) _finishWithVerifiedAccount:v5 andAuthKitUpdateResult:*(void *)(a1 + 40)];
}

- (id)_runCreateAccountDialog
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = +[AMSLogConfig sharedAccountsConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = AMSLogKey();
    uint64_t v8 = NSString;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = v9;
    if (v7)
    {
      uint64_t v2 = AMSLogKey();
      [v8 stringWithFormat:@"%@: [%@] ", v10, v2];
    }
    else
    {
      [v8 stringWithFormat:@"%@: ", v9];
    uint64_t v11 = };
    *(_DWORD *)buf = 138543362;
    id v32 = v11;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Running create account dialog.", buf, 0xCu);
    if (v7)
    {

      uint64_t v11 = (void *)v2;
    }
  }
  uint64_t v12 = [(AMSAuthenticateTask *)self accountStore];
  uint64_t v13 = objc_msgSend(v12, "ams_activeiCloudAccount");
  if (v13)
  {
    uint64_t v14 = +[AMSLogConfig sharedAccountsConfig];
    if (!v14)
    {
      uint64_t v14 = +[AMSLogConfig sharedConfig];
    }
    __int16 v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = AMSLogKey();
      id v17 = NSString;
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = v18;
      if (v16)
      {
        AMSLogKey();
        self = (AMSAuthenticateTask *)objc_claimAutoreleasedReturnValue();
        [v17 stringWithFormat:@"%@: [%@] ", v19, self];
      }
      else
      {
        [v17 stringWithFormat:@"%@: ", v18];
      uint64_t v20 = };
      *(_DWORD *)buf = 138543362;
      id v32 = v20;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping dialog as the user is signed in to iCloud.", buf, 0xCu);
      if (v16)
      {

        uint64_t v20 = self;
      }
    }
    uint64_t v26 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    uint64_t v21 = [(AMSAuthenticateTask *)self bag];
    if (!v21)
    {
      uint64_t v21 = +[AMSPurchaseTask createBagForSubProfile];
    }
    id v22 = [(AMSAuthenticateTask *)self bag];
    v23 = [v22 URLForKey:@"signup"];

    uint64_t v24 = [v23 valuePromise];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __46__AMSAuthenticateTask__runCreateAccountDialog__block_invoke;
    v28[3] = &unk_1E559F0F0;
    v28[4] = self;
    id v29 = v21;
    SEL v30 = a2;
    id v25 = v21;
    uint64_t v26 = [v24 continueWithBlock:v28];
  }
  return v26;
}

id __46__AMSAuthenticateTask__runCreateAccountDialog__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (objc_msgSend(v6, "ams_hasDomain:code:", @"AMSErrorDomain", 204))
  {
    id v7 = +[AMSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = AMSLogKey();
      uint64_t v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        a1 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, a1];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      uint64_t v13 = };
      id v17 = AMSHashIfNeeded(@"signup");
      *(_DWORD *)buf = 138543618;
      SEL v30 = v13;
      __int16 v31 = 2114;
      id v32 = v17;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping dialog as the bag is missing a value for %{public}@", buf, 0x16u);
      if (v9)
      {

        uint64_t v13 = (void *)a1;
      }
    }
    uint64_t v14 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
    goto LABEL_16;
  }
  if (v6)
  {
    uint64_t v14 = +[AMSPromise promiseWithError:v6];
LABEL_16:
    id v16 = (void *)v14;
    goto LABEL_17;
  }
  if (v5)
  {
    __int16 v15 = [*(id *)(a1 + 32) _runCreateAccountDialogWithBag:*(void *)(a1 + 40)];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __46__AMSAuthenticateTask__runCreateAccountDialog__block_invoke_118;
    v26[3] = &unk_1E559F0C8;
    v26[4] = *(void *)(a1 + 32);
    id v27 = v5;
    id v28 = *(id *)(a1 + 40);
    id v16 = [v15 thenWithBlock:v26];
  }
  else
  {
    uint64_t v19 = +[AMSLogConfig sharedAccountsConfig];
    if (!v19)
    {
      uint64_t v19 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = AMSLogKey();
      id v22 = NSString;
      uint64_t v23 = objc_opt_class();
      if (v21)
      {
        uint64_t v24 = AMSLogKey();
        a1 = NSStringFromSelector(*(SEL *)(a1 + 48));
        [v22 stringWithFormat:@"%@: [%@] %@ ", v23, v24, a1];
      }
      else
      {
        uint64_t v24 = NSStringFromSelector(*(SEL *)(a1 + 48));
        [v22 stringWithFormat:@"%@: %@ ", v23, v24];
      id v25 = };
      *(_DWORD *)buf = 138543362;
      SEL v30 = v25;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@The bag load promise finished with neither a result nor a failure.", buf, 0xCu);
      if (v21)
      {

        id v25 = (void *)a1;
      }
    }
    __int16 v15 = AMSError(0, 0, 0, 0);
    id v16 = +[AMSPromise promiseWithError:v15];
  }

LABEL_17:
  return v16;
}

id __46__AMSAuthenticateTask__runCreateAccountDialog__block_invoke_118(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 selectedActionIdentifier];
  int v5 = [v4 isEqualToString:@"create"];

  if (v5)
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v8;
      __int16 v30 = 2114;
      __int16 v31 = v9;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Create account selected", buf, 0x16u);
    }
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [*(id *)(a1 + 32) options];
    uint64_t v12 = [v11 clientInfo];
    uint64_t v13 = [v10 loadCreateAppleIDWithClientInfo:v12 url:*(void *)(a1 + 40) bag:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v14 = [v3 selectedActionIdentifier];
    int v15 = [v14 isEqualToString:@"signin"];

    if (v15)
    {
      id v16 = +[AMSLogConfig sharedConfig];
      if (!v16)
      {
        id v16 = +[AMSLogConfig sharedConfig];
      }
      id v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v18;
        __int16 v30 = 2114;
        __int16 v31 = v19;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Authenticate existing account selected", buf, 0x16u);
      }
      uint64_t v13 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
    }
    else
    {
      uint64_t v20 = [v3 selectedActionIdentifier];
      uint64_t v26 = AMSErrorWithFormat(6, @"Purchase Account Prompt Failed", @"User cancelled by selecting: %@", v21, v22, v23, v24, v25, (uint64_t)v20);
      uint64_t v13 = +[AMSPromise promiseWithError:v26];
    }
  }

  return v13;
}

+ (id)loadCreateAppleIDWithClientInfo:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = +[AMSPurchaseTask createBagForSubProfile];
  }
  uint64_t v8 = [v7 URLForKey:@"signup"];
  uint64_t v9 = [v8 valuePromise];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__AMSAuthenticateTask_loadCreateAppleIDWithClientInfo_bag___block_invoke;
  v14[3] = &unk_1E559F118;
  id v16 = v7;
  id v17 = a1;
  id v15 = v6;
  id v10 = v7;
  id v11 = v6;
  uint64_t v12 = [v9 thenWithBlock:v14];

  return v12;
}

uint64_t __59__AMSAuthenticateTask_loadCreateAppleIDWithClientInfo_bag___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 48) loadCreateAppleIDWithClientInfo:*(void *)(a1 + 32) url:a2 bag:*(void *)(a1 + 40)];
}

+ (id)loadCreateAppleIDWithClientInfo:(id)a3 url:(id)a4 bag:(id)a5
{
  int v5 = +[AMSOpenURL openURL:a4 clientInfo:a3 bag:a5];
  id v6 = objc_alloc_init(AMSMutablePromise);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__AMSAuthenticateTask_loadCreateAppleIDWithClientInfo_url_bag___block_invoke;
  v14[3] = &unk_1E559F028;
  id v7 = v6;
  id v15 = v7;
  [v5 addErrorBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__AMSAuthenticateTask_loadCreateAppleIDWithClientInfo_url_bag___block_invoke_2;
  v12[3] = &unk_1E559EA90;
  uint64_t v8 = v7;
  uint64_t v13 = v8;
  [v5 addSuccessBlock:v12];
  uint64_t v9 = v13;
  id v10 = v8;

  return v10;
}

uint64_t __63__AMSAuthenticateTask_loadCreateAppleIDWithClientInfo_url_bag___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __63__AMSAuthenticateTask_loadCreateAppleIDWithClientInfo_url_bag___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  AMSError(6, @"Authenticate Cancelled", @"Create account was selected", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithError:v2];
}

- (id)_runCreateAccountDialogWithBag:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [AMSDialogRequest alloc];
  id v6 = AMSLocalizedString(@"PURCHASE_SIGNIN", v4);
  id v7 = [(AMSDialogRequest *)v5 initWithTitle:v6 message:0];

  uint64_t v8 = AMSLogKey();
  [(AMSDialogRequest *)v7 setLogKey:v8];

  uint64_t v9 = AMSLocalizedString(@"PURCHASE_EXISTING_APPLE_ACCOUNT", v4);
  id v10 = +[AMSDialogAction actionWithTitle:v9 identifier:@"signin"];

  id v11 = AMSLocalizedString(@"PURCHASE_CREATE_APPLE_ACCOUNT", v4);
  uint64_t v12 = +[AMSDialogAction actionWithTitle:v11 identifier:@"create"];

  uint64_t v13 = AMSLocalizedString(@"CANCEL", v4);

  uint64_t v14 = +[AMSDialogAction actionWithTitle:v13 style:2];

  [v10 setAccessibilityIdentifier:@"PURCHASE_EXISTING_APPLE_ACCOUNT"];
  [v12 setAccessibilityIdentifier:@"PURCHASE_CREATE_APPLE_ACCOUNT"];
  [v14 setAccessibilityIdentifier:@"CANCEL"];
  v18[0] = v10;
  v18[1] = v12;
  v18[2] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  [(AMSDialogRequest *)v7 setButtonActions:v15];

  id v16 = [(AMSAuthenticateTask *)self _runDialogRequest:v7];

  return v16;
}

- (id)_runDialogRequest:(id)a3
{
  id v4 = a3;
  int v5 = objc_alloc_init(AMSMutablePromise);
  id v6 = [(AMSAuthenticateTask *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(AMSAuthenticateTask *)self delegate];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__AMSAuthenticateTask__runDialogRequest___block_invoke;
    v11[3] = &unk_1E559F140;
    uint64_t v12 = v5;
    [v8 authenticateTask:self handleDialogRequest:v4 completion:v11];
  }
  else
  {
    uint64_t v9 = AMSError(11, @"Dialog Delegate Not Found", @"Unable to present dialog due to missing delegate", 0);
    [(AMSMutablePromise *)v5 finishWithError:v9];
  }
  return v5;
}

uint64_t __41__AMSAuthenticateTask__runDialogRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (id)_sanitizeError:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "ams_recursiveHasDomain:code:", *MEMORY[0x1E4F4ED70], -7003))
  {
    AMSError(6, @"Authentication Failed", @"User cancelled", v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }
  int v5 = v4;

  return v5;
}

- (void)_updateAccountWithProvidedInformation:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_msgSend(v4, "ams_altDSID");
  if (![v5 length])
  {
    id v6 = [(AMSAuthenticateTask *)self altDSID];
    uint64_t v7 = [v6 length];

    if (!v7) {
      goto LABEL_9;
    }
    uint64_t v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      int v47 = 138543618;
      uint64_t v48 = v10;
      __int16 v49 = 2114;
      id v50 = v11;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The caller provided an altDSID, and the account didn't have one.", (uint8_t *)&v47, 0x16u);
    }
    int v5 = [(AMSAuthenticateTask *)self altDSID];
    objc_msgSend(v4, "ams_setAltDSID:", v5);
  }

LABEL_9:
  uint64_t v12 = objc_msgSend(v4, "ams_DSID");
  if (v12)
  {
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v39 = [(AMSAuthenticateTask *)self DSID];
  if (v39)
  {
    id v40 = (void *)v39;
    id v41 = [(AMSAuthenticateTask *)self DSID];
    char v42 = [v41 isEqualToNumber:&unk_1EDD00D30];

    if ((v42 & 1) == 0)
    {
      __int16 v43 = +[AMSLogConfig sharedAccountsConfig];
      if (!v43)
      {
        __int16 v43 = +[AMSLogConfig sharedConfig];
      }
      BOOL v44 = [v43 OSLogObject];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = objc_opt_class();
        __int16 v46 = AMSLogKey();
        int v47 = 138543618;
        uint64_t v48 = v45;
        __int16 v49 = 2114;
        id v50 = v46;
        _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The caller provided a DSID, and the account didn't have one.", (uint8_t *)&v47, 0x16u);
      }
      uint64_t v12 = [(AMSAuthenticateTask *)self DSID];
      objc_msgSend(v4, "ams_setDSID:", v12);
      goto LABEL_10;
    }
  }
LABEL_11:
  uint64_t v13 = [(AMSAuthenticateTask *)self username];
  if ([v13 length])
  {
    uint64_t v14 = [v4 username];
    id v15 = [(AMSAuthenticateTask *)self username];
    char v16 = [v14 isEqualToString:v15];

    if (v16) {
      goto LABEL_19;
    }
    id v17 = +[AMSLogConfig sharedAccountsConfig];
    if (!v17)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = AMSLogKey();
      uint64_t v21 = [v4 username];
      uint64_t v22 = AMSHashIfNeeded(v21);
      uint64_t v23 = [(AMSAuthenticateTask *)self username];
      uint64_t v24 = AMSHashIfNeeded(v23);
      int v47 = 138544130;
      uint64_t v48 = v19;
      __int16 v49 = 2114;
      id v50 = v20;
      __int16 v51 = 2114;
      v52 = v22;
      __int16 v53 = 2114;
      id v54 = v24;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The caller provided an updated username. oldUsername = %{public}@ | newUsername = %{public}@", (uint8_t *)&v47, 0x2Au);
    }
    uint64_t v13 = [(AMSAuthenticateTask *)self username];
    [v4 setUsername:v13];
  }

LABEL_19:
  uint64_t v25 = [(AMSAuthenticateTask *)self options];
  int v26 = [v25 isDemoAccountSetup];

  if (v26) {
    objc_msgSend(v4, "ams_setDemoAccount:", 1);
  }
  id v27 = [(AMSAuthenticateTask *)self password];

  if (v27)
  {
    id v28 = +[AMSLogConfig sharedAccountsConfig];
    if (!v28)
    {
      id v28 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v29 = [v28 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = objc_opt_class();
      __int16 v31 = AMSLogKey();
      int v47 = 138543618;
      uint64_t v48 = v30;
      __int16 v49 = 2114;
      id v50 = v31;
      _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We have a password (PET) we can use.", (uint8_t *)&v47, 0x16u);
    }
    uint64_t v32 = [(AMSAuthenticateTask *)self password];
    objc_msgSend(v4, "ams_setPassword:", v32);
  }
  uint64_t v33 = [(AMSAuthenticateTask *)self rawPassword];

  if (v33)
  {
    v34 = +[AMSLogConfig sharedAccountsConfig];
    if (!v34)
    {
      v34 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v35 = [v34 OSLogObject];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = objc_opt_class();
      id v37 = AMSLogKey();
      int v47 = 138543618;
      uint64_t v48 = v36;
      __int16 v49 = 2114;
      id v50 = v37;
      _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We have a raw password we can use.", (uint8_t *)&v47, 0x16u);
    }
    uint64_t v38 = [(AMSAuthenticateTask *)self rawPassword];
    objc_msgSend(v4, "ams_setRawPassword:", v38);
  }
  [(AMSAuthenticateTask *)self _updateAccountPasswordUsingSecondaryAccounts:v4];
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

- (id)homeID
{
  id v2 = [(AMSAuthenticateTask *)self homeIdentifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)setHomeID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithUUIDString:v5];

  [(AMSAuthenticateTask *)self setHomeIdentifier:v6];
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (AMSAuthenticateTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AMSAuthenticateTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMSAuthenticateOptions)options
{
  return self->_options;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)multiUserToken
{
  return self->_multiUserToken;
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)setHomeIdentifier:(id)a3
{
}

- (NSUUID)homeUserIdentifier
{
  return self->_homeUserIdentifier;
}

- (void)setHomeUserIdentifier:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSDictionary)initialAuthenticationResults
{
  return self->_initialAuthenticationResults;
}

- (AMSMutablePromise)resultPromise
{
  return self->_resultPromise;
}

- (void)setResultPromise:(id)a3
{
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (BOOL)isLocalAccountProvided
{
  return self->_isLocalAccountProvided;
}

- (void)setIsLocalAccountProvided:(BOOL)a3
{
  self->_isLocalAccountProvided = a3;
}

- (BOOL)isServerRequested
{
  return self->_isServerRequested;
}

- (void)setIsServerRequested:(BOOL)a3
{
  self->_isServerRequested = a3;
}

- (AMSAuthenticateMetricsProtocol)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_resultPromise, 0);
  objc_storeStrong((id *)&self->_initialAuthenticationResults, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_homeUserIdentifier, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_multiUserToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end