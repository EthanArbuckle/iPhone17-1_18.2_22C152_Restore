@interface AMSUICardOnFilePVTFetchTask
+ (id)_accountToUseFromGivenAccount:(id)a3 accountParameters:(id)a4 activeiTunesAccount:(id)a5;
- (ACAccount)account;
- (ACAccount)originalAccount;
- (AMSBagProtocol)bag;
- (AMSUICardOnFilePVTFetchTask)initWithAccount:(id)a3 accountParameters:(id)a4 bag:(id)a5 displayName:(id)a6 metrics:(id)a7 viewController:(id)a8;
- (AMSUIPaymentVerificationMetrics)metrics;
- (NSDictionary)accountParameters;
- (NSString)displayName;
- (UIViewController)viewController;
- (id)_promiseToFetchCardOnStackBooleanURL:(id)a3;
- (id)_promiseToFetchCardOnStackTokenURL:(id)a3;
- (id)_promiseToLoadBooleanURL;
- (id)_promiseToLoadPVTURL;
- (id)_promiseToPromptAfterCancel;
- (id)_promiseToPromptBeforeBiometricAuth;
- (id)performTask;
- (void)setAccount:(id)a3;
- (void)setAccountParameters:(id)a3;
- (void)setBag:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setOriginalAccount:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation AMSUICardOnFilePVTFetchTask

- (AMSUICardOnFilePVTFetchTask)initWithAccount:(id)a3 accountParameters:(id)a4 bag:(id)a5 displayName:(id)a6 metrics:(id)a7 viewController:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AMSUICardOnFilePVTFetchTask;
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
  v37[1] = *MEMORY[0x263EF8340];
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
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v5;
    __int16 v32 = 2114;
    v33 = v6;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running AMSUICardOnFilePVTFetchTask", buf, 0x16u);
  }
  v7 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x263F277D8]);
  v8 = objc_opt_class();
  v9 = [(AMSUICardOnFilePVTFetchTask *)self originalAccount];
  v10 = [(AMSUICardOnFilePVTFetchTask *)self accountParameters];
  v11 = objc_msgSend(v7, "ams_activeiTunesAccount");
  v12 = [v8 _accountToUseFromGivenAccount:v9 accountParameters:v10 activeiTunesAccount:v11];

  v36 = @"AMSUICardOnFilePVTPreconditionsNotMet";
  v37[0] = MEMORY[0x263EFFA88];
  v13 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
  if (v12)
  {
    if ([MEMORY[0x263F27B60] isAvailableForAccount:v12])
    {
      v14 = [(AMSUICardOnFilePVTFetchTask *)self _promiseToLoadBooleanURL];
      [(AMSUICardOnFilePVTFetchTask *)self setAccount:v12];
      goto LABEL_19;
    }
    id v15 = AMSCustomError();
    id v23 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v23)
    {
      id v23 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    objc_super v24 = [v23 OSLogObject];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_opt_class();
      v26 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v25;
      __int16 v32 = 2114;
      v33 = v26;
      __int16 v34 = 2114;
      v35 = v15;
      _os_log_impl(&dword_21C134000, v24, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
    }
    v14 = [MEMORY[0x263F27E10] promiseWithError:v15];
    v20 = [(AMSUICardOnFilePVTFetchTask *)self metrics];
    id v21 = v20;
    id v22 = @"Biometrics for iTunes & App Store not enabled";
  }
  else
  {
    id v15 = AMSCustomError();
    id v16 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v16)
    {
      id v16 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      v19 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v18;
      __int16 v32 = 2114;
      v33 = v19;
      __int16 v34 = 2114;
      v35 = v15;
      _os_log_impl(&dword_21C134000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
    }
    v14 = [MEMORY[0x263F27E10] promiseWithError:v15];
    v20 = [(AMSUICardOnFilePVTFetchTask *)self metrics];
    id v21 = v20;
    id v22 = @"Active iTunes account mismatch";
  }
  [v20 setDisplayReason:v22];

LABEL_19:
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __42__AMSUICardOnFilePVTFetchTask_performTask__block_invoke;
  v29[3] = &unk_2643E3708;
  v29[4] = self;
  v27 = [v14 continueWithBlock:v29];

  return v27;
}

