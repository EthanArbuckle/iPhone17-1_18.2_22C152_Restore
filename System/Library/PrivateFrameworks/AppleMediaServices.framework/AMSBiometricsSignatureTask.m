@interface AMSBiometricsSignatureTask
+ (__SecKey)copyPrivateKeyWithStyle:(unint64_t)a3 context:(id)a4 account:(id)a5 options:(id)a6 error:(id *)a7;
+ (id)fetchDataToSignWithPublicKeyData:(id)a3 challenge:(id)a4 error:(id *)a5;
+ (id)fetchPublicKeyDataFromPrivateKey:(__SecKey *)a3 error:(id *)a4;
+ (id)signDataWithPrivateKey:(__SecKey *)a3 dataToSign:(id)a4 error:(id *)a5;
- (AMSBiometricsSignatureRequest)request;
- (AMSBiometricsSignatureTask)initWithRequest:(id)a3;
- (BOOL)_fetchCardEnrollmentConfigurations:(id *)a3;
- (BOOL)_performCardEnrollmentCheck:(id *)a3;
- (id)_performSignatureInProcess;
- (id)_performSignatureOutOfProcess;
- (id)performSignature;
- (id)performSignatureFromService;
- (id)signWithPrivateKey:(__SecKey *)a3 error:(id *)a4;
- (void)regenerateAttestationKeys;
@end

@implementation AMSBiometricsSignatureTask

- (AMSBiometricsSignatureTask)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSBiometricsSignatureTask;
  v6 = [(AMSTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (id)performSignature
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    v7 = AMSSetLogKeyIfNeeded();
    *(_DWORD *)buf = 138543618;
    v23 = v5;
    __int16 v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Perform signature task - determine the context", buf, 0x16u);
  }
  id v21 = 0;
  BOOL v8 = [(AMSBiometricsSignatureTask *)self _fetchCardEnrollmentConfigurations:&v21];
  id v9 = v21;
  if (v8)
  {
    v10 = [(AMSBiometricsSignatureTask *)self request];
    v11 = [v10 keychainOptions];
    if ([v11 purpose] == 1)
    {
      v12 = [MEMORY[0x1E4F28F80] processInfo];
      v13 = [v12 processName];
      if ([v13 isEqualToString:@"Music"])
      {
        char v14 = 1;
      }
      else
      {
        v16 = [MEMORY[0x1E4F28F80] processInfo];
        v17 = [v16 processName];
        char v14 = [v17 isEqualToString:@"AppStore"];
      }
    }
    else
    {
      char v14 = 0;
    }

    BOOL v18 = AMSIsEntitledForDirectKeychainAccess();
    if ((v14 & 1) != 0 || !v18)
    {
      uint64_t v15 = [(AMSBiometricsSignatureTask *)self _performSignatureOutOfProcess];
    }
    else
    {
      uint64_t v15 = [(AMSBiometricsSignatureTask *)self _performSignatureInProcess];
    }
  }
  else
  {
    uint64_t v15 = +[AMSPromise promiseWithError:v9];
  }
  v19 = (void *)v15;

  return v19;
}

- (id)performSignatureFromService
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    v7 = AMSSetLogKeyIfNeeded();
    int v10 = 138543618;
    v11 = v5;
    __int16 v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Perform signature task from service", (uint8_t *)&v10, 0x16u);
  }
  BOOL v8 = [(AMSBiometricsSignatureTask *)self _performSignatureInProcess];
  return v8;
}

- (id)_performSignatureOutOfProcess
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v3)
  {
    v3 = +[AMSLogConfig sharedConfig];
  }
  v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    v7 = AMSSetLogKeyIfNeeded();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting OOP signature operation", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v16 = __Block_byref_object_copy__12;
  v17 = __Block_byref_object_dispose__12;
  BOOL v18 = objc_alloc_init(AMSSigningSecurityService);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__12;
  v13[4] = __Block_byref_object_dispose__12;
  id v14 = [(AMSBiometricsSignatureTask *)self request];
  BOOL v8 = *(void **)(*(void *)&buf[8] + 40);
  id v9 = [(AMSBiometricsSignatureTask *)self request];
  int v10 = [v8 signatureForRequest:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__AMSBiometricsSignatureTask__performSignatureOutOfProcess__block_invoke;
  v12[3] = &unk_1E55A0728;
  v12[4] = buf;
  v12[5] = v13;
  [v10 addFinishBlock:v12];
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(buf, 8);
  return v10;
}

