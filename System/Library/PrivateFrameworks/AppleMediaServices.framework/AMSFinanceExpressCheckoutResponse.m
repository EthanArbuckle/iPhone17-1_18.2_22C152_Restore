@interface AMSFinanceExpressCheckoutResponse
+ (BOOL)_isExpressCheckoutEnabledForBag:(id)a3;
+ (BOOL)_isExpressCheckoutRecordUserChoiceEnabledForBag:(id)a3;
+ (BOOL)isEligibleForBag:(id)a3;
+ (BOOL)isExpressCheckoutPayload:(id)a3;
+ (BOOL)isExpressCheckoutShouldCheckForWalletBiometricsForBag:(id)a3;
- (AMSBuyParams)buyParams;
- (AMSFinanceExpressCheckoutResponse)initWithResponseDictionary:(id)a3 taskInfo:(id)a4;
- (AMSURLRequestProperties)parentProperties;
- (AMSURLSession)session;
- (id)_buyParamFromPayload:(id)a3;
- (id)_createClientDataForPaymentChoices:(id)a3;
- (id)_createPageEventForPaymentChoices:(id)a3;
- (id)_fetchCardDataForMerchantIdentifier:(id)a3 countryCode:(id)a4;
- (id)_paymentChoicesBodyForCardData:(id)a3;
- (id)_paymentChoicesForCardData:(id)a3;
- (id)_paymentChoicesRequestForCardData:(id)a3;
- (id)_presentEngagementForPaymentChoices:(id)a3;
- (id)_recordUserChoiceForEngagementResult:(id)a3;
- (id)_recordUserChoiceRequest;
- (id)performWithTaskInfo:(id)a3;
- (int64_t)_expressCheckoutModeFromPayload:(id)a3;
- (int64_t)expressCheckoutMode;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)removeExpressCheckoutSession;
- (void)setBuyParams:(id)a3;
- (void)setExpressCheckoutMode:(int64_t)a3;
- (void)setParentProperties:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation AMSFinanceExpressCheckoutResponse

- (AMSFinanceExpressCheckoutResponse)initWithResponseDictionary:(id)a3 taskInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)AMSFinanceExpressCheckoutResponse;
  v8 = [(AMSFinancePaymentSheetResponse *)&v24 initWithResponseDictionary:v6 confirmationOnly:0 delegateAuthenticationRequired:0 biometricSignatureRequired:1 taskInfo:v7];
  v9 = v8;
  if (v8)
  {
    uint64_t v10 = [(AMSFinanceExpressCheckoutResponse *)v8 _expressCheckoutModeFromPayload:v6];
    v9->_expressCheckoutMode = v10;
    v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10];
    v12 = [v7 properties];
    v13 = [v12 purchaseInfo];
    [v13 setExpressCheckoutMode:v11];

    uint64_t v14 = [(AMSFinanceExpressCheckoutResponse *)v9 _buyParamFromPayload:v6];
    buyParams = v9->_buyParams;
    v9->_buyParams = (AMSBuyParams *)v14;

    v16 = (void *)MEMORY[0x1E4F18DD0];
    v17 = +[AMSProcessInfo currentProcess];
    v18 = objc_msgSend(v16, "ams_configurationWithProcessInfo:bag:", v17, 0);

    v19 = [[AMSURLSession alloc] initWithConfiguration:v18 delegate:v9 delegateQueue:0];
    session = v9->_session;
    v9->_session = v19;

    uint64_t v21 = [v7 properties];
    parentProperties = v9->_parentProperties;
    v9->_parentProperties = (AMSURLRequestProperties *)v21;
  }
  return v9;
}

