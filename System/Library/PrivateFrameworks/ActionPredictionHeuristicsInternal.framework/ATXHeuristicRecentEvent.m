@interface ATXHeuristicRecentEvent
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
@end

@implementation ATXHeuristicRecentEvent

- (id)permanentRefreshTriggers
{
  v2 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v3 = [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v2 initWithNotification:*MEMORY[0x1E4F25460] type:0];
  v4 = (void *)MEMORY[0x1D25F43D0]();
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v3, 0);

  return v5;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v4, OS_LOG_TYPE_DEFAULT, "+[ATXHeuristicRecentEvent produceSuggestions]", buf, 2u);
  }

  v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v6 = [v5 dateByAddingTimeInterval:-600.0];
  v53 = v5;
  v7 = [v5 dateByAddingTimeInterval:7200.0];
  v8 = [ATXCalendarEventsDataSource alloc];
  v9 = [v3 heuristicDevice];
  v10 = [(ATXCalendarEventsDataSource *)v8 initWithDevice:v9];

  v51 = v10;
  v52 = (void *)v6;
  v11 = [(ATXCalendarEventsDataSource *)v10 eventsFromStartDate:v6 endDate:v7 reason:@"recent event heuristic"];
  v12 = (void *)MEMORY[0x1E4F28F60];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __58__ATXHeuristicRecentEvent_heuristicResultWithEnvironment___block_invoke;
  v61[3] = &unk_1E68A4FD0;
  id v49 = v7;
  id v62 = v49;
  v13 = [v12 predicateWithBlock:v61];
  v50 = v11;
  v14 = [v11 filteredArrayUsingPredicate:v13];

  v48 = v14;
  v15 = [v14 sortedArrayUsingComparator:&__block_literal_global_11];
  v16 = objc_opt_new();
  v47 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:v71 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v58;
    unint64_t v21 = 0x1E68A4000uLL;
    uint64_t v55 = *(void *)v58;
    id v54 = v17;
    do
    {
      uint64_t v22 = 0;
      uint64_t v56 = v19;
      do
      {
        if (*(void *)v58 != v20) {
          objc_enumerationMutation(v17);
        }
        v23 = *(void **)(*((void *)&v57 + 1) + 8 * v22);
        char v24 = objc_msgSend(*(id *)(v21 + 1432), "allowSuggestionsForEvent:", v23, v47);
        v25 = __atxlog_handle_context_heuristic();
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (v24)
        {
          if (v26)
          {
            v27 = [v23 eventIdentifier];
            v28 = [v23 title];
            uint64_t v29 = [v28 hash];
            v30 = [v23 startDate];
            [v23 organizer];
            v31 = v16;
            v33 = id v32 = v3;
            *(_DWORD *)buf = 138413058;
            v64 = v27;
            __int16 v65 = 2048;
            uint64_t v66 = v29;
            __int16 v67 = 2112;
            v68 = v30;
            __int16 v69 = 1024;
            BOOL v70 = v33 != 0;
            _os_log_impl(&dword_1D0F43000, v25, OS_LOG_TYPE_DEFAULT, "Event id: %@ title.hash: %lu start:%@ has organizer:%{BOOL}i", buf, 0x26u);

            id v3 = v32;
            v16 = v31;
            id v17 = v54;
          }
          v25 = [v23 endDate];
          v34 = [v23 endDate];
          v35 = [v34 dateByAddingTimeInterval:600.0];

          v36 = [[ATXContextEventSuggestionProducer alloc] initWithEvent:v23 validFromStartDate:v25 validToEndDate:v35 environment:v3];
          v37 = [(ATXContextEventSuggestionProducer *)v36 suggestionForEventOrganizerWithScore:0x400000 predictionReasons:50.0];
          v38 = __atxlog_handle_context_heuristic();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v37;
            _os_log_impl(&dword_1D0F43000, v38, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
          }

          if (v37) {
            [v16 addObject:v37];
          }
          v39 = [(ATXContextEventSuggestionProducer *)v36 suggestionForEventParticipantWithScore:0x400000 predictionReasons:50.0];
          v40 = __atxlog_handle_context_heuristic();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v39;
            _os_log_impl(&dword_1D0F43000, v40, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
          }

          if (v39) {
            [v16 addObject:v39];
          }

          uint64_t v20 = v55;
          uint64_t v19 = v56;
          unint64_t v21 = 0x1E68A4000;
        }
        else if (v26)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0F43000, v25, OS_LOG_TYPE_DEFAULT, "Recent Event: Skipping event suggestions, event is unsupported", buf, 2u);
        }

        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v57 objects:v71 count:16];
    }
    while (v19);
  }

  v41 = [[ATXInformationHeuristicRefreshTimeTrigger alloc] initWithFireDate:v49];
  [v47 addObject:v41];
  v42 = [ATXContextHeuristicResult alloc];
  [MEMORY[0x1E4F1CAD0] set];
  v44 = v43 = v17;
  v45 = [(ATXContextHeuristicResult *)v42 initWithSuggestions:v16 additionalRefreshTriggers:v44];

  return v45;
}

BOOL __58__ATXHeuristicRecentEvent_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAllDay])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [v3 endDate];
    BOOL v4 = [v5 compare:*(void *)(a1 + 32)] == -1;
  }
  return v4;
}

uint64_t __58__ATXHeuristicRecentEvent_heuristicResultWithEnvironment___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 organizer];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [v5 organizer];

    if (!v8)
    {
      uint64_t v12 = -1;
      goto LABEL_9;
    }
  }
  v9 = [v4 organizer];
  if (v9)
  {
  }
  else
  {
    v13 = [v5 organizer];

    if (v13)
    {
      uint64_t v12 = 1;
      goto LABEL_9;
    }
  }
  v10 = [v4 endDate];
  v11 = [v5 endDate];
  uint64_t v12 = [v10 compare:v11];

LABEL_9:
  return v12;
}

@end