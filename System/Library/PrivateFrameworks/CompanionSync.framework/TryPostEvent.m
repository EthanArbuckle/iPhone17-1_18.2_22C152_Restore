@interface TryPostEvent
@end

@implementation TryPostEvent

uint64_t ___TryPostEvent_block_invoke(uint64_t a1)
{
  return _TryPostEvent(*(void *)(a1 + 40), *(void *)(a1 + 32), (*(_DWORD *)(a1 + 48) + 1));
}

@end