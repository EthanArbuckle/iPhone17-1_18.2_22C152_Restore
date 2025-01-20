@interface AMSPurchaseSIWATask
- (AKAuthorization)authorization;
- (AKCredentialRequestContext)requestContext;
- (AMSPurchaseSIWA)purchaseSIWA;
- (AMSPurchaseSIWATask)initWithPurchaseSIWA:(id)a3 bag:(id)a4;
- (BOOL)_beginAuthorizationWasPerformed;
- (BOOL)_siwaDidCommence;
- (BOOL)_willRequireAskToBuyForTaskInfo:(id)a3;
- (BOOL)purchaseRequiresAuthorization;
- (NSError)siwaError;
- (NSUUID)continuationRequestIdentifier;
- (id)_beginAuthorization;
- (id)_cancelAuthorization;
- (id)_continueAuthorization;
- (id)newAuthorizationController;
- (id)performPreActionRequestForTaskInfo:(id)a3 requiresAuthorization:(BOOL)a4;
- (id)performPreauthenticate;
- (id)performPurchaseSIWA;
- (id)preauthenticateOptions;
- (void)_updateRequestContextWithPurchaseInfo:(id)a3;
- (void)setAuthorization:(id)a3;
- (void)setContinuationRequestIdentifier:(id)a3;
- (void)setPurchaseRequiresAuthorization:(BOOL)a3;
- (void)setPurchaseSIWA:(id)a3;
- (void)setRequestContext:(id)a3;
- (void)setSiwaError:(id)a3;
@end

@implementation AMSPurchaseSIWATask

- (AMSPurchaseSIWATask)initWithPurchaseSIWA:(id)a3 bag:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSPurchaseSIWATask;
  v7 = [(AMSPurchaseTask *)&v10 initWithPurchase:v6 bag:a4];
  v8 = v7;
  if (v7) {
    [(AMSPurchaseSIWATask *)v7 setPurchaseSIWA:v6];
  }

  return v8;
}

- (id)performPreActionRequestForTaskInfo:(id)a3 requiresAuthorization:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 properties];
  v8 = [v7 logUUID];

  LODWORD(v7) = [(AMSPurchaseSIWATask *)self _willRequireAskToBuyForTaskInfo:v6];
  if (v7)
  {
    v9 = [(AMSPurchaseTask *)self purchaseInfo];
    int v10 = [v9 hasBeenAuthedForBuy];

    if (v10)
    {
      v11 = +[AMSLogConfig sharedConfig];
      if (!v11)
      {
        v11 = +[AMSLogConfig sharedConfig];
      }
      v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v28 = (id)objc_opt_class();
        __int16 v29 = 2114;
        v30 = v8;
        id v13 = v28;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cancelling SiWA because pre-auth and AtB is enabled for this purchase", buf, 0x16u);
      }
      v14 = [(AMSPurchaseSIWATask *)self _cancelAuthorization];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __80__AMSPurchaseSIWATask_performPreActionRequestForTaskInfo_requiresAuthorization___block_invoke;
      v25[3] = &unk_1E55A5D98;
      v25[4] = self;
      id v26 = v8;
      v15 = [v14 continueWithBinaryPromiseBlock:v25];
      v16 = v26;
      goto LABEL_20;
    }
    v21 = AMSError(12, @"Skipped SiWA due to AtB", @"Did not begin SiWA authorization due to AtB being enabled", 0);
    [(AMSPurchaseSIWATask *)self setSiwaError:v21];

    v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      v17 = +[AMSLogConfig sharedConfig];
    }
    v18 = [v17 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:

      v15 = +[AMSBinaryPromise promiseWithSuccess];
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138543618;
    id v28 = (id)objc_opt_class();
    __int16 v29 = 2114;
    v30 = v8;
    id v19 = v28;
    v20 = "%{public}@: [%{public}@] Skipping SiWA commencement because AtB is enabled for this purchase";
LABEL_17:
    _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);

    goto LABEL_18;
  }
  if ([(AMSPurchaseSIWATask *)self _beginAuthorizationWasPerformed])
  {
    v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      v17 = +[AMSLogConfig sharedConfig];
    }
    v18 = [v17 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138543618;
    id v28 = (id)objc_opt_class();
    __int16 v29 = 2114;
    v30 = v8;
    id v19 = v28;
    v20 = "%{public}@: [%{public}@] Will not commence SiWA authorization during pre-action step due to it already being performed";
    goto LABEL_17;
  }
  [(AMSPurchaseSIWATask *)self setPurchaseRequiresAuthorization:v4];
  v14 = [(AMSPurchaseSIWATask *)self _beginAuthorization];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__AMSPurchaseSIWATask_performPreActionRequestForTaskInfo_requiresAuthorization___block_invoke_12;
  v23[3] = &unk_1E55A5D98;
  v23[4] = self;
  id v24 = v8;
  v15 = [v14 continueWithBinaryPromiseBlock:v23];
  v16 = v24;
