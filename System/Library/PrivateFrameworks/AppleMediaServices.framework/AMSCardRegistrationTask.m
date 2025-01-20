@interface AMSCardRegistrationTask
- (AMSCardRegistrationTask)initWithCountryCode:(id)a3 merchantIdentifier:(id)a4;
- (NSString)countryCode;
- (NSString)merchantIdentifier;
- (id)_performCardRegistration;
- (id)performCardRegistration;
- (void)setCountryCode:(id)a3;
- (void)setMerchantIdentifier:(id)a3;
@end

@implementation AMSCardRegistrationTask

- (AMSCardRegistrationTask)initWithCountryCode:(id)a3 merchantIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSCardRegistrationTask;
  v8 = [(AMSTask *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    countryCode = v8->_countryCode;
    v8->_countryCode = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    merchantIdentifier = v8->_merchantIdentifier;
    v8->_merchantIdentifier = (NSString *)v11;
  }
  return v8;
}

- (id)performCardRegistration
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AMSCardRegistrationTask_performCardRegistration__block_invoke;
  v5[3] = &unk_1E55A0D98;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = [(AMSTask *)self performTaskWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __50__AMSCardRegistrationTask_performCardRegistration__block_invoke(uint64_t a1, void **a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = AMSSetLogKeyIfNeeded();
  id v6 = +[AMSLogConfig sharedConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = v8;
    uint64_t v11 = [v9 countryCode];
    int v20 = 138543874;
    v21 = v8;
    __int16 v22 = 2114;
    v23 = v5;
    __int16 v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to fetch wallet card data with countryCode: %{public}@", (uint8_t *)&v20, 0x20u);
  }
  v12 = [WeakRetained _performCardRegistration];
  v13 = [v12 resultWithError:a2];
  if (!v13)
  {
    objc_super v14 = +[AMSLogConfig sharedConfig];
    if (!v14)
    {
      objc_super v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      v17 = *a2;
      int v20 = 138543874;
      v21 = v16;
      __int16 v22 = 2114;
      v23 = v5;
      __int16 v24 = 2114;
      v25 = v17;
      id v18 = v16;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch wallet card data with error: %{public}@", (uint8_t *)&v20, 0x20u);
    }
  }

  return v13;
}

- (id)_performCardRegistration
{
  objc_initWeak(&location, self);
  v2 = [AMSMutableLazyPromise alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__AMSCardRegistrationTask__performCardRegistration__block_invoke;
  v5[3] = &unk_1E55A0DE8;
  objc_copyWeak(&v6, &location);
  v3 = [(AMSMutableLazyPromise *)v2 initWithBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __51__AMSCardRegistrationTask__performCardRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__16;
  v13[4] = __Block_byref_object_dispose__16;
  id v14 = 0;
  id v5 = objc_alloc_init(getPKInAppPaymentServiceClass());
  id v6 = [WeakRetained merchantIdentifier];
  id v7 = [WeakRetained countryCode];
  v8 = [v7 uppercaseString];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__AMSCardRegistrationTask__performCardRegistration__block_invoke_12;
  v10[3] = &unk_1E55A0DC0;
  v10[4] = WeakRetained;
  id v9 = v3;
  id v11 = v9;
  v12 = v13;
  [v5 cardDataForMerchantIdentifier:v6 countryCode:v8 completion:v10];

  _Block_object_dispose(v13, 8);
}

void __51__AMSCardRegistrationTask__performCardRegistration__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AMSSetLogKeyIfNeeded();
  id v5 = [v3 error];

  if (v5)
  {
    id v6 = +[AMSLogConfig sharedConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [v3 error];
      *(_DWORD *)v42 = 138543874;
      *(void *)&v42[4] = v8;
      *(_WORD *)&v42[12] = 2114;
      *(void *)&v42[14] = v4;
      *(_WORD *)&v42[22] = 2114;
      v43 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Card registration failed with error: %{public}@", v42, 0x20u);
    }
    id v11 = *(void **)(a1 + 40);
    v12 = [v3 error];
    v13 = v11;
LABEL_7:
    objc_msgSend(v13, "finishWithError:", v12, *(_OWORD *)v42, *(void *)&v42[16]);

    goto LABEL_26;
  }
  uint64_t v14 = +[AMSLogConfig sharedConfig];
  v15 = (void *)v14;
  if (!v3)
  {
    if (!v14)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v40 = [v15 OSLogObject];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v42 = 138543618;
      *(void *)&v42[4] = objc_opt_class();
      *(_WORD *)&v42[12] = 2114;
      *(void *)&v42[14] = v4;
      id v41 = *(id *)&v42[4];
      _os_log_impl(&dword_18D554000, v40, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Card registration failed for no response", v42, 0x16u);
    }
    v12 = AMSError(7, @"Card Registration Error", @"Card Registration Not Found", 0);
    v13 = *(void **)(a1 + 40);
    goto LABEL_7;
  }
  if (!v14)
  {
    v15 = +[AMSLogConfig sharedConfig];
  }
  v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v42 = 138543618;
    *(void *)&v42[4] = objc_opt_class();
    *(_WORD *)&v42[12] = 2114;
    *(void *)&v42[14] = v4;
    id v17 = *(id *)&v42[4];
    _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Card registration success", v42, 0x16u);
  }
  id v18 = +[AMSLogConfig sharedConfig];
  if (!v18)
  {
    id v18 = +[AMSLogConfig sharedConfig];
  }
  v19 = objc_msgSend(v18, "OSLogObject", *(void *)v42, *(_OWORD *)&v42[8]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = objc_opt_class();
    v21 = (void *)MEMORY[0x1E4F28ED0];
    id v22 = v20;
    v23 = [v3 cardData];
    __int16 v24 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v23, "length"));
    *(_DWORD *)v42 = 138543874;
    *(void *)&v42[4] = v20;
    *(_WORD *)&v42[12] = 2114;
    *(void *)&v42[14] = v4;
    *(_WORD *)&v42[22] = 2114;
    v43 = v24;
    _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Card registration data: %{public}@", v42, 0x20u);
  }
  v25 = +[AMSLogConfig sharedConfig];
  if (!v25)
  {
    v25 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v26 = [v25 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_opt_class();
    id v28 = v27;
    v29 = [v3 brokerURL];
    v30 = AMSLogableURL(v29);
    *(_DWORD *)v42 = 138543874;
    *(void *)&v42[4] = v27;
    *(_WORD *)&v42[12] = 2114;
    *(void *)&v42[14] = v4;
    *(_WORD *)&v42[22] = 2114;
    v43 = v30;
    _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Card registration broker URL: %{public}@", v42, 0x20u);
  }
  v31 = +[AMSLogConfig sharedConfig];
  if (!v31)
  {
    v31 = +[AMSLogConfig sharedConfig];
  }
  v32 = [v31 OSLogObject];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = objc_opt_class();
    id v34 = v33;
    v35 = [v3 paymentServicesURL];
    v36 = AMSLogableURL(v35);
    *(_DWORD *)v42 = 138543874;
    *(void *)&v42[4] = v33;
    *(_WORD *)&v42[12] = 2114;
    *(void *)&v42[14] = v4;
    *(_WORD *)&v42[22] = 2114;
    v43 = v36;
    _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Card registration payment services URL: %{public}@", v42, 0x20u);
  }
  v37 = [[AMSCardRegistrationResult alloc] initWithCardRegistrationResponse:v3];
  uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 8);
  v39 = *(void **)(v38 + 40);
  *(void *)(v38 + 40) = v37;

  [*(id *)(a1 + 40) finishWithResult:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
LABEL_26:
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end