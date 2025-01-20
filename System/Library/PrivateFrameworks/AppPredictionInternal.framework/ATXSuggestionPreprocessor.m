@interface ATXSuggestionPreprocessor
+ (id)bundleIdAssociatedWithSuggestion:(id)a3;
+ (id)contactIdsAssociatedWithContactsWidgetIntent:(id)a3;
+ (id)contactIdsAssociatedWithSuggestion:(id)a3;
- (ATXSuggestionPreprocessor)init;
- (ATXSuggestionPreprocessor)initWithEngagementRecordManager:(id)a3 notificationsLoggingServer:(id)a4 lockscreenBlacklist:(id)a5 actionToWidgetConverter:(id)a6;
- (BOOL)_bundleSupportsINPlayMediaIntentForBundleId:(id)a3 fromUnitTest:(BOOL)a4;
- (BOOL)shouldFilterOutSuggestion:(id)a3 withBundleId:(id)a4 fromAppsThatCannotBeSuggested:(id)a5 fromAppsWhoseContentsCannotBeSuggested:(id)a6;
- (id)filterOutRecentlyEngagedSuggestions:(id)a3;
- (id)filterOutSuggestionsForUninstalledOrRestrictedApps:(id)a3;
- (id)preprocessedSuggestionsForAppSwitcherConsumer:(id)a3;
- (id)preprocessedSuggestionsForMediaControlsConsumer:(id)a3;
- (id)suggestionsByPreprocessingRankedSuggestions:(id)a3 forConsumerSubType:(unsigned __int8)a4;
- (id)suggestionsWithInvalidSuggestionsRemoved:(id)a3;
- (void)configurationDidChangeForFilter:(id)a3;
@end

@implementation ATXSuggestionPreprocessor

- (ATXSuggestionPreprocessor)init
{
  v3 = [MEMORY[0x1E4F4B018] sharedInstance];
  v4 = +[ATXNotificationsLoggingServer sharedInstance];
  v5 = +[ATXLockscreenBlacklist sharedInstance];
  v6 = objc_opt_new();
  v7 = [(ATXSuggestionPreprocessor *)self initWithEngagementRecordManager:v3 notificationsLoggingServer:v4 lockscreenBlacklist:v5 actionToWidgetConverter:v6];

  return v7;
}

- (ATXSuggestionPreprocessor)initWithEngagementRecordManager:(id)a3 notificationsLoggingServer:(id)a4 lockscreenBlacklist:(id)a5 actionToWidgetConverter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ATXSuggestionPreprocessor;
  v15 = [(ATXSuggestionPreprocessor *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_converter, a6);
    objc_storeStrong((id *)&v16->_notificationsLoggingServer, a4);
    objc_storeStrong((id *)&v16->_lockscreenBlacklist, a5);
    objc_storeStrong((id *)&v16->_engagementRecordManager, a3);
    uint64_t v17 = [MEMORY[0x1E4F93550] sharedInstance];
    hyperParameters = v16->_hyperParameters;
    v16->_hyperParameters = (ATXBlendingLayerHyperParameters *)v17;

    uint64_t v19 = +[ATXSuggestionModeFilter sharedInstance];
    modeFilter = v16->_modeFilter;
    v16->_modeFilter = (ATXSuggestionModeFilter *)v19;

    [(ATXSuggestionModeFilter *)v16->_modeFilter registerObserver:v16];
    [(ATXSuggestionModeFilter *)v16->_modeFilter registerForModeChanges];
  }

  return v16;
}

- (id)suggestionsWithInvalidSuggestionsRemoved:(id)a3
{
  v4 = [(ATXSuggestionPreprocessor *)self filterOutSuggestionsForUninstalledOrRestrictedApps:a3];
  v5 = [(ATXSuggestionPreprocessor *)self filterOutRecentlyEngagedSuggestions:v4];

  return v5;
}

