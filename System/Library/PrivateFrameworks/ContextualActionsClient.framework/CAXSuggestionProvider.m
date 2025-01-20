@interface CAXSuggestionProvider
- (id)predictWithPredictionContext:(id)a3 candidateActions:(id)a4 maxSuggestions:(unint64_t)a5;
- (id)proactiveSuggestionForCaxContextualAction:(id)a3 clientModelSpec:(id)a4;
- (void)pingWithCompletion:(id)a3;
- (void)recordShortcutsEditorEvent:(id)a3;
- (void)registerModelForRealTimeRequestsWithBlendingLayerServer:(id)a3;
- (void)suggestionsForContextualActionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5;
@end

@implementation CAXSuggestionProvider

- (id)predictWithPredictionContext:(id)a3 candidateActions:(id)a4 maxSuggestions:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v6 = (objc_class *)MEMORY[0x263F61998];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = [v7 sourceAppName];
  v10 = (void *)[v8 initWithOriginatorId:v9 consumerSubType:43 caxPredictionContext:v7 maxSuggestions:a5 timeout:0.5];

  v11 = (void *)[objc_alloc(MEMORY[0x263F619B8]) initWithConsumerSubType:43];
  v12 = [v11 layoutForRequest:v10];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = [v12 allSuggestionsInLayout];
    v14 = objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_1);

    v15 = [[CAXSuggestion alloc] initWithSuggestedActions:v14 modelVersion:0];
    v16 = [v12 uuid];
    [(CAXSuggestion *)v15 setBlendingCacheUpdateUUID:v16];

    v17 = __atxlog_handle_contextual_actions();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(CAXSuggestion *)v15 blendingCacheUpdateUUID];
      v19 = [(CAXSuggestion *)v15 suggestedActions];
      int v23 = 138412546;
      v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_2257D2000, v17, OS_LOG_TYPE_DEFAULT, "Returning CAXSuggestion with UUID %@ and actions: %@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    v20 = __atxlog_handle_contextual_actions();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[CAXSuggestionProvider predictWithPredictionContext:candidateActions:maxSuggestions:]((uint64_t)v12, v20);
    }

    v21 = [CAXSuggestion alloc];
    v15 = [(CAXSuggestion *)v21 initWithSuggestedActions:MEMORY[0x263EFFA68] modelVersion:0];
  }

  return v15;
}

id __86__CAXSuggestionProvider_predictWithPredictionContext_candidateActions_maxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 executableSpecification];
  v4 = [v3 executableObject];

  v5 = [v2 uuid];

  [v4 setSuggestionUUID:v5];
  return v4;
}

- (void)registerModelForRealTimeRequestsWithBlendingLayerServer:(id)a3
{
  v4 = (void *)MEMORY[0x263F619A8];
  id v5 = a3;
  v6 = [v4 clientModelIdFromClientModelType:43];
  [v5 registerRealTimeSuggestionProviderDelegate:self clientModelId:v6];

  id v7 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_2257D2000, v7, OS_LOG_TYPE_DEFAULT, "Registered the client model's delegate with the Blending Layer Server", v8, 2u);
  }
}

- (void)pingWithCompletion:(id)a3
{
}

