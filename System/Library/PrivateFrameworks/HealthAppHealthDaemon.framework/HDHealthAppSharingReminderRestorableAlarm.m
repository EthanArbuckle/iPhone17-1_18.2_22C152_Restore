@interface HDHealthAppSharingReminderRestorableAlarm
- (BOOL)setSharingReminderDate:(id)a3 error:(id *)a4;
- (HDDaemon)daemon;
- (HDHealthAppSharingReminderRestorableAlarm)initWithDaemon:(id)a3;
- (NSDate)unitTest_currentDate;
- (NSString)eventIdentifier;
- (UNUserNotificationCenter)unitTest_userNotificationCenter;
- (id)currentDate;
- (id)nextSharingReminderDateFromDate:(id)a3;
- (id)sharingReminderDate;
- (id)sharingReminderFallbackNotificationDate:(id)a3;
- (id)sharingReminderRefreshIntervalDateComponents;
- (void)_handleCompletionWithAlarmEvent:(id)a3 success:(BOOL)a4 error:(id)a5 restorableAlarmManager:(id)a6 completion:(id)a7;
- (void)handleAlarmEvent:(id)a3 restorableAlarmManager:(id)a4 completion:(id)a5;
- (void)removeScheduledAlarmWithRestorableAlarmManager:(id)a3;
- (void)scheduleAlarmWithFallbackDate:(id)a3 restorableAlarmManager:(id)a4;
- (void)setUnitTest_currentDate:(id)a3;
- (void)setUnitTest_userNotificationCenter:(id)a3;
- (void)sharingReminderDate;
@end

@implementation HDHealthAppSharingReminderRestorableAlarm

- (HDHealthAppSharingReminderRestorableAlarm)initWithDaemon:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDHealthAppSharingReminderRestorableAlarm;
  v5 = [(HDHealthAppSharingReminderRestorableAlarm *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    id v7 = objc_alloc(MEMORY[0x263F43218]);
    v8 = [v4 primaryProfile];
    uint64_t v9 = [v7 initWithCategory:1 domainName:@"HDHealthAppDaemonExtension" profile:v8];
    sharingKeyValueDomain = v6->_sharingKeyValueDomain;
    v6->_sharingKeyValueDomain = (HDKeyValueDomain *)v9;

    v11 = [_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager alloc];
    v12 = [v4 primaryProfile];
    uint64_t v13 = [(HDHealthAppNotificationManager *)v11 initWithProfile:v12];
    notificationManager = v6->_notificationManager;
    v6->_notificationManager = (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *)v13;
  }
  return v6;
}

- (NSString)eventIdentifier
{
  return (NSString *)@"HAHealthAppSharingReminderRestorableAlarmEventIdentifier";
}

- (void)scheduleAlarmWithFallbackDate:(id)a3 restorableAlarmManager:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HDHealthAppSharingReminderRestorableAlarm *)self sharingReminderDate];
  if (v8
    || ([(HDHealthAppSharingReminderRestorableAlarm *)self sharingReminderFallbackNotificationDate:v6], (v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = [(HDHealthAppSharingReminderRestorableAlarm *)self nextSharingReminderDateFromDate:v8];
    [v7 scheduleAlarmEventWithHandler:self dueDate:v9 eventOptions:1];
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = objc_opt_class();
      id v13 = v12;
      v14 = [(HDHealthAppSharingReminderRestorableAlarm *)self eventIdentifier];
      int v16 = 138543618;
      v17 = v12;
      __int16 v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_250D3F000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduled alarm event %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x263F09968];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      -[HDHealthAppSharingReminderRestorableAlarm scheduleAlarmWithFallbackDate:restorableAlarmManager:](v15, self);
    }
  }
}

