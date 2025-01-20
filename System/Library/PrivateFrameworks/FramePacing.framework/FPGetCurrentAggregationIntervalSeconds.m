@interface FPGetCurrentAggregationIntervalSeconds
@end

@implementation FPGetCurrentAggregationIntervalSeconds

uint64_t ___FPGetCurrentAggregationIntervalSeconds_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = gFPAggregationIntervalNs;
  return result;
}

@end