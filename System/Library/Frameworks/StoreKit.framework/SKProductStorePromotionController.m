@interface SKProductStorePromotionController
+ (SKProductStorePromotionController)defaultController;
- (void)_clearPromotionInfo;
- (void)_fetchProductsForPromotionOrder:(id)a3 completionHandler:(id)a4;
- (void)fetchStorePromotionOrderWithCompletionHandler:(void *)completionHandler;
- (void)fetchStorePromotionVisibilityForProduct:(SKProduct *)product completionHandler:(void *)completionHandler;
- (void)updateStorePromotionOrder:(NSArray *)promotionOrder completionHandler:(void *)completionHandler;
- (void)updateStorePromotionVisibility:(SKProductStorePromotionVisibility)promotionVisibility forProduct:(SKProduct *)product completionHandler:(void *)completionHandler;
@end

@implementation SKProductStorePromotionController

+ (SKProductStorePromotionController)defaultController
{
  v3 = (void *)defaultController_defaultController;
  if (!defaultController_defaultController)
  {
    id v4 = objc_alloc_init((Class)a1);
    v5 = (void *)defaultController_defaultController;
    defaultController_defaultController = (uint64_t)v4;

    v3 = (void *)defaultController_defaultController;
  }

  return (SKProductStorePromotionController *)v3;
}

- (void)fetchStorePromotionVisibilityForProduct:(SKProduct *)product completionHandler:(void *)completionHandler
{
  v5 = product;
  v6 = completionHandler;
  if (v6)
  {
    v7 = [(SKProduct *)v5 productIdentifier];

    if (v7)
    {
      v8 = +[SKServiceBroker defaultBroker];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __95__SKProductStorePromotionController_fetchStorePromotionVisibilityForProduct_completionHandler___block_invoke;
      v16[3] = &unk_1E5FA9E30;
      id v9 = v6;
      id v17 = v9;
      v10 = [v8 storeKitServiceWithErrorHandler:v16];

      v11 = (void *)MEMORY[0x1E4F1CAD0];
      v12 = [(SKProduct *)v5 productIdentifier];
      v13 = [v11 setWithObject:v12];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __95__SKProductStorePromotionController_fetchStorePromotionVisibilityForProduct_completionHandler___block_invoke_2;
      v14[3] = &unk_1E5FA9EA8;
      id v15 = v9;
      [v10 promotionInfoForProductIdentifiers:v13 client:0 reply:v14];
    }
  }
}

void __95__SKProductStorePromotionController_fetchStorePromotionVisibilityForProduct_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  _SKErrorFromNSError(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v3);
}

void __95__SKProductStorePromotionController_fetchStorePromotionVisibilityForProduct_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = _SKErrorFromNSError(v5);
    uint64_t v8 = 0;
  }
  else
  {
    if ([v14 count])
    {
      v6 = [v14 firstObject];
    }
    else
    {
      v6 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v9 = [v6 objectForKeyedSubscript:0x1F08A8D20];
    int v10 = [v9 intValue];

    if (v10 < 0)
    {
      uint64_t v8 = 0;
    }
    else
    {
      v11 = [v6 objectForKeyedSubscript:0x1F08A8D20];
      uint64_t v8 = (int)[v11 intValue];
    }
    v7 = 0;
  }

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = _SKErrorFromNSError(v7);
  (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v8, v13);
}

- (void)updateStorePromotionVisibility:(SKProductStorePromotionVisibility)promotionVisibility forProduct:(SKProduct *)product completionHandler:(void *)completionHandler
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v7 = product;
  uint64_t v8 = completionHandler;
  id v9 = [(SKProduct *)v7 productIdentifier];

  if (v9)
  {
    int v10 = +[SKServiceBroker defaultBroker];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __97__SKProductStorePromotionController_updateStorePromotionVisibility_forProduct_completionHandler___block_invoke;
    v20[3] = &unk_1E5FA9E30;
    id v11 = v8;
    id v21 = v11;
    uint64_t v12 = [v10 storeKitServiceWithErrorHandler:v20];

    uint64_t v24 = 0x1F08A8D20;
    v13 = [(SKProduct *)v7 productIdentifier];
    v22 = v13;
    id v14 = [NSNumber numberWithInteger:promotionVisibility];
    v23 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v25[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__SKProductStorePromotionController_updateStorePromotionVisibility_forProduct_completionHandler___block_invoke_2;
    v18[3] = &unk_1E5FA9E30;
    id v19 = v11;
    [v12 setPromotionInfo:v16 forClient:0 reply:v18];

    id v17 = v21;
LABEL_7:

    goto LABEL_8;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SKProductStorePromotionController updateStorePromotionVisibility:forProduct:completionHandler:]();
    }
    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SKErrorDomain" code:0 userInfo:0];
    (*((void (**)(void *, void *))v8 + 2))(v8, v17);
    goto LABEL_7;
  }
LABEL_8:
}

void __97__SKProductStorePromotionController_updateStorePromotionVisibility_forProduct_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    _SKErrorFromNSError(a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void __97__SKProductStorePromotionController_updateStorePromotionVisibility_forProduct_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    _SKErrorFromNSError(a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)fetchStorePromotionOrderWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  if (v4)
  {
    id v5 = +[SKServiceBroker defaultBroker];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E5FA9E30;
    id v6 = v4;
    id v11 = v6;
    v7 = [v5 storeKitServiceWithErrorHandler:v10];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5FA9ED0;
    v8[4] = self;
    id v9 = v6;
    [v7 promotionInfoForProductIdentifiers:0 client:0 reply:v8];
  }
}

