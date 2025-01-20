@interface ATXAnchorModelPredictionForwarder
- (ATXAnchorModelPredictionForwarder)init;
- (ATXAnchorModelPredictionForwarder)initWithAnchorModelDataStoreWrapper:(id)a3 anchorModelHyperParameters:(id)a4;
- (ATXProactiveSuggestionClientModel)anchorModelClientModel;
- (id)actionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:(id)a3;
- (id)appAnchorModelPredictionTuplesForBlendingLayerFromPredictions:(id)a3;
- (id)clientModelId;
- (id)clientModelSpec;
- (id)linkActionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:(id)a3;
- (id)modeAnchorModelSuggestionsFromPredictions:(id)a3;
- (void)forwardModePredictions:(id)a3;
- (void)forwardNonModePredictions:(id)a3;
- (void)forwardPredictionTuplesToBlendingLayer:(id)a3 feedbackMetadata:(id)a4;
- (void)forwardPredictions:(id)a3;
- (void)setAnchorModelClientModel:(id)a3;
@end

@implementation ATXAnchorModelPredictionForwarder

- (ATXAnchorModelPredictionForwarder)init
{
  v3 = objc_opt_new();
  v4 = +[ATXAnchorModelHyperParameters sharedInstance];
  v5 = [(ATXAnchorModelPredictionForwarder *)self initWithAnchorModelDataStoreWrapper:v3 anchorModelHyperParameters:v4];

  return v5;
}

- (ATXAnchorModelPredictionForwarder)initWithAnchorModelDataStoreWrapper:(id)a3 anchorModelHyperParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXAnchorModelPredictionForwarder;
  v9 = [(ATXAnchorModelPredictionForwarder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeWrapper, a3);
    objc_storeStrong((id *)&v10->_hyperParameters, a4);
  }

  return v10;
}

- (void)forwardPredictions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Forwarding the following predictions:", buf, 2u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_super v12 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v11;
          _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v8);
  }

  [(ATXAnchorModelPredictionForwarder *)self forwardNonModePredictions:v6];
  [(ATXAnchorModelPredictionForwarder *)self forwardModePredictions:v6];
}

- (void)forwardNonModePredictions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ATXAnchorModelPredictionForwarder *)self actionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:v4];
  id v6 = [(ATXAnchorModelPredictionForwarder *)self appAnchorModelPredictionTuplesForBlendingLayerFromPredictions:v4];
  uint64_t v7 = [(ATXAnchorModelPredictionForwarder *)self linkActionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:v4];

  uint64_t v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134217984;
    uint64_t v17 = [v5 count];
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Forwarding %lu actions", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v6 count];
    int v16 = 134217984;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Forwarding %lu apps", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v11 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v7 count];
    int v16 = 134217984;
    uint64_t v17 = v12;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Forwarding %lu Link actions", (uint8_t *)&v16, 0xCu);
  }

  long long v13 = [v5 arrayByAddingObjectsFromArray:v6];
  long long v14 = [v13 arrayByAddingObjectsFromArray:v7];

  long long v15 = [[ATXAnchorModelFeedbackMetadata alloc] initWithAnchorSuggestionTuples:v14];
  [(ATXAnchorModelPredictionForwarder *)self forwardPredictionTuplesToBlendingLayer:v14 feedbackMetadata:v15];
}

- (void)forwardModePredictions:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [(ATXAnchorModelPredictionForwarder *)self modeAnchorModelSuggestionsFromPredictions:a3];
  if ([v4 count])
  {
    v5 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t v10 = [v4 count];
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Forwarding %lu mode suggestions", (uint8_t *)&v9, 0xCu);
    }

    modeSuggestionClient = self->_modeSuggestionClient;
    if (!modeSuggestionClient)
    {
      uint64_t v7 = +[ATXModeAnchorModelSuggestionClient sharedInstance];
      uint64_t v8 = self->_modeSuggestionClient;
      self->_modeSuggestionClient = v7;

      modeSuggestionClient = self->_modeSuggestionClient;
    }
    [(ATXModeAnchorModelSuggestionClient *)modeSuggestionClient anchorModelDidProvideModeSuggestions:v4];
  }
}

