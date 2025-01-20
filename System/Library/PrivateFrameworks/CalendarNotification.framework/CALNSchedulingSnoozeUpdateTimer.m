@interface CALNSchedulingSnoozeUpdateTimer
- (CALNSchedulingSnoozeUpdateTimer)initWithDateProvider:(id)a3 scheduler:(id)a4;
- (CALNSnoozeUpdateTimerDelegate)delegate;
- (id)_dequeueEventsDueBy:(id)a3;
- (void)_scheduleTimer;
- (void)activityRun;
- (void)notifyDelegateOfDueAlarmsAndRescheduleTimer;
- (void)setDelegate:(id)a3;
- (void)setFireDate:(id)a3 leeway:(double)a4 forEventWithIdentifier:(id)a5;
- (void)significantTimeChange;
@end

@implementation CALNSchedulingSnoozeUpdateTimer

- (CALNSchedulingSnoozeUpdateTimer)initWithDateProvider:(id)a3 scheduler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CALNSchedulingSnoozeUpdateTimer;
  v9 = [(CALNSchedulingSnoozeUpdateTimer *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateProvider, a3);
    objc_storeStrong((id *)&v10->_scheduler, a4);
    [(CALNActivityScheduler *)v10->_scheduler setDelegate:v10];
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    fireDates = v10->_fireDates;
    v10->_fireDates = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    overdueDates = v10->_overdueDates;
    v10->_overdueDates = v13;

    uint64_t v15 = [MEMORY[0x263EFF910] distantFuture];
    scheduledFireDate = v10->_scheduledFireDate;
    v10->_scheduledFireDate = (NSDate *)v15;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void)setFireDate:(id)a3 leeway:(double)a4 forEventWithIdentifier:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = snoozeLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543874;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v8;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_impl(&dword_2216BB000, v10, OS_LOG_TYPE_DEFAULT, "Setting snooze update fire date for %{public}@ to %{public}@ with leeway = %f", (uint8_t *)&v12, 0x20u);
  }

  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_fireDates setObject:v8 forKeyedSubscript:v9];
  v11 = [v8 dateByAddingTimeInterval:a4];
  [(NSMutableDictionary *)self->_overdueDates setObject:v11 forKeyedSubscript:v9];

  [(CALNSchedulingSnoozeUpdateTimer *)self _scheduleTimer];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)significantTimeChange
{
  v3 = snoozeLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Snooze update timer informed of significant time change; rescheduling",
      v4,
      2u);
  }

  [(CALNActivityScheduler *)self->_scheduler unschedule];
  [(CALNSchedulingSnoozeUpdateTimer *)self notifyDelegateOfDueAlarmsAndRescheduleTimer];
}

- (void)activityRun
{
  v3 = snoozeLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2216BB000, v3, OS_LOG_TYPE_DEFAULT, "Snooze update timer fired", v4, 2u);
  }

  [(CALNSchedulingSnoozeUpdateTimer *)self notifyDelegateOfDueAlarmsAndRescheduleTimer];
}

- (void)notifyDelegateOfDueAlarmsAndRescheduleTimer
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2216BB000, log, OS_LOG_TYPE_DEBUG, "No notifications need refreshing right now", v1, 2u);
}

- (id)_dequeueEventsDueBy:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v6 = self->_fireDates;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        int v12 = [(NSMutableDictionary *)self->_fireDates objectForKeyedSubscript:v11];
        if ([v4 CalIsAfterOrSameAsDate:v12]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * j);
        -[NSMutableDictionary removeObjectForKey:](self->_fireDates, "removeObjectForKey:", v18, (void)v20);
        [(NSMutableDictionary *)self->_overdueDates removeObjectForKey:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  return v13;
}

- (void)_scheduleTimer
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2216BB000, log, OS_LOG_TYPE_DEBUG, "Still no snooze updates scheduled", v1, 2u);
}

- (CALNSnoozeUpdateTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CALNSnoozeUpdateTimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overdueDates, 0);
  objc_storeStrong((id *)&self->_fireDates, 0);
  objc_storeStrong((id *)&self->_scheduledOverdueDate, 0);
  objc_storeStrong((id *)&self->_scheduledFireDate, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

@end