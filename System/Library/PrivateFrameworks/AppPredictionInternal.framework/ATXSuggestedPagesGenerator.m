@interface ATXSuggestedPagesGenerator
- (ATXSuggestedPagesGenerator)init;
- (ATXSuggestedPagesGenerator)initWithWidgetAggregator:(id)a3 appAggregator:(id)a4 descriptorCache:(id)a5;
- (ATXSuggestedPagesTunableConstants)tunableConstants;
- (NSDictionary)appLaunchCounts;
- (NSSet)suggestedApps;
- (id)_validatedWidgets:(id)a3 bundleIdsToLaunches:(id)a4;
- (id)generateSuggestedPagesForPageType:(int64_t)a3 layoutOptions:(id)a4;
- (unint64_t)_suggestAppsFromPool:(id)a3 forPage:(id)a4 type:(int64_t)a5 numberOfAppsNecessary:(unint64_t)a6;
- (unint64_t)_suggestShortcutsFromPool:(id)a3 forPage:(id)a4 type:(int64_t)a5 numberOfShortcutsNecessary:(unint64_t)a6;
- (unint64_t)_suggestStacksFromPool:(id)a3 forPage:(id)a4 type:(int64_t)a5 layout:(id)a6 numberOfColumns:(unint64_t)a7;
@end

@implementation ATXSuggestedPagesGenerator

- (ATXSuggestedPagesGenerator)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [MEMORY[0x1E4F4B430] sharedInstance];
  v6 = [(ATXSuggestedPagesGenerator *)self initWithWidgetAggregator:v3 appAggregator:v4 descriptorCache:v5];

  return v6;
}

- (ATXSuggestedPagesGenerator)initWithWidgetAggregator:(id)a3 appAggregator:(id)a4 descriptorCache:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)ATXSuggestedPagesGenerator;
  v12 = [(ATXSuggestedPagesGenerator *)&v30 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_widgetAggregator, a3);
    objc_storeStrong((id *)&v13->_appAggregator, a4);
    objc_storeStrong((id *)&v13->_descriptorCache, a5);
    uint64_t v14 = objc_opt_new();
    tunableConstants = v13->_tunableConstants;
    v13->_tunableConstants = (ATXSuggestedPagesTunableConstants *)v14;

    id v16 = objc_alloc_init(MEMORY[0x1E4F4AED0]);
    uint64_t v17 = [v16 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];
    appLaunchCounts = v13->_appLaunchCounts;
    v13->_appLaunchCounts = (NSDictionary *)v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4F4B078]);
    id v29 = 0;
    v20 = [v19 loadHomeScreenPageConfigurationsIncludingHidden:0 error:&v29];
    id v21 = v29;
    v22 = [v20 firstObject];

    if (!v22)
    {
      v23 = __atxlog_handle_modes();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[ATXSuggestedPagesGenerator initWithWidgetAggregator:appAggregator:descriptorCache:]((uint64_t)v21, v23);
      }
    }
    uint64_t v24 = [v22 maxPortraitRows];
    uint64_t v25 = 6;
    if (v24) {
      uint64_t v25 = v24;
    }
    v13->_cachedHomeScreenRows = v25;
    uint64_t v26 = [v22 maxPortraitColumns];
    uint64_t v27 = 4;
    if (v26) {
      uint64_t v27 = v26;
    }
    v13->_cachedHomeScreenColumns = v27;
  }
  return v13;
}

