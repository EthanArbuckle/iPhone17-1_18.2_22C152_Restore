@interface HDMedicationNotificationSyncManager
- (BOOL)_clearMemoryCache;
- (BOOL)_shouldSendHoldInstructionForNewDoseEvent:(id)a3;
- (BOOL)_shouldSendHoldInstructionForOldScheduleItem:(id)a3 compareWithNewScheduleItem:(id)a4;
- (HDMedicationNotificationSyncManager)init;
- (HDMedicationNotificationSyncManager)initWithProfileExtension:(id)a3;
- (HDMedicationNotificationSyncManager)initWithProfileExtension:(id)a3 notificationSyncClient:(id)a4;
- (HDNotificationManager)notificationManager;
- (HDNotificationSyncClient)notificationSyncClient;
- (id)_fetchAllScheduleItemsWithTransaction:(uint64_t)a3 error:;
- (id)_getAndReleaseCachedScheduleItemsForSchedules:(uint64_t)a1;
- (int64_t)isScheduleItemOnHold:(id)a3 errorOut:(id *)a4;
- (uint64_t)_hasNotificationRecentlyBroadcastedForScheduleItemIdentifier:(uint64_t)a1;
- (void)_broadcastNotificationSchedule:(uint64_t)a1 withOldScheduleItem:(void *)a2 andNewScheduleItem:(void *)a3;
- (void)_cacheScheduleItems:(void *)a3 forSchedules:;
- (void)_didRescheduleLocalSchedules:(void *)a3 transaction:;
- (void)_handleDismissInstructions;
- (void)_handleHoldInstructions;
- (void)_handleScheduleItemsChangeForSchedule:(id)a3 withOldScheduleItems:(id)a4 andNewScheduleItems:(id)a5;
- (void)_updateNotificationSentTimeForScheduleItemIdentifier:(uint64_t)a1;
- (void)_willRescheduleLocalSchedules:(void *)a3 transaction:;
- (void)doseEventsAdded:(id)a3;
- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4;
- (void)scheduleManager:(id)a3 transaction:(id)a4 didReschedule:(id)a5;
- (void)scheduleManager:(id)a3 transaction:(id)a4 willReschedule:(id)a5;
@end

@implementation HDMedicationNotificationSyncManager

- (HDMedicationNotificationSyncManager)initWithProfileExtension:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F65B78];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 profile];
  uint64_t v8 = *MEMORY[0x1E4F2BE10];
  v9 = HKCreateSerialDispatchQueue();
  v10 = (void *)[v6 initWithProfile:v7 clientIdentifier:v8 queue:v9];

  v11 = [(HDMedicationNotificationSyncManager *)self initWithProfileExtension:v5 notificationSyncClient:v10];
  return v11;
}

- (HDMedicationNotificationSyncManager)initWithProfileExtension:(id)a3 notificationSyncClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HDMedicationNotificationSyncManager;
  uint64_t v8 = [(HDMedicationNotificationSyncManager *)&v22 init];
  if (v8)
  {
    v9 = [v6 profile];
    objc_storeWeak((id *)&v8->_profile, v9);

    objc_storeStrong((id *)&v8->_notificationSyncClient, a4);
    [(HDNotificationSyncClient *)v8->_notificationSyncClient setDelegate:v8];
    id WeakRetained = objc_loadWeakRetained((id *)&v8->_profile);
    uint64_t v11 = [WeakRetained notificationManager];
    notificationManager = v8->_notificationManager;
    v8->_notificationManager = (HDNotificationManager *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    scheduleDict = v8->_scheduleDict;
    v8->_scheduleDict = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    broadcastedScheduleItemIdentifiers = v8->_broadcastedScheduleItemIdentifiers;
    v8->_broadcastedScheduleItemIdentifiers = v15;

    *(void *)&v8->_scheduleDictLock._os_unfair_lock_opaque = 0;
    id v17 = objc_loadWeakRetained((id *)&v8->_profile);
    uint64_t v18 = [v17 syncIdentityManager];
    syncIdentityManager = v8->_syncIdentityManager;
    v8->_syncIdentityManager = (HDSyncIdentityManager *)v18;

    v20 = [v6 medicationScheduleManager];
    [v20 registerSynchronousObserver:v8];
  }
  return v8;
}

- (HDMedicationNotificationSyncManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (int64_t)isScheduleItemOnHold:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDNotificationSyncClient *)self->_notificationSyncClient notificationHoldInstructionsWithError:a4];
  _HKInitializeLogging();
  uint64_t v8 = HKLogMedication();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    v10 = HKLogMedication();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[HDMedicationNotificationSyncManager isScheduleItemOnHold:errorOut:]();
    }
  }
  if (v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F2B268] categoryIdentifierFromScheduleItemIdentifier:v6];
    if ([v7 containsObject:v11]) {
      int64_t v12 = 1;
    }
    else {
      int64_t v12 = 2;
    }
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (void)scheduleManager:(id)a3 transaction:(id)a4 willReschedule:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  _HKInitializeLogging();
  BOOL v9 = HKLogMedication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    id v11 = v10;
    int v12 = 138543618;
    v13 = v10;
    __int16 v14 = 2048;
    uint64_t v15 = [v7 count];
    _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will reschedule for %ld local schedules", (uint8_t *)&v12, 0x16u);
  }
  -[HDMedicationNotificationSyncManager _willRescheduleLocalSchedules:transaction:]((uint64_t)self, v7, v8);
}

- (void)_willRescheduleLocalSchedules:(void *)a3 transaction:
{
  id v5 = a2;
  if (a1)
  {
    id v9 = 0;
    id v6 = -[HDMedicationNotificationSyncManager _fetchAllScheduleItemsWithTransaction:error:](a1, a3, (uint64_t)&v9);
    id v7 = v9;
    if (v6)
    {
      -[HDMedicationNotificationSyncManager _cacheScheduleItems:forSchedules:](a1, v6, v5);
    }
    else
    {
      _HKInitializeLogging();
      id v8 = HKLogMedication();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationSyncManager _willRescheduleLocalSchedules:transaction:]();
      }
    }
  }
}

- (void)scheduleManager:(id)a3 transaction:(id)a4 didReschedule:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = HKLogMedication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_opt_class();
    id v11 = v10;
    int v12 = 138543618;
    v13 = v10;
    __int16 v14 = 2048;
    uint64_t v15 = [v7 count];
    _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did reschedule for %ld local schedules", (uint8_t *)&v12, 0x16u);
  }
  -[HDMedicationNotificationSyncManager _didRescheduleLocalSchedules:transaction:]((uint64_t)self, v7, v8);
}

- (void)_didRescheduleLocalSchedules:(void *)a3 transaction:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = -[HDMedicationNotificationSyncManager _getAndReleaseCachedScheduleItemsForSchedules:](a1, v5);
    id v16 = 0;
    id v8 = -[HDMedicationNotificationSyncManager _fetchAllScheduleItemsWithTransaction:error:](a1, v6, (uint64_t)&v16);
    id v9 = v16;
    if (v8)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __80__HDMedicationNotificationSyncManager__didRescheduleLocalSchedules_transaction___block_invoke;
      v11[3] = &unk_1E6337940;
      int v12 = v5;
      id v13 = v7;
      uint64_t v14 = a1;
      id v15 = v8;
      [v6 onCommit:v11 orRollback:0];

      v10 = v12;
    }
    else
    {
      _HKInitializeLogging();
      v10 = HKLogMedication();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationSyncManager _willRescheduleLocalSchedules:transaction:]();
      }
    }
  }
}

