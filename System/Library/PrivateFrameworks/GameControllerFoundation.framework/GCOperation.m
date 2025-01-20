@interface GCOperation
+ (id)alloc;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_checkFinished:(BOOL)a3;
- (BOOL)_runSynchronouslyIfNeeded;
- (BOOL)_setState:(int64_t)a3 result:(id)a4 error:(id)a5;
- (GCOperation)initWithError:(id)a3;
- (GCOperation)initWithResult:(id)a3;
- (id).cxx_construct;
- (id)_thenSynchronouslyRequiringState:(int64_t)a3 onQueue:(id)a4 withOptions:(unsigned int)a5 qosClass:(unsigned int)a6 relativePriority:(int)a7 label:(id)a8 block:(id)a9;
- (id)activate;
- (id)asyncBlock;
- (id)debugDescription;
- (id)initCancelled;
- (id)initOnQueue:(id)a3 withBlock:(id)a4;
- (id)initOnQueue:(id)a3 withOptions:(unsigned int)a4;
- (id)initOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5;
- (id)startAsynchronously;
- (id)syncBlock;
- (unint64_t)_creatorFrame;
- (void)_observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 block:(id)a7;
- (void)_runSynchronouslyIfNeeded;
- (void)_startAsynchronouslyIfNeeded;
- (void)activate;
- (void)setAsyncBlock:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSyncBlock:(id)a3;
@end

@implementation GCOperation

+ (id)allocWithZone:(_NSZone *)a3
{
  if (__creatorFrameKey(void)::onceToken != -1) {
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
  }
  pthread_setspecific(__creatorFrameKey(void)::key, v3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___GCOperation;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (id)alloc
{
  if (__creatorFrameKey(void)::onceToken != -1) {
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
  }
  pthread_setspecific(__creatorFrameKey(void)::key, v2);
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___GCOperation;
  return objc_msgSendSuper2(&v5, sel_allocWithZone_, 0);
}

- (GCOperation)initWithResult:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v9 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCFuture.mm", 1408, @"Invalid parameter not satisfying: %s", "result != nil");
  }
  v10.receiver = self;
  v10.super_class = (Class)GCFuture;
  objc_super v7 = [(GCFuture *)&v10 init];
  *((_DWORD *)v7 + 2) = 0;
  v7[12] = -2;
  v7[12] = 2;
  objc_storeStrong((id *)v7 + 2, a3);
  atomic_store(1u, (unsigned __int8 *)v7 + 14);
  ContinuationList::drainContinuations_takesLock((ContinuationList *)(v7 + 72), (GCFuture *)v7);

  return (GCOperation *)v7;
}

- (GCOperation)initWithError:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v9 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCFuture.mm", 1421, @"Invalid parameter not satisfying: %s", "error != nil");
  }
  v10.receiver = self;
  v10.super_class = (Class)GCFuture;
  objc_super v7 = [(GCFuture *)&v10 init];
  *((_DWORD *)v7 + 2) = 0;
  v7[12] = -2;
  v7[12] = 1;
  objc_storeStrong((id *)v7 + 2, a3);
  atomic_store(1u, (unsigned __int8 *)v7 + 14);
  ContinuationList::drainContinuations_takesLock((ContinuationList *)(v7 + 72), (GCFuture *)v7);

  return (GCOperation *)v7;
}

- (id)initCancelled
{
  v5.receiver = self;
  v5.super_class = (Class)GCFuture;
  v2 = [(GCFuture *)&v5 init];
  *((_DWORD *)v2 + 2) = 0;
  v2[12] = -2;
  v2[12] = 0;
  v3 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = 0;

  atomic_store(1u, (unsigned __int8 *)v2 + 14);
  atomic_store(1u, (unsigned __int8 *)v2 + 15);
  ContinuationList::drainContinuations_takesLock((ContinuationList *)(v2 + 72), (GCFuture *)v2);
  return v2;
}

