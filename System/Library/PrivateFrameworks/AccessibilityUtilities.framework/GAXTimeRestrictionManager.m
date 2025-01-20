@interface GAXTimeRestrictionManager
- (AXAccessQueue)assertedAccessQueue;
- (AXAccessQueueTimer)expirationTimer;
- (BOOL)isActive;
- (BOOL)isPaused;
- (GAXTimeRestrictionManager)initWithAssertedAccessQueue:(id)a3;
- (GAXTimeRestrictionManagerDelegate)delegate;
- (NSDate)startTime;
- (NSMutableArray)alarmTimers;
- (NSMutableSet)alarmDurationsInSeconds;
- (id)description;
- (int64_t)expirationDurationInSeconds;
- (int64_t)remainingTimeInSeconds;
- (void)_addAlarmForDuration:(int64_t)a3;
- (void)_removeAllAlarmTimers;
- (void)_removeAllTimers;
- (void)_removeExpirationTimer;
- (void)_scheduleTimers;
- (void)beginWithDuration:(int64_t)a3;
- (void)cancel;
- (void)pause;
- (void)remainingTimeInSeconds;
- (void)resume;
- (void)setActive:(BOOL)a3;
- (void)setAlarmDurationsInSeconds:(id)a3;
- (void)setAlarmTimers:(id)a3;
- (void)setAssertedAccessQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpirationDurationInSeconds:(int64_t)a3;
- (void)setExpirationTimer:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setStartTime:(id)a3;
@end

@implementation GAXTimeRestrictionManager

- (GAXTimeRestrictionManager)initWithAssertedAccessQueue:(id)a3
{
  id v4 = a3;
  if (([v4 canWriteInCurrentExecutionThread] & 1) == 0)
  {
    v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[GAXTimeRestrictionManager initWithAssertedAccessQueue:](v4);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)GAXTimeRestrictionManager;
  v6 = [(GAXTimeRestrictionManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    [(GAXTimeRestrictionManager *)v6 setAssertedAccessQueue:v4];
    v8 = [MEMORY[0x1E4F1CA48] array];
    [(GAXTimeRestrictionManager *)v7 setAlarmTimers:v8];

    v9 = [MEMORY[0x1E4F1CA80] set];
    [(GAXTimeRestrictionManager *)v7 setAlarmDurationsInSeconds:v9];
  }
  return v7;
}

- (id)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[GAXTimeRestrictionManager isActive](self, "isActive"));
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[GAXTimeRestrictionManager isPaused](self, "isPaused"));
  v6 = [v3 stringWithFormat:@"GAXTimeRestrictionManager<%p>. active:%@ paused:%@\n", self, v4, v5];

  v7 = [(GAXTimeRestrictionManager *)self startTime];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;

  v10 = [(GAXTimeRestrictionManager *)self startTime];
  objc_super v11 = [NSNumber numberWithDouble:v9];
  [v6 appendFormat:@"  start time:%@ s (absolute:%@ s)\n", v10, v11];

  v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[GAXTimeRestrictionManager expirationDurationInSeconds](self, "expirationDurationInSeconds"));
  v13 = objc_msgSend(NSNumber, "numberWithDouble:", v9 + (double)-[GAXTimeRestrictionManager expirationDurationInSeconds](self, "expirationDurationInSeconds"));
  [v6 appendFormat:@"  expiration duration:%@ s (absolute:%@ s)\n", v12, v13];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v14 = [(GAXTimeRestrictionManager *)self alarmDurationsInSeconds];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v20 = objc_msgSend(NSNumber, "numberWithDouble:", v9 + (double)objc_msgSend(v19, "integerValue"));
        [v6 appendFormat:@"  alarm:%@ s (absolute:%@ s)\n", v19, v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  return v6;
}

- (int64_t)remainingTimeInSeconds
{
  v3 = [(GAXTimeRestrictionManager *)self assertedAccessQueue];
  char v4 = [v3 canReadInCurrentExecutionThread];

  if ((v4 & 1) == 0)
  {
    v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[GAXTimeRestrictionManager remainingTimeInSeconds](self);
    }
  }
  v6 = [(GAXTimeRestrictionManager *)self startTime];
  [v6 timeIntervalSinceNow];
  double v8 = fabs(v7);

  uint64_t v9 = [(GAXTimeRestrictionManager *)self expirationDurationInSeconds];
  return (uint64_t)((double)v9 - v8) & ~((uint64_t)((double)v9 - v8) >> 63);
}

