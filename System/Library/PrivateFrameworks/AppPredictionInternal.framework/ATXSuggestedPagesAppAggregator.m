@interface ATXSuggestedPagesAppAggregator
- (ATXSuggestedPagesAppAggregator)init;
- (ATXSuggestedPagesAppAggregator)initWithSources:(id)a3;
- (id)_dockedApps;
- (id)_sortedApps:(id)a3 sortedFirstPageApps:(id)a4 appLaunchCounts:(id)a5;
- (id)_sortedAppsOnFirstHomeScreenPage;
- (id)provideAppsForSuggestedPageType:(int64_t)a3 candidateApps:(id)a4 environment:(id)a5;
- (int64_t)_sortApp1:(id)a3 app2:(id)a4 appLaunchCounts:(id)a5;
- (void)_dockedApps;
- (void)_sortedAppsOnFirstHomeScreenPage;
- (void)_validateApps:(id)a3 pageType:(int64_t)a4;
- (void)_validateApps:(id)a3 withAppLaunchCounts:(id)a4;
@end

@implementation ATXSuggestedPagesAppAggregator

- (ATXSuggestedPagesAppAggregator)init
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  v9 = objc_opt_new();
  v13[0] = v3;
  v13[1] = v4;
  v13[2] = v5;
  v13[3] = v6;
  v13[4] = v7;
  v13[5] = v8;
  v13[6] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:7];
  v11 = [(ATXSuggestedPagesAppAggregator *)self initWithSources:v10];

  return v11;
}

- (ATXSuggestedPagesAppAggregator)initWithSources:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXSuggestedPagesAppAggregator;
  v5 = [(ATXSuggestedPagesAppAggregator *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sources = v5->_sources;
    v5->_sources = (NSArray *)v6;

    uint64_t v8 = objc_opt_new();
    suggestedPagesTunableConstants = v5->_suggestedPagesTunableConstants;
    v5->_suggestedPagesTunableConstants = (ATXSuggestedPagesTunableConstants *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)provideAppsForSuggestedPageType:(int64_t)a3 candidateApps:(id)a4 environment:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v33 = a4;
  id v8 = a5;
  v9 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v32 = self;
  v10 = self->_sources;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v39;
    v14 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "provideAppsForSuggestedPageType:environment:", a3, v8, v32);
        v17 = (void *)v16;
        if (v16) {
          v18 = (void *)v16;
        }
        else {
          v18 = v14;
        }
        id v19 = v18;

        [v9 addObjectsFromArray:v19];
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v12);
  }

  if ([v33 count])
  {
    [v9 intersectSet:v33];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v20 = v33;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * j), "setPredictionSource:", @"User", v32);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v22);
    }

    [v9 unionSet:v20];
  }
  v25 = v32;
  -[ATXSuggestedPagesAppAggregator _validateApps:pageType:](v32, "_validateApps:pageType:", v9, a3, v32);
  v26 = [v8 appLaunchCounts];
  [(ATXSuggestedPagesAppAggregator *)v25 _validateApps:v9 withAppLaunchCounts:v26];

  v27 = [v9 array];
  v28 = [(ATXSuggestedPagesAppAggregator *)v25 _sortedAppsOnFirstHomeScreenPage];
  v29 = [v8 appLaunchCounts];
  v30 = [(ATXSuggestedPagesAppAggregator *)v25 _sortedApps:v27 sortedFirstPageApps:v28 appLaunchCounts:v29];

  return v30;
}

