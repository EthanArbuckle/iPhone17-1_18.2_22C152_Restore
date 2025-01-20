@interface BLSHOnSystemSleepAction
+ (id)actionWithIdentifier:(id)a3 delegate:(id)a4;
+ (id)actionWithIdentifier:(id)a3 delegate:(id)a4 osInterfaceProvider:(id)a5;
- (BLSHOnSystemSleepAction)initWithIdentifier:(id)a3 delegate:(id)a4 osInterfaceProvider:(id)a5;
- (NSString)description;
- (NSString)identifier;
- (int64_t)state;
- (void)actionCompleted;
- (void)install;
- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4;
- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4;
- (void)systemSleepMonitorSleepRequestAborted:(id)a3;
- (void)systemSleepMonitorWillWakeFromSleep:(id)a3;
- (void)systemWillWakeForReason:(id)a3;
- (void)uninstall;
@end

@implementation BLSHOnSystemSleepAction

+ (id)actionWithIdentifier:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[BLSHBacklightOSInterfaceProvider sharedProvider];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [a1 actionWithIdentifier:v7 delegate:v8 osInterfaceProvider:v9];

    return v11;
  }
  else
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sharedProvider != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      +[BLSHOnSystemSleepAction actionWithIdentifier:delegate:](a2);
    }
    [v13 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)actionWithIdentifier:(id)a3 delegate:(id)a4 osInterfaceProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v10 delegate:v9 osInterfaceProvider:v8];

  return v11;
}

- (BLSHOnSystemSleepAction)initWithIdentifier:(id)a3 delegate:(id)a4 osInterfaceProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSHOnSystemSleepAction;
  v12 = [(BLSHOnSystemSleepAction *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_osInterfaceProvider, a5);
    v13->_lock_state = 0;
  }

  return v13;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  v5 = [v3 build];

  return (NSString *)v5;
}

- (int64_t)state
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_state = self->_lock_state;
  if (lock_state == 2)
  {
    v5 = [(BLSHOSInterfaceProviding *)self->_osInterfaceProvider systemSleepMonitor];
    if ([v5 isAwakeOrAbortingSleep])
    {
      self->_int64_t lock_state = 0;
      v6 = bls_backlight_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        identifier = self->_identifier;
        int v9 = 134218242;
        id v10 = self;
        __int16 v11 = 2114;
        v12 = identifier;
        _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_INFO, "%p:%{public}@ sleep action state now waiting (idle), system activity likely aborted sleep", (uint8_t *)&v9, 0x16u);
      }

      int64_t lock_state = 0;
    }
    else
    {
      int64_t lock_state = 2;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return lock_state;
}

- (void)install
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_21FCFC000, v0, v1, "%p:%{public}@ installing sleep action when sleep imminent", v2, v3, v4, v5, v6);
}

uint64_t __34__BLSHOnSystemSleepAction_install__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAcquireWaitsToAbortSleepRequested:1];
}

void __34__BLSHOnSystemSleepAction_install__block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = bls_backlight_log();
  id v10 = v9;
  if (a2) {
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  }
  else {
    os_log_type_t v11 = OS_LOG_TYPE_FAULT;
  }
  if (os_log_type_enabled(v9, v11))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(v12 + 56);
    mach_continuous_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    int v17 = 134219010;
    uint64_t v18 = v12;
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = v14;
    __int16 v25 = 2114;
    id v26 = v7;
    _os_log_impl(&dword_21FCFC000, v10, v11, "%p:%{public}@ install sleep action system activity assertion callback details:%{public}@ elapsed:%.4lfs error:%{public}@", (uint8_t *)&v17, 0x34u);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;
}

- (void)uninstall
{
  id v3 = [(BLSHOSInterfaceProviding *)self->_osInterfaceProvider systemSleepMonitor];
  [v3 removeObserver:self];
}

