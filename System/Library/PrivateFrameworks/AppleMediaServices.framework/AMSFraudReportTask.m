@interface AMSFraudReportTask
+ (id)performFraudReportRefreshWithAccount:(id)a3 transactionID:(id)a4 nameSpace:(id)a5 fsrData:(id)a6 keyID:(id)a7;
+ (id)performFraudReportRefreshWithOptions:(id)a3;
@end

@implementation AMSFraudReportTask

+ (id)performFraudReportRefreshWithAccount:(id)a3 transactionID:(id)a4 nameSpace:(id)a5 fsrData:(id)a6 keyID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12 && v13 && v14)
  {
    v16 = [[AMSFraudReportOptions alloc] initWithTransactionIdentifier:v12 nameSpace:v13 fsrData:v14];
    [(AMSFraudReportOptions *)v16 setAccount:v11];
    [(AMSFraudReportOptions *)v16 setKeyIdentifier:v15];
    uint64_t v17 = +[AMSFraudReportTask performFraudReportRefreshWithOptions:v16];
  }
  else
  {
    AMSError(2, @"transactionID, nameSpace and fsrData must all be non-nil", 0, 0);
    v16 = (AMSFraudReportOptions *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = +[AMSPromise promiseWithError:v16];
  }
  v18 = (void *)v17;

  return v18;
}

+ (id)performFraudReportRefreshWithOptions:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__35;
    v20 = __Block_byref_object_dispose__35;
    v21 = objc_alloc_init(AMSDaemonConnection);
    v5 = [(id)v17[5] fraudReportServiceProxy];
    v6 = AMSSetLogKeyIfNeeded();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__AMSFraudReportTask_performFraudReportRefreshWithOptions___block_invoke;
    v11[3] = &unk_1E55A32F8;
    id v12 = v4;
    id v15 = a1;
    id v7 = v6;
    id v13 = v7;
    id v14 = &v16;
    v8 = [v5 thenWithBlock:v11];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v9 = AMSError(2, @"options must not be nil", 0, 0);
    v8 = +[AMSPromise promiseWithError:v9];
  }
  return v8;
}

AMSMutablePromise *__59__AMSFraudReportTask_performFraudReportRefreshWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__AMSFraudReportTask_performFraudReportRefreshWithOptions___block_invoke_2;
  v11[3] = &unk_1E55A32D0;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  v6 = v4;
  uint64_t v7 = *(void *)(a1 + 48);
  id v13 = v6;
  uint64_t v14 = v7;
  [v3 performFraudReportRefreshWithOptions:v5 completion:v11];

  v8 = v13;
  v9 = v6;

  return v9;
}

void __59__AMSFraudReportTask_performFraudReportRefreshWithOptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 40) finishWithResult:a2];
  }
  else
  {
    v6 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v6)
    {
      v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = AMSLogableError(v5);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@] Error fetching new fraud report score: %{public}@.", (uint8_t *)&v15, 0x20u);
    }
    id v11 = *(void **)(a1 + 40);
    if (v5)
    {
      [*(id *)(a1 + 40) finishWithError:v5];
    }
    else
    {
      id v12 = AMSError(0, @"Refresh Fraud Report Score failed", @"Finished without response or error", 0);
      [v11 finishWithError:v12];
    }
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

@end