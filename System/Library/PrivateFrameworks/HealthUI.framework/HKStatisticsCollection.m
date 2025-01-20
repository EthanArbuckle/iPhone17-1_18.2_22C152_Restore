@interface HKStatisticsCollection
@end

@implementation HKStatisticsCollection

uint64_t __85__HKStatisticsCollection_HKCodingSupport__statisticsCollectionWithCodableCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F2B5B0] statisticsWithCodableStatistics:a2];
}

uint64_t __60__HKStatisticsCollection_HKCodingSupport__codableCollection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 codableStatistics];
}

@end