- (id)_fetchAllScheduleItemsWithTransaction:(uint64_t)a3 error:
{
  if (a1)
  {
    uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v5 = a2;
    id v6 = objc_alloc_init(v4);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83__HDMedicationNotificationSyncManager__fetchAllScheduleItemsWithTransaction_error___block_invoke;
    v11[3] = &unk_1E6337120;
    id v12 = v6;
    id v7 = v6;
    LODWORD(a3) = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:0 orderingTerms:0 transaction:v5 error:a3 enumerationHandler:v11];

    if (a3) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (void)_cacheScheduleItems:(void *)a3 forSchedules:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    [*(id *)(a1 + 8) removeAllObjects];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v15 = v6;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(a1 + 8);
          id v13 = [*(id *)(*((void *)&v16 + 1) + 8 * v11) UUID];
          uint64_t v14 = [v13 UUIDString];
          [v12 setObject:v5 forKeyedSubscript:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    id v6 = v15;
  }
}

- (id)_getAndReleaseCachedScheduleItemsForSchedules:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "UUID", (void)v14);
          uint64_t v11 = [v10 UUIDString];

          id v12 = [*(id *)(a1 + 8) objectForKeyedSubscript:v11];
          [v4 setObject:v12 forKeyedSubscript:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [*(id *)(a1 + 8) removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __80__HDMedicationNotificationSyncManager__didRescheduleLocalSchedules_transaction___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v20;
    *(void *)&long long v4 = 138543618;
    long long v17 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v9 = *(void **)(a1 + 40);
        uint64_t v10 = objc_msgSend(v8, "UUID", v17);
        uint64_t v11 = [v10 UUIDString];
        id v12 = [v9 objectForKeyedSubscript:v11];

        if (v12)
        {
          [*(id *)(a1 + 48) _handleScheduleItemsChangeForSchedule:v8 withOldScheduleItems:v12 andNewScheduleItems:*(void *)(a1 + 56)];
        }
        else
        {
          _HKInitializeLogging();
          id v13 = HKLogMedication();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            long long v14 = objc_opt_class();
            id v18 = v14;
            long long v15 = [v8 UUID];
            long long v16 = [v15 UUIDString];
            *(_DWORD *)buf = v17;
            v24 = v14;
            __int16 v25 = 2114;
            v26 = v16;
            _os_log_error_impl(&dword_1BD54A000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Weird, beforeChangeItems is nil. scheduleUUID=[%{public}@]", buf, 0x16u);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v5);
  }
}

uint64_t __83__HDMedicationNotificationSyncManager__fetchAllScheduleItemsWithTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  long long v4 = [v3 identifier];
  [v2 setObject:v3 forKeyedSubscript:v4];

  return 1;
}

- (void)_handleScheduleItemsChangeForSchedule:(id)a3 withOldScheduleItems:(id)a4 andNewScheduleItems:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 count])
  {
    v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v28 = v8;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          long long v16 = [v10 objectForKeyedSubscript:v15];
          long long v17 = [v9 objectForKeyedSubscript:v15];
          if (!v17) {
            [v29 addObject:v15];
          }
          if ([(HDMedicationNotificationSyncManager *)self _shouldSendHoldInstructionForOldScheduleItem:v16 compareWithNewScheduleItem:v17])
          {
            -[HDMedicationNotificationSyncManager _broadcastNotificationSchedule:withOldScheduleItem:andNewScheduleItem:]((uint64_t)self, v30, v16);
          }
          else
          {
            _HKInitializeLogging();
            id v18 = HKLogMedication();
            BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

            if (v19)
            {
              long long v20 = HKLogMedication();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                long long v21 = (HDMedicationNotificationSyncManager *)objc_opt_class();
                *(_DWORD *)buf = 138543874;
                v36 = v21;
                __int16 v37 = 2114;
                v38 = v16;
                __int16 v39 = 2114;
                v40 = v17;
                long long v22 = v21;
                _os_log_debug_impl(&dword_1BD54A000, v20, OS_LOG_TYPE_DEBUG, "[%{public}@] Not broadcasting for oldItem=[%{public}@], newItem=[%{public}@]", buf, 0x20u);
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v12);
    }

    v23 = v29;
    if ([v29 count])
    {
      _HKInitializeLogging();
      v24 = HKLogMedication();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        __int16 v37 = 2112;
        v38 = v29;
        _os_log_impl(&dword_1BD54A000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing delivered notifications from local device for scheduleItemIdentifiers: %@", buf, 0x16u);
      }

      [(HDNotificationManager *)self->_notificationManager removeDeliveredNotificationsForScheduleItemIdentifiers:v29];
    }
    id v8 = v28;
  }
  else
  {
    _HKInitializeLogging();
    v23 = HKLogMedication();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = (HDMedicationNotificationSyncManager *)objc_opt_class();
      v26 = v25;
      v27 = [v30 UUID];
      *(_DWORD *)buf = 138543618;
      v36 = v25;
      __int16 v37 = 2114;
      v38 = v27;
      _os_log_impl(&dword_1BD54A000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] oldItems is empty. scheduleUUID=[%{public}@]", buf, 0x16u);
    }
  }
}

