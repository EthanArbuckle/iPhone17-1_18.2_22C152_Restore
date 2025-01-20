@interface FKApplePayOrderFetchController
- (void)fetchAllRowViewModelsForTransactionWithIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation FKApplePayOrderFetchController

- (void)fetchAllRowViewModelsForTransactionWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = dispatch_get_global_queue(2, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __102__FKApplePayOrderFetchController_fetchAllRowViewModelsForTransactionWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_265188DB0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __102__FKApplePayOrderFetchController_fetchAllRowViewModelsForTransactionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = +[ApplePayOrderFetchController makeFetchController];
  [v2 fetchAllRowViewModelsForTransactionWithIdentifier:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

@end