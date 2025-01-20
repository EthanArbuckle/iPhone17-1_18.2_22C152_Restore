@interface CRKProviderBundleManager
@end

@implementation CRKProviderBundleManager

uint64_t __43___CRKProviderBundleManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_sProviderBundleManager;
  sharedInstance_sProviderBundleManager = (uint64_t)v1;

  return MEMORY[0x270F9A758](v1, v2);
}

void __62___CRKProviderBundleManager_getProviderBundlesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, 0, v5);
    }
    else
    {
      v7 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global];
      v8 = [v9 filteredSetUsingPredicate:v7];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

uint64_t __62___CRKProviderBundleManager_getProviderBundlesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end