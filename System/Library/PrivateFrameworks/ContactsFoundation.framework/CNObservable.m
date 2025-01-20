@interface CNObservable
+ (OS_os_log)os_log;
+ (OS_os_log)os_log_protocol;
+ (id)amb:(id)a3;
+ (id)asyncScannerResultsInString:(id)a3;
+ (id)binderTypeForResultType:(unint64_t)a3;
+ (id)combineLatest:(id)a3;
+ (id)combineLatest:(id)a3 resultScheduler:(id)a4 schedulerProvider:(id)a5;
+ (id)combineLatest:(id)a3 schedulerProvider:(id)a4;
+ (id)concatenate:(id)a3;
+ (id)emptyObservable;
+ (id)forkJoin:(id)a3 scheduler:(id)a4;
+ (id)merge:(id)a3;
+ (id)merge:(id)a3 schedulerProvider:(id)a4;
+ (id)neverObservable;
+ (id)observableForKeyPath:(id)a3 ofObject:(id)a4 withOptions:(unint64_t)a5;
+ (id)observableOnDarwinNotificationCenterWithName:(id)a3;
+ (id)observableOnDefaultNotificationCenterWithName:(id)a3 object:(id)a4;
+ (id)observableOnNotificationCenter:(id)a3 withName:(id)a4 object:(id)a5;
+ (id)observableWithAbsoluteTimestamps:(id)a3 schedulerProvider:(id)a4;
+ (id)observableWithBlock:(id)a3;
+ (id)observableWithEmailAddressesInString:(id)a3;
+ (id)observableWithError:(id)a3;
+ (id)observableWithFuture:(id)a3;
+ (id)observableWithFuture:(id)a3 schedulerProvider:(id)a4;
+ (id)observableWithFutures:(id)a3;
+ (id)observableWithFutures:(id)a3 schedulerProvider:(id)a4;
+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6;
+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8;
+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 scheduler:(id)a7;
+ (id)observableWithRange:(_NSRange)a3;
+ (id)observableWithRange:(_NSRange)a3 interval:(double)a4 scheduler:(id)a5;
+ (id)observableWithRange:(_NSRange)a3 scheduler:(id)a4;
+ (id)observableWithRelativeTimestamps:(id)a3 schedulerProvider:(id)a4;
+ (id)observableWithResult:(id)a3;
+ (id)observableWithResults:(id)a3;
+ (id)observableWithResults:(id)a3 interval:(double)a4 scheduler:(id)a5;
+ (id)observableWithResults:(id)a3 scheduler:(id)a4;
+ (id)observableWithScannerResultsInString:(id)a3;
+ (id)observableWithScannerResultsOfType:(unint64_t)a3 inString:(id)a4;
+ (id)observableWithTimeInterval:(double)a3 scheduler:(id)a4;
+ (id)progressiveForkJoin:(id)a3 scheduler:(id)a4;
+ (id)scannerResultsInString:(id)a3;
+ (id)timerWithDelay:(double)a3;
+ (id)timerWithDelay:(double)a3 scheduler:(id)a4;
+ (void)sendNextTimestampFromQueue:(id)a3 toObserver:(id)a4 untilCanceled:(id)a5 scheduler:(id)a6;
- (NSString)debugPipelineDescription;
- (id)allObjects:(id *)a3;
- (id)ambWith:(id)a3;
- (id)any:(id)a3;
- (id)buffer:(unint64_t)a3;
- (id)buffer:(unint64_t)a3 interval:(double)a4;
- (id)buffer:(unint64_t)a3 interval:(double)a4 scheduler:(id)a5;
- (id)bufferWithInterval:(double)a3;
- (id)bufferWithInterval:(double)a3 scheduler:(id)a4;
- (id)concatMap:(id)a3;
- (id)concatMap:(id)a3 schedulerProvider:(id)a4;
- (id)delay:(double)a3 scheduler:(id)a4;
- (id)delaySubscription:(double)a3 scheduler:(id)a4;
- (id)dematerialize;
- (id)distinct;
- (id)distinctUntilChanged;
- (id)doOnCancel:(id)a3;
- (id)doOnCompletion:(id)a3;
- (id)doOnError:(id)a3;
- (id)doOnNext:(id)a3;
- (id)doOnSubscribe:(id)a3;
- (id)doOnTerminate:(id)a3;
- (id)filter:(id)a3;
- (id)flatMap:(id)a3;
- (id)flatMap:(id)a3 schedulerProvider:(id)a4;
- (id)ignoreElements;
- (id)map:(id)a3;
- (id)materialize;
- (id)observeOn:(id)a3;
- (id)onEmpty:(id)a3;
- (id)onError:(id)a3;
- (id)onErrorHandler:(id)a3;
- (id)publish;
- (id)sample:(double)a3;
- (id)sample:(double)a3 scheduler:(id)a4;
- (id)sampleWithObservable:(id)a3;
- (id)scan:(id)a3;
- (id)scan:(id)a3 seed:(id)a4;
- (id)skip:(unint64_t)a3;
- (id)skipLast:(unint64_t)a3;
- (id)skipUntil:(id)a3;
- (id)startWith:(id)a3;
- (id)startWith:(id)a3 scheduler:(id)a4;
- (id)subscribe:(id)a3;
- (id)subscribeOn:(id)a3;
- (id)switch;
- (id)switchMap:(id)a3;
- (id)switchMap:(id)a3 schedulerProvider:(id)a4;
- (id)switchWithSchedulerProvider:(id)a3;
- (id)take:(unint64_t)a3;
- (id)takeLast:(unint64_t)a3;
- (id)takeUntil:(id)a3;
- (id)throttle:(double)a3 options:(unint64_t)a4 schedulerProvider:(id)a5;
- (id)throttle:(double)a3 schedulerProvider:(id)a4;
- (id)throttleFirst:(double)a3 scheduler:(id)a4;
- (id)throttleFirstAndLast:(double)a3 schedulerProvider:(id)a4;
- (id)timeInterval;
- (id)timeIntervalWithScheduler:(id)a3;
- (id)timeoutAfterDelay:(double)a3 alternateObservable:(id)a4 schedule:(id)a5;
- (id)timestampWithScheduler:(id)a3;
- (id)toArray;
- (id)using:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
@end

@implementation CNObservable

- (void).cxx_destruct
{
}

id __30__CNObservable_doOnTerminate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[CNCancelationToken tokenWithCancelationBlock:*(void *)(a1 + 40)];
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __30__CNObservable_doOnTerminate___block_invoke_2;
  v17[3] = &unk_1E56A0AD8;
  id v18 = v3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __30__CNObservable_doOnTerminate___block_invoke_3;
  v14[3] = &unk_1E569FA00;
  id v15 = v18;
  id v16 = *(id *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__CNObservable_doOnTerminate___block_invoke_4;
  v11[3] = &unk_1E56A0B28;
  id v12 = v15;
  id v13 = *(id *)(a1 + 40);
  id v7 = v15;
  v8 = +[CNObserver blockObserverOfClass:v6 withResultBlock:v17 completionBlock:v14 failureBlock:v11];
  v9 = [v5 subscribe:v8];
  [v4 addCancelable:v9];

  return v4;
}

uint64_t __30__CNObservable_doOnTerminate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

void __26__CNObservable_observeOn___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__CNObservable_observeOn___block_invoke_3;
  v6[3] = &unk_1E56A0950;
  objc_copyWeak(&v9, a1 + 6);
  id v7 = a1[4];
  id v5 = v3;
  id v8 = v5;
  [WeakRetained performBlock:v6];

  objc_destroyWeak(&v9);
}

void __20__CNObservable_map___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 observerDidReceiveResult:v2];
}

uint64_t __31__CNObservable_doOnCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

uint64_t __26__CNObservable_doOnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

void __25__CNObservable_doOnNext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  [*(id *)(a1 + 32) observerDidReceiveResult:v5];
}

id __31__CNObservable_doOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __31__CNObservable_doOnCompletion___block_invoke_2;
  v18[3] = &unk_1E56A0AD8;
  id v19 = v3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __31__CNObservable_doOnCompletion___block_invoke_3;
  v15[3] = &unk_1E569FA00;
  id v16 = v19;
  id v17 = *(id *)(a1 + 40);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __31__CNObservable_doOnCompletion___block_invoke_4;
  id v13 = &unk_1E569FBD8;
  id v14 = v16;
  id v6 = v16;
  id v7 = +[CNObserver blockObserverOfClass:v5 withResultBlock:v18 completionBlock:v15 failureBlock:&v10];
  id v8 = objc_msgSend(v4, "subscribe:", v7, v10, v11, v12, v13);

  return v8;
}

id __26__CNObservable_doOnError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __26__CNObservable_doOnError___block_invoke_2;
  v18[3] = &unk_1E56A0AD8;
  id v19 = v3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __26__CNObservable_doOnError___block_invoke_3;
  v16[3] = &unk_1E569F9D8;
  id v17 = v19;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __26__CNObservable_doOnError___block_invoke_4;
  id v13 = &unk_1E56A0B28;
  id v14 = v17;
  id v15 = *(id *)(a1 + 40);
  id v6 = v17;
  id v7 = +[CNObserver blockObserverOfClass:v5 withResultBlock:v18 completionBlock:v16 failureBlock:&v10];
  id v8 = objc_msgSend(v4, "subscribe:", v7, v10, v11, v12, v13);

  return v8;
}

id __64__CNObservable_combineLatest_resultScheduler_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = a2;
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  v4 = [v2 arrayWithObjects:v6 count:1];

  return v4;
}

void __23__CNObservable_filter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) observerDidReceiveResult:v3];
  }
}

+ (id)observableWithResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__CNObservable_observableWithResult___block_invoke;
    v13[3] = &unk_1E56A06F8;
    id v6 = v4;
    id v14 = v6;
    id v7 = +[CNObservable observableWithBlock:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__CNObservable_observableWithResult___block_invoke_2;
    v11[3] = &unk_1E56A0720;
    id v12 = v6;
    id v8 = [v7 pipelineDescription:v11];
  }
  else
  {
    id v9 = +[CNObservable os_log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[CNObservable observableWithResult:](v9);
    }

    id v8 = [a1 emptyObservable];
  }

  return v8;
}

- (id)startWith:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CNScheduler immediateScheduler];
  id v6 = [(CNObservable *)self startWith:v4 scheduler:v5];

  return v6;
}

- (id)startWith:(id)a3 scheduler:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[CNObservable observableWithResults:v6 scheduler:a4];
  v15[0] = v7;
  v15[1] = self;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v9 = +[CNObservable concatenate:v8];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __36__CNObservable_startWith_scheduler___block_invoke;
  v13[3] = &unk_1E56A0720;
  id v14 = v6;
  id v10 = v6;
  uint64_t v11 = [v9 pipelineDescriptionWithOperation:v13 onObservable:self];

  return v11;
}

+ (id)concatenate:(id)a3
{
  id v3 = a3;
  if (![v3 count])
  {
    uint64_t v4 = +[CNObservable emptyObservable];
    goto LABEL_5;
  }
  if ([v3 count] == 1)
  {
    uint64_t v4 = [v3 firstObject];
LABEL_5:
    uint64_t v5 = (void *)v4;
    goto LABEL_7;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __28__CNObservable_concatenate___block_invoke;
  v11[3] = &unk_1E56A06F8;
  id v12 = v3;
  uint64_t v5 = +[CNObservable observableWithBlock:v11];

LABEL_7:
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__CNObservable_concatenate___block_invoke_2;
  v9[3] = &unk_1E56A0720;
  id v10 = v3;
  id v6 = v3;
  id v7 = [v5 pipelineDescription:v9];

  return v7;
}

+ (id)observableWithResults:(id)a3 scheduler:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 copy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__CNObservable_observableWithResults_scheduler___block_invoke;
  v16[3] = &unk_1E56A0838;
  id v17 = v6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__CNObservable_observableWithResults_scheduler___block_invoke_3;
  v14[3] = &unk_1E56A0860;
  id v7 = v17;
  id v15 = v7;
  id v8 = +[CNObservable observableWithInitialState:&unk_1EE04A8A0 condition:v16 nextState:&__block_literal_global_211 resultSelector:v14 scheduler:v5];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__CNObservable_observableWithResults_scheduler___block_invoke_4;
  v12[3] = &unk_1E56A0720;
  id v13 = v7;
  id v9 = v7;
  id v10 = [v8 pipelineDescription:v12];

  return v10;
}

+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 scheduler:(id)a7
{
  return (id)[a1 observableWithInitialState:a3 condition:a4 nextState:a5 resultSelector:a6 delay:0 scheduler:a7];
}

+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [[_CNGeneratorObservable alloc] initWithInitialState:v18 condition:v17 nextState:v16 resultSelector:v15 delay:v14 scheduler:v13];

  return v19;
}

- (id)subscribeOn:(id)a3
{
  id v4 = a3;
  id v5 = [[_CNScheduledObservable alloc] initWithObservable:self scheduler:v4];

  id v6 = [(CNObservable *)v5 pipelineDescriptionWithOperation:&__block_literal_global_278 onObservable:self];

  return v6;
}

- (id)onEmpty:(id)a3
{
  id v4 = a3;
  id v5 = [[_CNOnEmptyObservable alloc] initWithObservable:self nextObservable:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __24__CNObservable_onEmpty___block_invoke;
  v9[3] = &unk_1E56A0720;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(CNObservable *)v5 pipelineDescriptionWithOperation:v9 onObservable:self];

  return v7;
}

- (id)filter:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __23__CNObservable_filter___block_invoke;
  id v13 = &unk_1E56A0B00;
  id v14 = self;
  id v15 = v4;
  id v6 = v4;
  id v7 = [v5 observableWithBlock:&v10];
  id v8 = objc_msgSend(v7, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_379, self, v10, v11, v12, v13, v14);

  return v8;
}

+ (id)observableWithFuture:(id)a3
{
  id v4 = a3;
  id v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = [a1 observableWithFuture:v4 schedulerProvider:v5];

  return v6;
}

