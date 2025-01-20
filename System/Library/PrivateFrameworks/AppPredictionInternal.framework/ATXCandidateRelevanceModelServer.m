@interface ATXCandidateRelevanceModelServer
+ (id)currentContextForConfig:(id)a3 contextOverride:(id)a4;
+ (id)mergeHeuristicSuggestions:(id)a3 withSuggestions:(id)a4;
+ (id)suggestionExecutableIdsFromSuggestions:(id)a3;
- (ATXCandidateRelevanceModelServer)initWithConfig:(id)a3;
- (id)sortedProactiveSuggestionsForContext:(id)a3;
- (void)sendSuggestionsToBlending;
- (void)sendSuggestionsToBlendingForContext:(id)a3;
@end

@implementation ATXCandidateRelevanceModelServer

- (ATXCandidateRelevanceModelServer)initWithConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCandidateRelevanceModelServer;
  v6 = [(ATXCandidateRelevanceModelServer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v7;
}

- (void)sendSuggestionsToBlending
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(ATXCandidateRelevanceModelConfig *)self->_config isEnabled]
    && (+[ATXCandidateRelevanceModelGlobals sharedInstance](ATXCandidateRelevanceModelGlobals, "sharedInstance"), v3 = objc_claimAutoreleasedReturnValue(), char v4 = [v3 isPipelineEnabled], v3, (v4 & 1) != 0))
  {
    id v5 = [(ATXCandidateRelevanceModelConfig *)self->_config datastore];
    v6 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
    v7 = [v6 clientModelId];
    v8 = [v5 mostRecentVerifiedTrainDateForClientModelName:v7];

    objc_super v9 = [MEMORY[0x1E4F1C9C8] now];
    v10 = v9;
    if (v8 && ([v9 timeIntervalSinceDate:v8], v11 <= 604800.0))
    {
      v23 = [(id)objc_opt_class() currentContextForConfig:self->_config contextOverride:MEMORY[0x1E4F1CC08]];
      [(ATXCandidateRelevanceModelServer *)self sendSuggestionsToBlendingForContext:v23];
    }
    else
    {
      v12 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
        v16 = [v15 clientModelId];
        int v24 = 138412546;
        v25 = v14;
        __int16 v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "%@ - There doesn't exist a trained model in the last week to use for config with client model %@. Sending empty suggestions to blending.", (uint8_t *)&v24, 0x16u);
      }
      v17 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
      [v17 updateSuggestions:MEMORY[0x1E4F1CBF0]];
    }
  }
  else
  {
    v18 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      v21 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
      v22 = [v21 clientModelId];
      int v24 = 138412546;
      v25 = v20;
      __int16 v26 = 2112;
      v27 = v22;
      _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "%@ - Config for client model %@ is not enabled or the pipeline is not enabled. Sending empty suggestions to blending.", (uint8_t *)&v24, 0x16u);
    }
    v8 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
    [v8 updateSuggestions:MEMORY[0x1E4F1CBF0]];
  }
}

+ (id)currentContextForConfig:(id)a3 contextOverride:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[ATXPredictionContextBuilder sharedInstance];
  v8 = [v6 candidatePublisherFromStartTime:-259200.0];

  objc_super v9 = [v7 predictionContextForCurrentContextAndCandidatePublisher:v8 contextOverride:v5];

  return v9;
}

- (void)sendSuggestionsToBlendingForContext:(id)a3
{
  char v4 = [(ATXCandidateRelevanceModelServer *)self sortedProactiveSuggestionsForContext:a3];
  id v5 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ATXCandidateRelevanceModelServer_sendSuggestionsToBlendingForContext___block_invoke;
  v7[3] = &unk_1E68AB8E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 updateSuggestions:v6 completionHandler:v7];
}