LABEL_20:

LABEL_21:
  return v15;
}

id __80__AMSPurchaseSIWATask_performPreActionRequestForTaskInfo_requiresAuthorization___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 40);
      int v13 = 138543874;
      v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      id v18 = v4;
      id v9 = v7;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cancel pre-auth SiWA authorization with error %{public}@", (uint8_t *)&v13, 0x20u);
    }
  }
  int v10 = AMSError(12, @"Cancelled initiated SiWA due to pre-auth and AtB", @"Did not continue SiWA authorization due to pre-auth and AtB being enabled", 0);
  [*(id *)(a1 + 32) setSiwaError:v10];

  v11 = +[AMSBinaryPromise promiseWithSuccess];

  return v11;
}

id __80__AMSPurchaseSIWATask_performPreActionRequestForTaskInfo_requiresAuthorization___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) setSiwaError:v6];
    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)__int16 v15 = 138543874;
      *(void *)&v15[4] = v9;
      *(_WORD *)&v15[12] = 2114;
      *(void *)&v15[14] = v10;
      *(_WORD *)&v15[22] = 2114;
      id v16 = v6;
      id v11 = v9;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to begin SiWA authorization with error %{public}@", v15, 0x20u);
    }
  }
  if (objc_msgSend(v6, "code", *(_OWORD *)v15, *(void *)&v15[16], v16) == -7003 || objc_msgSend(v6, "code") == -7034)
  {
    uint64_t v12 = +[AMSBinaryPromise promiseWithError:v6];
  }
  else
  {
    uint64_t v12 = +[AMSBinaryPromise promiseWithSuccess];
  }
  int v13 = (void *)v12;

  return v13;
}

- (id)performPreauthenticate
{
  [(AMSPurchaseSIWATask *)self setPurchaseRequiresAuthorization:1];
  v3 = [(AMSPurchaseSIWATask *)self _beginAuthorization];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__AMSPurchaseSIWATask_performPreauthenticate__block_invoke;
  v6[3] = &unk_1E55A5DC0;
  v6[4] = self;
  id v4 = [v3 continueWithBlock:v6];

  return v4;
}

id __45__AMSPurchaseSIWATask_performPreauthenticate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [*(id *)(a1 + 32) setSiwaError:v4];
  if (v4)
  {
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      uint64_t v8 = *(void **)(a1 + 32);
      id v9 = v7;
      uint64_t v10 = [v8 purchaseSIWA];
      id v11 = [v10 logUUID];
      *(_DWORD *)buf = 138543874;
      id v16 = v7;
      __int16 v17 = 2114;
      id v18 = v11;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to begin SiWA authorization during pre-authentication with error %{public}@", buf, 0x20u);
    }
  }
  v14.receiver = *(id *)(a1 + 32);
  v14.super_class = (Class)AMSPurchaseSIWATask;
  uint64_t v12 = objc_msgSendSuper2(&v14, sel_performPreauthenticate);

  return v12;
}

- (id)preauthenticateOptions
{
  v7.receiver = self;
  v7.super_class = (Class)AMSPurchaseSIWATask;
  v3 = [(AMSPurchaseTask *)&v7 preauthenticateOptions];
  id v4 = [(AMSPurchaseSIWATask *)self purchaseSIWA];
  id v5 = [v4 appProvidedData];
  [v3 setAppProvidedData:v5];

  return v3;
}

- (id)performPurchaseSIWA
{
  v3 = [(AMSPurchaseTask *)self performPurchase];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__AMSPurchaseSIWATask_performPurchaseSIWA__block_invoke;
  v6[3] = &unk_1E55A5E10;
  v6[4] = self;
  id v4 = [v3 continueWithBlock:v6];

  return v4;
}

