@interface AMSUIParentalVerificationIDCardTask
+ (id)_descriptorForMinimumAge:(int64_t)a3;
+ (id)_identityController;
+ (id)_identityRequestWithDescriptor:(id)a3 nonce:(id)a4;
+ (id)_nonceFromString:(id)a3;
+ (id)_requestDictFromMinimumAge:(int64_t)a3 walletData:(id)a4 nonce:(id)a5;
+ (int64_t)_minAgeFromObject:(id)a3;
- (ACAccount)account;
- (ACAccount)originalAccount;
- (AMSBagProtocol)bag;
- (AMSUIParentalVerificationIDCardTask)initWithAccount:(id)a3 accountParameters:(id)a4 bag:(id)a5 displayName:(id)a6 metrics:(id)a7 viewController:(id)a8;
- (AMSUIPaymentVerificationMetrics)metrics;
- (NSDictionary)accountParameters;
- (NSString)displayName;
- (UIViewController)viewController;
- (id)_dataFromIDCardForMinimumAge:(int64_t)a3 nonce:(id)a4;
- (id)_promiseToFetchIDCardTokenURL:(id)a3 requestBody:(id)a4;
- (id)_promiseToLoadPVTURLWithBody:(id)a3;
- (id)_promiseToRequestIDCardData;
- (id)performTask;
- (void)setAccount:(id)a3;
- (void)setAccountParameters:(id)a3;
- (void)setBag:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setOriginalAccount:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation AMSUIParentalVerificationIDCardTask

- (AMSUIParentalVerificationIDCardTask)initWithAccount:(id)a3 accountParameters:(id)a4 bag:(id)a5 displayName:(id)a6 metrics:(id)a7 viewController:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AMSUIParentalVerificationIDCardTask;
  v18 = [(AMSTask *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_originalAccount, a3);
    objc_storeStrong((id *)&v19->_accountParameters, a4);
    objc_storeStrong((id *)&v19->_bag, a5);
    objc_storeStrong((id *)&v19->_displayName, a6);
    objc_storeStrong((id *)&v19->_metrics, a7);
    objc_storeStrong((id *)&v19->_viewController, a8);
  }

  return v19;
}

- (id)performTask
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v3)
  {
    v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    v6 = AMSLogKey();
    int v19 = 138543618;
    uint64_t v20 = v5;
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running AMSUIParentalVerificationIDCardTask", (uint8_t *)&v19, 0x16u);
  }
  v7 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x263F277D8]);
  v8 = [(AMSUIParentalVerificationIDCardTask *)self originalAccount];
  v9 = [(AMSUIParentalVerificationIDCardTask *)self accountParameters];
  v10 = +[AMSUIPaymentVerificationProtocolHandler _accountToUseFromGivenAccount:v8 accountParameters:v9 accountStore:v7];

  if (v10)
  {
    [(AMSUIParentalVerificationIDCardTask *)self setAccount:v10];
    v11 = [(AMSUIParentalVerificationIDCardTask *)self _promiseToRequestIDCardData];
  }
  else
  {
    v12 = AMSCustomError();
    v13 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v13)
    {
      v13 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      id v16 = AMSLogKey();
      int v19 = 138543874;
      uint64_t v20 = v15;
      __int16 v21 = 2114;
      id v22 = v16;
      __int16 v23 = 2114;
      objc_super v24 = v12;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", (uint8_t *)&v19, 0x20u);
    }
    v11 = [MEMORY[0x263F27E10] promiseWithError:v12];
    id v17 = [(AMSUIParentalVerificationIDCardTask *)self metrics];
    [v17 setDisplayReason:@"Missing account"];
  }
  return v11;
}

