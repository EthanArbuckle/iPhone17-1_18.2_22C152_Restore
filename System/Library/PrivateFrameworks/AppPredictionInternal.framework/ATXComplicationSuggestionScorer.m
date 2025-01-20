@interface ATXComplicationSuggestionScorer
- (ATXComplicationSuggestionScorer)init;
- (BOOL)_isNewlyInstalledWidget:(id)a3 additionalData:(id)a4;
- (BOOL)_modularSetIsSuggestibleGivenAppScoreDictionary:(id)a3;
- (id)_appBundleIdsForComplicationDescriptors:(id)a3;
- (id)_decaySubsequentScoresFromSameBundleId:(id)a3 decayFactor:(double)a4;
- (id)_scoredComplicationsForInlineSetGivenDescriptors:(id)a3;
- (id)_scoredComplicationsForModularSetGivenDescriptors:(id)a3 appBundleIdScores:(id)a4 heuristicScores:(id)a5 widgetDescriptorsAdditionalData:(id)a6;
- (id)complicationDescriptorsForInlineSetGivenComplicationDescriptors:(id)a3;
- (id)complicationDescriptorsForModularSetGivenComplicationDescriptors:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6;
- (id)inputDescriptionForSignal:(id)a3 complicationDescriptors:(id)a4;
- (id)modelDescription;
- (id)scoredComplicationDescriptorsForModularSetGivenComplicationDescriptors:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6 checkEligibility:(BOOL)a7;
@end

@implementation ATXComplicationSuggestionScorer

- (ATXComplicationSuggestionScorer)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXComplicationSuggestionScorer;
  v2 = [(ATXComplicationSuggestionScorer *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    bundleIdsScorer = v2->_bundleIdsScorer;
    v2->_bundleIdsScorer = (ATXComplicationAppBundleIdsScorer *)v3;

    uint64_t v5 = objc_opt_new();
    heuristics = v2->_heuristics;
    v2->_heuristics = (ATXComplicationSuggestionHeuristics *)v5;
  }
  return v2;
}

- (id)complicationDescriptorsForModularSetGivenComplicationDescriptors:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6
{
  v6 = [(ATXComplicationSuggestionScorer *)self scoredComplicationDescriptorsForModularSetGivenComplicationDescriptors:a3 widgetDescriptorsAdditionalData:a4 aggregatedAppLaunchData:a5 bundleIdToCompanionBundleId:a6 checkEligibility:1];
  v7 = [v6 keysSortedByValueUsingComparator:&__block_literal_global_148];

  return v7;
}

uint64_t __184__ATXComplicationSuggestionScorer_complicationDescriptorsForModularSetGivenComplicationDescriptors_widgetDescriptorsAdditionalData_aggregatedAppLaunchData_bundleIdToCompanionBundleId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)complicationDescriptorsForInlineSetGivenComplicationDescriptors:(id)a3
{
  uint64_t v3 = [(ATXComplicationSuggestionScorer *)self scoredComplicationDescriptorsForInlineSetGivenComplicationDescriptors:a3];
  v4 = [v3 keysSortedByValueUsingComparator:&__block_literal_global_13_0];

  return v4;
}

uint64_t __99__ATXComplicationSuggestionScorer_complicationDescriptorsForInlineSetGivenComplicationDescriptors___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)scoredComplicationDescriptorsForModularSetGivenComplicationDescriptors:(id)a3 widgetDescriptorsAdditionalData:(id)a4 aggregatedAppLaunchData:(id)a5 bundleIdToCompanionBundleId:(id)a6 checkEligibility:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a5;
  v16 = [(ATXComplicationSuggestionScorer *)self _appBundleIdsForComplicationDescriptors:v12];
  v17 = [(ATXComplicationAppBundleIdsScorer *)self->_bundleIdsScorer scoredComplicationBundleIdsForModularSet:v16 aggregatedAppLaunchData:v15 bundleIdToCompanionBundleId:v14];

  if (v7
    && ![(ATXComplicationSuggestionScorer *)self _modularSetIsSuggestibleGivenAppScoreDictionary:v17])
  {
    v20 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v18 = [(ATXComplicationSuggestionHeuristics *)self->_heuristics complicationHeuristicsDictionary];
    v19 = [(ATXComplicationSuggestionScorer *)self _scoredComplicationsForModularSetGivenDescriptors:v12 appBundleIdScores:v17 heuristicScores:v18 widgetDescriptorsAdditionalData:v13];
    v20 = [(ATXComplicationSuggestionScorer *)self _decaySubsequentScoresFromSameBundleId:v19 decayFactor:0.2];
  }
  return v20;
}

