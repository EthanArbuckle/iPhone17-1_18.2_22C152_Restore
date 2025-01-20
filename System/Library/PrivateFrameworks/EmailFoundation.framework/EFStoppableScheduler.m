@interface EFStoppableScheduler
+ (id)assertableSchedulerWithScheduler:(id)a3;
+ (id)suspendableSchedulerWithScheduler:(id)a3;
- (EFScheduler)scheduler;
- (EFStoppableScheduler)initWithScheduler:(id)a3;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (id)performWithObject:(id)a3;
- (void)_addCancelationToken:(id)a3;
- (void)_cancelAllTokens;
- (void)_removeCancelationToken:(id)a3;
- (void)assertIsExecuting:(BOOL)a3;
- (void)dealloc;
- (void)performBlock:(id)a3;
- (void)performSyncBarrierBlock:(id)a3;
- (void)performSyncBlock:(id)a3;
- (void)performVoucherPreservingBlock:(id)a3;
- (void)resume;
- (void)stopAndWait;
- (void)suspend;
@end

@implementation EFStoppableScheduler

- (void)performBlock:(id)a3
{
  id v5 = a3;
  v4 = EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  [v4 performBlock:v5];
}

void __48__EFStoppableScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _removeCancelationToken:*(void *)(a1 + 32)];
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_removeCancelationToken:(id)a3
{
  id v4 = a3;
  tokens = self->_tokens;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__EFStoppableScheduler__removeCancelationToken___block_invoke;
  v7[3] = &unk_1E61236C8;
  id v8 = v4;
  id v6 = v4;
  [(EFLocked *)tokens performWhileLocked:v7];
}

uint64_t __48__EFStoppableScheduler__removeCancelationToken___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

+ (id)assertableSchedulerWithScheduler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithScheduler:v4];

  return v5;
}

- (EFStoppableScheduler)initWithScheduler:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EFStoppableScheduler;
  id v5 = [(EFStoppableScheduler *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    id v7 = EFAtomicObjectSetIfNil(&v5->_scheduler.cfObject, v4);
    id v8 = [EFLocked alloc];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v10 = [(EFLocked *)v8 initWithObject:v9];
    tokens = v6->_tokens;
    v6->_tokens = (EFLocked *)v10;
  }
  return v6;
}

- (void)assertIsExecuting:(BOOL)a3
{
  BOOL v3 = a3;
  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 assertIsExecuting:v3];
}

- (void)performSyncBlock:(id)a3
{
  id v5 = a3;
  id v4 = EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  [v4 performSyncBlock:v5];
}

- (EFScheduler)scheduler
{
  return (EFScheduler *)EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  id v3 = EFAtomicObjectRelease((unint64_t *)&self->_scheduler);
  v4.receiver = self;
  v4.super_class = (Class)EFStoppableScheduler;
  [(EFStoppableScheduler *)&v4 dealloc];
}

uint64_t __45__EFStoppableScheduler__addCancelationToken___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)suspend
{
  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 suspend];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(EFCancelationToken);
  [(EFStoppableScheduler *)self _addCancelationToken:v7];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __48__EFStoppableScheduler_afterDelay_performBlock___block_invoke;
  v17 = &unk_1E6123678;
  objc_copyWeak(&v20, &location);
  id v9 = v7;
  v18 = v9;
  id v10 = v6;
  id v19 = v10;
  v11 = [v8 afterDelay:&v14 performBlock:a3];

  if (v11)
  {
    -[EFCancelationToken addCancelable:](v9, "addCancelable:", v11, v14, v15, v16, v17, v18);
    v12 = v9;
  }
  else
  {
    -[EFStoppableScheduler _removeCancelationToken:](self, "_removeCancelationToken:", v9, v14, v15, v16, v17, v18);
    v12 = 0;
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v12;
}

- (void)_addCancelationToken:(id)a3
{
  id v4 = a3;
  tokens = self->_tokens;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__EFStoppableScheduler__addCancelationToken___block_invoke;
  v12[3] = &unk_1E61236C8;
  id v6 = v4;
  id v13 = v6;
  [(EFLocked *)tokens performWhileLocked:v12];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v6);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__EFStoppableScheduler__addCancelationToken___block_invoke_2;
  v7[3] = &unk_1E61236F0;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  [v6 addCancelationBlock:v7];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

+ (id)suspendableSchedulerWithScheduler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithScheduler:v4];

  return v5;
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(EFCancelationToken);
  [(EFStoppableScheduler *)self _addCancelationToken:v5];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v6 = EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __47__EFStoppableScheduler_performCancelableBlock___block_invoke;
  uint64_t v15 = &unk_1E61236A0;
  objc_copyWeak(&v18, &location);
  id v7 = v5;
  v16 = v7;
  id v8 = v4;
  id v17 = v8;
  id v9 = [v6 performCancelableBlock:&v12];

  if (v9)
  {
    -[EFCancelationToken addCancelable:](v7, "addCancelable:", v9, v12, v13, v14, v15, v16);
    id v10 = v7;
  }
  else
  {
    -[EFStoppableScheduler _removeCancelationToken:](self, "_removeCancelationToken:", v7, v12, v13, v14, v15, v16);
    id v10 = 0;
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v10;
}

void __47__EFStoppableScheduler_performCancelableBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _removeCancelationToken:*(void *)(a1 + 32)];
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)performSyncBarrierBlock:(id)a3
{
  id v5 = a3;
  id v4 = EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  [v4 performSyncBarrierBlock:v5];
}

- (void)performVoucherPreservingBlock:(id)a3
{
  id v5 = a3;
  id v4 = EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  [v4 performVoucherPreservingBlock:v5];
}

- (id)performWithObject:(id)a3
{
  id v4 = a3;
  id v5 = EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  id v6 = [v5 performWithObject:v4];

  return v6;
}

- (void)resume
{
  EFAtomicObjectLoad((unint64_t *)&self->_scheduler);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 resume];
}

- (void)stopAndWait
{
  EFAtomicObjectRelease((unint64_t *)&self->_scheduler);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(EFStoppableScheduler *)self _cancelAllTokens];
  [v3 performSyncBarrierBlock:&__block_literal_global_37];
}

void __45__EFStoppableScheduler__addCancelationToken___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeCancelationToken:v2];
}

- (void)_cancelAllTokens
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  tokens = self->_tokens;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__EFStoppableScheduler__cancelAllTokens__block_invoke;
  v11[3] = &unk_1E6123718;
  v11[4] = &v12;
  [(EFLocked *)tokens performWhileLocked:v11];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = (id)v13[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cancel", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v18 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v12, 8);
}

void __40__EFStoppableScheduler__cancelAllTokens__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 allObjects];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [v6 removeAllObjects];
}

@end