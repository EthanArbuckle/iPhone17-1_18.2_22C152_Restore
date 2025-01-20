@interface CNFuture
+ (CNFuture)futureWithBlock:(id)a3;
+ (CNFuture)futureWithBlock:(id)a3 scheduler:(id)a4;
+ (CNFuture)futureWithBlock:(id)a3 scheduler:(id)a4 schedulerProvider:(id)a5;
+ (CNFuture)futureWithBlock:(id)a3 schedulerProvider:(id)a4;
+ (CNFuture)futureWithError:(id)a3;
+ (CNFuture)futureWithResult:(id)a3;
+ (id)_joinMany:(id)a3;
+ (id)_joinOne:(id)a3;
+ (id)_joinZero;
+ (id)chain:(id)a3;
+ (id)flatMap:(id)a3 withBlock:(id)a4 schedulerProvider:(id)a5;
+ (id)future;
+ (id)join:(id)a3;
+ (id)lazyFutureWithBlock:(id)a3;
+ (id)promiseFuture;
+ (id)recover:(id)a3 withBlock:(id)a4 schedulerProvider:(id)a5;
+ (id)sequence:(id)a3;
+ (void)finishPromise:(id)a3 withFuture:(id)a4;
- (BOOL)cancel;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (CNFuture)init;
- (CNFuture)initWithImpl:(id)a3;
- (CNFuture)initWithSchedulerProvider:(id)a3;
- (NSString)description;
- (id)completionHandlerAdapterWithDefaultValue:(id)a3;
- (id)flatMap:(id)a3;
- (id)flatMap:(id)a3 schedulerProvider:(id)a4;
- (id)recover:(id)a3;
- (id)recover:(id)a3 schedulerProvider:(id)a4;
- (id)result:(id *)a3;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (id)resultWithTimeout:(double)a3 error:(id *)a4;
- (void)_flushCompletionBlocks;
- (void)addCalculationDependency:(id)a3;
- (void)addFailureBlock:(id)a3;
- (void)addFailureBlock:(id)a3 scheduler:(id)a4;
- (void)addSuccessBlock:(id)a3;
- (void)addSuccessBlock:(id)a3 scheduler:(id)a4;
@end

@implementation CNFuture

uint64_t __38__CNFuture_addFailureBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __38__CNFuture_addFailureBlock_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CNFuture_addFailureBlock_scheduler___block_invoke_2;
  v7[3] = &unk_1E569F468;
  v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performBlock:v7];
}

uint64_t __38__CNFuture_addSuccessBlock_scheduler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calculationDependencies, 0);

  objc_storeStrong((id *)&self->_impl, 0);
}

void __48__CNFuture_flatMap_withBlock_schedulerProvider___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) finishPromise:*(void *)(a1 + 32) withFuture:v3];
  v2 = [*(id *)(a1 + 32) future];
  [v2 addCalculationDependency:v3];
}

- (void)addCalculationDependency:(id)a3
{
}

+ (id)flatMap:(id)a3 withBlock:(id)a4 schedulerProvider:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [[CNPromise alloc] initWithSchedulerProvider:v9];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __48__CNFuture_flatMap_withBlock_schedulerProvider___block_invoke;
  v22[3] = &unk_1E56A1A90;
  id v24 = v8;
  id v25 = a1;
  v12 = v11;
  v23 = v12;
  id v13 = v8;
  [v10 addSuccessBlock:v22];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __48__CNFuture_flatMap_withBlock_schedulerProvider___block_invoke_2;
  v20 = &unk_1E569FBD8;
  v21 = v12;
  v14 = v12;
  [v10 addFailureBlock:&v17];
  v15 = [(CNPromise *)v14 future];
  [v15 addCalculationDependency:v10];

  return v15;
}

- (CNFuture)initWithSchedulerProvider:(id)a3
{
  id v4 = a3;
  id v5 = [[_CNBlockFutureImpl alloc] initWithSchedulerProvider:v4];

  id v6 = [(CNFuture *)self initWithImpl:v5];
  return v6;
}

- (CNFuture)initWithImpl:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNFuture;
  id v6 = [(CNFuture *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    calculationDependencies = v7->_calculationDependencies;
    v7->_calculationDependencies = v8;

    id v10 = v7;
  }

  return v7;
}

