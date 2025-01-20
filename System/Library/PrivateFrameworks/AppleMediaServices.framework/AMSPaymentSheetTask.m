@interface AMSPaymentSheetTask
+ (BOOL)_shouldCompanionAuthFallbackToPasswordForError:(id)a3;
+ (BOOL)isPaymentSheetEnablementAvailable;
- (AKAppleIDAuthenticationContext)authenticationContext;
- (AMSBagProtocol)bag;
- (AMSFinancePaymentSheetResponse)paymentSheetResponse;
- (AMSMutablePromise)paymentSheetPromise;
- (AMSPaymentSheetAssetCache)assetCache;
- (AMSPaymentSheetRequest)request;
- (AMSPaymentSheetTask)initWithRequest:(id)a3 bag:(id)a4;
- (AMSPurchaseInfo)purchaseInfo;
- (BOOL)cancel;
- (NSDictionary)metricsDictionary;
- (NSMutableArray)userActions;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (PKPaymentAuthorizationController)paymentAuthorizationController;
- (_PaymentSheetState)state;
- (id)_authorizePaymentWithAuthKitResults:(id)a3;
- (id)_authorizePaymentWithBiometricsRequest:(id)a3 payment:(id)a4;
- (id)_buildPaymentRequest;
- (id)_metricsEvent;
- (id)_performInProcessTask;
- (id)_performRemoteTask;
- (id)_presentPaymentSheetWithPaymentRequest:(id)a3;
- (id)presentationSceneBundleIdentifierForPaymentAuthorizationController:(id)a3;
- (id)presentationSceneIdentifierForPaymentAuthorizationController:(id)a3;
- (id)presentingWindow;
- (void)_configureAttachSelectedCard:(id)a3;
- (void)_configureBasicsForPaymentRequest:(id)a3 amsPaymentRequest:(id)a4;
- (void)_configureConfirmationScreenForPaymentRequest:(id)a3 amsPaymentRequest:(id)a4;
- (void)_configureContentItemsForPaymentRequest:(id)a3 amsPaymentRequest:(id)a4;
- (void)_configureCustomUIForPaymentRequest:(id)a3 amsPaymentRequest:(id)a4;
- (void)_configureMerchantSessionForPaymentRequest:(id)a3;
- (void)_configurePSD2Decoration:(id)a3 completion:(id)a4;
- (void)_configurePaymentSummaryForPaymentRequest:(id)a3;
- (void)_dismissPaymentAuthorizationController:(id)a3;
- (void)_presentCompanionAuthenticationSheetWithPaymentRequest:(id)a3 purchaseResult:(id)a4;
- (void)_presentPaymentConfirmationWithPaymentRequest:(id)a3 purchaseResult:(id)a4;
- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4;
- (void)paymentAuthorizationController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4;
- (void)paymentAuthorizationControllerDidFinish:(id)a3;
- (void)setAssetCache:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setBag:(id)a3;
- (void)setMetricsDictionary:(id)a3;
- (void)setPaymentAuthorizationController:(id)a3;
- (void)setPaymentSheetPromise:(id)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setPresentingWindow:(id)a3;
- (void)setPurchaseInfo:(id)a3;
- (void)setState:(id)a3;
- (void)setUserActions:(id)a3;
@end

@implementation AMSPaymentSheetTask

- (AMSPaymentSheetTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AMSPaymentSheetTask;
  v9 = [(AMSTask *)&v19 init];
  if (v9)
  {
    v10 = [v7 logKey];

    if (v10)
    {
      v11 = [v7 logKey];
      id v12 = AMSSetLogKey(v11);
    }
    assetCache = v9->_assetCache;
    v9->_assetCache = 0;

    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v9->_request, a3);
    v14 = objc_alloc_init(_PaymentSheetState);
    state = v9->_state;
    v9->_state = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    userActions = v9->_userActions;
    v9->_userActions = v16;
  }
  return v9;
}

- (BOOL)cancel
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v5)
  {
    v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(AMSPaymentSheetTask *)self request];
    id v8 = [v7 logKey];
    v9 = NSString;
    uint64_t v10 = objc_opt_class();
    if (v8)
    {
      v11 = [(AMSPaymentSheetTask *)self request];
      uint64_t v2 = [v11 logKey];
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v9 stringWithFormat:@"%@: [%@] %@ ", v10, v2, a2];
    }
    else
    {
      v11 = NSStringFromSelector(a2);
      [v9 stringWithFormat:@"%@: %@ ", v10, v11];
    id v12 = };
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Canceling payment authorization controller", buf, 0xCu);
    if (v8)
    {

      id v12 = (void *)v2;
    }
  }
  v13 = [(AMSPaymentSheetTask *)self paymentAuthorizationController];
  [(AMSPaymentSheetTask *)self _dismissPaymentAuthorizationController:v13];

  v15.receiver = self;
  v15.super_class = (Class)AMSPaymentSheetTask;
  return [(AMSTask *)&v15 cancel];
}

- (id)_performRemoteTask
{
  return +[AMSPromise promiseWithErrorCode:5 title:@"Payment Sheet Failed" message:@"Platform not supported"];
}

- (id)_performInProcessTask
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AMSPaymentSheetTask__performInProcessTask__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  uint64_t v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __44__AMSPaymentSheetTask__performInProcessTask__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) request];
  v3 = [v2 logKey];

  v4 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSString;
    uint64_t v7 = objc_opt_class();
    if (v3) {
      [v6 stringWithFormat:@"%@: [%@] ", v7, v3];
    }
    else {
    id v8 = [v6 stringWithFormat:@"%@: ", v7, v15];
    }
    *(_DWORD *)buf = 138543362;
    objc_super v19 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting payment sheet task", buf, 0xCu);
  }
  v9 = [*(id *)(a1 + 32) request];
  if ([v9 requiresAuthorization])
  {
    uint64_t v10 = [*(id *)(a1 + 32) authenticationContext];
    v11 = [v10 username];

    if (!v11)
    {
      id v12 = +[AMSPromise promiseWithErrorCode:2 title:@"Payment Sheet Failed" message:@"Invalid AuthKit context (Username is nil)"];
      goto LABEL_13;
    }
  }
  else
  {
  }
  v13 = [*(id *)(a1 + 32) _buildPaymentRequest];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__AMSPaymentSheetTask__performInProcessTask__block_invoke_211;
  v16[3] = &unk_1E55A1B28;
  v16[4] = *(void *)(a1 + 32);
  id v17 = v3;
  id v12 = [v13 thenWithBlock:v16];

LABEL_13:
  return v12;
}

id __44__AMSPaymentSheetTask__performInProcessTask__block_invoke_211(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (!v3)
  {
    objc_super v19 = [v4 state];
    [v19 setCancellationType:100];

    uint64_t v20 = @"Payment request is nil";
    uint64_t v21 = 2;
    goto LABEL_19;
  }
  v5 = [v4 purchaseInfo];
  v6 = [v5 purchase];
  int v7 = [v6 requiresApplePayClassic];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) request];
    if ([v8 isApplePayClassic])
    {
      uint64_t v9 = [v3 requestType];

      if (!v9) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    v26 = [*(id *)(a1 + 32) state];
    [v26 setCancellationType:100];

    uint64_t v20 = @"Purchase requires Apple Pay Classic, but we don't have an Apple Pay Classic sheet";
    uint64_t v21 = 500;
LABEL_19:
    v27 = +[AMSPromise promiseWithErrorCode:v21 title:@"Payment Sheet Failed" message:v20];
    goto LABEL_27;
  }
LABEL_5:
  uint64_t v10 = objc_alloc_init(AMSMutablePromise);
  [*(id *)(a1 + 32) setPaymentSheetPromise:v10];

  v11 = [*(id *)(a1 + 32) request];
  int v12 = [v11 requiresDelegateAuthentication];

  uint64_t v13 = +[AMSLogConfig sharedPurchaseConfig];
  v14 = (void *)v13;
  if (v12)
  {
    if (!v13)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSString;
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = objc_opt_class();
      if (v17) {
        [v16 stringWithFormat:@"%@: [%@] ", v18, *(void *)(a1 + 40)];
      }
      else {
      v28 = [v16 stringWithFormat:@"%@: ", v18, v39];
      }
      *(_DWORD *)buf = 138543362;
      v44 = v28;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Presenting delegate authentication sheet", buf, 0xCu);
    }
    v29 = [*(id *)(a1 + 32) purchaseInfo];
    v30 = [v29 purchase];
    v31 = +[AMSPurchase purchaseFromPurchase:v30];

    v32 = objc_alloc_init(AMSPurchaseResult);
    v33 = [*(id *)(a1 + 32) request];
    v34 = [v33 responseDictionary];
    [(AMSPurchaseResult *)v32 setResponseDictionary:v34];

    [(AMSPurchaseResult *)v32 setPurchase:v31];
    [*(id *)(a1 + 32) _presentCompanionAuthenticationSheetWithPaymentRequest:v3 purchaseResult:v32];
  }
  else
  {
    if (!v13)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v22 = [v14 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = NSString;
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = objc_opt_class();
      if (v24) {
        [v23 stringWithFormat:@"%@: [%@] ", v25, *(void *)(a1 + 40)];
      }
      else {
      v35 = [v23 stringWithFormat:@"%@: ", v25, v39];
      }
      *(_DWORD *)buf = 138543362;
      v44 = v35;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Presenting normal payment sheet", buf, 0xCu);
    }
    v31 = [*(id *)(a1 + 32) _presentPaymentSheetWithPaymentRequest:v3];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __44__AMSPaymentSheetTask__performInProcessTask__block_invoke_221;
    v42[3] = &unk_1E559F028;
    v42[4] = *(void *)(a1 + 32);
    [v31 addErrorBlock:v42];
  }

  v36 = [*(id *)(a1 + 32) paymentSheetPromise];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __44__AMSPaymentSheetTask__performInProcessTask__block_invoke_2;
  v40[3] = &unk_1E55A5368;
  v37 = *(void **)(a1 + 40);
  v40[4] = *(void *)(a1 + 32);
  id v41 = v37;
  v27 = [v36 continueWithBlock:v40];

LABEL_27:
  return v27;
}

void __44__AMSPaymentSheetTask__performInProcessTask__block_invoke_221(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 paymentSheetPromise];
  [v4 finishWithError:v3];
}

id __44__AMSPaymentSheetTask__performInProcessTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  int v7 = [*(id *)(a1 + 32) _metricsEvent];
  id v8 = [*(id *)(a1 + 32) bag];
  uint64_t v9 = +[AMSMetrics internalInstanceUsingBag:v8];
  [v9 enqueueEvent:v7];

  uint64_t v10 = [*(id *)(a1 + 32) bag];
  v11 = +[AMSMetrics internalInstanceUsingBag:v10];
  id v12 = (id)[v11 flush];

  if (v5 | v6)
  {
    if (v6)
    {
      uint64_t v13 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v13)
      {
        uint64_t v13 = +[AMSLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = NSString;
        uint64_t v16 = *(void *)(a1 + 40);
        uint64_t v17 = objc_opt_class();
        if (v16) {
          [v15 stringWithFormat:@"%@: [%@] ", v17, *(void *)(a1 + 40)];
        }
        else {
        uint64_t v25 = [v15 stringWithFormat:@"%@: ", v17, v30];
        }
        v26 = AMSLogableError((void *)v6);
        *(_DWORD *)buf = 138543618;
        v32 = v25;
        __int16 v33 = 2114;
        v34 = v26;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@Completed with error: %{public}@", buf, 0x16u);
      }
      uint64_t v18 = +[AMSPromise promiseWithError:v6];
    }
    else
    {
      objc_super v19 = [*(id *)(a1 + 32) purchaseInfo];
      [v19 setDidShowPaymentSheet:1];

      uint64_t v20 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v20)
      {
        uint64_t v20 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = NSString;
        uint64_t v23 = *(void *)(a1 + 40);
        uint64_t v24 = objc_opt_class();
        if (v23) {
          [v22 stringWithFormat:@"%@: [%@] ", v24, *(void *)(a1 + 40)];
        }
        else {
        v27 = [v22 stringWithFormat:@"%@: ", v24, v30];
        }
        *(_DWORD *)buf = 138543362;
        v32 = v27;
        _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Completed successfully", buf, 0xCu);
      }
      uint64_t v18 = +[AMSPromise promiseWithResult:v5];
    }
  }
  else
  {
    uint64_t v18 = +[AMSPromise promiseWithErrorCode:0 title:@"Payment Sheet Failed" message:@"Finished without a result"];
  }
  v28 = (void *)v18;

  return v28;
}

