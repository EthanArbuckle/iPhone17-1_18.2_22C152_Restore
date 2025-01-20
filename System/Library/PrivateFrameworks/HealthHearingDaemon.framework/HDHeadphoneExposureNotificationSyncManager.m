@interface HDHeadphoneExposureNotificationSyncManager
- (BOOL)notifyHAENotificationAddedWithSample:(id)a3 error:(id *)a4;
- (HDHeadphoneExposureNotificationSyncManager)initWithProfile:(id)a3;
- (HDHeadphoneExposureNotificationSyncManager)initWithProfile:(id)a3 notificationSyncClient:(id)a4 notificationManager:(id)a5;
- (id)_computeFireDateFromResetDosageCategoryIdentifier:(id)a3;
- (id)_extractLatestFireDateFromResetDosageEvents:(id)a3;
- (id)_generateResetDosageCategoryIdentifierWithDate:(id)a3;
- (id)_resetDosageEventIdentifiersFromNotificationCategoryIdentifiers:(id)a3;
- (void)_handleDismissNotification;
- (void)_handleResetDosageEventsWithIdentifiers:(id)a3;
- (void)_notifyObserversResetDosageForFireDate:(id)a3;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4;
- (void)removeObserver:(id)a3;
@end

@implementation HDHeadphoneExposureNotificationSyncManager

- (HDHeadphoneExposureNotificationSyncManager)initWithProfile:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F432A0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = HKCreateSerialDispatchQueue();
  v8 = (void *)[v6 initWithProfile:v5 clientIdentifier:@"com.apple.Health.Hearing.HAE.Notification.SyncManager" queue:v7];

  v9 = [v5 notificationManager];
  v10 = [(HDHeadphoneExposureNotificationSyncManager *)self initWithProfile:v5 notificationSyncClient:v8 notificationManager:v9];

  return v10;
}

- (HDHeadphoneExposureNotificationSyncManager)initWithProfile:(id)a3 notificationSyncClient:(id)a4 notificationManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDHeadphoneExposureNotificationSyncManager;
  v11 = [(HDHeadphoneExposureNotificationSyncManager *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_notificationSyncClient, a4);
    [(HDNotificationSyncClient *)v12->_notificationSyncClient setDelegate:v12];
    objc_storeStrong((id *)&v12->_notificationManager, a5);
    id v13 = objc_alloc(MEMORY[0x263F0A5A8]);
    uint64_t v14 = [v13 initWithName:@"Headphone Exposure Notification Sync Observers" loggingCategory:*MEMORY[0x263F09910]];
    observers = v12->_observers;
    v12->_observers = (HKObserverSet *)v14;
  }
  return v12;
}

- (BOOL)notifyHAENotificationAddedWithSample:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x263F09910];
  id v8 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    *(_DWORD *)buf = 138543362;
    id v21 = (id)objc_opt_class();
    id v10 = v21;
    _os_log_impl(&dword_22615C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notify HAE Notification added with sample requested.", buf, 0xCu);
  }
  v11 = [v6 endDate];
  v12 = [v11 dateByAddingTimeInterval:691200.0];

  id v13 = [v6 endDate];

  uint64_t v14 = [(HDHeadphoneExposureNotificationSyncManager *)self _generateResetDosageCategoryIdentifierWithDate:v13];

  v15 = (void *)[objc_alloc(MEMORY[0x263F0A560]) initWithAction:1 categoryIdentifier:v14 expirationDate:v12];
  notificationSyncClient = self->_notificationSyncClient;
  id v19 = 0;
  [(HDNotificationSyncClient *)notificationSyncClient sendNotificationInstruction:v15 criteria:0 error:&v19];
  id v17 = v19;
  if (v17)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      -[HDHeadphoneExposureNotificationSyncManager notifyHAENotificationAddedWithSample:error:]();
    }
    if (a4) {
      *a4 = v17;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v17 == 0;
}

- (id)_generateResetDosageCategoryIdentifierWithDate:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  v3 = NSNumber;
  [a3 timeIntervalSinceReferenceDate];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  v9[0] = @"HDHAENSyncCategoryResetDosageEvent";
  id v5 = [v4 stringValue];
  v9[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  v7 = [v6 componentsJoinedByString:@"_"];

  return v7;
}

- (id)_computeFireDateFromResetDosageCategoryIdentifier:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"_"];
  if ([v3 count] == 2)
  {
    v4 = [v3 objectAtIndexedSubscript:1];
    [v4 doubleValue];
    double v6 = v5;

    v7 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:v6];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
      -[HDHeadphoneExposureNotificationSyncManager _computeFireDateFromResetDosageCategoryIdentifier:]();
    }
    v7 = 0;
  }

  return v7;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  _HKInitializeLogging();
  id v8 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    *(_DWORD *)v11 = 138543362;
    *(void *)&v11[4] = objc_opt_class();
    id v10 = *(id *)&v11[4];
    _os_log_impl(&dword_22615C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] added observer", v11, 0xCu);
  }
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", v7, v6, *(_OWORD *)v11);
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObserversResetDosageForFireDate:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85__HDHeadphoneExposureNotificationSyncManager__notifyObserversResetDosageForFireDate___block_invoke;
  v7[3] = &unk_264796248;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)observers notifyObservers:v7];
}

