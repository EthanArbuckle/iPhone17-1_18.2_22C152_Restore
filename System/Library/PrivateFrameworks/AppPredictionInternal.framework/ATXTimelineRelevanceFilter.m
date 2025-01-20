@interface ATXTimelineRelevanceFilter
+ (id)applyLimitsToTimelineSuggestions:(id)a3 forWidget:(id)a4 withTimelineEntryDelegate:(id)a5 abuseControlConfig:(id)a6;
+ (id)filteredAndSortedTimelineEntriesForWidget:(id)a3 entries:(id)a4 withTimelineEntryDelegate:(id)a5 abuseControlConfig:(id)a6;
@end

@implementation ATXTimelineRelevanceFilter

+ (id)filteredAndSortedTimelineEntriesForWidget:(id)a3 entries:(id)a4 withTimelineEntryDelegate:(id)a5 abuseControlConfig:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_opt_new();
  v14 = [v9 atxTimelineIdentifier];
  v15 = [v9 extensionIdentity];
  v16 = [v15 containerBundleIdentifier];
  unint64_t v17 = [v11 countOfInfoSuggestionsForBundleId:v16];

  if (v17 > [v12 timelineUpdateLimitPerAppBundleId])
  {
    v18 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v9 extensionIdentity];
      v20 = [v19 containerBundleIdentifier];
      *(_DWORD *)buf = 138412802;
      uint64_t v40 = (uint64_t)v20;
      __int16 v41 = 2048;
      unint64_t v42 = v17;
      __int16 v43 = 2048;
      uint64_t v44 = [v12 timelineUpdateLimitPerAppBundleId];
      _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineEntryFilter: Filtering out timeline update since the total number of entries for bundleId %@: %llu has exceeded limit (%lu)", buf, 0x20u);
    }
LABEL_7:

    id v22 = v13;
    goto LABEL_15;
  }
  unint64_t v21 = [v11 countOfInfoSuggestionsForSourceId:v14];
  if (v21 > [v12 timelineUpdateLimitPerSource])
  {
    v18 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v40 = (uint64_t)v14;
      __int16 v41 = 2048;
      unint64_t v42 = v21;
      __int16 v43 = 2048;
      uint64_t v44 = [v12 timelineUpdateLimitPerSource];
      _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineEntryFilter: Filtering out timeline update since the total number of entries for sourceId %@: %llu has exceeded limit (%lu)", buf, 0x20u);
    }
    goto LABEL_7;
  }
  v23 = [v11 latestUpdateDateForSourceId:v14];
  if (v23
    && ([MEMORY[0x1E4F1C9C8] now],
        v24 = objc_claimAutoreleasedReturnValue(),
        [v24 timeIntervalSinceDate:v23],
        double v26 = v25,
        double v27 = (double)(unint64_t)[v12 minimumSecondsBetweenMetadataUpdatesPerSource],
        v24,
        v26 < v27))
  {
    v28 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = [v12 minimumSecondsBetweenMetadataUpdatesPerSource];
      v29 = [MEMORY[0x1E4F1C9C8] now];
      [v29 timeIntervalSinceDate:v23];
      *(_DWORD *)buf = 134218498;
      uint64_t v40 = v35;
      __int16 v41 = 2112;
      unint64_t v42 = (unint64_t)v14;
      __int16 v43 = 1024;
      LODWORD(v44) = (int)v30;
      _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineEntryFilter: Rate limiting limits reloads to one per %lu seconds. Filtering out timeline update for source %@ since the last update was %d seconds ago", buf, 0x1Cu);
    }
    id v22 = v13;
  }
  else
  {
    v31 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:1];
    v38 = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    v33 = [v10 sortedArrayUsingDescriptors:v32];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __125__ATXTimelineRelevanceFilter_filteredAndSortedTimelineEntriesForWidget_entries_withTimelineEntryDelegate_abuseControlConfig___block_invoke;
    v36[3] = &unk_1E68B1790;
    id v37 = v9;
    objc_msgSend(v33, "_pas_filteredArrayWithTest:", v36);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  return v22;
}

BOOL __125__ATXTimelineRelevanceFilter_filteredAndSortedTimelineEntriesForWidget_entries_withTimelineEntryDelegate_abuseControlConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 date];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;
  v7 = [v3 relevance];

  [v7 duration];
  double v9 = v6 + v8;

  id v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = vabdd_f64(v9, v11);

  if (v12 < 1.0)
  {
    v13 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __125__ATXTimelineRelevanceFilter_filteredAndSortedTimelineEntriesForWidget_entries_withTimelineEntryDelegate_abuseControlConfig___block_invoke_cold_1(a1, v13);
    }
  }
  return v12 >= 1.0;
}

+ (id)applyLimitsToTimelineSuggestions:(id)a3 forWidget:(id)a4 withTimelineEntryDelegate:(id)a5 abuseControlConfig:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 atxTimelineIdentifier];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  uint64_t v34 = 0;
  v14 = [v10 extensionIdentity];
  v15 = [v14 containerBundleIdentifier];
  uint64_t v16 = [v11 countOfInfoSuggestionsForBundleId:v15];

  uint64_t v34 = v16;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v32 = [v11 countOfInfoSuggestionsForSourceId:v13];
  unint64_t v17 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  double v25 = __118__ATXTimelineRelevanceFilter_applyLimitsToTimelineSuggestions_forWidget_withTimelineEntryDelegate_abuseControlConfig___block_invoke;
  double v26 = &unk_1E68B17B8;
  v29 = v33;
  double v30 = v31;
  id v18 = v12;
  id v27 = v18;
  id v19 = v13;
  id v28 = v19;
  v20 = [v17 predicateWithBlock:&v23];
  unint64_t v21 = objc_msgSend(v9, "filteredArrayUsingPredicate:", v20, v23, v24, v25, v26);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

  return v21;
}

uint64_t __118__ATXTimelineRelevanceFilter_applyLimitsToTimelineSuggestions_forWidget_withTimelineEntryDelegate_abuseControlConfig___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v2 <= [*(id *)(a1 + 32) timelineUpdateLimitPerAppBundleId])
  {
    unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v3 <= [*(id *)(a1 + 32) timelineUpdateLimitPerSource]) {
      return 1;
    }
  }
  v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) timelineUpdateLimitPerSource];
    uint64_t v7 = [*(id *)(a1 + 32) timelineUpdateLimitPerAppBundleId];
    int v9 = 138412802;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXInfoTimelineEntryFilter: Filtering out timeline update for source %@ since the total number of entries has exceeded limit for source (%lu) or limit for appBundleId (%lu)", (uint8_t *)&v9, 0x20u);
  }

  return 0;
}

void __125__ATXTimelineRelevanceFilter_filteredAndSortedTimelineEntriesForWidget_entries_withTimelineEntryDelegate_abuseControlConfig___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [*(id *)(a1 + 32) extensionIdentity];
  v4 = [v3 extensionBundleIdentifier];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXInfoTimelineEntryFilter: Filtered timeline entry expiring in the distant future from: %@", (uint8_t *)&v5, 0xCu);
}

@end