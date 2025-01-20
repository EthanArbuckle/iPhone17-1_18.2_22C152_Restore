@interface EFObservable
+ (id)combineLatest:(id)a3;
+ (id)concatenate:(id)a3;
+ (id)emptyObservable;
+ (id)merge:(id)a3;
+ (id)neverObservable;
+ (id)observableAfterDelay:(double)a3 interval:(double)a4 scheduler:(id)a5;
+ (id)observableAfterDelay:(double)a3 scheduler:(id)a4;
+ (id)observableObserver;
+ (id)observableOnDefaultNotificationCenterWithName:(id)a3 object:(id)a4;
+ (id)observableOnNotificationCenter:(id)a3 name:(id)a4 object:(id)a5;
+ (id)observableOnNotifyTokenWithName:(id)a3;
+ (id)observableWithBlock:(id)a3;
+ (id)observableWithError:(id)a3;
+ (id)observableWithFuture:(id)a3;
+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8;
+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 scheduler:(id)a7;
+ (id)observableWithResult:(id)a3;
+ (id)observableWithResults:(id)a3;
+ (id)observableWithResults:(id)a3 scheduler:(id)a4;
+ (id)observableWithTimeInterval:(double)a3 scheduler:(id)a4;
- (id)allObjects:(id *)a3;
- (id)debounceWithTimeInterval:(double)a3;
- (id)debounceWithTimeInterval:(double)a3 scheduler:(id)a4;
- (id)delay:(double)a3 scheduler:(id)a4;
- (id)distinctUntilChanged;
- (id)doOnCancel:(id)a3;
- (id)doOnCompletion:(id)a3;
- (id)doOnError:(id)a3;
- (id)doOnNext:(id)a3;
- (id)doOnSubscribe:(id)a3;
- (id)doOnTerminate:(id)a3;
- (id)filter:(id)a3;
- (id)first;
- (id)map:(id)a3;
- (id)multicast:(id)a3;
- (id)observeOn:(id)a3;
- (id)publish;
- (id)replay;
- (id)replay:(unint64_t)a3;
- (id)sampleWithObservable:(id)a3;
- (id)sampleWithTimeInterval:(double)a3;
- (id)sampleWithTimeInterval:(double)a3 scheduler:(id)a4;
- (id)skip:(unint64_t)a3;
- (id)startWith:(id)a3;
- (id)startWith:(id)a3 scheduler:(id)a4;
- (id)subscribeOn:(id)a3;
- (id)subscribeWithResultBlock:(id)a3;
- (id)take:(unint64_t)a3;
@end

@implementation EFObservable

EFCancelationToken *__26__EFObservable_observeOn___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __26__EFObservable_observeOn___block_invoke_2;
  v20[3] = &unk_1E6122C50;
  v5 = *(void **)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  v22 = v4;
  id v23 = v3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __26__EFObservable_observeOn___block_invoke_4;
  v16[3] = &unk_1E61220B8;
  id v17 = *(id *)(a1 + 40);
  v18 = v22;
  id v19 = v23;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __26__EFObservable_observeOn___block_invoke_6;
  v12[3] = &unk_1E6122C78;
  id v13 = *(id *)(a1 + 40);
  v6 = v18;
  v14 = v6;
  id v7 = v19;
  id v15 = v7;
  v8 = +[EFObserver observerWithResultBlock:v20 completionBlock:v16 failureBlock:v12];
  v9 = [v5 subscribe:v8];

  [(EFCancelationToken *)v6 addCancelable:v9];
  v10 = v6;

  return v10;
}

EFCancelationToken *__51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__5;
  v31[4] = __Block_byref_object_dispose__5;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2810000000;
  v29[3] = &unk_1B5ADDE1D;
  int v30 = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v4);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_43;
  v21[3] = &unk_1E6122D90;
  v24 = v29;
  v25 = v33;
  v26 = v31;
  v5 = *(void **)(a1 + 32);
  id v22 = *(id *)(a1 + 40);
  v27[1] = *(id *)(a1 + 48);
  objc_copyWeak(v27, &location);
  id v6 = v3;
  id v23 = v6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_3;
  v16[3] = &unk_1E6122DB8;
  v18 = v29;
  id v19 = v31;
  objc_copyWeak(&v20, &location);
  id v17 = v6;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_4;
  v14 = &unk_1E6121B68;
  id v7 = v17;
  id v15 = v7;
  v8 = +[EFObserver observerWithResultBlock:v21 completionBlock:v16 failureBlock:&v11];
  v9 = objc_msgSend(v5, "subscribe:", v8, v11, v12, v13, v14);

  [(EFCancelationToken *)v4 addCancelable:v9];
  objc_destroyWeak(&v20);

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);

  return v4;
}

