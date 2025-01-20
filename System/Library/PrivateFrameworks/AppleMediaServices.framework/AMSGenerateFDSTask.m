@interface AMSGenerateFDSTask
+ (BOOL)deviceSupportsAFDSPaidODIWithBag:(id)a3 logKey:(id)a4;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSFDSRequest)request;
- (AMSGenerateFDSTask)initWithPurchaseInfo:(id)a3 bag:(id)a4;
- (AMSGenerateFDSTask)initWithRequest:(id)a3 bag:(id)a4;
- (BOOL)deviceSupportsAFDSValues;
- (BOOL)deviceSupportsAFDSValuesV2;
- (NSNumber)purchaseIdentifier;
- (NSString)logKey;
- (id)runTask;
- (unint64_t)action;
@end

@implementation AMSGenerateFDSTask

- (AMSGenerateFDSTask)initWithPurchaseInfo:(id)a3 bag:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 purchase];
  v9 = [v8 logUUID];

  v10 = [v6 buyParams];
  [v10 price];
  if (v11 == 0.0)
  {
    v12 = [v6 buyParams];
    int v13 = [v12 isFreeTrial];

    if (!v13)
    {
      uint64_t v14 = 0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (+[AMSGenerateFDSTask deviceSupportsAFDSPaidODIWithBag:v7 logKey:v9])
  {
    uint64_t v14 = 4;
  }
  else
  {
    uint64_t v14 = 1;
  }
LABEL_8:
  v15 = +[AMSLogConfig sharedConfig];
  if (!v15)
  {
    v15 = +[AMSLogConfig sharedConfig];
  }
  v16 = [v15 OSLogObject];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_opt_class();
    v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v14];
    int v28 = 138543874;
    uint64_t v29 = v17;
    __int16 v30 = 2114;
    v31 = v9;
    __int16 v32 = 2114;
    v33 = v18;
    _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Initializing AFDS task with action type: %{public}@", (uint8_t *)&v28, 0x20u);
  }
  v19 = objc_alloc_init(AMSFDSOptions);
  [(AMSFDSOptions *)v19 setAction:v14];
  v20 = [v6 clientInfo];
  [(AMSFDSOptions *)v19 setClientInfo:v20];

  v21 = [AMSFDSRequest alloc];
  v22 = [v6 purchase];
  v23 = [v22 uniqueIdentifier];
  v24 = [v6 account];
  v25 = [(AMSFDSRequest *)v21 initWithPurchaseIdentifier:v23 account:v24 options:v19];

  [(AMSFDSRequest *)v25 setLogKey:v9];
  v26 = [(AMSGenerateFDSTask *)self initWithRequest:v25 bag:v7];

  return v26;
}

- (AMSGenerateFDSTask)initWithRequest:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSGenerateFDSTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v10->_request, a3);
  }

  return v10;
}

- (ACAccount)account
{
  v2 = [(AMSGenerateFDSTask *)self request];
  v3 = [v2 account];

  return (ACAccount *)v3;
}

- (unint64_t)action
{
  v2 = [(AMSGenerateFDSTask *)self request];
  v3 = [v2 options];
  unint64_t v4 = [v3 action];

  return v4;
}

- (BOOL)deviceSupportsAFDSValues
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(AMSGenerateFDSTask *)self logKey];
  id v4 = AMSSetLogKey(v3);

  v5 = [(AMSGenerateFDSTask *)self bag];
  id v6 = [v5 BOOLForKey:@"afds-enabled"];
  id v17 = 0;
  id v7 = [v6 valueWithError:&v17];
  id v8 = v17;
  char v9 = [v7 BOOLValue];

  if (v8)
  {
    v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      v10 = +[AMSLogConfig sharedConfig];
    }
    double v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      int v13 = AMSSetLogKeyIfNeeded();
      uint64_t v14 = AMSHashIfNeeded(@"afds-enabled");
      v15 = AMSHashIfNeeded(v8);
      *(_DWORD *)buf = 138544130;
      uint64_t v19 = v12;
      __int16 v20 = 2114;
      v21 = v13;
      __int16 v22 = 2114;
      v23 = v14;
      __int16 v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine if the device supports AFDS. key = %{public}@, error = %{public}@", buf, 0x2Au);
    }
  }

  return v9;
}

