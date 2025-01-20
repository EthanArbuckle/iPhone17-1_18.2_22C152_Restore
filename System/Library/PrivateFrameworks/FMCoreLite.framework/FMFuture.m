@interface FMFuture
+ (id)_chainFuturesWithFutureStack:(id)a3;
+ (id)_descriptorForChainOperation:(id)a3 onFuture:(id)a4 withBlock:(id)a5;
+ (id)chainFutures:(id)a3;
+ (id)combineAllFutures:(id)a3;
+ (id)combineAllFutures:(id)a3 ignoringErrors:(BOOL)a4 scheduler:(id)a5;
+ (id)combineAllFutures:(id)a3 scheduler:(id)a4;
+ (id)futureWithBlock:(id)a3;
+ (id)futureWithBlock:(id)a3 scheduler:(id)a4;
+ (id)futureWithCompletionHandlerAdapterBlock:(id)a3;
+ (id)futureWithError:(id)a3;
+ (id)futureWithErrorOnlyHandlerAdapterBlock:(id)a3;
+ (id)futureWithNoResult;
+ (id)futureWithResult:(id)a3;
+ (id)lazyFutureWithBlock:(id)a3;
+ (id)lazyFutureWithBlock:(id)a3 scheduler:(id)a4;
- (BOOL)_queue_isCancelled;
- (BOOL)cancel;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithNoResult;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (FMFuture)init;
- (NSString)description;
- (NSString)descriptor;
- (id)addCompletionBlock:(id)a3;
- (id)addFailureBlock:(id)a3;
- (id)addSuccessBlock:(id)a3;
- (id)completionHandlerAdapter;
- (id)errorOnlyCompletionHandlerAdapter;
- (id)flatMap:(id)a3;
- (id)recover:(id)a3;
- (id)recoverIgnoringError;
- (id)reschedule:(id)a3;
- (void)_flushCompletionBlocks;
- (void)setDescriptor:(id)a3;
@end

@implementation FMFuture

- (BOOL)finishWithError:(id)a3
{
  return [(FMFuture *)self finishWithResult:0 error:a3];
}

- (BOOL)finishWithResult:(id)a3
{
  return [(FMFuture *)self finishWithResult:a3 error:0];
}

void __35__FMFuture_finishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 16))
  {
    objc_storeStrong((id *)(v1 + 32), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 48));
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __34__FMFuture__flushCompletionBlocks__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 32));
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 40));
  uint64_t v2 = [*(id *)(a1[4] + 24) copy];
  uint64_t v3 = *(void *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[4];
  v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong(&self->_resultValue, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __31__FMFuture_addCompletionBlock___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 16);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
    if (!v2)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void **)(v4 + 24);
      *(void *)(v4 + 24) = v3;

      uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
    }
    id v6 = (id)[*(id *)(a1 + 40) copy];
    [v2 addObject:v6];
  }
}