void __72__ATXCandidateRelevanceModelServer_sendSuggestionsToBlendingForContext___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = __atxlog_handle_relevance_model();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      objc_super v9 = NSStringFromClass(v8);
      uint64_t v10 = [*(id *)(a1 + 40) count];
      double v11 = [*(id *)(*(void *)(a1 + 32) + 8) clientModel];
      v12 = [v11 clientModelId];
      int v13 = 138412802;
      v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%@ - Successfully sent %lu predictions to blending layer for client model: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __72__ATXCandidateRelevanceModelServer_sendSuggestionsToBlendingForContext___block_invoke_cold_1();
  }
}

- (id)sortedProactiveSuggestionsForContext:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ATXCandidateRelevanceModelConfig *)self->_config clientModel];
  id v6 = [v5 clientModelId];

  v7 = __atxlog_handle_relevance_model();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "%@ - Beginning model serving for config with client model: %@.", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v57 = __Block_byref_object_copy__1;
  v58 = __Block_byref_object_dispose__1;
  id v59 = (id)objc_opt_new();
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__1;
  v50 = __Block_byref_object_dispose__1;
  id v51 = (id)objc_opt_new();
  uint64_t v10 = [(ATXCandidateRelevanceModelConfig *)self->_config datastore];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke;
  v42[3] = &unk_1E68AB910;
  v42[4] = self;
  v44 = buf;
  id v11 = v4;
  id v43 = v11;
  v45 = &v46;
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke_23;
  v37 = &unk_1E68AB938;
  v38 = self;
  id v12 = v6;
  id v39 = v12;
  v40 = buf;
  v41 = &v46;
  [v10 receiveMostRecentVerifiedTrainedModelTrainingResults:v42 clientModelName:v12 completion:&v34];

  int v13 = objc_opt_new();
  v14 = objc_opt_new();
  unint64_t v15 = 0;
  *(void *)&long long v16 = 138412546;
  long long v33 = v16;
  while (objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "count", v33, v34, v35, v36, v37, v38) > v15)
  {
    __int16 v17 = [*(id *)(*(void *)&buf[8] + 40) objectAtIndexedSubscript:v15];
    v18 = [(id)v47[5] objectAtIndexedSubscript:v15];
    [v18 floatValue];
    int v20 = v19;

    LODWORD(v21) = v20;
    v22 = [(ATXCandidateRelevanceModelConfig *)self->_config proactiveSuggestionForCandidate:v17 prediction:v21];
    v23 = v22;
    if (v22)
    {
      int v24 = [v22 executableSpecification];
      v25 = [v24 executableIdentifier];
      [v14 addObject:v25];

      [v13 addObject:v23];
    }
    else
    {
      __int16 v26 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (objc_class *)objc_opt_class();
        uint64_t v28 = NSStringFromClass(v27);
        *(_DWORD *)v52 = v33;
        v53 = v28;
        __int16 v54 = 2112;
        v55 = v17;
        _os_log_error_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_ERROR, "%@ - Could not create suggestion for candidate: %@.", v52, 0x16u);
      }
    }

    ++v15;
  }
  v29 = [(ATXCandidateRelevanceModelConfig *)self->_config heuristicSuggestionsForContext:v11 currentSuggestionExecutableIds:v14];
  v30 = [(id)objc_opt_class() mergeHeuristicSuggestions:v29 withSuggestions:v13];
  v31 = [v30 sortedArrayUsingComparator:&__block_literal_global_5];

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(buf, 8);

  return v31;
}

