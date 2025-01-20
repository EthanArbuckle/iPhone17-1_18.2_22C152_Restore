@interface AMSBiometricsSecurityService
+ (id)isAvailableForAccount:(id)a3;
+ (id)isIdentityMapValid;
+ (id)saveIdentityMap;
+ (id)verifyDevicePasscode;
@end

@implementation AMSBiometricsSecurityService

+ (id)isAvailableForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11;
  v18 = __Block_byref_object_dispose__11;
  v19 = objc_alloc_init(AMSDaemonConnection);
  v5 = [(id)v15[5] securityServiceProxyWithDelegate:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke;
  v11[3] = &unk_1E55A0668;
  id v6 = v4;
  id v12 = v6;
  v13 = &v14;
  v7 = [v5 thenWithBlock:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke_3;
  v10[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v10[4] = a1;
  [v7 addErrorBlock:v10];
  v8 = [v7 binaryPromiseAdapter];

  _Block_object_dispose(&v14, 8);
  return v8;
}

AMSMutablePromise *__54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v5 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke_2;
  v9[3] = &unk_1E55A0580;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 40);
  v10 = v6;
  uint64_t v11 = v7;
  [v3 isBiometricsAvailableForAccount:v5 completion:v9];

  return v6;
}

void __54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    if (a2)
    {
      [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
      goto LABEL_6;
    }
    AMSError(11, @"Biometric Error", @"Biometrics not available", 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;
  [*(id *)(a1 + 32) finishWithError:v5];

LABEL_6:
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void __54__AMSBiometricsSecurityService_isAvailableForAccount___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[AMSLogConfig sharedConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    uint64_t v7 = AMSSetLogKeyIfNeeded();
    int v8 = 138543874;
    v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch biometric availability: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

+ (id)isIdentityMapValid
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__11;
  __int16 v12 = __Block_byref_object_dispose__11;
  id v13 = objc_alloc_init(AMSDaemonConnection);
  id v3 = [(id)v9[5] securityServiceProxyWithDelegate:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AMSBiometricsSecurityService_isIdentityMapValid__block_invoke;
  v7[3] = &unk_1E55A06D8;
  v7[4] = &v8;
  v7[5] = a1;
  id v4 = [v3 thenWithBlock:v7];
  id v5 = [v4 binaryPromiseAdapter];

  _Block_object_dispose(&v8, 8);
  return v5;
}

AMSMutablePromise *__50__AMSBiometricsSecurityService_isIdentityMapValid__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AMSBiometricsSecurityService_isIdentityMapValid__block_invoke_2;
  v7[3] = &unk_1E55A06B0;
  id v5 = v4;
  uint64_t v8 = v5;
  long long v9 = *(_OWORD *)(a1 + 32);
  [v3 isIdentityMapValidWithCompletion:v7];

  return v5;
}

void __50__AMSBiometricsSecurityService_isIdentityMapValid__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    [*(id *)(a1 + 32) finishWithError:v5];
  }
  else if (a2)
  {
    [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      long long v9 = objc_opt_class();
      id v10 = v9;
      uint64_t v11 = AMSSetLogKeyIfNeeded();
      int v15 = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Biometric identity map invalid", (uint8_t *)&v15, 0x16u);
    }
    __int16 v12 = AMSError(11, @"Biometric Error", @"Invalid Identity Map", 0);
    [*(id *)(a1 + 32) finishWithError:v12];
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

+ (id)saveIdentityMap
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__11;
  uint64_t v11 = __Block_byref_object_dispose__11;
  __int16 v12 = objc_alloc_init(AMSDaemonConnection);
  id v2 = [(id)v8[5] securityServiceProxyWithDelegate:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__AMSBiometricsSecurityService_saveIdentityMap__block_invoke;
  v6[3] = &unk_1E55A05D0;
  v6[4] = &v7;
  id v3 = [v2 thenWithBlock:v6];
  id v4 = [v3 binaryPromiseAdapter];

  _Block_object_dispose(&v7, 8);
  return v4;
}

AMSMutablePromise *__47__AMSBiometricsSecurityService_saveIdentityMap__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__AMSBiometricsSecurityService_saveIdentityMap__block_invoke_2;
  v8[3] = &unk_1E55A0700;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v9 = v5;
  uint64_t v10 = v6;
  [v3 saveIdentityMapWithCompletion:v8];

  return v5;
}

void __47__AMSBiometricsSecurityService_saveIdentityMap__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 finishWithError:a2];
  }
  else {
    [v3 finishWithResult:&unk_1EDD00D78];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

+ (id)verifyDevicePasscode
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__11;
  uint64_t v11 = __Block_byref_object_dispose__11;
  __int16 v12 = objc_alloc_init(AMSDaemonConnection);
  id v2 = [(id)v8[5] securityServiceProxyWithDelegate:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__AMSBiometricsSecurityService_Project__verifyDevicePasscode__block_invoke;
  v6[3] = &unk_1E55A05D0;
  v6[4] = &v7;
  id v3 = [v2 thenWithBlock:v6];
  uint64_t v4 = [v3 binaryPromiseAdapter];

  _Block_object_dispose(&v7, 8);
  return v4;
}

AMSMutablePromise *__61__AMSBiometricsSecurityService_Project__verifyDevicePasscode__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(AMSMutablePromise);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__AMSBiometricsSecurityService_Project__verifyDevicePasscode__block_invoke_2;
  v8[3] = &unk_1E55A0580;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v9 = v5;
  uint64_t v10 = v6;
  [v3 performDevicePasscodeVerificationWithCompletion:v8];

  return v5;
}

void __61__AMSBiometricsSecurityService_Project__verifyDevicePasscode__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
    [v4 finishWithResult:v5];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

@end