- (void)beginWithDuration:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = [(GAXTimeRestrictionManager *)self assertedAccessQueue];
  char v6 = [v5 canWriteInCurrentExecutionThread];

  if ((v6 & 1) == 0)
  {
    double v7 = AXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[GAXTimeRestrictionManager beginWithDuration:](self);
    }
  }
  if ([(GAXTimeRestrictionManager *)self isActive])
  {
    double v8 = GAXLogTimeRestrictions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "Can't begin time restriction, it's already active", (uint8_t *)&v15, 2u);
    }
  }
  else if (a3 <= 0)
  {
    double v8 = GAXLogTimeRestrictions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [NSNumber numberWithInteger:a3];
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_DEFAULT, "Can't begin time restriction, specified duration is too short: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    [(GAXTimeRestrictionManager *)self setExpirationDurationInSeconds:60 * a3];
    [(GAXTimeRestrictionManager *)self setActive:1];
    uint64_t v9 = +[AXSettings sharedInstance];
    double v8 = [v9 guidedAccessOverrideTimeRestrictionDuration];

    if (v8)
    {
      [v8 doubleValue];
      [(GAXTimeRestrictionManager *)self setExpirationDurationInSeconds:(uint64_t)v10];
      objc_super v11 = GAXLogTimeRestrictions();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[GAXTimeRestrictionManager expirationDurationInSeconds](self, "expirationDurationInSeconds"));
        int v15 = 138543362;
        uint64_t v16 = v12;
        _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_INFO, "App Time restriction is being overridden with internal value: %{public}@", (uint8_t *)&v15, 0xCu);
      }
    }
    [(GAXTimeRestrictionManager *)self _addAlarmForDuration:a3];
    [(GAXTimeRestrictionManager *)self _scheduleTimers];
  }

  v14 = GAXLogTimeRestrictions();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[GAXTimeRestrictionManager beginWithDuration:]();
  }
}

- (void)cancel
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_18D308000, v0, v1, "  TimeRestrictions: Was Asked to Cancel: %{public}@", v2, v3, v4, v5, v6);
}

- (void)pause
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_18D308000, v0, v1, "  TimeRestrictions: Was Asked to Pause: %{public}@", v2, v3, v4, v5, v6);
}

- (void)resume
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_18D308000, v0, v1, "  TimeRestrictions: Was Asked to Resume: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_addAlarmForDuration:(int64_t)a3
{
  uint64_t v5 = [(GAXTimeRestrictionManager *)self assertedAccessQueue];
  char v6 = [v5 canWriteInCurrentExecutionThread];

  if ((v6 & 1) == 0)
  {
    double v7 = AXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[GAXTimeRestrictionManager beginWithDuration:](self);
    }
  }
  double v8 = -1.0;
  double v9 = 30.0;
  if (a3 >= 6)
  {
    if ((unint64_t)a3 >= 0xD)
    {
      if ((unint64_t)a3 >= 0x14)
      {
        double v9 = dbl_18D4309D0[(unint64_t)a3 < 0x1E];
        if ((unint64_t)a3 >= 0x1E) {
          double v8 = 60.0;
        }
        else {
          double v8 = 30.0;
        }
        goto LABEL_14;
      }
      double v8 = 30.0;
      uint64_t v10 = 0x405E000000000000;
    }
    else
    {
      uint64_t v10 = 0x404E000000000000;
    }
    double v9 = *(double *)&v10;
  }
LABEL_14:
  objc_super v11 = [(GAXTimeRestrictionManager *)self alarmDurationsInSeconds];
  v12 = [NSNumber numberWithDouble:v9];
  [v11 addObject:v12];

  if (v8 > 0.0)
  {
    v13 = [(GAXTimeRestrictionManager *)self alarmDurationsInSeconds];
    v14 = [NSNumber numberWithDouble:v8];
    [v13 addObject:v14];
  }
}

- (void)_scheduleTimers
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [(GAXTimeRestrictionManager *)self setStartTime:v3];

  uint64_t v4 = [(GAXTimeRestrictionManager *)self startTime];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;

  uint64_t v7 = [(GAXTimeRestrictionManager *)self expirationDurationInSeconds];
  id v8 = objc_alloc(MEMORY[0x1E4F482E8]);
  double v9 = [(GAXTimeRestrictionManager *)self assertedAccessQueue];
  uint64_t v10 = (void *)[v8 initWithTargetAccessQueue:v9];

  uint64_t v11 = [(GAXTimeRestrictionManager *)self expirationDurationInSeconds];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __44__GAXTimeRestrictionManager__scheduleTimers__block_invoke;
  v29[3] = &unk_1E5585F48;
  v29[4] = self;
  [v10 afterDelay:v29 processBlock:(double)v11];
  [(GAXTimeRestrictionManager *)self setExpirationTimer:v10];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v12 = [(GAXTimeRestrictionManager *)self alarmDurationsInSeconds];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    double v15 = v6 + (double)v7;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        double v19 = v15 - (double)[v18 integerValue];
        if (v19 > v6)
        {
          id v20 = objc_alloc(MEMORY[0x1E4F482E8]);
          v21 = [(GAXTimeRestrictionManager *)self assertedAccessQueue];
          long long v22 = (void *)[v20 initWithTargetAccessQueue:v21];

          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __44__GAXTimeRestrictionManager__scheduleTimers__block_invoke_2;
          v24[3] = &unk_1E5586470;
          v24[4] = self;
          v24[5] = v18;
          [v22 afterDelay:v24 processBlock:v19 - v6];
          long long v23 = [(GAXTimeRestrictionManager *)self alarmTimers];
          [v23 addObject:v22];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v14);
  }
}

