@interface EFFuture
+ (id)_join:(id)a3 ignoreFailures:(BOOL)a4;
+ (id)_recover:(id)a3 withBlock:(id)a4 scheduler:(id)a5;
+ (id)_then:(id)a3 withBlock:(id)a4 scheduler:(id)a5;
+ (id)chain:(id)a3;
+ (id)combine:(id)a3;
+ (id)futureWithBlock:(id)a3;
+ (id)futureWithError:(id)a3;
+ (id)futureWithResult:(id)a3;
+ (id)join:(id)a3;
+ (id)lazyFutureWithBlock:(id)a3;
+ (id)nullFuture;
+ (id)onScheduler:(id)a3 futureWithBlock:(id)a4;
+ (id)onScheduler:(id)a3 lazyFutureWithBlock:(id)a4;
+ (id)sequence:(id)a3;
+ (void)_always:(id)a3 withBlock:(id)a4 scheduler:(id)a5;
- (BOOL)_nts_isFinished;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)tryCancel;
- (EFFuture)init;
- (EFFutureDelegate)delegate;
- (EFObserver)firstResultObserverAdapter;
- (EFObserver)resultsObserverAdapter;
- (id)BOOLErrorCompletionHandlerAdapter;
- (id)completionHandlerAdapter;
- (id)errorOnlyCompletionHandlerAdapter;
- (id)map:(id)a3;
- (id)onScheduler:(id)a3 map:(id)a4;
- (id)onScheduler:(id)a3 recover:(id)a4;
- (id)onScheduler:(id)a3 then:(id)a4;
- (id)recover:(id)a3;
- (id)result;
- (id)result:(id *)a3;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (id)resultIfAvailable;
- (id)resultIfAvailable:(id *)a3;
- (id)resultWithTimeout:(double)a3 error:(id *)a4;
- (id)then:(id)a3;
- (void)_addCompletionBlock:(id)a3;
- (void)_finishWithFuture:(id)a3;
- (void)_flushCompletionBlocks;
- (void)addFailureBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)always:(id)a3;
- (void)onScheduler:(id)a3 addFailureBlock:(id)a4;
- (void)onScheduler:(id)a3 addSuccessBlock:(id)a4;
- (void)onScheduler:(id)a3 always:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EFFuture

- (id)resultIfAvailable
{
  return [(EFFuture *)self resultIfAvailable:0];
}

void __33__EFFuture__join_ignoreFailures___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__EFFuture__join_ignoreFailures___block_invoke_2;
  v10[3] = &unk_1E6122040;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  uint64_t v14 = a3;
  id v13 = *(id *)(a1 + 32);
  [v5 addSuccessBlock:v10];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__EFFuture__join_ignoreFailures___block_invoke_3;
  v6[3] = &unk_1E6122068;
  char v9 = *(unsigned char *)(a1 + 64);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 32);
  [v5 addFailureBlock:v6];
}

- (void)addFailureBlock:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __28__EFFuture_addFailureBlock___block_invoke;
  aBlock[3] = &unk_1E6122180;
  id v8 = v4;
  id v5 = v4;
  v6 = _Block_copy(aBlock);
  [(EFFuture *)self _addCompletionBlock:v6];
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __28__EFFuture_addSuccessBlock___block_invoke;
  aBlock[3] = &unk_1E6122180;
  id v8 = v4;
  id v5 = v4;
  v6 = _Block_copy(aBlock);
  [(EFFuture *)self _addCompletionBlock:v6];
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(NSConditionLock *)self->_stateLock lock];
  BOOL v9 = [(EFFuture *)self _nts_isFinished];
  if (v9)
  {
    [(NSConditionLock *)self->_stateLock unlock];
  }
  else
  {
    objc_storeStrong(&self->_result, a3);
    v10 = (NSError *)[v8 copy];
    error = self->_error;
    self->_error = v10;

    [(NSConditionLock *)self->_stateLock unlockWithCondition:1];
    [(EFFuture *)self _flushCompletionBlocks];
  }

  return !v9;
}

- (void)_addCompletionBlock:(id)a3
{
  id aBlock = a3;
  [(NSConditionLock *)self->_stateLock lock];
  BOOL v4 = [(EFFuture *)self _nts_isFinished];
  if (!v4)
  {
    completionBlocks = self->_completionBlocks;
    v6 = _Block_copy(aBlock);
    [(NSMutableArray *)completionBlocks addObject:v6];
  }
  [(NSConditionLock *)self->_stateLock unlock];
  if (v4) {
    (*((void (**)(id, id, NSError *))aBlock + 2))(aBlock, self->_result, self->_error);
  }
}