void __59__AMSBiometricsSignatureTask__performSignatureOutOfProcess__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (id)_performSignatureInProcess
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = AMSSetLogKeyIfNeeded();
  uint64_t v4 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v29 = (id)objc_opt_class();
    __int16 v30 = 2114;
    uint64_t v31 = v3;
    id v6 = v29;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Starting signature operation", buf, 0x16u);
  }
  v22 = objc_alloc_init(AMSMutablePromise);
  v7 = objc_alloc_init(AMSPromise);
  BOOL v8 = [(AMSBiometricsSignatureTask *)self request];
  [v8 localAuthContext];
  v10 = id v9 = (void *)v3;
  v11 = [(AMSBiometricsSignatureTask *)self request];
  uint64_t v12 = [v11 localAuthAccessControlRef];
  v13 = [(AMSBiometricsSignatureTask *)self request];
  id v14 = [v13 localAuthOptions];
  uint64_t v15 = [(AMSPromise *)v7 completionHandlerAdapter];
  [v10 evaluateAccessControl:v12 operation:3 options:v14 reply:v15];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke;
  v26[3] = &unk_1E559E7E8;
  v26[4] = self;
  v16 = v22;
  v27 = v16;
  [(AMSPromise *)v7 addErrorBlock:v26];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke_16;
  v23[3] = &unk_1E55A0750;
  v23[4] = self;
  id v24 = v9;
  v17 = v16;
  v25 = v17;
  id v18 = v9;
  [(AMSPromise *)v7 addSuccessBlock:v23];
  uint64_t v19 = v25;
  v20 = v17;

  return v20;
}

void __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v4)
  {
    uint64_t v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    BOOL v8 = AMSLogKey();
    int v11 = 138543874;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    id v14 = v8;
    __int16 v15 = 2114;
    id v16 = v3;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] evaluateAccessControl reply with error: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  if ([v3 code] == -2 || objc_msgSend(v3, "code") == -4)
  {
    AMSError(6, @"Biometrics dialog failed", @"Biometrics dialog cancelled", v3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v3;
  }
  int v10 = v9;
  [*(id *)(a1 + 40) finishWithError:v9];
}

