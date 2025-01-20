@interface SCNStartCollectingPerformanceStatisticsForPid
@end

@implementation SCNStartCollectingPerformanceStatisticsForPid

uint64_t ___SCNStartCollectingPerformanceStatisticsForPid_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = CSIsNull();
  if ((result & 1) == 0)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v7 + 48) = a2;
    *(void *)(v7 + 56) = a3;
  }
  return result;
}

@end