- (id)generateSuggestedPagesForPageType:(int64_t)a3 layoutOptions:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v57 = a4;
  v6 = __atxlog_handle_modes();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = __atxlog_handle_modes();
  id v9 = v8;
  os_signpost_id_t spid = v7;
  unint64_t v56 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    NSStringFromATXSuggestedPageType();
    id v10 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v71 = [v10 UTF8String];
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v9, OS_SIGNPOST_INTERVAL_BEGIN, spid, "generateSuggestedHomeScreenPage", "Type=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }
  v62 = objc_opt_new();
  v69[0] = v62;
  id obja = (id)objc_opt_new();
  v69[1] = obja;
  v58 = objc_opt_new();
  v69[2] = v58;
  id v11 = objc_opt_new();
  v69[3] = v11;
  v12 = objc_opt_new();
  v69[4] = v12;
  v13 = objc_opt_new();
  v69[5] = v13;
  uint64_t v14 = objc_opt_new();
  v69[6] = v14;
  v15 = objc_opt_new();
  v69[7] = v15;
  id v16 = objc_opt_new();
  v69[8] = v16;
  uint64_t v17 = objc_opt_new();
  v69[9] = v17;
  v18 = objc_opt_new();
  v69[10] = v18;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:11];

  id v19 = objc_opt_new();
  appAggregator = self->_appAggregator;
  id v21 = [v57 candidateApps];
  uint64_t v22 = [(ATXSuggestedPagesAppAggregator *)appAggregator provideAppsForSuggestedPageType:a3 candidateApps:v21 environment:self];

  id v23 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v59 = (void *)v22;
  if (v22) {
    uint64_t v24 = v22;
  }
  else {
    uint64_t v24 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v25 = (NSSet *)[v23 initWithArray:v24];
  suggestedApps = self->_suggestedApps;
  self->_suggestedApps = v25;

  uint64_t v27 = [(ATXSuggestedPagesWidgetAggregator *)self->_widgetAggregator provideWidgetsForPageType:a3 environment:self];
  v63 = [(ATXSuggestedPagesGenerator *)self _validatedWidgets:v27 bundleIdsToLaunches:self->_appLaunchCounts];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v55;
  uint64_t v28 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v65 != v30) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        id v33 = objc_alloc_init(MEMORY[0x1E4F4B098]);
        [v33 setSuggestedPageType:a3];
        objc_msgSend(v33, "setPageIndex:", objc_msgSend(v19, "count"));
        v34 = [MEMORY[0x1E4F29128] UUID];
        v35 = [v34 UUIDString];
        [v33 setUniqueIdentifier:v35];

        unint64_t cachedHomeScreenRows = self->_cachedHomeScreenRows;
        unint64_t cachedHomeScreenColumns = self->_cachedHomeScreenColumns;
        unint64_t v38 = [(ATXSuggestedPagesGenerator *)self _suggestStacksFromPool:v63 forPage:v33 type:a3 layout:v32 numberOfColumns:cachedHomeScreenColumns];
        if (v38 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v39 = cachedHomeScreenColumns * cachedHomeScreenRows - v38;
          uint64_t v40 = [v32 maxAppRowsForPageType:a3];
          if (v40) {
            unint64_t v41 = self->_cachedHomeScreenColumns * v40 >= v39 ? v39 : self->_cachedHomeScreenColumns * v40;
          }
          else {
            unint64_t v41 = v39;
          }
          unint64_t v42 = [(ATXSuggestedPagesGenerator *)self _suggestAppsFromPool:v59 forPage:v33 type:a3 numberOfAppsNecessary:v41];
          unint64_t v43 = [(ATXSuggestedPagesGenerator *)self _suggestShortcutsFromPool:MEMORY[0x1E4F1CBF0] forPage:v33 type:a3 numberOfShortcutsNecessary:v39 - v42]+ v42;
          if (v43 >= [v32 minNecessaryLeafIconsForPageType:a3])
          {
            v44 = [v33 leafIcons];
            if ([v44 count])
            {
            }
            else
            {
              v45 = [v33 stacks];
              uint64_t v46 = [v45 count];

              if (!v46) {
                goto LABEL_23;
              }
            }
            [v19 addObject:v33];
          }
        }
LABEL_23:
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
    }
    while (v29);
  }

  unint64_t v47 = [v19 count];
  if (v47 > [(ATXSuggestedPagesTunableConstants *)self->_tunableConstants maxSuggestedPages]) {
    objc_msgSend(v19, "removeObjectsInRange:", -[ATXSuggestedPagesTunableConstants maxSuggestedPages](self->_tunableConstants, "maxSuggestedPages") - 1, objc_msgSend(v19, "count")- -[ATXSuggestedPagesTunableConstants maxSuggestedPages](self->_tunableConstants, "maxSuggestedPages"));
  }
  v48 = self->_suggestedApps;
  self->_suggestedApps = 0;

  v49 = __atxlog_handle_modes();
  v50 = v49;
  if (v56 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    NSStringFromATXSuggestedPageType();
    id v51 = objc_claimAutoreleasedReturnValue();
    uint64_t v52 = [v51 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v71 = v52;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v50, OS_SIGNPOST_INTERVAL_END, spid, "generateSuggestedHomeScreenPage", "Type=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ", buf, 0xCu);
  }
  return v19;
}

