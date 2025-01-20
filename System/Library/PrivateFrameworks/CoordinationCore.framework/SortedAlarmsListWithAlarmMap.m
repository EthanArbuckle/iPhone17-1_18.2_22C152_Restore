@interface SortedAlarmsListWithAlarmMap
@end

@implementation SortedAlarmsListWithAlarmMap

uint64_t ___SortedAlarmsListWithAlarmMap_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end