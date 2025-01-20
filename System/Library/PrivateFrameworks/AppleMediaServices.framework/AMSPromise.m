@interface AMSPromise
+ (AMSPromise)promiseWithAll:(id)a3;
+ (AMSPromise)promiseWithAll:(id)a3 timeout:(double)a4;
+ (AMSPromise)promiseWithAny:(id)a3;
+ (AMSPromise)promiseWithAny:(id)a3 timeout:(double)a4;
+ (AMSPromise)promiseWithError:(id)a3;
+ (AMSPromise)promiseWithErrorCode:(int64_t)a3 title:(id)a4 message:(id)a5;
+ (AMSPromise)promiseWithErrorCode:(int64_t)a3 title:(id)a4 message:(id)a5 underlyingError:(id)a6;
+ (AMSPromise)promiseWithFlattenedPromises:(id)a3;
+ (AMSPromise)promiseWithPromiseResult:(id)a3;
+ (AMSPromise)promiseWithResult:(id)a3;
+ (AMSPromise)promiseWithSome:(id)a3;
+ (AMSPromise)promiseWithSome:(id)a3 timeout:(double)a4;
+ (BOOL)_errorIsCanceledError:(id)a3;
+ (BOOL)_errorIsTimeOutError:(id)a3;
+ (id)promiseFinishedWithDefaultErrorOrResult:(id)a3;
+ (id)unwrappedPromiseWithPromise:(id)a3;
+ (void)_configureFlattenedPromise:(id)a3 withPromises:(id)a4 results:(id)a5 previousError:(id)a6 currentPromiseIndex:(unint64_t)a7;
+ (void)_enumeratePromises:(id)a3 startingAt:(int64_t)a4 block:(id)a5;
- (AMSPromise)init;
- (AMSPromise)initWithPromiseResult:(id)a3;
- (AMSPromise)initWithTimeout:(double)a3;
- (AMSPromise)promiseWithTimeout:(double)a3;
- (AMSPromise)retainedSelf;
- (AMSPromiseCompletionBlocks)completionBlocks;
- (AMSPromiseResult)promiseResult;
- (BOOL)cancel;
- (BOOL)conditionHasSignaled;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithPromise:(id)a3;
- (BOOL)finishWithPromiseResult:(id)a3;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)isFinishedWithLock;
- (BOOL)isTimedOut;
- (NSCondition)condition;
- (id)BOOLCompletionHandlerAdapter;
- (id)binaryPromiseAdapter;
- (id)binaryPromiseAdapterForClass:(Class)a3;
- (id)catchWithBinaryPromiseBlock:(id)a3;
- (id)catchWithBlock:(id)a3;
- (id)completionHandlerAdapter;
- (id)continueWithBinaryPromiseBlock:(id)a3;
- (id)continueWithBlock:(id)a3;
- (id)errorOnlyCompletionHandlerAdapter;
- (id)mutablePromiseAdapter;
- (id)nilValueCompletionHandlerAdapter;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (id)resultWithError:(id *)a3;
- (id)resultWithTimeout:(double)a3 error:(id *)a4;
- (id)thenWithBinaryPromiseBlock:(id)a3;
- (id)thenWithBlock:(id)a3;
- (id)valueFromAddingBlock:(id)a3 orCallWithResult:(id)a4;
- (void)addBlock:(id)a3 orCallWithResult:(id)a4;
- (void)addErrorBlock:(id)a3;
- (void)addFinishBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)flushCompletionBlocksWithResult:(id)a3;
- (void)resultBeforeDate:(id)a3 completion:(id)a4;
- (void)resultWithTimeout:(double)a3 completion:(id)a4;
- (void)setConditionHasSignaled:(BOOL)a3;
- (void)setPromiseResult:(id)a3;
- (void)setRetainedSelf:(id)a3;
- (void)stopRetainingSelf;
- (void)waitUntilFinished;
- (void)waitUntilFinishedWithTimeout:(double)a3;
@end

@implementation AMSPromise

- (id)resultWithError:(id *)a3
{
  v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v6 = [(AMSPromise *)self resultBeforeDate:v5 error:a3];

  return v6;
}

