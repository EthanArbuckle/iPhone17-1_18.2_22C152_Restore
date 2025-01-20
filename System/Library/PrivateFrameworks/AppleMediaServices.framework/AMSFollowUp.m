@interface AMSFollowUp
- (AMSFollowUp)init;
- (FLFollowUpController)followUpController;
- (OS_dispatch_queue)followUpQueue;
- (id)_pendingFollowUpWithBackingIdentifier:(id)a3 error:(id *)a4;
- (id)clearFollowUpItem:(id)a3;
- (id)clearFollowUpWithBackingIdentifier:(id)a3;
- (id)clearFollowUpWithIdentifier:(id)a3 account:(id)a4;
- (id)pendingFollowUpWithIdentifier:(id)a3 account:(id)a4;
- (id)pendingFollowUps;
- (id)pendingFollowUpsForAccount:(id)a3;
- (id)postFollowUpItem:(id)a3;
- (void)setFollowUpController:(id)a3;
- (void)setFollowUpQueue:(id)a3;
@end

@implementation AMSFollowUp

- (AMSFollowUp)init
{
  v10.receiver = self;
  v10.super_class = (Class)AMSFollowUp;
  v2 = [(AMSFollowUp *)&v10 init];
  if (v2)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v3 = (void *)_MergedGlobals_109;
    uint64_t v15 = _MergedGlobals_109;
    if (!_MergedGlobals_109)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getFLFollowUpControllerClass_block_invoke;
      v11[3] = &unk_1E559EC70;
      v11[4] = &v12;
      __getFLFollowUpControllerClass_block_invoke((uint64_t)v11);
      v3 = (void *)v13[3];
    }
    v4 = v3;
    _Block_object_dispose(&v12, 8);
    uint64_t v5 = [[v4 alloc] initWithClientIdentifier:@"com.apple.AppleMediaServices"];
    followUpController = v2->_followUpController;
    v2->_followUpController = (FLFollowUpController *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.AppleMediaServices.followUpQueue", 0);
    followUpQueue = v2->_followUpQueue;
    v2->_followUpQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (id)clearFollowUpItem:(id)a3
{
  v4 = [a3 backingIdentifier];
  uint64_t v5 = [(AMSFollowUp *)self clearFollowUpWithBackingIdentifier:v4];

  return v5;
}

- (id)clearFollowUpWithBackingIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(AMSMutableBinaryPromise);
  v6 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  dispatch_queue_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2114;
    id v21 = v4;
    id v8 = v19;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@: Clearing follow up with backing identifier: %{public}@", buf, 0x16u);
  }
  v9 = [(AMSFollowUp *)self followUpQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AMSFollowUp_clearFollowUpWithBackingIdentifier___block_invoke;
  block[3] = &unk_1E55A22D0;
  block[4] = self;
  id v16 = v4;
  objc_super v10 = v5;
  v17 = v10;
  id v11 = v4;
  dispatch_async(v9, block);

  uint64_t v12 = v17;
  v13 = v10;

  return v13;
}

void __50__AMSFollowUp_clearFollowUpWithBackingIdentifier___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) followUpController];
  v21[0] = *(void *)(a1 + 40);
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v16 = 0;
  char v4 = [v2 clearPendingFollowUpItemsWithUniqueIdentifiers:v3 error:&v16];
  id v5 = v16;

  if (!v5)
  {
    uint64_t v6 = +[AMSLogConfig sharedFollowUpConfig];
    dispatch_queue_t v7 = (void *)v6;
    if (v4)
    {
      if (!v6)
      {
        dispatch_queue_t v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v18 = v9;
      __int16 v19 = 2114;
      uint64_t v20 = v10;
      id v11 = v9;
      uint64_t v12 = "%{public}@: Cleared follow up with backing identifier: %{public}@";
      v13 = v8;
      uint32_t v14 = 22;
    }
    else
    {
      if (!v6)
      {
        dispatch_queue_t v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      uint64_t v15 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      id v11 = v15;
      uint64_t v12 = "%{public}@: Follow up clear finished without clearing anything";
      v13 = v8;
      uint32_t v14 = 12;
    }
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);

LABEL_13:
    [*(id *)(a1 + 48) finishWithSuccess];
    goto LABEL_14;
  }
  [*(id *)(a1 + 48) finishWithError:v5];
LABEL_14:
}

