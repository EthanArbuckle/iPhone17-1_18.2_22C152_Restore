@interface BLSHEngineRequestDatesOperation
- (BLSHEngineRequestDatesOperation)initWithRequestInterval:(id)a3 delegate:(id)a4 osTimerProvider:(id)a5;
- (BOOL)didReset;
- (BOOL)isComplete;
- (NSArray)environmentIdentifiers;
- (NSDate)beginDate;
- (NSDateInterval)requestInterval;
- (NSString)debugDescription;
- (NSString)description;
- (double)averageInterval;
- (double)beginTimestamp;
- (double)longestInterval;
- (double)shortestInterval;
- (id)telemetryDataWithEndTime:(double)a3;
- (unsigned)environmentCount;
- (void)beginOperationWithIntervals:(id)a3 shouldReset:(BOOL)a4;
- (void)dealloc;
- (void)environment:(void *)a3 didProvideSpecifiers:(void *)a4 forPresentationInterval:;
- (void)invalidate;
- (void)scheduleTimeout;
- (void)timeoutTimerFired;
@end

@implementation BLSHEngineRequestDatesOperation

- (BLSHEngineRequestDatesOperation)initWithRequestInterval:(id)a3 delegate:(id)a4 osTimerProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSHEngineRequestDatesOperation;
  v12 = [(BLSHEngineRequestDatesOperation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestInterval, a3);
    v13->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v13->_lock_delegate, v10);
    objc_storeStrong((id *)&v13->_osTimerProvider, a5);
  }

  return v13;
}

- (void)dealloc
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v5 = [(NSDateInterval *)self->_requestInterval bls_shortLoggingString];
  id v6 = (id)[v4 appendObject:v5 withName:@"requestInterval"];

  id v7 = (id)[v4 appendBool:self->_lock_invalidated withName:@"invalidated" ifEqualTo:1];
  id v8 = (id)[v4 appendBool:self->_lock_begun withName:@"begun" ifEqualTo:0];
  id v9 = (id)[v4 appendBool:self->_lock_timedOut withName:@"timedOut" ifEqualTo:1];
  id v10 = (id)[v4 appendBool:self->_lock_complete withName:@"complete" ifEqualTo:1];
  if (self->_lock_begun) {
    id v11 = (id)[v4 appendBool:self->_lock_didReset withName:@"reset"];
  }
  BSContinuousMachTimeNow();
  id v13 = (id)[v4 appendDouble:@"elapsed" withName:3 decimalPrecision:v12 - self->_lock_beginTime];
  id v14 = (id)objc_msgSend(v4, "appendInteger:withName:", -[NSMutableSet count](self->_lock_pendingEnvironments, "count"), @"pendingCount");
  objc_super v15 = [(NSMutableSet *)self->_lock_pendingEnvironments anyObject];
  id v16 = (id)[v4 appendObject:v15 withName:@"onePending" skipIfNil:1];

  [v4 appendArraySection:self->_lock_environmentIdentifiers withName:@"environments" skipIfEmpty:1];
  v17 = [v4 build];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v17;
}

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v5 = [(NSDateInterval *)self->_requestInterval bls_shortLoggingString];
  id v6 = (id)[v4 appendObject:v5 withName:@"requestInterval"];

  id v7 = (id)[v4 appendBool:self->_lock_invalidated withName:@"invalidated" ifEqualTo:1];
  id v8 = (id)[v4 appendBool:self->_lock_begun withName:@"begun" ifEqualTo:0];
  id v9 = (id)[v4 appendBool:self->_lock_timedOut withName:@"timedOut" ifEqualTo:1];
  id v10 = (id)[v4 appendBool:self->_lock_complete withName:@"complete" ifEqualTo:1];
  if (self->_lock_begun) {
    id v11 = (id)[v4 appendBool:self->_lock_didReset withName:@"reset"];
  }
  BSContinuousMachTimeNow();
  id v13 = (id)[v4 appendDouble:@"elapsed" withName:3 decimalPrecision:v12 - self->_lock_beginTime];
  id v14 = [MEMORY[0x263F29C30] sharedInstance];
  objc_super v15 = [v14 formatDuration:self->_lock_averageInterval];
  id v16 = (id)[v4 appendObject:v15 withName:@"averageInterval"];

  if (self->_lock_shortestInterval != self->_lock_averageInterval)
  {
    v17 = [MEMORY[0x263F29C30] sharedInstance];
    v18 = [v17 formatDuration:self->_lock_shortestInterval];
    id v19 = (id)[v4 appendObject:v18 withName:@"shortestInterval"];

    v20 = [MEMORY[0x263F29C30] sharedInstance];
    v21 = [v20 formatDuration:self->_lock_longestInterval];
    id v22 = (id)[v4 appendObject:v21 withName:@"longestInterval"];
  }
  [v4 appendArraySection:self->_lock_environmentIdentifiers withName:@"environments" skipIfEmpty:1];
  v23 = [(NSMutableSet *)self->_lock_pendingEnvironments allObjects];
  [v4 appendArraySection:v23 withName:@"pending" skipIfEmpty:1];

  v24 = [v4 build];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v24;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  [(BSTimerScheduleQuerying *)self->_lock_timeoutTimer invalidate];
  lock_timeoutTimer = self->_lock_timeoutTimer;
  self->_lock_timeoutTimer = 0;

  objc_storeWeak((id *)&self->_lock_delegate, 0);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isComplete
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_complete;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSArray)environmentIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_environmentIdentifiers;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (unsigned)environmentCount
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_lock_environmentCount;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (double)shortestInterval
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_shortestInterval = self->_lock_shortestInterval;
  os_unfair_lock_unlock(p_lock);
  return lock_shortestInterval;
}

