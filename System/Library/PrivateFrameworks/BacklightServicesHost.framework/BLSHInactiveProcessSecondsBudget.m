@interface BLSHInactiveProcessSecondsBudget
- (BLSHInactiveProcessSecondsBudget)initWithIdentifier:(id)a3 osTimerProvider:(id)a4;
- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3;
- (NSString)description;
- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5;
- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4;
- (void)chargeRenderedSpecifier:(id)a3 expectedFidelity:(int64_t)a4;
- (void)dealloc;
- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5;
- (void)performInvalidation;
- (void)resetFutureSpecifiers;
@end

@implementation BLSHInactiveProcessSecondsBudget

- (BLSHInactiveProcessSecondsBudget)initWithIdentifier:(id)a3 osTimerProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHInactiveProcessSecondsBudget;
  v8 = [(BLSHInactiveProcessSecondsBudget *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_osTimerProvider, a4);
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)dealloc
{
  [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BLSHInactiveProcessSecondsBudget;
  [(BLSHInactiveProcessSecondsBudget *)&v3 dealloc];
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_identifier withName:@"identifier"];
  id v6 = (id)[v4 appendObject:self->_lock_previousSecondsFutureSpecifier withName:@"previousFuture" skipIfNil:1];
  id v7 = (id)[v4 appendObject:self->_lock_exemptedSecondsFutureSpecifier withName:@"exemptedFuture" skipIfNil:1];
  id v8 = (id)[v4 appendObject:self->_lock_previousSecondsRenderedSpecifier withName:@"previousRendered" skipIfNil:1];
  uint64_t v9 = [(NSDate *)self->_lock_lastInvalidation bls_loggingString];
  id v10 = (id)[v4 appendObject:v9 withName:@"lastInvalidation" skipIfNil:1];

  if ([(BSTimerScheduleQuerying *)self->_lock_invalidationTimer isScheduled])
  {
    [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer timeRemaining];
    id v11 = (id)objc_msgSend(v4, "appendTimeInterval:withName:decomposeUnits:", @"pendingInvalidation", 1);
  }
  objc_super v12 = [v4 build];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v12;
}

- (int64_t)allowedFidelityAtDate:(id)a3 expectedFidelity:(int64_t)a4
{
  id v5 = a3;
  if (a4 == 2)
  {

    return 2;
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"expectedFidelity == BLSUpdateFidelitySeconds"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHInactiveProcessSecondsBudget allowedFidelityAtDate:expectedFidelity:]();
    }
    [v7 UTF8String];
    int64_t result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)validateAndChargeFutureSpecifier:(id)a3 nextSpecifier:(id)a4 expectedFidelity:(int64_t)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (a5 != 2)
  {
    v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"expectedFidelity == BLSUpdateFidelitySeconds"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHInactiveProcessSecondsBudget validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:]();
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD2843CLL);
  }
  id v11 = v10;
  id v12 = v9;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_previousSecondsFutureSpecifier = self->_lock_previousSecondsFutureSpecifier;
  if (lock_previousSecondsFutureSpecifier)
  {
    v15 = lock_previousSecondsFutureSpecifier;
  }
  else
  {
    v15 = self->_lock_previousSecondsRenderedSpecifier;
    if (!v15)
    {
LABEL_14:
      v28 = v12;
      goto LABEL_15;
    }
  }
  v16 = [v12 date];
  v17 = [(BLSAlwaysOnDateSpecifier *)v15 date];
  [v16 timeIntervalSinceDate:v17];
  if (v18 >= 0.75)
  {

    goto LABEL_14;
  }
  v19 = [v11 date];
  v20 = [v12 date];
  [v19 timeIntervalSinceDate:v20];
  double v22 = v21;

  if (v22 >= 0.75) {
    goto LABEL_14;
  }
  if (!self->_lock_exemptedSecondsFutureSpecifier) {
    goto LABEL_14;
  }
  v23 = [v12 date];
  v24 = [(BLSAlwaysOnDateSpecifier *)self->_lock_exemptedSecondsFutureSpecifier date];
  [v23 timeIntervalSinceDate:v24];
  double v26 = v25;

  if (v26 < 1.0) {
    goto LABEL_14;
  }
  if (v26 >= 30.0)
  {
    objc_storeStrong((id *)&self->_lock_exemptedSecondsFutureSpecifier, a3);
    goto LABEL_14;
  }
  v27 = bls_budget_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    identifier = self->_identifier;
    v33 = self->_lock_previousSecondsFutureSpecifier;
    lock_exemptedSecondsFutureSpecifier = self->_lock_exemptedSecondsFutureSpecifier;
    *(_DWORD *)buf = 134219266;
    v37 = self;
    __int16 v38 = 2114;
    v39 = identifier;
    __int16 v40 = 2114;
    id v41 = v12;
    __int16 v42 = 2114;
    v43 = v33;
    __int16 v44 = 2114;
    v45 = v11;
    __int16 v46 = 2114;
    v47 = lock_exemptedSecondsFutureSpecifier;
    _os_log_debug_impl(&dword_21FCFC000, v27, OS_LOG_TYPE_DEBUG, "%p:%{public}@ expectedFidelity:BLSUpdateFidelitySeconds specifier:%{public}@ denied - previous:%{public}@ next:%{public}@ exempted:%{public}@", buf, 0x3Eu);
  }

  v28 = 0;