void __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v40 = a2;
  uint64_t v41 = a1;
  id v3 = *(void **)(a1 + 32);
  id v45 = 0;
  [v3 _performCardEnrollmentCheck:&v45];
  id v4 = v45;
  if (v4)
  {
    id v5 = v4;
    id v6 = +[AMSLogConfig sharedBiometricsConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v47 = v8;
      __int16 v48 = 2114;
      uint64_t v49 = v9;
      __int16 v50 = 2114;
      id v51 = v5;
      id v10 = v8;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failing biometric signature due to auto-enrollment check: %{public}@", buf, 0x20u);
    }
    [*(id *)(v41 + 48) finishWithError:v5];
  }
  else
  {
    int v11 = objc_opt_class();
    uint64_t v12 = [*(id *)(a1 + 32) request];
    __int16 v13 = [v12 keychainOptions];
    uint64_t v14 = [v13 style];
    __int16 v15 = [*(id *)(a1 + 32) request];
    id v16 = [v15 localAuthContext];
    uint64_t v17 = [*(id *)(a1 + 32) request];
    id v18 = [v17 account];
    uint64_t v19 = [*(id *)(a1 + 32) request];
    v20 = [v19 keychainOptions];
    id v44 = 0;
    uint64_t v21 = [v11 copyPrivateKeyWithStyle:v14 context:v16 account:v18 options:v20 error:&v44];
    id v5 = v44;

    if (v5)
    {
      v22 = +[AMSLogConfig sharedBiometricsConfig];
      if (!v22)
      {
        v22 = +[AMSLogConfig sharedConfig];
      }
      v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = objc_opt_class();
        uint64_t v25 = *(void *)(v41 + 40);
        *(_DWORD *)buf = 138543874;
        v47 = v24;
        __int16 v48 = 2114;
        uint64_t v49 = v25;
        __int16 v50 = 2114;
        id v51 = v5;
        id v26 = v24;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failing biometric signature due to auto-enrollment check: %{public}@", buf, 0x20u);
      }
      [*(id *)(v41 + 48) finishWithError:v5];
    }
    else if (v21)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke_23;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = v21;
      v27 = (void (**)(void))_Block_copy(aBlock);
      v28 = *(void **)(v41 + 32);
      id v42 = 0;
      id v29 = [v28 signWithPrivateKey:v21 error:&v42];
      id v30 = v42;
      uint64_t v31 = v30;
      if (!v29 || v30)
      {
        AMSError(602, @"Signature Failed", @"Fatal error prior to signing data", 0);
        id v5 = (id)objc_claimAutoreleasedReturnValue();

        [*(id *)(v41 + 48) finishWithError:v5];
      }
      else
      {
        uint64_t v32 = objc_alloc_init(AMSBiometricsSignatureResult);
        v33 = [(id)objc_opt_class() fetchPublicKeyDataFromPrivateKey:v21 error:0];
        [(AMSBiometricsSignatureResult *)v32 setPublicKey:v33];

        v34 = [*(id *)(v41 + 32) request];
        [(AMSBiometricsSignatureResult *)v32 setOriginalRequest:v34];

        [(AMSBiometricsSignatureResult *)v32 setSignature:v29];
        v35 = +[AMSLogConfig sharedBiometricsConfig];
        if (!v35)
        {
          v35 = +[AMSLogConfig sharedConfig];
        }
        v36 = [v35 OSLogObject];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = objc_opt_class();
          uint64_t v38 = *(void *)(v41 + 40);
          *(_DWORD *)buf = 138543618;
          v47 = v37;
          __int16 v48 = 2114;
          uint64_t v49 = v38;
          id v39 = v37;
          _os_log_impl(&dword_18D554000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Signature operation completed successfully", buf, 0x16u);
        }
        [*(id *)(v41 + 48) finishWithResult:v32];

        id v5 = 0;
      }

      v27[2](v27);
    }
    else
    {
      AMSError(602, @"Signature Failed", @"Failed to get private key reference", 0);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [*(id *)(v41 + 32) regenerateAttestationKeys];
      [*(id *)(v41 + 48) finishWithError:v5];
    }
  }
}

void __56__AMSBiometricsSignatureTask__performSignatureInProcess__block_invoke_23(uint64_t a1)
{
}

- (BOOL)_fetchCardEnrollmentConfigurations:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = AMSSetLogKeyIfNeeded();
  id v6 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = objc_opt_class();
    uint64_t v9 = (void *)MEMORY[0x1E4F28ED0];
    id v10 = v8;
    int v11 = [(AMSBiometricsSignatureTask *)self request];
    uint64_t v12 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v11, "isDualAction"));
    int v41 = 138543874;
    id v42 = v8;
    __int16 v43 = 2114;
    id v44 = v5;
    __int16 v45 = 2112;
    v46 = v12;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Start fetch CardEnrollment setting for dual-action=%@", (uint8_t *)&v41, 0x20u);
  }
  __int16 v13 = [(AMSBiometricsSignatureTask *)self request];
  int v14 = [v13 isDualAction];

  if (!v14) {
    goto LABEL_12;
  }
  __int16 v15 = [(AMSBiometricsSignatureTask *)self request];
  id v16 = [v15 bag];

  if (v16)
  {
    uint64_t v17 = [(AMSBiometricsSignatureTask *)self request];
    id v18 = [v17 bag];
    BOOL v19 = +[AMSCardEnrollment shouldUseApplePayClassicWithBag:v18];
    v20 = [(AMSBiometricsSignatureTask *)self request];
    [v20 setUseApplePayClassic:v19];

    uint64_t v21 = [(AMSBiometricsSignatureTask *)self request];
    v22 = [v21 bag];
    BOOL v23 = +[AMSCardEnrollment shouldUseAutoEnrollmentWithBag:v22];
    id v24 = [(AMSBiometricsSignatureTask *)self request];
    [v24 setUseAutoEnrollment:v23];

    uint64_t v25 = +[AMSLogConfig sharedBiometricsConfig];
    if (!v25)
    {
      uint64_t v25 = +[AMSLogConfig sharedConfig];
    }
    id v26 = [v25 OSLogObject];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_opt_class();
      v28 = (void *)MEMORY[0x1E4F28ED0];
      id v29 = v27;
      id v30 = [(AMSBiometricsSignatureTask *)self request];
      uint64_t v31 = objc_msgSend(v28, "numberWithBool:", objc_msgSend(v30, "shouldUseApplePayClassic"));
      uint64_t v32 = (void *)MEMORY[0x1E4F28ED0];
      v33 = [(AMSBiometricsSignatureTask *)self request];
      v34 = objc_msgSend(v32, "numberWithBool:", objc_msgSend(v33, "shouldUseAutoEnrollment"));
      int v41 = 138544130;
      id v42 = v27;
      __int16 v43 = 2114;
      id v44 = v5;
      __int16 v45 = 2112;
      v46 = v31;
      __int16 v47 = 2112;
      __int16 v48 = v34;
      _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Get CardEnrollment setting for dual-action, useApplePayClassic=%@, useAutoEnrollment=%@", (uint8_t *)&v41, 0x2Au);
    }