- (id)performWithTaskInfo:(id)a3
{
  v93[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  id v6 = [v5 bag];

  id v7 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  v8 = [v7 account];

  v9 = [v6 stringForKey:@"applepay-merchant-id"];
  uint64_t v10 = [v9 valuePromise];

  v11 = [v6 stringForKey:@"countryCode"];
  v12 = [v11 valuePromise];

  v93[0] = v10;
  v93[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
  uint64_t v14 = +[AMSPromise promiseWithAll:v13];

  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke;
  v86[3] = &unk_1E559E528;
  v86[4] = self;
  v79 = v14;
  v15 = [v14 thenWithBlock:v86];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_2;
  v85[3] = &unk_1E559E640;
  v85[4] = self;
  v16 = [v15 thenWithBlock:v85];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_3;
  v84[3] = &unk_1E55A2CC8;
  v84[4] = self;
  v17 = [v16 thenWithBlock:v84];
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_4;
  v83[3] = &unk_1E55A2CF0;
  v83[4] = self;
  v18 = [v17 thenWithBlock:v83];

  id v82 = 0;
  v78 = v18;
  v80 = [v18 resultWithError:&v82];
  id v19 = v82;
  v20 = v19;
  id v77 = v4;
  if (v19)
  {
    v75 = v12;
    v76 = v6;
    uint64_t v21 = v10;
    v22 = [v19 userInfo];
    v23 = [v22 objectForKeyedSubscript:@"AMSEngagementPresented"];
    if (objc_opt_respondsToSelector())
    {
      [v20 userInfo];
      v25 = objc_super v24 = v8;
      v26 = [v25 objectForKeyedSubscript:@"AMSEngagementPresented"];
      int v27 = [v26 BOOLValue];

      v8 = v24;
      v28 = v20;
      if (v27 && [v20 code] == 6)
      {
        v29 = +[AMSLogConfig sharedPurchaseConfig];
        if (!v29)
        {
          v29 = +[AMSLogConfig sharedConfig];
        }
        v30 = [v29 OSLogObject];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = objc_opt_class();
          v32 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          uint64_t v88 = v31;
          v8 = v24;
          __int16 v89 = 2114;
          v90 = v32;
          __int16 v91 = 2114;
          uint64_t v92 = (uint64_t)v20;
          _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Express Checkout cancelled with: %{public}@", buf, 0x20u);
        }
        v33 = +[AMSURLAction actionWithError:v20];
        uint64_t v10 = v21;
        v12 = v75;
        id v6 = v76;
        goto LABEL_40;
      }
    }
    else
    {

      v28 = v20;
    }
    v50 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v50)
    {
      v50 = +[AMSLogConfig sharedConfig];
    }
    v51 = [v50 OSLogObject];
    uint64_t v10 = v21;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = v8;
      uint64_t v53 = objc_opt_class();
      v54 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v88 = v53;
      v8 = v52;
      __int16 v89 = 2114;
      v90 = v54;
      __int16 v91 = 2114;
      uint64_t v92 = (uint64_t)v28;
      _os_log_impl(&dword_18D554000, v51, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Express Checkout failed and fallback to regular buy flow, error: %{public}@", buf, 0x20u);
    }
    [(AMSFinanceExpressCheckoutResponse *)self removeExpressCheckoutSession];
    v12 = v75;
    id v6 = v76;
  }
  else
  {
    uint64_t v34 = [v80 expressCheckoutPath];
    v35 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v35)
    {
      v35 = +[AMSLogConfig sharedConfig];
    }
    v36 = [v35 OSLogObject];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v6;
      v38 = v10;
      v39 = v8;
      uint64_t v40 = objc_opt_class();
      AMSLogKey();
      v42 = v41 = v12;
      *(_DWORD *)buf = 138543874;
      uint64_t v88 = v40;
      v8 = v39;
      uint64_t v10 = v38;
      id v6 = v37;
      __int16 v89 = 2114;
      v90 = v42;
      __int16 v91 = 2048;
      uint64_t v92 = v34;
      _os_log_impl(&dword_18D554000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Express Checkout successful with path: %ld", buf, 0x20u);

      v12 = v41;
    }

    v28 = 0;
    switch(v34)
    {
      case 0:
        v43 = +[AMSLogConfig sharedPurchaseConfig];
        if (!v43)
        {
          v43 = +[AMSLogConfig sharedConfig];
        }
        v44 = [v43 OSLogObject];
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        v45 = v8;
        uint64_t v46 = objc_opt_class();
        AMSLogKey();
        v48 = v47 = v12;
        *(_DWORD *)buf = 138543618;
        uint64_t v88 = v46;
        v8 = v45;
        __int16 v89 = 2114;
        v90 = v48;
        v49 = "%{public}@: [%{public}@] Express checkout finished with ineligible path, remove merchantSession";
        break;
      case 1:
        v43 = +[AMSLogConfig sharedPurchaseConfig];
        if (!v43)
        {
          v43 = +[AMSLogConfig sharedConfig];
        }
        v44 = [v43 OSLogObject];
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        v55 = v8;
        uint64_t v56 = objc_opt_class();
        AMSLogKey();
        v48 = v47 = v12;
        *(_DWORD *)buf = 138543618;
        uint64_t v88 = v56;
        v8 = v55;
        __int16 v89 = 2114;
        v90 = v48;
        v49 = "%{public}@: [%{public}@] Express checkout success with alternative payment, remove merchantSession";
        break;
      case 3:
        v57 = [v80 expressCheckoutCardSelection];

        if (v57)
        {
          v58 = +[AMSLogConfig sharedPurchaseConfig];
          if (!v58)
          {
            v58 = +[AMSLogConfig sharedConfig];
          }
          v59 = [v58 OSLogObject];
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            v60 = v8;
            uint64_t v61 = objc_opt_class();
            AMSLogKey();
            v63 = v62 = v12;
            *(_DWORD *)buf = 138543618;
            uint64_t v88 = v61;
            v8 = v60;
            __int16 v89 = 2114;
            v90 = v63;
            _os_log_impl(&dword_18D554000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Card selection received and configured", buf, 0x16u);

            v12 = v62;
            v28 = 0;
          }

          v64 = [v80 expressCheckoutCardSelection];
          v65 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
          [v65 setSelectedCard:v64];
        }
        goto LABEL_37;
      case 4:
        v68 = AMSError(2, @"Express Checkout Closed", @"User closed express checkout", 0);
        v69 = +[AMSLogConfig sharedPurchaseConfig];
        if (!v69)
        {
          v69 = +[AMSLogConfig sharedConfig];
        }
        v70 = [v69 OSLogObject];
        id v4 = v77;
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          v71 = v8;
          uint64_t v72 = objc_opt_class();
          AMSLogKey();
          v74 = v73 = v12;
          *(_DWORD *)buf = 138543874;
          uint64_t v88 = v72;
          v8 = v71;
          __int16 v89 = 2114;
          v90 = v74;
          __int16 v91 = 2114;
          uint64_t v92 = 0;
          _os_log_impl(&dword_18D554000, v70, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Express Checkout Closed with: %{public}@", buf, 0x20u);

          v12 = v73;
          v28 = 0;
        }

        v33 = +[AMSURLAction actionWithError:v68];

        goto LABEL_40;
      default:
        goto LABEL_37;
    }
    _os_log_impl(&dword_18D554000, v44, OS_LOG_TYPE_DEFAULT, v49, buf, 0x16u);

    v12 = v47;
    v28 = 0;
LABEL_30:

    [(AMSFinanceExpressCheckoutResponse *)self removeExpressCheckoutSession];
  }
