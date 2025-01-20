@interface ATXWatchSmartStacksSender
- (ATXWatchSmartStacksSender)init;
- (id)_uniqueKeyForForLastInfoSuggestionSentToWatch;
- (id)_uniqueKeyForRememberingLastInfoSuggestion:(id)a3;
- (int64_t)ATXProactiveSuggestionConfidenceCategoryToNHSSRelevantWidgetConfidenceCategory:(int64_t)a3;
- (void)_saveUniqueKeyForLastInfoSuggestionSentToWatch:(id)a3;
- (void)blendingLayerDidUpdateUICache:(id)a3;
@end

@implementation ATXWatchSmartStacksSender

- (ATXWatchSmartStacksSender)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXWatchSmartStacksSender;
  v2 = [(ATXWatchSmartStacksSender *)&v7 init];
  if (v2)
  {
    v3 = [[ATXPowerThrottlingCreditPoolConfig alloc] initWithIdentifier:@"ATXWatchSmartStacksSender" maxCredits:20 secondsToReplenishOneCredit:3600 loggingSubsystem:@"com.apple.duetexpertd.atx" loggingCategory:@"watch"];
    v4 = [[ATXPowerThrottlingCreditPool alloc] initWithConfig:v3];
    powerThrottlingCreditPool = v2->_powerThrottlingCreditPool;
    v2->_powerThrottlingCreditPool = v4;
  }
  return v2;
}

- (void)blendingLayerDidUpdateUICache:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (NanoHomeScreenServicesLibraryCore())
  {
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2050000000;
    v5 = (void *)getNHSSRelevantWidgetDefaultsClass_softClass;
    uint64_t v55 = getNHSSRelevantWidgetDefaultsClass_softClass;
    if (!getNHSSRelevantWidgetDefaultsClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getNHSSRelevantWidgetDefaultsClass_block_invoke;
      v57 = &unk_1E68AB438;
      v58 = &v52;
      NanoHomeScreenServicesLibraryCore();
      Class Class = objc_getClass("NHSSRelevantWidgetDefaults");
      *(void *)(v58[1] + 24) = Class;
      getNHSSRelevantWidgetDefaultsClass_softClass Class = *(void *)(v58[1] + 24);
      v5 = (void *)v53[3];
    }
    id v7 = v5;
    _Block_object_dispose(&v52, 8);
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2050000000;
    v8 = (void *)getNHSSRelevantWidgetClass_softClass;
    uint64_t v55 = getNHSSRelevantWidgetClass_softClass;
    if (!getNHSSRelevantWidgetClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getNHSSRelevantWidgetClass_block_invoke;
      v57 = &unk_1E68AB438;
      v58 = &v52;
      NanoHomeScreenServicesLibraryCore();
      Class v9 = objc_getClass("NHSSRelevantWidget");
      *(void *)(v58[1] + 24) = v9;
      getNHSSRelevantWidgetClass_softClass Class = *(void *)(v58[1] + 24);
      v8 = (void *)v53[3];
    }
    v10 = v8;
    _Block_object_dispose(&v52, 8);
    if (v7 && v10)
    {
      v11 = [v4 allSuggestionsInLayout];
      BOOL v12 = (unint64_t)[v11 count] > 1;

      if (v12)
      {
        v13 = __atxlog_handle_watch();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[ATXWatchSmartStacksSender blendingLayerDidUpdateUICache:](v13);
        }
      }
      v14 = [v4 allSuggestionsInLayout];
      v15 = [v14 firstObject];

      v16 = [v15 executableSpecification];
      v17 = [v16 executableObject];
      Class v18 = NSClassFromString(&cfstr_Atxinfosuggest_8.isa);
      id v19 = v17;
      if (v18)
      {
        if (objc_opt_isKindOfClass()) {
          v20 = v19;
        }
        else {
          v20 = 0;
        }
      }
      else
      {
        v20 = 0;
      }
      id v21 = v20;

      uint64_t v22 = [(ATXWatchSmartStacksSender *)self _uniqueKeyForRememberingLastInfoSuggestion:v21];
      uint64_t v23 = [(ATXWatchSmartStacksSender *)self _uniqueKeyForForLastInfoSuggestionSentToWatch];
      v24 = __atxlog_handle_watch();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[ATXWatchSmartStacksSender blendingLayerDidUpdateUICache:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "%s: UI cache updated with suggestion ID: %@", buf, 0x16u);
      }

      if (!(v22 | v23))
      {
        v25 = __atxlog_handle_watch();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v26 = "Current suggestions and previous suggestions are empty. No need to sync.";
          goto LABEL_29;
        }
