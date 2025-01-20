@interface AMSUIPaymentVerificationTokenFetchTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_contextCombining:(id)a3 with:(id)a4 accountParameters:(id)a5 account:(id)a6;
+ (id)_promiseToTryNextFlowWithResult:(id)a3 error:(id)a4 continuationBlock:(id)a5;
+ (id)_tokenFromDictionary:(id)a3;
+ (id)createBagForSubProfile;
+ (id)performRemoteDisabledFeatureWithBag:(id)a3 featureKey:(id)a4 featureBlock:(id)a5;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSProcessInfo)clientInfo;
- (AMSPromise)resultPromise;
- (AMSUIPaymentVerificationMetrics)metrics;
- (AMSUIPaymentVerificationTokenFetchTask)initWithMode:(unint64_t)a3 account:(id)a4 viewController:(id)a5 bag:(id)a6 displayName:(id)a7;
- (AMSUIPaymentVerificationTokenFetchTask)initWithMode:(unint64_t)a3 accountParameters:(id)a4 viewController:(id)a5 bag:(id)a6 displayName:(id)a7;
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (NSDictionary)accountParameters;
- (NSDictionary)userInfo;
- (NSString)displayName;
- (UIViewController)viewController;
- (WrappedAMSUIWebViewController)webVC;
- (id)performApplePayTaskWithFeatureFlag:(BOOL)a3;
- (id)performCardOnFileTaskWithFeatureFlag:(BOOL)a3;
- (id)performIDCardTaskWithFeatureFlag:(BOOL)a3;
- (id)performTask;
- (id)performWebFlowTask;
- (unint64_t)mode;
- (void)_finishPromiseWithResult:(id)a3 error:(id)a4;
- (void)setClientInfo:(id)a3;
- (void)setHeader:(id)a3 withValueIn:(id)a4 forKey:(id)a5 onRequest:(id)a6;
- (void)setMetrics:(id)a3;
- (void)setResultPromise:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setWebVC:(id)a3;
- (void)webViewController:(id)a3 didEncodeNetworkRequest:(id)a4;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
@end

@implementation AMSUIPaymentVerificationTokenFetchTask

- (AMSUIPaymentVerificationTokenFetchTask)initWithMode:(unint64_t)a3 account:(id)a4 viewController:(id)a5 bag:(id)a6 displayName:(id)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AMSUIPaymentVerificationTokenFetchTask;
  v16 = [(AMSTask *)&v23 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_account, a4);
    objc_storeStrong((id *)&v17->_bag, a6);
    objc_storeStrong((id *)&v17->_displayName, a7);
    objc_storeStrong((id *)&v17->_viewController, a5);
    v18 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
    if (!v18)
    {
      v18 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v20;
      __int16 v26 = 2114;
      v27 = v21;
      _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating task with ACAccount", buf, 0x16u);
    }
  }

  return v17;
}

- (AMSUIPaymentVerificationTokenFetchTask)initWithMode:(unint64_t)a3 accountParameters:(id)a4 viewController:(id)a5 bag:(id)a6 displayName:(id)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AMSUIPaymentVerificationTokenFetchTask;
  v16 = [(AMSTask *)&v23 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_accountParameters, a4);
    objc_storeStrong((id *)&v17->_bag, a6);
    objc_storeStrong((id *)&v17->_displayName, a7);
    objc_storeStrong((id *)&v17->_viewController, a5);
    v18 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
    if (!v18)
    {
      v18 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v20;
      __int16 v26 = 2114;
      v27 = v21;
      _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating task with accountParameters", buf, 0x16u);
    }
  }

  return v17;
}

