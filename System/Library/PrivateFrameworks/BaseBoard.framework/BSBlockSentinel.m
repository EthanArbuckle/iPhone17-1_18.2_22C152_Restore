@interface BSBlockSentinel
+ (id)sentinelWithCompletion:(id)a3;
+ (id)sentinelWithExceptionReason:(id)a3;
+ (id)sentinelWithQueue:(id)a3 completion:(id)a4;
+ (id)sentinelWithQueue:(id)a3 signalCount:(unint64_t)a4 completion:(id)a5;
+ (id)sentinelWithQueue:(id)a3 signalCount:(unint64_t)a4 signalHandler:(id)a5;
+ (id)sentinelWithQueue:(id)a3 signalHandler:(id)a4;
+ (id)sentinelWithSignalCount:(unint64_t)a3 exceptionReason:(id)a4;
+ (id)sentinelWithSignalCount:(unint64_t)a3 signalHandler:(id)a4;
+ (id)sentinelWithSignalHandler:(id)a3;
- (BOOL)signal;
- (BOOL)signalWithContext:(id)a3;
- (void)dealloc;
- (void)initWithCount:(void *)a3 queue:(void *)a4 block:;
- (void)setIdentifier:(id)a3;
@end

@implementation BSBlockSentinel

- (BOOL)signal
{
  return [(BSBlockSentinel *)self signalWithContext:0];
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void (**)(void, void))MEMORY[0x18C125630](self->_lock_handler);
  unint64_t lock_signalCount = self->_lock_signalCount;
  unint64_t lock_expectedSignals = self->_lock_expectedSignals;
  if (lock_expectedSignals)
  {
    if (lock_signalCount < lock_expectedSignals)
    {
LABEL_3:
      v7 = BSLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        lock_identifier = self->_lock_identifier;
        LODWORD(block) = 138543362;
        *(void *)((char *)&block + 4) = lock_identifier;
        _os_log_error_impl(&dword_18AAA8000, v7, OS_LOG_TYPE_ERROR, "[BSBlockSentinel:%{public}@] failed!", (uint8_t *)&block, 0xCu);
      }

      os_unfair_lock_unlock(p_lock);
      explicitQueue = self->_explicitQueue;
      id v9 = v4;
      v10 = explicitQueue;
      v11 = v10;
      if (v9)
      {
        if (!v10
          || v10 == (OS_dispatch_queue *)MEMORY[0x1E4F14428]
          && [MEMORY[0x1E4F29060] isMainThread])
        {
          v12 = +[BSBlockSentinelSignalContext failureContext]();
          (*((void (**)(id, void *))v9 + 2))(v9, v12);
        }
        else
        {
          *(void *)&long long block = MEMORY[0x1E4F143A8];
          *((void *)&block + 1) = 3221225472;
          v20 = __BSBlockSentinelFireFailureHandler_block_invoke;
          v21 = &unk_1E5446450;
          id v22 = v9;
          dispatch_async(v11, &block);
          v12 = v22;
        }
      }
      goto LABEL_20;
    }
  }
  else if (!lock_signalCount)
  {
    goto LABEL_3;
  }
  v13 = BSLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v16 = self->_lock_identifier;
    LODWORD(block) = 138412290;
    *(void *)((char *)&block + 4) = v16;
    _os_log_debug_impl(&dword_18AAA8000, v13, OS_LOG_TYPE_DEBUG, "[BSBlockSentinel:%@] dealloc", (uint8_t *)&block, 0xCu);
  }

  os_unfair_lock_unlock(p_lock);
  if (!lock_expectedSignals)
  {
    v14 = objc_alloc_init(BSBlockSentinelSignalContext);
    v15 = v14;
    if (v14) {
      v14->_complete = 1;
    }
    ((void (**)(void, BSBlockSentinelSignalContext *))v4)[2](v4, v14);
  }
LABEL_20:

  v18.receiver = self;
  v18.super_class = (Class)BSBlockSentinel;
  [(BSBlockSentinel *)&v18 dealloc];
}

