@interface CDMultiLevelRateLimiter
@end

@implementation CDMultiLevelRateLimiter

uint64_t __53___CDMultiLevelRateLimiter_initWithPeriodToCountMap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __34___CDMultiLevelRateLimiter_credit__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) recordTimeAndRefillIfNeededRaw];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(uint64_t *)(v2 + 24) >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      v4 = [*(id *)(v2 + 56) objectAtIndexedSubscript:v3];
      uint64_t v5 = [v4 integerValue];

      if (v5)
      {
        v6 = [NSNumber numberWithInteger:v5 - 1];
        [*(id *)(*(void *)(a1 + 32) + 56) setObject:v6 atIndexedSubscript:v3];
      }
      ++v3;
      uint64_t v2 = *(void *)(a1 + 32);
    }
    while (v3 < *(void *)(v2 + 24));
  }
}

void __35___CDMultiLevelRateLimiter_debited__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) recordTimeAndRefillIfNeededRaw];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 24);
  while (v2 > 0)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 56) objectAtIndexedSubscript:--v2];
    uint64_t v4 = [v3 integerValue];
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 48) objectAtIndexedSubscript:v2];
    uint64_t v6 = [v5 integerValue];

    if (v4 == v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      return;
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(uint64_t *)(v7 + 24) >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      v9 = NSNumber;
      v10 = [*(id *)(v7 + 56) objectAtIndexedSubscript:v8];
      v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "integerValue") + 1);
      [*(id *)(*(void *)(a1 + 32) + 56) setObject:v11 atIndexedSubscript:v8];

      ++v8;
      uint64_t v7 = *(void *)(a1 + 32);
    }
    while (v8 < *(void *)(v7 + 24));
  }
}

@end