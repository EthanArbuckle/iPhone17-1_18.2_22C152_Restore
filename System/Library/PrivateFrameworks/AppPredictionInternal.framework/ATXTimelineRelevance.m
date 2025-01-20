@interface ATXTimelineRelevance
+ (unint64_t)suggestionLayoutOptionsForAvocadoSizeClass:(int64_t)a3;
- (ATXTimelineRelevance)initWithWidget:(id)a3 criterionRegistry:(id)a4 abuseControlConfig:(id)a5;
- (ATXTimelineRelevanceDelegate)delegate;
- (BOOL)isWidgetFamilyEligibleForSuggestion;
- (BOOL)overlapExistsBetween:(id)a3 andTimelineEntry:(id)a4;
- (BOOL)startDatesAreCloseEnoughToMerge:(id)a3 withTimelineEntry:(id)a4;
- (NSString)sourceId;
- (id)generateSuggestionsWithTimelineEntries:(id)a3 latestInfoSuggestionRelevantNow:(id)a4;
- (id)infoSuggestionWithTimelineEntry:(id)a3;
- (id)infoSuggestionsFromTimelineEntries:(id)a3 latestInfoSuggestionRelevantNow:(id)a4;
- (id)processTimelineEntryWithPositiveScore:(id)a3 withPreviousInfoSuggestion:(id)a4 updatingTimelineEntryToSuggestionMapping:(id)a5;
- (void)processTimelineEntryWithNonPositiveScore:(id)a3 withPreviousInfoSuggestion:(id)a4 updatingTimelineEntryToSuggestionMapping:(id)a5;
- (void)setDelegate:(id)a3;
- (void)standardizeWidgetSizes;
@end

@implementation ATXTimelineRelevance

- (ATXTimelineRelevance)initWithWidget:(id)a3 criterionRegistry:(id)a4 abuseControlConfig:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self)
  {
    objc_storeStrong((id *)&self->_widget, a3);
    objc_storeStrong((id *)&self->_criterionRegistry, a4);
    objc_storeStrong((id *)&self->_abuseControlConfig, a5);
    v12 = [v9 atxTimelineIdentifier];
    sourceId = self->_sourceId;
    self->_sourceId = v12;

    [(ATXTimelineRelevance *)self standardizeWidgetSizes];
  }

  return self;
}

- (void)standardizeWidgetSizes
{
  if ([(CHSWidget *)self->_widget family] == 5)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F58DD8]);
    id v9 = [(CHSWidget *)self->_widget extensionIdentity];
    v4 = [(CHSWidget *)self->_widget kind];
    v5 = [(CHSWidget *)self->_widget intentReference];
    v6 = [v5 intent];
    v7 = (CHSWidget *)[v3 initWithExtensionIdentity:v9 kind:v4 family:2 intent:v6 activityIdentifier:0];
    widget = self->_widget;
    self->_widget = v7;
  }
}

- (id)infoSuggestionsFromTimelineEntries:(id)a3 latestInfoSuggestionRelevantNow:(id)a4
{
  v31 = self;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v32 = a4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "relevance", v31);

        v12 = __atxlog_handle_timeline();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (v13)
          {
            v14 = [v10 date];
            v15 = [v10 relevance];
            [v15 score];
            uint64_t v17 = v16;
            v18 = [v10 relevance];
            [v18 duration];
            *(_DWORD *)buf = 138412802;
            v38 = v14;
            __int16 v39 = 2048;
            uint64_t v40 = v17;
            __int16 v41 = 2048;
            uint64_t v42 = v19;
            _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "ATXTimelineRelevance: received timeline entry for date %@ with relevance %f and duration %f", buf, 0x20u);
          }
        }
        else if (v13)
        {
          v20 = [v10 date];
          *(_DWORD *)buf = 138412290;
          v38 = v20;
          _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "ATXTimelineRelevance: received timeline entry for date %@ with nil relevance", buf, 0xCu);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v7);
  }
  v21 = v31;
  if ([(ATXTimelineRelevance *)v31 isWidgetFamilyEligibleForSuggestion])
  {
    widget = v21->_widget;
    id WeakRetained = objc_loadWeakRetained((id *)&v21->_delegate);
    v24 = +[ATXTimelineRelevanceFilter filteredAndSortedTimelineEntriesForWidget:widget entries:v5 withTimelineEntryDelegate:WeakRetained abuseControlConfig:v21->_abuseControlConfig];

    v25 = v32;
    v26 = [(ATXTimelineRelevance *)v21 generateSuggestionsWithTimelineEntries:v24 latestInfoSuggestionRelevantNow:v32];
    v27 = v21->_widget;
    id v28 = objc_loadWeakRetained((id *)&v21->_delegate);
    v29 = +[ATXTimelineRelevanceFilter applyLimitsToTimelineSuggestions:v26 forWidget:v27 withTimelineEntryDelegate:v28 abuseControlConfig:v21->_abuseControlConfig];
  }
  else
  {
    v29 = (void *)MEMORY[0x1E4F1CBF0];
    v25 = v32;
  }

  return v29;
}