- (id)_appBundleIdsForComplicationDescriptors:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
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
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "extensionIdentity", (void)v13);
        v11 = [v10 containerBundleIdentifier];

        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_decaySubsequentScoresFromSameBundleId:(id)a3 decayFactor:(double)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        long long v13 = [v7 objectForKeyedSubscript:v12];
        if (v13)
        {
          long long v14 = [v12 extensionIdentity];
          long long v15 = [v14 containerBundleIdentifier];

          if (v15)
          {
            long long v16 = [v6 valueForKey:v15];
            if (v16)
            {
              v17 = v16;
              objc_msgSend(v16, "insertObject:atIndex:", v13, objc_msgSend(v16, "indexOfObject:inSortedRange:options:usingComparator:", v13, 0, objc_msgSend(v16, "count"), 1024, &__block_literal_global_17_3));
            }
            else
            {
              v17 = objc_opt_new();
              [v17 addObject:v13];
              [v6 setObject:v17 forKeyedSubscript:v15];
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v9);
  }
  v34 = v6;

  uint64_t v18 = (void *)[v7 mutableCopy];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v7;
  uint64_t v19 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        v24 = [v23 extensionIdentity];
        v25 = [v24 containerBundleIdentifier];

        if (v25)
        {
          v26 = [v18 objectForKeyedSubscript:v23];
          v27 = [v34 valueForKey:v25];
          unint64_t v28 = [v27 indexOfObject:v26];
          v29 = NSNumber;
          [v26 doubleValue];
          v31 = objc_msgSend(v29, "numberWithDouble:", (double)(v30 * pow(a4, (double)v28)));
          [v18 setObject:v31 forKeyedSubscript:v23];
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v20);
  }

  return v18;
}

uint64_t __86__ATXComplicationSuggestionScorer__decaySubsequentScoresFromSameBundleId_decayFactor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)modelDescription
{
  return (id)[NSString stringWithFormat:@"Model: %@", @"uniqueDaysLaunched + rawLaunchCount / 5 + appPrior / 100 + hasHomescreenWidget * 3 + heursitics + complicationPrior / 100 + watchBundleIdCount * 2 + hyperRecentlyInstalled * 30"];
}

- (id)inputDescriptionForSignal:(id)a3 complicationDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  if (([v6 isEqualToString:@"appLaunchUniqueDays"] & 1) != 0
    || ([v6 isEqualToString:@"appLaunchTotalCount"] & 1) != 0
    || ([v6 isEqualToString:@"preConfiguredWidgets"] & 1) != 0
    || [v6 isEqualToString:@"appPriors"])
  {
    id v9 = [(ATXComplicationSuggestionScorer *)self _appBundleIdsForComplicationDescriptors:v7];
    uint64_t v10 = [(ATXComplicationAppBundleIdsScorer *)self->_bundleIdsScorer inputDescriptionForSignal:v6 complicationAppBundleIds:v9];
    v11 = (void *)v10;
    if (v10) {
      id v12 = (__CFString *)v10;
    }
    else {
      id v12 = &stru_1F2740B58;
    }
    [v8 appendString:v12];
LABEL_9:

    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"heuristics"])
  {
    [(ATXComplicationSuggestionHeuristics *)self->_heuristics flushCache];
    uint64_t v14 = [(ATXComplicationSuggestionHeuristics *)self->_heuristics description];
    long long v15 = (void *)v14;
    if (v14) {
      long long v16 = (__CFString *)v14;
    }
    else {
      long long v16 = &stru_1F2740B58;
    }
    [v8 appendString:v16];
LABEL_26:

    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"complicationPriors"])
  {
    long long v15 = +[ATXComplicationSuggestionParameters sharedInstance];
    v17 = [v15 modularComplicationsToPriorsMapping];
    uint64_t v18 = [v15 inlineComplicationsToPriorsMapping];
    [v8 appendString:@"Prior values for Modular Complications:\n"];
    uint64_t v19 = [v17 description];
    uint64_t v20 = (void *)v19;
    if (v19) {
      uint64_t v21 = (__CFString *)v19;
    }
    else {
      uint64_t v21 = &stru_1F2740B58;
    }
    [v8 appendString:v21];

    [v8 appendString:@"\n\nPrior values for Inline Complications:\n"];
    uint64_t v22 = [v18 description];
    v23 = (void *)v22;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    else {
      v24 = &stru_1F2740B58;
    }
    [v8 appendString:v24];

    goto LABEL_26;
  }
  if ([v6 isEqualToString:@"hyperRecency"])
  {
    v25 = [MEMORY[0x1E4F4B430] sharedInstance];
    id v30 = 0;
    v11 = [v25 fetchAccessoryWidgetDescriptorMetadataWithError:&v30];
    id v9 = v30;

    if (v9 || !v11)
    {
      [v8 appendString:@"Error while fetching widget install dates: "];
      uint64_t v26 = [v9 description];
      v27 = (void *)v26;
      unint64_t v28 = @"<Unknown error>";
    }
    else
    {
      [v8 appendString:@"Install Dates for Complication Descriptors:\n%"];
      uint64_t v26 = [v11 description];
      v27 = (void *)v26;
      unint64_t v28 = &stru_1F2740B58;
    }
    if (v26) {
      uint64_t v29 = v26;
    }
    else {
      uint64_t v29 = (uint64_t)v28;
    }
    [v8 appendString:v29];

    goto LABEL_9;
  }
  [v8 appendString:@"Unrecognized Signal"];
