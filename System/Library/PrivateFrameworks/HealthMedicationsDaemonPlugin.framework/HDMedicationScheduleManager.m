@interface HDMedicationScheduleManager
+ (id)_fetchDoseEventsWithScheduledItemIdentifier:(void *)a3 profile:(uint64_t)a4 error:;
+ (id)_fetchScheduledItemsWithScheduledItemIdentifier:(void *)a3 transaction:(uint64_t)a4 error:;
+ (id)_filterScheduledItemsThatNeedCorrespondinDoseEventsDroppingOnesWithAlreadyLoggedDoses:(void *)a3 existingDoseEvents:(void *)a4 scheduledItemIdentifier:(uint64_t)a5 status:(void *)a6 logDate:;
+ (id)_filteredDoseEventsThatNeedUpdatingFrom:(void *)a3 scheduledItemIdentifier:(uint64_t)a4 status:(void *)a5 logDate:;
+ (id)_hrMinSecSinceMidnightWithDuration:(void *)a3 calendar:;
+ (id)_makeDateComponentsFromCycleStartDate:(uint64_t)a3 byAddingTimeDifferenceSec:(void *)a4 calendar:;
+ (id)_makeIntervalsWithStartTimeFromIntervals:(uint64_t)a3 byAddingTimeDifferenceDuration:(void *)a4 calendar:(void *)a5 timeZone:;
+ (uint64_t)_crossReferenceScheduledItemsAndDoseEventsAndLogUnloggedWithScheduledItemIdentifier:(uint64_t)a3 status:(void *)a4 logDate:(void *)a5 profile:(void *)a6 transaction:(uint64_t)a7 error:;
+ (uint64_t)_durationForDayHourMinuteSecondComponents:(uint64_t)a1;
+ (uint64_t)_insertDoseEvents:(void *)a3 profile:(uint64_t)a4 error:;
+ (uint64_t)_newDoseEventWithGeneratedMetadataLogOrigin:(void *)a3 scheduleItemIdentifier:(void *)a4 medicationIdentifier:(void *)a5 scheduledDoseQuantity:(void *)a6 doseQuantity:(void *)a7 scheduledDate:(void *)a8 startDate:(uint64_t)a9 status:(unsigned __int8)a10 isLastScheduledDose:;
- (BOOL)_addPendingSchedule:(uint64_t)a3 syncIdentity:;
- (BOOL)_enumerateNotDeletedSchedulesInDescendingCreationOrderWithPredicate:(uint64_t)a3 error:(void *)a4 enumerationHandler:;
- (BOOL)_enumerateSchedulesInDescendingCreationOrderWithPredicate:(char)a3 includeDeleted:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:;
- (BOOL)_fetchMedicationSchedule:(void *)a3 predicate:(uint64_t)a4 error:;
- (BOOL)_updateSchedulesToTimeZone:(id)a3 maintainCalendarDatesAndTimes:(BOOL)a4 error:(id *)a5;
- (BOOL)deleteMedicationSchedule:(id)a3 error:(id *)a4;
- (BOOL)enumerateMedicationSchedulesWithPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
- (BOOL)insertMedicationSchedule:(id)a3 error:(id *)a4;
- (BOOL)insertMedicationSchedules:(id)a3 error:(id *)a4;
- (BOOL)insertMedicationSchedules:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 error:(id *)a6;
- (BOOL)logUnloggedDoseEventsForScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5 error:(id *)a6;
- (BOOL)medicationSchedule:(id *)a3 identifier:(id)a4 error:(id *)a5;
- (BOOL)medicationSchedule:(id *)a3 medicationIdentifier:(id)a4 error:(id *)a5;
- (BOOL)pruneAllScheduleItemsBeforeDate:(id)a3 createDoseEvents:(BOOL)a4 error:(id *)a5;
- (BOOL)rescheduleMedicationsWithError:(id *)a3;
- (BOOL)updateNotificationSent:(BOOL)a3 scheduleItemIdentifier:(id)a4 error:(id *)a5;
- (BOOL)updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:(BOOL)a3 error:(id *)a4;
- (BOOL)updateTimeZoneExperienceAsDismissedWithError:(id *)a3;
- (HDMedicationNotificationManager)notificationManager;
- (HDMedicationScheduleManager)initWithProfile:(id)a3 userDefaults:(id)a4;
- (HDMedicationTimeZoneManager)timeZoneManager;
- (double)_rescheduleOperationDelayWithDefaultDelay:(uint64_t)a1;
- (id)_deviceLocalKeyValueDomain;
- (id)_pendingSchedulesBySyncIdentity;
- (id)medicationSchedulesWithError:(id *)a3;
- (id)medicationSchedulesWithPredicate:(id)a3 error:(id *)a4;
- (id)medicationSchedulesWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)orderingTermsForSortDescriptors:(id)a3 error:(id *)a4;
- (id)unitTesting_didRunRescheduleOperationWithDelay;
- (id)unitTesting_willRunRescheduleOperationWithDelay;
- (uint64_t)_hasPersistedRescheduleRequiredOnNextUnlockFlag;
- (uint64_t)_insertMedicationSchedules:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 transaction:(uint64_t)a6 error:;
- (uint64_t)_isRescheduleRequiredOnNextUnlock;
- (uint64_t)_notifyObserversForDidRescheduleMedications;
- (uint64_t)_queue_runRescheduleOperationWithDelay:(uint64_t)result;
- (uint64_t)_runRescheduleOperationIfListContainsActiveMedsListUDC:(uint64_t)a1;
- (void)_callTestHookdidRunRescheduleOperationWithSuccess:(void *)a3 error:;
- (void)_handleBeforeCommitOfTransaction:(uint64_t)a1;
- (void)_handleScheduleTransactionCommit;
- (void)_handleScheduleTransactionRollback;
- (void)_hasPersistedRescheduleRequiredOnNextUnlockFlag;
- (void)_invalidate;
- (void)_notifyObserversDidPruneScheduleItems:(uint64_t)a1;
- (void)_notifyObserversForDidRescheduleMedications;
- (void)_notifySynchronousObserversInTransaction:(void *)a3 didReschedule:;
- (void)_notifySynchronousObserversInTransaction:(void *)a3 willReschedule:;
- (void)_queue_handleNotificationSettingsDidChangeNotification;
- (void)_queue_rescheduleMedications;
- (void)_runRescheduleDelayedOperation;
- (void)_setRescheduleRequiredOnNextUnlock:(uint64_t)a1;
- (void)_startObservingMedicationsNotificationSettingsDidChangeNotification;
- (void)batchNotifyObserversOnCommitOfTransaction:(id)a3 didAddOrModifySchedule:(id)a4 syncIdentity:(int64_t)a5;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)queue_invalidateDBAccessAssertion;
- (void)queue_takeDBAccessAssertionIfRequired;
- (void)registerObserver:(id)a3 queue:(id)a4;
- (void)registerSynchronousObserver:(id)a3;
- (void)rescheduleMedicationsSynchronously:(BOOL)a3;
- (void)setUnitTesting_didRunRescheduleOperationWithDelay:(id)a3;
- (void)setUnitTesting_willRunRescheduleOperationWithDelay:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)unregisterSynchronousObserver:(id)a3;
- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4;
- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4;
@end

@implementation HDMedicationScheduleManager

- (BOOL)_enumerateSchedulesInDescendingCreationOrderWithPredicate:(char)a3 includeDeleted:(void *)a4 transaction:(uint64_t)a5 error:(void *)a6 enumerationHandler:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a4;
  id v13 = a6;
  if (a1)
  {
    id v14 = v11;
    if ((a3 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E4F65D58];
      v16 = HDMedicationSchedulePredicateForDeleted(0, 1);
      uint64_t v17 = [v15 compoundPredicateWithPredicate:v16 otherPredicate:v14];

      id v14 = (id)v17;
    }
    v18 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"creation_date" entityClass:objc_opt_class() ascending:0];
    v22[0] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    BOOL v20 = +[HDMedicationScheduleEntity enumerateSchedulesWithPredicate:v14 limit:0 orderingTerms:v19 transaction:v12 error:a5 enumerationHandler:v13];
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

uint64_t __72__HDMedicationScheduleManager__fetchMedicationSchedule_predicate_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (BOOL)medicationSchedule:(id *)a3 medicationIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  _HKInitializeLogging();
  v9 = HKLogMedication();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    id v11 = HKLogMedication();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[HDMedicationScheduleManager medicationSchedule:medicationIdentifier:error:]();
    }
  }
  id v12 = HDMedicationSchedulePredicateForMedicationIdentifier((uint64_t)v8);
  BOOL v13 = -[HDMedicationScheduleManager _fetchMedicationSchedule:predicate:error:]((uint64_t)self, a3, v12, (uint64_t)a5);

  return v13;
}