- (FMFuture)init
{
  v9.receiver = self;
  v9.super_class = (Class)FMFuture;
  uint64_t v2 = [(FMFuture *)&v9 init];
  if (v2)
  {
    id v3 = _FMScopedDescriptor();
    uint64_t v4 = [v3 copy];
    descriptor = v2->_descriptor;
    v2->_descriptor = (NSString *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.FMFutureAccessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (id)addSuccessBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__FMFuture_addSuccessBlock___block_invoke;
  v8[3] = &unk_1E60196E8;
  id v9 = v4;
  id v5 = v4;
  dispatch_queue_t v6 = [(FMFuture *)self addCompletionBlock:v8];

  return v6;
}

- (id)addCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v9 = __31__FMFuture_addCompletionBlock___block_invoke;
  v10 = &unk_1E6019710;
  v13 = &v26;
  v14 = &v20;
  v11 = self;
  v15 = &v16;
  id v6 = v4;
  id v12 = v6;
  if (accessQueue) {
    dispatch_sync(accessQueue, block);
  }
  else {
    v9((uint64_t)block);
  }
  if (*((unsigned char *)v17 + 24))
  {
    _FMFutureWillPerformCallback(self);
    (*((void (**)(id, uint64_t, uint64_t))v6 + 2))(v6, v27[5], v21[5]);
    _FMFutureDidPerformCallback(self);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return self;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  accessQueue = self->_accessQueue;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __35__FMFuture_finishWithResult_error___block_invoke;
  uint64_t v16 = &unk_1E6019670;
  v17 = self;
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  uint64_t v20 = &v21;
  if (accessQueue) {
    dispatch_sync(accessQueue, &v13);
  }
  else {
    v15((uint64_t)&v13);
  }
  [(FMFuture *)self _flushCompletionBlocks];
  char v11 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (void)_flushCompletionBlocks
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  _FMFutureWillPerformCallback(self);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__2;
  v21[4] = __Block_byref_object_dispose__2;
  id v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__2;
  v19[4] = __Block_byref_object_dispose__2;
  id v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __34__FMFuture__flushCompletionBlocks__block_invoke;
  block[3] = &unk_1E6019738;
  block[4] = self;
  block[5] = v21;
  block[6] = v19;
  block[7] = &v13;
  if (accessQueue) {
    dispatch_sync(accessQueue, block);
  }
  else {
    __34__FMFuture__flushCompletionBlocks__block_invoke(block);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v14[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v23 count:16];
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
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v23 count:16];
    }
    while (v5);
  }

  _FMFutureDidPerformCallback(self);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

uint64_t __28__FMFuture_addSuccessBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (BOOL)isFinished
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  BOOL v10 = 0;
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __22__FMFuture_isFinished__block_invoke;
  v6[3] = &unk_1E60192D8;
  v6[4] = self;
  v6[5] = &v7;
  if (accessQueue)
  {
    dispatch_sync(accessQueue, v6);
    int finished = *((unsigned __int8 *)v8 + 24);
  }
  else
  {
    int finished = self->_finished;
    BOOL v10 = self->_finished;
  }
  BOOL v4 = finished != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __22__FMFuture_isFinished__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (BOOL)isCancelled
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  accessQueue = self->_accessQueue;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __23__FMFuture_isCancelled__block_invoke;
  long long v8 = &unk_1E60192D8;
  uint64_t v9 = self;
  BOOL v10 = &v11;
  if (accessQueue) {
    dispatch_sync(accessQueue, &v5);
  }
  else {
    *(unsigned char *)(v10[1] + 24) = [(FMFuture *)self _queue_isCancelled];
  }
  char v3 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v3;
}

uint64_t __23__FMFuture_isCancelled__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_isCancelled");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_isCancelled
{
  return self->_finished && [(NSError *)self->_resultError fm_isCancelledError];
}

- (BOOL)cancel
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  accessQueue = self->_accessQueue;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  long long v8 = __18__FMFuture_cancel__block_invoke;
  uint64_t v9 = &unk_1E6019580;
  BOOL v10 = self;
  uint64_t v11 = &v12;
  if (accessQueue) {
    dispatch_sync(accessQueue, &v6);
  }
  else {
    __18__FMFuture_cancel__block_invoke((uint64_t)&v6);
  }
  if (*((unsigned char *)v13 + 24))
  {
    [(FMFuture *)self _flushCompletionBlocks];
    [(FMFuture *)self didCancel];
    BOOL v4 = *((unsigned char *)v13 + 24) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  _Block_object_dispose(&v12, 8);
  return v4;
}

void __18__FMFuture_cancel__block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)finishWithNoResult
{
  uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  LOBYTE(self) = [(FMFuture *)self finishWithResult:v3];

  return (char)self;
}

- (id)completionHandlerAdapter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__FMFuture_completionHandlerAdapter__block_invoke;
  v4[3] = &unk_1E6019698;
  v4[4] = self;
  uint64_t v2 = (void *)MEMORY[0x1B3EB3F00](v4, a2);
  return v2;
}

uint64_t __36__FMFuture_completionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

- (id)errorOnlyCompletionHandlerAdapter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__FMFuture_errorOnlyCompletionHandlerAdapter__block_invoke;
  v4[3] = &unk_1E60196C0;
  v4[4] = self;
  uint64_t v2 = (void *)MEMORY[0x1B3EB3F00](v4, a2);
  return v2;
}

void __45__FMFuture_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 finishWithError:a2];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    [v2 finishWithResult:v4];
  }
}

- (id)addFailureBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__FMFuture_addFailureBlock___block_invoke;
  v8[3] = &unk_1E60196E8;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(FMFuture *)self addCompletionBlock:v8];

  return v6;
}