- (void)_broadcastNotificationSchedule:(uint64_t)a1 withOldScheduleItem:(void *)a2 andNewScheduleItem:(void *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x1E4F2B268];
    id v7 = a2;
    id v8 = [v6 alloc];
    id v9 = [v5 identifier];
    id v10 = (void *)[v8 initWithAction:2 scheduleItemIdentifier:v9];

    uint64_t v11 = (void *)MEMORY[0x1E4F1C9C8];
    [v7 creationTimestamp];
    uint64_t v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v13 = [HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria alloc];
    long long v14 = [v7 UUID];

    uint64_t v15 = [(HDNotificationInstructionModifiedMedicationScheduleNotInDatabaseCriteria *)v13 initWithUUID:v14 modificationDate:v12];
    _HKInitializeLogging();
    long long v16 = HKLogMedication();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = objc_opt_class();
      id v18 = v17;
      BOOL v19 = [v10 categoryIdentifier];
      long long v20 = [v10 expirationDate];
      *(_DWORD *)buf = 138544130;
      long long v34 = v17;
      __int16 v35 = 2114;
      v36 = v19;
      __int16 v37 = 2114;
      id v38 = v20;
      __int16 v39 = 2114;
      v40 = v12;
    }
    long long v21 = *(void **)(a1 + 56);
    id v32 = 0;
    int v22 = [v21 sendNotificationInstruction:v10 criteria:v15 error:&v32];
    id v23 = v32;
    if (v22)
    {
      v24 = [v5 identifier];
      -[HDMedicationNotificationSyncManager _updateNotificationSentTimeForScheduleItemIdentifier:](a1, v24);
    }
    else
    {
      _HKInitializeLogging();
      v24 = HKLogMedication();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v29 = objc_opt_class();
        id v30 = v29;
        long long v31 = [v5 identifier];
        *(_DWORD *)buf = 138543874;
        long long v34 = v29;
        __int16 v35 = 2114;
        v36 = v31;
        __int16 v37 = 2114;
        id v38 = v23;
      }
    }

    _HKInitializeLogging();
    __int16 v25 = HKLogMedication();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_opt_class();
      id v27 = v26;
      id v28 = [v10 categoryIdentifier];
      *(_DWORD *)buf = 138543618;
      long long v34 = v26;
      __int16 v35 = 2114;
      v36 = v28;
    }
  }
}

- (void)_updateNotificationSentTimeForScheduleItemIdentifier:(uint64_t)a1
{
  if (a1)
  {
    id v3 = (os_unfair_lock_s *)(a1 + 28);
    id v4 = a2;
    os_unfair_lock_lock(v3);
    id v5 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
    [v6 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 16) setObject:v7 forKeyedSubscript:v4];
    os_unfair_lock_unlock(v3);
  }
}

