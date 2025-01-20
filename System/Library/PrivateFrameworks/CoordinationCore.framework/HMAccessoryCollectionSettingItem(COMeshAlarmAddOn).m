@interface HMAccessoryCollectionSettingItem(COMeshAlarmAddOn)
+ (id)co_accessoryCollectionSettingItemWithAlarm:()COMeshAlarmAddOn;
@end

@implementation HMAccessoryCollectionSettingItem(COMeshAlarmAddOn)

+ (id)co_accessoryCollectionSettingItemWithAlarm:()COMeshAlarmAddOn
{
  v10[1] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(a3, "co_sanitizedHomeKitAlarm");
  id v5 = objc_alloc_init(MEMORY[0x263F55D88]);
  v10[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v5 encodeObject:v6 forKey:@"MTAlarms"];

  v7 = [v5 encodedDictionary];
  v8 = (void *)[[a1 alloc] initWithValue:v7];

  return v8;
}

@end