LABEL_15:
  v29 = self->_lock_previousSecondsFutureSpecifier;
  self->_lock_previousSecondsFutureSpecifier = (BLSAlwaysOnDateSpecifier *)v12;
  id v30 = v12;

  os_unfair_lock_unlock(p_lock);

  return v28;
}

- (void)resetFutureSpecifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_previousSecondsFutureSpecifier = self->_lock_previousSecondsFutureSpecifier;
  self->_lock_previousSecondsFutureSpecifier = 0;

  lock_exemptedSecondsFutureSpecifier = self->_lock_exemptedSecondsFutureSpecifier;
  self->_lock_exemptedSecondsFutureSpecifier = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)chargeRenderedSpecifier:(id)a3 expectedFidelity:(int64_t)a4
{
  id v6 = (BLSAlwaysOnDateSpecifier *)a3;
  if (a4 == 2)
  {
    id v7 = v6;
    os_unfair_lock_lock(&self->_lock);
    lock_previousSecondsRenderedSpecifier = self->_lock_previousSecondsRenderedSpecifier;
    self->_lock_previousSecondsRenderedSpecifier = v7;

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"expectedFidelity == BLSUpdateFidelitySeconds"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHInactiveProcessSecondsBudget chargeRenderedSpecifier:expectedFidelity:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)invalidateAtRequestDate:(id)a3 expectedFidelity:(int64_t)a4 invalidationBlock:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = (void (**)(void))a5;
  if (a4 != 2)
  {
    double v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"expectedFidelity == BLSUpdateFidelitySeconds"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHInactiveProcessSecondsBudget invalidateAtRequestDate:expectedFidelity:invalidationBlock:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD28888);
  }
  id v11 = v10;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_lastInvalidation && (objc_msgSend(v9, "timeIntervalSinceDate:"), v12 < 0.5))
  {
    int v13 = [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer isScheduled];
    v14 = bls_budget_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        identifier = self->_identifier;
        v17 = objc_msgSend(v9, "bls_shortLoggingString");
        [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer timeRemaining];
        *(_DWORD *)buf = 134218754;
        v29 = self;
        __int16 v30 = 2114;
        v31 = identifier;
        __int16 v32 = 2114;
        v33 = v17;
        __int16 v34 = 2048;
        uint64_t v35 = v18;
        _os_log_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_INFO, "%p:%{public}@ will ignore budgeted invalidation (BLSUpdateFidelitySeconds) requesteDate:%{public}@ already have scheduled invalidation in %.3lfs", buf, 0x2Au);
      }
    }
    else
    {
      if (v15)
      {
        v19 = self->_identifier;
        v20 = objc_msgSend(v9, "bls_shortLoggingString");
        double v21 = [(NSDate *)self->_lock_lastInvalidation bls_shortLoggingString];
        *(_DWORD *)buf = 134219010;
        v29 = self;
        __int16 v30 = 2114;
        v31 = v19;
        __int16 v32 = 2114;
        v33 = v20;
        __int16 v34 = 2048;
        uint64_t v35 = 0x3FE0000000000000;
        __int16 v36 = 2114;
        v37 = v21;
        _os_log_impl(&dword_21FCFC000, v14, OS_LOG_TYPE_INFO, "%p:%{public}@ will schedule budgeted invalidation (BLSUpdateFidelitySeconds) requesteDate:%{public}@ in %.0lfs  previous:%{public}@", buf, 0x34u);
      }
      [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer invalidate];
      osTimerProvider = self->_osTimerProvider;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __95__BLSHInactiveProcessSecondsBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke;
      v26[3] = &unk_264532FD8;
      v27 = v11;
      v23 = [(BLSHOSTimerProviding *)osTimerProvider scheduledTimerWithIdentifier:@"SecondsInvalidationBudgetExceeded" interval:v26 leewayInterval:0.5 handler:0.125];
      lock_invalidationTimer = self->_lock_invalidationTimer;
      self->_lock_invalidationTimer = v23;

      v14 = v27;
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_lastInvalidation, a3);
    os_unfair_lock_unlock(&self->_lock);
    v11[2](v11);
  }
}

