@interface CNCombineLatestObservable
@end

@implementation CNCombineLatestObservable

uint64_t __77___CNCombineLatestObservable_observableAtIndex_didReceiveResult_forObserver___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:*(void *)(a1 + 40)];
}

uint64_t __84___CNCombineLatestObservable_initWithObservables_resultScheduler_schedulerProvider___block_invoke_3()
{
  return [MEMORY[0x1E4F1CA98] null];
}

uint64_t __84___CNCombineLatestObservable_initWithObservables_resultScheduler_schedulerProvider___block_invoke_2()
{
  return [MEMORY[0x1E4F1CA98] null];
}

uint64_t __84___CNCombineLatestObservable_initWithObservables_resultScheduler_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 distinctUntilChanged];
}

void __40___CNCombineLatestObservable_subscribe___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_class();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __40___CNCombineLatestObservable_subscribe___block_invoke_2;
  v24[3] = &unk_1E56A12D0;
  objc_copyWeak(v26, (id *)(a1 + 56));
  v26[1] = a3;
  id v25 = *(id *)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __40___CNCombineLatestObservable_subscribe___block_invoke_3;
  v21[3] = &unk_1E56A12F8;
  objc_copyWeak(v23, (id *)(a1 + 56));
  v23[1] = a3;
  id v22 = *(id *)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40___CNCombineLatestObservable_subscribe___block_invoke_4;
  v18[3] = &unk_1E56A1320;
  objc_copyWeak(v20, (id *)(a1 + 56));
  v20[1] = a3;
  id v19 = *(id *)(a1 + 32);
  v7 = +[CNObserver blockObserverOfClass:v6 withResultBlock:v24 completionBlock:v21 failureBlock:v18];
  v8 = [v5 subscribe:v7];

  v9 = *(void **)(a1 + 40);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __40___CNCombineLatestObservable_subscribe___block_invoke_5;
  v14 = &unk_1E56A1348;
  v15 = v9;
  v17 = a3;
  id v10 = v8;
  id v16 = v10;
  [v9 performWithResourceLock:&v11];
  objc_msgSend(*(id *)(a1 + 48), "addCancelable:", v10, v11, v12, v13, v14, v15);

  objc_destroyWeak(v20);
  objc_destroyWeak(v23);

  objc_destroyWeak(v26);
}

void __40___CNCombineLatestObservable_subscribe___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained observableAtIndex:*(void *)(a1 + 48) didReceiveResult:v4 forObserver:*(void *)(a1 + 32)];
}

void __77___CNCombineLatestObservable_observableAtIndex_didReceiveResult_forObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) results];
  [v2 replaceObjectAtIndex:*(void *)(a1 + 56) withObject:*(void *)(a1 + 40)];

  v3 = [*(id *)(a1 + 32) silentObservableIndexes];
  [v3 removeIndex:*(void *)(a1 + 56)];

  id v4 = [*(id *)(a1 + 32) silentObservableIndexes];
  LODWORD(v3) = ((BOOL (*)(uint64_t, void *))off_1EE025080)((uint64_t)&__block_literal_global_68, v4);

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) results];
    uint64_t v6 = (void *)[v5 copy];

    v7 = [*(id *)(a1 + 32) resultScheduler];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77___CNCombineLatestObservable_observableAtIndex_didReceiveResult_forObserver___block_invoke_2;
    v9[3] = &unk_1E569F310;
    id v10 = *(id *)(a1 + 48);
    id v11 = v6;
    id v8 = v6;
    [v7 performBlock:v9];
  }
}

void __40___CNCombineLatestObservable_subscribe___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activeObservableIndexes];
  int v3 = [v2 containsIndex:*(void *)(a1 + 48)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) tokens];
    [v4 replaceObjectAtIndex:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
  }
}

void __40___CNCombineLatestObservable_subscribe___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained observableAtIndexDidComplete:*(void *)(a1 + 48) forObserver:*(void *)(a1 + 32)];
}

void __40___CNCombineLatestObservable_subscribe___block_invoke_4(uint64_t a1, void *a2)
{
  int v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained observableAtIndex:*(void *)(a1 + 48) didFailWithError:v4 forObserver:*(void *)(a1 + 32)];
}

void __71___CNCombineLatestObservable_observableAtIndexDidComplete_forObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tokens];
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [MEMORY[0x1E4F1CA98] null];
  [v2 replaceObjectAtIndex:v3 withObject:v4];

  id v5 = [*(id *)(a1 + 32) activeObservableIndexes];
  [v5 removeIndex:*(void *)(a1 + 48)];

  uint64_t v6 = [*(id *)(a1 + 32) activeObservableIndexes];
  LODWORD(v5) = ((BOOL (*)(uint64_t, void *))off_1EE025080)((uint64_t)&__block_literal_global_68, v6);

  if (v5)
  {
    v7 = [*(id *)(a1 + 32) resultScheduler];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71___CNCombineLatestObservable_observableAtIndexDidComplete_forObserver___block_invoke_2;
    v8[3] = &unk_1E569F9D8;
    id v9 = *(id *)(a1 + 40);
    [v7 performBlock:v8];
  }
}

uint64_t __71___CNCombineLatestObservable_observableAtIndexDidComplete_forObserver___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidComplete];
}

void __77___CNCombineLatestObservable_observableAtIndex_didFailWithError_forObserver___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activeObservableIndexes];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 removeIndex:*(void *)(a1 + 56)];
  id v4 = [*(id *)(a1 + 32) tokens];
  id v5 = [v4 objectsAtIndexes:v3];

  uint64_t v6 = objc_msgSend(v5, "_cn_filter:", &__block_literal_global_7_2);
  objc_msgSend(v6, "_cn_each:", &__block_literal_global_42);

  v7 = [*(id *)(a1 + 32) resultScheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77___CNCombineLatestObservable_observableAtIndex_didFailWithError_forObserver___block_invoke_2;
  v8[3] = &unk_1E569F310;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  [v7 performBlock:v8];
}

uint64_t __77___CNCombineLatestObservable_observableAtIndex_didFailWithError_forObserver___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidFailWithError:*(void *)(a1 + 40)];
}

@end