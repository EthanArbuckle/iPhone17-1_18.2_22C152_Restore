@interface HDMedicationNotificationManager
- (BOOL)_removeAllScheduleItemsNotSentWithTransaction:(uint64_t)a3 error:;
- (BOOL)_removeAllScheduleItemsWithTransaction:(uint64_t)a3 error:;
- (BOOL)_rescheduleMedicationsFromDate:(id)a3 error:(id *)a4;
- (BOOL)_scheduleMedicationsFromDate:(id)a3 clearNotSentItems:(BOOL)a4 error:(id *)a5;
- (BOOL)_snoozedDoseEventDate:(void *)a3 forScheduleItem:(void *)a4 error:;
- (BOOL)areDoseRemindersEnabled;
- (BOOL)rescheduleMedicationsWithError:(id *)a3;
- (HDMedicationNotificationManager)init;
- (HDMedicationNotificationManager)initWithProfile:(id)a3 userDefaults:(id)a4;
- (HDRestorableAlarm)unitTesting_expirationAlarm;
- (HDRestorableAlarm)unitTesting_restorableAlarm;
- (OS_dispatch_queue)unitTesting_expirationAlarmQueue;
- (OS_dispatch_queue)unitTesting_restorableAlarmQueue;
- (double)_followUpDuration;
- (double)_snoozeDuration;
- (id)_activeSchedulesFromDate:(void *)a3 calendar:(void *)a4 transaction:(uint64_t)a5 error:;
- (id)_alarm:(void *)a3 filterDueEventsToHandle:(void *)a4 date:;
- (id)_expirationEventsToRemoveAtDate:(uint64_t)a3 error:;
- (id)_generateScheduleItemsWithSchedules:(void *)a3 fromDate:(void *)a4 endDate:(void *)a5 calendar:(uint64_t)a6 error:;
- (id)_medicationDoseEventsForScheduleItems:(uint64_t)a3 transaction:(uint64_t)a4 error:;
- (id)_nextScheduleItemsWithTransaction:(void *)a3 date:(void *)a4 snoozeFireDates:(uint64_t)a5 error:;
- (id)_notInteractedDoseEventsForScheduleItems:(id)a3 transaction:(id)a4;
- (id)_notificationSentScheduleItemsWithTransaction:(uint64_t)a3 error:;
- (id)_pruneAllScheduleItemsBefore:(int)a3 createDoseEvents:(int)a4 excludeDoseEventCreationForGivenDate:(void *)a5 transaction:(void *)a6 error:;
- (id)_removeDeliveredNotificationsLoggedAsTakenOrSkippedNotFromNotificationInterfaceWithError:(uint64_t)a1;
- (id)_scheduleItemsNotSentPredicate;
- (id)_scheduleItemsSentPredicate;
- (id)_scheduleItemsWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:;
- (id)_snoozedDoseEventWithScheduleItemIdentifier:(void *)a3 medicationIdentifiers:(uint64_t)a4 error:;
- (id)_takenOrSkippedAlarmIdentifiersSince:(uint64_t)a3 error:;
- (id)_takenOrSkippedDoseEventsNearDate:(uint64_t)a3 error:;
- (id)_takenOrSkippedItemDoseIdentifiersNearDate:(uint64_t)a3 error:;
- (id)_uniqueDoseIdentifierFromItemIdentifier:(uint64_t)a3 medicationidentifier:;
- (id)pruneAllScheduleItemsBeforeDate:(id)a3 createDoseEvents:(BOOL)a4 error:(id *)a5;
- (id)unitTesting_activeSchedulesFromDate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (uint64_t)_deleteNotInteractedAndNotLoggedDoseEventFor:(uint64_t)a3 transaction:(uint64_t)a4 error:;
- (uint64_t)_doseReminderSettingIsDisabled;
- (uint64_t)_followUpNotificationsEnabled;
- (uint64_t)_isDueEventExpired:(void *)a3 fromDate:;
- (uint64_t)_isDueEventOnHold:(uint64_t)a1;
- (uint64_t)_notificationIsEnabled;
- (uint64_t)_removeExpirationEventsForIdentifiers:(uint64_t)a3 error:;
- (uint64_t)_saveNotInteractedDoseEventsForScheduleItems:(void *)a3 transaction:(uint64_t)a4 error:;
- (uint64_t)_saveScheduleItems:(void *)a3 notificationSentScheduleItems:(void *)a4 transaction:(void *)a5 error:;
- (uint64_t)_scheduleMedicationsFromDate:(int)a3 clearNotSentItems:(int)a4 areDoseRemindersEnabled:(void *)a5 transaction:(NSObject *)a6 error:;
- (uint64_t)_scheduleRestorableAlarmWithItems:(void *)a3 date:(void *)a4 snoozeFireDates:(uint64_t)a5 error:;
- (uint64_t)_scheduleRestorableAlarmWithNextScheduleItemsTransaction:(void *)a3 date:(NSObject *)a4 error:;
- (uint64_t)_schedulingIsEnabled;
- (uint64_t)_takenOrSkippedItemDoseIdentifiers:(void *)a3 containsAllItemDoseIdentifiersForItem:;
- (void)_addNotificationObserver:(id)a3;
- (void)_alarm:(void *)a3 confirmDeliveryByRemovingEvent:;
- (void)_alarm:(void *)a3 confirmDeliveryByRemovingEvents:;
- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4 date:(id)a5;
- (void)_queue_alarm:(void *)a3 didReceiveDueExpirationEvents:;
- (void)setUnitTesting_expirationAlarm:(id)a3;
- (void)setUnitTesting_expirationAlarmQueue:(id)a3;
- (void)setUnitTesting_restorableAlarm:(id)a3;
- (void)setUnitTesting_restorableAlarmQueue:(id)a3;
@end

@implementation HDMedicationNotificationManager

- (HDMedicationNotificationManager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDMedicationNotificationManager)initWithProfile:(id)a3 userDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)HDMedicationNotificationManager;
  v8 = [(HDMedicationNotificationManager *)&v34 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    uint64_t v10 = HKCreateSerialDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F65BE0]);
    v13 = [v6 healthDaemon];
    v14 = [v13 primaryProfile];
    uint64_t v15 = [v12 initWithProfile:v14 clientIdentifier:@"HDMedicationNotificationManager" eventHandlerQueue:v9->_queue];
    restorableAlarm = v9->_restorableAlarm;
    v9->_restorableAlarm = (HDRestorableAlarm *)v15;

    id v17 = objc_alloc(MEMORY[0x1E4F65BE0]);
    v18 = [v6 healthDaemon];
    v19 = [v18 primaryProfile];
    uint64_t v20 = [v17 initWithProfile:v19 clientIdentifier:@"MedicationExpirationAlarmIdentifier" eventHandlerQueue:v9->_queue];
    expirationAlarm = v9->_expirationAlarm;
    v9->_expirationAlarm = (HDRestorableAlarm *)v20;

    objc_initWeak(&location, v9);
    v22 = v9->_restorableAlarm;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __64__HDMedicationNotificationManager_initWithProfile_userDefaults___block_invoke;
    v31[3] = &unk_1E6337708;
    objc_copyWeak(&v32, &location);
    [(HDRestorableAlarm *)v22 beginReceivingEventsWithHandler:v31];
    v23 = v9->_expirationAlarm;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __64__HDMedicationNotificationManager_initWithProfile_userDefaults___block_invoke_2;
    v29[3] = &unk_1E6337708;
    objc_copyWeak(&v30, &location);
    [(HDRestorableAlarm *)v23 beginReceivingEventsWithHandler:v29];
    uint64_t v24 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
    dateAnchor = v9->_dateAnchor;
    v9->_dateAnchor = (NSDate *)v24;

    v26 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x1E4F2AC98]);
    calendarCache = v9->_calendarCache;
    v9->_calendarCache = v26;

    objc_storeStrong((id *)&v9->_userDefaults, a4);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __64__HDMedicationNotificationManager_initWithProfile_userDefaults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  objc_msgSend(WeakRetained, "_queue_alarm:didReceiveDueEvents:date:", v6, v5, v7);
}

void __64__HDMedicationNotificationManager_initWithProfile_userDefaults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[HDMedicationNotificationManager _queue_alarm:didReceiveDueExpirationEvents:]((uint64_t)WeakRetained, v6, v5);
}

- (void)_queue_alarm:(void *)a3 didReceiveDueExpirationEvents:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    id v7 = HKLogMedication();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      int v12 = 138543874;
      uint64_t v13 = a1;
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_1BD54A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %{public}@ due expiration events: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    v9 = objc_msgSend(v6, "hk_map:", &__block_literal_global_8);
    if ([v9 count])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v11 = [WeakRetained notificationManager];
      [v11 removeDeliveredNotificationsForScheduleItemIdentifiers:v9];

      -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvents:](a1, v5, v6);
    }
  }
}

- (BOOL)rescheduleMedicationsWithError:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v5 = HKLogMedication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    uint64_t v10 = self;
    _os_log_impl(&dword_1BD54A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rescheduling medications", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v7 = [(HDMedicationNotificationManager *)self _rescheduleMedicationsFromDate:v6 error:a3];

  return v7;
}

- (BOOL)areDoseRemindersEnabled
{
  return -[HDMedicationNotificationManager _doseReminderSettingIsDisabled]((uint64_t)self) ^ 1;
}

- (uint64_t)_doseReminderSettingIsDisabled
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *MEMORY[0x1E4F669A8];
    v3 = [*(id *)(result + 56) objectForKey:*MEMORY[0x1E4F669A8]];
    if (v3)
    {
      int v4 = [*(id *)(v1 + 56) BOOLForKey:v2];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
      id v6 = [WeakRetained notificationManager];
      int v4 = [v6 areHealthNotificationsAuthorized];
    }
    return v4 ^ 1u;
  }
  return result;
}

- (BOOL)_rescheduleMedicationsFromDate:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  BOOL v7 = HKLogMedication();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1BD54A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Rescheduling medications from date: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  BOOL v8 = [(HDMedicationNotificationManager *)self _scheduleMedicationsFromDate:v6 clearNotSentItems:1 error:a4];
  return v8;
}

