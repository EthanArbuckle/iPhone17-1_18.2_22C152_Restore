@interface ATXMagicalMomentsAppPredictorFeedback
- (ATXMagicalMomentsAppPredictorFeedback)init;
- (ATXMagicalMomentsAppPredictorFeedback)initWithTracker:(id)a3;
- (id)clientModelIds;
- (id)getCurrentABGroup;
- (int64_t)_anchorTypeFromBundleIdToAnchorTypeMap:(id)a3 bundleId:(id)a4;
- (void)_handleEngagedProactiveSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 bundleIdToAnchorType:(id)a5;
- (void)_handleShownProactiveSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 bundleIdToAnchorType:(id)a5;
- (void)logEngagedMMMetricsEntryForBundle:(id)a3 consumerSubType:(unsigned __int8)a4 anchorType:(int64_t)a5 abGroup:(id)a6 score:(double)a7;
- (void)logShownMMMetricsEntryForBundle:(id)a3 consumerSubType:(unsigned __int8)a4 anchorType:(int64_t)a5 abGroup:(id)a6 score:(double)a7;
- (void)receiveUIFeedbackResult:(id)a3;
@end

@implementation ATXMagicalMomentsAppPredictorFeedback

- (ATXMagicalMomentsAppPredictorFeedback)init
{
  v3 = objc_opt_new();
  v4 = [(ATXMagicalMomentsAppPredictorFeedback *)self initWithTracker:v3];

  return v4;
}

- (ATXMagicalMomentsAppPredictorFeedback)initWithTracker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXMagicalMomentsAppPredictorFeedback;
  v6 = [(ATXMagicalMomentsAppPredictorFeedback *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tracker, a3);
  }

  return v7;
}

- (id)clientModelIds
{
  v2 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:24];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v2, 0);

  return v3;
}

- (void)receiveUIFeedbackResult:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ATXMagicalMomentsAppPredictorFeedback receiveUIFeedbackResult:]();
  }

  v6 = [v4 shownSuggestions];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [v4 consumerSubType];
    if (v8)
    {
      uint64_t v9 = v8;
      v10 = (void *)MEMORY[0x1D25F6CC0]();
      id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      v14 = objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
      v15 = (void *)MEMORY[0x1D25F6CC0]();
      v16 = (void *)MEMORY[0x1E4F28DC0];
      v17 = [v4 clientCacheUpdate];
      v18 = [v17 feedbackMetadata];
      id v39 = 0;
      v19 = [v16 unarchivedObjectOfClasses:v14 fromData:v18 error:&v39];
      v20 = v39;

      if (!v19 || v20)
      {
        v26 = __atxlog_handle_feedback();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[ATXMagicalMomentsAppPredictorFeedback receiveUIFeedbackResult:]();
        }
      }
      else
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        v21 = [v4 shownSuggestions];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v36 != v24) {
                objc_enumerationMutation(v21);
              }
              [(ATXMagicalMomentsAppPredictorFeedback *)self _handleShownProactiveSuggestion:*(void *)(*((void *)&v35 + 1) + 8 * i) consumerSubType:v9 bundleIdToAnchorType:v19];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v41 count:16];
          }
          while (v23);
        }

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v26 = [v4 engagedSuggestions];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v32 != v29) {
                objc_enumerationMutation(v26);
              }
              [(ATXMagicalMomentsAppPredictorFeedback *)self _handleEngagedProactiveSuggestion:*(void *)(*((void *)&v31 + 1) + 8 * j) consumerSubType:v9 bundleIdToAnchorType:v19];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v40 count:16];
          }
          while (v28);
        }
      }
    }
    else
    {
      v20 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[ATXMagicalMomentsAppPredictorFeedback receiveUIFeedbackResult:]((uint64_t)self, v20);
      }
    }
  }
}

- (void)_handleShownProactiveSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 bundleIdToAnchorType:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 bundleIdExecutableObject];
  if (v10)
  {
    int64_t v11 = [(ATXMagicalMomentsAppPredictorFeedback *)self _anchorTypeFromBundleIdToAnchorTypeMap:v9 bundleId:v10];
    if ((unint64_t)(v11 - 23) > 0xFFFFFFFFFFFFFFE9)
    {
      int64_t v15 = v11;
      v16 = [(ATXMagicalMomentsAppPredictorFeedback *)self getCurrentABGroup];
      v17 = [v8 scoreSpecification];
      [v17 rawScore];
      -[ATXMagicalMomentsAppPredictorFeedback logShownMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:](self, "logShownMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:", v10, v6, v15, v16);

      goto LABEL_9;
    }
    uint64_t v12 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      int v18 = 138412802;
      v19 = v14;
      __int16 v20 = 2112;
      v21 = v10;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_error_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_ERROR, "%@ - could not find anchor type for bundleId: %@ in map: %@", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    uint64_t v12 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXMagicalMomentsAppPredictorFeedback _handleShownProactiveSuggestion:consumerSubType:bundleIdToAnchorType:]();
    }
  }