- (id)generateSuggestionsWithTimelineEntries:(id)a3 latestInfoSuggestionRelevantNow:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  if (v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  id v10 = (void *)v9;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:1];
  v23[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  BOOL v13 = [v7 sortedArrayUsingDescriptors:v12];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95__ATXTimelineRelevance_generateSuggestionsWithTimelineEntries_latestInfoSuggestionRelevantNow___block_invoke;
  v19[3] = &unk_1E68B6988;
  id v20 = v8;
  id v14 = v10;
  id v21 = v14;
  v22 = self;
  id v15 = v8;
  [v13 enumerateObjectsUsingBlock:v19];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained recordRecentTimelineEntries:v15 forWidget:self->_widget];

  id v17 = v14;
  return v17;
}

void __95__ATXTimelineRelevance_generateSuggestionsWithTimelineEntries_latestInfoSuggestionRelevantNow___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 relevance];

  if (v3)
  {
    v4 = [*(id *)(a1 + 40) lastObject];
    id v5 = [v12 relevance];
    [v5 score];
    double v7 = v6;

    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v7 >= 2.22044605e-16)
    {
      id v11 = [v8 processTimelineEntryWithPositiveScore:v12 withPreviousInfoSuggestion:v4 updatingTimelineEntryToSuggestionMapping:v9];
      if (v11) {
        [*(id *)(a1 + 40) addObject:v11];
      }
    }
    else
    {
      [v8 processTimelineEntryWithNonPositiveScore:v12 withPreviousInfoSuggestion:v4 updatingTimelineEntryToSuggestionMapping:v9];
    }
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    v4 = [MEMORY[0x1E4F939D8] entryMappingWithTimelineEntry:v12 suggestionId:0 withSuggestionMappingReason:1];
    [v10 addObject:v4];
  }
}

- (void)processTimelineEntryWithNonPositiveScore:(id)a3 withPreviousInfoSuggestion:(id)a4 updatingTimelineEntryToSuggestionMapping:(id)a5
{
  id v22 = a3;
  id v7 = a4;
  id v8 = a5;
  if (!v7)
  {
    v18 = (void *)MEMORY[0x1E4F939D8];
LABEL_7:
    uint64_t v19 = [v18 entryMappingWithTimelineEntry:v22 suggestionId:0 withSuggestionMappingReason:2];
    [v8 addObject:v19];
    goto LABEL_9;
  }
  uint64_t v9 = [v7 endDate];

  id v10 = [v22 date];
  if (v9)
  {
    id v11 = [v7 endDate];
    id v12 = [v10 earlierDate:v11];
    BOOL v13 = [v22 date];

    if (v12 == v13)
    {
      id v14 = [v22 date];
      [v7 setEndDate:v14];

      id v15 = (void *)MEMORY[0x1E4F939D8];
      uint64_t v16 = [v7 suggestionIdentifier];
      id v17 = [v15 entryMappingWithTimelineEntry:v22 suggestionId:v16 withSuggestionMappingReason:4];
      [v8 addObject:v17];
    }
    v18 = (void *)MEMORY[0x1E4F939D8];
    goto LABEL_7;
  }
  [v7 setEndDate:v10];

  id v20 = (void *)MEMORY[0x1E4F939D8];
  uint64_t v19 = [v7 suggestionIdentifier];
  id v21 = [v20 entryMappingWithTimelineEntry:v22 suggestionId:v19 withSuggestionMappingReason:5];
  [v8 addObject:v21];

LABEL_9:
}

