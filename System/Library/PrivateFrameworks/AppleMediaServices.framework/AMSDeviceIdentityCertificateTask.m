@interface AMSDeviceIdentityCertificateTask
- (AMSBagProtocol)bag;
- (AMSDeviceIdentityCertificateTask)initWithBag:(id)a3;
- (OS_dispatch_queue)requestQueue;
- (id)performDeviceIdentityRequestForAbsinthe;
- (id)performDeviceIdentityRequestForFraudReport;
- (id)performDeviceIdentityRequestWithBaaOptions:(id)a3 ttlBagKey:(id)a4 logInformation:(id)a5;
@end

@implementation AMSDeviceIdentityCertificateTask

- (id)performDeviceIdentityRequestForAbsinthe
{
  v13[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5F300];
  v12[0] = *MEMORY[0x1E4F5F2F0];
  v12[1] = v3;
  v13[0] = MEMORY[0x1E4F1CC38];
  v13[1] = MEMORY[0x1E4F1CC28];
  uint64_t v4 = *MEMORY[0x1E4F5F310];
  v12[2] = *MEMORY[0x1E4F5F308];
  v12[3] = v4;
  v13[2] = @"apple";
  v13[3] = @"com.apple.AppleMediaServices.antifraud";
  uint64_t v5 = *MEMORY[0x1E4F5F320];
  v13[4] = &unk_1EDD01150;
  uint64_t v6 = *MEMORY[0x1E4F5F360];
  v12[4] = v5;
  v12[5] = v6;
  uint64_t v11 = *MEMORY[0x1E4F5F368];
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v13[5] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];

  v9 = [(AMSDeviceIdentityCertificateTask *)self performDeviceIdentityRequestWithBaaOptions:v8 ttlBagKey:@"afcert-ttl" logInformation:@"fraud prevention"];

  return v9;
}

- (id)performDeviceIdentityRequestForFraudReport
{
  uint64_t v3 = AMSLogKey();
  uint64_t v4 = [(AMSDeviceIdentityCertificateTask *)self bag];
  uint64_t v5 = [v4 BOOLForKey:@"fsr-ucrt-device-ids-disabled"];
  uint64_t v6 = [v5 valuePromise];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__AMSDeviceIdentityCertificateTask_AMSFraudReport__performDeviceIdentityRequestForFraudReport__block_invoke;
  v10[3] = &unk_1E559E6F8;
  id v11 = v3;
  v12 = self;
  id v7 = v3;
  v8 = [v6 continueWithBlock:v10];

  return v8;
}

id __94__AMSDeviceIdentityCertificateTask_AMSFraudReport__performDeviceIdentityRequestForFraudReport__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AMSSetLogKey(*(void **)(a1 + 32));
  if (v3)
  {
    int v5 = [v3 BOOLValue] ^ 1;
    uint64_t v6 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v8;
      __int16 v29 = 2114;
      uint64_t v30 = v9;
      __int16 v31 = 1026;
      int v32 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] shouldRequestUCRTDeviceIds=%{public}d", buf, 0x1Cu);
    }
  }
  else
  {
    uint64_t v6 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v10;
      __int16 v29 = 2114;
      uint64_t v30 = v11;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] UCRT ids disabler is missing in bag, will request certificate with UCRT device ids.", buf, 0x16u);
    }
    int v5 = 1;
  }

  uint64_t v12 = *MEMORY[0x1E4F5F300];
  v25[0] = *MEMORY[0x1E4F5F2F0];
  v25[1] = v12;
  v26[0] = MEMORY[0x1E4F1CC38];
  v26[1] = MEMORY[0x1E4F1CC28];
  uint64_t v13 = *MEMORY[0x1E4F5F310];
  v25[2] = *MEMORY[0x1E4F5F308];
  v25[3] = v13;
  v26[2] = @"apple";
  v26[3] = @"com.apple.AppleMediaServices.fsr";
  v25[4] = *MEMORY[0x1E4F5F320];
  v26[4] = &unk_1EDD01168;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:5];
  v15 = (void *)[v14 mutableCopy];

  uint64_t v16 = *MEMORY[0x1E4F5F348];
  if (v5)
  {
    v24[0] = *MEMORY[0x1E4F5F338];
    v24[1] = v16;
    v24[2] = *MEMORY[0x1E4F5F368];
    v17 = (void *)MEMORY[0x1E4F1C978];
    v18 = v24;
    uint64_t v19 = 3;
  }
  else
  {
    v23[0] = *MEMORY[0x1E4F5F338];
    v23[1] = v16;
    v17 = (void *)MEMORY[0x1E4F1C978];
    v18 = v23;
    uint64_t v19 = 2;
  }
  v20 = [v17 arrayWithObjects:v18 count:v19];
  [v15 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F5F360]];

  v21 = [*(id *)(a1 + 40) performDeviceIdentityRequestWithBaaOptions:v15 ttlBagKey:@"fsr-cert-ttl" logInformation:@"fraud score report"];

  return v21;
}