- (BOOL)_fetchMedicationSchedule:(void *)a3 predicate:(uint64_t)a4 error:
{
  id v7 = a3;
  if (a1)
  {
    uint64_t v12 = 0;
    BOOL v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__HDMedicationScheduleManager__fetchMedicationSchedule_predicate_error___block_invoke;
    v11[3] = &unk_1E63372C8;
    v11[4] = &v12;
    BOOL v8 = -[HDMedicationScheduleManager _enumerateNotDeletedSchedulesInDescendingCreationOrderWithPredicate:error:enumerationHandler:](a1, v7, a4, v11);
    if (v8)
    {
      if (a2) {
        *a2 = (id) v13[5];
      }
    }
    else
    {
      _HKInitializeLogging();
      v9 = HKLogMedication();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationScheduleManager _fetchMedicationSchedule:predicate:error:]();
      }
    }
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_enumerateNotDeletedSchedulesInDescendingCreationOrderWithPredicate:(uint64_t)a3 error:(void *)a4 enumerationHandler:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    BOOL v10 = [WeakRetained database];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __124__HDMedicationScheduleManager__enumerateNotDeletedSchedulesInDescendingCreationOrderWithPredicate_error_enumerationHandler___block_invoke;
    v13[3] = &unk_1E63372F0;
    v13[4] = a1;
    id v14 = v7;
    id v15 = v8;
    BOOL v11 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v10 error:a3 block:v13];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

BOOL __124__HDMedicationScheduleManager__enumerateNotDeletedSchedulesInDescendingCreationOrderWithPredicate_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return -[HDMedicationScheduleManager _enumerateSchedulesInDescendingCreationOrderWithPredicate:includeDeleted:transaction:error:enumerationHandler:](*(void *)(a1 + 32), *(void **)(a1 + 40), 0, a2, a3, *(void **)(a1 + 48));
}

- (HDMedicationScheduleManager)initWithProfile:(id)a3 userDefaults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)HDMedicationScheduleManager;
  id v8 = [(HDMedicationScheduleManager *)&v41 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    uint64_t v10 = HKCreateSerialDispatchQueue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    BOOL v13 = NSStringFromProtocol((Protocol *)&unk_1F1806ED8);
    id v14 = HKLogMedication();
    uint64_t v15 = [v12 initWithName:v13 loggingCategory:v14];
    observers = v9->_observers;
    v9->_observers = (HDMedicationScheduleObserver *)v15;

    v9->_observersLock._os_unfair_lock_opaque = 0;
    id v17 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    v18 = NSStringFromProtocol((Protocol *)&unk_1F18076A8);
    v19 = HKLogMedication();
    uint64_t v20 = [v17 initWithName:v18 loggingCategory:v19];
    synchronousObservers = v9->_synchronousObservers;
    v9->_synchronousObservers = (HDMedicationScheduleSynchronousObserver *)v20;

    v22 = [[HDMedicationNotificationManager alloc] initWithProfile:v6 userDefaults:v7];
    notificationManager = v9->_notificationManager;
    v9->_notificationManager = v22;

    v24 = [[HDMedicationTimeZoneManager alloc] initWithProfile:v6];
    timeZoneManager = v9->_timeZoneManager;
    v9->_timeZoneManager = v24;

    objc_initWeak(&location, v9);
    id v26 = objc_alloc(MEMORY[0x1E4F2B8C8]);
    v27 = v9->_queue;
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __60__HDMedicationScheduleManager_initWithProfile_userDefaults___block_invoke;
    v38 = &unk_1E6337200;
    objc_copyWeak(&v39, &location);
    uint64_t v28 = [v26 initWithQueue:v27 delay:&v35 block:5.0];
    rescheduleOperation = v9->_rescheduleOperation;
    v9->_rescheduleOperation = (_HKDelayedOperation *)v28;

    v9->_isOperationRequiredOnNextUnlock = 0;
    v9->_operationLock._os_unfair_lock_opaque = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v9, v9->_queue, v35, v36, v37, v38);

    id v31 = objc_loadWeakRetained((id *)&v9->_profile);
    v32 = [v31 daemon];
    v33 = [v32 behavior];
    LODWORD(v27) = [v33 isAppleWatch];

    if (v27) {
      -[HDMedicationScheduleManager _startObservingMedicationsNotificationSettingsDidChangeNotification](v9);
    }
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __60__HDMedicationScheduleManager_initWithProfile_userDefaults___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDMedicationScheduleManager _queue_rescheduleMedications]((uint64_t)WeakRetained);
}

- (void)_queue_rescheduleMedications
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1BD54A000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] Adding accessibility assertion: %{public}@", v1, 0x16u);
}

- (void)_startObservingMedicationsNotificationSettingsDidChangeNotification
{
  if (val)
  {
    val[24] = -1;
    uint64_t v2 = val + 24;
    objc_initWeak(&location, val);
    v3 = (const char *)[@"HKMedicationsNotificationSettingsDidChangeNotification" UTF8String];
    v4 = *((void *)val + 2);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __98__HDMedicationScheduleManager__startObservingMedicationsNotificationSettingsDidChangeNotification__block_invoke;
    v5[3] = &unk_1E63373B0;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, v2, v4, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  -[HDMedicationScheduleManager _invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HDMedicationScheduleManager;
  [(HDMedicationScheduleManager *)&v3 dealloc];
}

- (void)_invalidate
{
  if (a1)
  {
    id v6 = *(id *)(a1 + 88);
    uint64_t v2 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;

    [v6 invalidate];
    objc_super v3 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;
    id v4 = v3;

    [v4 invalidate];
    int v5 = *(_DWORD *)(a1 + 96);
    if (v5 != -1)
    {
      notify_cancel(v5);
      *(_DWORD *)(a1 + 96) = -1;
    }
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  id v8 = a3;
  id v4 = [v8 database];
  [v4 addProtectedDataObserver:self queue:self->_queue];

  int v5 = [v8 database];
  if ([v5 isProtectedDataAvailable])
  {
    int isRescheduleRequiredOnNext = -[HDMedicationScheduleManager _isRescheduleRequiredOnNextUnlock]((uint64_t)self);

    if (isRescheduleRequiredOnNext) {
      -[HDMedicationScheduleManager _runRescheduleDelayedOperation]((uint64_t)self);
    }
  }
  else
  {
  }
  id v7 = [v8 userDomainConceptManager];
  [v7 addUserDomainConceptObserver:self queue:0];
}

- (uint64_t)_isRescheduleRequiredOnNextUnlock
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = (os_unfair_lock_s *)(result + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(result + 80));
    uint64_t v3 = *(void *)(v1 + 72);
    os_unfair_lock_unlock(v2);
    if (v3 == 1)
    {
      return 1;
    }
    else if (v3 == 2)
    {
      return 0;
    }
    else
    {
      return -[HDMedicationScheduleManager _hasPersistedRescheduleRequiredOnNextUnlockFlag](v1);
    }
  }
  return result;
}

- (void)_runRescheduleDelayedOperation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v3 = [WeakRetained daemon];
    id v4 = [v3 healthMedicationsDaemonExtension];
    int v5 = [v4 medicationsBehavior];
    char v6 = [v5 asyncMedicationReschedulesEnabled];

    if (v6)
    {
      double v7 = -[HDMedicationScheduleManager _rescheduleOperationDelayWithDefaultDelay:](a1, 5.0);
      id v8 = *(NSObject **)(a1 + 16);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __61__HDMedicationScheduleManager__runRescheduleDelayedOperation__block_invoke;
      v10[3] = &unk_1E6337278;
      v10[4] = a1;
      *(double *)&v10[5] = v7;
      dispatch_async(v8, v10);
    }
    else
    {
      _HKInitializeLogging();
      v9 = HKLogMedication();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v12 = a1;
        _os_log_impl(&dword_1BD54A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Async reschedule of meds is disabled by medications behavior", buf, 0xCu);
      }
    }
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  if (a4 && -[HDMedicationScheduleManager _isRescheduleRequiredOnNextUnlock]((uint64_t)self))
  {
    -[HDMedicationScheduleManager _runRescheduleDelayedOperation]((uint64_t)self);
  }
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
}

- (uint64_t)_runRescheduleOperationIfListContainsActiveMedsListUDC:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v6 = v3;
    id v3 = (id)objc_msgSend(v3, "hk_containsObjectPassingTest:", &__block_literal_global_5);
    id v4 = v6;
    if (v3)
    {
      -[HDMedicationScheduleManager _runRescheduleDelayedOperation](a1);
      id v4 = v6;
    }
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
}

