@interface ATXActionToWidgetConverter
+ (BOOL)isWidgetIntent:(id)a3 validConversionFromActionIntent:(id)a4;
- (ATXActionToWidgetConverter)init;
- (ATXActionToWidgetConverter)initWithAllowsSendMessageIntentConversion:(BOOL)a3;
- (ATXActionToWidgetConverter)initWithIntentMetadataCache:(id)a3 widgetDescriptorCache:(id)a4 infoConfidenceMapper:(id)a5 engagementRecordManager:(id)a6 metadataProvider:(id)a7 allowsSendMessageIntentConversion:(BOOL)a8;
- (id)_convertedSuggestionFromInfoSuggestion:(id)a3 originalSuggestion:(id)a4;
- (id)_infoSuggestionForAction:(id)a3;
- (id)_infoSuggestionForLinkActionContainer:(id)a3;
- (id)_peopleInfoSuggestionForSendMessageIntent:(id)a3 action:(id)a4;
- (id)_selectPersonIntentForSendMessageIntent:(id)a3;
- (id)_widgetForIntent:(id)a3;
- (id)convertSuggestions:(id)a3;
@end

@implementation ATXActionToWidgetConverter

- (ATXActionToWidgetConverter)init
{
  return [(ATXActionToWidgetConverter *)self initWithAllowsSendMessageIntentConversion:1];
}

- (ATXActionToWidgetConverter)initWithAllowsSendMessageIntentConversion:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[ATXIntentMetadataCache sharedInstance];
  v6 = [MEMORY[0x1E4F4B430] sharedInstance];
  v7 = objc_opt_new();
  v8 = [MEMORY[0x1E4F4B018] sharedInstance];
  v9 = objc_opt_new();
  v10 = [(ATXActionToWidgetConverter *)self initWithIntentMetadataCache:v5 widgetDescriptorCache:v6 infoConfidenceMapper:v7 engagementRecordManager:v8 metadataProvider:v9 allowsSendMessageIntentConversion:v3];

  return v10;
}

- (ATXActionToWidgetConverter)initWithIntentMetadataCache:(id)a3 widgetDescriptorCache:(id)a4 infoConfidenceMapper:(id)a5 engagementRecordManager:(id)a6 metadataProvider:(id)a7 allowsSendMessageIntentConversion:(BOOL)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ATXActionToWidgetConverter;
  v18 = [(ATXActionToWidgetConverter *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_descriptorCache, a4);
    objc_storeStrong((id *)&v19->_intentMetadataCache, a3);
    objc_storeStrong((id *)&v19->_infoConfidenceMapper, a5);
    objc_storeStrong((id *)&v19->_engagementRecordManager, a6);
    objc_storeStrong((id *)&v19->_metadataProvider, a7);
    v19->_allowsSendMessageIntentConversion = a8;
  }

  return v19;
}

- (id)convertSuggestions:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v4;
  uint64_t v27 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v30;
    *(void *)&long long v7 = 138412546;
    long long v23 = v7;
    v24 = self;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "atxActionExecutableObject", v23);
        if (v10)
        {
          v11 = [(ATXActionToWidgetConverter *)self _infoSuggestionForAction:v10];
        }
        else
        {
          v11 = 0;
        }
        v12 = [v9 linkActionExecutableObject];
        if (v12)
        {
          uint64_t v13 = [(ATXActionToWidgetConverter *)self _infoSuggestionForLinkActionContainer:v12];

          v11 = (void *)v13;
        }
        if (v11)
        {
          id v14 = [(ATXActionToWidgetConverter *)self _convertedSuggestionFromInfoSuggestion:v11 originalSuggestion:v9];
          if (v14)
          {
            id v15 = v6;
            id v16 = __atxlog_handle_blending();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v34 = v9;
              __int16 v35 = 2112;
              v36 = v14;
              _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Converted action suggestion: %@, to widget suggestion: %@", buf, 0x16u);
            }

            id v17 = [v14 clientModelSpecification];
            v18 = [v17 clientModelId];

            v19 = [v5 objectForKeyedSubscript:v18];

            if (!v19)
            {
              v20 = objc_opt_new();
              [v5 setObject:v20 forKeyedSubscript:v18];
            }
            v21 = [v5 objectForKeyedSubscript:v18];
            [v21 addObject:v14];

            v6 = v15;
            [v15 addObject:v14];

            self = v24;
          }
        }
        [v6 addObject:v9];
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v27);
  }

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __49__ATXActionToWidgetConverter_convertSuggestions___block_invoke;
  v28[3] = &unk_1E68ABC80;
  v28[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v28];

  return v6;
}

uint64_t __49__ATXActionToWidgetConverter_convertSuggestions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) updateForClientModelCacheUpdate:a3 clientModelId:a2];
}