- (BOOL)_scheduleMedicationsFromDate:(id)a3 clearNotSentItems:(BOOL)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = [(HDMedicationNotificationManager *)self areDoseRemindersEnabled];
  _HKInitializeLogging();
  int v10 = HKLogMedication();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = HKStringFromBool();
    __int16 v12 = HKStringFromBool();
    *(_DWORD *)buf = 138544130;
    v23 = self;
    __int16 v24 = 2114;
    id v25 = v8;
    __int16 v26 = 2114;
    v27 = v11;
    __int16 v28 = 2114;
    v29 = v12;
    _os_log_impl(&dword_1BD54A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling medications from date: %{public}@, clearItems: %{public}@, areDoseRemindersEnabled: %{public}@", buf, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v14 = [WeakRetained database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__HDMedicationNotificationManager__scheduleMedicationsFromDate_clearNotSentItems_error___block_invoke;
  v18[3] = &unk_1E6337730;
  v18[4] = self;
  id v19 = v8;
  BOOL v20 = a4;
  BOOL v21 = v9;
  id v15 = v8;
  BOOL v16 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v14 error:a5 block:v18];

  return v16;
}

uint64_t __88__HDMedicationNotificationManager__scheduleMedicationsFromDate_clearNotSentItems_error___block_invoke(uint64_t a1, void *a2, NSObject **a3)
{
  return -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), a2, a3);
}

- (uint64_t)_scheduleMedicationsFromDate:(int)a3 clearNotSentItems:(int)a4 areDoseRemindersEnabled:(void *)a5 transaction:(NSObject *)a6 error:
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a5;
  if (!a1)
  {
    uint64_t v19 = 0;
    goto LABEL_148;
  }
  _HKInitializeLogging();
  id v13 = HKLogMedication();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = HKStringFromBool();
    *(_DWORD *)buf = 138543874;
    uint64_t v123 = a1;
    __int16 v124 = 2114;
    id v125 = v11;
    __int16 v126 = 2114;
    id v127 = v14;
    _os_log_impl(&dword_1BD54A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling medications with transactions from date: %{public}@, clearItems: %{public}@", buf, 0x20u);
  }
  if (-[HDMedicationNotificationManager _schedulingIsEnabled](a1))
  {
    if (a4)
    {
      id v120 = 0;
      id v15 = -[HDMedicationNotificationManager _removeDeliveredNotificationsLoggedAsTakenOrSkippedNotFromNotificationInterfaceWithError:](a1, &v120);
      id v16 = v120;
      _HKInitializeLogging();
      id v17 = HKLogMedication();
      uint64_t v18 = v17;
      if (v15)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v123 = a1;
          __int16 v124 = 2114;
          id v125 = v15;
          _os_log_impl(&dword_1BD54A000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempted to remove delivered notifications taken or skipped outside of notification UI: %{public}@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:]2();
      }

      id v119 = v16;
      int v20 = -[HDMedicationNotificationManager _removeExpirationEventsForIdentifiers:error:](a1, v15, (uint64_t)&v119);
      id v21 = v119;

      _HKInitializeLogging();
      v22 = HKLogMedication();
      v23 = v22;
      if (v20)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
          *(_DWORD *)buf = 138543618;
          uint64_t v123 = a1;
          __int16 v124 = 2114;
          id v125 = v24;
          _os_log_impl(&dword_1BD54A000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully removed %{public}@ overdue expiration events", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:]1();
      }
    }
    id v118 = 0;
    id v25 = -[HDMedicationNotificationManager _notificationSentScheduleItemsWithTransaction:error:]((void *)a1, v12, (uint64_t)&v118);
    id v26 = v118;
    if (!v25)
    {
      _HKInitializeLogging();
      v43 = HKLogMedication();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:]();
      }

      goto LABEL_78;
    }
    if (a3)
    {
      _HKInitializeLogging();
      v27 = HKLogMedication();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v123 = a1;
        _os_log_impl(&dword_1BD54A000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clearing items", buf, 0xCu);
      }

      id v117 = 0;
      __int16 v28 = -[HDMedicationNotificationManager _pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:]((id *)a1, v11, 1, 1, v12, &v117);
      id v29 = v117;

      if (!v28)
      {
        _HKInitializeLogging();
        v44 = HKLogMedication();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v123 = a1;
          __int16 v124 = 2114;
          id v125 = v11;
          __int16 v126 = 2114;
          id v127 = v29;
          _os_log_error_impl(&dword_1BD54A000, v44, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to prune schedule items before date %{public}@ error: %{public}@", buf, 0x20u);
        }

        id v45 = v29;
        if (v45)
        {
          if (a6) {
            *a6 = v45;
          }
          else {
            _HKLogDroppedError();
          }
        }

        goto LABEL_78;
      }
      id v116 = 0;
      char v31 = -[HDMedicationNotificationManager _deleteNotInteractedAndNotLoggedDoseEventFor:transaction:error:](a1, v11, v30, (uint64_t)&v116);
      id v32 = v116;
      if ((v31 & 1) == 0)
      {
        _HKInitializeLogging();
        v46 = HKLogMedication();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v123 = a1;
          __int16 v124 = 2114;
          id v125 = v11;
          __int16 v126 = 2114;
          id v127 = v32;
          _os_log_error_impl(&dword_1BD54A000, v46, OS_LOG_TYPE_ERROR, "[%{public}@] Could not delete NotInteracted and NotLogged dosevents for date %{public}@ error: %{public}@", buf, 0x20u);
        }

        id v47 = v32;
        if (v47)
        {
          if (a6) {
            *a6 = v47;
          }
          else {
            _HKLogDroppedError();
          }
        }

        goto LABEL_78;
      }
      id v115 = 0;
      BOOL v33 = -[HDMedicationNotificationManager _removeAllScheduleItemsWithTransaction:error:](a1, v12, (uint64_t)&v115);
      id v34 = v115;
      if (v33)
      {
        v35 = *(void **)(a1 + 24);
        id v114 = 0;
        char v36 = [v35 removeAllEventsWithError:&v114];
        id v105 = v114;
        if (v36)
        {
          id v113 = 0;
          uint64_t v37 = -[HDMedicationNotificationManager _expirationEventsToRemoveAtDate:error:]((id *)a1, v11, (uint64_t)&v113);
          v101 = (void *)v37;
          id v103 = v113;
          if (v37)
          {
            v38 = *(void **)(a1 + 32);
            id v112 = 0;
            char v39 = [v38 removeEvents:v37 error:&v112];
            id v99 = v112;
            if (v39)
            {
              uint64_t v40 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
              v41 = *(void **)(a1 + 40);
              *(void *)(a1 + 40) = v40;

              int v42 = 0;
            }
            else
            {
              _HKInitializeLogging();
              v54 = HKLogMedication();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.8();
              }

              id v55 = v99;
              if (v55)
              {
                if (a6) {
                  *a6 = v55;
                }
                else {
                  _HKLogDroppedError();
                }
              }

              unsigned __int8 v121 = 0;
              int v42 = 1;
            }
          }
          else
          {
            _HKInitializeLogging();
            v52 = HKLogMedication();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
              -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.7();
            }

            id v53 = v103;
            if (v53)
            {
              if (a6) {
                *a6 = v53;
              }
              else {
                _HKLogDroppedError();
              }
            }

            unsigned __int8 v121 = 0;
            int v42 = 1;
          }
        }
        else
        {
          _HKInitializeLogging();
          v50 = HKLogMedication();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.9();
          }

          id v51 = v105;
          if (v51)
          {
            if (a6) {
              *a6 = v51;
            }
            else {
              _HKLogDroppedError();
            }
          }

          unsigned __int8 v121 = 0;
          int v42 = 1;
        }
      }
      else
      {
        _HKInitializeLogging();
        v48 = HKLogMedication();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:]0();
        }

        id v49 = v34;
        if (v49)
        {
          if (a6) {
            *a6 = v49;
          }
          else {
            _HKLogDroppedError();
          }
        }

        unsigned __int8 v121 = 0;
        int v42 = 1;
      }

      if (v42)
      {
LABEL_78:
        uint64_t v19 = 0;
LABEL_147:

        goto LABEL_148;
      }
    }
    id v56 = v11;
    v57 = [v56 dateByAddingTimeInterval:1814400.0];
    if (objc_msgSend(*(id *)(a1 + 40), "hk_isAfterOrEqualToDate:", v57))
    {
      _HKInitializeLogging();
      v58 = HKLogMedication();
      BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_INFO);

      if (v59)
      {
        v60 = HKLogMedication();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v123 = a1;
          _os_log_impl(&dword_1BD54A000, v60, OS_LOG_TYPE_INFO, "[%{public}@] Generation window already scheduled.", buf, 0xCu);
        }
      }
      unsigned __int8 v121 = 1;
      goto LABEL_146;
    }
    v61 = v57;
    id v62 = v26;
    id v63 = v56;
    if (objc_msgSend(*(id *)(a1 + 40), "hk_isAfterOrEqualToDate:", v56))
    {
      id v63 = *(id *)(a1 + 40);
    }
    v64 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    id v111 = 0;
    v106 = v63;
    v65 = -[HDMedicationNotificationManager _activeSchedulesFromDate:calendar:transaction:error:](a1, v63, v64, v12, (uint64_t)&v111);
    v102 = v65;
    id v104 = v111;
    if (!v65)
    {
      _HKInitializeLogging();
      v75 = HKLogMedication();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:]();
      }

      v76 = v104;
      id v77 = v104;
      id v26 = v62;
      v57 = v61;
      if (v77)
      {
        if (a6) {
          *a6 = v77;
        }
        else {
          _HKLogDroppedError();
        }
      }

      unsigned __int8 v121 = 0;
      goto LABEL_145;
    }
    if (![v65 count])
    {
      _HKInitializeLogging();
      v78 = HKLogMedication();
      BOOL v79 = os_log_type_enabled(v78, OS_LOG_TYPE_INFO);

      id v26 = v62;
      v57 = v61;
      if (v79)
      {
        v80 = HKLogMedication();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v123 = a1;
          _os_log_impl(&dword_1BD54A000, v80, OS_LOG_TYPE_INFO, "[%{public}@] No active schedules.", buf, 0xCu);
        }
      }
      unsigned __int8 v121 = 1;
      v76 = v104;
      goto LABEL_145;
    }
    id v110 = 0;
    v66 = -[HDMedicationNotificationManager _generateScheduleItemsWithSchedules:fromDate:endDate:calendar:error:](a1, v65, v106, v61, v64, (uint64_t)&v110);
    v98 = v66;
    id v100 = v110;
    if (!v66)
    {
      _HKInitializeLogging();
      v81 = HKLogMedication();
      id v26 = v62;
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:]();
      }

      id v82 = v100;
      v76 = v104;
      v57 = v61;
      if (v82)
      {
        if (a6) {
          *a6 = v82;
        }
        else {
          _HKLogDroppedError();
        }
      }

      unsigned __int8 v121 = 0;
      goto LABEL_144;
    }
    v97 = v64;
    uint64_t v67 = [v66 count];
    v68 = v66;
    id v26 = v62;
    if (!v67)
    {
      _HKInitializeLogging();
      v83 = HKLogMedication();
      BOOL v84 = os_log_type_enabled(v83, OS_LOG_TYPE_INFO);

      v57 = v61;
      if (v84)
      {
        v85 = HKLogMedication();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v123 = a1;
          _os_log_impl(&dword_1BD54A000, v85, OS_LOG_TYPE_INFO, "[%{public}@] No generated schedule items.", buf, 0xCu);
        }
      }
      unsigned __int8 v121 = 1;
      goto LABEL_143;
    }
    id v109 = 0;
    char v69 = -[HDMedicationNotificationManager _saveScheduleItems:notificationSentScheduleItems:transaction:error:](a1, v68, v25, v12, &v109);
    id v96 = v109;
    v57 = v61;
    if (v69)
    {
      v107 = 0;
      char v70 = -[HDMedicationNotificationManager _scheduleRestorableAlarmWithNextScheduleItemsTransaction:date:error:](a1, v12, v56, &v107);
      v71 = v107;
      char v94 = v70;
      if (v70)
      {
        id v72 = v57;
        v73 = *(NSObject **)(a1 + 40);
        *(void *)(a1 + 40) = v72;
        v74 = v96;
        v64 = v97;
LABEL_141:
        LOBYTE(a6) = v94;
        goto LABEL_142;
      }
      _HKInitializeLogging();
      v89 = HKLogMedication();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.4();
      }

      v90 = v71;
      v73 = v90;
      v74 = v96;
      v64 = v97;
      if (v90)
      {
        if (a6)
        {
          v73 = v90;
          *a6 = v73;
          v71 = v73;
          goto LABEL_141;
        }
        _HKLogDroppedError();
      }
      v71 = v73;
      goto LABEL_141;
    }
    _HKInitializeLogging();
    v86 = HKLogMedication();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.6();
    }

    id v108 = 0;
    BOOL v87 = -[HDMedicationNotificationManager _removeAllScheduleItemsNotSentWithTransaction:error:]((void *)a1, v12, (uint64_t)&v108);
    v95 = v108;
    v64 = v97;
    if (!v87)
    {
      _HKInitializeLogging();
      v91 = HKLogMedication();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationManager _scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:].cold.5();
      }

      v92 = v95;
      v73 = v92;
      if (v92)
      {
        v74 = v96;
        if (a6)
        {
          v73 = v92;
          *a6 = v73;
          LOBYTE(a6) = 0;
        }
        else
        {
          _HKLogDroppedError();
        }
        v71 = v73;
      }
      else
      {
        LOBYTE(a6) = 0;
        v71 = 0;
        v74 = v96;
      }
      goto LABEL_142;
    }
    v74 = v96;
    v88 = v96;
    v73 = v88;
    if (v88)
    {
      if (!a6)
      {
        _HKLogDroppedError();
        goto LABEL_138;
      }
      v73 = v88;
      *a6 = v73;
    }
    LOBYTE(a6) = 0;
