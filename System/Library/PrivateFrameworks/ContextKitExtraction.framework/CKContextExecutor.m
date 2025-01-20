@interface CKContextExecutor
- (BOOL)done;
- (CKContextExecutor)initWithContext:(id)a3 workItemQueue:(id)a4 completionQueue:(id)a5 timeoutAfter:(unint64_t)a6 completionHandler:(id)a7;
- (id)context;
- (void)_awaitCompletion;
- (void)addWorkItem:(id)a3;
- (void)addWorkItem:(id)a3 toQueue:(id)a4;
- (void)addWorkItem:(id)a3 withContext:(id)a4;
- (void)addWorkItemToQueue:(id)a3 withWorkItem:(id)a4 andContext:(id)a5;
- (void)dealloc;
- (void)markIncomplete;
- (void)markReady;
- (void)markReadyAndAwaitCompletion;
@end

@implementation CKContextExecutor

- (void)_awaitCompletion
{
  p_done = &self->_done;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_done);
  if ((v3 & 1) == 0)
  {
    intptr_t v5 = dispatch_group_wait((dispatch_group_t)self->_group, self->_timeoutAfter);
    atomic_store(1u, (unsigned __int8 *)p_done);
    v6 = (void *)MEMORY[0x1BA99DED0](self->_completionHandler);
    v7 = v6;
    if (v6)
    {
      BOOL v8 = v5 != 0;
      completionQueue = self->_completionQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__CKContextExecutor__awaitCompletion__block_invoke;
      block[3] = &unk_1E6110FD8;
      block[4] = self;
      id v11 = v6;
      BOOL v12 = v8;
      dispatch_sync(completionQueue, block);
    }
    [(NSCondition *)self->_completionCondition signal];
  }
}

uint64_t __37__CKContextExecutor__awaitCompletion__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (CKContextExecutor)initWithContext:(id)a3 workItemQueue:(id)a4 completionQueue:(id)a5 timeoutAfter:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CKContextExecutor;
  v16 = [(CKContextExecutor *)&v28 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak(&v16->_context, v12);
    objc_storeStrong((id *)&v17->_workItemQueue, a4);
    objc_storeStrong((id *)&v17->_completionQueue, a5);
    dispatch_group_t v18 = dispatch_group_create();
    group = v17->_group;
    v17->_group = (OS_dispatch_group *)v18;

    v17->_timeoutAfter = a6;
    uint64_t v20 = MEMORY[0x1BA99DED0](v15);
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = (id)v20;

    v22 = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
    completionCondition = v17->_completionCondition;
    v17->_completionCondition = v22;

    [(CKContextExecutor *)v17 markIncomplete];
    v24 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__CKContextExecutor_initWithContext_workItemQueue_completionQueue_timeoutAfter_completionHandler___block_invoke;
    block[3] = &unk_1E6110DC8;
    v27 = v17;
    dispatch_async(v24, block);
  }
  else
  {
    (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
  }

  return v17;
}

uint64_t __98__CKContextExecutor_initWithContext_workItemQueue_completionQueue_timeoutAfter_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _awaitCompletion];
}

- (void)dealloc
{
  objc_storeWeak(&self->_context, 0);
  workItemQueue = self->_workItemQueue;
  self->_workItemQueue = 0;

  completionQueue = self->_completionQueue;
  self->_completionQueue = 0;

  group = self->_group;
  self->_group = 0;

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  completionCondition = self->_completionCondition;
  self->_completionCondition = 0;

  v8.receiver = self;
  v8.super_class = (Class)CKContextExecutor;
  [(CKContextExecutor *)&v8 dealloc];
}

- (void)markIncomplete
{
}

- (void)markReady
{
}

- (void)markReadyAndAwaitCompletion
{
  dispatch_group_leave((dispatch_group_t)self->_group);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_done);
  if ((v3 & 1) == 0)
  {
    completionCondition = self->_completionCondition;
    [(NSCondition *)completionCondition wait];
  }
}

- (void)addWorkItem:(id)a3
{
}

- (void)addWorkItem:(id)a3 toQueue:(id)a4
{
}

- (void)addWorkItem:(id)a3 withContext:(id)a4
{
}

- (void)addWorkItemToQueue:(id)a3 withWorkItem:(id)a4 andContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_done);
  if (v8 && (v10 & 1) == 0)
  {
    id v11 = a3;
    id v12 = (void *)[v8 copy];

    objc_initWeak(&location, self);
    group = self->_group;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__CKContextExecutor_addWorkItemToQueue_withWorkItem_andContext___block_invoke;
    v14[3] = &unk_1E6111000;
    objc_copyWeak(&v17, &location);
    id v8 = v12;
    id v16 = v8;
    id v15 = v9;
    dispatch_group_async(group, v11, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

uint64_t __64__CKContextExecutor_addWorkItemToQueue_withWorkItem_andContext___block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 40))
    {
      unsigned __int8 v3 = atomic_load(WeakRetained + 56);
      if ((v3 & 1) == 0) {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (BOOL)done
{
  return self->_done;
}

- (id)context
{
  id WeakRetained = objc_loadWeakRetained(&self->_context);

  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_context);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_completionCondition, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);

  objc_storeStrong((id *)&self->_workItemQueue, 0);
}

@end