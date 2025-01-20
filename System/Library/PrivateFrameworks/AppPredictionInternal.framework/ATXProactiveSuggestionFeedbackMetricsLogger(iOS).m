@interface ATXProactiveSuggestionFeedbackMetricsLogger(iOS)
- (id)bookmarkURLPathForConsumerSubType:()iOS;
- (uint64_t)logMetricsForiOSUIFeedbackQueries;
@end

@implementation ATXProactiveSuggestionFeedbackMetricsLogger(iOS)

- (id)bookmarkURLPathForConsumerSubType:()iOS
{
  id v4 = [NSString alloc];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a3];
  v8 = (void *)[v4 initWithFormat:@"%@-%@", v6, v7];

  v9 = [MEMORY[0x1E4F4B650] metricsRootDirectory];
  id v10 = objc_alloc(MEMORY[0x1E4F1CB10]);
  v11 = [v9 stringByAppendingPathComponent:v8];
  v12 = (void *)[v10 initFileURLWithPath:v11];

  return v12;
}

- (uint64_t)logMetricsForiOSUIFeedbackQueries
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t result = [&unk_1F27F3720 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v12;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(&unk_1F27F3720);
        }
        v6 = *(void **)(*((void *)&v11 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1D25F6CC0]();
        LOBYTE(v6) = [v6 unsignedIntValue];
        v8 = [ATXProactiveSuggestioniOSUIFeedbackQuery alloc];
        v9 = [a1 bookmarkURLPathForConsumerSubType:v6];
        id v10 = [(ATXProactiveSuggestioniOSUIFeedbackQuery *)v8 initWithClientModelIds:0 consumerSubTypeToConsider:v6 startDateForResults:0 bookmarkURLPath:v9];

        [a1 logMetricsWithUIFeedbackQuery:v10];
        ++v5;
      }
      while (v3 != v5);
      uint64_t result = [&unk_1F27F3720 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

@end