EFCancelationToken *__22__EFObservable_merge___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  +[_EFMergingObservable subscribeObserver:v3 toObservables:*(void *)(a1 + 32) unless:v4];

  return v4;
}

EFCancelationToken *__21__EFObservable_take___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __21__EFObservable_take___block_invoke_2;
  v17[3] = &unk_1E6122E08;
  v5 = *(void **)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 40);
  id v18 = v3;
  id v6 = v4;
  id v19 = v6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __21__EFObservable_take___block_invoke_3;
  v15[3] = &unk_1E6121B40;
  id v16 = v18;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __21__EFObservable_take___block_invoke_4;
  v13[3] = &unk_1E6121B68;
  id v7 = v16;
  id v14 = v7;
  v8 = +[EFObserver observerWithResultBlock:v17 completionBlock:v15 failureBlock:v13];
  v9 = [v5 subscribe:v8];
  [(EFCancelationToken *)v6 addCancelable:v9];

  v10 = v14;
  uint64_t v11 = v6;

  return v11;
}

EFCancelationToken *__21__EFObservable_skip___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __21__EFObservable_skip___block_invoke_2;
  v17[3] = &unk_1E6122E58;
  v5 = *(void **)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  id v18 = v3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __21__EFObservable_skip___block_invoke_3;
  v15[3] = &unk_1E6121B40;
  id v16 = v18;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __21__EFObservable_skip___block_invoke_4;
  id v13 = &unk_1E6121B68;
  id v6 = v16;
  id v14 = v6;
  id v7 = +[EFObserver observerWithResultBlock:v17 completionBlock:v15 failureBlock:&v10];
  v8 = objc_msgSend(v5, "subscribe:", v7, v10, v11, v12, v13);
  [(EFCancelationToken *)v4 addCancelable:v8];

  return v4;
}

EFCancelationToken *__48__EFObservable_observableOnNotifyTokenWithName___block_invoke(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  int out_token = -1;
  v5 = (const char *)[*(id *)(a1 + 32) UTF8String];
  id v6 = dispatch_get_global_queue(21, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __48__EFObservable_observableOnNotifyTokenWithName___block_invoke_2;
  handler[3] = &unk_1E6122B98;
  id v7 = v3;
  id v19 = v7;
  LODWORD(v5) = notify_register_dispatch(v5, &out_token, v6, handler);

  if (v5)
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *__error();
    uint64_t v21 = *MEMORY[0x1E4F28568];
    uint64_t v10 = NSString;
    uint64_t v11 = __error();
    uint64_t v12 = [v10 stringWithUTF8String:strerror(*v11)];
    v22[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v14 = [v8 errorWithDomain:*MEMORY[0x1E4F28798] code:v9 userInfo:v13];
    [v7 observerDidFailWithError:v14];
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__EFObservable_observableOnNotifyTokenWithName___block_invoke_3;
    v16[3] = &__block_descriptor_36_e5_v8__0l;
    int v17 = out_token;
    [(EFCancelationToken *)v4 addCancelationBlock:v16];
  }

  return v4;
}

EFCancelationToken *__28__EFObservable_concatenate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_alloc_init(EFCancelationToken);
  +[_EFConcatenatingObservable subscribeObserver:v3 toObservables:*(void *)(a1 + 32) unless:v4];

  return v4;
}

BOOL __48__EFObservable_observableWithResults_scheduler___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 unsignedIntegerValue] < *(void *)(a1 + 32);
}

id __48__EFObservable_observableWithResults_scheduler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "unsignedIntegerValue"));

  return v4;
}

void __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_2(uint64_t a1)
{
  v2 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
  os_unfair_lock_lock(v2);
  if (--*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  os_unfair_lock_unlock(v2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && v6 && ([WeakRetained isCanceled] & 1) == 0) {
    [*(id *)(a1 + 32) observerDidReceiveResult:v6];
  }
}

+ (id)observableOnNotifyTokenWithName:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__EFObservable_observableOnNotifyTokenWithName___block_invoke;
  v8[3] = &unk_1E6122A78;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 observableWithBlock:v8];

  return v6;
}

- (id)startWith:(id)a3
{
  id v4 = a3;
  id v5 = +[EFScheduler immediateScheduler];
  id v6 = [(EFObservable *)self startWith:v4 scheduler:v5];

  return v6;
}

