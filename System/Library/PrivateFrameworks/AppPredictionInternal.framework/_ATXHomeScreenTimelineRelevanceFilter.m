@interface _ATXHomeScreenTimelineRelevanceFilter
- (BOOL)_isCurrentTimelineRelevanceScoreZeroForSuggestion:(id)a3 family:(int64_t)a4 intentIndexingHash:(int64_t)a5;
- (BOOL)_widgetExistsOnScreen:(id)a3 homeScreenState:(id)a4;
- (_ATXHomeScreenTimelineRelevanceFilter)initWithTimelineRelevanceStore:(id)a3;
- (id)_nextRefreshDateForSuggestion:(id)a3 familyMask:(unint64_t)a4;
- (id)_nextTimelineRelevanceChangeDateRelatedToSuggestions:(id)a3;
- (id)removeSuggestionsByTimelineRelevanceIfNecessary:(id)a3 homeScreenState:(id)a4;
- (void)_cancelAnyExistingScheduledRefresh;
- (void)_scheduleBlendingRefreshAtDate:(id)a3 reason:(id)a4;
- (void)scheduleBlendingRefreshAtNextTimelineRelevanceChangeRelatedToSuggestions:(id)a3;
@end

@implementation _ATXHomeScreenTimelineRelevanceFilter

- (_ATXHomeScreenTimelineRelevanceFilter)initWithTimelineRelevanceStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ATXHomeScreenTimelineRelevanceFilter;
  v6 = [(_ATXHomeScreenTimelineRelevanceFilter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_timelineRelevanceStore, a3);
  }

  return v7;
}

- (void)scheduleBlendingRefreshAtNextTimelineRelevanceChangeRelatedToSuggestions:(id)a3
{
  uint64_t v4 = [(_ATXHomeScreenTimelineRelevanceFilter *)self _nextTimelineRelevanceChangeDateRelatedToSuggestions:a3];
  id v5 = (id)v4;
  if (v4) {
    [(_ATXHomeScreenTimelineRelevanceFilter *)self _scheduleBlendingRefreshAtDate:v4 reason:@"Timeline relevance change"];
  }
  else {
    [(_ATXHomeScreenTimelineRelevanceFilter *)self _cancelAnyExistingScheduledRefresh];
  }
}

- (id)removeSuggestionsByTimelineRelevanceIfNecessary:(id)a3 homeScreenState:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v48 = v7;
  objc_super v9 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v51;
    *(void *)&long long v12 = 134218498;
    long long v44 = v12;
    id v46 = v10;
    v47 = v9;
    v45 = self;
    uint64_t v49 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "executableSpecification", v44);
        uint64_t v18 = [v17 executableType];

        if (v18 != 3)
        {
          [v9 addObject:v16];
          continue;
        }
        v19 = [MEMORY[0x1E4F938F0] infoSuggestionFromProactiveSuggestion:v16];
        if (v19)
        {
          if (![(_ATXHomeScreenTimelineRelevanceFilter *)v8 _widgetExistsOnScreen:v19 homeScreenState:v48])
          {
            timelineRelevanceStore = v8->_timelineRelevanceStore;
            v24 = [v19 widgetBundleIdentifier];
            v25 = [v19 widgetKind];
            v26 = [v19 intent];
            v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1800.0];
            LODWORD(timelineRelevanceStore) = [(ATXInformationStore *)timelineRelevanceStore didMostRecentReloadFailForExtension:v24 kind:v25 intent:v26 cutoffDate:v27];

            if (!timelineRelevanceStore)
            {
              objc_super v9 = v47;
              [v47 addObject:v16];
LABEL_38:
              id v10 = v46;
              uint64_t v14 = v49;
              goto LABEL_39;
            }
            v28 = __atxlog_handle_blending();
            id v10 = v46;
            objc_super v9 = v47;
            uint64_t v14 = v49;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v55 = (uint64_t)v16;
              v29 = v28;
              v30 = "HSLS [preprocess]: Removing suggestion due to recent reload failure:\n%@";
              goto LABEL_29;
            }
