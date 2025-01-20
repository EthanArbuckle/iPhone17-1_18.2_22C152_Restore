@interface HKExpiringCompletionTimer
@end

@implementation HKExpiringCompletionTimer

uint64_t __36___HKExpiringCompletionTimer__start__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isExpired] & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"_HKExpiringCompletionTimer.m", 85, @"Invalid parameter not satisfying: %@", @"[self isExpired]" object file lineNumber description];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16);

  return v2();
}

@end