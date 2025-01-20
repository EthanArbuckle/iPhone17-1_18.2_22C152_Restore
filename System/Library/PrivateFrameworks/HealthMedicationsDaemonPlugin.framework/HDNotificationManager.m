@interface HDNotificationManager
@end

@implementation HDNotificationManager

void __93__HDNotificationManager_Medications__removeDeliveredNotificationsForScheduleItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogMedication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    *(_DWORD *)buf = 138543874;
    uint64_t v32 = v5;
    __int16 v33 = 2112;
    v34 = v6;
    __int16 v35 = 2112;
    id v36 = v3;
    _os_log_impl(&dword_1BD54A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Currently delivered (%@) notifications: %@", buf, 0x20u);
  }
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v24 addObjectsFromArray:*(void *)(a1 + 40)];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    uint64_t v10 = *MEMORY[0x1E4F66A00];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v13 = [v12 request];
        v14 = [v13 content];
        v15 = [v14 userInfo];
        v16 = [v15 objectForKeyedSubscript:v10];

        if ([*(id *)(a1 + 40) containsObject:v16])
        {
          v17 = [v12 request];
          v18 = [v17 identifier];
          [v24 addObject:v18];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  _HKInitializeLogging();
  v19 = HKLogMedication();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
    *(_DWORD *)buf = 138543874;
    uint64_t v32 = v20;
    __int16 v33 = 2112;
    v34 = v21;
    __int16 v35 = 2112;
    id v36 = v24;
    _os_log_impl(&dword_1BD54A000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing (%@) notifications: %@", buf, 0x20u);
  }
  v22 = *(void **)(a1 + 32);
  v23 = [v24 allObjects];
  [v22 removeDeliveredNotificationsWithIdentifiers:v23];
}

@end