id __42__AMSUICardOnFilePVTFetchTask_performTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (a2)
  {
    uint64_t v7 = [MEMORY[0x263F27E10] promiseWithResult:a2];
    goto LABEL_12;
  }
  v8 = [v5 domain];
  v9 = v8;
  if (v8 != (void *)*MEMORY[0x263F27850])
  {

LABEL_11:
    uint64_t v7 = [MEMORY[0x263F27E10] promiseWithError:v6];
    goto LABEL_12;
  }
  uint64_t v10 = [v6 code];

  if (v10 != 6) {
    goto LABEL_11;
  }
  v11 = [MEMORY[0x263F27CB8] sharedAccountsConfig];
  if (!v11)
  {
    v11 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = objc_opt_class();
    v14 = AMSLogKey();
    int v17 = 138543618;
    uint64_t v18 = v13;
    __int16 v19 = 2114;
    v20 = v14;
    _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User cancelled biometric auth", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 32) _promiseToPromptAfterCancel];
LABEL_12:
  id v15 = (void *)v7;

  return v15;
}

- (id)_promiseToLoadBooleanURL
{
  v3 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  v4 = [v3 URLForKey:@"verifyPaymentApplePayAurumOnStackBoolean"];

  id v5 = [v4 valuePromise];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__AMSUICardOnFilePVTFetchTask__promiseToLoadBooleanURL__block_invoke;
  v8[3] = &unk_2643E3730;
  v8[4] = self;
  v6 = [v5 thenWithBlock:v8];

  return v6;
}

uint64_t __55__AMSUICardOnFilePVTFetchTask__promiseToLoadBooleanURL__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _promiseToFetchCardOnStackBooleanURL:a2];
}

- (id)_promiseToFetchCardOnStackBooleanURL:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUICardOnFilePVTFetchTask *)self account];
  v6 = [(AMSUICardOnFilePVTFetchTask *)self accountParameters];
  uint64_t v7 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  v8 = +[AMSUIPaymentVerificationProtocolHandler _promiseToFetchURLResponseForAccount:v5 accountParameters:v6 url:v4 bag:v7 requestBody:0 bodyEncoding:0 contentType:0];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackBooleanURL___block_invoke;
  v12[3] = &unk_2643E3758;
  v12[4] = self;
  v9 = [v8 thenWithBlock:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackBooleanURL___block_invoke_37;
  v11[3] = &unk_2643E3570;
  v11[4] = self;
  [v9 addErrorBlock:v11];

  return v9;
}

id __68__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackBooleanURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = AMSLogKey();
    v8 = [v3 object];
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    uint64_t v21 = v7;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetched BOOLean url object: %{public}@", buf, 0x20u);
  }
  v9 = [v3 object];
  BOOL v10 = +[AMSUIParentalVerificationCore _isCardOnFileOnStack:v9];

  if (v10)
  {
    v11 = [*(id *)(a1 + 32) _promiseToPromptBeforeBiometricAuth];
  }
  else
  {
    id v16 = @"AMSUICardOnFilePVTPreconditionsNotMet";
    uint64_t v17 = MEMORY[0x263EFFA88];
    v12 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v13 = AMSCustomError();
    v14 = [*(id *)(a1 + 32) metrics];
    [v14 setDisplayReason:@"No Aurum card on file"];

    v11 = [MEMORY[0x263F27E10] promiseWithError:v13];
  }
  return v11;
}