LABEL_30:

            goto LABEL_39;
          }
          v20 = [v19 intent];
          uint64_t v21 = objc_msgSend(v20, "atx_indexingHash");

          if (([v19 layouts] & 8) != 0)
          {
            if ([(_ATXHomeScreenTimelineRelevanceFilter *)v8 _isCurrentTimelineRelevanceScoreZeroForSuggestion:v19 family:1 intentIndexingHash:v21])
            {
              uint64_t v22 = 0;
            }
            else
            {
              uint64_t v22 = 8;
            }
          }
          else
          {
            uint64_t v22 = 0;
          }
          uint64_t v14 = v49;
          if (([v19 layouts] & 0x10) != 0
            && ![(_ATXHomeScreenTimelineRelevanceFilter *)v8 _isCurrentTimelineRelevanceScoreZeroForSuggestion:v19 family:2 intentIndexingHash:v21])
          {
            v22 |= 0x10uLL;
          }
          if (([v19 layouts] & 0x40) != 0
            && ![(_ATXHomeScreenTimelineRelevanceFilter *)v8 _isCurrentTimelineRelevanceScoreZeroForSuggestion:v19 family:3 intentIndexingHash:v21])
          {
            v22 |= 0x40uLL;
          }
          if (([v19 layouts] & 0x80) != 0
            && ![(_ATXHomeScreenTimelineRelevanceFilter *)v8 _isCurrentTimelineRelevanceScoreZeroForSuggestion:v19 family:4 intentIndexingHash:v21])
          {
            v22 |= 0x80uLL;
          }
          else if (!v22)
          {
            v28 = __atxlog_handle_blending();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v55 = (uint64_t)v16;
              v29 = v28;
              v30 = "HSLS [preprocess]: Removing suggestion due to zero timeline relevance score:\n%@";
LABEL_29:
              _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
            }
            goto LABEL_30;
          }
          if (v22 != [v19 layouts])
          {
            v31 = __atxlog_handle_blending();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = [v19 layouts];
              *(_DWORD *)buf = v44;
              uint64_t v55 = v32;
              __int16 v56 = 2048;
              uint64_t v57 = v22;
              __int16 v58 = 2112;
              v59 = v16;
              _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Upating suggestion eligibleLayoutOptions (old %lu, new %lu) due to zero timeline relevance score:\n%@", buf, 0x20u);
            }

            [v19 setLayouts:v22];
            v33 = (void *)MEMORY[0x1E4F938F0];
            v34 = [v16 clientModelSpecification];
            v35 = [v34 clientModelId];
            v36 = [v16 clientModelSpecification];
            v37 = [v36 clientModelVersion];
            v38 = [v16 scoreSpecification];
            [v38 rawScore];
            double v40 = v39;
            v41 = [v16 scoreSpecification];
            v42 = objc_msgSend(v33, "proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:", v19, v35, v37, objc_msgSend(v41, "suggestedConfidenceCategory"), v40);

            objc_super v9 = v47;
            [v47 addObject:v42];

            v8 = v45;
            goto LABEL_38;
          }
          [v9 addObject:v16];
        }
LABEL_39:
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v13);
  }

  return v9;
}

- (void)_cancelAnyExistingScheduledRefresh
{
}

- (void)_scheduleBlendingRefreshAtDate:(id)a3 reason:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  v8 = (const char *)*MEMORY[0x1E4F14170];
  [v6 timeIntervalSinceNow];
  double v10 = v9;

  xpc_dictionary_set_int64(v7, v8, (uint64_t)v10);
  xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x1E4F141A8], 300);
  xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79___ATXHomeScreenTimelineRelevanceFilter__scheduleBlendingRefreshAtDate_reason___block_invoke;
  v12[3] = &unk_1E68AB3F0;
  id v13 = v5;
  id v11 = v5;
  atxRegisterCTSJobHandler("com.apple.duetexpertd.HomeScreenTimelineRelevance", v7, v12);
}