- (void)systemSleepMonitor:(id)a3 sleepRequestedWithResult:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (uint64_t (**)(id, uint64_t, void))a4;
  char v9 = [v7 isAwakeOrAbortingSleep];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_state = self->_lock_state;
  uint64_t v12 = bls_backlight_log();
  uint64_t v13 = v12;
  if (lock_state) {
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
  }
  if (os_log_type_enabled(v12, v14))
  {
    char v31 = v9;
    uint64_t v15 = a2;
    v16 = v8;
    int64_t v17 = self->_lock_state;
    identifier = self->_identifier;
    __int16 v19 = @"Idle";
    if (v17 == 1) {
      __int16 v19 = @"Performing";
    }
    if (v17 == 2) {
      uint64_t v20 = @"Completed";
    }
    else {
      uint64_t v20 = v19;
    }
    __int16 v21 = v20;
    [v7 aggregateState];
    v23 = id v22 = v7;
    *(_DWORD *)buf = 134218754;
    v36 = self;
    __int16 v37 = 2114;
    v38 = identifier;
    id v8 = v16;
    a2 = v15;
    char v9 = v31;
    __int16 v39 = 2114;
    v40 = v21;
    __int16 v41 = 2114;
    v42 = v23;
    _os_log_impl(&dword_21FCFC000, v13, v14, "%p:%{public}@ sleepRequested state:%{public}@ %{public}@ ", buf, 0x2Au);

    id v7 = v22;
    p_lock = &self->_lock;
  }
  BSContinuousMachTimeNow();
  self->_lock_sleepRequestedTime = v24;
  if (lock_state) {
    char v25 = 1;
  }
  else {
    char v25 = v9;
  }
  if (v25)
  {
    os_unfair_lock_unlock(p_lock);
    id v26 = (id)v8[2](v8, 1, 0);
  }
  else
  {
    if (self->_lock_proceedWithSleepBlock)
    {
      v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_proceedWithSleepBlock == nil"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHOnSystemSleepAction systemSleepMonitor:sleepRequestedWithResult:](a2);
      }
      [v30 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD083F4);
    }
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __71__BLSHOnSystemSleepAction_systemSleepMonitor_sleepRequestedWithResult___block_invoke;
    v33[3] = &unk_264532668;
    v34 = v8;
    uint64_t v27 = (void *)MEMORY[0x223C5E2B0](v33);
    id lock_proceedWithSleepBlock = self->_lock_proceedWithSleepBlock;
    self->_id lock_proceedWithSleepBlock = v27;

    self->_int64_t lock_state = 1;
    os_unfair_lock_unlock(p_lock);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __71__BLSHOnSystemSleepAction_systemSleepMonitor_sleepRequestedWithResult___block_invoke_2;
    v32[3] = &unk_264532258;
    v32[4] = self;
    [WeakRetained systemSleepAction:self performWithCompletion:v32];
  }
}

id __71__BLSHOnSystemSleepAction_systemSleepMonitor_sleepRequestedWithResult___block_invoke(uint64_t a1)
{
  return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__BLSHOnSystemSleepAction_systemSleepMonitor_sleepRequestedWithResult___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) actionCompleted];
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  char v9 = [v7 isAwakeOrAbortingSleep];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_state = self->_lock_state;
  uint64_t v12 = bls_backlight_log();
  uint64_t v13 = v12;
  if (lock_state == 2) {
    os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
  }
  else {
    os_log_type_t v14 = 16 * (lock_state != 0);
  }
  if (os_log_type_enabled(v12, v14))
  {
    id v15 = v8;
    v16 = a2;
    int64_t v17 = self->_lock_state;
    identifier = self->_identifier;
    __int16 v19 = @"Idle";
    if (v17 == 1) {
      __int16 v19 = @"Performing";
    }
    if (v17 == 2) {
      uint64_t v20 = @"Completed";
    }
    else {
      uint64_t v20 = v19;
    }
    __int16 v21 = v20;
    [v7 aggregateState];
    id v22 = v30 = v7;
    *(_DWORD *)buf = 134218754;
    v35 = self;
    __int16 v36 = 2114;
    __int16 v37 = identifier;
    a2 = v16;
    id v8 = v15;
    p_lock = &self->_lock;
    __int16 v38 = 2114;
    __int16 v39 = v21;
    __int16 v40 = 2114;
    __int16 v41 = v22;
    _os_log_impl(&dword_21FCFC000, v13, v14, "%p:%{public}@ prepareForSleep state:%{public}@ %{public}@", buf, 0x2Au);

    id v7 = v30;
  }

  __int16 v23 = (void *)MEMORY[0x223C5E2B0](self->_lock_proceedWithSleepBlock);
  id lock_proceedWithSleepBlock = self->_lock_proceedWithSleepBlock;
  self->_id lock_proceedWithSleepBlock = 0;

  if (v23)
  {
    char v25 = bls_backlight_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[BLSHOnSystemSleepAction systemSleepMonitor:prepareForSleepWithCompletion:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v23);
  }
  if (lock_state == 2)
  {
    if (self->_lock_proceedWithSleepBlock)
    {
      id v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_proceedWithSleepBlock == nil"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BLSHOnSystemSleepAction systemSleepMonitor:prepareForSleepWithCompletion:](a2);
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD08658);
    }
    goto LABEL_21;
  }
  if (v9)
  {
LABEL_21:
    os_unfair_lock_unlock(p_lock);
    dispatch_async(MEMORY[0x263EF83A0], v8);
    goto LABEL_22;
  }
  if (!lock_state) {
    self->_int64_t lock_state = 1;
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __76__BLSHOnSystemSleepAction_systemSleepMonitor_prepareForSleepWithCompletion___block_invoke;
  v32[3] = &unk_264532668;
  id v33 = v8;
  uint64_t v27 = (void *)MEMORY[0x223C5E2B0](v32);
  id v28 = self->_lock_proceedWithSleepBlock;
  self->_id lock_proceedWithSleepBlock = v27;

  os_unfair_lock_unlock(p_lock);
  if (!lock_state)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __76__BLSHOnSystemSleepAction_systemSleepMonitor_prepareForSleepWithCompletion___block_invoke_2;
    v31[3] = &unk_264532258;
    v31[4] = self;
    [WeakRetained systemSleepAction:self performWithCompletion:v31];
  }
