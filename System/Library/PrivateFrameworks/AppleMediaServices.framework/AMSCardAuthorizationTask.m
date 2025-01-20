@interface AMSCardAuthorizationTask
- (AMSCardAuthorizationTask)initWithPaymentSession:(id)a3;
- (AMSMetricsEvent)metricsEvent;
- (AMSMutableBinaryPromise)authorizationPromise;
- (BOOL)didBiometricsLockout;
- (BOOL)didCancelHomeButton;
- (NSDictionary)paymentSession;
- (NSMutableArray)userActions;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (NSString)presentationSceneBundleIdentifier;
- (NSString)presentationSceneIdentifier;
- (PKPayment)payment;
- (id)_metricsTimestamp;
- (id)_metricsUserActionDictionary;
- (id)_presentPaymentRequest:(id)a3;
- (id)performCardAuthorization;
- (int64_t)confirmationStyle;
- (void)_metricsPost;
- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4;
- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4;
- (void)paymentAuthorizationControllerDidFinish:(id)a3;
- (void)setAuthorizationPromise:(id)a3;
- (void)setConfirmationStyle:(int64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDidBiometricsLockout:(BOOL)a3;
- (void)setDidCancelHomeButton:(BOOL)a3;
- (void)setMetricsEvent:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPayment:(id)a3;
- (void)setPresentationSceneBundleIdentifier:(id)a3;
- (void)setPresentationSceneIdentifier:(id)a3;
- (void)setUserActions:(id)a3;
@end

@implementation AMSCardAuthorizationTask

- (AMSCardAuthorizationTask)initWithPaymentSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSCardAuthorizationTask;
  v6 = [(AMSTask *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_didBiometricsLockout = 0;
    v6->_didCancelHomeButton = 0;
    objc_storeStrong((id *)&v6->_paymentSession, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    userActions = v7->_userActions;
    v7->_userActions = v8;
  }
  return v7;
}

- (id)performCardAuthorization
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AMSCardAuthorizationTask_performCardAuthorization__block_invoke;
  v5[3] = &unk_1E55A09F0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = [(AMSTask *)self performTaskWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __52__AMSCardAuthorizationTask_performCardAuthorization__block_invoke(uint64_t a1, void *a2)
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = AMSSetLogKeyIfNeeded();
  id v6 = objc_alloc_init((Class)_MergedGlobals_3[0]());
  [v6 setAPIType:0];
  id v7 = objc_alloc((Class)off_1EB38A950[0]());
  v8 = [*(id *)(a1 + 32) paymentSession];
  v9 = (void *)[v7 initWithDictionary:v8];

  [v6 setMerchantSession:v9];
  [v6 setExpectsMerchantSession:1];
  [v6 setMerchantCapabilities:13];
  v10 = [*(id *)(a1 + 32) currencyCode];
  [v6 setCurrencyCode:v10];

  objc_super v11 = [*(id *)(a1 + 32) countryCode];
  AMSSetCountryCodeOnPaymentRequest(v11, v6);

  v12 = [*(id *)(a1 + 32) countryCode];

  if (!v12)
  {
    v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      v13 = +[AMSLogConfig sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v74 = (id)objc_opt_class();
      __int16 v75 = 2114;
      v76 = v5;
      id v15 = v74;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Failed to find countryCode", buf, 0x16u);
    }
  }
  v16 = [*(id *)(a1 + 32) currencyCode];

  if (!v16)
  {
    v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      v17 = +[AMSLogConfig sharedConfig];
    }
    v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v74 = v19;
      __int16 v75 = 2114;
      v76 = v5;
      id v20 = v19;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Failed to find currencyCode", buf, 0x16u);
    }
  }
  uint64_t v21 = [WeakRetained confirmationStyle];
  if (v21)
  {
    if (v21 != 1) {
      goto LABEL_18;
    }
    uint64_t v22 = 1;
  }
  else
  {
    uint64_t v22 = 6;
  }
  [v6 setConfirmationStyle:v22];
LABEL_18:
  Class v23 = off_1EB38A958();
  v24 = [MEMORY[0x1E4F28C28] zero];
  v25 = [(objc_class *)v23 summaryItemWithLabel:&stru_1EDCA7308 amount:v24];

  v79[0] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:1];
  [v6 setPaymentSummaryItems:v26];

  [v6 setRequestType:3];
  v27 = [*(id *)(a1 + 32) passSerialNumber];
  [v6 setPassSerialNumber:v27];

  v28 = [*(id *)(a1 + 32) passTypeIdentifier];
  [v6 setPassTypeIdentifier:v28];

  v29 = [*(id *)(a1 + 32) passSerialNumber];

  if (!v29)
  {
    v30 = +[AMSLogConfig sharedConfig];
    if (!v30)
    {
      v30 = +[AMSLogConfig sharedConfig];
    }
    v31 = [v30 OSLogObject];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v74 = v32;
      __int16 v75 = 2114;
      v76 = v5;
      v33 = v9;
      v34 = v5;
      v35 = a2;
      id v36 = v32;
      _os_log_impl(&dword_18D554000, v31, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Failed to find serialNumber", buf, 0x16u);

      a2 = v35;
      id v5 = v34;
      v9 = v33;
    }
  }
  v37 = [*(id *)(a1 + 32) passTypeIdentifier];

  if (!v37)
  {
    v38 = +[AMSLogConfig sharedConfig];
    if (!v38)
    {
      v38 = +[AMSLogConfig sharedConfig];
    }
    v39 = [v38 OSLogObject];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v74 = v40;
      __int16 v75 = 2114;
      v76 = v5;
      id v41 = v40;
      _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Failed to find passTypeIdentifier", buf, 0x16u);
    }
  }
  v42 = [WeakRetained _presentPaymentRequest:v6];
  id v72 = 0;
  v43 = [v42 resultWithError:&v72];
  id v44 = v72;

  if (v44)
  {
    [WeakRetained _metricsPost];
    v45 = 0;
    *a2 = v44;
    goto LABEL_45;
  }
  if (![v43 BOOLValue])
  {
    v70 = v9;
    v55 = a2;
    v56 = +[AMSLogConfig sharedConfig];
    if (!v56)
    {
      v56 = +[AMSLogConfig sharedConfig];
    }
    v57 = [v56 OSLogObject];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v74 = v58;
      __int16 v75 = 2114;
      v76 = v5;
      id v59 = v58;
      _os_log_impl(&dword_18D554000, v57, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Failed to present view controller", buf, 0x16u);
    }
    [WeakRetained _metricsPost];
    AMSError(0, @"Card Authorization Error", @"Unknown Error", 0);
    v45 = 0;
    void *v55 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  v46 = objc_alloc_init(AMSMutableBinaryPromise);
  [WeakRetained setAuthorizationPromise:v46];

  v47 = [WeakRetained authorizationPromise];
  [v47 resultWithError:a2];

  if (*a2)
  {
    v70 = v9;
    v48 = v5;
    v49 = a2;
    v50 = +[AMSLogConfig sharedConfig];
    if (!v50)
    {
      v50 = +[AMSLogConfig sharedConfig];
    }
    v51 = [v50 OSLogObject];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = objc_opt_class();
      uint64_t v53 = *v49;
      *(_DWORD *)buf = 138543874;
      id v74 = v52;
      __int16 v75 = 2114;
      v76 = v48;
      __int16 v77 = 2114;
      uint64_t v78 = v53;
      id v54 = v52;
      _os_log_impl(&dword_18D554000, v51, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Authorization failed with error: %{public}@", buf, 0x20u);
    }
    [WeakRetained _metricsPost];
    v45 = 0;
    id v5 = v48;
LABEL_44:
    v9 = v70;
    goto LABEL_45;
  }
  v71 = a2;
  v61 = [WeakRetained payment];

  uint64_t v62 = +[AMSLogConfig sharedConfig];
  v63 = (void *)v62;
  if (v61)
  {
    if (!v62)
    {
      v63 = +[AMSLogConfig sharedConfig];
    }
    v64 = [v63 OSLogObject];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v74 = v65;
      __int16 v75 = 2114;
      v76 = v5;
      id v66 = v65;
      _os_log_impl(&dword_18D554000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] performCardAuthorization: Authorization succeeded", buf, 0x16u);
    }
    [WeakRetained _metricsPost];
    v45 = [WeakRetained payment];
  }
  else
  {
    if (!v62)
    {
      v63 = +[AMSLogConfig sharedConfig];
    }
    v67 = [v63 OSLogObject];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v68 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v74 = v68;
      __int16 v75 = 2114;
      v76 = v5;
      id v69 = v68;
      _os_log_impl(&dword_18D554000, v67, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] performCardAuthorization: Authorization failed", buf, 0x16u);
    }
    [WeakRetained _metricsPost];
    AMSError(6, @"Card Authorization Error", @"No payment generated", 0);
    v45 = 0;
    void *v71 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_45:

  return v45;
}