- (id)processTimelineEntryWithPositiveScore:(id)a3 withPreviousInfoSuggestion:(id)a4 updatingTimelineEntryToSuggestionMapping:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(ATXTimelineRelevance *)self overlapExistsBetween:v9 andTimelineEntry:v8])
  {
LABEL_9:
    v30 = [(ATXTimelineRelevance *)self infoSuggestionWithTimelineEntry:v8];
    uint64_t v42 = (void *)MEMORY[0x1E4F939D8];
    id v28 = [v30 suggestionIdentifier];
    v29 = [v42 entryMappingWithTimelineEntry:v8 suggestionId:v28 withSuggestionMappingReason:6];
    goto LABEL_10;
  }
  BOOL v11 = [(ATXTimelineRelevance *)self startDatesAreCloseEnoughToMerge:v9 withTimelineEntry:v8];
  id v12 = __atxlog_handle_timeline();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (v13)
    {
      v31 = [v8 date];
      id v32 = [v8 relevance];
      [v32 duration];
      uint64_t v34 = v33;
      long long v35 = [v9 startDate];
      long long v36 = [v9 endDate];
      v37 = [v8 relevance];
      [v37 score];
      int v44 = 138413314;
      v45 = v31;
      __int16 v46 = 2048;
      uint64_t v47 = v34;
      __int16 v48 = 2112;
      v49 = v35;
      __int16 v50 = 2112;
      v51 = v36;
      __int16 v52 = 2048;
      uint64_t v53 = v38;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "Creating new info suggestion for timeline relevance entry (startDate: %@, duration: %f) with previous entry (startDate: %@, endDate: %@). Both have a relevance score of %f", (uint8_t *)&v44, 0x34u);
    }
    __int16 v39 = [v9 endDate];
    uint64_t v40 = [v8 date];
    __int16 v41 = [v39 earlierDate:v40];
    [v9 setEndDate:v41];

    goto LABEL_9;
  }
  if (v13)
  {
    id v14 = [v8 date];
    id v15 = [v8 relevance];
    [v15 duration];
    uint64_t v17 = v16;
    v18 = [v9 startDate];
    uint64_t v19 = [v9 endDate];
    id v20 = [v8 relevance];
    [v20 score];
    int v44 = 138413314;
    v45 = v14;
    __int16 v46 = 2048;
    uint64_t v47 = v17;
    __int16 v48 = 2112;
    v49 = v18;
    __int16 v50 = 2112;
    v51 = v19;
    __int16 v52 = 2048;
    uint64_t v53 = v21;
    _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "Merging timeline relevance entry (startDate: %@, duration: %f) with previous entry (startDate: %@, endDate: %@). Both have a relevance score of %f", (uint8_t *)&v44, 0x34u);
  }
  id v22 = [v9 endDate];
  v23 = [v8 date];
  v24 = [v8 relevance];
  [v24 duration];
  v25 = objc_msgSend(v23, "dateByAddingTimeInterval:");
  v26 = [v22 laterDate:v25];
  [v9 setEndDate:v26];

  v27 = (void *)MEMORY[0x1E4F939D8];
  id v28 = [v9 suggestionIdentifier];
  v29 = [v27 entryMappingWithTimelineEntry:v8 suggestionId:v28 withSuggestionMappingReason:3];
  v30 = 0;
LABEL_10:
  [v10 addObject:v29];

  return v30;
}

- (BOOL)startDatesAreCloseEnoughToMerge:(id)a3 withTimelineEntry:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  double v6 = [a4 date];
  id v7 = [v5 startDate];

  [v6 timeIntervalSinceDate:v7];
  BOOL v9 = v8 < 3600.0;

  return v9;
}