LABEL_138:
    v71 = v95;
LABEL_142:

    unsigned __int8 v121 = a6;
LABEL_143:
    v76 = v104;
LABEL_144:

LABEL_145:
    id v56 = v106;
LABEL_146:

    uint64_t v19 = v121;
    goto LABEL_147;
  }
  uint64_t v19 = 1;
LABEL_148:

  return v19;
}

- (uint64_t)_schedulingIsEnabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    id WeakRetained = objc_loadWeakRetained((id *)(result + 8));
    v3 = [WeakRetained daemon];
    int v4 = [v3 behavior];
    int v5 = [v4 healthAppHiddenOrNotInstalled];

    if (v5)
    {
      _HKInitializeLogging();
      id v6 = HKLogMedication();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543362;
        uint64_t v8 = v1;
        _os_log_impl(&dword_1BD54A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling disabled. Health app is hidden or not installed.", (uint8_t *)&v7, 0xCu);
      }

      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (id)_removeDeliveredNotificationsLoggedAsTakenOrSkippedNotFromNotificationInterfaceWithError:(uint64_t)a1
{
  if (a1)
  {
    int v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
    id v13 = 0;
    int v5 = -[HDMedicationNotificationManager _takenOrSkippedAlarmIdentifiersSince:error:](a1, (uint64_t)v4, (uint64_t)&v13);
    id v6 = v13;
    int v7 = v6;
    if (v5)
    {
      if ([v5 count])
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        uint64_t v9 = [WeakRetained notificationManager];
        [v9 removeDeliveredNotificationsForScheduleItemIdentifiers:v5];
      }
      id v10 = v5;
    }
    else
    {
      id v11 = v6;
      if (v11)
      {
        if (a2) {
          *a2 = v11;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (uint64_t)_removeExpirationEventsForIdentifiers:(uint64_t)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [*(id *)(a1 + 32) allScheduledEventsWithError:a3];
    if ([v6 count])
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __79__HDMedicationNotificationManager__removeExpirationEventsForIdentifiers_error___block_invoke;
      v10[3] = &unk_1E63378C8;
      id v11 = v5;
      int v7 = objc_msgSend(v6, "hk_filter:", v10);
      uint64_t v8 = [*(id *)(a1 + 32) removeEvents:v7 error:a3];
    }
    else
    {
      uint64_t v8 = v6 != 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_notificationSentScheduleItemsWithTransaction:(uint64_t)a3 error:
{
  if (a1)
  {
    id v5 = a2;
    id v6 = -[HDMedicationNotificationManager _scheduleItemsSentPredicate](a1);
    int v7 = -[HDMedicationNotificationManager _scheduleItemsWithPredicate:transaction:error:]((uint64_t)a1, v6, v5, a3);
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

- (id)_pruneAllScheduleItemsBefore:(int)a3 createDoseEvents:(int)a4 excludeDoseEventCreationForGivenDate:(void *)a5 transaction:(void *)a6 error:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a5;
  if (a1)
  {
    _HKInitializeLogging();
    id v13 = HKLogMedication();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = HKStringFromBool();
      id v15 = HKStringFromBool();
      *(_DWORD *)buf = 138544130;
      id v34 = a1;
      __int16 v35 = 2114;
      id v36 = v11;
      __int16 v37 = 2114;
      v38 = v14;
      __int16 v39 = 2114;
      uint64_t v40 = v15;
      _os_log_impl(&dword_1BD54A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pruning all schedule items with transaction before date: %{public}@, createDoseEvents: %{public}@, excludeDoseEventCreationForGivenDate: %{public}@", buf, 0x2Au);
    }
    HDMedicationScheduleItemPredicateForScheduledDateTime(3);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v16;
    if (a4)
    {
      uint64_t v18 = [a1[6] currentCalendar];
      uint64_t v19 = [v18 startOfDayForDate:v11];
      id v17 = HDMedicationScheduleItemPredicateForScheduledDateTime(3);
    }
    id v32 = 0;
    int v20 = -[HDMedicationNotificationManager _scheduleItemsWithPredicate:transaction:error:]((uint64_t)a1, v17, v12, (uint64_t)&v32);
    id v21 = v32;
    if (v20)
    {
      if (![v20 count] || !a3)
      {
LABEL_11:
        if (+[HDMedicationScheduleItemEntity deleteMedicationScheduleItemsWithPredicate:v16 transaction:v12 error:a6])
        {
          id v25 = v20;
        }
        else
        {
          id v25 = 0;
        }
        id v26 = v25;
        goto LABEL_29;
      }
      id v31 = 0;
      char v22 = -[HDMedicationNotificationManager _saveNotInteractedDoseEventsForScheduleItems:transaction:error:](a1, v20, v12, (uint64_t)&v31);
      id v23 = v31;
      __int16 v24 = v23;
      if (v22)
      {

        goto LABEL_11;
      }
      _HKInitializeLogging();
      id v29 = HKLogMedication();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationManager _pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:]();
      }

      id v28 = v24;
      if (v28)
      {
        if (a6) {
          *a6 = v28;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v27 = HKLogMedication();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationManager _pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:]();
      }

      id v28 = v21;
      if (v28)
      {
        if (a6) {
          *a6 = v28;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }

    id v26 = 0;
LABEL_29:

    goto LABEL_30;
  }
  id v26 = 0;
LABEL_30:

  return v26;
}

- (uint64_t)_deleteNotInteractedAndNotLoggedDoseEventFor:(uint64_t)a3 transaction:(uint64_t)a4 error:
{
  v28[3] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v6 = *(void **)(a1 + 48);
  id v7 = a2;
  uint64_t v8 = [v6 currentCalendar];
  uint64_t v9 = [v8 startOfDayForDate:v7];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 duration:86400.0];
  id v11 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
  id v12 = HDSampleEntityPredicateForDateInterval();

  id v13 = HDMedicationDoseEventEntityPredicateForStatuses();
  uint64_t v14 = HDMedicationDoseEventEntityPredicateForLogOrigin();
  id v15 = (void *)MEMORY[0x1E4F65D08];
  v28[0] = v12;
  v28[1] = v13;
  v28[2] = v14;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  id v17 = [v15 predicateMatchingAllPredicates:v16];

  uint64_t v23 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  uint64_t v19 = [WeakRetained dataManager];
  uint64_t v20 = [v19 deleteDataObjectsOfClass:objc_opt_class() predicate:v17 limit:*MEMORY[0x1E4F65DE0] deletedSampleCount:&v23 notifyObservers:1 generateDeletedObjects:1 recursiveDeleteAuthorizationBlock:0 error:a4];

  _HKInitializeLogging();
  id v21 = HKLogMedication();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = a1;
    __int16 v26 = 2048;
    uint64_t v27 = v23;
    _os_log_impl(&dword_1BD54A000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %ld 'not interacted' and 'not logged' dose events", buf, 0x16u);
  }

  return v20;
}

- (BOOL)_removeAllScheduleItemsWithTransaction:(uint64_t)a3 error:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v5 = a2;
  _HKInitializeLogging();
  id v6 = HKLogMedication();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    uint64_t v10 = a1;
    _os_log_impl(&dword_1BD54A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all schedule items with transaction", (uint8_t *)&v9, 0xCu);
  }

  BOOL v7 = +[HDMedicationScheduleItemEntity deleteMedicationScheduleItemsWithPredicate:0 transaction:v5 error:a3];
  return v7;
}

- (id)_expirationEventsToRemoveAtDate:(uint64_t)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = [a1[4] allScheduledEventsWithError:a3];
    if (v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __73__HDMedicationNotificationManager__expirationEventsToRemoveAtDate_error___block_invoke;
      v8[3] = &unk_1E63378A0;
      id v9 = v5;
      objc_msgSend(v6, "hk_map:", v8);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (id)_activeSchedulesFromDate:(void *)a3 calendar:(void *)a4 transaction:(uint64_t)a5 error:
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  v48 = v8;
  if (a1)
  {
    id v9 = v8;
    id v10 = a4;
    uint64_t v11 = [a3 startOfDayForDate:v9];
    id v12 = [v9 dateByAddingTimeInterval:1814400.0];
    uint64_t v13 = HDMedicationSchedulePredicateForStartDateTime(3);

    v46 = (void *)v11;
    uint64_t v14 = HDMedicationSchedulePredicateForEndDateTime(6);
    id v15 = (void *)MEMORY[0x1E4F65D08];
    v60[0] = v13;
    v60[1] = v14;
    v44 = (void *)v14;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
    uint64_t v17 = [v15 predicateMatchingAllPredicates:v16];

    uint64_t v18 = HDMedicationSchedulePredicateForNilEndDateTime();
    uint64_t v19 = (void *)MEMORY[0x1E4F65D08];
    id v45 = (void *)v13;
    v59[0] = v13;
    v59[1] = v18;
    int v42 = (void *)v18;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    uint64_t v21 = [v19 predicateMatchingAllPredicates:v20];

    uint64_t v22 = +[HDMedicationScheduleEntity availableSchedulePredicate];
    uint64_t v23 = (void *)MEMORY[0x1E4F65D08];
    v43 = (void *)v17;
    v58[0] = v17;
    v58[1] = v21;
    uint64_t v41 = (void *)v21;
    __int16 v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
    uint64_t v25 = [v23 predicateMatchingAnyPredicates:v24];

    __int16 v26 = [MEMORY[0x1E4F65D10] doesNotContainPredicateWithProperty:@"schedule_type" values:&unk_1F17FC660];
    uint64_t v27 = HDMedicationSchedulePredicateForActiveMedications();
    id v28 = (void *)MEMORY[0x1E4F65D08];
    uint64_t v40 = (void *)v22;
    v57[0] = v22;
    v57[1] = v26;
    v57[2] = v25;
    v57[3] = v27;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:4];
    uint64_t v30 = [v28 predicateMatchingAllPredicates:v29];

    uint64_t v31 = a1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    BOOL v33 = [WeakRetained healthMedicationsProfileExtension];
    id v34 = [v33 medicationScheduleManager];

    __int16 v35 = [v34 medicationSchedulesWithPredicate:v30 transaction:v10 error:a5];

    _HKInitializeLogging();
    id v36 = HKLogMedication();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
      v38 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138544130;
      uint64_t v50 = v31;
      __int16 v51 = 2114;
      v52 = v48;
      __int16 v53 = 2114;
      v54 = v37;
      __int16 v55 = 2114;
      id v56 = v38;
      _os_log_impl(&dword_1BD54A000, v36, OS_LOG_TYPE_DEFAULT, "[%{public}@] Active schedules from date: %{public}@, %{public}@ active schedules: %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    __int16 v35 = 0;
  }

  return v35;
}

- (id)_generateScheduleItemsWithSchedules:(void *)a3 fromDate:(void *)a4 endDate:(void *)a5 calendar:(uint64_t)a6 error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  if (a1)
  {
    id v12 = a5;
    id v13 = a4;
    id v14 = a3;
    id v15 = [[HDNotificationEngineConfiguration alloc] initWithCalendar:v12 startGenerationDate:v14 endGenerationDate:v13];

    id v16 = +[HDMedicationNotificationEngine generateForSchedules:v11 configuration:v15 error:a6];
    _HKInitializeLogging();
    uint64_t v17 = HKLogMedication();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
      uint64_t v19 = HKSensitiveLogItem();
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      uint64_t v21 = HKSensitiveLogItem();
      int v23 = 138544386;
      uint64_t v24 = a1;
      __int16 v25 = 2114;
      __int16 v26 = v18;
      __int16 v27 = 2114;
      id v28 = v19;
      __int16 v29 = 2114;
      uint64_t v30 = v20;
      __int16 v31 = 2114;
      id v32 = v21;
      _os_log_impl(&dword_1BD54A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Generated %{public}@ schedule items: %{public}@, for %{public}@ schedules: %{public}@", (uint8_t *)&v23, 0x34u);
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (uint64_t)_saveScheduleItems:(void *)a3 notificationSentScheduleItems:(void *)a4 transaction:(void *)a5 error:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v36 = a3;
  id v10 = a4;
  if (a1)
  {
    _HKInitializeLogging();
    id v11 = HKLogMedication();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      id v13 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543874;
      uint64_t v46 = a1;
      __int16 v47 = 2114;
      v48 = v12;
      __int16 v49 = 2114;
      uint64_t v50 = v13;
      _os_log_impl(&dword_1BD54A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving %{public}@ schedule items with transaction: %{public}@", buf, 0x20u);
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v9;
    uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v33 = a1;
      id v34 = a5;
      id v35 = v9;
      uint64_t v16 = *(void *)v41;
      uint64_t v17 = v36;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __102__HDMedicationNotificationManager__saveScheduleItems_notificationSentScheduleItems_transaction_error___block_invoke;
          v39[3] = &unk_1E63377C0;
          v39[4] = v19;
          uint64_t v20 = objc_msgSend(v17, "hk_firstObjectPassingTest:", v39);
          id v21 = v19;
          if (v20 && [v20 notificationSent])
          {
            id v22 = objc_alloc(MEMORY[0x1E4F66B50]);
            int v23 = [v21 scheduledDateTime];
            uint64_t v24 = [v21 doses];
            uint64_t v25 = [v22 initWithScheduledDateTime:v23 notificationSent:1 doses:v24];

            uint64_t v17 = v36;
            id v21 = (id)v25;
          }
          id v38 = 0;
          __int16 v26 = +[HDMedicationScheduleItemEntity insertMedicationScheduleItem:v21 transaction:v10 error:&v38];
          id v27 = v38;

          if (!v26)
          {
            _HKInitializeLogging();
            __int16 v29 = HKLogMedication();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              -[HDMedicationNotificationManager _saveScheduleItems:notificationSentScheduleItems:transaction:error:](v33, (uint64_t)v27, v29);
            }

            id v30 = v27;
            __int16 v31 = v30;
            if (v30)
            {
              if (v34) {
                *id v34 = v30;
              }
              else {
                _HKLogDroppedError();
              }
            }

            uint64_t v28 = 0;
            goto LABEL_24;
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      uint64_t v28 = 1;
LABEL_24:
      id v9 = v35;
    }
    else
    {
      uint64_t v28 = 1;
    }
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

- (BOOL)_removeAllScheduleItemsNotSentWithTransaction:(uint64_t)a3 error:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v5 = a2;
  _HKInitializeLogging();
  id v6 = HKLogMedication();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = a1;
    _os_log_impl(&dword_1BD54A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all not sent schedule items with transaction", (uint8_t *)&v10, 0xCu);
  }

  BOOL v7 = -[HDMedicationNotificationManager _scheduleItemsNotSentPredicate](a1);
  BOOL v8 = +[HDMedicationScheduleItemEntity deleteMedicationScheduleItemsWithPredicate:v7 transaction:v5 error:a3];

  return v8;
}

- (uint64_t)_scheduleRestorableAlarmWithNextScheduleItemsTransaction:(void *)a3 date:(NSObject *)a4 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a1)
  {
    uint64_t v20 = 0;
    goto LABEL_32;
  }
  id v8 = a2;
  _HKInitializeLogging();
  id v9 = HKLogMedication();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = a1;
    _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling restorable alarms with next schedule items", buf, 0xCu);
  }

  id v29 = 0;
  id v30 = 0;
  int v10 = -[HDMedicationNotificationManager _nextScheduleItemsWithTransaction:date:snoozeFireDates:error:](a1, v8, v7, &v30, (uint64_t)&v29);

  id v11 = v30;
  id v12 = v29;
  if (!v10)
  {
    _HKInitializeLogging();
    int v23 = HKLogMedication();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationNotificationManager _scheduleRestorableAlarmWithNextScheduleItemsTransaction:date:error:]();
    }

    uint64_t v24 = v12;
    id v21 = v24;
    if (v24)
    {
      if (a4)
      {
        id v21 = v24;
        uint64_t v20 = 0;
        *a4 = v21;
LABEL_30:

        goto LABEL_31;
      }
      _HKLogDroppedError();
    }
    uint64_t v20 = 0;
    goto LABEL_30;
  }
  if ([v10 count])
  {
    if ([v11 count])
    {
      _HKInitializeLogging();
      id v13 = HKLogMedication();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

      if (v14)
      {
        uint64_t v15 = HKLogMedication();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
          *(_DWORD *)buf = 138543618;
          uint64_t v32 = a1;
          __int16 v33 = 2114;
          id v34 = v16;
          _os_log_impl(&dword_1BD54A000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Snoozed %{public}@ notification with identifiers, removing from Notifications Center", buf, 0x16u);
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      uint64_t v18 = [WeakRetained notificationManager];
      uint64_t v19 = [v11 allKeys];
      [v18 removeDeliveredNotificationsForScheduleItemIdentifiers:v19];
    }
    id v28 = 0;
    uint64_t v20 = -[HDMedicationNotificationManager _scheduleRestorableAlarmWithItems:date:snoozeFireDates:error:](a1, v10, v7, v11, (uint64_t)&v28);
    id v21 = v28;
    if ((v20 & 1) == 0)
    {
      _HKInitializeLogging();
      id v22 = HKLogMedication();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationManager _scheduleRestorableAlarmWithNextScheduleItemsTransaction:date:error:]();
      }

      id v21 = v21;
      if (v21)
      {
        if (a4) {
          *a4 = v21;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    goto LABEL_30;
  }
  _HKInitializeLogging();
  uint64_t v25 = HKLogMedication();
  uint64_t v20 = 1;
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);

  if (v26)
  {
    id v21 = HKLogMedication();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = a1;
      _os_log_impl(&dword_1BD54A000, v21, OS_LOG_TYPE_INFO, "[%{public}@] Cannot add next alarm. There are no more schedule items.", buf, 0xCu);
    }
    goto LABEL_30;
  }
LABEL_31:

LABEL_32:
  return v20;
}

- (void)_queue_alarm:(id)a3 didReceiveDueEvents:(id)a4 date:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v11 = HKLogMedication();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    *(_DWORD *)buf = 138543874;
    id v62 = self;
    __int16 v63 = 2114;
    id v64 = v12;
    __int16 v65 = 2114;
    id v66 = v9;
    _os_log_impl(&dword_1BD54A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received %{public}@ due events: %{public}@", buf, 0x20u);
  }
  if (-[HDMedicationNotificationManager _notificationIsEnabled]((uint64_t)self))
  {
    id v46 = v10;
    id v47 = v9;
    -[HDMedicationNotificationManager _alarm:filterDueEventsToHandle:date:]((uint64_t)self, v8, v9, v10);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v51 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (!v51) {
      goto LABEL_34;
    }
    id location = (id *)&self->_profile;
    uint64_t v49 = *(void *)v57;
    uint64_t v50 = v8;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v57 != v49) {
          objc_enumerationMutation(obj);
        }
        BOOL v14 = *(void **)(*((void *)&v56 + 1) + 8 * v13);
        _HKInitializeLogging();
        uint64_t v15 = HKLogMedication();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = (HDMedicationNotificationManager *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          id v62 = v16;
          __int16 v63 = 2114;
          id v64 = v14;
          uint64_t v17 = v16;
          _os_log_impl(&dword_1BD54A000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling due event: %{public}@", buf, 0x16u);
        }
        uint64_t v18 = [v14 eventIdentifier];
        uint64_t v19 = [v14 scheduleItemIdentifier];
        char v20 = [v19 isEqualToString:v18];

        if (v20)
        {
          uint64_t v21 = 0;
LABEL_18:
          uint64_t v22 = 0;
          goto LABEL_19;
        }
        uint64_t v21 = [v14 isFollowUpNotificationEvent];
        uint64_t v22 = [v14 isCriticalNotificationEvent];
        id WeakRetained = objc_loadWeakRetained(location);
        uint64_t v24 = [WeakRetained notificationManager];
        char v25 = [v24 areHealthCriticalAlertsAuthorized];

        if (v22 && (v25 & 1) == 0)
        {
          _HKInitializeLogging();
          BOOL v26 = HKLogMedication();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = HKSensitiveLogItem();
            *(_DWORD *)buf = 138543618;
            id v62 = self;
            __int16 v63 = 2114;
            id v64 = v27;
            _os_log_impl(&dword_1BD54A000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Critical alerts are unauthorized for a critical due event: %{public}@. Falling back to time-sensitive", buf, 0x16u);
          }
          goto LABEL_18;
        }
LABEL_19:
        uint64_t v28 = objc_msgSend(v14, "clientOptions", v46, v47) & 1;
        id v29 = (void *)MEMORY[0x1E4F66BB0];
        id v30 = [v14 scheduleItemIdentifier];
        __int16 v31 = [v14 dueDate];
        uint64_t v32 = [v29 notificationNotMissedWithScheduleItemIdentifier:v30 dueDate:v31 isBatchingDoses:v28 isCritical:v22 isFollowUp:v21];

        if (v32)
        {
          __int16 v33 = objc_msgSend(MEMORY[0x1E4F44628], "hkmd_requestForNotification:", v32);
          _HKInitializeLogging();
          id v34 = HKLogMedication();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v62 = self;
            __int16 v63 = 2114;
            id v64 = v33;
            _os_log_impl(&dword_1BD54A000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] Posting notification with request: %{public}@", buf, 0x16u);
          }

          id v35 = objc_loadWeakRetained(location);
          id v36 = [v35 notificationManager];
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __73__HDMedicationNotificationManager__queue_alarm_didReceiveDueEvents_date___block_invoke;
          v54[3] = &unk_1E6337758;
          v54[4] = self;
          id v55 = v18;
          [v36 postNotificationWithRequest:v33 completion:v54];

          id v37 = objc_loadWeakRetained(location);
          id v38 = [v37 healthMedicationsProfileExtension];
          __int16 v39 = [v38 medicationScheduleManager];

          if (v21)
          {
            id v40 = 0;
          }
          else
          {
            long long v42 = [v14 scheduleItemIdentifier];
            id v53 = 0;
            char v43 = [v39 updateNotificationSent:1 scheduleItemIdentifier:v42 error:&v53];
            id v40 = v53;

            if ((v43 & 1) == 0)
            {
              _HKInitializeLogging();
              v44 = HKLogMedication();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                id v62 = self;
                __int16 v63 = 2114;
                id v64 = v40;
                _os_log_error_impl(&dword_1BD54A000, v44, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to update notification sent to YES: %{public}@", buf, 0x16u);
              }
            }
          }
          id v8 = v50;
          -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvent:]((uint64_t)self, v50, v14);
        }
        else
        {
          _HKInitializeLogging();
          long long v41 = HKLogMedication();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v62 = self;
            __int16 v63 = 2114;
            id v64 = v18;
            _os_log_error_impl(&dword_1BD54A000, v41, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to make the notification object for due item identifier: %{public}@", buf, 0x16u);
          }

          id v8 = v50;
          -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvent:]((uint64_t)self, v50, v14);
        }

        ++v13;
      }
      while (v51 != v13);
      uint64_t v51 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (!v51)
      {
LABEL_34:

        id v10 = v46;
        id v9 = v47;
        goto LABEL_38;
      }
    }
  }
  _HKInitializeLogging();
  id v45 = HKLogMedication();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v62 = self;
    _os_log_impl(&dword_1BD54A000, v45, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifications are disabled. Removing alarmEvents.", buf, 0xCu);
  }

  -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvents:]((uint64_t)self, v8, v9);