- (AMSDeviceIdentityCertificateTask)initWithBag:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AMSDeviceIdentityCertificateTask;
  id v7 = [(AMSTask *)&v26 init];
  if (v7)
  {
    if (!v6)
    {
      BOOL v8 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v9 = +[AMSLogConfig sharedConfig];
      uint64_t v10 = (void *)v9;
      if (v8)
      {
        if (!v9)
        {
          uint64_t v10 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v11 = [v10 OSLogObject];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = AMSLogKey();
          uint64_t v13 = NSString;
          uint64_t v14 = objc_opt_class();
          uint64_t v15 = v14;
          if (v12)
          {
            uint64_t v3 = AMSLogKey();
            [v13 stringWithFormat:@"%@: [%@] ", v15, v3];
          }
          else
          {
            [v13 stringWithFormat:@"%@: ", v14];
          uint64_t v16 = };
          *(_DWORD *)buf = 138543362;
          uint64_t v28 = v16;
          _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@Bag wasn't provided. No identity request can be performed with this instance.", buf, 0xCu);
          if (v12)
          {

            uint64_t v16 = (void *)v3;
          }
        }
        uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v17 = +[AMSLogConfig sharedConfig];
        [v10 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v17 userInfo:0];
      }
      else
      {
        if (!v9)
        {
          uint64_t v10 = +[AMSLogConfig sharedConfig];
        }
        v17 = [v10 OSLogObject];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          v18 = AMSLogKey();
          uint64_t v19 = NSString;
          uint64_t v20 = objc_opt_class();
          uint64_t v21 = v20;
          if (v18)
          {
            uint64_t v3 = AMSLogKey();
            [v19 stringWithFormat:@"%@: [%@] ", v21, v3];
          }
          else
          {
            [v19 stringWithFormat:@"%@: ", v20];
          v22 = };
          *(_DWORD *)buf = 138543362;
          uint64_t v28 = v22;
          _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_FAULT, "%{public}@Bag wasn't provided. No identity request can be performed with this instance.", buf, 0xCu);
          if (v18)
          {

            v22 = (void *)v3;
          }
        }
      }
    }
    objc_storeStrong((id *)&v7->_bag, a3);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.AppleMediaServices.deviceIdentityRequest", 0);
    requestQueue = v7->_requestQueue;
    v7->_requestQueue = (OS_dispatch_queue *)v23;
  }
  return v7;
}

- (id)performDeviceIdentityRequestWithBaaOptions:(id)a3 ttlBagKey:(id)a4 logInformation:(id)a5
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = AMSSetLogKeyIfNeeded();
  uint64_t v12 = [(AMSDeviceIdentityCertificateTask *)self bag];
  if (v12)
  {
    objc_initWeak(location, self);
    uint64_t v13 = [AMSMutableLazyPromise alloc];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __104__AMSDeviceIdentityCertificateTask_performDeviceIdentityRequestWithBaaOptions_ttlBagKey_logInformation___block_invoke;
    v25[3] = &unk_1E55A1D98;
    objc_copyWeak(&v31, location);
    id v26 = v11;
    id v27 = v10;
    id v28 = v12;
    id v29 = v9;
    id v30 = v8;
    uint64_t v14 = [(AMSMutableLazyPromise *)v13 initWithBlock:v25];

    objc_destroyWeak(&v31);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = AMSLogKey();
      v18 = NSString;
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = v19;
      if (v17)
      {
        uint64_t v24 = AMSLogKey();
        [v18 stringWithFormat:@"%@: [%@] ", v20, v24];
      }
      else
      {
        [v18 stringWithFormat:@"%@: ", v19];
      uint64_t v21 = };
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v21;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@Bag wasn't provided. No identity request will be performed.", (uint8_t *)location, 0xCu);
      if (v17)
      {

        uint64_t v21 = (void *)v24;
      }
    }
    v22 = AMSError(0, @"Bag wasn't provided", 0, 0);
    uint64_t v14 = +[AMSPromise promiseWithError:v22];
  }
  return v14;
}