- (id)_infoSuggestionForLinkActionContainer:(id)a3
{
  id v4 = a3;
  v5 = [v4 cachedAppIntent];

  if (v5)
  {
    id v6 = [v4 cachedAppIntent];
  }
  else
  {
    metadataProvider = self->_metadataProvider;
    v8 = [v4 bundleId];
    v9 = [v4 action];
    v10 = [v9 identifier];
    id v24 = 0;
    v11 = [(LNMetadataProvider *)metadataProvider actionForBundleIdentifier:v8 andActionIdentifier:v10 error:&v24];
    id v6 = v24;

    if (v6 || !v11)
    {
      id v17 = __atxlog_handle_blending();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        [(ATXActionToWidgetConverter *)(uint64_t)v4 _infoSuggestionForLinkActionContainer:v17];
      }
      id v22 = 0;
      goto LABEL_12;
    }
    id v12 = objc_alloc(MEMORY[0x1E4F302B8]);
    uint64_t v13 = [v4 bundleId];
    id v14 = [v4 action];
    id v6 = (id)[v12 initWithAppBundleIdentifier:v13 linkAction:v14 linkActionMetadata:v11];

    [v4 setCachedAppIntent:v6];
  }
  v11 = [(ATXActionToWidgetConverter *)self _widgetForIntent:v6];
  if (!v11)
  {
    id v22 = 0;
    goto LABEL_13;
  }
  id v15 = (objc_class *)MEMORY[0x1E4F938F0];
  id v6 = v6;
  id v16 = [v15 alloc];
  id v17 = [v6 launchId];
  v18 = [v11 extensionBundleIdentifier];
  v19 = [v11 kind];
  uint64_t v20 = objc_msgSend(v11, "atx_layoutOptions");
  v21 = [v6 appIntentIdentifier];
  id v22 = (void *)[v16 initWithAppBundleIdentifier:v17 widgetBundleIdentifier:v18 widgetKind:v19 criterion:&stru_1F2740B58 applicableLayouts:v20 suggestionIdentifier:v21 startDate:0 endDate:0 intent:v6 metadata:0 relevanceScore:0];

LABEL_12:
LABEL_13:

  return v22;
}

- (id)_infoSuggestionForAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 intent];
  id v6 = v5;
  if (v5)
  {
    if (!self->_allowsSendMessageIntentConversion) {
      goto LABEL_9;
    }
    long long v7 = [v5 launchId];
    if (([v7 isEqualToString:@"com.apple.MobileSMS"] & 1) == 0)
    {

      goto LABEL_9;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0
      || ([(ATXActionToWidgetConverter *)self _peopleInfoSuggestionForSendMessageIntent:v6 action:v4], (v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_9:
      v10 = [(ATXActionToWidgetConverter *)self _widgetForIntent:v6];
      if (v10)
      {
        v9 = createInfoSuggestion(v4, v10, v6);
      }
      else
      {
        v9 = 0;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_widgetForIntent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || [(ATXIntentMetadataCache *)self->_intentMetadataCache isEligibleForWidgetsForIntent:v4])
  {
    v5 = [(ATXWidgetDescriptorCache *)self->_descriptorCache homeScreenDescriptorForIntent:v4];
    id v6 = __atxlog_handle_blending();
    long long v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        v11 = v5;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Found descriptor %@ for eligible intent %@", (uint8_t *)&v10, 0x16u);
      }

      id v8 = v5;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[ATXActionToWidgetConverter _widgetForIntent:]((uint64_t)v4, v7);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_convertedSuggestionFromInfoSuggestion:(id)a3 originalSuggestion:(id)a4
{
  infoConfidenceMapper = self->_infoConfidenceMapper;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 scoreSpecification];
  objc_msgSend(v7, "setConfidenceLevel:", -[ATXInfoToBlendingConfidenceMapper minInfoConfidenceLevelForBlendingConfidenceCategory:](infoConfidenceMapper, "minInfoConfidenceLevelForBlendingConfidenceCategory:", objc_msgSend(v8, "suggestedConfidenceCategory")));

  v9 = (void *)MEMORY[0x1E4F93940];
  int v10 = [v6 clientModelSpecification];
  v11 = [v10 clientModelId];
  uint64_t v12 = [v9 clientModelTypeFromClientModelId:v11];

  uint64_t v13 = [MEMORY[0x1E4F93940] actionConversionTypeForClientModelType:v12];
  uint64_t v14 = (void *)MEMORY[0x1E4F938F0];
  id v15 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:v13];
  id v16 = [v6 clientModelSpecification];
  id v17 = [v16 clientModelVersion];
  v18 = [v6 scoreSpecification];
  [v18 rawScore];
  double v20 = v19;
  v21 = [v6 scoreSpecification];

  id v22 = objc_msgSend(v14, "proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:", v7, v15, v17, objc_msgSend(v21, "suggestedConfidenceCategory"), v20);

  return v22;
}

- (id)_peopleInfoSuggestionForSendMessageIntent:(id)a3 action:(id)a4
{
  id v6 = a4;
  id v7 = [(ATXActionToWidgetConverter *)self _selectPersonIntentForSendMessageIntent:a3];
  if (v7)
  {
    id v8 = [(ATXWidgetDescriptorCache *)self->_descriptorCache homeScreenDescriptorForIntent:v7];
    if (v8)
    {
      v9 = createInfoSuggestion(v6, v8, v7);
    }
    else
    {
      int v10 = __atxlog_handle_blending();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ATXActionToWidgetConverter _peopleInfoSuggestionForSendMessageIntent:action:]((uint64_t)v7, v10);
      }

      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_selectPersonIntentForSendMessageIntent:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 recipients];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    id v6 = [v3 recipients];
    id v7 = [v6 firstObject];

    id v8 = [v7 contactIdentifier];

    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F302B8]);
      double v20 = @"person";
      int v10 = [v7 contactIdentifier];
      v18[1] = @"displayString";
      v19[0] = v10;
      v11 = [v7 displayName];
      v19[1] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
      v21 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      uint64_t v14 = (void *)[v9 initWithAppBundleIdentifier:@"com.apple.PeopleViewService" appIntentIdentifier:@"SelectPersonIntent" serializedParameters:v13];

      if (v14) {
        goto LABEL_13;
      }
      id v15 = __atxlog_handle_blending();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[ATXActionToWidgetConverter _selectPersonIntentForSendMessageIntent:](v15);
      }
    }
    else
    {
      id v15 = __atxlog_handle_blending();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Not converting INSendMessageIntent: no contact identifier", buf, 2u);
      }
      uint64_t v14 = 0;
    }
  }
  else
  {
    id v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v3 recipients];
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = [v16 count];
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Not converting INSendMessageIntent: recipient count (%lu) is not 1", buf, 0xCu);
    }
    uint64_t v14 = 0;
  }