LABEL_38:
}

- (uint64_t)_notificationIsEnabled
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if ((-[HDMedicationNotificationManager _schedulingIsEnabled](result) & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v2 = HKLogMedication();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 138543362;
        uint64_t v5 = v1;
        v3 = "[%{public}@] Notification disabled. Scheduling is disabled.";
        goto LABEL_8;
      }
LABEL_9:

      return 0;
    }
    if (-[HDMedicationNotificationManager _doseReminderSettingIsDisabled](v1))
    {
      _HKInitializeLogging();
      uint64_t v2 = HKLogMedication();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 138543362;
        uint64_t v5 = v1;
        v3 = "[%{public}@] Notification disabled. Dose reminder is toggled off.";
LABEL_8:
        _os_log_impl(&dword_1BD54A000, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v4, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    return 1;
  }
  return result;
}

- (void)_alarm:(void *)a3 confirmDeliveryByRemovingEvents:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    id v10 = 0;
    int v6 = [a2 removeEvents:v5 error:&v10];
    id v7 = v10;
    _HKInitializeLogging();
    id v8 = HKLogMedication();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v12 = a1;
        __int16 v13 = 2114;
        id v14 = v5;
        _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removed event: %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = a1;
      __int16 v13 = 2114;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_error_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to confirm delivery by removing event for client identifier: %{public}@, error: %{public}@", buf, 0x20u);
    }
  }
}