- (id)startWith:(id)a3 scheduler:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_class();
  id v9 = [(id)objc_opt_class() observableWithResults:v6 scheduler:v7];
  v13[0] = v9;
  v13[1] = self;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v11 = [v8 concatenate:v10];

  return v11;
}

+ (id)observableWithResults:(id)a3 scheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__EFObservable_observableWithResults_scheduler___block_invoke;
  v14[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
  v14[4] = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__EFObservable_observableWithResults_scheduler___block_invoke_3;
  v12[3] = &unk_1E6122AE0;
  id v9 = v6;
  id v13 = v9;
  uint64_t v10 = [a1 observableWithInitialState:&unk_1F0EC0040 condition:v14 nextState:&__block_literal_global_22 resultSelector:v12 scheduler:v7];

  return v10;
}

+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 scheduler:(id)a7
{
  id v7 = [a1 observableWithInitialState:a3 condition:a4 nextState:a5 resultSelector:a6 delay:0 scheduler:a7];

  return v7;
}

+ (id)observableWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6 delay:(id)a7 scheduler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [[_EFGeneratorObservable alloc] initWithInitialState:v13 condition:v14 nextState:v15 resultSelector:v16 delay:v17 scheduler:v18];

  return v19;
}

+ (id)concatenate:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__EFObservable_concatenate___block_invoke;
  v8[3] = &unk_1E6122A78;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 observableWithBlock:v8];

  return v6;
}

void __48__EFObservable_observableOnNotifyTokenWithName___block_invoke_2(uint64_t a1, int a2)
{
  id v4 = (void *)MEMORY[0x1BA9A5240]();
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(a2, &state64);
  id v6 = *(void **)(a1 + 32);
  if (state) {
    [MEMORY[0x1E4F1CA98] null];
  }
  else {
  id v7 = [NSNumber numberWithUnsignedLongLong:state64];
  }
  [v6 observerDidReceiveResult:v7];
}

void __21__EFObservable_take___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || ([*(id *)(a1 + 32) observerDidReceiveResult:v3],
        --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24),
        !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)))
  {
    [*(id *)(a1 + 32) observerDidComplete];
    [*(id *)(a1 + 40) cancel];
  }
}

void __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_43(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  os_unfair_lock_lock(v5);
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  os_unfair_lock_unlock(v5);
  id v6 = *(void **)(a1 + 32);
  double v7 = *(double *)(a1 + 80);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_2;
  v9[3] = &unk_1E6122D68;
  long long v11 = *(_OWORD *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 64);
  objc_copyWeak(&v13, (id *)(a1 + 72));
  id v10 = *(id *)(a1 + 40);
  id v8 = (id)[v6 afterDelay:v9 performBlock:v7];

  objc_destroyWeak(&v13);
}

void __21__EFObservable_skip___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  id v6 = v3;
  if (v5) {
    *(void *)(v4 + 24) = v5 - 1;
  }
  else {
    [*(id *)(a1 + 32) observerDidReceiveResult:v3];
  }
}

void __26__EFObservable_observeOn___block_invoke_4(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__EFObservable_observeOn___block_invoke_5;
  v3[3] = &unk_1E6121B90;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performBlock:v3];
}

void __26__EFObservable_observeOn___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__EFObservable_observeOn___block_invoke_3;
  v6[3] = &unk_1E61220B8;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  [v4 performBlock:v6];
}

uint64_t __26__EFObservable_observeOn___block_invoke_5(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 40);
    return [v3 observerDidComplete];
  }
  return result;
}

uint64_t __26__EFObservable_observeOn___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 observerDidReceiveResult:v4];
  }
  return result;
}

void __20__EFObservable_map___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = v2;
  if (!v2)
  {
    v2 = [MEMORY[0x1E4F1CA98] null];
  }
  [v1 observerDidReceiveResult:v2];
  id v3 = v4;
  if (!v4)
  {

    id v3 = 0;
  }
}

- (id)subscribeWithResultBlock:(id)a3
{
  id v4 = +[EFObserver observerWithResultBlock:a3];
  id v5 = [(EFObservable *)self subscribe:v4];

  return v5;
}

+ (id)observableObserver
{
  v2 = objc_alloc_init(_EFManualObservable);

  return v2;
}

- (id)take:(unint64_t)a3
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = a3;
  id v4 = objc_opt_class();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __21__EFObservable_take___block_invoke;
  v7[3] = &unk_1E6122E30;
  v7[4] = self;
  v7[5] = v8;
  id v5 = [v4 observableWithBlock:v7];
  _Block_object_dispose(v8, 8);

  return v5;
}

