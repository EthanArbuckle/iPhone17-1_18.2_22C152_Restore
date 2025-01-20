@interface AFAnalyticsContextCreateWithErrorRecursively
@end

@implementation AFAnalyticsContextCreateWithErrorRecursively

void ___AFAnalyticsContextCreateWithErrorRecursively_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v6 isEqualToString:*MEMORY[0x1E4F28A50]] & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

@end