LABEL_37:
  if ([(AMSFinanceExpressCheckoutResponse *)self expressCheckoutMode] == 1)
  {
    v66 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
    [v66 setApplePayClassic:1];
  }
  v81.receiver = self;
  v81.super_class = (Class)AMSFinanceExpressCheckoutResponse;
  id v4 = v77;
  v33 = [(AMSFinancePaymentSheetResponse *)&v81 performWithTaskInfo:v77];
LABEL_40:

  return v33;
}

id __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 firstObject];
  v5 = [v3 lastObject];

  id v6 = [v2 _fetchCardDataForMerchantIdentifier:v4 countryCode:v5];

  return v6;
}

uint64_t __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _paymentChoicesForCardData:a2];
}

uint64_t __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _presentEngagementForPaymentChoices:a2];
}

uint64_t __57__AMSFinanceExpressCheckoutResponse_performWithTaskInfo___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _recordUserChoiceForEngagementResult:a2];
}

- (id)_fetchCardDataForMerchantIdentifier:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(AMSFinanceExpressCheckoutResponse *)self expressCheckoutMode] == 2)
  {
    v8 = [[AMSCardRegistrationTask alloc] initWithCountryCode:v7 merchantIdentifier:v6];
    [(AMSTask *)v8 setRunMode:1];
    v9 = [(AMSCardRegistrationTask *)v8 performCardRegistration];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__AMSFinanceExpressCheckoutResponse__fetchCardDataForMerchantIdentifier_countryCode___block_invoke;
    v12[3] = &unk_1E55A2D18;
    v12[4] = self;
    uint64_t v10 = [v9 thenWithBlock:v12];
  }
  else
  {
    uint64_t v10 = +[AMSPromise promiseWithResult:&stru_1EDCA7308];
  }

  return v10;
}

id __85__AMSFinanceExpressCheckoutResponse__fetchCardDataForMerchantIdentifier_countryCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [a2 cardData];
  id v3 = v2;
  if (v2 && [v2 length])
  {
    id v4 = [v3 base64EncodedStringWithOptions:0];
    uint64_t v5 = +[AMSPromise promiseWithResult:v4];
  }
  else
  {
    id v6 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Card data fetch failed during Express Checkout, continuing with regular buy", (uint8_t *)&v12, 0x16u);
    }
    id v4 = AMSError(7, @"Card registration data not available", @"Fetching card data failed during Express Checkout, continuing with regular buy", 0);
    uint64_t v5 = +[AMSPromise promiseWithError:v4];
  }
  uint64_t v10 = (void *)v5;

  return v10;
}