- (BOOL)_nts_isFinished
{
  return [(NSConditionLock *)self->_stateLock condition] == 1;
}

- (void)_flushCompletionBlocks
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NSConditionLock *)self->_stateLock lock];
  v3 = (void *)[(NSMutableArray *)self->_completionBlocks copy];
  [(NSMutableArray *)self->_completionBlocks removeAllObjects];
  [(NSConditionLock *)self->_stateLock unlock];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __28__EFFuture_addSuccessBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (id)futureWithResult:(id)a3
{
  id v3 = a3;
  id v4 = +[EFPromise promise];
  [v4 finishWithResult:v3];
  uint64_t v5 = [v4 future];

  return v5;
}

- (EFFuture)init
{
  v8.receiver = self;
  v8.super_class = (Class)EFFuture;
  v2 = [(EFFuture *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v3;

    [(NSConditionLock *)v2->_stateLock setName:@"EFFuture state lock"];
    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v5;
  }
  return v2;
}

- (BOOL)finishWithResult:(id)a3
{
  return [(EFFuture *)self finishWithResult:a3 error:0];
}

void __28__EFFuture_addFailureBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (!v6) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __40__EFFuture_onScheduler_addSuccessBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__EFFuture_onScheduler_addSuccessBlock___block_invoke_2;
  v7[3] = &unk_1E6121F50;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performBlock:v7];
}

+ (id)join:(id)a3
{
  id v3 = [a1 _join:a3 ignoreFailures:0];
  return v3;
}

+ (id)_join:(id)a3 ignoreFailures:(BOOL)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = +[EFPromise promise];
    uint64_t v7 = [v5 count];
    id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
    if (v7)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        long long v10 = [MEMORY[0x1E4F1CA98] null];
        [v8 setObject:v10 atIndexedSubscript:i];
      }
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    dispatch_group_t v12 = dispatch_group_create();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __33__EFFuture__join_ignoreFailures___block_invoke;
    v30[3] = &unk_1E6122090;
    uint64_t v13 = v12;
    v31 = v13;
    id v14 = v11;
    id v32 = v14;
    id v15 = v8;
    id v33 = v15;
    BOOL v35 = a4;
    id v16 = v6;
    id v34 = v16;
    [v5 enumerateObjectsUsingBlock:v30];
    v17 = dispatch_get_global_queue(21, 0);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __33__EFFuture__join_ignoreFailures___block_invoke_4;
    v26 = &unk_1E61220B8;
    id v18 = v14;
    id v27 = v18;
    id v19 = v16;
    id v28 = v19;
    id v20 = v15;
    id v29 = v20;
    dispatch_group_notify(v13, v17, &v23);

    v21 = objc_msgSend(v19, "future", v23, v24, v25, v26);
  }
  else
  {
    v21 = +[EFFuture futureWithResult:MEMORY[0x1E4F1CBF0]];
  }

  return v21;
}

uint64_t __40__EFFuture_onScheduler_addSuccessBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __33__EFFuture__join_ignoreFailures___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 40) setObject:v3 atIndexedSubscript:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __30__EFFuture__finishWithFuture___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

void __38__EFFuture__then_withBlock_scheduler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_finishWithFuture:");
}

- (void)_finishWithFuture:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__EFFuture__finishWithFuture___block_invoke;
  v6[3] = &unk_1E6121C08;
  void v6[4] = self;
  [v4 addSuccessBlock:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__EFFuture__finishWithFuture___block_invoke_2;
  v5[3] = &unk_1E6121B68;
  v5[4] = self;
  [v4 addFailureBlock:v5];
}

id __28__EFFuture_onScheduler_map___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = v1;
  if (!v1)
  {
    id v2 = [MEMORY[0x1E4F1CA98] null];
  }
  id v3 = +[EFFuture futureWithResult:v2];
  if (!v1) {

  }
  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
  uint64_t v7 = [(EFFuture *)self resultBeforeDate:v6 error:a4];

  return v7;
}

- (id)result:(id *)a3
{
  id v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v6 = [(EFFuture *)self resultBeforeDate:v5 error:a3];

  return v6;
}