- (id)clearFollowUpWithIdentifier:(id)a3 account:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v8)
  {
    id v8 = +[AMSLogConfig sharedConfig];
  }
  v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    uint64_t v12 = AMSHashIfNeeded(v7);
    int v16 = 138543874;
    v17 = v10;
    __int16 v18 = 2114;
    __int16 v19 = v12;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_INFO, "%{public}@: Clearing follow up (account: %{public}@, identifier: %{public}@)", (uint8_t *)&v16, 0x20u);
  }
  v13 = +[AMSFollowUpItem backingIdentifierForIdentifier:v6 account:v7];
  uint32_t v14 = [(AMSFollowUp *)self clearFollowUpWithBackingIdentifier:v13];

  return v14;
}

- (id)pendingFollowUps
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(AMSMutablePromise);
  char v4 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v4)
  {
    char v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = (id)objc_opt_class();
    id v6 = v15;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_INFO, "%{public}@: Fetching all pending follow ups", buf, 0xCu);
  }
  id v7 = [(AMSFollowUp *)self followUpQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __31__AMSFollowUp_pendingFollowUps__block_invoke;
  v12[3] = &unk_1E559F1E0;
  v12[4] = self;
  id v8 = v3;
  v13 = v8;
  dispatch_async(v7, v12);

  v9 = v13;
  uint64_t v10 = v8;

  return v10;
}

void __31__AMSFollowUp_pendingFollowUps__block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v27 = a1;
  v3 = [*(id *)(a1 + 32) followUpController];
  id v33 = 0;
  char v4 = [v3 pendingFollowUpItems:&v33];
  id v28 = v33;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    id v5 = v4;
  }
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = [v11 uniqueIdentifier];
        int v13 = [v12 hasPrefix:0x1EDCB5FA8];

        if (v13)
        {
          uint32_t v14 = [[AMSFollowUpItem alloc] initWithFollowUpItem:v11];
          [v2 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v8);
  }

  uint64_t v15 = +[AMSLogConfig sharedFollowUpConfig];
  uint64_t v16 = (void *)v15;
  if (v28)
  {
    if (!v15)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = objc_opt_class();
      id v19 = v18;
      __int16 v20 = AMSLogableError(v28);
      *(_DWORD *)buf = 138543618;
      v35 = v18;
      __int16 v36 = 2114;
      uint64_t v37 = (uint64_t)v20;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch pending follow ups with error %{public}@", buf, 0x16u);
    }
    [*(id *)(v27 + 40) finishWithError:v28];
  }
  else
  {
    if (!v15)
    {
      uint64_t v16 = +[AMSLogConfig sharedConfig];
    }
    id v21 = [v16 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = objc_opt_class();
      id v23 = v22;
      uint64_t v24 = [v2 count];
      *(_DWORD *)buf = 138543618;
      v35 = v22;
      __int16 v36 = 2050;
      uint64_t v37 = v24;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_INFO, "%{public}@: Fetched %{public}lu follow ups", buf, 0x16u);
    }
    v25 = *(void **)(v27 + 40);
    v26 = (void *)[v2 copy];
    [v25 finishWithResult:v26];
  }
}

- (id)pendingFollowUpsForAccount:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    uint64_t v9 = AMSHashIfNeeded(v4);
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v7;
    __int16 v19 = 2114;
    __int16 v20 = v9;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, "%{public}@: Fetching pending follow up for account %{public}@", buf, 0x16u);
  }
  uint64_t v10 = [(AMSFollowUp *)self pendingFollowUps];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__AMSFollowUp_pendingFollowUpsForAccount___block_invoke;
  v14[3] = &unk_1E55A3060;
  id v15 = v4;
  uint64_t v16 = self;
  id v11 = v4;
  uint64_t v12 = [v10 thenWithBlock:v14];

  return v12;
}

id __42__AMSFollowUp_pendingFollowUpsForAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  __int16 v19 = __42__AMSFollowUp_pendingFollowUpsForAccount___block_invoke_2;
  __int16 v20 = &unk_1E55A3038;
  id v21 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(a2, "ams_filterUsingTest:", &v17);
  id v5 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    uint64_t v9 = [v4 count];
    uint64_t v10 = AMSHashIfNeeded(*(void **)(a1 + 32));
    *(_DWORD *)buf = 138543874;
    id v23 = v7;
    __int16 v24 = 2050;
    uint64_t v25 = v9;
    __int16 v26 = 2114;
    uint64_t v27 = v10;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_INFO, "%{public}@: Fetched %{public}ld follow ups for account %{public}@", buf, 0x20u);
  }
  if ([v4 count])
  {
    id v11 = +[AMSPromise promiseWithResult:v4];
  }
  else
  {
    uint64_t v12 = NSString;
    int v13 = [*(id *)(a1 + 32) hashedDescription];
    uint32_t v14 = [v12 stringWithFormat:@"No follow-ups exist for %@.", v13, v17, v18, v19, v20];

    id v15 = AMSError(7, @"Item Not Found", v14, 0);
    id v11 = +[AMSPromise promiseWithError:v15];
  }
  return v11;
}

