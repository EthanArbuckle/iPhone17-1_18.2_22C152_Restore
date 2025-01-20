@interface AMSPaymentValidationService
+ (BOOL)_isEntitledForDirectAccess;
+ (id)paymentHardwareStatusHeaders;
+ (id)performPaymentHardwareStatusWithService:(id)a3;
@end

@implementation AMSPaymentValidationService

+ (BOOL)_isEntitledForDirectAccess
{
  v2 = +[AMSProcessInfo currentProcess];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.amsaccountsd"];

  return v4;
}

+ (id)paymentHardwareStatusHeaders
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() _isEntitledForDirectAccess])
  {
    Class v4 = NSClassFromString(&cfstr_Amsdpaymentval.isa);
    NSSelectorFromString(&cfstr_Sharedservice.isa);
    if (objc_opt_respondsToSelector())
    {
      v5 = [(objc_class *)v4 performSelector:sel_sharedService];
      v6 = [a1 performPaymentHardwareStatusWithService:v5];
    }
    else
    {
      BOOL v8 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v9 = +[AMSLogConfig sharedConfig];
      v10 = (void *)v9;
      if (v8)
      {
        if (!v9)
        {
          v10 = +[AMSLogConfig sharedConfig];
        }
        v11 = [v10 OSLogObject];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = AMSLogKey();
          v13 = NSString;
          uint64_t v14 = objc_opt_class();
          if (v12)
          {
            v15 = AMSLogKey();
            NSStringFromSelector(a2);
            a2 = (SEL)objc_claimAutoreleasedReturnValue();
            [v13 stringWithFormat:@"%@: [%@] %@ ", v14, v15, a2];
          }
          else
          {
            v15 = NSStringFromSelector(a2);
            [v13 stringWithFormat:@"%@: %@ ", v14, v15];
          v16 = };
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v16;
          _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Process is entitled for direct access, does not respond to sharedService selector", (uint8_t *)&buf, 0xCu);
          if (v12)
          {

            v16 = (void *)a2;
          }
        }
        v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v17 = +[AMSLogConfig sharedConfig];
        [v10 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v17 userInfo:0];
      }
      else
      {
        if (!v9)
        {
          v10 = +[AMSLogConfig sharedConfig];
        }
        v17 = [v10 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          v18 = AMSLogKey();
          v19 = NSString;
          uint64_t v20 = objc_opt_class();
          if (v18)
          {
            v21 = AMSLogKey();
            NSStringFromSelector(a2);
            a2 = (SEL)objc_claimAutoreleasedReturnValue();
            [v19 stringWithFormat:@"%@: [%@] %@ ", v20, v21, a2];
          }
          else
          {
            v21 = NSStringFromSelector(a2);
            [v19 stringWithFormat:@"%@: %@ ", v20, v21];
          v22 = };
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v22;
          _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_FAULT, "%{public}@Process is entitled for direct access, does not respond to sharedService selector", (uint8_t *)&buf, 0xCu);
          if (v18)
          {

            v22 = (void *)a2;
          }
        }
      }

      v23 = AMSError(12, @"Method Not Found", @"Either payment validation service class is Nil or it does not respond to +sharedService.", 0);
      v6 = +[AMSPromise promiseWithError:v23];
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__56;
    v29 = __Block_byref_object_dispose__56;
    v30 = objc_alloc_init(AMSDaemonConnection);
    v7 = [*(id *)(*((void *)&buf + 1) + 40) paymentValidationServiceProxy];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __59__AMSPaymentValidationService_paymentHardwareStatusHeaders__block_invoke;
    v25[3] = &unk_1E55A5500;
    v25[4] = &buf;
    v25[5] = a1;
    v6 = [v7 thenWithBlock:v25];

    _Block_object_dispose(&buf, 8);
  }
  return v6;
}

id __59__AMSPaymentValidationService_paymentHardwareStatusHeaders__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 40) performPaymentHardwareStatusWithService:a2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__AMSPaymentValidationService_paymentHardwareStatusHeaders__block_invoke_2;
  v5[3] = &unk_1E559F430;
  v5[4] = *(void *)(a1 + 32);
  [v3 addFinishBlock:v5];
  return v3;
}

void __59__AMSPaymentValidationService_paymentHardwareStatusHeaders__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

+ (id)performPaymentHardwareStatusWithService:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__AMSPaymentValidationService_performPaymentHardwareStatusWithService___block_invoke;
  v8[3] = &unk_1E55A5528;
  id v10 = a1;
  v6 = v5;
  uint64_t v9 = v6;
  [v4 paymentHardwareStatusHeaderWithCompletion:v8];

  return v6;
}

void __71__AMSPaymentValidationService_performPaymentHardwareStatusWithService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    BOOL v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      int v16 = 138543874;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      v19 = v10;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get payment hardware status header with error: %{public}@", (uint8_t *)&v16, 0x20u);
    }
    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else if (v5)
  {
    [*(id *)(a1 + 32) finishWithResult:v5];
  }
  else
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
      uint64_t v14 = AMSLogKey();
      int v16 = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Getting payment hardware status header failed with no response dictionary", (uint8_t *)&v16, 0x16u);
    }
    v15 = AMSError(12, @"Payment hardware status Error", @"Empty response dictionary", 0);
    [*(id *)(a1 + 32) finishWithError:v15];
  }
}

@end