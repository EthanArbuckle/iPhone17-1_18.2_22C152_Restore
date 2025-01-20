@interface AMSFDSService
+ (id)cacheFDS:(id)a3 forPurchaseInfo:(id)a4;
+ (id)cachedFDSForPurchaseInfo:(id)a3;
+ (id)didConsumeFDSForPurchaseInfo:(id)a3;
+ (id)generateFDSWithRequest:(id)a3;
+ (id)partialFDSAssessmentForRequest:(id)a3;
@end

@implementation AMSFDSService

+ (id)cacheFDS:(id)a3 forPurchaseInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__31;
  v21 = __Block_byref_object_dispose__31;
  v22 = objc_alloc_init(AMSDaemonConnection);
  v7 = [(id)v18[5] purchaseServiceProxy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__AMSFDSService_cacheFDS_forPurchaseInfo___block_invoke;
  v13[3] = &unk_1E55A29B0;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  id v15 = v9;
  v16 = &v17;
  v10 = [v7 thenWithBlock:v13];
  v11 = [v10 binaryPromiseAdapter];

  _Block_object_dispose(&v17, 8);
  return v11;
}

AMSMutablePromise *__42__AMSFDSService_cacheFDS_forPurchaseInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_alloc_init(AMSMutablePromise);
  id v5 = [*(id *)(a1 + 32) purchase];
  id v6 = [v5 uniqueIdentifier];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) purchase];
    id v9 = [v8 logUUID];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __42__AMSFDSService_cacheFDS_forPurchaseInfo___block_invoke_6;
    v17[3] = &unk_1E55A0700;
    v10 = v4;
    uint64_t v11 = *(void *)(a1 + 48);
    v18 = v10;
    uint64_t v19 = v11;
    [v3 cacheFDS:v7 forPurchaseIdentifier:v6 logKey:v9 completion:v17];

    v12 = v18;
  }
  else
  {
    v13 = +[AMSLogConfig sharedConfig];
    if (!v13)
    {
      v13 = +[AMSLogConfig sharedConfig];
    }
    id v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "AMSFDSService: [%{public}@] No purchase identifier", buf, 0xCu);
    }
    v12 = AMSError(2, @"AFDS Error", @"No Purchase Identifier", 0);
    [(AMSMutablePromise *)v4 finishWithError:v12];
  }

  return v4;
}

void __42__AMSFDSService_cacheFDS_forPurchaseInfo___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 finishWithError:a2];
  }
  else {
    [v3 finishWithResult:MEMORY[0x1E4F1CC38]];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

+ (id)cachedFDSForPurchaseInfo:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__31;
  uint64_t v17 = __Block_byref_object_dispose__31;
  v18 = objc_alloc_init(AMSDaemonConnection);
  id v5 = [(id)v14[5] purchaseServiceProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__AMSFDSService_cachedFDSForPurchaseInfo___block_invoke;
  v9[3] = &unk_1E55A2A00;
  id v6 = v4;
  uint64_t v11 = &v13;
  id v12 = a1;
  id v10 = v6;
  uint64_t v7 = [v5 thenWithBlock:v9];

  _Block_object_dispose(&v13, 8);
  return v7;
}

AMSMutablePromise *__42__AMSFDSService_cachedFDSForPurchaseInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  id v5 = [*(id *)(a1 + 32) purchase];
  id v6 = [v5 uniqueIdentifier];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) purchase];
    id v8 = [v7 logUUID];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__AMSFDSService_cachedFDSForPurchaseInfo___block_invoke_9;
    v14[3] = &unk_1E55A29D8;
    uint64_t v15 = v4;
    long long v16 = *(_OWORD *)(a1 + 40);
    [v3 cachedFDSForPurchaseIdentifier:v6 logKey:v8 completion:v14];

    id v9 = v15;
  }
  else
  {
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "AMSFDSService: [%{public}@] No purchase identifier", buf, 0xCu);
    }
    id v9 = AMSError(2, @"AFDS Error", @"No Purchase Identifier", 0);
    [(AMSMutablePromise *)v4 finishWithError:v9];
  }

  return v4;
}

