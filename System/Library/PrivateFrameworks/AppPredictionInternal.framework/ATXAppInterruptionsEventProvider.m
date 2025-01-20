@interface ATXAppInterruptionsEventProvider
- (ATXAppInterruptionsEventProvider)initWithModeEventProvider:(id)a3;
- (ATXModeEvent)mostRecentModeEvent;
- (BOOL)appLaunchEventOccurredWhileInMode:(id)a3 modeTransitionEvent:(id)a4;
- (BOOL)notificationEventOccurredWhileInMode:(id)a3 modeTransitionEvent:(id)a4;
- (BOOL)successfullyCalculatedAppSessionInterruptions;
- (double)globalPopularityOfInterruptingEntity:(id)a3;
- (double)modeAppInterruptionsClassConditionalProbabilityByEntity:(id)a3;
- (double)modePopularityOfInterruptingEntity:(id)a3;
- (double)ratioOfModePopularityToGlobalPopularityOfInterruptingEntity:(id)a3;
- (id)dateIntervalFromAppLaunchEvent:(id)a3;
- (id)dateIntervalFromNotificationEvent:(id)a3;
- (unint64_t)globalAppInterruptionsCountByEntity:(id)a3;
- (unint64_t)modeAppInterruptionsCountByEntity:(id)a3;
- (void)successfullyCalculatedAppSessionInterruptions;
- (void)trackAppSessionInterruption:(id)a3;
- (void)trackNewModeEvent:(id)a3;
@end

@implementation ATXAppInterruptionsEventProvider

- (ATXAppInterruptionsEventProvider)initWithModeEventProvider:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXAppInterruptionsEventProvider;
  v6 = [(ATXAppInterruptionsEventProvider *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modeEventProvider, a3);
    uint64_t v8 = objc_opt_new();
    globalInterruptedAppSessionsAccumulator = v7->_globalInterruptedAppSessionsAccumulator;
    v7->_globalInterruptedAppSessionsAccumulator = (ATXInterruptedAppSessionAccumulator *)v8;

    uint64_t v10 = objc_opt_new();
    modeInterruptedAppSessionsAccumulator = v7->_modeInterruptedAppSessionsAccumulator;
    v7->_modeInterruptedAppSessionsAccumulator = (ATXInterruptedAppSessionAccumulator *)v10;
  }
  return v7;
}

- (BOOL)successfullyCalculatedAppSessionInterruptions
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  v4 = objc_opt_new();
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = [v4 appLaunchesSinceDate:v6];

  uint64_t v8 = objc_opt_new();
  v9 = objc_opt_new();
  [v3 timeIntervalSinceReferenceDate];
  uint64_t v10 = objc_msgSend(v9, "publisherFromStartTime:");
  v11 = [v8 stripStoreEvent:v10];

  v12 = [(ATXModeEntityEventProviderProtocol *)self->_modeEventProvider biomePublisherWithBookmark:0];
  v31[0] = v11;
  v31[1] = v7;
  objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke;
  v30[3] = &unk_1E68AC7A0;
  v30[4] = self;
  v14 = [v12 orderedMergeWithOthers:v13 comparator:v30];

  uint64_t v27 = 0;
  v28[0] = &v27;
  v28[1] = 0x3032000000;
  v28[2] = __Block_byref_object_copy__94;
  v28[3] = __Block_byref_object_dispose__94;
  id v29 = 0;
  v25[4] = self;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_16;
  v26[3] = &unk_1E68AC060;
  v26[4] = &v27;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_2;
  v25[3] = &unk_1E68B4650;
  id v15 = (id)[v14 sinkWithCompletion:v26 receiveInput:v25];
  uint64_t v16 = *(void *)(v28[0] + 40);
  if (v16)
  {
    v17 = __atxlog_handle_modes();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      [(ATXAppInterruptionsEventProvider *)(uint64_t)v28 successfullyCalculatedAppSessionInterruptions];
    }
  }
  _Block_object_dispose(&v27, 8);

  return v16 == 0;
}