- (NSString)logKey
{
  v2 = [(AMSGenerateFDSTask *)self request];
  v3 = [v2 logKey];

  return (NSString *)v3;
}

- (NSNumber)purchaseIdentifier
{
  v2 = [(AMSGenerateFDSTask *)self request];
  v3 = [v2 purchaseIdentifier];

  return (NSNumber *)v3;
}

+ (BOOL)deviceSupportsAFDSPaidODIWithBag:(id)a3 logKey:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 doubleForKey:@"afds-paid-odi-percentage"];
  id v32 = 0;
  id v8 = [v7 valueWithError:&v32];
  id v9 = v32;
  [v8 doubleValue];
  double v11 = v10;

  if (v9)
  {
    uint64_t v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    int v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSHashIfNeeded(@"afds-paid-odi-percentage");
      *(_DWORD *)buf = 138544130;
      uint64_t v34 = v14;
      __int16 v35 = 2114;
      id v36 = v6;
      __int16 v37 = 2114;
      v38 = v15;
      __int16 v39 = 2114;
      id v40 = v9;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag entry found for key: %{public}@, error: %{public}@", buf, 0x2Au);
    }
  }
  v16 = [v5 integerForKey:@"afds-paid-odi-duration"];
  id v31 = v9;
  id v17 = [v16 valueWithError:&v31];
  id v18 = v31;

  uint64_t v19 = [v17 integerValue];
  if (v18)
  {
    __int16 v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      __int16 v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class();
      v23 = AMSHashIfNeeded(@"afds-paid-odi-duration");
      *(_DWORD *)buf = 138544130;
      uint64_t v34 = v22;
      __int16 v35 = 2114;
      id v36 = v6;
      __int16 v37 = 2114;
      v38 = v23;
      __int16 v39 = 2114;
      id v40 = v18;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No bag entry found for key: %{public}@, error: %{public}@", buf, 0x2Au);
    }
    LOBYTE(v24) = 0;
  }
  else
  {
    if (v9)
    {
      LOBYTE(v24) = 0;
      goto LABEL_16;
    }
    double v26 = (double)v19;
    BOOL v24 = +[AMSDefaults shouldSampleWithPercentage:0x1EDCB0868 sessionDuration:v11 identifier:(double)v19];
    __int16 v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      __int16 v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = objc_opt_class();
      int v28 = [MEMORY[0x1E4F28ED0] numberWithDouble:v11];
      uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithDouble:v26];
      __int16 v30 = [MEMORY[0x1E4F28ED0] numberWithBool:v24];
      *(_DWORD *)buf = 138544386;
      uint64_t v34 = v27;
      __int16 v35 = 2114;
      id v36 = v6;
      __int16 v37 = 2114;
      v38 = v28;
      __int16 v39 = 2114;
      id v40 = v29;
      __int16 v41 = 2114;
      v42 = v30;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Sampling AFDSPaidODI with bag values: %{public}@, %{public}@, result: %{public}@", buf, 0x34u);
    }
  }

LABEL_16:
  return v24;
}

- (id)runTask
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__AMSGenerateFDSTask_runTask__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __29__AMSGenerateFDSTask_runTask__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) deviceSupportsAFDSValues])
  {
    v2 = [*(id *)(a1 + 32) request];
    +[AMSFDSService generateFDSWithRequest:v2];
  }
  else
  {
    v2 = AMSError(5, @"Platform Not Supported", @"AFDS is not supported on this platform.", 0);
    +[AMSPromise promiseWithError:v2];
  v3 = };

  return v3;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (BOOL)deviceSupportsAFDSValuesV2
{
  return self->_deviceSupportsAFDSValuesV2;
}

- (AMSFDSRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end