- (id)continueWithBlock:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__AMSPromise_continueWithBlock___block_invoke;
  v10[3] = &unk_1E55A5768;
  v10[4] = self;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__AMSPromise_continueWithBlock___block_invoke_3;
  v8[3] = &unk_1E55A5790;
  id v9 = v11;
  id v5 = v11;
  v6 = [(AMSPromise *)self valueFromAddingBlock:v10 orCallWithResult:v8];

  return v6;
}

- (id)valueFromAddingBlock:(id)a3 orCallWithResult:(id)a4
{
  v6 = (void (**)(void))a3;
  v7 = (void (**)(id, void *))a4;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  id v9 = [(AMSPromise *)self promiseResult];
  if (v9)
  {
    os_unfair_lock_unlock(p_stateLock);
    v10 = v7[2](v7, v9);
  }
  else
  {
    v10 = v6[2](v6);
    os_unfair_lock_unlock(p_stateLock);
  }

  return v10;
}

AMSMutablePromise *__32__AMSPromise_continueWithBlock___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(AMSMutablePromise);
  v3 = AMSLogKey();
  id v4 = [*(id *)(a1 + 32) completionBlocks];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__AMSPromise_continueWithBlock___block_invoke_2;
  v10[3] = &unk_1E55A5740;
  id v11 = v3;
  id v13 = *(id *)(a1 + 40);
  id v5 = v2;
  v12 = v5;
  id v6 = v3;
  [v4 addCompletionBlock:v10];

  v7 = v12;
  v8 = v5;

  return v8;
}

- (AMSPromise)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMSPromise;
  v2 = [(AMSPromise *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(AMSPromiseCompletionBlocks);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

    v2->_stateLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v2->_retainedSelf, v2);
  }
  return v2;
}

- (id)thenWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__AMSPromise_thenWithBlock___block_invoke;
  v8[3] = &unk_1E55A5718;
  id v9 = v4;
  id v5 = v4;
  objc_super v6 = [(AMSPromise *)self continueWithBlock:v8];

  return v6;
}

- (void)addErrorBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPromise *)self completionBlocks];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __28__AMSPromise_addErrorBlock___block_invoke;
  v11[3] = &unk_1E559EAE0;
  id v12 = v5;
  id v13 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__AMSPromise_addErrorBlock___block_invoke_2;
  v8[3] = &unk_1E55A56C8;
  id v9 = v12;
  id v10 = v13;
  id v6 = v13;
  id v7 = v12;
  [(AMSPromise *)self addBlock:v11 orCallWithResult:v8];
}

- (void)addBlock:(id)a3 orCallWithResult:(id)a4
{
  id v9 = (void (**)(void))a3;
  id v6 = (void (**)(id, void *))a4;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  v8 = [(AMSPromise *)self promiseResult];
  if (v8)
  {
    os_unfair_lock_unlock(p_stateLock);
    v6[2](v6, v8);
  }
  else
  {
    v9[2]();
    os_unfair_lock_unlock(p_stateLock);
  }
}