- (id)filterOutRecentlyEngagedSuggestions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_blending();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = [v4 count];
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is removing recently engaged suggestions. # suggestions at start: %lu", buf, 0xCu);
  }

  v6 = [(ATXEngagementRecordManager *)self->_engagementRecordManager engagedExecutablesOfType:3 queryOptions:1];
  v7 = [(ATXEngagementRecordManager *)self->_engagementRecordManager engagedExecutablesOfType:120 queryOptions:2];
  v8 = (void *)[v6 mutableCopy];
  [v8 unionSet:v7];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __65__ATXSuggestionPreprocessor_filterOutRecentlyEngagedSuggestions___block_invoke;
  uint64_t v17 = &unk_1E68AE050;
  v18 = self;
  id v19 = v8;
  id v9 = v8;
  v10 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", &v14);
  id v11 = __atxlog_handle_blending();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend(v10, "count", v14, v15, v16, v17, v18, v19);
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v12;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is done removing recently engaged suggestions. # suggestions at end: %lu", buf, 0xCu);
  }

  return v10;
}

uint64_t __65__ATXSuggestionPreprocessor_filterOutRecentlyEngagedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(*(void *)(a1 + 32) + 16) hasEngagedWithSuggestion:v3 engagedExecutables:*(void *)(a1 + 40)];
  if (v4)
  {
    v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Blending: Blending layer has filtered out recently engaged suggestion: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 ^ 1u;
}

- (id)filterOutSuggestionsForUninstalledOrRestrictedApps:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_blending();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = [v4 count];
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is removing suggestions for unsupported apps. # suggestions at start: %lu", buf, 0xCu);
  }

  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  int v7 = (void *)CFPreferencesCopyValue(@"SBSearchSuggestAppDisabled", @"com.apple.spotlightui", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  v10 = v9;

  id v11 = (void *)[v6 initWithArray:v10];
  uint64_t v12 = objc_opt_new();
  id v13 = [v12 hiddenOrLockedBundleIDs];

  id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v15 = +[_ATXAppIconState sharedInstance];
  v16 = [v15 allInstalledAppsKnownToSpringBoard];
  uint64_t v17 = (void *)[v14 initWithArray:v16];

  v18 = +[ATXDigitalHealthBlacklist sharedInstance];
  id v19 = [v18 blacklistedBundleIds];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __80__ATXSuggestionPreprocessor_filterOutSuggestionsForUninstalledOrRestrictedApps___block_invoke;
  v28[3] = &unk_1E68B2168;
  v28[4] = self;
  id v29 = v19;
  id v30 = v11;
  id v31 = v13;
  id v32 = v17;
  id v20 = v17;
  id v21 = v13;
  id v22 = v11;
  id v23 = v19;
  v24 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", v28);
  v25 = __atxlog_handle_blending();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = [v24 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v26;
    _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is done removing suggestions for unsupported apps. # suggestions at end: %lu", buf, 0xCu);
  }

  return v24;
}

