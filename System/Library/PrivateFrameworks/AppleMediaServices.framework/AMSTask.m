@interface AMSTask
+ (AMSThreadSafeSet)taskCache;
- (AMSMetricsActivity)activity;
- (AMSMutablePromise)promise;
- (AMSTask)init;
- (BOOL)cancel;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isRunning;
- (OS_dispatch_queue)performTaskQueue;
- (id)performBinaryTaskWithBlock:(id)a3;
- (id)performTaskWithBlock:(id)a3;
- (id)performTaskWithPromiseBlock:(id)a3;
- (int64_t)runMode;
- (os_unfair_lock_s)promiseAccessLock;
- (void)setActivity:(id)a3;
- (void)setPerformTaskQueue:(id)a3;
- (void)setPromise:(id)a3;
- (void)setPromiseAccessLock:(os_unfair_lock_s)a3;
- (void)setRunMode:(int64_t)a3;
@end

@implementation AMSTask

uint64_t __20__AMSTask_taskCache__block_invoke()
{
  qword_1EB38DFC8 = objc_alloc_init(AMSThreadSafeSet);
  return MEMORY[0x1F41817F8]();
}

- (id)performTaskWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__AMSTask_performTaskWithBlock___block_invoke;
  v8[3] = &unk_1E55A6FD0;
  id v9 = v4;
  id v5 = v4;
  v6 = [(AMSTask *)self performTaskWithPromiseBlock:v8];

  return v6;
}

- (id)performTaskWithPromiseBlock:(id)a3
{
  id v4 = a3;
  id v5 = AMSLogKey();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  os_unfair_lock_lock_with_options();
  v6 = [(AMSTask *)self promise];
  if (v6)
  {
    os_unfair_lock_unlock(&self->_promiseAccessLock);
  }
  else
  {
    v7 = objc_alloc_init(AMSMutablePromise);
    [(AMSTask *)self setPromise:v7];
    os_unfair_lock_unlock(&self->_promiseAccessLock);
    v8 = [(id)objc_opt_class() taskCache];
    [v8 addObject:self];

    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __39__AMSTask_performTaskWithPromiseBlock___block_invoke;
    v24 = &unk_1E55A7020;
    v29 = v30;
    id v25 = v5;
    v26 = self;
    v6 = v7;
    v27 = v6;
    id v28 = v4;
    id v9 = (void (**)(void))_Block_copy(&aBlock);
    if ([(AMSTask *)self runMode] == 1)
    {
      v9[2](v9);
    }
    else
    {
      id v10 = [NSString stringWithFormat:@"com.apple.AppleMediaServices.%@.performTask", objc_opt_class(), aBlock, v22, v23, v24, v25, v26, v27];
      v11 = (const char *)[v10 UTF8String];
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
      [(AMSTask *)self setPerformTaskQueue:v13];

      v14 = [(AMSTask *)self performTaskQueue];
      v15 = v9;
      v16 = v14;
      v17 = AMSLogKey();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __AMSDispatchAsync_block_invoke_7;
      block[3] = &unk_1E559EAE0;
      id v32 = v17;
      id v33 = v15;
      id v18 = v17;
      v19 = v15;
      dispatch_async(v16, block);
    }
  }
  _Block_object_dispose(v30, 8);

  return v6;
}

- (AMSMutablePromise)promise
{
  return self->_promise;
}

+ (AMSThreadSafeSet)taskCache
{
  if (_MergedGlobals_146 != -1) {
    dispatch_once(&_MergedGlobals_146, &__block_literal_global_127);
  }
  v2 = (void *)qword_1EB38DFC8;
  return (AMSThreadSafeSet *)v2;
}

- (void)setPromise:(id)a3
{
}

- (void)setPerformTaskQueue:(id)a3
{
}

- (int64_t)runMode
{
  return self->_runMode;
}

- (OS_dispatch_queue)performTaskQueue
{
  return self->_performTaskQueue;
}

- (AMSTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSTask;
  result = [(AMSTask *)&v3 init];
  if (result) {
    result->_promiseAccessLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_performTaskQueue, 0);
}

- (id)performBinaryTaskWithBlock:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__AMSTask_performBinaryTaskWithBlock___block_invoke;
  v9[3] = &unk_1E55A6FA8;
  id v10 = v4;
  id v5 = v4;
  v6 = [(AMSTask *)self performTaskWithBlock:v9];
  v7 = [v6 binaryPromiseAdapter];

  return v7;
}

