@interface _GCAsyncFuture
- (BOOL)_checkFinished:(BOOL)a3;
- (BOOL)_setState:(int64_t)a3 result:(id)a4 error:(id)a5;
- (id).cxx_construct;
- (id)_initOnQueue:(char)a3 withOptions:(void *)a4 block:;
- (id)debugDescription;
- (unint64_t)_creatorFrame;
- (void)_observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 block:(id)a7;
@end

@implementation _GCAsyncFuture

- (id)_initOnQueue:(char)a3 withOptions:(void *)a4 block:
{
  v7 = a2;
  id v8 = a4;
  v9 = v8;
  if (a1)
  {
    if (!v8)
    {
      v20 = unk_26BEED9E8(&off_26BEEDB50, "currentHandler");
      [v20 handleFailureInMethod:sel__initOnQueue_withOptions_block_, a1, @"GCFuture.mm", 1237, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
    }
    v24.receiver = a1;
    v24.super_class = (Class)GCFuture;
    id v10 = objc_msgSendSuper2(&v24, sel_init);
    *((_DWORD *)v10 + 2) = 0;
    *((unsigned char *)v10 + 12) = -2;
    *((unsigned char *)v10 + 12) = -1;
    atomic_store(1u, (unsigned __int8 *)v10 + 14);
    if (__creatorFrameKey(void)::onceToken != -1) {
      dispatch_once(&__creatorFrameKey(void)::onceToken, &__block_literal_global_357);
    }
    *((void *)v10 + 8) = pthread_getspecific(__creatorFrameKey(void)::key);
    dispatch_group_t v11 = dispatch_group_create();
    v12 = (void *)*((void *)v10 + 4);
    *((void *)v10 + 4) = v11;

    dispatch_group_enter(*((dispatch_group_t *)v10 + 4));
    if ((a3 & 2) != 0)
    {
      v14 = (void *)*((void *)v10 + 5);
      *((void *)v10 + 5) = 0;
    }
    else
    {
      uint64_t v13 = voucher_copy();
      v14 = (void *)*((void *)v10 + 5);
      *((void *)v10 + 5) = v13;
    }

    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472;
    aBlock[2] = __49___GCAsyncFuture__initOnQueue_withOptions_block___block_invoke;
    aBlock[3] = &unk_26BEC4F48;
    v22 = -[GCPromise initWithFuture:]((id *)[GCPromise alloc], v10);
    id v23 = v9;
    v15 = v22;
    v16 = _Block_copy(aBlock);
    if (!v7)
    {
      dispatch_block_perform((dispatch_block_flags_t)(a3 & 2), v16);
LABEL_17:
      a1 = v10;

      goto LABEL_18;
    }
    if ((a3 & 2) != 0)
    {
      dispatch_block_flags_t v17 = DISPATCH_BLOCK_DETACHED;
    }
    else
    {
      if ((a3 & 4) == 0)
      {
LABEL_16:
        dispatch_async(v7, v16);
        goto LABEL_17;
      }
      dispatch_block_flags_t v17 = DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT;
    }
    dispatch_block_t v18 = dispatch_block_create(v17, v16);

    v16 = v18;
    goto LABEL_16;
  }
LABEL_18:

  return a1;
}

- (BOOL)_checkFinished:(BOOL)a3
{
  return dispatch_group_wait(&self->super._label->super, a3 << 63 >> 63) == 0;
}

- (void)_observeFinishOnQueue:(id)a3 withOptions:(unsigned int)a4 qosClass:(unsigned int)a5 relativePriority:(int)a6 block:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a7;
  os_unfair_lock_lock_with_options();
  tqh_first = self->_continuations._continuations.tqh_first;
  os_unfair_lock_unlock(&self->super._lock);
  if (tqh_first)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __84___GCAsyncFuture__observeFinishOnQueue_withOptions_qosClass_relativePriority_block___block_invoke;
    v15[3] = &unk_26BEC4F70;
    id v17 = v13;
    id v16 = v12;
    int v18 = v10;
    int v19 = v9;
    int v20 = v8;
    ContinuationList::addOrInvokeContinuation_takesLock((uint64_t)&self->_creationVoucher, self, v15);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)_GCAsyncFuture;
    [(GCFuture *)&v21 _observeFinishOnQueue:v12 withOptions:v10 qosClass:v9 relativePriority:v8 block:v13];
  }
}

- (BOOL)_setState:(int64_t)a3 result:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_GCAsyncFuture;
  BOOL v10 = [(GCFuture *)&v13 _setState:a3 result:v8 error:v9];
  if (v10)
  {
    ContinuationList::drainContinuations_takesLock((ContinuationList *)&self->_creationVoucher, &self->super);
    condGroup = self->_condGroup;
    self->_condGroup = 0;

    dispatch_group_leave(&self->super._label->super);
  }

  return v10;
}

- (unint64_t)_creatorFrame
{
  return (unint64_t)self->_continuations._continuations.tqh_last;
}

- (id)debugDescription
{
  v4.receiver = self;
  v4.super_class = (Class)_GCAsyncFuture;
  v2 = [(GCFuture *)&v4 debugDescription];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condGroup, 0);

  objc_storeStrong((id *)&self->super._label, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = (char *)self + 48;
  return self;
}

@end