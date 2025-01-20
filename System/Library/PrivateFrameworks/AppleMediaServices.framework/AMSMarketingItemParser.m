@interface AMSMarketingItemParser
+ (id)_rawMarketingItemSelectionFromRawMarketingItems:(id)a3 serviceType:(id)a4 placement:(id)a5 engagementService:(id)a6;
+ (id)selectionFromMarketingItems:(id)a3;
+ (id)selectionFromRawMarketingItems:(id)a3;
+ (id)selectionFromRawMarketingItems:(id)a3 serviceType:(id)a4 placement:(id)a5;
@end

@implementation AMSMarketingItemParser

+ (id)selectionFromMarketingItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "rawValues", (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [a1 selectionFromRawMarketingItems:v5];

  return v12;
}

+ (id)selectionFromRawMarketingItems:(id)a3
{
  return (id)[a1 selectionFromRawMarketingItems:a3 serviceType:0 placement:0];
}

+ (id)selectionFromRawMarketingItems:(id)a3 serviceType:(id)a4 placement:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(AMSEngagement);
  v12 = [a1 _rawMarketingItemSelectionFromRawMarketingItems:v10 serviceType:v9 placement:v8 engagementService:v11];

  return v12;
}

+ (id)_rawMarketingItemSelectionFromRawMarketingItems:(id)a3 serviceType:(id)a4 placement:(id)a5 engagementService:(id)a6
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  id v13 = a6;
  if ([v10 count])
  {
    v35[0] = @"kind";
    v35[1] = @"serviceType";
    long long v14 = &stru_1EDCA7308;
    if (v11) {
      long long v15 = v11;
    }
    else {
      long long v15 = &stru_1EDCA7308;
    }
    v36[0] = @"AMSMarketingItemParser";
    v36[1] = v15;
    if (v12) {
      long long v14 = v12;
    }
    v35[2] = @"placement";
    v35[3] = @"items";
    v36[2] = v14;
    v36[3] = v10;
    long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];
    long long v17 = +[AMSLogConfig sharedConfig];
    if (!v17)
    {
      long long v17 = +[AMSLogConfig sharedConfig];
    }
    v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      v20 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v19;
      __int16 v33 = 2114;
      v34 = v20;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Parsing marketing items", buf, 0x16u);
    }
    v21 = [v13 enqueueData:v16];
    v22 = objc_alloc_init(AMSMutablePromise);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __114__AMSMarketingItemParser__rawMarketingItemSelectionFromRawMarketingItems_serviceType_placement_engagementService___block_invoke;
    v27[3] = &unk_1E55A3990;
    id v28 = v10;
    id v30 = a1;
    v23 = v22;
    v29 = v23;
    [v21 addFinishBlock:v27];
    v24 = v29;
    v25 = v23;
  }
  else
  {
    long long v16 = AMSError(7, @"No marketing items found", @"Found no marketing items for the given account", 0);
    v25 = +[AMSPromise promiseWithError:v16];
  }

  return v25;
}

void __114__AMSMarketingItemParser__rawMarketingItemSelectionFromRawMarketingItems_serviceType_placement_engagementService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 data];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"item"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;

    BOOL v9 = v5 != 0;
    if (!v5 && v8)
    {
      uint64_t v10 = [v8 count];
      uint64_t v11 = +[AMSLogConfig sharedConfig];
      v12 = (void *)v11;
      if (v10)
      {
        if (!v11)
        {
          v12 = +[AMSLogConfig sharedConfig];
        }
        id v13 = [v12 OSLogObject];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = objc_opt_class();
          long long v15 = AMSLogKey();
          int v34 = 138543618;
          uint64_t v35 = v14;
          __int16 v36 = 2114;
          uint64_t v37 = (uint64_t)v15;
          _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Marketing item selected", (uint8_t *)&v34, 0x16u);
        }
        long long v16 = *(void **)(a1 + 40);
        long long v17 = [[AMSMarketingItem alloc] initWithDictionary:v8];
        [v16 finishWithResult:v17];
      }
      else
      {
        if (!v11)
        {
          v12 = +[AMSLogConfig sharedConfig];
        }
        id v30 = [v12 OSLogObject];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = objc_opt_class();
          uint64_t v32 = AMSLogKey();
          int v34 = 138543618;
          uint64_t v35 = v31;
          __int16 v36 = 2114;
          uint64_t v37 = (uint64_t)v32;
          _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No marketing item selected", (uint8_t *)&v34, 0x16u);
        }
        __int16 v33 = *(void **)(a1 + 40);
        AMSError(7, @"No marketing item", @"Engagement did not select a marketing item", 0);
        long long v17 = (AMSMarketingItem *)objc_claimAutoreleasedReturnValue();
        [v33 finishWithError:v17];
      }
      goto LABEL_26;
    }
  }
  else
  {

    id v8 = 0;
    BOOL v9 = v5 != 0;
  }
  if ([*(id *)(a1 + 32) count])
  {
    v18 = [AMSMarketingItem alloc];
    uint64_t v19 = [*(id *)(a1 + 32) firstObject];
    long long v17 = [(AMSMarketingItem *)v18 initWithDictionary:v19];
  }
  else
  {
    long long v17 = 0;
  }
  v20 = &stru_1EDCA7308;
  if (!v17) {
    v20 = @" NOT";
  }
  v21 = v20;
  v22 = +[AMSLogConfig sharedConfig];
  if (!v22)
  {
    v22 = +[AMSLogConfig sharedConfig];
  }
  v23 = [v22 OSLogObject];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = AMSLogKey();
    v26 = (void *)v25;
    int v34 = 138544130;
    v27 = @"<noerror>";
    uint64_t v35 = v24;
    if (v9) {
      v27 = v5;
    }
    __int16 v36 = 2114;
    uint64_t v37 = v25;
    __int16 v38 = 2114;
    v39 = v21;
    __int16 v40 = 2114;
    v41 = v27;
    _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Parsing failed. Will%{public}@ fall back to first item. %{public}@", (uint8_t *)&v34, 0x2Au);
  }
  id v28 = *(void **)(a1 + 40);
  if (v17)
  {
    [v28 finishWithResult:v17];
  }
  else
  {
    v29 = AMSError(7, @"No marketing item", @"Engagement did not select a marketing item", 0);
    [v28 finishWithError:v29];
  }
LABEL_26:
}

@end