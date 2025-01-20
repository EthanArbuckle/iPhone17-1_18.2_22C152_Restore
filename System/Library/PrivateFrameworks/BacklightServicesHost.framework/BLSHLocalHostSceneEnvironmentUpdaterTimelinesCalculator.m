@interface BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator
- (id)initWithDateInterval:(void *)a3 previousPresentationDate:(void *)a4 localHostEnvironment:(void *)a5 subHostedHostEnvironments:(char)a6 shouldReset:(void *)a7 osTimerProvider:;
- (void)calculateWithCompletion:(id)a3;
- (void)callCompletionIfDone;
- (void)lock_completeAllTimelineEntries;
- (void)requestDatesOperation:(id)a3 didTimeoutPendingEnvironments:(id)a4;
- (void)requestDatesOperation:(id)a3 environment:(id)a4 didProvideSpecifiers:(id)a5 forPresentationInterval:(id)a6 isComplete:(BOOL)a7;
@end

@implementation BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator

- (id)initWithDateInterval:(void *)a3 previousPresentationDate:(void *)a4 localHostEnvironment:(void *)a5 subHostedHostEnvironments:(char)a6 shouldReset:(void *)a7 osTimerProvider:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (a1)
  {
    v26.receiver = a1;
    v26.super_class = (Class)BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator;
    v18 = (id *)objc_msgSendSuper2(&v26, sel_init);
    a1 = v18;
    if (v18)
    {
      *((_DWORD *)v18 + 2) = 0;
      uint64_t v19 = [v13 copy];
      id v20 = a1[6];
      a1[6] = (id)v19;

      uint64_t v21 = [v14 copy];
      id v22 = a1[7];
      a1[7] = (id)v21;

      objc_storeStrong(a1 + 8, a4);
      uint64_t v23 = [v16 copy];
      id v24 = a1[9];
      a1[9] = (id)v23;

      *((unsigned char *)a1 + 88) = a6;
      objc_storeStrong(a1 + 10, a7);
    }
  }

  return a1;
}

- (void)calculateWithCompletion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [MEMORY[0x263EFF9C0] set];
  lock_timelines = self->_lock_timelines;
  self->_lock_timelines = v5;

  if (self->_lock_completion)
  {
    v18 = [NSString stringWithFormat:@"we only support one calculation in-flight at a time"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator calculateWithCompletion:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v7 = (void *)MEMORY[0x223C5E2B0](v4);
    id lock_completion = self->_lock_completion;
    self->_id lock_completion = v7;

    NSUInteger v9 = [(NSArray *)self->_subHostedHostEnvironments count];
    if (!v9) {
      self->_lock_requestDatesOperationComplete = 1;
    }
    os_unfair_lock_unlock(&self->_lock);
    v10 = [(BLSBacklightSceneEnvironment *)self->_localHostEnvironment delegate];
    localHostEnvironment = self->_localHostEnvironment;
    dateInterval = self->_dateInterval;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __83__BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator_calculateWithCompletion___block_invoke;
    v20[3] = &unk_264533F20;
    v20[4] = self;
    [v10 environment:localHostEnvironment timelinesForDateInterval:dateInterval previousSpecifier:0 completion:v20];

    if (v9)
    {
      subHostedHostEnvironments = self->_subHostedHostEnvironments;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __83__BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator_calculateWithCompletion___block_invoke_2;
      v19[3] = &unk_264533F48;
      v19[4] = self;
      id v14 = [(NSArray *)subHostedHostEnvironments bs_map:v19];
      id v15 = [[BLSHEngineRequestDatesOperation alloc] initWithRequestInterval:self->_dateInterval delegate:self osTimerProvider:self->_osTimerProvider];
      os_unfair_lock_lock(&self->_lock);
      lock_requestDatesOperation = self->_lock_requestDatesOperation;
      self->_lock_requestDatesOperation = v15;
      id v17 = v15;

      os_unfair_lock_unlock(&self->_lock);
      [(BLSHEngineRequestDatesOperation *)v17 beginOperationWithIntervals:v14 shouldReset:self->_shouldReset];
    }
  }
}

uint64_t __83__BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator_calculateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  [*(id *)(*(void *)(a1 + 32) + 16) addObjectsFromArray:v4];

  *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v5 = *(void **)(a1 + 32);

  return [v5 callCompletionIfDone];
}

id __83__BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator_calculateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 64);
  id v4 = a2;
  v5 = [v3 alwaysOnSession];
  v6 = [v5 specifierForPresentationDate:*(void *)(*(void *)(a1 + 32) + 56)];

  v7 = [*(id *)(*(void *)(a1 + 32) + 64) identifier];
  v8 = [v6 entrySpecifierForTimelineIdentifier:v7];

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 48);
  v10 = [v8 timelineEntry];
  v11 = [v10 presentationTime];
  v12 = +[BLSHEnvironmentDateInterval intervalWithPresentationInterval:v9 previousPresentationDate:v11 shouldReset:*(unsigned __int8 *)(*(void *)(a1 + 32) + 88) environment:v4];

  return v12;
}