- (BOOL)signalWithContext:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  explicitQueue = self->_explicitQueue;
  if (explicitQueue) {
    BSDispatchQueueAssert(explicitQueue);
  }
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_expectedSignals = self->_lock_expectedSignals;
  unint64_t v8 = self->_lock_signalCount + 1;
  self->_unint64_t lock_signalCount = v8;
  id v9 = BSLogCommon();
  v10 = v9;
  if (lock_expectedSignals && v8 > lock_expectedSignals)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v23 = self->_lock_expectedSignals;
      lock_identifier = self->_lock_identifier;
      unint64_t lock_signalCount = self->_lock_signalCount;
      int v29 = 138543874;
      v30 = lock_identifier;
      __int16 v31 = 2048;
      unint64_t v32 = lock_signalCount;
      __int16 v33 = 2048;
      unint64_t v34 = v23;
      _os_log_error_impl(&dword_18AAA8000, v10, OS_LOG_TYPE_ERROR, "[BSBlockSentinel:%{public}@] unexpected signal! %lu of %lu", (uint8_t *)&v29, 0x20u);
    }

    os_unfair_lock_unlock(&self->_lock);
    BOOL v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v26 = self->_lock_expectedSignals;
      v25 = self->_lock_identifier;
      unint64_t v27 = self->_lock_signalCount;
      int v29 = 138412802;
      v30 = v25;
      __int16 v31 = 2048;
      unint64_t v32 = v27;
      __int16 v33 = 2048;
      unint64_t v34 = v26;
      _os_log_debug_impl(&dword_18AAA8000, v10, OS_LOG_TYPE_DEBUG, "[BSBlockSentinel:%@] signaled! %lu of %lu", (uint8_t *)&v29, 0x20u);
    }

    unint64_t v13 = self->_lock_signalCount;
    unint64_t v12 = self->_lock_expectedSignals;
    BOOL v11 = v13 == v12;
    v14 = (void (**)(void, void))MEMORY[0x18C125630](self->_lock_handler);
    BOOL v15 = v13 != v12;
    if (v5) {
      BOOL v15 = 0;
    }
    if (v15)
    {
      v19 = 0;
    }
    else
    {
      v16 = objc_alloc_init(BSBlockSentinelSignalContext);
      v17 = v16;
      if (v16)
      {
        v16->_complete = v13 == v12;
        id v18 = v5;
        objc_storeStrong(&v17->_context, a3);
      }
      else
      {
        id v28 = v5;
      }

      v19 = v17;
    }
    if (v13 == v12)
    {
      id lock_handler = self->_lock_handler;
      self->_id lock_handler = 0;
    }
    os_unfair_lock_unlock(&self->_lock);
    if (v14) {
      ((void (**)(void, BSBlockSentinelSignalContext *))v14)[2](v14, v19);
    }
  }
  return v11;
}

+ (id)sentinelWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = -[BSBlockSentinel initWithCount:queue:block:]((void **)[BSBlockSentinel alloc], (void *)1, 0, v3);

  return v4;
}

+ (id)sentinelWithSignalCount:(unint64_t)a3 signalHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!a3)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"count > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      unint64_t v12 = (objc_class *)objc_opt_class();
      unint64_t v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      id v15 = v11;
      __int16 v16 = 2114;
      v17 = v13;
      __int16 v18 = 2048;
      id v19 = a1;
      __int16 v20 = 2114;
      v21 = @"BSBlockSentinel.m";
      __int16 v22 = 1024;
      int v23 = 129;
      __int16 v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v10 UTF8String];
    __break(0);
    JUMPOUT(0x18AAC8E1CLL);
  }
  unint64_t v8 = -[BSBlockSentinel initWithCount:queue:block:]((void **)[BSBlockSentinel alloc], (void *)a3, 0, v7);

  return v8;
}

- (void)initWithCount:(void *)a3 queue:(void *)a4 block:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (a1)
  {
    if (!v9)
    {
      int v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_initWithCount_queue_block_);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        uint64_t v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 138544642;
        id v29 = v24;
        __int16 v30 = 2114;
        __int16 v31 = v26;
        __int16 v32 = 2048;
        __int16 v33 = a1;
        __int16 v34 = 2114;
        uint64_t v35 = @"BSBlockSentinel.m";
        __int16 v36 = 1024;
        int v37 = 138;
        __int16 v38 = 2114;
        v39 = v23;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v23 UTF8String];
      __break(0);
      JUMPOUT(0x18AAC90D0);
    }
    v27.receiver = a1;
    v27.super_class = (Class)BSBlockSentinel;
    id v11 = (void **)objc_msgSendSuper2(&v27, sel_init);
    a1 = v11;
    if (v11)
    {
      *((_DWORD *)v11 + 2) = 0;
      objc_storeStrong(v11 + 6, a3);
      uint64_t v12 = [v10 copy];
      unint64_t v13 = a1[2];
      a1[2] = (void *)v12;

      a1[3] = 0;
      a1[4] = a2;
      v14 = BSStackFrameInfoForAddresss(*(const void **)(vars0 + 8));
      id v15 = [v14 className];
      __int16 v16 = v15;
      if (v15)
      {
        id v17 = v15;
      }
      else
      {
        id v17 = [v14 executableName];
      }
      id v19 = a1 + 5;
      __int16 v18 = a1[5];
      a1[5] = v17;

      if (!a1[5])
      {
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a1);
        v21 = *v19;
        BSBlockSentinelSignalContext *v19 = (void *)v20;
      }
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitQueue, 0);
  objc_storeStrong((id *)&self->_lock_identifier, 0);
  objc_storeStrong(&self->_lock_handler, 0);
}