uint64_t __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(*(void *)(a1 + 32) + 8) dateIntervalFromEvent:v5];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) dateIntervalFromNotificationEvent:v5];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [*(id *)(a1 + 32) dateIntervalFromAppLaunchEvent:v5];
    }
    id v9 = v12;
  }
  objc_super v13 = [*(id *)(*(void *)(a1 + 32) + 8) dateIntervalFromEvent:v6];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 32) dateIntervalFromNotificationEvent:v6];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [*(id *)(a1 + 32) dateIntervalFromAppLaunchEvent:v6];
    }
    id v15 = v18;
  }
  if (v9)
  {
    if (v15) {
      goto LABEL_22;
    }
    goto LABEL_19;
  }
  uint64_t v19 = __atxlog_handle_modes();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_cold_1((uint64_t)v5, v19, v20, v21, v22, v23, v24, v25);
  }

  if (!v15)
  {
LABEL_19:
    v26 = __atxlog_handle_modes();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_cold_1((uint64_t)v6, v26, v27, v28, v29, v30, v31, v32);
    }
  }
LABEL_22:
  v33 = [v9 startDate];
  [v33 timeIntervalSinceReferenceDate];
  double v35 = v34;

  v36 = [v15 startDate];
  [v36 timeIntervalSinceReferenceDate];
  double v38 = v37;

  v39 = [NSNumber numberWithDouble:v35];
  v40 = [NSNumber numberWithDouble:v38];
  uint64_t v41 = [v39 compare:v40];

  return v41;
}

uint64_t __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) aggregationEventsFromEvent:v3];
  if ([v4 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(a1 + 32), "trackNewModeEvent:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      [*(id *)(a1 + 32) trackAppSessionInterruption:v3];
    }
  }
}

- (id)dateIntervalFromNotificationEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v5 = v3;
    id v6 = [v4 alloc];
    [v5 timestamp];
    uint64_t v7 = objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:");
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v5 timestamp];
    double v10 = v9;

    long long v11 = (void *)[v8 initWithTimeIntervalSinceReferenceDate:v10];
    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v11];
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

- (id)dateIntervalFromAppLaunchEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (objc_class *)MEMORY[0x1E4F28C18];
    id v5 = v3;
    id v6 = [v4 alloc];
    uint64_t v7 = [v5 startDate];
    id v8 = [v5 startDate];

    double v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (void)trackNewModeEvent:(id)a3
{
}

- (void)trackAppSessionInterruption:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ATXInterruptedAppSessionAccumulator *)self->_globalInterruptedAppSessionsAccumulator handleNotificationEvent:v8];
    if ([(ATXAppInterruptionsEventProvider *)self notificationEventOccurredWhileInMode:v8 modeTransitionEvent:self->_mostRecentModeEvent])
    {
      [(ATXInterruptedAppSessionAccumulator *)self->_modeInterruptedAppSessionsAccumulator handleNotificationEvent:v8];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      globalInterruptedAppSessionsAccumulator = self->_globalInterruptedAppSessionsAccumulator;
      id v5 = objc_opt_new();
      [(ATXInterruptedAppSessionAccumulator *)globalInterruptedAppSessionsAccumulator handleNextAppLaunch:v8 dimensionSet:v5];

      if ([(ATXAppInterruptionsEventProvider *)self appLaunchEventOccurredWhileInMode:v8 modeTransitionEvent:self->_mostRecentModeEvent])
      {
        modeInterruptedAppSessionsAccumulator = self->_modeInterruptedAppSessionsAccumulator;
        uint64_t v7 = objc_opt_new();
        [(ATXInterruptedAppSessionAccumulator *)modeInterruptedAppSessionsAccumulator handleNextAppLaunch:v8 dimensionSet:v7];
      }
    }
  }
}

- (BOOL)notificationEventOccurredWhileInMode:(id)a3 modeTransitionEvent:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v7 = a3;
  id v8 = [v6 alloc];
  [v7 timestamp];
  double v10 = v9;

  long long v11 = (void *)[v8 initWithTimeIntervalSinceReferenceDate:v10];
  [v11 timeIntervalSince1970];
  double v13 = v12;
  v14 = [v5 startDate];
  [v14 timeIntervalSince1970];
  if (v13 <= v15)
  {
    BOOL v20 = 0;
  }
  else
  {
    [v11 timeIntervalSince1970];
    double v17 = v16;
    id v18 = [v5 endDate];
    [v18 timeIntervalSince1970];
    BOOL v20 = v17 < v19;
  }
  return v20;
}