- (BOOL)_clearMemoryCache
{
  p_scheduleDictLock = &self->_scheduleDictLock;
  os_unfair_lock_lock(&self->_scheduleDictLock);
  [(NSMutableDictionary *)self->_scheduleDict removeAllObjects];
  os_unfair_lock_unlock(p_scheduleDictLock);
  os_unfair_lock_lock(&self->_scheduleItemIdentifiersLock);
  [(NSMutableDictionary *)self->_broadcastedScheduleItemIdentifiers removeAllObjects];
  os_unfair_lock_unlock(&self->_scheduleItemIdentifiersLock);
  return 1;
}

- (uint64_t)_hasNotificationRecentlyBroadcastedForScheduleItemIdentifier:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 28);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 28));
    id v5 = [*(id *)(a1 + 16) objectForKeyedSubscript:v3];
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
      [v6 timeIntervalSinceReferenceDate];
      double v8 = v7;
      [v5 doubleValue];
      double v10 = v8 - v9;

      if (v10 < 5.0)
      {
        a1 = 1;
LABEL_7:
        os_unfair_lock_unlock(v4);

        goto LABEL_8;
      }
      [*(id *)(a1 + 16) removeObjectForKey:v3];
    }
    a1 = 0;
    goto LABEL_7;
  }
LABEL_8:

  return a1;
}

- (void)doseEventsAdded:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogMedication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    *(_DWORD *)buf = 138543618;
    uint64_t v41 = v6;
    __int16 v42 = 2048;
    uint64_t v43 = [v4 count];
    _os_log_impl(&dword_1BD54A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] New HKMedicationDoseEvents are added. Count: %lu", buf, 0x16u);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v37;
    *(void *)&long long v10 = 138543874;
    long long v32 = v10;
    id v33 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v34 = v11;
      do
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
        if (-[HDMedicationNotificationSyncManager _shouldSendHoldInstructionForNewDoseEvent:](self, "_shouldSendHoldInstructionForNewDoseEvent:", v14, v32))
        {
          id v15 = objc_alloc(MEMORY[0x1E4F2B268]);
          long long v16 = [v14 scheduleItemIdentifier];
          long long v17 = (void *)[v15 initWithAction:2 scheduleItemIdentifier:v16];

          id v18 = objc_alloc(MEMORY[0x1E4F65B70]);
          BOOL v19 = [v14 UUID];
          long long v20 = (void *)[v18 initWithUUID:v19];

          _HKInitializeLogging();
          long long v21 = HKLogMedication();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = objc_opt_class();
            id v23 = v22;
            v24 = [v17 categoryIdentifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v41 = v22;
            __int16 v42 = 2114;
            uint64_t v43 = (uint64_t)v24;

            id v8 = v33;
          }

          notificationSyncClient = self->_notificationSyncClient;
          id v35 = 0;
          int v26 = [(HDNotificationSyncClient *)notificationSyncClient sendNotificationInstruction:v17 criteria:v20 error:&v35];
          id v27 = v35;
          if (v26)
          {
            id v28 = [v14 scheduleItemIdentifier];
            -[HDMedicationNotificationSyncManager _updateNotificationSentTimeForScheduleItemIdentifier:]((uint64_t)self, v28);
          }
          else
          {
            _HKInitializeLogging();
            id v28 = HKLogMedication();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v29 = objc_opt_class();
              id v30 = v29;
              long long v31 = [v14 scheduleItemIdentifier];
              *(_DWORD *)buf = v32;
              uint64_t v41 = v29;
              __int16 v42 = 2114;
              uint64_t v43 = (uint64_t)v31;
              __int16 v44 = 2114;
              id v45 = v27;

              id v8 = v33;
            }
          }

          uint64_t v11 = v34;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v11);
  }
}

