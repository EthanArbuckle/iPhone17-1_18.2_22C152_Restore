@interface HDMCOvulationConfirmationStateManager
- (BOOL)transitionToFiredNotificationStateWithRequest:(id)a3 settingsManager:(id)a4 error:(id *)a5;
- (HDMCOvulationConfirmationStateManager)initWithProfile:(id)a3 settingsManager:(id)a4 queue:(id)a5;
- (id)_daysWithWristTemperatureSamplesInDayIndexRange:(id)a3 calendarCache:(id)a4 error:(id *)a5;
- (id)eventsToScheduleForAnalysis:(id)a3 settingsManager:(id)a4 scheduler:(id)a5 error:(id *)a6;
- (id)scheduledNotificationDaysShiftedFromCalendarMethodWithEvent:(id)a3 error:(id *)a4;
- (id)scheduledNotificationFertileWindowEndDayIndexWithEvent:(id)a3 error:(id *)a4;
- (void)_queue_clearStateIfNecessary;
- (void)_triggerImmediateSyncWithReason:(id)a3;
- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4;
- (void)settingsManagerDidUpdateNotificationSettings:(id)a3;
@end

@implementation HDMCOvulationConfirmationStateManager

- (HDMCOvulationConfirmationStateManager)initWithProfile:(id)a3 settingsManager:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HDMCOvulationConfirmationStateManager;
  v11 = [(HDMCOvulationConfirmationStateManager *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    objc_storeStrong((id *)&v12->_settingsManager, a4);
    objc_storeStrong((id *)&v12->_queue, a5);
    v13 = (void *)MEMORY[0x263F43218];
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_profile);
    uint64_t v15 = objc_msgSend(v13, "hdmc_menstrualCyclesOvulationConfirmationNotificationStateSyncedUnprotectedDomainWithProfile:", WeakRetained);
    keyValueDomain = v12->_keyValueDomain;
    v12->_keyValueDomain = (HDKeyValueDomain *)v15;

    v17 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x263F0A130]);
    calendarCache = v12->_calendarCache;
    v12->_calendarCache = v17;

    [(HKMCSettingsManager *)v12->_settingsManager addObserver:v12 queue:v10];
    id v19 = objc_loadWeakRetained((id *)&v12->_profile);
    v20 = [v19 featureSettingsManager];
    [v20 registerObserver:v12 featureIdentifier:*MEMORY[0x263F097B0] queue:v10];
  }
  return v12;
}