void __68__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackBooleanURL___block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    BOOL v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Finding card on file failed: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (id)_promiseToPromptBeforeBiometricAuth
{
  uint64_t v3 = [MEMORY[0x263F27B60] type];
  id v4 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  if (v3 == 3) {
    uint64_t v6 = @"FACE_ID";
  }
  else {
    uint64_t v6 = @"TOUCH_ID";
  }
  uint64_t v7 = AMSUILocalizedStringFromBundle(v6, v4, v5);

  uint64_t v8 = NSString;
  __int16 v9 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  BOOL v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  __int16 v11 = AMSUILocalizedStringFromBundle(@"PAYMENT_VERIFICATION_BIOMETRIC_CONFIRMATION_MESSAGE", v9, v10);
  v39 = (void *)v7;
  id v12 = objc_msgSend(v8, "stringWithFormat:", v11, v7);

  uint64_t v13 = NSString;
  v14 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  id v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  id v16 = AMSUILocalizedStringFromBundle(@"PAYMENT_VERIFICATION_BIOMETRIC_CONFIRMATION_CONTINUE_BUTTON", v14, v15);
  uint64_t v17 = objc_msgSend(v13, "stringWithFormat:", v16, v7);

  id v18 = objc_alloc_init(MEMORY[0x263F27E10]);
  id v19 = objc_alloc(MEMORY[0x263F27C10]);
  __int16 v20 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  uint64_t v21 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  __int16 v22 = AMSUILocalizedStringFromBundle(@"PAYMENT_VERIFICATION_BIOMETRIC_CONFIRMATION_TITLE", v20, v21);
  id v23 = (void *)[v19 initWithTitle:v22 message:v12];

  uint64_t v24 = [MEMORY[0x263F27C08] actionWithTitle:v17];
  [v23 addButtonAction:v24];

  uint64_t v25 = (void *)MEMORY[0x263F27C08];
  v26 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  v27 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  v28 = AMSUILocalizedStringFromBundle(@"CANCEL", v26, v27);
  v29 = [v25 actionWithTitle:v28 style:2];
  [v23 addButtonAction:v29];

  v30 = [AMSUIAlertDialogTask alloc];
  uint64_t v31 = [(AMSUICardOnFilePVTFetchTask *)self viewController];
  __int16 v32 = [(AMSUIAlertDialogTask *)v30 initWithRequest:v23 presentingViewController:v31];

  v33 = [(AMSUICardOnFilePVTFetchTask *)self metrics];
  [v33 enqueueEventWithPageId:@"ParentConsent" displayReason:0];

  __int16 v34 = [(AMSUIAlertDialogTask *)v32 present];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __66__AMSUICardOnFilePVTFetchTask__promiseToPromptBeforeBiometricAuth__block_invoke;
  v41[3] = &unk_2643E3780;
  id v42 = v23;
  id v43 = v18;
  v44 = self;
  id v35 = v18;
  id v36 = v23;
  [v34 addFinishBlock:v41];

  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __66__AMSUICardOnFilePVTFetchTask__promiseToPromptBeforeBiometricAuth__block_invoke_2;
  v40[3] = &unk_2643E3730;
  v40[4] = self;
  v37 = [v35 thenWithBlock:v40];

  return v37;
}

void __66__AMSUICardOnFilePVTFetchTask__promiseToPromptBeforeBiometricAuth__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a2 selectedActionIdentifier];
  id v11 = [v3 locateActionWithIdentifier:v4];

  uint64_t v5 = [v11 style];
  uint64_t v6 = *(void **)(a1 + 40);
  if (v5 == 2)
  {
    uint64_t v7 = AMSError();
    [v6 finishWithError:v7];

    uint64_t v8 = [*(id *)(a1 + 48) metrics];
    __int16 v9 = v8;
    BOOL v10 = @"Cancel";
  }
  else
  {
    [*(id *)(a1 + 40) finishWithResult:@"User continued with biometric auth"];
    uint64_t v8 = [*(id *)(a1 + 48) metrics];
    __int16 v9 = v8;
    BOOL v10 = @"Continue";
  }
  [v8 enqueueEventWithTargetId:v10 pageId:@"ParentConsent" displayReason:0];
}

uint64_t __66__AMSUICardOnFilePVTFetchTask__promiseToPromptBeforeBiometricAuth__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promiseToLoadPVTURL];
}