- (id)performTask
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v3)
  {
    v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSSetLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v5;
    __int16 v35 = 2114;
    v36 = v6;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting task", buf, 0x16u);
  }
  v7 = [AMSUIPaymentVerificationMetrics alloc];
  v8 = [(AMSUIPaymentVerificationTokenFetchTask *)self bag];
  v9 = [MEMORY[0x263F27E08] currentProcess];
  v10 = [v9 bundleIdentifier];
  v11 = [(AMSUIPaymentVerificationMetrics *)v7 initWithBag:v8 appID:v10];
  [(AMSUIPaymentVerificationTokenFetchTask *)self setMetrics:v11];

  id v12 = [(AMSUIPaymentVerificationTokenFetchTask *)self metrics];
  [v12 enqueueEventWithPageId:@"ParentVerifyRequest" displayReason:0];

  id v13 = [(AMSUIPaymentVerificationTokenFetchTask *)self viewController];
  LODWORD(v12) = v13 == 0;

  if (v12)
  {
    id v14 = AMSError();
    uint64_t v20 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v20)
    {
      uint64_t v20 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      objc_super v23 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v34 = v22;
      __int16 v35 = 2114;
      v36 = v23;
      __int16 v37 = 2114;
      v38 = v14;
      _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
    }
    v19 = [MEMORY[0x263F27E10] promiseWithError:v14];
  }
  else
  {
    id v14 = [(AMSUIPaymentVerificationTokenFetchTask *)self performIDCardTaskWithFeatureFlag:1];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke;
    v32[3] = &unk_2643E3708;
    v32[4] = self;
    id v15 = [v14 continueWithBlock:v32];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_3;
    v31[3] = &unk_2643E3708;
    v31[4] = self;
    v16 = [v15 continueWithBlock:v31];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_5;
    v30[3] = &unk_2643E3708;
    v30[4] = self;
    v17 = [v16 continueWithBlock:v30];
    [(AMSUIPaymentVerificationTokenFetchTask *)self setResultPromise:v17];
    objc_initWeak((id *)buf, self);
    v18 = [(AMSUIPaymentVerificationTokenFetchTask *)self resultPromise];
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_7;
    uint64_t v28 = &unk_2643E3B68;
    objc_copyWeak(&v29, (id *)buf);
    [v18 addErrorBlock:&v25];

    v19 = [(AMSUIPaymentVerificationTokenFetchTask *)self resultPromise];
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
  return v19;
}

id __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = objc_opt_class();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_2;
  v10[3] = &unk_2643E3258;
  v10[4] = *(void *)(a1 + 32);
  v8 = [v7 _promiseToTryNextFlowWithResult:v6 error:v5 continuationBlock:v10];

  return v8;
}

uint64_t __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = _os_feature_enabled_impl();
  return [v1 performApplePayTaskWithFeatureFlag:v2];
}

id __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = objc_opt_class();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_4;
  v10[3] = &unk_2643E3258;
  v10[4] = *(void *)(a1 + 32);
  v8 = [v7 _promiseToTryNextFlowWithResult:v6 error:v5 continuationBlock:v10];

  return v8;
}

uint64_t __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) performCardOnFileTaskWithFeatureFlag:1];
}

id __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = objc_opt_class();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_6;
  v10[3] = &unk_2643E3258;
  v10[4] = *(void *)(a1 + 32);
  v8 = [v7 _promiseToTryNextFlowWithResult:v6 error:v5 continuationBlock:v10];

  return v8;
}

uint64_t __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) performWebFlowTask];
}

void __53__AMSUIPaymentVerificationTokenFetchTask_performTask__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained metrics];
  [v1 enqueueEventWithPageId:@"ParentalVerificationFailed" displayReason:0];

  uint64_t v2 = [WeakRetained metrics];
  [v2 flushEvents];
}

+ (id)_promiseToTryNextFlowWithResult:(id)a3 error:(id)a4 continuationBlock:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v8 = (void (**)(void))a5;
  if (a3)
  {
    uint64_t v9 = [MEMORY[0x263F27E10] promiseWithResult:a3];
    goto LABEL_18;
  }
  v10 = [v7 domain];
  v11 = v10;
  if (v10 != (void *)*MEMORY[0x263F27850])
  {

LABEL_12:
    uint64_t v20 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
    if (!v20)
    {
      uint64_t v20 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class();
      objc_super v23 = AMSLogKey();
      int v27 = 138543874;
      uint64_t v28 = v22;
      __int16 v29 = 2114;
      v30 = v23;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Moving to next flow due to: %{public}@", (uint8_t *)&v27, 0x20u);
    }
LABEL_17:
    uint64_t v9 = v8[2](v8);
    goto LABEL_18;
  }
  uint64_t v12 = [v7 code];

  if (v12 != 6) {
    goto LABEL_12;
  }
  id v13 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v13)
  {
    id v13 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_opt_class();
    v16 = AMSLogKey();
    int v27 = 138543874;
    uint64_t v28 = v15;
    __int16 v29 = 2114;
    v30 = v16;
    __int16 v31 = 2114;
    id v32 = v7;
    _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User cancelled previous flow: %{public}@", (uint8_t *)&v27, 0x20u);
  }
  v17 = [v7 userInfo];
  v18 = [v17 objectForKeyedSubscript:@"really_cancelled"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  int v26 = [v19 BOOLValue];
  if (!v26) {
    goto LABEL_17;
  }
  uint64_t v9 = [MEMORY[0x263F27E10] promiseWithError:v7];
LABEL_18:
  v24 = (void *)v9;

  return v24;
}