- (id)_paymentChoicesForCardData:(id)a3
{
  id v4 = [(AMSFinanceExpressCheckoutResponse *)self _paymentChoicesRequestForCardData:a3];
  uint64_t v5 = [(AMSFinanceExpressCheckoutResponse *)self session];
  id v6 = [v5 dataTaskPromiseWithRequestPromise:v4];
  id v7 = [v6 thenWithBlock:&__block_literal_global_59];

  return v7;
}

id __64__AMSFinanceExpressCheckoutResponse__paymentChoicesForCardData___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 object];
  id v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

- (id)_paymentChoicesRequestForCardData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [AMSURLRequestEncoder alloc];
  id v6 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  id v7 = [v6 bag];
  uint64_t v8 = [(AMSURLRequestEncoder *)v5 initWithBag:v7];

  [(AMSURLRequestEncoder *)v8 setRequestEncoding:3];
  v9 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  uint64_t v10 = [v9 account];
  [(AMSURLRequestEncoder *)v8 setAccount:v10];

  v11 = [[AMSCodableResponseDecoder alloc] initWithRootClass:objc_opt_class()];
  [(AMSURLRequestEncoder *)v8 setResponseDecoder:v11];

  int v12 = [(AMSFinanceExpressCheckoutResponse *)self _paymentChoicesBodyForCardData:v4];

  uint64_t v13 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  __int16 v14 = [v13 bag];
  v15 = [v14 BOOLForKey:@"applePayExpressCheckoutPaymentChoicesUsePost"];
  uint64_t v16 = [v15 valuePromise];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__AMSFinanceExpressCheckoutResponse__paymentChoicesRequestForCardData___block_invoke;
  v21[3] = &unk_1E55A2D40;
  v21[4] = self;
  v22 = v8;
  id v23 = v12;
  id v17 = v12;
  v18 = v8;
  id v19 = [v16 continueWithBlock:v21];

  return v19;
}

id __71__AMSFinanceExpressCheckoutResponse__paymentChoicesRequestForCardData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = AMSLogKey();
      int v17 = 138543874;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      v20 = v10;
      __int16 v21 = 2114;
      id v22 = v6;
    }
  }
  if ([v5 BOOLValue]) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 2;
  }
  int v12 = [*(id *)(a1 + 32) parentProperties];
  uint64_t v13 = [v12 bag];
  __int16 v14 = [v13 URLForKey:@"applePayExpressCheckoutPaymentChoicesUrl"];

  v15 = [*(id *)(a1 + 40) requestWithMethod:v11 bagURL:v14 parameters:*(void *)(a1 + 48)];

  return v15;
}

- (id)_paymentChoicesBodyForCardData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  buyParams = self->_buyParams;
  if (buyParams)
  {
    id v7 = [(AMSBuyParams *)buyParams dictionary];
  }
  else
  {
    uint64_t v8 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
    uint64_t v9 = [v8 purchaseInfo];
    uint64_t v10 = [v9 buyParams];
    id v7 = [v10 dictionary];
  }
  id v20 = 0;
  uint64_t v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:&v20];
  id v12 = v20;
  unint64_t v13 = 0x1E4F29000uLL;
  if (v12)
  {
    __int16 v14 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v14)
    {
      __int16 v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      int v17 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v16;
      unint64_t v13 = 0x1E4F29000;
      __int16 v23 = 2114;
      objc_super v24 = v17;
      __int16 v25 = 2114;
      id v26 = v12;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode buyParams. %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (!v11) {
      goto LABEL_13;
    }
    __int16 v14 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
    [v5 setObject:v14 forKeyedSubscript:@"buyParams"];
  }

LABEL_13:
  if ([v4 length]) {
    [v5 setObject:v4 forKeyedSubscript:@"cardData"];
  }
  uint64_t v18 = objc_msgSend(*(id *)(v13 + 24), "stringWithFormat:", @"%lu", -[AMSFinanceExpressCheckoutResponse expressCheckoutMode](self, "expressCheckoutMode"));
  [v5 setObject:v18 forKeyedSubscript:@"expressCheckoutMode"];

  return v5;
}

