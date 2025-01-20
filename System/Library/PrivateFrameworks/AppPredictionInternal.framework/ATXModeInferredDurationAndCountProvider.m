@interface ATXModeInferredDurationAndCountProvider
- (ATXModeInferredDurationAndCountProvider)initWithLastNDays:(unint64_t)a3;
- (double)modeInferredDurationInLast1DayForMode:(unint64_t)a3;
- (double)modeInferredDurationInLastNDaysForMode:(unint64_t)a3;
- (unint64_t)modeInferredCountInLast1DayForMode:(unint64_t)a3;
- (unint64_t)modeInferredCountInLastNDaysForMode:(unint64_t)a3;
- (void)cacheInferredModeStreamIfNecessary;
@end

@implementation ATXModeInferredDurationAndCountProvider

- (ATXModeInferredDurationAndCountProvider)initWithLastNDays:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ATXModeInferredDurationAndCountProvider;
  v4 = [(ATXModeInferredDurationAndCountProvider *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)(-86400 * a3)];
    thresholdDateLastNDays = v4->_thresholdDateLastNDays;
    v4->_thresholdDateLastNDays = (NSDate *)v5;
  }
  return v4;
}

- (void)cacheInferredModeStreamIfNecessary
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeInferredDurationAndCountProvider: Could not fetch inferred mode stream with error: %@", (uint8_t *)&v3, 0xCu);
}

void __77__ATXModeInferredDurationAndCountProvider_cacheInferredModeStreamIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v6)
    {
      if ([v6 isStart])
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
        {
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v8 = v7 - *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          v9 = NSNumber;
          v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
          [v10 doubleValue];
          v12 = [v9 numberWithDouble:v8 + v11];
          [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

          v13 = NSNumber;
          v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
          v15 = objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
          [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

          v16 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) absoluteTimestamp];
          [v16 timeIntervalSinceReferenceDate];
          double v18 = v17;
          double v19 = *(double *)(a1 + 96);

          if (v18 > v19)
          {
            v20 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) absoluteTimestamp];
            [v20 timeIntervalSinceReferenceDate];
            double v22 = v21 - *(double *)(a1 + 96);

            v23 = NSNumber;
            v24 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
            [v24 doubleValue];
            if (v8 >= v22) {
              double v26 = v22;
            }
            else {
              double v26 = v8;
            }
            v27 = [v23 numberWithDouble:v26 + v25];
            [*(id *)(a1 + 48) setObject:v27 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

            v28 = NSNumber;
            id v30 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
            v29 = objc_msgSend(v28, "numberWithInt:", objc_msgSend(v30, "intValue") + 1);
            [*(id *)(a1 + 56) setObject:v29 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
          }
        }
      }
    }
  }
}

void __77__ATXModeInferredDurationAndCountProvider_cacheInferredModeStreamIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v33 = a2;
  uint64_t v3 = [v33 eventBody];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v3);
  if ([v3 modeType] == 2)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
    goto LABEL_15;
  }
  [v3 modeType];
  BMUserFocusInferredModeTypeToActivity();
  uint64_t v5 = ATXActivityTypeToString();
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    [v33 timestamp];
    double v7 = v6;
    double v8 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    int v9 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) isEqualToString:v5];
    int v10 = [v3 isStart];
    if (v9)
    {
      if ((v10 & 1) == 0)
      {
        double v11 = v7 - v8;
        v12 = NSNumber;
        v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
        [v13 doubleValue];
        v15 = [v12 numberWithDouble:v11 + v14];
        [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

        v16 = NSNumber;
        double v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
        double v18 = objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "intValue") + 1);
        [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

        [v33 timestamp];
        if (v19 > *(double *)(a1 + 88))
        {
          [v33 timestamp];
          double v21 = v20 - *(double *)(a1 + 88);
          double v22 = NSNumber;
          v23 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
          [v23 doubleValue];
          if (v11 >= v21) {
            double v25 = v21;
          }
          else {
            double v25 = v11;
          }
          double v26 = [v22 numberWithDouble:v25 + v24];
          [*(id *)(a1 + 48) setObject:v26 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

          v27 = NSNumber;
          v28 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
          v29 = objc_msgSend(v27, "numberWithInt:", objc_msgSend(v28, "intValue") + 1);
          [*(id *)(a1 + 56) setObject:v29 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
        }
        uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
        v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = 0;
      }
      goto LABEL_15;
    }
  }
  else
  {
    int v10 = [v3 isStart];
  }
  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v5);
    [v33 timestamp];
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v32;
  }
LABEL_15:
}

- (double)modeInferredDurationInLastNDaysForMode:(unint64_t)a3
{
  [(ATXModeInferredDurationAndCountProvider *)self cacheInferredModeStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_inferredModeDurationSumLastNDays objectForKeyedSubscript:v4];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (double)modeInferredDurationInLast1DayForMode:(unint64_t)a3
{
  [(ATXModeInferredDurationAndCountProvider *)self cacheInferredModeStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_inferredModeDurationSumLast1Day objectForKeyedSubscript:v4];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (unint64_t)modeInferredCountInLastNDaysForMode:(unint64_t)a3
{
  [(ATXModeInferredDurationAndCountProvider *)self cacheInferredModeStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_inferredModeCounterLastNDays objectForKeyedSubscript:v4];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (unint64_t)modeInferredCountInLast1DayForMode:(unint64_t)a3
{
  [(ATXModeInferredDurationAndCountProvider *)self cacheInferredModeStreamIfNecessary];
  uint64_t v4 = ATXModeToString();
  uint64_t v5 = [(NSDictionary *)self->_inferredModeCounterLast1Day objectForKeyedSubscript:v4];
  unint64_t v6 = (int)[v5 intValue];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredModeCounterLast1Day, 0);
  objc_storeStrong((id *)&self->_inferredModeCounterLastNDays, 0);
  objc_storeStrong((id *)&self->_inferredModeDurationSumLast1Day, 0);
  objc_storeStrong((id *)&self->_inferredModeDurationSumLastNDays, 0);
  objc_storeStrong((id *)&self->_thresholdDateLastNDays, 0);
}

@end