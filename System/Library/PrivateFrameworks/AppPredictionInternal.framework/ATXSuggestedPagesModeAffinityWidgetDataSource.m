@interface ATXSuggestedPagesModeAffinityWidgetDataSource
- (double)_fetchScoreThresholdForWidgetModeAffinityModel;
- (id)_widgetIdentifierWithoutIntentForCHSWidget:(id)a3;
- (id)_widgetIdentifierWithoutIntentForWidget:(id)a3;
- (id)fetchWidgetsPassingThresholdForMode:(unint64_t)a3 forSize:(unint64_t)a4;
- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesModeAffinityWidgetDataSource

- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4
{
  unint64_t v6 = +[ATXSuggestedPagesUtils modeForSuggestedPageType:](ATXSuggestedPagesUtils, "modeForSuggestedPageType:", a3, a4);
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = allModesForTraining();
  v9 = [v7 setWithArray:v8];

  v10 = [NSNumber numberWithUnsignedInteger:v6];
  char v11 = [v9 containsObject:v10];

  if (v11)
  {
    v12 = objc_opt_new();
    int v13 = [MEMORY[0x1E4F93B08] isiPad];
    uint64_t v14 = MEMORY[0x1E4F1CBF0];
    if (v13)
    {
      uint64_t v15 = [(ATXSuggestedPagesModeAffinityWidgetDataSource *)self fetchWidgetsPassingThresholdForMode:v6 forSize:2];
      v16 = (void *)v15;
      if (v15) {
        uint64_t v17 = v15;
      }
      else {
        uint64_t v17 = v14;
      }
      [v12 addObjectsFromArray:v17];
    }
    uint64_t v18 = [(ATXSuggestedPagesModeAffinityWidgetDataSource *)self fetchWidgetsPassingThresholdForMode:v6 forSize:1];
    v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = v14;
    }
    [v12 addObjectsFromArray:v20];

    uint64_t v21 = [(ATXSuggestedPagesModeAffinityWidgetDataSource *)self fetchWidgetsPassingThresholdForMode:v6 forSize:0];
    v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = v14;
    }
    [v12 addObjectsFromArray:v23];
  }
  else
  {
    v24 = __atxlog_handle_modes();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ATXSuggestedPagesModeAffinityWidgetDataSource provideWidgetsForPageType:environment:](a3, v24);
    }

    v12 = 0;
  }

  return v12;
}