- (AKAppleIDAuthenticationContext)authenticationContext
{
  authenticationContext = self->_authenticationContext;
  if (!authenticationContext)
  {
    id v4 = [(AMSPurchaseInfo *)self->_purchaseInfo purchase];

    if (v4)
    {
      unint64_t v5 = [(AMSPurchaseInfo *)self->_purchaseInfo purchase];
      unint64_t v6 = [v5 authenticationContextForRequest:self->_request];
      int v7 = self->_authenticationContext;
      self->_authenticationContext = v6;

LABEL_4:
      authenticationContext = self->_authenticationContext;
      goto LABEL_6;
    }
    authenticationContext = self->_authenticationContext;
    if (!authenticationContext)
    {
      uint64_t v9 = +[AMSPurchase defaultAuthenticationContextForRequest:self->_request];
      unint64_t v5 = self->_authenticationContext;
      self->_authenticationContext = v9;
      goto LABEL_4;
    }
  }
LABEL_6:
  return authenticationContext;
}

- (id)_authorizePaymentWithAuthKitResults:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDE8]];
  int v7 = (void *)0x1E4F29000;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;

    if (v8)
    {
      uint64_t v9 = [(AMSPaymentSheetTask *)self state];
      uint64_t v10 = +[AMSPaymentSheetMetricsEvent dictionaryForUserAction:didBiometricsLockout:](AMSPaymentSheetMetricsEvent, "dictionaryForUserAction:didBiometricsLockout:", 6, [v9 didBiometricsLockout]);

      if (v10)
      {
        v11 = [(AMSPaymentSheetTask *)self userActions];
        [v11 addObject:v10];
      }
      id v12 = [(AMSPaymentSheetTask *)self purchaseInfo];
      uint64_t v13 = [v12 idmsTokens];

      if (!v13)
      {
        v14 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDC0]];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v15 = v14;
        }
        else {
          id v15 = 0;
        }

        v32 = [(AMSPaymentSheetTask *)self purchaseInfo];
        [v32 setIdmsTokens:v15];
      }
      __int16 v33 = [(AMSPaymentSheetTask *)self state];
      [v33 setPasswordEquivalentToken:v8];

      v34 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v34)
      {
        v34 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v35 = [v34 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v46 = v10;
        v36 = [(AMSPaymentSheetTask *)self request];
        v37 = [v36 logKey];
        v38 = NSString;
        uint64_t v39 = objc_opt_class();
        uint64_t v40 = v39;
        if (v37)
        {
          v44 = [(AMSPaymentSheetTask *)self request];
          id v3 = [v44 logKey];
          [v38 stringWithFormat:@"%@: [%@] ", v40, v3];
        }
        else
        {
          [v38 stringWithFormat:@"%@: ", v39];
        id v41 = };
        *(_DWORD *)buf = 138543362;
        v48 = v41;
        _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Payment authorized with PET from AuthKit", buf, 0xCu);
        if (v37)
        {

          id v41 = v44;
        }

        uint64_t v10 = v46;
      }

      v42 = [(AMSPaymentSheetTask *)self state];
      [v42 setDidAuthorizePayment:1];

      v31 = +[AMSPromise promiseWithResult:&unk_1EDD01678];

      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v16 = [(AMSPaymentSheetTask *)self request];
  char v17 = [v16 requiresAuthorization];

  if (v17)
  {
    uint64_t v18 = AMSError(100, @"Payment Sheet Failed", @"AuthKit authorization failed", 0);
    uint64_t v19 = +[AMSPromise promiseWithError:v18];
  }
  else
  {
    uint64_t v20 = [(AMSPaymentSheetTask *)self state];
    uint64_t v18 = +[AMSPaymentSheetMetricsEvent dictionaryForUserAction:didBiometricsLockout:](AMSPaymentSheetMetricsEvent, "dictionaryForUserAction:didBiometricsLockout:", 1, [v20 didBiometricsLockout]);

    if (v18)
    {
      uint64_t v21 = [(AMSPaymentSheetTask *)self userActions];
      [v21 addObject:v18];
    }
    v22 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v22)
    {
      v22 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [(AMSPaymentSheetTask *)self request];
      uint64_t v25 = [v24 logKey];
      v26 = NSString;
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = v27;
      if (v25)
      {
        uint64_t v45 = [(AMSPaymentSheetTask *)self request];
        int v7 = [v45 logKey];
        [v26 stringWithFormat:@"%@: [%@] ", v28, v7];
      }
      else
      {
        [v26 stringWithFormat:@"%@: ", v27];
      v29 = };
      *(_DWORD *)buf = 138543362;
      v48 = v29;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Payment authorized without authentication (confirmation only)", buf, 0xCu);
      if (v25)
      {

        v29 = v45;
      }
    }
    uint64_t v30 = [(AMSPaymentSheetTask *)self state];
    [v30 setDidAuthorizePayment:1];

    uint64_t v19 = +[AMSPromise promiseWithResult:&unk_1EDD01678];
  }
  v31 = (void *)v19;

  id v8 = 0;
LABEL_36:

  return v31;
}

- (id)_authorizePaymentWithBiometricsRequest:(id)a3 payment:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v10)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
  }
  v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = v8;
    id v12 = [(AMSPaymentSheetTask *)self request];
    uint64_t v13 = [v12 logKey];
    v14 = NSString;
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = v15;
    if (v13)
    {
      id v4 = [(AMSPaymentSheetTask *)self request];
      id v5 = [v4 logKey];
      [v14 stringWithFormat:@"%@: [%@] ", v16, v5];
    }
    else
    {
      [v14 stringWithFormat:@"%@: ", v15];
    char v17 = };
    *(_DWORD *)buf = 138543362;
    v46 = v17;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Signing biometrics challenge", buf, 0xCu);
    if (v13)
    {

      char v17 = v4;
    }

    id v8 = v39;
  }

  uint64_t v18 = [(AMSPaymentSheetTask *)self state];
  uint64_t v19 = +[AMSPaymentSheetMetricsEvent dictionaryForBiometricMatchState:didBiometricsLockout:biometricsType:](AMSPaymentSheetMetricsEvent, "dictionaryForBiometricMatchState:didBiometricsLockout:biometricsType:", 1, [v18 didBiometricsLockout], +[AMSBiometrics type](AMSBiometrics, "type"));

  if (v19)
  {
    uint64_t v20 = [(AMSPaymentSheetTask *)self userActions];
    [v20 addObject:v19];
  }
  uint64_t v21 = [(AMSPaymentSheetTask *)self request];
  v22 = [v21 biometricsRequest];
  uint64_t v23 = [v22 localAuthContext];
  uint64_t v24 = [(AMSPaymentSheetTask *)self purchaseInfo];
  [v24 setLocalAuthContext:v23];

  uint64_t v25 = [[AMSBiometricsSignatureTask alloc] initWithRequest:v9];
  v26 = [(AMSPaymentSheetTask *)self bag];
  uint64_t v27 = [(AMSBiometricsSignatureTask *)v25 request];
  [v27 setBag:v26];

  if (+[AMSBiometrics type] == 2)
  {
    uint64_t v28 = objc_alloc_init(AMSMutableBinaryPromise);
    v29 = [(AMSPaymentSheetTask *)self bag];
    uint64_t v30 = [v29 doubleForKey:@"touchIDChallengeSigningDelay"];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke;
    v42[3] = &unk_1E55A5390;
    v31 = v28;
    v43 = v31;
    [v30 valueWithCompletion:v42];
  }
  else
  {
    v31 = +[AMSBinaryPromise promiseWithSuccess];
  }
  v32 = [(AMSBiometricsSignatureTask *)v25 performSignature];
  v44[0] = v32;
  __int16 v33 = [(AMSBinaryPromise *)v31 promiseAdapter];
  v44[1] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  uint64_t v35 = +[AMSPromise promiseWithAll:v34];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke_3;
  v40[3] = &unk_1E55A53B8;
  v40[4] = self;
  id v41 = v8;
  id v36 = v8;
  v37 = [v35 continueWithBlock:v40];

  return v37;
}

void __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  double v4 = v3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke_2;
  v9[3] = &unk_1E559EA90;
  id v10 = *(id *)(a1 + 32);
  id v5 = v9;
  unint64_t v6 = AMSLogKey();
  if (v4 * 1000000000.0 <= 9.22337204e18) {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  }
  else {
    dispatch_time_t v7 = -1;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke_6;
  block[3] = &unk_1E559EAE0;
  id v12 = v6;
  id v13 = v5;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
}

uint64_t __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithSuccess];
}

id __70__AMSPaymentSheetTask__authorizePaymentWithBiometricsRequest_payment___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [a2 objectAtIndexedSubscript:0];
  objc_opt_class();
  id v10 = 0;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }

  v11 = [a1[4] state];
  [v11 setSignatureResult:v10];

  if (v8)
  {
    id v12 = AMSError(601, @"Payment Sheet Failed", @"Failed to sign challenge.", v8);
    uint64_t v13 = +[AMSPromise promiseWithError:v12];
  }
  else
  {
    v14 = [a1[4] paymentSheetPromise];
    int v15 = [v14 isFinished];

    if (v15)
    {
      uint64_t v16 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v16)
      {
        uint64_t v16 = +[AMSLogConfig sharedConfig];
      }
      char v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [a1[4] request];
        uint64_t v19 = [v18 logKey];
        uint64_t v20 = NSString;
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = v21;
        if (v19)
        {
          double v3 = [a1[4] request];
          double v4 = [v3 logKey];
          [v20 stringWithFormat:@"%@: [%@] ", v22, v4];
        }
        else
        {
          [v20 stringWithFormat:@"%@: ", v21];
        id v5 = };
        *(_DWORD *)buf = 138543362;
        v55 = v5;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Payment authorization cancelled before challenge was signed", buf, 0xCu);
        if (v19)
        {

          id v5 = v3;
        }

        uint64_t v29 = 1;
      }
      else
      {
        uint64_t v29 = 1;
      }
    }
    else
    {
      uint64_t v23 = [a1[4] state];
      [v23 setDidAuthorizePayment:1];

      uint64_t v16 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v16)
      {
        uint64_t v16 = +[AMSLogConfig sharedConfig];
      }
      char v17 = [v16 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [a1[4] request];
        uint64_t v25 = [v24 logKey];
        v26 = NSString;
        uint64_t v27 = objc_opt_class();
        uint64_t v28 = v27;
        if (v25)
        {
          double v3 = [a1[4] request];
          double v4 = [v3 logKey];
          [v26 stringWithFormat:@"%@: [%@] ", v28, v4];
        }
        else
        {
          [v26 stringWithFormat:@"%@: ", v27];
        id v5 = };
        *(_DWORD *)buf = 138543362;
        v55 = v5;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Payment authorization with signed biometrics challenge", buf, 0xCu);
        if (v25)
        {

          id v5 = v3;
        }

        uint64_t v29 = 0;
      }
      else
      {
        uint64_t v29 = 0;
      }
    }

    uint64_t v30 = [a1[5] token];
    v31 = [v30 paymentData];

    uint64_t v32 = +[AMSLogConfig sharedPurchaseConfig];
    __int16 v33 = (void *)v32;
    if (v31)
    {
      if (!v32)
      {
        __int16 v33 = +[AMSLogConfig sharedConfig];
      }
      v34 = [v33 OSLogObject];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v53 = v29;
        uint64_t v35 = [a1[4] request];
        id v36 = [v35 logKey];
        v37 = NSString;
        uint64_t v38 = objc_opt_class();
        uint64_t v39 = v38;
        if (v36)
        {
          double v4 = [a1[4] request];
          id v5 = [v4 logKey];
          [v37 stringWithFormat:@"%@: [%@] ", v39, v5];
        }
        else
        {
          [v37 stringWithFormat:@"%@: ", v38];
        uint64_t v40 = };
        *(_DWORD *)buf = 138543362;
        v55 = v40;
        _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Received biometric payment token", buf, 0xCu);
        if (v36)
        {

          uint64_t v40 = v4;
        }

        uint64_t v29 = v53;
      }

      v48 = [a1[5] token];
      uint64_t v49 = [v48 paymentData];
      __int16 v33 = [v49 base64EncodedStringWithOptions:0];

      v50 = [a1[4] state];
      [v50 setPaymentToken:v33];

      id v41 = [a1[4] purchaseInfo];
      [v41 setPaymentToken:v33];
    }
    else
    {
      if (!v32)
      {
        __int16 v33 = +[AMSLogConfig sharedConfig];
      }
      id v41 = [v33 OSLogObject];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = [a1[4] request];
        v43 = [v42 logKey];
        v44 = NSString;
        uint64_t v45 = objc_opt_class();
        uint64_t v46 = v45;
        if (v43)
        {
          a1 = [a1[4] request];
          double v4 = [a1 logKey];
          [v44 stringWithFormat:@"%@: [%@] ", v46, v4];
        }
        else
        {
          [v44 stringWithFormat:@"%@: ", v45];
        uint64_t v47 = };
        *(_DWORD *)buf = 138543362;
        v55 = v47;
        _os_log_impl(&dword_18D554000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping biometric payment token", buf, 0xCu);
        if (v43)
        {

          uint64_t v47 = a1;
        }
      }
    }

    id v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v29];
    uint64_t v13 = +[AMSPromise promiseWithResult:v12];
  }
  v51 = (void *)v13;

  return v51;
}