uint64_t __28__FMFuture_addFailureBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)flatMap:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v6 = (void *)MEMORY[0x1B3EB3F00](v4);
  uint64_t v7 = [v5 _descriptorForChainOperation:@"flatMap" onFuture:self withBlock:v6];

  long long v8 = objc_alloc_init(FMPromise);
  [(FMPromise *)v8 setDescriptor:v7];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __20__FMFuture_flatMap___block_invoke;
  v22[3] = &unk_1E6019760;
  id v23 = v7;
  id v25 = v4;
  id v9 = v8;
  uint64_t v24 = v9;
  id v10 = v4;
  id v11 = v7;
  id v12 = [(FMFuture *)self addSuccessBlock:v22];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __20__FMFuture_flatMap___block_invoke_2;
  id v20 = &unk_1E60196C0;
  uint64_t v21 = v9;
  uint64_t v13 = v9;
  id v14 = [(FMFuture *)self addFailureBlock:&v17];
  char v15 = [(FMPromise *)v13 future];

  return v15;
}

void __20__FMFuture_flatMap___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  _FMPushScopedDescriptor(v3);
  id v5 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  _FMPopScopedDescriptor();
  id v6 = *(id *)(a1 + 40);
  id v7 = v5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___FMFinishPromiseWithFuture_block_invoke;
  v14[3] = &unk_1E60197B0;
  id v8 = v6;
  id v15 = v8;
  id v9 = (id)[v7 addSuccessBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___FMFinishPromiseWithFuture_block_invoke_2;
  v12[3] = &unk_1E60196C0;
  id v13 = v8;
  id v10 = v8;
  id v11 = (id)[v7 addFailureBlock:v12];
}

uint64_t __20__FMFuture_flatMap___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)reschedule:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(FMPromise);
  id v6 = +[FMFuture _descriptorForChainOperation:@"reschedule" onFuture:self withBlock:0];
  [(FMPromise *)v5 setDescriptor:v6];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __23__FMFuture_reschedule___block_invoke;
  id v15 = &unk_1E6019788;
  id v16 = v4;
  uint64_t v17 = v5;
  id v7 = v5;
  id v8 = v4;
  id v9 = [(FMFuture *)self addCompletionBlock:&v12];
  id v10 = [(FMPromise *)v7 future];

  return v10;
}

void __23__FMFuture_reschedule___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __23__FMFuture_reschedule___block_invoke_2;
  v10[3] = &unk_1E60193C8;
  id v7 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 performBlock:v10];
}

uint64_t __23__FMFuture_reschedule___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (id)recover:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = (void *)MEMORY[0x1B3EB3F00](v4);
  id v7 = [v5 _descriptorForChainOperation:@"recover" onFuture:self withBlock:v6];

  id v8 = objc_alloc_init(FMPromise);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __20__FMFuture_recover___block_invoke;
  v24[3] = &unk_1E60197B0;
  id v9 = v8;
  id v25 = v9;
  id v10 = [(FMFuture *)self addSuccessBlock:v24];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __20__FMFuture_recover___block_invoke_2;
  id v20 = &unk_1E60197D8;
  id v22 = v9;
  id v23 = v4;
  id v21 = v7;
  id v11 = v9;
  id v12 = v4;
  id v13 = v7;
  id v14 = [(FMFuture *)self addFailureBlock:&v17];
  id v15 = [(FMPromise *)v11 future];

  return v15;
}

uint64_t __20__FMFuture_recover___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

void __20__FMFuture_recover___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  _FMPushScopedDescriptor(v3);
  id v5 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  _FMPopScopedDescriptor();
  id v6 = *(id *)(a1 + 40);
  id v7 = v5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = ___FMFinishPromiseWithFuture_block_invoke;
  v14[3] = &unk_1E60197B0;
  id v8 = v6;
  id v15 = v8;
  id v9 = (id)[v7 addSuccessBlock:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ___FMFinishPromiseWithFuture_block_invoke_2;
  v12[3] = &unk_1E60196C0;
  id v13 = v8;
  id v10 = v8;
  id v11 = (id)[v7 addFailureBlock:v12];
}

+ (id)_descriptorForChainOperation:(id)a3 onFuture:(id)a4 withBlock:(id)a5
{
  return 0;
}

