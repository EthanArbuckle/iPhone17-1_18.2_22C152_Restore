@interface APBackoffTimer
- (APBackoffTimer)initWithSchedule:(id)a3 name:(id)a4;
- (APBackoffTimerDelegate)delegate;
- (APUnfairLock)lock;
- (BOOL)hasFiredOnThisLevel;
- (BOOL)scheduleNextLevelWithQueue:(id)a3;
- (BOOL)scheduleTerminated;
- (BOOL)scheduled;
- (NSArray)schedule;
- (NSNumber)currentLevel;
- (NSString)name;
- (double)nextBackoffDate;
- (id)_getNextLevelTimeInterval;
- (id)_secondsToNextEvent;
- (void)_timerFired;
- (void)reset;
- (void)setCurrentLevel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasFiredOnThisLevel:(BOOL)a3;
- (void)setLock:(id)a3;
- (void)setName:(id)a3;
- (void)setNextBackoffDate:(double)a3;
- (void)setSchedule:(id)a3;
@end

@implementation APBackoffTimer

- (APBackoffTimer)initWithSchedule:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(APBackoffTimer *)self init];
  v9 = v8;
  if (v8)
  {
    if (v6) {
      v10 = v6;
    }
    else {
      v10 = &unk_1F2EAD810;
    }
    objc_storeStrong((id *)&v8->_schedule, v10);
    objc_storeStrong((id *)&v9->_name, a4);
    v9->_nextBackoffDate = 0.0;
    v11 = [[APUnfairLock alloc] initWithOptions:1];
    lock = v9->_lock;
    v9->_lock = v11;
  }
  return v9;
}

- (id)_secondsToNextEvent
{
  v3 = [(APBackoffTimer *)self lock];
  [v3 lock];
  v4 = [(APBackoffTimer *)self currentLevel];
  if (v4)
  {
    v5 = [(APBackoffTimer *)self schedule];
    id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "unsignedIntegerValue"));
  }
  else
  {
    id v6 = 0;
  }
  [v3 unlock];

  return v6;
}

- (void)_timerFired
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = APLogForCategory(0x1FuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_opt_class();
    id v5 = v4;
    id v6 = [(APBackoffTimer *)self name];
    int v8 = 138478083;
    v9 = v4;
    __int16 v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1D70B2000, v3, OS_LOG_TYPE_DEBUG, "[%{private}@]: Firing backoff %{public}@ timer.", (uint8_t *)&v8, 0x16u);
  }
  [(APBackoffTimer *)self setHasFiredOnThisLevel:1];
  id v7 = [(APBackoffTimer *)self delegate];
  [v7 backoffTimerFired];
}

- (id)_getNextLevelTimeInterval
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(APBackoffTimer *)self lock];
  [v3 lock];
  if ([(APBackoffTimer *)self scheduled])
  {
    [v3 unlock];
    v4 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = objc_opt_class();
      id v6 = v5;
      id v7 = [(APBackoffTimer *)self name];
      int v26 = 138478083;
      v27 = v5;
      __int16 v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1D70B2000, v4, OS_LOG_TYPE_ERROR, "[%{private}@]: Trying to schedule backoff %{public}@ timer twice on the same level.", (uint8_t *)&v26, 0x16u);
    }
    int v8 = 0;
  }
  else
  {
    v9 = [(APBackoffTimer *)self currentLevel];

    if (v9)
    {
      __int16 v10 = [(APBackoffTimer *)self currentLevel];
      unint64_t v11 = [v10 unsignedIntegerValue];
      uint64_t v12 = [(APBackoffTimer *)self schedule];
      unint64_t v13 = [v12 count] - 1;

      v14 = NSNumber;
      if (v11 >= v13)
      {
        v15 = [(APBackoffTimer *)self schedule];
        uint64_t v16 = [v15 count] - 1;
      }
      else
      {
        v15 = [(APBackoffTimer *)self currentLevel];
        uint64_t v16 = [v15 unsignedIntegerValue] + 1;
      }
      v17 = [v14 numberWithUnsignedInteger:v16];
      [(APBackoffTimer *)self setCurrentLevel:v17];
    }
    else
    {
      v15 = [NSNumber numberWithInteger:0];
      [(APBackoffTimer *)self setCurrentLevel:v15];
    }

    [(APBackoffTimer *)self nextBackoffDate];
    if (v18 == 0.0)
    {
      v19 = [MEMORY[0x1E4F1C9C8] now];
      [v19 timeIntervalSince1970];
      -[APBackoffTimer setNextBackoffDate:](self, "setNextBackoffDate:");
    }
    v20 = [(APBackoffTimer *)self schedule];
    v21 = [(APBackoffTimer *)self currentLevel];
    int v8 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v21, "unsignedIntegerValue"));

    [v8 doubleValue];
    double v23 = v22;
    [(APBackoffTimer *)self nextBackoffDate];
    [(APBackoffTimer *)self setNextBackoffDate:v23 + v24];
    [(APBackoffTimer *)self setHasFiredOnThisLevel:0];
    [v3 unlock];
  }

  return v8;
}