LABEL_9:
}

- (void)_handleEngagedProactiveSuggestion:(id)a3 consumerSubType:(unsigned __int8)a4 bundleIdToAnchorType:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 bundleIdExecutableObject];
  if (!v10)
  {
    int64_t v15 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXMagicalMomentsAppPredictorFeedback _handleShownProactiveSuggestion:consumerSubType:bundleIdToAnchorType:]();
    }
    goto LABEL_8;
  }
  int64_t v11 = [(ATXMagicalMomentsAppPredictorFeedback *)self _anchorTypeFromBundleIdToAnchorTypeMap:v9 bundleId:v10];
  if (!v11)
  {
    int64_t v15 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      int v18 = 138412802;
      v19 = v17;
      __int16 v20 = 2112;
      v21 = v10;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_error_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_ERROR, "%@ - could not find anchor type for bundleId: %@ in map: %@", (uint8_t *)&v18, 0x20u);
    }
LABEL_8:

    goto LABEL_9;
  }
  int64_t v12 = v11;
  uint64_t v13 = [(ATXMagicalMomentsAppPredictorFeedback *)self getCurrentABGroup];
  v14 = [v8 scoreSpecification];
  [v14 rawScore];
  -[ATXMagicalMomentsAppPredictorFeedback logEngagedMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:](self, "logEngagedMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:", v10, v6, v12, v13);

LABEL_9:
}

- (void)logShownMMMetricsEntryForBundle:(id)a3 consumerSubType:(unsigned __int8)a4 anchorType:(int64_t)a5 abGroup:(id)a6 score:(double)a7
{
  uint64_t v9 = a4;
  id v12 = a6;
  id v13 = a3;
  v14 = objc_opt_new();
  [v14 setBundleId:v13];

  objc_msgSend(v14, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a5));
  [v14 setAbGroup:v12];

  int64_t v15 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v9];
  [v14 setConsumerSubType:v15];

  [(ATXPETEventTracker2Protocol *)self->_tracker trackDistributionForMessage:v14 value:a7];
  v16 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[ATXMagicalMomentsAppPredictorFeedback logShownMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:]();
  }
}

- (void)logEngagedMMMetricsEntryForBundle:(id)a3 consumerSubType:(unsigned __int8)a4 anchorType:(int64_t)a5 abGroup:(id)a6 score:(double)a7
{
  uint64_t v9 = a4;
  id v12 = a6;
  id v13 = a3;
  v14 = objc_opt_new();
  objc_msgSend(v14, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a5));
  [v14 setBundleId:v13];

  [v14 setAbGroup:v12];
  int64_t v15 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v9];
  [v14 setConsumerSubType:v15];

  [(ATXPETEventTracker2Protocol *)self->_tracker trackDistributionForMessage:v14 value:a7];
  v16 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[ATXMagicalMomentsAppPredictorFeedback logEngagedMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:]();
  }
}

- (id)getCurrentABGroup
{
  v2 = +[_ATXAppPredictor sharedInstance];
  v3 = [v2 abGroupIdentifiers];
  id v4 = [v3 objectAtIndexedSubscript:16];

  return v4;
}

- (int64_t)_anchorTypeFromBundleIdToAnchorTypeMap:(id)a3 bundleId:(id)a4
{
  id v4 = [a3 objectForKey:a4];
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 integerValue];
    if (v6 <= 0x16) {
      int64_t v7 = v6;
    }
    else {
      int64_t v7 = 0;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)receiveUIFeedbackResult:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  unint64_t v6 = v4;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%@ - receiveUIFeedbackResult received an invalid unknown consumer", (uint8_t *)&v5, 0xCu);
}

- (void)receiveUIFeedbackResult:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - could not unarchive feedback metadata, error: %@", v4, v5, v6, v7, v8);
}

- (void)receiveUIFeedbackResult:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "%@ - receiveUIFeedbackResult got result: %@", v3, 0x16u);
}

- (void)_handleShownProactiveSuggestion:consumerSubType:bundleIdToAnchorType:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "%@ - could not unarchive bundleId from proactive suggestion: %@", v4, v5, v6, v7, v8);
}

- (void)logShownMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  uint64_t v3 = [v0 bundleId];
  [v0 anchor];
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_4_9(&dword_1D0FA3000, v4, v5, "LOGGED: %@ - ATXMagicalMomentsPBMMShownTracker with bundleId: %@ and anchorType: %d", v6, v7, v8, v9, v10);
}

- (void)logEngagedMMMetricsEntryForBundle:consumerSubType:anchorType:abGroup:score:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  uint64_t v3 = [v0 bundleId];
  [v0 anchor];
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_4_9(&dword_1D0FA3000, v4, v5, "LOGGED: %@ - ATXMagicalMomentsPBMMEngagedTracker with bundleId: %@ and anchorType: %d", v6, v7, v8, v9, v10);
}

@end