- (void)_metricsPost
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(AMSCardAuthorizationTask *)self metricsEvent];

  if (!v2)
  {
    v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      v3 = +[AMSLogConfig sharedConfig];
    }
    v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_opt_class();
      id v6 = v5;
      id v7 = AMSSetLogKeyIfNeeded();
      int v8 = 138543618;
      v9 = v5;
      __int16 v10 = 2114;
      objc_super v11 = v7;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Metrics post failed for no metrics event", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (id)_metricsTimestamp
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSince1970];
  double v4 = v3;

  id v5 = NSString;
  id v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:(uint64_t)v4];
  id v7 = [v5 stringWithFormat:@"%@", v6];

  return v7;
}

- (id)_metricsUserActionDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v4 = [(AMSCardAuthorizationTask *)self _metricsTimestamp];
  [v3 setObject:v4 forKeyedSubscript:@"responseTime"];

  if ([(AMSCardAuthorizationTask *)self didBiometricsLockout]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"bioLockout"];
  }
  return v3;
}

- (id)_presentPaymentRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [AMSMutableLazyPromise alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__AMSCardAuthorizationTask__presentPaymentRequest___block_invoke;
  v9[3] = &unk_1E55A0A40;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = [(AMSMutableLazyPromise *)v5 initWithBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __51__AMSCardAuthorizationTask__presentPaymentRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)[objc_alloc(getPKPaymentAuthorizationControllerClass()) initWithPaymentRequest:*(void *)(a1 + 32)];
  [v5 setDelegate:WeakRetained];
  [v5 setPrivateDelegate:WeakRetained];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__AMSCardAuthorizationTask__presentPaymentRequest___block_invoke_2;
  v7[3] = &unk_1E55A0A18;
  v7[4] = WeakRetained;
  id v8 = v3;
  id v6 = v3;
  [v5 presentWithCompletion:v7];
}

