@interface FMFScheduler
+ (id)_nextStartOrEndDateFrom:(id)a3 forSchedules:(id)a4;
- (FMFScheduler)initWithDelegate:(id)a3;
- (FMFSchedulerDelegate)delegate;
- (FMXPCTimer)timer;
- (NSArray)currentSchedules;
- (NSArray)schedules;
- (void)_registerForSignificantTimeChangeNotifications;
- (void)_significantTimeChange:(id)a3;
- (void)_updateScheduleTimer;
- (void)scheduleTimerFired;
- (void)setSchedules:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation FMFScheduler

- (FMFScheduler)initWithDelegate:(id)a3
{
  id v5 = a3;
  v6 = [(FMFScheduler *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    [(FMFScheduler *)v7 _registerForSignificantTimeChangeNotifications];
  }

  return v7;
}

- (void)setSchedules:(id)a3
{
  objc_storeStrong((id *)&self->_schedules, a3);
  v4 = [(FMFScheduler *)self delegate];
  [v4 schedulerCurrentSchedulesDidChange:self];

  [(FMFScheduler *)self _updateScheduleTimer];
}

- (NSArray)currentSchedules
{
  v2 = [(FMFScheduler *)self schedules];
  v3 = objc_msgSend(v2, "fm_filter:", &__block_literal_global_7);

  return (NSArray *)v3;
}

uint64_t __32__FMFScheduler_currentSchedules__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF910];
  id v3 = a2;
  v4 = [v2 date];
  uint64_t v5 = [v3 isCurrentAt:v4];

  return v5;
}

- (void)scheduleTimerFired
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [MEMORY[0x263EFF910] now];
    int v6 = 136315394;
    v7 = "-[FMFScheduler scheduleTimerFired]";
    __int16 v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "%s: Schedule timer fired at date %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = [(FMFScheduler *)self delegate];
  [v5 schedulerCurrentSchedulesDidChange:self];

  [(FMFScheduler *)self _updateScheduleTimer];
}

- (void)_updateScheduleTimer
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_class();
  v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = [(FMFScheduler *)self schedules];
  int v6 = [v3 _nextStartOrEndDateFrom:v4 forSchedules:v5];

  if (v6)
  {
    xpc_set_event();
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    [v6 timeIntervalSinceNow];
    double v9 = v8;
    time_t v10 = time(0);
    xpc_dictionary_set_date(v7, "Date", (uint64_t)((ceil(v9) + (double)v10) * 1000000000.0));
    xpc_dictionary_set_BOOL(v7, "UserVisible", 1);
    xpc_set_event();
  }
  v11 = LogCategory_Daemon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(FMFScheduler *)self timer];
    v13 = [(FMFScheduler *)self schedules];
    int v14 = 136315906;
    v15 = "-[FMFScheduler _updateScheduleTimer]";
    __int16 v16 = 2112;
    v17 = v12;
    __int16 v18 = 2112;
    v19 = v6;
    __int16 v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_20AD87000, v11, OS_LOG_TYPE_DEFAULT, "%s: %@ fireDate: %@ schedules: %@", (uint8_t *)&v14, 0x2Au);
  }
}

+ (id)_nextStartOrEndDateFrom:(id)a3 forSchedules:(id)a4
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__FMFScheduler__nextStartOrEndDateFrom_forSchedules___block_invoke;
  v10[3] = &unk_263FE7850;
  id v11 = v5;
  id v6 = v5;
  xpc_object_t v7 = objc_msgSend(a4, "fm_map:", v10);
  double v8 = +[FMFSchedule firstDateFromDates:v7 order:-1];

  return v8;
}

uint64_t __53__FMFScheduler__nextStartOrEndDateFrom_forSchedules___block_invoke(uint64_t a1, void *a2)
{
  return [a2 nextStartOrEndDateFrom:*(void *)(a1 + 32)];
}

- (void)setTimer:(id)a3
{
  id v5 = (FMXPCTimer *)a3;
  timer = self->_timer;
  p_timer = &self->_timer;
  id v6 = timer;
  if (timer != v5)
  {
    [(FMXPCTimer *)v6 invalidate];
    objc_storeStrong((id *)p_timer, a3);
  }

  MEMORY[0x270F9A758]();
}

- (void)_registerForSignificantTimeChangeNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__significantTimeChange_ name:@"FMFSchedulerSignificantTimeChangeNotification" object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__significantTimeChange_ name:*MEMORY[0x263EFF5C8] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__significantTimeChange_ name:*MEMORY[0x263EFF5D0] object:0];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__FMFScheduler__registerForSignificantTimeChangeNotifications__block_invoke;
  block[3] = &unk_263FE6F30;
  block[4] = self;
  if (_registerForSignificantTimeChangeNotifications_onceToken != -1) {
    dispatch_once(&_registerForSignificantTimeChangeNotifications_onceToken, block);
  }
}

void __62__FMFScheduler__registerForSignificantTimeChangeNotifications__block_invoke(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v3 = *(const void **)(a1 + 32);

  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_significantTimeChange, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_significantTimeChange:(id)a3
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateScheduleTimer object:0];

  [(FMFScheduler *)self performSelector:sel__updateScheduleTimer withObject:0 afterDelay:0.2];
}

- (FMFSchedulerDelegate)delegate
{
  return self->_delegate;
}

- (NSArray)schedules
{
  return self->_schedules;
}

- (FMXPCTimer)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_schedules, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end