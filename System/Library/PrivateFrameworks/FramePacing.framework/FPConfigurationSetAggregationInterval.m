@interface FPConfigurationSetAggregationInterval
@end

@implementation FPConfigurationSetAggregationInterval

void ___FPConfigurationSetAggregationInterval_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (unint64_t)(*(double *)(a1 + 40) * 1000000000.0);
  gFPAggregationIntervalNs = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v3 = _aggregationTimerSource();
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  dispatch_source_set_timer(v3, 0, v2, v2);
}

@end