+ (id)observableWithFuture:(id)a3 schedulerProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke;
  void v15[3] = &unk_1E56A0748;
  id v7 = v5;
  id v16 = v7;
  id v17 = v6;
  id v8 = v6;
  id v9 = +[CNObservable observableWithBlock:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_4;
  v13[3] = &unk_1E56A0720;
  id v14 = v7;
  id v10 = v7;
  uint64_t v11 = [v9 pipelineDescription:v13];

  return v11;
}

- (id)onError:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __24__CNObservable_onError___block_invoke;
  v12[3] = &unk_1E56A0BF0;
  id v5 = v4;
  id v13 = v5;
  id v6 = [(CNObservable *)self onErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __24__CNObservable_onError___block_invoke_2;
  v10[3] = &unk_1E56A0720;
  id v11 = v5;
  id v7 = v5;
  id v8 = [v6 pipelineDescriptionWithOperation:v10 onObservable:self];

  return v8;
}

- (id)onErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __31__CNObservable_onErrorHandler___block_invoke;
  id v12 = &unk_1E56A0B00;
  id v13 = self;
  id v14 = v4;
  id v5 = v4;
  id v6 = +[CNObservable observableWithBlock:&v9];
  id v7 = objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_416, self, v9, v10, v11, v12, v13);

  return v7;
}

- (id)doOnNext:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __25__CNObservable_doOnNext___block_invoke;
  id v12 = &unk_1E56A0B00;
  id v13 = self;
  id v14 = v4;
  id v5 = v4;
  id v6 = +[CNObservable observableWithBlock:&v9];
  id v7 = objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_360, self, v9, v10, v11, v12, v13);

  return v7;
}

- (id)doOnError:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __26__CNObservable_doOnError___block_invoke;
  id v12 = &unk_1E56A0B00;
  id v13 = self;
  id v14 = v4;
  id v5 = v4;
  id v6 = +[CNObservable observableWithBlock:&v9];
  id v7 = objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_354, self, v9, v10, v11, v12, v13);

  return v7;
}

- (id)doOnCancel:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __27__CNObservable_doOnCancel___block_invoke;
  id v12 = &unk_1E56A0B00;
  id v13 = self;
  id v14 = v4;
  id v5 = v4;
  id v6 = +[CNObservable observableWithBlock:&v9];
  id v7 = objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_342, self, v9, v10, v11, v12, v13);

  return v7;
}

+ (id)combineLatest:(id)a3 resultScheduler:(id)a4 schedulerProvider:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [v10 addObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  if ((unint64_t)[v10 count] < 2)
  {
    if ([v10 count])
    {
      id v17 = [v10 firstObject];
      id v18 = [v17 map:&__block_literal_global_256];

      id v19 = [v18 observeOn:v8];

      goto LABEL_14;
    }
    id v16 = +[CNObservable emptyObservable];
  }
  else
  {
    id v16 = [[_CNCombineLatestObservable alloc] initWithObservables:v10 resultScheduler:v8 schedulerProvider:v9];
  }
  id v19 = v16;
LABEL_14:
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__CNObservable_combineLatest_resultScheduler_schedulerProvider___block_invoke_2;
  v23[3] = &unk_1E56A0720;
  id v24 = v10;
  id v20 = v10;
  v21 = [v19 pipelineDescription:v23];

  return v21;
}

- (id)map:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __20__CNObservable_map___block_invoke;
  uint64_t v12 = &unk_1E56A0B00;
  uint64_t v13 = self;
  id v14 = v4;
  id v5 = v4;
  id v6 = +[CNMapObservable observableWithBlock:&v9];
  id v7 = objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_396, self, v9, v10, v11, v12, v13);

  return v7;
}

- (id)distinctUntilChanged
{
  id v3 = [[_CNDistinctUntilChangedObservable alloc] initWithObservable:self];
  id v4 = [(CNObservable *)v3 pipelineDescriptionWithOperation:&__block_literal_global_336 onObservable:self];

  return v4;
}

- (id)doOnCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __31__CNObservable_doOnCompletion___block_invoke;
  uint64_t v12 = &unk_1E56A0B00;
  uint64_t v13 = self;
  id v14 = v4;
  id v5 = v4;
  id v6 = +[CNObservable observableWithBlock:&v9];
  id v7 = objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_348, self, v9, v10, v11, v12, v13);

  return v7;
}

- (id)observeOn:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, v4);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __26__CNObservable_observeOn___block_invoke;
    v8[3] = &unk_1E56A09F0;
    v8[4] = self;
    objc_copyWeak(&v9, &location);
    id v5 = +[CNObservable observableWithBlock:v8];
    id v6 = [v5 pipelineDescriptionWithOperation:&__block_literal_global_286 onObservable:self];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = self;
  }

  return v6;
}

- (id)doOnTerminate:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __30__CNObservable_doOnTerminate___block_invoke;
  uint64_t v12 = &unk_1E56A0B78;
  uint64_t v13 = self;
  id v14 = v4;
  id v5 = v4;
  id v6 = +[CNObservable observableWithBlock:&v9];
  id v7 = objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_371, self, v9, v10, v11, v12, v13);

  return v7;
}

+ (id)observableWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = [[_CNBlockObservable alloc] initWithBlock:v3];

  id v5 = [(CNObservable *)v4 pipelineDescription:&__block_literal_global_165];

  return v5;
}

+ (id)emptyObservable
{
  if (emptyObservable_cn_once_token_5 != -1) {
    dispatch_once(&emptyObservable_cn_once_token_5, &__block_literal_global_240);
  }
  id v2 = (void *)emptyObservable_cn_once_object_5;

  return v2;
}

- (id)allObjects:(id *)a3
{
  id v5 = objc_alloc_init(CNPromise);
  id v6 = [(CNPromise *)v5 completionHandlerAdapter];
  id v7 = +[CNObserver observerWithCompletionHandler:v6];

  id v8 = [(CNObservable *)self subscribe:v7];
  uint64_t v9 = [(CNPromise *)v5 future];
  uint64_t v10 = [v9 result:a3];

  return v10;
}

CNObservableWithResultCancelationToken *__37__CNObservable_observableWithResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 observerDidReceiveResult:v2];
  [v3 observerDidComplete];

  id v4 = objc_alloc_init(CNObservableWithResultCancelationToken);

  return v4;
}

uint64_t __26__CNObservable_doOnError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

void __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0) {
    [*(id *)(a1 + 40) observerDidFailWithError:v3];
  }
}

void __43__CNObservable_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (([WeakRetained isCanceled] & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    (*(void (**)(void))(v5 + 16))();
  }
}

void __26__CNObservable_observeOn___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (([WeakRetained isCanceled] & 1) == 0) {
    [*(id *)(a1 + 32) observerDidReceiveResult:*(void *)(a1 + 40)];
  }
}

void __31__CNObservable_onErrorHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 subscribe:*(void *)(a1 + 32)];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained addCancelable:v5];
  }
  else
  {
    [*(id *)(a1 + 32) observerDidFailWithError:v7];
  }
}

uint64_t __25__CNObservable_doOnNext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

id __24__CNObservable_onError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __20__CNObservable_map___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

BOOL __48__CNObservable_observableWithResults_scheduler___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 unsignedIntegerValue];
  return v3 < [*(id *)(a1 + 32) count];
}

void __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    [*(id *)(a1 + 40) observerDidReceiveResult:v3];
    [*(id *)(a1 + 40) observerDidComplete];
  }
}

uint64_t __30__CNObservable_doOnTerminate___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) observerDidComplete];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

intptr_t __43__CNObservable_enumerateObjectsUsingBlock___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __31__CNObservable_doOnCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) observerDidComplete];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __27__CNObservable_doOnCancel___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __26__CNObservable_observeOn___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained isCanceled] & 1) == 0) {
    [*(id *)(a1 + 32) observerDidComplete];
  }
}

uint64_t __20__CNObservable_map___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __23__CNObservable_filter___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

void __26__CNObservable_observeOn___block_invoke_4(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__CNObservable_observeOn___block_invoke_5;
  v3[3] = &unk_1E569FDB8;
  objc_copyWeak(&v5, a1 + 6);
  id v4 = a1[4];
  [WeakRetained performBlock:v3];

  objc_destroyWeak(&v5);
}

CNConcatenateCancelationToken *__28__CNObservable_concatenate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(CNConcatenateCancelationToken);
  +[_CNConcatenatingObservable subscribeObserver:v3 toObservables:*(void *)(a1 + 32) unless:v4];

  return v4;
}

uint64_t __48__CNObservable_observableWithResults_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 unsignedIntegerValue] + 1;

  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __48__CNObservable_observableWithResults_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 unsignedIntegerValue];

  return [v2 objectAtIndex:v3];
}

uint64_t __27__CNObservable_doOnCancel___block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

id __25__CNObservable_doOnNext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __25__CNObservable_doOnNext___block_invoke_2;
  v17[3] = &unk_1E56A0B50;
  id v19 = *(id *)(a1 + 40);
  id v18 = v3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __25__CNObservable_doOnNext___block_invoke_3;
  void v15[3] = &unk_1E569F9D8;
  id v16 = v18;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __25__CNObservable_doOnNext___block_invoke_4;
  uint64_t v13 = &unk_1E569FBD8;
  id v14 = v16;
  id v6 = v16;
  id v7 = +[CNObserver blockObserverOfClass:v5 withResultBlock:v17 completionBlock:v15 failureBlock:&v10];
  id v8 = objc_msgSend(v4, "subscribe:", v7, v10, v11, v12, v13);

  return v8;
}

id __20__CNObservable_map___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __20__CNObservable_map___block_invoke_2;
  v17[3] = &unk_1E56A0BC8;
  id v18 = v3;
  id v19 = *(id *)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __20__CNObservable_map___block_invoke_3;
  void v15[3] = &unk_1E569F9D8;
  id v16 = v18;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __20__CNObservable_map___block_invoke_4;
  uint64_t v13 = &unk_1E569FBD8;
  id v14 = v16;
  id v6 = v16;
  id v7 = +[CNObserver blockObserverOfClass:v5 withResultBlock:v17 completionBlock:v15 failureBlock:&v10];
  id v8 = objc_msgSend(v4, "subscribe:", v7, v10, v11, v12, v13);

  return v8;
}

CNObserveOnCancelationToken *__26__CNObservable_observeOn___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(CNObserveOnCancelationToken);
  objc_initWeak(location, v4);
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __26__CNObservable_observeOn___block_invoke_2;
  v21[3] = &unk_1E56A0978;
  a1 += 40;
  objc_copyWeak(&v23, (id *)a1);
  objc_copyWeak(&v24, location);
  id v6 = v3;
  id v22 = v6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __26__CNObservable_observeOn___block_invoke_4;
  v17[3] = &unk_1E56A09A0;
  objc_copyWeak(&v19, (id *)a1);
  objc_copyWeak(&v20, location);
  id v7 = v6;
  id v18 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __26__CNObservable_observeOn___block_invoke_6;
  v13[3] = &unk_1E56A09C8;
  objc_copyWeak(&v15, (id *)a1);
  objc_copyWeak(&v16, location);
  id v8 = v7;
  id v14 = v8;
  uint64_t v9 = +[CNObserver blockObserverOfClass:v5 withResultBlock:v21 completionBlock:v17 failureBlock:v13];
  uint64_t v10 = [v12 subscribe:v9];

  [(CNCancelationToken *)v4 addCancelable:v10];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(location);

  return v4;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(CNEnumerateObjectsUsingBlockCancelationToken);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  objc_initWeak(&location, v5);
  uint64_t v7 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__CNObservable_enumerateObjectsUsingBlock___block_invoke;
  v16[3] = &unk_1E56A0BA0;
  objc_copyWeak(&v20, &location);
  id v8 = v4;
  id v18 = v8;
  id v19 = v22;
  id v17 = v6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__CNObservable_enumerateObjectsUsingBlock___block_invoke_2;
  v14[3] = &unk_1E569F9D8;
  id v15 = v17;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__CNObservable_enumerateObjectsUsingBlock___block_invoke_3;
  v12[3] = &unk_1E569FBD8;
  uint64_t v9 = v15;
  uint64_t v13 = v9;
  uint64_t v10 = +[CNObserver blockObserverOfClass:v7 withResultBlock:v16 completionBlock:v14 failureBlock:v12];
  uint64_t v11 = [(CNObservable *)self subscribe:v10];

  [(CNCancelationToken *)v5 addCancelable:v11];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);
}

id __27__CNObservable_doOnCancel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 1;
  id v4 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __27__CNObservable_doOnCancel___block_invoke_2;
  v12[3] = &unk_1E569FC28;
  void v12[4] = v13;
  uint64_t v5 = [v4 doOnTerminate:v12];
  dispatch_semaphore_t v6 = [v5 subscribe:v3];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __27__CNObservable_doOnCancel___block_invoke_3;
  v9[3] = &unk_1E569F2E8;
  uint64_t v11 = v13;
  id v10 = *(id *)(a1 + 40);
  uint64_t v7 = +[CNCancelationToken tokenWithCancelationBlock:v9];
  [v7 addCancelable:v6];

  _Block_object_dispose(v13, 8);

  return v7;
}

CNObservableWithFutureCancelationToken *__55__CNObservable_observableWithFuture_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(CNObservableWithFutureCancelationToken);
  uint64_t v5 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_2;
  v20[3] = &unk_1E56A0518;
  dispatch_semaphore_t v6 = v4;
  v21 = v6;
  id v7 = v3;
  id v22 = v7;
  id v8 = [*(id *)(a1 + 40) immediateScheduler];
  [v5 addSuccessBlock:v20 scheduler:v8];

  uint64_t v9 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_3;
  v17[3] = &unk_1E569FB88;
  id v10 = v6;
  id v18 = v10;
  id v19 = v7;
  uint64_t v11 = *(void **)(a1 + 40);
  id v12 = v7;
  uint64_t v13 = objc_msgSend(v11, "immediateScheduler", v17[0], 3221225472, __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_3, &unk_1E569FB88);
  [v9 addFailureBlock:v17 scheduler:v13];

  char v14 = v19;
  id v15 = v10;

  return v15;
}

