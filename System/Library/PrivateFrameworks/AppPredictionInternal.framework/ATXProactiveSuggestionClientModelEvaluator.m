@interface ATXProactiveSuggestionClientModelEvaluator
+ (id)eventAndRecentCacheUpdatePublisher:(id)a3;
+ (id)resultFromResults:(id)a3 withSessionType:(unint64_t)a4 executableType:(int64_t)a5 removeDockedApps:(BOOL)a6;
- (ATXProactiveSuggestionClientModelEvaluator)init;
- (ATXProactiveSuggestionClientModelEvaluator)initWithPublishers:(id)a3;
- (ATXProactiveSuggestionClientModelEvaluator)initWithStartTime:(id)a3 endTime:(id)a4;
- (ATXProactiveSuggestionClientModelEvaluatorPublishers)publishers;
- (id)evaluationResultsForClientModelName:(id)a3;
- (id)resultForClientModelName:(id)a3 suggestionExecutableType:(int64_t)a4 sessionType:(unint64_t)a5 removeDockedApps:(BOOL)a6;
- (id)shadowResultForSuggestionExecutableType:(int64_t)a3 clientModelName:(id)a4 removeDockedApps:(BOOL)a5;
- (id)uiPublisherWithDeduplicatedEngagements;
- (id)uiResultForSuggestionExecutableType:(int64_t)a3 clientModelName:(id)a4 removeDockedApps:(BOOL)a5;
@end

@implementation ATXProactiveSuggestionClientModelEvaluator

- (ATXProactiveSuggestionClientModelEvaluator)init
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [v3 dateByAddingTimeInterval:-2592000.0];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;

  v7 = [NSNumber numberWithDouble:v6];
  v8 = NSNumber;
  [v3 timeIntervalSinceReferenceDate];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v10 = [(ATXProactiveSuggestionClientModelEvaluator *)self initWithStartTime:v7 endTime:v9];

  return v10;
}

- (ATXProactiveSuggestionClientModelEvaluator)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[ATXProactiveSuggestionClientModelEvaluatorPublishers alloc] initWithStartTime:v7 endTime:v6];

  v9 = [(ATXProactiveSuggestionClientModelEvaluator *)self initWithPublishers:v8];
  return v9;
}

- (ATXProactiveSuggestionClientModelEvaluator)initWithPublishers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXProactiveSuggestionClientModelEvaluator;
  id v6 = [(ATXProactiveSuggestionClientModelEvaluator *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_publishers, a3);
  }

  return v7;
}

- (id)uiPublisherWithDeduplicatedEngagements
{
  v3 = objc_opt_new();
  v4 = [(ATXProactiveSuggestionClientModelEvaluatorPublishers *)self->_publishers uiPublisher];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__ATXProactiveSuggestionClientModelEvaluator_uiPublisherWithDeduplicatedEngagements__block_invoke;
  v9[3] = &unk_1E68AF140;
  id v10 = v3;
  id v5 = v3;
  id v6 = [v4 filterWithIsIncluded:v9];
  id v7 = [v6 mapWithTransform:&__block_literal_global_189];

  return v7;
}

uint64_t __84__ATXProactiveSuggestionClientModelEvaluator_uiPublisherWithDeduplicatedEngagements__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  v4 = [v3 engagedSuggestions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [v3 sessionStartDate];
    id v7 = [v3 engagedSuggestions];
    v8 = [v7 objectAtIndexedSubscript:0];
    objc_super v9 = [v8 executableIdentifier];

    id v10 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v6 second:v9];
    LODWORD(v8) = [*(id *)(a1 + 32) containsObject:v10];
    [*(id *)(a1 + 32) addObject:v10];

    uint64_t v11 = v8 ^ 1;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id __84__ATXProactiveSuggestionClientModelEvaluator_uiPublisherWithDeduplicatedEngagements__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 eventBody];
  v4 = [v3 engagedSuggestions];
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];

  id v6 = [v2 eventBody];
  objc_msgSend(v5, "setConsumerSubType:", objc_msgSend(v6, "consumerSubType"));

  id v7 = objc_alloc(MEMORY[0x1E4F4B620]);
  v8 = [v2 eventBody];

  objc_super v9 = [v8 sessionStartDate];
  [v9 timeIntervalSinceReferenceDate];
  id v10 = objc_msgSend(v7, "initWithEventBody:timestamp:", v5);

  return v10;
}

