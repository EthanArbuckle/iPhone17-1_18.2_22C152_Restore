@interface AMSUIParentalVerificationApplePayTask
+ (BOOL)_walletHasValidSetup:(id)a3 paymentRequest:(id)a4;
+ (id)_biometricsRequestWithAccount:(id)a3;
+ (id)_contextIconWithBundle:(id)a3 accountParameters:(id)a4;
+ (id)_contextTitleWithBag:(id)a3 bundle:(id)a4 accountParameters:(id)a5;
+ (id)_messageWithBag:(id)a3 bundle:(id)a4;
+ (id)_paymentRequestMetadataWithBag:(id)a3 bundle:(id)a4 accountParameters:(id)a5;
+ (id)_sheetTitleWithBag:(id)a3 bundle:(id)a4;
+ (id)_titleIconWithBundle:(id)a3;
+ (id)paymentRequestFromPaymentSession:(id)a3 currencyCode:(id)a4 countryCode:(id)a5 networks:(id)a6 bag:(id)a7 accountParameters:(id)a8 bundle:(id)a9 biometricsRequest:(id)a10;
- (ACAccount)account;
- (ACAccount)originalAccount;
- (AMSBagProtocol)bag;
- (AMSBiometricsSignatureRequest)biometricsRequest;
- (AMSMutablePromise)delegatePromise;
- (AMSPromise)resultPromise;
- (AMSUIParentalVerificationApplePayTask)initWithAccount:(id)a3 accountParameters:(id)a4 bag:(id)a5 displayName:(id)a6 metrics:(id)a7 viewController:(id)a8;
- (AMSUIParentalVerificationApplePayTask)strongSelf;
- (AMSUIPaymentVerificationMetrics)metrics;
- (NSData)paymentData;
- (NSDictionary)accountParameters;
- (NSError)paymentError;
- (NSString)displayName;
- (UIViewController)viewController;
- (id)_presentPaymentRequest:(id)a3;
- (id)_promiseToFetchPaymentCardTokenURL:(id)a3 requestBody:(id)a4;
- (id)_promiseToLoadPVTURLWithBody:(id)a3;
- (id)_promiseToRequestWalletDataUsingSession:(id)a3 bag:(id)a4 accountParameters:(id)a5 bundle:(id)a6;
- (id)performTask;
- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4;
- (void)paymentAuthorizationControllerDidFinish:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAccountParameters:(id)a3;
- (void)setBag:(id)a3;
- (void)setBiometricsRequest:(id)a3;
- (void)setDelegatePromise:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setOriginalAccount:(id)a3;
- (void)setPaymentData:(id)a3;
- (void)setPaymentError:(id)a3;
- (void)setResultPromise:(id)a3;
- (void)setStrongSelf:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation AMSUIParentalVerificationApplePayTask

- (AMSUIParentalVerificationApplePayTask)initWithAccount:(id)a3 accountParameters:(id)a4 bag:(id)a5 displayName:(id)a6 metrics:(id)a7 viewController:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AMSUIParentalVerificationApplePayTask;
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
  uint64_t v28 = *MEMORY[0x263EF8340];
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
    uint64_t v23 = v5;
    __int16 v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting task", buf, 0x16u);
  }
  v7 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x263F277D8]);
  v8 = [(AMSUIParentalVerificationApplePayTask *)self originalAccount];
  v9 = [(AMSUIParentalVerificationApplePayTask *)self accountParameters];
  v10 = +[AMSUIPaymentVerificationProtocolHandler _accountToUseFromGivenAccount:v8 accountParameters:v9 accountStore:v7];

  if (v10)
  {
    [(AMSUIParentalVerificationApplePayTask *)self setAccount:v10];
    v11 = (void *)MEMORY[0x263F27BA0];
    v12 = [(AMSUIParentalVerificationApplePayTask *)self bag];
    v13 = [v11 performPaymentSessionForVerificationWithBag:v12];

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __52__AMSUIParentalVerificationApplePayTask_performTask__block_invoke;
    v21[3] = &unk_2643E4178;
    v21[4] = self;
    v14 = [v13 thenWithBlock:v21];
  }
  else
  {
    v13 = AMSCustomError();
    id v15 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v15)
    {
      id v15 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v17;
      __int16 v24 = 2114;
      v25 = v18;
      __int16 v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
    }
    v14 = [MEMORY[0x263F27E10] promiseWithError:v13];
    v19 = [(AMSUIParentalVerificationApplePayTask *)self metrics];
    [v19 setDisplayReason:@"Missing account"];
  }
  [(AMSUIParentalVerificationApplePayTask *)self setResultPromise:v14];

  return v14;
}