- (id)_nextTimelineRelevanceChangeDateRelatedToSuggestions:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = v3;
  id v6 = (void *)[v5 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v6)
  {
    v31 = 0;
    uint64_t v7 = *(void *)v35;
    id v8 = v4;
    do
    {
      double v9 = 0;
      v33 = v6;
      do
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v9);
        id v11 = [v10 executableSpecification];
        uint64_t v12 = [v11 executableType];

        if (v12 == 3)
        {
          id v13 = v5;
          uint64_t v14 = (void *)MEMORY[0x1E4F938F0];
          id v15 = v4;
          id v16 = v4;
          v17 = [v14 infoSuggestionFromProactiveSuggestion:v10];
          uint64_t v18 = -[_ATXHomeScreenTimelineRelevanceFilter _nextRefreshDateForSuggestion:familyMask:](self, "_nextRefreshDateForSuggestion:familyMask:", v17, ((unint64_t)[v17 layouts] >> 2) & 4 | ((unint64_t)objc_msgSend(v17, "layouts") >> 2) & 2 | ((unint64_t)objc_msgSend(v17, "layouts") >> 3) & 8 | ((unint64_t)objc_msgSend(v17, "layouts") >> 3) & 0x10);
          v19 = (void *)v18;
          if (v18) {
            v20 = (void *)v18;
          }
          else {
            v20 = v16;
          }
          id v21 = v20;

          uint64_t v22 = [v16 earlierDate:v21];

          v23 = [v8 earlierDate:v22];

          if (v22 == v23)
          {
            id v24 = v22;

            id v25 = v10;
            v31 = v25;
            id v8 = v24;
          }

          id v4 = v15;
          id v5 = v13;
          id v6 = v33;
        }
        double v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = (void *)[v5 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v6);

    if (v8 != v4)
    {
      v26 = __atxlog_handle_blending();
      id v6 = v31;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v39 = v8;
        __int16 v40 = 2112;
        v41 = v31;
        _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Scheduling Blending refresh at %{public}@ due to future zero timeline relevance score of suggestion:\n%@", buf, 0x16u);
      }

      id v27 = v8;
      v28 = v27;
      goto LABEL_24;
    }
    id v6 = v31;
  }
  else
  {
  }
  v29 = __atxlog_handle_blending();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: No future zero timeline relevance score found related to suggestions.", buf, 2u);
  }

  v28 = 0;
  id v27 = v4;
LABEL_24:

  return v28;
}

- (id)_nextRefreshDateForSuggestion:(id)a3 familyMask:(unint64_t)a4
{
  timelineRelevanceStore = self->_timelineRelevanceStore;
  id v6 = a3;
  uint64_t v7 = [v6 widgetBundleIdentifier];
  id v8 = [v6 widgetKind];
  double v9 = [v6 intent];

  double v10 = [(ATXInformationStore *)timelineRelevanceStore upcomingDateThatTimelineScoreChangesToOrFromZeroForWidget:v7 kind:v8 familyMask:a4 intent:v9];

  return v10;
}

