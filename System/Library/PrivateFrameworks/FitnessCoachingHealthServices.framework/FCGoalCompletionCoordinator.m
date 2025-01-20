@interface FCGoalCompletionCoordinator
- (BOOL)_goalTypeAllowed:(int64_t)a3;
- (BOOL)runDailyGoalCompletionDetectionForGoalType:(int64_t)a3 activitySummaryIndex:(int64_t)a4 previousValue:(double)a5 currentValue:(double)a6 goalValue:(double)a7 shouldAlert:(BOOL)a8 goalMetHandler:(id)a9;
- (FCGoalCompletionCoordinator)initWithProfile:(id)a3 goalCompletionStore:(id)a4 serviceQueue:(id)a5;
- (FCGoalCompletionCoordinator)initWithProfile:(id)a3 serviceQueue:(id)a4;
- (FCGoalCompletionCoordinatorDelegate)delegate;
- (id)goalTypesToNotifyByActivitySummaryIndex;
- (int64_t)_activitySummaryIndexForDate:(id)a3;
- (void)concludeGoalDetectionRun;
- (void)notificationPosted:(id)a3;
- (void)notificationPostedForGoalTypes:(id)a3 activitySummaryIndex:(int64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FCGoalCompletionCoordinator

- (FCGoalCompletionCoordinator)initWithProfile:(id)a3 serviceQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FCGoalCompletionCoordinator;
  v8 = [(FCGoalCompletionCoordinator *)&v11 init];
  if (v8)
  {
    v9 = [[FCGoalCompletionStore alloc] initWithProfile:v6];
    v8 = [(FCGoalCompletionCoordinator *)v8 initWithProfile:v6 goalCompletionStore:v9 serviceQueue:v7];
  }
  return v8;
}

- (FCGoalCompletionCoordinator)initWithProfile:(id)a3 goalCompletionStore:(id)a4 serviceQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FCGoalCompletionCoordinator;
  objc_super v11 = [(FCGoalCompletionCoordinator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_goalCompletionStore, a4);
    objc_storeWeak((id *)&v12->_profile, v8);
    objc_storeStrong((id *)&v12->_serviceQueue, a5);
  }

  return v12;
}

- (id)goalTypesToNotifyByActivitySummaryIndex
{
  return [(FCGoalCompletionStore *)self->_goalCompletionStore goalTypesToNotifyByActivitySummaryIndex];
}

- (void)notificationPosted:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1D3B3E000, v5, OS_LOG_TYPE_DEFAULT, "Removing goal completion types for content %@", (uint8_t *)&v9, 0xCu);
  }
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [v4 completedGoalTypes];
  id v8 = [v6 setWithArray:v7];

  -[FCGoalCompletionCoordinator notificationPostedForGoalTypes:activitySummaryIndex:](self, "notificationPostedForGoalTypes:activitySummaryIndex:", v8, [v4 activitySummaryIndex]);
}

- (void)notificationPostedForGoalTypes:(id)a3 activitySummaryIndex:(int64_t)a4
{
}