BOOL __86__HDMedicationScheduleManager__runRescheduleOperationIfListContainsActiveMedsListUDC___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && [v2 listType] == 2;

  return v3;
}

- (BOOL)medicationSchedule:(id *)a3 identifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  _HKInitializeLogging();
  v9 = HKLogMedication();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    BOOL v11 = HKLogMedication();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[HDMedicationScheduleManager medicationSchedule:identifier:error:]();
    }
  }
  uint64_t v12 = HDMedicationSchedulePredicateForScheduleUUID((uint64_t)v8, 1);
  BOOL v13 = -[HDMedicationScheduleManager _fetchMedicationSchedule:predicate:error:]((uint64_t)self, a3, v12, (uint64_t)a5);

  return v13;
}

- (id)medicationSchedulesWithError:(id *)a3
{
  return [(HDMedicationScheduleManager *)self medicationSchedulesWithPredicate:0 error:a3];
}

- (id)medicationSchedulesWithPredicate:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__HDMedicationScheduleManager_medicationSchedulesWithPredicate_error___block_invoke;
  v12[3] = &unk_1E6337228;
  id v9 = v8;
  id v13 = v9;
  LODWORD(a4) = -[HDMedicationScheduleManager _enumerateNotDeletedSchedulesInDescendingCreationOrderWithPredicate:error:enumerationHandler:]((uint64_t)self, v7, (uint64_t)a4, v12);

  if (a4) {
    BOOL v10 = (void *)[v9 copy];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __70__HDMedicationScheduleManager_medicationSchedulesWithPredicate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)medicationSchedulesWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  _HKInitializeLogging();
  BOOL v10 = HKLogMedication();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

  if (v11)
  {
    uint64_t v12 = HKLogMedication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[HDMedicationScheduleManager medicationSchedulesWithPredicate:transaction:error:]();
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__HDMedicationScheduleManager_medicationSchedulesWithPredicate_transaction_error___block_invoke;
  v18[3] = &unk_1E6337228;
  id v14 = v13;
  id v19 = v14;
  BOOL v15 = -[HDMedicationScheduleManager _enumerateSchedulesInDescendingCreationOrderWithPredicate:includeDeleted:transaction:error:enumerationHandler:]((uint64_t)self, v8, 0, v9, (uint64_t)a5, v18);

  if (v15) {
    v16 = (void *)[v14 copy];
  }
  else {
    v16 = 0;
  }

  return v16;
}

uint64_t __82__HDMedicationScheduleManager_medicationSchedulesWithPredicate_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (BOOL)enumerateMedicationSchedulesWithPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  _HKInitializeLogging();
  BOOL v15 = HKLogMedication();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

  if (v16)
  {
    id v17 = HKLogMedication();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v25 = self;
      id v26 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
      *(_DWORD *)buf = 138544130;
      v33 = self;
      __int16 v34 = 2114;
      uint64_t v35 = v25;
      __int16 v36 = 2114;
      v37 = v26;
      __int16 v38 = 2114;
      id v39 = v13;
      _os_log_debug_impl(&dword_1BD54A000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Enumerating medication schedules with predicate: %{public}@, limit: %{public}@, orderingTerms: %{public}@", buf, 0x2Au);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v19 = [WeakRetained database];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __118__HDMedicationScheduleManager_enumerateMedicationSchedulesWithPredicate_limit_orderingTerms_error_enumerationHandler___block_invoke;
  v27[3] = &unk_1E6337250;
  v27[4] = self;
  id v28 = v12;
  id v30 = v14;
  int64_t v31 = a4;
  id v29 = v13;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  BOOL v23 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v19 error:a6 block:v27];

  return v23;
}

BOOL __118__HDMedicationScheduleManager_enumerateMedicationSchedulesWithPredicate_limit_orderingTerms_error_enumerationHandler___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  return a1[4]
      && +[HDMedicationScheduleEntity enumerateSchedulesWithPredicate:a1[5] limit:a1[8] orderingTerms:a1[6] transaction:a2 error:a3 enumerationHandler:a1[7]];
}

- (BOOL)insertMedicationSchedule:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = HKLogMedication();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    id v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[HDMedicationScheduleManager insertMedicationSchedule:error:]();
    }
  }
  v13[0] = v6;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  BOOL v11 = [(HDMedicationScheduleManager *)self insertMedicationSchedules:v10 error:a4];

  return v11;
}

- (BOOL)insertMedicationSchedules:(id)a3 error:(id *)a4
{
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = HKLogMedication();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    id v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[HDMedicationScheduleManager insertMedicationSchedules:error:]((uint64_t)self, v6, v9);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v11 = -[HDMedicationScheduleManager insertMedicationSchedules:syncProvenance:syncIdentity:error:](self, "insertMedicationSchedules:syncProvenance:syncIdentity:error:", v6, 0, [WeakRetained currentSyncIdentityPersistentID], a4);

  return v11;
}

- (BOOL)insertMedicationSchedules:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 error:(id *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  _HKInitializeLogging();
  BOOL v11 = HKLogMedication();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138544130;
    id v17 = self;
    __int16 v18 = 2048;
    uint64_t v19 = [v10 count];
    __int16 v20 = 2048;
    int64_t v21 = a4;
    __int16 v22 = 2048;
    int64_t v23 = a5;
    _os_log_impl(&dword_1BD54A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserting %lld schedules provenance: %lld, syncIdentity: %lld", (uint8_t *)&v16, 0x2Au);
  }

  id v12 = [[HDMedicationScheduleInsertOperation alloc] initWithMedicationSchedules:v10 syncProvenance:a4 syncIdentity:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v14 = [(HDJournalableOperation *)v12 performOrJournalWithProfile:WeakRetained error:a6];

  return v14;
}

- (BOOL)logUnloggedDoseEventsForScheduledItemIdentifier:(id)a3 status:(int64_t)a4 logDate:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [[HDMedicationScheduleLogUnloggedMedicationsOperation alloc] initWithScheduledItemIdentifier:v11 status:a4 logDate:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a6) = [(HDJournalableOperation *)v12 performOrJournalWithProfile:WeakRetained error:a6];

  return (char)a6;
}

- (BOOL)rescheduleMedicationsWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  int v5 = HKLogMedication();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    id v7 = HKLogMedication();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[HDMedicationScheduleManager rescheduleMedicationsWithError:]((uint64_t)self, v7);
    }
  }
  notificationManager = self->_notificationManager;
  id v16 = 0;
  BOOL v9 = [(HDMedicationNotificationManager *)notificationManager rescheduleMedicationsWithError:&v16];
  id v10 = v16;
  id v11 = v10;
  if (v9)
  {
    -[HDMedicationScheduleManager _setRescheduleRequiredOnNextUnlock:]((uint64_t)self, 0);
    -[HDMedicationScheduleManager _notifyObserversForDidRescheduleMedications]((uint64_t)self);
  }
  else if (objc_msgSend(v10, "hk_isDatabaseAccessibilityError"))
  {
    -[HDMedicationScheduleManager _setRescheduleRequiredOnNextUnlock:]((uint64_t)self, 1);
  }
  _HKInitializeLogging();
  id v12 = HKLogMedication();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = HKStringFromBool();
    *(_DWORD *)buf = 138543874;
    __int16 v18 = self;
    __int16 v19 = 2114;
    __int16 v20 = v13;
    __int16 v21 = 2114;
    __int16 v22 = v11;
    _os_log_impl(&dword_1BD54A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Reschedule medications completed with success: %{public}@, error: %{public}@", buf, 0x20u);
  }
  id v14 = v11;
  if (v14)
  {
    if (a3) {
      *a3 = v14;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return v9;
}

- (void)_setRescheduleRequiredOnNextUnlock:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = a2 ? 1 : 2;
    BOOL v6 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    *(void *)(a1 + 72) = v5;
    os_unfair_lock_unlock(v6);
    if (v5 != v4)
    {
      id v7 = -[HDMedicationScheduleManager _deviceLocalKeyValueDomain]((id *)a1);
      BOOL v8 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
      id v13 = 0;
      char v9 = [v7 setNumber:v8 forKey:@"rescheduleRequired" error:&v13];
      id v10 = v13;

      if ((v9 & 1) == 0)
      {
        _HKInitializeLogging();
        id v11 = HKLogMedication();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v12 = HKStringFromBool();
          *(_DWORD *)buf = 138544130;
          uint64_t v15 = a1;
          __int16 v16 = 2114;
          id v17 = v12;
          __int16 v18 = 2114;
          __int16 v19 = @"rescheduleRequired";
          __int16 v20 = 2114;
          id v21 = v10;
          _os_log_error_impl(&dword_1BD54A000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Unable to set value %{public}@ for key %{public}@: %{public}@", buf, 0x2Au);
        }
      }
    }
  }
}