- (id)_presentEngagementForPaymentChoices:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEmpty]
    && [(AMSFinanceExpressCheckoutResponse *)self expressCheckoutMode] == 2)
  {
    id v5 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSLogKey();
      int v34 = 138543618;
      uint64_t v35 = v7;
      __int16 v36 = 2114;
      v37 = v8;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Payment choices is empty & expressCheckout mode is AURUM, so marking the Express Checkout path as ineligible", (uint8_t *)&v34, 0x16u);
    }
    uint64_t v9 = [[AMSEngagementResult alloc] initWithPath:0];
    uint64_t v10 = +[AMSPromise promiseWithResult:v9];
  }
  else
  {
    uint64_t v11 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v11)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      __int16 v14 = AMSLogKey();
      int v34 = 138543618;
      uint64_t v35 = v13;
      __int16 v36 = 2114;
      v37 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting Express Checkout engagement", (uint8_t *)&v34, 0x16u);
    }
    v15 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
    uint64_t v16 = [v15 purchaseInfo];
    uint64_t v9 = [v16 delegate];

    if (objc_opt_respondsToSelector())
    {
      int v17 = [[AMSExpressCheckoutModel alloc] initWithMode:[(AMSFinanceExpressCheckoutResponse *)self expressCheckoutMode] paymentChoices:v4];
      uint64_t v18 = [[AMSEngagementRequest alloc] initWithModel:v17 destinationStyle:3];
      __int16 v19 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
      id v20 = [v19 account];
      [(AMSEngagementRequest *)v18 setAccount:v20];

      __int16 v21 = AMSLogKey();
      [(AMSEngagementRequest *)v18 setLogKey:v21];

      [(AMSEngagementRequest *)v18 setFailOnDismiss:1];
      uint64_t v22 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://amsui.apple.com/dynamic/marketing#route=expressCheckout"];
      [(AMSEngagementRequest *)v18 setURL:v22];

      __int16 v23 = [(AMSFinanceExpressCheckoutResponse *)self _createPageEventForPaymentChoices:v4];
      [(AMSEngagementRequest *)v18 setMetricsOverlay:v23];

      objc_super v24 = [(AMSFinanceExpressCheckoutResponse *)self _createClientDataForPaymentChoices:v4];
      [(AMSEngagementRequest *)v18 setClientData:v24];

      uint64_t v10 = objc_alloc_init(AMSPromise);
      __int16 v25 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
      id v26 = [v25 purchaseInfo];
      uint64_t v27 = [v26 purchase];
      v28 = [(AMSPromise *)v10 completionHandlerAdapter];
      [(AMSEngagementResult *)v9 purchase:v27 handleEngagementRequest:v18 completion:v28];
    }
    else
    {
      AMSError(2, @"Finance Engagement Error", @"No delegate to present the engagement", 0);
      int v17 = (AMSExpressCheckoutModel *)objc_claimAutoreleasedReturnValue();
      v29 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v29)
      {
        v29 = +[AMSLogConfig sharedConfig];
      }
      v30 = [v29 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = objc_opt_class();
        v32 = AMSLogKey();
        int v34 = 138543874;
        uint64_t v35 = v31;
        __int16 v36 = 2114;
        v37 = v32;
        __int16 v38 = 2114;
        v39 = v17;
        _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to present engagement (no delegate). %{public}@", (uint8_t *)&v34, 0x20u);
      }
      uint64_t v10 = +[AMSPromise promiseWithError:v17];
    }
  }
  return v10;
}

- (id)_recordUserChoiceForEngagementResult:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 expressCheckoutPath] != 4)
  {
    uint64_t v11 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v11)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v13 = objc_opt_class();
    __int16 v14 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v13;
    __int16 v23 = 2114;
    objc_super v24 = v14;
    v15 = "%{public}@: [%{public}@] Skipping recording user choice due to ineligibility";
    goto LABEL_12;
  }
  id v5 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  id v6 = [v5 bag];
  BOOL v7 = +[AMSFinanceExpressCheckoutResponse _isExpressCheckoutRecordUserChoiceEnabledForBag:v6];

  if (v7)
  {
    uint64_t v8 = [(AMSFinanceExpressCheckoutResponse *)self _recordUserChoiceRequest];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__AMSFinanceExpressCheckoutResponse__recordUserChoiceForEngagementResult___block_invoke;
    v20[3] = &unk_1E559E9C0;
    v20[4] = self;
    uint64_t v9 = [v8 thenWithBlock:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__AMSFinanceExpressCheckoutResponse__recordUserChoiceForEngagementResult___block_invoke_70;
    v18[3] = &unk_1E55A2D68;
    v18[4] = self;
    id v19 = v4;
    uint64_t v10 = [v9 continueWithBlock:v18];

    goto LABEL_14;
  }
  uint64_t v11 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v11)
  {
    uint64_t v11 = +[AMSLogConfig sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    __int16 v14 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v16;
    __int16 v23 = 2114;
    objc_super v24 = v14;
    v15 = "%{public}@: [%{public}@] Skipping recording user choice due to not enabled by bag key";
LABEL_12:
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
  }
LABEL_13:

  uint64_t v10 = +[AMSPromise promiseWithResult:v4];
LABEL_14:

  return v10;
}