- (id)shadowResultForSuggestionExecutableType:(int64_t)a3 clientModelName:(id)a4 removeDockedApps:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  objc_super v9 = [(ATXProactiveSuggestionClientModelEvaluatorPublishers *)self->_publishers clientModelCacheUpdatePublisher];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke;
  v22[3] = &unk_1E68AF140;
  id v23 = v8;
  id v10 = v8;
  uint64_t v11 = [v9 filterWithIsIncluded:v22];

  v12 = [(ATXProactiveSuggestionClientModelEvaluatorPublishers *)self->_publishers shadowCandidatePublisher];
  v13 = [v12 orderedMergeWithOther:v11 comparator:&__block_literal_global_193];

  v14 = [(id)objc_opt_class() eventAndRecentCacheUpdatePublisher:v13];
  v15 = [v14 filterWithIsIncluded:&__block_literal_global_196];

  v16 = [[ATXProactiveSuggestionClientModelEvaluationResult alloc] initWithSessionType:0 executableType:a3 removeDockedApps:v5];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_5;
  v20[3] = &unk_1E68AF948;
  v17 = v16;
  v21 = v17;
  id v18 = (id)[v15 sinkWithCompletion:&__block_literal_global_201 receiveInput:v20];

  return v17;
}

uint64_t __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  v4 = [v3 clientModelId];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 first];
  v4 = [v3 eventBody];
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

  id v6 = [v2 second];

  return isKindOfClass & (v6 != 0);
}

void __119__ATXProactiveSuggestionClientModelEvaluator_shadowResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_5(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 first];
  id v5 = [v4 eventBody];

  id v6 = [v3 second];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:0 suggestedConfidenceCategory:0.0];
  id v8 = objc_alloc(MEMORY[0x1E4F93928]);
  double v9 = [v5 identifier];
  id v10 = objc_msgSend(v8, "initWithExecutableIdentifier:executableType:scoreSpecification:predictionReasons:", v9, objc_msgSend(v5, "suggestionExecutableType"), v7, 0);

  [v10 setConsumerSubType:15];
  uint64_t v11 = *(void **)(a1 + 32);
  v12 = [v6 suggestions];
  v14[0] = v10;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v11 updateCountsForSessionsWithShownSuggestions:v12 engagedSuggestions:v13 rejectedSuggestions:MEMORY[0x1E4F1CBF0]];
}

- (id)uiResultForSuggestionExecutableType:(int64_t)a3 clientModelName:(id)a4 removeDockedApps:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  double v9 = [(ATXProactiveSuggestionClientModelEvaluatorPublishers *)self->_publishers clientModelCacheUpdatePublisher];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke;
  v22[3] = &unk_1E68AF140;
  id v23 = v8;
  id v10 = v8;
  uint64_t v11 = [v9 filterWithIsIncluded:v22];

  v12 = [(ATXProactiveSuggestionClientModelEvaluator *)self uiPublisherWithDeduplicatedEngagements];
  v13 = [v12 orderedMergeWithOther:v11 comparator:&__block_literal_global_207];
  v14 = [(id)objc_opt_class() eventAndRecentCacheUpdatePublisher:v13];
  v15 = [v14 filterWithIsIncluded:&__block_literal_global_209];

  v16 = [[ATXProactiveSuggestionClientModelEvaluationResult alloc] initWithSessionType:1 executableType:a3 removeDockedApps:v5];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_5;
  v20[3] = &unk_1E68AF948;
  v17 = v16;
  v21 = v17;
  id v18 = (id)[v15 sinkWithCompletion:&__block_literal_global_211 receiveInput:v20];

  return v17;
}

uint64_t __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  v4 = [v3 clientModelId];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 first];
  v4 = [v3 eventBody];
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();

  id v6 = [v2 second];

  return isKindOfClass & (v6 != 0);
}

void __115__ATXProactiveSuggestionClientModelEvaluator_uiResultForSuggestionExecutableType_clientModelName_removeDockedApps___block_invoke_5(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 first];
  id v5 = [v4 eventBody];

  id v6 = [v3 second];

  id v7 = *(void **)(a1 + 32);
  double v8 = [v6 suggestions];
  v10[0] = v5;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v7 updateCountsForSessionsWithShownSuggestions:v8 engagedSuggestions:v9 rejectedSuggestions:MEMORY[0x1E4F1CBF0]];
}

