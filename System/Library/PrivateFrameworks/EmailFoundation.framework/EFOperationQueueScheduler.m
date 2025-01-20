@interface EFOperationQueueScheduler
- (EFOperationQueueScheduler)initWithMaxConcurrentOperationCount:(int64_t)a3;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (id)performWithObject:(id)a3;
- (void)performBlock:(id)a3;
- (void)performSyncBarrierBlock:(id)a3;
- (void)performSyncBlock:(id)a3;
- (void)performVoucherPreservingBlock:(id)a3;
@end

@implementation EFOperationQueueScheduler

- (EFOperationQueueScheduler)initWithMaxConcurrentOperationCount:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EFOperationQueueScheduler;
  v4 = [(EFOperationQueueScheduler *)&v8 init];
  if (v4)
  {
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v4->_queue;
    v4->_queue = v5;

    [(NSOperationQueue *)v4->_queue setMaxConcurrentOperationCount:a3];
  }
  return v4;
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__EFOperationQueueScheduler_performBlock___block_invoke;
  v7[3] = &unk_1E6121E00;
  id v8 = v4;
  id v6 = v4;
  [(NSOperationQueue *)queue addOperationWithBlock:v7];
}

uint64_t __42__EFOperationQueueScheduler_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return +[EFPriorityDesignator destroyCurrentDesignator];
}

- (void)performSyncBlock:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[EFPriorityDesignator currentDesignatorIfExists];
  id v6 = (void *)MEMORY[0x1E4F28B48];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __46__EFOperationQueueScheduler_performSyncBlock___block_invoke;
  v15 = &unk_1E6121F50;
  id v7 = v4;
  id v17 = v7;
  id v8 = v5;
  id v16 = v8;
  v9 = [v6 blockOperationWithBlock:&v12];
  queue = self->_queue;
  v18[0] = v9;
  v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 1, v12, v13, v14, v15);
  [(NSOperationQueue *)queue addOperations:v11 waitUntilFinished:1];
}

void __46__EFOperationQueueScheduler_performSyncBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  v3 = +[EFPriorityDesignator currentDesignatorIfExists];

  if (v2 != v3)
  {
    +[EFPriorityDesignator destroyCurrentDesignator];
  }
}

- (void)performSyncBarrierBlock:(id)a3
{
  id v4 = a3;
  v5 = +[EFPriorityDesignator currentDesignatorIfExists];
  queue = self->_queue;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __53__EFOperationQueueScheduler_performSyncBarrierBlock___block_invoke;
  uint64_t v12 = &unk_1E6121F50;
  id v7 = v4;
  id v14 = v7;
  id v8 = v5;
  id v13 = v8;
  [(NSOperationQueue *)queue addBarrierBlock:&v9];
  -[EFOperationQueueScheduler performSyncBlock:](self, "performSyncBlock:", &__block_literal_global_23, v9, v10, v11, v12);
}

void __53__EFOperationQueueScheduler_performSyncBarrierBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  v3 = +[EFPriorityDesignator currentDesignatorIfExists];

  if (v2 != v3)
  {
    +[EFPriorityDesignator destroyCurrentDesignator];
  }
}

- (void)performVoucherPreservingBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__EFOperationQueueScheduler_performVoucherPreservingBlock___block_invoke;
  block[3] = &unk_1E6121E00;
  id v6 = v4;
  id v9 = v6;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  [(NSOperationQueue *)queue addOperationWithBlock:v7];
}

uint64_t __59__EFOperationQueueScheduler_performVoucherPreservingBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return +[EFPriorityDesignator destroyCurrentDesignator];
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(EFCancelationToken);
  id v6 = (void *)MEMORY[0x1E4F28B48];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __52__EFOperationQueueScheduler_performCancelableBlock___block_invoke;
  v18[3] = &unk_1E6121F50;
  id v7 = v4;
  id v20 = v7;
  id v8 = v5;
  v19 = v8;
  id v9 = [v6 blockOperationWithBlock:v18];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v9);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __52__EFOperationQueueScheduler_performCancelableBlock___block_invoke_2;
  v15 = &unk_1E6121B18;
  objc_copyWeak(&v16, &location);
  [(EFCancelationToken *)v8 addCancelationBlock:&v12];
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v9, v12, v13, v14, v15);
  uint64_t v10 = v8;
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

uint64_t __52__EFOperationQueueScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
  return +[EFPriorityDesignator destroyCurrentDesignator];
}

void __52__EFOperationQueueScheduler_performCancelableBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(EFCancelationToken);
  id v8 = +[EFScheduler globalAsyncScheduler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__EFOperationQueueScheduler_afterDelay_performBlock___block_invoke;
  v15[3] = &unk_1E6121CF8;
  id v9 = v7;
  id v16 = v9;
  id v17 = self;
  id v10 = v6;
  id v18 = v10;
  id v11 = (id)[v8 afterDelay:v15 performBlock:a3];

  uint64_t v12 = v18;
  uint64_t v13 = v9;

  return v13;
}

void __53__EFOperationQueueScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    uint64_t v4 = MEMORY[0x1E4F143A8];
    uint64_t v5 = 3221225472;
    id v6 = __53__EFOperationQueueScheduler_afterDelay_performBlock___block_invoke_2;
    id v7 = &unk_1E6122E80;
    v2 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    v3 = [v2 performCancelableBlock:&v4];
    objc_msgSend(*(id *)(a1 + 32), "addCancelable:", v3, v4, v5, v6, v7);
  }
}

uint64_t __53__EFOperationQueueScheduler_afterDelay_performBlock___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return +[EFPriorityDesignator destroyCurrentDesignator];
}

- (id)performWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() onScheduler:self performWithObject:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end