- (NSString)description
{
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__2;
  v19[4] = __Block_byref_object_dispose__2;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__2;
  v17[4] = __Block_byref_object_dispose__2;
  id v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __23__FMFuture_description__block_invoke;
  block[3] = &unk_1E6019800;
  block[4] = self;
  block[5] = v19;
  block[6] = v17;
  block[7] = v15;
  void block[8] = v13;
  if (accessQueue) {
    dispatch_sync(accessQueue, block);
  }
  else {
    __23__FMFuture_description__block_invoke((uint64_t)block);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __23__FMFuture_description__block_invoke_2;
  v11[3] = &unk_1E6019828;
  v11[4] = v13;
  v11[5] = v15;
  v11[6] = v19;
  id v4 = __23__FMFuture_description__block_invoke_2(v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __23__FMFuture_description__block_invoke_3;
  v10[3] = &unk_1E6019850;
  void v10[4] = self;
  id v5 = __23__FMFuture_description__block_invoke_3((uint64_t)v10);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __23__FMFuture_description__block_invoke_4;
  v9[3] = &unk_1E6019878;
  v9[4] = v19;
  v9[5] = v17;
  id v6 = __23__FMFuture_description__block_invoke_4((uint64_t)v9);
  id v7 = [NSString stringWithFormat:@"<%@ %p (%@)%@%@>", objc_opt_class(), self, v4, v5, v6];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(v19, 8);
  return (NSString *)v7;
}

uint64_t __23__FMFuture_description__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 16);
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_isCancelled");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

__CFString *__23__FMFuture_description__block_invoke_2(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    uint64_t v1 = @"canceled";
  }
  else if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
      uint64_t v2 = @"succeeded";
    }
    else {
      uint64_t v2 = @"failed";
    }
    uint64_t v1 = v2;
  }
  else
  {
    uint64_t v1 = @"active";
  }
  return v1;
}

__CFString *__23__FMFuture_description__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) descriptor];

  if (v2)
  {
    uint64_t v3 = NSString;
    id v4 = [*(id *)(a1 + 32) descriptor];
    id v5 = [v3 stringWithFormat:@": \"%@\"", v4];
  }
  else
  {
    id v5 = &stru_1F0B11478;
  }
  return v5;
}

__CFString *__23__FMFuture_description__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    [NSString stringWithFormat:@", uint64_t result = %@", v1];
LABEL_5:
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    [NSString stringWithFormat:@", error = %@", v2];
    goto LABEL_5;
  }
  uint64_t v3 = &stru_1F0B11478;
LABEL_6:
  return v3;
}

- (NSString)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (id)recoverIgnoringError
{
  return [(FMFuture *)self recover:&__block_literal_global_3];
}

FMFuture *__48__FMFuture_FMConveniences__recoverIgnoringError__block_invoke()
{
  return +[FMFuture futureWithNoResult];
}

+ (id)futureWithResult:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(FMPromise);
  [(FMPromise *)v4 finishWithResult:v3];

  id v5 = [(FMPromise *)v4 future];

  return v5;
}

+ (id)futureWithError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(FMPromise);
  [(FMPromise *)v4 finishWithError:v3];

  id v5 = [(FMPromise *)v4 future];

  return v5;
}

+ (id)futureWithNoResult
{
  uint64_t v2 = [MEMORY[0x1E4F1CA98] null];
  id v3 = +[FMFuture futureWithResult:v2];

  return v3;
}

+ (id)futureWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[FMScheduler mainThreadScheduler];
  id v6 = [a1 futureWithBlock:v4 scheduler:v5];

  return v6;
}

+ (id)futureWithBlock:(id)a3 scheduler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(FMPromise);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  char v14 = __54__FMFuture_FMConveniences__futureWithBlock_scheduler___block_invoke;
  id v15 = &unk_1E60198C0;
  char v16 = v7;
  id v17 = v5;
  id v8 = v7;
  id v9 = v5;
  [v6 performBlock:&v12];

  id v10 = [(FMPromise *)v8 future];

  return v10;
}

uint64_t __54__FMFuture_FMConveniences__futureWithBlock_scheduler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)lazyFutureWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[FMScheduler mainThreadScheduler];
  id v6 = [a1 lazyFutureWithBlock:v4 scheduler:v5];

  return v6;
}

+ (id)lazyFutureWithBlock:(id)a3 scheduler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[_FMLazyFuture alloc] initWithBlock:v6 scheduler:v5];

  return v7;
}

+ (id)combineAllFutures:(id)a3
{
  id v4 = a3;
  id v5 = +[FMScheduler mainThreadScheduler];
  id v6 = [a1 combineAllFutures:v4 scheduler:v5];

  return v6;
}

+ (id)combineAllFutures:(id)a3 scheduler:(id)a4
{
  return (id)[a1 combineAllFutures:a3 ignoringErrors:0 scheduler:a4];
}