- (id)initOnQueue:(id)a3 withOptions:(unsigned int)a4
{
  __int16 v4 = a4;
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GCFuture;
  id v8 = [(GCFuture *)&v15 init];
  *((_DWORD *)v8 + 2) = 0;
  *((unsigned char *)v8 + 12) = -2;
  *((unsigned char *)v8 + 12) = -2;
  atomic_store(0, (unsigned __int8 *)v8 + 14);
  if (__creatorFrameKey(void)::onceToken != -1) {
    dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
  }
  *((void *)v8 + 13) = pthread_getspecific(__creatorFrameKey(void)::key);
  if ((v4 & 0x100) != 0) {
    *((unsigned char *)v8 + 13) |= 1u;
  }
  objc_storeStrong((id *)v8 + 4, a3);
  if ((v4 & 2) != 0)
  {
    v12 = (void *)*((void *)v8 + 7);
    *((void *)v8 + 7) = 0;

    if ((v4 & 4) == 0)
    {
      int v11 = 0;
      goto LABEL_10;
    }
LABEL_11:
    v13 = pthread_self();
    pthread_get_qos_class_np(v13, (qos_class_t *)v8 + 16, (int *)v8 + 17);
    goto LABEL_12;
  }
  uint64_t v9 = voucher_copy();
  objc_super v10 = (void *)*((void *)v8 + 7);
  *((void *)v8 + 7) = v9;

  if ((v4 & 4) != 0) {
    goto LABEL_11;
  }
  int v11 = 21;
LABEL_10:
  *((_DWORD *)v8 + 16) = v11;
  *((_DWORD *)v8 + 17) = 0;
LABEL_12:

  return v8;
}

- (id)initOnQueue:(id)a3 withOptions:(unsigned int)a4 block:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(GCOperation *)self initOnQueue:v8 withOptions:v6];
  [v10 setAsyncBlock:v9];

  return v10;
}

- (id)initOnQueue:(id)a3 withBlock:(id)a4
{
  return [(GCOperation *)self initOnQueue:a3 withOptions:0 block:a4];
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)GCOperation;
  [(GCFuture *)&v5 setLabel:v4];
  if (self->_continuations._continuations.tqh_last)
  {
    [v4 UTF8String];
    dispatch_queue_set_label_nocopy();
  }
}

- (void)setAsyncBlock:(id)a3
{
  id v4 = a3;
  if (atomic_load_explicit((atomic_uchar *volatile)&self->super._state + 2, memory_order_acquire)) {
    -[GCOperation setAsyncBlock:]();
  }
  id v7 = v4;
  objc_super v5 = (OS_dispatch_queue *)[v4 copy];
  targetQueue = self->_targetQueue;
  self->_targetQueue = v5;
}

- (void)setSyncBlock:(id)a3
{
  id v4 = a3;
  if (atomic_load_explicit((atomic_uchar *volatile)&self->super._state + 2, memory_order_acquire)) {
    -[GCOperation setSyncBlock:]();
  }
  id v7 = v4;
  objc_super v5 = (void *)[v4 copy];
  id asyncBlock = self->_asyncBlock;
  self->_id asyncBlock = v5;
}

- (id)activate
{
  if (!*((void *)self + 5) && !*((void *)self + 6)) {
    -[GCOperation activate]();
  }
  atomic_store(1u, (unsigned __int8 *)self + 14);
  return self;
}

- (id)startAsynchronously
{
  id v3 = [(GCOperation *)self activate];
  -[GCOperation _startAsynchronouslyIfNeeded]((uint64_t)self);
  return self;
}

- (void)_startAsynchronouslyIfNeeded
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_20AD04000, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "#WARNING Asynchronously observing an operation that only has a synchronous implementation is bad for #performance.  Provide an asynchronous implementation for %@", (uint8_t *)&v1, 0xCu);
}