id __52__AMSUIParentalVerificationApplePayTask_performTask__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a2;
  uint64_t v5 = [v3 bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  v6 = *(void **)(a1 + 32);
  v7 = [v6 bag];
  v8 = [*(id *)(a1 + 32) accountParameters];
  v9 = [v6 _promiseToRequestWalletDataUsingSession:v4 bag:v7 accountParameters:v8 bundle:v5];

  return v9;
}

- (id)_promiseToRequestWalletDataUsingSession:(id)a3 bag:(id)a4 accountParameters:(id)a5 bundle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x263F5C070] availableNetworks];
  id v15 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v38 = [v15 countryCode];

  id v16 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v17 = [v16 currencyCode];

  v18 = objc_opt_class();
  v19 = [(AMSUIParentalVerificationApplePayTask *)self account];
  v20 = [v18 _biometricsRequestWithAccount:v19];
  [(AMSUIParentalVerificationApplePayTask *)self setBiometricsRequest:v20];

  id v21 = [(AMSUIParentalVerificationApplePayTask *)self biometricsRequest];

  v39 = v13;
  if (v21)
  {
    id v22 = objc_opt_class();
    uint64_t v23 = [(AMSUIParentalVerificationApplePayTask *)self biometricsRequest];
    id v37 = v13;
    __int16 v24 = v10;
    id v25 = v10;
    __int16 v26 = (void *)v38;
    v27 = [v22 paymentRequestFromPaymentSession:v25 currencyCode:v17 countryCode:v38 networks:v14 bag:v11 accountParameters:v12 bundle:v37 biometricsRequest:v23];

    uint64_t v28 = objc_opt_class();
    v29 = [(AMSUIParentalVerificationApplePayTask *)self biometricsRequest];
    LODWORD(v28) = [v28 _walletHasValidSetup:v29 paymentRequest:v27];

    if (v28)
    {
      v30 = [(AMSUIParentalVerificationApplePayTask *)self _presentPaymentRequest:v27];
    }
    else
    {
      v33 = [(AMSUIParentalVerificationApplePayTask *)self metrics];
      [v33 setDisplayReason:@"No suitable credit card in Wallet"];

      v34 = (void *)MEMORY[0x263F27E10];
      v35 = AMSError();
      v30 = [v34 promiseWithError:v35];
    }
  }
  else
  {
    __int16 v24 = v10;
    v31 = [(AMSUIParentalVerificationApplePayTask *)self metrics];
    [v31 setDisplayReason:@"Unable to create Wallet biometrics request"];

    v32 = (void *)MEMORY[0x263F27E10];
    v27 = AMSError();
    v30 = [v32 promiseWithError:v27];
    __int16 v26 = (void *)v38;
  }

  return v30;
}

+ (BOOL)_walletHasValidSetup:(id)a3 paymentRequest:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v5 supportedNetworks];
  v8 = [v5 supportedCountries];
  LOBYTE(a3) = PKCanMakePaymentsUsingNetworksIssuerCountryCodesWithCapabilities();

  uint64_t v9 = [v6 localAuthContext];

  uint64_t v10 = [v5 accesssControlRef];
  id v11 = [(id)v9 evaluationMechanismsForAccessControl:v10 operation:3 error:0];

  LOBYTE(v10) = [v11 containsObject:&unk_26CC73688];
  LOBYTE(v9) = [v11 containsObject:&unk_26CC736A0];
  LOBYTE(a3) = a3 & (v10 | v9 | [v11 containsObject:&unk_26CC736B8]);

  return (char)a3;
}