- (id)eventsToScheduleForAnalysis:(id)a3 settingsManager:(id)a4 scheduler:(id)a5 error:(id *)a6
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  keyValueDomain = self->_keyValueDomain;
  id v65 = 0;
  v14 = [(HDKeyValueDomain *)keyValueDomain hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:&v65];
  id v15 = v65;
  v16 = v15;
  if (v14)
  {
    v62 = v12;
    id v17 = [MEMORY[0x263EFF910] date];
    v18 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    uint64_t v19 = objc_msgSend(v17, "hk_morningIndexWithCalendar:", v18);

    calendarCache = self->_calendarCache;
    id v64 = v16;
    v21 = -[HDMCOvulationConfirmationStateManager _daysWithWristTemperatureSamplesInDayIndexRange:calendarCache:error:](self, "_daysWithWristTemperatureSamplesInDayIndexRange:calendarCache:error:", v19 - 45, 45, calendarCache, &v64);
    id v22 = v64;

    v61 = v21;
    if (!v21)
    {
      id v35 = v22;
      id v24 = v35;
      if (v35)
      {
        if (a6)
        {
          id v24 = v35;
          v36 = a6;
          a6 = 0;
          v33 = 0;
          id *v36 = v24;
          id v34 = v24;
LABEL_38:

          id v12 = v62;
          goto LABEL_39;
        }
        _HKLogDroppedError();
      }
      else
      {
        a6 = 0;
      }
      v33 = 0;
      id v34 = v24;
      goto LABEL_38;
    }
    v56 = a6;
    v23 = [v11 fertileWindowNotificationTimeOfDay];
    objc_msgSend(v14, "computeNewStateFromAnalysis:currentDate:fertileWindowNotificationTimeOfDay:fertilityNotificationsEnabled:daysWithWristTemp45DaysBeforeOvulationConfirmed:", v10, v17, v23, objc_msgSend(v11, "fertileWindowNotificationsEnabled"), objc_msgSend(v21, "integerValue"));
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    v25 = [v24 scheduledNotificationFireDayIndex];

    id v60 = v11;
    if (v25)
    {
      id v58 = v10;
      v26 = [v24 scheduledNotificationFireDayIndex];
      v27 = objc_msgSend(v11, "hdmc_dateComponentsForFertileWindowNotificationOnDayIndex:", objc_msgSend(v26, "integerValue"));

      v28 = [v62 eventWithIdentifier:*MEMORY[0x263F45058] dueDateComponents:v27 eventOptions:0];
      v29 = [v28 currentDueDate];
      int v30 = objc_msgSend(v29, "hk_isAfterDate:", v17);

      if (v30)
      {
        a6 = v28;
      }
      else
      {
        _HKInitializeLogging();
        v37 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
        {
          v38 = v37;
          v39 = objc_opt_class();
          id v55 = v39;
          v40 = HKSensitiveLogItem();
          *(_DWORD *)buf = 138543618;
          v68 = v39;
          __int16 v69 = 2114;
          v70 = v40;
          _os_log_impl(&dword_225722000, v38, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping scheduling past due event %{public}@", buf, 0x16u);
        }
        a6 = 0;
      }
      id v11 = v60;

      id v10 = v58;
    }
    else
    {
      a6 = 0;
    }
    if (objc_msgSend(v24, "isEqual:", v14, v55))
    {
      _HKInitializeLogging();
      v41 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        v42 = v41;
        v43 = objc_opt_class();
        id v44 = v43;
        v45 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543618;
        v68 = v43;
        __int16 v69 = 2114;
        v70 = v45;
        _os_log_impl(&dword_225722000, v42, OS_LOG_TYPE_DEFAULT, "[%{public}@] State unchanged: %{public}@", buf, 0x16u);

        id v11 = v60;
      }
      id v34 = v22;
      if (a6)
      {
LABEL_22:
        v66 = a6;
        v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v66 count:1];
        goto LABEL_38;
      }
    }
    else
    {
      v46 = self->_keyValueDomain;
      id v63 = v22;
      BOOL v47 = [(HDKeyValueDomain *)v46 hdmc_menstrualCyclesOvulationConfirmationNotificationSetValuesWithState:v24 error:&v63];
      id v34 = v63;

      if (!v47)
      {
        id v53 = v34;
        id v34 = v53;
        id v11 = v60;
        if (v53)
        {
          if (v56) {
            id *v56 = v53;
          }
          else {
            _HKLogDroppedError();
          }
        }

        v33 = 0;
        goto LABEL_38;
      }
      _HKInitializeLogging();
      v48 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
      {
        v49 = v48;
        v50 = objc_opt_class();
        id v57 = v50;
        HKSensitiveLogItem();
        v51 = id v59 = v10;
        v52 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        v68 = v50;
        __int16 v69 = 2114;
        v70 = v51;
        __int16 v71 = 2114;
        v72 = v52;
        _os_log_impl(&dword_225722000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully transitioned old state: %{public}@ -> new state: %{public}@", buf, 0x20u);

        id v10 = v59;
      }
      [(HDMCOvulationConfirmationStateManager *)self _triggerImmediateSyncWithReason:@"OvulationConfirmationNotificationSetValuesWithState - State Change"];
      id v11 = v60;
      if (a6) {
        goto LABEL_22;
      }
    }
    v33 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_38;
  }
  id v31 = v15;
  id v17 = v31;
  if (v31)
  {
    if (a6)
    {
      id v17 = v31;
      v32 = a6;
      a6 = 0;
      v33 = 0;
      id *v32 = v17;
      id v34 = v17;
      goto LABEL_39;
    }
    _HKLogDroppedError();
  }
  else
  {
    a6 = 0;
  }
  v33 = 0;
  id v34 = v17;
LABEL_39:

  return v33;
}

- (id)scheduledNotificationFertileWindowEndDayIndexWithEvent:(id)a3 error:(id *)a4
{
  v7 = objc_msgSend(a3, "hdmc_categoryIdentifier");
  int v8 = [v7 isEqualToString:*MEMORY[0x263F45058]];

  if (!v8)
  {
    id v15 = &unk_26D8EE968;
    goto LABEL_19;
  }
  keyValueDomain = self->_keyValueDomain;
  id v20 = 0;
  id v10 = [(HDKeyValueDomain *)keyValueDomain hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:&v20];
  id v11 = v20;
  id v12 = v11;
  if (v10)
  {
    v13 = [v10 scheduledNotificationFertileWindowEndDayIndex];
    id v14 = v13;
    if (v13)
    {
      id v14 = v13;
      id v15 = v14;
    }
    else
    {
      _HKInitializeLogging();
      id v17 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HDMCOvulationConfirmationStateManager scheduledNotificationFertileWindowEndDayIndexWithEvent:error:](v17, (uint64_t)self, v10);
      }
      objc_msgSend(MEMORY[0x263F087E8], "hk_errorForNilArgument:class:selector:", @"scheduledNotificationFertileWindowEndDayIndex", objc_opt_class(), a2);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        if (a4) {
          *a4 = v18;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v15 = 0;
    }
    goto LABEL_18;
  }
  id v16 = v11;
  id v14 = v16;
  if (!v16) {
    goto LABEL_15;
  }
  if (!a4)
  {
    _HKLogDroppedError();
LABEL_15:
    id v15 = 0;
    goto LABEL_18;
  }
  id v14 = v16;
  id v15 = 0;
  *a4 = v14;