- (BOOL)scheduled
{
  [(APBackoffTimer *)self nextBackoffDate];
  if (v3 <= 0.0) {
    return 0;
  }
  else {
    return ![(APBackoffTimer *)self hasFiredOnThisLevel];
  }
}

- (void)reset
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v3 = APLogForCategory(0x1FuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_opt_class();
    id v5 = v4;
    id v6 = [(APBackoffTimer *)self name];
    int v8 = 138478083;
    v9 = v4;
    __int16 v10 = 2114;
    unint64_t v11 = v6;
    _os_log_impl(&dword_1D70B2000, v3, OS_LOG_TYPE_DEBUG, "[%{private}@]: Reset backoff %{public}@ timer.", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(APBackoffTimer *)self lock];
  [v7 lock];
  [(APBackoffTimer *)self setCurrentLevel:0];
  [(APBackoffTimer *)self setNextBackoffDate:0.0];
  [(APBackoffTimer *)self setHasFiredOnThisLevel:0];
  [v7 unlock];
}

- (BOOL)scheduleNextLevelWithQueue:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(APBackoffTimer *)self _getNextLevelTimeInterval];
  if (v5)
  {
    id v6 = v4;
    if (!v6) {
      id v6 = dispatch_queue_create("com.apple.ap.backoff_timer.retry_queue", 0);
    }
    id v7 = APLogForCategory(0x1FuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = objc_opt_class();
      id v9 = v8;
      __int16 v10 = [(APBackoffTimer *)self name];
      unint64_t v11 = (void *)MEMORY[0x1E4F1C9C8];
      [(APBackoffTimer *)self nextBackoffDate];
      uint64_t v12 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
      [v5 doubleValue];
      *(_DWORD *)buf = 138478595;
      v20 = v8;
      __int16 v21 = 2114;
      double v22 = v10;
      __int16 v23 = 2114;
      double v24 = v12;
      __int16 v25 = 2048;
      uint64_t v26 = v13;
      _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_DEBUG, "[%{private}@]: Scheduling backoff %{public}@ timer to %{public}@, adding %f seconds.", buf, 0x2Au);
    }
    objc_initWeak((id *)buf, self);
    [v5 doubleValue];
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D70CB284;
    block[3] = &unk_1E6A6B770;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_after(v15, v6, block);
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  return v5 != 0;
}

- (BOOL)scheduleTerminated
{
  double v3 = [(APBackoffTimer *)self lock];
  [v3 lock];
  id v4 = [(APBackoffTimer *)self currentLevel];
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 unsignedIntegerValue];
    id v7 = [(APBackoffTimer *)self schedule];
    BOOL v8 = v6 >= [v7 count] - 1;

    [v3 unlock];
  }
  else
  {
    [v3 lock];
    BOOL v8 = 0;
  }

  return v8;
}

- (APBackoffTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APBackoffTimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)currentLevel
{
  return self->_currentLevel;
}

- (void)setCurrentLevel:(id)a3
{
  self->_currentLevel = (NSNumber *)a3;
}

- (double)nextBackoffDate
{
  return self->_nextBackoffDate;
}

- (void)setNextBackoffDate:(double)a3
{
  self->_nextBackoffDate = a3;
}

- (BOOL)hasFiredOnThisLevel
{
  return self->_hasFiredOnThisLevel;
}

- (void)setHasFiredOnThisLevel:(BOOL)a3
{
  self->_hasFiredOnThisLevel = a3;
}

- (NSArray)schedule
{
  return self->_schedule;
}

- (void)setSchedule:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end