@interface CNFutureTask
- (BOOL)cancel;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)nts_isFinished;
- (BOOL)run;
- (CNFutureTask)init;
- (CNFutureTask)initWithTask:(id)a3;
- (id)completionHandlerAdapterWithDefaultValue:(id)a3;
- (id)flatMap:(id)a3;
- (id)futureResult;
- (id)recover:(id)a3;
- (id)result:(id *)a3;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (id)resultWithTimeout:(double)a3 error:(id *)a4;
- (void)_flushCompletionBlocks;
- (void)addFailureBlock:(id)a3;
- (void)addFailureBlock:(id)a3 scheduler:(id)a4;
- (void)addSuccessBlock:(id)a3;
- (void)addSuccessBlock:(id)a3 scheduler:(id)a4;
@end

@implementation CNFutureTask

- (CNFutureTask)init
{
  return [(CNFutureTask *)self initWithTask:0];
}

- (CNFutureTask)initWithTask:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNFutureTask;
  v6 = [(CNFutureTask *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_task, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    stateLock = v7->_stateLock;
    v7->_stateLock = (NSConditionLock *)v8;

    [(NSConditionLock *)v7->_stateLock setName:@"ABFuture state lock"];
    v10 = objc_alloc_init(CNFutureCompletionBlocks);
    completionBlocks = v7->_completionBlocks;
    v7->_completionBlocks = v10;

    v12 = objc_alloc_init(CNFutureResult);
    futureResult = v7->_futureResult;
    v7->_futureResult = v12;

    v14 = v7;
  }

  return v7;
}

- (id)result:(id *)a3
{
  id v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v6 = [(CNFutureTask *)self resultBeforeDate:v5 error:a3];

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  if ([(NSConditionLock *)self->_stateLock lockWhenCondition:2 beforeDate:a3])
  {
    v6 = (void *)[(CNFutureResult *)self->_futureResult copy];
    [(NSConditionLock *)self->_stateLock unlock];
    v7 = [v6 result];
    uint64_t v8 = [v6 error];
    v9 = +[CNFoundationError ifResultIsNil:v7 setOutputError:a4 toError:v8];
  }
  else
  {
    v10 = +[CNFoundationError timeoutError];
    v6 = v10;
    v9 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v9;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
  v7 = [(CNFutureTask *)self resultBeforeDate:v6 error:a4];

  return v7;
}

- (BOOL)isFinished
{
  [(NSConditionLock *)self->_stateLock lock];
  BOOL v3 = [(CNFutureTask *)self nts_isFinished];
  [(NSConditionLock *)self->_stateLock unlock];
  return v3;
}

- (BOOL)isCancelled
{
  [(NSConditionLock *)self->_stateLock lock];
  if ([(CNFutureTask *)self nts_isFinished])
  {
    BOOL v3 = [(CNFutureResult *)self->_futureResult error];
    BOOL v4 = +[CNFoundationError isCanceledError:v3];
  }
  else
  {
    BOOL v4 = 0;
  }
  [(NSConditionLock *)self->_stateLock unlock];
  return v4;
}

- (BOOL)nts_isFinished
{
  return [(NSConditionLock *)self->_stateLock condition] == 2;
}

- (BOOL)cancel
{
  [(NSConditionLock *)self->_stateLock lock];
  NSInteger v3 = [(NSConditionLock *)self->_stateLock condition];
  if (v3 == 2)
  {
    [(NSConditionLock *)self->_stateLock unlock];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    [(CNFutureResult *)self->_futureResult setError:v4];

    [(CNFutureCompletionBlocks *)self->_completionBlocks setShouldCallImmediately:1];
    task = self->_task;
    self->_task = 0;
    v6 = task;

    [(NSConditionLock *)self->_stateLock unlockWithCondition:2];
    [(CNTask *)v6 cancel];

    [(CNFutureTask *)self _flushCompletionBlocks];
    [(CNFutureTask *)self didCancel];
  }
  return v3 != 2;
}

- (BOOL)run
{
  [(NSConditionLock *)self->_stateLock lock];
  NSInteger v3 = [(NSConditionLock *)self->_stateLock condition];
  if (v3)
  {
    [(NSConditionLock *)self->_stateLock unlock];
  }
  else
  {
    stateLock = self->_stateLock;
    id v5 = self->_task;
    [(NSConditionLock *)stateLock unlockWithCondition:1];
    id v9 = 0;
    v6 = [(CNTask *)v5 run:&v9];
    id v7 = v9;
    [(CNFutureTask *)self finishWithResult:v6 error:v7];
  }
  return v3 == 0;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSConditionLock *)self->_stateLock lock];
  NSInteger v8 = [(NSConditionLock *)self->_stateLock condition];
  if (v8 == 2)
  {
    [(NSConditionLock *)self->_stateLock unlock];
  }
  else
  {
    [(CNFutureResult *)self->_futureResult setResult:v6 error:v7];
    [(CNFutureCompletionBlocks *)self->_completionBlocks setShouldCallImmediately:1];
    task = self->_task;
    self->_task = 0;

    [(NSConditionLock *)self->_stateLock unlockWithCondition:2];
    [(CNFutureTask *)self _flushCompletionBlocks];
  }

  return v8 != 2;
}