LABEL_18:

LABEL_19:
  return v15;
}

- (id)scheduledNotificationDaysShiftedFromCalendarMethodWithEvent:(id)a3 error:(id *)a4
{
  v7 = objc_msgSend(a3, "hdmc_categoryIdentifier");
  int v8 = [v7 isEqualToString:*MEMORY[0x263F45058]];

  if (!v8)
  {
    id v15 = 0;
    goto LABEL_19;
  }
  keyValueDomain = self->_keyValueDomain;
  id v20 = 0;
  id v10 = [(HDKeyValueDomain *)keyValueDomain hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:&v20];
  id v11 = v20;
  id v12 = v11;
  if (v10)
  {
    v13 = [v10 scheduledNotificationDaysShiftedForFertileWindow];
    id v14 = v13;
    if (v13)
    {
      id v14 = v13;
      id v15 = v14;
    }
    else
    {
      _HKInitializeLogging();
      id v17 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HDMCOvulationConfirmationStateManager scheduledNotificationFertileWindowEndDayIndexWithEvent:error:](v17, (uint64_t)self, v10);
      }
      objc_msgSend(MEMORY[0x263F087E8], "hk_errorForNilArgument:class:selector:", @"scheduledNotificationFertileWindowEndDayIndex", objc_opt_class(), a2);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        if (a4) {
          *a4 = v18;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v15 = 0;
    }
    goto LABEL_18;
  }
  id v16 = v11;
  id v14 = v16;
  if (!v16) {
    goto LABEL_15;
  }
  if (!a4)
  {
    _HKLogDroppedError();
LABEL_15:
    id v15 = 0;
    goto LABEL_18;
  }
  id v14 = v16;
  id v15 = 0;
  *a4 = v14;
LABEL_18:

LABEL_19:
  return v15;
}

- (BOOL)transitionToFiredNotificationStateWithRequest:(id)a3 settingsManager:(id)a4 error:(id *)a5
{
  id v9 = a4;
  id v10 = [a3 content];
  id v11 = [v10 categoryIdentifier];
  uint64_t v12 = *MEMORY[0x263F45058];
  int v13 = [v11 isEqualToString:*MEMORY[0x263F45058]];

  if (v13)
  {
    id v14 = [MEMORY[0x263EFF910] date];
    id v15 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    uint64_t v16 = objc_msgSend(v14, "hk_dayIndexWithCalendar:", v15);

    keyValueDomain = self->_keyValueDomain;
    id v40 = 0;
    id v18 = [(HDKeyValueDomain *)keyValueDomain hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:&v40];
    id v19 = v40;
    id v20 = v19;
    if (!v18 && v19)
    {
      if (a5)
      {
        id v20 = v19;
        BOOL v21 = 0;
        *a5 = v20;
      }
      else
      {
        _HKLogDroppedError();
        BOOL v21 = 0;
      }
      goto LABEL_27;
    }
    id v22 = [v18 computeFiredStateWithCurrentDayIndex:v16];
    if (v22)
    {
      v33 = a5;
      v23 = self->_keyValueDomain;
      v38 = v22;
      id v39 = v20;
      BOOL v36 = [(HDKeyValueDomain *)v23 hdmc_menstrualCyclesOvulationConfirmationNotificationSetValuesWithState:v22 error:&v39];
      id v37 = v39;

      id v34 = (void *)MEMORY[0x263F45190];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      id v24 = [WeakRetained notificationManager];
      uint64_t v25 = [v24 areHealthNotificationsAuthorized];
      v26 = [v18 scheduledNotificationDaysShiftedForFertileWindow];
      v27 = NSNumber;
      v28 = [v18 scheduledNotificationFertileWindowEndDayIndex];
      v29 = objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "integerValue") - v16);
      int v30 = [v18 scheduledNotificationDaysWithWristTemp45DaysBeforeOvulationConfirmed];
      objc_msgSend(v34, "submitMetricForCategory:areHealthNotificationsAuthorized:numberOfDaysShiftedForFertileWindow:numberOfDaysOffsetFromFertileWindowEnd:numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:internalLiveOnCycleFactorOverrideEnabled:", v12, v25, v26, v29, v30, objc_msgSend(v9, "internalCycleFactorsOverrideEnabled"));

      if (v36)
      {
        [(HDMCOvulationConfirmationStateManager *)self _triggerImmediateSyncWithReason:@"OvulationConfirmationNotificationSetValuesWithState - Fired"];
        BOOL v21 = 1;
        id v20 = v37;
        id v22 = v38;
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      _HKInitializeLogging();
      id v22 = v38;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HDMCOvulationConfirmationStateManager transitionToFiredNotificationStateWithRequest:settingsManager:error:]();
      }
      id v20 = v37;
      if (v20)
      {
        if (v33) {
          id *v33 = v20;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HDMCOvulationConfirmationStateManager transitionToFiredNotificationStateWithRequest:settingsManager:error:]();
      }
      objc_msgSend(MEMORY[0x263F087E8], "hk_errorForNilArgument:class:selector:", @"firedState", objc_opt_class(), a2);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        if (a5) {
          *a5 = v31;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    BOOL v21 = 0;
    goto LABEL_26;
  }
  BOOL v21 = 1;