- (id)resultIfAvailable:(id *)a3
{
  id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v6 = [(EFFuture *)self resultBeforeDate:v5 error:a3];

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [MEMORY[0x1E4F29060] isMainThread];
  if (v7)
  {
    id v8 = [(EFFuture *)self delegate];
    [v8 didStartBlockingMainThreadForFuture:self];
  }
  if ([(NSConditionLock *)self->_stateLock lockWhenCondition:1 beforeDate:v6])
  {
    id v9 = self->_result;
    long long v10 = self->_error;
    [(NSConditionLock *)self->_stateLock unlock];
    if (v7)
    {
      id v11 = [(EFFuture *)self delegate];
      [v11 didFinishBlockingMainThreadForFuture:self];
    }
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    if (v7)
    {
      dispatch_group_t v12 = [(EFFuture *)self delegate];
      [v12 didFinishBlockingMainThreadForFuture:self];
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ef_timeoutError");
      id v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (EFFutureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (EFFutureDelegate *)WeakRetained;
}

void __40__EFFuture_onScheduler_futureWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = 0;
  id v3 = (*(void (**)(void))(v2 + 16))();
  id v4 = v5;
  [*(id *)(a1 + 32) finishWithResult:v3 error:v4];
}

- (id)onScheduler:(id)a3 map:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__EFFuture_onScheduler_map___block_invoke;
  v10[3] = &unk_1E61221F8;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(EFFuture *)self onScheduler:a3 then:v10];

  return v8;
}

- (id)then:(id)a3
{
  id v4 = a3;
  id v5 = +[EFScheduler immediateScheduler];
  id v6 = [(EFFuture *)self onScheduler:v5 then:v4];

  return v6;
}

- (id)onScheduler:(id)a3 then:(id)a4
{
  id v4 = +[EFFuture _then:self withBlock:a4 scheduler:a3];
  return v4;
}

+ (id)_then:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = +[EFPromise promise];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __38__EFFuture__then_withBlock_scheduler___block_invoke;
  v18[3] = &unk_1E6121FA0;
  id v11 = v8;
  id v20 = v11;
  id v12 = v10;
  id v19 = v12;
  [v7 onScheduler:v9 addSuccessBlock:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __38__EFFuture__then_withBlock_scheduler___block_invoke_2;
  v16[3] = &unk_1E6121B68;
  id v13 = v12;
  id v17 = v13;
  [v7 onScheduler:v9 addFailureBlock:v16];
  id v14 = [v13 future];

  return v14;
}

- (void)onScheduler:(id)a3 addSuccessBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__EFFuture_onScheduler_addSuccessBlock___block_invoke;
  v10[3] = &unk_1E61221A8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(EFFuture *)self addSuccessBlock:v10];
}

- (void)onScheduler:(id)a3 addFailureBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__EFFuture_onScheduler_addFailureBlock___block_invoke;
  v10[3] = &unk_1E61221D0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(EFFuture *)self addFailureBlock:v10];
}

uint64_t __36__EFFuture_completionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

+ (id)nullFuture
{
  id v3 = [MEMORY[0x1E4F1CA98] null];
  id v4 = [a1 futureWithResult:v3];

  return v4;
}

- (BOOL)tryCancel
{
  id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_cancelledError");
  BOOL v4 = [(EFFuture *)self finishWithResult:0 error:v3];

  if (v4) {
    [(EFFuture *)self didCancel];
  }
  return v4;
}

- (BOOL)isFinished
{
  [(NSConditionLock *)self->_stateLock lock];
  BOOL v3 = [(EFFuture *)self _nts_isFinished];
  [(NSConditionLock *)self->_stateLock unlock];
  return v3;
}

- (id)completionHandlerAdapter
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__EFFuture_completionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E6122130;
  void aBlock[4] = self;
  uint64_t v2 = _Block_copy(aBlock);
  BOOL v3 = _Block_copy(v2);

  return v3;
}

+ (id)onScheduler:(id)a3 futureWithBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[EFPromise promise];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __40__EFFuture_onScheduler_futureWithBlock___block_invoke;
  id v15 = &unk_1E6121F50;
  id v8 = v6;
  id v17 = v8;
  id v9 = v7;
  id v16 = v9;
  [v5 performBlock:&v12];
  long long v10 = objc_msgSend(v9, "future", v12, v13, v14, v15);

  return v10;
}