- (void)forwardPredictionTuplesToBlendingLayer:(id)a3 feedbackMetadata:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_66);
  anchorModelClientModel = self->_anchorModelClientModel;
  if (!anchorModelClientModel)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F93940]);
    uint64_t v10 = [(ATXAnchorModelPredictionForwarder *)self clientModelId];
    uint64_t v11 = +[ATXClientModelSuggestionReceiver sharedInstance];
    uint64_t v12 = [v11 blendingLayerServer];
    long long v13 = (ATXProactiveSuggestionClientModel *)[v9 initWithClientModelId:v10 blendingLayerServer:v12];
    long long v14 = self->_anchorModelClientModel;
    self->_anchorModelClientModel = v13;

    anchorModelClientModel = self->_anchorModelClientModel;
  }
  long long v15 = +[ATXAnchorModelFeedbackMetadata archivedDataForAnchorFeedbackMetadata:v6];
  [(ATXProactiveSuggestionClientModel *)anchorModelClientModel updateSuggestions:v7 feedbackMetadata:v15];

  int v16 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    uint64_t v18 = [v7 count];
    _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "Done forwarding %lu predictions to the blending layer.", (uint8_t *)&v17, 0xCu);
  }
}

uint64_t __93__ATXAnchorModelPredictionForwarder_forwardPredictionTuplesToBlendingLayer_feedbackMetadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 second];
}

- (id)clientModelId
{
  return (id)[MEMORY[0x1E4F93940] clientModelIdFromClientModelType:1];
}

- (id)clientModelSpec
{
  v3 = [(ATXAnchorModelPredictionForwarder *)self clientModelId];
  id v4 = [(ATXAnchorModelHyperParameters *)self->_hyperParameters abGroup];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v3 clientModelVersion:v4 engagementResetPolicy:1];

  return v5;
}

- (id)actionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:(id)a3
{
  id v4 = +[ATXAnchorModelActionPredictionPostProcessor anchorPredictionScoredActionTuplesFromPredictions:a3];
  v5 = [(ATXAnchorModelHyperParameters *)self->_hyperParameters anchorsDisabledForHomescreen];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__ATXAnchorModelPredictionForwarder_actionAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke;
  v9[3] = &unk_1E68AEFA8;
  v9[4] = self;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v9);

  return v7;
}

id __102__ATXAnchorModelPredictionForwarder_actionAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 24);
  id v4 = a2;
  [v3 mediumBlendingConfidenceScoreThreshold];
  double v6 = v5;
  [*(id *)(*(void *)(a1 + 32) + 24) highBlendingConfidenceScoreThreshold];
  double v8 = v7;
  id v9 = [v4 first];
  id v10 = [v4 second];

  uint64_t v11 = [v9 anchorType];
  uint64_t v12 = +[ATXAnchor anchorTypeStringToClassName:v11];

  uint64_t v13 = [*(id *)(a1 + 40) containsObject:v12] ^ 1;
  unint64_t v14 = +[ATXProactiveSuggestionBuilder predictionReasonsForAnchorModelPrediction:v9];
  long long v15 = [*(id *)(a1 + 32) clientModelSpec];
  int v16 = +[ATXProactiveSuggestionBuilder proactiveSuggestionsForAnchorModelFromScoredActionWithReason:v10 clientModelSpec:v15 mediumThreshold:v13 highThreshold:v14 allowedOnHomescreen:v6 predictionReasons:v8];

  if (v16) {
    int v17 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v9 second:v16];
  }
  else {
    int v17 = 0;
  }

  return v17;
}

- (id)linkActionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:(id)a3
{
  hyperParameters = self->_hyperParameters;
  id v5 = a3;
  double v6 = [(ATXAnchorModelHyperParameters *)hyperParameters anchorsDisabledForHomescreen];
  double v7 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__ATXAnchorModelPredictionForwarder_linkActionAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke;
  v12[3] = &unk_1E68AEFD0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v12);

  return v10;
}