CNCancelationToken *__31__CNObservable_onErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(CNCancelationToken);
  objc_initWeak(&location, v4);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = objc_opt_class();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __31__CNObservable_onErrorHandler___block_invoke_2;
  v20[3] = &unk_1E56A0AD8;
  id v21 = v3;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __31__CNObservable_onErrorHandler___block_invoke_3;
  v18[3] = &unk_1E569F9D8;
  id v19 = v21;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __31__CNObservable_onErrorHandler___block_invoke_4;
  char v14 = &unk_1E56A0C18;
  id v16 = *(id *)(a1 + 40);
  id v7 = v19;
  id v15 = v7;
  objc_copyWeak(&v17, &location);
  id v8 = +[CNObserver blockObserverOfClass:v6 withResultBlock:v20 completionBlock:v18 failureBlock:&v11];
  uint64_t v9 = objc_msgSend(v5, "subscribe:", v8, v11, v12, v13, v14);

  [(CNCancelationToken *)v4 addCancelable:v9];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);

  return v4;
}

id __23__CNObservable_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __23__CNObservable_filter___block_invoke_2;
  v17[3] = &unk_1E56A0B50;
  id v19 = *(id *)(a1 + 40);
  id v18 = v3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __23__CNObservable_filter___block_invoke_3;
  void v15[3] = &unk_1E569F9D8;
  id v16 = v18;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __23__CNObservable_filter___block_invoke_4;
  uint64_t v13 = &unk_1E569FBD8;
  id v14 = v16;
  id v6 = v16;
  id v7 = +[CNObserver blockObserverOfClass:v5 withResultBlock:v17 completionBlock:v15 failureBlock:&v10];
  id v8 = objc_msgSend(v4, "subscribe:", v7, v10, v11, v12, v13);

  return v8;
}

uint64_t __31__CNObservable_emptyObservable__block_invoke()
{
  emptyObservable_cn_once_object_5 = objc_alloc_init(_CNEmptyObservable);

  return MEMORY[0x1F41817F8]();
}

+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[CNScheduler immediateScheduler];
  id v15 = [a1 observableWithInitialState:v13 condition:v12 nextState:v11 resultSelector:v10 scheduler:v14];

  return v15;
}

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_1_6 != -1) {
    dispatch_once(&os_log_cn_once_token_1_6, &__block_literal_global_157);
  }
  uint64_t v2 = (void *)os_log_cn_once_object_1_6;

  return (OS_os_log *)v2;
}

uint64_t __22__CNObservable_os_log__block_invoke()
{
  os_log_cn_once_object_1_6 = (uint64_t)os_log_create("com.apple.contacts.rx", "general");

  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)os_log_protocol
{
  if (os_log_protocol_cn_once_token_2 != -1) {
    dispatch_once(&os_log_protocol_cn_once_token_2, &__block_literal_global_161);
  }
  uint64_t v2 = (void *)os_log_protocol_cn_once_object_2;

  return (OS_os_log *)v2;
}

uint64_t __31__CNObservable_os_log_protocol__block_invoke()
{
  os_log_protocol_cn_once_object_2 = (uint64_t)os_log_create("com.apple.contacts.rx", "protocol");

  return MEMORY[0x1F41817F8]();
}

uint64_t __36__CNObservable_observableWithBlock___block_invoke()
{
  return [NSString stringWithFormat:@"Block Observable"];
}

uint64_t __37__CNObservable_observableWithResult___block_invoke_2(uint64_t a1)
{
  return [NSString stringWithFormat:@"Observable with Result(%@)", *(void *)(a1 + 32)];
}

uint64_t __55__CNObservable_observableWithFuture_schedulerProvider___block_invoke_4(uint64_t a1)
{
  return [NSString stringWithFormat:@"Observable with Future(%@)", *(void *)(a1 + 32)];
}

+ (id)observableWithFutures:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = [a1 observableWithFutures:v4 schedulerProvider:v5];

  return v6;
}

+ (id)observableWithFutures:(id)a3 schedulerProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__CNObservable_observableWithFutures_schedulerProvider___block_invoke;
  void v15[3] = &unk_1E56A0770;
  id v16 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(v5, "_cn_map:", v15);
  uint64_t v9 = +[CNObservable merge:v8 schedulerProvider:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__CNObservable_observableWithFutures_schedulerProvider___block_invoke_2;
  void v13[3] = &unk_1E56A0720;
  id v14 = v5;
  id v10 = v5;
  id v11 = [v9 pipelineDescription:v13];

  return v11;
}

CNObservable *__56__CNObservable_observableWithFutures_schedulerProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNObservable observableWithFuture:a2 schedulerProvider:*(void *)(a1 + 32)];
}

uint64_t __56__CNObservable_observableWithFutures_schedulerProvider___block_invoke_2(uint64_t a1)
{
  return [NSString stringWithFormat:@"Observable with Futures(%@)", *(void *)(a1 + 32)];
}

+ (id)observableWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = +[CNScheduler immediateScheduler];
  id v7 = objc_msgSend(a1, "observableWithRange:scheduler:", location, length, v6);

  return v7;
}

+ (id)observableWithRange:(_NSRange)a3 scheduler:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = NSNumber;
  id v8 = a4;
  uint64_t v9 = [v7 numberWithUnsignedInteger:location];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__CNObservable_observableWithRange_scheduler___block_invoke;
  v14[3] = &__block_descriptor_48_e18_B16__0__NSNumber_8l;
  void v14[4] = location;
  v14[5] = length;
  id v10 = [a1 observableWithInitialState:v9 condition:v14 nextState:&__block_literal_global_192 resultSelector:&__block_literal_global_194 scheduler:v8];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__CNObservable_observableWithRange_scheduler___block_invoke_4;
  void v13[3] = &__block_descriptor_48_e15___NSString_8__0l;
  void v13[4] = location;
  v13[5] = length;
  id v11 = [v10 pipelineDescription:v13];

  return v11;
}

BOOL __46__CNObservable_observableWithRange_scheduler___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 unsignedIntegerValue];
  unint64_t v4 = *(void *)(a1 + 32);
  BOOL v6 = v3 >= v4;
  unint64_t v5 = v3 - v4;
  BOOL v6 = !v6 || v5 >= *(void *)(a1 + 40);
  return !v6;
}

uint64_t __46__CNObservable_observableWithRange_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 unsignedIntegerValue] + 1;

  return [v2 numberWithUnsignedInteger:v3];
}

id __46__CNObservable_observableWithRange_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

id __46__CNObservable_observableWithRange_scheduler___block_invoke_4(uint64_t a1)
{
  id v2 = NSString;
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  unint64_t v5 = [v2 stringWithFormat:@"Observable with Range(%@,%@)", v3, v4];

  return v5;
}

+ (id)observableWithRange:(_NSRange)a3 interval:(double)a4 scheduler:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v9 = NSNumber;
  id v10 = a5;
  id v11 = [v9 numberWithUnsignedInteger:location];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__CNObservable_observableWithRange_interval_scheduler___block_invoke;
  v17[3] = &__block_descriptor_48_e18_B16__0__NSNumber_8l;
  void v17[4] = location;
  v17[5] = length;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_4;
  v16[3] = &__block_descriptor_40_e8_d16__0_8l;
  *(double *)&void v16[4] = a4;
  id v12 = [a1 observableWithInitialState:v11 condition:v17 nextState:&__block_literal_global_200 resultSelector:&__block_literal_global_202 delay:v16 scheduler:v10];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_5;
  void v15[3] = &__block_descriptor_56_e15___NSString_8__0l;
  void v15[4] = location;
  v15[5] = length;
  *(double *)&v15[6] = a4;
  id v13 = [v12 pipelineDescription:v15];

  return v13;
}

BOOL __55__CNObservable_observableWithRange_interval_scheduler___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 unsignedIntegerValue];
  unint64_t v4 = *(void *)(a1 + 32);
  BOOL v6 = v3 >= v4;
  unint64_t v5 = v3 - v4;
  BOOL v6 = !v6 || v5 >= *(void *)(a1 + 40);
  return !v6;
}

uint64_t __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 unsignedIntegerValue] + 1;

  return [v2 numberWithUnsignedInteger:v3];
}

id __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

double __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

id __55__CNObservable_observableWithRange_interval_scheduler___block_invoke_5(uint64_t a1)
{
  id v2 = NSString;
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  double v5 = *(double *)(a1 + 48);
  if (v5 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 48));
  }
  else {
  BOOL v6 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v5 * 1000.0);
  }
  id v7 = [v2 stringWithFormat:@"Observable with Range(%@, %@, %@ apart)", v3, v4, v6];

  return v7;
}

+ (id)observableWithResults:(id)a3
{
  id v4 = a3;
  double v5 = +[CNScheduler immediateScheduler];
  BOOL v6 = [a1 observableWithResults:v4 scheduler:v5];

  return v6;
}

uint64_t __48__CNObservable_observableWithResults_scheduler___block_invoke_4(uint64_t a1)
{
  return [NSString stringWithFormat:@"Observable with Results(%@)", *(void *)(a1 + 32)];
}

+ (id)observableWithResults:(id)a3 interval:(double)a4 scheduler:(id)a5
{
  id v7 = a5;
  id v8 = (void *)[a3 copy];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__CNObservable_observableWithResults_interval_scheduler___block_invoke;
  v20[3] = &unk_1E56A0838;
  id v21 = v8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_3;
  v18[3] = &unk_1E56A0860;
  id v9 = v21;
  id v19 = v9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_4;
  v17[3] = &__block_descriptor_40_e8_d16__0_8l;
  *(double *)&void v17[4] = a4;
  id v10 = +[CNObservable observableWithInitialState:&unk_1EE04A8A0 condition:v20 nextState:&__block_literal_global_216 resultSelector:v18 delay:v17 scheduler:v7];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_5;
  v14[3] = &unk_1E56A0888;
  id v15 = v9;
  double v16 = a4;
  id v11 = v9;
  id v12 = [v10 pipelineDescription:v14];

  return v12;
}

BOOL __57__CNObservable_observableWithResults_interval_scheduler___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 unsignedIntegerValue];
  return v3 < [*(id *)(a1 + 32) count];
}

uint64_t __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 unsignedIntegerValue] + 1;

  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 unsignedIntegerValue];

  return [v2 objectAtIndex:v3];
}

double __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

id __57__CNObservable_observableWithResults_interval_scheduler___block_invoke_5(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  if (v3 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 40));
  }
  else {
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v3 * 1000.0);
  }
  double v5 = [v1 stringWithFormat:@"Observable with Results(%@, %@ apart)", v2, v4];

  return v5;
}

+ (id)observableWithError:(id)a3
{
  id v3 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__CNObservable_observableWithError___block_invoke;
  v11[3] = &unk_1E56A06F8;
  id v4 = v3;
  id v12 = v4;
  double v5 = +[CNObservable observableWithBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__CNObservable_observableWithError___block_invoke_2;
  v9[3] = &unk_1E56A0720;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 pipelineDescription:v9];

  return v7;
}

CNObservableWithErrorCancelationToken *__36__CNObservable_observableWithError___block_invoke(uint64_t a1, void *a2)
{
  [a2 observerDidFailWithError:*(void *)(a1 + 32)];
  uint64_t v2 = objc_alloc_init(CNObservableWithErrorCancelationToken);

  return v2;
}

id __36__CNObservable_observableWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = NSString;
  id v3 = [*(id *)(a1 + 32) domain];
  id v4 = [v2 stringWithFormat:@"Observable with Error(%@, code %ld)", v3, objc_msgSend(*(id *)(a1 + 32), "code")];

  return v4;
}

+ (id)observableWithTimeInterval:(double)a3 scheduler:(id)a4
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_4;
  v9[3] = &__block_descriptor_40_e8_d16__0_8l;
  *(double *)&void v9[4] = a3;
  double v5 = +[CNObservable observableWithInitialState:&unk_1EE04A8A0 condition:&__block_literal_global_226 nextState:&__block_literal_global_228 resultSelector:&__block_literal_global_231 delay:v9 scheduler:a4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_5;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&v8[4] = a3;
  id v6 = [v5 pipelineDescription:v8];

  return v6;
}

uint64_t __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke()
{
  return 1;
}

uint64_t __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 unsignedLongLongValue] + 1;

  return [v2 numberWithUnsignedLongLong:v3];
}

id __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

double __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

id __53__CNObservable_observableWithTimeInterval_scheduler___block_invoke_5(uint64_t a1)
{
  v1 = NSString;
  double v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 32));
  }
  else {
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v2 * 1000.0);
  }
  id v4 = [v1 stringWithFormat:@"Observable with TimeInterval(%@)", v3];

  return v4;
}

+ (id)neverObservable
{
  if (neverObservable_cn_once_token_4 != -1) {
    dispatch_once(&neverObservable_cn_once_token_4, &__block_literal_global_237);
  }
  double v2 = (void *)neverObservable_cn_once_object_4;

  return v2;
}

uint64_t __31__CNObservable_neverObservable__block_invoke()
{
  neverObservable_cn_once_object_4 = objc_alloc_init(_CNNeverObservable);

  return MEMORY[0x1F41817F8]();
}

+ (id)timerWithDelay:(double)a3
{
  double v5 = +[CNScheduler globalAsyncScheduler];
  id v6 = [a1 timerWithDelay:v5 scheduler:a3];

  return v6;
}

+ (id)timerWithDelay:(double)a3 scheduler:(id)a4
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__CNObservable_timerWithDelay_scheduler___block_invoke_4;
  v9[3] = &__block_descriptor_40_e8_d16__0_8l;
  *(double *)&void v9[4] = a3;
  double v5 = [a1 observableWithInitialState:&unk_1EE04A8A0 condition:&__block_literal_global_243 nextState:&__block_literal_global_245 resultSelector:&__block_literal_global_247 delay:v9 scheduler:a4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__CNObservable_timerWithDelay_scheduler___block_invoke_5;
  v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&v8[4] = a3;
  id v6 = [v5 pipelineDescription:v8];

  return v6;
}

