@interface HMFSelectorMessageHandler
@end

@implementation HMFSelectorMessageHandler

uint64_t __49____HMFSelectorMessageHandler_invokeWithMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 56) withObject:*(void *)(a1 + 40)];
}

@end