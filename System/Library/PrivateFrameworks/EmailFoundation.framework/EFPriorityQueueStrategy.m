@interface EFPriorityQueueStrategy
@end

@implementation EFPriorityQueueStrategy

uint64_t __65___EFPriorityQueueStrategy_enqueueObject_replaceIfExists_buffer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

@end