- (id)skip:(unint64_t)a3
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = a3;
  id v4 = objc_opt_class();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __21__EFObservable_skip___block_invoke;
  v7[3] = &unk_1E6122E30;
  v7[4] = self;
  v7[5] = v8;
  id v5 = [v4 observableWithBlock:v7];
  _Block_object_dispose(v8, 8);

  return v5;
}

- (id)debounceWithTimeInterval:(double)a3 scheduler:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke;
  v11[3] = &unk_1E6122DE0;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  double v13 = a3;
  id v9 = [v7 observableWithBlock:v11];

  return v9;
}

+ (id)observableWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = [[_EFBlockObservable alloc] initWithBlock:v3];

  return v4;
}

+ (id)merge:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __22__EFObservable_merge___block_invoke;
  v8[3] = &unk_1E6122A78;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 observableWithBlock:v8];

  return v6;
}

- (id)observeOn:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __26__EFObservable_observeOn___block_invoke;
  v9[3] = &unk_1E6122C28;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 observableWithBlock:v9];

  return v7;
}

- (id)debounceWithTimeInterval:(double)a3
{
  id v5 = +[EFScheduler globalAsyncScheduler];
  id v6 = [(EFObservable *)self debounceWithTimeInterval:v5 scheduler:a3];

  return v6;
}

id __48__EFObservable_observableWithResults_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "unsignedIntegerValue") + 1);

  return v3;
}

uint64_t __59__EFObservable_observableOnNotificationCenter_name_object___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

void ___ef_log_EFObservable_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EFObservable");
  v1 = (void *)_ef_log_EFObservable_log;
  _ef_log_EFObservable_log = (uint64_t)v0;
}

+ (id)observableWithFuture:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__EFObservable_observableWithFuture___block_invoke;
  v8[3] = &unk_1E6122A78;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 observableWithBlock:v8];

  return v6;
}

EFCancelationToken *__37__EFObservable_observableWithFuture___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(EFCancelationToken);
  id v5 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __37__EFObservable_observableWithFuture___block_invoke_2;
  v17[3] = &unk_1E6121AA0;
  id v6 = v4;
  id v18 = v6;
  id v7 = v3;
  id v19 = v7;
  [v5 addSuccessBlock:v17];
  id v8 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__EFObservable_observableWithFuture___block_invoke_3;
  v14[3] = &unk_1E6121AF0;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  [v8 addFailureBlock:v14];
  long long v11 = v16;
  id v12 = v9;

  return v12;
}

void __37__EFObservable_observableWithFuture___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    [*(id *)(a1 + 40) observerDidReceiveResult:v3];
    [*(id *)(a1 + 40) observerDidComplete];
  }
}

void __37__EFObservable_observableWithFuture___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0) {
    [*(id *)(a1 + 40) observerDidFailWithError:v3];
  }
}

+ (id)observableWithResult:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__EFObservable_observableWithResult___block_invoke;
  v8[3] = &unk_1E6122A78;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 observableWithBlock:v8];

  return v6;
}

EFCancelationToken *__37__EFObservable_observableWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 observerDidReceiveResult:*(void *)(a1 + 32)];
  [v3 observerDidComplete];
  id v4 = objc_alloc_init(EFCancelationToken);

  return v4;
}

+ (id)observableWithResults:(id)a3
{
  id v4 = a3;
  id v5 = +[EFScheduler immediateScheduler];
  id v6 = [a1 observableWithResults:v4 scheduler:v5];

  return v6;
}

+ (id)observableWithError:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__EFObservable_observableWithError___block_invoke;
  v8[3] = &unk_1E6122A78;
  id v9 = v4;
  id v5 = v4;
  id v6 = [a1 observableWithBlock:v8];

  return v6;
}

EFCancelationToken *__36__EFObservable_observableWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 observerDidFailWithError:*(void *)(a1 + 32)];
  id v4 = objc_alloc_init(EFCancelationToken);

  return v4;
}

+ (id)observableWithTimeInterval:(double)a3 scheduler:(id)a4
{
  id v4 = [a1 observableAfterDelay:a4 interval:a3 scheduler:a3];

  return v4;
}

+ (id)observableAfterDelay:(double)a3 scheduler:(id)a4
{
  id v4 = [a1 observableAfterDelay:a4 interval:a3 scheduler:1.79769313e308];

  return v4;
}

