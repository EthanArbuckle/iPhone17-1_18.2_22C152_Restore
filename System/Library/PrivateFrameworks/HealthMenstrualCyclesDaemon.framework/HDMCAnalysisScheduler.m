@interface HDMCAnalysisScheduler
- (HDMCAnalysisScheduler)initWithDaemon:(id)a3 analysisManager:(id)a4 settingsManager:(id)a5 calendarCache:(id)a6;
- (double)_delayUntilNextAnalysisSchedulingWindowStartDateAfterDate:(id)a3;
- (void)_handleActivity:(id)a3 forceRescheduleOnCheckIn:(BOOL)a4;
- (void)_registerActivityAfterCompletion:(BOOL)a3;
- (void)_runAnalysis;
- (void)daemonReady:(id)a3;
- (void)dealloc;
@end

@implementation HDMCAnalysisScheduler

- (HDMCAnalysisScheduler)initWithDaemon:(id)a3 analysisManager:(id)a4 settingsManager:(id)a5 calendarCache:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDMCAnalysisScheduler;
  v14 = [(HDMCAnalysisScheduler *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_analysisManager, a4);
    objc_storeStrong((id *)&v15->_settingsManager, a5);
    objc_storeStrong((id *)&v15->_calendarCache, a6);
    [v10 registerDaemonReadyObserver:v15 queue:0];
  }

  return v15;
}

- (void)dealloc
{
  xpc_activity_unregister("com.apple.Health.menstrualcycles.analysisupdates");
  v3.receiver = self;
  v3.super_class = (Class)HDMCAnalysisScheduler;
  [(HDMCAnalysisScheduler *)&v3 dealloc];
}

- (void)_registerActivityAfterCompletion:(BOOL)a3
{
  objc_initWeak(&location, self);
  v4 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __58__HDMCAnalysisScheduler__registerActivityAfterCompletion___block_invoke;
  handler[3] = &unk_264750ED8;
  objc_copyWeak(&v6, &location);
  BOOL v7 = a3;
  xpc_activity_register("com.apple.Health.menstrualcycles.analysisupdates", v4, handler);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__HDMCAnalysisScheduler__registerActivityAfterCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleActivity:v4 forceRescheduleOnCheckIn:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_handleActivity:(id)a3 forceRescheduleOnCheckIn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = (_xpc_activity_s *)a3;
  xpc_activity_state_t state = xpc_activity_get_state(v6);
  if (state == 2)
  {
    [(HDMCAnalysisScheduler *)self _runAnalysis];
    if ((xpc_activity_set_completion_status() & 1) == 0)
    {
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x263F09930];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HDMCAnalysisScheduler _handleActivity:forceRescheduleOnCheckIn:](v18);
      }
    }
    [(HDMCAnalysisScheduler *)self _registerActivityAfterCompletion:1];
  }
  else
  {
    uint64_t v8 = state;
    if (!state)
    {
      xpc_object_t v9 = xpc_activity_copy_criteria(v6);
      id v10 = v9;
      id v11 = (const char **)MEMORY[0x263EF81A0];
      if (v9)
      {
        int64_t int64 = xpc_dictionary_get_int64(v9, (const char *)*MEMORY[0x263EF81A0]);
        _HKInitializeLogging();
        id v13 = (void *)*MEMORY[0x263F09930];
        BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_INFO);
        if (int64)
        {
          if (!v4)
          {
            if (v14)
            {
              v24 = v13;
              v25 = objc_opt_class();
              v26 = NSNumber;
              id v27 = v25;
              v28 = [v26 numberWithLongLong:int64];
              int v29 = 138543618;
              id v30 = v25;
              __int16 v31 = 2112;
              v32 = v28;
              _os_log_impl(&dword_225722000, v24, OS_LOG_TYPE_INFO, "[%{public}@] Found existing valid criteria; not rescheduling. Delay: %@",
                (uint8_t *)&v29,
                0x16u);
            }
            goto LABEL_20;
          }
          if (v14)
          {
            v15 = v13;
            int v29 = 138543362;
            id v30 = (id)objc_opt_class();
            id v16 = v30;
            objc_super v17 = "[%{public}@] Rescheduling for completed activity";
LABEL_18:
            _os_log_impl(&dword_225722000, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v29, 0xCu);
          }
        }
        else if (v14)
        {
          v15 = v13;
          int v29 = 138543362;
          id v30 = (id)objc_opt_class();
          id v16 = v30;
          objc_super v17 = "[%{public}@] No delay found in existing criteria";
          goto LABEL_18;
        }
      }
      else
      {
        _HKInitializeLogging();
        v20 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_INFO))
        {
          v15 = v20;
          int v29 = 138543362;
          id v30 = (id)objc_opt_class();
          id v16 = v30;
          objc_super v17 = "[%{public}@] No existing criteria found";
          goto LABEL_18;
        }
      }
      xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);

      xpc_dictionary_set_BOOL(v21, (const char *)*MEMORY[0x263EF82A8], 1);
      xpc_dictionary_set_string(v21, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
      xpc_dictionary_set_BOOL(v21, (const char *)*MEMORY[0x263EF8180], 1);
      xpc_dictionary_set_BOOL(v21, (const char *)*MEMORY[0x263EF82A0], 0);
      v22 = [MEMORY[0x263EFF910] date];
      [(HDMCAnalysisScheduler *)self _delayUntilNextAnalysisSchedulingWindowStartDateAfterDate:v22];
      xpc_dictionary_set_int64(v21, *v11, (uint64_t)v23);
      xpc_dictionary_set_int64(v21, (const char *)*MEMORY[0x263EF81C0], 3600);
      xpc_activity_set_criteria(v6, v21);

      id v10 = v21;
LABEL_20:

      goto LABEL_21;
    }
    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HDMCAnalysisScheduler _handleActivity:forceRescheduleOnCheckIn:](v19, (uint64_t)self, v8);
    }
  }