- (BOOL)isFinished
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = [(AMSPromise *)v2 isFinishedWithLock];
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  +[AMSConcurrency logFaultFromSwiftConcurrencyOnInternalBuild];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if ([(AMSPromise *)self isFinishedWithLock])
  {
    v8 = [(AMSPromise *)self promiseResult];
    os_unfair_lock_unlock(&self->_stateLock);
LABEL_11:
    v14 = [(NSCondition *)v8 result];

    if (a4 && !v14)
    {
      *a4 = [(NSCondition *)v8 error];
    }
    id v12 = [(NSCondition *)v8 result];
  }
  else
  {
    condition = self->_condition;
    if (!condition)
    {
      id v10 = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
      id v11 = self->_condition;
      self->_condition = v10;

      condition = self->_condition;
    }
    v8 = condition;
    os_unfair_lock_unlock(&self->_stateLock);
    [(NSCondition *)v8 lock];
    do
    {
      if ([(AMSPromise *)self conditionHasSignaled])
      {
        [(NSCondition *)v8 unlock];
        os_unfair_lock_lock_with_options();
        uint64_t v13 = [(AMSPromise *)self promiseResult];
        os_unfair_lock_unlock(p_stateLock);

        v8 = (NSCondition *)v13;
        goto LABEL_11;
      }
    }
    while ([(NSCondition *)v8 waitUntilDate:v6]);
    [(NSCondition *)v8 unlock];
    if (a4)
    {
      AMSError(1, @"Promise timed out", 0, 0);
      id v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

+ (AMSPromise)promiseWithResult:(id)a3
{
  id v4 = a3;
  if (AMSPromiseClassCompatibleWithFinishedPromise((uint64_t)a1))
  {
    id v5 = +[AMSFinishedPromise promiseWithResult:v4];
  }
  else
  {
    id v5 = objc_alloc_init((Class)a1);
    +[AMSMutablePromise finishPromise:v5 withResult:v4];
  }

  return (AMSPromise *)v5;
}

- (AMSPromise)initWithPromiseResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPromise;
  id v6 = [(AMSPromise *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_promiseResult, a3);
    v7->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)setPromiseResult:(id)a3
{
}

- (NSCondition)condition
{
  os_unfair_lock_assert_owner(&self->_stateLock);
  condition = self->_condition;
  return condition;
}

- (void)flushCompletionBlocksWithResult:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPromise *)self completionBlocks];
  [v5 flushCompletionBlocksWithPromiseResult:v4];
}

- (AMSPromiseCompletionBlocks)completionBlocks
{
  return self->_completionBlocks;
}

- (void)stopRetainingSelf
{
  p_stateLock = &self->_stateLock;
  v3 = self;
  os_unfair_lock_lock_with_options();
  [(AMSPromise *)v3 setRetainedSelf:0];
  os_unfair_lock_unlock(p_stateLock);
}

- (void)setRetainedSelf:(id)a3
{
}

- (BOOL)isFinishedWithLock
{
  v2 = self;
  os_unfair_lock_assert_owner(&self->_stateLock);
  v3 = [(AMSPromise *)v2 promiseResult];
  LOBYTE(v2) = v3 != 0;

  return (char)v2;
}

- (AMSPromiseResult)promiseResult
{
  return self->_promiseResult;
}

void __32__AMSPromise_continueWithBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = AMSSetLogKey(v5);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) finishWithPromise:v9];
}

id __28__AMSPromise_thenWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
  v2 = +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:");
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseResult, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

uint64_t __28__AMSPromise_addErrorBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addErrorBlock:*(void *)(a1 + 40)];
}

uint64_t __30__AMSPromise_addSuccessBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSuccessBlock:*(void *)(a1 + 40)];
}

- (BOOL)conditionHasSignaled
{
  return self->_conditionHasSignaled;
}

uint64_t __29__AMSPromise_addFinishBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addCompletionBlock:*(void *)(a1 + 40)];
}

- (void)setConditionHasSignaled:(BOOL)a3
{
  self->_conditionHasSignaled = a3;
}

id __32__AMSPromise_continueWithBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 result];
  id v5 = [v3 error];

  id v6 = (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v4, v5);

  return v6;
}

BOOL __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[AMSMutableBinaryPromise finishPromise:*(void *)(a1 + 32) withSuccess:a2 != 0 error:a3];
}

uint64_t __30__AMSPromise_addSuccessBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callSuccessBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

uint64_t __28__AMSPromise_addErrorBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callErrorBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

void __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionBlocks];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_3;
  v5[3] = &unk_1E55A5830;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 72);
  id v7 = v3;
  uint64_t v9 = v4;
  id v6 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 56);
  [v2 addCompletionBlock:v5];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
}

uint64_t __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_3(void *a1)
{
  uint64_t result = (*(uint64_t (**)(void))(a1[5] + 16))();
  if (result)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7] + 1;
    return +[AMSPromise _enumeratePromises:v3 startingAt:v5 block:v4];
  }
  return result;
}

uint64_t __29__AMSPromise_addFinishBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callCompletionBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

id __42__AMSPromise_unwrappedPromiseWithPromise___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_12_3);
  uint64_t v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

+ (id)unwrappedPromiseWithPromise:(id)a3
{
  return (id)[a3 thenWithBlock:&__block_literal_global_106];
}