+ (void)finishPromise:(id)a3 withFuture:(id)a4
{
  id v5 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__CNFuture_finishPromise_withFuture___block_invoke;
  v11[3] = &unk_1E56A0AD8;
  id v6 = v5;
  id v12 = v6;
  id v7 = a4;
  [v7 addSuccessBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__CNFuture_finishPromise_withFuture___block_invoke_2;
  v9[3] = &unk_1E569FBD8;
  id v10 = v6;
  id v8 = v6;
  [v7 addFailureBlock:v9];
}

- (void)addSuccessBlock:(id)a3
{
}

- (void)addFailureBlock:(id)a3
{
}

- (id)flatMap:(id)a3
{
  id v4 = a3;
  id v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = [(CNFuture *)self flatMap:v4 schedulerProvider:v5];

  return v6;
}

- (id)flatMap:(id)a3 schedulerProvider:(id)a4
{
  return +[CNFuture flatMap:self withBlock:a3 schedulerProvider:a4];
}

+ (CNFuture)futureWithResult:(id)a3
{
  id v4 = a3;
  id v5 = [[_CNConstantFutureImpl alloc] initWithResult:v4];

  id v6 = (void *)[objc_alloc((Class)a1) initWithImpl:v5];

  return (CNFuture *)v6;
}

uint64_t __37__CNFuture_finishPromise_withFuture___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t __37__CNFuture_finishPromise_withFuture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (BOOL)finishWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CNFuture finishWithError:](v5);
    }

    id v6 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CNFuture finishWithResult:]();
    }

    CNFutureThrowProtocolExceptionWithReason(@"error must be non-nil", 0);
  }
  BOOL v7 = [(CNFuture *)self finishWithResult:0 error:v4];

  return v7;
}

- (BOOL)finishWithResult:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CNFuture finishWithResult:](v5);
    }

    id v6 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CNFuture finishWithResult:]();
    }

    CNFutureThrowProtocolExceptionWithReason(@"result must be non-nil", 0);
  }
  BOOL v7 = [(CNFuture *)self finishWithResult:v4 error:0];

  return v7;
}

void __56__CNFuture_futureWithBlock_scheduler_schedulerProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = 0;
  id v3 = (*(void (**)(void))(v2 + 16))();
  id v4 = v5;
  [*(id *)(a1 + 32) finishWithResult:v3 error:v4];
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  return [(CNFutureImpl *)self->_impl finishWithResult:a3 error:a4];
}

void __38__CNFuture_addSuccessBlock_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CNFuture_addSuccessBlock_scheduler___block_invoke_2;
  v7[3] = &unk_1E569F468;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performBlock:v7];
}

- (id)result:(id *)a3
{
  id v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v6 = [(CNFuture *)self resultBeforeDate:v5 error:a3];

  return v6;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  return (id)[(CNFutureImpl *)self->_impl resultBeforeDate:a3 error:a4];
}

+ (CNFuture)futureWithBlock:(id)a3 scheduler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CNSchedulerProvider defaultProvider];
  id v9 = [a1 futureWithBlock:v7 scheduler:v6 schedulerProvider:v8];

  return (CNFuture *)v9;
}

+ (CNFuture)futureWithBlock:(id)a3 scheduler:(id)a4 schedulerProvider:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(CNPromise);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __56__CNFuture_futureWithBlock_scheduler_schedulerProvider___block_invoke;
  v16 = &unk_1E569F468;
  uint64_t v17 = v8;
  id v18 = v6;
  id v9 = v8;
  id v10 = v6;
  [v7 performBlock:&v13];

  v11 = [(CNPromise *)v9 future];

  return (CNFuture *)v11;
}

- (void)addSuccessBlock:(id)a3 scheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__CNFuture_addSuccessBlock_scheduler___block_invoke;
  v10[3] = &unk_1E56A0BC8;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(CNFuture *)self addSuccessBlock:v10];
}

- (void)addFailureBlock:(id)a3 scheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__CNFuture_addFailureBlock_scheduler___block_invoke;
  v10[3] = &unk_1E56A0B28;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(CNFuture *)self addFailureBlock:v10];
}

+ (CNFuture)futureWithError:(id)a3
{
  id v4 = a3;
  id v5 = [[_CNFailedFutureImpl alloc] initWithError:v4];

  id v6 = (void *)[objc_alloc((Class)a1) initWithImpl:v5];

  return (CNFuture *)v6;
}

- (id)recover:(id)a3
{
  id v4 = a3;
  id v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = [(CNFuture *)self recover:v4 schedulerProvider:v5];

  return v6;
}

- (id)recover:(id)a3 schedulerProvider:(id)a4
{
  return +[CNFuture recover:self withBlock:a3 schedulerProvider:a4];
}

