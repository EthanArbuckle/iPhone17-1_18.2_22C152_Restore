@interface CNObserver
+ (CNObserver)observerWithCompletionHandler:(id)a3;
+ (CNObserver)observerWithResultBlock:(id)a3;
+ (CNObserver)observerWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5;
+ (CNObserver)observerWithWeakTarget:(id)a3 resultSelector:(SEL)a4;
+ (id)blockObserverOfClass:(Class)a3 withResultBlock:(id)a4 completionBlock:(id)a5 failureBlock:(id)a6;
+ (void)sendArray:(id)a3 error:(id)a4 toObserver:(id)a5;
+ (void)sendArray:(id)a3 error:(id)a4 toObserver:(id)a5 untilCanceled:(id)a6;
+ (void)sendObserver:(id)a3 resultsOfBlock:(id)a4;
+ (void)sendResult:(id)a3 error:(id)a4 toObserver:(id)a5;
@end

@implementation CNObserver

+ (id)blockObserverOfClass:(Class)a3 withResultBlock:(id)a4 completionBlock:(id)a5 failureBlock:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = (void *)[[a3 alloc] initWithResultBlock:v11 completionBlock:v10 failureBlock:v9];

  return v12;
}

uint64_t __44__CNObserver_observerWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (CNObserver)observerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__CNObserver_observerWithCompletionHandler___block_invoke;
  v15[3] = &unk_1E56A0AD8;
  id v16 = v5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__CNObserver_observerWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E569F468;
  id v13 = v16;
  id v14 = v4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__CNObserver_observerWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E56A0660;
  id v11 = v14;
  id v6 = v14;
  id v7 = v16;
  v8 = [a1 observerWithResultBlock:v15 completionBlock:v12 failureBlock:v10];

  return (CNObserver *)v8;
}

+ (CNObserver)observerWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [a1 blockObserverOfClass:objc_opt_class() withResultBlock:v10 completionBlock:v9 failureBlock:v8];

  return (CNObserver *)v11;
}

uint64_t __44__CNObserver_observerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

+ (CNObserver)observerWithResultBlock:(id)a3
{
  id v3 = a3;
  id v4 = [[_CNBlockObserver alloc] initWithResultBlock:v3 completionBlock:0 failureBlock:0];

  return (CNObserver *)v4;
}

+ (CNObserver)observerWithWeakTarget:(id)a3 resultSelector:(SEL)a4
{
  id v6 = a3;
  objc_initWeak(&location, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__CNObserver_observerWithWeakTarget_resultSelector___block_invoke;
  v9[3] = &unk_1E56A2538;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a4;
  id v7 = [a1 observerWithResultBlock:v9];
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return (CNObserver *)v7;
}

void __52__CNObserver_observerWithWeakTarget_resultSelector___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = (void (*)(id, void, id))[WeakRetained methodForSelector:*(void *)(a1 + 40)];
  if (v4) {
    v4(WeakRetained, *(void *)(a1 + 40), v5);
  }
}

uint64_t __44__CNObserver_observerWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)sendArray:(id)a3 error:(id)a4 toObserver:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(CNCancelationToken);
  [a1 sendArray:v10 error:v9 toObserver:v8 untilCanceled:v11];
}

+ (void)sendArray:(id)a3 error:(id)a4 toObserver:(id)a5 untilCanceled:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (a4)
  {
    [v9 observerDidFailWithError:a4];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__CNObserver_sendArray_error_toObserver_untilCanceled___block_invoke;
    v12[3] = &unk_1E56A0AD8;
    id v11 = v9;
    id v13 = v11;
    objc_msgSend(a3, "_cn_each:untilCancelled:", v12, v10);
    if (([v10 isCanceled] & 1) == 0) {
      [v11 observerDidComplete];
    }
  }
}

uint64_t __55__CNObserver_sendArray_error_toObserver_untilCanceled___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) observerDidReceiveResult:a2];
}

+ (void)sendResult:(id)a3 error:(id)a4 toObserver:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v7)
  {
    [v8 observerDidFailWithError:v7];
  }
  else
  {
    if (v10) {
      [v8 observerDidReceiveResult:v10];
    }
    [v9 observerDidComplete];
  }
}

+ (void)sendObserver:(id)a3 resultsOfBlock:(id)a4
{
  id v10 = 0;
  id v6 = (void (*)(id, id *))*((void *)a4 + 2);
  id v7 = a3;
  id v8 = v6(a4, &v10);
  id v9 = v10;
  [a1 sendArray:v8 error:v9 toObserver:v7];
}

@end