+ (id)paymentRequestFromPaymentSession:(id)a3 currencyCode:(id)a4 countryCode:(id)a5 networks:(id)a6 bag:(id)a7 accountParameters:(id)a8 bundle:(id)a9 biometricsRequest:(id)a10
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v47 = a3;
  id v46 = a4;
  id v45 = a5;
  id v44 = a6;
  id v49 = a7;
  id v43 = a8;
  id v16 = a9;
  id v48 = a10;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2050000000;
  uint64_t v17 = (void *)getPKPaymentRequestClass_softClass;
  uint64_t v54 = getPKPaymentRequestClass_softClass;
  if (!getPKPaymentRequestClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPKPaymentRequestClass_block_invoke;
    v59 = &unk_2643E33D8;
    v60 = &v51;
    __getPKPaymentRequestClass_block_invoke((uint64_t)buf);
    uint64_t v17 = (void *)v52[3];
  }
  v18 = v17;
  _Block_object_dispose(&v51, 8);
  id v19 = objc_alloc_init(v18);
  [v19 setAPIType:0];
  [v19 setRequestType:0];
  [v19 setRequestor:0];
  [v19 setMerchantSession:v47];
  [v19 setExpectsMerchantSession:1];
  [v19 setMerchantCapabilities:5];
  [v19 setCurrencyCode:v46];
  v20 = AMSNormalisedCountryCodeForPaymentRequest();
  if (v20)
  {
    [v19 setCountryCode:v20];
    id v21 = [MEMORY[0x263EFFA08] setWithObject:v20];
    [v19 setSupportedCountries:v21];
  }
  [v19 setConfirmationStyle:1];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2050000000;
  id v22 = (void *)getPKPaymentSummaryItemClass_softClass;
  uint64_t v54 = getPKPaymentSummaryItemClass_softClass;
  if (!getPKPaymentSummaryItemClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPKPaymentSummaryItemClass_block_invoke;
    v59 = &unk_2643E33D8;
    v60 = &v51;
    __getPKPaymentSummaryItemClass_block_invoke((uint64_t)buf);
    id v22 = (void *)v52[3];
  }
  id v23 = v22;
  _Block_object_dispose(&v51, 8);
  __int16 v24 = [MEMORY[0x263F087B0] zero];
  id v25 = [v23 summaryItemWithLabel:@"Parental Verification (PVK)" amount:v24];

  v57 = v25;
  __int16 v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
  [v19 setPaymentSummaryItems:v26];

  [v19 setSupportedNetworks:v44];
  id v27 = (id)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  uint64_t v28 = AMSUILocalizedStringFromBundle(@"PARENTAL_VERIFICATION_APPLE_PAY_CLASSIC_SHEET_AUTH_TITLE", v49, v16);
  [v19 setLocalizedAuthorizingTitle:v28];

  id v29 = (id)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  v30 = AMSUILocalizedStringFromBundle(@"PARENTAL_VERIFICATION_APPLE_PAY_CLASSIC_SHEET_ERROR_TITLE", v49, v16);
  [v19 setLocalizedErrorMessage:v30];

  objc_msgSend(v19, "setAccesssControlRef:", objc_msgSend(v48, "localAuthAccessControlRef"));
  v31 = [v48 localAuthContext];
  v32 = [v31 externalizedContext];
  [v19 setExternalizedContext:v32];

  [v19 setDisablePasscodeFallback:1];
  [v19 setClientViewSourceIdentifier:@"AMSUIPaymentSheetViewProvider"];
  id v50 = 0;
  v33 = [MEMORY[0x263F08910] archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v50];
  id v34 = v50;
  if (v34)
  {
    v35 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v35)
    {
      v35 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v36 = [v35 OSLogObject];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v37;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v38;
      *(_WORD *)&buf[22] = 2114;
      v59 = v34;
      _os_log_impl(&dword_21C134000, v36, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to serialise payment request with error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (!v33) {
      goto LABEL_16;
    }
    uint64_t v39 = *MEMORY[0x263F27A98];
    v56[0] = v33;
    uint64_t v40 = *MEMORY[0x263F27AA8];
    v55[0] = v39;
    v55[1] = v40;
    v41 = [a1 _paymentRequestMetadataWithBag:v49 bundle:v16 accountParameters:v43];
    v56[1] = v41;
    v55[2] = *MEMORY[0x263F27AA0];
    v56[2] = @"AMSPaymentSheetPaymentRequestLayoutValuePVK";
    v35 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];

    [v19 setClientViewSourceParameter:v35];
  }