- (void)removeScheduledAlarmWithRestorableAlarmManager:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[HDHealthAppDefines sharingReminderNotificationIdentifier];
  id v6 = [(HDHealthAppSharingReminderRestorableAlarm *)self eventIdentifier];
  id v14 = 0;
  [v4 removeAlarmEventWithIdentifier:v6 error:&v14];

  id v7 = v14;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x263F09968];
  uint64_t v9 = *MEMORY[0x263F09968];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HDHealthAppSharingReminderRestorableAlarm removeScheduledAlarmWithRestorableAlarmManager:]();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v8;
    v11 = objc_opt_class();
    id v12 = v11;
    id v13 = [(HDHealthAppSharingReminderRestorableAlarm *)self eventIdentifier];
    *(_DWORD *)buf = 138543618;
    int v16 = v11;
    __int16 v17 = 2114;
    __int16 v18 = v13;
    _os_log_impl(&dword_250D3F000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removed alarm event %{public}@", buf, 0x16u);
  }
  [(HDHealthAppNotificationManager *)self->_notificationManager removeNotificationWithIdentifier:v5];
}

- (void)handleAlarmEvent:(id)a3 restorableAlarmManager:(id)a4 completion:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  v11 = (os_log_t *)MEMORY[0x263F09968];
  id v12 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = objc_opt_class();
    id v15 = v14;
    int v16 = [v8 description];
    *(_DWORD *)buf = 138543618;
    v43 = v14;
    __int16 v44 = 2114;
    v45 = v16;
    _os_log_impl(&dword_250D3F000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received alarm event %{public}@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  __int16 v18 = [WeakRetained primaryProfile];

  uint64_t v19 = [[_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager alloc] initWithProfile:v18];
  _HKInitializeLogging();
  os_log_t v20 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v22 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v43 = v22;
    id v23 = v22;
    _os_log_impl(&dword_250D3F000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating sharing reminder notification.", buf, 0xCu);
  }
  id v41 = 0;
  v24 = [(HDHealthAppNotificationManager *)v19 createSharingReminderNotificationAndReturnError:&v41];
  id v25 = v41;
  v26 = v25;
  if (!v24 || v25)
  {
    [(HDHealthAppSharingReminderRestorableAlarm *)self _handleCompletionWithAlarmEvent:v8 success:0 error:v25 restorableAlarmManager:v9 completion:v10];
  }
  else
  {
    id v27 = objc_loadWeakRetained((id *)&self->_daemon);
    v28 = self;
    v29 = v19;
    v30 = v18;
    id v31 = v8;
    id v32 = v10;
    id v33 = v9;
    v34 = v27;
    v35 = [v27 primaryProfile];
    v36 = [v35 notificationManager];

    id v9 = v33;
    id v10 = v32;
    id v8 = v31;
    __int16 v18 = v30;
    uint64_t v19 = v29;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __96__HDHealthAppSharingReminderRestorableAlarm_handleAlarmEvent_restorableAlarmManager_completion___block_invoke;
    v37[3] = &unk_2653588A8;
    v37[4] = v28;
    id v38 = v8;
    id v39 = v9;
    id v40 = v10;
    [v36 postNotificationWithRequest:v24 completion:v37];
  }
}

