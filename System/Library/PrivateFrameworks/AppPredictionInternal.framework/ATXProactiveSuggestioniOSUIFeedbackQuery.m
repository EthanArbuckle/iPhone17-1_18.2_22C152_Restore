@interface ATXProactiveSuggestioniOSUIFeedbackQuery
- (ATXProactiveSuggestioniOSUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6;
- (id)contextPublisherWithStartTime:(double)a3;
- (id)uiPublisherForConsumerSubType:(unsigned __int8)a3 startTime:(double)a4;
@end

@implementation ATXProactiveSuggestioniOSUIFeedbackQuery

- (ATXProactiveSuggestioniOSUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [v11 timeIntervalSinceReferenceDate];
  double v14 = v13;
  v15 = -[ATXProactiveSuggestioniOSUIFeedbackQuery uiPublisherForConsumerSubType:startTime:](self, "uiPublisherForConsumerSubType:startTime:", v8);
  v16 = objc_opt_new();
  v17 = [v16 publisherFromStartTime:v8 consumerSubType:v14];

  v18 = [(ATXProactiveSuggestioniOSUIFeedbackQuery *)self contextPublisherWithStartTime:v14];
  if (v15)
  {
    v19 = [MEMORY[0x1E4F93550] sharedInstance];
    self = [(ATXProactiveSuggestionUIFeedbackQuery *)self initWithClientModelIds:v10 consumerSubTypeToConsider:v8 startDateForResults:v11 bookmarkURLPath:v12 uiPublisher:v15 blendingModelPublisher:v17 contextPublisher:v18 hyperParameters:v19];

    v20 = self;
  }
  else
  {
    v21 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[ATXProactiveSuggestioniOSUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:]((uint64_t)self, v8, v21);
    }

    v20 = 0;
  }

  return v20;
}

- (id)uiPublisherForConsumerSubType:(unsigned __int8)a3 startTime:(double)a4
{
  v5 = 0;
  if ((int)a3 > 33)
  {
    if (a3 == 43 || a3 == 35)
    {
      uint64_t v6 = a3;
    }
    else
    {
      uint64_t v6 = a3;
      if (a3 != 34) {
        goto LABEL_12;
      }
    }
LABEL_11:
    v7 = objc_opt_new();
    v5 = [v7 genericEventPublisherFromStartTime:v6 consumerSubType:a4];

    goto LABEL_12;
  }
  uint64_t v6 = 9;
  if (a3 == 9) {
    goto LABEL_11;
  }
  if (a3 == 21) {
    goto LABEL_11;
  }
  uint64_t v6 = a3;
  if (a3 == 22) {
    goto LABEL_11;
  }
LABEL_12:
  return v5;
}

- (id)contextPublisherWithStartTime:(double)a3
{
  v4 = objc_opt_new();
  v5 = [v4 publisherFromStartTime:a3];

  return v5;
}

- (void)initWithClientModelIds:(NSObject *)a3 consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:.cold.1(uint64_t a1, unsigned __int8 a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a2];
  int v8 = 138412546;
  v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_fault_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_FAULT, "%@ - could not find iOS ui publisher for consumerSubType: %@", (uint8_t *)&v8, 0x16u);
}

@end