- (uint64_t)_notifyObserversForDidRescheduleMedications
{
  if (result)
  {
    uint64_t v1 = result;
    _HKInitializeLogging();
    id v2 = HKLogMedication();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

    if (v3)
    {
      uint64_t v4 = HKLogMedication();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        -[HDMedicationScheduleManager _notifyObserversForDidRescheduleMedications](v1);
      }
    }
    uint64_t v5 = *(void **)(v1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__HDMedicationScheduleManager__notifyObserversForDidRescheduleMedications__block_invoke;
    v6[3] = &unk_1E6337428;
    v6[4] = v1;
    return [v5 notifyObservers:v6];
  }
  return result;
}

- (void)rescheduleMedicationsSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v5 = HKLogMedication();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v3)
  {
    if (v6)
    {
      id v7 = HKLogMedication();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = self;
        _os_log_impl(&dword_1BD54A000, v7, OS_LOG_TYPE_INFO, "[%{public}@] Rescheduling medications synchronously", buf, 0xCu);
      }
    }
    id v12 = 0;
    BOOL v8 = [(HDMedicationScheduleManager *)self rescheduleMedicationsWithError:&v12];
    id v9 = v12;
    if (!v8)
    {
      _HKInitializeLogging();
      id v10 = HKLogMedication();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[HDMedicationScheduleManager rescheduleMedicationsSynchronously:]();
      }
    }
  }
  else
  {
    if (v6)
    {
      id v11 = HKLogMedication();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v14 = self;
        _os_log_impl(&dword_1BD54A000, v11, OS_LOG_TYPE_INFO, "[%{public}@] Rescheduling medications with delayed operation", buf, 0xCu);
      }
    }
    -[HDMedicationScheduleManager _runRescheduleDelayedOperation]((uint64_t)self);
  }
}

- (double)_rescheduleOperationDelayWithDefaultDelay:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v4 = MEMORY[0x1C187D5B0](*(void *)(a1 + 112));
  uint64_t v5 = (void *)v4;
  if (v4) {
    a2 = (*(double (**)(uint64_t, uint64_t, double))(v4 + 16))(v4, a1, a2);
  }

  return a2;
}

uint64_t __61__HDMedicationScheduleManager__runRescheduleDelayedOperation__block_invoke(uint64_t a1)
{
  return -[HDMedicationScheduleManager _queue_runRescheduleOperationWithDelay:](*(void *)(a1 + 32), *(double *)(a1 + 40));
}

- (uint64_t)_queue_runRescheduleOperationWithDelay:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 16));
    -[HDMedicationScheduleManager queue_takeDBAccessAssertionIfRequired](v3);
    uint64_t v4 = *(void **)(v3 + 64);
    return [v4 executeWithDelay:a2];
  }
  return result;
}

- (void)queue_takeDBAccessAssertionIfRequired
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    if (!*(void *)(a1 + 88))
    {
      id v2 = NSString;
      uint64_t v3 = (objc_class *)objc_opt_class();
      uint64_t v4 = NSStringFromClass(v3);
      uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
      BOOL v6 = [v5 UUIDString];
      id v7 = [v2 stringWithFormat:@"%@-%@", v4, v6];

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      id v9 = [WeakRetained database];
      id v16 = 0;
      uint64_t v10 = [v9 takeAccessibilityAssertionWithOwnerIdentifier:v7 timeout:&v16 error:300.0];
      id v11 = v16;
      id v12 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v10;

      if (!*(void *)(a1 + 88))
      {
        _HKInitializeLogging();
        id v13 = HKLogMedication();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

        if (v14)
        {
          uint64_t v15 = HKLogMedication();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v18 = a1;
            __int16 v19 = 2114;
            id v20 = v11;
            _os_log_impl(&dword_1BD54A000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Unable to take accessibility assertion: %{public}@", buf, 0x16u);
          }
        }
      }
    }
  }
}

uint64_t __59__HDMedicationScheduleManager__queue_rescheduleMedications__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) rescheduleMedicationsWithError:a2];
}

- (void)queue_invalidateDBAccessAssertion
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BD54A000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] Database accessibility assertion is invalidated", (uint8_t *)&v2, 0xCu);
}

- (void)_callTestHookdidRunRescheduleOperationWithSuccess:(void *)a3 error:
{
  id v7 = a3;
  if (a1)
  {
    uint64_t v5 = MEMORY[0x1C187D5B0](*(void *)(a1 + 120));
    BOOL v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v5 + 16))(v5, a1, a2, v7);
    }
  }
}

- (uint64_t)_hasPersistedRescheduleRequiredOnNextUnlockFlag
{
  if (!a1) {
    return 0;
  }
  int v2 = -[HDMedicationScheduleManager _deviceLocalKeyValueDomain]((id *)a1);
  id v10 = 0;
  uint64_t v3 = [v2 numberForKey:@"rescheduleRequired" error:&v10];
  id v4 = v10;
  uint64_t v5 = v4;
  if (!v3 && v4)
  {
    _HKInitializeLogging();
    BOOL v6 = HKLogMedication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationScheduleManager _hasPersistedRescheduleRequiredOnNextUnlockFlag]();
    }
  }
  uint64_t v7 = [v3 BOOLValue];
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  uint64_t v8 = 1;
  if (!v7) {
    uint64_t v8 = 2;
  }
  *(void *)(a1 + 72) = v8;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));

  return v7;
}

- (id)_deviceLocalKeyValueDomain
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F65B28]);
    id WeakRetained = objc_loadWeakRetained(v1 + 1);
    uint64_t v1 = (id *)[v2 initWithCategory:0 domainName:@"MedicationScheduleManager" profile:WeakRetained];
  }
  return v1;
}

- (BOOL)updateNotificationSent:(BOOL)a3 scheduleItemIdentifier:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = HKLogMedication();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    id v11 = HKLogMedication();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[HDMedicationScheduleManager updateNotificationSent:scheduleItemIdentifier:error:]();
    }
  }
  id v12 = [[HDMedicationScheduleItemUpdateNotificationSentOperation alloc] initWithScheduleItemIdentifier:v8 notificationSent:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v14 = [(HDJournalableOperation *)v12 performOrJournalWithProfile:WeakRetained error:a5];

  return v14;
}

