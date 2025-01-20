@interface FCGoalProgressEvaluator
+ (BOOL)_eventDidCrossScheduledThreshold:(id)a3 withModel:(id)a4 evaluationDelegate:(id)a5;
+ (id)_nextFireDateForEvent:(id)a3 model:(id)a4;
+ (id)evaluateEvents:(id)a3 withModel:(id)a4 evaluationDelegate:(id)a5;
+ (id)nextScheduledDatesByEventIdentifiersForEvents:(id)a3 model:(id)a4 evaluationDelegate:(id)a5;
@end

@implementation FCGoalProgressEvaluator

+ (id)nextScheduledDatesByEventIdentifiersForEvents:(id)a3 model:(id)a4 evaluationDelegate:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v21 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1D943B5B0]();
        v18 = [v16 eventIdentifier];
        v19 = [a1 _nextFireDateForEvent:v16 model:v9];
        if (v19) {
          [v10 setObject:v19 forKeyedSubscript:v18];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  return v10;
}

+ (id)evaluateEvents:(id)a3 withModel:(id)a4 evaluationDelegate:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(a1, "_eventDidCrossScheduledThreshold:withModel:evaluationDelegate:", v17, v9, v10, (void)v19)&& objc_msgSend(v17, "shouldFireWithTypicalDayModel:evaluationDelegate:", v9, v10))
        {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (id)_nextFireDateForEvent:(id)a3 model:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 nextFireDateWithModel:v6];
  [v6 projectedDayDuration];
  double v9 = v8;
  if (v7)
  {
    [v7 timeIntervalSinceReferenceDate];
    double v11 = v10;
    id v12 = [v6 startOfToday];
    [v12 timeIntervalSinceReferenceDate];
    if (v11 < v13)
    {

      goto LABEL_5;
    }
    [v7 timeIntervalSinceReferenceDate];
    double v15 = v14;
    v16 = [v6 endOfToday];
    [v16 timeIntervalSinceReferenceDate];
    double v18 = v17;

    if (v15 > v18)
    {
LABEL_5:
      _HKInitializeLogging();
      long long v19 = (void *)*MEMORY[0x1E4F29F08];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_ERROR))
      {
        long long v20 = v19;
        long long v21 = (objc_class *)objc_opt_class();
        long long v22 = NSStringFromClass(v21);
        long long v23 = [v6 startOfToday];
        uint64_t v24 = [v6 endOfToday];
        int v30 = 138544130;
        uint64_t v31 = (uint64_t)v22;
        __int16 v32 = 2112;
        uint64_t v33 = (uint64_t)v7;
        __int16 v34 = 2112;
        v35 = v23;
        __int16 v36 = 2112;
        v37 = v24;
        _os_log_error_impl(&dword_1D3B3E000, v20, OS_LOG_TYPE_ERROR, "Coaching progress reason %{public}@ returned a fire date outside the bounds of the current day. %@ was outside of [%@, %@]", (uint8_t *)&v30, 0x2Au);

LABEL_10:
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  [v5 minimumDayDuration];
  if (v9 < v25)
  {
    _HKInitializeLogging();
    v26 = (void *)*MEMORY[0x1E4F29F08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = v26;
      [v5 minimumDayDuration];
      int v30 = 134218240;
      uint64_t v31 = (uint64_t)v9;
      __int16 v32 = 2048;
      uint64_t v33 = (uint64_t)v27;
      _os_log_impl(&dword_1D3B3E000, v20, OS_LOG_TYPE_DEFAULT, "Duration in day too short for event (duration in day: %ld, minimum: %ld)", (uint8_t *)&v30, 0x16u);
      goto LABEL_10;
    }
LABEL_11:
    id v28 = 0;
    goto LABEL_13;
  }
  id v28 = v7;
LABEL_13:

  return v28;
}

+ (BOOL)_eventDidCrossScheduledThreshold:(id)a3 withModel:(id)a4 evaluationDelegate:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  double v11 = [v8 eventIdentifier];
  id v12 = [v9 lastFiredDateForProgressEventIdentifier:v11];
  double v13 = [a1 _nextFireDateForEvent:v8 model:v10];
  double v14 = [v9 currentDate];
  double v15 = [v9 currentCalendar];

  [v10 projectedDayDuration];
  double v17 = v16;

  [v14 timeIntervalSinceDate:v13];
  double v19 = v18;
  [v14 timeIntervalSinceReferenceDate];
  double v21 = v20;
  [v13 timeIntervalSinceReferenceDate];
  double v23 = v22;
  if (v12) {
    int v24 = [v15 isDate:v12 inSameDayAsDate:v14];
  }
  else {
    int v24 = 0;
  }
  _HKInitializeLogging();
  double v25 = (os_log_t *)MEMORY[0x1E4F29F08];
  v26 = (void *)*MEMORY[0x1E4F29F08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F08], OS_LOG_TYPE_INFO))
  {
    double v27 = v26;
    id v28 = [v8 eventIdentifier];
    *(_DWORD *)buf = 138544642;
    v40 = v28;
    __int16 v41 = 2112;
    *(void *)v42 = v12;
    *(_WORD *)&v42[8] = 2112;
    v43 = v13;
    __int16 v44 = 2112;
    v45 = v14;
    __int16 v46 = 2048;
    double v47 = v17;
    __int16 v48 = 2048;
    double v49 = v19;
    _os_log_impl(&dword_1D3B3E000, v27, OS_LOG_TYPE_INFO, "Evaluating if event %{public}@ crossed the scheduled threshold - lastFired: %@, scheduledFireDate: %@, now: %@, durationOfToday: %lf, intervalBetweenScheduledDateAndNow: %lf", buf, 0x3Eu);
  }
  double v29 = v17 * 0.25;
  _HKInitializeLogging();
  os_log_t v30 = *v25;
  if (os_log_type_enabled(*v25, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = v30;
    __int16 v32 = [v8 eventIdentifier];
    *(_DWORD *)buf = 138544130;
    v40 = v32;
    __int16 v41 = 1024;
    *(_DWORD *)v42 = v21 >= v23;
    double v25 = (os_log_t *)MEMORY[0x1E4F29F08];
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v24;
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = v19 >= v29;
    _os_log_impl(&dword_1D3B3E000, v31, OS_LOG_TYPE_INFO, "Evaluating if event %{public}@ crossed the scheduled threshold - scheduledDateInPast: %{BOOL}d, lastFiredDateWasToday: %{BOOL}d, scheduledDateIsTooLongAgoFromNow: %{BOOL}d", buf, 0x1Eu);
  }
  if (v21 < v23 || v13 == 0) {
    BOOL v34 = 0;
  }
  else {
    BOOL v34 = (v19 < v29) & ~v24;
  }
  _HKInitializeLogging();
  os_log_t v35 = *v25;
  if (os_log_type_enabled(*v25, OS_LOG_TYPE_INFO))
  {
    __int16 v36 = v35;
    v37 = [v8 eventIdentifier];
    *(_DWORD *)buf = 138543618;
    v40 = v37;
    __int16 v41 = 1024;
    *(_DWORD *)v42 = v34;
    _os_log_impl(&dword_1D3B3E000, v36, OS_LOG_TYPE_INFO, "Event %{public}@ crossed the scheduled threshold result: %{BOOL}d", buf, 0x12u);
  }
  return v34;
}

@end