void __45__EFFuture_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  id v6 = v3;
  if (v3)
  {
    [v4 finishWithError:v3];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [v4 finishWithResult:v5];
  }
}

uint64_t __41__EFFuture__recover_withBlock_scheduler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t __33__EFFuture__join_ignoreFailures___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 40) finishWithResult:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 unlock];
}

- (id)onScheduler:(id)a3 recover:(id)a4
{
  BOOL v4 = +[EFFuture _recover:self withBlock:a4 scheduler:a3];
  return v4;
}

- (id)errorOnlyCompletionHandlerAdapter
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__EFFuture_errorOnlyCompletionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E6121B68;
  void aBlock[4] = self;
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = _Block_copy(v2);

  return v3;
}

+ (id)_recover:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v10 = +[EFPromise promise];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__EFFuture__recover_withBlock_scheduler___block_invoke;
  v19[3] = &unk_1E6121C08;
  id v11 = v10;
  id v20 = v11;
  [v7 onScheduler:v9 addSuccessBlock:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__EFFuture__recover_withBlock_scheduler___block_invoke_2;
  v16[3] = &unk_1E6121FC8;
  id v12 = v8;
  id v18 = v12;
  id v13 = v11;
  id v17 = v13;
  [v7 onScheduler:v9 addFailureBlock:v16];
  id v14 = [v13 future];

  return v14;
}

+ (id)futureWithError:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[EFPromise promise];
  [v4 finishWithError:v3];
  id v5 = [v4 future];

  return v5;
}

+ (id)futureWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[EFScheduler globalAsyncScheduler];
  id v6 = [a1 onScheduler:v5 futureWithBlock:v4];

  return v6;
}

+ (id)lazyFutureWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[EFScheduler immediateScheduler];
  id v6 = [a1 onScheduler:v5 lazyFutureWithBlock:v4];

  return v6;
}

+ (id)onScheduler:(id)a3 lazyFutureWithBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[EFLazyFuture alloc] initWithScheduler:v5 block:v6];

  return v7;
}

+ (void)_always:(id)a3 withBlock:(id)a4 scheduler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__EFFuture__always_withBlock_scheduler___block_invoke;
  v14[3] = &unk_1E6121BE0;
  id v10 = v8;
  id v15 = v10;
  [v7 onScheduler:v9 addSuccessBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__EFFuture__always_withBlock_scheduler___block_invoke_2;
  v12[3] = &unk_1E6121F78;
  id v11 = v10;
  id v13 = v11;
  [v7 onScheduler:v9 addFailureBlock:v12];
}

uint64_t __40__EFFuture__always_withBlock_scheduler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __40__EFFuture__always_withBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __38__EFFuture__then_withBlock_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __41__EFFuture__recover_withBlock_scheduler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_finishWithFuture:");
}

+ (id)chain:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  if ([v4 count] == 1)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = objc_msgSend(v4, "ef_tail");
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __18__EFFuture_chain___block_invoke;
    v16[3] = &unk_1E6121FF0;
    id v18 = a1;
    id v8 = v7;
    id v17 = v8;
    id v9 = [v5 then:v16];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __18__EFFuture_chain___block_invoke_2;
    v13[3] = &unk_1E6122018;
    id v15 = a1;
    id v10 = v8;
    id v14 = v10;
    id v11 = [v9 recover:v13];

    id v6 = v11;
  }

  return v6;
}

id __18__EFFuture_chain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  id v5 = *(void **)(a1 + 40);
  if (v4 == v3) {
    [v5 chain:*(void *)(a1 + 32)];
  }
  else {
  id v6 = [v5 futureWithResult:v3];
  }

  return v6;
}

id __18__EFFuture_chain___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) chain:*(void *)(a1 + 32)];
  return v1;
}

+ (id)combine:(id)a3
{
  id v3 = [a1 _join:a3 ignoreFailures:1];
  return v3;
}

void __33__EFFuture__join_ignoreFailures___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) finishWithError:v3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)sequence:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  if ([v14 count])
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    id v4 = [v14 firstObject];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = objc_msgSend(v14, "ef_tail");
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v21;
      do
      {
        uint64_t v8 = 0;
        id v9 = v4;
        do
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v8);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __21__EFFuture_sequence___block_invoke;
          v17[3] = &unk_1E61220E0;
          id v18 = v3;
          uint64_t v19 = v10;
          id v4 = [v9 then:v17];

          ++v8;
          id v9 = v4;
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __21__EFFuture_sequence___block_invoke_2;
    v15[3] = &unk_1E6122108;
    id v11 = v3;
    id v16 = v11;
    id v12 = [v4 then:v15];
  }
  else
  {
    id v12 = +[EFFuture futureWithResult:MEMORY[0x1E4F1CBF0]];
  }

  return v12;
}