- (BOOL)appLaunchEventOccurredWhileInMode:(id)a3 modeTransitionEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 startDate];
  [v7 timeIntervalSince1970];
  double v9 = v8;
  double v10 = [v6 startDate];
  [v10 timeIntervalSince1970];
  if (v9 <= v11)
  {
    BOOL v17 = 0;
  }
  else
  {
    double v12 = [v5 startDate];
    [v12 timeIntervalSince1970];
    double v14 = v13;
    double v15 = [v6 endDate];
    [v15 timeIntervalSince1970];
    BOOL v17 = v14 < v16;
  }
  return v17;
}

- (unint64_t)globalAppInterruptionsCountByEntity:(id)a3
{
  globalInterruptedAppSessionsAccumulator = self->_globalInterruptedAppSessionsAccumulator;
  id v4 = a3;
  id v5 = [(ATXInterruptedAppSessionAccumulator *)globalInterruptedAppSessionsAccumulator countedSetContainingInterruptingAppBundleIds];
  unint64_t v6 = [v5 countForObject:v4];

  return v6;
}

- (unint64_t)modeAppInterruptionsCountByEntity:(id)a3
{
  modeInterruptedAppSessionsAccumulator = self->_modeInterruptedAppSessionsAccumulator;
  id v4 = a3;
  id v5 = [(ATXInterruptedAppSessionAccumulator *)modeInterruptedAppSessionsAccumulator countedSetContainingInterruptingAppBundleIds];
  unint64_t v6 = [v5 countForObject:v4];

  return v6;
}

- (double)globalPopularityOfInterruptingEntity:(id)a3
{
  unint64_t v4 = [(ATXAppInterruptionsEventProvider *)self globalAppInterruptionsCountByEntity:a3];
  unint64_t v5 = [(ATXInterruptedAppSessionAccumulator *)self->_globalInterruptedAppSessionsAccumulator numberOfInterruptingAppSessions];
  double result = 0.0;
  if (v4)
  {
    if (v5) {
      return (double)v4 / (double)v5;
    }
  }
  return result;
}

- (double)modePopularityOfInterruptingEntity:(id)a3
{
  unint64_t v4 = [(ATXAppInterruptionsEventProvider *)self modeAppInterruptionsCountByEntity:a3];
  unint64_t v5 = [(ATXInterruptedAppSessionAccumulator *)self->_modeInterruptedAppSessionsAccumulator numberOfInterruptingAppSessions];
  double result = 0.0;
  if (v4)
  {
    if (v5) {
      return (double)v4 / (double)v5;
    }
  }
  return result;
}

- (double)modeAppInterruptionsClassConditionalProbabilityByEntity:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ATXAppInterruptionsEventProvider *)self globalAppInterruptionsCountByEntity:v4];
  unint64_t v6 = [(ATXAppInterruptionsEventProvider *)self modeAppInterruptionsCountByEntity:v4];

  double result = 0.0;
  if (v6)
  {
    if (v5) {
      return (double)v6 / (double)v5;
    }
  }
  return result;
}

- (double)ratioOfModePopularityToGlobalPopularityOfInterruptingEntity:(id)a3
{
  id v4 = a3;
  [(ATXAppInterruptionsEventProvider *)self modePopularityOfInterruptingEntity:v4];
  double v6 = v5;
  [(ATXAppInterruptionsEventProvider *)self globalPopularityOfInterruptingEntity:v4];
  double v8 = v7;

  double result = 0.0;
  if (v8 != 0.0 && v6 != 0.0) {
    return v6 / v8;
  }
  return result;
}

- (ATXModeEvent)mostRecentModeEvent
{
  return self->_mostRecentModeEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentModeEvent, 0);
  objc_storeStrong((id *)&self->_modeInterruptedAppSessionsAccumulator, 0);
  objc_storeStrong((id *)&self->_globalInterruptedAppSessionsAccumulator, 0);
  objc_storeStrong((id *)&self->_modeEventProvider, 0);
}

- (void)successfullyCalculatedAppSessionInterruptions
{
}

void __81__ATXAppInterruptionsEventProvider_successfullyCalculatedAppSessionInterruptions__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end