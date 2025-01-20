@interface CNSortingResponsePreparer
@end

@implementation CNSortingResponsePreparer

uint64_t __54___CNSortingResponsePreparer_prepareResults_forFetch___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 withPriorityComparator:*(void *)(a1 + 32)];
}

@end