uint64_t __42__AMSFollowUp_pendingFollowUpsForAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "ams_DSID");
  if (v4)
  {
    id v5 = [v3 account];
    id v6 = objc_msgSend(v5, "ams_DSID");
    uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "ams_DSID");
    uint64_t v8 = [v6 isEqualToNumber:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)pendingFollowUpWithIdentifier:(id)a3 account:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(AMSMutablePromise);
  uint64_t v9 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v9)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = objc_opt_class();
    id v12 = v11;
    int v13 = AMSHashIfNeeded(v7);
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v11;
    __int16 v28 = 2114;
    long long v29 = v13;
    __int16 v30 = 2114;
    id v31 = v6;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_INFO, "%{public}@: Fetching pending follow up (account: %{public}@, identifier: %{public}@)", buf, 0x20u);
  }
  uint32_t v14 = [(AMSFollowUp *)self followUpQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __53__AMSFollowUp_pendingFollowUpWithIdentifier_account___block_invoke;
  v21[3] = &unk_1E55A2280;
  id v22 = v6;
  id v23 = v7;
  __int16 v24 = self;
  id v15 = v8;
  uint64_t v25 = v15;
  id v16 = v7;
  id v17 = v6;
  dispatch_async(v14, v21);

  uint64_t v18 = v25;
  __int16 v19 = v15;

  return v19;
}

void __53__AMSFollowUp_pendingFollowUpWithIdentifier_account___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = +[AMSFollowUpItem backingIdentifierForIdentifier:*(void *)(a1 + 32) account:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);
  id v30 = 0;
  id v4 = [v3 _pendingFollowUpWithBackingIdentifier:v2 error:&v30];
  id v5 = v30;
  if (v5)
  {
    id v6 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = *(void **)(a1 + 40);
      id v10 = v8;
      id v11 = AMSHashIfNeeded(v9);
      id v12 = AMSLogableError(v5);
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      uint64_t v32 = v8;
      __int16 v33 = 2114;
      v34 = v11;
      __int16 v35 = 2114;
      __int16 v36 = v12;
      __int16 v37 = 2114;
      uint64_t v38 = v13;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@: Failed to fetch pending follow up (account: %{public}@, error: %{public}@, identifier: %{public}@)", buf, 0x2Au);
    }
    [*(id *)(a1 + 56) finishWithError:v5];
  }
  else
  {
    uint64_t v14 = +[AMSLogConfig sharedFollowUpConfig];
    id v15 = (void *)v14;
    if (v4)
    {
      if (!v14)
      {
        id v15 = +[AMSLogConfig sharedConfig];
      }
      id v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = objc_opt_class();
        uint64_t v18 = *(void **)(a1 + 40);
        id v19 = v17;
        __int16 v20 = AMSHashIfNeeded(v18);
        id v21 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v32 = v17;
        __int16 v33 = 2114;
        v34 = v20;
        __int16 v35 = 2114;
        __int16 v36 = v21;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_INFO, "%{public}@: Fetched pending follow up (account: %{public}@, identifier: %{public}@)", buf, 0x20u);
      }
      [*(id *)(a1 + 56) finishWithResult:v4];
    }
    else
    {
      if (!v14)
      {
        id v15 = +[AMSLogConfig sharedConfig];
      }
      id v22 = [v15 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = objc_opt_class();
        __int16 v24 = *(void **)(a1 + 40);
        id v25 = v23;
        __int16 v26 = AMSHashIfNeeded(v24);
        uint64_t v27 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v32 = v23;
        __int16 v33 = 2114;
        v34 = v26;
        __int16 v35 = 2114;
        __int16 v36 = v27;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch pending follow up as no item could be found (account: %{public}@, identifier: %{public}@)", buf, 0x20u);
      }
      __int16 v28 = *(void **)(a1 + 56);
      long long v29 = AMSError(7, @"Item Not Found", @"Follow up item could not be found", 0);
      [v28 finishWithError:v29];
    }
  }
}