+ (id)recover:(id)a3 withBlock:(id)a4 schedulerProvider:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [[CNPromise alloc] initWithSchedulerProvider:v9];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __48__CNFuture_recover_withBlock_schedulerProvider___block_invoke;
  v24[3] = &unk_1E56A0AD8;
  id v12 = v11;
  id v25 = v12;
  [v10 addSuccessBlock:v24];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __48__CNFuture_recover_withBlock_schedulerProvider___block_invoke_2;
  v20 = &unk_1E56A1AB8;
  id v22 = v8;
  id v23 = a1;
  v21 = v12;
  uint64_t v13 = v12;
  id v14 = v8;
  [v10 addFailureBlock:&v17];
  v15 = [(CNPromise *)v13 future];
  [v15 addCalculationDependency:v10];

  return v15;
}

void __48__CNFuture_recover_withBlock_schedulerProvider___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) finishPromise:*(void *)(a1 + 32) withFuture:v2];
}

+ (id)join:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4 == 1)
  {
    id v5 = [v3 firstObject];
    id v6 = +[CNFuture _joinOne:v5];
  }
  else
  {
    if (v4) {
      +[CNFuture _joinMany:v3];
    }
    else {
    id v6 = +[CNFuture _joinZero];
    }
  }

  return v6;
}

+ (id)_joinOne:(id)a3
{
  return (id)[a3 flatMap:&__block_literal_global_64];
}

id __21__CNFuture__joinOne___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  uint64_t v4 = [v2 arrayWithObjects:&v7 count:1];
  id v5 = +[CNFuture futureWithResult:](CNFuture, "futureWithResult:", v4, v7, v8);

  return v5;
}

+ (id)promiseFuture
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)future
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (CNFuture)futureWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = [a1 futureWithBlock:v4 schedulerProvider:v5];

  return (CNFuture *)v6;
}

+ (CNFuture)futureWithBlock:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[CNScheduler immediateScheduler];
  id v9 = [a1 futureWithBlock:v7 scheduler:v8 schedulerProvider:v6];

  return (CNFuture *)v9;
}

+ (id)lazyFutureWithBlock:(id)a3
{
  id v4 = +[_CNBlockFutureImpl lazyImplWithBlock:a3];
  id v5 = (void *)[objc_alloc((Class)a1) initWithImpl:v4];

  return v5;
}

uint64_t __48__CNFuture_flatMap_withBlock_schedulerProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __48__CNFuture_recover_withBlock_schedulerProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

+ (id)chain:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  id v6 = objc_msgSend(v4, "_cn_tail");

  if (off_1EE0248A0((uint64_t)&__block_literal_global_5, v6))
  {
    id v7 = v5;
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __18__CNFuture_chain___block_invoke;
    v15[3] = &unk_1E56A1AE0;
    id v17 = a1;
    id v8 = v6;
    id v16 = v8;
    id v9 = [v5 flatMap:v15];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __18__CNFuture_chain___block_invoke_2;
    v12[3] = &unk_1E56A1B08;
    id v14 = a1;
    id v13 = v8;
    id v10 = [v9 recover:v12];

    id v7 = v10;
  }

  return v7;
}

id __18__CNFuture_chain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = off_1EE026580((uint64_t)&__block_literal_global_9_0, v3);
  id v5 = *(void **)(a1 + 40);
  if (v4) {
    [v5 chain:*(void *)(a1 + 32)];
  }
  else {
  id v6 = [v5 futureWithResult:v3];
  }

  return v6;
}

uint64_t __18__CNFuture_chain___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) chain:*(void *)(a1 + 32)];
}

+ (id)sequence:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (off_1EE0248A0((uint64_t)&__block_literal_global_5, v3))
  {
    BOOL v4 = +[CNFuture futureWithResult:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    id v6 = [v3 firstObject];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = v3;
    id v7 = objc_msgSend(v3, "_cn_tail");
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        id v12 = v6;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __21__CNFuture_sequence___block_invoke;
          v19[3] = &unk_1E56A1B30;
          id v20 = v5;
          uint64_t v21 = v13;
          id v6 = [v12 flatMap:v19];

          ++v11;
          id v12 = v6;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __21__CNFuture_sequence___block_invoke_2;
    v17[3] = &unk_1E56A1B58;
    id v18 = v5;
    id v14 = v5;
    BOOL v4 = [v6 flatMap:v17];

    id v3 = v16;
  }

  return v4;
}

id __21__CNFuture_sequence___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  id v3 = *(void **)(a1 + 40);

  return v3;
}

CNFuture *__21__CNFuture_sequence___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v3 = *(void *)(a1 + 32);

  return +[CNFuture futureWithResult:v3];
}

