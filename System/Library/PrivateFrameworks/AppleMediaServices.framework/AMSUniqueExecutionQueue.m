@interface AMSUniqueExecutionQueue
- (AMSMutablePromise)executionPromise;
- (AMSUniqueExecutionQueue)initWithBlock:(id)a3;
- (OS_dispatch_queue)completionCallbacksQueue;
- (OS_dispatch_queue)executeBlockQueue;
- (OS_dispatch_queue)executionPromiseAccessQueue;
- (id)_createExecutionPromise;
- (id)block;
- (void)_beginExecutingBlockWithPromise:(id)a3;
- (void)addCompletionBlock:(id)a3;
- (void)addCompletionBlockForSubsequentExecution:(id)a3;
- (void)setBlock:(id)a3;
- (void)setCompletionCallbacksQueue:(id)a3;
- (void)setExecuteBlockQueue:(id)a3;
- (void)setExecutionPromise:(id)a3;
@end

@implementation AMSUniqueExecutionQueue

- (AMSUniqueExecutionQueue)initWithBlock:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSUniqueExecutionQueue;
  v5 = [(AMSUniqueExecutionQueue *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.AppleMediaServices.AMSUniqueExecutionQueue.completionCallbacks", v8);
    completionCallbacksQueue = v5->_completionCallbacksQueue;
    v5->_completionCallbacksQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AppleMediaServices.AMSUniqueExecutionQueue.executeBlock", v11);
    executeBlockQueue = v5->_executeBlockQueue;
    v5->_executeBlockQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.AppleMediaServices.AMSUniqueExecutionQueue.executionPromise", v14);
    executionPromiseAccessQueue = v5->_executionPromiseAccessQueue;
    v5->_executionPromiseAccessQueue = (OS_dispatch_queue *)v15;
  }
  return v5;
}

- (void)addCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = AMSLogKey();
  objc_initWeak(&location, self);
  uint64_t v6 = [(AMSUniqueExecutionQueue *)self executionPromiseAccessQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke;
  v13[3] = &unk_1E55A7378;
  objc_copyWeak(&v16, &location);
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  id v15 = v8;
  dispatch_queue_t v9 = v13;
  v10 = v6;
  v11 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_8;
  block[3] = &unk_1E559EAE0;
  id v19 = v11;
  id v20 = v9;
  id v12 = v11;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke(id *a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained executionPromise];
    uint64_t v6 = +[AMSLogConfig sharedConfig];
    id v7 = (void *)v6;
    if (v5)
    {
      if (!v6)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = objc_loadWeakRetained(v2);
        uint64_t v10 = objc_opt_class();
        id v11 = a1[4];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2048;
        v32 = v5;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlock: - Block is already running. tag = %p", buf, 0x20u);
      }
    }
    else
    {
      if (!v6)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      v17 = [v7 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        id v18 = objc_loadWeakRetained(v2);
        uint64_t v19 = objc_opt_class();
        id v20 = a1[4];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v20;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlock: - Block isn't running.", buf, 0x16u);
      }
      v5 = [v4 _createExecutionPromise];
      [v4 _beginExecutingBlockWithPromise:v5];
    }
    v21 = [v4 completionCallbacksQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke_3;
    v26[3] = &unk_1E55A7350;
    id v16 = v5;
    id v27 = v16;
    objc_copyWeak(&v30, v2);
    id v28 = a1[4];
    id v29 = a1[5];
    v22 = v26;
    v23 = v21;
    v24 = AMSLogKey();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_8;
    v32 = &unk_1E559EAE0;
    id v33 = v24;
    id v34 = v22;
    id v25 = v24;
    dispatch_async(v23, buf);

    objc_destroyWeak(&v30);
  }
  else
  {
    id v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = a1[4];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v14;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "AMSUniqueExecutionQueue: [%{public}@] Someone is using AMSUniqueExecutionQueue without holding onto the object while it executes.", buf, 0xCu);
    }

    id v15 = (void (**)(id, void, id))a1[5];
    AMSError(0, 0, 0, 0);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v16);
  }
}

void __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E55A7328;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 addFinishBlock:v3];

  objc_destroyWeak(&v6);
}