- (id)_alarm:(void *)a3 filterDueEventsToHandle:(void *)a4 date:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v32 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!a1)
  {
    id v9 = 0;
    id v27 = v32;
    goto LABEL_22;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v30 = v7;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (!v12) {
    goto LABEL_17;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v35;
  id v33 = v9;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v35 != v14) {
        objc_enumerationMutation(v11);
      }
      id v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if (-[HDMedicationNotificationManager _isDueEventExpired:fromDate:](a1, v16, v8))
      {
        _HKInitializeLogging();
        uint64_t v17 = HKLogMedication();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          __int16 v39 = v18;
          __int16 v40 = 2114;
          long long v41 = v16;
          id v19 = v18;
          char v20 = v17;
          uint64_t v21 = "[%{public}@] Stale event. Removing alarmEvent: %{public}@";
LABEL_13:
          _os_log_impl(&dword_1BD54A000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);

          id v9 = v33;
        }
      }
      else
      {
        int v22 = -[HDMedicationNotificationManager _isDueEventOnHold:](a1, v16);
        int v23 = v9;
        if (!v22) {
          goto LABEL_15;
        }
        _HKInitializeLogging();
        uint64_t v17 = HKLogMedication();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          __int16 v39 = v24;
          __int16 v40 = 2114;
          long long v41 = v16;
          id v19 = v24;
          char v20 = v17;
          uint64_t v21 = "[%{public}@] Due event is on-hold: %{public}@";
          goto LABEL_13;
        }
      }

      int v23 = v10;
LABEL_15:
      objc_msgSend(v23, "addObject:", v16, v30);
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v42 count:16];
  }
  while (v13);
LABEL_17:

  [v9 sortUsingComparator:&__block_literal_global_329];
  if ((unint64_t)[v9 count] >= 3)
  {
    char v25 = objc_msgSend(v9, "subarrayWithRange:", 0, (unint64_t)((double)(unint64_t)objc_msgSend(v9, "count") + -2.0));
    [v10 addObjectsFromArray:v25];
    uint64_t v26 = objc_msgSend(v9, "hk_mutableSubarrayWithRange:", (unint64_t)((double)(unint64_t)objc_msgSend(v9, "count") + -2.0), 2);

    id v9 = (id)v26;
  }
  id v27 = v32;
  uint64_t v28 = objc_msgSend(v10, "count", v30);
  id v7 = v31;
  if (v28) {
    -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvents:](a1, v32, v10);
  }

LABEL_22:
  return v9;
}

- (void)_alarm:(void *)a3 confirmDeliveryByRemovingEvent:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v9[0] = a3;
    id v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a3;
    id v7 = a2;
    id v8 = [v5 arrayWithObjects:v9 count:1];

    -[HDMedicationNotificationManager _alarm:confirmDeliveryByRemovingEvents:](a1, v7, v8);
  }
}