uint64_t __80__ATXSuggestionPreprocessor_filterOutSuggestionsForUninstalledOrRestrictedApps___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(id)objc_opt_class() bundleIdAssociatedWithSuggestion:v3];
  v5 = ATXBundleIdReplacementForBundleId();

  if (!v5 || (ATXBundleIdIsFakeContainerBundleId() & 1) != 0) {
    goto LABEL_3;
  }
  if ([MEMORY[0x1E4F4AF00] isAppClipWebClipBundleId:v5])
  {
    uint64_t v6 = [MEMORY[0x1E4F4AF00] isWebClipInstalledWithBundleId:v5];
    goto LABEL_4;
  }
  if ([MEMORY[0x1E4F4AF00] isSwiftPlaygroundsBundle:v5])
  {
LABEL_19:
    uint64_t v6 = 0;
    goto LABEL_4;
  }
  if ([*(id *)(a1 + 40) containsObject:v5])
  {
    id v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      id v9 = "Removed suggestion for %@ because it is blocked by ScreenTime";
LABEL_17:
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if ([*(id *)(a1 + 32) shouldFilterOutSuggestion:v3 withBundleId:v5 fromAppsThatCannotBeSuggested:*(void *)(a1 + 48) fromAppsWhoseContentsCannotBeSuggested:*(void *)(a1 + 56)])
  {
    id v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      id v9 = "Removed suggestion for %@ because it is locked or hidden by user preference";
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
  if (([*(id *)(a1 + 64) containsObject:v5] & 1) == 0)
  {
    id v8 = __atxlog_handle_blending();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      id v9 = "Removed suggestion for %@ because app is no longer installed.";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_3:
  uint64_t v6 = 1;
LABEL_4:

  return v6;
}

+ (id)bundleIdAssociatedWithSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 executableSpecification];
  uint64_t v5 = [v4 executableType];

  uint64_t v6 = [v3 executableSpecification];
  int v7 = v6;
  if (v5 == 1)
  {
    id v8 = [v6 executableObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_14;
    }
    goto LABEL_3;
  }
  uint64_t v10 = [v6 executableType];

  if (v10 == 2)
  {
    id v11 = [v3 atxActionExecutableObject];
LABEL_6:
    id v8 = v11;
    uint64_t v12 = [v11 bundleId];
    goto LABEL_12;
  }
  id v13 = [v3 executableSpecification];
  uint64_t v14 = [v13 executableType];

  if (v14 == 3)
  {
    id v8 = [v3 atxInfoSuggestionExecutableObject];
    uint64_t v12 = [v8 appBundleIdentifier];
    goto LABEL_12;
  }
  uint64_t v15 = [v3 executableSpecification];
  uint64_t v16 = [v15 executableType];

  uint64_t v17 = [v3 executableSpecification];
  v18 = v17;
  if (v16 == 6)
  {
    id v8 = [v17 executableObject];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_3:
      id v9 = 0;
LABEL_13:

      id v8 = v9;
      goto LABEL_14;
    }
    uint64_t v12 = [v8 bundleID];
LABEL_12:
    id v9 = (void *)v12;
    goto LABEL_13;
  }
  uint64_t v20 = [v17 executableType];

  if (v20 == 10)
  {
    id v11 = [v3 linkActionExecutableObject];
    goto LABEL_6;
  }
  id v8 = 0;
LABEL_14:

  return v8;
}

+ (id)contactIdsAssociatedWithSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 executableSpecification];
  uint64_t v6 = [v5 executableType];

  if (v6 == 2)
  {
    int v7 = [v4 atxActionExecutableObject];
    id v8 = [v7 intent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v10 = [v7 intent];
    id v11 = v10;
    if (isKindOfClass)
    {
      uint64_t v12 = [v10 recipients];
      id v13 = v12;
      uint64_t v14 = &__block_literal_global_119;
LABEL_10:
      uint64_t v20 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", v14);

      v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v20];
      goto LABEL_14;
    }
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if (v19)
    {
      id v11 = [v7 intent];
      uint64_t v12 = [v11 contacts];
      id v13 = v12;
      uint64_t v14 = &__block_literal_global_30_1;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v15 = [v4 executableSpecification];
    uint64_t v16 = [v15 executableType];

    if (v16 != 3)
    {
      v18 = 0;
      goto LABEL_16;
    }
    int v7 = [v4 atxInfoSuggestionExecutableObject];
    id v11 = [v7 widgetBundleIdentifier];
    if (![v11 isEqualToString:@"com.apple.PeopleViewService.PeopleWidget-iOS"])
    {
      v18 = 0;
      goto LABEL_14;
    }
    uint64_t v17 = [v7 intent];

    if (v17)
    {
      id v11 = [v7 intent];
      v18 = [a1 contactIdsAssociatedWithContactsWidgetIntent:v11];
LABEL_14:

      goto LABEL_15;
    }
  }
  v18 = 0;
LABEL_15:

LABEL_16:
  return v18;
}

uint64_t __64__ATXSuggestionPreprocessor_contactIdsAssociatedWithSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 contactIdentifier];
}

uint64_t __64__ATXSuggestionPreprocessor_contactIdsAssociatedWithSuggestion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 contactIdentifier];
}

+ (id)contactIdsAssociatedWithContactsWidgetIntent:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = objc_msgSend(v3, "atx_nonNilParametersByName");
  uint64_t v6 = [v5 objectForKeyedSubscript:@"person"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [v7 identifier];

    if (v8)
    {
      id v9 = [v7 identifier];
      [v4 addObject:v9];
    }
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:@"people"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v6;
    id v23 = v3;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v16;
            v18 = [v17 identifier];

            if (v18)
            {
              char v19 = [v17 identifier];
              [v4 addObject:v19];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    uint64_t v6 = v22;
    id v3 = v23;
  }
  uint64_t v20 = objc_msgSend(v4, "copy", v22, v23, (void)v24);

  return v20;
}