- (id)postFollowUpItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(AMSMutablePromise);
  id v6 = +[AMSLogConfig sharedFollowUpConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v8;
    id v10 = [v4 identifier];
    *(_DWORD *)buf = 138543618;
    id v21 = v8;
    __int16 v22 = 2114;
    id v23 = v10;
    _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_INFO, "%{public}@: Posting follow up item with identifier %{public}@", buf, 0x16u);
  }
  id v11 = [(AMSFollowUp *)self followUpQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AMSFollowUp_postFollowUpItem___block_invoke;
  block[3] = &unk_1E55A22D0;
  block[4] = self;
  id v18 = v4;
  id v12 = v5;
  id v19 = v12;
  id v13 = v4;
  dispatch_async(v11, block);

  uint64_t v14 = v19;
  id v15 = v12;

  return v15;
}

void __32__AMSFollowUp_postFollowUpItem___block_invoke(id *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  id v3 = [a1[5] backingIdentifier];
  id v28 = 0;
  id v4 = [v2 _pendingFollowUpWithBackingIdentifier:v3 error:&v28];
  id v5 = v28;

  if (v5)
  {
    id v6 = a1[6];
LABEL_13:
    [v6 finishWithError:v5];
    goto LABEL_14;
  }
  if (([a1[5] shouldOverwriteItem:v4] & 1) == 0)
  {
    id v9 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_opt_class();
      id v12 = a1[5];
      id v13 = v11;
      uint64_t v14 = [v12 identifier];
      *(_DWORD *)buf = 138543618;
      id v30 = v11;
      __int16 v31 = 2114;
      uint64_t v32 = v14;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to post follow up item with identifier %{public}@; Unable to overwrite a follow up with higher priority.",
        buf,
        0x16u);
    }
    id v15 = a1[6];
    AMSError(6, @"Unable To Overwrite", @"Unable to overwrite a follow up with higher priority", 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v15;
    goto LABEL_13;
  }
  if (v4)
  {
    uint64_t v7 = [v4 priority];
    if (v7 == [a1[5] priority]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
  }
  else
  {
    uint64_t v8 = 2;
  }
  id v16 = [a1[5] generateItem];
  id v17 = [a1[4] followUpController];
  id v27 = 0;
  char v18 = [v17 postFollowUpItem:v16 error:&v27];
  id v5 = v27;

  if (v18)
  {
    id v19 = a1[6];
    __int16 v20 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
    [v19 finishWithResult:v20];
  }
  else
  {
    if (v5)
    {
      id v21 = +[AMSLogConfig sharedFollowUpConfig];
      if (!v21)
      {
        id v21 = +[AMSLogConfig sharedConfig];
      }
      __int16 v22 = [v21 OSLogObject];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = objc_opt_class();
        id v24 = a1[5];
        id v25 = v23;
        __int16 v26 = [v24 identifier];
        *(_DWORD *)buf = 138543618;
        id v30 = v23;
        __int16 v31 = 2114;
        uint64_t v32 = v26;
        _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_INFO, "%{public}@: Successfully posted follow up item with identifier %{public}@", buf, 0x16u);
      }
    }
    else
    {
      AMSError(0, @"Follow Up Post Failed", @"Follow up post failed for an unknown reason", 0);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    [a1[6] finishWithError:v5];
  }

LABEL_14:
}

- (id)_pendingFollowUpWithBackingIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(AMSFollowUp *)self followUpController];
  id v27 = 0;
  uint64_t v8 = [v7 pendingFollowUpItems:&v27];
  id v9 = v27;

  if (v9)
  {
    if (a4)
    {
      id v10 = 0;
      *a4 = v9;
    }
    else
    {
      id v17 = +[AMSLogConfig sharedFollowUpConfig];
      if (!v17)
      {
        id v17 = +[AMSLogConfig sharedConfig];
      }
      char v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = objc_opt_class();
        id v20 = v19;
        id v21 = AMSLogableError(v9);
        *(_DWORD *)buf = 138543874;
        id v30 = v19;
        __int16 v31 = 2112;
        id v32 = v6;
        __int16 v33 = 2114;
        v34 = v21;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch pending follow ups with identifier: %@ error: %{public}@", buf, 0x20u);
      }
      id v10 = 0;
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v8;
    id v10 = (AMSFollowUpItem *)[v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (AMSFollowUpItem *)((char *)i + 1))
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v11);
          }
          uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v15 = objc_msgSend(v14, "uniqueIdentifier", (void)v23);
          int v16 = [v6 isEqualToString:v15];

          if (v16)
          {
            id v10 = [[AMSFollowUpItem alloc] initWithFollowUpItem:v14];
            goto LABEL_19;
          }
        }
        id v10 = (AMSFollowUpItem *)[v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  return v10;
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
}

- (OS_dispatch_queue)followUpQueue
{
  return self->_followUpQueue;
}

- (void)setFollowUpQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpQueue, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
}

@end