- (unint64_t)_suggestStacksFromPool:(id)a3 forPage:(id)a4 type:(int64_t)a5 layout:(id)a6 numberOfColumns:(unint64_t)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = [v13 makeStacksFromWidgets:a3 pageType:a5 environment:self];
  if (v14)
  {
    [v13 layOutStacks:v14 numberOfColumns:a7 forPageType:a5];
    [v12 setStacks:v14];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      unint64_t v18 = 0;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v15);
          }
          v18 += objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "numberOfLeafIconSpots", (void)v22);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }
    else
    {
      unint64_t v18 = 0;
    }
  }
  else
  {
    unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v18;
}

- (unint64_t)_suggestShortcutsFromPool:(id)a3 forPage:(id)a4 type:(int64_t)a5 numberOfShortcutsNecessary:(unint64_t)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (a6)
  {
    unint64_t v12 = [v10 count];
    if (v12 >= a6) {
      unint64_t v13 = a6;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v14 = objc_msgSend(v10, "subarrayWithRange:", 0, v13);
    id v15 = [v11 leafIcons];
    uint64_t v16 = (void *)[v15 mutableCopy];
    uint64_t v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = (id)objc_opt_new();
    }
    v20 = v18;

    uint64_t v21 = [v14 count];
    if (v21 == [v10 count])
    {
      [v20 addObjectsFromArray:v14];
    }
    else
    {
      unint64_t v22 = [v14 count];
      if (v22 >= [v10 count])
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:a2, self, @"ATXSuggestedPagesGenerator.m", 203, @"Invalid parameter not satisfying: %@", @"shortcutsThatFit.count < shortcuts.count" object file lineNumber description];
      }
      long long v23 = objc_msgSend(v14, "subarrayWithRange:", 0, objc_msgSend(v14, "count") - 1);
      [v20 addObjectsFromArray:v23];
      long long v24 = objc_msgSend(v10, "subarrayWithRange:", objc_msgSend(v23, "count"), objc_msgSend(v10, "count") - objc_msgSend(v23, "count"));
      long long v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v26 = [v25 localizedStringForKey:@"SHORTCUTS_FOLDER_TITLE" value:&stru_1F2740B58 table:0];

      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F4B090]) initWithContents:v24];
      id v28 = objc_alloc(MEMORY[0x1E4F4B088]);
      v33[0] = v27;
      uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
      uint64_t v30 = (void *)[v28 initWithFolderPages:v29 name:v26];

      [v20 addObject:v30];
    }
    [v11 setLeafIcons:v20];
    unint64_t v19 = [v14 count];
  }
  else
  {
    unint64_t v19 = 0;
  }

  return v19;
}

- (unint64_t)_suggestAppsFromPool:(id)a3 forPage:(id)a4 type:(int64_t)a5 numberOfAppsNecessary:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  unint64_t v12 = [v10 leafIcons];

  if (v12)
  {
    unint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"ATXSuggestedPagesGenerator.m" lineNumber:223 description:@"Leaf icons should be nil by now"];
  }
  [v10 setCandidateApps:v11];
  unint64_t v13 = [v11 count];
  if (v13 >= a6) {
    unint64_t v14 = a6;
  }
  else {
    unint64_t v14 = v13;
  }
  id v15 = objc_msgSend(v11, "subarrayWithRange:", 0, v14);

  [v10 setLeafIcons:v15];
  uint64_t v16 = [v10 leafIcons];

  unint64_t v17 = [v16 count];
  return v17;
}

