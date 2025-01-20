@interface HMAccessoryCollectionSetting(COMeshAlarmAddOn)
- (id)co_alarms;
- (id)co_rawAlarms;
- (void)co_addAlarm:()COMeshAlarmAddOn completionHandler:;
- (void)co_removeAlarm:()COMeshAlarmAddOn completionHandler:;
- (void)co_updateAlarm:()COMeshAlarmAddOn completionHandler:;
@end

@implementation HMAccessoryCollectionSetting(COMeshAlarmAddOn)

- (id)co_alarms
{
  v1 = objc_msgSend(a1, "co_mappedAlarms");
  v2 = [v1 allValues];
  v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_0];

  return v3;
}

- (id)co_rawAlarms
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = [a1 value];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "_co_alarm");
        v9 = v8;
        if (v8)
        {
          v10 = [v8 alarmID];
          v11 = [v2 objectForKey:v10];
          v12 = [v9 COPreferredAlarm:v11];
          [v2 setObject:v12 forKey:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  v13 = [v2 allValues];
  v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_0];

  return v14;
}

- (void)co_addAlarm:()COMeshAlarmAddOn completionHandler:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[COAlarmOperation alloc] initForAdding:v7 completion:v6];

  objc_msgSend(a1, "co_enqueueOperation:", v8);
}

- (void)co_updateAlarm:()COMeshAlarmAddOn completionHandler:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[COAlarmOperation alloc] initForUpdating:v7 completion:v6];

  objc_msgSend(a1, "co_enqueueOperation:", v8);
}

- (void)co_removeAlarm:()COMeshAlarmAddOn completionHandler:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[COAlarmOperation alloc] initForRemoving:v7 completion:v6];

  objc_msgSend(a1, "co_enqueueOperation:", v8);
}

@end