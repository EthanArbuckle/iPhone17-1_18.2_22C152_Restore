@interface NSDictionary
@end

@implementation NSDictionary

uint64_t __57__NSDictionary_CRKGenericAdditions__crk_mapToDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

uint64_t __57__NSDictionary_CRKGenericAdditions__crk_mapToDictionary___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, a3, *(void *)(a1 + 40));
}

void __55__NSDictionary_CRKGenericAdditions__crk_mapUsingBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

@end