LABEL_16:
  return v19;
}

+ (id)_biometricsRequestWithAccount:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F27C98];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setAuthenticationFallbackVisible:0];
  objc_msgSend(v5, "setStyle:", objc_msgSend(MEMORY[0x263F27C98], "preferredAttestationStyle"));
  [v5 setPurpose:0];
  id v6 = [MEMORY[0x263F27E08] currentProcess];
  id v14 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x263F27B68]) initWithAccount:v4 clientInfo:v6 challenge:@"PVKAPCBiometricsChallenge" localAuthContext:0 options:v5 error:&v14];

  id v8 = v14;
  if (!v7)
  {
    uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v9)
    {
      uint64_t v9 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      v18 = v12;
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl(&dword_21C134000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create biometrics request with error: %{public}@", buf, 0x20u);
    }
  }

  return v7;
}

+ (id)_paymentRequestMetadataWithBag:(id)a3 bundle:(id)a4 accountParameters:(id)a5
{
  v22[6] = *MEMORY[0x263EF8340];
  v21[0] = @"sheetTitle";
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [a1 _sheetTitleWithBag:v10 bundle:v9];
  v22[0] = v11;
  v21[1] = @"contextTitle";
  id v12 = [a1 _contextTitleWithBag:v10 bundle:v9 accountParameters:v8];
  v22[1] = v12;
  v21[2] = @"message";
  id v13 = [a1 _messageWithBag:v10 bundle:v9];

  v22[2] = v13;
  v21[3] = @"titleIcon";
  id v14 = [a1 _titleIconWithBundle:v9];
  v22[3] = v14;
  v21[4] = @"contextIcon";
  id v15 = [a1 _contextIconWithBundle:v9 accountParameters:v8];

  v22[4] = v15;
  void v21[5] = @"screenScale";
  uint64_t v16 = NSNumber;
  __int16 v17 = [MEMORY[0x263F82B60] mainScreen];
  [v17 scale];
  v18 = objc_msgSend(v16, "numberWithDouble:");
  v22[5] = v18;
  __int16 v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:6];

  return v19;
}

+ (id)_sheetTitleWithBag:(id)a3 bundle:(id)a4
{
  id v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)[v5 bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  id v9 = AMSUILocalizedStringFromBundle(@"PARENTAL_VERIFICATION_APPLE_PAY_CLASSIC_WALLET", v7, v6);

  return v9;
}

+ (id)_contextTitleWithBag:(id)a3 bundle:(id)a4 accountParameters:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 objectForKeyedSubscript:@"PVKApplePayClassicContextTitle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (!v10)
  {
    id v11 = (id)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
    AMSUILocalizedStringFromBundle(@"PARENTAL_VERIFICATION_APPLE_PAY_CLASSIC_CONTEXT_NAME", v7, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)_messageWithBag:(id)a3 bundle:(id)a4
{
  id v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)[v5 bundleWithIdentifier:@"com.apple.AppleMediaServicesUI"];
  id v9 = AMSUILocalizedStringFromBundle(@"PARENTAL_VERIFICATION_APPLE_PAY_CLASSIC_MESSAGE", v7, v6);

  return v9;
}

+ (id)_titleIconWithBundle:(id)a3
{
  v3 = [MEMORY[0x263F827E8] imageNamed:@"Wallet20x20" inBundle:a3 compatibleWithTraitCollection:0];
  id v4 = UIImagePNGRepresentation(v3);

  return v4;
}