- (id)_promiseToRequestIDCardData
{
  v3 = [(AMSUIParentalVerificationIDCardTask *)self account];
  v4 = objc_msgSend(v3, "ams_altDSID");

  uint64_t v5 = [(AMSUIParentalVerificationIDCardTask *)self accountParameters];
  v6 = +[AMSUIParentalVerificationCore _minimumAgeFrom:v5];

  if (v6)
  {
    v7 = -[AMSUIParentalVerificationIDCardTask _dataFromIDCardForMinimumAge:nonce:](self, "_dataFromIDCardForMinimumAge:nonce:", [v6 integerValue], v4);
  }
  else
  {
    v8 = [(AMSUIParentalVerificationIDCardTask *)self bag];
    v9 = [v8 dictionaryForKey:@"parental-verification"];

    v10 = [v9 valuePromise];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__AMSUIParentalVerificationIDCardTask__promiseToRequestIDCardData__block_invoke;
    v12[3] = &unk_2643E41C8;
    v12[4] = self;
    id v13 = v4;
    v7 = [v10 thenWithBlock:v12];
  }
  return v7;
}

uint64_t __66__AMSUIParentalVerificationIDCardTask__promiseToRequestIDCardData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _minAgeFromObject:v3];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  return [v5 _dataFromIDCardForMinimumAge:v4 nonce:v6];
}

- (id)_dataFromIDCardForMinimumAge:(int64_t)a3 nonce:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F27D90]);
  v8 = [(id)objc_opt_class() _descriptorForMinimumAge:a3];
  v9 = [(id)objc_opt_class() _identityController];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__AMSUIParentalVerificationIDCardTask__dataFromIDCardForMinimumAge_nonce___block_invoke;
  v17[3] = &unk_2643E42C8;
  v17[4] = self;
  id v18 = v8;
  id v19 = v6;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  int64_t v22 = a3;
  id v11 = v9;
  id v12 = v6;
  id v13 = v8;
  [v11 checkCanRequestDocument:v13 completion:v17];
  v14 = v21;
  id v15 = v10;

  return v15;
}

void __74__AMSUIParentalVerificationIDCardTask__dataFromIDCardForMinimumAge_nonce___block_invoke(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = [(id)objc_opt_class() _identityRequestWithDescriptor:*(void *)(a1 + 40) nonce:*(void *)(a1 + 48)];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__AMSUIParentalVerificationIDCardTask__dataFromIDCardForMinimumAge_nonce___block_invoke_2;
    v10[3] = &unk_2643E42A0;
    v10[4] = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 56);
    id v6 = *(id *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 72);
    id v11 = v6;
    uint64_t v13 = v7;
    id v12 = *(id *)(a1 + 48);
    [v5 requestDocument:v4 completion:v10];
  }
  else
  {
    v8 = [v3 metrics];
    [v8 setDisplayReason:@"No suitable ID card"];

    AMSError();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 64) finishWithError:v9];
  }
}

void __74__AMSUIParentalVerificationIDCardTask__dataFromIDCardForMinimumAge_nonce___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 encryptedData];

  if (v7)
  {
    v8 = [v5 encryptedData];
    id v9 = [(id)objc_opt_class() _requestDictFromMinimumAge:*(void *)(a1 + 56) walletData:v8 nonce:*(void *)(a1 + 48)];
    id v10 = *(void **)(a1 + 40);
    id v11 = [*(id *)(a1 + 32) _promiseToLoadPVTURLWithBody:v9];
    [v10 finishWithPromise:v11];
  }
  else
  {
    uint64_t v12 = [v6 code];
    uint64_t v13 = [*(id *)(a1 + 32) metrics];
    v14 = v13;
    if (v12 == 2)
    {
      [v13 setDisplayReason:@"User closed wallet UI"];

      id v15 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v15)
      {
        id v15 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = objc_opt_class();
        id v18 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v34 = v17;
        __int16 v35 = 2114;
        v36 = v18;
        __int16 v37 = 2114;
        id v38 = v6;
        _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ID Card UI was cancelled by user: %{public}@", buf, 0x20u);
      }
      id v19 = *(void **)(a1 + 40);
      v31 = @"really_cancelled";
      uint64_t v32 = MEMORY[0x263EFFA88];
      id v20 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id v21 = AMSCustomError();
      [v19 finishWithError:v21];
    }
    else
    {
      [v13 setDisplayReason:@"ID Card document request failed"];

      int64_t v22 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v22)
      {
        int64_t v22 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      __int16 v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v34 = v24;
        __int16 v35 = 2114;
        v36 = v25;
        __int16 v37 = 2114;
        id v38 = v6;
        _os_log_impl(&dword_21C134000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Request document from wallet failed: %{public}@", buf, 0x20u);
      }
      v26 = *(void **)(a1 + 40);
      v27 = [*(id *)(a1 + 32) bag];
      v28 = [*(id *)(a1 + 32) viewController];
      v29 = [*(id *)(a1 + 32) metrics];
      v30 = +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:v27 viewController:v28 metrics:v29 pageID:@"ContinueNoIDCard" flowName:@"Wallet ID card"];
      [v26 finishWithPromise:v30];
    }
  }
}