id __21__EFFuture_sequence___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  id v3 = *(void **)(a1 + 40);
  return v3;
}

id __21__EFFuture_sequence___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) addObject:v3];
  id v4 = +[EFFuture futureWithResult:*(void *)(a1 + 32)];

  return v4;
}

- (id)result
{
  return [(EFFuture *)self result:0];
}

- (BOOL)isCancelled
{
  [(NSConditionLock *)self->_stateLock lock];
  if ([(EFFuture *)self _nts_isFinished]) {
    BOOL v3 = [(NSError *)self->_error ef_isCancelledError];
  }
  else {
    BOOL v3 = 0;
  }
  [(NSConditionLock *)self->_stateLock unlock];
  return v3;
}

uint64_t __30__EFFuture__finishWithFuture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (BOOL)finishWithError:(id)a3
{
  return [(EFFuture *)self finishWithResult:0 error:a3];
}

- (id)BOOLErrorCompletionHandlerAdapter
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__EFFuture_BOOLErrorCompletionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E6122158;
  void aBlock[4] = self;
  id v2 = _Block_copy(aBlock);
  BOOL v3 = _Block_copy(v2);

  return v3;
}

void __45__EFFuture_BOOLErrorCompletionHandlerAdapter__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v8 = v5;
  if (a2)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    [v6 finishWithResult:v7];
  }
  else
  {
    [v6 finishWithError:v5];
  }
}

- (EFObserver)firstResultObserverAdapter
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__EFFuture_firstResultObserverAdapter__block_invoke;
  v6[3] = &unk_1E6121C08;
  void v6[4] = self;
  v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__EFFuture_firstResultObserverAdapter__block_invoke_2;
  v5[3] = &unk_1E6121B40;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__EFFuture_firstResultObserverAdapter__block_invoke_3;
  v4[3] = &unk_1E6121B68;
  id v2 = +[EFObserver observerWithResultBlock:v6 completionBlock:v5 failureBlock:v4];
  return (EFObserver *)v2;
}

uint64_t __38__EFFuture_firstResultObserverAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

void __38__EFFuture_firstResultObserverAdapter__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CA98] null];
  objc_msgSend(v1, "finishWithResult:");
}

uint64_t __38__EFFuture_firstResultObserverAdapter__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (EFObserver)resultsObserverAdapter
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__EFFuture_resultsObserverAdapter__block_invoke;
  v10[3] = &unk_1E6121C08;
  id v11 = v3;
  void v7[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__EFFuture_resultsObserverAdapter__block_invoke_2;
  v8[3] = &unk_1E6121B90;
  v8[4] = self;
  id v9 = v11;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__EFFuture_resultsObserverAdapter__block_invoke_3;
  v7[3] = &unk_1E6121B68;
  id v4 = v11;
  id v5 = +[EFObserver observerWithResultBlock:v10 completionBlock:v8 failureBlock:v7];

  return (EFObserver *)v5;
}

uint64_t __34__EFFuture_resultsObserverAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __34__EFFuture_resultsObserverAdapter__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

uint64_t __34__EFFuture_resultsObserverAdapter__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __40__EFFuture_onScheduler_addFailureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__EFFuture_onScheduler_addFailureBlock___block_invoke_2;
  v7[3] = &unk_1E6121F50;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performBlock:v7];
}

uint64_t __40__EFFuture_onScheduler_addFailureBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)always:(id)a3
{
  id v5 = a3;
  id v4 = +[EFScheduler immediateScheduler];
  [(EFFuture *)self onScheduler:v4 always:v5];
}

- (void)onScheduler:(id)a3 always:(id)a4
{
}

- (id)recover:(id)a3
{
  id v4 = a3;
  id v5 = +[EFScheduler immediateScheduler];
  id v6 = [(EFFuture *)self onScheduler:v5 recover:v4];

  return v6;
}

- (id)map:(id)a3
{
  id v4 = a3;
  id v5 = +[EFScheduler immediateScheduler];
  id v6 = [(EFFuture *)self onScheduler:v5 map:v4];

  return v6;
}

@end