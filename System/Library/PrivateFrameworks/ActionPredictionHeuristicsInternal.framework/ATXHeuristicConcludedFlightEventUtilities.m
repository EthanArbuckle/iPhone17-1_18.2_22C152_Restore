@interface ATXHeuristicConcludedFlightEventUtilities
+ (id)suggestionsForFlightsWithHeuristicDevice:(id)a3;
@end

@implementation ATXHeuristicConcludedFlightEventUtilities

+ (id)suggestionsForFlightsWithHeuristicDevice:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [v3 dateByAddingTimeInterval:-64800.0];
  v5 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v5, OS_LOG_TYPE_DEFAULT, "Concluded flights event search", buf, 2u);
  }

  v6 = [[ATXCalendarEventsDataSource alloc] initWithDevice:v67];
  v7 = [(ATXCalendarEventsDataSource *)v6 flightEventsFromStartDate:v4 endDate:v3 reason:@"concluded flights heuristic"];
  v8 = [(ATXCalendarEventsDataSource *)v6 sortEkEvents:v7];
  if ([v8 count])
  {
    v63 = v7;
    v64 = v4;
    v72 = v6;
    v68 = objc_opt_new();
    v79 = objc_opt_new();
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v62 = v8;
    id obj = v8;
    uint64_t v81 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
    if (!v81) {
      goto LABEL_45;
    }
    unint64_t v9 = 0x1E68A4000uLL;
    uint64_t v80 = *(void *)v83;
    v71 = v3;
    while (1)
    {
      for (uint64_t i = 0; i != v81; ++i)
      {
        if (*(void *)v83 != v80) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        v12 = [v11 endDate];
        v13 = [v12 dateByAddingTimeInterval:14400.0];

        v14 = [*(id *)(v9 + 1440) flightInformationSchemaForEvent:v11];
        v15 = [v11 endLocation];
        v16 = [v15 geoLocation];

        if (v16)
        {
          char v17 = [*(id *)(v9 + 1440) currentLocationIsWithinAirportForEvent:v11];
          v18 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
          [v16 coordinate];
          if ((v17 & 1) == 0)
          {
            v43 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v18, "initWithEnteringLocation:radiusInMeters:");
            [v79 addObject:v43];
            goto LABEL_43;
          }
          uint64_t v77 = -[ATXInformationHeuristicRefreshLocationTrigger initWithExitingLocation:radiusInMeters:](v18, "initWithExitingLocation:radiusInMeters:");
          objc_msgSend(v79, "addObject:");
          v19 = [v14 objectForKeyedSubscript:@"reservationFor"];
          v20 = [v19 objectForKeyedSubscript:@"arrivalAirport"];
          v21 = [v20 objectForKeyedSubscript:@"address"];
          [v21 objectForKeyedSubscript:@"addressLocality"];
          uint64_t v23 = v22 = v3;

          v78 = (void *)v23;
          v24 = (void *)v23;
          v25 = v22;
          if (![v24 length])
          {
            v26 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v87 = v78;
              _os_log_impl(&dword_1D0F43000, v26, OS_LOG_TYPE_DEFAULT, "ATXHeuristicConcludedFlightEventUtilities: Airplane mode: Missing information: Arrival City %@.", buf, 0xCu);
            }
          }
          v27 = +[ATXHeuristicFlightEventUtilities _dateIntervalWithEvent:v11];
          v28 = [ATXContextFlightEventSuggestionProducer alloc];
          v29 = [v11 title];
          v30 = [(ATXContextFlightEventSuggestionProducer *)v28 initWithTitle:v29 flightInformationSchema:v14 urlString:0 teamIdentifier:0 validFromStartDate:0 validToEndDate:v13 alternateDestinationTitle:0 dateInterval:v27];

          v76 = v30;
          uint64_t v31 = [(ATXContextFlightEventSuggestionProducer *)v30 suggestionForAirplaneModeWithPredictionReasons:0x200000000 score:80.0];
          if (v31)
          {
            +[ATXHeuristicFlightEventUtilities logSuggestion:v31 description:@"ATXHeuristicConcludedFlightEventUtilities: Airplane Modesuggestion"];
            [v68 addObject:v31];
          }
          v75 = (void *)v31;
          v74 = [v25 dateByAddingTimeInterval:-43200.0];
          v32 = -[ATXCalendarEventsDataSource hotelEventsFromStartDate:endDate:reason:](v72, "hotelEventsFromStartDate:endDate:reason:");
          if (![v32 count])
          {
            v33 = [v25 dateByAddingTimeInterval:43200.0];
            uint64_t v34 = [(ATXCalendarEventsDataSource *)v72 hotelEventsFromStartDate:v25 endDate:v33 reason:@"lodging for concluded flights"];

            v32 = (void *)v34;
          }
          if ([v32 count])
          {
            v35 = [(ATXCalendarEventsDataSource *)v72 sortEkEvents:v32];
            if ([v35 count])
            {
              v70 = v27;
              v36 = [v35 firstObject];
              v37 = [v36 endDate];
              uint64_t v38 = [v37 dateByAddingTimeInterval:14400.0];

              v39 = [v11 endDate];
              [v39 timeIntervalSinceDate:v71];
              double v41 = v40;

              v69 = (void *)v38;
              if (v41 > 14400.0)
              {
                v42 = v36;
                goto LABEL_31;
              }
              unint64_t v9 = 0x1E68A4000uLL;
              uint64_t v66 = +[ATXHeuristicFlightEventUtilities flightInformationSchemaForEvent:v36];
              v53 = +[ATXHeuristicNavigationUtilities navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:](ATXHeuristicNavigationUtilities, "navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:", v36, 65.0, v38);
              if (v53)
              {
                v65 = v36;
                +[ATXHeuristicFlightEventUtilities logSuggestion:v53 description:@"ATXHeuristicConcludedFlightEventUtilities: Navigation Suggestion"];
                [v68 addObject:v53];
                v54 = [v53 atxShortcutsActionExecutableObject];
                v55 = [v54 contextualActionGetDirections];
                v56 = [v55 destination];

                if (v56)
                {
                  v57 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
                  [v56 coordinate];
                  v58 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v57, "initWithEnteringLocation:radiusInMeters:");
                  [v79 addObject:v58];
                }
                unint64_t v9 = 0x1E68A4000;
                v36 = v65;
              }
              v42 = v36;

              v52 = (ATXInformationHeuristicRefreshLocationTrigger *)v66;
LABEL_38:

              goto LABEL_39;
            }
            unint64_t v9 = 0x1E68A4000;
LABEL_41:
            v59 = v76;
            v43 = v77;
          }
          else
          {
            v35 = +[ATXHeuristicNavigationUtilities fetchLocationForLOI:0];
            BOOL v44 = +[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:v35 maxDistance:250000];
            v45 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v87) = v44;
              _os_log_impl(&dword_1D0F43000, v45, OS_LOG_TYPE_DEFAULT, "ATXHeursiticFlightEventUtilities: Can we navigate to home (%{BOOL}d)", buf, 8u);
            }

            if (!v44)
            {
              unint64_t v9 = 0x1E68A4000;
              goto LABEL_41;
            }
            v70 = v27;
            v46 = NSString;
            v47 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v48 = [v47 localizedStringForKey:@"HOME_NAVIGATION_TITLE" value:&stru_1F2719D20 table:0];
            v42 = [v46 localizedStringWithFormat:v48];

            uint64_t v49 = +[ATXHeuristicNavigationUtilities navigationSuggestionActionForLOI:0 destinationName:v42 schemaForEvent:v14 withScore:@"AUTOMOBILE" transportType:0x200000000 predictionReason:0 validStartDate:65.0 validEndDate:v13 heuristicDevice:v67];
            v69 = (void *)v49;
            if (v49)
            {
              uint64_t v50 = v49;
              unint64_t v9 = 0x1E68A4000uLL;
              +[ATXHeuristicFlightEventUtilities logSuggestion:v49 description:@"ATXHeuristicConcludedFlightEventUtilities: Navigation Suggestion"];
              [v68 addObject:v50];
              v51 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
              [v35 coordinate];
              v52 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v51, "initWithEnteringLocation:radiusInMeters:");
              [v79 addObject:v52];
              goto LABEL_38;
            }
LABEL_31:
            unint64_t v9 = 0x1E68A4000;
LABEL_39:
            v59 = v76;
            v43 = v77;

            v27 = v70;
          }

          v3 = v71;
          goto LABEL_43;
        }
        v43 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0F43000, v43, OS_LOG_TYPE_DEFAULT, "ATXHeuristicConcludedFlightEventUtilities: No destination location, skipping Flight landed suggestions", buf, 2u);
        }
LABEL_43:
      }
      uint64_t v81 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
      if (!v81)
      {
LABEL_45:

        v60 = [[ATXContextHeuristicResult alloc] initWithSuggestions:v68 additionalRefreshTriggers:v79];
        v7 = v63;
        v4 = v64;
        v6 = v72;
        v8 = v62;
        goto LABEL_47;
      }
    }
  }
  v60 = (ATXContextHeuristicResult *)objc_opt_new();
LABEL_47:

  return v60;
}

@end