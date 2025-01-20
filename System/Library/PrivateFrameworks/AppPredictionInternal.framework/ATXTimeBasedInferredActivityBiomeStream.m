@interface ATXTimeBasedInferredActivityBiomeStream
- (id)sessionPublisherFromStartTime:(double)a3;
- (id)transitionPublisherFromStartTime:(double)a3;
- (void)_addBedtimeTransitionsForDate:(id)a3 calendar:(id)a4 toArray:(id)a5;
- (void)_addHomeTransitionsForDate:(id)a3 calendar:(id)a4 toArray:(id)a5;
- (void)_addTransitionForDate:(id)a3 transitionHour:(int64_t)a4 transitionMinute:(int64_t)a5 calendar:(id)a6 isEntry:(BOOL)a7 activity:(unint64_t)a8 toArray:(id)a9;
- (void)_addWorkTransitionsForDate:(id)a3 calendar:(id)a4 toArray:(id)a5;
@end

@implementation ATXTimeBasedInferredActivityBiomeStream

- (id)sessionPublisherFromStartTime:(double)a3
{
  v3 = [(ATXTimeBasedInferredActivityBiomeStream *)self transitionPublisherFromStartTime:a3];
  v4 = +[_ATXUnifiedActivityStreamConversions sessionPublisherFromTransitionPublisher:v3];

  return v4;
}

- (id)transitionPublisherFromStartTime:(double)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a3 == 0.0)
  {
    v22 = __atxlog_handle_modes();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[ATXTimeBasedInferredActivityBiomeStream transitionPublisherFromStartTime:](v22);
    }

    v21 = [MEMORY[0x1E4F1CBF0] bpsPublisher];
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v6 = objc_opt_new();
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a3];
    uint64_t v8 = [v5 startOfDayForDate:v7];

    v9 = [MEMORY[0x1E4F1C9C8] now];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v10 setHour:0];
    [v10 setMinute:0];
    [v10 setSecond:1];
    v11 = objc_opt_new();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __76__ATXTimeBasedInferredActivityBiomeStream_transitionPublisherFromStartTime___block_invoke;
    v30[3] = &unk_1E68B4628;
    id v12 = v5;
    id v31 = v12;
    id v24 = v9;
    id v32 = v24;
    id v13 = v11;
    id v33 = v13;
    v25 = (void *)v8;
    [v12 enumerateDatesStartingAfterDate:v8 matchingComponents:v10 options:2 usingBlock:v30];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * v18);
          v20 = (void *)MEMORY[0x1D25F6CC0](v15);
          -[ATXTimeBasedInferredActivityBiomeStream _addBedtimeTransitionsForDate:calendar:toArray:](self, "_addBedtimeTransitionsForDate:calendar:toArray:", v19, v12, v6, v24);
          [(ATXTimeBasedInferredActivityBiomeStream *)self _addWorkTransitionsForDate:v19 calendar:v12 toArray:v6];
          [(ATXTimeBasedInferredActivityBiomeStream *)self _addHomeTransitionsForDate:v19 calendar:v12 toArray:v6];
          ++v18;
        }
        while (v16 != v18);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
        uint64_t v16 = v15;
      }
      while (v15);
    }

    v21 = [v6 bpsPublisher];
  }
  return v21;
}

void __76__ATXTimeBasedInferredActivityBiomeStream_transitionPublisherFromStartTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "compareDate:toDate:toUnitGranularity:") == 1)
  {
    *a4 = 1;
  }
  else
  {
    v6 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    [*(id *)(a1 + 48) addObject:v7];
  }
  v6 = v7;
LABEL_6:
}

- (void)_addTransitionForDate:(id)a3 transitionHour:(int64_t)a4 transitionMinute:(int64_t)a5 calendar:(id)a6 isEntry:(BOOL)a7 activity:(unint64_t)a8 toArray:(id)a9
{
  BOOL v10 = a7;
  id v15 = a9;
  id v18 = [a6 dateBySettingHour:a4 minute:a5 second:0 ofDate:a3 options:0];
  uint64_t v16 = [ATXUnifiedInferredActivityTransition alloc];
  [v18 timeIntervalSinceReferenceDate];
  id v17 = -[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:](v16, "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", v10, @"timeBasedInferredActivity", a8);
  [v15 addObject:v17];
}

- (void)_addBedtimeTransitionsForDate:(id)a3 calendar:(id)a4 toArray:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(ATXTimeBasedInferredActivityBiomeStream *)self _addTransitionForDate:v10 transitionHour:0 transitionMinute:1 calendar:v9 isEntry:1 activity:5 toArray:v8];
  [(ATXTimeBasedInferredActivityBiomeStream *)self _addTransitionForDate:v10 transitionHour:6 transitionMinute:30 calendar:v9 isEntry:0 activity:5 toArray:v8];
}

- (void)_addWorkTransitionsForDate:(id)a3 calendar:(id)a4 toArray:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v8 isDateInWeekend:v10] & 1) == 0)
  {
    [(ATXTimeBasedInferredActivityBiomeStream *)self _addTransitionForDate:v10 transitionHour:9 transitionMinute:0 calendar:v8 isEntry:1 activity:2 toArray:v9];
    [(ATXTimeBasedInferredActivityBiomeStream *)self _addTransitionForDate:v10 transitionHour:17 transitionMinute:0 calendar:v8 isEntry:0 activity:2 toArray:v9];
  }
}

- (void)_addHomeTransitionsForDate:(id)a3 calendar:(id)a4 toArray:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (objc_msgSend(v9, "isDateInWeekend:")) {
    [(ATXTimeBasedInferredActivityBiomeStream *)self _addTransitionForDate:v10 transitionHour:9 transitionMinute:0 calendar:v9 isEntry:1 activity:1 toArray:v8];
  }
  else {
    [(ATXTimeBasedInferredActivityBiomeStream *)self _addTransitionForDate:v10 transitionHour:17 transitionMinute:30 calendar:v9 isEntry:1 activity:1 toArray:v8];
  }
  [(ATXTimeBasedInferredActivityBiomeStream *)self _addTransitionForDate:v10 transitionHour:22 transitionMinute:0 calendar:v9 isEntry:0 activity:1 toArray:v8];
}

- (void)transitionPublisherFromStartTime:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "A non-zero start time should be passed in", v1, 2u);
}

@end