void __46__AMSUniqueExecutionQueue_addCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = AMSHashIfNeeded(v5);
    v13 = AMSHashIfNeeded(v6);
    int v14 = 138544130;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlock: - Finished. result = %{public}@ | error = %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addCompletionBlockForSubsequentExecution:(id)a3
{
  id v4 = a3;
  id v5 = AMSLogKey();
  objc_initWeak(&location, self);
  id v6 = [(AMSUniqueExecutionQueue *)self executionPromiseAccessQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke;
  v13[3] = &unk_1E55A7378;
  objc_copyWeak(&v16, &location);
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  id v15 = v8;
  id v9 = v13;
  uint64_t v10 = v6;
  uint64_t v11 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_8;
  block[3] = &unk_1E559EAE0;
  id v19 = v11;
  id v20 = v9;
  id v12 = v11;
  dispatch_async(v10, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke(id *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained executionPromise];
    uint64_t v6 = +[AMSLogConfig sharedConfig];
    id v7 = (void *)v6;
    if (v5)
    {
      if (!v6)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v9 = objc_loadWeakRetained(v2);
        uint64_t v10 = objc_opt_class();
        id v11 = a1[4];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlockForSubsequentExecution: - Block is already running.", buf, 0x16u);
      }
      id v12 = [v4 completionCallbacksQueue];
      v13 = (id *)v33;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_7;
      v33[3] = &unk_1E55A7350;
      id v14 = v5;
      v33[4] = v14;
      id v15 = &v34;
      objc_copyWeak(&v34, v2);
      v33[5] = a1[4];
      v33[6] = a1[5];
      id v16 = v33;
      uint64_t v17 = v12;
      __int16 v18 = AMSLogKey();
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_8;
      v38 = &unk_1E559EAE0;
      id v39 = v18;
      id v40 = v16;
      id v19 = v18;
      dispatch_async(v17, buf);
    }
    else
    {
      if (!v6)
      {
        id v7 = +[AMSLogConfig sharedConfig];
      }
      v24 = [v7 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        id v25 = objc_loadWeakRetained(v2);
        uint64_t v26 = objc_opt_class();
        id v27 = a1[4];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v27;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlockForSubsequentExecution: - Block isn't running.", buf, 0x16u);
      }
      id v28 = [v4 _createExecutionPromise];
      [v4 _beginExecutingBlockWithPromise:v28];
      id v29 = [v4 completionCallbacksQueue];
      v13 = (id *)v35;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_6;
      v35[3] = &unk_1E55A7350;
      id v14 = v28;
      v35[4] = v14;
      id v15 = &v36;
      objc_copyWeak(&v36, v2);
      v35[5] = a1[4];
      v35[6] = a1[5];
      id v30 = v35;
      uint64_t v17 = v29;
      v31 = AMSLogKey();
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __AMSDispatchAsync_block_invoke_8;
      v38 = &unk_1E559EAE0;
      id v39 = v31;
      id v40 = v30;
      id v32 = v31;
      dispatch_async(v17, buf);
    }
    objc_destroyWeak(v15);
  }
  else
  {
    id v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      id v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = a1[4];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v22;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "AMSUniqueExecutionQueue: [%{public}@] Someone is using AMSUniqueExecutionQueue without holding onto the object while it executes.", buf, 0xCu);
    }

    v23 = (void (**)(id, void, id))a1[5];
    AMSError(0, 0, 0, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v23[2](v23, 0, v14);
  }
}

void __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_6(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_2;
  v3[3] = &unk_1E55A7328;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 addFinishBlock:v3];

  objc_destroyWeak(&v6);
}

void __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = AMSHashIfNeeded(v5);
    v13 = AMSHashIfNeeded(v6);
    int v14 = 138544130;
    uint64_t v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    __int16 v18 = 2114;
    id v19 = v12;
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] addCompletionBlockForSubsequentExecution: - Finished. result = %{public}@ | error = %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_7(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_2_8;
  v3[3] = &unk_1E55A7328;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 addFinishBlock:v3];

  objc_destroyWeak(&v6);
}

void __68__AMSUniqueExecutionQueue_addCompletionBlockForSubsequentExecution___block_invoke_2_8(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = AMSSetLogKey(*(void **)(a1 + 32));
  id v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = objc_loadWeakRetained(v2);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Previous execution finished. Queuing a new execution.", (uint8_t *)&v10, 0x16u);
  }
  [WeakRetained addCompletionBlock:*(void *)(a1 + 40)];
}

