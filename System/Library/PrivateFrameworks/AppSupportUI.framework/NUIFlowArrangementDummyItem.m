@interface NUIFlowArrangementDummyItem
@end

@implementation NUIFlowArrangementDummyItem

uint64_t __47___NUIFlowArrangementDummyItem_sharedDummyItem__block_invoke()
{
  uint64_t result = objc_opt_new();
  +[_NUIFlowArrangementDummyItem sharedDummyItem]::sharedDummyItem = result;
  return result;
}

@end