+ (id)performRemoteDisabledFeatureWithBag:(id)a3 featureKey:(id)a4 featureBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 BOOLForKey:v7];
  v10 = [v9 valuePromise];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __102__AMSUIPaymentVerificationTokenFetchTask_performRemoteDisabledFeatureWithBag_featureKey_featureBlock___block_invoke;
  v15[3] = &unk_2643E4518;
  id v16 = v7;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = [v10 continueWithBlock:v15];

  return v13;
}

id __102__AMSUIPaymentVerificationTokenFetchTask_performRemoteDisabledFeatureWithBag_featureKey_featureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if ([v4 BOOLValue])
  {
    id v5 = [NSString stringWithFormat:@"Feature %@ disabled in bag", *(void *)(a1 + 32)];
    id v6 = (void *)MEMORY[0x263F27E10];
    id v7 = AMSError();
    id v8 = [v6 promiseWithError:v7];
  }
  else
  {
    id v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v8;
}

- (id)performIDCardTaskWithFeatureFlag:(BOOL)a3
{
  if (a3)
  {
    id v4 = objc_opt_class();
    id v5 = [(AMSUIPaymentVerificationTokenFetchTask *)self bag];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75__AMSUIPaymentVerificationTokenFetchTask_performIDCardTaskWithFeatureFlag___block_invoke;
    v10[3] = &unk_2643E3258;
    v10[4] = self;
    id v6 = [v4 performRemoteDisabledFeatureWithBag:v5 featureKey:@"pvk_mead_disabled" featureBlock:v10];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F27E10];
    id v8 = AMSError();
    id v6 = [v7 promiseWithError:v8];
  }
  return v6;
}

id __75__AMSUIPaymentVerificationTokenFetchTask_performIDCardTaskWithFeatureFlag___block_invoke(uint64_t a1)
{
  uint64_t v2 = [AMSUIParentalVerificationIDCardTask alloc];
  id v3 = [*(id *)(a1 + 32) account];
  id v4 = [*(id *)(a1 + 32) accountParameters];
  id v5 = [*(id *)(a1 + 32) bag];
  id v6 = [*(id *)(a1 + 32) displayName];
  id v7 = [*(id *)(a1 + 32) metrics];
  id v8 = [*(id *)(a1 + 32) viewController];
  uint64_t v9 = [(AMSUIParentalVerificationIDCardTask *)v2 initWithAccount:v3 accountParameters:v4 bag:v5 displayName:v6 metrics:v7 viewController:v8];

  v10 = [(AMSUIParentalVerificationIDCardTask *)v9 performTask];

  return v10;
}

- (id)performApplePayTaskWithFeatureFlag:(BOOL)a3
{
  if (a3)
  {
    id v4 = objc_opt_class();
    id v5 = [(AMSUIPaymentVerificationTokenFetchTask *)self bag];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __77__AMSUIPaymentVerificationTokenFetchTask_performApplePayTaskWithFeatureFlag___block_invoke;
    v10[3] = &unk_2643E3258;
    v10[4] = self;
    id v6 = [v4 performRemoteDisabledFeatureWithBag:v5 featureKey:@"pvk_apc_disabled" featureBlock:v10];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F27E10];
    id v8 = AMSError();
    id v6 = [v7 promiseWithError:v8];
  }
  return v6;
}