void __51__AMSCardAuthorizationTask__presentPaymentRequest___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = AMSSetLogKeyIfNeeded();
  uint64_t v5 = +[AMSLogConfig sharedConfig];
  id v6 = (void *)v5;
  if (a2)
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v4;
      id v8 = v13;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] _presentPaymentRequest: Did present view controller", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithResult:&unk_1EDD00E38];
  }
  else
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v6 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543618;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v4;
      id v10 = v13;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] _presentPaymentRequest: Failed to present view controller", (uint8_t *)&v12, 0x16u);
    }
    id v11 = AMSError(0, @"Card Authorization Error", @"Failed to present view controller", 0);
    [*(id *)(a1 + 40) finishWithError:v11];
  }
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AMSCardAuthorizationTask *)self payment];

  id v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = v5 == 0;
    v9 = objc_opt_class();
    id v10 = v9;
    uint64_t v11 = AMSSetLogKeyIfNeeded();
    int v12 = (void *)v11;
    id v13 = @"YES";
    *(_DWORD *)buf = 138543874;
    v17 = v9;
    if (v8) {
      id v13 = @"NO";
    }
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] paymentAuthorizationControllerDidFinish: Card authorization did finish with payment: %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__AMSCardAuthorizationTask_paymentAuthorizationControllerDidFinish___block_invoke;
  v14[3] = &unk_1E559F890;
  objc_copyWeak(&v15, (id *)buf);
  [v4 dismissWithCompletion:v14];
  [v4 setDelegate:0];
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __68__AMSCardAuthorizationTask_paymentAuthorizationControllerDidFinish___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained authorizationPromise];
  [v1 finishWithSuccess];
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BOOL v8 = (void (**)(id, void *))a5;
  v9 = +[AMSLogConfig sharedConfig];
  if (!v9)
  {
    v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    id v12 = v11;
    uint64_t v13 = AMSSetLogKeyIfNeeded();
    __int16 v14 = (void *)v13;
    id v15 = @"YES";
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v11;
    __int16 v23 = 2114;
    if (!v7) {
      id v15 = @"NO";
    }
    uint64_t v24 = v13;
    __int16 v25 = 2114;
    v26 = v15;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] paymentAuthorizationControllerDidFinish: Did finish with payment? %{public}@", buf, 0x20u);
  }
  [(AMSCardAuthorizationTask *)self setPayment:v7];
  if (v7)
  {
    uint64_t v16 = (void *)[objc_alloc(getPKPaymentAuthorizationResultClass_0()) initWithStatus:0 errors:0];
  }
  else
  {
    v17 = AMSError(0, @"Card Authorization Error", @"No payment generated", 0);
    id v18 = objc_alloc(getPKPaymentAuthorizationResultClass_0());
    __int16 v20 = v17;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    uint64_t v16 = (void *)[v18 initWithStatus:1 errors:v19];
  }
  v8[2](v8, v16);
}

