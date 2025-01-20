@interface CALNDefaultTimeToLeaveRefreshMonitor
+ (id)_refreshTimerAlarmNameForEventExternalURL:(id)a3;
- (BOOL)isActive;
- (BOOL)isRegisteredForAlarms;
- (CALNDefaultTimeToLeaveRefreshMonitor)initWithStorage:(id)a3;
- (CALNTimeToLeaveRefreshMonitorDelegate)delegate;
- (CALNTimeToLeaveRefreshStorage)storage;
- (void)_refreshTimerFiredForEventExternalURL:(id)a3;
- (void)activate;
- (void)deactivate;
- (void)didRegisterForAlarms;
- (void)receivedAlarmNamed:(id)a3;
- (void)removeRefreshTimerForEventExternalURL:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setRegisteredForAlarms:(BOOL)a3;
- (void)setUpRefreshTimerWithTriggerDate:(id)a3 eventExternalURL:(id)a4;
@end

@implementation CALNDefaultTimeToLeaveRefreshMonitor

- (CALNDefaultTimeToLeaveRefreshMonitor)initWithStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNDefaultTimeToLeaveRefreshMonitor;
  v6 = [(CALNDefaultTimeToLeaveRefreshMonitor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v7;
}

- (void)activate
{
}

- (void)deactivate
{
}

- (void)didRegisterForAlarms
{
}

- (void)receivedAlarmNamed:(id)a3
{
  id v4 = a3;
  if (![(CALNDefaultTimeToLeaveRefreshMonitor *)self isActive])
  {
    v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CALNDefaultTimeToLeaveRefreshMonitor receivedAlarmNamed:].cold.4();
    }
    goto LABEL_17;
  }
  if ([v4 hasPrefix:@"CalendarNotificationRefreshTimer-"])
  {
    [v4 UTF8String];
    id v5 = xpc_copy_event();
    v6 = v5;
    if (v5)
    {
      string = xpc_dictionary_get_string(v5, "com.apple.calaccessd.TTLRefreshMonitor.alarm.context.URLString");
      if (string)
      {
        v8 = [NSString stringWithUTF8String:string];
        if (v8)
        {
          [(CALNDefaultTimeToLeaveRefreshMonitor *)self _refreshTimerFiredForEventExternalURL:v8];
        }
        else
        {
          objc_super v9 = (void *)MEMORY[0x223C89120](v6);
          v10 = +[CALNLogSubsystem calendar];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[CALNDefaultTimeToLeaveRefreshMonitor receivedAlarmNamed:]();
          }

          free(v9);
        }
      }
      else
      {
        v8 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[CALNDefaultTimeToLeaveRefreshMonitor receivedAlarmNamed:](v8);
        }
      }
    }
    else
    {
      v8 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CALNDefaultTimeToLeaveRefreshMonitor receivedAlarmNamed:](v8);
      }
    }

LABEL_17:
  }
}

- (void)setUpRefreshTimerWithTriggerDate:(id)a3 eventExternalURL:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(CALNDefaultTimeToLeaveRefreshMonitor *)self isRegisteredForAlarms])
  {
    v8 = [(CALNDefaultTimeToLeaveRefreshMonitor *)self storage];
    objc_super v9 = [v8 refreshDateWithIdentifier:v7];

    if ([v6 isEqualToDate:v9])
    {
      v10 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543618;
        id v21 = v6;
        __int16 v22 = 2114;
        id v23 = v7;
        _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "A refresh timer with the same trigger date of [%{public}@] has already been set up. Will not set up a new timer. Event external URL: [%{public}@].", (uint8_t *)&v20, 0x16u);
      }
    }
    else
    {
      id v11 = [(id)objc_opt_class() _refreshTimerAlarmNameForEventExternalURL:v7];
      uint64_t v12 = [v11 UTF8String];

      [v6 timeIntervalSinceNow];
      if (v13 >= 0.0)
      {
        int64_t v14 = (unint64_t)((ceil(v13) + (double)time(0)) * 1000000000.0);
        v10 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_date(v10, (const char *)*MEMORY[0x263F300A8], v14);
        id v15 = v7;
        xpc_dictionary_set_string(v10, "com.apple.calaccessd.TTLRefreshMonitor.alarm.context.URLString", (const char *)[v15 UTF8String]);
        xpc_set_event();
        v16 = (void *)MEMORY[0x223C89120](v10);
        v17 = +[CALNLogSubsystem alarmEngine];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136315138;
          id v21 = v16;
          _os_log_impl(&dword_2216BB000, v17, OS_LOG_TYPE_DEFAULT, "Scheduled XPC alarm event: %s.", (uint8_t *)&v20, 0xCu);
        }

        free(v16);
        v18 = [(CALNDefaultTimeToLeaveRefreshMonitor *)self storage];
        [v18 addRefreshDate:v6 withIdentifier:v15];

        v19 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138543874;
          id v21 = v15;
          __int16 v22 = 2114;
          id v23 = v6;
          __int16 v24 = 2082;
          uint64_t v25 = v12;
          _os_log_impl(&dword_2216BB000, v19, OS_LOG_TYPE_DEFAULT, "Set up refresh timer. event external url = %{public}@, trigger date = %{public}@, job name = %{public}s", (uint8_t *)&v20, 0x20u);
        }
      }
      else
      {
        v10 = +[CALNLogSubsystem calendar];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[CALNDefaultTimeToLeaveRefreshMonitor setUpRefreshTimerWithTriggerDate:eventExternalURL:]();
        }
      }
    }
  }
  else
  {
    objc_super v9 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[CALNDefaultTimeToLeaveRefreshMonitor setUpRefreshTimerWithTriggerDate:eventExternalURL:]();
    }
  }
}