+ (id)_joinZero
{
  return +[CNFuture futureWithResult:MEMORY[0x1E4F1CBF0]];
}

+ (id)_joinMany:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_alloc_init(CNPromise);
  id v5 = +[CNScheduler synchronousSerialDispatchQueueWithName:@"com.apple.contacts.future.join"];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = (void *)[v3 mutableCopy];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __22__CNFuture__joinMany___block_invoke;
  v23[3] = &unk_1E56A1BF0;
  id v8 = v6;
  id v24 = v8;
  id v9 = v7;
  id v25 = v9;
  uint64_t v10 = v4;
  v26 = v10;
  id v11 = v5;
  id v27 = v11;
  [v3 enumerateObjectsUsingBlock:v23];
  id v12 = [(CNPromise *)v10 future];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v3;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v12, "addCalculationDependency:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v15);
  }

  return v12;
}

void __22__CNFuture__joinMany___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1[4];
  id v7 = [MEMORY[0x1E4F1CA98] null];
  [v6 addObject:v7];

  objc_initWeak(&location, v5);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __22__CNFuture__joinMany___block_invoke_2;
  v13[3] = &unk_1E56A1BA0;
  objc_copyWeak(v17, &location);
  id v14 = a1[5];
  id v15 = a1[4];
  v17[1] = a3;
  id v16 = a1[6];
  [v5 addSuccessBlock:v13 scheduler:a1[7]];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __22__CNFuture__joinMany___block_invoke_3;
  v8[3] = &unk_1E56A1BC8;
  id v9 = a1[7];
  objc_copyWeak(&v12, &location);
  id v10 = a1[5];
  id v11 = a1[6];
  [v5 addFailureBlock:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __22__CNFuture__joinMany___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [*(id *)(a1 + 32) indexOfObject:WeakRetained];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    [*(id *)(a1 + 40) replaceObjectAtIndex:*(void *)(a1 + 64) withObject:v6];
    [*(id *)(a1 + 32) removeObjectAtIndex:v5];
    if (off_1EE0248A0((uint64_t)&__block_literal_global_5, *(void **)(a1 + 32))) {
      [*(id *)(a1 + 48) finishWithResult:*(void *)(a1 + 40)];
    }
  }
}

void __22__CNFuture__joinMany___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __22__CNFuture__joinMany___block_invoke_4;
  v15[3] = &unk_1E56A0950;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  id v16 = *(id *)(a1 + 40);
  id v6 = v4;
  id v17 = v6;
  [v5 performBlock:v15];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "cancel", (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v8);
  }

  [*(id *)(a1 + 48) finishWithError:v3];
  objc_destroyWeak(&v18);
}

void __22__CNFuture__joinMany___block_invoke_4(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v2 = objc_msgSend(a1[4], "indexOfObject:");
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [a1[4] removeObjectAtIndex:v2];
    [a1[5] setArray:a1[4]];
    [a1[4] removeAllObjects];
  }
}

- (CNFuture)init
{
  id v3 = +[CNSchedulerProvider defaultProvider];
  uint64_t v4 = [(CNFuture *)self initWithSchedulerProvider:v3];

  return v4;
}

- (NSString)description
{
  id v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  [(CNFutureImpl *)self->_impl updateDescriptionWithBuilder:v3];
  uint64_t v4 = [v3 build];

  return (NSString *)v4;
}

- (id)resultWithTimeout:(double)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
  id v7 = [(CNFuture *)self resultBeforeDate:v6 error:a4];

  return v7;
}

- (BOOL)isFinished
{
  return [(CNFutureImpl *)self->_impl isFinished];
}

- (BOOL)isCancelled
{
  return [(CNFutureImpl *)self->_impl isCancelled];
}

- (BOOL)cancel
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  impl = self->_impl;

  return [(CNFutureImpl *)impl cancel];
}

- (id)completionHandlerAdapterWithDefaultValue:(id)a3
{
  return CNPromiseCompletionHandlerWithDefaultValue(self, a3);
}

- (void)_flushCompletionBlocks
{
  if (objc_opt_respondsToSelector())
  {
    impl = self->_impl;
    [(CNFutureImpl *)impl _flushCompletionBlocks];
  }
}

- (void)finishWithResult:.cold.1()
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_0(&dword_19091D000, v1, v2, "Call stack: %{public}@", v3, v4, v5, v6, 2u);
}

- (void)finishWithResult:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "A promise was finished with a nil result", v1, 2u);
}

- (void)finishWithError:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19091D000, log, OS_LOG_TYPE_ERROR, "A promise was finished with a nil error", v1, 2u);
}

@end