LABEL_44:

        goto LABEL_45;
      }
      if ([(id)v22 isEqualToString:v23])
      {
        v25 = __atxlog_handle_watch();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v26 = "Not sending the same Watch Smart Stack suggestions";
LABEL_29:
          _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
          goto LABEL_44;
        }
        goto LABEL_44;
      }
      id v27 = objc_alloc(MEMORY[0x1E4F1CB18]);
      v45 = (void *)[v27 initWithSuiteName:*MEMORY[0x1E4F4B688]];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      v29 = v28;
      v46 = objc_opt_new();
      if (v21)
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4F4B0D8]);
        uint64_t v31 = objc_msgSend(v30, "blendingConfidenceCategoryForInfoConfidenceLevel:", objc_msgSend(v21, "confidenceLevel"));

        int64_t v42 = [(ATXWatchSmartStacksSender *)self ATXProactiveSuggestionConfidenceCategoryToNHSSRelevantWidgetConfidenceCategory:v31];
        id v32 = [v10 alloc];
        v44 = [v21 widgetBundleIdentifier];
        v43 = [v21 appBundleIdentifier];
        v33 = [v21 widgetKind];
        v34 = [v21 intent];
        v35 = objc_msgSend(v32, "initWithExtensionBundleIdentifier:appBundleIdentifier:widgetKind:confidenceCategory:intentIndexingHash:", v44, v43, v33, v42, objc_msgSend(v34, "atx_indexingHash"));

        [v46 addObject:v35];
      }
      if (!v22 || v23)
      {
        if (v22 || !v23)
        {
          if (!v22 || !v23) {
            goto LABEL_43;
          }
          v36 = __atxlog_handle_watch();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v22;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v23;
            v37 = "Sending updated Watch Smart Stack suggestion: %@ (last one: %@)";
            v38 = v36;
            uint32_t v39 = 22;
            goto LABEL_41;
          }
        }
        else
        {
          v36 = __atxlog_handle_watch();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v23;
            v37 = "Retracting Watch Smart Stack suggestion: %@";
            goto LABEL_40;
          }
        }
      }
      else
      {
        v36 = __atxlog_handle_watch();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v22;
          v37 = "Sending new Watch Smart Stack suggestion: %@";
LABEL_40:
          v38 = v36;
          uint32_t v39 = 12;
LABEL_41:
          _os_log_impl(&dword_1D0FA3000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);
        }
      }

LABEL_43:
      objc_initWeak((id *)buf, self);
      powerThrottlingCreditPool = self->_powerThrottlingCreditPool;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __59__ATXWatchSmartStacksSender_blendingLayerDidUpdateUICache___block_invoke;
      v47[3] = &unk_1E68B5310;
      v51[1] = v7;
      id v41 = v46;
      id v48 = v41;
      v25 = v45;
      v49 = v25;
      v51[2] = v29;
      objc_copyWeak(v51, (id *)buf);
      id v50 = v21;
      [(ATXPowerThrottlingCreditPool *)powerThrottlingCreditPool consumeCredits:1 toRun:v47];

      objc_destroyWeak(v51);
      objc_destroyWeak((id *)buf);

      goto LABEL_44;
    }
    v15 = __atxlog_handle_watch();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXWatchSmartStacksSender blendingLayerDidUpdateUICache:](v15);
    }
  }
  else
  {
    v15 = __atxlog_handle_watch();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXWatchSmartStacksSender blendingLayerDidUpdateUICache:](v15);
    }
  }
LABEL_45:
}

void __59__ATXWatchSmartStacksSender_blendingLayerDidUpdateUICache___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 64) sharedInstance];
  [v2 setRelevantWidgets:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) setDouble:@"LastWatchSmartStackSuggestionSyncTimestampKey" forKey:*(double *)(a1 + 72)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _saveUniqueKeyForLastInfoSuggestionSentToWatch:*(void *)(a1 + 48)];
}

- (id)_uniqueKeyForRememberingLastInfoSuggestion:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)NSString;
    id v4 = a3;
    id v5 = [v3 alloc];
    v6 = [v4 appBundleIdentifier];
    id v7 = [v4 widgetBundleIdentifier];
    v8 = [v4 widgetKind];
    Class v9 = [v4 intent];

    v10 = (void *)[v5 initWithFormat:@"%@-%@-%@-%lld", v6, v7, v8, objc_msgSend(v9, "atx_indexingHash")];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_uniqueKeyForForLastInfoSuggestionSentToWatch
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  id v4 = [v3 stringForKey:@"LastWatchSmartStackSuggestionIdentifier"];

  return v4;
}

- (void)_saveUniqueKeyForLastInfoSuggestionSentToWatch:(id)a3
{
  id v8 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v5 = (void *)[v4 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v6 = v5;
  if (v8)
  {
    id v7 = [(ATXWatchSmartStacksSender *)self _uniqueKeyForRememberingLastInfoSuggestion:v8];
    [v6 setObject:v7 forKey:@"LastWatchSmartStackSuggestionIdentifier"];
  }
  else
  {
    [v5 removeObjectForKey:@"LastWatchSmartStackSuggestionIdentifier"];
  }
}

- (int64_t)ATXProactiveSuggestionConfidenceCategoryToNHSSRelevantWidgetConfidenceCategory:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void).cxx_destruct
{
}

- (void)blendingLayerDidUpdateUICache:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "NanoHomeScreenServices failed to softlink on iOS. This should never happen on iOS. Unable to sync.", v1, 2u);
}

- (void)blendingLayerDidUpdateUICache:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Changes haven't landed in NanoHomeScreenServices yet. Unable to sync.", v1, 2u);
}

- (void)blendingLayerDidUpdateUICache:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Unexpected number of Watch Smart Stack suggestions; the layout selector should only yield up to one",
    v1,
    2u);
}

@end