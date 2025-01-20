@interface FCGoalCompletionActivitySummaryObserver
- (BOOL)_runGoalCompletionForExerciseWithNewActivitySummary:(id)a3;
- (BOOL)_runGoalCompletionForMoveWithNewActivitySummary:(id)a3;
- (BOOL)_runGoalCompletionForStandWithNewActivitySummary:(id)a3;
- (FCDailyActivityGoalDetectionDelegate)delegate;
- (FCGoalCompletionActivitySummaryObserver)initWithProfile:(id)a3 serviceQueue:(id)a4;
- (void)_runGoalCompletionsForNewActivitySummary:(id)a3 forChangedFields:(unint64_t)a4;
- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FCGoalCompletionActivitySummaryObserver

- (FCGoalCompletionActivitySummaryObserver)initWithProfile:(id)a3 serviceQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FCGoalCompletionActivitySummaryObserver;
  v8 = [(FCGoalCompletionActivitySummaryObserver *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_serviceQueue, a4);
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D3B3E000, v10, OS_LOG_TYPE_DEFAULT, "Profile ready for activity summary observer", v12, 2u);
    }
    [v6 registerProfileReadyObserver:v9 queue:v9->_serviceQueue];
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v4 = [WeakRetained currentActivitySummaryHelper];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)FCGoalCompletionActivitySummaryObserver;
  [(FCGoalCompletionActivitySummaryObserver *)&v5 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  objc_super v5 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D3B3E000, v5, OS_LOG_TYPE_DEFAULT, "Profile ready for activity summary observer", v7, 2u);
  }
  id v6 = [v4 currentActivitySummaryHelper];

  [v6 addObserver:self];
}

- (void)_runGoalCompletionsForNewActivitySummary:(id)a3 forChangedFields:(unint64_t)a4
{
  __int16 v4 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = (HKActivitySummary *)a3;
  previousActivitySummary = self->_previousActivitySummary;
  if (previousActivitySummary)
  {
    uint64_t v8 = [(HKActivitySummary *)previousActivitySummary _activitySummaryIndex];
    if (v8 == [(HKActivitySummary *)v6 _activitySummaryIndex])
    {
      v9 = (os_log_t *)MEMORY[0x1E4F29F08];
      if ((v4 & 0x4002) != 0)
      {
        [(FCGoalCompletionActivitySummaryObserver *)self _runGoalCompletionForMoveWithNewActivitySummary:v6];
        if ((v4 & 4) != 0) {
          goto LABEL_13;
        }
LABEL_10:
        _HKInitializeLogging();
        v20 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG)) {
          -[FCGoalCompletionActivitySummaryObserver _runGoalCompletionsForNewActivitySummary:forChangedFields:](v20, v21, v22, v23, v24, v25, v26, v27);
        }
        goto LABEL_14;
      }
      _HKInitializeLogging();
      v12 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG))
      {
        -[FCGoalCompletionActivitySummaryObserver _runGoalCompletionsForNewActivitySummary:forChangedFields:](v12, v13, v14, v15, v16, v17, v18, v19);
        if ((v4 & 4) == 0) {
          goto LABEL_10;
        }
      }
      else if ((v4 & 4) == 0)
      {
        goto LABEL_10;
      }
LABEL_13:
      [(FCGoalCompletionActivitySummaryObserver *)self _runGoalCompletionForExerciseWithNewActivitySummary:v6];
LABEL_14:
      if ((v4 & 8) != 0)
      {
        [(FCGoalCompletionActivitySummaryObserver *)self _runGoalCompletionForStandWithNewActivitySummary:v6];
      }
      else
      {
        _HKInitializeLogging();
        v28 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEBUG)) {
          -[FCGoalCompletionActivitySummaryObserver _runGoalCompletionsForNewActivitySummary:forChangedFields:](v28, v29, v30, v31, v32, v33, v34, v35);
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained concludeGoalDetectionRun];

      goto LABEL_19;
    }
  }
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_previousActivitySummary;
    int v38 = 138412546;
    v39 = v11;
    __int16 v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_1D3B3E000, v10, OS_LOG_TYPE_DEFAULT, "FCGoalCompletionActivitySummaryObserver running for goal completions and previous summary (%@) is either nil, doesn't have the same index as newSummary (%@)", (uint8_t *)&v38, 0x16u);
  }
LABEL_19:
  v37 = self->_previousActivitySummary;
  self->_previousActivitySummary = v6;
}

- (BOOL)_runGoalCompletionForMoveWithNewActivitySummary:(id)a3
{
  id v4 = a3;
  if ([v4 activityMoveMode] == 2) {
    [MEMORY[0x1E4F2B618] minuteUnit];
  }
  else {
  objc_super v5 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
  }
  id v6 = FIMoveGoalQuantityForActivitySummary();
  id v7 = FIMoveQuantityForActivitySummary();
  uint64_t v8 = FIMoveQuantityForActivitySummary();
  if ([(HKActivitySummary *)self->_previousActivitySummary activityMoveMode] == HKActivityMoveModeAppleMoveTime) {
    [MEMORY[0x1E4F2B618] minuteUnit];
  }
  else {
  v9 = [MEMORY[0x1E4F2B618] kilocalorieUnit];
  }
  [v6 doubleValueForUnit:v5];
  double v11 = v10;
  [v7 doubleValueForUnit:v5];
  double v13 = v12;
  [v8 doubleValueForUnit:v9];
  double v15 = v14;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v17 = objc_msgSend(WeakRetained, "runDailyGoalCompletionDetectionForGoalType:activitySummaryIndex:previousValue:currentValue:goalValue:shouldAlert:goalMetHandler:", 1, objc_msgSend(v4, "_activitySummaryIndex"), objc_msgSend(v4, "isPaused") ^ 1, &__block_literal_global_0, v15, v13, v11);

  if (v17)
  {
    _HKInitializeLogging();
    uint64_t v18 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1D3B3E000, v18, OS_LOG_TYPE_DEFAULT, "Move goal complete!", v20, 2u);
    }
  }

  return v17;
}

