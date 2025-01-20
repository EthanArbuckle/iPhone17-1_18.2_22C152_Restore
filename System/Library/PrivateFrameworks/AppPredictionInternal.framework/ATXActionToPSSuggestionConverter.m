@interface ATXActionToPSSuggestionConverter
- (id)convertSuggestions:(id)a3;
- (id)proactiveSuggestionForPeopleSuggestion:(id)a3 originalSuggestion:(id)a4;
- (id)psRecipientFromINPerson:(id)a3;
- (id)psSuggesetionFromINStartCallIntent:(id)a3;
- (id)psSuggestionFromINSendMessageIntent:(id)a3;
@end

@implementation ATXActionToPSSuggestionConverter

- (id)convertSuggestions:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_blending();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v40 = [v4 count];
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Starting ATXAction to PSSuggestion conversion with %lu suggestions", buf, 0xCu);
  }

  id v31 = (id)objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      uint64_t v9 = 0;
      uint64_t v29 = v7;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D25F6CC0]();
        v12 = [v10 executableSpecification];
        v13 = [v12 executableClassString];
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        char v16 = [v13 isEqualToString:v15];

        if ((v16 & 1) == 0)
        {
          [v31 addObject:v10];
          goto LABEL_25;
        }
        v17 = self;
        v18 = [v10 executableSpecification];
        v19 = [v18 executableObject];

        v20 = [v19 intent];
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_15;
          }
          uint64_t v21 = [(ATXActionToPSSuggestionConverter *)v17 psSuggestionFromINSendMessageIntent:v20];
          if (v21)
          {
            v22 = (void *)v21;
            v23 = [(ATXActionToPSSuggestionConverter *)v17 proactiveSuggestionForPeopleSuggestion:v21 originalSuggestion:v10];
            v24 = __atxlog_handle_blending();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              [(ATXActionToPSSuggestionConverter *)buf convertSuggestions:v24];
            }

            [v31 addObject:v23];
LABEL_15:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v25 = [(ATXActionToPSSuggestionConverter *)v17 psSuggesetionFromINStartCallIntent:v20];
              if (v25)
              {
                v26 = [(ATXActionToPSSuggestionConverter *)v17 proactiveSuggestionForPeopleSuggestion:v25 originalSuggestion:v10];
                v27 = __atxlog_handle_blending();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
                  [(ATXActionToPSSuggestionConverter *)&v32 convertSuggestions:v27];
                }

                [v31 addObject:v26];
              }
              else
              {
                [v31 addObject:v10];
              }
            }
            goto LABEL_24;
          }
        }
        [v31 addObject:v10];
LABEL_24:

        self = v17;
        uint64_t v7 = v29;
LABEL_25:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v7);
  }

  return v31;
}

- (id)proactiveSuggestionForPeopleSuggestion:(id)a3 originalSuggestion:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F93978];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v9 = [v7 conversationIdentifier];
  v10 = [MEMORY[0x1E4F93960] layoutConfigurationsForLayoutOptions:2];
  v11 = (void *)[v8 initWithTitle:v9 subtitle:0 preferredLayoutConfigs:v10 allowedOnLockscreen:1 allowedOnHomeScreen:1 allowedOnSpotlight:1];

  id v12 = objc_alloc(MEMORY[0x1E4F93950]);
  v13 = [v7 description];
  v14 = objc_opt_new();
  v15 = [v14 UUIDString];
  char v16 = (void *)[v12 initWithExecutableObject:v7 executableDescription:v13 executableIdentifier:v15 suggestionExecutableType:6];

  id v17 = objc_alloc(MEMORY[0x1E4F93938]);
  v18 = [v6 clientModelSpecification];
  v19 = [v6 scoreSpecification];

  v20 = (void *)[v17 initWithClientModelSpecification:v18 executableSpecification:v16 uiSpecification:v11 scoreSpecification:v19];
  return v20;
}

- (id)psSuggestionFromINSendMessageIntent:(id)a3
{
  id v4 = a3;
  v5 = [v4 recipients];
  if ([v5 count])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__ATXActionToPSSuggestionConverter_psSuggestionFromINSendMessageIntent___block_invoke;
    v14[3] = &unk_1E68B5748;
    v14[4] = self;
    id v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v14);
    id v7 = objc_alloc(MEMORY[0x1E4F89CB8]);
    id v8 = [v4 launchId];
    uint64_t v9 = [v4 conversationIdentifier];
    v10 = [v4 speakableGroupName];
    v11 = [v10 spokenPhrase];
    id v12 = (void *)[v7 initWithBundleID:v8 conversationIdentifier:v9 groupName:v11 recipients:v6];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __72__ATXActionToPSSuggestionConverter_psSuggestionFromINSendMessageIntent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) psRecipientFromINPerson:a2];
}

- (id)psSuggesetionFromINStartCallIntent:(id)a3
{
  id v4 = a3;
  v5 = [v4 contacts];
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__ATXActionToPSSuggestionConverter_psSuggesetionFromINStartCallIntent___block_invoke;
    v12[3] = &unk_1E68B5748;
    v12[4] = self;
    id v7 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v12);
    id v8 = objc_alloc(MEMORY[0x1E4F89CB8]);
    uint64_t v9 = [v4 launchId];
    v10 = (void *)[v8 initWithBundleID:v9 conversationIdentifier:0 groupName:0 recipients:v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __71__ATXActionToPSSuggestionConverter_psSuggesetionFromINStartCallIntent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) psRecipientFromINPerson:a2];
}

- (id)psRecipientFromINPerson:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F89CA0]);
  id v6 = [v4 contactIdentifier];
  id v7 = v6;
  if (!v6)
  {
    v3 = objc_opt_new();
    id v7 = [v3 UUIDString];
  }
  id v8 = [v4 personHandle];
  uint64_t v9 = [v8 value];
  v10 = [v4 displayName];
  v11 = (void *)[v5 initWithIdentifier:v7 handle:v9 displayName:v10 contact:0];

  if (!v6)
  {
  }
  return v11;
}

- (void)convertSuggestions:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Converted INStartCallIntent to PSSuggestion Proactive Suggestion", buf, 2u);
}

- (void)convertSuggestions:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Converted INSendMessageIntent to PSSuggestion Proactive Suggestion", buf, 2u);
}

@end