- (double)averageInterval
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_averageInterval = self->_lock_averageInterval;
  os_unfair_lock_unlock(p_lock);
  return lock_averageInterval;
}

- (double)longestInterval
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_longestInterval = self->_lock_longestInterval;
  os_unfair_lock_unlock(p_lock);
  return lock_longestInterval;
}

- (BOOL)didReset
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_didReset;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSDate)beginDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_beginDate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (double)beginTimestamp
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_beginTime = self->_lock_beginTime;
  os_unfair_lock_unlock(p_lock);
  return lock_beginTime;
}

- (void)beginOperationWithIntervals:(id)a3 shouldReset:(BOOL)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_begun)
  {
    v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_begun"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHEngineRequestDatesOperation beginOperationWithIntervals:shouldReset:].cold.4(a2);
    }
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD44064);
  }
  v45 = a2;
  if (self->_lock_invalidated)
  {
    v42 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!_lock_invalidated"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHEngineRequestDatesOperation beginOperationWithIntervals:shouldReset:](a2);
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD440C8);
  }
  BSContinuousMachTimeNow();
  self->_double lock_beginTime = v7;
  id v8 = [(BLSHOSTimerProviding *)self->_osTimerProvider now];
  lock_beginDate = self->_lock_beginDate;
  self->_lock_beginDate = v8;

  self->_lock_begun = 1;
  self->_lock_didReset = a4;
  id v10 = [MEMORY[0x263EFF9C0] set];
  lock_pendingEnvironments = self->_lock_pendingEnvironments;
  self->_lock_pendingEnvironments = v10;

  self->_uint64_t lock_environmentCount = 0;
  self->_double lock_shortestInterval = 1.79769313e308;
  self->_double lock_longestInterval = 0.0;
  objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_14);
  double v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lock_environmentIdentifiers = self->_lock_environmentIdentifiers;
  self->_lock_environmentIdentifiers = v12;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v55 objects:v66 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v56;
    double v17 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v56 != v16) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v20 = [v19 environment];
        v21 = [v20 identifier];

        if (v21)
        {
          id v22 = [v19 presentationInterval];
          [v22 duration];
          double v24 = v23;

          ++self->_lock_environmentCount;
          if (v24 < self->_lock_shortestInterval) {
            self->_double lock_shortestInterval = v24;
          }
          if (v24 > self->_lock_longestInterval) {
            self->_double lock_longestInterval = v24;
          }
          [(NSMutableSet *)self->_lock_pendingEnvironments addObject:v21];
          double v17 = v17 + v24;
        }
        else
        {
          v25 = bls_flipbook_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = [v19 environment];
            *(_DWORD *)buf = 134218498;
            v61 = self;
            __int16 v62 = 2114;
            v63 = v19;
            __int16 v64 = 2114;
            v65 = v26;
            _os_log_error_impl(&dword_21FCFC000, v25, OS_LOG_TYPE_ERROR, "%p nil environment identifier for interval:%{public}@ environment:%{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v55 objects:v66 count:16];
    }
    while (v15);
  }
  else
  {
    double v17 = 0.0;
  }

  uint64_t lock_environmentCount = self->_lock_environmentCount;
  if ([(NSArray *)self->_lock_environmentIdentifiers count] != lock_environmentCount)
  {
    v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_environmentCount == [_lock_environmentIdentifiers count]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHEngineRequestDatesOperation beginOperationWithIntervals:shouldReset:](v45);
    }
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD4412CLL);
  }
  if (![(NSMutableSet *)self->_lock_pendingEnvironments count])
  {
    v44 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_lock_pendingEnvironments count] > 0"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHEngineRequestDatesOperation beginOperationWithIntervals:shouldReset:](v45);
    }
    [v44 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD44190);
  }
  LODWORD(v28) = self->_lock_environmentCount;
  self->_double lock_averageInterval = v17 / (double)v28;
  os_unfair_lock_unlock(&self->_lock);
  -[BLSHEngineRequestDatesOperation scheduleTimeout]((uint64_t)self);
  objc_initWeak((id *)buf, self);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v14;
  uint64_t v29 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v51 + 1) + 8 * j);
        v33 = [v32 environment];
        v34 = [v33 identifier];
        BOOL v35 = v34 == 0;

        if (!v35)
        {
          v36 = [v32 environment];
          v37 = [v32 presentationInterval];
          v38 = [v32 previousPresentationDate];
          if (a4) {
            uint64_t v39 = 1;
          }
          else {
            uint64_t v39 = [v32 shouldReset];
          }
          v48[0] = MEMORY[0x263EF8330];
          v48[1] = 3221225472;
          v48[2] = __75__BLSHEngineRequestDatesOperation_beginOperationWithIntervals_shouldReset___block_invoke_67;
          v48[3] = &unk_264533908;
          objc_copyWeak(&v50, (id *)buf);
          id v40 = v36;
          id v49 = v40;
          [v40 requestDateSpecifiersForDateInterval:v37 previousPresentationDate:v38 shouldReset:v39 completion:v48];

          objc_destroyWeak(&v50);
        }
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v29);
  }

  objc_destroyWeak((id *)buf);
}

