@interface HMAccessoryCollectionSetting(COMeshAlarmAddOn_Internal)
- (id)co_cachedWrite;
- (id)co_mappedAlarms;
- (void)co_enqueueOperation:()COMeshAlarmAddOn_Internal;
- (void)co_flushQueue;
- (void)co_mappedAlarms;
- (void)co_setCachedWrite:()COMeshAlarmAddOn_Internal;
- (void)co_setMappedAlarms:()COMeshAlarmAddOn_Internal completionHandler:;
- (void)co_withLock:()COMeshAlarmAddOn_Internal;
@end

@implementation HMAccessoryCollectionSetting(COMeshAlarmAddOn_Internal)

- (void)co_withLock:()COMeshAlarmAddOn_Internal
{
  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&co_withLock__funnel);
  v3[2](v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&co_withLock__funnel);
}

- (void)co_enqueueOperation:()COMeshAlarmAddOn_Internal
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_enqueueOperation___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = a1;
  id v7 = v4;
  id v5 = v4;
  objc_msgSend(a1, "co_withLock:", v6);
}

- (void)co_flushQueue
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_impl(&dword_2217C1000, v2, OS_LOG_TYPE_DEFAULT, "%p performing coalesced writes", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  id v15 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke;
  v10[3] = &unk_2645CAE08;
  v10[4] = a1;
  v10[5] = &buf;
  objc_msgSend(a1, "co_withLock:", v10);
  v3 = objc_msgSend(a1, "co_mappedAlarms");
  id v4 = *(void **)(*((void *)&buf + 1) + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke_2;
  v8[3] = &unk_2645CB900;
  id v5 = v3;
  id v9 = v5;
  v6 = [v4 indexesOfObjectsPassingTest:v8];
  [*(id *)(*((void *)&buf + 1) + 40) removeObjectsAtIndexes:v6];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_flushQueue__block_invoke_3;
  v7[3] = &unk_2645CB928;
  v7[4] = a1;
  v7[5] = &buf;
  objc_msgSend(a1, "co_setMappedAlarms:completionHandler:", v5, v7);

  _Block_object_dispose(&buf, 8);
}

- (id)co_cachedWrite
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__6;
  v8 = __Block_byref_object_dispose__6;
  id v9 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_cachedWrite__block_invoke;
  v3[3] = &unk_2645CAE08;
  v3[4] = a1;
  v3[5] = &v4;
  objc_msgSend(a1, "co_withLock:", v3);
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (void)co_setCachedWrite:()COMeshAlarmAddOn_Internal
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setCachedWrite___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = a1;
  id v7 = v4;
  id v5 = v4;
  objc_msgSend(a1, "co_withLock:", v6);
}

- (id)co_mappedAlarms
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = objc_msgSend(a1, "co_cachedWrite");
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = COCoreLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(HMAccessoryCollectionSetting(COMeshAlarmAddOn_Internal) *)(uint64_t)a1 co_mappedAlarms];
    }
  }
  else
  {
    id v4 = [a1 value];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "co_alarm", (void)v23);
        v18 = v17;
        if (v17)
        {
          v19 = [v17 alarmID];
          v20 = [v2 objectForKey:v19];
          v21 = [v18 COPreferredAlarm:v20];
          [v2 setObject:v21 forKey:v19];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  return v2;
}

- (void)co_setMappedAlarms:()COMeshAlarmAddOn_Internal completionHandler:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v9 = [v6 allValues];
  uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_0];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v30;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = objc_msgSend(MEMORY[0x263F0DF50], "co_accessoryCollectionSettingItemWithAlarm:", *(void *)(*((void *)&v29 + 1) + 8 * v13));
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [a1 value];
  uint64_t v16 = (void *)v15;
  v17 = (void *)MEMORY[0x263EFFA68];
  if (v15) {
    v17 = (void *)v15;
  }
  id v18 = v17;

  objc_initWeak(&location, a1);
  v19 = (void *)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __96__HMAccessoryCollectionSetting_COMeshAlarmAddOn_Internal__co_setMappedAlarms_completionHandler___block_invoke;
  v23[3] = &unk_2645CB9C8;
  v27[1] = v19;
  id v20 = v18;
  id v24 = v20;
  id v21 = v8;
  id v25 = v21;
  objc_copyWeak(v27, &location);
  id v22 = v7;
  id v26 = v22;
  [a1 replaceItems:v20 withItems:v21 completionHandler:v23];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
}

- (void)co_mappedAlarms
{
}

@end