void __39__AMSTask_performTaskWithPromiseBlock___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedActionConfig];
  v7 = (void *)v6;
  if (a2)
  {
    v8 = (void *)v6;
    if (!v6)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    BOOL v10 = os_signpost_enabled(v9);

    if (!v7) {
    if (v10)
    }
    {
      v11 = +[AMSLogConfig sharedActionConfig];
      v12 = v11;
      if (v11)
      {
        dispatch_queue_t v13 = [v11 OSLogObject];
      }
      else
      {
        v20 = +[AMSLogConfig sharedConfig];
        dispatch_queue_t v13 = [v20 OSLogObject];
      }
      os_signpost_id_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        LOWORD(v39) = 0;
        _os_signpost_emit_with_name_impl(&dword_18D554000, v13, OS_SIGNPOST_INTERVAL_END, v21, "Task", "Finished", (uint8_t *)&v39, 2u);
      }
    }
    uint64_t v22 = +[AMSLogConfig sharedActionConfig];
    if (!v22)
    {
      uint64_t v22 = +[AMSLogConfig sharedConfig];
    }
    v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = objc_opt_class();
      id v25 = AMSLogKey();
      int v39 = 138543618;
      uint64_t v40 = v24;
      __int16 v41 = 2114;
      v42 = v25;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] === Finished ===", (uint8_t *)&v39, 0x16u);
LABEL_40:
    }
  }
  else
  {
    v14 = (void *)v6;
    if (!v6)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    BOOL v16 = os_signpost_enabled(v15);

    if (!v7) {
    if (v16)
    }
    {
      v17 = +[AMSLogConfig sharedActionConfig];
      id v18 = v17;
      if (v17)
      {
        v19 = [v17 OSLogObject];
      }
      else
      {
        v26 = +[AMSLogConfig sharedConfig];
        v19 = [v26 OSLogObject];
      }
      os_signpost_id_t v27 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        id v28 = AMSHashIfNeeded(v5);
        int v39 = 138543362;
        uint64_t v40 = (uint64_t)v28;
        _os_signpost_emit_with_name_impl(&dword_18D554000, v19, OS_SIGNPOST_EVENT, v27, "Error occurred", "%{public}@", (uint8_t *)&v39, 0xCu);
      }
      v29 = +[AMSLogConfig sharedActionConfig];
      v30 = v29;
      if (v29)
      {
        v31 = [v29 OSLogObject];
      }
      else
      {
        id v32 = +[AMSLogConfig sharedConfig];
        v31 = [v32 OSLogObject];
      }
      os_signpost_id_t v33 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        LOWORD(v39) = 0;
        _os_signpost_emit_with_name_impl(&dword_18D554000, v31, OS_SIGNPOST_INTERVAL_END, v33, "Task", "Failed", (uint8_t *)&v39, 2u);
      }
    }
    uint64_t v22 = +[AMSLogConfig sharedActionConfig];
    if (!v22)
    {
      uint64_t v22 = +[AMSLogConfig sharedConfig];
    }
    v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = objc_opt_class();
      id v25 = AMSLogKey();
      v35 = AMSHashIfNeeded(v5);
      int v39 = 138543874;
      uint64_t v40 = v34;
      __int16 v41 = 2114;
      v42 = v25;
      __int16 v43 = 2114;
      v44 = v35;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] === Failed === -> error = %{public}@", (uint8_t *)&v39, 0x20u);

      goto LABEL_40;
    }
  }

  v36 = [(id)objc_opt_class() taskCache];
  v37 = *(void **)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [v37 finishWithPromise:WeakRetained];

  [v36 removeObject:*(void *)(a1 + 32)];
  [*(id *)(a1 + 48) invalidate];
}

