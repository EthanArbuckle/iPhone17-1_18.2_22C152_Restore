@interface AMSCardEnrollmentPaymentSessionService
+ (id)performSilentEnrollmentWithRequest:(id)a3 logKey:(id)a4;
@end

@implementation AMSCardEnrollmentPaymentSessionService

+ (id)performSilentEnrollmentWithRequest:(id)a3 logKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__15;
  v22 = __Block_byref_object_dispose__15;
  v23 = objc_alloc_init(AMSDaemonConnection);
  v8 = [(id)v19[5] securityServiceProxyWithDelegate:0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__AMSCardEnrollmentPaymentSessionService_performSilentEnrollmentWithRequest_logKey___block_invoke;
  v13[3] = &unk_1E55A05A8;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  v16 = &v18;
  id v17 = a1;
  id v15 = v10;
  v11 = [v8 thenWithBlock:v13];

  _Block_object_dispose(&v18, 8);
  return v11;
}

AMSMutablePromise *__84__AMSCardEnrollmentPaymentSessionService_performSilentEnrollmentWithRequest_logKey___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v6 = a1[4];
  v5 = (void *)a1[5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__AMSCardEnrollmentPaymentSessionService_performSilentEnrollmentWithRequest_logKey___block_invoke_2;
  v12[3] = &unk_1E55A0D00;
  uint64_t v16 = a1[7];
  id v13 = v5;
  id v7 = v4;
  uint64_t v8 = a1[6];
  id v14 = v7;
  uint64_t v15 = v8;
  [v3 performSilentEnrollmentWithRequest:v6 logKey:v13 completion:v12];

  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __84__AMSCardEnrollmentPaymentSessionService_performSilentEnrollmentWithRequest_logKey___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 32);
      int v22 = 138543874;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      uint64_t v25 = v10;
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent enrollment failed with error: %{public}@", (uint8_t *)&v22, 0x20u);
    }

    [*(id *)(a1 + 40) finishWithError:v6];
  }
  if (!v5)
  {
    v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = *(void *)(a1 + 32);
      int v22 = 138543618;
      uint64_t v23 = v13;
      __int16 v24 = 2114;
      uint64_t v25 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Silent enrollment failed with no response dictionary", (uint8_t *)&v22, 0x16u);
    }

    uint64_t v15 = AMSError(12, @"Silent Enrollment Error", @"Empty response dictionary", 0);
    [*(id *)(a1 + 40) finishWithError:v15];
  }
  uint64_t v16 = +[AMSLogConfig sharedConfig];
  if (!v16)
  {
    uint64_t v16 = +[AMSLogConfig sharedConfig];
  }
  id v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = *(void *)(a1 + 32);
    int v22 = 138543618;
    uint64_t v23 = v18;
    __int16 v24 = 2114;
    uint64_t v25 = v19;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Silent enrollment succeeded", (uint8_t *)&v22, 0x16u);
  }

  [*(id *)(a1 + 40) finishWithResult:v5];
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = 0;
}

@end