uint64_t __85__HDHeadphoneExposureNotificationSyncManager__notifyObserversResetDosageForFireDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 didReceiveResetDosageToFireDate:*(void *)(a1 + 32)];
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 3:
      _HKInitializeLogging();
      id v7 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
        -[HDHeadphoneExposureNotificationSyncManager notificationSyncClient:didReceiveInstructionWithAction:](v7);
      }
      break;
    case 2:
      _HKInitializeLogging();
      id v8 = (void *)*MEMORY[0x263F09910];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_ERROR)) {
        -[HDHeadphoneExposureNotificationSyncManager notificationSyncClient:didReceiveInstructionWithAction:](v8);
      }
      break;
    case 1:
      [(HDHeadphoneExposureNotificationSyncManager *)self _handleDismissNotification];
      break;
  }
}

- (void)_handleDismissNotification
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_1_1(v3);
  OUTLINED_FUNCTION_1(&dword_22615C000, v5, v6, "[%{public}@] Mark pending notification instruction as processed failed with error = [%{public}@]", v7, v8, v9, v10, v11);
}

- (id)_resetDosageEventIdentifiersFromNotificationCategoryIdentifiers:(id)a3
{
  void v9[3] = *MEMORY[0x263EF8340];
  v3 = [a3 allObjects];
  v9[0] = @"SELF beginswith[c] '";
  v9[1] = @"HDHAENSyncCategoryResetDosageEvent";
  v9[2] = @"'";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  uint64_t v5 = [v4 componentsJoinedByString:&stru_26D9E5188];

  uint64_t v6 = [MEMORY[0x263F08A98] predicateWithFormat:v5];
  uint64_t v7 = [v3 filteredArrayUsingPredicate:v6];

  return v7;
}

- (void)_handleResetDosageEventsWithIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = (os_log_t *)MEMORY[0x263F09910];
  uint64_t v6 = (void *)*MEMORY[0x263F09910];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09910], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    *(_DWORD *)uint64_t v14 = 138543362;
    *(void *)&v14[4] = objc_opt_class();
    id v8 = *(id *)&v14[4];
    _os_log_impl(&dword_22615C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling reset dosage events from identifiers", v14, 0xCu);
  }
  uint64_t v9 = -[HDHeadphoneExposureNotificationSyncManager _extractLatestFireDateFromResetDosageEvents:](self, "_extractLatestFireDateFromResetDosageEvents:", v4, *(_OWORD *)v14);

  if (v9)
  {
    [(HDHeadphoneExposureNotificationSyncManager *)self _notifyObserversResetDosageForFireDate:v9];
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint8_t v11 = v10;
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)uint64_t v14 = 138543362;
      *(void *)&v14[4] = v12;
      id v13 = v12;
      _os_log_impl(&dword_22615C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Lastest fired date found nil when extracting from category identifiers", v14, 0xCu);
    }
  }
}

- (id)_extractLatestFireDateFromResetDosageEvents:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    id v8 = 0;
    uint64_t v9 = *(void *)v22;
    os_log_t v10 = (os_log_t *)MEMORY[0x263F09910];
    *(void *)&long long v6 = 138543619;
    long long v20 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v13 = -[HDHeadphoneExposureNotificationSyncManager _computeFireDateFromResetDosageCategoryIdentifier:](self, "_computeFireDateFromResetDosageCategoryIdentifier:", v12, v20);
        if (v13)
        {
          if (!v8 || objc_msgSend(v8, "hk_isBeforeDate:", v13))
          {
            id v14 = v13;

            id v8 = v14;
          }
        }
        else
        {
          _HKInitializeLogging();
          os_log_t v15 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
          {
            v16 = v15;
            id v17 = objc_opt_class();
            *(_DWORD *)buf = v20;
            v26 = v17;
            __int16 v27 = 2113;
            uint64_t v28 = v12;
            id v18 = v17;
            _os_log_error_impl(&dword_22615C000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Fire date found nil when computing from category identifier, found: %{private}@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_notificationSyncClient, 0);
}

- (void)notifyHAENotificationAddedWithSample:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_1_1(v3);
  OUTLINED_FUNCTION_1(&dword_22615C000, v5, v6, "[%{public}@] Notification send dismiss instructions returned with error = [%{public}@]", v7, v8, v9, v10, v11);
}

- (void)_computeFireDateFromResetDosageCategoryIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_4();
  id v3 = v2;
  id v4 = (id)OUTLINED_FUNCTION_3();
  [v0 count];
  OUTLINED_FUNCTION_1(&dword_22615C000, v5, v6, "[%{public}@] Unable to compute fire date from identifier, found %lu components", v7, v8, v9, v10, 2u);
}

- (void)notificationSyncClient:(void *)a1 didReceiveInstructionWithAction:.cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
}

- (void)notificationSyncClient:(void *)a1 didReceiveInstructionWithAction:.cold.2(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
}

@end