LABEL_13:

  return v14;
}

+ (BOOL)isWidgetIntent:(id)a3 validConversionFromActionIntent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 launchId];
  if (([v7 isEqualToString:@"com.apple.PeopleViewService"] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v8 = [v6 launchId];
  int v9 = [v8 isEqualToString:@"com.apple.MobileSMS"];

  if (!v9)
  {
LABEL_8:
    char v13 = objc_msgSend(v5, "atx_isEqualToIntent:", v6);
    goto LABEL_30;
  }
  Class v10 = NSClassFromString(&cfstr_Insendmessagei.isa);
  id v11 = v6;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v14 = v12;

  id v15 = [v14 recipients];
  uint64_t v16 = [v15 count];

  if (v16 == 1)
  {
    id v17 = [v14 recipients];
    v18 = [v17 objectAtIndexedSubscript:0];
    double v19 = [v18 contactIdentifier];

    if (v19)
    {
      Class v20 = NSClassFromString(&cfstr_Inappintent.isa);
      id v21 = v5;
      if (v20)
      {
        if (objc_opt_isKindOfClass()) {
          id v22 = v21;
        }
        else {
          id v22 = 0;
        }
      }
      else
      {
        id v22 = 0;
      }
      id v23 = v22;

      if (v23)
      {
        uint64_t v24 = [v23 serializedParameters];
        v25 = [v24 objectForKeyedSubscript:@"person"];
        Class v26 = NSClassFromString(&cfstr_Nsdictionary.isa);
        id v27 = v25;
        if (v26)
        {
          if (objc_opt_isKindOfClass()) {
            v28 = v27;
          }
          else {
            v28 = 0;
          }
        }
        else
        {
          v28 = 0;
        }
        id v29 = v28;

        long long v30 = [v29 objectForKeyedSubscript:@"identifier"];

        char v13 = [v19 isEqualToString:v30];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

LABEL_30:
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenPages, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigCache, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_infoConfidenceMapper, 0);
  objc_storeStrong((id *)&self->_intentMetadataCache, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
}

- (void)_infoSuggestionForLinkActionContainer:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXActionToWidgetConverter: error fetching metadata for link action (%@): %@", (uint8_t *)&v3, 0x16u);
}

- (void)_widgetForIntent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXActionToWidgetConverter: Unable to find descriptor for eligible intent %@", (uint8_t *)&v2, 0xCu);
}

- (void)_peopleInfoSuggestionForSendMessageIntent:(uint64_t)a1 action:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXActionToWidgetConverter: Unable to find People widget descriptor for select person intent: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_selectPersonIntentForSendMessageIntent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXActionToWidgetConverter: could not create contacts SelectPersonIntent app intent", v1, 2u);
}

@end