- (uint64_t)_insertMedicationSchedules:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 transaction:(uint64_t)a6 error:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a5;
  if (a1)
  {
    if ([v10 count])
    {
      if (a4 == -1)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        id v13 = [WeakRetained syncIdentityManager];
        BOOL v14 = [v13 legacySyncIdentity];
        uint64_t v15 = [v14 entity];
        a4 = [v15 persistentID];
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = v10;
      uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v35;
        __int16 v19 = (id *)(a1 + 8);
        id v31 = v10;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v35 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            id v22 = objc_loadWeakRetained(v19);
            BOOL v23 = +[HDMedicationScheduleEntity insertMedicationSchedule:v21 syncProvenance:a3 syncIdentity:a4 profile:v22 transaction:v11 error:a6];

            if (!v23) {
              goto LABEL_16;
            }
            uint64_t v24 = [v21 medicationIdentifier];

            if (v24)
            {
              v25 = [v21 medicationIdentifier];
              __int16 v38 = v25;
              id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
              v27 = HDDismissedRemoteScheduleUnavailableRecordsForMedicationSemanticIdentifiers((uint64_t)v26);

              id v28 = [v11 database];
              LODWORD(v25) = +[HDHealthEntity deleteEntitiesWithPredicate:v27 healthDatabase:v28 error:a6];

              if (!v25)
              {
LABEL_16:
                uint64_t v29 = 0;
                id v10 = v31;
                goto LABEL_19;
              }
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
          uint64_t v29 = 1;
          id v10 = v31;
          if (v17) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v29 = 1;
      }
LABEL_19:
    }
    else
    {
      uint64_t v29 = 1;
    }
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

+ (uint64_t)_crossReferenceScheduledItemsAndDoseEventsAndLogUnloggedWithScheduledItemIdentifier:(uint64_t)a3 status:(void *)a4 logDate:(void *)a5 profile:(void *)a6 transaction:(uint64_t)a7 error:
{
  id v12 = a2;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = self;
  uint64_t v17 = +[HDMedicationScheduleManager _fetchDoseEventsWithScheduledItemIdentifier:profile:error:](v16, v12, v14, a7);
  if (v17)
  {
    uint64_t v18 = +[HDMedicationScheduleManager _fetchScheduledItemsWithScheduledItemIdentifier:transaction:error:](v16, v12, v15, a7);
    if (v18)
    {
      BOOL v23 = +[HDMedicationScheduleManager _filteredDoseEventsThatNeedUpdatingFrom:scheduledItemIdentifier:status:logDate:](v16, v17, v12, a3, v13);
      __int16 v19 = +[HDMedicationScheduleManager _filterScheduledItemsThatNeedCorrespondinDoseEventsDroppingOnesWithAlreadyLoggedDoses:existingDoseEvents:scheduledItemIdentifier:status:logDate:](v16, v18, v17, v12, a3, v13);
      id v20 = [v23 arrayByAddingObjectsFromArray:v19];
      uint64_t v21 = +[HDMedicationScheduleManager _insertDoseEvents:profile:error:](v16, v20, v14, a7);
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

+ (id)_fetchDoseEventsWithScheduledItemIdentifier:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  self;
  id v8 = HDMedicationDoseEventEntityPredicateForScheduleItemIdentifier();

  id v9 = [MEMORY[0x1E4F2B2C0] medicationDoseEventTypeForIdentifier:*MEMORY[0x1E4F2A040]];
  id v10 = [MEMORY[0x1E4F65BE8] samplesWithType:v9 profile:v6 encodingOptions:0 predicate:v8 limit:0 anchor:0 error:a4];

  return v10;
}

+ (id)_fetchScheduledItemsWithScheduledItemIdentifier:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  id v8 = HDMedicationScheduleItemPredicateForIdentifier((uint64_t)v6, 1);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  uint64_t v16 = __Block_byref_object_dispose__4;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__HDMedicationScheduleManager__fetchScheduledItemsWithScheduledItemIdentifier_transaction_error___block_invoke;
  v11[3] = &unk_1E6337318;
  v11[4] = &v12;
  if (+[HDMedicationScheduleItemEntity enumerateItemsWithPredicate:v8 orderingTerms:0 transaction:v7 error:a4 enumerationHandler:v11])
  {
    id v9 = (id)v13[5];
  }
  else
  {
    id v9 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)_filteredDoseEventsThatNeedUpdatingFrom:(void *)a3 scheduledItemIdentifier:(uint64_t)a4 status:(void *)a5 logDate:
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a2;
  self;
  id v11 = objc_msgSend(v10, "hk_filter:", &__block_literal_global_412);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __110__HDMedicationScheduleManager__filteredDoseEventsThatNeedUpdatingFrom_scheduledItemIdentifier_status_logDate___block_invoke_2;
  v16[3] = &unk_1E6337360;
  id v17 = v8;
  id v18 = v9;
  uint64_t v19 = a4;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = objc_msgSend(v11, "hk_map:", v16);

  return v14;
}

+ (id)_filterScheduledItemsThatNeedCorrespondinDoseEventsDroppingOnesWithAlreadyLoggedDoses:(void *)a3 existingDoseEvents:(void *)a4 scheduledItemIdentifier:(uint64_t)a5 status:(void *)a6 logDate:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v35 = a4;
  id v33 = a6;
  self;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v9;
  uint64_t v29 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v44;
    id v11 = &unk_1E6337388;
    id v31 = v10;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v12;
        id v13 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v37 = [v13 doses];
        uint64_t v14 = [v37 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v40;
          do
          {
            uint64_t v17 = 0;
            uint64_t v36 = v15;
            do
            {
              if (*(void *)v40 != v16) {
                objc_enumerationMutation(v37);
              }
              id v18 = *(void **)(*((void *)&v39 + 1) + 8 * v17);
              v38[0] = MEMORY[0x1E4F143A8];
              v38[1] = 3221225472;
              v38[2] = __175__HDMedicationScheduleManager__filterScheduledItemsThatNeedCorrespondinDoseEventsDroppingOnesWithAlreadyLoggedDoses_existingDoseEvents_scheduledItemIdentifier_status_logDate___block_invoke;
              v38[3] = v11;
              v38[4] = v13;
              v38[5] = v18;
              if ((objc_msgSend(v10, "hk_containsObjectPassingTest:", v38) & 1) == 0)
              {
                uint64_t v19 = [v18 medicationIdentifier];
                id v20 = [v18 dose];
                [v18 dose];
                v22 = uint64_t v21 = v11;
                [v13 scheduledDateTime];
                v24 = BOOL v23 = v13;
                v25 = (void *)+[HDMedicationScheduleManager _newDoseEventWithGeneratedMetadataLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:isLastScheduledDose:]((uint64_t)HDMedicationScheduleManager, 2, v35, v19, v20, v22, v24, v33, a5, [v18 isLastScheduledDose]);

                id v13 = v23;
                id v11 = v21;
                uint64_t v15 = v36;

                id v10 = v31;
                objc_msgSend(v34, "hk_addNonNilObject:", v25);
              }
              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v37 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v15);
        }

        uint64_t v12 = v30 + 1;
      }
      while (v30 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v29);
  }

  return v34;
}

+ (uint64_t)_insertDoseEvents:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  id v8 = +[HDMedicationsAppSourceSupport medicationsAppSourceEntityForProfile:v7 error:a4];
  if (v8)
  {
    id v9 = [v7 dataManager];
    uint64_t v10 = [v9 insertDataObjects:v6 sourceEntity:v8 deviceEntity:0 sourceVersion:0 creationDate:a4 error:CFAbsoluteTimeGetCurrent()];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __97__HDMedicationScheduleManager__fetchScheduledItemsWithScheduledItemIdentifier_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

BOOL __110__HDMedicationScheduleManager__filteredDoseEventsThatNeedUpdatingFrom_scheduledItemIdentifier_status_logDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 status] != 4 && objc_msgSend(v2, "status") != 5;

  return v3;
}

id __110__HDMedicationScheduleManager__filteredDoseEventsThatNeedUpdatingFrom_scheduledItemIdentifier_status_logDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 scheduleItemIdentifier];
  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = [v3 scheduledDate];
  if (!v6)
  {
    id v13 = 0;
    goto LABEL_7;
  }
  id v7 = (void *)v6;
  id v8 = [v3 scheduledDoseQuantity];

  if (!v8)
  {
LABEL_5:
    id v13 = 0;
    goto LABEL_8;
  }
  id v9 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 medicationIdentifier];
  uint64_t v10 = [v3 scheduledDoseQuantity];
  id v11 = [v3 doseQuantity];
  uint64_t v12 = [v3 scheduledDate];
  id v13 = (void *)+[HDMedicationScheduleManager _newDoseEventWithGeneratedMetadataLogOrigin:scheduleItemIdentifier:medicationIdentifier:scheduledDoseQuantity:doseQuantity:scheduledDate:startDate:status:isLastScheduledDose:]((uint64_t)HDMedicationScheduleManager, 2, v9, v5, v10, v11, v12, *(void **)(a1 + 40), *(void *)(a1 + 48), [v3 isLastScheduledDose]);

LABEL_7:
LABEL_8:

  return v13;
}

+ (uint64_t)_newDoseEventWithGeneratedMetadataLogOrigin:(void *)a3 scheduleItemIdentifier:(void *)a4 medicationIdentifier:(void *)a5 scheduledDoseQuantity:(void *)a6 doseQuantity:(void *)a7 scheduledDate:(void *)a8 startDate:(uint64_t)a9 status:(unsigned __int8)a10 isLastScheduledDose:
{
  id v26 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  self;
  id v20 = [MEMORY[0x1E4F2B1F0] syncIdentifierForScheduleItemIdentifier:v19 medicationIdentifier:v18];
  uint64_t v21 = (void *)MEMORY[0x1E4F2B1F0];
  id v22 = [MEMORY[0x1E4F2B1F0] syncVersionForStatus:a9];
  BOOL v23 = [v21 _metadataWithSyncIdentifier:v20 syncVersion:v22 isLastScheduledDose:a10];

  uint64_t v24 = [MEMORY[0x1E4F2B1F0] medicationDoseEventWithLogOrigin:a2 scheduleItemIdentifier:v19 medicationIdentifier:v18 scheduledDoseQuantity:v17 doseQuantity:v16 scheduledDate:v15 startDate:v26 status:a9 metadata:v23];

  return v24;
}

