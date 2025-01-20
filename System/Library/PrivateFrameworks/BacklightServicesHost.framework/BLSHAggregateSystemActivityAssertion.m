@interface BLSHAggregateSystemActivityAssertion
- (BLSHAggregateSystemActivityAssertion)initWithConfigurator:(id)a3;
- (BOOL)isActive;
- (NSString)description;
- (void)_lock_addSystemActivityAcquisitionHandler:(id)a3;
- (void)acquireIndividualAssertion:(id)a3 handler:(id)a4;
- (void)dealloc;
- (void)didAcquireSystemActivityIsActive:(BOOL)a3 error:(id)a4 details:(id)a5;
- (void)invalidateIndividualAssertion:(id)a3;
- (void)performConfigurator:(id)a3;
- (void)setAcquireWaitsToAbortSleepImminent:(BOOL)a3;
- (void)setAcquireWaitsToAbortSleepRequested:(BOOL)a3;
- (void)setOSInterfaceProvider:(id)a3;
@end

@implementation BLSHAggregateSystemActivityAssertion

- (BLSHAggregateSystemActivityAssertion)initWithConfigurator:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLSHAggregateSystemActivityAssertion;
  v5 = [(BLSHAggregateSystemActivityAssertion *)&v13 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  v5->_lock._os_unfair_lock_opaque = 0;
  uint64_t v7 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:4];
  lock_individualAssertions = v6->_lock_individualAssertions;
  v6->_lock_individualAssertions = (NSHashTable *)v7;

  [(BLSHAggregateSystemActivityAssertion *)v6 performConfigurator:v4];
  if (v6->_osInterfaceProvider)
  {
    objc_initWeak(&location, v6);
    objc_copyWeak(&v11, &location);
    v6->_stateHandler = os_state_add_handler();
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
LABEL_4:

    return v6;
  }
  v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_osInterfaceProvider != nil"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[BLSHAggregateSystemActivityAssertion initWithConfigurator:]();
  }
  [v10 UTF8String];
  result = (BLSHAggregateSystemActivityAssertion *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t __61__BLSHAggregateSystemActivityAssertion_initWithConfigurator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];
  uint64_t v3 = BLSStateDataWithTitleDescriptionAndHints();

  return v3;
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = objc_opt_new();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__BLSHAggregateSystemActivityAssertion_description__block_invoke;
  v12[3] = &unk_2645322D0;
  id v5 = v4;
  id v13 = v5;
  v14 = self;
  [v5 appendProem:self block:v12];
  lock_individualAssertions = self->_lock_individualAssertions;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__BLSHAggregateSystemActivityAssertion_description__block_invoke_2;
  v10[3] = &unk_264533C80;
  id v11 = v5;
  id v7 = v5;
  [v7 appendCollection:lock_individualAssertions withName:@"assertions" itemBlock:v10];
  v8 = [v7 description];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v8;
}

id __51__BLSHAggregateSystemActivityAssertion_description__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "count"), @"count");
}

void __51__BLSHAggregateSystemActivityAssertion_description__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 identifier];
  id v3 = (id)[v2 appendObject:v4 withName:0];
}

- (void)performConfigurator:(id)a3
{
  self->_initializing = 1;
  (*((void (**)(id, BLSHAggregateSystemActivityAssertion *))a3 + 2))(a3, self);
  self->_initializing = 0;
}

- (void)setAcquireWaitsToAbortSleepRequested:(BOOL)a3
{
  if (self->_initializing)
  {
    self->_acquireWaitsToAbortSleepRequested = a3;
  }
  else
  {
    id v3 = NSString;
    id v4 = NSStringFromSelector(a2);
    id v5 = [v3 stringWithFormat:@"%@ called after initialization", v4];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHAggregateSystemActivityAssertion setAcquireWaitsToAbortSleepRequested:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)setAcquireWaitsToAbortSleepImminent:(BOOL)a3
{
  if (self->_initializing)
  {
    self->_acquireWaitsToAbortSleepImminent = a3;
  }
  else
  {
    id v3 = NSString;
    id v4 = NSStringFromSelector(a2);
    id v5 = [v3 stringWithFormat:@"%@ called after initialization", v4];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHAggregateSystemActivityAssertion setAcquireWaitsToAbortSleepImminent:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)setOSInterfaceProvider:(id)a3
{
  id v5 = (BLSHOSInterfaceProviding *)a3;
  if (self->_initializing)
  {
    osInterfaceProvider = self->_osInterfaceProvider;
    self->_osInterfaceProvider = v5;
  }
  else
  {
    id v7 = NSString;
    v8 = NSStringFromSelector(a2);
    v9 = [v7 stringWithFormat:@"%@ called after initialization", v8];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHAggregateSystemActivityAssertion setOSInterfaceProvider:]();
    }
    [v9 UTF8String];
    id v5 = (BLSHOSInterfaceProviding *)_bs_set_crash_log_message();
    __break(0);
  }
  MEMORY[0x270F9A758](v5, osInterfaceProvider);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (BOOL)isActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(BLSHSystemActivityAsserting *)v2->_lock_systemActivityAssertion isActive];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_lock_addSystemActivityAcquisitionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x223C5E2B0](self->_lock_acquisitionHandler);
  uint64_t v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __82__BLSHAggregateSystemActivityAssertion__lock_addSystemActivityAcquisitionHandler___block_invoke;
    v11[3] = &unk_264533CA8;
    id v12 = v5;
    id v13 = v4;
    uint64_t v7 = (void *)MEMORY[0x223C5E2B0](v11);
    id lock_acquisitionHandler = self->_lock_acquisitionHandler;
    self->_id lock_acquisitionHandler = v7;

    id v9 = v12;
  }
  else
  {
    v10 = (void *)MEMORY[0x223C5E2B0](v4);
    id v9 = self->_lock_acquisitionHandler;
    self->_id lock_acquisitionHandler = v10;
  }
}