- (id)fetchWidgetsPassingThresholdForMode:(unint64_t)a3 forSize:(unint64_t)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  [(ATXSuggestedPagesModeAffinityWidgetDataSource *)self _fetchScoreThresholdForWidgetModeAffinityModel];
  double v8 = v7;
  v9 = +[ATXModeEntityScorerServer sharedInstance];
  v10 = [v9 rankedWidgetsForMode:a3];

  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __93__ATXSuggestedPagesModeAffinityWidgetDataSource_fetchWidgetsPassingThresholdForMode_forSize___block_invoke;
  v88[3] = &unk_1E68B5E08;
  v78 = self;
  v88[4] = self;
  v81 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v88);
  char v11 = objc_opt_new();
  v83 = objc_opt_new();
  v74 = objc_opt_new();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v10;
  uint64_t v80 = [obj countByEnumeratingWithState:&v84 objects:v95 count:16];
  if (!v80) {
    goto LABEL_38;
  }
  uint64_t v79 = *(void *)v85;
  *(void *)&long long v12 = 138412802;
  long long v72 = v12;
  unint64_t v73 = a4;
  v76 = v11;
  while (2)
  {
    for (uint64_t i = 0; i != v80; ++i)
    {
      if (*(void *)v85 != v79) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v84 + 1) + 8 * i);
      uint64_t v15 = (void *)MEMORY[0x1D25F6CC0]();
      uint64_t v16 = [v11 count];
      if ([v83 count] + v16 == 4)
      {
        goto LABEL_38;
      }
      id v17 = objc_alloc_init(MEMORY[0x1E4F4B0D0]);
      uint64_t v18 = [v14 widget];
      v19 = [v18 kind];
      [v17 setWidgetKind:v19];

      uint64_t v20 = [v14 widget];
      uint64_t v21 = [v20 extensionIdentity];
      v22 = [v21 extensionBundleIdentifier];
      [v17 setExtensionBundleId:v22];

      uint64_t v23 = [v14 widget];
      uint64_t v24 = [v23 extensionIdentity];
      v25 = [(id)v24 containerBundleIdentifier];
      [v17 setAppBundleId:v25];

      [v17 setSize:a4];
      v26 = [v14 scoreMetadata];
      [v26 score];
      objc_msgSend(v17, "setScore:");

      [v17 setPredictionSource:@"Mode Entity"];
      [v17 setRequiresAppLaunch:1];
      v27 = [(ATXSuggestedPagesModeAffinityWidgetDataSource *)v78 _widgetIdentifierWithoutIntentForWidget:v17];
      LOBYTE(v24) = [v81 containsObject:v27];

      if (v24)
      {
        v28 = [v14 scoreMetadata];
        v29 = [v28 featureVector];

        v30 = [v29 objectForKeyedSubscript:@"correlationEntitySpecificFeatures"];
        v31 = [v30 objectForKeyedSubscript:@"parentAppGlobalPrior"];

        v77 = [v29 objectForKeyedSubscript:@"correlationNumLocalOccurrences"];
        v32 = [v29 objectForKeyedSubscript:@"correlationEntitySpecificFeatures"];
        v82 = [v32 objectForKeyedSubscript:@"widgetGlobalPrior"];

        v33 = [v14 widget];
        v34 = [v33 extensionIdentity];
        v35 = [v34 containerBundleIdentifier];

        if (v35)
        {
          uint64_t v36 = [v83 objectForKeyedSubscript:v35];
          if (v36)
          {
            v37 = (void *)v36;
            [v82 doubleValue];
            double v39 = v38;
            v40 = [v74 objectForKeyedSubscript:v35];
            [v40 doubleValue];
            double v42 = v41;

            if (v39 > v42)
            {
              v43 = __atxlog_handle_modes();
              char v11 = v76;
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v90 = v35;
                _os_log_impl(&dword_1D0FA3000, v43, OS_LOG_TYPE_INFO, "ATXSuggestedPagesModeAffinityWidgetDataSource: replacing widget prediction since this widget from the app (%@) has higher global popularity", buf, 0xCu);
              }

              [v74 setObject:v82 forKeyedSubscript:v35];
              v44 = [v83 objectForKeyedSubscript:v35];
              [v44 score];
              objc_msgSend(v17, "setScore:");

              v45 = [v83 objectForKeyedSubscript:v35];
              v46 = [v45 predictionSource];
              [v17 setPredictionSource:v46];

              [v83 setObject:v17 forKeyedSubscript:v35];
              a4 = v73;
              v47 = v77;
              goto LABEL_33;
            }
          }
        }
        objc_msgSend(v31, "doubleValue", v72);
        char v11 = v76;
        v47 = v77;
        if (v50 <= 8.0 || [v77 integerValue] < 1)
        {
          [v31 doubleValue];
          if (v56 <= 5.0 || ([v82 doubleValue], v57 < 0.0005))
          {
            v58 = [v14 scoreMetadata];
            [v58 score];
            double v60 = v59;

            a4 = v73;
            if (v60 <= v8)
            {
LABEL_33:

              goto LABEL_34;
            }
            v61 = __atxlog_handle_modes();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
            {
              v62 = [v14 identifier];
              v63 = [v14 scoreMetadata];
              [v63 score];
              *(_DWORD *)buf = 138412546;
              v90 = v62;
              __int16 v91 = 2048;
              v92 = v64;
              _os_log_impl(&dword_1D0FA3000, v61, OS_LOG_TYPE_INFO, "ATXSuggestedPagesModeAffinityWidgetDataSource: %@ passes widget mode affinity threshold with score: %f", buf, 0x16u);

              a4 = v73;
            }

            if (v35) {
              goto LABEL_32;
            }
LABEL_27:
            char v11 = v76;
            [v76 addObject:v17];
            goto LABEL_33;
          }
          v65 = __atxlog_handle_modes();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            v66 = [v14 identifier];
            [v82 doubleValue];
            v68 = v67;
            [v31 doubleValue];
            *(_DWORD *)buf = v72;
            v90 = v66;
            __int16 v91 = 2048;
            v92 = v68;
            __int16 v93 = 2048;
            uint64_t v94 = v69;
            _os_log_impl(&dword_1D0FA3000, v65, OS_LOG_TYPE_INFO, "ATXSuggestedPagesModeAffinityWidgetDataSource: %@ has widget popularity: %f and passes parent app global prior threshold with score: %f", buf, 0x20u);
          }
          [v31 doubleValue];
          objc_msgSend(v17, "setScore:");
          v54 = v17;
          v55 = @"Widget Popularity";
        }
        else
        {
          v51 = __atxlog_handle_modes();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            v52 = [v14 identifier];
            [v31 doubleValue];
            *(_DWORD *)buf = 138412546;
            v90 = v52;
            __int16 v91 = 2048;
            v92 = v53;
            _os_log_impl(&dword_1D0FA3000, v51, OS_LOG_TYPE_INFO, "ATXSuggestedPagesModeAffinityWidgetDataSource: %@ has local engagement and passes parent app global prior threshold with score: %f", buf, 0x16u);
          }
          [v31 doubleValue];
          objc_msgSend(v17, "setScore:");
          v54 = v17;
          v55 = @"Global Mode Entity";
        }
        [v54 setPredictionSource:v55];
        a4 = v73;
        if (v35)
        {
LABEL_32:
          [v74 setObject:v82 forKeyedSubscript:v35];
          [v83 setObject:v17 forKeyedSubscript:v35];
          char v11 = v76;
          goto LABEL_33;
        }
        goto LABEL_27;
      }
      v29 = __atxlog_handle_modes();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v48 = [v14 identifier];
        CHSWidgetFamilyFromATXStackLayoutSize();
        v49 = NSStringFromWidgetFamily();
        *(_DWORD *)buf = 138543618;
        v90 = v48;
        __int16 v91 = 2114;
        v92 = v49;
        _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_INFO, "ATXSuggestedPagesModeAffinityWidgetDataSource: %{public}@ widget does not exist in the preferred size: %{public}@ for this suggested page type", buf, 0x16u);
      }