BOOL __41__CNObservable_timerWithDelay_scheduler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 unsignedIntegerValue] == 0;
}

uint64_t __41__CNObservable_timerWithDelay_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = NSNumber;
  uint64_t v3 = [a2 unsignedIntegerValue] + 1;

  return [v2 numberWithUnsignedInteger:v3];
}

id __41__CNObservable_timerWithDelay_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

double __41__CNObservable_timerWithDelay_scheduler___block_invoke_4(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

id __41__CNObservable_timerWithDelay_scheduler___block_invoke_5(uint64_t a1)
{
  v1 = NSString;
  double v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 32));
  }
  else {
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v2 * 1000.0);
  }
  id v4 = [v1 stringWithFormat:@"Timer(%@)", v3];

  return v4;
}

+ (id)amb:(id)a3
{
  id v3 = a3;
  id v4 = [[_CNAmbObservable alloc] initWithObservables:v3];

  return v4;
}

+ (id)combineLatest:(id)a3
{
  id v4 = a3;
  double v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = [a1 combineLatest:v4 schedulerProvider:v5];

  return v6;
}

+ (id)combineLatest:(id)a3 schedulerProvider:(id)a4
{
  return (id)[a1 combineLatest:a3 resultScheduler:0 schedulerProvider:a4];
}

id __64__CNObservable_combineLatest_resultScheduler_schedulerProvider___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  double v2 = objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_698);
  id v3 = [v2 componentsJoinedByString:@", "];

  id v4 = [v1 stringWithFormat:@"CombineLatest(%@)", v3];

  return v4;
}

id __28__CNObservable_concatenate___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  double v2 = objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_698);
  id v3 = [v2 componentsJoinedByString:@", "];

  id v4 = [v1 stringWithFormat:@"Concatenate(%@)", v3];

  return v4;
}

+ (id)forkJoin:(id)a3 scheduler:(id)a4
{
  id v4 = a3;
  double v5 = +[_CNForkJoinObservable forkJoin:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__CNObservable_forkJoin_scheduler___block_invoke;
  v9[3] = &unk_1E56A0720;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 pipelineDescription:v9];

  return v7;
}

id __35__CNObservable_forkJoin_scheduler___block_invoke(uint64_t a1)
{
  v1 = NSString;
  double v2 = objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_698);
  id v3 = [v2 componentsJoinedByString:@", "];

  id v4 = [v1 stringWithFormat:@"ForkJoin(%@)", v3];

  return v4;
}

+ (id)merge:(id)a3
{
  id v4 = a3;
  double v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = [a1 merge:v4 schedulerProvider:v5];

  return v6;
}

+ (id)merge:(id)a3 schedulerProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 count])
  {
    uint64_t v7 = +[CNObservable emptyObservable];
    goto LABEL_5;
  }
  if ([v5 count] == 1)
  {
    uint64_t v7 = [v5 firstObject];
LABEL_5:
    id v8 = (void *)v7;
    goto LABEL_7;
  }
  id v9 = +[CNObservable observableWithResults:v5];
  id v10 = [v9 flatMap:&__block_literal_global_76 schedulerProvider:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__CNObservable_merge_schedulerProvider___block_invoke;
  v12[3] = &unk_1E56A0720;
  id v13 = v5;
  id v8 = [v10 pipelineDescription:v12];

LABEL_7:

  return v8;
}

id __40__CNObservable_merge_schedulerProvider___block_invoke(uint64_t a1)
{
  v1 = NSString;
  double v2 = objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_698);
  id v3 = [v2 componentsJoinedByString:@", "];

  id v4 = [v1 stringWithFormat:@"Merge(%@)", v3];

  return v4;
}

+ (id)progressiveForkJoin:(id)a3 scheduler:(id)a4
{
  id v4 = a3;
  id v5 = +[_CNForkJoinObservable progressiveForkJoin:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__CNObservable_progressiveForkJoin_scheduler___block_invoke;
  v9[3] = &unk_1E56A0720;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 pipelineDescription:v9];

  return v7;
}

id __46__CNObservable_progressiveForkJoin_scheduler___block_invoke(uint64_t a1)
{
  v1 = NSString;
  double v2 = objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_698);
  id v3 = [v2 componentsJoinedByString:@", "];

  id v4 = [v1 stringWithFormat:@"ProgressiveForkJoin(%@)", v3];

  return v4;
}

__CFString *__28__CNObservable_subscribeOn___block_invoke()
{
  return @"subscribeOn";
}

void __26__CNObservable_observeOn___block_invoke_6(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __26__CNObservable_observeOn___block_invoke_7;
  v6[3] = &unk_1E56A0950;
  objc_copyWeak(&v9, a1 + 6);
  id v7 = a1[4];
  id v5 = v3;
  id v8 = v5;
  [WeakRetained performBlock:v6];

  objc_destroyWeak(&v9);
}

void __26__CNObservable_observeOn___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (([WeakRetained isCanceled] & 1) == 0) {
    [*(id *)(a1 + 32) observerDidFailWithError:*(void *)(a1 + 40)];
  }
}

__CFString *__26__CNObservable_observeOn___block_invoke_8()
{
  return @"observeOn";
}

- (id)ambWith:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = self;
  v8[1] = a3;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:v8 count:2];
  id v6 = +[CNObservable amb:v5];

  return v6;
}

- (id)any:(id)a3
{
  id v3 = [(CNObservable *)self filter:a3];
  id v4 = [v3 take:1];
  id v5 = [v4 map:&__block_literal_global_293];

  id v6 = +[CNObservable observableWithResult:MEMORY[0x1E4F1CC28]];
  id v7 = [v5 onEmpty:v6];

  return v7;
}

uint64_t __20__CNObservable_any___block_invoke()
{
  return MEMORY[0x1E4F1CC38];
}

- (id)buffer:(unint64_t)a3
{
  id v5 = [[_CNBufferingObservable alloc] initWithLength:a3 observable:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __23__CNObservable_buffer___block_invoke;
  void v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v8[4] = a3;
  id v6 = [(CNObservable *)v5 pipelineDescriptionWithOperation:v8 onObservable:self];

  return v6;
}

id __23__CNObservable_buffer___block_invoke(uint64_t a1)
{
  v1 = NSString;
  double v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  id v3 = [v1 stringWithFormat:@"buffer(%@)", v2];

  return v3;
}

- (id)buffer:(unint64_t)a3 interval:(double)a4
{
  id v7 = +[CNScheduler globalAsyncScheduler];
  id v8 = [(CNObservable *)self buffer:a3 interval:v7 scheduler:a4];

  return v8;
}

- (id)buffer:(unint64_t)a3 interval:(double)a4 scheduler:(id)a5
{
  id v8 = a5;
  id v9 = [[_CNBufferingObservable alloc] initWithLength:a3 timeInterval:v8 scheduler:self observable:a4];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__CNObservable_buffer_interval_scheduler___block_invoke;
  v12[3] = &__block_descriptor_48_e15___NSString_8__0l;
  void v12[4] = a3;
  *(double *)&void v12[5] = a4;
  id v10 = [(CNObservable *)v9 pipelineDescriptionWithOperation:v12 onObservable:self];

  return v10;
}

id __42__CNObservable_buffer_interval_scheduler___block_invoke(uint64_t a1)
{
  double v2 = NSString;
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  double v4 = *(double *)(a1 + 40);
  if (v4 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 40));
  }
  else {
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v4 * 1000.0);
  }
  id v6 = [v2 stringWithFormat:@"buffer(%@,%@)", v3, v5];

  return v6;
}

- (id)bufferWithInterval:(double)a3
{
  id v5 = +[CNScheduler globalAsyncScheduler];
  id v6 = [(CNObservable *)self bufferWithInterval:v5 scheduler:a3];

  return v6;
}

- (id)bufferWithInterval:(double)a3 scheduler:(id)a4
{
  id v6 = a4;
  id v7 = [[_CNBufferingObservable alloc] initWithTimeInterval:v6 scheduler:self observable:a3];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__CNObservable_bufferWithInterval_scheduler___block_invoke;
  v10[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&void v10[4] = a3;
  id v8 = [(CNObservable *)v7 pipelineDescriptionWithOperation:v10 onObservable:self];

  return v8;
}

id __45__CNObservable_bufferWithInterval_scheduler___block_invoke(uint64_t a1)
{
  v1 = NSString;
  double v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 32));
  }
  else {
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v2 * 1000.0);
  }
  double v4 = [v1 stringWithFormat:@"buffer(%@)", v3];

  return v4;
}

- (id)concatMap:(id)a3
{
  id v4 = a3;
  id v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = [(CNObservable *)self concatMap:v4 schedulerProvider:v5];

  return v6;
}

- (id)concatMap:(id)a3 schedulerProvider:(id)a4
{
  id v5 = +[_CNFlatMapObservable concatMapWithObservable:self transform:a3 schedulerProvider:a4];
  id v6 = [v5 pipelineDescriptionWithOperation:&__block_literal_global_303 onObservable:self];

  return v6;
}

__CFString *__44__CNObservable_concatMap_schedulerProvider___block_invoke()
{
  return @"concatmap";
}

- (id)delay:(double)a3 scheduler:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__CNObservable_delay_scheduler___block_invoke;
  v12[3] = &unk_1E56A0AB0;
  double v15 = a3;
  id v13 = v6;
  id v14 = self;
  id v7 = v6;
  id v8 = +[CNObservable observableWithBlock:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__CNObservable_delay_scheduler___block_invoke_8;
  v11[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&void v11[4] = a3;
  id v9 = [v8 pipelineDescriptionWithOperation:v11 onObservable:self];

  return v9;
}

CNDelayCancelationToken *__32__CNObservable_delay_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(CNDelayCancelationToken);
  uint64_t v5 = objc_opt_class();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __32__CNObservable_delay_scheduler___block_invoke_2;
  v26[3] = &unk_1E56A0A38;
  long long v27 = v4;
  id v28 = *(id *)(a1 + 32);
  uint64_t v30 = *(void *)(a1 + 48);
  id v29 = v3;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __32__CNObservable_delay_scheduler___block_invoke_4;
  v21[3] = &unk_1E56A0A60;
  id v22 = v27;
  id v23 = *(id *)(a1 + 32);
  uint64_t v25 = *(void *)(a1 + 48);
  id v24 = v29;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __32__CNObservable_delay_scheduler___block_invoke_6;
  double v16 = &unk_1E56A0A88;
  id v6 = v22;
  id v17 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 48);
  id v18 = v7;
  id v19 = v24;
  id v8 = v24;
  id v9 = +[CNObserver blockObserverOfClass:v5 withResultBlock:v26 completionBlock:v21 failureBlock:&v13];
  id v10 = objc_msgSend(*(id *)(a1 + 40), "subscribe:", v9, v13, v14, v15, v16);
  [(CNCancelationToken *)v6 addCancelable:v10];
  id v11 = v6;

  return v11;
}

void __32__CNObservable_delay_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  double v6 = *(double *)(a1 + 56);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __32__CNObservable_delay_scheduler___block_invoke_3;
  id v12 = &unk_1E569F310;
  id v13 = *(id *)(a1 + 48);
  id v14 = v3;
  id v7 = v3;
  id v8 = [v5 afterDelay:&v9 performBlock:v6];
  objc_msgSend(v4, "addCancelable:", v8, v9, v10, v11, v12);
}

uint64_t __32__CNObservable_delay_scheduler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:*(void *)(a1 + 40)];
}

void __32__CNObservable_delay_scheduler___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  double v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__CNObservable_delay_scheduler___block_invoke_5;
  v5[3] = &unk_1E569F9D8;
  id v6 = *(id *)(a1 + 48);
  id v4 = [v2 afterDelay:v5 performBlock:v3];
  [v1 addCancelable:v4];
}

uint64_t __32__CNObservable_delay_scheduler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

void __32__CNObservable_delay_scheduler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  double v6 = *(double *)(a1 + 56);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __32__CNObservable_delay_scheduler___block_invoke_7;
  id v12 = &unk_1E569F310;
  id v13 = *(id *)(a1 + 48);
  id v14 = v3;
  id v7 = v3;
  id v8 = [v5 afterDelay:&v9 performBlock:v6];
  objc_msgSend(v4, "addCancelable:", v8, v9, v10, v11, v12);
}

uint64_t __32__CNObservable_delay_scheduler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:*(void *)(a1 + 40)];
}

id __32__CNObservable_delay_scheduler___block_invoke_8(uint64_t a1)
{
  v1 = NSString;
  double v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 32));
  }
  else {
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v2 * 1000.0);
  }
  id v4 = [v1 stringWithFormat:@"delay(%@)", v3];

  return v4;
}

- (id)delaySubscription:(double)a3 scheduler:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 <= 0.0)
  {
    uint64_t v9 = [(CNObservable *)self subscribeOn:v6];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__CNObservable_delaySubscription_scheduler___block_invoke;
    v12[3] = &unk_1E56A0AB0;
    double v15 = a3;
    id v13 = v6;
    id v14 = self;
    id v8 = +[CNObservable observableWithBlock:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__CNObservable_delaySubscription_scheduler___block_invoke_3;
    v11[3] = &__block_descriptor_40_e15___NSString_8__0l;
    *(double *)&void v11[4] = a3;
    uint64_t v9 = [v8 pipelineDescriptionWithOperation:v11 onObservable:self];
  }

  return v9;
}

CNDelaySubscriptionCancelationToken *__44__CNObservable_delaySubscription_scheduler___block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(CNDelaySubscriptionCancelationToken);
  double v5 = a1[6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__CNObservable_delaySubscription_scheduler___block_invoke_2;
  v12[3] = &unk_1E569F988;
  id v6 = (void *)*((void *)a1 + 4);
  *(double *)&void v12[4] = a1[5];
  id v13 = v3;
  id v7 = v4;
  id v14 = v7;
  id v8 = v3;
  uint64_t v9 = [v6 afterDelay:v12 performBlock:v5];
  [(CNCancelationToken *)v7 addCancelable:v9];
  uint64_t v10 = v7;

  return v10;
}