- (id)_metricsEvent
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = [AMSPaymentSheetMetricsEvent alloc];
  unint64_t v6 = [(AMSPaymentSheetTask *)self metricsDictionary];
  dispatch_time_t v7 = [(AMSMetricsEvent *)v5 initWithUnderlyingDictionary:v6];

  id v8 = [(AMSPaymentSheetTask *)self request];
  id v9 = [v8 biometricsRequest];

  id v10 = [(AMSPaymentSheetTask *)self state];
  int v11 = [v10 didAuthorizePayment];

  if (v9)
  {
    id v12 = [(AMSPaymentSheetTask *)self state];
    uint64_t v13 = v12;
    if (!v11)
    {
      uint64_t v20 = [v12 cancellationType];

      if (!v20)
      {
        uint64_t v21 = [(AMSPaymentSheetTask *)self state];
        [v21 setCancellationType:2];
      }
      [(AMSPaymentSheetMetricsEvent *)v7 addBiometricMatchState:3];
      uint64_t v22 = [(AMSPaymentSheetTask *)self state];
      uint64_t v23 = [v22 cancellationType];
      uint64_t v24 = [(AMSPaymentSheetTask *)self state];
      uint64_t v25 = +[AMSPaymentSheetMetricsEvent dictionaryForCancellationEvent:didBiometricsLockout:biometricsType:](AMSPaymentSheetMetricsEvent, "dictionaryForCancellationEvent:didBiometricsLockout:biometricsType:", v23, [v24 didBiometricsLockout], +[AMSBiometrics type](AMSBiometrics, "type"));

      if (v25)
      {
        v26 = [(AMSPaymentSheetTask *)self userActions];
        [v26 addObject:v25];
      }
      goto LABEL_20;
    }
    v14 = [v12 signatureResult];
    int v15 = [v14 signature];

    if (v15)
    {
      uint64_t v16 = v7;
      uint64_t v17 = 1;
    }
    else
    {
      uint64_t v35 = [(AMSPaymentSheetTask *)self state];
      id v36 = [v35 passwordEquivalentToken];

      uint64_t v16 = v7;
      if (!v36)
      {
        [(AMSPaymentSheetMetricsEvent *)v7 addBiometricMatchState:0];
        v51 = +[AMSLogConfig sharedPurchaseConfig];
        if (!v51)
        {
          v51 = +[AMSLogConfig sharedConfig];
        }
        v52 = [v51 OSLogObject];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v58 = [(AMSPaymentSheetTask *)self request];
          uint64_t v53 = [v58 logKey];
          v54 = NSString;
          uint64_t v55 = objc_opt_class();
          if (v53)
          {
            uint64_t v56 = [(AMSPaymentSheetTask *)self request];
            uint64_t v2 = [v56 logKey];
            NSStringFromSelector(a2);
            a2 = (SEL)objc_claimAutoreleasedReturnValue();
            [v54 stringWithFormat:@"%@: [%@] %@ ", v55, v2, a2];
          }
          else
          {
            uint64_t v56 = NSStringFromSelector(a2);
            [v54 stringWithFormat:@"%@: %@ ", v55, v56];
          v57 = };
          *(_DWORD *)buf = 138543362;
          v62 = v57;
          _os_log_impl(&dword_18D554000, v52, OS_LOG_TYPE_ERROR, "%{public}@Recording metrics for a successful biometric authorization that is neither Signature- nor PET-based", buf, 0xCu);
          if (v53)
          {

            v57 = (void *)v2;
          }
        }
        goto LABEL_20;
      }
      uint64_t v17 = 2;
    }
    [(AMSPaymentSheetMetricsEvent *)v16 addBiometricMatchState:v17];
LABEL_20:
    v37 = [(AMSPaymentSheetTask *)self request];
    uint64_t v38 = [v37 biometricsRequest];
    int v39 = [v38 isDualAction];

    if (!v39) {
      goto LABEL_24;
    }
    __int16 v33 = [(AMSPaymentSheetTask *)self state];
    v34 = [v33 paymentToken];
    [(AMSPaymentSheetMetricsEvent *)v7 addDualActionSuccess:v34 != 0];
    goto LABEL_22;
  }
  if ((v11 & 1) == 0)
  {
    uint64_t v27 = [(AMSPaymentSheetTask *)self state];
    uint64_t v28 = [v27 cancellationType];

    if (!v28)
    {
      uint64_t v29 = [(AMSPaymentSheetTask *)self state];
      [v29 setCancellationType:2];
    }
    uint64_t v30 = [(AMSPaymentSheetTask *)self state];
    uint64_t v31 = [v30 cancellationType];
    uint64_t v32 = [(AMSPaymentSheetTask *)self state];
    __int16 v33 = +[AMSPaymentSheetMetricsEvent dictionaryForCancellationEvent:didBiometricsLockout:biometricsType:](AMSPaymentSheetMetricsEvent, "dictionaryForCancellationEvent:didBiometricsLockout:biometricsType:", v31, [v32 didBiometricsLockout], 1);

    if (!v33) {
      goto LABEL_23;
    }
    v34 = [(AMSPaymentSheetTask *)self userActions];
    [v34 addObject:v33];
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  uint64_t v18 = [(AMSPaymentSheetTask *)self request];
  int v19 = [v18 requiresAuthorization];

  if (v19) {
    [(AMSPaymentSheetMetricsEvent *)v7 addBiometricMatchState:2];
  }
LABEL_24:
  uint64_t v40 = [(AMSPaymentSheetTask *)self purchaseInfo];
  id v41 = [v40 purchase];
  v42 = [v41 metricsOverlay];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __36__AMSPaymentSheetTask__metricsEvent__block_invoke;
  v59[3] = &unk_1E55A0958;
  v43 = v7;
  v60 = v43;
  [v42 enumerateKeysAndObjectsUsingBlock:v59];

  v44 = [(AMSPaymentSheetTask *)self request];
  [(AMSPaymentSheetMetricsEvent *)v43 addClientMetadataForPaymentSheetRequest:v44];

  uint64_t v45 = [(AMSPaymentSheetTask *)self purchaseInfo];
  uint64_t v46 = [(AMSPaymentSheetTask *)self metricsDictionary];
  [(AMSPaymentSheetMetricsEvent *)v43 addClientMetadataForPurchaseInfo:v45 metricsDictionary:v46];

  [(AMSPaymentSheetMetricsEvent *)v43 addBiometricsState:+[AMSDefaults deviceBiometricsState]];
  uint64_t v47 = [(AMSPaymentSheetTask *)self userActions];
  [(AMSPaymentSheetMetricsEvent *)v43 addUserActions:v47];

  v48 = [(AMSPaymentSheetTask *)self request];
  uint64_t v49 = [v48 account];
  [(AMSMetricsEvent *)v43 setAccount:v49];

  return v43;
}

void __36__AMSPaymentSheetTask__metricsEvent__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) setProperty:v5 forBodyKey:v6];
  }
}

- (id)_buildPaymentRequest
{
  double v3 = objc_alloc_init(AMSMutablePromise);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2050000000;
  double v4 = (void *)getPKPaymentRequestClass_softClass;
  uint64_t v22 = getPKPaymentRequestClass_softClass;
  if (!getPKPaymentRequestClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getPKPaymentRequestClass_block_invoke;
    v18[3] = &unk_1E559EC70;
    v18[4] = &v19;
    __getPKPaymentRequestClass_block_invoke((uint64_t)v18);
    double v4 = (void *)v20[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v19, 8);
  id v6 = objc_alloc_init(v5);
  dispatch_time_t v7 = objc_alloc_init(AMSPaymentRequest);
  [(AMSPaymentSheetTask *)self _configureBasicsForPaymentRequest:v6 amsPaymentRequest:v7];
  [(AMSPaymentSheetTask *)self _configureMerchantSessionForPaymentRequest:v6];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__AMSPaymentSheetTask__buildPaymentRequest__block_invoke;
  v14[3] = &unk_1E55A2280;
  v14[4] = self;
  id v15 = v6;
  uint64_t v16 = v7;
  id v8 = v3;
  uint64_t v17 = v8;
  id v9 = v7;
  id v10 = v6;
  [(AMSPaymentSheetTask *)self _configurePSD2Decoration:v10 completion:v14];
  int v11 = v17;
  id v12 = v8;

  return v12;
}

uint64_t __43__AMSPaymentSheetTask__buildPaymentRequest__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureAttachSelectedCard:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureContentItemsForPaymentRequest:*(void *)(a1 + 40) amsPaymentRequest:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _configurePaymentSummaryForPaymentRequest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _configureConfirmationScreenForPaymentRequest:*(void *)(a1 + 40) amsPaymentRequest:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _configureCustomUIForPaymentRequest:*(void *)(a1 + 40) amsPaymentRequest:*(void *)(a1 + 48)];
  uint64_t v2 = [*(id *)(a1 + 32) request];
  double v3 = [v2 performanceMetrics];
  double v4 = [*(id *)(a1 + 32) purchaseInfo];
  id v5 = [v4 purchase];
  id v6 = [v5 performanceMetricsOverlay];
  [v3 enqueueMetricsEventWithOverlay:v6];

  dispatch_time_t v7 = *(void **)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  return [v7 finishWithResult:v8];
}

- (void)_configureBasicsForPaymentRequest:(id)a3 amsPaymentRequest:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  dispatch_time_t v7 = [(AMSPaymentSheetTask *)self request];
  uint64_t v8 = [v7 biometricsRequest];
  objc_msgSend(v25, "setAccesssControlRef:", objc_msgSend(v8, "localAuthAccessControlRef"));

  id v9 = [(AMSPaymentSheetTask *)self request];
  uint64_t v10 = [v9 biometricsRequest];
  int v11 = [(id)v10 localAuthContext];
  id v12 = [v11 externalizedContext];

  uint64_t v13 = [(AMSPaymentSheetTask *)self request];
  LOBYTE(v10) = [v13 requiresAuthorization];

  if ((v10 & 1) != 0 || v12)
  {
    v14 = [(AMSPaymentSheetTask *)self authenticationContext];
    [v25 setAppleIDAuthenticationContext:v14];
  }
  [v25 setExternalizedContext:v12];
  [v25 setRequestType:1];
  id v15 = [(AMSPaymentSheetTask *)self request];
  uint64_t v16 = [v15 currencyCode];
  [v25 setCurrencyCode:v16];

  uint64_t v17 = [(AMSPaymentSheetTask *)self request];
  LODWORD(v16) = [v17 disablePasscodeFallback];

  if (v16) {
    [v25 setDisablePasscodeFallback:1];
  }
  uint64_t v18 = [(AMSPaymentSheetTask *)self request];
  uint64_t v19 = [v18 countryCode];
  AMSSetCountryCodeOnPaymentRequest(v19, v25);

  uint64_t v20 = [(AMSPaymentSheetTask *)self request];
  uint64_t v21 = [v20 titleType];

  if (v21 == 2)
  {
    [v25 setRequestor:0];
  }
  else
  {
    uint64_t v22 = [(AMSPaymentSheetTask *)self request];
    if ([v22 titleType])
    {
      [v6 setLocalizedNavigationTitle:0];
    }
    else
    {
      uint64_t v23 = [(AMSPaymentSheetTask *)self request];
      uint64_t v24 = [v23 title];
      [v6 setLocalizedNavigationTitle:v24];
    }
  }
}

- (void)_configureConfirmationScreenForPaymentRequest:(id)a3 amsPaymentRequest:(id)a4
{
  id v5 = a3;
  id v6 = [(AMSPaymentSheetTask *)self request];
  objc_msgSend(v5, "setConfirmationStyle:", objc_msgSend(v6, "ams_confirmationStyle"));
}

