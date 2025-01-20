@interface SGFuture
+ (id)createAfter:(id)a3 onCreate:(id)a4;
+ (id)createWithImmediateError:(id)a3;
+ (id)createWithImmediateResult:(id)a3;
+ (id)createWithImmediateResult:(id)a3 error:(id)a4;
+ (id)futureForObject:(id)a3 withKey:(void *)a4 onCreate:(id)a5;
+ (void)waitForFuturesToComplete:(id)a3 withCallback:(id)a4;
- (BOOL)_finishWithResult:(id)a3 orError:(id)a4;
- (BOOL)completeWithResult:(id)a3 error:(id)a4;
- (BOOL)fail:(id)a3;
- (BOOL)isComplete;
- (BOOL)succeed:(id)a3;
- (OS_dispatch_queue)workQueue;
- (SGFuture)init;
- (id)completer;
- (id)error;
- (id)result;
- (id)wait;
- (id)waitWithTimeout:(double)a3;
- (void)_clearTimeoutNonThreadSafe;
- (void)_wait:(id)a3 forSyncAPI:(BOOL)a4;
- (void)clearTimeout;
- (void)dealloc;
- (void)disassociateFromParentObject;
- (void)setTargetQueue:(id)a3 useAfterCompletion:(BOOL)a4;
- (void)setTimeout:(double)a3;
- (void)wait:(id)a3;
@end

@implementation SGFuture

id __38__SGFuture__finishWithResult_orError___block_invoke()
{
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_parentObject);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

+ (void)waitForFuturesToComplete:(id)a3 withCallback:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(void))a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  v13 = v5;
  uint64_t v24 = [v5 count];
  if (atomic_load((unint64_t *)v22 + 3))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __50__SGFuture_waitForFuturesToComplete_withCallback___block_invoke;
          v14[3] = &unk_1E5B8E2F0;
          v16 = &v21;
          v15 = v6;
          [v12 wait:v14];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v6[2](v6);
  }
  _Block_object_dispose(&v21, 8);
}

void __29__SGFuture__wait_forSyncAPI___block_invoke_2(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 24));
  v2 = (void *)*((void *)WeakRetained + 1);
  id v3 = *((id *)WeakRetained + 2);
  id v4 = v2;
  pthread_mutex_unlock((pthread_mutex_t *)(WeakRetained + 24));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__SGFuture_futureForObject_withKey_onCreate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained == v5)
  {
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_fault_impl(&dword_1A4D8C000, v8, OS_LOG_TYPE_FAULT, "+[SGFuture futureForObject:withKey:onCreate:] future result is pointer-equivalent to object, which creates a circular reference", v9, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }
}

- (void)_wait:(id)a3 forSyncAPI:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, NSObject *, NSError *))a3;
  uint64_t v7 = pthread_mutex_lock(&self->_lock);
  if (self->_isComplete)
  {
    id v8 = (void *)MEMORY[0x1A6265250](v7);
    uint64_t v9 = self->_result;
    uint64_t v10 = self->_error;
    pthread_mutex_unlock(&self->_lock);
    if (!self->_alwaysUseCallbacksQueue || v4)
    {
      v6[2](v6, v9, v10);
    }
    else
    {
      callbacks = self->_callbacks;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__SGFuture__wait_forSyncAPI___block_invoke;
      block[3] = &unk_1E5B8E2C8;
      uint64_t v23 = v6;
      uint64_t v21 = v9;
      v22 = v10;
      dispatch_async(callbacks, block);
    }
  }
  else
  {
    self->_yoDontLeaveMeHangingBro = 1;
    id location = 0;
    objc_initWeak(&location, self);
    v12 = self->_callbacks;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __29__SGFuture__wait_forSyncAPI___block_invoke_2;
    v16[3] = &unk_1E5B8E230;
    objc_copyWeak(&v18, &location);
    long long v17 = v6;
    dispatch_async(v12, v16);
    pthread_mutex_unlock(&self->_lock);
    workQueue = self->_workQueue;
    qos_class_t v14 = qos_class_self();
    dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v14, 0, &__block_literal_global_21);
    dispatch_async(workQueue, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)wait:(id)a3
{
}

+ (id)futureForObject:(id)a3 withKey:(void *)a4 onCreate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  objc_sync_enter(v9);
  objc_getAssociatedObject(v9, a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_sync_exit(v9);
  }
  else
  {
    uint64_t v11 = objc_opt_new();
    objc_storeWeak((id *)(v11 + 112), v9);
    *(void *)(v11 + 120) = a4;
    objc_setAssociatedObject(v9, a4, (id)v11, (void *)1);
    id location = 0;
    objc_initWeak(&location, v9);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__SGFuture_futureForObject_withKey_onCreate___block_invoke;
    v17[3] = &unk_1E5B8E2A0;
    objc_copyWeak(&v18, &location);
    [(id)v11 wait:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    objc_sync_exit(v9);

    v12 = [(id)v11 workQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__SGFuture_futureForObject_withKey_onCreate___block_invoke_43;
    v14[3] = &unk_1E5B8E3B0;
    id v16 = v8;
    id v10 = (id)v11;
    id v15 = v10;
    dispatch_sync(v12, v14);
  }

  return v10;
}

uint64_t __50__SGFuture_waitForFuturesToComplete_withCallback___block_invoke(uint64_t result)
{
  if (atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(result + 40) + 8) + 24), 0xFFFFFFFFFFFFFFFFLL) == 1)return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))(); {
  return result;
  }
}