void __44__CNObservable_delaySubscription_scheduler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) subscribe:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addCancelable:v2];
}

id __44__CNObservable_delaySubscription_scheduler___block_invoke_3(uint64_t a1)
{
  v1 = NSString;
  double v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 32));
  }
  else {
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v2 * 1000.0);
  }
  id v4 = [v1 stringWithFormat:@"delaySubscription(%@)", v3];

  return v4;
}

- (id)dematerialize
{
  id v3 = objc_alloc_init(CNDematerializeCancelationToken);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __29__CNObservable_dematerialize__block_invoke;
  v12[3] = &unk_1E56A0748;
  void v12[4] = self;
  id v4 = v3;
  id v13 = v4;
  double v5 = +[CNObservable observableWithBlock:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__CNObservable_dematerialize__block_invoke_3;
  v10[3] = &unk_1E569F9D8;
  id v11 = v4;
  id v6 = v4;
  id v7 = [v5 doOnTerminate:v10];

  id v8 = [v7 pipelineDescriptionWithOperation:&__block_literal_global_324 onObservable:self];

  return v8;
}

id __29__CNObservable_dematerialize__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __29__CNObservable_dematerialize__block_invoke_2;
  void v15[3] = &unk_1E56A0AD8;
  id v16 = v3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __29__CNObservable_dematerialize__block_invoke_2_322;
  id v13 = &unk_1E569FBD8;
  id v14 = v16;
  id v6 = v16;
  id v7 = +[CNObserver blockObserverOfClass:v5 withResultBlock:v15 completionBlock:&__block_literal_global_321 failureBlock:&v10];
  id v8 = objc_msgSend(v4, "subscribe:", v7, v10, v11, v12, v13);

  [*(id *)(a1 + 40) addCancelable:v8];

  return v8;
}

void __29__CNObservable_dematerialize__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (v4 && ((objc_opt_isKindOfClass() & 1) == 0 ? (v5 = 0) : (v5 = v4), id v6 = v5, v4, v6))
  {
    [v6 dematerializeWithObserver:*(void *)(a1 + 32)];
    id v7 = v4;
  }
  else
  {
    id v7 = +[CNObservable os_log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __29__CNObservable_dematerialize__block_invoke_2_cold_1((uint64_t)v4, v7);
    }
  }
}

uint64_t __29__CNObservable_dematerialize__block_invoke_2_322(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

uint64_t __29__CNObservable_dematerialize__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

__CFString *__29__CNObservable_dematerialize__block_invoke_4()
{
  return @"dematerialize";
}

- (id)distinct
{
  id v3 = [[_CNDistinctObservable alloc] initWithObservable:self];
  id v4 = [(CNObservable *)v3 pipelineDescriptionWithOperation:&__block_literal_global_330 onObservable:self];

  return v4;
}

__CFString *__24__CNObservable_distinct__block_invoke()
{
  return @"distinct";
}

__CFString *__36__CNObservable_distinctUntilChanged__block_invoke()
{
  return @"distinctUntilChanged";
}

__CFString *__27__CNObservable_doOnCancel___block_invoke_4()
{
  return @"doOnCancel";
}

uint64_t __31__CNObservable_doOnCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

__CFString *__31__CNObservable_doOnCompletion___block_invoke_5()
{
  return @"doOnCompletion";
}

void __26__CNObservable_doOnError___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 observerDidFailWithError:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

__CFString *__26__CNObservable_doOnError___block_invoke_5()
{
  return @"doOnError";
}

uint64_t __25__CNObservable_doOnNext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

__CFString *__25__CNObservable_doOnNext___block_invoke_5()
{
  return @"doOnNext";
}

- (id)doOnSubscribe:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __30__CNObservable_doOnSubscribe___block_invoke;
  id v12 = &unk_1E56A0B78;
  id v13 = self;
  id v14 = v4;
  id v5 = v4;
  id v6 = +[CNObservable observableWithBlock:&v9];
  id v7 = objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_365, self, v9, v10, v11, v12, v13);

  return v7;
}

id __30__CNObservable_doOnSubscribe___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  id v6 = [*(id *)(a1 + 32) subscribe:v5];

  return v6;
}

__CFString *__30__CNObservable_doOnSubscribe___block_invoke_2()
{
  return @"doOnSubscribe";
}

uint64_t __30__CNObservable_doOnTerminate___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) observerDidFailWithError:a2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

__CFString *__30__CNObservable_doOnTerminate___block_invoke_5()
{
  return @"doOnTerminate";
}

intptr_t __43__CNObservable_enumerateObjectsUsingBlock___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __23__CNObservable_filter___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

__CFString *__23__CNObservable_filter___block_invoke_5()
{
  return @"filter";
}

- (id)flatMap:(id)a3
{
  id v4 = a3;
  id v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = [(CNObservable *)self flatMap:v4 schedulerProvider:v5];

  return v6;
}

- (id)flatMap:(id)a3 schedulerProvider:(id)a4
{
  id v5 = +[_CNFlatMapObservable flatMapWithObservable:self transform:a3 schedulerProvider:a4];
  id v6 = [v5 pipelineDescriptionWithOperation:&__block_literal_global_384 onObservable:self];

  return v6;
}

__CFString *__42__CNObservable_flatMap_schedulerProvider___block_invoke()
{
  return @"flatmap";
}

- (id)ignoreElements
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __30__CNObservable_ignoreElements__block_invoke;
  v6[3] = &unk_1E56A06F8;
  void v6[4] = self;
  uint64_t v3 = +[CNObservable observableWithBlock:v6];
  id v4 = [v3 pipelineDescriptionWithOperation:&__block_literal_global_390 onObservable:self];

  return v4;
}

id __30__CNObservable_ignoreElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __30__CNObservable_ignoreElements__block_invoke_2;
  void v15[3] = &unk_1E569F9D8;
  id v16 = v3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __30__CNObservable_ignoreElements__block_invoke_3;
  id v13 = &unk_1E569FBD8;
  id v14 = v16;
  id v6 = v16;
  id v7 = +[CNObserver blockObserverOfClass:v5 withResultBlock:0 completionBlock:v15 failureBlock:&v10];
  id v8 = objc_msgSend(v4, "subscribe:", v7, v10, v11, v12, v13);

  return v8;
}

uint64_t __30__CNObservable_ignoreElements__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __30__CNObservable_ignoreElements__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

__CFString *__30__CNObservable_ignoreElements__block_invoke_4()
{
  return @"ignoreElements";
}

__CFString *__20__CNObservable_map___block_invoke_5()
{
  return @"map";
}

- (id)materialize
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __27__CNObservable_materialize__block_invoke;
  v6[3] = &unk_1E56A06F8;
  void v6[4] = self;
  id v3 = +[CNObservable observableWithBlock:v6];
  id v4 = [v3 pipelineDescriptionWithOperation:&__block_literal_global_402 onObservable:self];

  return v4;
}

id __27__CNObservable_materialize__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__CNObservable_materialize__block_invoke_2;
  v14[3] = &unk_1E56A0AD8;
  id v15 = v3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __27__CNObservable_materialize__block_invoke_3;
  v12[3] = &unk_1E569F9D8;
  id v13 = v15;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__CNObservable_materialize__block_invoke_4;
  v10[3] = &unk_1E569FBD8;
  id v11 = v13;
  id v6 = v13;
  id v7 = +[CNObserver blockObserverOfClass:v5 withResultBlock:v14 completionBlock:v12 failureBlock:v10];
  id v8 = [v4 subscribe:v7];

  return v8;
}

void __27__CNObservable_materialize__block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = +[CNObservableEvent eventWithResult:a2];
  [v2 observerDidReceiveResult:v3];
}

uint64_t __27__CNObservable_materialize__block_invoke_3(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = +[CNObservableEvent completionEvent];
  [v2 observerDidReceiveResult:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 observerDidComplete];
}

uint64_t __27__CNObservable_materialize__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = +[CNObservableEvent failureEventWithError:a2];
  [v3 observerDidReceiveResult:v4];

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 observerDidComplete];
}

__CFString *__27__CNObservable_materialize__block_invoke_5()
{
  return @"materialize";
}

id __24__CNObservable_onEmpty___block_invoke(uint64_t a1)
{
  v1 = NSString;
  double v2 = [*(id *)(a1 + 32) debugPipelineDescription];
  id v3 = [v1 stringWithFormat:@"onEmpty(%@)", v2];

  return v3;
}

id __24__CNObservable_onError___block_invoke_2(uint64_t a1)
{
  v1 = NSString;
  double v2 = [*(id *)(a1 + 32) debugPipelineDescription];
  id v3 = [v1 stringWithFormat:@"onError(%@)", v2];

  return v3;
}

uint64_t __31__CNObservable_onErrorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

uint64_t __31__CNObservable_onErrorHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

__CFString *__31__CNObservable_onErrorHandler___block_invoke_5()
{
  return @"onErrorHandler";
}

- (id)publish
{
  id v3 = [[CNPublishingSubject alloc] initWithObservable:self];
  id v4 = [(CNObservable *)v3 pipelineDescriptionWithOperation:&__block_literal_global_422 onObservable:self];

  return v4;
}

__CFString *__23__CNObservable_publish__block_invoke()
{
  return @"publish";
}

- (id)sample:(double)a3
{
  uint64_t v5 = +[CNScheduler globalAsyncScheduler];
  id v6 = [(CNObservable *)self sample:v5 scheduler:a3];

  return v6;
}

- (id)sample:(double)a3 scheduler:(id)a4
{
  id v6 = +[CNObservable observableWithTimeInterval:scheduler:](CNObservable, "observableWithTimeInterval:scheduler:", a4);
  id v7 = [(CNObservable *)self sampleWithObservable:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__CNObservable_sample_scheduler___block_invoke;
  v10[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&void v10[4] = a3;
  id v8 = [v7 pipelineDescriptionWithOperation:v10 onObservable:self];

  return v8;
}

id __33__CNObservable_sample_scheduler___block_invoke(uint64_t a1)
{
  v1 = NSString;
  double v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 32));
  }
  else {
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v2 * 1000.0);
  }
  id v4 = [v1 stringWithFormat:@"sample(%@)", v3];

  return v4;
}

- (id)sampleWithObservable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_CNSamplingObservable alloc] initWithObservable:self sampler:v4];
  id v6 = [(CNObservable *)v5 publish];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__CNObservable_sampleWithObservable___block_invoke;
  v10[3] = &unk_1E56A0720;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v6 pipelineDescriptionWithOperation:v10 onObservable:self];

  return v8;
}

id __37__CNObservable_sampleWithObservable___block_invoke(uint64_t a1)
{
  v1 = NSString;
  double v2 = [*(id *)(a1 + 32) debugPipelineDescription];
  id v3 = [v1 stringWithFormat:@"sample(%@)", v2];

  return v3;
}

- (id)scan:(id)a3
{
  id v4 = [(CNObservable *)self scan:a3 seed:0];
  uint64_t v5 = [v4 pipelineDescriptionWithOperation:&__block_literal_global_431 onObservable:self];

  return v5;
}

__CFString *__21__CNObservable_scan___block_invoke()
{
  return @"scan";
}

- (id)scan:(id)a3 seed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __26__CNObservable_scan_seed___block_invoke;
  v16[3] = &unk_1E56A0C68;
  id v8 = v7;
  id v17 = v8;
  id v18 = self;
  id v19 = v6;
  id v9 = v6;
  uint64_t v10 = +[CNObservable observableWithBlock:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __26__CNObservable_scan_seed___block_invoke_4;
  v14[3] = &unk_1E56A0720;
  id v15 = v8;
  id v11 = v8;
  id v12 = [v10 pipelineDescriptionWithOperation:v14 onObservable:self];

  return v12;
}

id __26__CNObservable_scan_seed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__5;
  void v18[4] = __Block_byref_object_dispose__5;
  id v19 = *(id *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __26__CNObservable_scan_seed___block_invoke_436;
  v14[3] = &unk_1E56A0C40;
  id v17 = v18;
  id v15 = v3;
  id v16 = *(id *)(a1 + 48);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __26__CNObservable_scan_seed___block_invoke_2;
  v12[3] = &unk_1E569F9D8;
  id v13 = v15;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __26__CNObservable_scan_seed___block_invoke_3;
  v10[3] = &unk_1E569FBD8;
  id v6 = v13;
  id v11 = v6;
  id v7 = +[CNObserver blockObserverOfClass:v5 withResultBlock:v14 completionBlock:v12 failureBlock:v10];
  id v8 = [v4 subscribe:v7];

  _Block_object_dispose(v18, 8);

  return v8;
}

void __26__CNObservable_scan_seed___block_invoke_436(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) observerDidReceiveResult:v4];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    [*(id *)(a1 + 32) observerDidReceiveResult:v3];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = v9;
    id v6 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
}

uint64_t __26__CNObservable_scan_seed___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __26__CNObservable_scan_seed___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

__CFString *__26__CNObservable_scan_seed___block_invoke_4(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C978] array];
  if (v2 == v3)
  {
    uint64_t v4 = @"scan(@[])";
  }
  else
  {
    uint64_t v4 = [NSString stringWithFormat:@"scan(%@)", *(void *)(a1 + 32)];
  }

  return v4;
}

- (id)skip:(unint64_t)a3
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __21__CNObservable_skip___block_invoke;
  v9[3] = &unk_1E56A0CB8;
  void v9[4] = self;
  void v9[5] = a3;
  uint64_t v5 = +[CNObservable observableWithBlock:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __21__CNObservable_skip___block_invoke_5;
  void v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v8[4] = a3;
  id v6 = [v5 pipelineDescriptionWithOperation:v8 onObservable:self];

  return v6;
}