id __77__AMSUIPaymentVerificationTokenFetchTask_performApplePayTaskWithFeatureFlag___block_invoke(uint64_t a1)
{
  uint64_t v2 = [AMSUIParentalVerificationApplePayTask alloc];
  id v3 = [*(id *)(a1 + 32) account];
  id v4 = [*(id *)(a1 + 32) accountParameters];
  id v5 = [*(id *)(a1 + 32) bag];
  id v6 = [*(id *)(a1 + 32) displayName];
  id v7 = [*(id *)(a1 + 32) metrics];
  id v8 = [*(id *)(a1 + 32) viewController];
  uint64_t v9 = [(AMSUIParentalVerificationApplePayTask *)v2 initWithAccount:v3 accountParameters:v4 bag:v5 displayName:v6 metrics:v7 viewController:v8];

  v10 = [(AMSUIParentalVerificationApplePayTask *)v9 performTask];

  return v10;
}

- (id)performCardOnFileTaskWithFeatureFlag:(BOOL)a3
{
  if (a3)
  {
    id v4 = [AMSUICardOnFilePVTFetchTask alloc];
    id v5 = [(AMSUIPaymentVerificationTokenFetchTask *)self account];
    id v6 = [(AMSUIPaymentVerificationTokenFetchTask *)self accountParameters];
    id v7 = [(AMSUIPaymentVerificationTokenFetchTask *)self bag];
    id v8 = [(AMSUIPaymentVerificationTokenFetchTask *)self displayName];
    uint64_t v9 = [(AMSUIPaymentVerificationTokenFetchTask *)self metrics];
    v10 = [(AMSUIPaymentVerificationTokenFetchTask *)self viewController];
    id v11 = [(AMSUICardOnFilePVTFetchTask *)v4 initWithAccount:v5 accountParameters:v6 bag:v7 displayName:v8 metrics:v9 viewController:v10];

    [(AMSUICardOnFilePVTFetchTask *)v11 performTask];
  }
  else
  {
    AMSError();
    id v11 = (AMSUICardOnFilePVTFetchTask *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x263F27E10] promiseWithError:v11];
  id v12 = };

  return v12;
}

- (id)performWebFlowTask
{
  id v3 = objc_alloc_init(MEMORY[0x263F27E10]);
  id v4 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x263F277D8]);
  id v5 = [(AMSUIPaymentVerificationTokenFetchTask *)self account];
  id v6 = [(AMSUIPaymentVerificationTokenFetchTask *)self accountParameters];
  id v7 = +[AMSUIPaymentVerificationProtocolHandler _accountToUseFromGivenAccount:v5 accountParameters:v6 accountStore:v4];

  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x263EFB1F8]);
    uint64_t v9 = [v4 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFB000]];
    id v7 = (void *)[v8 initWithAccountType:v9];

    v10 = [(AMSUIPaymentVerificationTokenFetchTask *)self accountParameters];
    id v11 = [v10 objectForKeyedSubscript:@"accountNameApprover"];
    [v7 setUsername:v11];

    id v12 = [(AMSUIPaymentVerificationTokenFetchTask *)self accountParameters];
    id v13 = [v12 objectForKeyedSubscript:@"altDsId"];
    objc_msgSend(v7, "ams_setAltDSID:", v13);

    id v14 = objc_msgSend(v4, "ams_localiTunesAccount");
    uint64_t v15 = objc_msgSend(v14, "ams_storefront");
    objc_msgSend(v7, "ams_setStorefront:", v15);
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke;
  v18[3] = &unk_2643E34D0;
  v18[4] = self;
  id v19 = v7;
  id v16 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v18);

  return v3;
}

void __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke(uint64_t a1)
{
  uint64_t v2 = [WrappedAMSUIWebViewController alloc];
  id v3 = [*(id *)(a1 + 32) bag];
  id v4 = [(AMSUIWebViewController *)v2 initWithBag:v3 account:*(void *)(a1 + 40) clientInfo:0];
  [*(id *)(a1 + 32) setWebVC:v4];

  id v5 = *(void **)(a1 + 32);
  id v6 = [v5 webVC];
  [v6 setDelegate:v5];

  id v7 = [*(id *)(a1 + 32) metrics];
  id v8 = [v7 displayReason];
  uint64_t v9 = [*(id *)(a1 + 32) userInfo];
  v10 = [*(id *)(a1 + 32) accountParameters];
  id v11 = +[AMSUIPaymentVerificationTokenFetchTask _contextCombining:v8 with:v9 accountParameters:v10 account:*(void *)(a1 + 40)];
  id v12 = [*(id *)(a1 + 32) webVC];
  [v12 setClientOptions:v11];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__2;
  v20[4] = __Block_byref_object_dispose__2;
  id v21 = *(id *)(a1 + 32);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke_63;
  v19[3] = &unk_2643E33D8;
  v19[4] = v20;
  id v13 = [*(id *)(a1 + 32) webVC];
  [v13 setDismissBlock:v19];

  id v14 = [*(id *)(a1 + 32) bag];
  uint64_t v15 = [v14 URLForKey:@"verifyPaymentCommerceURL"];

  id v16 = [*(id *)(a1 + 32) webVC];
  id v17 = (id)[v16 loadBagValue:v15];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke_2;
  v18[3] = &unk_2643E3118;
  v18[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v18);

  _Block_object_dispose(v20, 8);
}

