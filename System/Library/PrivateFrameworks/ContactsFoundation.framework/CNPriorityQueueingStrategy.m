@interface CNPriorityQueueingStrategy
@end

@implementation CNPriorityQueueingStrategy

BOOL __63___CNPriorityQueueingStrategy__insertionIndexForObject_buffer___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 priorityComparator];
  uint64_t v6 = ((uint64_t (**)(void, id, void))v5)[2](v5, v4, *(void *)(a1 + 40));

  return v6 == 1;
}

@end