+ (id)observableAfterDelay:(double)a3 interval:(double)a4 scheduler:(id)a5
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke;
  v8[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
  *(double *)&void v8[4] = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke_2_21;
  v7[3] = &__block_descriptor_48_e18_d16__0__NSNumber_8l;
  *(double *)&v7[4] = a3;
  *(double *)&v7[5] = a4;
  id v5 = +[EFObservable observableWithInitialState:&unk_1F0EC0040 condition:v8 nextState:&__block_literal_global_13_0 resultSelector:&__block_literal_global_19 delay:v7 scheduler:a5];

  return v5;
}

BOOL __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  BOOL v5 = 1.79769313e308 - *(double *)(a1 + 32) > 2.22044605e-16 || [v3 integerValue] < 1;

  return v5;
}

id __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 integerValue]) {
    id v3 = v2;
  }
  else {
    id v3 = &unk_1F0EC0058;
  }

  return v3;
}

id __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke_16()
{
  os_log_t v0 = [MEMORY[0x1E4F1CA98] null];

  return v0;
}

double __56__EFObservable_observableAfterDelay_interval_scheduler___block_invoke_2_21(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 integerValue];
  uint64_t v4 = 40;
  if (!v3) {
    uint64_t v4 = 32;
  }
  return *(double *)(a1 + v4);
}

+ (id)observableOnNotificationCenter:(id)a3 name:(id)a4 object:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__EFObservable_observableOnNotificationCenter_name_object___block_invoke;
  v16[3] = &unk_1E6122B70;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = [a1 observableWithBlock:v16];

  return v14;
}

EFCancelationToken *__59__EFObservable_observableOnNotificationCenter_name_object___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(EFCancelationToken);
  BOOL v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__EFObservable_observableOnNotificationCenter_name_object___block_invoke_2;
  v18[3] = &unk_1E6122B48;
  id v8 = v3;
  id v19 = v8;
  id v9 = v4;
  uint64_t v20 = v9;
  id v10 = [v5 addObserverForName:v6 object:v7 queue:0 usingBlock:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__EFObservable_observableOnNotificationCenter_name_object___block_invoke_3;
  v15[3] = &unk_1E6121B90;
  id v16 = *(id *)(a1 + 32);
  id v17 = v10;
  id v11 = v10;
  [(EFCancelationToken *)v9 addCancelationBlock:v15];
  id v12 = v17;
  id v13 = v9;

  return v13;
}

uint64_t __59__EFObservable_observableOnNotificationCenter_name_object___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
}

+ (id)observableOnDefaultNotificationCenterWithName:(id)a3 object:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = [a1 observableOnNotificationCenter:v8 name:v6 object:v7];

  return v9;
}

uint64_t __48__EFObservable_observableOnNotifyTokenWithName___block_invoke_3(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(a1 + 32));
}

+ (id)combineLatest:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = [[_EFCombineLatestObservable alloc] initWithObservables:v3];
  }
  else
  {
    uint64_t v4 = +[EFObservable emptyObservable];
  }
  BOOL v5 = v4;

  return v5;
}

+ (id)neverObservable
{
  return (id)[a1 observableWithBlock:&__block_literal_global_36];
}

EFCancelationToken *__31__EFObservable_neverObservable__block_invoke()
{
  os_log_t v0 = objc_alloc_init(EFCancelationToken);

  return v0;
}

+ (id)emptyObservable
{
  return (id)[a1 observableWithBlock:&__block_literal_global_38];
}

EFCancelationToken *__31__EFObservable_emptyObservable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 observerDidComplete];
  id v3 = objc_alloc_init(EFCancelationToken);

  return v3;
}

- (id)subscribeOn:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__EFObservable_subscribeOn___block_invoke;
  v9[3] = &unk_1E6122C28;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  id v7 = [v5 observableWithBlock:v9];

  return v7;
}

EFCancelationToken *__28__EFObservable_subscribeOn___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(EFCancelationToken);
  BOOL v5 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __28__EFObservable_subscribeOn___block_invoke_2;
  v12[3] = &unk_1E6122C00;
  id v6 = v4;
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v7;
  id v8 = v3;
  id v15 = v8;
  id v9 = [v5 performCancelableBlock:v12];
  [(EFCancelationToken *)v6 addCancelable:v9];
  id v10 = v6;

  return v10;
}

void __28__EFObservable_subscribeOn___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) subscribe:*(void *)(a1 + 48)];
  objc_msgSend(v1, "addCancelable:");
}

void __26__EFObservable_observeOn___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__EFObservable_observeOn___block_invoke_7;
  v6[3] = &unk_1E61220B8;
  id v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v5 = v3;
  [v4 performBlock:v6];
}

