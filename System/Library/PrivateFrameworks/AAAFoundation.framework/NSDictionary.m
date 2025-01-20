@interface NSDictionary
@end

@implementation NSDictionary

void __48__NSDictionary_AAAFoundation__aaf_mapStoppable___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
}

uint64_t __39__NSDictionary_AAAFoundation__aaf_map___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__NSDictionary_AAAFoundation__aaf_filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

void __50__NSDictionary_AAAFoundation__aaf_toUrlQueryItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F290C8];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithName:v7 value:v6];

  [*(id *)(a1 + 32) addObject:v8];
}

@end