+ (id)_descriptorForMinimumAge:(int64_t)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init((Class)getPKIdentityDriversLicenseDescriptorClass[0]());
  id v5 = [MEMORY[0x263F5BEC0] ageThresholdElementWithAge:a3];
  v9[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  uint64_t v7 = [MEMORY[0x263F5BEC8] willNotStoreIntent];
  [v4 addElements:v6 withIntentToStore:v7];

  return v4;
}

+ (id)_identityController
{
  id v2 = objc_alloc_init((Class)getPKIdentityAuthorizationControllerClass[0]());
  return v2;
}

+ (id)_identityRequestWithDescriptor:(id)a3 nonce:(id)a4
{
  id v6 = (Class (__cdecl *)())getPKIdentityRequestClass[0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6());
  [v9 setDescriptor:v8];

  id v10 = [a1 _nonceFromString:v7];

  [v9 setNonce:v10];
  [v9 setMerchantIdentifier:@"com.apple.ams-identity-verification"];
  return v9;
}

+ (id)_nonceFromString:(id)a3
{
  return (id)[a3 dataUsingEncoding:4];
}

- (id)_promiseToLoadPVTURLWithBody:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIParentalVerificationIDCardTask *)self metrics];
  [v5 enqueueEventWithPageId:@"ParentalVerificationIDCard" displayReason:0];

  id v6 = [(AMSUIParentalVerificationIDCardTask *)self bag];
  id v7 = [v6 URLForKey:@"verifyAgeMeadPvt"];

  id v8 = [v7 valuePromise];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__AMSUIParentalVerificationIDCardTask__promiseToLoadPVTURLWithBody___block_invoke;
  v12[3] = &unk_2643E41C8;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  id v10 = [v8 thenWithBlock:v12];

  return v10;
}

uint64_t __68__AMSUIParentalVerificationIDCardTask__promiseToLoadPVTURLWithBody___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _promiseToFetchIDCardTokenURL:a2 requestBody:*(void *)(a1 + 40)];
}

- (id)_promiseToFetchIDCardTokenURL:(id)a3 requestBody:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMSUIParentalVerificationIDCardTask *)self account];
  id v9 = [(AMSUIParentalVerificationIDCardTask *)self accountParameters];
  id v10 = [(AMSUIParentalVerificationIDCardTask *)self bag];
  id v11 = +[AMSUIPaymentVerificationProtocolHandler _promiseToFetchURLResponseForAccount:v8 accountParameters:v9 url:v7 bag:v10 requestBody:v6 bodyEncoding:3 contentType:0];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__AMSUIParentalVerificationIDCardTask__promiseToFetchIDCardTokenURL_requestBody___block_invoke;
  v14[3] = &unk_2643E41F0;
  v14[4] = self;
  uint64_t v12 = [v11 continueWithBlock:v14];

  return v12;
}