+ (AMSPromise)promiseWithSome:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  id v7 = [[AMSMutablePromise alloc] initWithTimeout:a4];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v6 count])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __38__AMSPromise_promiseWithSome_timeout___block_invoke;
    v15[3] = &unk_1E55A5680;
    id v16 = v8;
    id v17 = v9;
    id v10 = v7;
    v18 = v10;
    id v11 = v9;
    [a1 _enumeratePromises:v6 startingAt:0 block:v15];
    id v12 = v18;
    uint64_t v13 = v10;
  }
  else
  {
    [(AMSMutablePromise *)v7 finishWithResult:v8 error:0 logDuplicateFinishes:0];
  }

  return (AMSPromise *)v7;
}

+ (AMSPromise)promiseWithSome:(id)a3
{
  return (AMSPromise *)[a1 promiseWithSome:a3 timeout:0.0];
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSPromise *)self completionBlocks];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__AMSPromise_addSuccessBlock___block_invoke;
  v11[3] = &unk_1E559EAE0;
  id v12 = v5;
  id v13 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__AMSPromise_addSuccessBlock___block_invoke_2;
  v8[3] = &unk_1E55A56C8;
  id v9 = v12;
  id v10 = v13;
  id v6 = v13;
  id v7 = v12;
  [(AMSPromise *)self addBlock:v11 orCallWithResult:v8];
}

- (id)binaryPromiseAdapterForClass:(Class)a3
{
  void v5[4] = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke;
  v6[3] = &unk_1E55A58A8;
  v6[4] = self;
  v6[5] = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke_3;
  v5[3] = &__block_descriptor_40_e26__16__0__AMSPromiseResult_8lu32l8;
  uint64_t v3 = [(AMSPromise *)self valueFromAddingBlock:v6 orCallWithResult:v5];
  return v3;
}

- (id)catchWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__AMSPromise_catchWithBlock___block_invoke;
  v8[3] = &unk_1E55A5718;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(AMSPromise *)self continueWithBlock:v8];

  return v6;
}

id __29__AMSPromise_catchWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    +[AMSPromise promiseWithResult:a2];
  }
  else {
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return v2;
}

+ (AMSPromise)promiseWithAll:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  id v7 = [[AMSMutablePromise alloc] initWithTimeout:a4];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v6 count])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__AMSPromise_promiseWithAll_timeout___block_invoke;
    v13[3] = &unk_1E55A5630;
    id v14 = v8;
    id v9 = v7;
    v15 = v9;
    [a1 _enumeratePromises:v6 startingAt:0 block:v13];
    id v10 = v15;
    id v11 = v9;
  }
  else
  {
    [(AMSMutablePromise *)v7 finishWithResult:v8 error:0 logDuplicateFinishes:0];
  }

  return (AMSPromise *)v7;
}

+ (void)_enumeratePromises:(id)a3 startingAt:(int64_t)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke;
  aBlock[3] = &unk_1E55A5808;
  id v9 = v7;
  id v31 = v9;
  id v10 = v8;
  id v32 = v10;
  id v11 = _Block_copy(aBlock);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  while (a4 < (unint64_t)[v9 count] && *((unsigned char *)v27 + 24))
  {
    id v12 = [v9 objectAtIndexedSubscript:a4];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_2;
    v19[3] = &unk_1E55A5858;
    id v13 = v12;
    id v20 = v13;
    id v14 = v11;
    id v22 = v14;
    int64_t v25 = a4;
    id v21 = v9;
    id v23 = v10;
    v24 = &v26;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_4;
    v15[3] = &unk_1E55A5880;
    id v17 = &v26;
    id v16 = v14;
    int64_t v18 = a4;
    [v13 addBlock:v19 orCallWithResult:v15];

    ++a4;
  }
  _Block_object_dispose(&v26, 8);
}

void __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke_4(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  id v6 = [v4 result];
  id v5 = [v4 error];

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = (*(uint64_t (**)(uint64_t, id, void *, void))(v3 + 16))(v3, v6, v5, a1[6]);
}

