@interface EFLazyFuture
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)run;
- (BOOL)tryCancel;
- (EFLazyFuture)initWithScheduler:(id)a3 block:(id)a4;
- (id)delegate;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (id)resultIfAvailable:(id *)a3;
- (void)addFailureBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)onScheduler:(id)a3 addFailureBlock:(id)a4;
- (void)onScheduler:(id)a3 addSuccessBlock:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EFLazyFuture

- (EFLazyFuture)initWithScheduler:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)EFLazyFuture;
  v9 = [(EFFuture *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    stateLock = v9->_stateLock;
    v9->_stateLock = (NSConditionLock *)v10;

    [(NSConditionLock *)v9->_stateLock setName:@"EFLazyFuture state lock"];
    objc_storeStrong((id *)&v9->_scheduler, a3);
    v12 = _Block_copy(v8);
    id block = v9->_block;
    v9->_id block = v12;

    v14 = objc_alloc_init(EFPromise);
    promise = v9->_promise;
    v9->_promise = v14;
  }
  return v9;
}

- (id)delegate
{
  v2 = [(EFPromise *)self->_promise future];
  v3 = [v2 delegate];

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  v4 = [(EFPromise *)self->_promise future];
  [v4 setDelegate:v5];
}

- (BOOL)run
{
  [(NSConditionLock *)self->_stateLock lock];
  int64_t v3 = [(NSConditionLock *)self->_stateLock condition];
  if (v3)
  {
    [(NSConditionLock *)self->_stateLock unlock];
  }
  else
  {
    v4 = _Block_copy(self->_block);
    id block = self->_block;
    self->_id block = 0;

    [(NSConditionLock *)self->_stateLock unlockWithCondition:1];
    scheduler = self->_scheduler;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __19__EFLazyFuture_run__block_invoke;
    v9[3] = &unk_1E6121F50;
    id v7 = v4;
    v9[4] = self;
    id v10 = v7;
    [(EFScheduler *)scheduler performBlock:v9];
  }
  return v3 == 0;
}

void __19__EFLazyFuture_run__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = 0;
  int64_t v3 = (*(void (**)(void))(v2 + 16))();
  id v4 = v5;
  [*(id *)(*(void *)(a1 + 32) + 72) finishWithResult:v3 error:v4];
  [*(id *)(*(void *)(a1 + 32) + 48) lock];
  [*(id *)(*(void *)(a1 + 32) + 48) unlockWithCondition:2];
}

- (BOOL)isFinished
{
  uint64_t v2 = [(EFPromise *)self->_promise future];
  char v3 = [v2 isFinished];

  return v3;
}

- (BOOL)isCancelled
{
  uint64_t v2 = [(EFPromise *)self->_promise future];
  char v3 = [v2 isCancelled];

  return v3;
}

- (BOOL)tryCancel
{
  [(NSConditionLock *)self->_stateLock lock];
  int64_t v3 = [(NSConditionLock *)self->_stateLock condition];
  if (v3)
  {
    [(NSConditionLock *)self->_stateLock unlock];
  }
  else
  {
    id v4 = [(EFPromise *)self->_promise future];
    [v4 cancel];

    id block = self->_block;
    self->_id block = 0;

    [(NSConditionLock *)self->_stateLock unlockWithCondition:2];
  }
  return v3 == 0;
}

- (void)addSuccessBlock:(id)a3
{
  id v5 = a3;
  id v4 = +[EFScheduler immediateScheduler];
  [(EFLazyFuture *)self onScheduler:v4 addSuccessBlock:v5];
}

- (void)onScheduler:(id)a3 addSuccessBlock:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(EFLazyFuture *)self run];
  id v7 = [(EFPromise *)self->_promise future];
  [v7 onScheduler:v8 addSuccessBlock:v6];
}

- (void)addFailureBlock:(id)a3
{
  id v5 = a3;
  id v4 = +[EFScheduler immediateScheduler];
  [(EFLazyFuture *)self onScheduler:v4 addFailureBlock:v5];
}

- (void)onScheduler:(id)a3 addFailureBlock:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(EFLazyFuture *)self run];
  id v7 = [(EFPromise *)self->_promise future];
  [v7 onScheduler:v8 addFailureBlock:v6];
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(EFLazyFuture *)self run];
  id v7 = [(EFPromise *)self->_promise future];
  id v8 = [v7 resultBeforeDate:v6 error:a4];

  return v8;
}

- (id)resultIfAvailable:(id *)a3
{
  id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v6 = [(EFLazyFuture *)self resultBeforeDate:v5 error:a3];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end