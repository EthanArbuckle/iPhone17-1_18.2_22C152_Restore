@interface EventsPriorToAnchor
@end

@implementation EventsPriorToAnchor

BOOL ___EventsPriorToAnchor_block_invoke(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 32) > (uint64_t)[a2 anchor];
}

@end