void __82__BLSHAggregateSystemActivityAssertion__lock_addSystemActivityAcquisitionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, id, id))(v7 + 16);
  id v9 = a4;
  id v10 = a3;
  v8(v7, a2, v10, v9);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)didAcquireSystemActivityIsActive:(BOOL)a3 error:(id)a4 details:(id)a5
{
  BOOL v6 = a3;
  uint64_t v8 = (SWSystemActivityAcquisitionDetails *)a5;
  p_lock = &self->_lock;
  id v10 = a4;
  os_unfair_lock_lock(&self->_lock);
  v14 = (void (**)(id, BOOL, id, id))MEMORY[0x223C5E2B0](self->_lock_acquisitionHandler);
  id lock_acquisitionHandler = self->_lock_acquisitionHandler;
  self->_id lock_acquisitionHandler = 0;

  lock_systemActivityAcquisitionDetails = self->_lock_systemActivityAcquisitionDetails;
  self->_lock_systemActivityAcquisitionDetails = v8;
  id v13 = v8;

  os_unfair_lock_unlock(p_lock);
  v14[2](v14, v6, v10, v13);
}

- (void)acquireIndividualAssertion:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_lock_individualAssertions addObject:v6];
  if ([(BLSHSystemActivityAsserting *)self->_lock_systemActivityAssertion isActive])
  {
    id v9 = self->_lock_systemActivityAcquisitionDetails;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke;
    block[3] = &unk_264533CD0;
    v22 = v9;
    id v23 = v7;
    id v10 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    lock_systemActivityAssertion = self->_lock_systemActivityAssertion;
    [(BLSHAggregateSystemActivityAssertion *)self _lock_addSystemActivityAcquisitionHandler:v7];
    if (!lock_systemActivityAssertion)
    {
      osInterfaceProvider = self->_osInterfaceProvider;
      id v13 = [v6 identifier];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_2;
      v20[3] = &unk_264533CF8;
      v20[4] = self;
      v14 = [(BLSHOSInterfaceProviding *)osInterfaceProvider createSystemActivityAssertionWithIdentifier:v13 configurator:v20];
      v15 = self->_lock_systemActivityAssertion;
      self->_lock_systemActivityAssertion = v14;

      objc_initWeak(&location, self);
      v16 = self->_lock_systemActivityAssertion;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_3;
      v17[3] = &unk_264533D48;
      objc_copyWeak(&v18, &location);
      [(BLSHSystemActivityAsserting *)v16 acquireWithTimeout:v17 handler:0.0];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, *(void *)(a1 + 32));
}

void __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 61);
  id v4 = a2;
  [v4 setAcquireWaitsToAbortSleepRequested:v3];
  [v4 setAcquireWaitsToAbortSleepImminent:*(unsigned __int8 *)(*(void *)(a1 + 32) + 62)];
}

void __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_4;
  v11[3] = &unk_264533D20;
  objc_copyWeak(&v14, (id *)(a1 + 32));
  char v15 = a2;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v11);

  objc_destroyWeak(&v14);
}

void __75__BLSHAggregateSystemActivityAssertion_acquireIndividualAssertion_handler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained didAcquireSystemActivityIsActive:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 32) details:*(void *)(a1 + 40)];
}

- (void)invalidateIndividualAssertion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_individualAssertions removeObject:v5];

  if (![(NSHashTable *)self->_lock_individualAssertions count])
  {
    lock_systemActivityAssertion = self->_lock_systemActivityAssertion;
    if (lock_systemActivityAssertion)
    {
      [(BLSHSystemActivityAsserting *)lock_systemActivityAssertion invalidate];
      id v7 = self->_lock_systemActivityAssertion;
      self->_lock_systemActivityAssertion = 0;
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_acquisitionHandler, 0);
  objc_storeStrong((id *)&self->_lock_individualAssertions, 0);
  objc_storeStrong((id *)&self->_lock_systemActivityAcquisitionDetails, 0);
  objc_storeStrong((id *)&self->_lock_systemActivityAssertion, 0);

  objc_storeStrong((id *)&self->_osInterfaceProvider, 0);
}

- (void)initWithConfigurator:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setAcquireWaitsToAbortSleepRequested:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setAcquireWaitsToAbortSleepImminent:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setOSInterfaceProvider:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end