void __44__GAXTimeRestrictionManager__scheduleTimers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) alarmDurationsInSeconds];
  [v2 removeAllObjects];

  [*(id *)(a1 + 32) _removeAllTimers];
  [*(id *)(a1 + 32) setActive:0];
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 timeDidExpireForTimeRestriction:*(void *)(a1 + 32)];
}

void __44__GAXTimeRestrictionManager__scheduleTimers__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 timeAlarmDidOccurForTimeRestriction:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 32) alarmDurationsInSeconds];
  [v3 removeObject:*(void *)(a1 + 40)];
}

- (void)_removeAllTimers
{
  id v3 = [(GAXTimeRestrictionManager *)self assertedAccessQueue];
  char v4 = [v3 canWriteInCurrentExecutionThread];

  if ((v4 & 1) == 0)
  {
    double v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[GAXTimeRestrictionManager beginWithDuration:](self);
    }
  }
  [(GAXTimeRestrictionManager *)self _removeAllAlarmTimers];
  [(GAXTimeRestrictionManager *)self _removeExpirationTimer];
}

- (void)_removeExpirationTimer
{
  id v3 = [(GAXTimeRestrictionManager *)self assertedAccessQueue];
  char v4 = [v3 canWriteInCurrentExecutionThread];

  if ((v4 & 1) == 0)
  {
    double v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[GAXTimeRestrictionManager beginWithDuration:](self);
    }
  }
  double v6 = [(GAXTimeRestrictionManager *)self expirationTimer];
  [v6 cancel];

  [(GAXTimeRestrictionManager *)self setExpirationTimer:0];
}

- (void)_removeAllAlarmTimers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(GAXTimeRestrictionManager *)self assertedAccessQueue];
  char v4 = [v3 canWriteInCurrentExecutionThread];

  if ((v4 & 1) == 0)
  {
    double v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[GAXTimeRestrictionManager beginWithDuration:](self);
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v6 = [(GAXTimeRestrictionManager *)self alarmTimers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) cancel];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [(GAXTimeRestrictionManager *)self alarmTimers];
  [v11 removeAllObjects];
}

- (int64_t)expirationDurationInSeconds
{
  return self->_expirationDurationInSeconds;
}

- (void)setExpirationDurationInSeconds:(int64_t)a3
{
  self->_expirationDurationInSeconds = a3;
}

- (NSMutableSet)alarmDurationsInSeconds
{
  return self->_alarmDurationsInSeconds;
}

- (void)setAlarmDurationsInSeconds:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (GAXTimeRestrictionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXTimeRestrictionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXAccessQueue)assertedAccessQueue
{
  return self->_assertedAccessQueue;
}

- (void)setAssertedAccessQueue:(id)a3
{
}

- (AXAccessQueueTimer)expirationTimer
{
  return self->_expirationTimer;
}

- (void)setExpirationTimer:(id)a3
{
}

- (NSMutableArray)alarmTimers
{
  return self->_alarmTimers;
}

- (void)setAlarmTimers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmTimers, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_assertedAccessQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_alarmDurationsInSeconds, 0);
}

- (void)initWithAssertedAccessQueue:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 label];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_18D308000, v2, v3, "This code must execute in a writing block on AXAccessQueue: %@", v4, v5, v6, v7, v8);
}

- (void)remainingTimeInSeconds
{
  uint64_t v1 = [a1 assertedAccessQueue];
  uint64_t v2 = [v1 label];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_18D308000, v3, v4, "This code must execute in a reading (or writing) block on AXAccessQueue: %@", v5, v6, v7, v8, v9);
}

- (void)beginWithDuration:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_18D308000, v0, v1, "  TimeRestrictions: Was Asked to Start: %{public}@", v2, v3, v4, v5, v6);
}

- (void)beginWithDuration:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 assertedAccessQueue];
  uint64_t v2 = [v1 label];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_18D308000, v3, v4, "This code must execute in a writing block on AXAccessQueue: %@", v5, v6, v7, v8, v9);
}

@end