void __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke_63(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = AMSError();
  [v2 _finishPromiseWithResult:0 error:v3];

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __60__AMSUIPaymentVerificationTokenFetchTask_performWebFlowTask__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F829B8]);
  id v3 = [*(id *)(a1 + 32) webVC];
  id v5 = (id)[v2 initWithRootViewController:v3];

  [v5 setModalPresentationStyle:2];
  uint64_t v4 = [*(id *)(a1 + 32) viewController];
  [v4 presentViewController:v5 animated:1 completion:0];
}

+ (id)_contextCombining:(id)a3 with:(id)a4 accountParameters:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x263EFF9A0] dictionary];
  id v14 = (void *)MEMORY[0x263F086E0];
  uint64_t v15 = [MEMORY[0x263F27E08] currentProcess];
  id v16 = [v15 bundleIdentifier];
  id v17 = [v14 bundleWithIdentifier:v16];

  v18 = [v17 icon];
  id v19 = v18;
  if (v18)
  {
    uint64_t v20 = UIImagePNGRepresentation(v18);
    id v21 = v20;
    if (v20)
    {
      uint64_t v22 = [v20 base64EncodedStringWithOptions:1];
      objc_super v23 = [NSString stringWithFormat:@"data:image/png;base64,%@", v22];
      [v13 setObject:v23 forKeyedSubscript:@"appIcon"];
    }
  }
  if (v9) {
    [v13 setObject:v9 forKeyedSubscript:@"displayReason"];
  }
  if (v10) {
    [v13 setObject:v10 forKeyedSubscript:@"userInfo"];
  }
  if (v11)
  {
    v24 = +[AMSUIParentalVerificationCore _allowedAccountParameters:v11];
    [v13 setObject:v24 forKeyedSubscript:@"accountParameters"];
  }
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F27B60], "isAvailableForAccount:", v12));
  [v13 setObject:v25 forKeyedSubscript:@"biometricsIsEnabled"];

  int v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x263F27B60], "type"));
  [v13 setObject:v26 forKeyedSubscript:@"biometricsType"];

  return v13;
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v9)
  {
    id v9 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    id v12 = AMSLogKey();
    int v21 = 138543874;
    uint64_t v22 = v11;
    __int16 v23 = 2114;
    v24 = v12;
    __int16 v25 = 2114;
    id v26 = v7;
    _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Web flow finished by returning: %{public}@", (uint8_t *)&v21, 0x20u);
  }
  id v13 = [(id)objc_opt_class() _tokenFromDictionary:v7];
  if (v13)
  {
    id v14 = 0;
  }
  else
  {
    id v14 = AMSError();
  }
  uint64_t v15 = [(AMSUIPaymentVerificationTokenFetchTask *)self metrics];
  [v15 enqueueEventWithPageId:@"ParentVerified" displayReason:@"WebFlow"];

  id v16 = [(AMSUIPaymentVerificationTokenFetchTask *)self metrics];
  [v16 flushEvents];

  [(AMSUIPaymentVerificationTokenFetchTask *)self _finishPromiseWithResult:v13 error:v14];
  if (v14)
  {
    id v17 = v8;
    uint64_t v18 = 0;
    id v19 = v14;
  }
  else
  {
    uint64_t v18 = MEMORY[0x263EFFA88];
    id v17 = v8;
    id v19 = 0;
  }
  (*((void (**)(id, uint64_t, void *))v8 + 2))(v17, v18, v19);

  return 0;
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 options];
  id v12 = (void *)[v11 copy];

  [v12 setEphemeral:1];
  [v12 setServiceIdentifier:@"com.apple.gs.ams.pvkit"];
  id v13 = [AMSUIAuthKitUpdateTask alloc];
  id v14 = [v9 account];
  uint64_t v15 = [(AMSUIPaymentVerificationTokenFetchTask *)self webVC];
  id v16 = [(AMSUIAuthKitUpdateTask *)v13 initWithAccount:v14 presentingViewController:v15 options:v12];

  objc_initWeak(&location, self);
  id v17 = [(AMSAuthKitUpdateTask *)v16 performAuthKitUpdate];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __97__AMSUIPaymentVerificationTokenFetchTask_webViewController_handleAuthenticateRequest_completion___block_invoke;
  v19[3] = &unk_2643E4540;
  objc_copyWeak(&v21, &location);
  id v18 = v10;
  id v20 = v18;
  [v17 addFinishBlock:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __97__AMSUIPaymentVerificationTokenFetchTask_webViewController_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [v5 authenticationResults];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F28FB0]];

  id v10 = [v9 objectForKeyedSubscript:@"com.apple.gs.ams.pvkit"];
  uint64_t v11 = [MEMORY[0x263F27CB8] sharedConfig];
  id v12 = (id)v11;
  if (v10)
  {
    if (!v11)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      int v23 = 138543618;
      uint64_t v24 = v14;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] We've received an updated GS token", (uint8_t *)&v23, 0x16u);
    }
    id v16 = (void *)[WeakRetained[7] mutableCopy];
    [v16 setObject:v10 forKeyedSubscript:@"gsToken"];
    id v12 = WeakRetained[7];
    WeakRetained[7] = v16;
  }
  else
  {
    if (!v11)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v17 = [v12 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      id v19 = AMSLogKey();
      int v23 = 138543618;
      uint64_t v24 = v18;
      __int16 v25 = 2114;
      id v26 = v19;
      _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to locate GS Token in auth result", (uint8_t *)&v23, 0x16u);
    }
  }

  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v20 = objc_alloc(MEMORY[0x263F27B10]);
    id v21 = [v5 account];
    uint64_t v22 = (void *)[v20 initWithAccount:v21];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)webViewController:(id)a3 didEncodeNetworkRequest:(id)a4
{
  id v12 = a4;
  id v5 = [(AMSUIPaymentVerificationTokenFetchTask *)self accountParameters];

  if (v5)
  {
    uint64_t v6 = *MEMORY[0x263F27890];
    id v7 = [(AMSUIPaymentVerificationTokenFetchTask *)self accountParameters];
    [(AMSUIPaymentVerificationTokenFetchTask *)self setHeader:v6 withValueIn:v7 forKey:@"gsToken" onRequest:v12];

    uint64_t v8 = *MEMORY[0x263F278A0];
    id v9 = [(AMSUIPaymentVerificationTokenFetchTask *)self accountParameters];
    [(AMSUIPaymentVerificationTokenFetchTask *)self setHeader:v8 withValueIn:v9 forKey:@"mmeClientInfo" onRequest:v12];

    uint64_t v10 = *MEMORY[0x263F278A8];
    uint64_t v11 = [(AMSUIPaymentVerificationTokenFetchTask *)self accountParameters];
    [(AMSUIPaymentVerificationTokenFetchTask *)self setHeader:v10 withValueIn:v11 forKey:@"deviceId" onRequest:v12];

    [v12 setValue:@"1" forHTTPHeaderField:@"X-Apple-Payment-Verification"];
  }
}