id __21__CNObservable_skip___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  uint64_t v5 = a1 + 32;
  uint64_t v4 = *(void **)(a1 + 32);
  v21[3] = *(void *)(v5 + 8);
  uint64_t v6 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __21__CNObservable_skip___block_invoke_2;
  v18[3] = &unk_1E56A0C90;
  uint64_t v20 = v21;
  id v19 = v3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __21__CNObservable_skip___block_invoke_3;
  v16[3] = &unk_1E569F9D8;
  id v17 = v19;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __21__CNObservable_skip___block_invoke_4;
  id v14 = &unk_1E569FBD8;
  id v7 = v17;
  id v15 = v7;
  id v8 = +[CNObserver blockObserverOfClass:v6 withResultBlock:v18 completionBlock:v16 failureBlock:&v11];
  id v9 = objc_msgSend(v4, "subscribe:", v8, v11, v12, v13, v14);

  _Block_object_dispose(v21, 8);

  return v9;
}

uint64_t __21__CNObservable_skip___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
  uint64_t v3 = *(void *)(v2 + 24);
  if (!v3) {
    return [*(id *)(result + 32) observerDidReceiveResult:a2];
  }
  *(void *)(v2 + 24) = v3 - 1;
  return result;
}

uint64_t __21__CNObservable_skip___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __21__CNObservable_skip___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

id __21__CNObservable_skip___block_invoke_5(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  uint64_t v3 = [v1 stringWithFormat:@"skip(%@)", v2];

  return v3;
}

- (id)skipLast:(unint64_t)a3
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __25__CNObservable_skipLast___block_invoke;
  v9[3] = &unk_1E56A0CB8;
  void v9[4] = self;
  void v9[5] = a3;
  uint64_t v5 = +[CNObservable observableWithBlock:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __25__CNObservable_skipLast___block_invoke_6;
  void v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v8[4] = a3;
  uint64_t v6 = [v5 pipelineDescriptionWithOperation:v8 onObservable:self];

  return v6;
}

id __25__CNObservable_skipLast___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __25__CNObservable_skipLast___block_invoke_2;
  v23[3] = &unk_1E56A0AD8;
  id v5 = v3;
  id v24 = v5;
  uint64_t v6 = +[CNQueue boundedQueueWithCapacity:v4 overflowHandler:v23];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __25__CNObservable_skipLast___block_invoke_3;
  v21[3] = &unk_1E56A0AD8;
  id v22 = v6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __25__CNObservable_skipLast___block_invoke_4;
  v19[3] = &unk_1E569F9D8;
  id v20 = v5;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __25__CNObservable_skipLast___block_invoke_5;
  id v17 = &unk_1E569FBD8;
  id v18 = v20;
  id v9 = v20;
  id v10 = v6;
  uint64_t v11 = +[CNObserver blockObserverOfClass:v8 withResultBlock:v21 completionBlock:v19 failureBlock:&v14];
  uint64_t v12 = objc_msgSend(v7, "subscribe:", v11, v14, v15, v16, v17);

  return v12;
}

uint64_t __25__CNObservable_skipLast___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

uint64_t __25__CNObservable_skipLast___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) enqueue:a2];
}

uint64_t __25__CNObservable_skipLast___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __25__CNObservable_skipLast___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

id __25__CNObservable_skipLast___block_invoke_6(uint64_t a1)
{
  v1 = NSString;
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  id v3 = [v1 stringWithFormat:@"skipLast(%@)", v2];

  return v3;
}

- (id)skipUntil:(id)a3
{
  id v4 = a3;
  id v5 = [[_CNObservableSkipUntilOperator alloc] initWithInput:self signal:v4];

  return v5;
}

uint64_t __36__CNObservable_startWith_scheduler___block_invoke(uint64_t a1)
{
  return [NSString stringWithFormat:@"startWith(%@)", *(void *)(a1 + 32)];
}

- (id)switch
{
  id v3 = +[CNSchedulerProvider defaultProvider];
  id v4 = [(CNObservable *)self switchWithSchedulerProvider:v3];

  return v4;
}

- (id)switchWithSchedulerProvider:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __44__CNObservable_switchWithSchedulerProvider___block_invoke;
  uint64_t v12 = &unk_1E56A0748;
  id v13 = v4;
  uint64_t v14 = self;
  id v5 = v4;
  uint64_t v6 = +[CNObservable observableWithBlock:&v9];
  id v7 = objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_466, self, v9, v10, v11, v12);

  return v7;
}

CNSwitchWithSchedulerProviderOuterCancelationToken *__44__CNObservable_switchWithSchedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  char v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 1;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = objc_alloc_init(CNSwitchWithSchedulerProviderOuterCancelationToken);
  uint64_t v6 = objc_alloc_init(CNUnfairLock);
  id v7 = (void *)[*(id *)(a1 + 32) newSerialSchedulerWithName:@"com.apple.contacts.reactive.switch.downstream"];
  objc_initWeak(&location, v5);
  id v18 = *(void **)(a1 + 40);
  uint64_t v8 = objc_opt_class();
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_2;
  v36[3] = &unk_1E56A0DA8;
  v37 = v6;
  id v38 = v4;
  v41 = v45;
  id v39 = v7;
  id v40 = v3;
  v42 = v47;
  objc_copyWeak(&v43, &location);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_14;
  v29[3] = &unk_1E56A0DF8;
  uint64_t v30 = v37;
  v34 = v47;
  v35 = v45;
  id v31 = v38;
  id v32 = v39;
  id v33 = v40;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_17;
  v22[3] = &unk_1E56A0E48;
  uint64_t v9 = v30;
  id v23 = v9;
  long long v27 = v47;
  id v28 = v45;
  id v10 = v32;
  id v24 = v10;
  id v11 = v33;
  id v25 = v11;
  id v12 = v31;
  id v26 = v12;
  id v13 = +[CNObserver blockObserverOfClass:v8 withResultBlock:v36 completionBlock:v29 failureBlock:v22];
  uint64_t v14 = [v18 subscribe:v13];

  [(CNCancelationToken *)v5 addCancelable:v14];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_20;
  v19[3] = &unk_1E569F310;
  uint64_t v15 = v9;
  id v20 = v15;
  id v16 = v12;
  id v21 = v16;
  [(CNCancelationToken *)v5 addCancelationBlock:v19];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);

  return v5;
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_3;
  v44[3] = &unk_1E569F310;
  id v45 = v4;
  id v5 = *(void **)(a1 + 32);
  id v46 = *(id *)(a1 + 40);
  id v6 = v4;
  CNRunWithLock(v5, v44);
  objc_msgSend(v6, "_cn_each:", &__block_literal_global_42);

  id v7 = objc_alloc_init(CNSwitchWithSchedulerProviderSwitchedCancelationToken);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_4;
  v41[3] = &unk_1E569F310;
  uint64_t v8 = *(void **)(a1 + 32);
  id v42 = *(id *)(a1 + 40);
  uint64_t v9 = v7;
  id v43 = v9;
  CNRunWithLock(v8, v41);
  objc_initWeak(&location, v9);
  uint64_t v10 = objc_opt_class();
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_5;
  v35[3] = &unk_1E56A0D08;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 64);
  id v36 = v11;
  uint64_t v39 = v12;
  id v37 = *(id *)(a1 + 48);
  id v38 = *(id *)(a1 + 56);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_8;
  v28[3] = &unk_1E56A0D58;
  id v29 = *(id *)(a1 + 32);
  objc_copyWeak(&v34, &location);
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 72);
  id v30 = v13;
  uint64_t v33 = v14;
  id v31 = *(id *)(a1 + 48);
  id v32 = *(id *)(a1 + 56);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __44__CNObservable_switchWithSchedulerProvider___block_invoke_11;
  id v22 = &unk_1E56A0D80;
  id v15 = *(id *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 64);
  id v23 = v15;
  uint64_t v26 = v16;
  id v24 = *(id *)(a1 + 48);
  id v25 = *(id *)(a1 + 56);
  objc_copyWeak(&v27, (id *)(a1 + 80));
  id v17 = +[CNObserver blockObserverOfClass:v10 withResultBlock:v35 completionBlock:v28 failureBlock:&v19];
  id v18 = objc_msgSend(v3, "subscribe:", v17, v19, v20, v21, v22);

  [(CNCancelationToken *)v9 addCancelable:v18];
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setArray:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 removeAllObjects];
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_6;
  v6[3] = &unk_1E56A0CE0;
  uint64_t v10 = *(void *)(a1 + 56);
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  CNRunWithLock(v4, v6);
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_7;
    v3[3] = &unk_1E569F310;
    uint64_t v2 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    [v2 performBlock:v3];
  }
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:*(void *)(a1 + 40)];
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_9;
  v5[3] = &unk_1E56A0D30;
  objc_copyWeak(&v10, (id *)(a1 + 72));
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  id v6 = v3;
  uint64_t v9 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  CNRunWithLock(v2, v5);

  objc_destroyWeak(&v10);
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) removeObject:WeakRetained];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_10;
      v4[3] = &unk_1E569F9D8;
      id v3 = *(void **)(a1 + 40);
      id v5 = *(id *)(a1 + 48);
      [v3 performBlock:v4];
    }
  }
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __44__CNObservable_switchWithSchedulerProvider___block_invoke_12;
  id v10 = &unk_1E56A0CE0;
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v4 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v13 = v3;
  id v5 = v3;
  CNRunWithLock(v4, &v7);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "cancel", v7, v8, v9, v10);
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_12(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_13;
    v4[3] = &unk_1E569F310;
    id v3 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    [v3 performBlock:v4];

    uint64_t v1 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(unsigned char *)(v1 + 24) = 0;
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:*(void *)(a1 + 40)];
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_14(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_15;
  v3[3] = &unk_1E56A0DD0;
  long long v7 = *(_OWORD *)(a1 + 64);
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  CNRunWithLock(v2, v3);
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_15(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (off_1EE0248A0((uint64_t)&__block_literal_global_5, *(void **)(a1 + 32)))
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_16;
      v3[3] = &unk_1E569F9D8;
      uint64_t v2 = *(void **)(a1 + 40);
      id v4 = *(id *)(a1 + 48);
      [v2 performBlock:v3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__CNObservable_switchWithSchedulerProvider___block_invoke_18;
  void v8[3] = &unk_1E56A0E20;
  long long v14 = *(_OWORD *)(a1 + 64);
  id v5 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v12 = v4;
  id v13 = *(id *)(a1 + 56);
  id v6 = v4;
  id v7 = v3;
  CNRunWithLock(v5, v8);
  objc_msgSend(v6, "_cn_each:", &__block_literal_global_42);
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_18(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  uint64_t v2 = *(void *)(*(void *)(a1 + 80) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    id v7 = __44__CNObservable_switchWithSchedulerProvider___block_invoke_19;
    uint64_t v8 = &unk_1E569F310;
    id v3 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v3 performBlock:&v5];

    uint64_t v2 = *(void *)(*(void *)(a1 + 80) + 8);
  }
  *(unsigned char *)(v2 + 24) = 0;
  objc_msgSend(*(id *)(a1 + 56), "setArray:", *(void *)(a1 + 64), v5, v6, v7, v8);
  return [*(id *)(a1 + 64) removeAllObjects];
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_19(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:*(void *)(a1 + 40)];
}

void __44__CNObservable_switchWithSchedulerProvider___block_invoke_20(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __44__CNObservable_switchWithSchedulerProvider___block_invoke_21;
  uint64_t v8 = &unk_1E569F310;
  id v9 = v2;
  id v3 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v4 = v2;
  CNRunWithLock(v3, &v5);
  objc_msgSend(v4, "_cn_each:", &__block_literal_global_42, v5, v6, v7, v8);
}

uint64_t __44__CNObservable_switchWithSchedulerProvider___block_invoke_21(uint64_t a1)
{
  [*(id *)(a1 + 32) setArray:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 removeAllObjects];
}

__CFString *__44__CNObservable_switchWithSchedulerProvider___block_invoke_22()
{
  return @"switch";
}

- (id)switchMap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CNSchedulerProvider defaultProvider];
  uint64_t v6 = [(CNObservable *)self switchMap:v4 schedulerProvider:v5];

  return v6;
}

- (id)switchMap:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  id v7 = [(CNObservable *)self map:a3];
  uint64_t v8 = [v7 switchWithSchedulerProvider:v6];

  id v9 = [v8 pipelineDescriptionWithOperation:&__block_literal_global_471 onObservable:self];

  return v9;
}

__CFString *__44__CNObservable_switchMap_schedulerProvider___block_invoke()
{
  return @"switchMap";
}

- (id)take:(unint64_t)a3
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __21__CNObservable_take___block_invoke;
  v9[3] = &unk_1E56A0CB8;
  void v9[4] = self;
  void v9[5] = a3;
  uint64_t v5 = +[CNObservable observableWithBlock:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __21__CNObservable_take___block_invoke_5;
  void v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v8[4] = a3;
  id v6 = [v5 pipelineDescriptionWithOperation:v8 onObservable:self];

  return v6;
}

CNTakeCancelationToken *__21__CNObservable_take___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = *(void *)(a1 + 40);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 1;
  id v4 = objc_alloc_init(CNTakeCancelationToken);
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = objc_opt_class();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __21__CNObservable_take___block_invoke_2;
  v23[3] = &unk_1E56A0E70;
  uint64_t v26 = v30;
  id v24 = v3;
  id v27 = v28;
  id v7 = v4;
  id v25 = v7;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __21__CNObservable_take___block_invoke_3;
  v20[3] = &unk_1E569F9B0;
  id v22 = v28;
  id v21 = v24;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __21__CNObservable_take___block_invoke_4;
  id v17 = &unk_1E56A0E98;
  uint64_t v19 = v28;
  id v8 = v21;
  id v18 = v8;
  id v9 = +[CNObserver blockObserverOfClass:v6 withResultBlock:v23 completionBlock:v20 failureBlock:&v14];
  id v10 = objc_msgSend(v5, "subscribe:", v9, v14, v15, v16, v17);
  [(CNCancelationToken *)v7 addCancelable:v10];

  id v11 = v18;
  id v12 = v7;

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);

  return v12;
}