void __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 candidate];
  if ([*(id *)(a1[4] + 8) candidateIsStillValidToSuggest:v4])
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v4];
    id v5 = [v3 model];
    uint64_t v6 = a1[5];
    v7 = [v3 featurizationManager];
    [v5 predictForContext:v6 candidate:v4 featurizationManager:v7];
    float v9 = v8;

    uint64_t v10 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v13 = [v3 modelUUID];
      v14 = [v13 UUIDString];
      double v15 = [v4 identifier];
      int v30 = 138413058;
      v31 = v12;
      __int16 v32 = 2112;
      long long v33 = v14;
      __int16 v34 = 2112;
      double v35 = v15;
      __int16 v36 = 2048;
      double v37 = v9;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "%@ - Model %@ scored candidate with identifier %@ and score %f.", (uint8_t *)&v30, 0x2Au);
    }
    if ([MEMORY[0x1E4F93B08] isInternalBuild])
    {
      __int16 v17 = [v3 model];
      uint64_t v18 = a1[5];
      int v19 = [v3 featurizationManager];
      double v20 = [v17 featureContributionsDuringInferenceDescriptionForContext:v18 candidate:v4 featurizationManager:v19];

      double v21 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        int v24 = [v4 identifier];
        int v30 = 138413058;
        v31 = v23;
        __int16 v32 = 2112;
        long long v33 = v24;
        __int16 v34 = 2048;
        double v35 = v9;
        __int16 v36 = 2112;
        double v37 = v20;
        _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "%@ - Features contributing to scored candidate with identifier %@ and score %f:\n%@\n", (uint8_t *)&v30, 0x2Au);
      }
    }
    v25 = *(void **)(*(void *)(a1[7] + 8) + 40);
    *(float *)&double v16 = v9;
    __int16 v26 = [NSNumber numberWithFloat:v16];
    [v25 addObject:v26];
  }
  else
  {
    __int16 v26 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (objc_class *)objc_opt_class();
      uint64_t v28 = NSStringFromClass(v27);
      v29 = [v4 identifier];
      int v30 = 138412546;
      v31 = v28;
      __int16 v32 = 2112;
      long long v33 = v29;
      _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "%@ - Skipping candidate because it should not be predicted: %@", (uint8_t *)&v30, 0x16u);
    }
  }
}

void __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke_23(void *a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = __atxlog_handle_relevance_model();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      uint64_t v8 = a1[5];
      int v14 = 138412546;
      double v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "%@ - Successfully generated predictions for client model: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke_23_cold_1((uint64_t)a1, v5);
    }

    uint64_t v9 = objc_opt_new();
    uint64_t v10 = *(void *)(a1[6] + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = objc_opt_new();
    uint64_t v13 = *(void *)(a1[7] + 8);
    id v5 = *(NSObject **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

uint64_t __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  uint64_t v6 = [a3 scoreSpecification];
  [v6 rawScore];
  v7 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v8 = NSNumber;
  uint64_t v9 = [v5 scoreSpecification];

  [v9 rawScore];
  uint64_t v10 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

+ (id)mergeHeuristicSuggestions:(id)a3 withSuggestions:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = (id)[v5 mutableCopy];
    id v20 = v5;
    uint64_t v8 = [(id)objc_opt_class() suggestionExecutableIdsFromSuggestions:v5];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v19 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          double v15 = objc_msgSend(v14, "executableSpecification", v19);
          __int16 v16 = [v15 executableIdentifier];
          char v17 = [v8 containsObject:v16];

          if ((v17 & 1) == 0) {
            [v7 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v6 = v19;
    id v5 = v20;
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

+ (id)suggestionExecutableIdsFromSuggestions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "executableSpecification", (void)v13);
        uint64_t v11 = [v10 executableIdentifier];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
}

void __72__ATXCandidateRelevanceModelServer_sendSuggestionsToBlendingForContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v3 = v2;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [*(id *)(*(void *)(v3 + 32) + 8) clientModel];
  uint64_t v7 = [v6 clientModelId];
  int v8 = 138412802;
  id v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = v1;
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "%@ - Failed to send predictions to blending layer for client model: %@. Error: %@", (uint8_t *)&v8, 0x20u);
}

void __73__ATXCandidateRelevanceModelServer_sortedProactiveSuggestionsForContext___block_invoke_23_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = 138412546;
  int v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%@ - Could not complete generating predictions for client model: %@", (uint8_t *)&v7, 0x16u);
}

@end