uint64_t __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke_293(uint64_t a1)
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__11;
  v21 = __Block_byref_object_dispose__11;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  objc_super v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke_294;
    block[3] = &unk_26BEC4F98;
    id v9 = &v11;
    id v3 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 40);
    id v8 = v3;
    id v10 = &v17;
    dispatch_async_and_wait(v2, block);
    id v4 = v8;
  }
  else
  {
    uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    objc_storeStrong(&v22, 0);
    id v4 = (void *)v12[5];
    v12[5] = v5;
  }

  if (atomic_load_explicit((atomic_uchar *volatile)(*(void *)(a1 + 40) + 15), memory_order_acquire))
  {
    [*(id *)(a1 + 40) _setState:0 result:0 error:0];
  }
  else
  {
    uint64_t v6 = v12[5];
    if (v6)
    {
      [*(id *)(a1 + 40) _setState:2 result:v6 error:0];
    }
    else
    {
      if (!v18[5]) {
        __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke_293_cold_1();
      }
      objc_msgSend(*(id *)(a1 + 40), "_setState:result:error:", 1, 0);
    }
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke_294(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = (*(void (**)(void))(v2 + 16))();
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)_runSynchronouslyIfNeeded
{
  if (a1)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)(a1 + 14), memory_order_acquire) & 1) == 0) {
      -[GCOperation _runSynchronouslyIfNeeded]();
    }
    os_unfair_lock_lock_with_options();
    if (*(unsigned __int8 *)(a1 + 12) == 254)
    {
      uint64_t v2 = _Block_copy(*(const void **)(a1 + 48));
      BOOL v3 = v2 != 0;
      if (!v2)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
        -[GCOperation _startAsynchronouslyIfNeeded](a1);
LABEL_20:

        return v3;
      }
      *(unsigned char *)(a1 + 12) = -1;
      id v4 = *(id *)(a1 + 32);
      uint64_t v5 = v4;
      if (*(unsigned char *)(a1 + 13))
      {

        uint64_t v5 = 0;
      }
      uint64_t v6 = dispatch_queue_attr_make_initially_inactive(0);
      dispatch_queue_t v7 = dispatch_queue_create(0, v6);
      id v8 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v7;

      [*(id *)(a1 + 24) UTF8String];
      dispatch_queue_set_label_nocopy();
      dispatch_activate(*(dispatch_object_t *)(a1 + 88));
      uint64_t v9 = dispatch_get_current_queue();
      id v10 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v9;

      *(unsigned char *)(a1 + 13) &= ~2u;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 3221225472;
      aBlock[2] = __40__GCOperation__runSynchronouslyIfNeeded__block_invoke;
      aBlock[3] = &unk_26BEC4FC0;
      id v11 = v5;
      id v19 = v11;
      uint64_t v20 = a1;
      id v21 = v2;
      v12 = _Block_copy(aBlock);
      int v13 = *(_DWORD *)(a1 + 64);
      if (!*(void *)(a1 + 56) && v13 == 21)
      {
LABEL_19:
        dispatch_async_and_wait(*(dispatch_queue_t *)(a1 + 88), v12);

        goto LABEL_20;
      }
      if (v13)
      {
        if (v13 != 21)
        {
          uint64_t v15 = dispatch_block_create_with_voucher_and_qos_class();
          goto LABEL_18;
        }
        dispatch_block_flags_t v14 = DISPATCH_BLOCK_ASSIGN_CURRENT;
      }
      else
      {
        dispatch_block_flags_t v14 = DISPATCH_BLOCK_DETACHED;
      }
      uint64_t v15 = (uint64_t)dispatch_block_create(v14, v12);
LABEL_18:
      id v16 = (void *)v15;

      v12 = v16;
      goto LABEL_19;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  return 0;
}

void __40__GCOperation__runSynchronouslyIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__11;
  id v21 = __Block_byref_object_dispose__11;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  dispatch_block_flags_t v14 = __Block_byref_object_copy__11;
  uint64_t v15 = __Block_byref_object_dispose__11;
  id v16 = 0;
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __40__GCOperation__runSynchronouslyIfNeeded__block_invoke_2;
    block[3] = &unk_26BEC4F98;
    uint64_t v9 = &v11;
    id v3 = *(id *)(a1 + 48);
    block[4] = *(void *)(a1 + 40);
    id v8 = v3;
    id v10 = &v17;
    dispatch_async_and_wait(v2, block);
    id v4 = v8;
  }
  else
  {
    uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    objc_storeStrong(&v22, 0);
    id v4 = (void *)v12[5];
    v12[5] = v5;
  }

  if (atomic_load_explicit((atomic_uchar *volatile)(*(void *)(a1 + 40) + 15), memory_order_acquire))
  {
    [*(id *)(a1 + 40) _setState:0 result:0 error:0];
  }
  else
  {
    uint64_t v6 = v12[5];
    if (v6)
    {
      [*(id *)(a1 + 40) _setState:2 result:v6 error:0];
    }
    else
    {
      if (!v18[5]) {
        __40__GCOperation__runSynchronouslyIfNeeded__block_invoke_cold_1();
      }
      objc_msgSend(*(id *)(a1 + 40), "_setState:result:error:", 1, 0);
    }
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __40__GCOperation__runSynchronouslyIfNeeded__block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = (*(void (**)(void))(v2 + 16))();
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)_checkFinished:(BOOL)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&self->super._state + 2, memory_order_acquire) & 1) == 0) {
    -[GCOperation _checkFinished:]();
  }
  if (a3)
  {
    if (!-[GCOperation _runSynchronouslyIfNeeded]((uint64_t)self))
    {
      os_unfair_lock_lock_with_options();
      if (self->_continuations._continuations.tqh_first)
      {
        uint64_t v4 = self->_privateQueue;
        os_unfair_lock_unlock(&self->super._lock);
        if (!v4) {
          -[GCOperation _checkFinished:]();
        }
        if ((*(&self->super._state + 1) & 2) != 0) {
          dispatch_group_wait((dispatch_group_t)v4, 0xFFFFFFFFFFFFFFFFLL);
        }
        else {
          dispatch_async_and_wait((dispatch_queue_t)self->_continuations._continuations.tqh_last, &__block_literal_global_298);
        }
      }
      else
      {
        os_unfair_lock_unlock(&self->super._lock);
      }
    }
    return 1;
  }
  else
  {
    p_lock = &self->super._lock;
    os_unfair_lock_lock_with_options();
    BOOL v6 = self->_continuations._continuations.tqh_first == 0;
    os_unfair_lock_unlock(p_lock);
  }
  return v6;
}