uint64_t __21__CNObservable_take___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || (uint64_t v3 = [*(id *)(a1 + 32) observerDidReceiveResult:v7],
        id v4 = v7,
        --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24),
        !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v5 + 24))
    {
      *(unsigned char *)(v5 + 24) = 0;
      [*(id *)(a1 + 32) observerDidComplete];
    }
    uint64_t v3 = [*(id *)(a1 + 40) cancel];
    id v4 = v7;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __21__CNObservable_take___block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return [*(id *)(result + 32) observerDidComplete];
  }
  return result;
}

uint64_t __21__CNObservable_take___block_invoke_4(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return [*(id *)(result + 32) observerDidFailWithError:a2];
  }
  return result;
}

id __21__CNObservable_take___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = NSString;
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  uint64_t v3 = [v1 stringWithFormat:@"take(%@)", v2];

  return v3;
}

- (id)takeLast:(unint64_t)a3
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __25__CNObservable_takeLast___block_invoke;
  v9[3] = &unk_1E56A0CB8;
  void v9[4] = self;
  void v9[5] = a3;
  uint64_t v5 = +[CNObservable observableWithBlock:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __25__CNObservable_takeLast___block_invoke_5;
  void v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
  void v8[4] = a3;
  uint64_t v6 = [v5 pipelineDescriptionWithOperation:v8 onObservable:self];

  return v6;
}

CNTakeLastCancelationToken *__25__CNObservable_takeLast___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CNQueue boundedQueueWithCapacity:*(void *)(a1 + 40)];
  uint64_t v5 = objc_alloc_init(CNTakeLastCancelationToken);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __25__CNObservable_takeLast___block_invoke_2;
  v21[3] = &unk_1E56A0AD8;
  id v22 = v4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __25__CNObservable_takeLast___block_invoke_3;
  v17[3] = &unk_1E569F988;
  id v18 = v22;
  id v19 = v3;
  id v8 = v5;
  uint64_t v20 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __25__CNObservable_takeLast___block_invoke_4;
  void v15[3] = &unk_1E569FBD8;
  id v16 = v19;
  id v9 = v19;
  id v10 = v22;
  id v11 = +[CNObserver blockObserverOfClass:v7 withResultBlock:v21 completionBlock:v17 failureBlock:v15];
  id v12 = [v6 subscribe:v11];

  [(CNCancelationToken *)v8 addCancelable:v12];
  id v13 = v8;

  return v13;
}

uint64_t __25__CNObservable_takeLast___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) enqueue:a2];
}

void __25__CNObservable_takeLast___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) drain];
  +[CNObserver sendArray:v2 error:0 toObserver:*(void *)(a1 + 40) untilCanceled:*(void *)(a1 + 48)];
}

uint64_t __25__CNObservable_takeLast___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

id __25__CNObservable_takeLast___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = NSString;
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  id v3 = [v1 stringWithFormat:@"takeLast(%@)", v2];

  return v3;
}

- (id)takeUntil:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_CNObservableTakeUntilOperator alloc] initWithInput:self signal:v4];

  return v5;
}

- (id)throttle:(double)a3 schedulerProvider:(id)a4
{
  uint64_t v6 = -[CNObservable throttle:options:schedulerProvider:](self, "throttle:options:schedulerProvider:", 2, a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__CNObservable_throttle_schedulerProvider___block_invoke;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&void v9[4] = a3;
  uint64_t v7 = [v6 pipelineDescriptionWithOperation:v9 onObservable:self];

  return v7;
}

id __43__CNObservable_throttle_schedulerProvider___block_invoke(uint64_t a1)
{
  uint64_t v1 = NSString;
  double v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 32));
  }
  else {
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v2 * 1000.0);
  }
  id v4 = [v1 stringWithFormat:@"throttle(%@)", v3];

  return v4;
}

- (id)throttle:(double)a3 options:(unint64_t)a4 schedulerProvider:(id)a5
{
  id v8 = a5;
  id v9 = [[_CNThrottledObservable alloc] initWithInterval:a4 options:self observable:v8 schedulerProvider:a3];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__CNObservable_throttle_options_schedulerProvider___block_invoke;
  v12[3] = &__block_descriptor_48_e15___NSString_8__0l;
  *(double *)&void v12[4] = a3;
  void v12[5] = a4;
  id v10 = [(CNObservable *)v9 pipelineDescriptionWithOperation:v12 onObservable:self];

  return v10;
}

id __51__CNObservable_throttle_options_schedulerProvider___block_invoke(uint64_t a1)
{
  double v2 = NSString;
  double v3 = *(double *)(a1 + 32);
  if (v3 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 32));
  }
  else {
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v3 * 1000.0);
  }
  uint64_t v5 = [v2 stringWithFormat:@"throttle(%@, options: 0x%lx)", v4, *(void *)(a1 + 40)];

  return v5;
}

- (id)throttleFirst:(double)a3 scheduler:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__CNObservable_throttleFirst_scheduler___block_invoke;
  v12[3] = &unk_1E56A0AB0;
  double v15 = a3;
  id v13 = v6;
  uint64_t v14 = self;
  id v7 = v6;
  id v8 = +[CNObservable observableWithBlock:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__CNObservable_throttleFirst_scheduler___block_invoke_5;
  v11[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&void v11[4] = a3;
  id v9 = [v8 pipelineDescriptionWithOperation:v11 onObservable:self];

  return v9;
}

id __40__CNObservable_throttleFirst_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  double v24 = 0.0;
  [*(id *)(a1 + 32) timestamp];
  double v24 = v4 - *(double *)(a1 + 48) + -1.0;
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__CNObservable_throttleFirst_scheduler___block_invoke_2;
  v18[3] = &unk_1E56A0EC0;
  id v19 = *(id *)(a1 + 32);
  id v21 = v23;
  uint64_t v22 = *(void *)(a1 + 48);
  id v20 = v3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__CNObservable_throttleFirst_scheduler___block_invoke_3;
  v16[3] = &unk_1E569F9D8;
  id v17 = v20;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __40__CNObservable_throttleFirst_scheduler___block_invoke_4;
  uint64_t v14 = &unk_1E569FBD8;
  id v7 = v17;
  id v15 = v7;
  id v8 = +[CNObserver blockObserverOfClass:v6 withResultBlock:v18 completionBlock:v16 failureBlock:&v11];
  id v9 = objc_msgSend(v5, "subscribe:", v8, v11, v12, v13, v14);

  _Block_object_dispose(v23, 8);

  return v9;
}

void __40__CNObservable_throttleFirst_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) timestamp];
  if (v3 - *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(double *)(a1 + 56))
  {
    [*(id *)(a1 + 32) timestamp];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
    [*(id *)(a1 + 40) observerDidReceiveResult:v5];
  }
}

uint64_t __40__CNObservable_throttleFirst_scheduler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __40__CNObservable_throttleFirst_scheduler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

id __40__CNObservable_throttleFirst_scheduler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = NSString;
  double v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 32));
  }
  else {
  double v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v2 * 1000.0);
  }
  uint64_t v4 = [v1 stringWithFormat:@"throttleFirst(%@)", v3];

  return v4;
}

- (id)throttleFirstAndLast:(double)a3 schedulerProvider:(id)a4
{
  uint64_t v6 = -[CNObservable throttle:options:schedulerProvider:](self, "throttle:options:schedulerProvider:", 3, a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__CNObservable_throttleFirstAndLast_schedulerProvider___block_invoke;
  v9[3] = &__block_descriptor_40_e15___NSString_8__0l;
  *(double *)&void v9[4] = a3;
  id v7 = [v6 pipelineDescriptionWithOperation:v9 onObservable:self];

  return v7;
}

id __55__CNObservable_throttleFirstAndLast_schedulerProvider___block_invoke(uint64_t a1)
{
  uint64_t v1 = NSString;
  double v2 = *(double *)(a1 + 32);
  if (v2 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 32));
  }
  else {
  double v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v2 * 1000.0);
  }
  uint64_t v4 = [v1 stringWithFormat:@"throttleFirstAndLast(%@)", v3];

  return v4;
}

- (id)timeInterval
{
  double v3 = +[CNScheduler immediateScheduler];
  uint64_t v4 = [(CNObservable *)self timeIntervalWithScheduler:v3];

  return v4;
}

- (id)timeIntervalWithScheduler:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __42__CNObservable_timeIntervalWithScheduler___block_invoke;
  uint64_t v12 = &unk_1E56A0748;
  id v13 = v4;
  uint64_t v14 = self;
  id v5 = v4;
  uint64_t v6 = +[CNObservable observableWithBlock:&v9];
  id v7 = objc_msgSend(v6, "pipelineDescriptionWithOperation:onObservable:", &__block_literal_global_503, self, v9, v10, v11, v12);

  return v7;
}

id __42__CNObservable_timeIntervalWithScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  uint64_t v20 = 0;
  [*(id *)(a1 + 32) timestamp];
  uint64_t v20 = v4;
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__CNObservable_timeIntervalWithScheduler___block_invoke_2;
  void v15[3] = &unk_1E56A0EE8;
  id v16 = *(id *)(a1 + 32);
  id v18 = v19;
  id v17 = v3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__CNObservable_timeIntervalWithScheduler___block_invoke_3;
  void v13[3] = &unk_1E569F9D8;
  id v14 = v17;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__CNObservable_timeIntervalWithScheduler___block_invoke_4;
  v11[3] = &unk_1E569FBD8;
  id v7 = v14;
  id v12 = v7;
  id v8 = +[CNObserver blockObserverOfClass:v6 withResultBlock:v15 completionBlock:v13 failureBlock:v11];
  uint64_t v9 = [v5 subscribe:v8];

  _Block_object_dispose(v19, 8);

  return v9;
}

void __42__CNObservable_timeIntervalWithScheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 timestamp];
  double v6 = v5;
  id v7 = [(CNTimestamped *)[CNRelativeTimestamped alloc] initWithValue:v4 timestamp:v5 - *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];

  [*(id *)(a1 + 40) observerDidReceiveResult:v7];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
}

uint64_t __42__CNObservable_timeIntervalWithScheduler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __42__CNObservable_timeIntervalWithScheduler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

__CFString *__42__CNObservable_timeIntervalWithScheduler___block_invoke_5()
{
  return @"timeInterval";
}

- (id)timeoutAfterDelay:(double)a3 alternateObservable:(id)a4 schedule:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke;
  void v19[3] = &unk_1E56A0F10;
  id v20 = v9;
  double v23 = a3;
  id v10 = v8;
  id v21 = v10;
  uint64_t v22 = self;
  id v11 = v9;
  id v12 = +[CNObservable observableWithBlock:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_7;
  v16[3] = &unk_1E56A0888;
  double v18 = a3;
  id v17 = v10;
  id v13 = v10;
  id v14 = [v12 pipelineDescriptionWithOperation:v16 onObservable:self];

  return v14;
}

id __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(CNTimeoutAfterDelayCancelationToken);
  double v5 = *(double *)(a1 + 56);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_2;
  v31[3] = &unk_1E569F988;
  id v32 = v4;
  double v6 = *(void **)(a1 + 32);
  id v33 = *(id *)(a1 + 40);
  id v7 = v3;
  id v34 = v7;
  id v8 = v4;
  id v9 = [v6 afterDelay:v31 performBlock:v5];
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = objc_opt_class();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_3;
  v29[3] = &unk_1E56A0AD8;
  id v30 = v7;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_4;
  v26[3] = &unk_1E569F310;
  id v27 = v9;
  id v28 = v30;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_5;
  void v23[3] = &unk_1E569FB88;
  id v12 = v27;
  id v24 = v12;
  id v25 = v28;
  id v13 = v28;
  id v14 = +[CNObserver blockObserverOfClass:v11 withResultBlock:v29 completionBlock:v26 failureBlock:v23];
  id v15 = [v10 subscribe:v14];

  [(CNCancelationToken *)v8 addCancelable:v15];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_6;
  v20[3] = &unk_1E569F310;
  id v21 = v15;
  id v22 = v12;
  id v16 = v12;
  id v17 = v15;
  double v18 = +[CNCancelationToken tokenWithCancelationBlock:v20];

  return v18;
}

id __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 40) subscribe:*(void *)(a1 + 48)];
}

uint64_t __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

uint64_t __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  double v2 = *(void **)(a1 + 40);

  return [v2 observerDidComplete];
}

void __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 cancel];
  [*(id *)(a1 + 40) observerDidFailWithError:v4];
}

uint64_t __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  double v2 = *(void **)(a1 + 40);

  return [v2 cancel];
}

id __63__CNObservable_timeoutAfterDelay_alternateObservable_schedule___block_invoke_7(uint64_t a1)
{
  double v2 = NSString;
  double v3 = *(double *)(a1 + 40);
  if (v3 >= 1.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%.0fs", *(void *)(a1 + 40));
  }
  else {
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%.0fms", v3 * 1000.0);
  }
  double v5 = [*(id *)(a1 + 32) debugPipelineDescription];
  double v6 = [v2 stringWithFormat:@"timeout(%@, alternate: %@)", v4, v5];

  return v6;
}

- (id)timestampWithScheduler:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__CNObservable_timestampWithScheduler___block_invoke;
  v9[3] = &unk_1E56A0150;
  id v10 = v4;
  id v5 = v4;
  double v6 = [(CNObservable *)self map:v9];
  id v7 = [v6 pipelineDescriptionWithOperation:&__block_literal_global_514 onObservable:self];

  return v7;
}

CNTimestamped *__39__CNObservable_timestampWithScheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [CNTimestamped alloc];
  [*(id *)(a1 + 32) timestamp];
  id v5 = -[CNTimestamped initWithValue:timestamp:](v4, "initWithValue:timestamp:", v3);

  return v5;
}

__CFString *__39__CNObservable_timestampWithScheduler___block_invoke_2()
{
  return @"timestamp";
}