LABEL_12:
    BOOL v35 = 1;
    goto LABEL_13;
  }
  v37 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v37)
  {
    v37 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v38 = [v37 OSLogObject];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    id v39 = objc_opt_class();
    int v41 = 138543618;
    id v42 = v39;
    __int16 v43 = 2114;
    id v44 = v5;
    id v40 = v39;
    _os_log_impl(&dword_18D554000, v38, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Buy params indicate a dual-action buy but no bag available", (uint8_t *)&v41, 0x16u);
  }
  if (a3)
  {
    AMSError(601, @"Biometric Signature Failure", @"No bag available for dual-action buy", 0);
    BOOL v35 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v35 = 0;
  }
LABEL_13:

  return v35;
}

- (BOOL)_performCardEnrollmentCheck:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = AMSSetLogKeyIfNeeded();
  id v6 = [(AMSBiometricsSignatureTask *)self request];
  int v7 = [v6 isDualAction];

  if (!v7)
  {
    BOOL v19 = +[AMSLogConfig sharedBiometricsConfig];
    if (!v19)
    {
      BOOL v19 = +[AMSLogConfig sharedConfig];
    }
    v20 = [v19 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v38 = 138543618;
      *(void *)&v38[4] = objc_opt_class();
      *(_WORD *)&v38[12] = 2114;
      *(void *)&v38[14] = v5;
      id v21 = *(id *)&v38[4];
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping card enrollment check for no dual-action buy", v38, 0x16u);
    }
    goto LABEL_21;
  }
  BOOL v8 = [(AMSBiometricsSignatureTask *)self request];
  uint64_t v9 = [v8 localAuthAccessControlRef];

  if (v9) {
    goto LABEL_3;
  }
  uint64_t v31 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v31)
  {
    uint64_t v31 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v32 = [v31 OSLogObject];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)uint64_t v38 = 138543618;
    *(void *)&v38[4] = objc_opt_class();
    *(_WORD *)&v38[12] = 2114;
    *(void *)&v38[14] = v5;
    id v33 = *(id *)&v38[4];
    _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Signature failed for dual-action buy for no ACL", v38, 0x16u);
  }
  id v29 = AMSError(601, @"Biometric Signature Failure", @"No ACL available for dual-action buy", 0);
  if (!v29)
  {
LABEL_3:
    id v10 = [(AMSBiometricsSignatureTask *)self request];
    int v11 = [v10 shouldUseApplePayClassic];

    if (v11)
    {
      uint64_t v12 = +[AMSLogConfig sharedBiometricsConfig];
      if (!v12)
      {
        uint64_t v12 = +[AMSLogConfig sharedConfig];
      }
      __int16 v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = objc_opt_class();
        *(_DWORD *)uint64_t v38 = 138543618;
        *(void *)&v38[4] = v14;
        *(_WORD *)&v38[12] = 2114;
        *(void *)&v38[14] = v5;
        id v15 = v14;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking dual-action buy ACL for apple-pay-classic capability", v38, 0x16u);
      }
      id v16 = [(AMSBiometricsSignatureTask *)self request];
      uint64_t v17 = [v16 localAuthAccessControlRef];
      uint64_t v18 = 4;
    }
    else
    {
      v22 = [(AMSBiometricsSignatureTask *)self request];
      int v23 = [v22 shouldUseAutoEnrollment];

      if (!v23)
      {
LABEL_21:
        id v29 = 0;
        goto LABEL_22;
      }
      id v24 = +[AMSLogConfig sharedBiometricsConfig];
      if (!v24)
      {
        id v24 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v25 = [v24 OSLogObject];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = objc_opt_class();
        *(_DWORD *)uint64_t v38 = 138543618;
        *(void *)&v38[4] = v26;
        *(_WORD *)&v38[12] = 2114;
        *(void *)&v38[14] = v5;
        id v27 = v26;
        _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking dual-action buy ACL for auto-enrollment capability", v38, 0x16u);
      }
      id v16 = [(AMSBiometricsSignatureTask *)self request];
      uint64_t v17 = [v16 localAuthAccessControlRef];
      uint64_t v18 = 3;
    }
    BOOL v28 = +[AMSBiometrics isActionSupported:v18 withAccessControl:v17];

    if (v28) {
      goto LABEL_21;
    }
    v34 = +[AMSLogConfig sharedBiometricsConfig];
    if (!v34)
    {
      v34 = +[AMSLogConfig sharedConfig];
    }
    BOOL v35 = [v34 OSLogObject];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = objc_opt_class();
      *(_DWORD *)uint64_t v38 = 138543618;
      *(void *)&v38[4] = v36;
      *(_WORD *)&v38[12] = 2114;
      *(void *)&v38[14] = v5;
      id v37 = v36;
      _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Signature failed dual-action buy for insufficient ACL capabilities", v38, 0x16u);
    }
    id v29 = AMSError(601, @"Biometric Signature Failure", @"ACL does not support dual-action buy", 0);
  }