+ (id)sentinelWithQueue:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [BSBlockSentinel alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__BSBlockSentinel_sentinelWithQueue_completion___block_invoke;
  v11[3] = &unk_1E5446400;
  id v8 = v6;
  id v12 = v8;
  id v9 = -[BSBlockSentinel initWithCount:queue:block:]((void **)&v7->super.isa, (void *)1, v5, v11);

  return v9;
}

void __48__BSBlockSentinel_sentinelWithQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isComplete]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)sentinelWithQueue:(id)a3 signalCount:(unint64_t)a4 completion:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!a4)
  {
    id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"count > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = (objc_class *)objc_opt_class();
      __int16 v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138544642;
      id v22 = v16;
      __int16 v23 = 2114;
      id v24 = v18;
      __int16 v25 = 2048;
      id v26 = a1;
      __int16 v27 = 2114;
      id v28 = @"BSBlockSentinel.m";
      __int16 v29 = 1024;
      int v30 = 88;
      __int16 v31 = 2114;
      __int16 v32 = v15;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v15 UTF8String];
    __break(0);
    JUMPOUT(0x18AB2A478);
  }
  id v11 = [BSBlockSentinel alloc];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__BSBlockSentinel_sentinelWithQueue_signalCount_completion___block_invoke;
  v19[3] = &unk_1E5446400;
  id v12 = v10;
  id v20 = v12;
  unint64_t v13 = -[BSBlockSentinel initWithCount:queue:block:]((void **)&v11->super.isa, (void *)a4, v9, v19);

  return v13;
}

void __60__BSBlockSentinel_sentinelWithQueue_signalCount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isComplete])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
}

+ (id)sentinelWithQueue:(id)a3 signalHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = -[BSBlockSentinel initWithCount:queue:block:]((void **)[BSBlockSentinel alloc], (void *)1, v5, v6);

  return v7;
}

+ (id)sentinelWithQueue:(id)a3 signalCount:(unint64_t)a4 signalHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!a4)
  {
    unint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"count > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138544642;
      id v18 = v14;
      __int16 v19 = 2114;
      id v20 = v16;
      __int16 v21 = 2048;
      id v22 = a1;
      __int16 v23 = 2114;
      id v24 = @"BSBlockSentinel.m";
      __int16 v25 = 1024;
      int v26 = 103;
      __int16 v27 = 2114;
      id v28 = v13;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v13 UTF8String];
    __break(0);
    JUMPOUT(0x18AB2A788);
  }
  id v11 = -[BSBlockSentinel initWithCount:queue:block:]((void **)[BSBlockSentinel alloc], (void *)a4, v9, v10);

  return v11;
}

+ (id)sentinelWithExceptionReason:(id)a3
{
  uint64_t v3 = [a1 sentinelWithSignalCount:1 exceptionReason:a3];
  return v3;
}

+ (id)sentinelWithSignalCount:(unint64_t)a3 exceptionReason:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!a3)
  {
    id v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"count > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544642;
      id v19 = v13;
      __int16 v20 = 2114;
      __int16 v21 = v15;
      __int16 v22 = 2048;
      id v23 = a1;
      __int16 v24 = 2114;
      __int16 v25 = @"BSBlockSentinel.m";
      __int16 v26 = 1024;
      int v27 = 112;
      __int16 v28 = 2114;
      uint64_t v29 = v12;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v12 UTF8String];
    __break(0);
    JUMPOUT(0x18AB2AA0CLL);
  }
  id v8 = (void **)objc_alloc((Class)a1);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__BSBlockSentinel_sentinelWithSignalCount_exceptionReason___block_invoke;
  v16[3] = &unk_1E5446428;
  id v9 = v7;
  id v17 = v9;
  id v10 = -[BSBlockSentinel initWithCount:queue:block:](v8, (void *)a3, 0, v16);

  return v10;
}

void __59__BSBlockSentinel_sentinelWithSignalCount_exceptionReason___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isFailed])
  {
    uint64_t v3 = (__CFString *)*(id *)(a1 + 32);
    if (v3) {
      id v4 = v3;
    }
    else {
      id v4 = @"sentinel deallocated without being signaled";
    }
    id v5 = v4;
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@", v4 format];
  }
}

+ (id)sentinelWithSignalHandler:(id)a3
{
  id v3 = a3;
  id v4 = -[BSBlockSentinel initWithCount:queue:block:]((void **)[BSBlockSentinel alloc], 0, 0, v3);

  return v4;
}

- (void)setIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (NSString *)[v6 copy];
  lock_identifier = self->_lock_identifier;
  self->_lock_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

@end