BOOL __91__FCGoalCompletionActivitySummaryObserver__runGoalCompletionForMoveWithNewActivitySummary___block_invoke(double a1, double a2)
{
  return a1 >= a2;
}

- (BOOL)_runGoalCompletionForExerciseWithNewActivitySummary:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 appleExerciseTimeGoal];
  id v6 = [MEMORY[0x1E4F2B618] minuteUnit];
  [v5 doubleValueForUnit:v6];
  double v8 = v7;

  v9 = [(HKActivitySummary *)self->_previousActivitySummary appleExerciseTime];
  double v10 = [MEMORY[0x1E4F2B618] minuteUnit];
  [v9 doubleValueForUnit:v10];
  double v12 = v11;

  double v13 = [v4 appleExerciseTime];
  double v14 = [MEMORY[0x1E4F2B618] minuteUnit];
  [v13 doubleValueForUnit:v14];
  double v16 = v15;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v18 = [v4 _activitySummaryIndex];
  LODWORD(v14) = [v4 isPaused];

  int v19 = [WeakRetained runDailyGoalCompletionDetectionForGoalType:2 activitySummaryIndex:v18 previousValue:v14 ^ 1 currentValue:&__block_literal_global_284 goalValue:v12 shouldAlert:v16 goalMetHandler:v8];
  if (v19)
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_1D3B3E000, v20, OS_LOG_TYPE_DEFAULT, "Exercise goal complete!", v22, 2u);
    }
  }
  return v19;
}

BOOL __95__FCGoalCompletionActivitySummaryObserver__runGoalCompletionForExerciseWithNewActivitySummary___block_invoke(double a1, double a2)
{
  return a1 >= a2;
}

- (BOOL)_runGoalCompletionForStandWithNewActivitySummary:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 appleStandHoursGoal];
  id v6 = [MEMORY[0x1E4F2B618] countUnit];
  [v5 doubleValueForUnit:v6];
  double v8 = round(v7);

  v9 = [(HKActivitySummary *)self->_previousActivitySummary appleStandHours];
  double v10 = [MEMORY[0x1E4F2B618] countUnit];
  [v9 doubleValueForUnit:v10];
  double v12 = round(v11);

  double v13 = [v4 appleStandHours];
  double v14 = [MEMORY[0x1E4F2B618] countUnit];
  [v13 doubleValueForUnit:v14];
  double v16 = round(v15);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v18 = [v4 _activitySummaryIndex];
  LODWORD(v14) = [v4 isPaused];

  int v19 = [WeakRetained runDailyGoalCompletionDetectionForGoalType:3 activitySummaryIndex:v18 previousValue:v14 ^ 1 currentValue:&__block_literal_global_286 goalValue:v12 shouldAlert:v16 goalMetHandler:v8];
  if (v19)
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_1D3B3E000, v20, OS_LOG_TYPE_DEFAULT, "Stand goal complete!", v22, 2u);
    }
  }
  return v19;
}

BOOL __92__FCGoalCompletionActivitySummaryObserver__runGoalCompletionForStandWithNewActivitySummary___block_invoke(double a1, double a2)
{
  return (uint64_t)llround(a1) >= (uint64_t)llround(a2);
}

- (void)currentActivitySummaryHelper:(id)a3 didUpdateTodayActivitySummary:(id)a4 changedFields:(unint64_t)a5
{
  id v7 = a4;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__FCGoalCompletionActivitySummaryObserver_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke;
  block[3] = &unk_1E69B8680;
  id v11 = v7;
  double v12 = self;
  unint64_t v13 = a5;
  id v9 = v7;
  dispatch_async(serviceQueue, block);
}

void __116__FCGoalCompletionActivitySummaryObserver_currentActivitySummaryHelper_didUpdateTodayActivitySummary_changedFields___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E4F29F08];
  v3 = *MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D3B3E000, v3, OS_LOG_TYPE_DEFAULT, "FCGoalCompletionActivitySummaryObserver got today activity summary: %@", (uint8_t *)&v7, 0xCu);
  }
  objc_super v5 = *(void **)(a1 + 32);
  if (v5 && ([v5 _isDataLoading] & 1) == 0)
  {
    [*(id *)(a1 + 40) _runGoalCompletionsForNewActivitySummary:*(void *)(a1 + 32) forChangedFields:*(void *)(a1 + 48)];
  }
  else
  {
    _HKInitializeLogging();
    id v6 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1D3B3E000, v6, OS_LOG_TYPE_DEFAULT, "FCGoalCompletionActivitySummaryObserver today activity summary is either nil or still loading data", (uint8_t *)&v7, 2u);
    }
  }
}

- (FCDailyActivityGoalDetectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCDailyActivityGoalDetectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_previousActivitySummary, 0);
  objc_storeStrong((id *)&self->_currentActivitySummary, 0);
}

- (void)_runGoalCompletionsForNewActivitySummary:(uint64_t)a3 forChangedFields:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_runGoalCompletionsForNewActivitySummary:(uint64_t)a3 forChangedFields:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_runGoalCompletionsForNewActivitySummary:(uint64_t)a3 forChangedFields:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end