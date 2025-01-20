@interface EFObserver
+ (EFObserver)observerWithCompletionHandler:(id)a3;
+ (EFObserver)observerWithResultBlock:(id)a3;
+ (EFObserver)observerWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5;
@end

@implementation EFObserver

+ (EFObserver)observerWithResultBlock:(id)a3
{
  id v3 = a3;
  v4 = [[_EFBlockObserver alloc] initWithResultBlock:v3 completionBlock:0 failureBlock:0];

  return (EFObserver *)v4;
}

+ (EFObserver)observerWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [[_EFBlockObserver alloc] initWithResultBlock:v7 completionBlock:v8 failureBlock:v9];

  return (EFObserver *)v10;
}

+ (EFObserver)observerWithCompletionHandler:(id)a3
{
  id v3 = a3;
  v4 = +[EFPromise promise];
  v5 = [v4 future];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__EFObserver_observerWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E6121BE0;
  id v6 = v3;
  id v17 = v6;
  [v5 addSuccessBlock:v16];

  id v7 = [v4 future];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __44__EFObserver_observerWithCompletionHandler___block_invoke_2;
  v14 = &unk_1E6121F78;
  id v8 = v6;
  id v15 = v8;
  [v7 addFailureBlock:&v11];

  id v9 = objc_msgSend(v4, "resultsObserverAdapter", v11, v12, v13, v14);

  return (EFObserver *)v9;
}

uint64_t __44__EFObserver_observerWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__EFObserver_observerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end