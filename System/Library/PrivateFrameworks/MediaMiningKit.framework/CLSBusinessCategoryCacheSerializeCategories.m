@interface CLSBusinessCategoryCacheSerializeCategories
@end

@implementation CLSBusinessCategoryCacheSerializeCategories

uint64_t ___CLSBusinessCategoryCacheSerializeCategories_block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 1 << a3;
  }
  return result;
}

@end