+ (id)_contextIconWithBundle:(id)a3 accountParameters:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKeyedSubscript:@"PVKApplePayClassicContextIcon"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (!v7)
  {
    id v8 = [MEMORY[0x263F827E8] imageNamed:@"FS54x54" inBundle:v5 compatibleWithTraitCollection:0];
    UIImagePNGRepresentation(v8);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)_presentPaymentRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F27D90]);
  id v6 = objc_alloc_init(MEMORY[0x263F27D90]);
  [(AMSUIParentalVerificationApplePayTask *)self setDelegatePromise:v6];

  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v7 = (void *)getPKPaymentAuthorizationControllerClass_softClass;
  uint64_t v19 = getPKPaymentAuthorizationControllerClass_softClass;
  if (!getPKPaymentAuthorizationControllerClass_softClass)
  {
    location[0] = (id)MEMORY[0x263EF8330];
    location[1] = (id)3221225472;
    location[2] = __getPKPaymentAuthorizationControllerClass_block_invoke;
    location[3] = &unk_2643E33D8;
    location[4] = &v16;
    __getPKPaymentAuthorizationControllerClass_block_invoke((uint64_t)location);
    id v7 = (void *)v17[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v16, 8);
  id v9 = (void *)[[v8 alloc] initWithPaymentRequest:v4];
  [v9 setDelegate:self];
  [v9 setPrivateDelegate:self];
  [(AMSUIParentalVerificationApplePayTask *)self setStrongSelf:self];
  objc_initWeak(location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__AMSUIParentalVerificationApplePayTask__presentPaymentRequest___block_invoke;
  v12[3] = &unk_2643E41A0;
  objc_copyWeak(&v14, location);
  id v10 = v5;
  id v13 = v10;
  [v9 presentWithCompletion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(location);

  return v10;
}

void __64__AMSUIParentalVerificationApplePayTask__presentPaymentRequest___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = AMSSetLogKeyIfNeeded();
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [WeakRetained delegatePromise];
    [v5 finishWithPromise:v6];
  }
  else
  {
    id v6 = AMSError();
    [*(id *)(a1 + 32) finishWithError:v6];
    [WeakRetained setStrongSelf:0];
  }
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v5)
  {
    id v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = AMSSetLogKeyIfNeeded();
    id v10 = [(AMSUIParentalVerificationApplePayTask *)self paymentData];
    id v11 = @"YES";
    *(_DWORD *)buf = 138543874;
    id v27 = v7;
    if (!v10) {
      id v11 = @"NO";
    }
    __int16 v28 = 2114;
    id v29 = v9;
    __int16 v30 = 2112;
    v31 = v11;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] paymentAuthorizationControllerDidFinish: with payment %@", buf, 0x20u);
  }
  id v12 = [(AMSUIParentalVerificationApplePayTask *)self paymentData];
  BOOL v13 = v12 == 0;

  if (v13)
  {
    __int16 v17 = [(AMSUIParentalVerificationApplePayTask *)self metrics];
    [v17 setDisplayReason:@"Present payment sheet completed with failure"];

    uint64_t v18 = [(AMSUIParentalVerificationApplePayTask *)self paymentError];
    LODWORD(v17) = v18 == 0;

    if (v17)
    {
      uint64_t v19 = AMSCustomError();
      [(AMSUIParentalVerificationApplePayTask *)self setPaymentError:v19];

      id v20 = [(AMSUIParentalVerificationApplePayTask *)self metrics];
      [v20 setDisplayReason:@"User closed payment sheet"];
    }
    uint64_t v21 = [(AMSUIParentalVerificationApplePayTask *)self bag];
    id v22 = [(AMSUIParentalVerificationApplePayTask *)self viewController];
    id v23 = [(AMSUIParentalVerificationApplePayTask *)self metrics];
    id v14 = +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:v21 viewController:v22 metrics:v23 pageID:@"ContinueNoWalletPay" flowName:@"Wallet pay"];

    id v15 = [(AMSUIParentalVerificationApplePayTask *)self delegatePromise];
    [v15 finishWithPromise:v14];
  }
  else
  {
    id v14 = [(AMSUIParentalVerificationApplePayTask *)self delegatePromise];
    id v15 = [(AMSUIParentalVerificationApplePayTask *)self paymentData];
    uint64_t v16 = [(AMSUIParentalVerificationApplePayTask *)self _promiseToLoadPVTURLWithBody:v15];
    [v14 finishWithPromise:v16];
  }
  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __81__AMSUIParentalVerificationApplePayTask_paymentAuthorizationControllerDidFinish___block_invoke;
  v24[3] = &unk_2643E37D0;
  objc_copyWeak(&v25, (id *)buf);
  [v4 dismissWithCompletion:v24];
  [v4 setDelegate:0];
  [(AMSUIParentalVerificationApplePayTask *)self setStrongSelf:0];
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