intptr_t __16__SGFuture_wait__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [MEMORY[0x1E4F93BB8] tupleWithFirst:a2 second:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v7);
}

- (id)wait
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  long long v17 = __Block_byref_object_copy__1024;
  id v18 = __Block_byref_object_dispose__1025;
  id v19 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __16__SGFuture_wait__block_invoke;
  uint64_t v11 = &unk_1E5B8E208;
  v13 = &v14;
  uint64_t v4 = v3;
  v12 = v4;
  [(SGFuture *)self _wait:&v8 forSyncAPI:1];
  uint64_t v5 = [(SGFuture *)self workQueue];
  dispatch_sync(v5, &__block_literal_global);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v6;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (SGFuture)init
{
  v12.receiver = self;
  v12.super_class = (Class)SGFuture;
  v2 = [(SGFuture *)&v12 init];
  dispatch_semaphore_t v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_lock, 0);
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v5 = dispatch_queue_attr_make_initially_inactive(v4);
    dispatch_queue_t v6 = dispatch_queue_create("SGFuture", v5);
    callbacks = v3->_callbacks;
    v3->_callbacks = (OS_dispatch_queue *)v6;

    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("SGFuture-workQueue", v8);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v9;
  }
  return v3;
}

uint64_t __45__SGFuture_futureForObject_withKey_onCreate___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)createWithImmediateResult:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 completeWithResult:v6 error:v5];

  return v7;
}

- (BOOL)completeWithResult:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_queue_t v9 = v8;
  if (v7 && v8)
  {
    objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGFuture.m", 165, @"Invalid parameter not satisfying: %@", @"result == nil || error == nil" object file lineNumber description];
  }
  BOOL v10 = [(SGFuture *)self _finishWithResult:v7 orError:v9];

  return v10;
}

- (BOOL)_finishWithResult:(id)a3 orError:(id)a4
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  BOOL v10 = (void *)v9;
  if (!(v8 | v9))
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGFuture.m", 178, @"Invalid parameter not satisfying: %@", @"result || error" object file lineNumber description];
LABEL_10:

    goto LABEL_4;
  }
  if (v8 && v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGFuture.m", 179, @"Invalid parameter not satisfying: %@", @"!(result && error)" object file lineNumber description];
    goto LABEL_10;
  }
LABEL_4:
  pthread_mutex_lock(&self->_lock);
  BOOL isComplete = self->_isComplete;
  if (!self->_isComplete)
  {
    objc_storeStrong((id *)&self->_result, a3);
    objc_storeStrong((id *)&self->_error, a4);
    self->_BOOL isComplete = 1;
    [(SGFuture *)self _clearTimeoutNonThreadSafe];
    dispatch_activate((dispatch_object_t)self->_callbacks);
    if (self->_yoDontLeaveMeHangingBro)
    {
      self->_yoDontLeaveMeHangingBro = 0;
      callbacks = self->_callbacks;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__SGFuture__finishWithResult_orError___block_invoke;
      block[3] = &unk_1E5B90528;
      void block[4] = self;
      dispatch_async(callbacks, block);
    }
  }
  pthread_mutex_unlock(&self->_lock);

  return !isComplete;
}

- (void)_clearTimeoutNonThreadSafe
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
    uint64_t v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
}

- (BOOL)succeed:(id)a3
{
  return [(SGFuture *)self _finishWithResult:a3 orError:0];
}

- (id)result
{
  if (!self->_isComplete)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SGFuture.m", 143, @"Invalid parameter not satisfying: %@", @"_isComplete" object file lineNumber description];
  }
  dispatch_semaphore_t v3 = self->_result;

  return v3;
}

- (id)error
{
  if (!self->_isComplete)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SGFuture.m", 149, @"Invalid parameter not satisfying: %@", @"_isComplete" object file lineNumber description];
  }
  error = self->_error;

  return error;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_yoDontLeaveMeHangingBro)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SGFuture.m" lineNumber:49 description:@"Tried to dealloc an SGFuture (with >0 listeners) before calling succeed: or :fail."];
  }
  if (!self->_isComplete)
  {
    [(SGFuture *)self _clearTimeoutNonThreadSafe];
    dispatch_activate((dispatch_object_t)self->_callbacks);
  }
  pthread_mutex_unlock(p_lock);
  pthread_mutex_destroy(p_lock);
  v6.receiver = self;
  v6.super_class = (Class)SGFuture;
  [(SGFuture *)&v6 dealloc];
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)disassociateFromParentObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentObject);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v4 = WeakRetained;
    objc_sync_enter(v4);
    objc_getAssociatedObject(v4, self->_parentObjectKey);
    id v5 = (SGFuture *)objc_claimAutoreleasedReturnValue();
    if (v5 == self) {
      objc_setAssociatedObject(v4, self->_parentObjectKey, 0, (void *)1);
    }

    objc_sync_exit(v4);
    id WeakRetained = v6;
  }
}

