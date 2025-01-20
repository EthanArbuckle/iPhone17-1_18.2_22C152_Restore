@interface CALNEKAlarmEngineMonitor
- (BOOL)isActive;
- (CALNEKAlarmEngineMonitor)initWithAlarmEngine:(id)a3 notificationCenter:(id)a4;
- (NSNotificationCenter)notificationCenter;
- (_EKAlarmEngine)alarmEngine;
- (void)activate;
- (void)addAlarmsFiredObserver:(id)a3 selector:(SEL)a4;
- (void)deactivate;
- (void)didRegisterForAlarms;
- (void)receivedAlarmNamed:(id)a3;
- (void)receivedNotificationNamed:(id)a3;
- (void)removeAlarmsFiredObserver:(id)a3;
- (void)setActive:(BOOL)a3;
@end

@implementation CALNEKAlarmEngineMonitor

- (void)receivedNotificationNamed:(id)a3
{
  id v4 = a3;
  if ([(CALNEKAlarmEngineMonitor *)self isActive])
  {
    v5 = [(CALNEKAlarmEngineMonitor *)self alarmEngine];
    [v5 handleDarwinNotification:v4];
  }
  else
  {
    v5 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CALNEKAlarmEngineMonitor receivedNotificationNamed:]((uint64_t)v4, v5);
    }
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (_EKAlarmEngine)alarmEngine
{
  return self->_alarmEngine;
}

- (CALNEKAlarmEngineMonitor)initWithAlarmEngine:(id)a3 notificationCenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CALNEKAlarmEngineMonitor;
  v9 = [(CALNEKAlarmEngineMonitor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_alarmEngine, a3);
    objc_storeStrong((id *)&v10->_notificationCenter, a4);
  }

  return v10;
}

- (void)activate
{
  v3 = [(CALNEKAlarmEngineMonitor *)self alarmEngine];
  [v3 start];

  [(CALNEKAlarmEngineMonitor *)self setActive:1];
}

- (void)deactivate
{
}

- (void)didRegisterForAlarms
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2216BB000, log, OS_LOG_TYPE_FAULT, "Alarm engine monitor received did register for alarms message but the alarm engine monitor is not active. Cannot send did register for alarms message to alarm engine.", v1, 2u);
}

- (void)receivedAlarmNamed:(id)a3
{
  id v4 = a3;
  if ([(CALNEKAlarmEngineMonitor *)self isActive])
  {
    v5 = [(CALNEKAlarmEngineMonitor *)self alarmEngine];
    [v5 receivedAlarmNamed:v4];
  }
  else
  {
    v5 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CALNEKAlarmEngineMonitor receivedAlarmNamed:]((uint64_t)v4, v5);
    }
  }
}

- (void)addAlarmsFiredObserver:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  id v8 = [(CALNEKAlarmEngineMonitor *)self notificationCenter];
  id v7 = [(CALNEKAlarmEngineMonitor *)self alarmEngine];
  [v8 addObserver:v6 selector:a4 name:@"EKAlarmEngineAlarmsDidFireNotification" object:v7];
}

- (void)removeAlarmsFiredObserver:(id)a3
{
  id v4 = a3;
  id v6 = [(CALNEKAlarmEngineMonitor *)self notificationCenter];
  v5 = [(CALNEKAlarmEngineMonitor *)self alarmEngine];
  [v6 removeObserver:v4 name:@"EKAlarmEngineAlarmsDidFireNotification" object:v5];
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmEngine, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

- (void)receivedNotificationNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Received notification but alarm engine monitor is not active. notification name = %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)receivedAlarmNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Received alarm but alarm engine monitor is not active. alarm name = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end