LABEL_22:
  if (a3) {
    *a3 = v29;
  }

  return v29 == 0;
}

- (void)regenerateAttestationKeys
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedBiometricsConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    int v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    id v21 = v5;
    __int16 v22 = 2114;
    int v23 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Required to regenerate attestation.", buf, 0x16u);
  }
  BOOL v8 = [(AMSBiometricsSignatureTask *)self request];
  uint64_t v9 = [v8 keychainOptions];
  id v10 = (void *)[v9 copy];

  [v10 setRegenerateKeys:1];
  id v19 = 0;
  int v11 = +[AMSAttestation attestationWithOptions:v10 error:&v19];
  id v12 = v19;
  __int16 v13 = v12;
  if (!v11 || v12)
  {
    int v14 = +[AMSLogConfig sharedBiometricsConfig];
    if (!v14)
    {
      int v14 = +[AMSLogConfig sharedConfig];
    }
    id v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = objc_opt_class();
      id v17 = v16;
      uint64_t v18 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      id v21 = v16;
      __int16 v22 = 2114;
      int v23 = v18;
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Re-attestation failed. error: %{public}@", buf, 0x20u);
    }
  }
}

- (id)signWithPrivateKey:(__SecKey *)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v44 = 0;
  int v7 = [(id)objc_opt_class() fetchPublicKeyDataFromPrivateKey:a3 error:&v44];
  id v8 = v44;
  if (v7)
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [(AMSBiometricsSignatureTask *)self request];
    int v11 = [v10 challenge];
    id v43 = v8;
    id v12 = [v9 fetchDataToSignWithPublicKeyData:v7 challenge:v11 error:&v43];
    id v13 = v43;

    if (v12)
    {
      id v42 = v13;
      int v14 = [(id)objc_opt_class() signDataWithPrivateKey:a3 dataToSign:v12 error:&v42];
      id v8 = v42;

      if (v14)
      {
        id v15 = [v14 base64EncodedStringWithOptions:0];
        if ([v15 length])
        {
          id v16 = v15;
        }
        else
        {
          id v33 = +[AMSLogConfig sharedBiometricsConfig];
          if (!v33)
          {
            id v33 = +[AMSLogConfig sharedConfig];
          }
          v34 = [v33 OSLogObject];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            BOOL v35 = objc_opt_class();
            id v41 = v35;
            v36 = AMSLogKey();
            *(_DWORD *)buf = 138543618;
            v46 = v35;
            __int16 v47 = 2114;
            __int16 v48 = v36;
            _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode the signed string", buf, 0x16u);
          }
          if (a4)
          {
            AMSError(0, @"Signature Failed", @"Failed to encode the signed string.", 0);
            id v16 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v16 = 0;
          }
        }
      }
      else
      {
        id v27 = +[AMSLogConfig sharedBiometricsConfig];
        if (!v27)
        {
          id v27 = +[AMSLogConfig sharedConfig];
        }
        BOOL v28 = [v27 OSLogObject];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          id v29 = objc_opt_class();
          id v40 = v29;
          id v30 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          v46 = v29;
          __int16 v47 = 2114;
          __int16 v48 = v30;
          __int16 v49 = 2114;
          id v50 = v8;
          _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Signature failed fatal error when signing data with error: %{public}@", buf, 0x20u);
        }
        uint64_t v31 = [v8 domain];
        if ([v31 isEqualToString:*MEMORY[0x1E4F30B38]]) {
          BOOL v32 = [v8 code] != -2;
        }
        else {
          BOOL v32 = 0;
        }

        id v37 = [v8 domain];
        if ([v37 isEqualToString:*MEMORY[0x1E4F25268]]) {
          BOOL v38 = [v8 code] == -3;
        }
        else {
          BOOL v38 = 0;
        }

        if (v32 || v38) {
          [(AMSBiometricsSignatureTask *)self regenerateAttestationKeys];
        }
        if (a4)
        {
          AMSError(602, @"Signature Failed", @"Fatal error when signing data.", v8);
          id v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v16 = 0;
        }
      }
    }
    else
    {
      __int16 v22 = +[AMSLogConfig sharedBiometricsConfig];
      if (!v22)
      {
        __int16 v22 = +[AMSLogConfig sharedConfig];
      }
      int v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = objc_opt_class();
        id v25 = v24;
        uint64_t v26 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        v46 = v24;
        __int16 v47 = 2114;
        __int16 v48 = v26;
        __int16 v49 = 2114;
        id v50 = v13;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the data to sign from the challenge with error: %{public}@", buf, 0x20u);
      }
      if (a4)
      {
        AMSError(0, @"Signature Failed", @"Failed to fetch the data to sign from the challenge.", v13);
        id v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v16 = 0;
      }
      id v8 = v13;
    }
  }
  else
  {
    id v17 = +[AMSLogConfig sharedBiometricsConfig];
    if (!v17)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_opt_class();
      id v20 = v19;
      id v21 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      v46 = v19;
      __int16 v47 = 2114;
      __int16 v48 = v21;
      __int16 v49 = 2114;
      id v50 = v8;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch the public key for the private key with error: %{public}@", buf, 0x20u);
    }
    if (a4)
    {
      AMSError(0, @"Signature Failed", @"Failed to fetch the public key for the private key.", v8);
      id v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v16 = 0;
    }
  }

  return v16;
}

