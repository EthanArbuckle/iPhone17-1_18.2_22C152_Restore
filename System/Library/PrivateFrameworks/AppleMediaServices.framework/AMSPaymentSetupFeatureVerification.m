@interface AMSPaymentSetupFeatureVerification
- (AMSPaymentSetupFeatureVerification)initWithIdentifier:(id)a3;
- (BOOL)isPaymentSetupFeatureSupportedWithError:(id *)a3;
- (NSString)identifier;
- (id)performPaymentSetupFeatureLookup;
- (void)setIdentifier:(id)a3;
@end

@implementation AMSPaymentSetupFeatureVerification

- (AMSPaymentSetupFeatureVerification)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPaymentSetupFeatureVerification;
  v5 = [(AMSPaymentSetupFeatureVerification *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (BOOL)isPaymentSetupFeatureSupportedWithError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = AMSSetLogKeyIfNeeded();
  v5 = [(AMSPaymentSetupFeatureVerification *)self performPaymentSetupFeatureLookup];
  id v21 = 0;
  uint64_t v6 = [v5 resultWithError:&v21];
  id v7 = v21;
  if (v7)
  {
    v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    objc_super v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v23 = v10;
      __int16 v24 = 2114;
      v25 = v4;
      __int16 v26 = 2114;
      id v27 = v7;
      id v11 = v10;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to find feature with error: %{public}@", buf, 0x20u);
    }
    goto LABEL_7;
  }
  if (!v6)
  {
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_14;
  }
  v13 = +[AMSLogConfig sharedConfig];
  if (!v13)
  {
    v13 = +[AMSLogConfig sharedConfig];
  }
  v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_opt_class();
    v16 = (void *)MEMORY[0x1E4F28ED0];
    id v17 = v15;
    v18 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v6, "state"));
    v19 = AMSHashIfNeeded(v18);
    *(_DWORD *)buf = 138543874;
    v23 = v15;
    __int16 v24 = 2114;
    v25 = v4;
    __int16 v26 = 2114;
    id v27 = v19;
    _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Candidate payment setup feature state: %{public}@", buf, 0x20u);
  }
  BOOL v12 = [v6 state] == 1;
LABEL_14:

  return v12;
}

- (id)performPaymentSetupFeatureLookup
{
  v3 = AMSSetLogKeyIfNeeded();
  objc_initWeak(&location, self);
  id v4 = [AMSMutableLazyPromise alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke;
  v8[3] = &unk_1E55A0A40;
  objc_copyWeak(&v10, &location);
  id v5 = v3;
  id v9 = v5;
  uint64_t v6 = [(AMSMutableLazyPromise *)v4 initWithBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_alloc_init((Class)_MergedGlobals_73[0]());
  uint64_t v6 = [WeakRetained identifier];
  [v5 setReferrerIdentifier:v6];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__54;
  v13[4] = __Block_byref_object_dispose__54;
  id v14 = 0;
  Class v7 = (Class)off_1EB38AA00();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke_3;
  v9[3] = &unk_1E55A50C0;
  v9[4] = WeakRetained;
  id v10 = *(id *)(a1 + 32);
  BOOL v12 = v13;
  id v8 = v3;
  id v11 = v8;
  [(objc_class *)v7 paymentSetupFeaturesForConfiguration:v5 completion:v9];

  _Block_object_dispose(v13, 8);
}

void __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (void *)MEMORY[0x1E4F28ED0];
    id v9 = v6;
    id v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    id v11 = AMSHashIfNeeded(v10);
    *(_DWORD *)buf = 138543874;
    v25 = v6;
    __int16 v26 = 2114;
    uint64_t v27 = v7;
    __int16 v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found %{public}@ payment setup features", buf, 0x20u);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke_4;
  v21[3] = &unk_1E55A5098;
  BOOL v12 = *(void **)(a1 + 40);
  v21[4] = *(void *)(a1 + 32);
  id v13 = v12;
  uint64_t v14 = *(void *)(a1 + 56);
  id v22 = v13;
  uint64_t v23 = v14;
  [v3 enumerateObjectsUsingBlock:v21];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:");
  }
  else
  {
    v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_opt_class();
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v25 = v17;
      __int16 v26 = 2114;
      uint64_t v27 = v18;
      id v19 = v17;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to find payment setup feature", buf, 0x16u);
    }
    v20 = AMSError(7, @"Payment Setup Feature Error", @"Did not find payment setup feature", 0);
    [*(id *)(a1 + 48) finishWithError:v20];
  }
}

void __70__AMSPaymentSetupFeatureVerification_performPaymentSetupFeatureLookup__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v5;
    BOOL v12 = a4;
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
    id v22 = v10;
    v15 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v7, "type"));
    v16 = AMSHashIfNeeded(v15);
    *(_DWORD *)buf = 138543874;
    __int16 v24 = v10;
    __int16 v25 = 2114;
    uint64_t v26 = v13;
    a4 = v12;
    id v5 = v11;
    __int16 v27 = 2114;
    __int16 v28 = v16;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking payment setup feature with type: %{public}@", buf, 0x20u);
  }
  if ([v7 type] == 1)
  {
    id v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_opt_class();
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v19;
      __int16 v25 = 2114;
      uint64_t v26 = v20;
      id v21 = v19;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Found candidate payment setup feature", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    *a4 = 1;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end