- (BOOL)shouldFilterOutSuggestion:(id)a3 withBundleId:(id)a4 fromAppsThatCannotBeSuggested:(id)a5 fromAppsWhoseContentsCannotBeSuggested:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v9 executableSpecification];
  uint64_t v14 = [v13 executableType];

  if (v14 == 1)
  {
    uint64_t v15 = v11;
    goto LABEL_10;
  }
  uint64_t v16 = [v9 executableSpecification];
  if ([v16 executableType] != 3)
  {
    id v17 = [v9 executableSpecification];
    if ([v17 executableType] != 2)
    {
      v18 = [v9 executableSpecification];
      if ([v18 executableType] != 6)
      {
        uint64_t v20 = [v9 executableSpecification];
        uint64_t v21 = [v20 executableType];

        if (v21 != 10) {
          goto LABEL_13;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  uint64_t v15 = v12;
LABEL_10:
  if (([v15 containsObject:v10] & 1) == 0)
  {
LABEL_13:
    BOOL v19 = 0;
    goto LABEL_14;
  }
  BOOL v19 = 1;
LABEL_14:

  return v19;
}

- (id)suggestionsByPreprocessingRankedSuggestions:(id)a3 forConsumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = __atxlog_handle_blending();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 count];
    id v9 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
    *(_DWORD *)buf = 134218242;
    uint64_t v46 = v8;
    __int16 v47 = 2114;
    v48 = v9;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Preprocessing %lu suggestions for consumer subtype: %{public}@", buf, 0x16u);
  }
  id v10 = (void *)[v6 mutableCopy];
  if ((int)v4 <= 30)
  {
    if (v4 == 9 || v4 == 21)
    {
      id v22 = [(ATXEngagementRecordManager *)self->_engagementRecordManager engagedExecutablesOfType:32 queryOptions:0];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_47;
      v42[3] = &unk_1E68AE050;
      v42[4] = self;
      id v43 = v22;
      id v23 = v22;
      uint64_t v24 = objc_msgSend(v10, "_pas_filteredArrayWithTest:", v42);

      id v10 = (void *)v24;
    }
    else if (v4 == 22)
    {
      id v17 = [(ATXNotificationsLoggingServer *)self->_notificationsLoggingServer getLockscreenBundleIds];
      v18 = v17;
      if (v17) {
        id v19 = v17;
      }
      else {
        id v19 = (id)objc_opt_new();
      }
      long long v26 = v19;

      long long v27 = [(ATXLockscreenBlacklist *)self->_lockscreenBlacklist blacklist];
      v28 = v27;
      if (v27) {
        id v29 = v27;
      }
      else {
        id v29 = (id)objc_opt_new();
      }
      id v30 = v29;

      if ([(ATXLockscreenBlacklist *)self->_lockscreenBlacklist isPredictionGloballyDisabled])
      {

        id v31 = __atxlog_handle_blending();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "Blending: Filtering out all suggestions for lockscreen because lockscreen predictions are globally disabled", buf, 2u);
        }

        id v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_52;
        v37[3] = &unk_1E68B21B0;
        v37[4] = self;
        id v38 = v26;
        id v39 = v30;
        uint64_t v32 = objc_msgSend(v10, "_pas_filteredArrayWithTest:", v37);

        id v10 = (void *)v32;
      }
    }
  }
  else
  {
    if ((int)v4 <= 40)
    {
      if (v4 != 31)
      {
        if (v4 != 34) {
          goto LABEL_37;
        }
        id v11 = __atxlog_handle_blending();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Blending: Preprocessing suggestions for Home Screen.", buf, 2u);
        }

        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke;
        v44[3] = &unk_1E68AE0A0;
        v44[4] = self;
        id v12 = objc_msgSend(v10, "_pas_filteredArrayWithTest:", v44);
        uint64_t v13 = __atxlog_handle_blending();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [v10 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v46 = v14;
          _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Converting valid action suggestions to widget suggestions for %lu suggestions.", buf, 0xCu);
        }

        uint64_t v15 = [(ATXActionToWidgetConverter *)self->_converter convertSuggestions:v12];

        uint64_t v16 = __atxlog_handle_blending();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "ATXActionToWidgetConverter: Finished converting valid action suggestions to widget suggestions.", buf, 2u);
        }

        goto LABEL_26;
      }
      uint64_t v25 = [(ATXSuggestionPreprocessor *)self preprocessedSuggestionsForAppSwitcherConsumer:v10];