uint64_t __50__AMSPromise__enumeratePromises_startingAt_block___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [*(id *)(a1 + 32) count] - 1;
  unsigned int v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v9 == a4) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  if ((v11 & 1) == 0)
  {
    for (unint64_t i = a4 + 1; i < [*(id *)(a1 + 32) count]; ++i)
    {
      id v13 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      +[AMSMutablePromise cancelPromise:v13];
    }
  }

  return v11;
}

uint64_t __37__AMSPromise_promiseWithAll_timeout___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7) {
    [*(id *)(a1 + 32) addObject:v7];
  }
  if (v8 || (a4 & 1) != 0)
  {
    if (v8)
    {
      unsigned int v10 = *(void **)(a1 + 40);
      uint64_t v11 = 0;
      id v12 = v8;
LABEL_10:
      [v10 finishWithResult:v11 error:v12 logDuplicateFinishes:0];
      uint64_t v9 = 0;
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v11 = *(void *)(a1 + 32);
    unsigned int v10 = *(void **)(a1 + 40);
    id v12 = 0;
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 40) isFinished]) {
    goto LABEL_9;
  }
  uint64_t v9 = 1;
LABEL_11:

  return v9;
}

uint64_t __38__AMSPromise_promiseWithSome_timeout___block_invoke(id *a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7) {
    [a1[4] addObject:v7];
  }
  if (v8) {
    [a1[5] addObject:v8];
  }
  if ((a4 & 1) != 0 || [a1[6] isFinished])
  {
    if ([a1[4] count] || !objc_msgSend(a1[5], "count"))
    {
      [a1[6] finishWithResult:a1[4] error:0 logDuplicateFinishes:0];
    }
    else
    {
      uint64_t v9 = (void *)[a1[5] copy];
      unsigned int v10 = AMSErrorWithMultipleUnderlyingErrors(15, 0, 0, v9);

      [a1[6] finishWithResult:0 error:v10 logDuplicateFinishes:0];
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return +[AMSMutablePromise finishPromise:self withResult:a3 error:a4];
}

id __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 result];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v5 promiseWithSuccess];
  }
  else
  {
    id v7 = [v3 error];
    id v6 = [v5 promiseWithError:v7];
  }
  return v6;
}

- (void)addFinishBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSPromise *)self completionBlocks];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __29__AMSPromise_addFinishBlock___block_invoke;
  v11[3] = &unk_1E559EAE0;
  id v12 = v5;
  id v13 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__AMSPromise_addFinishBlock___block_invoke_2;
  v8[3] = &unk_1E55A56C8;
  id v9 = v12;
  id v10 = v13;
  id v6 = v13;
  id v7 = v12;
  [(AMSPromise *)self addBlock:v11 orCallWithResult:v8];
}

- (id)completionHandlerAdapter
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__AMSPromise_completionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E55A3370;
  void aBlock[4] = self;
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = (void *)[v2 copy];

  return v3;
}

id __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(*(Class *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) completionBlocks];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__AMSPromise_binaryPromiseAdapterForClass___block_invoke_2;
  v6[3] = &unk_1E55A3370;
  id v4 = v2;
  id v7 = v4;
  [v3 addCompletionBlock:v6];

  return v4;
}

+ (AMSPromise)promiseWithError:(id)a3
{
  id v4 = a3;
  if (AMSPromiseClassCompatibleWithFinishedPromise((uint64_t)a1))
  {
    id v5 = +[AMSFinishedPromise promiseWithError:v4];
  }
  else
  {
    id v5 = objc_alloc_init((Class)a1);
    +[AMSMutablePromise finishPromise:v5 withError:v4];
  }

  return (AMSPromise *)v5;
}

- (id)binaryPromiseAdapter
{
  uint64_t v3 = objc_opt_class();
  return [(AMSPromise *)self binaryPromiseAdapterForClass:v3];
}

+ (AMSPromise)promiseWithAll:(id)a3
{
  return (AMSPromise *)[a1 promiseWithAll:a3 timeout:0.0];
}

- (AMSPromise)promiseWithTimeout:(double)a3
{
  id v4 = [[AMSMutablePromise alloc] initWithTimeout:a3];
  +[AMSMutablePromise finishPromise:v4 withPromise:self];
  return (AMSPromise *)v4;
}