void __73__HDMedicationNotificationManager__queue_alarm_didReceiveDueEvents_date___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogMedication();
  id WeakRetained = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v14 = 138543618;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1BD54A000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did successfully post notification for due item: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    id v10 = (void *)MEMORY[0x1E4F66B18];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v11 = [WeakRetained notificationManager];
    uint64_t v12 = [v11 areHealthNotificationsAuthorized];
    id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v10 submitNotificationSentMetricWithHealthNotificationsAuthorizedStatus:v12 dataSource:v13];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __73__HDMedicationNotificationManager__queue_alarm_didReceiveDueEvents_date___block_invoke_cold_1(a1, (uint64_t)v5, WeakRetained);
  }
}

uint64_t __78__HDMedicationNotificationManager__queue_alarm_didReceiveDueExpirationEvents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 scheduleItemIdentifier];
}

- (uint64_t)_isDueEventExpired:(void *)a3 fromDate:
{
  if (result)
  {
    id v4 = a3;
    id v5 = [a2 dueDate];
    id v6 = [v5 dateByAddingTimeInterval:43200.0];

    uint64_t v7 = objc_msgSend(v6, "hk_isBeforeOrEqualToDate:", v4);
    return v7;
  }
  return result;
}

- (uint64_t)_isDueEventOnHold:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    id v5 = [WeakRetained healthMedicationsProfileExtension];
    id v6 = [v5 medicationNotificationSyncManager];

    uint64_t v7 = [v3 scheduleItemIdentifier];

    id v12 = 0;
    uint64_t v8 = [v6 isScheduleItemOnHold:v7 errorOut:&v12];
    id v9 = v12;

    if (v8)
    {
      if (v8 != 2)
      {
        uint64_t v2 = 1;
LABEL_9:

        return v2;
      }
    }
    else
    {
      _HKInitializeLogging();
      id v10 = HKLogMedication();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationNotificationManager _isDueEventOnHold:]();
      }
    }
    uint64_t v2 = 0;
    goto LABEL_9;
  }
  return v2;
}

uint64_t __71__HDMedicationNotificationManager__alarm_filterDueEventsToHandle_date___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 dueDate];
  id v6 = [v4 dueDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_scheduleItemsNotSentPredicate
{
  if (a1)
  {
    a1 = HDMedicationScheduleItemPredicateForNotificationSent(MEMORY[0x1E4F1CC28], 1);
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t __102__HDMedicationNotificationManager__saveScheduleItems_notificationSentScheduleItems_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)_scheduleItemsSentPredicate
{
  if (a1)
  {
    a1 = HDMedicationScheduleItemPredicateForNotificationSent(MEMORY[0x1E4F1CC38], 1);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_nextScheduleItemsWithTransaction:(void *)a3 date:(void *)a4 snoozeFireDates:(uint64_t)a5 error:
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"scheduled_date_time" entityClass:objc_opt_class() ascending:1];
    id v12 = v8;
    id v13 = -[HDMedicationNotificationManager _takenOrSkippedItemDoseIdentifiersNearDate:error:](a1, v12, a5);
    id v27 = (void *)v11;
    if (v13)
    {
      v39[0] = v11;
      int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
      id v29 = v13;
      id v25 = v9;
      id v15 = v9;
      id v30 = v15;
      id v31 = v12;
      id v24 = v10;
      id v16 = v10;
      id v32 = v16;
      BOOL v17 = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:](HDMedicationScheduleItemEntity, "enumerateItemsWithPredicate:orderingTerms:transaction:error:enumerationHandler:", 0, v14);

      if (a4) {
        *a4 = v16;
      }
      _HKInitializeLogging();
      uint64_t v18 = HKLogMedication();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        char v20 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        uint64_t v34 = a1;
        __int16 v35 = 2114;
        long long v36 = v19;
        __int16 v37 = 2114;
        id v38 = v20;
        _os_log_impl(&dword_1BD54A000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Next %{public}@ schedule items: %{public}@", buf, 0x20u);
      }
      uint64_t v21 = v28;
      if (v17)
      {
        int v22 = [MEMORY[0x1E4F1C978] arrayWithArray:v15];
      }
      else
      {
        int v22 = 0;
      }
      id v9 = v25;
      id v10 = v24;
    }
    else
    {
      int v22 = 0;
      uint64_t v21 = v28;
    }
  }
  else
  {
    int v22 = 0;
    uint64_t v21 = v28;
  }

  return v22;
}

- (id)_takenOrSkippedItemDoseIdentifiersNearDate:(uint64_t)a3 error:
{
  id v3 = (id)a1;
  if (a1)
  {
    id v4 = -[HDMedicationNotificationManager _takenOrSkippedDoseEventsNearDate:error:](a1, a2, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__HDMedicationNotificationManager__takenOrSkippedItemDoseIdentifiersNearDate_error___block_invoke;
    v6[3] = &unk_1E6337830;
    v6[4] = v3;
    objc_msgSend(v4, "hk_mapToSet:", v6);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

uint64_t __96__HDMedicationNotificationManager__nextScheduleItemsWithTransaction_date_snoozeFireDates_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((-[HDMedicationNotificationManager _takenOrSkippedItemDoseIdentifiers:containsAllItemDoseIdentifiersForItem:](*(void *)(a1 + 32), *(void **)(a1 + 40), v3) & 1) == 0)
  {
    [*(id *)(a1 + 48) addObject:v3];
    uint64_t v4 = *(void *)(a1 + 32);
    id v23 = 0;
    id v24 = 0;
    BOOL v5 = -[HDMedicationNotificationManager _snoozedDoseEventDate:forScheduleItem:error:](v4, &v24, v3, &v23);
    id v6 = v24;
    id v7 = v23;
    if (v5)
    {
      if (v6)
      {
        [*(id *)(a1 + 32) _snoozeDuration];
        id v8 = objc_msgSend(v6, "dateByAddingTimeInterval:");
        if (([v8 hk_isAfterOrEqualToDate:*(void *)(a1 + 56)] & 1) == 0
          && !HDIsUnitTesting())
        {
          goto LABEL_16;
        }
        id v9 = *(void **)(a1 + 64);
        id v10 = [v3 identifier];
        [v9 setObject:v8 forKeyedSubscript:v10];

        _HKInitializeLogging();
        uint64_t v11 = HKLogMedication();
        LODWORD(v10) = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

        if (!v10) {
          goto LABEL_16;
        }
        id v12 = HKLogMedication();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = *(void *)(a1 + 32);
          int v14 = [v3 identifier];
          id v15 = HKSensitiveLogItem();
          id v16 = HKSensitiveLogItem();
          *(_DWORD *)buf = 138543874;
          uint64_t v26 = v13;
          __int16 v27 = 2114;
          id v28 = v15;
          __int16 v29 = 2114;
          id v30 = v16;
          _os_log_impl(&dword_1BD54A000, v12, OS_LOG_TYPE_INFO, "[%{public}@] Will add alarm for snoozed item identifier: %{public}@ snoozeFireDate: %{public}@", buf, 0x20u);
        }
        goto LABEL_15;
      }
      _HKInitializeLogging();
      id v19 = HKLogMedication();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);

      if (!v20)
      {
LABEL_17:

        goto LABEL_18;
      }
      id v8 = HKLogMedication();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        uint64_t v18 = [v3 identifier];
        id v12 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v21;
        __int16 v27 = 2114;
        id v28 = v12;
        _os_log_impl(&dword_1BD54A000, v8, OS_LOG_TYPE_INFO, "[%{public}@] No snooze dose event found for item identifier: %{public}@", buf, 0x16u);
        goto LABEL_14;
      }
    }
    else
    {
      _HKInitializeLogging();
      id v8 = HKLogMedication();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = [v3 identifier];
        id v12 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        uint64_t v26 = v17;
        __int16 v27 = 2114;
        id v28 = v12;
        __int16 v29 = 2114;
        id v30 = v7;
        _os_log_error_impl(&dword_1BD54A000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to query snoozed date for item identifier: %{public}@ error: %{public}@", buf, 0x20u);
LABEL_14:

LABEL_15:
      }
    }
LABEL_16:

    goto LABEL_17;
  }
LABEL_18:

  return 1;
}

- (uint64_t)_takenOrSkippedItemDoseIdentifiers:(void *)a3 containsAllItemDoseIdentifiersForItem:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    id v8 = [v6 doses];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __108__HDMedicationNotificationManager__takenOrSkippedItemDoseIdentifiers_containsAllItemDoseIdentifiersForItem___block_invoke;
    v10[3] = &unk_1E6337878;
    id v11 = v5;
    uint64_t v12 = a1;
    id v13 = v7;
    a1 = objc_msgSend(v8, "hk_allObjectsPassTest:", v10);
  }
  return a1;
}

- (BOOL)_snoozedDoseEventDate:(void *)a3 forScheduleItem:(void *)a4 error:
{
  if (!a1) {
    return 0;
  }
  id v7 = a3;
  id v8 = [v7 doses];
  id v9 = objc_msgSend(v8, "hk_map:", &__block_literal_global_351);

  id v10 = [v7 identifier];

  id v16 = 0;
  id v11 = -[HDMedicationNotificationManager _snoozedDoseEventWithScheduleItemIdentifier:medicationIdentifiers:error:](a1, (uint64_t)v10, v9, (uint64_t)&v16);
  id v12 = v16;

  if (v11)
  {
    if (a2)
    {
      *a2 = [v11 endDate];
    }
    BOOL v13 = 1;
  }
  else
  {
    id v14 = v12;
    BOOL v13 = v14 == 0;
    if (v14)
    {
      if (a4) {
        *a4 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v13;
}

uint64_t __79__HDMedicationNotificationManager__snoozedDoseEventDate_forScheduleItem_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 medicationIdentifier];
}

- (id)_snoozedDoseEventWithScheduleItemIdentifier:(void *)a3 medicationIdentifiers:(uint64_t)a4 error:
{
  v20[5] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v6 = a3;
    id v7 = HDMedicationDoseEventEntityPredicateForScheduleItemIdentifier();
    id v8 = HDMedicationDoseEventEntityPredicateForMedicationIdentifiers();

    id v9 = HDMedicationDoseEventEntityPredicateForStatus();
    id v10 = HDMedicationDoseEventEntityPredicateForStatus();
    id v11 = HDMedicationDoseEventEntityPredicateForStatus();
    id v12 = (void *)MEMORY[0x1E4F65D08];
    v20[0] = v7;
    v20[1] = v8;
    v20[2] = v9;
    v20[3] = v10;
    v20[4] = v11;
    BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];
    id v14 = [v12 predicateMatchingAllPredicates:v13];

    id v15 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
    id v16 = (void *)MEMORY[0x1E4F65B48];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v18 = [v16 mostRecentSampleWithType:v15 profile:WeakRetained encodingOptions:0 predicate:v14 anchor:0 error:a4];
  }
  else
  {
    uint64_t v18 = 0;
  }
  return v18;
}

