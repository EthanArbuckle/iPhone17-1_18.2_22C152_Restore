@interface CNFlatMapObservable
@end

@implementation CNFlatMapObservable

id __76___CNFlatMapObservable_concatMapWithObservable_transform_schedulerProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNSuspendableSchedulerDecorator suspendedSchedulerWithScheduler:a2];
}

id __74___CNFlatMapObservable_flatMapWithObservable_transform_schedulerProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNSuspendableSchedulerDecorator resumedSchedulerWithScheduler:a2];
}

void __34___CNFlatMapObservable_subscribe___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [*(id *)(a1 + 32) resourceLock];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __34___CNFlatMapObservable_subscribe___block_invoke_2;
  v16[3] = &unk_1E569F310;
  id v17 = *(id *)(a1 + 32);
  id v18 = v4;
  id v6 = v4;
  [v5 performBlock:v16];

  objc_msgSend(v6, "_cn_each:", &__block_literal_global_42);
  v7 = [*(id *)(a1 + 32) resourceLock];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __34___CNFlatMapObservable_subscribe___block_invoke_4;
  v14[3] = &unk_1E569F9D8;
  id v15 = *(id *)(a1 + 32);
  [v7 performBlock:v14];

  v8 = [*(id *)(a1 + 32) downstream];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34___CNFlatMapObservable_subscribe___block_invoke_6;
  v10[3] = &unk_1E569F988;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v3;
  id v9 = v3;
  [v8 performBlock:v10];
}

void __34___CNFlatMapObservable_subscribe___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) decorators];
  id v3 = [v2 allObjects];
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_18_1);

  v4 = *(void **)(a1 + 40);
  v5 = [*(id *)(a1 + 32) tokens];
  id v6 = [v5 allObjects];
  [v4 setArray:v6];

  id v7 = [*(id *)(a1 + 32) tokens];
  [v7 removeAllObjects];
}

uint64_t __34___CNFlatMapObservable_subscribe___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 suspend];
}

void __34___CNFlatMapObservable_subscribe___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) decorators];
  v1 = [v2 allObjects];
  objc_msgSend(v1, "_cn_each:", &__block_literal_global_21);
}

uint64_t __34___CNFlatMapObservable_subscribe___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 resume];
}

uint64_t __34___CNFlatMapObservable_subscribe___block_invoke_6(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isObserverReceiving];
  if (result)
  {
    [*(id *)(a1 + 32) setObserverReceiving:0];
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 observerDidFailWithError:v4];
  }
  return result;
}

void __34___CNFlatMapObservable_subscribe___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v4 = [*(id *)(a1 + 32) resourceLock];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __34___CNFlatMapObservable_subscribe___block_invoke_8;
  id v13 = &unk_1E569F9B0;
  id v15 = &v16;
  id v14 = *(id *)(a1 + 32);
  [v4 performBlock:&v10];

  if (*((unsigned char *)v17 + 24))
  {
    v5 = *(void **)(a1 + 40);
    id v6 = objc_msgSend(v3, "doOnError:", *(void *)(a1 + 56), v10, v11, v12, v13);
    id v7 = [v5 subscribeInnerObservable:v6 observer:*(void *)(a1 + 48) context:*(void *)(a1 + 32)];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v9 = [v7 token];
    [WeakRetained addCancelable:v9];
  }
  _Block_object_dispose(&v16, 8);
}

uint64_t __34___CNFlatMapObservable_subscribe___block_invoke_8(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isOperatorReceiving];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __34___CNFlatMapObservable_subscribe___block_invoke_9(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) resourceLock];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34___CNFlatMapObservable_subscribe___block_invoke_10;
  v3[3] = &unk_1E569F310;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 performBlock:v3];
}

void __34___CNFlatMapObservable_subscribe___block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) setOperatorReceiving:0];
  id v2 = [*(id *)(a1 + 32) decorators];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) downstream];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34___CNFlatMapObservable_subscribe___block_invoke_11;
    v5[3] = &unk_1E569F310;
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v4 performBlock:v5];
  }
}

uint64_t __34___CNFlatMapObservable_subscribe___block_invoke_11(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isObserverReceiving];
  if (result)
  {
    [*(id *)(a1 + 32) setObserverReceiving:0];
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 observerDidComplete];
  }
  return result;
}

void __34___CNFlatMapObservable_subscribe___block_invoke_12(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tokens];
  [v2 addObject:*(void *)(a1 + 40)];
}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) decorators];
  uint64_t v3 = [v2 count];

  if (!v3) {
    [*(id *)(a1 + 40) resume];
  }
  id v4 = [*(id *)(a1 + 32) decorators];
  [v4 enqueue:*(void *)(a1 + 40)];
}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_3;
  v6[3] = &unk_1E56A0950;
  objc_copyWeak(&v9, a1 + 6);
  id v7 = a1[4];
  id v5 = v3;
  id v8 = v5;
  [WeakRetained performBlock:v6];

  objc_destroyWeak(&v9);
}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_4;
  v3[3] = &unk_1E569F310;
  id v4 = a1[4];
  id v5 = a1[5];
  [WeakRetained performBlock:v3];
}

uint64_t __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:*(void *)(a1 + 40)];
}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_5(id *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_6;
  v3[3] = &unk_1E56A2350;
  id v2 = a1[4];
  id v4 = a1[5];
  objc_copyWeak(&v7, a1 + 7);
  objc_copyWeak(&v8, a1 + 8);
  id v5 = a1[4];
  id v6 = a1[6];
  [v2 performBlock:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_6(id *a1)
{
  id v2 = [a1[4] resourceLock];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_7;
  v3[3] = &unk_1E56A2328;
  objc_copyWeak(&v6, a1 + 7);
  objc_copyWeak(&v7, a1 + 8);
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 performBlock:v3];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained tokens];
  [v4 removeObject:v3];

  id v5 = [WeakRetained decorators];
  [v5 dequeueObject:*(void *)(a1 + 32)];

  id v6 = [WeakRetained decorators];
  if ([v6 count])
  {
  }
  else
  {
    char v7 = [WeakRetained isOperatorReceiving];

    if ((v7 & 1) == 0)
    {
      id v12 = [WeakRetained downstream];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_8;
      v13[3] = &unk_1E569F310;
      id v14 = WeakRetained;
      id v15 = *(id *)(a1 + 40);
      [v12 performBlock:v13];

      goto LABEL_7;
    }
  }
  id v8 = [WeakRetained decorators];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [WeakRetained decorators];
    uint64_t v11 = [v10 peek];
    [v11 resume];
  }
LABEL_7:
}

uint64_t __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_8(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isObserverReceiving];
  if (result)
  {
    [*(id *)(a1 + 32) setObserverReceiving:0];
    id v3 = *(void **)(a1 + 40);
    return [v3 observerDidComplete];
  }
  return result;
}

void __66___CNFlatMapObservable_subscribeInnerObservable_observer_context___block_invoke_9(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tokens];
  [v2 addObject:*(void *)(a1 + 40)];
}

@end