void __81__AMSUIParentalVerificationApplePayTask_paymentAuthorizationControllerDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F27CB8];
  id v9 = (void (**)(id, void *))a5;
  id v10 = [v8 sharedConfig];
  if (!v10)
  {
    id v10 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    uint64_t v14 = AMSSetLogKeyIfNeeded();
    id v15 = (void *)v14;
    uint64_t v16 = @"YES";
    *(_DWORD *)buf = 138543874;
    id v25 = v12;
    __int16 v26 = 2114;
    if (!v7) {
      uint64_t v16 = @"NO";
    }
    uint64_t v27 = v14;
    __int16 v28 = 2114;
    id v29 = v16;
    _os_log_impl(&dword_21C134000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] didAuthorizePayment: Did finish with payment? %{public}@", buf, 0x20u);
  }
  if (v7)
  {
    __int16 v17 = (void *)[objc_alloc((Class)getPKPaymentAuthorizationResultClass()) initWithStatus:0 errors:0];
    uint64_t v18 = [v7 token];
    uint64_t v19 = [v18 paymentData];
    [(AMSUIParentalVerificationApplePayTask *)self setPaymentData:v19];
  }
  else
  {
    id v20 = [(AMSUIParentalVerificationApplePayTask *)self paymentError];

    if (!v20)
    {
      uint64_t v21 = AMSError();
      [(AMSUIParentalVerificationApplePayTask *)self setPaymentError:v21];
    }
    id v22 = objc_alloc((Class)getPKPaymentAuthorizationResultClass());
    uint64_t v18 = [(AMSUIParentalVerificationApplePayTask *)self paymentError];
    id v23 = v18;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    __int16 v17 = (void *)[v22 initWithStatus:1 errors:v19];
  }

  v9[2](v9, v17);
}

- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v8)
    {
      id v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      id v11 = v10;
      id v12 = AMSSetLogKeyIfNeeded();
      int v13 = 138543874;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Payment sheet will finish with error: %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
  [v6 setPrivateDelegate:0];
  [(AMSUIParentalVerificationApplePayTask *)self setPaymentError:v7];
}

- (id)_promiseToLoadPVTURLWithBody:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIParentalVerificationApplePayTask *)self metrics];
  [v5 enqueueEventWithPageId:@"ParentalVerificationApplePay" displayReason:0];

  id v6 = [(AMSUIParentalVerificationApplePayTask *)self bag];
  id v7 = [v6 URLForKey:@"verifyPaymentApplePayCardOnDevice"];

  id v8 = [v7 valuePromise];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__AMSUIParentalVerificationApplePayTask__promiseToLoadPVTURLWithBody___block_invoke;
  v12[3] = &unk_2643E41C8;
  void v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  id v10 = [v8 thenWithBlock:v12];

  return v10;
}

uint64_t __70__AMSUIParentalVerificationApplePayTask__promiseToLoadPVTURLWithBody___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _promiseToFetchPaymentCardTokenURL:a2 requestBody:*(void *)(a1 + 40)];
}