uint64_t __26__EFObservable_observeOn___block_invoke_7(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 observerDidFailWithError:v4];
  }
  return result;
}

- (id)allObjects:(id *)a3
{
  id v5 = +[EFPromise promise];
  id v6 = [v5 completionHandlerAdapter];
  id v7 = +[EFObserver observerWithCompletionHandler:v6];
  id v8 = [(EFObservable *)self subscribe:v7];

  id v9 = [v5 future];
  id v10 = [v9 result:a3];

  return v10;
}

- (id)doOnSubscribe:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__EFObservable_doOnSubscribe___block_invoke;
  v9[3] = &unk_1E6122CA0;
  id v6 = v4;
  void v9[4] = self;
  id v10 = v6;
  id v7 = [v5 observableWithBlock:v9];

  return v7;
}

id __30__EFObservable_doOnSubscribe___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = [*(id *)(a1 + 32) subscribe:v3];

  return v4;
}

- (id)doOnNext:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __25__EFObservable_doOnNext___block_invoke;
  v9[3] = &unk_1E6122CC8;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 observableWithBlock:v9];

  return v7;
}

id __25__EFObservable_doOnNext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __25__EFObservable_doOnNext___block_invoke_2;
  v16[3] = &unk_1E6121FA0;
  id v4 = *(void **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  id v17 = v3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __25__EFObservable_doOnNext___block_invoke_3;
  v14[3] = &unk_1E6121B40;
  id v15 = v17;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __25__EFObservable_doOnNext___block_invoke_4;
  id v12 = &unk_1E6121B68;
  id v5 = v15;
  id v13 = v5;
  id v6 = +[EFObserver observerWithResultBlock:v16 completionBlock:v14 failureBlock:&v9];
  id v7 = objc_msgSend(v4, "subscribe:", v6, v9, v10, v11, v12);

  return v7;
}

void __25__EFObservable_doOnNext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) observerDidReceiveResult:v3];
}

uint64_t __25__EFObservable_doOnNext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __25__EFObservable_doOnNext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

- (id)doOnCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__EFObservable_doOnCompletion___block_invoke;
  v9[3] = &unk_1E6122CC8;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 observableWithBlock:v9];

  return v7;
}

id __31__EFObservable_doOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __31__EFObservable_doOnCompletion___block_invoke_2;
  v17[3] = &unk_1E6121C08;
  id v18 = v3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __31__EFObservable_doOnCompletion___block_invoke_3;
  v14[3] = &unk_1E6122690;
  id v15 = v18;
  id v16 = *(id *)(a1 + 40);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __31__EFObservable_doOnCompletion___block_invoke_4;
  id v12 = &unk_1E6121B68;
  id v5 = v15;
  id v13 = v5;
  id v6 = +[EFObserver observerWithResultBlock:v17 completionBlock:v14 failureBlock:&v9];
  id v7 = objc_msgSend(v4, "subscribe:", v6, v9, v10, v11, v12);

  return v7;
}

uint64_t __31__EFObservable_doOnCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

uint64_t __31__EFObservable_doOnCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) observerDidComplete];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __31__EFObservable_doOnCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

- (id)doOnError:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __26__EFObservable_doOnError___block_invoke;
  v9[3] = &unk_1E6122CC8;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 observableWithBlock:v9];

  return v7;
}

id __26__EFObservable_doOnError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __26__EFObservable_doOnError___block_invoke_2;
  v17[3] = &unk_1E6121C08;
  id v18 = v3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __26__EFObservable_doOnError___block_invoke_3;
  v15[3] = &unk_1E6121B40;
  id v16 = v18;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __26__EFObservable_doOnError___block_invoke_4;
  id v12 = &unk_1E61221D0;
  id v5 = v16;
  id v13 = v5;
  id v14 = *(id *)(a1 + 40);
  id v6 = +[EFObserver observerWithResultBlock:v17 completionBlock:v15 failureBlock:&v9];
  id v7 = objc_msgSend(v4, "subscribe:", v6, v9, v10, v11, v12);

  return v7;
}

uint64_t __26__EFObservable_doOnError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

uint64_t __26__EFObservable_doOnError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

void __26__EFObservable_doOnError___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:");
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)doOnCancel:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __27__EFObservable_doOnCancel___block_invoke;
  v9[3] = &unk_1E6122CC8;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 observableWithBlock:v9];

  return v7;
}