- (void)callCompletionIfDone
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_localHostEnvTimelinesComplete && self->_lock_requestDatesOperationComplete)
  {
    id v4 = [(NSMutableSet *)self->_lock_timelines allObjects];
    v7 = (void (**)(id, BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator *, void *))MEMORY[0x223C5E2B0](self->_lock_completion);
    [(BLSHEngineRequestDatesOperation *)self->_lock_requestDatesOperation invalidate];
    lock_requestDatesOperation = self->_lock_requestDatesOperation;
    self->_lock_requestDatesOperation = 0;

    id lock_completion = self->_lock_completion;
    self->_id lock_completion = 0;

    os_unfair_lock_unlock(p_lock);
    v7[2](v7, self, v4);
  }
  else
  {
    v7 = (void (**)(id, BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator *, void *))MEMORY[0x223C5E2B0](self->_lock_completion);
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)lock_completeAllTimelineEntries
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_lock_incompleteTimelineEntriesForDateInterval;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_incompleteTimelineEntriesForDateInterval, "objectForKeyedSubscript:", v8, (void)v11);
        v10 = [MEMORY[0x263F29950] timelineWithEntries:v9 identifier:v8 configure:0];
        [(NSMutableSet *)self->_lock_timelines addObject:v10];
      }
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)requestDatesOperation:(id)a3 environment:(id)a4 didProvideSpecifiers:(id)a5 forPresentationInterval:(id)a6 isComplete:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a4;
  objc_msgSend(a5, "bs_map:", &__block_literal_global_21);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  long long v11 = BLSHSubhostedEnvironmentIdentifierForEnvironment(v10);

  os_unfair_lock_lock(&self->_lock);
  long long v12 = [(NSMutableDictionary *)self->_lock_incompleteTimelineEntriesForDateInterval objectForKey:v11];
  long long v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 arrayByAddingObjectsFromArray:v19];

    id v15 = (id)v14;
  }
  else
  {
    id v15 = v19;
  }
  lock_incompleteTimelineEntriesForDateInterval = self->_lock_incompleteTimelineEntriesForDateInterval;
  id v20 = v15;
  if (!lock_incompleteTimelineEntriesForDateInterval)
  {
    id v17 = [MEMORY[0x263EFF9A0] dictionary];
    v18 = self->_lock_incompleteTimelineEntriesForDateInterval;
    self->_lock_incompleteTimelineEntriesForDateInterval = v17;

    lock_incompleteTimelineEntriesForDateInterval = self->_lock_incompleteTimelineEntriesForDateInterval;
  }
  -[NSMutableDictionary setObject:forKey:](lock_incompleteTimelineEntriesForDateInterval, "setObject:forKey:");
  if (v7)
  {
    self->_lock_requestDatesOperationComplete = 1;
    [(BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator *)self lock_completeAllTimelineEntries];
    os_unfair_lock_unlock(&self->_lock);
    [(BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator *)self callCompletionIfDone];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

id __149__BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator_requestDatesOperation_environment_didProvideSpecifiers_forPresentationInterval_isComplete___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F29958];
  id v3 = a2;
  uint64_t v4 = [v3 date];
  uint64_t v5 = [v3 fidelity];

  uint64_t v6 = [v2 entryForPresentationTime:v4 withRequestedFidelity:v5 animated:0 userObject:0];

  return v6;
}

- (void)requestDatesOperation:(id)a3 didTimeoutPendingEnvironments:(id)a4
{
  if ([a3 isComplete])
  {
    os_unfair_lock_lock(&self->_lock);
    self->_lock_requestDatesOperationComplete = 1;
    [(BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator *)self lock_completeAllTimelineEntries];
    os_unfair_lock_unlock(&self->_lock);
    [(BLSHLocalHostSceneEnvironmentUpdaterTimelinesCalculator *)self callCompletionIfDone];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_completion, 0);
  objc_storeStrong((id *)&self->_osTimerProvider, 0);
  objc_storeStrong((id *)&self->_subHostedHostEnvironments, 0);
  objc_storeStrong((id *)&self->_localHostEnvironment, 0);
  objc_storeStrong((id *)&self->_previousPresentationDate, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_lock_requestDatesOperation, 0);
  objc_storeStrong((id *)&self->_lock_incompleteTimelineEntriesForDateInterval, 0);

  objc_storeStrong((id *)&self->_lock_timelines, 0);
}

- (void)calculateWithCompletion:.cold.1()
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

@end