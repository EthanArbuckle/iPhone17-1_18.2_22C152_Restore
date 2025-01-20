@interface ATXDegenerateStackAnalyzer
- (ATXDegenerateStackAnalyzer)init;
- (ATXDegenerateStackAnalyzer)initWithInformationStore:(id)a3;
- (BOOL)_hasWidgetHadTimelineDonations:(id)a3 startDate:(id)a4;
- (BOOL)_isWidgetEligibleForHeuristicFallback:(id)a3;
- (BOOL)_wouldBlendingDeduplicateWidget:(id)a3 inStack:(id)a4 againstOtherWidgetsOnPage:(id)a5;
- (BOOL)areAllSmartStacksPossiblyDegenerateInPages:(id)a3 usingTimelineEntriesSinceDate:(id)a4;
- (BOOL)isSmartStackPossiblyDegenerate:(id)a3 onPage:(id)a4 usingTimelineEntriesSinceDate:(id)a5;
- (id)_simulatedInfoSuggestionForWidget:(id)a3;
@end

@implementation ATXDegenerateStackAnalyzer

- (ATXDegenerateStackAnalyzer)init
{
  v3 = [MEMORY[0x1E4F4B0E8] sharedInstance];
  v4 = [(ATXDegenerateStackAnalyzer *)self initWithInformationStore:v3];

  return v4;
}

- (ATXDegenerateStackAnalyzer)initWithInformationStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXDegenerateStackAnalyzer;
  v6 = [(ATXDegenerateStackAnalyzer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_informationStore, a3);
    uint64_t v8 = objc_opt_new();
    deduplicator = v7->_deduplicator;
    v7->_deduplicator = (ATXSuggestionDeduplicator *)v8;
  }
  return v7;
}

- (BOOL)_isWidgetEligibleForHeuristicFallback:(id)a3
{
  id v3 = a3;
  v4 = [v3 appBundleId];
  char v5 = [v4 isEqualToString:@"com.apple.weather"];

  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    v7 = [v3 appBundleId];
    if ([v7 isEqualToString:@"com.apple.gamecenter.widgets"])
    {
      uint64_t v8 = [v3 widgetKind];
      char v6 = [v8 isEqualToString:@"FriendsArePlayingWidget"];
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6;
}

- (BOOL)_hasWidgetHadTimelineDonations:(id)a3 startDate:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 size];
  if (v8 > 4) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_1D142BE90[v8];
  }
  id v10 = objc_alloc(MEMORY[0x1E4F58DD8]);
  id v11 = objc_alloc(MEMORY[0x1E4F58CC0]);
  v12 = [v6 extensionBundleId];
  v13 = [v6 appBundleId];
  v14 = (void *)[v11 initWithExtensionBundleIdentifier:v12 containerBundleIdentifier:v13 deviceIdentifier:0];
  uint64_t v15 = [v6 widgetKind];
  v16 = (void *)v15;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  else {
    v17 = &stru_1F2740B58;
  }
  v18 = (void *)[v10 initWithExtensionIdentity:v14 kind:v17 family:v9 intent:0 activityIdentifier:0];

  [(ATXInformationStore *)self->_informationStore fetchTimelineEntriesForWidget:v18 sinceDate:v7];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "timelineEntry", (void)v28);
        v24 = [v23 relevance];
        [v24 score];
        double v26 = v25;

        if (v26 > 0.00000011920929)
        {
          LOBYTE(v20) = 1;
          goto LABEL_17;
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v20;
}

- (id)_simulatedInfoSuggestionForWidget:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F938F0];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 appBundleId];
  id v7 = (void *)v6;
  if (v6) {
    unint64_t v8 = (__CFString *)v6;
  }
  else {
    unint64_t v8 = &stru_1F2740B58;
  }
  uint64_t v9 = [v4 extensionBundleId];
  id v10 = [v4 widgetKind];
  id v11 = [v4 intent];

  v12 = (void *)[v5 initWithAppBundleIdentifier:v8 widgetBundleIdentifier:v9 widgetKind:v10 criterion:@"criterion" applicableLayouts:24 suggestionIdentifier:0 startDate:0 endDate:0 intent:v11 metadata:0 relevanceScore:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F93950]) initWithExecutableObject:v12 executableDescription:@"description" executableIdentifier:@"identifier" suggestionExecutableType:3];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:@"simulated_suggestion" clientModelVersion:@"1" engagementResetPolicy:1];
  id v15 = objc_alloc(MEMORY[0x1E4F93978]);
  LOWORD(v20) = 0;
  v16 = objc_msgSend(v15, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", 0, 0, 0, MEMORY[0x1E4F1CBF0], 0, 0, v20);
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:0 suggestedConfidenceCategory:0.0];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v14 executableSpecification:v13 uiSpecification:v16 scoreSpecification:v17];

  return v18;
}

- (BOOL)_wouldBlendingDeduplicateWidget:(id)a3 inStack:(id)a4 againstOtherWidgetsOnPage:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(ATXDegenerateStackAnalyzer *)self _simulatedInfoSuggestionForWidget:a3];
  deduplicator = self->_deduplicator;
  v12 = [v9 identifier];

  LOBYTE(v9) = [(ATXSuggestionDeduplicator *)deduplicator widgetSuggestionIsPinned:v10 homeScreenPage:v8 excludingStackConfigId:v12];
  return (char)v9;
}

- (BOOL)isSmartStackPossiblyDegenerate:(id)a3 onPage:(id)a4 usingTimelineEntriesSinceDate:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v22 = a5;
  if (([v9 allowsSmartRotate] & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"ATXDegenerateStackAnalyzer.m", 130, @"Invalid parameter not satisfying: %@", @"stack.allowsSmartRotate" object file lineNumber description];
  }
  id v11 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v12 = [v9 widgets];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1D25F6CC0]();
        if (![(ATXDegenerateStackAnalyzer *)self _wouldBlendingDeduplicateWidget:v17 inStack:v9 againstOtherWidgetsOnPage:v10]&& ([(ATXDegenerateStackAnalyzer *)self _isWidgetEligibleForHeuristicFallback:v17]|| [(ATXDegenerateStackAnalyzer *)self _hasWidgetHadTimelineDonations:v17 startDate:v22]))
        {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  BOOL v19 = (unint64_t)[v11 count] < 2;
  return v19;
}

- (BOOL)areAllSmartStacksPossiblyDegenerateInPages:(id)a3 usingTimelineEntriesSinceDate:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v6;
  uint64_t v21 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v9 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v8);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v12 = objc_msgSend(v11, "stacks", v20);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              if ([v17 allowsSmartRotate]
                && ![(ATXDegenerateStackAnalyzer *)self isSmartStackPossiblyDegenerate:v17 onPage:v11 usingTimelineEntriesSinceDate:v7])
              {

                BOOL v18 = 0;
                goto LABEL_20;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v20;
      }
      BOOL v18 = 1;
      uint64_t v21 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }
  else
  {
    BOOL v18 = 1;
  }
LABEL_20:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deduplicator, 0);
  objc_storeStrong((id *)&self->_informationStore, 0);
}

@end