@interface ReachabilityRequest
@end

@implementation ReachabilityRequest

uint64_t __45___ReachabilityRequest_addObserver_selector___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reachabilityChangedWithFlags:*(unsigned int *)(a1 + 40)];
}

@end