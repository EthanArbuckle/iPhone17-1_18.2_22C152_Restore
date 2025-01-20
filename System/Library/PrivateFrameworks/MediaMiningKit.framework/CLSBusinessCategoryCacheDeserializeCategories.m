@interface CLSBusinessCategoryCacheDeserializeCategories
@end

@implementation CLSBusinessCategoryCacheDeserializeCategories

uint64_t ___CLSBusinessCategoryCacheDeserializeCategories_block_invoke(uint64_t result, uint64_t a2, char a3)
{
  if ((*(_DWORD *)(result + 40) >> a3)) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

@end