@interface HMDWidgetTimelineRefresherEventsAnalyzer
- (HMDEventCountersManager)eventCountersManager;
- (HMDWidgetTimelineRefresherEventsAnalyzer)initWithEventCountersManager:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5;
- (HMDWidgetTimelineRefresherEventsAnalyzer)initWithEventCountersManager:(id)a3 logEventSubmitter:(id)a4 widgetKinds:(id)a5 dailyScheduler:(id)a6;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSMutableDictionary)widgetRefreshReasonCounterGroupByKind;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)resetAggregationAnalysisContext;
- (void)runDailyTask;
@end

@implementation HMDWidgetTimelineRefresherEventsAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
  objc_storeStrong((id *)&self->_widgetRefreshReasonCounterGroupByKind, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (NSMutableDictionary)widgetRefreshReasonCounterGroupByKind
{
  return self->_widgetRefreshReasonCounterGroupByKind;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void)resetAggregationAnalysisContext
{
  id v2 = [(HMDWidgetTimelineRefresherEventsAnalyzer *)self widgetRefreshReasonCounterGroupByKind];
  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_94227];
}

uint64_t __75__HMDWidgetTimelineRefresherEventsAnalyzer_resetAggregationAnalysisContext__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 resetEventCounters];
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v8 = [(HMDWidgetTimelineRefresherEventsAnalyzer *)self widgetRefreshReasonCounterGroupByKind];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __88__HMDWidgetTimelineRefresherEventsAnalyzer_populateAggregationAnalysisLogEvent_forDate___block_invoke;
  v13 = &unk_1E6A0E628;
  v15 = &v16;
  id v9 = v7;
  id v14 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:&v10];

  objc_msgSend(v6, "setWidgetMaxRefreshCountForKind:", v17[3], v10, v11, v12, v13);
  _Block_object_dispose(&v16, 8);
}

unint64_t __88__HMDWidgetTimelineRefresherEventsAnalyzer_populateAggregationAnalysisLogEvent_forDate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t result = [a3 summedEventCountersForDate:*(void *)(a1 + 32)];
  if (v4 <= result) {
    unint64_t v6 = result;
  }
  else {
    unint64_t v6 = v4;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  return result;
}

- (void)runDailyTask
{
  v3 = [(HMDWidgetTimelineRefresherEventsAnalyzer *)self widgetRefreshReasonCounterGroupByKind];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__HMDWidgetTimelineRefresherEventsAnalyzer_runDailyTask__block_invoke;
  v4[3] = &unk_1E6A0E600;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __56__HMDWidgetTimelineRefresherEventsAnalyzer_runDailyTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  unint64_t v6 = [a3 eventCounters];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__HMDWidgetTimelineRefresherEventsAnalyzer_runDailyTask__block_invoke_2;
  v8[3] = &unk_1E6A0E5D8;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __56__HMDWidgetTimelineRefresherEventsAnalyzer_runDailyTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v12 = [v5 logEventSubmitter];
  v8 = [HMDWidgetTimelineRefresherDailyTotalLogEvent alloc];
  uint64_t v9 = *(void *)(a1 + 40);
  unsigned int v10 = [v6 unsignedIntValue];

  uint64_t v11 = [(HMDWidgetTimelineRefresherDailyTotalLogEvent *)v8 initWithKind:v9 reason:v7 count:v10];
  [v12 submitLogEvent:v11];
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v14 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v14;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    id v6 = [(HMDWidgetTimelineRefresherEventsAnalyzer *)self widgetRefreshReasonCounterGroupByKind];
    id v7 = [v5 kind];
    v8 = [v6 objectForKeyedSubscript:v7];

    if (!v8)
    {
      uint64_t v9 = [(HMDWidgetTimelineRefresherEventsAnalyzer *)self eventCountersManager];
      unsigned int v10 = [v5 kind];
      v8 = [v9 counterGroupForName:v10];

      uint64_t v11 = [(HMDWidgetTimelineRefresherEventsAnalyzer *)self widgetRefreshReasonCounterGroupByKind];
      id v12 = [v5 kind];
      [v11 setObject:v8 forKeyedSubscript:v12];
    }
    v13 = [v5 reason];
    [v8 incrementEventCounterForEventName:v13];
  }
}

- (HMDWidgetTimelineRefresherEventsAnalyzer)initWithEventCountersManager:(id)a3 logEventSubmitter:(id)a4 widgetKinds:(id)a5 dailyScheduler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33.receiver = self;
  v33.super_class = (Class)HMDWidgetTimelineRefresherEventsAnalyzer;
  v15 = [(HMDWidgetTimelineRefresherEventsAnalyzer *)&v33 init];
  uint64_t v16 = v15;
  if (v15)
  {
    id v28 = v12;
    objc_storeStrong((id *)&v15->_logEventSubmitter, a4);
    objc_storeStrong((id *)&v16->_eventCountersManager, a3);
    v17 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v27 = v13;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v24 = objc_msgSend(v11, "counterGroupForName:", v23, v27);
          [(NSMutableDictionary *)v17 setObject:v24 forKeyedSubscript:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v20);
    }

    widgetRefreshReasonCounterGroupByKind = v16->_widgetRefreshReasonCounterGroupByKind;
    v16->_widgetRefreshReasonCounterGroupByKind = v17;

    [v14 registerDailyTaskRunner:v16];
    id v13 = v27;
    id v12 = v28;
  }

  return v16;
}

- (HMDWidgetTimelineRefresherEventsAnalyzer)initWithEventCountersManager:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[HMDWidgetFetchSpecification allHomeLockScreenWidgetKinds];
  v16[0] = @"com.apple.Home.widget.interactive";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v13 = [v11 setByAddingObjectsFromArray:v12];

  id v14 = [(HMDWidgetTimelineRefresherEventsAnalyzer *)self initWithEventCountersManager:v10 logEventSubmitter:v9 widgetKinds:v13 dailyScheduler:v8];
  return v14;
}

@end