uint64_t __42__AMSPromise_unwrappedPromiseWithPromise___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
  id v7 = [(AMSPromise *)self resultBeforeDate:v6 error:a4];

  return v7;
}

- (void)resultWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(AMSPromise *)self promiseWithTimeout:a3];
  [v7 resultWithCompletion:v6];
}

BOOL __38__AMSPromise_completionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[AMSMutablePromise finishPromise:*(void *)(a1 + 32) withResult:a2 error:a3];
}

- (BOOL)finishWithResult:(id)a3
{
  return [(AMSPromise *)self finishWithResult:a3 error:0];
}

+ (AMSPromise)promiseWithPromiseResult:(id)a3
{
  id v4 = a3;
  if (AMSPromiseClassCompatibleWithFinishedPromise((uint64_t)a1))
  {
    id v5 = +[AMSFinishedPromise promiseWithPromiseResult:v4];
  }
  else
  {
    id v5 = objc_alloc_init((Class)a1);
    id v6 = [v4 result];
    id v7 = [v4 error];
    +[AMSMutablePromise finishPromise:v5 withResult:v6 error:v7];
  }
  return (AMSPromise *)v5;
}

BOOL __47__AMSPromise_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    return +[AMSMutablePromise finishPromise:v2 withError:a2];
  }
  else {
    return +[AMSMutablePromise finishPromise:v2 withResult:MEMORY[0x1E4F1CC38]];
  }
}

- (BOOL)isTimedOut
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  if ([(AMSPromise *)self isFinishedWithLock])
  {
    id v4 = [(AMSPromise *)self promiseResult];
    id v5 = [v4 error];
    BOOL v6 = +[AMSPromise _errorIsTimeOutError:v5];
  }
  else
  {
    BOOL v6 = 0;
  }
  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

+ (BOOL)_errorIsTimeOutError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"AMSErrorDomain"]) {
    BOOL v5 = [v3 code] == 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isCancelled
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  if ([(AMSPromise *)self isFinishedWithLock])
  {
    id v4 = [(AMSPromise *)self promiseResult];
    BOOL v5 = [v4 error];
    BOOL v6 = +[AMSPromise _errorIsCanceledError:v5];
  }
  else
  {
    BOOL v6 = 0;
  }
  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

+ (BOOL)_errorIsCanceledError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v5 = [v3 code] == 3072;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)errorOnlyCompletionHandlerAdapter
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__AMSPromise_errorOnlyCompletionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E559F028;
  void aBlock[4] = self;
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)mutablePromiseAdapter
{
  id v3 = objc_alloc_init(AMSMutablePromise);
  [(AMSMutablePromise *)v3 finishWithPromise:self];
  return v3;
}

- (AMSPromise)initWithTimeout:(double)a3
{
  id v4 = [(AMSPromise *)self init];
  if (v4) {
    +[AMSMutablePromise startTimeoutForPromise:v4 timeout:a3];
  }
  return v4;
}

+ (AMSPromise)promiseWithErrorCode:(int64_t)a3 title:(id)a4 message:(id)a5
{
  return (AMSPromise *)[a1 promiseWithErrorCode:a3 title:a4 message:a5 underlyingError:0];
}

+ (AMSPromise)promiseWithErrorCode:(int64_t)a3 title:(id)a4 message:(id)a5 underlyingError:(id)a6
{
  id v7 = AMSError(a3, a4, a5, a6);
  id v8 = [a1 promiseWithError:v7];

  return (AMSPromise *)v8;
}

+ (AMSPromise)promiseWithAny:(id)a3
{
  return (AMSPromise *)[a1 promiseWithAny:a3 timeout:0.0];
}

+ (AMSPromise)promiseWithAny:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  id v7 = [[AMSMutablePromise alloc] initWithTimeout:a4];
  if ([v6 count])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__AMSPromise_promiseWithAny_timeout___block_invoke;
    v10[3] = &unk_1E55A5658;
    uint64_t v11 = v7;
    [a1 _enumeratePromises:v6 startingAt:0 block:v10];
  }
  else
  {
    id v8 = AMSError(2, @"Invalid Parameter", @"No promises were provided to -promiseWithAny:.", 0);
    [(AMSMutablePromise *)v7 finishWithResult:0 error:v8 logDuplicateFinishes:0];
  }
  return (AMSPromise *)v7;
}