LABEL_21:
}

- (double)_delayUntilNextAnalysisSchedulingWindowStartDateAfterDate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  settingsManager = self->_settingsManager;
  id v6 = [(HKCalendarCache *)self->_calendarCache currentCalendar];
  BOOL v7 = [(HKMCSettingsManager *)settingsManager hdmc_nextAnalysisSchedulingWindowStartDateAfterDate:v4 calendar:v6];

  if (v7)
  {
    [v7 timeIntervalSinceDate:v4];
    double v9 = v8;
  }
  else
  {
    _HKInitializeLogging();
    id v10 = (void *)*MEMORY[0x263F09930];
    double v9 = 86400.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_FAULT))
    {
      id v12 = v10;
      id v13 = objc_opt_class();
      calendarCache = self->_calendarCache;
      id v15 = v13;
      id v16 = [(HKCalendarCache *)calendarCache currentCalendar];
      int v17 = 138543874;
      v18 = v13;
      __int16 v19 = 2114;
      id v20 = v4;
      __int16 v21 = 2114;
      v22 = v16;
      _os_log_fault_impl(&dword_225722000, v12, OS_LOG_TYPE_FAULT, "[%{public}@] Next date to schedule analysis after %{public}@ should not be nil, calendar: %{public}@", (uint8_t *)&v17, 0x20u);
    }
  }

  return v9;
}

- (void)_runAnalysis
{
  id v1 = a1;
  v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] We are firing this block at an unusual time inbetween midnight and 6pm at date of %{public}@", v6, v7, v8, v9, v10);
}

- (void)daemonReady:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  uint64_t v4 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    *(_DWORD *)uint64_t v7 = 138543362;
    *(void *)&v7[4] = objc_opt_class();
    id v6 = *(id *)&v7[4];
    _os_log_impl(&dword_225722000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Daemon ready, scheduling activity", v7, 0xCu);
  }
  -[HDMCAnalysisScheduler _registerActivityAfterCompletion:](self, "_registerActivityAfterCompletion:", 0, *(_OWORD *)v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_analysisManager, 0);
}

- (void)_handleActivity:(uint64_t)a3 forceRescheduleOnCheckIn:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  uint64_t v5 = objc_opt_class();
  id v6 = NSNumber;
  id v7 = v5;
  BOOL v14 = [v6 numberWithLong:a3];
  OUTLINED_FUNCTION_1(&dword_225722000, v8, v9, "[%{public}@] Unexpected activity registration state: %@", v10, v11, v12, v13, 2u);
}

- (void)_handleActivity:(void *)a1 forceRescheduleOnCheckIn:.cold.2(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_225722000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to update completion state", (uint8_t *)&v3, 0xCu);
}

@end