id __106__ATXAnchorModelPredictionForwarder_linkActionAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  [*((id *)a1[4] + 3) mediumBlendingConfidenceScoreThreshold];
  double v5 = v4;
  [*((id *)a1[4] + 3) highBlendingConfidenceScoreThreshold];
  double v7 = v6;
  id v8 = [v3 candidateType];
  int v9 = [v8 isEqualToString:@"linkaction"];

  if (v9)
  {
    id v10 = (void *)*((void *)a1[4] + 1);
    uint64_t v11 = [v3 candidateId];
    uint64_t v12 = [v3 dateIntervalForPrediction];
    id v13 = [v12 startDate];
    id v14 = [v10 linkActionBiomeEventFromCandidateId:v11 date:v13];

    if (v14)
    {
      long long v15 = [v3 anchorType];
      uint64_t v16 = +[ATXAnchor anchorTypeStringToClassName:v15];

      v33 = (void *)v16;
      uint64_t v17 = [a1[5] containsObject:v16] ^ 1;
      uint64_t v18 = +[ATXProactiveSuggestionBuilder predictionReasonForAnchorModelPrediction:v3];
      id v19 = objc_alloc(MEMORY[0x1E4F4B128]);
      uint64_t v20 = [v14 eventBody];
      v21 = [v20 bundleIdentifier];
      v22 = [v14 eventBody];
      v23 = [v22 action];
      v24 = (void *)[v19 initWithBundleId:v21 action:v23];

      [v3 score];
      double v26 = v25;
      v27 = [a1[4] clientModelSpec];
      v28 = +[ATXProactiveSuggestionBuilder proactiveSuggestionForLinkActionPrediction:v24 score:v27 clientModelSpec:v18 mediumThreshold:v17 highThreshold:v26 predictionReason:v5 allowedOnHomescreen:v7];

      if (v28)
      {
        v29 = [a1[6] updatedLinkActionSuggestion:v28];
        if (v29) {
          v30 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v3 second:v29];
        }
        else {
          v30 = 0;
        }
        v31 = v33;
      }
      else
      {
        v30 = 0;
        v31 = v33;
      }
    }
    else
    {
      v30 = 0;
    }
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)appAnchorModelPredictionTuplesForBlendingLayerFromPredictions:(id)a3
{
  double v4 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_29_0);
  double v5 = [(ATXAnchorModelHyperParameters *)self->_hyperParameters anchorsDisabledForHomescreen];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__ATXAnchorModelPredictionForwarder_appAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke_2;
  v9[3] = &unk_1E68AF018;
  v9[4] = self;
  id v10 = v5;
  id v6 = v5;
  double v7 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v9);

  return v7;
}

uint64_t __99__ATXAnchorModelPredictionForwarder_appAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ATXAnchorModelAppPredictionPostProcessor alloc] initWithAnchorModelPrediction:v2];

  uint64_t v4 = [(ATXAnchorModelAppPredictionPostProcessor *)v3 shouldPredictAnchorModelAppPrediction];
  return v4;
}

id __99__ATXAnchorModelPredictionForwarder_appAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 24) mediumBlendingConfidenceScoreThreshold];
  double v5 = v4;
  [*(id *)(*(void *)(a1 + 32) + 24) highBlendingConfidenceScoreThreshold];
  double v7 = v6;
  id v8 = [v3 anchorType];
  int v9 = +[ATXAnchor anchorTypeStringToClassName:v8];

  uint64_t v10 = [*(id *)(a1 + 40) containsObject:v9] ^ 1;
  uint64_t v11 = [*(id *)(a1 + 32) clientModelSpec];
  uint64_t v12 = +[ATXProactiveSuggestionBuilder proactiveSuggestionForAppWithAnchorModelPrediction:v3 clientModelSpec:v11 mediumThreshold:v10 highThreshold:v5 allowedOnHomescreen:v7];

  if (v12) {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v3 second:v12];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (id)modeAnchorModelSuggestionsFromPredictions:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v28 = (id)objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    double v7 = &off_1E68A8000;
    do
    {
      uint64_t v8 = 0;
      uint64_t v29 = v5;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
        uint64_t v10 = (void *)[objc_alloc((Class)v7[147]) initWithAnchorModelPrediction:v9];
        if ([v10 shouldPredictAnchorModelModePrediction])
        {
          uint64_t v11 = [v9 candidateId];
          uint64_t v12 = +[ATXAnchorModelDataStoreWrapper modeDetailsFromModeCandidateId:v11];

          id v13 = objc_alloc(MEMORY[0x1E4F93600]);
          id v14 = [v12 modeUUID];
          uint64_t v15 = [v12 isStart];
          uint64_t v16 = [v9 anchorType];
          [v9 score];
          double v18 = v17;
          uint64_t v19 = v6;
          uint64_t v20 = [v9 numUniqueOccurrencesAfterAnchor];
          [v9 posteriorProbability];
          double v22 = v21;
          [v9 classConditionalProbability];
          double v24 = v23;
          double v25 = [v10 serializedTriggers];
          double v26 = (void *)[v13 initWithModeUUID:v14 isStart:v15 anchorType:v16 score:v20 numUniqueOccurrencesAfterAnchor:v25 posteriorProbability:v18 classConditionalProbability:v22 serializedTriggers:v24];

          [v28 addObject:v26];
          uint64_t v6 = v19;
          double v7 = &off_1E68A8000;

          uint64_t v5 = v29;
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v5);
  }

  return v28;
}

- (ATXProactiveSuggestionClientModel)anchorModelClientModel
{
  return self->_anchorModelClientModel;
}

- (void)setAnchorModelClientModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeSuggestionClient, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_anchorModelClientModel, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
}

@end