- (BOOL)_shouldSendHoldInstructionForOldScheduleItem:(id)a3 compareWithNewScheduleItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];
  LOBYTE(self) = -[HDMedicationNotificationSyncManager _hasNotificationRecentlyBroadcastedForScheduleItemIdentifier:]((uint64_t)self, v8);

  if (self)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    long long v10 = (void *)MEMORY[0x1E4F2B268];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v12 = [v10 instructionExpirationDateForDate:v11];

    uint64_t v13 = [v6 scheduledDateTime];
    char v14 = objc_msgSend(v12, "hk_isBeforeDate:", v13);

    if (v14)
    {
      LOBYTE(v9) = 0;
    }
    else if (v7)
    {
      id v15 = [v6 doses];
      unint64_t v16 = [v15 count];
      long long v17 = [v7 doses];
      if (v16 <= [v17 count])
      {
        id v18 = [v6 doses];
        BOOL v19 = [v7 doses];
        if (objc_msgSend(v18, "hk_containsObjectsInArray:", v19))
        {
          long long v20 = [v6 scheduledDateTime];
          long long v21 = [v7 scheduledDateTime];
          int v9 = [v20 isEqual:v21] ^ 1;
        }
        else
        {
          LOBYTE(v9) = 1;
        }
      }
      else
      {
        LOBYTE(v9) = 1;
      }
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (BOOL)_shouldSendHoldInstructionForNewDoseEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 scheduleItemIdentifier];
  char v6 = -[HDMedicationNotificationSyncManager _hasNotificationRecentlyBroadcastedForScheduleItemIdentifier:]((uint64_t)self, v5);

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [v4 scheduleItemIdentifier];
    if (v8
      && ([v4 status] == 4 || objc_msgSend(v4, "status") == 5)
      && [v4 logOrigin] == 2)
    {
      int v9 = objc_msgSend(v4, "hd_dataOriginProvenance");
      uint64_t v10 = [v9 syncIdentity];
      uint64_t v11 = [(HDSyncIdentityManager *)self->_syncIdentityManager currentSyncIdentity];
      uint64_t v12 = [v11 entity];
      BOOL v7 = v10 == [v12 persistentID];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 3:
      _HKInitializeLogging();
      BOOL v7 = HKLogMedication();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationSyncManager notificationSyncClient:didReceiveInstructionWithAction:]((uint64_t)self, v7);
      }

      break;
    case 2:
      -[HDMedicationNotificationSyncManager _handleHoldInstructions]((uint64_t)self);
      break;
    case 1:
      -[HDMedicationNotificationSyncManager _handleDismissInstructions]((uint64_t)self);
      break;
  }
}

- (void)_handleDismissInstructions
{
  OUTLINED_FUNCTION_2_2();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1BD54A000, v2, v3, "[%{public}@] Mark pending notification instruction as processed failed with error = [%{public}@]", v4, v5, v6, v7, v8);
}

- (void)_handleHoldInstructions
{
  OUTLINED_FUNCTION_2_2();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1BD54A000, v2, v3, "[%{public}@] Notification hold instructions returned nil with error = [%{public}@]", v4, v5, v6, v7, v8);
}

uint64_t __65__HDMedicationNotificationSyncManager__handleDismissInstructions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*MEMORY[0x1E4F669F8]];
}

- (HDNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (HDNotificationSyncClient)notificationSyncClient
{
  return self->_notificationSyncClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSyncClient, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_syncIdentityManager, 0);
  objc_storeStrong((id *)&self->_broadcastedScheduleItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_scheduleDict, 0);
}

- (void)isScheduleItemOnHold:errorOut:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v1 = objc_opt_class();
  id v2 = OUTLINED_FUNCTION_0_1(v1);
  _os_log_debug_impl(&dword_1BD54A000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] On hold items: [%{public}@]", v3, 0x16u);
}

- (void)_willRescheduleLocalSchedules:transaction:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1BD54A000, v2, v3, "[%{public}@] Fetch schedule items returned nil with error: [%{public}@]", v4, v5, v6, v7, v8);
}

- (void)notificationSyncClient:(uint64_t)a1 didReceiveInstructionWithAction:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
}

@end