id __74__AMSFinanceExpressCheckoutResponse__recordUserChoiceForEngagementResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    BOOL v7 = AMSLogKey();
    int v11 = 138543618;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    __int16 v14 = v7;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing network request for recording user choice", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = [*(id *)(a1 + 32) session];
  uint64_t v9 = [v8 dataTaskPromiseWithRequest:v3];

  return v9;
}

id __74__AMSFinanceExpressCheckoutResponse__recordUserChoiceForEngagementResult___block_invoke_70(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSLogKey();
      int v11 = 138543874;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      __int16 v14 = v8;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to perform network request for recording user choice with error:%{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v9 = +[AMSPromise promiseWithResult:*(void *)(a1 + 40)];

  return v9;
}

- (id)_recordUserChoiceRequest
{
  id v3 = [AMSURLRequestEncoder alloc];
  id v4 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  id v5 = [v4 bag];
  uint64_t v6 = [(AMSURLRequestEncoder *)v3 initWithBag:v5];

  uint64_t v7 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  uint64_t v8 = [v7 account];
  [(AMSURLRequestEncoder *)v6 setAccount:v8];

  uint64_t v9 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  uint64_t v10 = [v9 bag];
  int v11 = [v10 URLForKey:@"applicationUserChoiceUrl"];

  uint64_t v12 = [(AMSURLRequestEncoder *)v6 requestWithMethod:2 bagURL:v11 parameters:&unk_1EDD01AC0];
  __int16 v13 = [v12 thenWithBlock:&__block_literal_global_80];

  return v13;
}

id __61__AMSFinanceExpressCheckoutResponse__recordUserChoiceRequest__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setHTTPMethod:@"POST"];
  id v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

- (id)_createClientDataForPaymentChoices:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
  uint64_t v7 = [v6 confirmationTitle];
  uint64_t v8 = @"one_time_buy";
  if (v7 == 6) {
    uint64_t v8 = @"subscription";
  }
  uint64_t v9 = v8;

  uint64_t v10 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
  int v11 = [v10 price];
  [v5 setObject:v11 forKeyedSubscript:@"contentPrice"];

  uint64_t v12 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
  __int16 v13 = [v12 currencyCode];
  [v5 setObject:v13 forKeyedSubscript:@"purchaseCurrency"];

  [v5 setObject:v9 forKeyedSubscript:@"purchaseFrequency"];
  if ([(AMSFinanceExpressCheckoutResponse *)self expressCheckoutMode] == 2)
  {
    __int16 v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "cardsCount"));
    [v5 setObject:v14 forKeyedSubscript:@"applePayCardsShown"];
  }
  return v5;
}

- (id)_createPageEventForPaymentChoices:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_buyParams;
  if (!v5)
  {
    uint64_t v6 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
    uint64_t v7 = [v6 purchaseInfo];
    id v5 = [v7 buyParams];
  }
  uint64_t v8 = [(AMSBuyParams *)v5 objectForKeyedSubscript:@"appAdamId"];
  uint64_t v9 = [(AMSBuyParams *)v5 objectForKeyedSubscript:@"salableAdamId"];
  uint64_t v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    v22[0] = @"parentAdamId";
    v22[1] = @"adamId";
    v23[0] = v8;
    v23[1] = v9;
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    __int16 v13 = v23;
    __int16 v14 = v22;
LABEL_10:
    __int16 v15 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:2];
    goto LABEL_11;
  }
  if (v9)
  {
    v20[0] = @"parentAdamId";
    v20[1] = @"adamId";
    v21[0] = v9;
    v21[1] = v9;
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    __int16 v13 = v21;
    __int16 v14 = v20;
    goto LABEL_10;
  }
  __int16 v15 = (void *)MEMORY[0x1E4F1CC08];
