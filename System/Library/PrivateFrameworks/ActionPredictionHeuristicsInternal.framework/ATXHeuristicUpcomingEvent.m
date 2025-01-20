@interface ATXHeuristicUpcomingEvent
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
@end

@implementation ATXHeuristicUpcomingEvent

- (id)permanentRefreshTriggers
{
  v2 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v3 = [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v2 initWithNotification:*MEMORY[0x1E4F25460] type:0];
  v4 = [[ATXInformationHeuristicRefreshNotitifcationTrigger alloc] initWithNotification:@"ATXTravelTimeUpdated" type:0];
  v5 = (void *)MEMORY[0x1D25F43D0]();
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v3, v4, 0);

  return v6;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  v3 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v3, OS_LOG_TYPE_DEFAULT, "+[ATXHeuristicUpcomingEvent produceSuggestions]", buf, 2u);
  }

  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [v4 dateByAddingTimeInterval:7200.0];
  v6 = [ATXCalendarEventsDataSource alloc];
  v7 = [v68 heuristicDevice];
  v8 = [(ATXCalendarEventsDataSource *)v6 initWithDevice:v7];

  v64 = v8;
  v9 = [(ATXCalendarEventsDataSource *)v8 eventsFromStartDate:v4 endDate:v5 reason:@"upcoming event heuristic"];
  v10 = (void *)MEMORY[0x1E4F28F60];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __60__ATXHeuristicUpcomingEvent_heuristicResultWithEnvironment___block_invoke;
  v82[3] = &unk_1E68A54B0;
  id v62 = v4;
  id v83 = v62;
  id v65 = v5;
  id v84 = v65;
  v11 = [v10 predicateWithBlock:v82];
  v63 = v9;
  v12 = [v9 filteredArrayUsingPredicate:v11];

  v61 = v12;
  v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_7];
  v14 = objc_opt_new();
  v66 = objc_opt_new();
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v78 objects:v94 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    unint64_t v17 = 0x1E68A4000uLL;
    uint64_t v18 = *(void *)v79;
    uint64_t v72 = *(void *)v79;
    do
    {
      uint64_t v19 = 0;
      uint64_t v67 = v16;
      do
      {
        if (*(void *)v79 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v78 + 1) + 8 * v19);
        char v21 = [*(id *)(v17 + 1432) allowSuggestionsForEvent:v20];
        v22 = __atxlog_handle_context_heuristic();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          if (v23)
          {
            v24 = [v20 eventIdentifier];
            v25 = [v20 title];
            uint64_t v26 = [v25 hash];
            v27 = [v20 startDate];
            v28 = [v20 organizer];
            *(_DWORD *)buf = 138413058;
            uint64_t v87 = (uint64_t)v24;
            __int16 v88 = 2048;
            uint64_t v89 = v26;
            unint64_t v17 = 0x1E68A4000;
            __int16 v90 = 2112;
            v91 = v27;
            __int16 v92 = 1024;
            BOOL v93 = v28 != 0;
            _os_log_impl(&dword_1D0F43000, v22, OS_LOG_TYPE_DEFAULT, "Event id: %@ title.hash: %lu start:%@ has organizer:%{BOOL}i", buf, 0x26u);

            uint64_t v18 = v72;
          }

          v29 = [v20 startDate];
          v22 = [v29 dateByAddingTimeInterval:-1800.0];

          v30 = [v20 startDate];
          if ([v22 compare:v30] == 1)
          {
            __atxlog_handle_context_heuristic();
            v31 = (ATXContextEventSuggestionProducer *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v31->super, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v87 = (uint64_t)v22;
              __int16 v88 = 2112;
              uint64_t v89 = (uint64_t)v30;
              _os_log_fault_impl(&dword_1D0F43000, &v31->super, OS_LOG_TYPE_FAULT, "ATXHeuristicUpcomingEvent: validStartDate %@ is after validEndDate %@. Skipping event", buf, 0x16u);
            }
          }
          else
          {
            v31 = [[ATXContextEventSuggestionProducer alloc] initWithEvent:v20 validFromStartDate:v22 validToEndDate:v30 environment:v68];
            uint64_t v32 = [(ATXContextEventSuggestionProducer *)v31 suggestionForConferenceWithScore:0x100000 predictionReasons:80.0];
            v33 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v87 = v32;
              _os_log_impl(&dword_1D0F43000, v33, OS_LOG_TYPE_DEFAULT, "conferenceSuggestion: %@", buf, 0xCu);
            }

            if (v32) {
              [v14 addObject:v32];
            }
            uint64_t v34 = [(ATXContextEventSuggestionProducer *)v31 suggestionForEventOrganizerWithScore:0x100000 predictionReasons:50.0];
            v35 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v87 = v34;
              _os_log_impl(&dword_1D0F43000, v35, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
            }

            if (v34) {
              [v14 addObject:v34];
            }
            v69 = (void *)v34;
            v36 = [(ATXContextEventSuggestionProducer *)v31 suggestionForEventParticipantWithScore:0x100000 predictionReasons:50.0];
            v37 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v87 = (uint64_t)v36;
              _os_log_impl(&dword_1D0F43000, v37, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
            }
            v70 = (void *)v32;

            if (v36) {
              [v14 addObject:v36];
            }
            v38 = v14;
            v39 = +[ATXHeuristicNavigationUtilities locationFromEvent:v20 schemaType:2];
            BOOL v40 = +[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:v39 maxDistance:250000];
            v41 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v87) = v40;
              _os_log_impl(&dword_1D0F43000, v41, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingEvent: For upcoming event, can we navigate to event: (%{BOOL}d)", buf, 8u);
            }

            if (v40)
            {
              v42 = [v68 heuristicDevice];
              v43 = +[ATXHeuristicNavigationUtilities navigationSuggestionActionForEvent:v20 schemaForEvent:0 transportType:@"AUTOMOBILE" predictionReasons:0x100000 heuristicDevice:v42 score:v22 validStartDate:80.0 validEndDate:v30];

              if (v43)
              {
                [v38 addObject:v43];
                v44 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
                [v39 coordinate];
                v45 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v44, "initWithEnteringLocation:radiusInMeters:");
                [v66 addObject:v45];
              }
            }
            v14 = v38;
            if ([v38 count])
            {
              v46 = [(ATXContextEventSuggestionProducer *)v31 suggestionForDNDWithScore:0x100000 predictionReasons:30.0];
              v47 = __atxlog_handle_context_heuristic();
              unint64_t v17 = 0x1E68A4000;
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v87 = (uint64_t)v46;
                _os_log_impl(&dword_1D0F43000, v47, OS_LOG_TYPE_DEFAULT, "DND Suggestion: %@", buf, 0xCu);
              }

              [v14 addObject:v46];
            }
            else
            {
              v46 = __atxlog_handle_context_heuristic();
              unint64_t v17 = 0x1E68A4000;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D0F43000, v46, OS_LOG_TYPE_DEFAULT, "Skipping DND Suggestion: No other event suggestions", buf, 2u);
              }
            }
            uint64_t v16 = v67;

            uint64_t v18 = v72;
          }
        }
        else if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0F43000, v22, OS_LOG_TYPE_DEFAULT, "Upcoming Event: Skipping event suggestions, event is unsupported", buf, 2u);
        }

        ++v19;
      }
      while (v16 != v19);
      uint64_t v16 = [obj countByEnumeratingWithState:&v78 objects:v94 count:16];
    }
    while (v16);
  }

  v71 = [[ATXInformationHeuristicRefreshTimeTrigger alloc] initWithFireDate:v65];
  objc_msgSend(v66, "addObject:");
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v48 = v14;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v75 != v51) {
          objc_enumerationMutation(v48);
        }
        v53 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        v54 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = [v53 uiSpecification];
          v56 = [v55 contextStartDate];
          v57 = [v53 uiSpecification];
          v58 = [v57 contextEndDate];
          *(_DWORD *)buf = 138412546;
          uint64_t v87 = (uint64_t)v56;
          __int16 v88 = 2112;
          uint64_t v89 = (uint64_t)v58;
          _os_log_impl(&dword_1D0F43000, v54, OS_LOG_TYPE_DEFAULT, "Suggestion: context from %@ to %@", buf, 0x16u);
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v50);
  }

  v59 = [[ATXContextHeuristicResult alloc] initWithSuggestions:v48 additionalRefreshTriggers:v66];

  return v59;
}

BOOL __60__ATXHeuristicUpcomingEvent_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAllDay])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = [v3 startDate];
    if ([v5 compare:v6] == -1)
    {
      v7 = [v3 startDate];
      BOOL v4 = [v7 compare:*(void *)(a1 + 40)] == -1;
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

uint64_t __60__ATXHeuristicUpcomingEvent_heuristicResultWithEnvironment___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  v10 = [v4 startDate];
  v11 = [v5 startDate];
  uint64_t v12 = [v10 compare:v11];

LABEL_9:
  return v12;
}

@end