- (void)_configureMerchantSessionForPaymentRequest:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AMSPaymentSheetTask *)self request];
  id v6 = [v5 merchantSession];

  if (v6)
  {
    dispatch_time_t v7 = [(AMSPaymentSheetTask *)self request];
    uint64_t v8 = [v7 biometricsRequest];
    uint64_t v9 = [v8 localAuthAccessControlRef];

    uint64_t v10 = [(AMSPaymentSheetTask *)self bag];
    LODWORD(v8) = +[AMSCardEnrollment shouldUseApplePayClassicWithBag:v10];

    if (v8)
    {
      uint64_t v11 = 4;
    }
    else
    {
      uint64_t v18 = [(AMSPaymentSheetTask *)self bag];
      BOOL v19 = +[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:v18];

      if (!v19)
      {
LABEL_25:
        id v12 = +[AMSBiometrics ACLVersionForAccessControl:v9];
        uint64_t v38 = +[AMSLogConfig sharedPurchaseConfig];
        if (!v38)
        {
          uint64_t v38 = +[AMSLogConfig sharedConfig];
        }
        int v39 = [v38 OSLogObject];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = objc_opt_class();
          id v41 = v40;
          v42 = [(AMSPaymentSheetTask *)self request];
          v43 = [v42 logKey];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v40;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v43;
          *(_WORD *)&buf[22] = 2114;
          v54 = v12;
          _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dual-action buy for insufficient ACL version: %{public}@", buf, 0x20u);
        }
        goto LABEL_30;
      }
      uint64_t v11 = 3;
    }
    if (+[AMSBiometrics isActionSupported:v11 withAccessControl:v9])
    {
      uint64_t v49 = 0;
      v50 = &v49;
      uint64_t v51 = 0x2050000000;
      uint64_t v20 = (void *)getPKPaymentMerchantSessionClass_softClass;
      uint64_t v52 = getPKPaymentMerchantSessionClass_softClass;
      if (!getPKPaymentMerchantSessionClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getPKPaymentMerchantSessionClass_block_invoke_0;
        v54 = &unk_1E559EC70;
        uint64_t v55 = &v49;
        __getPKPaymentMerchantSessionClass_block_invoke_0((uint64_t)buf);
        uint64_t v20 = (void *)v50[3];
      }
      uint64_t v21 = v20;
      _Block_object_dispose(&v49, 8);
      id v22 = [v21 alloc];
      id v12 = objc_msgSend(v22, "initWithDictionary:", v6, v49);
      uint64_t v23 = +[AMSLogConfig sharedPurchaseConfig];
      uint64_t v24 = (void *)v23;
      if (v12)
      {
        if (!v23)
        {
          uint64_t v24 = +[AMSLogConfig sharedConfig];
        }
        id v25 = [v24 OSLogObject];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_opt_class();
          id v27 = v26;
          uint64_t v28 = [(AMSPaymentSheetTask *)self request];
          uint64_t v29 = [v28 logKey];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v26;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v29;
          _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attaching merchant session", buf, 0x16u);
        }
        [v4 setMerchantSession:v12];
        [v4 setMerchantCapabilities:13];
        uint64_t v30 = [(AMSPaymentSheetTask *)self request];
        int v31 = [v30 isApplePayClassic];

        if (v31)
        {
          uint64_t v32 = +[AMSLogConfig sharedPurchaseConfig];
          if (!v32)
          {
            uint64_t v32 = +[AMSLogConfig sharedConfig];
          }
          __int16 v33 = [v32 OSLogObject];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = objc_opt_class();
            id v35 = v34;
            id v36 = [(AMSPaymentSheetTask *)self request];
            v37 = [v36 logKey];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v34;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v37;
            _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Setting apple-pay-classic flag", buf, 0x16u);
          }
          [v4 setRequestType:0];
        }
      }
      else
      {
        if (!v23)
        {
          uint64_t v24 = +[AMSLogConfig sharedConfig];
        }
        v44 = [v24 OSLogObject];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          uint64_t v45 = objc_opt_class();
          id v46 = v45;
          uint64_t v47 = [(AMSPaymentSheetTask *)self request];
          v48 = [v47 logKey];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v45;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v48;
          _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to instantiate PKPaymentMerchantSession object", buf, 0x16u);
        }
        id v12 = 0;
      }
      goto LABEL_30;
    }
    goto LABEL_25;
  }
  id v12 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v12)
  {
    id v12 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_opt_class();
    id v15 = v14;
    uint64_t v16 = [(AMSPaymentSheetTask *)self request];
    uint64_t v17 = [v16 logKey];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v17;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping dual-action buy for no merchant session", buf, 0x16u);
  }
LABEL_30:
}

- (void)_configureAttachSelectedCard:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AMSPaymentSheetTask *)self request];
  id v6 = [v5 selectedCard];

  if (v6)
  {
    dispatch_time_t v7 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v7)
    {
      dispatch_time_t v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = v9;
      uint64_t v11 = [(AMSPaymentSheetTask *)self request];
      id v12 = [v11 logKey];
      int v19 = 138543618;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      id v22 = v12;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attaching selected card info", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v13 = [(AMSPaymentSheetTask *)self request];
    v14 = [v13 selectedCard];
    id v15 = [v14 passSerialNumber];
    [v4 setPassSerialNumber:v15];

    uint64_t v16 = [(AMSPaymentSheetTask *)self request];
    uint64_t v17 = [v16 selectedCard];
    uint64_t v18 = [v17 passTypeIdentifier];
    [v4 setPassTypeIdentifier:v18];

    [v4 setRequestType:1];
    [v4 setAPIType:0];
  }
}

- (void)_configurePSD2Decoration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  dispatch_time_t v7 = (void (**)(void))a4;
  uint64_t v8 = [(AMSPaymentSheetTask *)self request];
  int v9 = [v8 isApplePayClassic];

  if (v9)
  {
    id v10 = [(AMSPaymentSheetTask *)self bag];
    uint64_t v11 = [v10 stringForKey:@"countryCode"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__AMSPaymentSheetTask__configurePSD2Decoration_completion___block_invoke;
    v12[3] = &unk_1E55A5408;
    v12[4] = self;
    id v13 = v6;
    v14 = v7;
    [v11 valueWithCompletion:v12];
  }
  else
  {
    v7[2](v7);
  }
}

void __59__AMSPaymentSheetTask__configurePSD2Decoration_completion___block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    int v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      id v11 = a1[4];
      id v12 = v10;
      id v13 = [v11 request];
      v14 = [v13 logKey];
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = v10;
      __int16 v25 = 2114;
      v26 = v14;
      __int16 v27 = 2114;
      uint64_t v28 = @"countryCode";
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to lookup bag key '%{public}@' for dual-action buy", buf, 0x20u);
    }
  }
  if (v6)
  {
    id v15 = [v6 uppercaseString];
    uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
    [a1[5] setSupportedCountries:v16];
  }
  uint64_t v17 = [a1[4] bag];
  uint64_t v18 = [v17 arrayForKey:@"apple-pay-classic-networks"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__AMSPaymentSheetTask__configurePSD2Decoration_completion___block_invoke_256;
  v20[3] = &unk_1E55A53E0;
  id v19 = a1[5];
  v20[4] = a1[4];
  id v21 = v19;
  id v22 = a1[6];
  [v18 valueWithCompletion:v20];
}

void __59__AMSPaymentSheetTask__configurePSD2Decoration_completion___block_invoke_256(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    int v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      id v11 = *(void **)(a1 + 32);
      id v12 = v10;
      id v13 = [v11 request];
      v14 = [v13 logKey];
      int v15 = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      uint64_t v20 = @"apple-pay-classic-networks";
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to lookup bag key '%{public}@' for dual-action buy", (uint8_t *)&v15, 0x20u);
    }
  }
  if (v6) {
    [*(id *)(a1 + 40) setSupportedNetworks:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_configureCustomUIForPaymentRequest:(id)a3 amsPaymentRequest:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AMSPaymentSheetTask *)self request];
  int v9 = [v8 designVersion];
  int v10 = [v9 isEqualToNumber:&unk_1EDD01660];

  if (v10)
  {
    [v6 setClientViewSourceIdentifier:@"AMSUIPaymentSheetViewProvider"];
    id v37 = 0;
    id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v37];
    id v12 = v37;
    if (v12)
    {
      id v13 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v13)
      {
        id v13 = +[AMSLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = [(AMSPaymentSheetTask *)self request];
        __int16 v17 = [v16 logKey];
        *(_DWORD *)buf = 138543874;
        uint64_t v43 = v15;
        __int16 v44 = 2114;
        uint64_t v45 = v17;
        __int16 v46 = 2114;
        uint64_t v47 = v12;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to serialize payment request: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      if (!v11)
      {
LABEL_18:

        goto LABEL_19;
      }
      id v35 = v11;
      id v32 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v40[0] = @"AMSPaymentSheetPaymentRequestMetadataKeyPayee";
      uint64_t v18 = (void *)MEMORY[0x1E4F28ED0];
      v34 = [(AMSPaymentSheetTask *)self request];
      __int16 v33 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v34, "payee"));
      v41[0] = v33;
      v40[1] = @"AMSPaymentSheetPaymentRequestMetadataKeyDesignVersion";
      __int16 v19 = [(AMSPaymentSheetTask *)self request];
      uint64_t v20 = [v19 designVersion];
      v41[1] = v20;
      v40[2] = @"AMSPaymentSheetPaymentRequestMetadataKeySalableIconType";
      uint64_t v21 = (void *)MEMORY[0x1E4F28ED0];
      id v22 = [(AMSPaymentSheetTask *)self request];
      uint64_t v23 = objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "salableIcon"));
      v41[2] = v23;
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
      id v13 = (void *)[v32 initWithDictionary:v24];

      id v36 = 0;
      __int16 v25 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v36];
      v14 = v36;
      if (v14)
      {
        v26 = +[AMSLogConfig sharedPurchaseConfig];
        if (!v26)
        {
          v26 = +[AMSLogConfig sharedConfig];
        }
        __int16 v27 = [v26 OSLogObject];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = objc_opt_class();
          uint64_t v29 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          uint64_t v43 = v28;
          __int16 v44 = 2114;
          uint64_t v45 = v29;
          __int16 v46 = 2114;
          uint64_t v47 = v14;
          _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to serialize payment request metadata: %{public}@", buf, 0x20u);
        }
      }
      else if (v25)
      {
        [v13 setObject:v25 forKeyedSubscript:@"AMSPaymentSheetPaymentRequestMetadataKeyRequestData"];
      }
      id v11 = v35;
      v38[0] = @"AMSPaymentSheetPaymentRequest";
      v38[1] = @"AMSPaymentSheetPaymentRequestMetadata";
      v39[0] = v35;
      uint64_t v30 = (void *)[v13 copy];
      v39[1] = v30;
      int v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
      [v6 setClientViewSourceParameter:v31];
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_configurePaymentSummaryForPaymentRequest:(id)a3
{
  id v19 = a3;
  id v4 = [(AMSPaymentSheetTask *)self request];
  id v5 = [(AMSPaymentSheetTask *)self assetCache];
  id v6 = [(AMSPaymentSheetTask *)self bag];
  id v7 = objc_msgSend(v4, "ams_createSummaryItemsForAttributedListWithAssetCache:bag:", v5, v6);

  if ([v7 count])
  {
    [v19 setPaymentSummaryItems:v7];
    [v19 setPaymentSummaryPinned:1];
    [v19 setSuppressTotal:1];
    goto LABEL_10;
  }
  uint64_t v8 = [(AMSPaymentSheetTask *)self request];
  int v9 = objc_msgSend(v8, "ams_createSummaryItems");

  [v19 setPaymentSummaryItems:v9];
  int v10 = [(AMSPaymentSheetTask *)self request];
  uint64_t v11 = [v10 paymentSummary];
  if (!v11) {
    goto LABEL_6;
  }
  id v12 = (void *)v11;
  id v13 = [(AMSPaymentSheetTask *)self request];
  v14 = [v13 priceSectionItems];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    int v10 = [(AMSPaymentSheetTask *)self request];
    uint64_t v16 = [v10 paymentSummary];
    [v19 setLocalizedSummaryItemsTitle:v16];

LABEL_6:
  }
  __int16 v17 = [(AMSPaymentSheetTask *)self request];
  uint64_t v18 = [v17 price];

  if (!v18) {
    [v19 setSuppressTotal:1];
  }

LABEL_10:
}

