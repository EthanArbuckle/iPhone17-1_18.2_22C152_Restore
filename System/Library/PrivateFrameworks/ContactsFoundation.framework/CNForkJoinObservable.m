@interface CNForkJoinObservable
@end

@implementation CNForkJoinObservable

void __35___CNForkJoinObservable_subscribe___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_class();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __35___CNForkJoinObservable_subscribe___block_invoke_2;
  v19[3] = &unk_1E56A2730;
  id v20 = a1[4];
  uint64_t v22 = a3;
  id v21 = a1[5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35___CNForkJoinObservable_subscribe___block_invoke_3;
  v15[3] = &unk_1E56A1348;
  id v16 = a1[4];
  uint64_t v18 = a3;
  id v17 = a1[5];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __35___CNForkJoinObservable_subscribe___block_invoke_4;
  v12 = &unk_1E569FB88;
  id v13 = a1[6];
  id v14 = a1[5];
  v7 = +[CNObserver blockObserverOfClass:v6 withResultBlock:v19 completionBlock:v15 failureBlock:&v9];
  v8 = objc_msgSend(v5, "subscribe:", v7, v9, v10, v11, v12);

  [a1[6] addCancelable:v8];
}

uint64_t __35___CNForkJoinObservable_subscribe___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) receiveResult:a2 fromObservableAtIndex:*(void *)(a1 + 48) observer:*(void *)(a1 + 40)];
}

uint64_t __35___CNForkJoinObservable_subscribe___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observableAtIndex:*(void *)(a1 + 48) didCompleteForObserver:*(void *)(a1 + 40)];
}

void __35___CNForkJoinObservable_subscribe___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 cancel];
  [*(id *)(a1 + 40) observerDidFailWithError:v4];
}

@end