uint64_t __175__HDMedicationScheduleManager__filterScheduledItemsThatNeedCorrespondinDoseEventsDroppingOnesWithAlreadyLoggedDoses_existingDoseEvents_scheduledItemIdentifier_status_logDate___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = [v4 scheduleItemIdentifier];
  uint64_t v6 = [*(id *)(a1 + 32) identifier];
  if (v5 != v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) identifier];
    if (!v7)
    {
      uint64_t v17 = 0;
      goto LABEL_14;
    }
    id v2 = (void *)v7;
    id v8 = [v4 scheduleItemIdentifier];
    id v9 = [*(id *)(a1 + 32) identifier];
    if (![v8 isEqual:v9])
    {
      uint64_t v17 = 0;
LABEL_13:

      goto LABEL_14;
    }
    id v19 = v9;
    uint64_t v21 = v8;
  }
  uint64_t v10 = objc_msgSend(v4, "medicationIdentifier", v19, v21);
  uint64_t v11 = [*(id *)(a1 + 40) medicationIdentifier];
  if (v10 == (void *)v11)
  {

    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = [*(id *)(a1 + 40) medicationIdentifier];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      id v15 = [v4 medicationIdentifier];
      id v16 = [*(id *)(a1 + 40) medicationIdentifier];
      uint64_t v17 = [v15 isEqual:v16];
    }
    else
    {

      uint64_t v17 = 0;
    }
  }
  id v9 = v20;
  id v8 = v22;
  if (v5 != v6) {
    goto LABEL_13;
  }
LABEL_14:

  return v17;
}

void __98__HDMedicationScheduleManager__startObservingMedicationsNotificationSettingsDidChangeNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDMedicationScheduleManager _queue_handleNotificationSettingsDidChangeNotification]((uint64_t)WeakRetained);
}

- (void)_queue_handleNotificationSettingsDidChangeNotification
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    _HKInitializeLogging();
    id v2 = HKLogMedication();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138543362;
      uint64_t v4 = a1;
    }

    -[HDMedicationScheduleManager _queue_rescheduleMedications](a1);
  }
}

- (HDMedicationTimeZoneManager)timeZoneManager
{
  return self->_timeZoneManager;
}

- (BOOL)updateTimeZoneExperienceAsDismissedWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v5 = HKLogMedication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = self;
    _os_log_impl(&dword_1BD54A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] User dismissed timeZone experience", buf, 0xCu);
  }

  uint64_t v6 = (void *)MEMORY[0x1E4F65B28];
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v9 = objc_msgSend(v6, "hdmd_timeZoneDomainWithProfile:", WeakRetained);

  if ([v9 setNumber:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F66A40] error:a3])
  {
    uint64_t v10 = *MEMORY[0x1E4F669F8];
    id v11 = objc_loadWeakRetained((id *)p_profile);
    uint64_t v12 = [v11 notificationManager];
    uint64_t v23 = v10;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v12 removeDeliveredNotificationsWithIdentifiers:v13];

    id v14 = objc_loadWeakRetained((id *)p_profile);
    id v15 = [v14 healthMedicationsProfileExtension];
    id v16 = [v15 medicationNotificationSyncManager];
    uint64_t v17 = [v16 notificationSyncClient];

    id v18 = [MEMORY[0x1E4F1C9C8] date];
    id v19 = [v18 dateByAddingTimeInterval:86400.0];

    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F2B268]) initWithAction:1 categoryIdentifier:v10 expirationDate:v19];
    char v21 = [v17 sendNotificationInstruction:v20 criteria:0 error:a3];
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

- (BOOL)updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  _HKInitializeLogging();
  uint64_t v7 = HKLogMedication();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v8)
  {
    id v9 = HKLogMedication();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[HDMedicationScheduleManager updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:error:]();
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  BOOL v11 = [(HDMedicationScheduleManager *)self _updateSchedulesToTimeZone:v10 maintainCalendarDatesAndTimes:v5 error:a4];

  return v11;
}

- (BOOL)_updateSchedulesToTimeZone:(id)a3 maintainCalendarDatesAndTimes:(BOOL)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  _HKInitializeLogging();
  id v9 = HKLogMedication();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    BOOL v11 = HKLogMedication();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = HKStringFromBool();
      *(_DWORD *)buf = 138543874;
      v32 = self;
      __int16 v33 = 2114;
      id v34 = v8;
      __int16 v35 = 2114;
      uint64_t v36 = v24;
      _os_log_debug_impl(&dword_1BD54A000, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Updating schedules with time zone: %{public}@, maintainCalendarDatesAndTimes: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  uint64_t v13 = [(HDMedicationScheduleManager *)self medicationSchedulesWithError:a5];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __94__HDMedicationScheduleManager__updateSchedulesToTimeZone_maintainCalendarDatesAndTimes_error___block_invoke;
  v26[3] = &unk_1E63373D8;
  id v14 = v8;
  id v27 = v14;
  uint64_t v28 = self;
  BOOL v30 = a4;
  id v15 = v12;
  id v29 = v15;
  id v16 = objc_msgSend(v13, "hk_map:", v26);
  _HKInitializeLogging();
  uint64_t v17 = HKLogMedication();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v25 = a5;
    id v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    id v19 = HKSensitiveLogItem();
    id v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    char v21 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138544386;
    v32 = self;
    __int16 v33 = 2114;
    id v34 = v18;
    __int16 v35 = 2114;
    uint64_t v36 = v19;
    __int16 v37 = 2114;
    __int16 v38 = v20;
    __int16 v39 = 2114;
    long long v40 = v21;
    _os_log_impl(&dword_1BD54A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Time zone is updated for %{public}@ old schedules: %{public}@, to %{public}@ new schedules: %{public}@", buf, 0x34u);

    a5 = v25;
  }

  BOOL v22 = [(HDMedicationScheduleManager *)self insertMedicationSchedules:v16 error:a5];
  return v22;
}

id __94__HDMedicationScheduleManager__updateSchedulesToTimeZone_maintainCalendarDatesAndTimes_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 createdUTCOffset];
  BOOL v5 = [v4 name];
  uint64_t v6 = [*(id *)(a1 + 32) name];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    _HKInitializeLogging();
    id v8 = HKLogMedication();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      BOOL v10 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138543618;
      uint64_t v50 = v9;
      __int16 v51 = 2114;
      v52 = v10;
      _os_log_impl(&dword_1BD54A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Abort update to the same time zone: %{public}@.", buf, 0x16u);
    }
LABEL_7:
    uint64_t v12 = 0;
    goto LABEL_19;
  }
  if ([v3 isUnavailable])
  {
    _HKInitializeLogging();
    id v8 = HKLogMedication();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v11;
      _os_log_impl(&dword_1BD54A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Abort update to unavailable schedule.", buf, 0xCu);
    }
    goto LABEL_7;
  }
  uint64_t v13 = [v3 timeIntervals];
  uint64_t v14 = [*(id *)(a1 + 32) secondsFromGMT];
  id v15 = [v3 createdUTCOffset];
  uint64_t v16 = v14 - [v15 secondsFromGMT];

  uint64_t v17 = [v3 startDateTime];
  id v18 = [v3 endDateTime];
  uint64_t v19 = [v3 cycleStartDate];
  id v20 = (void *)v19;
  if (*(unsigned char *)(a1 + 56))
  {
    long long v42 = (void *)v19;
    char v21 = [v3 startDateTime];
    double v22 = (double)-v16;
    uint64_t v23 = [v21 dateByAddingTimeInterval:v22];

    uint64_t v24 = [v3 endDateTime];
    uint64_t v25 = [v24 dateByAddingTimeInterval:v22];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v8 = v13;
    uint64_t v26 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v8);
          }
          uint64_t v30 = *(void *)(a1 + 32);
          id v31 = [*(id *)(*((void *)&v44 + 1) + 8 * i) startTimeComponent];
          [v31 setTimeZone:v30];
        }
        uint64_t v27 = [v8 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v27);
    }

    uint64_t v17 = (void *)v23;
    long long v43 = (void *)v25;
    v32 = v42;
  }
  else
  {
    long long v43 = v18;
    __int16 v33 = [v3 timeIntervals];
    id v8 = +[HDMedicationScheduleManager _makeIntervalsWithStartTimeFromIntervals:byAddingTimeDifferenceDuration:calendar:timeZone:]((uint64_t)HDMedicationScheduleManager, v33, v16, *(void **)(a1 + 48), *(void **)(a1 + 32));

    id v34 = [v3 cycleStartDate];
    v32 = +[HDMedicationScheduleManager _makeDateComponentsFromCycleStartDate:byAddingTimeDifferenceSec:calendar:]((uint64_t)HDMedicationScheduleManager, v34, v16, *(void **)(a1 + 48));
  }
  id v35 = objc_alloc(MEMORY[0x1E4F66B28]);
  uint64_t v36 = [v3 UUID];
  __int16 v37 = [v3 medicationIdentifier];
  uint64_t v38 = *(void *)(a1 + 32);
  uint64_t v39 = [v3 scheduleType];
  long long v40 = [v3 note];
  uint64_t v12 = (void *)[v35 initWithUUID:v36 medicationIdentifier:v37 createdUTCOffset:v38 startDateTime:v17 endDateTime:v43 timeIntervals:v8 scheduleType:v39 cycleStartDateComponents:v32 note:v40];