- (void)_configureContentItemsForPaymentRequest:(id)a3 amsPaymentRequest:(id)a4
{
  id v78 = a3;
  id v6 = a4;
  id v7 = [(AMSPaymentSheetTask *)self request];
  objc_msgSend(v6, "setDrawBackground:", objc_msgSend(v7, "drawBackground"));

  uint64_t v8 = [(AMSPaymentSheetTask *)self request];
  objc_msgSend(v6, "setDrawBottomDivider:", objc_msgSend(v8, "drawBottomDivider"));

  int v9 = objc_opt_new();
  int v10 = v6;
  uint64_t v11 = objc_opt_new();
  id v12 = [(AMSPaymentSheetTask *)self request];
  id v13 = [(AMSPaymentSheetTask *)self assetCache];
  v14 = [(AMSPaymentSheetTask *)self request];
  uint64_t v15 = [v14 designVersion];
  uint64_t v16 = [(AMSPaymentSheetTask *)self bag];
  uint64_t v17 = objc_msgSend(v12, "ams_createAMSContentItemForSalableInfoWithAssetCache:designVersion:bag:", v13, v15, v16);

  v74 = (void *)v17;
  [v10 setSalableInfo:v17];
  uint64_t v18 = [(AMSPaymentSheetTask *)self request];
  id v19 = [(AMSPaymentSheetTask *)self assetCache];
  uint64_t v20 = [(AMSPaymentSheetTask *)self request];
  uint64_t v21 = [v20 designVersion];
  id v22 = [(AMSPaymentSheetTask *)self bag];
  uint64_t v23 = objc_msgSend(v18, "ams_createAMSContentItemsForPreScreenDialogWithAssetCache:designVersion:bag:", v19, v21, v22);

  if ([v23 count]) {
    [v11 addObjectsFromArray:v23];
  }
  v77 = v23;
  uint64_t v24 = [(AMSPaymentSheetTask *)self request];
  __int16 v25 = objc_msgSend(v24, "ams_createAMSContentItemForRating");
  objc_msgSend(v11, "ams_addNullableObject:", v25);

  v26 = [(AMSPaymentSheetTask *)self request];
  __int16 v27 = [(AMSPaymentSheetTask *)self assetCache];
  uint64_t v28 = [(AMSPaymentSheetTask *)self request];
  uint64_t v29 = [v28 designVersion];
  uint64_t v30 = [(AMSPaymentSheetTask *)self bag];
  int v31 = objc_msgSend(v26, "ams_createAMSContentItemsForFlexibleListWithAssetCache:designVersion:bag:", v27, v29, v30);

  if ([v31 count]) {
    [v11 addObjectsFromArray:v31];
  }
  v75 = v11;
  v76 = v31;
  id v32 = [(AMSPaymentSheetTask *)self request];
  __int16 v33 = [(AMSPaymentSheetTask *)self assetCache];
  v34 = [(AMSPaymentSheetTask *)self request];
  id v35 = [v34 designVersion];
  id v36 = [(AMSPaymentSheetTask *)self bag];
  uint64_t v37 = objc_msgSend(v32, "ams_createContentItemForSalableInfoWithAssetCache:designVersion:bag:", v33, v35, v36);

  v73 = (void *)v37;
  objc_msgSend(v9, "ams_addNullableObject:", v37);
  uint64_t v38 = [(AMSPaymentSheetTask *)self request];
  int v39 = [(AMSPaymentSheetTask *)self assetCache];
  uint64_t v40 = [(AMSPaymentSheetTask *)self request];
  id v41 = [v40 designVersion];
  v42 = [(AMSPaymentSheetTask *)self bag];
  uint64_t v43 = objc_msgSend(v38, "ams_createContentItemsForPreScreenDialogWithAssetCache:designVersion:bag:", v39, v41, v42);

  if ([v43 count]) {
    [v9 addObjectsFromArray:v43];
  }
  __int16 v44 = [(AMSPaymentSheetTask *)self request];
  uint64_t v45 = objc_msgSend(v44, "ams_createContentItemForRating");
  objc_msgSend(v9, "ams_addNullableObject:", v45);

  __int16 v46 = [(AMSPaymentSheetTask *)self request];
  uint64_t v47 = [(AMSPaymentSheetTask *)self assetCache];
  uint64_t v48 = [(AMSPaymentSheetTask *)self request];
  uint64_t v49 = [v48 designVersion];
  v50 = [(AMSPaymentSheetTask *)self bag];
  uint64_t v51 = objc_msgSend(v46, "ams_createContentItemsForFlexibleListWithAssetCache:designVersion:bag:", v47, v49, v50);

  if ([v51 count]) {
    [v9 addObjectsFromArray:v51];
  }
  uint64_t v52 = [(AMSPaymentSheetTask *)self request];
  int v53 = [v52 isDesignVersionLessThan:&unk_1EDD01660];

  uint64_t v55 = v76;
  v54 = v77;
  if (v53)
  {
    uint64_t v56 = [(AMSPaymentSheetTask *)self request];
    v57 = objc_msgSend(v56, "ams_createContentItemForAccount");

    objc_msgSend(v9, "ams_addNullableObject:", v57);
  }
  v58 = [(AMSPaymentSheetTask *)self request];
  int v59 = [v58 isDesignVersionEqualOrGreaterThan:&unk_1EDD01660];

  if (v59)
  {
    v72 = v10;
    v60 = [(AMSPaymentSheetTask *)self request];
    v61 = [(AMSPaymentSheetTask *)self assetCache];
    v62 = [(AMSPaymentSheetTask *)self request];
    uint64_t v63 = [v62 designVersion];
    v64 = [(AMSPaymentSheetTask *)self bag];
    v65 = objc_msgSend(v60, "ams_createSecondaryContentItemForSalableInfoWithAssetCache:designVersion:bag:", v61, v63, v64);

    if (v65) {
      [v72 setSecondarySalableInfo:v65];
    }
    v66 = [(AMSPaymentSheetTask *)self request];
    v67 = [(AMSPaymentSheetTask *)self assetCache];
    v68 = [(AMSPaymentSheetTask *)self request];
    v69 = [v68 designVersion];
    v70 = [(AMSPaymentSheetTask *)self bag];
    v71 = objc_msgSend(v66, "ams_createSecondaryContentItemsForFlexibleListWithAssetCache:designVersion:bag:", v67, v69, v70);

    int v10 = v72;
    if ([v71 count]) {
      [v72 setSecondaryContentItems:v71];
    }

    uint64_t v55 = v76;
    v54 = v77;
  }
  [v78 setPaymentContentItems:v9];
  [v10 setPaymentContentItems:v75];
}

- (void)_dismissPaymentAuthorizationController:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(AMSPaymentSheetTask *)self request];
  id v7 = [v6 logKey];

  uint64_t v8 = +[AMSLogConfig sharedPurchaseConfig];
  int v9 = (void *)v8;
  if (v5)
  {
    if (!v8)
    {
      int v9 = +[AMSLogConfig sharedConfig];
    }
    int v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = NSStringFromSelector(a2);
      v14 = (void *)v13;
      if (v7) {
        [v11 stringWithFormat:@"%@: [%@] %@ ", v12, v7, v13];
      }
      else {
      uint64_t v20 = [v11 stringWithFormat:@"%@: %@ ", v12, v13, v28];
      }
      uint64_t v21 = AMSHashIfNeeded(v5);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Dismissing authorization controller: %{public}@", buf, 0x16u);
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke;
    v29[3] = &unk_1E55A3F18;
    v29[4] = self;
    SEL v32 = a2;
    id v30 = v5;
    id v31 = v7;
    id v22 = v29;
    uint64_t v23 = AMSLogKey();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_6;
    v34 = &unk_1E559EAE0;
    id v35 = v23;
    id v36 = v22;
    id v24 = v23;
    dispatch_async(MEMORY[0x1E4F14428], buf);
  }
  else
  {
    if (!v8)
    {
      int v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v9 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = NSString;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = NSStringFromSelector(a2);
      id v19 = (void *)v18;
      if (v7) {
        [v16 stringWithFormat:@"%@: [%@] %@ ", v17, v7, v18];
      }
      else {
      __int16 v25 = [v16 stringWithFormat:@"%@: %@ ", v17, v18, v28];
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@Attempting to dismiss nil controller", buf, 0xCu);
    }
    v26 = AMSError(509, @"Authorization Controller Missing", @"We attempted to dismiss a nil controller.", 0);
    __int16 v27 = [(AMSPaymentSheetTask *)self paymentSheetPromise];
    [v27 finishWithError:v26];
  }
}

void __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [AMSDeallocGuard alloc];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_2;
  v22[3] = &unk_1E55A1998;
  uint64_t v3 = *(void *)(a1 + 56);
  v22[4] = *(void *)(a1 + 32);
  v22[5] = v3;
  id v4 = [(AMSDeallocGuard *)v2 initWithDeallocGuardBlock:v22];
  id v5 = [[AMSMutablePromise alloc] initWithTimeout:3.0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_273;
  v15[3] = &unk_1E55A4830;
  id v6 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(a1 + 40);
  id v16 = v7;
  uint64_t v17 = v8;
  uint64_t v21 = *(void *)(a1 + 56);
  id v18 = v9;
  id v19 = v4;
  uint64_t v20 = v5;
  int v10 = v5;
  uint64_t v11 = v4;
  [v6 dismissWithCompletion:v15];
  uint64_t v12 = [*(id *)(a1 + 32) paymentSheetPromise];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_276;
  v14[3] = &unk_1E55A5430;
  v14[4] = *(void *)(a1 + 32);
  uint64_t v13 = [(AMSMutablePromise *)v10 continueWithBlock:v14];
  [v12 finishWithPromise:v13];

  [*(id *)(a1 + 40) setDelegate:0];
  [*(id *)(a1 + 32) setPaymentAuthorizationController:0];
}

void __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[AMSUnitTests isRunningUnitTests];
  uint64_t v3 = +[AMSLogConfig sharedPurchaseConfig];
  id v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = AMSLogKey();
      id v7 = NSString;
      uint64_t v8 = objc_opt_class();
      if (v6)
      {
        int v9 = AMSLogKey();
        a1 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v7 stringWithFormat:@"%@: [%@] %@ ", v8, v9, a1];
      }
      else
      {
        int v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v7 stringWithFormat:@"%@: %@ ", v8, v9];
      int v10 = };
      *(_DWORD *)buf = 138543362;
      id v18 = v10;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v6)
      {

        int v10 = (void *)a1;
      }
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = +[AMSLogConfig sharedPurchaseConfig];
    [v4 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v11 userInfo:0];
  }
  else
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v4 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = AMSLogKey();
      uint64_t v13 = NSString;
      uint64_t v14 = objc_opt_class();
      if (v12)
      {
        uint64_t v15 = AMSLogKey();
        a1 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v13 stringWithFormat:@"%@: [%@] %@ ", v14, v15, a1];
      }
      else
      {
        uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v13 stringWithFormat:@"%@: %@ ", v14, v15];
      id v16 = };
      *(_DWORD *)buf = 138543362;
      id v18 = v16;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_FAULT, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v12)
      {

        id v16 = (void *)a1;
      }
    }
  }
}

uint64_t __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_273(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v2)
  {
    BOOL v2 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSString;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_opt_class();
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 72));
      [v4 stringWithFormat:@"%@: [%@] %@ ", v6, v7, v8];
    }
    else
    {
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 72));
      [v4 stringWithFormat:@"%@: %@ ", v6, v8, v13];
    int v9 = };
    int v10 = NSStringFromSelector(sel_dismissWithCompletion_);
    uint64_t v11 = AMSHashIfNeeded(*(void **)(a1 + 48));
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@Received %{public}@ callback from %{public}@", buf, 0x20u);
  }
  [*(id *)(a1 + 56) invalidate];
  [*(id *)(a1 + 64) finishWithResult:MEMORY[0x1E4F1CC38]];
  return [*(id *)(a1 + 40) _didDismissPaymentAuthorizationController:*(void *)(a1 + 48)];
}

id __62__AMSPaymentSheetTask__dismissPaymentAuthorizationController___block_invoke_276(uint64_t a1)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  BOOL v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = [v2 error];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) state];
    int v5 = [v4 didAuthorizePayment];

    if (v5)
    {
      uint64_t v3 = objc_alloc_init(AMSPaymentSheetResult);
      uint64_t v6 = [*(id *)(a1 + 32) state];
      uint64_t v7 = [v6 passwordEquivalentToken];
      [(AMSPaymentSheetResult *)v3 setPasswordEquivalentToken:v7];

      uint64_t v8 = [*(id *)(a1 + 32) state];
      int v9 = [v8 signatureResult];
      [(AMSPaymentSheetResult *)v3 setSignatureResult:v9];

LABEL_9:
      uint64_t v20 = +[AMSPromise promiseWithResult:v3];
      goto LABEL_13;
    }
  }
  int v10 = [*(id *)(a1 + 32) state];
  uint64_t v11 = [v10 cancellationType];

  if (v11)
  {
    __int16 v25 = @"AMSCancellationType";
    uint64_t v12 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v13 = [*(id *)(a1 + 32) state];
    uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "cancellationType"));
    v26[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    __int16 v16 = (void *)[v15 mutableCopy];

    uint64_t v17 = [*(id *)(a1 + 32) state];
    uint64_t v18 = [v17 cancellationType];
    if ((unint64_t)(v18 - 1) > 4) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = off_1E55A54D0[v18 - 1];
    }
    [v16 setObject:v19 forKeyedSubscript:@"AMSCancellationReason"];

    uint64_t v21 = (void *)[v16 copy];
    uint64_t v22 = AMSErrorWithUserInfo(6, @"Payment Sheet Failed", @"The payment sheet was cancelled by the user.", v21, 0);

    uint64_t v3 = (AMSPaymentSheetResult *)v22;
    if (!v22) {
      goto LABEL_9;
    }
  }
  else if (!v3)
  {
    AMSError(6, @"Payment Sheet Failed", @"Payment sheet dismissed with neither an error nor a result", 0);
    uint64_t v3 = (AMSPaymentSheetResult *)objc_claimAutoreleasedReturnValue();
    if (!v3) {
      goto LABEL_9;
    }
  }
  uint64_t v20 = +[AMSPromise promiseWithError:v3];
