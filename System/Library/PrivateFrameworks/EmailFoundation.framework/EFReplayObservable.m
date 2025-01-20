@interface EFReplayObservable
@end

@implementation EFReplayObservable

uint64_t __33___EFReplayObservable_subscribe___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unsubscribe:*(void *)(a1 + 40)];
}

@end