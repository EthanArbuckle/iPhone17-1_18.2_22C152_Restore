@interface NSSet
@end

@implementation NSSet

uint64_t __35__NSSet_HKUUID__hk_dataForAllUUIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __30__NSSet_HealthKit__hk_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43__NSSet_HealthKit__hk_symmetricDifference___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  LODWORD(v3) = [v3 containsObject:v4];
  LODWORD(v2) = [*(id *)(v2 + 40) containsObject:v4];

  return v3 ^ v2;
}

uint64_t __39__NSSet_HealthKit__hk_mapToDictionary___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (a3) {
      return [*(id *)(result + 32) setObject:a3 forKeyedSubscript:a2];
    }
  }
  return result;
}

@end