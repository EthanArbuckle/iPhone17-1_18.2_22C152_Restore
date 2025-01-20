@interface NSIndexSet
@end

@implementation NSIndexSet

uint64_t __42__NSIndexSet_ContactsFoundation___cn_all___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

uint64_t __42__NSIndexSet_ContactsFoundation___cn_any___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __43__NSIndexSet_ContactsFoundation___cn_each___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__NSIndexSet_ContactsFoundation___cn_filter___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    v5 = *(void **)(a1 + 32);
    return [v5 addIndex:a2];
  }
  return result;
}

void __46__NSIndexSet_ContactsFoundation___cn_flatMap___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addIndexes:v2];
}

void __42__NSIndexSet_ContactsFoundation___cn_map___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [NSNumber numberWithUnsignedInteger:a2];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v6 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v7);
  [v5 addObject:v6];
}

void __48__NSIndexSet_ContactsFoundation___cn_mapRanges___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = off_1EE0257E0((uint64_t)&__block_literal_global_2_2, v4);
  [v2 addObject:v3];
}

@end