LABEL_28:

  return v21;
}

- (void)_queue_clearStateIfNecessary
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error clearing key value domain of ovulation confirmation notification state: %{public}@", v7, v8, v9, v10, v11);
}

- (id)_daysWithWristTemperatureSamplesInDayIndexRange:(id)a3 calendarCache:(id)a4 error:(id *)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v9 = a4;
  uint64_t v10 = [HDMCDaySummaryEnumerator alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(v19) = 1;
  uint64_t v12 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v10, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", WeakRetained, v9, var0, var1, 1, 0, v19);

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v20[4] = &v22;
  id v21 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __109__HDMCOvulationConfirmationStateManager__daysWithWristTemperatureSamplesInDayIndexRange_calendarCache_error___block_invoke;
  v20[3] = &unk_264750A18;
  LOBYTE(WeakRetained) = [(HDMCDaySummaryEnumerator *)v12 enumerateWithError:&v21 handler:v20];
  id v13 = v21;
  id v14 = v13;
  if (WeakRetained)
  {
    id v15 = [NSNumber numberWithInteger:v23[3]];
  }
  else
  {
    id v16 = v13;
    id v17 = v16;
    if (v16)
    {
      if (a5) {
        *a5 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v15 = 0;
  }
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __109__HDMCOvulationConfirmationStateManager__daysWithWristTemperatureSamplesInDayIndexRange_calendarCache_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 wristTemperature];

  if (v3) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (void)_triggerImmediateSyncWithReason:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v6 = [WeakRetained cloudSyncManager];
  id v7 = objc_alloc(MEMORY[0x263F0A1C8]);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F0A160]) initWithPush:1 pull:0 lite:1];
  id v9 = (void *)[v7 initWithChangesSyncRequest:v8];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__HDMCOvulationConfirmationStateManager__triggerImmediateSyncWithReason___block_invoke;
  v11[3] = &unk_264750B28;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v6 syncWithRequest:v9 reason:v10 completion:v11];
}

void __73__HDMCOvulationConfirmationStateManager__triggerImmediateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  _HKInitializeLogging();
  uint64_t v6 = (void *)*MEMORY[0x263F09930];
  id v7 = *MEMORY[0x263F09930];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v6;
      id v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      id v11 = v9;
      _os_log_impl(&dword_225722000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed for %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __73__HDMCOvulationConfirmationStateManager__triggerImmediateSyncWithReason___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }
}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(HDMCOvulationConfirmationStateManager *)self _queue_clearStateIfNecessary];
}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(HDMCOvulationConfirmationStateManager *)self _queue_clearStateIfNecessary];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)scheduledNotificationFertileWindowEndDayIndexWithEvent:(void *)a3 error:.cold.1(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = (id)objc_opt_class();
  uint64_t v6 = NSStringFromHDMCOvulationConfirmationNotificationState(2);
  id v7 = NSStringFromHDMCOvulationConfirmationNotificationState([a3 stateType]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_225722000, v8, v9, "[%{public}@] Expected ovulation confirmation state:%{public}@ but received: %{public}@", v10, v11, v12, v13, v14);
}

- (void)transitionToFiredNotificationStateWithRequest:settingsManager:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving fired state from scheduled state: %{public}@", v7, v8, v9, v10, v11);
}

void __73__HDMCOvulationConfirmationStateManager__triggerImmediateSyncWithReason___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 40);
  int v9 = 138543874;
  uint64_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = a3;
  id v8 = v6;
  _os_log_error_impl(&dword_225722000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Cloud sync request for %{public}@ failed: %{public}@", (uint8_t *)&v9, 0x20u);
}

@end