- (void)removeRefreshTimerForEventExternalURL:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CALNDefaultTimeToLeaveRefreshMonitor *)self isRegisteredForAlarms])
  {
    id v5 = [(CALNDefaultTimeToLeaveRefreshMonitor *)self storage];
    id v6 = [v5 refreshDateWithIdentifier:v4];

    if (v6)
    {
      id v7 = [(id)objc_opt_class() _refreshTimerAlarmNameForEventExternalURL:v4];
      [v7 UTF8String];
      xpc_set_event();
      v8 = [(CALNDefaultTimeToLeaveRefreshMonitor *)self storage];
      [v8 removeRefreshDateWithIdentifier:v4];

      objc_super v9 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = v4;
        _os_log_impl(&dword_2216BB000, v9, OS_LOG_TYPE_DEFAULT, "Removed refresh timer for event with external url = %{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      id v7 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CALNDefaultTimeToLeaveRefreshMonitor removeRefreshTimerForEventExternalURL:]();
      }
    }
  }
  else
  {
    id v6 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[CALNDefaultTimeToLeaveRefreshMonitor removeRefreshTimerForEventExternalURL:]();
    }
  }
}

- (void)_refreshTimerFiredForEventExternalURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[CALNLogSubsystem calendar];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_2216BB000, v5, OS_LOG_TYPE_DEFAULT, "Refresh timer fired for event external url = %{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(CALNDefaultTimeToLeaveRefreshMonitor *)self delegate];
  id v7 = v6;
  if (v6)
  {
    [v6 timeToLeaveRefreshMonitor:self refreshTimerFiredForEventExternalURL:v4];
  }
  else
  {
    v8 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CALNDefaultTimeToLeaveRefreshMonitor _refreshTimerFiredForEventExternalURL:]();
    }
  }
}

+ (id)_refreshTimerAlarmNameForEventExternalURL:(id)a3
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "hash"));
  id v4 = [v3 stringValue];

  id v5 = [NSString stringWithFormat:@"%@-[%@]", @"CalendarNotificationRefreshTimer-", v4];

  return v5;
}

- (CALNTimeToLeaveRefreshMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CALNTimeToLeaveRefreshMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CALNTimeToLeaveRefreshStorage)storage
{
  return self->_storage;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isRegisteredForAlarms
{
  return self->_registeredForAlarms;
}

- (void)setRegisteredForAlarms:(BOOL)a3
{
  self->_registeredForAlarms = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)receivedAlarmNamed:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Could not get event alarm object", v1, 2u);
}

- (void)receivedAlarmNamed:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Could not get alarm context url string from event alarm object", v1, 2u);
}

- (void)receivedAlarmNamed:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Could not get saved external url from alarm = %{public}s", v2, v3, v4, v5, v6);
}

- (void)receivedAlarmNamed:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "Received alarm but time to leave refresh monitor is not active. alarm name = %{public}@", v2, v3, v4, v5, v6);
}

- (void)setUpRefreshTimerWithTriggerDate:eventExternalURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2216BB000, v0, OS_LOG_TYPE_ERROR, "Ignoring attempt to set refresh timer for [%{public}@] that would fire in the past [%{public}@].", v1, 0x16u);
}

- (void)setUpRefreshTimerWithTriggerDate:eventExternalURL:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_2216BB000, v0, OS_LOG_TYPE_FAULT, "Time to leave refresh monitor is not registered for alarms. Cannot set up refresh timer for event, event external url = %{public}@, refresh date = %{public}@", v1, 0x16u);
}

- (void)removeRefreshTimerForEventExternalURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "There is no existing refresh timer to remove for event with external URL = %{public}@.", v2, v3, v4, v5, v6);
}

- (void)removeRefreshTimerForEventExternalURL:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_2216BB000, v0, OS_LOG_TYPE_FAULT, "Time to leave refresh monitor is not registered for alarms. Cannot remove refresh timer for event, event external url = %{public}@", v1, 0xCu);
}

- (void)_refreshTimerFiredForEventExternalURL:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2216BB000, v0, v1, "No delegate available to message about fired refresh timer for event external url = %{public}@", v2, v3, v4, v5, v6);
}

@end