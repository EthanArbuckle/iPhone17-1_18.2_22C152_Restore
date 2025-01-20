@interface ATXLinkActionPreprocessor
- (id)preprocessedSuggestionsUpdatingLinkActions:(id)a3;
- (id)updatedLinkActionSuggestion:(id)a3;
- (id)updatedLinkActionSuggestion:(id)a3 actionContainer:(id)a4 basedOnReversedPublisher:(id)a5;
@end

@implementation ATXLinkActionPreprocessor

- (id)preprocessedSuggestionsUpdatingLinkActions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "executableSpecification", (void)v16);
        uint64_t v13 = [v12 executableType];

        if (v13 == 10)
        {
          v14 = [(ATXLinkActionPreprocessor *)self updatedLinkActionSuggestion:v11];
          if (v14) {
            [v5 addObject:v14];
          }
        }
        else
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)updatedLinkActionSuggestion:(id)a3
{
  id v4 = a3;
  v5 = [v4 executableSpecification];
  id v6 = [v5 executableObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [v4 executableSpecification];
    uint64_t v9 = [v8 executableObject];

    v10 = [v9 bundleId];
    id v16 = 0;
    v11 = +[ATXLinkTranscriptUtil linkTranscriptPublisherForBundleId:v10 fromDate:0 toDate:0 maxEvents:0 reversed:1 error:&v16];
    id v12 = v16;

    if (v12)
    {
      uint64_t v13 = __atxlog_handle_blending();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXLinkActionPreprocessor updatedLinkActionSuggestion:](v9, v13);
      }

      v14 = 0;
    }
    else
    {
      v14 = [(ATXLinkActionPreprocessor *)self updatedLinkActionSuggestion:v4 actionContainer:v9 basedOnReversedPublisher:v11];
    }
  }
  else
  {
    uint64_t v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXLinkActionPreprocessor updatedLinkActionSuggestion:](v4);
    }
    v14 = 0;
  }

  return v14;
}

- (id)updatedLinkActionSuggestion:(id)a3 actionContainer:(id)a4 basedOnReversedPublisher:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__107;
  v56 = __Block_byref_object_dispose__107;
  id v57 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__107;
  v50 = __Block_byref_object_dispose__107;
  id v51 = 0;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke;
  v44[3] = &unk_1E68ABA68;
  id v45 = v7;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke_10;
  v39[3] = &unk_1E68B6498;
  v42 = &v46;
  id v10 = v8;
  id v40 = v10;
  id v11 = v45;
  id v41 = v11;
  v43 = &v52;
  id v12 = (id)[v9 drivableSinkWithBookmark:0 completion:v44 shouldContinue:v39];
  if (v53[5])
  {
    uint64_t v13 = [v11 executableSpecification];
    id v14 = objc_alloc(MEMORY[0x1E4F93950]);
    uint64_t v15 = v47[5];
    id v16 = [v13 executableDescription];
    long long v17 = [v13 executableIdentifier];
    v36 = objc_msgSend(v14, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v15, v16, v17, -[NSObject executableType](v13, "executableType"));
    id v33 = v10;
    id v34 = v9;

    long long v18 = [v11 uiSpecification];
    id v35 = objc_alloc(MEMORY[0x1E4F93978]);
    v38 = [(id)v53[5] title];
    v37 = objc_msgSend(v38, "atx_efficientLocalizedString");
    long long v19 = [(id)v53[5] subtitle];
    v20 = objc_msgSend(v19, "atx_efficientLocalizedString");
    uint64_t v21 = [v18 reason];
    v22 = [v18 preferredLayoutConfigs];
    uint64_t v23 = [v18 allowedOnLockscreen];
    uint64_t v24 = [v18 allowedOnHomeScreen];
    LOBYTE(v15) = [v18 allowedOnSpotlight];
    BYTE1(v32) = [v18 shouldClearOnEngagement];
    LOBYTE(v32) = v15;
    v25 = (void *)[v35 initWithTitle:v37 subtitle:v20 predictionReason:v21 preferredLayoutConfigs:v22 allowedOnLockscreen:v23 allowedOnHomeScreen:v24 allowedOnSpotlight:v32 shouldClearOnEngagement:objc_msgSend(v18 predictionReasons:"predictionReasons")];

    id v26 = objc_alloc(MEMORY[0x1E4F93938]);
    v27 = [v11 clientModelSpecification];
    v28 = [v11 scoreSpecification];
    v29 = (void *)[v26 initWithClientModelSpecification:v27 executableSpecification:v36 uiSpecification:v25 scoreSpecification:v28];

    id v10 = v33;
    id v9 = v34;
    v30 = v13;
  }
  else
  {
    v30 = __atxlog_handle_blending();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[ATXLinkActionPreprocessor updatedLinkActionSuggestion:actionContainer:basedOnReversedPublisher:]((uint64_t)v11, v30);
    }
    v29 = 0;
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  return v29;
}

void __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    id v4 = __atxlog_handle_blending();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke_cold_1(v2);
    }
  }
}

BOOL __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [a2 eventBody];
  id v4 = objc_alloc(MEMORY[0x1E4F4B128]);
  v5 = [v3 bundleIdentifier];
  id v6 = [v3 action];
  uint64_t v7 = [v4 initWithBundleId:v5 action:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if ([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)])
  {
    id v10 = [v3 predictions];
    uint64_t v11 = [v10 count];
    BOOL v12 = v11 == 0;
    if (v11)
    {
      uint64_t v13 = [v10 objectAtIndexedSubscript:0];
      uint64_t v14 = [v13 displayRepresentation];
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;

      long long v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) image];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setImage:v17];
    }
    else
    {
      long long v17 = __atxlog_handle_blending();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        int v20 = 138412290;
        uint64_t v21 = v18;
        _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "Blending: Skipping matching Link action event that's not predictable in transcript of %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)updatedLinkActionSuggestion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 bundleId];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Blending: Error setting up stream for Link transcript of %@", (uint8_t *)&v4, 0xCu);
}

- (void)updatedLinkActionSuggestion:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 executableSpecification];
  uint64_t v8 = [v1 executableClassString];
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "Blending: Link action suggestion does not have executable type ATXLinkActionContainer: %@, has type: %@", v4, v5, v6, v7, 2u);
}

- (void)updatedLinkActionSuggestion:(uint64_t)a1 actionContainer:(NSObject *)a2 basedOnReversedPublisher:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Blending: Unable to find predictable Link suggestion in transcript: %@", (uint8_t *)&v2, 0xCu);
}

void __98__ATXLinkActionPreprocessor_updatedLinkActionSuggestion_actionContainer_basedOnReversedPublisher___block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v2, v3, "Blending: Error creating sink for Link transcript %@ for %@", v4, v5, v6, v7, 2u);
}

@end