LABEL_34:
    }
    uint64_t v80 = [obj countByEnumeratingWithState:&v84 objects:v95 count:16];
    if (v80) {
      continue;
    }
    break;
  }
LABEL_38:

  v70 = [v83 allValues];
  [v11 addObjectsFromArray:v70];

  return v11;
}

id __93__ATXSuggestedPagesModeAffinityWidgetDataSource_fetchWidgetsPassingThresholdForMode_forSize___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 widget];
  v4 = [v2 _widgetIdentifierWithoutIntentForCHSWidget:v3];

  return v4;
}

- (double)_fetchScoreThresholdForWidgetModeAffinityModel
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  uint64_t v4 = *MEMORY[0x1E4F4B5D8];
  v5 = [v3 objectForKey:*MEMORY[0x1E4F4B5D8]];

  if (v5)
  {
    [v3 doubleForKey:v4];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.3;
  }

  return v7;
}

- (id)_widgetIdentifierWithoutIntentForCHSWidget:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  double v6 = [v4 extensionIdentity];
  double v7 = [v6 extensionBundleIdentifier];
  double v8 = [v4 extensionIdentity];
  v9 = [v8 containerBundleIdentifier];
  v10 = [v4 kind];
  [v4 family];

  char v11 = NSStringFromWidgetFamily();
  long long v12 = (void *)[v5 initWithFormat:@"%@:%@:%@:%@", v7, v9, v10, v11];

  return v12;
}

- (id)_widgetIdentifierWithoutIntentForWidget:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  double v6 = [v4 extensionBundleId];
  double v7 = [v4 appBundleId];
  double v8 = [v4 widgetKind];
  [v4 size];

  CHSWidgetFamilyFromATXStackLayoutSize();
  v9 = NSStringFromWidgetFamily();
  v10 = (void *)[v5 initWithFormat:@"%@:%@:%@:%@", v6, v7, v8, v9];

  return v10;
}

- (void)provideWidgetsForPageType:(uint64_t)a1 environment:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromATXSuggestedPageType();
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesModeAffinityWidgetDataSource: No mode affinity model found for suggested page type: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end