- (id)toArray
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __23__CNObservable_toArray__block_invoke;
  v4[3] = &unk_1E56A0F38;
  objc_copyWeak(&v5, &location);
  double v2 = +[CNObservable observableWithBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

id __23__CNObservable_toArray__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = objc_opt_class();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __23__CNObservable_toArray__block_invoke_2;
  v20[3] = &unk_1E56A0AD8;
  id v21 = v5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __23__CNObservable_toArray__block_invoke_3;
  v17[3] = &unk_1E569F310;
  id v18 = v3;
  id v19 = v21;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __23__CNObservable_toArray__block_invoke_4;
  id v15 = &unk_1E569FBD8;
  id v16 = v18;
  id v7 = v18;
  id v8 = v21;
  id v9 = +[CNObserver blockObserverOfClass:v6 withResultBlock:v20 completionBlock:v17 failureBlock:&v12];
  id v10 = objc_msgSend(WeakRetained, "subscribe:", v9, v12, v13, v14, v15);

  return v10;
}

uint64_t __23__CNObservable_toArray__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __23__CNObservable_toArray__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) observerDidReceiveResult:*(void *)(a1 + 40)];
  double v2 = *(void **)(a1 + 32);

  return [v2 observerDidComplete];
}

uint64_t __23__CNObservable_toArray__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

- (id)using:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __22__CNObservable_using___block_invoke;
  void v8[3] = &unk_1E56A0B78;
  void v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = +[CNObservable observableWithBlock:v8];

  return v6;
}

id __22__CNObservable_using___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  uint64_t v6 = v4(v3);
  id v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __22__CNObservable_using___block_invoke_2;
  v12[3] = &unk_1E569F9D8;
  id v13 = v6;
  id v8 = v6;
  id v9 = [v7 doOnTerminate:v12];
  id v10 = [v9 subscribe:v5];

  return v10;
}

id __22__CNObservable_using___block_invoke_2()
{
  return self;
}

- (id)subscribe:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"subscribe: must be overridden" userInfo:0];
  objc_exception_throw(v4);
}

- (NSString)debugPipelineDescription
{
  return self->_pipelineDescription;
}

+ (id)observableWithAbsoluteTimestamps:(id)a3 schedulerProvider:(id)a4
{
  id v28 = a1;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
  v35[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  char v29 = v5;
  id v9 = [v5 sortedArrayUsingDescriptors:v8];

  id v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [v9 firstObject];
  [v11 timestamp];
  double v13 = v12;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_msgSend(v19, "timestamp", v28);
        double v21 = vabdd_f64(v20, v13);
        id v22 = [CNRelativeTimestamped alloc];
        double v23 = [v19 value];
        id v24 = [(CNTimestamped *)v22 initWithValue:v23 timestamp:v21];

        [v10 addObject:v24];
        [v19 timestamp];
        double v13 = v25;
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v16);
  }

  uint64_t v26 = [v28 observableWithRelativeTimestamps:v10 schedulerProvider:v6];

  return v26;
}

+ (id)observableWithRelativeTimestamps:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (off_1EE0248A0((uint64_t)&__block_literal_global_5, v6))
  {
    id v8 = +[CNObservable emptyObservable];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __84__CNObservable_TimestampReplay__observableWithRelativeTimestamps_schedulerProvider___block_invoke;
    v10[3] = &unk_1E56A0AB0;
    id v11 = v6;
    id v12 = v7;
    id v13 = a1;
    id v8 = +[CNObservable observableWithBlock:v10];
  }

  return v8;
}

CNCancelationToken *__84__CNObservable_TimestampReplay__observableWithRelativeTimestamps_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(CNQueue);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CNQueue *)v4 enqueue:*(void *)(*((void *)&v29 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  id v10 = (void *)[*(id *)(a1 + 40) newSerialSchedulerWithName:@"com.apple.contacts.reactive.relative-timestamps.downstream"];
  id v11 = objc_alloc_init(CNCancelationToken);
  id v12 = [(CNQueue *)v4 peek];
  [v12 timestamp];
  double v14 = v13;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__CNObservable_TimestampReplay__observableWithRelativeTimestamps_schedulerProvider___block_invoke_2;
  void v23[3] = &unk_1E56A1600;
  uint64_t v28 = *(void *)(a1 + 48);
  id v24 = v4;
  id v25 = v3;
  uint64_t v15 = v11;
  uint64_t v26 = v15;
  id v27 = v10;
  id v16 = v10;
  id v17 = v3;
  id v18 = v4;
  id v19 = (id)[v16 afterDelay:v23 performBlock:v14];
  double v20 = v27;
  double v21 = v15;

  return v21;
}

uint64_t __84__CNObservable_TimestampReplay__observableWithRelativeTimestamps_schedulerProvider___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 64) sendNextTimestampFromQueue:*(void *)(a1 + 32) toObserver:*(void *)(a1 + 40) untilCanceled:*(void *)(a1 + 48) scheduler:*(void *)(a1 + 56)];
}

+ (void)sendNextTimestampFromQueue:(id)a3 toObserver:(id)a4 untilCanceled:(id)a5 scheduler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count] && (objc_msgSend(v12, "isCanceled") & 1) == 0)
  {
    double v14 = [v10 dequeue];
    uint64_t v15 = [v14 value];
    [v11 observerDidReceiveResult:v15];

    if ([v10 count])
    {
      id v16 = [v10 peek];
      [v16 timestamp];
      double v18 = v17;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __95__CNObservable_TimestampReplay__sendNextTimestampFromQueue_toObserver_untilCanceled_scheduler___block_invoke;
      v20[3] = &unk_1E56A1600;
      id v25 = a1;
      id v21 = v10;
      id v22 = v11;
      id v23 = v12;
      id v24 = v13;
      id v19 = (id)[v24 afterDelay:v20 performBlock:v18];
    }
    else
    {
      [v11 observerDidComplete];
    }
  }
}

uint64_t __95__CNObservable_TimestampReplay__sendNextTimestampFromQueue_toObserver_untilCanceled_scheduler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 64) sendNextTimestampFromQueue:*(void *)(a1 + 32) toObserver:*(void *)(a1 + 40) untilCanceled:*(void *)(a1 + 48) scheduler:*(void *)(a1 + 56)];
}

+ (id)scannerResultsInString:(id)a3
{
  id v3 = a3;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v3))
  {
    id v4 = +[CNResult successWithValue:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F5F158] scanString:v3];
    id v4 = +[CNResult successWithValue:v5];
  }

  return v4;
}

+ (id)asyncScannerResultsInString:(id)a3
{
  id v3 = a3;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v3))
  {
    id v4 = +[CNFuture futureWithResult:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v5 = objc_alloc_init(CNPromise);
    uint64_t v6 = (void *)MEMORY[0x1E4F5F158];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__CNObservable_DataDetectors__asyncScannerResultsInString___block_invoke;
    v11[3] = &unk_1E56A1678;
    id v12 = v5;
    uint64_t v7 = v5;
    uint64_t v8 = [v6 scanString:v3 completionBlock:v11];
    id v4 = [(CNPromise *)v7 future];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__CNObservable_DataDetectors__asyncScannerResultsInString___block_invoke_2;
    v10[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    void v10[4] = v8;
    [v4 addFailureBlock:v10];
  }

  return v4;
}

uint64_t __59__CNObservable_DataDetectors__asyncScannerResultsInString___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

uint64_t __59__CNObservable_DataDetectors__asyncScannerResultsInString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = +[CNFoundationError isCanceledError:a2];
  if (result)
  {
    id v4 = (void *)MEMORY[0x1E4F5F158];
    uint64_t v5 = *(void *)(a1 + 32);
    return [v4 cancelJob:v5];
  }
  return result;
}

+ (id)observableWithScannerResultsInString:(id)a3
{
  id v3 = a3;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v3))
  {
    id v4 = +[CNObservable emptyObservable];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke;
    v6[3] = &unk_1E56A06F8;
    id v7 = v3;
    id v4 = +[CNObservable observableWithBlock:v6];
  }

  return v4;
}

CNCancelationToken *__68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(CNCancelationToken);
  uint64_t v5 = (void *)MEMORY[0x1E4F5F158];
  uint64_t v6 = *(void *)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_2;
  v14[3] = &unk_1E56A16E8;
  id v15 = v3;
  id v7 = v4;
  id v16 = v7;
  id v8 = v3;
  uint64_t v9 = [v5 scanString:v6 completionBlock:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_5;
  void v13[3] = &__block_descriptor_40_e5_v8__0l;
  void v13[4] = v9;
  [(CNCancelationToken *)v7 addCancelationBlock:v13];
  id v10 = v16;
  id v11 = v7;

  return v11;
}

void __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_2(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_3;
  v7[3] = &unk_1E56A16C0;
  id v8 = *(id *)(a1 + 32);
  objc_msgSend(a2, "_cn_each:untilCancelled:", v7, *(void *)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_4;
  v5[3] = &unk_1E569F9D8;
  id v4 = *(void **)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  [v4 performBlock:v5];
}

uint64_t __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

uint64_t __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __68__CNObservable_DataDetectors__observableWithScannerResultsInString___block_invoke_5(uint64_t a1)
{
  return [MEMORY[0x1E4F5F158] cancelJob:*(void *)(a1 + 32)];
}

+ (id)observableWithScannerResultsOfType:(unint64_t)a3 inString:(id)a4
{
  id v6 = [a1 observableWithScannerResultsInString:a4];
  id v7 = [a1 binderTypeForResultType:a3];
  if ((off_1EE025420((uint64_t)&__block_literal_global_119, v7) & 1) == 0)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__CNObservable_DataDetectors__observableWithScannerResultsOfType_inString___block_invoke;
    v10[3] = &unk_1E56A1710;
    id v11 = v7;
    uint64_t v8 = [v6 filter:v10];

    id v6 = (void *)v8;
  }

  return v6;
}

uint64_t __75__CNObservable_DataDetectors__observableWithScannerResultsOfType_inString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 type];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (id)binderTypeForResultType:(unint64_t)a3
{
  if (a3 - 1 > 4)
  {
    uint64_t v4 = &stru_1EE0267A8;
  }
  else
  {
    uint64_t v4 = (__CFString *)**((id **)&unk_1E56A1750 + a3 - 1);
  }
  return v4;
}

+ (id)observableWithEmailAddressesInString:(id)a3
{
  uint64_t v3 = [a1 observableWithScannerResultsOfType:2 inString:a3];
  uint64_t v4 = [v3 map:&__block_literal_global_53];

  return v4;
}

uint64_t __68__CNObservable_DataDetectors__observableWithEmailAddressesInString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchedString];
}

+ (id)observableOnDefaultNotificationCenterWithName:(id)a3 object:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 defaultCenter];
  id v10 = [a1 observableOnNotificationCenter:v9 withName:v8 object:v7];

  return v10;
}

+ (id)observableOnNotificationCenter:(id)a3 withName:(id)a4 object:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke;
  void v15[3] = &unk_1E56A1820;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  id v13 = +[CNObservable observableWithBlock:v15];

  return v13;
}

id __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke_2;
  void v15[3] = &unk_1E56A17F8;
  id v16 = v3;
  id v7 = v3;
  id v8 = [v4 addObserverForName:v5 object:v6 queue:0 usingBlock:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke_3;
  v12[3] = &unk_1E569F310;
  id v13 = *(id *)(a1 + 32);
  id v14 = v8;
  id v9 = v8;
  id v10 = +[CNCancelationToken tokenWithCancelationBlock:v12];

  return v10;
}

uint64_t __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

uint64_t __79__CNObservable_NSNotification__observableOnNotificationCenter_withName_object___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
}

+ (id)observableOnDarwinNotificationCenterWithName:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__CNObservable_DarwinNotify__observableOnDarwinNotificationCenterWithName___block_invoke;
  v7[3] = &unk_1E56A06F8;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = +[CNObservable observableWithBlock:v7];

  return v5;
}

id __75__CNObservable_DarwinNotify__observableOnDarwinNotificationCenterWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DarwinObservers();
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  [v4 setObject:v3 forKey:v5];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_handler, *(CFStringRef *)(a1 + 32), 0, CFNotificationSuspensionBehaviorDrop);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__CNObservable_DarwinNotify__observableOnDarwinNotificationCenterWithName___block_invoke_2;
  v12[3] = &unk_1E56A0A60;
  id v13 = v4;
  id v14 = v5;
  id v15 = v3;
  id v16 = DarwinNotifyCenter;
  id v7 = v3;
  id v8 = v5;
  id v9 = v4;
  id v10 = +[CNCancelationToken tokenWithCancelationBlock:v12];

  return v10;
}

void __75__CNObservable_DarwinNotify__observableOnDarwinNotificationCenterWithName___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
  id v3 = *(const void **)(a1 + 48);
  double v2 = *(__CFNotificationCenter **)(a1 + 56);

  CFNotificationCenterRemoveEveryObserver(v2, v3);
}

+ (id)observableForKeyPath:(id)a3 ofObject:(id)a4 withOptions:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__CNObservable_NSKeyValueObserving__observableForKeyPath_ofObject_withOptions___block_invoke;
  void v13[3] = &unk_1E56A0AB0;
  id v14 = v8;
  id v15 = v7;
  unint64_t v16 = a5;
  id v9 = v7;
  id v10 = v8;
  id v11 = +[CNObservable observableWithBlock:v13];

  return v11;
}

id __79__CNObservable_NSKeyValueObserving__observableForKeyPath_ofObject_withOptions___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [[_CNKeyValueObserverHandler alloc] initWithObject:a1[4] keyPath:a1[5] observer:v3];

  [(_CNKeyValueObserverHandler *)v4 startObservingWithOptions:a1[6]];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__CNObservable_NSKeyValueObserving__observableForKeyPath_ofObject_withOptions___block_invoke_2;
  void v8[3] = &unk_1E569F9D8;
  id v9 = v4;
  uint64_t v5 = v4;
  uint64_t v6 = +[CNCancelationToken tokenWithCancelationBlock:v8];

  return v6;
}

uint64_t __79__CNObservable_NSKeyValueObserving__observableForKeyPath_ofObject_withOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopObserving];
}

+ (void)observableWithResult:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_19091D000, log, OS_LOG_TYPE_FAULT, "Nil result passed to observableWithResult:", v1, 2u);
}

void __29__CNObservable_dematerialize__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19091D000, a2, OS_LOG_TYPE_DEBUG, "Attempt to dematerialize a non-event: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end