- (id)_promiseToLoadPVTURL
{
  uint64_t v3 = [(AMSUICardOnFilePVTFetchTask *)self metrics];
  [v3 enqueueEventWithPageId:@"ParentBiometric" displayReason:0];

  id v4 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  uint64_t v5 = [v4 URLForKey:@"verifyPaymentApplePayAurumOnStackPVT"];

  uint64_t v6 = [v5 valuePromise];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__AMSUICardOnFilePVTFetchTask__promiseToLoadPVTURL__block_invoke;
  v9[3] = &unk_2643E3730;
  v9[4] = self;
  uint64_t v7 = [v6 thenWithBlock:v9];

  return v7;
}

uint64_t __51__AMSUICardOnFilePVTFetchTask__promiseToLoadPVTURL__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _promiseToFetchCardOnStackTokenURL:a2];
}

- (id)_promiseToFetchCardOnStackTokenURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSUICardOnFilePVTFetchTask *)self account];
  uint64_t v6 = [(AMSUICardOnFilePVTFetchTask *)self accountParameters];
  uint64_t v7 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  uint64_t v8 = +[AMSUIPaymentVerificationProtocolHandler _promiseToFetchURLResponseForAccount:v5 accountParameters:v6 url:v4 bag:v7 requestBody:0 bodyEncoding:0 contentType:0];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackTokenURL___block_invoke;
  v12[3] = &unk_2643E3758;
  v12[4] = self;
  __int16 v9 = [v8 thenWithBlock:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackTokenURL___block_invoke_2;
  v11[3] = &unk_2643E3570;
  v11[4] = self;
  [v9 addErrorBlock:v11];

  return v9;
}

id __66__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackTokenURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 object];
  id v4 = +[AMSUIParentalVerificationCore _tokenFromObject:v3];

  uint64_t v5 = +[AMSUIParentalVerificationCore _tokenResultFromTokenString:v4];
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) metrics];
    [v6 enqueueEventWithPageId:@"ParentVerified" displayReason:@"CardOnFile"];

    uint64_t v7 = [*(id *)(a1 + 32) metrics];
    [v7 flushEvents];

    uint64_t v8 = [MEMORY[0x263F27E10] promiseWithResult:v5];
  }
  else
  {
    __int16 v9 = AMSError();
    BOOL v10 = [*(id *)(a1 + 32) metrics];
    [v10 setDisplayReason:@"Biometric scan failed"];

    uint64_t v8 = [MEMORY[0x263F27E10] promiseWithError:v9];
  }
  return v8;
}

void __66__AMSUICardOnFilePVTFetchTask__promiseToFetchCardOnStackTokenURL___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    BOOL v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch card on file failed: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (id)_promiseToPromptAfterCancel
{
  uint64_t v3 = [MEMORY[0x263F27B60] type];
  id v4 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  if (v3 == 3) {
    uint64_t v6 = @"FACE_ID";
  }
  else {
    uint64_t v6 = @"TOUCH_ID";
  }
  int v7 = AMSUILocalizedStringFromBundle(v6, v4, v5);

  uint64_t v8 = NSString;
  __int16 v9 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  BOOL v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  __int16 v11 = AMSUILocalizedStringFromBundle(@"PAYMENT_VERIFICATION_BIOMETRIC_CANCEL_TITLE", v9, v10);
  v39 = objc_msgSend(v8, "stringWithFormat:", v11, v7);

  id v12 = NSString;
  uint64_t v13 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  id v15 = AMSUILocalizedStringFromBundle(@"PAYMENT_VERIFICATION_BIOMETRIC_CANCEL_MESSAGE", v13, v14);
  v38 = objc_msgSend(v12, "stringWithFormat:", v15, v7);

  id v16 = NSString;
  uint64_t v17 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  id v18 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  id v19 = AMSUILocalizedStringFromBundle(@"PAYMENT_VERIFICATION_BIOMETRIC_CANCEL_RETRACT_BUTTON", v17, v18);
  __int16 v20 = objc_msgSend(v16, "stringWithFormat:", v19, v7);

  id v21 = objc_alloc_init(MEMORY[0x263F27E10]);
  __int16 v22 = (void *)[objc_alloc(MEMORY[0x263F27C10]) initWithTitle:v39 message:v38];
  id v23 = (void *)MEMORY[0x263F27C08];
  uint64_t v24 = [(AMSUICardOnFilePVTFetchTask *)self bag];
  uint64_t v25 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  v26 = AMSUILocalizedStringFromBundle(@"PAYMENT_VERIFICATION_BIOMETRIC_CANCEL_CONFIRM_BUTTON", v24, v25);
  v27 = [v23 actionWithTitle:v26 identifier:@"cancelConfirmId"];
  [v22 addButtonAction:v27];

  v28 = [MEMORY[0x263F27C08] actionWithTitle:v20 identifier:@"cancelRetractId"];
  [v22 addButtonAction:v28];

  v29 = [AMSUIAlertDialogTask alloc];
  v30 = [(AMSUICardOnFilePVTFetchTask *)self viewController];
  uint64_t v31 = [(AMSUIAlertDialogTask *)v29 initWithRequest:v22 presentingViewController:v30];

  __int16 v32 = [(AMSUICardOnFilePVTFetchTask *)self metrics];
  [v32 enqueueEventWithPageId:@"ContinueNoBiometric" displayReason:0];

  v33 = [(AMSUIAlertDialogTask *)v31 present];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __58__AMSUICardOnFilePVTFetchTask__promiseToPromptAfterCancel__block_invoke;
  v41[3] = &unk_2643E37A8;
  id v42 = v22;
  id v43 = @"cancelConfirmId";
  id v44 = v21;
  v45 = self;
  id v34 = v21;
  id v35 = v22;
  [v33 addFinishBlock:v41];

  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __58__AMSUICardOnFilePVTFetchTask__promiseToPromptAfterCancel__block_invoke_2;
  v40[3] = &unk_2643E3730;
  v40[4] = self;
  id v36 = [v34 thenWithBlock:v40];

  return v36;
}