- (void)suggestionsForContextualActionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  v81[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  v11 = [MEMORY[0x263F619A8] clientModelIdFromClientModelType:43];
  if ([v9 isEqualToString:v11])
  {
    v62 = self;
    uint64_t v12 = [v8 caxPredictionContext];
    v13 = [CAXContextualActionsPredictorDriver alloc];
    v14 = +[CAXContextualActionsPredictor defaultConfigFileUrl];
    v15 = [(CAXContextualActionsPredictorDriver *)v13 initWithConfigUrl:v14];

    v64 = (void *)v12;
    v16 = -[CAXContextualActionsPredictorDriver predictWithConfidenceFromContext:numActions:](v15, "predictWithConfidenceFromContext:numActions:", v12, [v8 maxSuggestions]);
    v17 = __atxlog_handle_contextual_actions();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2257D2000, v17, OS_LOG_TYPE_DEFAULT, "Prediction Driver finished with results.", buf, 2u);
    }

    v65 = [MEMORY[0x263EFF980] array];
    v18 = [MEMORY[0x263EFF9C0] set];
    v63 = v16;
    if (v16 && [v16 count])
    {
      v57 = v15;
      v59 = v10;
      v19 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v16, "count"));
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v20 = v16;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v72 objects:v79 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v73 != v23) {
              objc_enumerationMutation(v20);
            }
            __int16 v25 = [*(id *)(*((void *)&v72 + 1) + 8 * i) encodedActionIdentifier];
            [v19 addObject:v25];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v72 objects:v79 count:16];
        }
        while (v22);
      }
      v58 = v11;
      id v60 = v9;
      id v61 = v8;

      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v26 = v20;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v68 objects:v78 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v69;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v69 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v68 + 1) + 8 * j);
            v32 = [v31 encodedActionIdentifier];
            char v33 = [v18 containsObject:v32];

            if ((v33 & 1) == 0)
            {
              v34 = [v31 priorTotal];
              int v35 = [v34 intValue];

              if (v35 < 501)
              {
                uint64_t v39 = 1;
              }
              else
              {
                v36 = [v31 normalizedFrequency];
                [v36 floatValue];
                double v38 = v37;

                if (v38 <= 0.1) {
                  uint64_t v39 = 2;
                }
                else {
                  uint64_t v39 = 3;
                }
              }
              v40 = [CAXContextualAction alloc];
              v41 = [v31 encodedActionIdentifier];
              v42 = [(CAXContextualAction *)v40 initWithActionIdentifier:v41 confidence:v39 parameters:0];

              [v65 addObject:v42];
              v43 = [v31 encodedActionIdentifier];
              [v18 addObject:v43];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v68 objects:v78 count:16];
        }
        while (v28);
      }

      id v9 = v60;
      id v8 = v61;
      v11 = v58;
      v10 = v59;
      v15 = v57;
    }
    v44 = __atxlog_handle_contextual_actions();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = [v65 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v77 = v45;
      _os_log_impl(&dword_2257D2000, v44, OS_LOG_TYPE_DEFAULT, "Converting %lu suggestions into ProactiveSuggestions.", buf, 0xCu);
    }

    v46 = (void *)[objc_alloc(MEMORY[0x263F619B0]) initWithClientModelId:v9 clientModelVersion:@"1.0"];
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __93__CAXSuggestionProvider_suggestionsForContextualActionSuggestionRequest_clientModelId_reply___block_invoke;
    v66[3] = &unk_264754A70;
    v66[4] = v62;
    id v67 = v46;
    id v47 = v46;
    v48 = objc_msgSend(v65, "_pas_mappedArrayWithTransform:", v66);
    v49 = (void *)[objc_alloc(MEMORY[0x263F619E8]) initWithSuggestions:v48 feedbackMetadata:0 originalRequest:v8 responseCode:2 error:0];
    v10[2](v10, v49);

    v50 = v63;
    v51 = v64;
  }
  else
  {
    v51 = [NSString stringWithFormat:@"Wrong delegate for request. Expected %@ but found %@.", v9, v11];
    v52 = (void *)MEMORY[0x263F087E8];
    v53 = (objc_class *)objc_opt_class();
    v54 = NSStringFromClass(v53);
    uint64_t v80 = *MEMORY[0x263F08320];
    v81[0] = v51;
    v55 = [NSDictionary dictionaryWithObjects:v81 forKeys:&v80 count:1];
    uint64_t v56 = [v52 errorWithDomain:v54 code:5 userInfo:v55];

    v15 = (CAXContextualActionsPredictorDriver *)v56;
    v50 = (void *)[objc_alloc(MEMORY[0x263F619E8]) initWithSuggestions:0 feedbackMetadata:0 originalRequest:v8 responseCode:3 error:v56];
    v10[2](v10, v50);
  }
}

uint64_t __93__CAXSuggestionProvider_suggestionsForContextualActionSuggestionRequest_clientModelId_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) proactiveSuggestionForCaxContextualAction:a2 clientModelSpec:*(void *)(a1 + 40)];
}

- (id)proactiveSuggestionForCaxContextualAction:(id)a3 clientModelSpec:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 confidence] == 3)
  {
    uint64_t v7 = 4;
  }
  else if ([v5 confidence] == 2)
  {
    uint64_t v7 = 3;
  }
  else
  {
    uint64_t v7 = 2;
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x263F619D0]) initWithRawScore:v7 suggestedConfidenceCategory:1.0];
  id v9 = objc_alloc(MEMORY[0x263F619C0]);
  v10 = [v5 jsonRawData];
  v11 = [v10 description];
  uint64_t v12 = [v5 actionIdentifier];
  v13 = (void *)[v9 initWithExecutableObject:v5 executableDescription:v11 executableIdentifier:v12 suggestionExecutableType:7];

  id v14 = objc_alloc(MEMORY[0x263F619D8]);
  v15 = [v5 actionIdentifier];
  v16 = [MEMORY[0x263F619C8] layoutConfigurationsForLayoutOptions:32];
  v17 = (void *)[v14 initWithTitle:v15 subtitle:0 preferredLayoutConfigs:v16 allowedOnLockscreen:0 allowedOnHomeScreen:0 allowedOnSpotlight:0];

  v18 = (void *)[objc_alloc(MEMORY[0x263F619A0]) initWithClientModelSpecification:v6 executableSpecification:v13 uiSpecification:v17 scoreSpecification:v8];
  return v18;
}

- (void)recordShortcutsEditorEvent:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = __atxlog_handle_blending();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_2257D2000, v4, OS_LOG_TYPE_DEFAULT, "Sending shortcuts editor event to Blending: %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = objc_opt_new();
  [v5 donateUIInteractionEvent:v3];

  id v6 = __atxlog_handle_blending();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2257D2000, v6, OS_LOG_TYPE_DEFAULT, "Done sending shortcuts editor event to Blending.", (uint8_t *)&v7, 2u);
  }
}

- (void)predictWithPredictionContext:(uint64_t)a1 candidateActions:(NSObject *)a2 maxSuggestions:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_2257D2000, a2, OS_LOG_TYPE_FAULT, "Returned layout was nil or of unknown type: %@", (uint8_t *)&v2, 0xCu);
}

@end