- (void)paymentAuthorizationController:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = objc_opt_class();
    id v9 = v8;
    id v10 = AMSSetLogKeyIfNeeded();
    uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
    int v20 = 138543874;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    __int16 v23 = v10;
    __int16 v24 = 2114;
    __int16 v25 = v11;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did encounter authorization event: %{public}@", (uint8_t *)&v20, 0x20u);
  }
  switch(a4)
  {
    case 1uLL:
      id v12 = [(AMSCardAuthorizationTask *)self _metricsUserActionDictionary];
      [v12 setObject:@"authenticate" forKeyedSubscript:@"actionType"];
      [v12 setObject:@"invalidCredentials" forKeyedSubscript:@"reason"];
      [v12 setObject:@"failure" forKeyedSubscript:@"result"];
      uint64_t v13 = @"Biometric";
      goto LABEL_17;
    case 2uLL:
      [(AMSCardAuthorizationTask *)self setDidBiometricsLockout:1];
      return;
    case 3uLL:
      __int16 v14 = [(AMSCardAuthorizationTask *)self _metricsUserActionDictionary];
      id v12 = v14;
      id v15 = @"open";
      goto LABEL_10;
    case 4uLL:
      __int16 v14 = [(AMSCardAuthorizationTask *)self _metricsUserActionDictionary];
      id v12 = v14;
      id v15 = @"cancel";
LABEL_10:
      [v14 setObject:v15 forKeyedSubscript:@"actionType"];
      uint64_t v13 = @"IForgot";
      goto LABEL_17;
    case 5uLL:
      id v12 = [(AMSCardAuthorizationTask *)self _metricsUserActionDictionary];
      [v12 setObject:@"invalidCredentials" forKeyedSubscript:@"reason"];
      uint64_t v16 = @"failure";
      v17 = @"result";
      id v18 = v12;
      goto LABEL_16;
    case 6uLL:
      [(AMSCardAuthorizationTask *)self setDidCancelHomeButton:1];
      return;
    case 7uLL:
      id v18 = [(AMSCardAuthorizationTask *)self _metricsUserActionDictionary];
      id v12 = v18;
      uint64_t v16 = @"enterPasswordPressed";
      goto LABEL_15;
    case 8uLL:
      id v18 = [(AMSCardAuthorizationTask *)self _metricsUserActionDictionary];
      id v12 = v18;
      uint64_t v16 = @"enterPasswordCancelled";
LABEL_15:
      v17 = @"actionType";
LABEL_16:
      [v18 setObject:v16 forKeyedSubscript:v17];
      uint64_t v13 = @"authenticate";
LABEL_17:
      [v12 setObject:v13 forKeyedSubscript:@"targetId"];
      uint64_t v19 = (void *)[v12 copy];

      if (v19)
      {
        [(NSMutableArray *)self->_userActions addObject:v19];
      }
      break;
    default:
      return;
  }
}

- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  BOOL v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    id v10 = v9;
    uint64_t v11 = AMSSetLogKeyIfNeeded();
    int v12 = 138543874;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v11;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Payment sheet will finish with error: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  [v6 setPrivateDelegate:0];
}

- (int64_t)confirmationStyle
{
  return self->_confirmationStyle;
}

- (void)setConfirmationStyle:(int64_t)a3
{
  self->_confirmationStyle = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSDictionary)paymentSession
{
  return self->_paymentSession;
}

- (NSString)presentationSceneBundleIdentifier
{
  return self->_presentationSceneBundleIdentifier;
}

- (void)setPresentationSceneBundleIdentifier:(id)a3
{
}

- (NSString)presentationSceneIdentifier
{
  return self->_presentationSceneIdentifier;
}

- (void)setPresentationSceneIdentifier:(id)a3
{
}

- (AMSMutableBinaryPromise)authorizationPromise
{
  return self->_authorizationPromise;
}

- (void)setAuthorizationPromise:(id)a3
{
}

- (PKPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
}

- (BOOL)didBiometricsLockout
{
  return self->_didBiometricsLockout;
}

- (void)setDidBiometricsLockout:(BOOL)a3
{
  self->_didBiometricsLockout = a3;
}

- (BOOL)didCancelHomeButton
{
  return self->_didCancelHomeButton;
}

- (void)setDidCancelHomeButton:(BOOL)a3
{
  self->_didCancelHomeButton = a3;
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
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_authorizationPromise, 0);
  objc_storeStrong((id *)&self->_presentationSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_presentationSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentSession, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end