- (BOOL)finishWithResult:(id)a3
{
  return [(CNFutureTask *)self finishWithResult:a3 error:0];
}

- (BOOL)finishWithError:(id)a3
{
  return [(CNFutureTask *)self finishWithResult:0 error:a3];
}

- (id)completionHandlerAdapterWithDefaultValue:(id)a3
{
  return CNPromiseCompletionHandlerWithDefaultValue(self, a3);
}

- (void)addSuccessBlock:(id)a3
{
  completionBlocks = self->_completionBlocks;
  id v5 = a3;
  id v6 = [(CNFutureTask *)self futureResult];
  [(CNFutureCompletionBlocks *)completionBlocks addSuccessBlock:v5 orCallWithFutureResult:v6];
}

- (void)addSuccessBlock:(id)a3 scheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__CNFutureTask_addSuccessBlock_scheduler___block_invoke;
  v10[3] = &unk_1E56A0BC8;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(CNFutureTask *)self addSuccessBlock:v10];
}

void __42__CNFutureTask_addSuccessBlock_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CNFutureTask_addSuccessBlock_scheduler___block_invoke_2;
  v7[3] = &unk_1E569F468;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performBlock:v7];
}

uint64_t __42__CNFutureTask_addSuccessBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addFailureBlock:(id)a3
{
  completionBlocks = self->_completionBlocks;
  id v5 = a3;
  id v6 = [(CNFutureTask *)self futureResult];
  [(CNFutureCompletionBlocks *)completionBlocks addFailureBlock:v5 orCallWithFutureResult:v6];
}

- (void)addFailureBlock:(id)a3 scheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__CNFutureTask_addFailureBlock_scheduler___block_invoke;
  v10[3] = &unk_1E56A0B28;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(CNFutureTask *)self addFailureBlock:v10];
}

void __42__CNFutureTask_addFailureBlock_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CNFutureTask_addFailureBlock_scheduler___block_invoke_2;
  v7[3] = &unk_1E569F468;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performBlock:v7];
}

uint64_t __42__CNFutureTask_addFailureBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)futureResult
{
  [(NSConditionLock *)self->_stateLock lock];
  id v3 = (void *)[(CNFutureResult *)self->_futureResult copy];
  [(NSConditionLock *)self->_stateLock unlock];

  return v3;
}

- (void)_flushCompletionBlocks
{
  completionBlocks = self->_completionBlocks;
  id v3 = [(CNFutureTask *)self futureResult];
  [(CNFutureCompletionBlocks *)completionBlocks flushCompletionBlocksWithFutureResult:v3];
}

- (id)flatMap:(id)a3
{
  id v4 = a3;
  id v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = +[CNFuture flatMap:self withBlock:v4 schedulerProvider:v5];

  return v6;
}

- (id)recover:(id)a3
{
  id v4 = a3;
  id v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = +[CNFuture recover:self withBlock:v4 schedulerProvider:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_futureResult, 0);

  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end