uint64_t __95__BLSHInactiveProcessSecondsBudget_invalidateAtRequestDate_expectedFidelity_invalidationBlock___block_invoke(uint64_t a1, void *a2)
{
  [a2 invalidate];
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)performInvalidation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(BLSHOSTimerProviding *)self->_osTimerProvider now];
  lock_lastInvalidation = self->_lock_lastInvalidation;
  self->_lock_lastInvalidation = v4;

  [(BSTimerScheduleQuerying *)self->_lock_invalidationTimer invalidate];
  lock_invalidationTimer = self->_lock_invalidationTimer;
  self->_lock_invalidationTimer = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)stillTrackingAfterPurgingStaleDataForNowDate:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_previousSecondsRenderedSpecifier = self->_lock_previousSecondsRenderedSpecifier;
  if (lock_previousSecondsRenderedSpecifier)
  {
    id v7 = [(BLSAlwaysOnDateSpecifier *)lock_previousSecondsRenderedSpecifier date];
    [v4 timeIntervalSinceDate:v7];
    double v9 = v8;

    if (v9 < 1.0) {
      goto LABEL_5;
    }
  }
  lock_previousSecondsFutureSpecifier = self->_lock_previousSecondsFutureSpecifier;
  if (lock_previousSecondsFutureSpecifier
    && ([(BLSAlwaysOnDateSpecifier *)lock_previousSecondsFutureSpecifier date],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v4 timeIntervalSinceDate:v11],
        double v13 = v12,
        v11,
        v13 < 1.0))
  {
LABEL_5:
    BOOL v14 = 1;
  }
  else if (self->_lock_lastInvalidation)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    BOOL v14 = v15 < 1.0;
  }
  else
  {
    BOOL v14 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_lock_lastInvalidation, 0);
  objc_storeStrong((id *)&self->_lock_previousSecondsRenderedSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_exemptedSecondsFutureSpecifier, 0);
  objc_storeStrong((id *)&self->_lock_previousSecondsFutureSpecifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_osTimerProvider, 0);
}

- (void)allowedFidelityAtDate:expectedFidelity:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)validateAndChargeFutureSpecifier:nextSpecifier:expectedFidelity:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)chargeRenderedSpecifier:expectedFidelity:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)invalidateAtRequestDate:expectedFidelity:invalidationBlock:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end