- (id)_takenOrSkippedDoseEventsNearDate:(uint64_t)a3 error:
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = a2;
    id v6 = [v5 dateByAddingTimeInterval:-86400.0];
    id v7 = HDSampleEntityPredicateForEndDate();

    id v8 = [v5 dateByAddingTimeInterval:86400.0];

    id v9 = HDSampleEntityPredicateForEndDate();

    id v10 = (void *)MEMORY[0x1E4F65D08];
    v23[0] = v7;
    v23[1] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v12 = [v10 predicateMatchingAllPredicates:v11];

    BOOL v13 = HDMedicationDoseEventEntityPredicateForStatuses();
    id v14 = (void *)MEMORY[0x1E4F65D08];
    v22[0] = v12;
    v22[1] = v13;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    id v16 = [v14 predicateMatchingAllPredicates:v15];

    uint64_t v17 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
    uint64_t v18 = (void *)MEMORY[0x1E4F65B48];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    BOOL v20 = [v18 samplesWithType:v17 profile:WeakRetained encodingOptions:0 predicate:v16 limit:0 anchor:0 error:a3];
  }
  else
  {
    BOOL v20 = 0;
  }
  return v20;
}

id __84__HDMedicationNotificationManager__takenOrSkippedItemDoseIdentifiersNearDate_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 scheduleItemIdentifier];
  id v5 = [v3 medicationIdentifier];

  id v6 = -[HDMedicationNotificationManager _uniqueDoseIdentifierFromItemIdentifier:medicationidentifier:](v2, (uint64_t)v4, (uint64_t)v5);

  return v6;
}

- (id)_uniqueDoseIdentifierFromItemIdentifier:(uint64_t)a3 medicationidentifier:
{
  if (a1)
  {
    a1 = [NSString stringWithFormat:@"%@%@", a2, a3];
    uint64_t v3 = vars8;
  }
  return a1;
}

uint64_t __108__HDMedicationNotificationManager__takenOrSkippedItemDoseIdentifiers_containsAllItemDoseIdentifiersForItem___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v4 = (void *)a1[6];
  id v5 = a2;
  id v6 = [v4 identifier];
  id v7 = [v5 medicationIdentifier];

  id v8 = -[HDMedicationNotificationManager _uniqueDoseIdentifierFromItemIdentifier:medicationidentifier:](v3, (uint64_t)v6, (uint64_t)v7);
  uint64_t v9 = [v2 containsObject:v8];

  return v9;
}

id __73__HDMedicationNotificationManager__expirationEventsToRemoveAtDate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 dueDate];
  id v5 = [v4 dateByAddingTimeInterval:-43200.0];
  LODWORD(a1) = objc_msgSend(v5, "hk_isAfterDate:", *(void *)(a1 + 32));

  if (a1) {
    id v6 = v3;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (uint64_t)_scheduleRestorableAlarmWithItems:(void *)a3 date:(void *)a4 snoozeFireDates:(uint64_t)a5 error:
{
  uint64_t v45 = a5;
  id v54 = a2;
  id v8 = a3;
  uint64_t v9 = (id *)a1;
  id v53 = v8;
  id v48 = a4;
  if (a1)
  {
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v54, "count"));
    int v50 = -[HDMedicationNotificationManager _followUpNotificationsEnabled](a1);
    uint64_t v49 = (id *)a1;
    if ([v54 count])
    {
      uint64_t v10 = 0;
      while (1)
      {
        id v11 = objc_msgSend(v54, "objectAtIndexedSubscript:", v10, v45);
        id v12 = [v11 scheduledDateTime];
        [v9 _followUpDuration];
        BOOL v13 = objc_msgSend(v12, "dateByAddingTimeInterval:");
        id v14 = [v11 identifier];
        id v15 = [v48 objectForKeyedSubscript:v14];

        id v16 = [v11 doses];
        uint64_t v17 = objc_msgSend(v16, "hk_mapToSet:", &__block_literal_global_365);
        uint64_t v51 = [v17 count];

        int v18 = objc_msgSend(v12, "hk_isAfterOrEqualToDate:", v53);
        v52 = v15;
        if (!v18) {
          break;
        }
        char v19 = [v11 notificationSent];
        if (v15) {
          goto LABEL_9;
        }
        uint64_t v9 = v49;
        if (v19)
        {
          char v20 = 0;
          id v55 = v12;
LABEL_18:
          id v29 = v9[4];
          id v30 = [v11 identifier];
          uint64_t v31 = [v12 dateByAddingTimeInterval:43200.0];
          id v32 = [v29 medicationExpirationEventWithScheduleItemIdentifier:v30 dueDate:v31];

          [v46 addObject:v32];
          goto LABEL_19;
        }
        id v27 = v12;
LABEL_17:
        id v55 = v27;
        id v28 = objc_msgSend(v9[3], "medicationNotificationEventWithScheduleItem:dueDate:isFollowUp:isCritical:medicationsCount:", v11);
        [v47 addObject:v28];

        char v20 = 1;
        if (v18) {
          goto LABEL_18;
        }
LABEL_19:
        int v33 = v50 & objc_msgSend(v13, "hk_isAfterOrEqualToDate:", v53);
        if ((v20 & 1) == 0 && v33)
        {
          if (([v11 notificationSent] & 1) == 0) {
            goto LABEL_25;
          }
LABEL_24:
          uint64_t v34 = [v11 doses];
          __int16 v35 = objc_msgSend(v34, "hk_map:", &__block_literal_global_367);

          long long v36 = [MEMORY[0x1E4F66BA0] sharedInstance];
          uint64_t v37 = [v36 containsAtLeastOneOfIdentifiers:v35];

          id v38 = [v9[3] medicationNotificationEventWithScheduleItem:v11 dueDate:v13 isFollowUp:1 isCritical:v37 medicationsCount:v51];
          [v47 addObject:v38];

          goto LABEL_25;
        }
        if (v33) {
          goto LABEL_24;
        }
LABEL_25:

        if ([v54 count] <= (unint64_t)++v10) {
          goto LABEL_26;
        }
      }
      if (!v15)
      {
        char v20 = 0;
        id v55 = v12;
        uint64_t v9 = v49;
        goto LABEL_19;
      }
LABEL_9:
      id v21 = v15;

      uint64_t v9 = v49;
      [v49 _snoozeDuration];
      id v23 = [v21 dateByAddingTimeInterval:-v22];
      int v24 = objc_msgSend(v23, "hk_isAfterOrEqualToDate:", v13);
      char v25 = objc_msgSend(v21, "hk_isAfterOrEqualToDate:", v13);
      id v55 = v21;
      if (v24)
      {
        id v26 = v21;

        BOOL v13 = v26;
        uint64_t v9 = v49;
      }

      if ((v24 | v25) & v50)
      {
        char v20 = 0;
        if (!v18) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      id v27 = v55;
      goto LABEL_17;
    }
LABEL_26:
    uint64_t v39 = objc_msgSend(v9[3], "scheduleEvents:error:", v47, v45, v45);
    if (v39)
    {
      id v40 = v9[4];
      id v56 = 0;
      char v41 = [v40 scheduleEvents:v46 error:&v56];
      id v42 = v56;
      if ((v41 & 1) == 0)
      {
        _HKInitializeLogging();
        uint64_t v43 = HKLogMedication();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[HDMedicationNotificationManager _scheduleRestorableAlarmWithItems:date:snoozeFireDates:error:]();
        }
      }
    }
  }
  else
  {
    uint64_t v39 = 0;
  }

  return v39;
}

- (uint64_t)_followUpNotificationsEnabled
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = *MEMORY[0x1E4F669B0];
    id v3 = [*(id *)(a1 + 56) objectForKey:*MEMORY[0x1E4F669B0]];
    if (v3) {
      uint64_t v1 = [*(id *)(v1 + 56) BOOLForKey:v2];
    }
    else {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

uint64_t __96__HDMedicationNotificationManager__scheduleRestorableAlarmWithItems_date_snoozeFireDates_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 medicationIdentifier];
}

uint64_t __96__HDMedicationNotificationManager__scheduleRestorableAlarmWithItems_date_snoozeFireDates_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 medicationIdentifier];
}

- (id)_takenOrSkippedAlarmIdentifiersSince:(uint64_t)a3 error:
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v5 = HDMedicationDoseEventEntityPredicateForScheduledDate();
    id v6 = HDMedicationDoseEventEntityPredicateForStatuses();
    id v7 = (void *)MEMORY[0x1E4F65D08];
    v16[0] = v5;
    v16[1] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v9 = [v7 predicateMatchingAllPredicates:v8];

    uint64_t v10 = (void *)MEMORY[0x1E4F65B48];
    id v11 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    BOOL v13 = [v10 samplesWithType:v11 profile:WeakRetained encodingOptions:0 predicate:v9 limit:0 anchor:0 error:a3];

    id v14 = objc_msgSend(v13, "hk_map:", &__block_literal_global_370_0);
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

uint64_t __78__HDMedicationNotificationManager__takenOrSkippedAlarmIdentifiersSince_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 scheduleItemIdentifier];
}

uint64_t __79__HDMedicationNotificationManager__removeExpirationEventsForIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 scheduleItemIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)_addNotificationObserver:(id)a3
{
  p_profile = &self->_profile;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  id v5 = [WeakRetained notificationManager];
  [v5 addNotificationObserver:v4];
}

- (OS_dispatch_queue)unitTesting_restorableAlarmQueue
{
  return self->_queue;
}

- (OS_dispatch_queue)unitTesting_expirationAlarmQueue
{
  return self->_queue;
}

- (HDRestorableAlarm)unitTesting_restorableAlarm
{
  return self->_restorableAlarm;
}

- (HDRestorableAlarm)unitTesting_expirationAlarm
{
  return self->_expirationAlarm;
}

- (id)unitTesting_activeSchedulesFromDate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F1C9A8];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 autoupdatingCurrentCalendar];
  id v12 = -[HDMedicationNotificationManager _activeSchedulesFromDate:calendar:transaction:error:]((uint64_t)self, v10, v11, v9, (uint64_t)a5);

  return v12;
}