- (void)_observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 block:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a7;
  if ((v10 & 0x10000) == 0) {
    -[GCOperation _startAsynchronouslyIfNeeded]((uint64_t)self);
  }
  os_unfair_lock_lock_with_options();
  if (self->_continuations._continuations.tqh_first)
  {
    if ((v10 & 0x10000) == 0 && (*(&self->super._state + 1) & 2) == 0)
    {
      privateQueue = self->_privateQueue;
      if (privateQueue) {
        dispatch_async(privateQueue, &__block_literal_global_300);
      }
    }
    os_unfair_lock_unlock(&self->super._lock);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __81__GCOperation__observeFinishOnQueue_withOptions_qosClass_relativePriority_block___block_invoke_2;
    v15[3] = &unk_26BEC4F70;
    id v17 = v13;
    id v16 = v12;
    int v18 = v10;
    int v19 = v9;
    int v20 = v8;
    ContinuationList::addOrInvokeContinuation_takesLock((uint64_t)&self->_qos, self, v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->super._lock);
    v21.receiver = self;
    v21.super_class = (Class)GCOperation;
    [(GCFuture *)&v21 _observeFinishOnQueue:v12 withOptions:v10 qosClass:v9 relativePriority:v8 block:v13];
  }
}

void *__81__GCOperation__observeFinishOnQueue_withOptions_qosClass_relativePriority_block___block_invoke_2(uint64_t a1)
{
  return Observer::Create(*(void **)(a1 + 40), *(void **)(a1 + 32), *(_DWORD *)(a1 + 48), (dispatch_qos_class_t)*(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 56));
}

- (BOOL)_setState:(int64_t)a3 result:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)GCOperation;
  BOOL v10 = [(GCFuture *)&v13 _setState:a3 result:v8 error:v9];
  if (v10)
  {
    ContinuationList::drainContinuations_takesLock((ContinuationList *)&self->_qos, &self->super);
    id syncBlock = self->_syncBlock;
    self->_id syncBlock = 0;

    if ((*(&self->super._state + 1) & 2) != 0) {
      dispatch_group_leave((dispatch_group_t)self->_privateQueue);
    }
  }

  return v10;
}

- (unint64_t)_creatorFrame
{
  return (unint64_t)self->_syncBoostQueueOrAsyncGroup;
}

- (id)debugDescription
{
  v4.receiver = self;
  v4.super_class = (Class)GCOperation;
  uint64_t v2 = [(GCFuture *)&v4 debugDescription];

  return v2;
}

- (id)_thenSynchronouslyRequiringState:(int64_t)a3 onQueue:(id)a4 withOptions:(unsigned int)a5 qosClass:(unsigned int)a6 relativePriority:(int)a7 label:(id)a8 block:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  if (!v18)
  {
    id v22 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCFuture.mm", 1875, @"Invalid parameter not satisfying: %s", "block != nil");
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&self->super._state + 2, memory_order_acquire) & 1) == 0) {
    -[GCOperation _thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:]();
  }
  id v19 = [[GCOperation alloc] initOnQueue:v16 withOptions:v12];
  if (self->_targetQueue)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke;
    v26[3] = &unk_26BEC4E80;
    v26[4] = self;
    int v30 = v12;
    unsigned int v31 = a6;
    int v32 = a7;
    id v27 = v16;
    int64_t v29 = a3;
    id v28 = v18;
    [v19 setAsyncBlock:v26];
  }
  if (self->_asyncBlock)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_3;
    v23[3] = &unk_26BEC4FE8;
    v23[4] = self;
    int64_t v25 = a3;
    id v24 = v18;
    [v19 setSyncBlock:v23];
  }
  int v20 = [v19 activate];

  return v20;
}

void __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned int *)(a1 + 64);
  uint64_t v7 = *(unsigned int *)(a1 + 68);
  uint64_t v8 = *(unsigned int *)(a1 + 72);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2;
  v11[3] = &unk_26BEC4E58;
  id v9 = *(void **)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 56);
  v11[4] = v4;
  id v12 = v3;
  id v13 = v9;
  id v10 = v3;
  [v4 observeFinishOnQueue:v5 withOptions:v6 qosClass:v7 relativePriority:v8 block:v11];
}