LABEL_13:
  uint64_t v23 = (void *)v20;

  return v23;
}

- (void)_presentPaymentConfirmationWithPaymentRequest:(id)a3 purchaseResult:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v5 = [(AMSPaymentSheetTask *)self request];
  uint64_t v6 = [v5 logKey];

  uint64_t v7 = [(AMSPaymentSheetTask *)self request];
  if ([v7 requiresAuthorization])
  {
  }
  else
  {
    uint64_t v8 = [(AMSPaymentSheetTask *)self request];
    int v9 = [v8 requiresDelegateAuthentication];

    if (!v9) {
      goto LABEL_9;
    }
  }
  int v10 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v10)
  {
    int v10 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138543618;
    uint64_t v16 = objc_opt_class();
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to present payment presentation confirmation for request that is not confirmation only.", (uint8_t *)&v15, 0x16u);
  }

LABEL_9:
  uint64_t v12 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v12)
  {
    uint64_t v12 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = objc_opt_class();
    int v15 = 138543618;
    uint64_t v16 = v14;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Platform not supported", (uint8_t *)&v15, 0x16u);
  }
}

- (void)_presentCompanionAuthenticationSheetWithPaymentRequest:(id)a3 purchaseResult:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v5 = [(AMSPaymentSheetTask *)self request];
  uint64_t v6 = [v5 logKey];

  uint64_t v7 = objc_alloc_init(AMSMutablePromise);
  uint64_t v8 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v8)
  {
    uint64_t v8 = +[AMSLogConfig sharedConfig];
  }
  int v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = objc_opt_class();
    __int16 v15 = 2114;
    uint64_t v16 = v6;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Platform not supported", buf, 0x16u);
  }

  int v10 = AMSError(5, @"Companion Auth Error", @"Platform not supported", 0);
  [(AMSMutablePromise *)v7 finishWithError:v10];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__AMSPaymentSheetTask__presentCompanionAuthenticationSheetWithPaymentRequest_purchaseResult___block_invoke;
  v12[3] = &unk_1E55A5458;
  v12[4] = self;
  [(AMSPromise *)v7 addSuccessBlock:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__AMSPaymentSheetTask__presentCompanionAuthenticationSheetWithPaymentRequest_purchaseResult___block_invoke_2;
  v11[3] = &unk_1E559F028;
  v11[4] = self;
  [(AMSPromise *)v7 addErrorBlock:v11];
}

void __93__AMSPaymentSheetTask__presentCompanionAuthenticationSheetWithPaymentRequest_purchaseResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = objc_alloc_init(AMSPaymentSheetResult);
  id v4 = [v3 token];

  [(AMSPaymentSheetResult *)v6 setDelegateAuthenticateToken:v4];
  int v5 = [*(id *)(a1 + 32) paymentSheetPromise];
  [v5 finishWithResult:v6];
}

void __93__AMSPaymentSheetTask__presentCompanionAuthenticationSheetWithPaymentRequest_purchaseResult___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 paymentSheetPromise];
  [v4 finishWithError:v3];
}

- (id)_presentPaymentSheetWithPaymentRequest:(id)a3
{
  id v4 = a3;
  int v5 = objc_alloc_init(AMSMutableBinaryPromise);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__AMSPaymentSheetTask__presentPaymentSheetWithPaymentRequest___block_invoke;
  v13[3] = &unk_1E55A22D0;
  id v14 = v4;
  uint64_t v6 = v5;
  __int16 v15 = v6;
  uint64_t v16 = self;
  uint64_t v7 = v13;
  id v8 = v4;
  int v9 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_6;
  block[3] = &unk_1E559EAE0;
  id v18 = v9;
  id v19 = v7;
  id v10 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);

  uint64_t v11 = v6;
  return v11;
}

void __62__AMSPaymentSheetTask__presentPaymentSheetWithPaymentRequest___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2050000000;
  BOOL v2 = (void *)_MergedGlobals_1_15;
  uint64_t v16 = _MergedGlobals_1_15;
  if (!_MergedGlobals_1_15)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getPKPaymentAuthorizationControllerClass_block_invoke;
    v12[3] = &unk_1E559EC70;
    v12[4] = &v13;
    __getPKPaymentAuthorizationControllerClass_block_invoke((uint64_t)v12);
    BOOL v2 = (void *)v14[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v13, 8);
  id v4 = (void *)[[v3 alloc] initWithPaymentRequest:*(void *)(a1 + 32)];
  int v5 = v4;
  if (v4)
  {
    [v4 setDelegate:*(void *)(a1 + 48)];
    [v5 setPrivateDelegate:*(void *)(a1 + 48)];
    [*(id *)(a1 + 48) setPaymentAuthorizationController:v5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__AMSPaymentSheetTask__presentPaymentSheetWithPaymentRequest___block_invoke_2;
    v10[3] = &unk_1E55A0A18;
    int8x16_t v9 = *(int8x16_t *)(a1 + 40);
    id v6 = (id)v9.i64[0];
    int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
    [v5 presentWithCompletion:v10];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = AMSError(0, @"Payment Sheet Failed", @"Unable to create authorization controller", 0);
    [v7 finishWithError:v8];
  }
}

void __62__AMSPaymentSheetTask__presentPaymentSheetWithPaymentRequest___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    int v5 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v5)
    {
      int v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 32) request];
      id v8 = [v7 logKey];
      int8x16_t v9 = NSString;
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = v10;
      if (v8)
      {
        BOOL v2 = [*(id *)(a1 + 32) request];
        id v3 = [v2 logKey];
        [v9 stringWithFormat:@"%@: [%@] ", v11, v3];
      }
      else
      {
        [v9 stringWithFormat:@"%@: ", v10];
      uint64_t v12 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v12;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Payment sheet has presented", buf, 0xCu);
      if (v8)
      {

        uint64_t v12 = v2;
      }
    }
    [*(id *)(a1 + 40) finishWithSuccess];
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 32) state];
    [v13 setCancellationType:101];

    id v14 = *(void **)(a1 + 40);
    AMSError(10, @"Payment Sheet Failed", @"Presentation failed", 0);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithError:");
  }
}

+ (BOOL)_shouldCompanionAuthFallbackToPasswordForError:(id)a3
{
  return 0;
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(AMSMutablePromise);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __82__AMSPaymentSheetTask_paymentAuthorizationController_didAuthorizePayment_handler___block_invoke;
  v37[3] = &unk_1E559F028;
  v37[4] = self;
  [(AMSPromise *)v10 addErrorBlock:v37];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __82__AMSPaymentSheetTask_paymentAuthorizationController_didAuthorizePayment_handler___block_invoke_296;
  v35[3] = &unk_1E55A0338;
  id v11 = v9;
  id v36 = v11;
  [(AMSPromise *)v10 addFinishBlock:v35];
  uint64_t v12 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v12)
  {
    uint64_t v12 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = v11;
    __int16 v33 = [(AMSPaymentSheetTask *)self request];
    id v14 = [v33 logKey];
    id v15 = NSString;
    uint64_t v16 = objc_opt_class();
    if (v14)
    {
      uint64_t v17 = [(AMSPaymentSheetTask *)self request];
      uint64_t v18 = [v17 logKey];
      id v19 = a2;
      id v20 = v8;
      uint64_t v21 = v18;
      id v31 = NSStringFromSelector(v19);
      SEL v32 = (void *)v21;
      uint64_t v30 = v21;
      id v8 = v20;
      [v15 stringWithFormat:@"%@: [%@] %@ ", v16, v30, v31];
    }
    else
    {
      uint64_t v17 = NSStringFromSelector(a2);
      [v15 stringWithFormat:@"%@: %@ ", v16, v17];
    uint64_t v22 = };
    *(_DWORD *)buf = 138543362;
    int v39 = v22;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Authorizing payment…", buf, 0xCu);
    id v11 = v34;
    if (v14)
    {

      uint64_t v22 = v32;
    }
  }
  uint64_t v23 = [v8 authKitAuthenticationResults];

  if (v23)
  {
    id v24 = [v8 authKitAuthenticationResults];
    __int16 v25 = [(AMSPaymentSheetTask *)self _authorizePaymentWithAuthKitResults:v24];
    [(AMSMutablePromise *)v10 finishWithPromise:v25];
  }
  else
  {
    v26 = [(AMSPaymentSheetTask *)self request];
    __int16 v27 = [v26 biometricsRequest];

    if (v27)
    {
      id v24 = [(AMSPaymentSheetTask *)self request];
      uint64_t v28 = [v24 biometricsRequest];
      uint64_t v29 = [(AMSPaymentSheetTask *)self _authorizePaymentWithBiometricsRequest:v28 payment:v8];
      [(AMSMutablePromise *)v10 finishWithPromise:v29];
    }
    else
    {
      id v24 = AMSError(0, @"Payment Sheet Failed", @"Unknown error occurred during authorization", 0);
      [(AMSMutablePromise *)v10 finishWithError:v24];
    }
  }
}

void __82__AMSPaymentSheetTask_paymentAuthorizationController_didAuthorizePayment_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 state];
  id v6 = [v5 error];

  if (v6)
  {
    uint64_t v7 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [*(id *)(a1 + 32) request];
      uint64_t v10 = [v9 logKey];
      id v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v12;
      if (v10)
      {
        id v20 = [*(id *)(a1 + 32) request];
        id v19 = [v20 logKey];
        [v11 stringWithFormat:@"%@: [%@] ", v13, v19];
      }
      else
      {
        [v11 stringWithFormat:@"%@: ", v12];
      id v14 = };
      id v15 = [*(id *)(a1 + 32) state];
      uint64_t v16 = [v15 error];
      uint64_t v17 = AMSLogableError(v16);
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v14;
      __int16 v23 = 2114;
      id v24 = v17;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@Payment authorization failed with error, but an error already exists: %{public}@", buf, 0x16u);

      if (v10)
      {

        id v14 = v20;
      }
    }
  }
  uint64_t v18 = [*(id *)(a1 + 32) state];
  [v18 setError:v4];
}

void __82__AMSPaymentSheetTask_paymentAuthorizationController_didAuthorizePayment_handler___block_invoke_296(uint64_t a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 integerValue];
    id v8 = objc_alloc((Class)getPKPaymentAuthorizationResultClass());
    uint64_t v9 = v7;
  }
  else
  {
    id v8 = objc_alloc((Class)getPKPaymentAuthorizationResultClass());
    id v11 = v8;
    if (v6)
    {
      v13[0] = v6;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      uint64_t v10 = (void *)[v11 initWithStatus:1 errors:v12];

      goto LABEL_6;
    }
    uint64_t v9 = 1;
  }
  uint64_t v10 = (void *)[v8 initWithStatus:v9 errors:0];
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v7)
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(AMSPaymentSheetTask *)self request];
    uint64_t v9 = [v14 logKey];
    uint64_t v10 = NSString;
    uint64_t v11 = objc_opt_class();
    if (v9)
    {
      uint64_t v12 = [(AMSPaymentSheetTask *)self request];
      uint64_t v3 = [v12 logKey];
      NSStringFromSelector(a2);
      a2 = (SEL)objc_claimAutoreleasedReturnValue();
      [v10 stringWithFormat:@"%@: [%@] %@ ", v11, v3, a2];
    }
    else
    {
      uint64_t v12 = NSStringFromSelector(a2);
      [v10 stringWithFormat:@"%@: %@ ", v11, v12];
    uint64_t v13 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v13;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Payment sheet did finish", buf, 0xCu);
    if (v9)
    {

      uint64_t v13 = (void *)v3;
    }
  }
  [(AMSPaymentSheetTask *)self _dismissPaymentAuthorizationController:v6];
}

- (void)paymentAuthorizationController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v10)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = v9;
    uint64_t v29 = [(AMSPaymentSheetTask *)self request];
    uint64_t v12 = [v29 logKey];
    uint64_t v13 = NSString;
    uint64_t v14 = objc_opt_class();
    id v31 = a2;
    if (v12)
    {
      uint64_t v28 = [(AMSPaymentSheetTask *)self request];
      uint64_t v15 = [v28 logKey];
      v26 = NSStringFromSelector(a2);
      __int16 v27 = (void *)v15;
      [v13 stringWithFormat:@"%@: [%@] %@ ", v14, v15, v26];
    }
    else
    {
      uint64_t v28 = NSStringFromSelector(a2);
      [v13 stringWithFormat:@"%@: %@ ", v14, v28];
    uint64_t v16 = };
    uint64_t v17 = [v8 displayName];
    uint64_t v18 = AMSHashIfNeeded(v17);
    id v19 = [v8 network];
    id v20 = AMSHashIfNeeded(v19);
    *(_DWORD *)buf = 138544130;
    uint64_t v37 = v16;
    __int16 v38 = 2114;
    int v39 = v18;
    __int16 v40 = 2114;
    id v41 = v20;
    __int16 v42 = 2048;
    uint64_t v43 = [v8 type];
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ displayName :%{public}@, network :%{public}@, type :%lu", buf, 0x2Au);

    if (v12)
    {

      uint64_t v16 = v27;
    }

    id v9 = v30;
    a2 = v31;
  }

  uint64_t v21 = [(AMSPaymentSheetTask *)self bag];
  uint64_t v22 = [v21 BOOLForKey:@"applePayPaymentMethodTypeBuyParamEnabled"];
  __int16 v23 = [v22 valuePromise];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __85__AMSPaymentSheetTask_paymentAuthorizationController_didSelectPaymentMethod_handler___block_invoke;
  v32[3] = &unk_1E55A5480;
  v32[4] = self;
  id v33 = v8;
  id v34 = v9;
  SEL v35 = a2;
  id v24 = v9;
  id v25 = v8;
  [v23 addFinishBlock:v32];
}