uint64_t __96__HDHealthAppSharingReminderRestorableAlarm_handleAlarmEvent_restorableAlarmManager_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleCompletionWithAlarmEvent:*(void *)(a1 + 40) success:a2 error:a3 restorableAlarmManager:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_handleCompletionWithAlarmEvent:(id)a3 success:(BOOL)a4 error:(id)a5 restorableAlarmManager:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void, id))a7;
  _HKInitializeLogging();
  int v16 = (os_log_t *)MEMORY[0x263F09968];
  __int16 v17 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = v17;
    uint64_t v19 = objc_opt_class();
    id v20 = v19;
    v21 = [v12 eventIdentifier];
    *(_DWORD *)buf = 138544130;
    v36 = v19;
    __int16 v37 = 2114;
    id v38 = v21;
    __int16 v39 = 1024;
    BOOL v40 = v10;
    __int16 v41 = 2114;
    id v42 = v13;
    _os_log_impl(&dword_250D3F000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling completion of alarm event %{public}@ success: %d error: %{public}@", buf, 0x26u);

    int v16 = (os_log_t *)MEMORY[0x263F09968];
  }
  v22 = [(HDHealthAppSharingReminderRestorableAlarm *)self currentDate];
  if (v10)
  {
    id v34 = v13;
    BOOL v23 = [(HDHealthAppSharingReminderRestorableAlarm *)self setSharingReminderDate:v22 error:&v34];
    id v24 = v34;

    _HKInitializeLogging();
    os_log_t v25 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      id v27 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v36 = v27;
      __int16 v37 = 2112;
      id v38 = v22;
      __int16 v39 = 1026;
      BOOL v40 = v23;
      id v33 = v12;
      id v28 = v14;
      v29 = v16;
      id v30 = v27;
      _os_log_impl(&dword_250D3F000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updated sharing reminder date to %@ successfully: %{public}d", buf, 0x1Cu);

      int v16 = v29;
      id v14 = v28;
      id v12 = v33;
    }
    if (v23)
    {
      id v31 = [(HDHealthAppSharingReminderRestorableAlarm *)self nextSharingReminderDateFromDate:v22];
      [v14 rescheduleAlarmEvent:v12 dueDate:v31];

      int v32 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    id v24 = v13;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR)) {
    -[HDHealthAppSharingReminderRestorableAlarm _handleCompletionWithAlarmEvent:success:error:restorableAlarmManager:completion:]();
  }
  int v32 = 0;
LABEL_12:
  v15[2](v15, v32 & v10, v24);
}

- (id)sharingReminderDate
{
  sharingKeyValueDomain = self->_sharingKeyValueDomain;
  id v7 = 0;
  v3 = [(HDKeyValueDomain *)sharingKeyValueDomain dateForKey:@"HAHealthAppSharingReminderDateNotifiedKey" error:&v7];
  id v4 = v7;
  if (v4)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      -[HDHealthAppSharingReminderRestorableAlarm sharingReminderDate]();
    }
    id v5 = 0;
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (id)sharingReminderFallbackNotificationDate:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F43218]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v7 = [WeakRetained primaryProfile];
  id v8 = (void *)[v5 initWithCategory:100 domainName:@"com.apple.Health.SharingEntries" profile:v7];

  id v35 = 0;
  id v9 = [v8 dateForKey:@"SharingReminderNotificationDate" error:&v35];
  id v10 = v35;
  v11 = v10;
  id v12 = 0;
  if (v9) {
    BOOL v13 = v10 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13) {
    goto LABEL_11;
  }
  id v34 = 0;
  BOOL v14 = [(HDHealthAppSharingReminderRestorableAlarm *)self setSharingReminderDate:v9 error:&v34];
  id v15 = v34;
  id v16 = v15;
  if (!v14)
  {
    id v12 = v15;
LABEL_11:
    id v21 = v4;
    if (!v21)
    {
      id v21 = [(HDHealthAppSharingReminderRestorableAlarm *)self currentDate];
      _HKInitializeLogging();
      v22 = (void *)*MEMORY[0x263F09968];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v23 = v22;
        id v24 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        __int16 v37 = v24;
        __int16 v38 = 2112;
        id v39 = v21;
        id v25 = v24;
        _os_log_impl(&dword_250D3F000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] No fallback date found, using current date as backup to the backup: %@", buf, 0x16u);
      }
    }
    id v33 = v12;
    BOOL v26 = [(HDHealthAppSharingReminderRestorableAlarm *)self setSharingReminderDate:v21 error:&v33];
    id v16 = v33;

    _HKInitializeLogging();
    id v27 = (void *)*MEMORY[0x263F09968];
    id v28 = *MEMORY[0x263F09968];
    if (v26)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v27;
        id v30 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        __int16 v37 = v30;
        __int16 v38 = 2114;
        id v39 = v21;
        id v31 = v30;
        _os_log_impl(&dword_250D3F000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set sharing reminder date to fallback date: %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      -[HDHealthAppSharingReminderRestorableAlarm sharingReminderFallbackNotificationDate:]();
    }
    goto LABEL_19;
  }
  _HKInitializeLogging();
  __int16 v17 = (void *)*MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = v17;
    uint64_t v19 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    __int16 v37 = v19;
    __int16 v38 = 2114;
    id v39 = v9;
    id v20 = v19;
    _os_log_impl(&dword_250D3F000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set sharing reminder date to existing date: %{public}@", buf, 0x16u);
  }
  id v21 = v9;
