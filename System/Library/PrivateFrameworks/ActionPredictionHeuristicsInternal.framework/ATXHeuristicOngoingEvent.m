@interface ATXHeuristicOngoingEvent
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
@end

@implementation ATXHeuristicOngoingEvent

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
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  v3 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v3, OS_LOG_TYPE_DEFAULT, "+[ATXHeuristicOngoingEvent produceSuggestions]", buf, 2u);
  }

  v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [v4 dateByAddingTimeInterval:7200.0];
  v6 = [ATXCalendarEventsDataSource alloc];
  v7 = [v57 heuristicDevice];
  v8 = [(ATXCalendarEventsDataSource *)v6 initWithDevice:v7];

  v51 = v8;
  v52 = (void *)v5;
  v53 = v4;
  v9 = [(ATXCalendarEventsDataSource *)v8 eventsFromStartDate:v4 endDate:v5 reason:@"ongoing event heuristic"];
  v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_15];
  v50 = v9;
  v11 = [v9 filteredArrayUsingPredicate:v10];

  v49 = v11;
  v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_17_0];
  v13 = objc_opt_new();
  v54 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v60 objects:v72 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    unint64_t v17 = 0x1E68A4000uLL;
    uint64_t v18 = *(void *)v61;
    id v55 = v14;
    v56 = v13;
    uint64_t v58 = *(void *)v61;
    do
    {
      uint64_t v19 = 0;
      uint64_t v59 = v16;
      do
      {
        if (*(void *)v61 != v18) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v60 + 1) + 8 * v19);
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
            v65 = v24;
            __int16 v66 = 2048;
            uint64_t v67 = v26;
            unint64_t v17 = 0x1E68A4000;
            __int16 v68 = 2112;
            v69 = v27;
            __int16 v70 = 1024;
            BOOL v71 = v28 != 0;
            _os_log_impl(&dword_1D0F43000, v22, OS_LOG_TYPE_DEFAULT, "Event id: %@ title.hash: %lu start:%@ has organizer:%{BOOL}i", buf, 0x26u);

            uint64_t v18 = v58;
            uint64_t v16 = v59;
          }
          v22 = [v20 startDate];
          v29 = [v20 endDate];
          if ([v22 compare:v29] == 1)
          {
            __atxlog_handle_context_heuristic();
            v30 = (ATXContextEventSuggestionProducer *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v30->super, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v65 = v22;
              __int16 v66 = 2112;
              uint64_t v67 = (uint64_t)v29;
              _os_log_fault_impl(&dword_1D0F43000, &v30->super, OS_LOG_TYPE_FAULT, "ATXHeuristicOngoingEvent: validStartDate %@ is after validEndDate %@. Skipping event", buf, 0x16u);
            }
          }
          else
          {
            v30 = [[ATXContextEventSuggestionProducer alloc] initWithEvent:v20 validFromStartDate:v22 validToEndDate:v29 environment:v57];
            v31 = [(ATXContextEventSuggestionProducer *)v30 suggestionForConferenceWithScore:0x200000 predictionReasons:80.0];
            v32 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v31;
              _os_log_impl(&dword_1D0F43000, v32, OS_LOG_TYPE_DEFAULT, "conferenceSuggestion: %@", buf, 0xCu);
            }

            if (v31) {
              [v13 addObject:v31];
            }
            v33 = +[ATXHeuristicNavigationUtilities locationFromEvent:v20 schemaType:2];
            BOOL v34 = +[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:v33 maxDistance:250000];
            v35 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v65) = v34;
              _os_log_impl(&dword_1D0F43000, v35, OS_LOG_TYPE_DEFAULT, "ATXHeuristicOngoingEvent: can we navigate to event: (%{BOOL}d)", buf, 8u);
            }

            if (v34)
            {
              v36 = [v57 heuristicDevice];
              v37 = +[ATXHeuristicNavigationUtilities navigationSuggestionActionForEvent:v20 schemaForEvent:0 transportType:@"AUTOMOBILE" predictionReasons:0x200000 heuristicDevice:v36 score:v22 validStartDate:80.0 validEndDate:v29];

              v13 = v56;
              if (v37)
              {
                [v56 addObject:v37];
                v38 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
                [v33 coordinate];
                v39 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v38, "initWithEnteringLocation:radiusInMeters:");
                [v54 addObject:v39];
              }
            }
            v40 = [(ATXContextEventSuggestionProducer *)v30 suggestionForEventOrganizerWithScore:0x200000 predictionReasons:50.0];
            v41 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v40;
              _os_log_impl(&dword_1D0F43000, v41, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
            }

            if (v40) {
              [v13 addObject:v40];
            }
            v42 = [(ATXContextEventSuggestionProducer *)v30 suggestionForEventParticipantWithScore:0x200000 predictionReasons:50.0];
            v43 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v42;
              _os_log_impl(&dword_1D0F43000, v43, OS_LOG_TYPE_DEFAULT, "Suggestion: %@", buf, 0xCu);
            }

            if (v42) {
              [v13 addObject:v42];
            }
            if ([v13 count])
            {
              v44 = [(ATXContextEventSuggestionProducer *)v30 suggestionForDNDWithScore:0x200000 predictionReasons:30.0];
              v45 = __atxlog_handle_context_heuristic();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v65 = v44;
                _os_log_impl(&dword_1D0F43000, v45, OS_LOG_TYPE_DEFAULT, "DND Suggestion: %@", buf, 0xCu);
              }

              v13 = v56;
              [v56 addObject:v44];
            }
            else
            {
              v44 = __atxlog_handle_context_heuristic();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D0F43000, v44, OS_LOG_TYPE_DEFAULT, "Skipping DND Suggestion: No other event suggestions", buf, 2u);
              }
            }

            id v14 = v55;
            uint64_t v18 = v58;
            uint64_t v16 = v59;
            unint64_t v17 = 0x1E68A4000;
          }
        }
        else if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0F43000, v22, OS_LOG_TYPE_DEFAULT, "Ongoing Event: Skipping event suggestions, event is a Unsupported", buf, 2u);
        }

        ++v19;
      }
      while (v16 != v19);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v60 objects:v72 count:16];
    }
    while (v16);
  }

  v46 = [[ATXInformationHeuristicRefreshTimeTrigger alloc] initWithFireDate:v52];
  [v54 addObject:v46];
  v47 = [[ATXContextHeuristicResult alloc] initWithSuggestions:v13 additionalRefreshTriggers:v54];

  return v47;
}

uint64_t __59__ATXHeuristicOngoingEvent_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAllDay] ^ 1;
}

uint64_t __59__ATXHeuristicOngoingEvent_heuristicResultWithEnvironment___block_invoke_2(uint64_t a1, void *a2, void *a3)
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