id __42__AMSPurchaseSIWATask_performPurchaseSIWA__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = [*(id *)(a1 + 32) purchaseSIWA];
  uint64_t v8 = [v7 logUUID];

  int v9 = [*(id *)(a1 + 32) _siwaDidCommence];
  if (v6)
  {
    if (!v9)
    {
      objc_super v14 = +[AMSPromise promiseWithError:v6];
      goto LABEL_29;
    }
    uint64_t v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      uint64_t v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v38 = (id)objc_opt_class();
      __int16 v39 = 2114;
      v40 = v8;
      id v12 = v38;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Cancelling SiWA authorization due to a failed purchase", buf, 0x16u);
    }
    int v13 = [*(id *)(a1 + 32) _cancelAuthorization];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __42__AMSPurchaseSIWATask_performPurchaseSIWA__block_invoke_18;
    v34[3] = &unk_1E559E2E8;
    v34[4] = *(void *)(a1 + 32);
    id v35 = v8;
    id v36 = v6;
    objc_super v14 = [(AMSPurchaseSIWAAuthorizationResult *)v13 continueWithBlock:v34];

    __int16 v15 = v35;
  }
  else
  {
    if (!v9)
    {
      uint64_t v21 = +[AMSLogConfig sharedConfig];
      if (!v21)
      {
        uint64_t v21 = +[AMSLogConfig sharedConfig];
      }
      v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v38 = (id)objc_opt_class();
        __int16 v39 = 2114;
        v40 = v8;
        id v23 = v38;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successful purchase occurred however SiWA did not commence", buf, 0x16u);
      }
      id v24 = [AMSPurchaseSIWAAuthorizationResult alloc];
      v25 = [*(id *)(a1 + 32) siwaError];
      int v13 = [(AMSPurchaseSIWAAuthorizationResult *)v24 initWithAuthorization:0 error:v25];

      id v26 = [[AMSPurchaseSIWAResult alloc] initWithPurchaseResult:v5 authorizationResult:v13];
      objc_super v14 = +[AMSPromise promiseWithResult:v26];

      goto LABEL_28;
    }
    int v16 = [*(id *)(a1 + 32) purchaseRequiresAuthorization];
    uint64_t v17 = +[AMSLogConfig sharedConfig];
    id v18 = (void *)v17;
    if (v16)
    {
      if (!v17)
      {
        id v18 = +[AMSLogConfig sharedConfig];
      }
      __int16 v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v38 = (id)objc_opt_class();
        __int16 v39 = 2114;
        v40 = v8;
        id v20 = v38;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Continuing SiWA authorization after a successful purchase", buf, 0x16u);
      }
      int v13 = [*(id *)(a1 + 32) _continueAuthorization];
    }
    else
    {
      if (!v17)
      {
        id v18 = +[AMSLogConfig sharedConfig];
      }
      v27 = [v18 OSLogObject];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v38 = (id)objc_opt_class();
        __int16 v39 = 2114;
        v40 = v8;
        id v28 = v38;
        _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] ASN was active so using cached SiWA authorization", buf, 0x16u);
      }
      __int16 v29 = [*(id *)(a1 + 32) authorization];
      int v13 = +[AMSPromise promiseWithResult:v29];
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __42__AMSPurchaseSIWATask_performPurchaseSIWA__block_invoke_21;
    v31[3] = &unk_1E55A5DE8;
    v31[4] = *(void *)(a1 + 32);
    id v32 = v8;
    id v33 = v5;
    objc_super v14 = [(AMSPurchaseSIWAAuthorizationResult *)v13 continueWithBlock:v31];

    __int16 v15 = v32;
  }

LABEL_28:
LABEL_29:

  return v14;
}

id __42__AMSPurchaseSIWATask_performPurchaseSIWA__block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_super v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)id v12 = 138543874;
      *(void *)&v12[4] = v7;
      *(_WORD *)&v12[12] = 2114;
      *(void *)&v12[14] = v8;
      *(_WORD *)&v12[22] = 2114;
      id v13 = v4;
      id v9 = v7;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to cancel SiWA authorization with error %{public}@", v12, 0x20u);
    }
  }
  uint64_t v10 = +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", *(void *)(a1 + 48), *(_OWORD *)v12, *(void *)&v12[16], v13);

  return v10;
}

id __42__AMSPurchaseSIWATask_performPurchaseSIWA__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_super v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      objc_super v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)__int16 v19 = 138543874;
      *(void *)&v19[4] = v9;
      *(_WORD *)&v19[12] = 2114;
      *(void *)&v19[14] = v10;
      *(_WORD *)&v19[22] = 2114;
      id v20 = v6;
      id v11 = v9;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to continue SiWA authorization with error %{public}@", v19, 0x20u);
    }
    id v12 = [AMSPurchaseSIWAAuthorizationResult alloc];
    id v13 = 0;
    id v14 = v6;
  }
  else
  {
    id v12 = [AMSPurchaseSIWAAuthorizationResult alloc];
    id v13 = v5;
    id v14 = 0;
  }
  __int16 v15 = -[AMSPurchaseSIWAAuthorizationResult initWithAuthorization:error:](v12, "initWithAuthorization:error:", v13, v14, *(_OWORD *)v19, *(void *)&v19[16], v20);
  int v16 = [[AMSPurchaseSIWAResult alloc] initWithPurchaseResult:*(void *)(a1 + 48) authorizationResult:v15];
  uint64_t v17 = +[AMSPromise promiseWithResult:v16];

  return v17;
}