- (id)_validatedWidgets:(id)a3 bundleIdsToLaunches:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v22 = @"com.apple.Fitness";
  os_signpost_id_t v7 = (objc_class *)MEMORY[0x1E4F4AEA0];
  id v8 = a3;
  id v9 = (void *)[[v7 alloc] initWithRawLaunchCount:0 uniqueDaysLaunched:0];
  v23[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];

  id v11 = objc_opt_new();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__ATXSuggestedPagesGenerator__validatedWidgets_bundleIdsToLaunches___block_invoke;
  v17[3] = &unk_1E68AFE20;
  id v18 = v11;
  unint64_t v19 = self;
  id v20 = v10;
  id v21 = v6;
  id v12 = v6;
  id v13 = v10;
  id v14 = v11;
  id v15 = objc_msgSend(v8, "_pas_filteredArrayWithTest:", v17);

  return v15;
}

uint64_t __68__ATXSuggestedPagesGenerator__validatedWidgets_bundleIdsToLaunches___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 appBundleId];
  if (![v4 length]) {
    goto LABEL_6;
  }
  if ((ATXBundleIdIsFakeContainerBundleId() & 1) == 0)
  {
    if (![MEMORY[0x1E4F4AF00] isInstalledAndNotRestrictedForBundle:v4]
      || ([*(id *)(a1 + 32) bundleIdIsLockedOrHiddenByUserPreference:v4] & 1) != 0)
    {
LABEL_6:
      uint64_t v5 = 0;
      goto LABEL_7;
    }
    os_signpost_id_t v7 = [*(id *)(*(void *)(a1 + 40) + 24) homeScreenDescriptorForWidget:v3];
    id v8 = v7;
    if (v7
      && ([v7 disfavoredFamiliesForLocation:0],
          [v3 size],
          CHSWidgetFamilyFromATXStackLayoutSize(),
          CHSWidgetFamilyMaskContainsFamily()))
    {
      id v9 = __atxlog_handle_modes();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        unint64_t v19 = v4;
        _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesGenerator: not allowing widget for %@ because it is disfavored for home screen", (uint8_t *)&v18, 0xCu);
      }
      uint64_t v5 = 0;
    }
    else
    {
      if (![v3 requiresAppLaunch])
      {
        uint64_t v5 = 1;
LABEL_27:

        goto LABEL_7;
      }
      id v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      id v11 = v10;
      if (v10) {
        id v12 = v10;
      }
      else {
        id v12 = [objc_alloc(MEMORY[0x1E4F4AEA0]) initWithRawLaunchCount:1 uniqueDaysLaunched:0];
      }
      id v9 = v12;

      id v13 = [*(id *)(a1 + 56) objectForKeyedSubscript:v4];
      id v14 = v13;
      if (v13) {
        id v15 = v13;
      }
      else {
        id v15 = (id)[objc_alloc(MEMORY[0x1E4F4AEA0]) initWithRawLaunchCount:0 uniqueDaysLaunched:0];
      }
      uint64_t v16 = v15;

      uint64_t v5 = [v16 isGreaterThanOrEqualToData:v9];
      if ((v5 & 1) == 0)
      {
        unint64_t v17 = __atxlog_handle_modes();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412802;
          unint64_t v19 = v4;
          __int16 v20 = 2114;
          id v21 = v16;
          __int16 v22 = 2114;
          long long v23 = v9;
          _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "ATXSuggestedPagesGenerator: not allowing widget for %@ because %{public}@ is not greater than or equal to: %{public}@", (uint8_t *)&v18, 0x20u);
        }
      }
    }

    goto LABEL_27;
  }
  uint64_t v5 = 1;
LABEL_7:

  return v5;
}

- (NSDictionary)appLaunchCounts
{
  return self->_appLaunchCounts;
}

- (NSSet)suggestedApps
{
  return self->_suggestedApps;
}

- (ATXSuggestedPagesTunableConstants)tunableConstants
{
  return self->_tunableConstants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tunableConstants, 0);
  objc_storeStrong((id *)&self->_suggestedApps, 0);
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
  objc_storeStrong((id *)&self->_appAggregator, 0);
  objc_storeStrong((id *)&self->_widgetAggregator, 0);
}

- (void)initWithWidgetAggregator:(uint64_t)a1 appAggregator:(NSObject *)a2 descriptorCache:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Could not load Home Screen config to find layout info: %@", (uint8_t *)&v2, 0xCu);
}

@end