uint64_t __37__AMSPromise_promiseWithAny_timeout___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7 || (a4 & 1) != 0 || [*(id *)(a1 + 32) isFinished])
  {
    [*(id *)(a1 + 32) finishWithResult:v7 error:v8 logDuplicateFinishes:0];
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

+ (AMSPromise)promiseWithFlattenedPromises:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(AMSMutablePromise);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  +[AMSPromise _configureFlattenedPromise:v4 withPromises:v3 results:v5 previousError:0 currentPromiseIndex:0];

  return (AMSPromise *)v4;
}

- (void)resultBeforeDate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [a3 timeIntervalSinceNow];
  id v7 = [(AMSPromise *)self promiseWithTimeout:"promiseWithTimeout:"];
  [v7 resultWithCompletion:v6];
}

- (void)waitUntilFinished
{
  id v2 = [(AMSPromise *)self resultWithError:0];
}

- (void)waitUntilFinishedWithTimeout:(double)a3
{
  id v3 = [(AMSPromise *)self resultWithTimeout:0 error:a3];
}

- (id)catchWithBinaryPromiseBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__AMSPromise_catchWithBinaryPromiseBlock___block_invoke;
  v8[3] = &unk_1E55A56F0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(AMSPromise *)self continueWithBinaryPromiseBlock:v8];

  return v6;
}

id __42__AMSPromise_catchWithBinaryPromiseBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    +[AMSBinaryPromise promiseWithSuccess];
  }
  else {
  id v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return v2;
}

- (id)continueWithBinaryPromiseBlock:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke;
  v10[3] = &unk_1E55A5768;
  void v10[4] = self;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke_3;
  v8[3] = &unk_1E55A5790;
  id v9 = v11;
  id v5 = v11;
  id v6 = [(AMSPromise *)self valueFromAddingBlock:v10 orCallWithResult:v8];

  return v6;
}

AMSMutableBinaryPromise *__45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(AMSMutableBinaryPromise);
  id v3 = AMSLogKey();
  id v4 = [*(id *)(a1 + 32) completionBlocks];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke_2;
  v10[3] = &unk_1E55A5740;
  id v11 = v3;
  id v13 = *(id *)(a1 + 40);
  id v5 = v2;
  id v12 = v5;
  id v6 = v3;
  [v4 addCompletionBlock:v10];

  id v7 = v12;
  id v8 = v5;

  return v8;
}

void __45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = AMSSetLogKey(v5);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) finishWithPromise:v9];
}

id __45__AMSPromise_continueWithBinaryPromiseBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 result];
  id v5 = [v3 error];

  id v6 = (*(void (**)(uint64_t, void *, void *))(v2 + 16))(v2, v4, v5);

  return v6;
}

- (id)thenWithBinaryPromiseBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__AMSPromise_thenWithBinaryPromiseBlock___block_invoke;
  v8[3] = &unk_1E55A56F0;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(AMSPromise *)self continueWithBinaryPromiseBlock:v8];

  return v6;
}

id __41__AMSPromise_thenWithBinaryPromiseBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
  uint64_t v2 = +[AMSBinaryPromise promiseWithError:](AMSBinaryPromise, "promiseWithError:");
  }
  return v2;
}

- (id)BOOLCompletionHandlerAdapter
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__AMSPromise_BOOLCompletionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E55A0478;
  void aBlock[4] = self;
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = (void *)[v2 copy];

  return v3;
}

void __42__AMSPromise_BOOLCompletionHandlerAdapter__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id v4 = (void *)MEMORY[0x1E4F28ED0];
    id v5 = a3;
    id v6 = [v4 numberWithBool:1];
    +[AMSMutablePromise finishPromise:withResult:error:](AMSMutablePromise, "finishPromise:withResult:error:", v3);
  }
  else
  {
    id v6 = a3;
    +[AMSMutablePromise finishPromise:withResult:error:](AMSMutablePromise, "finishPromise:withResult:error:", v3, 0);
  }
}