- (BOOL)_isCurrentTimelineRelevanceScoreZeroForSuggestion:(id)a3 family:(int64_t)a4 intentIndexingHash:(int64_t)a5
{
  id v8 = a3;
  timelineRelevanceStore = self->_timelineRelevanceStore;
  double v10 = [v8 widgetBundleIdentifier];
  id v11 = [v8 widgetKind];
  uint64_t v12 = [(ATXInformationStore *)timelineRelevanceStore mostRecentTimelineEntryWithScoreForWidget:v10 kind:v11 family:a4 intentIndexingHash:a5];

  id v13 = [v12 relevance];

  if (v13)
  {
    uint64_t v14 = [v12 relevance];
    [v14 duration];
    double v16 = v15;

    if (v16 >= 0.0)
    {
      v19 = [v12 relevance];
      [v19 duration];
      double v21 = v20;

      if (v21 == 0.0)
      {
        uint64_t v22 = [v12 relevance];
        [v22 score];
        BOOL v18 = v23 <= 0.0;
      }
      else
      {
        id v24 = [v12 date];
        id v25 = [v12 relevance];
        [v25 duration];
        uint64_t v22 = objc_msgSend(v24, "dateByAddingTimeInterval:");

        [v22 timeIntervalSinceNow];
        if (v26 <= 0.0)
        {
          BOOL v18 = 0;
        }
        else
        {
          id v27 = [v12 relevance];
          [v27 score];
          BOOL v18 = v28 <= 0.0;
        }
      }
    }
    else
    {
      v17 = __atxlog_handle_blending();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[_ATXHomeScreenTimelineRelevanceFilter _isCurrentTimelineRelevanceScoreZeroForSuggestion:family:intentIndexingHash:]((uint64_t)v8, v17);
      }

      BOOL v18 = 1;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)_widgetExistsOnScreen:(id)a3 homeScreenState:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v6 = [a4 sortedPagesByUserLastVisit];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v56;
    long long v44 = v6;
    uint64_t v39 = *(void *)v56;
    do
    {
      uint64_t v9 = 0;
      uint64_t v38 = v7;
      do
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v55 + 1) + 8 * v9);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v11 = [v10 stacks];
        uint64_t v42 = [v11 countByEnumeratingWithState:&v51 objects:v60 count:16];
        if (v42)
        {
          uint64_t v12 = *(void *)v52;
          uint64_t v40 = *(void *)v52;
          uint64_t v41 = v9;
          v45 = v11;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v52 != v12) {
                objc_enumerationMutation(v11);
              }
              uint64_t v43 = v13;
              uint64_t v14 = *(void **)(*((void *)&v51 + 1) + 8 * v13);
              long long v47 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              double v15 = [v14 config];
              double v16 = [v15 widgets];

              id obj = v16;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v59 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v48;
                do
                {
                  uint64_t v20 = 0;
                  do
                  {
                    if (*(void *)v48 != v19) {
                      objc_enumerationMutation(obj);
                    }
                    double v21 = *(void **)(*((void *)&v47 + 1) + 8 * v20);
                    uint64_t v22 = [v21 extensionBundleId];
                    double v23 = [v5 widgetBundleIdentifier];
                    if ([v22 isEqualToString:v23])
                    {
                      id v24 = [v21 widgetKind];
                      id v25 = [v5 widgetKind];
                      int v26 = [v24 isEqualToString:v25];

                      if (v26)
                      {
                        id v27 = [v21 intent];
                        if (v27)
                        {
                        }
                        else
                        {
                          double v28 = [v5 intent];

                          if (!v28) {
                            goto LABEL_34;
                          }
                        }
                        uint64_t v29 = [v21 intent];
                        if (v29)
                        {
                          v30 = (void *)v29;
                          v31 = [v5 intent];

                          if (v31)
                          {
                            uint64_t v32 = [v21 intent];
                            v33 = [v5 intent];
                            char v34 = objc_msgSend(v32, "atx_isEqualToIntent:", v33);

                            if (v34)
                            {
LABEL_34:

                              BOOL v36 = 1;
                              id v6 = v44;
                              goto LABEL_36;
                            }
                          }
                        }
                      }
                    }
                    else
                    {
                    }
                    ++v20;
                  }
                  while (v18 != v20);
                  uint64_t v35 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
                  uint64_t v18 = v35;
                }
                while (v35);
              }

              uint64_t v13 = v43 + 1;
              id v6 = v44;
              id v11 = v45;
              uint64_t v12 = v40;
              uint64_t v9 = v41;
            }
            while (v43 + 1 != v42);
            uint64_t v42 = [v45 countByEnumeratingWithState:&v51 objects:v60 count:16];
          }
          while (v42);
        }

        ++v9;
        uint64_t v8 = v39;
      }
      while (v9 != v38);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v55 objects:v61 count:16];
      uint64_t v8 = v39;
      BOOL v36 = 0;
    }
    while (v7);
  }
  else
  {
    BOOL v36 = 0;
  }
LABEL_36:

  return v36;
}

- (void).cxx_destruct
{
}

- (void)_isCurrentTimelineRelevanceScoreZeroForSuggestion:(uint64_t)a1 family:(NSObject *)a2 intentIndexingHash:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "_ATXHomeScreenTimelineRelevanceFilter: Unexpectedly found TimelineEntry with negative duration for suggestion %@", (uint8_t *)&v2, 0xCu);
}

@end