id __27__EFObservable_doOnCancel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 1;
  id v4 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __27__EFObservable_doOnCancel___block_invoke_2;
  v17[3] = &unk_1E6122CF0;
  void v17[4] = v18;
  id v5 = [v4 doOnCompletion:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __27__EFObservable_doOnCancel___block_invoke_3;
  v16[3] = &unk_1E6122D18;
  void v16[4] = v18;
  id v6 = [v5 doOnError:v16];
  id v7 = [v6 subscribe:v3];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __27__EFObservable_doOnCancel___block_invoke_4;
  id v13 = &unk_1E6122D40;
  id v15 = v18;
  id v14 = *(id *)(a1 + 40);
  id v8 = +[EFCancelationToken tokenWithCancelationBlock:&v10];
  objc_msgSend(v8, "addCancelable:", v7, v10, v11, v12, v13);

  _Block_object_dispose(v18, 8);

  return v8;
}

uint64_t __27__EFObservable_doOnCancel___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __27__EFObservable_doOnCancel___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __27__EFObservable_doOnCancel___block_invoke_4(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)doOnTerminate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__EFObservable_doOnTerminate___block_invoke;
  v9[3] = &unk_1E6122CC8;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v7 = [v5 observableWithBlock:v9];

  return v7;
}

id __30__EFObservable_doOnTerminate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __30__EFObservable_doOnTerminate___block_invoke_2;
  v15[3] = &unk_1E6121C08;
  id v16 = v3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __30__EFObservable_doOnTerminate___block_invoke_3;
  v12[3] = &unk_1E6122690;
  id v13 = v16;
  id v14 = *(id *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__EFObservable_doOnTerminate___block_invoke_4;
  v9[3] = &unk_1E61221D0;
  id v5 = v13;
  id v10 = v5;
  id v11 = *(id *)(a1 + 40);
  id v6 = +[EFObserver observerWithResultBlock:v15 completionBlock:v12 failureBlock:v9];
  id v7 = [v4 subscribe:v6];

  return v7;
}

uint64_t __30__EFObservable_doOnTerminate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

uint64_t __30__EFObservable_doOnTerminate___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) observerDidComplete];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __30__EFObservable_doOnTerminate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "observerDidFailWithError:");
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_3(uint64_t a1)
{
  id v2 = (os_unfair_lock_s *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
  os_unfair_lock_lock(v2);
  id v7 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  os_unfair_lock_unlock(v2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCanceled] & 1) == 0)
  {
    if (v7) {
      [*(id *)(a1 + 32) observerDidReceiveResult:v7];
    }
    [*(id *)(a1 + 32) observerDidComplete];
  }
}

uint64_t __51__EFObservable_debounceWithTimeInterval_scheduler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

- (id)delay:(double)a3 scheduler:(id)a4
{
  id v6 = a4;
  id v7 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__EFObservable_delay_scheduler___block_invoke;
  v11[3] = &unk_1E6122DE0;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  double v13 = a3;
  uint64_t v9 = [v7 observableWithBlock:v11];

  return v9;
}

EFCancelationToken *__32__EFObservable_delay_scheduler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(EFCancelationToken);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __32__EFObservable_delay_scheduler___block_invoke_2;
  v20[3] = &unk_1E6122040;
  id v5 = *(void **)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 48);
  id v22 = v4;
  id v23 = v3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __32__EFObservable_delay_scheduler___block_invoke_4;
  v15[3] = &unk_1E6121AC8;
  id v16 = *(id *)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 48);
  id v6 = v22;
  id v17 = v6;
  id v18 = v23;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __32__EFObservable_delay_scheduler___block_invoke_6;
  void v13[3] = &unk_1E6121B68;
  id v7 = v18;
  id v14 = v7;
  id v8 = +[EFObserver observerWithResultBlock:v20 completionBlock:v15 failureBlock:v13];
  uint64_t v9 = [v5 subscribe:v8];
  [(EFCancelationToken *)v6 addCancelable:v9];

  id v10 = v14;
  id v11 = v6;

  return v11;
}

void __32__EFObservable_delay_scheduler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(double *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__EFObservable_delay_scheduler___block_invoke_3;
  v8[3] = &unk_1E61220B8;
  id v5 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v6 = v3;
  id v7 = (id)[v5 afterDelay:v8 performBlock:v4];
}

uint64_t __32__EFObservable_delay_scheduler___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 observerDidReceiveResult:v4];
  }
  return result;
}

void __32__EFObservable_delay_scheduler___block_invoke_4(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__EFObservable_delay_scheduler___block_invoke_5;
  v5[3] = &unk_1E6121B90;
  id v3 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v4 = (id)[v3 afterDelay:v5 performBlock:v2];
}

