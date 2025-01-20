@interface SGLowMemoryContactEnumeration
+ (void)enumerateContactIdentifierBatchesUsingBlock:(id)a3;
+ (void)enumerateContactIdentifiersUsingBlock:(id)a3;
@end

@implementation SGLowMemoryContactEnumeration

+ (void)enumerateContactIdentifiersUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__SGLowMemoryContactEnumeration_enumerateContactIdentifiersUsingBlock___block_invoke;
  v6[3] = &unk_1E65B7988;
  id v5 = v4;
  id v7 = v5;
  v8 = v9;
  [a1 enumerateContactIdentifierBatchesUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

void __71__SGLowMemoryContactEnumeration_enumerateContactIdentifiersUsingBlock___block_invoke(uint64_t a1, void *a2, unsigned __int8 *a3)
{
  id v12 = a2;
  uint64_t v5 = [v12 count];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5 - 1;
    do
    {
      v8 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = [v12 objectAtIndexedSubscript:v6];
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

      LODWORD(v9) = *a3;
      if (v9) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = v7 == v6;
      }
      ++v6;
    }
    while (!v11);
  }
}

+ (void)enumerateContactIdentifierBatchesUsingBlock:(id)a3
{
  v40[2] = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, void, uint64_t))a3;
  id v4 = objc_opt_new();
  [v4 setLowPriority:1];
  [v4 setFetchAttributes:MEMORY[0x1E4F1CBF0]];
  [v4 setReason:@"reason:SGLowMemoryContactEnumeration-1; code:9"];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:@"true" context:v4];
  [v5 setBundleIDs:&unk_1F25368C0];
  [v5 setPrivateIndex:0];
  if ([MEMORY[0x1E4F93B10] isDeviceFormattedForProtection])
  {
    uint64_t v6 = *MEMORY[0x1E4F28378];
    v40[0] = *MEMORY[0x1E4F28358];
    v40[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    [v5 setProtectionClasses:v7];
  }
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("SGLowMemoryContactEnumeration", v8);

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__11826;
  v38 = __Block_byref_object_dispose__11827;
  id v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke;
  v25[3] = &unk_1E65B7960;
  BOOL v11 = v9;
  v26 = v11;
  v28 = &v30;
  v29 = &v34;
  id v12 = v10;
  v27 = v12;
  [v5 setFoundItemsHandler:v25];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_4;
  v21 = &unk_1E65BB680;
  v13 = v11;
  v22 = v13;
  v24 = &v30;
  v14 = v12;
  v23 = v14;
  [v5 setCompletionHandler:&v18];
  objc_msgSend(v5, "start", v18, v19, v20, v21);
  while (1)
  {
    intptr_t v15 = dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    if (*((unsigned char *)v31 + 24)) {
      break;
    }
    v16 = (void *)MEMORY[0x1CB79B230](v15);
    v3[2](v3, v35[5], (uint64_t)(v31 + 3));
    if (*((unsigned char *)v31 + 24)) {
      [v5 cancel];
    }
    int v17 = *((unsigned __int8 *)v31 + 24);
    dispatch_resume(v13);
    if (v17) {
      goto LABEL_10;
    }
  }
  dispatch_resume(v13);
LABEL_10:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

void __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_2;
  block[3] = &unk_1E65B7938;
  long long v10 = *(_OWORD *)(a1 + 48);
  id v7 = v3;
  v8 = v4;
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_sync(v8, block);
}

void __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_5;
  v6[3] = &unk_1E65BE418;
  uint64_t v10 = *(void *)(a1 + 48);
  id v7 = v3;
  v8 = v4;
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_sync(v8, v6);
}

intptr_t __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_5(intptr_t result)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(result + 56) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    intptr_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    if (*(void *)(result + 32))
    {
      id v3 = sgLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        uint64_t v4 = *(void *)(v2 + 32);
        int v5 = 138412290;
        uint64_t v6 = v4;
        _os_log_fault_impl(&dword_1CA650000, v3, OS_LOG_TYPE_FAULT, "SGLowMemoryContactEnumeration got an error from Spotlight: %@", (uint8_t *)&v5, 0xCu);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
    }
    dispatch_suspend(*(dispatch_object_t *)(v2 + 40));
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 48));
  }
  return result;
}

intptr_t __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    uint64_t v2 = objc_msgSend(*(id *)(result + 32), "_pas_proxyArrayWithMapping:", &__block_literal_global_11832);
    uint64_t v3 = *(void *)(*(void *)(v1 + 64) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    dispatch_suspend(*(dispatch_object_t *)(v1 + 40));
    int v5 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v5);
  }
  return result;
}

uint64_t __77__SGLowMemoryContactEnumeration_enumerateContactIdentifierBatchesUsingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

@end