- (void)_beginExecutingBlockWithPromise:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUniqueExecutionQueue *)self executeBlockQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = AMSLogKey();
  objc_initWeak(&location, self);
  id v7 = [(AMSUniqueExecutionQueue *)self executeBlockQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__AMSUniqueExecutionQueue__beginExecutingBlockWithPromise___block_invoke;
  v14[3] = &unk_1E55A1108;
  objc_copyWeak(&v17, &location);
  id v8 = v6;
  id v15 = v8;
  id v9 = v4;
  id v16 = v9;
  int v10 = v14;
  uint64_t v11 = v7;
  __int16 v12 = AMSLogKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_8;
  block[3] = &unk_1E559EAE0;
  id v20 = v12;
  id v21 = v10;
  id v13 = v12;
  dispatch_async(v11, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __59__AMSUniqueExecutionQueue__beginExecutingBlockWithPromise___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = +[AMSLogConfig sharedConfig];
  id v4 = (void *)v3;
  if (WeakRetained)
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v6;
      __int16 v24 = 2114;
      uint64_t v25 = v7;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Executing block.", buf, 0x16u);
    }

    id v8 = [WeakRetained block];
    id v21 = 0;
    uint64_t v9 = ((void (**)(void, id *))v8)[2](v8, &v21);
    uint64_t v10 = (uint64_t)v21;

    if (!(v9 | v10))
    {
      uint64_t v10 = AMSError(0, 0, 0, 0);
    }
    uint64_t v11 = [WeakRetained completionCallbacksQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__AMSUniqueExecutionQueue__beginExecutingBlockWithPromise___block_invoke_9;
    v17[3] = &unk_1E55A22D0;
    id v18 = *(id *)(a1 + 40);
    id v19 = (id)v9;
    id v20 = (id)v10;
    id v12 = (id)v10;
    id v13 = (id)v9;
    dispatch_async(v11, v17);
  }
  else
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v14 = [v4 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v15;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "AMSUniqueExecutionQueue: [%{public}@] Someone is using AMSUniqueExecutionQueue without holding onto the object while it executes.", buf, 0xCu);
    }

    id v16 = *(void **)(a1 + 40);
    AMSError(0, 0, 0, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v16 finishWithError:v12];
  }
}

uint64_t __59__AMSUniqueExecutionQueue__beginExecutingBlockWithPromise___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (id)_createExecutionPromise
{
  uint64_t v3 = [(AMSUniqueExecutionQueue *)self executionPromiseAccessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(AMSMutablePromise);
  [(AMSUniqueExecutionQueue *)self setExecutionPromise:v4];

  objc_initWeak(&location, self);
  id v5 = [(AMSUniqueExecutionQueue *)self executionPromise];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __50__AMSUniqueExecutionQueue__createExecutionPromise__block_invoke;
  uint64_t v11 = &unk_1E55A3F68;
  objc_copyWeak(&v12, &location);
  [v5 addFinishBlock:&v8];

  uint64_t v6 = [(AMSUniqueExecutionQueue *)self executionPromise];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

void __50__AMSUniqueExecutionQueue__createExecutionPromise__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = [WeakRetained executionPromiseAccessQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__AMSUniqueExecutionQueue__createExecutionPromise__block_invoke_11;
    v17[3] = &unk_1E559F890;
    objc_copyWeak(&v18, v7);
    uint64_t v11 = v17;
    id v12 = v10;
    id v13 = AMSLogKey();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __AMSDispatchAsync_block_invoke_8;
    block[3] = &unk_1E559EAE0;
    id v20 = v13;
    id v21 = v11;
    id v14 = v13;
    dispatch_async(v12, block);

    objc_destroyWeak(&v18);
  }
  else
  {
    uint64_t v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      uint64_t v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block[0]) = 0;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "AMSUniqueExecutionQueue: Someone is using AMSUniqueExecutionQueue without holding onto the object while it executes.", (uint8_t *)block, 2u);
    }
  }
}

void __50__AMSUniqueExecutionQueue__createExecutionPromise__block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExecutionPromise:0];
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (OS_dispatch_queue)completionCallbacksQueue
{
  return self->_completionCallbacksQueue;
}

- (void)setCompletionCallbacksQueue:(id)a3
{
}

- (OS_dispatch_queue)executeBlockQueue
{
  return self->_executeBlockQueue;
}

- (void)setExecuteBlockQueue:(id)a3
{
}

- (AMSMutablePromise)executionPromise
{
  return self->_executionPromise;
}

- (void)setExecutionPromise:(id)a3
{
}

- (OS_dispatch_queue)executionPromiseAccessQueue
{
  return self->_executionPromiseAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionPromiseAccessQueue, 0);
  objc_storeStrong((id *)&self->_executionPromise, 0);
  objc_storeStrong((id *)&self->_executeBlockQueue, 0);
  objc_storeStrong((id *)&self->_completionCallbacksQueue, 0);
  objc_storeStrong(&self->_block, 0);
}

@end