LABEL_19:
  return v12;
}

+ (id)_makeIntervalsWithStartTimeFromIntervals:(uint64_t)a3 byAddingTimeDifferenceDuration:(void *)a4 calendar:(void *)a5 timeZone:
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a2;
  self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __121__HDMedicationScheduleManager__makeIntervalsWithStartTimeFromIntervals_byAddingTimeDifferenceDuration_calendar_timeZone___block_invoke;
  v15[3] = &unk_1E6337400;
  id v17 = v9;
  uint64_t v18 = a3;
  id v16 = v8;
  id v11 = v9;
  id v12 = v8;
  uint64_t v13 = objc_msgSend(v10, "hk_map:", v15);

  return v13;
}

+ (id)_makeDateComponentsFromCycleStartDate:(uint64_t)a3 byAddingTimeDifferenceSec:(void *)a4 calendar:
{
  id v6 = a4;
  id v7 = a2;
  self;
  [v7 setCalendar:v6];
  id v8 = [v7 date];

  id v9 = [v8 dateByAddingTimeInterval:(double)a3];
  id v10 = [v6 components:28 fromDate:v9];
  [v10 setCalendar:v6];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:@"GMT"];
  [v10 setTimeZone:v11];

  return v10;
}

id __121__HDMedicationScheduleManager__makeIntervalsWithStartTimeFromIntervals_byAddingTimeDifferenceDuration_calendar_timeZone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 startTimeComponent];
  uint64_t v5 = +[HDMedicationScheduleManager _durationForDayHourMinuteSecondComponents:]((uint64_t)HDMedicationScheduleManager, v4);
  id v6 = +[HDMedicationScheduleManager _hrMinSecSinceMidnightWithDuration:calendar:]((uint64_t)HDMedicationScheduleManager, *(void *)(a1 + 48) + v5, *(void **)(a1 + 32));
  id v7 = v6;
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v6, "setTimeZone:");
  }
  id v8 = objc_alloc(MEMORY[0x1E4F66B48]);
  uint64_t v9 = [v3 daysOfWeek];
  id v10 = [v3 cycleIndex];
  id v11 = [v3 cycleIntervalDays];
  id v12 = [v3 dose];

  uint64_t v13 = (void *)[v8 initWithStartTimeComponent:v7 daysOfWeek:v9 cycleIndex:v10 cycleIntervalDays:v11 dose:v12];
  return v13;
}

+ (uint64_t)_durationForDayHourMinuteSecondComponents:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([v2 day] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 86400 * [v2 day];
  }
  if ([v2 hour] != 0x7FFFFFFFFFFFFFFFLL) {
    v3 += 3600 * [v2 hour];
  }
  if ([v2 minute] != 0x7FFFFFFFFFFFFFFFLL) {
    v3 += 60 * [v2 minute];
  }
  if ([v2 second] != 0x7FFFFFFFFFFFFFFFLL) {
    v3 += [v2 second];
  }

  return v3;
}

+ (id)_hrMinSecSinceMidnightWithDuration:(void *)a3 calendar:
{
  id v4 = a3;
  self;
  uint64_t v5 = a2 % 86400;
  int v6 = a2 % 86400 / 3600;
  uint64_t v7 = a2 % 86400 - 3600 * v6;
  int v8 = (int)v7 / 60;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  id v11 = v10;
  if ((v5 + 3599) >= 0x1C1F) {
    [v10 setHour:v6];
  }
  double v9 = (double)(v7 - 60 * v8);
  if ((v7 + 59) >= 0x77) {
    [v11 setMinute:v8];
  }
  if ((uint64_t)v9) {
    [v11 setSecond:(uint64_t)v9];
  }
  [v11 setCalendar:v4];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAF0]) initWithName:@"GMT"];
  [v11 setTimeZone:v12];

  return v11;
}

- (BOOL)deleteMedicationSchedule:(id)a3 error:(id *)a4
{
  int v6 = [a3 deletedSchedule];
  LOBYTE(a4) = [(HDMedicationScheduleManager *)self insertMedicationSchedule:v6 error:a4];

  return (char)a4;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)registerSynchronousObserver:(id)a3
{
}

- (void)unregisterSynchronousObserver:(id)a3
{
}

uint64_t __74__HDMedicationScheduleManager__notifyObserversForDidRescheduleMedications__block_invoke(uint64_t a1, void *a2)
{
  return [a2 scheduleManagerDidRescheduleMedications:*(void *)(a1 + 32)];
}

- (void)_notifyObserversDidPruneScheduleItems:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    id v4 = HKLogMedication();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

    if (v5)
    {
      int v6 = HKLogMedication();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[HDMedicationScheduleManager _notifyObserversDidPruneScheduleItems:](a1);
      }
    }
    uint64_t v7 = *(void **)(a1 + 24);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__HDMedicationScheduleManager__notifyObserversDidPruneScheduleItems___block_invoke;
    v8[3] = &unk_1E6337450;
    v8[4] = a1;
    id v9 = v3;
    [v7 notifyObservers:v8];
  }
}

uint64_t __69__HDMedicationScheduleManager__notifyObserversDidPruneScheduleItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 scheduleManager:*(void *)(a1 + 32) didPruneScheduleItems:*(void *)(a1 + 40)];
}

- (BOOL)pruneAllScheduleItemsBeforeDate:(id)a3 createDoseEvents:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  _HKInitializeLogging();
  id v9 = HKLogMedication();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

  if (v10)
  {
    id v11 = HKLogMedication();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[HDMedicationScheduleManager pruneAllScheduleItemsBeforeDate:createDoseEvents:error:]();
    }
  }
  id v12 = [(HDMedicationNotificationManager *)self->_notificationManager pruneAllScheduleItemsBeforeDate:v8 createDoseEvents:v6 error:a5];
  uint64_t v13 = v12;
  if (!v12)
  {
    _HKInitializeLogging();
    uint64_t v14 = HKLogMedication();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v18 = HKDiagnosticStringFromDate();
    id v16 = (void *)v18;
    if (a5) {
      id v19 = *a5;
    }
    else {
      id v19 = 0;
    }
    int v20 = 138543874;
    char v21 = self;
    __int16 v22 = 2114;
    uint64_t v23 = v18;
    __int16 v24 = 2114;
    id v25 = v19;
    _os_log_error_impl(&dword_1BD54A000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to prune schedule items before date %{public}@ with error: %{public}@", (uint8_t *)&v20, 0x20u);
    goto LABEL_10;
  }
  if ([v12 count]) {
    -[HDMedicationScheduleManager _notifyObserversDidPruneScheduleItems:]((uint64_t)self, v13);
  }
  _HKInitializeLogging();
  uint64_t v14 = HKLogMedication();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    id v16 = HKDiagnosticStringFromDate();
    int v20 = 138543874;
    char v21 = self;
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v15;
    __int16 v24 = 2114;
    id v25 = v16;
    _os_log_impl(&dword_1BD54A000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully pruned %@ schedule items before date %{public}@", (uint8_t *)&v20, 0x20u);

LABEL_10:
  }
LABEL_12:

  return v13 != 0;
}

- (void)batchNotifyObserversOnCommitOfTransaction:(id)a3 didAddOrModifySchedule:(id)a4 syncIdentity:(int64_t)a5
{
  id v8 = a3;
  if (-[HDMedicationScheduleManager _addPendingSchedule:syncIdentity:]((uint64_t)self, a4, a5))
  {
    id v9 = [v8 protectedDatabase];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke;
    v13[3] = &unk_1E6337478;
    v13[4] = self;
    id v10 = v8;
    id v14 = v10;
    [v9 beforeCommit:v13];

    v11[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke_2;
    v12[3] = &unk_1E63374A0;
    void v12[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke_3;
    v11[3] = &unk_1E63374C8;
    [v10 onCommit:v12 orRollback:v11];
  }
}

- (BOOL)_addPendingSchedule:(uint64_t)a3 syncIdentity:
{
  id v5 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 48);
    BOOL v7 = v6 == 0;
    if (!v6)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v8;
    }
    id v10 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    id v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:v10];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v10];
    }
    [v11 addObject:v5];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke(uint64_t a1)
{
  return 1;
}

