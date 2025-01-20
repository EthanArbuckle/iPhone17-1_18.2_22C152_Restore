@interface ATXInferredModesAccumulator
- (ATXInferredModesAccumulator)init;
- (id)usageInsightsInferredATXModeEvents;
- (void)recordInferredModeEndEvent:(id)a3;
- (void)recordInferredModeStartEvent:(id)a3;
- (void)usageInsightsInferredATXModeEvents;
@end

@implementation ATXInferredModesAccumulator

- (ATXInferredModesAccumulator)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXInferredModesAccumulator;
  v2 = [(ATXInferredModesAccumulator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    inferredModeStartingEvents = v2->_inferredModeStartingEvents;
    v2->_inferredModeStartingEvents = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    usageInsightsInferredModeEvents = v2->_usageInsightsInferredModeEvents;
    v2->_usageInsightsInferredModeEvents = (NSMutableArray *)v5;
  }
  return v2;
}

- (id)usageInsightsInferredATXModeEvents
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  v4 = BiomeLibrary();
  uint64_t v5 = [v4 UserFocus];
  v6 = [v5 InferredMode];
  v7 = objc_msgSend(v6, "atx_publisherFromStartDate:", v3);

  uint64_t v14 = 0;
  v15[0] = &v14;
  v15[1] = 0x3032000000;
  v15[2] = __Block_byref_object_copy__85;
  v15[3] = __Block_byref_object_dispose__85;
  id v16 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__ATXInferredModesAccumulator_usageInsightsInferredATXModeEvents__block_invoke;
  v13[3] = &unk_1E68AC060;
  v13[4] = &v14;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__ATXInferredModesAccumulator_usageInsightsInferredATXModeEvents__block_invoke_2;
  v12[3] = &unk_1E68ABB70;
  v12[4] = self;
  id v8 = (id)[v7 sinkWithCompletion:v13 receiveInput:v12];
  if (*(void *)(v15[0] + 40))
  {
    v9 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(ATXInferredModesAccumulator *)(uint64_t)v15 usageInsightsInferredATXModeEvents];
    }
  }
  v10 = self->_usageInsightsInferredModeEvents;
  _Block_object_dispose(&v14, 8);

  return v10;
}

uint64_t __65__ATXInferredModesAccumulator_usageInsightsInferredATXModeEvents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

void __65__ATXInferredModesAccumulator_usageInsightsInferredATXModeEvents__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  if ([v3 isStart])
  {
    [*(id *)(a1 + 32) recordInferredModeStartEvent:v3];
  }
  else if (([v3 isStart] & 1) == 0)
  {
    [*(id *)(a1 + 32) recordInferredModeEndEvent:v3];
  }
}

- (void)recordInferredModeStartEvent:(id)a3
{
}

- (void)recordInferredModeEndEvent:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[(NSMutableArray *)self->_inferredModeStartingEvents copy];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = allModesForTraining();
  uint64_t v8 = [v6 setWithArray:v7];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v5;
  v10 = (void *)v8;
  id v11 = v9;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    uint64_t v34 = *(void *)v37;
    do
    {
      uint64_t v15 = 0;
      uint64_t v35 = v13;
      do
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v36 + 1) + 8 * v15);
        int v17 = objc_msgSend(v4, "modeType", v34);
        if (v17 == [v16 modeType])
        {
          v18 = [v16 absoluteTimestamp];
          [v18 timeIntervalSinceReferenceDate];
          double v20 = v19;
          v21 = [v4 absoluteTimestamp];
          [v21 timeIntervalSinceReferenceDate];
          double v23 = v22;

          if (v20 < v23)
          {
            [v4 modeType];
            BMUserFocusInferredModeTypeToActivity();
            uint64_t v24 = ATXModeFromActivityType();
            v25 = [NSNumber numberWithUnsignedInteger:v24];
            int v26 = [v10 containsObject:v25];

            if (v26)
            {
              id v27 = objc_alloc(MEMORY[0x1E4F4B3A0]);
              v28 = [v16 absoluteTimestamp];
              [v4 absoluteTimestamp];
              id v29 = v11;
              v30 = v10;
              v32 = v31 = self;
              v33 = (void *)[v27 initWithATXMode:v24 startTime:v28 endTime:v32];

              self = v31;
              v10 = v30;
              id v11 = v29;
              uint64_t v14 = v34;

              [(NSMutableArray *)self->_usageInsightsInferredModeEvents addObject:v33];
            }
            [(NSMutableArray *)self->_inferredModeStartingEvents removeObject:v16];
            uint64_t v13 = v35;
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageInsightsInferredModeEvents, 0);
  objc_storeStrong((id *)&self->_inferredModeStartingEvents, 0);
}

- (void)usageInsightsInferredATXModeEvents
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  id v4 = "-[ATXInferredModesAccumulator usageInsightsInferredATXModeEvents]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: Error with reading inferred mode stream: %@", (uint8_t *)&v3, 0x16u);
}

@end