- (void)_validateApps:(id)a3 pageType:(int64_t)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  long long v39 = [(ATXSuggestedPagesAppAggregator *)self _dockedApps];
  uint64_t v8 = +[ATXSuggestedPagesUtils semanticTypeForSuggestedPageType:a4];
  long long v35 = (void *)v8;
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [MEMORY[0x1E4F4AF78] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "iOSAppDenyListForMode:", objc_msgSend(v9, "integerValue"));

    if ([v11 count]) {
      long long v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
    }
    else {
      long long v38 = 0;
    }
  }
  else
  {
    long long v38 = 0;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    CFStringRef v37 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v36 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v40 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1E4F4AF00];
        id v19 = [v17 bundleId];
        LOBYTE(v18) = [v18 isInstalledAndNotRestrictedForBundle:v19];

        if ((v18 & 1) == 0)
        {
          uint64_t v22 = __atxlog_handle_modes();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            uint64_t v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is not installed or restricted";
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        id v20 = (void *)MEMORY[0x1E4F4AF00];
        uint64_t v21 = [v17 bundleId];
        LODWORD(v20) = [v20 isHiddenFromSpringBoardWithBundleId:v21];

        if (v20)
        {
          uint64_t v22 = __atxlog_handle_modes();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            uint64_t v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is hidden from SpringBoard";
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        v25 = [v17 bundleId];
        int v26 = [v39 containsObject:v25];

        if (v26)
        {
          uint64_t v22 = __atxlog_handle_modes();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            uint64_t v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is already in the Dock";
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        v27 = [v17 bundleId];
        int v28 = [v38 containsObject:v27];

        if (v28)
        {
          uint64_t v22 = __atxlog_handle_modes();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            uint64_t v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is on silence list in Focus settings";
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        v29 = [v17 bundleId];
        v30 = (void *)CFPreferencesCopyValue(@"SBSearchSuggestAppDisabled", @"com.apple.spotlightui", v37, v36);
        int v31 = [v30 containsObject:v29];

        if (v31)
        {
          uint64_t v22 = __atxlog_handle_modes();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            uint64_t v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is turned off in Siri settings";
            goto LABEL_18;
          }
          goto LABEL_19;
        }
        v32 = (void *)MEMORY[0x1E4F4AF00];
        id v33 = [v17 bundleId];
        LODWORD(v32) = [v32 isInternalAppForBundleId:v33];

        if (v32)
        {
          uint64_t v22 = __atxlog_handle_modes();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v17;
            uint64_t v23 = v22;
            v24 = "ATXSuggestedPagesAppAggregator: app (%@) is an internal app";
LABEL_18:
            _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
          }
LABEL_19:

          [v7 addObject:v17];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v34 = [v12 countByEnumeratingWithState:&v40 objects:v46 count:16];
      uint64_t v14 = v34;
    }
    while (v34);
  }

  if ([v7 count]) {
    [v12 minusSet:v7];
  }
}

- (void)_validateApps:(id)a3 withAppLaunchCounts:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v27 = objc_opt_new();
  CFStringRef v36 = @"com.apple.Preferences";
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F4AEA0]) initWithRawLaunchCount:15 uniqueDaysLaunched:10];
  v37[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v30;
    *(void *)&long long v11 = 138412290;
    long long v26 = v11;
    obuint64_t j = v9;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "bundleId", v26);
        v17 = [v8 objectForKeyedSubscript:v16];
        v18 = v17;
        if (v17) {
          id v19 = v17;
        }
        else {
          id v19 = (id)[objc_alloc(MEMORY[0x1E4F4AEA0]) initWithRawLaunchCount:0 uniqueDaysLaunched:0];
        }
        id v20 = v19;

        uint64_t v21 = [v6 objectForKeyedSubscript:v16];
        uint64_t v22 = v21;
        if (v21) {
          id v23 = v21;
        }
        else {
          id v23 = (id)[objc_alloc(MEMORY[0x1E4F4AEA0]) initWithRawLaunchCount:0 uniqueDaysLaunched:0];
        }
        v24 = v23;

        if (([v24 isGreaterThanOrEqualToData:v20] & 1) == 0)
        {
          v25 = __atxlog_handle_modes();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            uint64_t v34 = v15;
            _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesAppAggregator: app (%@) does not meet launch count threshold", buf, 0xCu);
          }

          [v27 addObject:v15];
        }
      }
      id v9 = obj;
      uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v12);
  }

  if ([v27 count]) {
    [v9 minusSet:v27];
  }
}

- (id)_dockedApps
{
  v2 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F4B078]);
  id v8 = 0;
  id v4 = [v3 loadDockAppListWithError:&v8];
  id v5 = v8;
  if (v5)
  {
    id v6 = __atxlog_handle_modes();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(ATXSuggestedPagesAppAggregator *)(uint64_t)v5 _dockedApps];
    }
  }
  return v4;
}

- (id)_sortedAppsOnFirstHomeScreenPage
{
  v2 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F4B078]);
  id v13 = 0;
  id v4 = [v3 loadHomeScreenPageConfigurationsWithError:&v13];
  id v5 = v13;
  if (v5)
  {
    id v6 = __atxlog_handle_modes();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(ATXSuggestedPagesAppAggregator *)(uint64_t)v5 _sortedAppsOnFirstHomeScreenPage];
    }
    v7 = MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v8 = objc_opt_new();
    id v9 = [v4 firstObject];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__ATXSuggestedPagesAppAggregator__sortedAppsOnFirstHomeScreenPage__block_invoke;
    v11[3] = &unk_1E68AC850;
    v7 = v8;
    uint64_t v12 = v7;
    [v9 enumerateAppsConsideringFolders:0 block:v11];

    id v6 = v12;
  }

  return v7;
}