void __39__AMSTask_performTaskWithPromiseBlock___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = AMSSetLogKey(*(void **)(a1 + 32));
  objc_super v3 = +[AMSLogConfig sharedActionConfig];
  id v4 = v3;
  if (!v3)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  BOOL v6 = os_signpost_enabled(v5);

  if (!v3) {
  if (v6)
  }
  {
    v7 = +[AMSLogConfig sharedActionConfig];
    v8 = v7;
    if (!v7)
    {
      v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 40));

    if (!v7) {
    BOOL v10 = +[AMSLogConfig sharedActionConfig];
    }
    v11 = v10;
    if (v10)
    {
      v12 = [v10 OSLogObject];
    }
    else
    {
      dispatch_queue_t v13 = +[AMSLogConfig sharedConfig];
      v12 = [v13 OSLogObject];
    }
    os_signpost_id_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = objc_opt_class();
      _os_signpost_emit_with_name_impl(&dword_18D554000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Task", "%{public}@", buf, 0xCu);
    }
  }
  v15 = [*(id *)(a1 + 40) activity];
  [v15 activate];

  BOOL v16 = [*(id *)(a1 + 40) activity];
  [v16 completeAfter:*(void *)(a1 + 48)];

  v17 = +[AMSLogConfig sharedActionConfig];
  if (!v17)
  {
    v17 = +[AMSLogConfig sharedConfig];
  }
  id v18 = [v17 OSLogObject];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = objc_opt_class();
    v20 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v19;
    __int16 v33 = 2114;
    uint64_t v34 = v20;
    _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] === Starting ===", buf, 0x16u);
  }
  os_signpost_id_t v21 = [NSString stringWithFormat:@"com.apple.AppleMediaServices.%@", objc_opt_class()];
  uint64_t v22 = +[AMSKeepAlive keepAliveWithName:v21 style:3];
  v23 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  objc_initWeak((id *)buf, v23);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __39__AMSTask_performTaskWithPromiseBlock___block_invoke_10;
  v26[3] = &unk_1E55A6FF8;
  uint64_t v24 = *(void *)(a1 + 40);
  uint64_t v29 = *(void *)(a1 + 64);
  v26[4] = v24;
  id v27 = *(id *)(a1 + 48);
  objc_copyWeak(&v30, (id *)buf);
  id v25 = v22;
  id v28 = v25;
  [v23 addFinishBlock:v26];

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

- (AMSMetricsActivity)activity
{
  return self->_activity;
}

id __32__AMSTask_performTaskWithBlock___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = 0;
  if (v1) {
    +[AMSPromise promiseWithResult:v1];
  }
  else {
  objc_super v3 = +[AMSPromise promiseWithError:v2];
  }

  return v3;
}

id __38__AMSTask_performBinaryTaskWithBlock___block_invoke(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    v1 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

- (BOOL)isFinished
{
  p_promiseAccessLock = &self->_promiseAccessLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(AMSTask *)self promise];
  char v5 = [v4 isFinished];

  os_unfair_lock_unlock(p_promiseAccessLock);
  return v5;
}

- (BOOL)isRunning
{
  p_promiseAccessLock = &self->_promiseAccessLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(AMSTask *)self promise];
  if (v4)
  {
    char v5 = [(AMSTask *)self promise];
    int v6 = [v5 isFinished] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  os_unfair_lock_unlock(p_promiseAccessLock);
  return v6;
}

- (BOOL)isCancelled
{
  p_promiseAccessLock = &self->_promiseAccessLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(AMSTask *)self promise];
  char v5 = [v4 isCancelled];

  os_unfair_lock_unlock(p_promiseAccessLock);
  return v5;
}

- (BOOL)cancel
{
  p_promiseAccessLock = &self->_promiseAccessLock;
  os_unfair_lock_lock(&self->_promiseAccessLock);
  id v4 = +[AMSLogConfig sharedActionConfig];
  char v5 = v4;
  if (!v4)
  {
    char v5 = +[AMSLogConfig sharedConfig];
  }
  int v6 = [v5 OSLogObject];
  BOOL v7 = os_signpost_enabled(v6);

  if (!v4) {
  if (v7)
  }
  {
    v8 = +[AMSLogConfig sharedActionConfig];
    id v9 = v8;
    if (!v8)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    BOOL v10 = [v9 OSLogObject];
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

    if (!v8) {
    v12 = +[AMSLogConfig sharedActionConfig];
    }
    dispatch_queue_t v13 = v12;
    if (v12)
    {
      os_signpost_id_t v14 = [v12 OSLogObject];
    }
    else
    {
      v15 = +[AMSLogConfig sharedConfig];
      os_signpost_id_t v14 = [v15 OSLogObject];
    }
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_18D554000, v14, OS_SIGNPOST_EVENT, v11, "Task Cancel", "Cancelling task", v19, 2u);
    }
  }
  BOOL v16 = [(AMSTask *)self promise];
  char v17 = [v16 cancel];

  os_unfair_lock_unlock(p_promiseAccessLock);
  return v17;
}

- (void)setRunMode:(int64_t)a3
{
  self->_runMode = a3;
}

- (os_unfair_lock_s)promiseAccessLock
{
  return self->_promiseAccessLock;
}

- (void)setPromiseAccessLock:(os_unfair_lock_s)a3
{
  self->_promiseAccessLock = a3;
}

- (void)setActivity:(id)a3
{
}

@end