void __104__AMSDeviceIdentityCertificateTask_performDeviceIdentityRequestWithBaaOptions_ttlBagKey_logInformation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v5 = +[AMSLogConfig sharedConfig];
  id v6 = (void *)v5;
  if (WeakRetained)
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v8;
      __int16 v24 = 2114;
      uint64_t v25 = v9;
      __int16 v26 = 2114;
      uint64_t v27 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching BAA certs for %{public}@", buf, 0x20u);
    }

    uint64_t v11 = [*(id *)(a1 + 48) integerForKey:*(void *)(a1 + 56)];
    uint64_t v12 = [v11 valuePromise];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __104__AMSDeviceIdentityCertificateTask_performDeviceIdentityRequestWithBaaOptions_ttlBagKey_logInformation___block_invoke_41;
    v17[3] = &unk_1E55A1D70;
    v17[4] = WeakRetained;
    id v18 = *(id *)(a1 + 32);
    id v19 = v3;
    id v20 = *(id *)(a1 + 64);
    id v21 = *(id *)(a1 + 40);
    [v12 addFinishBlock:v17];
  }
  else
  {
    if (!v5)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v6 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v14;
      __int16 v24 = 2114;
      uint64_t v25 = v15;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] AMSDeviceIdentityCertificateTask unexpectedly deallocated", buf, 0x16u);
    }

    uint64_t v16 = AMSError(0, @"Task unexpectedly deallocated", 0, 0);
    [v3 finishWithError:v16];
  }
}

void __104__AMSDeviceIdentityCertificateTask_performDeviceIdentityRequestWithBaaOptions_ttlBagKey_logInformation___block_invoke_41(id *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
      id v10 = a1[5];
      *(_DWORD *)buf = 138544130;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      id v20 = v10;
      __int16 v21 = 2114;
      id v22 = v6;
      __int16 v23 = 2114;
      id v24 = v5;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Parsing certificate TTL failed with error: %{public}@, TTL: %{public}@", buf, 0x2Au);
    }

    [a1[6] finishWithError:v6];
  }
  else
  {
    uint64_t v11 = (void *)[a1[7] mutableCopy];
    [v11 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F5F380]];
    uint64_t v12 = [a1[4] requestQueue];
    uint64_t v13 = (void *)[v11 copy];
    id v14 = a1[5];
    id v15 = a1[8];
    id v16 = a1[6];
    DeviceIdentityIssueClientCertificateWithCompletion();
  }
}

void __104__AMSDeviceIdentityCertificateTask_performDeviceIdentityRequestWithBaaOptions_ttlBagKey_logInformation___block_invoke_42(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[AMSLogConfig sharedConfig];
  id v10 = (void *)v9;
  if (v8)
  {
    if (!v9)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      int v25 = 138544130;
      uint64_t v26 = v12;
      __int16 v27 = 2114;
      uint64_t v28 = v13;
      __int16 v29 = 2114;
      uint64_t v30 = v14;
      __int16 v31 = 2114;
      id v32 = v8;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Fetch BAA certs for %{public}@ failed with error: %{public}@", (uint8_t *)&v25, 0x2Au);
    }

    [*(id *)(a1 + 56) finishWithError:v8];
  }
  else
  {
    if (!v9)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v10 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      int v25 = 138543874;
      uint64_t v26 = v16;
      __int16 v27 = 2114;
      uint64_t v28 = v17;
      __int16 v29 = 2114;
      uint64_t v30 = v18;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully retrieved BAA certs for %{public}@", (uint8_t *)&v25, 0x20u);
    }

    __int16 v19 = [AMSBAAKeychainItems alloc];
    id v20 = [v7 objectAtIndexedSubscript:0];
    CFDataRef v21 = SecCertificateCopyData(v20);
    id v22 = [v7 objectAtIndexedSubscript:1];
    CFDataRef v23 = SecCertificateCopyData(v22);
    id v24 = [(AMSBAAKeychainItems *)v19 initWithBAACert:v21 BIKKey:a2 intermediateRootCert:v23];

    [*(id *)(a1 + 56) finishWithResult:v24];
  }
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end