void __58__AMSUICardOnFilePVTFetchTask__promiseToPromptAfterCancel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a2 selectedActionIdentifier];
  id v11 = [v3 locateActionWithIdentifier:v4];

  uint64_t v5 = [v11 identifier];
  LODWORD(v4) = [v5 isEqualToString:*(void *)(a1 + 40)];

  uint64_t v6 = *(void **)(a1 + 48);
  if (v4)
  {
    int v7 = AMSError();
    [v6 finishWithError:v7];

    uint64_t v8 = [*(id *)(a1 + 56) metrics];
    __int16 v9 = v8;
    BOOL v10 = @"Payment";
  }
  else
  {
    [*(id *)(a1 + 48) finishWithResult:@"User opted to not cancel biometric auth"];
    uint64_t v8 = [*(id *)(a1 + 56) metrics];
    __int16 v9 = v8;
    BOOL v10 = @"Biometric";
  }
  [v8 enqueueEventWithTargetId:v10 pageId:@"ContinueNoBiometric" displayReason:0];
}

uint64_t __58__AMSUICardOnFilePVTFetchTask__promiseToPromptAfterCancel__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promiseToLoadPVTURL];
}

+ (id)_accountToUseFromGivenAccount:(id)a3 accountParameters:(id)a4 activeiTunesAccount:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  BOOL v10 = objc_msgSend(v8, "ams_altDSID");
  id v11 = objc_msgSend(v7, "ams_altDSID");
  int v12 = [v11 isEqualToString:v10];

  uint64_t v13 = [v9 objectForKeyedSubscript:@"altDsId"];

  int v14 = [v13 isEqualToString:v10];
  id v15 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v15)
  {
    id v15 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_opt_class();
    AMSLogKey();
    v18 = int v22 = v12;
    id v19 = objc_msgSend(v7, "ams_altDSID");
    *(_DWORD *)buf = 138544386;
    uint64_t v24 = v17;
    __int16 v25 = 2114;
    v26 = v18;
    __int16 v27 = 2114;
    v28 = v10;
    __int16 v29 = 2114;
    v30 = v19;
    __int16 v31 = 2114;
    __int16 v32 = v13;
    _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Active iTunes: %{public}@, provided account: %{public}@, provided parameters: %{public}@", buf, 0x34u);

    int v12 = v22;
  }

  if ((v12 | v14) == 1) {
    id v20 = v8;
  }
  else {
    id v20 = 0;
  }

  return v20;
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