void __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  _SKErrorFromNSError(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, MEMORY[0x1E4F1CBF0], v3);
}

void __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E5FA9BB8;
    id v23 = *(id *)(a1 + 40);
    id v22 = v6;
    dispatch_async(v7, block);

    uint64_t v8 = v23;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v15 = [v14 objectForKeyedSubscript:SKPaymentOptionLegacyOfferName];
          v16 = [v14 objectForKeyedSubscript:0x1F08A8D00];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([v16 integerValue] & 0x8000000000000000) == 0
            && [v15 length])
          {
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v24 count:16];
      }
      while (v11);
    }

    [*(id *)(a1 + 32) _fetchProductsForPromotionOrder:v8 completionHandler:*(void *)(a1 + 40)];
    id v6 = 0;
  }
}

void __83__SKProductStorePromotionController_fetchStorePromotionOrderWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  _SKErrorFromNSError(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, MEMORY[0x1E4F1CBF0], v2);
}

- (void)updateStorePromotionOrder:(NSArray *)promotionOrder completionHandler:(void *)completionHandler
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = promotionOrder;
  id v6 = completionHandler;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v5, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = v5;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v14 = [v13 productIdentifier];

        if (v14)
        {
          id v15 = [v13 productIdentifier];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v10);
  }

  uint64_t v29 = 0x1F08A8D00;
  v30 = v7;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  long long v17 = +[SKServiceBroker defaultBroker];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__SKProductStorePromotionController_updateStorePromotionOrder_completionHandler___block_invoke;
  v23[3] = &unk_1E5FA9E30;
  id v18 = v6;
  id v24 = v18;
  long long v19 = [v17 storeKitServiceWithErrorHandler:v23];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__SKProductStorePromotionController_updateStorePromotionOrder_completionHandler___block_invoke_2;
  v21[3] = &unk_1E5FA9E30;
  id v22 = v18;
  id v20 = v18;
  [v19 setPromotionInfo:v16 forClient:0 reply:v21];
}

void __81__SKProductStorePromotionController_updateStorePromotionOrder_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    _SKErrorFromNSError(a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void __81__SKProductStorePromotionController_updateStorePromotionOrder_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    _SKErrorFromNSError(a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)_fetchProductsForPromotionOrder:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v7 = [SKProductsRequest alloc];
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    uint64_t v9 = [(SKProductsRequest *)v7 initWithProductIdentifiers:v8];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v5 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138543618;
      id v21 = v9;
      __int16 v22 = 2114;
      id v23 = v10;
      _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Starting products request %{public}@ for promotion order %{public}@", buf, 0x16u);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_10;
    v14[3] = &unk_1E5FA9F20;
    id v15 = v9;
    id v17 = v6;
    id v16 = v5;
    id v11 = v6;
    uint64_t v12 = v9;
    [(SKProductsRequest *)v12 _startWithCompletionHandler:v14];
  }
  else
  {
    v13 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke;
    block[3] = &unk_1E5FA9988;
    id v19 = v6;
    uint64_t v12 = (SKProductsRequest *)v6;
    dispatch_async(v13, block);

    id v11 = v19;
  }
}

uint64_t __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v39 = v7;
    __int16 v40 = 2114;
    id v41 = v5;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Finished products request %{public}@ with response %{public}@", buf, 0x16u);
  }
  if (v6
    || ([v5 products],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        !v11))
  {
    uint64_t v8 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_11;
    block[3] = &unk_1E5FA9BB8;
    id v36 = *(id *)(a1 + 48);
    id v35 = v6;
    dispatch_async(v8, block);

    id v9 = v36;
  }
  else
  {
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v23 = a1;
    id obj = *(id *)(a1 + 40);
    uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v17 = [v5 products];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_2;
          v29[3] = &unk_1E5FA9EF8;
          v29[4] = v16;
          uint64_t v18 = [v17 indexOfObjectPassingTest:v29];

          if (v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v19 = [v5 products];
            id v20 = [v19 objectAtIndexedSubscript:v18];
            [v24 addObject:v20];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
      }
      while (v13);
    }

    id v21 = dispatch_get_global_queue(21, 0);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_3;
    v26[3] = &unk_1E5FA9BB8;
    id v22 = *(id *)(v23 + 48);
    id v27 = v24;
    id v28 = v22;
    id v9 = v24;
    dispatch_async(v21, v26);
  }
}

void __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  _SKErrorFromNSError(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, MEMORY[0x1E4F1CBF0], v2);
}

uint64_t __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 productIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __87__SKProductStorePromotionController__fetchProductsForPromotionOrder_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_clearPromotionInfo
{
  id v2 = +[SKServiceBroker defaultBroker];
  id v3 = [v2 storeKitSynchronousServiceWithErrorHandler:&__block_literal_global_4];

  [v3 setPromotionInfo:0 forClient:0 reply:&__block_literal_global_25];
}

void __65__SKProductStorePromotionController_Private___clearPromotionInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __65__SKProductStorePromotionController_Private___clearPromotionInfo__block_invoke_cold_1(a2);
  }
}

- (void)updateStorePromotionVisibility:forProduct:completionHandler:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Product ID not provided.", v0, 2u);
}

void __65__SKProductStorePromotionController_Private___clearPromotionInfo__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Finished with error %{public}@", (uint8_t *)&v1, 0xCu);
}

@end