- (BOOL)overlapExistsBetween:(id)a3 andTimelineEntry:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 date];
  double v8 = [v6 relevance];
  [v8 duration];
  BOOL v9 = objc_msgSend(v7, "dateByAddingTimeInterval:");

  if (v5)
  {
    id v10 = [v5 relevanceScore];
    [v10 doubleValue];
    double v12 = v11;
    BOOL v13 = [v6 relevance];
    [v13 score];
    if (vabdd_f64(v12, v14) >= 2.22044605e-16)
    {
      BOOL v18 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v15 = [v5 startDate];
    uint64_t v16 = [v15 compare:v9];
    if (v16)
    {
      uint64_t v17 = [v5 startDate];
      if ([v17 compare:v9] != -1)
      {
        BOOL v18 = 0;
        goto LABEL_12;
      }
      v26 = v17;
    }
    uint64_t v19 = [v6 date];
    id v20 = [v5 endDate];
    if ([v19 compare:v20])
    {
      [v6 date];
      uint64_t v21 = v25 = v15;
      [v5 endDate];
      id v22 = v24 = v16;
      BOOL v18 = [v21 compare:v22] == -1;

      id v15 = v25;
      uint64_t v17 = v26;
      if (!v24)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {

      BOOL v18 = 1;
      uint64_t v17 = v26;
      if (!v16) {
        goto LABEL_13;
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (id)infoSuggestionWithTimelineEntry:(id)a3
{
  id v4 = a3;
  id v32 = [v4 date];
  id v5 = NSNumber;
  id v6 = [v4 relevance];
  [v6 score];
  v31 = objc_msgSend(v5, "numberWithDouble:");

  id v7 = [v4 relevance];
  [v7 duration];
  double v9 = v8;

  v29 = v4;
  if (v9 <= 300.0)
  {
    v30 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:3153600000.0];
  }
  else
  {
    id v10 = [v4 date];
    double v11 = [v4 relevance];
    [v11 duration];
    v30 = objc_msgSend(v10, "dateByAddingTimeInterval:");
  }
  id v26 = objc_alloc(MEMORY[0x1E4F938F0]);
  id v28 = [(CHSWidget *)self->_widget extensionIdentity];
  uint64_t v12 = [v28 containerBundleIdentifier];
  BOOL v13 = (void *)v12;
  double v14 = &stru_1F2740B58;
  if (v12) {
    double v14 = (__CFString *)v12;
  }
  v25 = v14;
  v27 = [(CHSWidget *)self->_widget extensionIdentity];
  id v15 = [v27 extensionBundleIdentifier];
  uint64_t v16 = [(CHSWidget *)self->_widget kind];
  unint64_t v17 = +[ATXTimelineRelevance suggestionLayoutOptionsForAvocadoSizeClass:[(CHSWidget *)self->_widget family]];
  BOOL v18 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v19 = [v18 UUIDString];
  id v20 = [(CHSWidget *)self->_widget intentReference];
  uint64_t v21 = [v20 intent];
  id v22 = (void *)[v26 initWithAppBundleIdentifier:v25 widgetBundleIdentifier:v15 widgetKind:v16 criterion:@"ATXTimelineEntryImportantTimelineUpdate" applicableLayouts:v17 suggestionIdentifier:v19 startDate:v32 endDate:v30 intent:v21 metadata:0 relevanceScore:v31];

  objc_msgSend(v22, "setConfidenceLevel:", -[ATXInfoSuggestionCriterionRegistry confidenceLevelForCriterion:sourceIdentifier:](self->_criterionRegistry, "confidenceLevelForCriterion:sourceIdentifier:", @"ATXTimelineEntryImportantTimelineUpdate", @"com.apple.proactive.timelineSuggestion"));
  [v22 setSourceIdentifier:self->_sourceId];
  v23 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:19];
  [v22 setClientModelId:v23];

  return v22;
}

- (BOOL)isWidgetFamilyEligibleForSuggestion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(CHSWidget *)self->_widget family] == 5) {
    goto LABEL_6;
  }
  uint64_t v3 = [(CHSWidget *)self->_widget family];
  if (v3 != 1)
  {
    if ([(CHSWidget *)self->_widget family] == 2
      || [(CHSWidget *)self->_widget family] == 3
      || [(CHSWidget *)self->_widget family] == 4)
    {
LABEL_6:
      LOBYTE(v3) = 1;
      return v3;
    }
    id v4 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(CHSWidget *)self->_widget family];
      int v7 = 134217984;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "ATXTimelineRelevance: Widget family is not eligible for suggestion %lu", (uint8_t *)&v7, 0xCu);
    }

    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (unint64_t)suggestionLayoutOptionsForAvocadoSizeClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 5) {
    return qword_1D142BFC8[a3 - 1];
  }
  id v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    +[ATXTimelineRelevance suggestionLayoutOptionsForAvocadoSizeClass:](v4);
  }

  return 16;
}

- (ATXTimelineRelevanceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ATXTimelineRelevanceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)sourceId
{
  return self->_sourceId;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_abuseControlConfig, 0);
  objc_storeStrong((id *)&self->_criterionRegistry, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

+ (void)suggestionLayoutOptionsForAvocadoSizeClass:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXTimelineRelevance: unexpected widgetFamily CHSWidgetFamilyUndefined. This should never happen.", v1, 2u);
}

@end