+ (id)combineAllFutures:(id)a3 ignoringErrors:(BOOL)a4 scheduler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 count])
  {
    id v9 = objc_alloc_init(FMFuture);
    size_t v10 = [v7 count];
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = v10;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v27 = 0;
    v27 = malloc_type_calloc(8uLL, v10, 0x924DD72CuLL);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke;
    v25[3] = &unk_1E60198E8;
    v25[4] = v26;
    v25[5] = v10;
    id v11 = (void *)MEMORY[0x1B3EB3F00](v25);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_2;
    v17[3] = &unk_1E6019938;
    BOOL v24 = a4;
    id v21 = v28;
    id v22 = v26;
    uint64_t v12 = v9;
    id v18 = v12;
    size_t v23 = v10;
    id v19 = v8;
    id v13 = v11;
    id v20 = v13;
    [v7 enumerateObjectsUsingBlock:v17];
    char v14 = v20;
    id v15 = v12;

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v28, 8);
  }
  else
  {
    id v15 = +[FMFuture futureWithResult:MEMORY[0x1E4F1CBF0]];
  }

  return v15;
}

void __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    unint64_t v2 = 0;
    do
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      id v4 = *(void **)(v3 + 8 * v2);
      *(void *)(v3 + 8 * v2) = 0;

      ++v2;
    }
    while (v2 < *(void *)(a1 + 40));
  }
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  free(v5);
}

void __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_3;
  v8[3] = &unk_1E6019910;
  char v15 = *(unsigned char *)(a1 + 80);
  long long v12 = *(_OWORD *)(a1 + 56);
  uint64_t v13 = a3;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 72);
  id v9 = v5;
  uint64_t v14 = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v7 = (id)[a2 addCompletionBlock:v8];
}

void __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v7;
  if (v7)
  {
    BOOL v9 = atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 24), 0xFFFFFFFFFFFFFFFFLL) == 1;
    id v10 = v7;
    goto LABEL_3;
  }
  if (*(unsigned char *)(a1 + 88))
  {
    id v10 = v6;
    BOOL v9 = atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 24), 0xFFFFFFFFFFFFFFFFLL) == 1;
    if (v10)
    {
LABEL_3:
      objc_storeStrong((id *)(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + 8 * *(void *)(a1 + 72)), v10);
      if (v9)
      {
        if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
        {
          uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) count:*(void *)(a1 + 80)];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_4;
          v21[3] = &unk_1E6019328;
          char v15 = *(void **)(a1 + 40);
          id v22 = *(id *)(a1 + 32);
          id v23 = v14;
          id v16 = v14;
          [v15 performBlock:v21];
        }
        goto LABEL_11;
      }
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v9 = atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 24), 0xFFFFFFFFFFFFFFFFLL) == 1;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_5;
  v18[3] = &unk_1E6019328;
  id v17 = *(void **)(a1 + 40);
  id v19 = *(id *)(a1 + 32);
  id v20 = v6;
  [v17 performBlock:v18];

  id v10 = 0;
  if (v9) {
LABEL_11:
  }
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v11, v12, v13);
LABEL_12:
}

uint64_t __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

uint64_t __71__FMFuture_FMConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithError:*(void *)(a1 + 40)];
}

+ (id)chainFutures:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (void *)MEMORY[0x1E4F1CA48];
    id v6 = [v4 reverseObjectEnumerator];
    id v7 = [v6 allObjects];
    id v8 = [v5 arrayWithArray:v7];

    BOOL v9 = [a1 _chainFuturesWithFutureStack:v8];
  }
  else
  {
    BOOL v9 = +[FMFuture futureWithNoResult];
  }

  return v9;
}

+ (id)_chainFuturesWithFutureStack:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  id v6 = [v4 lastObject];
  id v7 = v6;
  if (v5 < 2)
  {
    id v8 = v6;
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__FMFuture_FMConveniences___chainFuturesWithFutureStack___block_invoke;
    v10[3] = &unk_1E6019960;
    id v11 = v4;
    id v12 = a1;
    id v8 = [v7 flatMap:v10];
  }
  return v8;
}

uint64_t __57__FMFuture_FMConveniences___chainFuturesWithFutureStack___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeLastObject];
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v2 = *(void **)(a1 + 40);
  return [v2 _chainFuturesWithFutureStack:v3];
}

+ (id)futureWithCompletionHandlerAdapterBlock:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  id v4 = objc_alloc_init(FMFuture);
  unint64_t v5 = [(FMFuture *)v4 completionHandlerAdapter];
  v3[2](v3, v5);

  return v4;
}

+ (id)futureWithErrorOnlyHandlerAdapterBlock:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  id v4 = objc_alloc_init(FMFuture);
  unint64_t v5 = [(FMFuture *)v4 errorOnlyCompletionHandlerAdapter];
  v3[2](v3, v5);

  return v4;
}

@end