id __75__BLSHEngineRequestDatesOperation_beginOperationWithIntervals_shouldReset___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 environment];
  v3 = [v2 identifier];

  return v3;
}

- (void)scheduleTimeout
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_initWeak(&location, (id)a1);
    v3 = *(void **)(a1 + 40);
    uint64_t v4 = [MEMORY[0x263F29C40] descriptionForObject:a1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__BLSHEngineRequestDatesOperation_scheduleTimeout__block_invoke;
    v7[3] = &unk_264533320;
    objc_copyWeak(&v8, &location);
    uint64_t v5 = [v3 scheduledTimerWithIdentifier:v4 interval:v7 leewayInterval:15.0 handler:2.0];
    id v6 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v5;

    os_unfair_lock_unlock(v2);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __75__BLSHEngineRequestDatesOperation_beginOperationWithIntervals_shouldReset___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  -[BLSHEngineRequestDatesOperation environment:didProvideSpecifiers:forPresentationInterval:]((uint64_t)WeakRetained, *(void **)(a1 + 32), v6, v7);
}

- (void)environment:(void *)a3 didProvideSpecifiers:(void *)a4 forPresentationInterval:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(unsigned char *)(a1 + 108)
      || *(unsigned char *)(a1 + 107)
      || (id v10 = *(void **)(a1 + 16),
          [v7 identifier],
          id v11 = objc_claimAutoreleasedReturnValue(),
          [v10 removeObject:v11],
          v11,
          uint64_t v12 = [*(id *)(a1 + 16) count],
          *(unsigned char *)(a1 + 104) = v12 == 0,
          v12))
    {
      uint64_t v13 = 0;
    }
    else
    {
      [*(id *)(a1 + 24) invalidate];
      uint64_t v15 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = 0;

      uint64_t v13 = 1;
    }
    objc_copyWeak(&to, (id *)(a1 + 32));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    id v14 = objc_loadWeakRetained(&to);
    [v14 requestDatesOperation:a1 environment:v7 didProvideSpecifiers:v8 forPresentationInterval:v9 isComplete:v13];

    objc_destroyWeak(&to);
  }
}

- (id)telemetryDataWithEndTime:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [[BLSHFlipbookRequestDatesTelemetryData alloc] initWithTimestamp:self->_lock_environmentIdentifiers environmentIdentifiers:self->_lock_didReset shortestInterval:[(NSMutableSet *)self->_lock_pendingEnvironments count] averageInterval:a3 longestInterval:self->_lock_shortestInterval completionDuration:self->_lock_averageInterval didReset:self->_lock_longestInterval timedOutCount:a3 - self->_lock_beginTime];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

void __50__BLSHEngineRequestDatesOperation_scheduleTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[BLSHEngineRequestDatesOperation timeoutTimerFired]((uint64_t)WeakRetained);
}

- (void)timeoutTimerFired
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_21FCFC000, v0, OS_LOG_TYPE_DEBUG, "%p request dates operation did not complete after ~15 seconds (+leeway), (invalidated), pending environments:%{public}@ ", v1, 0x16u);
}

- (NSDateInterval)requestInterval
{
  return self->_requestInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInterval, 0);
  objc_storeStrong((id *)&self->_lock_beginDate, 0);
  objc_storeStrong((id *)&self->_lock_environmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_osTimerProvider, 0);
  objc_destroyWeak((id *)&self->_lock_delegate);
  objc_storeStrong((id *)&self->_lock_timeoutTimer, 0);

  objc_storeStrong((id *)&self->_lock_pendingEnvironments, 0);
}

- (void)beginOperationWithIntervals:(const char *)a1 shouldReset:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)beginOperationWithIntervals:(const char *)a1 shouldReset:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)beginOperationWithIntervals:(const char *)a1 shouldReset:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)beginOperationWithIntervals:(const char *)a1 shouldReset:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end