- (void)setHeader:(id)a3 withValueIn:(id)a4 forKey:(id)a5 onRequest:(id)a6
{
  id v11 = a3;
  id v9 = a6;
  uint64_t v10 = [a4 objectForKeyedSubscript:a5];
  if (v10) {
    [v9 setValue:v10 forHTTPHeaderField:v11];
  }
}

+ (id)_tokenFromDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"actionName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6 && [v6 isEqualToString:@"providePVT"])
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:@"options"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      if (v9)
      {
        uint64_t v10 = [v9 objectForKeyedSubscript:@"status"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v11 = v10;
        }
        else {
          id v11 = 0;
        }

        if (v11 && ![v11 integerValue])
        {
          id v12 = [v9 objectForKeyedSubscript:@"pvt"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v13 = v12;
          }
          else {
            id v13 = 0;
          }

          if (v13)
          {
            uint64_t v14 = [v13 dataUsingEncoding:4];
            id v7 = [[AMSPaymentVerificationTokenResult alloc] initWithTokenData:v14];
          }
          else
          {
            id v7 = 0;
          }
        }
        else
        {
          id v7 = 0;
        }
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init(MEMORY[0x263F27D80]);
  [v2 addBagKey:@"verifyPaymentApplePayAurumOnStackBoolean" valueType:5 defaultValue:@"https://buy.itunes.apple.com/account/verifyPayment/applePay/aurumOnStackBoolean"];
  [v2 addBagKey:@"verifyPaymentApplePayAurumOnStackPVT" valueType:5 defaultValue:@"https://buy.itunes.apple.com/account/verifyPayment/applePay/aurumOnStackPVT"];
  [v2 addBagKey:@"verifyPaymentApplePayCardOnDevice" valueType:5 defaultValue:@"https://buy.itunes.apple.com/account/verifyPayment/applePay/cardOnDevice"];
  [v2 addBagKey:@"verifyPaymentCommerceURL" valueType:5 defaultValue:@"https://apps.mzstatic.com/content/54a1317a0ad442d3965d64ef6bfaae1c/verify-billing"];
  id v3 = [MEMORY[0x263F27ED8] bagKeySet];
  [v2 unionBagKeySet:v3];

  return (AMSBagKeySet *)v2;
}

