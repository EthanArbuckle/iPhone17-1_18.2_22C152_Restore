@interface EFCombineLatestObservableSubscription
@end

@implementation EFCombineLatestObservableSubscription

uint64_t __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _observableAtIndex:*(void *)(a1 + 48) receivedResult:a2 observer:*(void *)(a1 + 40)];
}

id __62___EFCombineLatestObservableSubscription_initWithObservables___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v2 distinctUntilChanged];

    id v2 = (id)v3;
  }
  return v2;
}

id __62___EFCombineLatestObservableSubscription_initWithObservables___block_invoke_2()
{
  v0 = [MEMORY[0x1E4F1CA98] null];
  return v0;
}

id __62___EFCombineLatestObservableSubscription_initWithObservables___block_invoke_3()
{
  v0 = [MEMORY[0x1E4F1CA98] null];
  return v0;
}

void __52___EFCombineLatestObservableSubscription_subscribe___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = objc_alloc_init(EFCancelationToken);
  [*(id *)(a1 + 32) addCancelable:v6];
  [*(id *)(*(void *)(a1 + 40) + 8) lock];
  [*(id *)(*(void *)(a1 + 40) + 32) replaceObjectAtIndex:a3 withObject:v6];
  [*(id *)(*(void *)(a1 + 40) + 8) unlock];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_2;
  v18[3] = &unk_1E6121A00;
  v7 = *(void **)(a1 + 48);
  v18[4] = *(void *)(a1 + 40);
  uint64_t v20 = a3;
  id v19 = v7;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_3;
  v15[3] = &unk_1E6121A28;
  v8 = *(void **)(a1 + 48);
  v15[4] = *(void *)(a1 + 40);
  uint64_t v17 = a3;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_4;
  v12[3] = &unk_1E6121A50;
  v9 = *(void **)(a1 + 48);
  v12[4] = *(void *)(a1 + 40);
  uint64_t v14 = a3;
  id v13 = v9;
  v10 = +[EFObserver observerWithResultBlock:v18 completionBlock:v15 failureBlock:v12];
  v11 = [v5 subscribe:v10];
  [(EFCancelationToken *)v6 addCancelable:v11];
}

uint64_t __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _observableAtIndex:*(void *)(a1 + 48) didCompleteForObserver:*(void *)(a1 + 40)];
}

uint64_t __52___EFCombineLatestObservableSubscription_subscribe___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _observableAtIndex:*(void *)(a1 + 48) didFailWithError:a2 observer:*(void *)(a1 + 40)];
}

@end