LABEL_25:
      uint64_t v15 = v25;

LABEL_26:
      id v10 = (void *)v15;
      goto LABEL_37;
    }
    if (v4 == 41)
    {
      uint64_t v25 = [(ATXSuggestionPreprocessor *)self preprocessedSuggestionsForMediaControlsConsumer:v10];
      goto LABEL_25;
    }
    if (v4 == 42)
    {
      uint64_t v20 = objc_opt_new();
      uint64_t v21 = [v20 convertSuggestions:v10];

      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_2;
      v40[3] = &unk_1E68AE358;
      v40[4] = self;
      char v41 = 42;
      id v10 = objc_msgSend(v21, "_pas_filteredArrayWithTest:", v40);
    }
  }
LABEL_37:
  v33 = __atxlog_handle_blending();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = [v10 count];
    uint64_t v35 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
    *(_DWORD *)buf = 134218242;
    uint64_t v46 = v34;
    __int16 v47 = 2114;
    v48 = v35;
    _os_log_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_DEFAULT, "Blending: Finished preprocessing. Left with %lu suggestions for consumer subtype: %{public}@", buf, 0x16u);
  }
  return v10;
}

uint64_t __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 executableSpecification];
  if ([v4 executableType] != 1) {
    goto LABEL_8;
  }
  uint64_t v5 = [v3 scoreSpecification];
  if ([v5 suggestedConfidenceCategory] <= 2)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v6 = [v3 bundleIdExecutableObject];
  int v7 = [v6 isEqualToString:@"com.apple.mobilesafari"];

  if (!v7)
  {
LABEL_9:
    if (([*(id *)(*(void *)(a1 + 32) + 40) uiSupportsSuggestion:v3 consumerSubType:34] & 1) != 0
      || ([*(id *)(*(void *)(a1 + 32) + 40) uiSupportsSuggestion:v3 consumerSubType:37] & 1) != 0)
    {
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 40) uiSupportsSuggestion:v3 consumerSubType:36];
    }
    goto LABEL_13;
  }
  uint64_t v8 = __atxlog_handle_blending();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Disallowing medium or high confidence Safari app prediction on Home Screen", v11, 2u);
  }

  uint64_t v9 = 0;
LABEL_13:

  return v9;
}

uint64_t __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_47(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) hasEngagedWithSuggestion:a2 engagedExecutables:*(void *)(a1 + 40)] ^ 1;
}

uint64_t __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![*(id *)(*(void *)(a1 + 32) + 40) uiSupportsSuggestion:v3 consumerSubType:42])goto LABEL_8; {
  uint64_t v4 = [v3 executableSpecification];
  }
  uint64_t v5 = [v4 executableClassString];
  id v6 = (objc_class *)objc_opt_class();
  int v7 = NSStringFromClass(v6);
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [v3 executableSpecification];
    id v10 = [v9 executableObject];

    id v11 = [v10 bundleID];
    uint64_t v12 = [v11 isEqualToString:@"com.apple.facetime"];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = __atxlog_handle_blending();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_2_cold_1(a1, (uint64_t)v3, v13);
      }
    }
  }
  else
  {
LABEL_8:
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 40) uiSupportsSuggestion:v3 consumerSubType:22])
  {
    uint64_t v4 = [v3 atxActionExecutableObject];
    uint64_t v5 = [v4 bundleId];
    if (!v5)
    {
      id v6 = __atxlog_handle_blending();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_52_cold_1((uint64_t)v3, v6);
      }
      goto LABEL_19;
    }
    if ([*(id *)(a1 + 40) containsObject:v5])
    {
      id v6 = __atxlog_handle_blending();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v3;
        int v7 = "Blending: Filtering out lockscreen suggestion because a notification from that app is already on the lockscreen: %@";
LABEL_18:
        _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, 0xCu);
      }
    }
    else if ([*(id *)(a1 + 48) containsObject:v5])
    {
      id v6 = __atxlog_handle_blending();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v3;
        int v7 = "Blending: Filtering out lockscreen suggestion because the app is in the lockscreen blacklist: %@";
        goto LABEL_18;
      }
    }
    else
    {
      char v9 = [*(id *)(*(void *)(a1 + 32) + 48) currentModeConfigurationAllowsSuggestion:v3];
      id v6 = __atxlog_handle_blending();
      BOOL v10 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v10)
        {
          int v12 = 138412290;
          id v13 = v3;
          _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Blending: Preprocessing allowing suggestion on lockscreen: %@", (uint8_t *)&v12, 0xCu);
        }
        uint64_t v8 = 1;
        goto LABEL_20;
      }
      if (v10)
      {
        int v12 = 138412290;
        id v13 = v3;
        int v7 = "Blending: Filtering out lockscreen suggestion because the app is not allowed in the current mode: %@";
        goto LABEL_18;
      }
    }