LABEL_11:
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v16 setObject:@"finance" forKeyedSubscript:0x1EDCB1328];
  [v16 setObject:v15 forKeyedSubscript:0x1EDCBAFE8];
  uint64_t v17 = [v4 metrics];

  if (v17)
  {
    uint64_t v18 = [v4 metrics];
    [v16 addEntriesFromDictionary:v18];
  }
  return v16;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v13 = a5;
  uint64_t v8 = (void (**)(id, void, void *))a6;
  uint64_t v9 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  uint64_t v10 = [v9 purchaseInfo];

  BOOL v11 = [v10 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v10 purchase];
    [v11 purchase:v12 handleAuthenticateRequest:v13 completion:v8];
  }
  else
  {
    uint64_t v12 = AMSError(2, @"Purchase Authentication Failed", @"Purchase delegate not observing callback", 0);
    v8[2](v8, 0, v12);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v13 = a5;
  uint64_t v8 = (void (**)(id, void, void *))a6;
  uint64_t v9 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  uint64_t v10 = [v9 purchaseInfo];

  BOOL v11 = [v10 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v10 purchase];
    [v11 purchase:v12 handleDialogRequest:v13 completion:v8];
  }
  else
  {
    uint64_t v12 = AMSError(2, @"Purchase Dialog Failed", @"Purchase delegate not observing callback", 0);
    v8[2](v8, 0, v12);
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v13 = a5;
  uint64_t v8 = (void (**)(id, void, void *))a6;
  uint64_t v9 = [(AMSFinanceExpressCheckoutResponse *)self parentProperties];
  uint64_t v10 = [v9 purchaseInfo];

  BOOL v11 = [v10 delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v10 purchase];
    [v11 purchase:v12 handleEngagementRequest:v13 completion:v8];
  }
  else
  {
    uint64_t v12 = AMSError(2, @"Purchase Engagement Failed", @"Purchase delegate not observing callback", 0);
    v8[2](v8, 0, v12);
  }
}

- (int64_t)_expressCheckoutModeFromPayload:(id)a3
{
  id v3 = [a3 valueForKey:0x1EDCB4DC8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = [v4 valueForKey:@"expressCheckoutMode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  int64_t v7 = [v6 integerValue];
  return v7;
}

- (id)_buyParamFromPayload:(id)a3
{
  id v3 = [a3 valueForKey:0x1EDCB4DC8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = [v4 valueForKey:@"touchIDButtonAction"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  int64_t v7 = [v6 valueForKey:@"buyParams"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;

    if (v8)
    {
      uint64_t v9 = [[AMSBuyParams alloc] initWithString:v8];
      goto LABEL_12;
    }
  }
  else
  {

    id v8 = 0;
  }
  uint64_t v9 = 0;
LABEL_12:

  return v9;
}

- (void)removeExpressCheckoutSession
{
  id v3 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
  [v3 setMerchantSession:0];

  id v4 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
  [v4 setApplePayClassic:0];

  id v5 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
  id v6 = [v5 responseDictionary];
  id v9 = +[AMSFinancePaymentSheetResponse fallbackTitleFromResponse:v6];

  if (v9)
  {
    int64_t v7 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
    [v7 setTitle:v9];

    id v8 = [(AMSFinancePaymentSheetResponse *)self paymentSheetRequest];
    [v8 setTitleType:0];
  }
}

+ (BOOL)isEligibleForBag:(id)a3
{
  id v3 = a3;
  if (+[AMSCardEnrollment isAURUMWithBag:v3]) {
    BOOL v4 = +[AMSFinanceExpressCheckoutResponse _isExpressCheckoutEnabledForBag:v3];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)isExpressCheckoutPayload:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 valueForKey:0x1EDCB4DC8];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = [v4 objectForKeyedSubscript:@"expressCheckoutMode"];

  id v6 = AMSSetLogKeyIfNeeded();
  int64_t v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    int64_t v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    uint64_t v10 = (void *)MEMORY[0x1E4F28ED0];
    id v11 = v9;
    uint64_t v12 = [v10 numberWithBool:v5 != 0];
    int v14 = 138543874;
    __int16 v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    id v19 = v12;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Express Checkout payload eligibility status: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  return v5 != 0;
}

+ (BOOL)isExpressCheckoutShouldCheckForWalletBiometricsForBag:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AMSSetLogKeyIfNeeded();
  id v5 = [v3 BOOLForKey:@"applePayExpressCheckoutShouldCheckForWalletBiometrics"];
  id v22 = 0;
  id v6 = [v5 valueWithError:&v22];
  id v7 = v22;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v3 BOOLForKey:@"applePayExpressCheckoutShouldCheckForWalletBiometrics"];
    id v21 = v7;
    id v9 = [v8 valueWithError:&v21];
    id v10 = v21;

    uint64_t v11 = [v9 BOOLValue];
    id v7 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }

  if (v7)
  {
    uint64_t v12 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      objc_super v24 = v14;
      __int16 v25 = 2114;
      id v26 = v4;
      __int16 v27 = 2114;
      id v28 = v7;
      id v15 = v14;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag key found for shouldCheckForWalletBiometrics, but the flag is default to enabled, if bag key does not exist , error: %{public}@", buf, 0x20u);
    }
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = objc_opt_class();
      uint64_t v17 = (void *)MEMORY[0x1E4F28ED0];
      id v18 = v16;
      id v19 = [v17 numberWithBool:v11];
      *(_DWORD *)buf = 138543874;
      objc_super v24 = v16;
      __int16 v25 = 2114;
      id v26 = v4;
      __int16 v27 = 2114;
      id v28 = v19;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Express Checkout shouldCheckForWalletBiometrics from the bag: %{public}@", buf, 0x20u);
    }
  }

  return v11;
}