LABEL_10:

  return v8;
}

- (id)_scoredComplicationsForModularSetGivenDescriptors:(id)a3 appBundleIdScores:(id)a4 heuristicScores:(id)a5 widgetDescriptorsAdditionalData:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v49 = a4;
  id v10 = a5;
  id v11 = a6;
  id v47 = (id)objc_opt_new();
  id v12 = +[ATXComplicationSuggestionParameters sharedInstance];
  v46 = [v12 modularComplicationsToPriorsMapping];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v18 = [v17 extensionIdentity];
        uint64_t v19 = [v18 containerBundleIdentifier];

        double v20 = 0.0;
        double v21 = 0.0;
        if (v19)
        {
          uint64_t v22 = [v17 extensionIdentity];
          v23 = [v22 containerBundleIdentifier];
          v24 = [v49 objectForKeyedSubscript:v23];
          [v24 doubleValue];
          double v21 = v25;
        }
        uint64_t v26 = [v17 extensionBundleIdentifier];
        if (v26)
        {
          v27 = (void *)v26;
          unint64_t v28 = [v17 kind];

          if (v28)
          {
            id v29 = [NSString alloc];
            id v30 = [v17 extensionBundleIdentifier];
            v31 = [v17 kind];
            v32 = (void *)[v29 initWithFormat:@"%@:%@", v30, v31];

            v33 = [v46 objectForKeyedSubscript:v32];
            [v33 doubleValue];
            double v20 = v34 / 100.0;
          }
        }
        id v35 = objc_alloc(MEMORY[0x1E4F4B440]);
        long long v36 = [v17 extensionBundleIdentifier];
        long long v37 = [v17 kind];
        long long v38 = (void *)[v35 initWithExtensionBundleId:v36 kind:v37];

        long long v39 = [v10 objectForKeyedSubscript:v38];
        LOBYTE(v37) = [v39 unsignedIntValue];

        double v40 = v20
            + (double)+[ATXComplicationSuggestionHeuristics scoreFromConfidence:v37];
        BOOL v41 = [(ATXComplicationSuggestionScorer *)self _isNewlyInstalledWidget:v17 additionalData:v11];
        double v42 = v40 + 30.0;
        if (!v41) {
          double v42 = v40;
        }
        double v43 = v21 + v42;
        if (v43 > 0.0)
        {
          v44 = [NSNumber numberWithDouble:v43 + (double)arc4random_uniform(0x64u) * 0.01];
          [v47 setObject:v44 forKeyedSubscript:v17];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v14);
  }

  return v47;
}

- (id)_scoredComplicationsForInlineSetGivenDescriptors:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = +[ATXComplicationSuggestionParameters sharedInstance];
  v24 = [v5 inlineComplicationsToPriorsMapping];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v12 = [v11 extensionBundleIdentifier];
        double v13 = 0.0;
        if (v12)
        {
          uint64_t v14 = (void *)v12;
          uint64_t v15 = [v11 kind];

          if (v15)
          {
            id v16 = [NSString alloc];
            v17 = [v11 extensionBundleIdentifier];
            uint64_t v18 = [v11 kind];
            uint64_t v19 = (void *)[v16 initWithFormat:@"%@:%@", v17, v18];

            double v20 = [v24 objectForKeyedSubscript:v19];
            [v20 doubleValue];
            double v13 = v21 / 10.0;
          }
        }
        uint64_t v22 = [NSNumber numberWithDouble:v13 + 0.0];
        [v4 setObject:v22 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  return v4;
}

- (BOOL)_modularSetIsSuggestibleGivenAppScoreDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v8 doubleValue];
        double v10 = v9;

        if (v10 > v6) {
          double v6 = v10;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
    LOBYTE(v4) = v6 >= 11.0;
  }

  return v4;
}

- (BOOL)_isNewlyInstalledWidget:(id)a3 additionalData:(id)a4
{
  if (!a4) {
    return 0;
  }
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F4B440];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithDescriptor:v7];

  double v9 = [v6 objectForKeyedSubscript:v8];

  if (v9)
  {
    double v10 = [v9 installDate];
    if (!v10) {
      goto LABEL_5;
    }
    id v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    long long v12 = [MEMORY[0x1E4F1C9C8] now];
    long long v13 = [v11 dateByAddingUnit:16 value:-1 toDate:v12 options:0];

    uint64_t v14 = [v13 compare:v10];
    if (v14 == -1) {
      BOOL v15 = 1;
    }
    else {
LABEL_5:
    }
      BOOL v15 = 0;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristics, 0);
  objc_storeStrong((id *)&self->_bundleIdsScorer, 0);
}

@end