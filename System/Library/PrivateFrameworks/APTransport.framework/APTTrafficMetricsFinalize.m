@interface APTTrafficMetricsFinalize
@end

@implementation APTTrafficMetricsFinalize

uint64_t ___APTTrafficMetricsFinalize_block_invoke(uint64_t a1)
{
  return aptTrafficMetrics_handleQueuedEvents(*(void *)(a1 + 32));
}

@end