LABEL_19:
    uint64_t v8 = 0;
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v8 = 0;
LABEL_21:

  return v8;
}

- (id)preprocessedSuggestionsForMediaControlsConsumer:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_54_2);
}

uint64_t __77__ATXSuggestionPreprocessor_preprocessedSuggestionsForMediaControlsConsumer___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 executableSpecification];
  uint64_t v4 = [v3 executableType];

  if (v4 == 2)
  {
    uint64_t v5 = [v2 executableSpecification];
    id v6 = [v5 executableObject];

    int v7 = [v6 intent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)preprocessedSuggestionsForAppSwitcherConsumer:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__ATXSuggestionPreprocessor_preprocessedSuggestionsForAppSwitcherConsumer___block_invoke;
  v5[3] = &unk_1E68AE0A0;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v5);
  return v3;
}

uint64_t __75__ATXSuggestionPreprocessor_preprocessedSuggestionsForAppSwitcherConsumer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 executableSpecification];
  uint64_t v5 = [v4 executableObject];

  id v6 = [v3 uiSpecification];
  uint64_t v7 = [v6 predictionReasons];

  uint64_t v8 = 0;
  if (v7 && v7 != 1024 && v7 != 0x20000)
  {
    char v9 = [v3 scoreSpecification];
    uint64_t v10 = [v9 suggestedConfidenceCategory];

    if (v10 > 3)
    {
      uint64_t v8 = 1;
    }
    else if ((v7 & 0x54) != 0)
    {
      uint64_t v8 = [*(id *)(a1 + 32) _bundleSupportsINPlayMediaIntentForBundleId:v5 fromUnitTest:0];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_bundleSupportsINPlayMediaIntentForBundleId:(id)a3 fromUnitTest:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F4AF00] appInfoForBundle:a3];
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 supportedActions];
  char v9 = [v8 containsObject:v7];

  if (v9)
  {
    if (a4
      || ([v5 actionsRestrictedWhileLocked],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 containsObject:v7],
          v10,
          !v11))
    {
      BOOL v14 = 1;
      goto LABEL_11;
    }
    int v12 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      id v13 = "Prediction does not support %@ handling while device is locked.";
LABEL_8:
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    int v12 = __atxlog_handle_pmm();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v7;
      id v13 = "Prediction does not support %@.";
      goto LABEL_8;
    }
  }

  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)configurationDidChangeForFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeFilter, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_lockscreenBlacklist, 0);
  objc_storeStrong((id *)&self->_notificationsLoggingServer, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_converter, 0);
}

void __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 40)];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "Suppressing people suggestion for %@ because the bundleId isn't FaceTime. Suggestion: %@", (uint8_t *)&v6, 0x16u);
}

void __92__ATXSuggestionPreprocessor_suggestionsByPreprocessingRankedSuggestions_forConsumerSubType___block_invoke_52_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Blending: Filtering out lockscreen suggestion because unable to get actionBundleId: %@", (uint8_t *)&v2, 0xCu);
}

@end