LABEL_19:

  return v21;
}

- (id)nextSharingReminderDateFromDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HDHealthAppSharingReminderRestorableAlarm *)self sharingReminderRefreshIntervalDateComponents];
  id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v7 = [v6 dateByAddingComponents:v5 toDate:v4 options:0];

  return v7;
}

- (id)sharingReminderRefreshIntervalDateComponents
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v2 setMonth:6];
  return v2;
}

- (BOOL)setSharingReminderDate:(id)a3 error:(id *)a4
{
  return [(HDKeyValueDomain *)self->_sharingKeyValueDomain setDate:a3 forKey:@"HAHealthAppSharingReminderDateNotifiedKey" error:a4];
}

- (id)currentDate
{
  unitTest_currentDate = self->_unitTest_currentDate;
  if (unitTest_currentDate)
  {
    v3 = unitTest_currentDate;
  }
  else
  {
    v3 = [MEMORY[0x263EFF910] date];
  }
  return v3;
}

- (void)setUnitTest_userNotificationCenter:(id)a3
{
  id v9 = a3;
  id v4 = [_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  id v6 = [WeakRetained primaryProfile];
  if (v9) {
    id v7 = [(HDHealthAppNotificationManager *)v4 initWithProfile:v6 userNotificationCenter:v9];
  }
  else {
    id v7 = [(HDHealthAppNotificationManager *)v4 initWithProfile:v6];
  }
  notificationManager = self->_notificationManager;
  self->_notificationManager = v7;
}

- (HDDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  return (HDDaemon *)WeakRetained;
}

- (UNUserNotificationCenter)unitTest_userNotificationCenter
{
  return self->_unitTest_userNotificationCenter;
}

- (NSDate)unitTest_currentDate
{
  return self->_unitTest_currentDate;
}

- (void)setUnitTest_currentDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_currentDate, 0);
  objc_storeStrong((id *)&self->_unitTest_userNotificationCenter, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_sharingKeyValueDomain, 0);
}

- (void)scheduleAlarmWithFallbackDate:(void *)a1 restorableAlarmManager:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = objc_opt_class();
  id v5 = v4;
  id v6 = [a2 eventIdentifier];
  int v7 = 138543618;
  id v8 = v4;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_250D3F000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Could not fetch sharing reminder date for %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)removeScheduledAlarmWithRestorableAlarmManager:.cold.1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = v3;
  id v5 = (void *)OUTLINED_FUNCTION_3();
  id v6 = v5;
  int v7 = [v1 eventIdentifier];
  int v8 = 138543874;
  __int16 v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = v0;
  _os_log_error_impl(&dword_250D3F000, v2, OS_LOG_TYPE_ERROR, "[%{public}@] Could not remove alarm event %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);
}

- (void)_handleCompletionWithAlarmEvent:success:error:restorableAlarmManager:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_250D3F000, v5, v6, "[%{public}@] Error setting date: %{public}@", v7, v8, v9, v10, v11);
}

- (void)sharingReminderDate
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_250D3F000, v5, v6, "[%{public}@] Could not fetch sharing reminder date: %{public}@", v7, v8, v9, v10, v11);
}

- (void)sharingReminderFallbackNotificationDate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_250D3F000, v5, v6, "[%{public}@] Could not set sharing reminder date: %{public}@. Will try again on handling alarm event.", v7, v8, v9, v10, v11);
}

@end