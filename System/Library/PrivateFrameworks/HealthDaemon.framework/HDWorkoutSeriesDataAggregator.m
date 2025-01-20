@interface HDWorkoutSeriesDataAggregator
- (BOOL)shouldAggregateToSeriesForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8;
- (void)setConfiguration:(id)a3;
@end

@implementation HDWorkoutSeriesDataAggregator

- (BOOL)shouldAggregateToSeriesForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8
{
  v8 = [(HDDataAggregator *)self configuration];
  char v9 = [v8 hasActiveWorkout];

  return v9;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = [v4 hasActiveWorkout];
  v6 = [(HDDataAggregator *)self configuration];
  int v7 = [v6 hasActiveWorkout];

  if (v5 != v7)
  {
    v8 = [MEMORY[0x1E4F1C9C8] date];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__HDWorkoutSeriesDataAggregator_setConfiguration___block_invoke;
    v10[3] = &unk_1E62F2978;
    v10[4] = self;
    [(HDActiveDataAggregator *)self requestAggregationThroughDate:v8 mode:0 options:3 completion:v10];
  }
  v9.receiver = self;
  v9.super_class = (Class)HDWorkoutSeriesDataAggregator;
  [(HDDataAggregator *)&v9 setConfiguration:v4];
}

void __50__HDWorkoutSeriesDataAggregator_setConfiguration___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E4F29F10];
  int v7 = *MEMORY[0x1E4F29F10];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v8;
      _os_log_debug_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: setConfiguration requestedAggregation success", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = v6;
    v11 = [v5 localizedDescription];
    int v12 = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    v15 = v11;
    _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: setConfiguration requestedAggregation error: %{public}@", (uint8_t *)&v12, 0x16u);
  }
}

@end