- (id)_beginAuthorization
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    objc_super v7 = [(AMSPurchaseSIWATask *)self purchaseSIWA];
    uint64_t v8 = [v7 logUUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = v5;
    __int16 v42 = 2114;
    v43 = v8;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Commencing begin authorization", buf, 0x16u);
  }
  id v9 = [(AMSPurchaseSIWATask *)self newAuthorizationController];
  BOOL v10 = [(AMSPurchaseSIWATask *)self purchaseRequiresAuthorization];
  uint64_t v11 = +[AMSLogConfig sharedConfig];
  id v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_opt_class();
      id v15 = v14;
      int v16 = [(AMSPurchaseSIWATask *)self purchaseSIWA];
      uint64_t v17 = [v16 logUUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v14;
      __int16 v42 = 2114;
      v43 = v17;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoking beginAuthorization", buf, 0x16u);
    }
    id v18 = objc_alloc_init(AMSPromise);
    __int16 v19 = [(AMSPurchaseSIWATask *)self requestContext];
    id v20 = [(AMSPromise *)v18 completionHandlerAdapter];
    [v9 beginAuthorizationWithContext:v19 completion:v20];

    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __42__AMSPurchaseSIWATask__beginAuthorization__block_invoke;
    id v38 = &unk_1E55A5E38;
    __int16 v39 = self;
    uint64_t v21 = &v35;
  }
  else
  {
    if (!v11)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    v22 = [v12 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = objc_opt_class();
      id v24 = v23;
      v25 = [(AMSPurchaseSIWATask *)self purchaseSIWA];
      id v26 = [v25 logUUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v23;
      __int16 v42 = 2114;
      v43 = v26;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Invoking performAuthorization", buf, 0x16u);
    }
    id v18 = objc_alloc_init(AMSPromise);
    v27 = [(AMSPurchaseSIWATask *)self requestContext];
    id v28 = [(AMSPromise *)v18 completionHandlerAdapter];
    [v9 performAuthorizationWithContext:v27 completion:v28];

    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    id v32 = __42__AMSPurchaseSIWATask__beginAuthorization__block_invoke_26;
    id v33 = &unk_1E55A5E60;
    v34 = self;
    uint64_t v21 = &v30;
  }
  -[AMSPromise addSuccessBlock:](v18, "addSuccessBlock:", v21, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39);

  return v18;
}

void __42__AMSPurchaseSIWATask__beginAuthorization__block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 selectedRequest];
  v3 = [v4 requestIdentifier];
  [*(id *)(a1 + 32) setContinuationRequestIdentifier:v3];
}

uint64_t __42__AMSPurchaseSIWATask__beginAuthorization__block_invoke_26(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAuthorization:a2];
}

- (id)_continueAuthorization
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSPurchaseTask *)self purchaseInfo];
  [(AMSPurchaseSIWATask *)self _updateRequestContextWithPurchaseInfo:v3];

  id v4 = objc_alloc_init(AMSPromise);
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [(AMSPurchaseSIWATask *)self purchaseSIWA];
    BOOL v10 = [v9 logUUID];
    int v15 = 138543618;
    int v16 = v7;
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Commencing continue authorization", (uint8_t *)&v15, 0x16u);
  }
  id v11 = [(AMSPurchaseSIWATask *)self newAuthorizationController];
  id v12 = [(AMSPurchaseSIWATask *)self requestContext];
  id v13 = [(AMSPromise *)v4 completionHandlerAdapter];
  [v11 continueAuthorizationWithContext:v12 completion:v13];

  return v4;
}

- (id)_cancelAuthorization
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSPurchaseTask *)self purchaseInfo];
  [(AMSPurchaseSIWATask *)self _updateRequestContextWithPurchaseInfo:v3];

  id v4 = objc_alloc_init(AMSPromise);
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [(AMSPurchaseSIWATask *)self purchaseSIWA];
    BOOL v10 = [v9 logUUID];
    int v15 = 138543618;
    int v16 = v7;
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Commencing cancel authorization", (uint8_t *)&v15, 0x16u);
  }
  id v11 = [(AMSPurchaseSIWATask *)self newAuthorizationController];
  id v12 = [(AMSPurchaseSIWATask *)self requestContext];
  id v13 = [(AMSPromise *)v4 errorOnlyCompletionHandlerAdapter];
  [v11 cancelAuthorizationWithContext:v12 completion:v13];

  return v4;
}