- (id)pruneAllScheduleItemsBeforeDate:(id)a3 createDoseEvents:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x3032000000;
  double v22 = __Block_byref_object_copy__6;
  id v23 = __Block_byref_object_dispose__6;
  id v24 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v10 = [WeakRetained database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__HDMedicationNotificationManager_pruneAllScheduleItemsBeforeDate_createDoseEvents_error___block_invoke;
  v15[3] = &unk_1E63378F0;
  uint64_t v17 = &v19;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  BOOL v18 = a4;
  LODWORD(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v10 error:a5 block:v15];

  if (a5) {
    id v12 = (void *)v20[5];
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

BOOL __90__HDMedicationNotificationManager_pruneAllScheduleItemsBeforeDate_createDoseEvents_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = -[HDMedicationNotificationManager _pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0, a2, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

- (id)_scheduleItemsWithPredicate:(void *)a3 transaction:(uint64_t)a4 error:
{
  if (a1)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v7 = a3;
    id v8 = a2;
    id v9 = objc_alloc_init(v6);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__HDMedicationNotificationManager__scheduleItemsWithPredicate_transaction_error___block_invoke;
    v14[3] = &unk_1E6337120;
    id v15 = v9;
    id v10 = v9;
    LODWORD(a4) = +[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:v8 orderingTerms:0 transaction:v7 error:a4 enumerationHandler:v14];

    if (a4) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

- (uint64_t)_saveNotInteractedDoseEventsForScheduleItems:(void *)a3 transaction:(uint64_t)a4 error:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a1)
  {
    id v8 = a3;
    _HKInitializeLogging();
    id v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HKSensitiveLogItem();
      int v19 = 138543618;
      char v20 = a1;
      __int16 v21 = 2114;
      double v22 = v10;
      _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving not interacted dose events for schedule items: %{public}@", (uint8_t *)&v19, 0x16u);
    }
    id v11 = [a1 _notInteractedDoseEventsForScheduleItems:v7 transaction:v8];

    id v12 = a1 + 1;
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    id v14 = +[HDMedicationsAppSourceSupport medicationsAppSourceEntityForProfile:WeakRetained error:a4];

    if (v14)
    {
      id v15 = objc_loadWeakRetained(v12);
      id v16 = [v15 dataManager];
      uint64_t v17 = [v16 insertDataObjects:v11 sourceEntity:v14 deviceEntity:0 sourceVersion:0 creationDate:a4 error:CFAbsoluteTimeGetCurrent()];
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t __81__HDMedicationNotificationManager__scheduleItemsWithPredicate_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)_notInteractedDoseEventsForScheduleItems:(id)a3 transaction:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v66 = 0;
  id v7 = -[HDMedicationNotificationManager _medicationDoseEventsForScheduleItems:transaction:error:]((uint64_t)self, v5, v6, (uint64_t)&v66);
  id v8 = v66;
  if (!v7)
  {
    _HKInitializeLogging();
    id v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationNotificationManager _notInteractedDoseEventsForScheduleItems:transaction:]();
    }
  }
  char v41 = self;
  id v42 = v8;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v62 objects:v73 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v63;
    uint64_t v14 = *MEMORY[0x1E4F2A1F0];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v63 != v13) {
          objc_enumerationMutation(obj);
        }
        id v16 = [*(id *)(*((void *)&v62 + 1) + 8 * i) metadata];
        uint64_t v17 = [v16 objectForKey:v14];

        if (v17) {
          [v10 addObject:v17];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v62 objects:v73 count:16];
    }
    while (v12);
  }

  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v43 = v5;
  uint64_t v46 = [v43 countByEnumeratingWithState:&v58 objects:v72 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v59;
    unint64_t v18 = 0x1E4F2B000uLL;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v59 != v45) {
          objc_enumerationMutation(v43);
        }
        uint64_t v47 = v19;
        char v20 = *(void **)(*((void *)&v58 + 1) + 8 * v19);
        id v53 = [v20 identifier];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        int v50 = v20;
        id v52 = [v20 doses];
        uint64_t v21 = [v52 countByEnumeratingWithState:&v54 objects:v71 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v55;
          uint64_t v49 = *(void *)v55;
          do
          {
            uint64_t v24 = 0;
            uint64_t v51 = v22;
            do
            {
              if (*(void *)v55 != v23) {
                objc_enumerationMutation(v52);
              }
              char v25 = *(void **)(*((void *)&v54 + 1) + 8 * v24);
              id v26 = *(void **)(v18 + 496);
              id v27 = [v25 medicationIdentifier];
              id v28 = [v26 syncIdentifierForScheduleItemIdentifier:v53 medicationIdentifier:v27];

              if (([v10 containsObject:v28] & 1) == 0)
              {
                id v29 = [*(id *)(v18 + 496) syncVersionForStatus:1];
                id v30 = objc_msgSend(*(id *)(v18 + 496), "_metadataWithSyncIdentifier:syncVersion:isLastScheduledDose:", v28, v29, objc_msgSend(v25, "isLastScheduledDose"));
                uint64_t v31 = *(void **)(v18 + 496);
                id v32 = [v25 medicationIdentifier];
                int v33 = [v25 dose];
                uint64_t v34 = [v50 scheduledDateTime];
                [v50 scheduledDateTime];
                long long v36 = v35 = v10;
                uint64_t v37 = [v31 medicationDoseEventWithLogOrigin:2 scheduleItemIdentifier:v53 medicationIdentifier:v32 scheduledDoseQuantity:v33 doseQuantity:0 scheduledDate:v34 startDate:v36 status:1 metadata:v30];

                id v10 = v35;
                unint64_t v18 = 0x1E4F2B000;
                [v48 addObject:v37];

                uint64_t v23 = v49;
                uint64_t v22 = v51;
              }
              ++v24;
            }
            while (v22 != v24);
            uint64_t v22 = [v52 countByEnumeratingWithState:&v54 objects:v71 count:16];
          }
          while (v22);
        }

        uint64_t v19 = v47 + 1;
      }
      while (v47 + 1 != v46);
      uint64_t v46 = [v43 countByEnumeratingWithState:&v58 objects:v72 count:16];
    }
    while (v46);
  }

  _HKInitializeLogging();
  id v38 = HKLogMedication();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543618;
    v68 = v41;
    __int16 v69 = 2114;
    char v70 = v39;
    _os_log_impl(&dword_1BD54A000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not interacted dose events: %{public}@", buf, 0x16u);
  }
  return v48;
}

- (id)_medicationDoseEventsForScheduleItems:(uint64_t)a3 transaction:(uint64_t)a4 error:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (a1)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) identifier];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    uint64_t v14 = HDMedicationDoseEventEntityPredicateForScheduleItemIdentifiers();
    id v15 = (void *)MEMORY[0x1E4F65B48];
    id v16 = [MEMORY[0x1E4F2B1F8] medicationDoseEventType];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    unint64_t v18 = [v15 samplesWithType:v16 profile:WeakRetained encodingOptions:0 predicate:v14 limit:0 anchor:0 error:a4];
  }
  else
  {
    unint64_t v18 = 0;
  }

  return v18;
}

- (double)_followUpDuration
{
  [(NSUserDefaults *)self->_userDefaults doubleForKey:*MEMORY[0x1E4F669E8]];
  if (result == 0.0) {
    return 1800.0;
  }
  return result;
}

- (double)_snoozeDuration
{
  [(NSUserDefaults *)self->_userDefaults doubleForKey:*MEMORY[0x1E4F669F0]];
  if (result == 0.0) {
    return 600.0;
  }
  return result;
}

- (void)setUnitTesting_restorableAlarmQueue:(id)a3
{
  self->_unitTesting_restorableAlarmQueue = (OS_dispatch_queue *)a3;
}

- (void)setUnitTesting_expirationAlarmQueue:(id)a3
{
  self->_unitTesting_expirationAlarmQueue = (OS_dispatch_queue *)a3;
}

- (void)setUnitTesting_restorableAlarm:(id)a3
{
}

- (void)setUnitTesting_expirationAlarm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTesting_expirationAlarm, 0);
  objc_storeStrong((id *)&self->_unitTesting_restorableAlarm, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_dateAnchor, 0);
  objc_storeStrong((id *)&self->_expirationAlarm, 0);
  objc_storeStrong((id *)&self->_restorableAlarm, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Fetching notification sent schedule items before rescheduling failed with error: %{public}@");
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to fetch schedules with error: %{public}@");
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to generate schedule items with error: %{public}@");
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to schedule the initial restorable alarm: %{public}@");
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to remove schedule items after failure to save schedule item with error: %{public}@");
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to save generated schedule items with error: %{public}@.");
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to fetch the expirations to remove with error: %{public}@");
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to remove expiration alarms with error: %{public}@");
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.9()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to remove restorable alarms with error: %{public}@");
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.10()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to clear schedule items with error: %{public}@");
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.11()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Removing overdue expiration events failed with error: %{public}@");
}

- (void)_scheduleMedicationsFromDate:clearNotSentItems:areDoseRemindersEnabled:transaction:error:.cold.12()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to remove notifications taken or skipped outside of notification UI: %{public}@");
}

- (void)_pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to fetch schedule items with error: %{public}@");
}

- (void)_pruneAllScheduleItemsBefore:createDoseEvents:excludeDoseEventCreationForGivenDate:transaction:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to save Not Interacted Dose Events with error: %{public}@");
}

- (void)_saveScheduleItems:(NSObject *)a3 notificationSentScheduleItems:transaction:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_1BD54A000, a2, a3, "[%{public}@] Insert medication schedule items failed with error: %public@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_scheduleRestorableAlarmWithNextScheduleItemsTransaction:date:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to fetch the next rescheduled item with error: %{public}@.");
}

- (void)_scheduleRestorableAlarmWithNextScheduleItemsTransaction:date:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to schedule the initial restorable alarm with error: %{public}@.");
}

void __73__HDMedicationNotificationManager__queue_alarm_didReceiveDueEvents_date___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1BD54A000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to post notification request for due item: %{public}@, error:%{public}@", (uint8_t *)&v5, 0x20u);
}

- (void)_isDueEventOnHold:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@]: isScheduleItemOnHold returned error=[%{public}@], but treating it as not on hold");
}

- (void)_scheduleRestorableAlarmWithItems:date:snoozeFireDates:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to schedule expiration alarms. %{public}@");
}

- (void)_notInteractedDoseEventsForScheduleItems:transaction:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Failed to fetch the existing dose events for schedule item with error: %{public}@.");
}

@end