- (BOOL)runDailyGoalCompletionDetectionForGoalType:(int64_t)a3 activitySummaryIndex:(int64_t)a4 previousValue:(double)a5 currentValue:(double)a6 goalValue:(double)a7 shouldAlert:(BOOL)a8 goalMetHandler:(id)a9
{
  BOOL v9 = a8;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v16 = (uint64_t (**)(void, double, double))a9;
  if (![(FCGoalCompletionCoordinator *)self _goalTypeAllowed:a3])
  {
    _HKInitializeLogging();
    v21 = *MEMORY[0x1E4F29F08];
    BOOL v22 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)v38 = 67109120;
    *(_DWORD *)&v38[4] = a3;
    _os_log_impl(&dword_1D3B3E000, v21, OS_LOG_TYPE_DEFAULT, "Goal type %d not allowed on device", v38, 8u);
LABEL_12:
    BOOL v22 = 0;
    goto LABEL_30;
  }
  if (a5 >= a7) {
    [(FCGoalCompletionStore *)self->_goalCompletionStore addDailyGoalTypePreviouslyMet:a3 activitySummaryIndex:a4];
  }
  char v17 = v16[2](v16, a5, a7);
  int v18 = v16[2](v16, a6, a7);
  char v19 = v18;
  if ((v17 & 1) != 0 || !v18)
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEBUG)) {
      -[FCGoalCompletionCoordinator runDailyGoalCompletionDetectionForGoalType:activitySummaryIndex:previousValue:currentValue:goalValue:shouldAlert:goalMetHandler:](v17, v19, v23);
    }
    goto LABEL_12;
  }
  if ((unint64_t)a3 > 4) {
    v20 = @"Unknown";
  }
  else {
    v20 = off_1E69B8548[a3];
  }
  int v24 = [MEMORY[0x1E4F2B860] isAppleInternalInstall];
  _HKInitializeLogging();
  v25 = (os_log_t *)MEMORY[0x1E4F29F08];
  v26 = *MEMORY[0x1E4F29F08];
  BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT);
  if (v24)
  {
    if (v27)
    {
      *(_DWORD *)v38 = 138413314;
      *(void *)&v38[4] = v20;
      *(_WORD *)&v38[12] = 2048;
      *(void *)&v38[14] = a4;
      *(_WORD *)&v38[22] = 2048;
      double v39 = a5;
      *(_WORD *)v40 = 2048;
      *(double *)&v40[2] = a6;
      *(_WORD *)&v40[10] = 2048;
      *(double *)&v40[12] = a7;
      v28 = "Goal type %@ for summary index %lld went from %f to %f; goal is %f";
      v29 = v26;
      uint32_t v30 = 52;
LABEL_19:
      _os_log_impl(&dword_1D3B3E000, v29, OS_LOG_TYPE_DEFAULT, v28, v38, v30);
    }
  }
  else if (v27)
  {
    *(_DWORD *)v38 = 138412290;
    *(void *)&v38[4] = v20;
    v28 = "Goal type %@ today value updated";
    v29 = v26;
    uint32_t v30 = 12;
    goto LABEL_19;
  }
  if (-[FCGoalCompletionStore isDailyGoalTypeMet:activitySummaryIndex:](self->_goalCompletionStore, "isDailyGoalTypeMet:activitySummaryIndex:", a3, a4, *(_OWORD *)v38, *(void *)&v38[16], *(void *)&v39, *(_OWORD *)v40, *(void *)&v40[16], v41))
  {
    _HKInitializeLogging();
    os_log_t v31 = *v25;
    if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
    {
      goalCompletionStore = self->_goalCompletionStore;
      v33 = v31;
      v34 = [(FCGoalCompletionStore *)goalCompletionStore allGoalTypesMetForActivitySummaryIndex:a4];
      *(_DWORD *)v38 = 138543874;
      *(void *)&v38[4] = v20;
      *(_WORD *)&v38[12] = 2048;
      *(void *)&v38[14] = a4;
      *(_WORD *)&v38[22] = 2112;
      double v39 = *(double *)&v34;
      _os_log_impl(&dword_1D3B3E000, v33, OS_LOG_TYPE_DEFAULT, "Attempted to add goal type %{public}@ that was already added for activitySummaryIndex: %lld; existing set is %@",
        v38,
        0x20u);
    }
  }
  else
  {
    [(FCGoalCompletionStore *)self->_goalCompletionStore addGoalTypeToDailyGoalTypesMet:a3 activitySummaryIndex:a4];
    _HKInitializeLogging();
    v35 = *v25;
    BOOL v36 = os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v36)
      {
        *(_DWORD *)v38 = 138543362;
        *(void *)&v38[4] = v20;
        _os_log_impl(&dword_1D3B3E000, v35, OS_LOG_TYPE_DEFAULT, "Goal type %{public}@ was just met, notifying", v38, 0xCu);
      }
      [(FCGoalCompletionStore *)self->_goalCompletionStore addGoalTypeToNotify:a3 activitySummaryIndex:a4];
    }
    else if (v36)
    {
      *(_DWORD *)v38 = 138543362;
      *(void *)&v38[4] = v20;
      _os_log_impl(&dword_1D3B3E000, v35, OS_LOG_TYPE_DEFAULT, "Goal type %{public}@ was just met, but we are told not to notify (paused rings)", v38, 0xCu);
    }
  }
  BOOL v22 = 1;
LABEL_30:

  return v22;
}

- (void)concludeGoalDetectionRun
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  int64_t v4 = [(FCGoalCompletionCoordinator *)self _activitySummaryIndexForDate:v3];

  v5 = [(FCGoalCompletionStore *)self->_goalCompletionStore goalTypesToNotifyForActivitySummaryIndex:v4];
  if ([v5 count])
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      int v14 = 134217984;
      uint64_t v15 = [v5 count];
      _os_log_impl(&dword_1D3B3E000, v7, OS_LOG_TYPE_DEFAULT, "Goal Completion Coordinator requesting notification for %ld completed goal types", (uint8_t *)&v14, 0xCu);
    }
    id v8 = objc_alloc(MEMORY[0x1E4F620D0]);
    BOOL v9 = [MEMORY[0x1E4F29128] UUID];
    id v10 = [v9 UUIDString];
    uint64_t v11 = [v5 allObjects];
    v12 = (void *)[v8 initWithActivitySummaryIndex:v4 identifier:v10 completedGoalTypes:v11];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained coordinator:self postGoalCompletionNotification:v12];
  }
}

- (int64_t)_activitySummaryIndexForDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = objc_msgSend(v3, "hk_gregorianCalendar");
  id v6 = [v5 components:*MEMORY[0x1E4F2BC40] fromDate:v4];

  int64_t v7 = _HKCacheIndexFromDateComponents();
  return v7;
}

- (BOOL)_goalTypeAllowed:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained daemon];
  id v6 = [v5 behavior];
  if ([v6 isAppleWatch]) {
    int64_t v7 = &unk_1F2B47A70;
  }
  else {
    int64_t v7 = &unk_1F2B47A58;
  }

  id v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  char v9 = [v7 containsObject:v8];

  return v9;
}

- (FCGoalCompletionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCGoalCompletionCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_goalCompletionStore, 0);
}

- (void)runDailyGoalCompletionDetectionForGoalType:(os_log_t)log activitySummaryIndex:previousValue:currentValue:goalValue:shouldAlert:goalMetHandler:.cold.1(char a1, char a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_debug_impl(&dword_1D3B3E000, log, OS_LOG_TYPE_DEBUG, "Goal previously met %{BOOL}d, currently met %{BOOL}d", (uint8_t *)v3, 0xEu);
}

@end