void __42__AMSFDSService_cachedFDSForPurchaseInfo___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      [*(id *)(a1 + 32) finishWithResult:v5];
      goto LABEL_5;
    }
    id v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = AMSSetLogKeyIfNeeded();
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      uint64_t v17 = v13;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find AFDS value", (uint8_t *)&v14, 0x16u);
    }
    AMSError(12, @"AFDS Error", @"No AFDS", 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = v6;
  [*(id *)(a1 + 32) finishWithError:v6];

LABEL_5:
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

+ (id)didConsumeFDSForPurchaseInfo:(id)a3
{
  id v3 = a3;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__31;
  uint64_t v19 = __Block_byref_object_dispose__31;
  v20 = objc_alloc_init(AMSDaemonConnection);
  id v4 = [(id)v16[5] purchaseServiceProxy];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __46__AMSFDSService_didConsumeFDSForPurchaseInfo___block_invoke;
  uint64_t v12 = &unk_1E55A2A28;
  id v5 = v3;
  id v13 = v5;
  int v14 = &v15;
  id v6 = [v4 thenWithBlock:&v9];
  uint64_t v7 = objc_msgSend(v6, "binaryPromiseAdapter", v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
  return v7;
}

AMSMutablePromise *__46__AMSFDSService_didConsumeFDSForPurchaseInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  id v5 = [*(id *)(a1 + 32) purchase];
  id v6 = [v5 uniqueIdentifier];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) purchase];
    uint64_t v8 = [v7 logUUID];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__AMSFDSService_didConsumeFDSForPurchaseInfo___block_invoke_14;
    v16[3] = &unk_1E55A0700;
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v17 = v9;
    uint64_t v18 = v10;
    [v3 didConsumeFDSForPurchaseIdentifier:v6 logKey:v8 completion:v16];

    uint64_t v11 = v17;
  }
  else
  {
    uint64_t v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543362;
      v20 = v14;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "AMSFDSService: [%{public}@] No purchase identifier", buf, 0xCu);
    }
    uint64_t v11 = AMSError(2, @"AFDS Error", @"No Purchase Identifier", 0);
    [(AMSMutablePromise *)v4 finishWithError:v11];
  }

  return v4;
}

void __46__AMSFDSService_didConsumeFDSForPurchaseInfo___block_invoke_14(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    [v3 finishWithError:a2];
  }
  else {
    [v3 finishWithResult:MEMORY[0x1E4F1CC38]];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

+ (id)generateFDSWithRequest:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__31;
  uint64_t v15 = __Block_byref_object_dispose__31;
  __int16 v16 = objc_alloc_init(AMSDaemonConnection);
  uint64_t v4 = [(id)v12[5] purchaseServiceProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__AMSFDSService_generateFDSWithRequest___block_invoke;
  v8[3] = &unk_1E55A2A28;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = &v11;
  id v6 = [v4 thenWithBlock:v8];

  _Block_object_dispose(&v11, 8);
  return v6;
}

AMSMutablePromise *__40__AMSFDSService_generateFDSWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v5 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__AMSFDSService_generateFDSWithRequest___block_invoke_2;
  v9[3] = &unk_1E55A2A50;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  [v3 generateFDSWithRequest:v5 completion:v9];

  return v6;
}

void __40__AMSFDSService_generateFDSWithRequest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a3) {
    objc_msgSend(v4, "finishWithError:");
  }
  else {
    [v4 finishWithResult:a2];
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

+ (id)partialFDSAssessmentForRequest:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__31;
  uint64_t v15 = __Block_byref_object_dispose__31;
  __int16 v16 = objc_alloc_init(AMSDaemonConnection);
  uint64_t v4 = [(id)v12[5] purchaseServiceProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__AMSFDSService_partialFDSAssessmentForRequest___block_invoke;
  v8[3] = &unk_1E55A2A28;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = &v11;
  id v6 = [v4 thenWithBlock:v8];

  _Block_object_dispose(&v11, 8);
  return v6;
}

AMSMutablePromise *__48__AMSFDSService_partialFDSAssessmentForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v5 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__AMSFDSService_partialFDSAssessmentForRequest___block_invoke_2;
  v9[3] = &unk_1E55A2A50;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  [v3 partialFDSAssessmentForRequest:v5 completion:v9];

  return v6;
}

void __48__AMSFDSService_partialFDSAssessmentForRequest___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a3) {
    objc_msgSend(v4, "finishWithError:");
  }
  else {
    [v4 finishWithResult:a2];
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

@end