- (id)_promiseToFetchPaymentCardTokenURL:(id)a3 requestBody:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMSUIParentalVerificationApplePayTask *)self account];
  id v9 = [(AMSUIParentalVerificationApplePayTask *)self accountParameters];
  id v10 = [(AMSUIParentalVerificationApplePayTask *)self bag];
  id v11 = +[AMSUIPaymentVerificationProtocolHandler _promiseToFetchURLResponseForAccount:v8 accountParameters:v9 url:v7 bag:v10 requestBody:v6 bodyEncoding:1 contentType:@"application/json"];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __88__AMSUIParentalVerificationApplePayTask__promiseToFetchPaymentCardTokenURL_requestBody___block_invoke;
  v14[3] = &unk_2643E41F0;
  v14[4] = self;
  id v12 = [v11 continueWithBlock:v14];

  return v12;
}

id __88__AMSUIParentalVerificationApplePayTask__promiseToFetchPaymentCardTokenURL_requestBody___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) metrics];
    [v7 setDisplayReason:@"Wallet pay data fetch failed"];

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
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch PVT for Wallet pay failed: %{public}@", (uint8_t *)&v28, 0x20u);
    }
    id v12 = [*(id *)(a1 + 32) bag];
    id v13 = [*(id *)(a1 + 32) viewController];
    uint64_t v14 = [*(id *)(a1 + 32) metrics];
    __int16 v15 = +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:v12 viewController:v13 metrics:v14 pageID:@"ContinueNoWalletPay" flowName:@"Wallet pay"];
LABEL_7:

    goto LABEL_10;
  }
  uint64_t v16 = [v5 object];
  id v12 = +[AMSUIParentalVerificationCore _tokenFromObject:v16];

  id v13 = +[AMSUIParentalVerificationCore _tokenResultFromTokenString:v12];
  if (!v13)
  {
    id v20 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v20)
    {
      id v20 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      id v23 = AMSLogKey();
      __int16 v24 = [v5 object];
      int v28 = 138543874;
      uint64_t v29 = v22;
      __int16 v30 = 2114;
      v31 = v23;
      __int16 v32 = 2114;
      id v33 = v24;
      _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch PVT for Wallet pay response had no token: %{public}@", (uint8_t *)&v28, 0x20u);
    }
    id v25 = [*(id *)(a1 + 32) metrics];
    [v25 setDisplayReason:@"Wallet pay data failed"];

    uint64_t v14 = [*(id *)(a1 + 32) bag];
    __int16 v26 = [*(id *)(a1 + 32) viewController];
    uint64_t v27 = [*(id *)(a1 + 32) metrics];
    __int16 v15 = +[AMSUIParentalVerificationCommon _promiseToPromptAfterFailureWithBag:v14 viewController:v26 metrics:v27 pageID:@"ContinueNoWalletPay" flowName:@"Wallet pay"];

    goto LABEL_7;
  }
  __int16 v17 = [*(id *)(a1 + 32) metrics];
  [v17 enqueueEventWithPageId:@"ParentVerified" displayReason:@"WalletPay"];

  id v18 = [*(id *)(a1 + 32) metrics];
  [v18 flushEvents];

  __int16 v15 = [MEMORY[0x263F27E10] promiseWithResult:v13];
LABEL_10:

  return v15;
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

- (AMSBiometricsSignatureRequest)biometricsRequest
{
  return self->_biometricsRequest;
}

- (void)setBiometricsRequest:(id)a3
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

- (AMSUIParentalVerificationApplePayTask)strongSelf
{
  return self->_strongSelf;
}

- (void)setStrongSelf:(id)a3
{
}

- (AMSPromise)resultPromise
{
  return self->_resultPromise;
}

- (void)setResultPromise:(id)a3
{
}

- (AMSMutablePromise)delegatePromise
{
  return self->_delegatePromise;
}

- (void)setDelegatePromise:(id)a3
{
}

- (NSData)paymentData
{
  return self->_paymentData;
}

- (void)setPaymentData:(id)a3
{
}

- (NSError)paymentError
{
  return self->_paymentError;
}

- (void)setPaymentError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentError, 0);
  objc_storeStrong((id *)&self->_paymentData, 0);
  objc_storeStrong((id *)&self->_delegatePromise, 0);
  objc_storeStrong((id *)&self->_resultPromise, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_originalAccount, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_biometricsRequest, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_accountParameters, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end