LABEL_22:
}

void __76__BLSHOnSystemSleepAction_systemSleepMonitor_prepareForSleepWithCompletion___block_invoke(uint64_t a1)
{
}

uint64_t __76__BLSHOnSystemSleepAction_systemSleepMonitor_prepareForSleepWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) actionCompleted];
}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
}

- (void)systemWillWakeForReason:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = (void *)MEMORY[0x223C5E2B0](self->_lock_proceedWithSleepBlock);
  id lock_proceedWithSleepBlock = self->_lock_proceedWithSleepBlock;
  self->_id lock_proceedWithSleepBlock = 0;

  int64_t lock_state = self->_lock_state;
  id v8 = bls_backlight_log();
  char v9 = v8;
  if (lock_state == 2) {
    os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
  }
  else {
    os_log_type_t v10 = 16 * (lock_state != 0);
  }
  if (os_log_type_enabled(v8, v10))
  {
    int64_t v11 = self->_lock_state;
    identifier = self->_identifier;
    uint64_t v13 = @"Idle";
    if (v11 == 1) {
      uint64_t v13 = @"Performing";
    }
    if (v11 == 2) {
      os_log_type_t v14 = @"Completed";
    }
    else {
      os_log_type_t v14 = v13;
    }
    id v15 = v14;
    v16 = [(BLSHOSInterfaceProviding *)self->_osInterfaceProvider systemSleepMonitor];
    int64_t v17 = [v16 aggregateState];
    int v20 = 134219010;
    __int16 v21 = self;
    __int16 v22 = 2114;
    __int16 v23 = identifier;
    __int16 v24 = 2114;
    id v25 = v4;
    __int16 v26 = 2114;
    uint64_t v27 = v15;
    __int16 v28 = 2114;
    v29 = v17;
    _os_log_impl(&dword_21FCFC000, v9, v10, "%p:%{public}@ systemWillWakeForReason%{public}@ state:%{public}@ %{public}@", (uint8_t *)&v20, 0x34u);
  }
  self->_int64_t lock_state = 0;
  os_unfair_lock_unlock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained systemSleepAction:self systemWillWakeForReason:v4];

  if (v5)
  {
    __int16 v19 = bls_backlight_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[BLSHOnSystemSleepAction systemSleepMonitor:prepareForSleepWithCompletion:]();
    }

    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

- (void)actionCompleted
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_state = self->_lock_state;
  uint64_t v5 = (void (**)(void))MEMORY[0x223C5E2B0](self->_lock_proceedWithSleepBlock);
  id lock_proceedWithSleepBlock = self->_lock_proceedWithSleepBlock;
  self->_id lock_proceedWithSleepBlock = 0;

  id v7 = bls_backlight_log();
  id v8 = v7;
  if (lock_state == 1) {
    os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    identifier = self->_identifier;
    int64_t v10 = self->_lock_state;
    int64_t v11 = @"Idle";
    if (v10 == 1) {
      int64_t v11 = @"Performing";
    }
    if (v10 == 2) {
      uint64_t v12 = @"Completed";
    }
    else {
      uint64_t v12 = v11;
    }
    uint64_t v13 = v12;
    os_log_type_t v14 = (void *)MEMORY[0x223C5E2B0](v5);
    id v15 = [(BLSHOSInterfaceProviding *)self->_osInterfaceProvider systemSleepMonitor];
    v16 = [v15 aggregateState];
    *(_DWORD *)buf = 134219010;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = identifier;
    __int16 v22 = 2114;
    __int16 v23 = v13;
    __int16 v24 = 2048;
    id v25 = v14;
    __int16 v26 = 2114;
    uint64_t v27 = v16;
    _os_log_impl(&dword_21FCFC000, v8, v9, "%p:%{public}@ actionCompleted state:%{public}@ proceedWithSleepBlock=%p %{public}@", buf, 0x34u);
  }
  if (lock_state == 1) {
    self->_int64_t lock_state = 2;
  }
  os_unfair_lock_unlock(p_lock);
  if (v5) {
    v5[2](v5);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_lock_proceedWithSleepBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
}

+ (void)actionWithIdentifier:(const char *)a1 delegate:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)systemSleepMonitor:(const char *)a1 sleepRequestedWithResult:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)systemSleepMonitor:(const char *)a1 prepareForSleepWithCompletion:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)systemSleepMonitor:prepareForSleepWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_21FCFC000, v0, v1, "%p:%{public}@ timed out sleep request", v2, v3, v4, v5, v6);
}

@end