uint64_t __32__EFObservable_delay_scheduler___block_invoke_5(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCanceled];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 40);
    return [v3 observerDidComplete];
  }
  return result;
}

uint64_t __32__EFObservable_delay_scheduler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

- (id)distinctUntilChanged
{
  double v2 = [[_EFDistinctUntilChangedObservable alloc] initWithObservable:self];

  return v2;
}

- (id)first
{
  return [(EFObservable *)self take:1];
}

uint64_t __21__EFObservable_take___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __21__EFObservable_take___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

uint64_t __21__EFObservable_skip___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __21__EFObservable_skip___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

- (id)filter:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"EFObservable.m", 485, @"Invalid parameter not satisfying: %@", @"filter" object file lineNumber description];
  }
  id v6 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __23__EFObservable_filter___block_invoke;
  v11[3] = &unk_1E6122CC8;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  id v8 = [v6 observableWithBlock:v11];

  return v8;
}

id __23__EFObservable_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __23__EFObservable_filter___block_invoke_2;
  v16[3] = &unk_1E6121FA0;
  id v4 = *(void **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  id v17 = v3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __23__EFObservable_filter___block_invoke_3;
  v14[3] = &unk_1E6121B40;
  id v15 = v17;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __23__EFObservable_filter___block_invoke_4;
  id v12 = &unk_1E6121B68;
  id v5 = v15;
  id v13 = v5;
  id v6 = +[EFObserver observerWithResultBlock:v16 completionBlock:v14 failureBlock:&v9];
  id v7 = objc_msgSend(v4, "subscribe:", v6, v9, v10, v11, v12);

  return v7;
}

void __23__EFObservable_filter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) observerDidReceiveResult:v3];
  }
}

uint64_t __23__EFObservable_filter___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __23__EFObservable_filter___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

- (id)map:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"EFObservable.m", 501, @"Invalid parameter not satisfying: %@", @"transform" object file lineNumber description];
  }
  id v6 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __20__EFObservable_map___block_invoke;
  v11[3] = &unk_1E6122CC8;
  v11[4] = self;
  id v7 = v5;
  id v12 = v7;
  id v8 = [v6 observableWithBlock:v11];

  return v8;
}

id __20__EFObservable_map___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __20__EFObservable_map___block_invoke_2;
  v16[3] = &unk_1E61221A8;
  id v17 = v3;
  id v18 = *(id *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __20__EFObservable_map___block_invoke_3;
  v14[3] = &unk_1E6121B40;
  id v15 = v17;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __20__EFObservable_map___block_invoke_4;
  id v12 = &unk_1E6121B68;
  id v5 = v15;
  id v13 = v5;
  id v6 = +[EFObserver observerWithResultBlock:v16 completionBlock:v14 failureBlock:&v9];
  id v7 = objc_msgSend(v4, "subscribe:", v6, v9, v10, v11, v12);

  return v7;
}

uint64_t __20__EFObservable_map___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

uint64_t __20__EFObservable_map___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:a2];
}

- (id)multicast:(id)a3
{
  id v4 = a3;
  id v5 = [[_EFConnectableObservable alloc] initWithObservable:self subject:v4];

  return v5;
}

- (id)publish
{
  id v3 = +[EFObservable observableObserver];
  id v4 = [(EFObservable *)self multicast:v3];

  return v4;
}

- (id)replay
{
  return [(EFObservable *)self replay:0x7FFFFFFFFFFFFFFFLL];
}

- (id)replay:(unint64_t)a3
{
  id v4 = [[_EFReplayObservable alloc] initWithCount:a3];
  id v5 = [(EFObservable *)self multicast:v4];

  return v5;
}

- (id)sampleWithTimeInterval:(double)a3
{
  id v5 = +[EFScheduler globalAsyncScheduler];
  id v6 = [(EFObservable *)self sampleWithTimeInterval:v5 scheduler:a3];

  return v6;
}

- (id)sampleWithTimeInterval:(double)a3 scheduler:(id)a4
{
  id v6 = a4;
  id v7 = [[_EFIdealTimerObservable alloc] initWithObservable:self timeInterval:v6 scheduler:a3];
  id v8 = [(EFObservable *)self sampleWithObservable:v7];

  return v8;
}

- (id)sampleWithObservable:(id)a3
{
  id v4 = a3;
  id v5 = [[_EFSamplingObservable alloc] initWithObservable:self sampler:v4];

  return v5;
}

@end