void __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(id *)(a1 + 32);
  unint64_t v10 = *(void *)(a1 + 56);
  if (v10 > 2 || v10 == a2)
  {
    id v12 = v8;
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = [*(id *)(a1 + 40) future];
    id v20 = v12;
    uint64_t v15 = (*(void (**)(uint64_t, uint64_t, id, uint64_t, id *))(v13 + 16))(v13, a2, v7, v14 + 15, &v20);
    id v16 = v20;

    id v17 = [*(id *)(a1 + 40) future];
    LOBYTE(v14) = atomic_load_explicit(v17 + 15, memory_order_acquire);

    if (v14)
    {
      id v18 = [*(id *)(a1 + 40) future];
      [v18 _setState:0 result:0 error:0];
    }
    else if (v15)
    {
      id v18 = [*(id *)(a1 + 40) future];
      [v18 _setState:2 result:v15 error:0];
    }
    else
    {
      if (!v12) {
        __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2_cold_1();
      }
      id v18 = [*(id *)(a1 + 40) future];
      [v18 _setState:1 result:0 error:v16];
    }
  }
  else
  {
    id v19 = [*(id *)(a1 + 40) future];
    [v19 _setState:a2 result:v7 error:v8];
  }
}

id __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_3(uint64_t a1, unsigned __int8 *a2, void *a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) waitUntilFinished];
  id v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8 == 2)
  {
    if (v6 == 1) {
      goto LABEL_13;
    }
    if (v6)
    {
LABEL_9:
      *a3 = [*(id *)(a1 + 32) error];
      uint64_t v9 = *(void *)(a1 + 40);
      unint64_t v10 = [*(id *)(a1 + 32) result];
      id v7 = (*(void (**)(uint64_t, void *, void *, unsigned __int8 *, void *))(v9 + 16))(v9, v7, v10, a2, a3);

      goto LABEL_15;
    }
LABEL_12:
    atomic_store(1u, a2);
    goto LABEL_15;
  }
  if (v8 != 1)
  {
    if (!v8)
    {
      if (v6 != 1)
      {
        if (v6 != 2) {
          goto LABEL_9;
        }
        goto LABEL_14;
      }
LABEL_13:
      [*(id *)(a1 + 32) error];
      id v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  if (v6 != 2)
  {
    if (v6) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
LABEL_14:
  id v7 = [*(id *)(a1 + 32) result];
LABEL_15:

  return v7;
}

- (id)asyncBlock
{
  return self->_targetQueue;
}

- (id)syncBlock
{
  return self->_asyncBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_continuations._continuations.tqh_last, 0);
  objc_storeStrong(&self->_syncBlock, 0);
  objc_storeStrong(&self->_asyncBlock, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);

  objc_storeStrong((id *)&self->super._label, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = (char *)self + 72;
  return self;
}

- (void)setAsyncBlock:.cold.1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF GCOperation: -setAsyncBlock: called on active GCOperation.";
  __break(1u);
}

- (void)setSyncBlock:.cold.1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF GCOperation: -setSyncBlock: called on active GCOperation.";
  __break(1u);
}

- (void)activate
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation must have an async or sync implementation.";
  __break(1u);
}

void __43__GCOperation__startAsynchronouslyIfNeeded__block_invoke_293_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation was not cancelled, but syncBlock did not return a r"
                             "esult or an error.";
  __break(1u);
}

- (void)_runSynchronouslyIfNeeded
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation has not been activated.";
  __break(1u);
}

void __40__GCOperation__runSynchronouslyIfNeeded__block_invoke_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation was not cancelled, but syncBlock did not return a r"
                             "esult or an error.";
  __break(1u);
}

- (void)_checkFinished:.cold.1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF GCOperation: GCOperation has not been activated.";
  __break(1u);
}

- (void)_checkFinished:.cold.2()
{
}

- (void)_thenSynchronouslyRequiringState:onQueue:withOptions:qosClass:relativePriority:label:block:.cold.1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF GCOperation: GCOperation has not been activated.";
  __break(1u);
}

void __106__GCOperation__thenSynchronouslyRequiringState_onQueue_withOptions_qosClass_relativePriority_label_block___block_invoke_2_cold_1()
{
  qword_2676829E8 = (uint64_t)"BUG IN CLIENT OF GCOperation: Operation was not cancelled, but block did not return a result or an error.";
  __break(1u);
}

@end