+ (NSString)bagSubProfile
{
  if (bagSubProfile_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&bagSubProfile_ams_once_token___COUNTER__, &__block_literal_global_14);
  }
  id v2 = (void *)bagSubProfile_ams_once_object___COUNTER__;
  return (NSString *)v2;
}

void __55__AMSUIPaymentVerificationTokenFetchTask_bagSubProfile__block_invoke()
{
  v0 = (void *)bagSubProfile_ams_once_object___COUNTER__;
  bagSubProfile_ams_once_object___COUNTER__ = @"AMSUIPaymentVerification";
}

+ (NSString)bagSubProfileVersion
{
  if (bagSubProfileVersion_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&bagSubProfileVersion_ams_once_token___COUNTER__, &__block_literal_global_138);
  }
  id v2 = (void *)bagSubProfileVersion_ams_once_object___COUNTER__;
  return (NSString *)v2;
}

void __62__AMSUIPaymentVerificationTokenFetchTask_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)bagSubProfileVersion_ams_once_object___COUNTER__;
  bagSubProfileVersion_ams_once_object___COUNTER__ = @"1";
}

+ (id)createBagForSubProfile
{
  id v2 = (void *)MEMORY[0x263F27B40];
  id v3 = [(id)objc_opt_class() bagKeySet];
  uint64_t v4 = [(id)objc_opt_class() bagSubProfile];
  id v5 = [(id)objc_opt_class() bagSubProfileVersion];
  [v2 registerBagKeySet:v3 forProfile:v4 profileVersion:v5];

  id v6 = (void *)MEMORY[0x263F27B28];
  id v7 = [(id)objc_opt_class() bagSubProfile];
  uint64_t v8 = [(id)objc_opt_class() bagSubProfileVersion];
  id v9 = [v6 bagForProfile:v7 profileVersion:v8];

  return v9;
}

- (void)_finishPromiseWithResult:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    id v7 = [(AMSUIPaymentVerificationTokenFetchTask *)self resultPromise];
    [v7 finishWithResult:v10];
  }
  else
  {
    uint64_t v8 = [(AMSUIPaymentVerificationTokenFetchTask *)self resultPromise];
    id v7 = v8;
    if (v6)
    {
      [v8 finishWithError:v6];
    }
    else
    {
      id v9 = AMSError();
      [v7 finishWithError:v9];
    }
  }

  [(AMSUIPaymentVerificationTokenFetchTask *)self setResultPromise:0];
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)accountParameters
{
  return self->_accountParameters;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (AMSUIPaymentVerificationMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (AMSPromise)resultPromise
{
  return self->_resultPromise;
}

- (void)setResultPromise:(id)a3
{
}

- (WrappedAMSUIWebViewController)webVC
{
  return self->_webVC;
}

- (void)setWebVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webVC, 0);
  objc_storeStrong((id *)&self->_resultPromise, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_accountParameters, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end