- (void)_handleBeforeCommitOfTransaction:(uint64_t)a1
{
  id v8 = a2;
  if (a1)
  {
    id v3 = -[HDMedicationScheduleManager _pendingSchedulesBySyncIdentity]((os_unfair_lock_s *)a1);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v5 = [WeakRetained currentSyncIdentityPersistentID];

    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v5];
    BOOL v7 = [v3 objectForKeyedSubscript:v6];

    if ([v7 count])
    {
      -[HDMedicationScheduleManager _notifySynchronousObserversInTransaction:willReschedule:](a1, v8, v7);
      [(id)a1 rescheduleMedicationsSynchronously:1];
      -[HDMedicationScheduleManager _notifySynchronousObserversInTransaction:didReschedule:](a1, v8, v7);
    }
    else
    {
      [(id)a1 rescheduleMedicationsSynchronously:0];
    }
  }
}

void __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke_2(uint64_t a1)
{
}

- (void)_handleScheduleTransactionCommit
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v3 = (void *)[*(id *)(a1 + 48) copy];
    id v4 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    os_unfair_lock_unlock(v2);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [v3 allValues];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          [v5 addObjectsFromArray:*(void *)(*((void *)&v18 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    id v11 = *(void **)(a1 + 24);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__HDMedicationScheduleManager__handleScheduleTransactionCommit__block_invoke;
    v14[3] = &unk_1E6337518;
    v14[4] = a1;
    id v15 = v3;
    id v16 = v5;
    id v17 = sel_scheduleManager_didAddOrModifySchedulesBySyncIdentity_;
    id v12 = v5;
    id v13 = v3;
    [v11 notifyObservers:v14];
  }
}

void __109__HDMedicationScheduleManager_batchNotifyObserversOnCommitOfTransaction_didAddOrModifySchedule_syncIdentity___block_invoke_3(uint64_t a1)
{
}

- (void)_handleScheduleTransactionRollback
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v3 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    os_unfair_lock_unlock(v2);
  }
}

- (id)_pendingSchedulesBySyncIdentity
{
  uint64_t v1 = (id *)a1;
  if (a1)
  {
    id v2 = a1 + 10;
    os_unfair_lock_lock(a1 + 10);
    uint64_t v1 = (id *)[v1[6] copy];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)_notifySynchronousObserversInTransaction:(void *)a3 willReschedule:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__HDMedicationScheduleManager__notifySynchronousObserversInTransaction_willReschedule___block_invoke;
    v8[3] = &unk_1E63374F0;
    v8[4] = a1;
    id v9 = v5;
    id v10 = v6;
    [v7 notifyObservers:v8];
  }
}

- (void)_notifySynchronousObserversInTransaction:(void *)a3 didReschedule:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__HDMedicationScheduleManager__notifySynchronousObserversInTransaction_didReschedule___block_invoke;
    v8[3] = &unk_1E63374F0;
    v8[4] = a1;
    id v9 = v5;
    id v10 = v6;
    [v7 notifyObservers:v8];
  }
}

uint64_t __87__HDMedicationScheduleManager__notifySynchronousObserversInTransaction_willReschedule___block_invoke(void *a1, void *a2)
{
  return [a2 scheduleManager:a1[4] transaction:a1[5] willReschedule:a1[6]];
}

uint64_t __86__HDMedicationScheduleManager__notifySynchronousObserversInTransaction_didReschedule___block_invoke(void *a1, void *a2)
{
  return [a2 scheduleManager:a1[4] transaction:a1[5] didReschedule:a1[6]];
}

void __63__HDMedicationScheduleManager__handleScheduleTransactionCommit__block_invoke(void *a1, void *a2)
{
  id v5 = a2;
  char v3 = objc_opt_respondsToSelector();
  uint64_t v4 = a1[4];
  if (v3) {
    [v5 scheduleManager:v4 didAddOrModifySchedulesBySyncIdentity:a1[5]];
  }
  else {
    [v5 scheduleManager:v4 didAddOrModifySchedules:a1[6]];
  }
}

- (id)orderingTermsForSortDescriptors:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    uint64_t v9 = *MEMORY[0x1E4F66958];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v12 = [v11 key];
        int v13 = [v12 isEqualToString:v9];

        if (!v13)
        {
          id v17 = (void *)MEMORY[0x1E4F28C58];
          long long v18 = [v11 key];
          objc_msgSend(v17, "hk_assignError:code:format:", a4, 3, @"We don't have have any sort descriptor key defined for key: '%@'. Please add them here", v18);

          id v15 = obj;
          id v16 = 0;
          goto LABEL_11;
        }
        id v14 = objc_msgSend(MEMORY[0x1E4F65D50], "orderingTermWithProperty:entityClass:ascending:", @"creation_date", objc_opt_class(), objc_msgSend(v11, "ascending"));
        [v5 addObject:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v15 = obj;

  id v16 = v5;
LABEL_11:

  return v16;
}

- (HDMedicationNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (id)unitTesting_willRunRescheduleOperationWithDelay
{
  return self->_unitTesting_willRunRescheduleOperationWithDelay;
}

- (void)setUnitTesting_willRunRescheduleOperationWithDelay:(id)a3
{
}

- (id)unitTesting_didRunRescheduleOperationWithDelay
{
  return self->_unitTesting_didRunRescheduleOperationWithDelay;
}

- (void)setUnitTesting_didRunRescheduleOperationWithDelay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didRunRescheduleOperationWithDelay, 0);
  objc_storeStrong(&self->_unitTesting_willRunRescheduleOperationWithDelay, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_rescheduleOperation, 0);
  objc_storeStrong((id *)&self->_timeZoneManager, 0);
  objc_storeStrong((id *)&self->_observersLock_pendingSchedulesBySyncIdentity, 0);
  objc_storeStrong((id *)&self->_synchronousObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)medicationSchedule:medicationIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(v0, v1);
  id v2 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BD54A000, v3, v4, "[%{public}@] Fetching medication schedule with medication: %{public}@", v5, v6, v7, v8, v9);
}

- (void)_fetchMedicationSchedule:predicate:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@] Fetch medication schedule failed with error: %{public}@");
}

- (void)medicationSchedule:identifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(v0, v1);
  id v2 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BD54A000, v3, v4, "[%{public}@] Fetching medication schedule with schedule: %{public}@", v5, v6, v7, v8, v9);
}

- (void)medicationSchedulesWithPredicate:transaction:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(v0, v1);
  id v2 = self;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BD54A000, v3, v4, "[%{public}@] Fetching medication schedules with predicate: %{public}@", v5, v6, v7, v8, v9);
}

- (void)insertMedicationSchedule:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(v0, v1);
  id v2 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BD54A000, v3, v4, "[%{public}@] Inserting medication schedule: %{public}@", v5, v6, v7, v8, v9);
}

- (void)insertMedicationSchedules:(NSObject *)a3 error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  uint64_t v6 = HKSensitiveLogItem();
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  id v10 = v5;
  __int16 v11 = 2114;
  id v12 = v6;
  _os_log_debug_impl(&dword_1BD54A000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@] Inserting %{public}@ medication schedules: %{public}@", (uint8_t *)&v7, 0x20u);
}

- (void)rescheduleMedicationsWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BD54A000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] Rescheduling medications", (uint8_t *)&v2, 0xCu);
}

- (void)_notifyObserversForDidRescheduleMedications
{
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 24), "count"));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BD54A000, v2, v3, "[%{public}@] Notifying %{public}@ observers of reschedule items.", v4, v5, v6, v7, v8);
}

- (void)rescheduleMedicationsSynchronously:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v0, v1, "[%{public}@]: Failed to reschedule medications synchronously: %{public}@");
}

- (void)_hasPersistedRescheduleRequiredOnNextUnlockFlag
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6();
  uint64_t v4 = @"rescheduleRequired";
  __int16 v5 = v0;
  uint64_t v6 = v1;
  _os_log_error_impl(&dword_1BD54A000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Unable to get value for key %{public}@: %{public}@", v3, 0x20u);
}

- (void)updateNotificationSent:scheduleItemIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(v0, v1);
  os_log_t v2 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BD54A000, v3, v4, "[%{public}@] Updating notification sent for schedule item: %{public}@", v5, v6, v7, v8, v9);
}

- (void)updateSchedulesToLocalTimeZoneAndMaintainCalendarDatesAndTimes:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v0 = HKStringFromBool();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BD54A000, v1, v2, "[%{public}@] Updating schedules for local time zone with maintainCalendarDatesAndTimes: %{public}@", v3, v4, v5, v6, v7);
}

- (void)_notifyObserversDidPruneScheduleItems:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 24), "count"));
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BD54A000, v2, v3, "[%{public}@] Notifying %{public}@ observers of prune schedule items.", v4, v5, v6, v7, v8);
}

- (void)pruneAllScheduleItemsBeforeDate:createDoseEvents:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(v0, v1);
  uint64_t v2 = HKDiagnosticStringFromDate();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BD54A000, v3, v4, "[%{public}@] Started pruning schedule items before date %{public}@", v5, v6, v7, v8, v9);
}

@end