- (id)waitWithTimeout:(double)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = self;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v6 = +[SGFuture createAfter:v5 onCreate:&__block_literal_global_39];

  [v6 setTimeout:a3];
  id v7 = [v6 completer];
  [(SGFuture *)self wait:v7];

  if (([v6 isComplete] & 1) == 0)
  {
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_41);
    dispatch_async((dispatch_queue_t)self->_workQueue, v8);
    dispatch_block_wait(v8, [MEMORY[0x1E4F93B18] dispatchTimeWithSecondsFromNow:a3]);
  }
  unint64_t v9 = [v6 wait];

  return v9;
}

- (void)clearTimeout
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  [(SGFuture *)self _clearTimeoutNonThreadSafe];

  pthread_mutex_unlock(p_lock);
}

- (void)setTimeout:(double)a3
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (self->_isComplete)
  {
    pthread_mutex_unlock(p_lock);
  }
  else
  {
    if (fabs(a3) == INFINITY)
    {
      [(SGFuture *)self _clearTimeoutNonThreadSafe];
    }
    else
    {
      timeoutTimer = self->_timeoutTimer;
      if (timeoutTimer)
      {
        dispatch_suspend(timeoutTimer);
      }
      else
      {
        id v7 = dispatch_get_global_queue(-2, 0);
        dispatch_block_t v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);
        unint64_t v9 = self->_timeoutTimer;
        self->_timeoutTimer = v8;

        id location = 0;
        objc_initWeak(&location, self);
        BOOL v10 = self->_timeoutTimer;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __23__SGFuture_setTimeout___block_invoke;
        v13[3] = &unk_1E5B90550;
        objc_copyWeak(&v14, &location);
        dispatch_source_set_event_handler(v10, v13);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      uint64_t v11 = self->_timeoutTimer;
      if (a3 <= 0.0)
      {
        dispatch_time_t v12 = 0;
      }
      else if (a3 <= 9223372040.0)
      {
        dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      }
      else
      {
        dispatch_time_t v12 = -1;
      }
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      dispatch_resume((dispatch_object_t)self->_timeoutTimer);
    }
    pthread_mutex_unlock(p_lock);
  }
}

void __23__SGFuture_setTimeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SGErrorDomain" code:10 userInfo:0];
  [WeakRetained fail:v1];
}

- (id)completer
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __21__SGFuture_completer__block_invoke;
  v4[3] = &unk_1E5B8E258;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1A62654A0](v4, a2);

  return v2;
}

uint64_t __21__SGFuture_completer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeWithResult:a2 error:a3];
}

- (BOOL)fail:(id)a3
{
  return [(SGFuture *)self _finishWithResult:0 orError:a3];
}

uint64_t __29__SGFuture__wait_forSyncAPI___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setTargetQueue:(id)a3 useAfterCompletion:(BOOL)a4
{
  queue = a3;
  pthread_mutex_lock(&self->_lock);
  if (self->_isComplete)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SGFuture.m", 69, @"Invalid parameter not satisfying: %@", @"!_isComplete" object file lineNumber description];
  }
  if (self->_timeoutTimer)
  {
    dispatch_block_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGFuture.m", 70, @"Invalid parameter not satisfying: %@", @"!_timeoutTimer" object file lineNumber description];
  }
  dispatch_set_target_queue((dispatch_object_t)self->_callbacks, queue);
  self->_alwaysUseCallbacksQueue = a4;
  pthread_mutex_unlock(&self->_lock);
}

+ (id)createWithImmediateError:(id)a3
{
  return (id)[a1 createWithImmediateResult:0 error:a3];
}

+ (id)createWithImmediateResult:(id)a3
{
  return (id)[a1 createWithImmediateResult:a3 error:0];
}

+ (id)createAfter:(id)a3 onCreate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  dispatch_block_t v8 = [v7 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SGFuture_createAfter_onCreate___block_invoke;
  block[3] = &unk_1E5B8E2C8;
  id v16 = v5;
  id v18 = v6;
  id v9 = v7;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_sync(v8, block);

  dispatch_time_t v12 = v17;
  id v13 = v9;

  return v13;
}

void __33__SGFuture_createAfter_onCreate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__SGFuture_createAfter_onCreate___block_invoke_2;
  v3[3] = &unk_1E5B8E3B0;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  +[SGFuture waitForFuturesToComplete:v2 withCallback:v3];
}

uint64_t __33__SGFuture_createAfter_onCreate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end