- (void)_updateRequestContextWithPurchaseInfo:(id)a3
{
  id v18 = a3;
  id v4 = [(AMSPurchaseSIWATask *)self continuationRequestIdentifier];
  id v5 = [v4 UUIDString];
  id v6 = [(AMSPurchaseSIWATask *)self requestContext];
  objc_msgSend(v6, "set_continuationRequestIdentifier:", v5);

  objc_super v7 = [v18 localAuthContext];
  id v8 = [v7 externalizedContext];
  id v9 = [(AMSPurchaseSIWATask *)self requestContext];
  objc_msgSend(v9, "set_externalLocalAuthData:", v8);

  BOOL v10 = [(AMSPurchaseSIWATask *)self requestContext];
  uint64_t v11 = [v10 _externalLocalAuthData];
  if (v11)
  {
    id v12 = (void *)v11;
  }
  else
  {
    id v13 = [(AMSPurchaseSIWATask *)self purchaseSIWA];
    id v14 = [v13 serviceID];

    if (!v14) {
      goto LABEL_6;
    }
    BOOL v10 = [v18 idmsTokens];
    id v12 = [(AMSPurchaseSIWATask *)self purchaseSIWA];
    int v15 = [v12 serviceID];
    int v16 = [v10 objectForKeyedSubscript:v15];
    __int16 v17 = [(AMSPurchaseSIWATask *)self requestContext];
    objc_msgSend(v17, "set_externalAuthToken:", v16);
  }
LABEL_6:
}

- (BOOL)_beginAuthorizationWasPerformed
{
  v3 = [(AMSPurchaseSIWATask *)self continuationRequestIdentifier];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(AMSPurchaseSIWATask *)self authorization];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(AMSPurchaseSIWATask *)self siwaError];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (BOOL)_siwaDidCommence
{
  if (![(AMSPurchaseSIWATask *)self _beginAuthorizationWasPerformed]) {
    return 0;
  }
  v3 = [(AMSPurchaseSIWATask *)self siwaError];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)_willRequireAskToBuyForTaskInfo:(id)a3
{
  v3 = [a3 response];
  BOOL v4 = objc_msgSend(v3, "ams_valueForHTTPHeaderField:", @"buyproductwillrequireatb");
  id v5 = [v4 lowercaseString];
  char v6 = [v5 isEqualToString:@"true"];

  return v6;
}

- (id)newAuthorizationController
{
  return objc_alloc_init(MEMORY[0x1E4F4EF90]);
}

- (AKCredentialRequestContext)requestContext
{
  v15[2] = *MEMORY[0x1E4F143B8];
  requestContext = self->_requestContext;
  if (!requestContext)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F4F088]);
    id v5 = [(AMSPurchaseSIWATask *)self purchaseSIWA];
    char v6 = [v5 teamID];
    [v4 setTeamID:v6];

    objc_super v7 = [(AMSPurchaseSIWATask *)self purchaseSIWA];
    id v8 = [v7 bundleID];
    [v4 setBundleID:v8];

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F4F008]) initWithProxiedClientContext:v4];
    id v10 = objc_alloc_init(MEMORY[0x1E4F4EFA8]);
    uint64_t v11 = *MEMORY[0x1E4F4EE18];
    v15[0] = *MEMORY[0x1E4F4EE20];
    v15[1] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    [v10 setRequestedScopes:v12];

    [v9 setAuthorizationRequest:v10];
    id v13 = self->_requestContext;
    self->_requestContext = (AKCredentialRequestContext *)v9;

    requestContext = self->_requestContext;
  }
  return requestContext;
}

- (AMSPurchaseSIWA)purchaseSIWA
{
  return self->_purchaseSIWA;
}

- (void)setPurchaseSIWA:(id)a3
{
}

- (void)setRequestContext:(id)a3
{
}

- (NSUUID)continuationRequestIdentifier
{
  return self->_continuationRequestIdentifier;
}

- (void)setContinuationRequestIdentifier:(id)a3
{
}

- (NSError)siwaError
{
  return self->_siwaError;
}

- (void)setSiwaError:(id)a3
{
}

- (BOOL)purchaseRequiresAuthorization
{
  return self->_purchaseRequiresAuthorization;
}

- (void)setPurchaseRequiresAuthorization:(BOOL)a3
{
  self->_purchaseRequiresAuthorization = a3;
}

- (AKAuthorization)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_siwaError, 0);
  objc_storeStrong((id *)&self->_continuationRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_purchaseSIWA, 0);
}

@end