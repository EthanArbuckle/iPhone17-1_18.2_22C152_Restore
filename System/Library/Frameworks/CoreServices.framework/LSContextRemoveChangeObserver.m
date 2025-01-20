@interface LSContextRemoveChangeObserver
@end

@implementation LSContextRemoveChangeObserver

uint64_t ___LSContextRemoveChangeObserver_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  LaunchServices::notifyd::NotifyToken::cancel((atomic_uint *)(*(void *)(a1 + 32) + 20));
  v4 = (void *)gChangeObservers;
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 removeObjectIdenticalTo:v5];
}

@end