- (id)nilValueCompletionHandlerAdapter
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__AMSPromise_nilValueCompletionHandlerAdapter__block_invoke;
  aBlock[3] = &unk_1E55A3370;
  void aBlock[4] = self;
  uint64_t v2 = _Block_copy(aBlock);
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

void __46__AMSPromise_nilValueCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v8 = a2;
  unint64_t v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v8 | v5)
  {
    if (v8) {
      +[AMSMutablePromise finishPromise:withResult:](AMSMutablePromise, "finishPromise:withResult:", v6);
    }
    else {
      +[AMSMutablePromise finishPromise:v6 withError:v5];
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
    +[AMSMutablePromise finishPromise:v6 withResult:v7];
  }
}

+ (void)_configureFlattenedPromise:(id)a3 withPromises:(id)a4 results:(id)a5 previousError:(id)a6 currentPromiseIndex:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v12 objectAtIndexedSubscript:a7];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __96__AMSPromise__configureFlattenedPromise_withPromises_results_previousError_currentPromiseIndex___block_invoke;
  v30[3] = &unk_1E55A57B8;
  id v16 = v13;
  id v31 = v16;
  unint64_t v35 = a7;
  id v17 = v12;
  id v32 = v17;
  id v18 = v11;
  id v33 = v18;
  id v19 = v14;
  id v34 = v19;
  [v15 addSuccessBlock:v30];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __96__AMSPromise__configureFlattenedPromise_withPromises_results_previousError_currentPromiseIndex___block_invoke_2;
  v24[3] = &unk_1E55A57E0;
  id v28 = v16;
  unint64_t v29 = a7;
  id v25 = v19;
  id v26 = v17;
  id v27 = v18;
  id v20 = v16;
  id v21 = v18;
  id v22 = v17;
  id v23 = v19;
  [v15 addErrorBlock:v24];
}

uint64_t __96__AMSPromise__configureFlattenedPromise_withPromises_results_previousError_currentPromiseIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = [*(id *)(a1 + 40) count];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v3 == v4 - 1)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    return +[AMSMutablePromise finishPromise:v5 withResult:v6];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64) + 1;
    return +[AMSPromise _configureFlattenedPromise:v5 withPromises:v8 results:v9 previousError:v10 currentPromiseIndex:v11];
  }
}

void __96__AMSPromise__configureFlattenedPromise_withPromises_results_previousError_currentPromiseIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 domain];
  uint64_t v5 = [v3 code];
  uint64_t v6 = objc_msgSend(v3, "ams_title");
  id v7 = objc_msgSend(v3, "ams_message");
  uint64_t v8 = [v3 userInfo];

  AMSCustomError(v4, v5, v6, v7, v8, *(void **)(a1 + 32));
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = [*(id *)(a1 + 40) count];
  uint64_t v11 = *(void *)(a1 + 48);
  if (v9 == v10 - 1) {
    +[AMSMutablePromise finishPromise:v11 withError:v12];
  }
  else {
    +[AMSPromise _configureFlattenedPromise:v11 withPromises:*(void *)(a1 + 40) results:*(void *)(a1 + 56) previousError:v12 currentPromiseIndex:*(void *)(a1 + 64) + 1];
  }
}

- (AMSPromise)retainedSelf
{
  return self->_retainedSelf;
}

- (BOOL)cancel
{
  return +[AMSMutablePromise cancelPromise:self];
}

- (BOOL)finishWithError:(id)a3
{
  return [(AMSPromise *)self finishWithResult:0 error:a3];
}

- (BOOL)finishWithPromise:(id)a3
{
  return +[AMSMutablePromise finishPromise:self withPromise:a3];
}

- (BOOL)finishWithPromiseResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 result];
  uint64_t v6 = [v4 error];

  LOBYTE(self) = +[AMSMutablePromise finishPromise:self withResult:v5 error:v6];
  return (char)self;
}

+ (id)promiseFinishedWithDefaultErrorOrResult:(id)a3
{
  id v4 = a3;
  uint64_t v10 = AMSErrorWithFormat(12, @"No result found.", @"Completed promise without result.", v5, v6, v7, v8, v9, v13);
  if (v4) {
    [a1 promiseWithResult:v4];
  }
  else {
  uint64_t v11 = [a1 promiseWithError:v10];
  }

  return v11;
}

@end