+ (BOOL)_isExpressCheckoutEnabledForBag:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AMSSetLogKeyIfNeeded();
  id v5 = [v3 BOOLForKey:@"applePayExpressCheckoutEnabled"];
  id v23 = 0;
  id v6 = [v5 valueWithError:&v23];
  id v7 = v23;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v3 BOOLForKey:@"applePayExpressCheckoutEnabled"];
    id v22 = v7;
    id v9 = [v8 valueWithError:&v22];
    id v10 = v22;

    uint64_t v11 = [v9 BOOLValue];
    BOOL v12 = v11;
    id v7 = v10;
  }
  else
  {
    BOOL v12 = 0;
  }

  if (v7)
  {
    id v13 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    int v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      __int16 v25 = v15;
      __int16 v26 = 2114;
      __int16 v27 = v4;
      __int16 v28 = 2114;
      uint64_t v29 = @"applePayExpressCheckoutEnabled";
      __int16 v30 = 2114;
      id v31 = v7;
      id v16 = v15;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag key found: %{public}@, error: %{public}@", buf, 0x2Au);
    }
    LOBYTE(v12) = 0;
  }
  else
  {
    id v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    int v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      id v18 = (void *)MEMORY[0x1E4F28ED0];
      id v19 = v17;
      uint64_t v20 = [v18 numberWithBool:v12];
      *(_DWORD *)buf = 138543874;
      __int16 v25 = v17;
      __int16 v26 = 2114;
      __int16 v27 = v4;
      __int16 v28 = 2114;
      uint64_t v29 = v20;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Express Checkout bag enabled status: %{public}@", buf, 0x20u);
    }
  }

  return v12;
}

+ (BOOL)_isExpressCheckoutRecordUserChoiceEnabledForBag:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AMSSetLogKeyIfNeeded();
  id v5 = [v3 BOOLForKey:@"applePayExpressCheckoutRecordUserChoiceEnabled"];
  id v22 = 0;
  id v6 = [v5 valueWithError:&v22];
  id v7 = v22;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v3 BOOLForKey:@"applePayExpressCheckoutRecordUserChoiceEnabled"];
    id v21 = v7;
    id v9 = [v8 valueWithError:&v21];
    id v10 = v21;

    uint64_t v11 = [v9 BOOLValue];
    id v7 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }

  if (v7)
  {
    BOOL v12 = +[AMSLogConfig sharedPurchaseConfig];
    if (!v12)
    {
      BOOL v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      objc_super v24 = v14;
      __int16 v25 = 2114;
      __int16 v26 = v4;
      __int16 v27 = 2114;
      __int16 v28 = @"applePayExpressCheckoutEnabled";
      __int16 v29 = 2114;
      id v30 = v7;
      id v15 = v14;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag key found: %{public}@, error: %{public}@", buf, 0x2Au);
    }
    LOBYTE(v11) = 1;
  }
  else
  {
    BOOL v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      BOOL v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_opt_class();
      uint64_t v17 = (void *)MEMORY[0x1E4F28ED0];
      id v18 = v16;
      id v19 = [v17 numberWithBool:v11];
      *(_DWORD *)buf = 138543874;
      objc_super v24 = v16;
      __int16 v25 = 2114;
      __int16 v26 = v4;
      __int16 v27 = 2114;
      __int16 v28 = v19;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Express Checkout Record User Choice bag enabled status: %{public}@", buf, 0x20u);
    }
  }

  return v11;
}

- (int64_t)expressCheckoutMode
{
  return self->_expressCheckoutMode;
}

- (void)setExpressCheckoutMode:(int64_t)a3
{
  self->_expressCheckoutMode = a3;
}

- (AMSURLRequestProperties)parentProperties
{
  return self->_parentProperties;
}

- (void)setParentProperties:(id)a3
{
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (AMSBuyParams)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_parentProperties, 0);
}

@end