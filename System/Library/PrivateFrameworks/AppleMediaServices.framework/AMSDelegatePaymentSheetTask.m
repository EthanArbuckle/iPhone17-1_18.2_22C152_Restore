@interface AMSDelegatePaymentSheetTask
- (AMSDelegatePaymentSheetRequest)request;
- (AMSDelegatePaymentSheetTask)initWithRequest:(id)a3 bag:(id)a4;
- (id)perform;
- (void)setRequest:(id)a3;
@end

@implementation AMSDelegatePaymentSheetTask

- (AMSDelegatePaymentSheetTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSDelegatePaymentSheetTask;
  v8 = [(AMSPaymentSheetTask *)&v11 initWithRequest:v7 bag:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_request, a3);
  }

  return v9;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__AMSDelegatePaymentSheetTask_perform__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __38__AMSDelegatePaymentSheetTask_perform__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) request];

  if (v2)
  {
    if ([*(id *)(a1 + 32) isCancelled])
    {
      v3 = +[AMSLogConfig sharedConfig];
      if (!v3)
      {
        v3 = +[AMSLogConfig sharedConfig];
      }
      v4 = [v3 OSLogObject];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = objc_opt_class();
        v6 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v5;
        __int16 v31 = 2114;
        v32 = v6;
        _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ending early due to cancelled task", buf, 0x16u);
      }
      id v7 = AMSError(6, @"Early Cancellation", @"The task was cancelled before it began.", 0);
      v8 = +[AMSPromise promiseWithError:v7];
    }
    else
    {
      v10 = +[AMSLogConfig sharedPurchaseConfig];
      if (!v10)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      objc_super v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = objc_opt_class();
        v13 = [*(id *)(a1 + 32) request];
        v14 = [v13 logKey];
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v12;
        __int16 v31 = 2114;
        v32 = v14;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting delegate payment sheet task", buf, 0x16u);
      }
      v15 = objc_alloc_init(AMSMutablePromise);
      [*(id *)(a1 + 32) setPaymentSheetPromise:v15];

      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v16 = [*(id *)(a1 + 32) paymentSheetPromise];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __38__AMSDelegatePaymentSheetTask_perform__block_invoke_12;
      v27[3] = &unk_1E55A1A88;
      objc_copyWeak(&v28, (id *)buf);
      [v16 addSuccessBlock:v27];

      v17 = [*(id *)(a1 + 32) paymentSheetPromise];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __38__AMSDelegatePaymentSheetTask_perform__block_invoke_14;
      v25[3] = &unk_1E55A0310;
      objc_copyWeak(&v26, (id *)buf);
      [v17 addErrorBlock:v25];

      v18 = *(void **)(a1 + 32);
      v19 = [v18 request];
      v20 = [v19 paymentRequest];
      v21 = [v18 _presentPaymentSheetWithPaymentRequest:v20];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __38__AMSDelegatePaymentSheetTask_perform__block_invoke_16;
      v23[3] = &unk_1E55A0310;
      objc_copyWeak(&v24, (id *)buf);
      [v21 addErrorBlock:v23];

      v8 = [*(id *)(a1 + 32) paymentSheetPromise];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    v9 = AMSError(2, @"Delegate Payment Sheet Failed", @"Delegate payment request is nil", 0);
    v8 = +[AMSPromise promiseWithError:v9];
  }
  return v8;
}

void __38__AMSDelegatePaymentSheetTask_perform__block_invoke_12(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [WeakRetained request];
    v6 = [v5 logKey];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task completed successfully", (uint8_t *)&v7, 0x16u);
  }
}

void __38__AMSDelegatePaymentSheetTask_perform__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [WeakRetained request];
    __int16 v9 = [v8 logKey];
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    v13 = v9;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] PaymentSheet completed with error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

void __38__AMSDelegatePaymentSheetTask_perform__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = +[AMSLogConfig sharedPurchaseConfig];
  if (!v5)
  {
    uint64_t v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [WeakRetained request];
    __int16 v9 = [v8 logKey];
    int v13 = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    id v18 = v3;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Task completed with error: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  int v10 = [WeakRetained paymentSheetPromise];
  char v11 = [v10 isFinished];

  if ((v11 & 1) == 0)
  {
    __int16 v12 = [WeakRetained paymentSheetPromise];
    [v12 finishWithError:v3];
  }
}

- (AMSDelegatePaymentSheetRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end