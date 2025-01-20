@interface AMSFairPlayDeviceIdentityResponseHandler
+ (id)handleResponse:(id)a3 request:(id)a4 buyParams:(id)a5 bag:(id)a6 fairPlayDeviceIdentity:(id)a7;
@end

@implementation AMSFairPlayDeviceIdentityResponseHandler

+ (id)handleResponse:(id)a3 request:(id)a4 buyParams:(id)a5 bag:(id)a6 fairPlayDeviceIdentity:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = v15;
  if (a3 && v14 && v15)
  {
    v17 = objc_msgSend(a3, "ams_valueForHTTPHeaderField:", @"X-Apple-FPDIAction");
    if (objc_msgSend(v17, "ams_caseInsensitiveEquals:", @"RP"))
    {
      v18 = +[AMSLogConfig sharedConfig];
      if (!v18)
      {
        v18 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = AMSLogKey();
        v33 = NSString;
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = v21;
        v34 = (void *)v20;
        if (v20)
        {
          uint64_t v32 = AMSLogKey();
          [v33 stringWithFormat:@"%@: [%@] ", v22, v32];
        }
        else
        {
          [v33 stringWithFormat:@"%@: ", v21];
        v23 = };
        *(_DWORD *)buf = 138543362;
        v40 = v23;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Handling reprovision action", buf, 0xCu);
        if (v34)
        {

          v23 = (void *)v32;
        }
      }
      v27 = objc_alloc_init(AMSMutablePromise);
      v28 = [v13 dictionaryForFPDI];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __104__AMSFairPlayDeviceIdentityResponseHandler_handleResponse_request_buyParams_bag_fairPlayDeviceIdentity___block_invoke;
      v35[3] = &unk_1E55A2838;
      id v36 = v16;
      v29 = v27;
      v37 = v29;
      id v38 = a1;
      [v36 fpdiLevelFor:v12 bag:v14 buyParams:v28 completionHandler:v35];

      v30 = v37;
      v25 = v29;
    }
    else
    {
      v26 = +[AMSOptional optionalWithNil];
      v25 = +[AMSPromise promiseWithResult:v26];
    }
  }
  else
  {
    v24 = +[AMSOptional optionalWithNil];
    v25 = +[AMSPromise promiseWithResult:v24];
  }
  return v25;
}

void __104__AMSFairPlayDeviceIdentityResponseHandler_handleResponse_request_buyParams_bag_fairPlayDeviceIdentity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = AMSLogKey();
      v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        uint64_t v3 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, v3];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      id v13 = };
      id v15 = AMSLogableError(v6);
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      __int16 v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error handling reprovision action error = %{public}@", buf, 0x16u);
      if (v9)
      {

        id v13 = (void *)v3;
      }
    }
    v16 = [v6 domain];
    if ([v16 isEqualToString:@"AMSErrorDomain"])
    {
      if ([v6 code] == 904)
      {

LABEL_18:
        v18 = *(void **)(a1 + 40);
        v19 = +[AMSOptional optionalWithNil];
        [v18 finishWithResult:v19];

        goto LABEL_19;
      }
      uint64_t v17 = [v6 code];

      if (v17 == 204) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 40) finishWithError:v6];
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __104__AMSFairPlayDeviceIdentityResponseHandler_handleResponse_request_buyParams_bag_fairPlayDeviceIdentity___block_invoke_2;
    v20[3] = &unk_1E559EA90;
    id v14 = *(void **)(a1 + 32);
    id v21 = *(id *)(a1 + 40);
    [v14 reinitializeSessionWithLevel:a2 completionHandler:v20];
  }
LABEL_19:
}

void __104__AMSFairPlayDeviceIdentityResponseHandler_handleResponse_request_buyParams_bag_fairPlayDeviceIdentity___block_invoke_2(uint64_t a1)
{
  id v4 = +[AMSURLAction retryAction];
  [v4 setReason:@"fpdi"];
  [v4 setRetryIdentifier:0x1EDCB3748];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[AMSOptional optionalWithValue:v4];
  [v2 finishWithResult:v3];
}

@end