id __81__AMSUIParentalVerificationIDCardTask__promiseToFetchIDCardTokenURL_requestBody___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) metrics];
    [v7 setDisplayReason:@"ID card data fetch failed"];

    id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = AMSLogKey();
      int v28 = 138543874;
      uint64_t v29 = v10;
      __int16 v30 = 2114;
      v31 = v11;
      __int16 v32 = 2114;
      id v33 = v6;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch PVT for ID Card failed: %{public}@", (uint8_t *)&v28, 0x20u);
    }
    uint64_t v12 = [*(id *)(a1 + 32) bag];
    id v13 = [*(id *)(a1 + 32) viewController];
    v14 = [*(id *)(a1 + 32) metrics];
    id v15 = +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:v12 viewController:v13 metrics:v14 pageID:@"ContinueNoIDCard" flowName:@"Wallet ID card"];
LABEL_7:

    goto LABEL_10;
  }
  id v16 = [v5 object];
  uint64_t v12 = +[AMSUIParentalVerificationCore _tokenFromObject:v16];

  id v13 = +[AMSUIParentalVerificationCore _tokenResultFromTokenString:v12];
  if (!v13)
  {
    id v20 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v20)
    {
      id v20 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      __int16 v23 = AMSLogKey();
      uint64_t v24 = [v5 object];
      int v28 = 138543874;
      uint64_t v29 = v22;
      __int16 v30 = 2114;
      v31 = v23;
      __int16 v32 = 2114;
      id v33 = v24;
      _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch PVT for ID Card response had no token: %{public}@", (uint8_t *)&v28, 0x20u);
    }
    uint64_t v25 = [*(id *)(a1 + 32) metrics];
    [v25 setDisplayReason:@"ID card data failed"];

    v14 = [*(id *)(a1 + 32) bag];
    v26 = [*(id *)(a1 + 32) viewController];
    v27 = [*(id *)(a1 + 32) metrics];
    id v15 = +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:v14 viewController:v26 metrics:v27 pageID:@"ContinueNoIDCard" flowName:@"Wallet ID card"];

    goto LABEL_7;
  }
  uint64_t v17 = [*(id *)(a1 + 32) metrics];
  [v17 enqueueEventWithPageId:@"ParentVerified" displayReason:@"IDCard"];

  id v18 = [*(id *)(a1 + 32) metrics];
  [v18 flushEvents];

  id v15 = [MEMORY[0x263F27E10] promiseWithResult:v13];
LABEL_10:

  return v15;
}

+ (id)_requestDictFromMinimumAge:(int64_t)a3 walletData:(id)a4 nonce:(id)a5
{
  v16[3] = *MEMORY[0x263EF8340];
  id v7 = (__CFString *)a5;
  id v8 = [a4 base64EncodedStringWithOptions:1];
  v15[0] = @"ageThreshold";
  uint64_t v9 = [NSNumber numberWithInteger:a3];
  uint64_t v10 = (void *)v9;
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = &stru_26CC491D8;
  }
  v16[0] = v9;
  v16[1] = v11;
  v15[1] = @"digitalId";
  v15[2] = @"nonce";
  if (v7) {
    uint64_t v12 = v7;
  }
  else {
    uint64_t v12 = &stru_26CC491D8;
  }
  v16[2] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  return v13;
}

+ (int64_t)_minAgeFromObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    id v5 = [v4 objectForKeyedSubscript:@"min-age"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6) {
      int64_t v7 = [v6 integerValue];
    }
    else {
      int64_t v7 = 18;
    }
  }
  else
  {
    int64_t v7 = 18;
  }

  return v7;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSDictionary)accountParameters
{
  return self->_accountParameters;
}

- (void)setAccountParameters:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (AMSUIPaymentVerificationMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (ACAccount)originalAccount
{
  return self->_originalAccount;
}

- (void)setOriginalAccount:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_originalAccount, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_accountParameters, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end