void __85__AMSPaymentSheetTask_paymentAuthorizationController_didSelectPaymentMethod_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 BOOLValue])
  {
    id v8 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      SEL v32 = [*(id *)(a1 + 32) request];
      uint64_t v10 = [v32 logKey];
      uint64_t v11 = NSString;
      uint64_t v12 = objc_opt_class();
      if (v10)
      {
        uint64_t v13 = [*(id *)(a1 + 32) request];
        uint64_t v30 = [v13 logKey];
        uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
        [v11 stringWithFormat:@"%@: [%@] %@ ", v12, v30, v3];
      }
      else
      {
        uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 56));
        [v11 stringWithFormat:@"%@: %@ ", v12, v13];
      uint64_t v14 = };
      uint64_t v15 = [*(id *)(a1 + 40) type];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Enabled to add buyParam for ApplePay payment Method type: %lu", buf, 0x16u);
      if (v10)
      {

        uint64_t v14 = (void *)v30;
      }
    }
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "type"));
    uint64_t v17 = [*(id *)(a1 + 32) purchaseInfo];
    [v17 setPaymentMethodType:v16];
  }
  if (v7 && [v7 code] != 204)
  {
    uint64_t v18 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v18)
    {
      uint64_t v18 = +[AMSLogConfig sharedConfig];
    }
    id v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v33 = [*(id *)(a1 + 32) request];
      id v20 = [v33 logKey];
      uint64_t v21 = NSString;
      uint64_t v22 = objc_opt_class();
      if (v20)
      {
        id v31 = [*(id *)(a1 + 32) request];
        __int16 v23 = [v31 logKey];
        uint64_t v29 = NSStringFromSelector(*(SEL *)(a1 + 56));
        id v24 = [v21 stringWithFormat:@"%@: [%@] %@ ", v22, v23, v29];
      }
      else
      {
        id v31 = NSStringFromSelector(*(SEL *)(a1 + 56));
        id v24 = [v21 stringWithFormat:@"%@: %@ ", v22, v31];
        __int16 v23 = v24;
      }
      id v25 = AMSLogableError(v7);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get applePayPaymentMethodTypeBuyParamEnabled bag key with error: %{public}@", buf, 0x16u);
      if (v20)
      {
      }
    }
  }
  uint64_t v34 = 0;
  SEL v35 = &v34;
  uint64_t v36 = 0x2050000000;
  v26 = (void *)getPKPaymentRequestPaymentMethodUpdateClass_softClass;
  uint64_t v37 = getPKPaymentRequestPaymentMethodUpdateClass_softClass;
  if (!getPKPaymentRequestPaymentMethodUpdateClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPKPaymentRequestPaymentMethodUpdateClass_block_invoke;
    int v39 = &unk_1E559EC70;
    __int16 v40 = &v34;
    __getPKPaymentRequestPaymentMethodUpdateClass_block_invoke((uint64_t)buf);
    v26 = (void *)v35[3];
  }
  __int16 v27 = v26;
  _Block_object_dispose(&v34, 8);
  id v28 = objc_alloc_init(v27);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)paymentAuthorizationController:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(AMSPaymentSheetTask *)self request];
    uint64_t v11 = [v10 logKey];
    uint64_t v12 = NSString;
    uint64_t v13 = objc_opt_class();
    uint64_t v37 = self;
    if (v11)
    {
      id v5 = [(AMSPaymentSheetTask *)self request];
      uint64_t v4 = [v5 logKey];
      NSStringFromSelector(a2);
      self = (AMSPaymentSheetTask *)objc_claimAutoreleasedReturnValue();
      [v12 stringWithFormat:@"%@: [%@] %@ ", v13, v4, self];
    }
    else
    {
      id v5 = NSStringFromSelector(a2);
      [v12 stringWithFormat:@"%@: %@ ", v13, v5];
    uint64_t v14 = };
    uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138543618;
    __int16 v40 = v14;
    __int16 v41 = 2114;
    __int16 v42 = v15;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Recording metrics for event: %{public}@", buf, 0x16u);

    if (v11)
    {

      uint64_t v14 = (void *)v4;
    }

    self = v37;
  }

  switch(a4)
  {
    case 1uLL:
      uint64_t v16 = [(AMSPaymentSheetTask *)self state];
      uint64_t v17 = +[AMSPaymentSheetMetricsEvent dictionaryForBiometricMatchState:didBiometricsLockout:biometricsType:](AMSPaymentSheetMetricsEvent, "dictionaryForBiometricMatchState:didBiometricsLockout:biometricsType:", 100, [v16 didBiometricsLockout], +[AMSBiometrics type](AMSBiometrics, "type"));
      goto LABEL_25;
    case 2uLL:
      uint64_t v18 = [(AMSPaymentSheetTask *)self state];
      [v18 setDidBiometricsLockout:1];

      id v19 = [(AMSPaymentSheetTask *)self request];
      uint64_t v20 = [v19 disablePasscodeFallback];

      if (!v20) {
        return;
      }
      uint64_t v21 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v21)
      {
        uint64_t v21 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = [(AMSPaymentSheetTask *)self request];
        id v24 = [v23 logKey];
        id v25 = NSString;
        uint64_t v26 = objc_opt_class();
        if (v24)
        {
          __int16 v27 = [(AMSPaymentSheetTask *)self request];
          uint64_t v20 = [v27 logKey];
          id v5 = NSStringFromSelector(a2);
          [v25 stringWithFormat:@"%@: [%@] %@ ", v26, v20, v5];
        }
        else
        {
          __int16 v27 = NSStringFromSelector(a2);
          [v25 stringWithFormat:@"%@: %@ ", v26, v27];
        id v28 = };
        *(_DWORD *)buf = 138543362;
        __int16 v40 = v28;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Dismissing Payment Sheet due to biometric lockout and no password fallback", buf, 0xCu);
        if (v24)
        {

          id v28 = (void *)v20;
        }
      }
      SEL v35 = AMSError(509, @"Payment Sheet Failed", @"Device is in biometric lockout and password fallback is disabled", 0);
      uint64_t v36 = [(AMSPaymentSheetTask *)self state];
      [v36 setError:v35];

      SEL v32 = [(AMSPaymentSheetTask *)self paymentAuthorizationController];
      [(AMSPaymentSheetTask *)self _dismissPaymentAuthorizationController:v32];
      goto LABEL_31;
    case 3uLL:
      uint64_t v16 = [(AMSPaymentSheetTask *)self state];
      uint64_t v29 = [v16 didBiometricsLockout];
      uint64_t v30 = 3;
      goto LABEL_24;
    case 4uLL:
      uint64_t v16 = [(AMSPaymentSheetTask *)self state];
      uint64_t v29 = [v16 didBiometricsLockout];
      uint64_t v30 = 2;
      goto LABEL_24;
    case 5uLL:
      uint64_t v16 = [(AMSPaymentSheetTask *)self state];
      uint64_t v29 = [v16 didBiometricsLockout];
      uint64_t v30 = 5;
      goto LABEL_24;
    case 6uLL:
      id v31 = [(AMSPaymentSheetTask *)self state];
      SEL v32 = v31;
      uint64_t v33 = 3;
      goto LABEL_30;
    case 7uLL:
      uint64_t v16 = [(AMSPaymentSheetTask *)self state];
      uint64_t v29 = [v16 didBiometricsLockout];
      uint64_t v30 = 8;
      goto LABEL_24;
    case 8uLL:
      uint64_t v16 = [(AMSPaymentSheetTask *)self state];
      uint64_t v29 = [v16 didBiometricsLockout];
      uint64_t v30 = 7;
LABEL_24:
      uint64_t v17 = +[AMSPaymentSheetMetricsEvent dictionaryForUserAction:v30 didBiometricsLockout:v29];
LABEL_25:
      SEL v32 = (void *)v17;

      if (!v32) {
        return;
      }
      uint64_t v34 = [(AMSPaymentSheetTask *)self userActions];
      [v34 addObject:v32];

      goto LABEL_31;
    case 9uLL:
      id v31 = [(AMSPaymentSheetTask *)self state];
      SEL v32 = v31;
      uint64_t v33 = 1;
      goto LABEL_30;
    case 0xAuLL:
      id v31 = [(AMSPaymentSheetTask *)self state];
      SEL v32 = v31;
      uint64_t v33 = 5;
      goto LABEL_30;
    case 0xBuLL:
      id v31 = [(AMSPaymentSheetTask *)self state];
      SEL v32 = v31;
      uint64_t v33 = 4;
LABEL_30:
      [v31 setCancellationType:v33];
LABEL_31:

      break;
    default:
      return;
  }
}

- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = off_1E559C000;
  uint64_t v10 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v10)
  {
    uint64_t v10 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v31 = v7;
    uint64_t v12 = [(AMSPaymentSheetTask *)self request];
    uint64_t v13 = [v12 logKey];
    uint64_t v14 = NSString;
    uint64_t v15 = objc_opt_class();
    uint64_t v29 = self;
    if (v13)
    {
      uint64_t v16 = [(AMSPaymentSheetTask *)self request];
      id v9 = [v16 logKey];
      NSStringFromSelector(a2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      [v14 stringWithFormat:@"%@: [%@] %@ ", v15, v9, v7];
    }
    else
    {
      uint64_t v16 = NSStringFromSelector(a2);
      [v14 stringWithFormat:@"%@: %@ ", v15, v16];
    uint64_t v4 = };
    uint64_t v17 = AMSLogableError(v8);
    *(_DWORD *)buf = 138543618;
    SEL v35 = v4;
    __int16 v36 = 2114;
    uint64_t v37 = v17;
    _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEBUG, "%{public}@begin | error = %{public}@", buf, 0x16u);
    if (v13)
    {

      uint64_t v4 = v9;
    }

    self = v29;
    id v7 = v31;
  }

  if (v8)
  {
    uint64_t v18 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v18)
    {
      uint64_t v18 = +[AMSLogConfig sharedConfig];
    }
    id v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v32 = v7;
      uint64_t v20 = [(AMSPaymentSheetTask *)self request];
      uint64_t v21 = [v20 logKey];
      uint64_t v22 = NSString;
      uint64_t v23 = objc_opt_class();
      uint64_t v30 = self;
      if (v21)
      {
        id v24 = [(AMSPaymentSheetTask *)self request];
        uint64_t v4 = [v24 logKey];
        NSStringFromSelector(a2);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        [v22 stringWithFormat:@"%@: [%@] %@ ", v23, v4, v7];
      }
      else
      {
        id v24 = NSStringFromSelector(a2);
        [v22 stringWithFormat:@"%@: %@ ", v23, v24];
      id v25 = };
      uint64_t v26 = AMSLogableError(v8);
      *(_DWORD *)buf = 138543618;
      SEL v35 = v25;
      __int16 v36 = 2114;
      uint64_t v37 = v26;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@Payment sheet will finish with error: %{public}@", buf, 0x16u);
      if (v21)
      {

        id v25 = v4;
      }

      self = v30;
      id v7 = v32;
    }

    __int16 v27 = AMSError(509, @"Payment Sheet Failed", @"There was an error in the payment authorization controller.", v8);
    id v28 = [(AMSPaymentSheetTask *)self state];
    [v28 setError:v27];
  }
  [v7 setPrivateDelegate:0];
}

