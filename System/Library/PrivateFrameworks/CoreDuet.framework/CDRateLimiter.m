@interface CDRateLimiter
@end

@implementation CDRateLimiter

uint64_t __25___CDRateLimiter_debited__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) recordTimeAndRefillIfNeeded];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 16);
  *(void *)(v3 + 16) = v4 + 1;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4 >= *(void *)(v5 + 40))
  {
    char v6 = 0;
    --*(void *)(v5 + 16);
  }
  else
  {
    char v6 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  return result;
}

uint64_t __35___CDRateLimiter_sharedRateLimiter__block_invoke()
{
  v0 = [[_CDRateLimiter alloc] initWithCount:300 perPeriod:60.0];
  uint64_t v1 = sharedRateLimiter__sharedRateLimiter;
  sharedRateLimiter__sharedRateLimiter = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __24___CDRateLimiter_credit__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) recordTimeAndRefillIfNeeded];
  --*(void *)(*(void *)(a1 + 32) + 16);
  return result;
}

@end