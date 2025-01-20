@interface HMAccessoryCollectionSettingItem(HFAlarmUtilities)
+ (id)hf_alarmItemsMatchingAlarmId:()HFAlarmUtilities withinItemArray:;
+ (id)hf_collectionSettingItemForAlarm:()HFAlarmUtilities;
@end

@implementation HMAccessoryCollectionSettingItem(HFAlarmUtilities)

+ (id)hf_collectionSettingItemForAlarm:()HFAlarmUtilities
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HFAccessorySettingMobileTimerUtilities.m", 35, @"Invalid parameter not satisfying: %@", @"alarm" object file lineNumber description];
  }
  v6 = (void *)MEMORY[0x21053EE50]();
  v7 = objc_opt_new();
  v14[0] = v5;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [v7 encodeObject:v8 forKey:@"MTAlarms"];

  id v9 = objc_alloc(MEMORY[0x263F0DF50]);
  v10 = [v7 encodedDictionary];
  v11 = (void *)[v9 initWithValue:v10];

  return v11;
}

+ (id)hf_alarmItemsMatchingAlarmId:()HFAlarmUtilities withinItemArray:
{
  id v5 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __99__HMAccessoryCollectionSettingItem_HFAlarmUtilities__hf_alarmItemsMatchingAlarmId_withinItemArray___block_invoke;
  v11[3] = &unk_264095E80;
  id v12 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a4, "na_filter:", v11);
  v8 = v7;
  if (!v7) {
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  id v9 = v7;

  return v9;
}

@end