+ (__SecKey)copyPrivateKeyWithStyle:(unint64_t)a3 context:(id)a4 account:(id)a5 options:(id)a6 error:(id *)a7
{
  if (a3) {
    return +[AMSKeychain copyPrivateKeyWithContext:a4 account:a5 options:a6 error:a7];
  }
  else {
    return +[AMSKeychain copyCertificatePrivateKeyWithContext:a4 account:a5 options:a6 error:a7];
  }
}

+ (id)fetchPublicKeyDataFromPrivateKey:(__SecKey *)a3 error:(id *)a4
{
  CFErrorRef error = 0;
  id v5 = SecKeyCopyPublicKey(a3);
  if (v5)
  {
    id v6 = v5;
    CFDataRef v7 = SecKeyCopyExternalRepresentation(v5, &error);
    CFRelease(v6);
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  CFDataRef v7 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = error;
LABEL_4:
  return v7;
}

+ (id)fetchDataToSignWithPublicKeyData:(id)a3 challenge:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = [a3 base64EncodedStringWithOptions:0];
  uint64_t v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_1EDCA7308;
  }
  int v11 = [v7 stringByAppendingString:v10];

  id v12 = [v11 dataUsingEncoding:4];
  uint64_t v13 = [v12 length];
  if (a5 && !v13)
  {
    AMSError(0, @"Signature Failed", @"No data to sign", 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)signDataWithPrivateKey:(__SecKey *)a3 dataToSign:(id)a4 error:(id *)a5
{
  CFErrorRef error = 0;
  CFDataRef v6 = SecKeyCreateSignature(a3, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA70], (CFDataRef)a4, &error);
  if (a5) {
    *a5 = error;
  }
  return v6;
}

- (AMSBiometricsSignatureRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

@end