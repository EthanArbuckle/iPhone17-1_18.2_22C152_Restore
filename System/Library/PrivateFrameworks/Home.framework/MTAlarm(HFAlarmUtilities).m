@interface MTAlarm(HFAlarmUtilities)
+ (id)hf_alarmsMatchingAlarmId:()HFAlarmUtilities withinItemArray:;
+ (id)hf_buildAlarmFromCollectionSettingItem:()HFAlarmUtilities;
+ (id)hf_buildAlarmsFromCollectionSettingItems:()HFAlarmUtilities;
+ (uint64_t)hf_areAlarms:()HFAlarmUtilities equalToAlarms:includeModificationDate:;
+ (uint64_t)hf_verifyThatAlarmsAreConsistent:()HFAlarmUtilities;
@end

@implementation MTAlarm(HFAlarmUtilities)

+ (id)hf_buildAlarmFromCollectionSettingItem:()HFAlarmUtilities
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x21053EE50]();
  objc_opt_class();
  v5 = [v3 value];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if ([v7 count])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x263F55D80]) initWithEncodedDictionary:v7];
    v9 = [v8 decodeObjectForKey:@"MTAlarms"];
    v10 = [v9 firstObject];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)hf_buildAlarmsFromCollectionSettingItems:()HFAlarmUtilities
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  v4 = objc_msgSend(a3, "na_map:", &__block_literal_global_112);
  v5 = [v3 setWithArray:v4];

  v6 = [v5 allObjects];
  id v7 = [v6 sortedArrayUsingSelector:sel_compare_];

  return v7;
}

+ (uint64_t)hf_areAlarms:()HFAlarmUtilities equalToAlarms:includeModificationDate:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_msgSend(MEMORY[0x263F55D40], "hf_verifyThatAlarmsAreConsistent:", v7);
  objc_msgSend(MEMORY[0x263F55D40], "hf_verifyThatAlarmsAreConsistent:", v8);
  if (v7 == v8)
  {
    uint64_t v17 = 1;
  }
  else if ((v7 || !v8) && (!v7 || v8) && (uint64_t v9 = [v7 count], v9 == objc_msgSend(v8, "count")))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v7;
    uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __80__MTAlarm_HFAlarmUtilities__hf_areAlarms_equalToAlarms_includeModificationDate___block_invoke;
          v20[3] = &unk_264095EC8;
          v20[4] = v14;
          v15 = objc_msgSend(v8, "na_firstObjectPassingTest:", v20);
          v16 = v15;
          if (a5)
          {
            if (![v15 isEqualToAlarm:v14]) {
              goto LABEL_22;
            }
          }
          else if (([v15 isEqualIgnoringLastModifiedDate:v14] & 1) == 0)
          {
LABEL_22:

            uint64_t v17 = 0;
            goto LABEL_23;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    uint64_t v17 = 1;
LABEL_23:
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)hf_alarmsMatchingAlarmId:()HFAlarmUtilities withinItemArray:
{
  id v5 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__MTAlarm_HFAlarmUtilities__hf_alarmsMatchingAlarmId_withinItemArray___block_invoke;
  v11[3] = &unk_264095E80;
  id v12 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a4, "na_filter:", v11);
  id v8 = v7;
  if (!v7) {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }
  id v9 = v7;

  return v9;
}

+ (uint64_t)hf_verifyThatAlarmsAreConsistent:()HFAlarmUtilities
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_25_7);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v18;
    char v8 = 1;
    *(void *)&long long v5 = 138412290;
    long long v16 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v3, "objectForKeyedSubscript:", v10, v16);
        unint64_t v12 = [v11 count];

        if (v12 >= 2)
        {
          v13 = HFLogForCategory(0x3AuLL);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = [v3 objectForKeyedSubscript:v10];
            *(_DWORD *)buf = v16;
            long long v22 = v14;
            _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "FOUND DUPLICATE ALARMS: %@", buf, 0xCu);
          }
          char v8 = 0;
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }
  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

@end