- (id)presentationSceneIdentifierForPaymentAuthorizationController:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = off_1E559C000;
  id v9 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v9)
  {
    id v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [(AMSPaymentSheetTask *)self request];
    uint64_t v12 = [v11 logKey];
    uint64_t v3 = NSString;
    uint64_t v13 = objc_opt_class();
    if (v12)
    {
      uint64_t v14 = [(AMSPaymentSheetTask *)self request];
      uint64_t v4 = [v14 logKey];
      id v5 = NSStringFromSelector(a2);
      [v3 stringWithFormat:@"%@: [%@] %@ ", v13, v4, v5];
    }
    else
    {
      uint64_t v14 = NSStringFromSelector(a2);
      [v3 stringWithFormat:@"%@: %@ ", v13, v14];
    id v6 = };
    *(_DWORD *)buf = 138543362;
    int v39 = v6;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEBUG, "%{public}@begin", buf, 0xCu);
    if (v12)
    {

      id v6 = v4;
    }

    id v8 = off_1E559C000;
  }

  uint64_t v15 = [(AMSPaymentSheetTask *)self presentingSceneIdentifier];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    uint64_t v17 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v17)
    {
      uint64_t v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = [v17 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_31;
    }
    __int16 v36 = [(AMSPaymentSheetTask *)self request];
    id v19 = [v36 logKey];
    uint64_t v20 = NSString;
    uint64_t v21 = objc_opt_class();
    if (v19)
    {
      uint64_t v4 = [(AMSPaymentSheetTask *)self request];
      uint64_t v3 = [v4 logKey];
      id v6 = NSStringFromSelector(a2);
      [v20 stringWithFormat:@"%@: [%@] %@ ", v21, v3, v6];
    }
    else
    {
      uint64_t v4 = NSStringFromSelector(a2);
      [v20 stringWithFormat:@"%@: %@ ", v21, v4];
    uint64_t v22 = };
    *(_DWORD *)buf = 138543362;
    int v39 = v22;
    _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Using self.presentingSceneIdentifier", buf, 0xCu);
    id v8 = off_1E559C000;
    if (v19)
    {

      uint64_t v22 = v3;
    }

    goto LABEL_30;
  }
  uint64_t v3 = [(AMSPaymentSheetTask *)self purchaseInfo];
  uint64_t v23 = [v3 purchase];
  uint64_t v16 = [v23 presentingSceneIdentifier];

  if (!v16) {
    goto LABEL_32;
  }
  uint64_t v17 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v17)
  {
    uint64_t v17 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    __int16 v36 = [(AMSPaymentSheetTask *)self request];
    id v19 = [v36 logKey];
    id v24 = NSString;
    uint64_t v25 = objc_opt_class();
    if (v19)
    {
      uint64_t v4 = [(AMSPaymentSheetTask *)self request];
      id v5 = [v4 logKey];
      id v6 = NSStringFromSelector(a2);
      [v24 stringWithFormat:@"%@: [%@] %@ ", v25, v5, v6];
    }
    else
    {
      uint64_t v4 = NSStringFromSelector(a2);
      [v24 stringWithFormat:@"%@: %@ ", v25, v4];
    uint64_t v3 = };
    *(_DWORD *)buf = 138543362;
    int v39 = v3;
    _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Using self.purchaseInfo.purchase.presentingSceneIdentifier", buf, 0xCu);
    id v8 = off_1E559C000;
    if (v19)
    {

      uint64_t v3 = v5;
    }

LABEL_30:
  }
LABEL_31:

LABEL_32:
  uint64_t v26 = [(__objc2_class *)v8[17] sharedPurchaseConfig];
  if (!v26)
  {
    uint64_t v26 = [(__objc2_class *)v8[17] sharedConfig];
  }
  __int16 v27 = [v26 OSLogObject];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    id v28 = [(AMSPaymentSheetTask *)self request];
    uint64_t v29 = [v28 logKey];
    uint64_t v30 = NSString;
    uint64_t v31 = objc_opt_class();
    if (v29)
    {
      id v32 = [(AMSPaymentSheetTask *)self request];
      uint64_t v4 = [v32 logKey];
      uint64_t v3 = NSStringFromSelector(a2);
      [v30 stringWithFormat:@"%@: [%@] %@ ", v31, v4, v3];
    }
    else
    {
      id v32 = NSStringFromSelector(a2);
      [v30 stringWithFormat:@"%@: %@ ", v31, v32];
    uint64_t v33 = };
    uint64_t v34 = AMSHashIfNeeded(v16);
    *(_DWORD *)buf = 138543618;
    int v39 = v33;
    __int16 v40 = 2114;
    __int16 v41 = v34;
    _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEBUG, "%{public}@ returning scene identifier %{public}@", buf, 0x16u);
    if (v29)
    {

      uint64_t v33 = v4;
    }
  }
  return v16;
}

- (id)presentationSceneBundleIdentifierForPaymentAuthorizationController:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [(AMSPaymentSheetTask *)self request];
    uint64_t v10 = [v9 logKey];
    uint64_t v3 = NSString;
    uint64_t v11 = objc_opt_class();
    if (v10)
    {
      uint64_t v12 = [(AMSPaymentSheetTask *)self request];
      uint64_t v4 = [v12 logKey];
      id v5 = NSStringFromSelector(a2);
      [v3 stringWithFormat:@"%@: [%@] %@ ", v11, v4, v5];
    }
    else
    {
      uint64_t v12 = NSStringFromSelector(a2);
      [v3 stringWithFormat:@"%@: %@ ", v11, v12];
    uint64_t v13 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v47 = v13;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEBUG, "%{public}@begin", buf, 0xCu);
    if (v10)
    {

      uint64_t v13 = v4;
    }
  }
  uint64_t v14 = [(AMSPaymentSheetTask *)self presentingSceneBundleIdentifier];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_48;
    }
    uint64_t v44 = v15;
    uint64_t v18 = [(AMSPaymentSheetTask *)self request];
    id v19 = [v18 logKey];
    uint64_t v20 = NSString;
    uint64_t v21 = objc_opt_class();
    if (v19)
    {
      uint64_t v4 = [(AMSPaymentSheetTask *)self request];
      uint64_t v3 = [v4 logKey];
      uint64_t v15 = NSStringFromSelector(a2);
      [v20 stringWithFormat:@"%@: [%@] %@ ", v21, v3, v15];
    }
    else
    {
      uint64_t v4 = NSStringFromSelector(a2);
      [v20 stringWithFormat:@"%@: %@ ", v21, v4];
    uint64_t v22 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v47 = v22;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Using self.presentingSceneBundleIdentifier", buf, 0xCu);
    if (v19)
    {

      uint64_t v22 = v3;
    }

    goto LABEL_47;
  }
  uint64_t v3 = [(AMSPaymentSheetTask *)self purchaseInfo];
  uint64_t v23 = [v3 purchase];
  uint64_t v15 = [v23 presentingSceneBundleIdentifier];

  if (v15)
  {
    uint64_t v16 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_48;
    }
    uint64_t v44 = v15;
    uint64_t v18 = [(AMSPaymentSheetTask *)self request];
    id v19 = [v18 logKey];
    id v24 = NSString;
    uint64_t v25 = objc_opt_class();
    if (v19)
    {
      uint64_t v4 = [(AMSPaymentSheetTask *)self request];
      id v5 = [v4 logKey];
      uint64_t v15 = NSStringFromSelector(a2);
      [v24 stringWithFormat:@"%@: [%@] %@ ", v25, v5, v15];
    }
    else
    {
      uint64_t v4 = NSStringFromSelector(a2);
      [v24 stringWithFormat:@"%@: %@ ", v25, v4];
    uint64_t v3 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v47 = v3;
    id v32 = "%{public}@Using self.purchaseInfo.purchase.presentingSceneBundleIdentifier";
    goto LABEL_44;
  }
  uint64_t v3 = [(AMSPaymentSheetTask *)self purchaseInfo];
  uint64_t v26 = [v3 clientInfo];
  uint64_t v15 = [v26 proxyAppBundleID];

  if (v15)
  {
    uint64_t v16 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v16)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v17 = [v16 OSLogObject];
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_48;
    }
    uint64_t v44 = v15;
    uint64_t v18 = [(AMSPaymentSheetTask *)self request];
    id v19 = [v18 logKey];
    __int16 v27 = NSString;
    uint64_t v28 = objc_opt_class();
    if (v19)
    {
      uint64_t v4 = [(AMSPaymentSheetTask *)self request];
      id v5 = [v4 logKey];
      uint64_t v15 = NSStringFromSelector(a2);
      [v27 stringWithFormat:@"%@: [%@] %@ ", v28, v5, v15];
    }
    else
    {
      uint64_t v4 = NSStringFromSelector(a2);
      [v27 stringWithFormat:@"%@: %@ ", v28, v4];
    uint64_t v3 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v47 = v3;
    id v32 = "%{public}@Using self.purchaseInfo.clientInfo.proxyAppBundleID";
    goto LABEL_44;
  }
  uint64_t v3 = [(AMSPaymentSheetTask *)self purchaseInfo];
  uint64_t v29 = [v3 clientInfo];
  uint64_t v15 = [v29 bundleIdentifier];

  if (!v15) {
    goto LABEL_49;
  }
  uint64_t v16 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v16)
  {
    uint64_t v16 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v44 = v15;
    uint64_t v18 = [(AMSPaymentSheetTask *)self request];
    id v19 = [v18 logKey];
    uint64_t v30 = NSString;
    uint64_t v31 = objc_opt_class();
    if (v19)
    {
      uint64_t v4 = [(AMSPaymentSheetTask *)self request];
      id v5 = [v4 logKey];
      uint64_t v15 = NSStringFromSelector(a2);
      [v30 stringWithFormat:@"%@: [%@] %@ ", v31, v5, v15];
    }
    else
    {
      uint64_t v4 = NSStringFromSelector(a2);
      [v30 stringWithFormat:@"%@: %@ ", v31, v4];
    uint64_t v3 = };
    *(_DWORD *)buf = 138543362;
    uint64_t v47 = v3;
    id v32 = "%{public}@Using self.purchaseInfo.clientInfo.bundleIdentifier";
LABEL_44:
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEBUG, v32, buf, 0xCu);
    if (v19)
    {

      uint64_t v3 = v5;
    }

LABEL_47:
    uint64_t v15 = v44;
  }
LABEL_48:

LABEL_49:
  uint64_t v33 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v33)
  {
    uint64_t v33 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v34 = [v33 OSLogObject];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    SEL v35 = [(AMSPaymentSheetTask *)self request];
    __int16 v36 = [v35 logKey];
    uint64_t v37 = NSString;
    uint64_t v38 = objc_opt_class();
    if (v36)
    {
      int v39 = [(AMSPaymentSheetTask *)self request];
      uint64_t v4 = [v39 logKey];
      uint64_t v3 = NSStringFromSelector(a2);
      [v37 stringWithFormat:@"%@: [%@] %@ ", v38, v4, v3];
    }
    else
    {
      int v39 = NSStringFromSelector(a2);
      [v37 stringWithFormat:@"%@: %@ ", v38, v39];
    __int16 v40 = };
    __int16 v41 = v15;
    uint64_t v42 = AMSHashIfNeeded(v15);
    *(_DWORD *)buf = 138543618;
    uint64_t v47 = v40;
    __int16 v48 = 2114;
    uint64_t v49 = v42;
    _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEBUG, "%{public}@ returning bundle identifier %{public}@", buf, 0x16u);
    if (v36)
    {

      __int16 v40 = v4;
    }

    uint64_t v15 = v41;
  }

  return v15;
}

+ (BOOL)isPaymentSheetEnablementAvailable
{
  return _os_feature_enabled_impl();
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSDictionary)metricsDictionary
{
  return self->_metricsDictionary;
}

- (void)setMetricsDictionary:(id)a3
{
}

- (NSString)presentingSceneBundleIdentifier
{
  return self->_presentingSceneBundleIdentifier;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
}

- (NSString)presentingSceneIdentifier
{
  return self->_presentingSceneIdentifier;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
}

- (id)presentingWindow
{
  return self->_presentingWindow;
}

- (void)setPresentingWindow:(id)a3
{
}

- (AMSPurchaseInfo)purchaseInfo
{
  return self->_purchaseInfo;
}

- (void)setPurchaseInfo:(id)a3
{
}

- (AMSPaymentSheetAssetCache)assetCache
{
  return self->_assetCache;
}

- (void)setAssetCache:(id)a3
{
}

- (void)setAuthenticationContext:(id)a3
{
}

- (PKPaymentAuthorizationController)paymentAuthorizationController
{
  return self->_paymentAuthorizationController;
}

- (void)setPaymentAuthorizationController:(id)a3
{
}

- (AMSMutablePromise)paymentSheetPromise
{
  return self->_paymentSheetPromise;
}

- (void)setPaymentSheetPromise:(id)a3
{
}

- (AMSFinancePaymentSheetResponse)paymentSheetResponse
{
  return self->_paymentSheetResponse;
}

- (AMSPaymentSheetRequest)request
{
  return self->_request;
}

- (_PaymentSheetState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSMutableArray)userActions
{
  return self->_userActions;
}

- (void)setUserActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActions, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_paymentSheetResponse, 0);
  objc_storeStrong((id *)&self->_paymentSheetPromise, 0);
  objc_storeStrong((id *)&self->_paymentAuthorizationController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong(&self->_presentingWindow, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsDictionary, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end