void __66__ATXSuggestedPagesAppAggregator__sortedAppsOnFirstHomeScreenPage__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 bundleId];
  [v2 addObject:v3];
}

- (id)_sortedApps:(id)a3 sortedFirstPageApps:(id)a4 appLaunchCounts:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = objc_msgSend(v9, "_pas_filteredArrayWithTest:", &__block_literal_global_19);
  unint64_t v12 = [v11 count];

  if ([v9 count]
    && (double v13 = (double)v12 / (double)(unint64_t)[v9 count],
        [(ATXSuggestedPagesTunableConstants *)self->_suggestedPagesTunableConstants maxRatioOfAppleAppsForFirstPageSorting], v13 <= v14))
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __82__ATXSuggestedPagesAppAggregator__sortedApps_sortedFirstPageApps_appLaunchCounts___block_invoke_3;
    v20[3] = &unk_1E68AC8C0;
    id v21 = v9;
    uint64_t v22 = self;
    id v23 = v10;
    id v18 = v10;
    uint64_t v16 = [v8 sortedArrayUsingComparator:v20];

    v17 = v21;
  }
  else
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __82__ATXSuggestedPagesAppAggregator__sortedApps_sortedFirstPageApps_appLaunchCounts___block_invoke_2;
    v24[3] = &unk_1E68AC898;
    v24[4] = self;
    id v25 = v10;
    id v15 = v10;
    uint64_t v16 = [v8 sortedArrayUsingComparator:v24];
    v17 = v25;
  }

  return v16;
}

BOOL __82__ATXSuggestedPagesAppAggregator__sortedApps_sortedFirstPageApps_appLaunchCounts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rangeOfString:@"com.apple." options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __82__ATXSuggestedPagesAppAggregator__sortedApps_sortedFirstPageApps_appLaunchCounts___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _sortApp1:a2 app2:a3 appLaunchCounts:*(void *)(a1 + 40)];
}

uint64_t __82__ATXSuggestedPagesAppAggregator__sortedApps_sortedFirstPageApps_appLaunchCounts___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  id v8 = [v5 bundleId];
  uint64_t v9 = [v7 indexOfObject:v8];

  id v10 = *(void **)(a1 + 32);
  long long v11 = [v6 bundleId];
  uint64_t v12 = [v10 indexOfObject:v11];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v14 = v9 == 0x7FFFFFFFFFFFFFFFLL;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = -1;
    }
    if (v14 && v12 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v17 = [*(id *)(a1 + 40) _sortApp1:v5 app2:v6 appLaunchCounts:*(void *)(a1 + 48)];
    }
  }
  else
  {
    id v15 = [NSNumber numberWithUnsignedInteger:v9];
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v12];
    uint64_t v17 = [v15 compare:v16];
  }
  return v17;
}

- (int64_t)_sortApp1:(id)a3 app2:(id)a4 appLaunchCounts:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 bundleId];
  long long v11 = [v7 objectForKeyedSubscript:v10];
  double v12 = (double)(unint64_t)[v11 rawLaunchCount];

  double v13 = [v8 bundleId];
  BOOL v14 = [v7 objectForKeyedSubscript:v13];

  double v15 = (double)(unint64_t)[v14 rawLaunchCount];
  uint64_t v16 = [v9 predictionSource];

  LODWORD(v13) = [v16 isEqualToString:@"Mode Entity"];
  if (v13) {
    double v12 = v12 / 10.0;
  }
  uint64_t v17 = [v8 predictionSource];

  int v18 = [v17 isEqualToString:@"Mode Entity"];
  double v19 = v15 / 10.0;
  if (!v18) {
    double v19 = v15;
  }
  id v20 = [NSNumber numberWithDouble:v19];
  id v21 = [NSNumber numberWithDouble:v12];
  int64_t v22 = [v20 compare:v21];

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPagesTunableConstants, 0);
  objc_storeStrong((id *)&self->_sources, 0);
}

- (void)_dockedApps
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesAppAggregator: could not fetch Dock apps: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_sortedAppsOnFirstHomeScreenPage
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesAppAggregator: could not load home screen configuration: %@", (uint8_t *)&v2, 0xCu);
}

@end