- (id)resultForClientModelName:(id)a3 suggestionExecutableType:(int64_t)a4 sessionType:(unint64_t)a5 removeDockedApps:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  if (!a5)
  {
    uint64_t v11 = [(ATXProactiveSuggestionClientModelEvaluator *)self shadowResultForSuggestionExecutableType:a4 clientModelName:v10 removeDockedApps:v6];
    goto LABEL_5;
  }
  if (a5 == 1)
  {
    uint64_t v11 = [(ATXProactiveSuggestionClientModelEvaluator *)self uiResultForSuggestionExecutableType:a4 clientModelName:v10 removeDockedApps:v6];
LABEL_5:
    v12 = (void *)v11;
    goto LABEL_9;
  }
  v13 = __atxlog_handle_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[ATXProactiveSuggestionClientModelEvaluator resultForClientModelName:suggestionExecutableType:sessionType:removeDockedApps:](a4, v13);
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"resultForClientModelName called with invalid suggestionExecutableType value of %lu", a4);
  v12 = 0;
LABEL_9:

  return v12;
}

- (id)evaluationResultsForClientModelName:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v19 = [&unk_1F27F2BE0 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(&unk_1F27F2BE0);
        }
        uint64_t v20 = v6;
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * v6);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v8 = [&unk_1F27F2BF8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(&unk_1F27F2BF8);
              }
              v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              uint64_t v13 = [v7 integerValue];
              uint64_t v14 = [v12 integerValue];
              v15 = [(ATXProactiveSuggestionClientModelEvaluator *)self resultForClientModelName:v4 suggestionExecutableType:v14 sessionType:v13 removeDockedApps:0];
              if ([v15 numberOfSessionsWithPredictions]) {
                [v5 addObject:v15];
              }
              if (v14 == 1)
              {
                v16 = [(ATXProactiveSuggestionClientModelEvaluator *)self resultForClientModelName:v4 suggestionExecutableType:1 sessionType:v13 removeDockedApps:1];

                if ([v16 numberOfSessionsWithPredictions]) {
                  [v5 addObject:v16];
                }
              }
              else
              {
                v16 = v15;
              }
            }
            uint64_t v9 = [&unk_1F27F2BF8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v9);
        }
        uint64_t v6 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [&unk_1F27F2BE0 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }

  return v5;
}

+ (id)eventAndRecentCacheUpdatePublisher:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93BB8];
  id v5 = a3;
  uint64_t v6 = [v4 tupleWithFirst:0 second:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__ATXProactiveSuggestionClientModelEvaluator_eventAndRecentCacheUpdatePublisher___block_invoke;
  v9[3] = &__block_descriptor_40_e70____PASTuple2_24__0___PASTuple2_8__NSObject_ATXBMStoreEventProtocol__16l;
  void v9[4] = a1;
  id v7 = [v5 scanWithInitial:v6 nextPartialResult:v9];

  return v7;
}

id __81__ATXProactiveSuggestionClientModelEvaluator_eventAndRecentCacheUpdatePublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v8 = [v6 eventBody];
  if (v8)
  {
    uint64_t v9 = [v5 second];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v8;

      uint64_t v9 = v10;
    }
    id v11 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v6 second:v9];
  }
  else
  {
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __81__ATXProactiveSuggestionClientModelEvaluator_eventAndRecentCacheUpdatePublisher___block_invoke_cold_1(a1, v12);
    }

    id v11 = v5;
  }

  return v11;
}

+ (id)resultFromResults:(id)a3 withSessionType:(unint64_t)a4 executableType:(int64_t)a5 removeDockedApps:(BOOL)a6
{
  int v6 = a6;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = a3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "sessionType", (void)v17) == a4
          && [v14 executableType] == a5
          && [v14 removeDockedApps] == v6)
        {
          id v15 = v14;
          goto LABEL_13;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_13:

  return v15;
}

- (ATXProactiveSuggestionClientModelEvaluatorPublishers)publishers
{
  return self->_publishers;
}

- (void).cxx_destruct
{
}

- (void)resultForClientModelName:(uint64_t)a1 suggestionExecutableType:(NSObject *)a2 sessionType:removeDockedApps:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "resultForClientModelName called with invalid suggestionExecutableType value of %lu", (uint8_t *)&v2, 0xCu);
}

void __81__ATXProactiveSuggestionClientModelEvaluator_eventAndRecentCacheUpdatePublisher___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  int v6 = v4;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%@ - Event can't be deserialized in eventAndRecentCacheUpdatePublisher", (uint8_t *)&v5, 0xCu);
}

@end