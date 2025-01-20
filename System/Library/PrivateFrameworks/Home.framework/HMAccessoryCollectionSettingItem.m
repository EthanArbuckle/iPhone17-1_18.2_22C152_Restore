@interface HMAccessoryCollectionSettingItem
@end

@implementation HMAccessoryCollectionSettingItem

uint64_t __99__HMAccessoryCollectionSettingItem_HFAlarmUtilities__hf_alarmItemsMatchingAlarmId_withinItemArray___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = objc_msgSend(MEMORY[0x263F55D40], "hf_buildAlarmFromCollectionSettingItem:", a2);
  v4 = [v3 alarmID];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

@end