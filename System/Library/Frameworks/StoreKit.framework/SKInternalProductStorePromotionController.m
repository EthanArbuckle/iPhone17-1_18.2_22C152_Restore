@interface SKInternalProductStorePromotionController
+ (id)defaultController;
- (void)_handleReply:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation SKInternalProductStorePromotionController

+ (id)defaultController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SKInternalProductStorePromotionController_defaultController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultController_onceToken[0] != -1) {
    dispatch_once(defaultController_onceToken, block);
  }
  v2 = (void *)defaultController_defaultController_0;

  return v2;
}

uint64_t __62__SKInternalProductStorePromotionController_defaultController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = defaultController_defaultController_0;
  defaultController_defaultController_0 = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (void)_handleReply:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v8 || v9)
  {
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SKInternalProductStorePromotionController _handleReply:error:completionHandler:]((uint64_t)self, (uint64_t)v9);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v48 = self;
      _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[%{public}@]: No promotion info found", buf, 0xCu);
    }
    v29 = dispatch_get_global_queue(21, 0);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __82__SKInternalProductStorePromotionController__handleReply_error_completionHandler___block_invoke;
    v43[3] = &unk_1E5FA9BB8;
    v45 = v11;
    id v44 = v9;
    id v28 = v11;
    dispatch_async(v29, v43);

    id v27 = v45;
  }
  else
  {
    v30 = v10;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[SKInternalProductStorePromotionController _handleReply:error:completionHandler:]((uint64_t)self, v8);
    }
    v33 = [MEMORY[0x1E4F1CA48] array];
    v31 = [MEMORY[0x1E4F1CA80] set];
    v32 = [MEMORY[0x1E4F1CA80] set];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v18 = [v17 valueForKey:SKPaymentOptionLegacyOfferName];
          v19 = [v17 valueForKey:0x1F08A8D00];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([v19 integerValue] & 0x8000000000000000) == 0)
          {
            [v33 addObject:v18];
            v20 = [v17 valueForKey:0x1F08A8D20];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([v20 integerValue])
              {
                uint64_t v21 = [v20 integerValue];
                v22 = v32;
                if (v21 == 1 || (uint64_t v23 = [v20 integerValue], v22 = v31, v23 == 2)) {
                  [v22 addObject:v18];
                }
              }
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v14);
    }

    v24 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__SKInternalProductStorePromotionController__handleReply_error_completionHandler___block_invoke_4;
    block[3] = &unk_1E5FAA728;
    id v35 = v33;
    id v36 = v31;
    id v37 = v32;
    id v38 = v30;
    id v25 = v30;
    id v26 = v32;
    id v27 = v31;
    id v28 = v33;
    dispatch_async(v24, block);

    id v9 = 0;
  }
}

void __82__SKInternalProductStorePromotionController__handleReply_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = (id)objc_opt_new();
  v3 = objc_opt_new();
  (*(void (**)(uint64_t, void, id, void *, void))(v2 + 16))(v2, MEMORY[0x1E4F1CBF0], v4, v3, *(void *)(a1 + 32));
}

uint64_t __82__SKInternalProductStorePromotionController__handleReply_error_completionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

- (void)fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    v6 = +[SKServiceBroker defaultBroker];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke;
    v11[3] = &unk_1E5FAA750;
    v11[4] = self;
    id v7 = v5;
    id v12 = v7;
    id v8 = [v6 storeKitServiceWithErrorHandler:v11];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke_7;
    v9[3] = &unk_1E5FAA778;
    v9[4] = self;
    id v10 = v7;
    [v8 promotionInfoForProductIdentifiers:0 client:0 reply:v9];
  }
}

void __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke_cold_1(a1, (uint64_t)v3);
  }
  [*(id *)(a1 + 32) _handleReply:MEMORY[0x1E4F1CBF0] error:v3 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleReply:a2 error:a3 completionHandler:*(void *)(a1 + 40)];
}

- (void)_handleReply:(uint64_t)a1 error:(void *)a2 completionHandler:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2050;
  uint64_t v5 = [a2 count];
  _os_log_debug_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[%{public}@]: Successfully retrieved promotion info, found %{public}lu entries", (uint8_t *)&v2, 0x16u);
}

- (void)_handleReply:(uint64_t)a1 error:(uint64_t)a2 completionHandler:.cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to retrieve promotion info: %{public}@", (uint8_t *)&v2, 0x16u);
}

void __129__SKInternalProductStorePromotionController_fetchOverridesForVisibilityAndOrderForApplicationBundleIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543618;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%{public}@]: Failed in XPC to retrieve promotion info: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end