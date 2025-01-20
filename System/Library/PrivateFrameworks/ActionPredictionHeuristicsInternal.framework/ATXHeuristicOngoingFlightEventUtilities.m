@interface ATXHeuristicOngoingFlightEventUtilities
+ (id)suggestionsForFlightsWithHeuristicDevice:(id)a3;
@end

@implementation ATXHeuristicOngoingFlightEventUtilities

+ (id)suggestionsForFlightsWithHeuristicDevice:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [v4 dateByAddingTimeInterval:64800.0];
  v6 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v6, OS_LOG_TYPE_DEFAULT, "Ongoing flight event search", buf, 2u);
  }

  v7 = [[ATXCalendarEventsDataSource alloc] initWithDevice:v3];
  v8 = [(ATXCalendarEventsDataSource *)v7 flightEventsFromStartDate:v4 endDate:v5 reason:@"ongoing flight heuristic"];
  v9 = [(ATXCalendarEventsDataSource *)v7 sortEkEvents:v8];
  if ([v9 count])
  {
    v34 = v8;
    v35 = v7;
    v36 = v5;
    v37 = v4;
    id v38 = v3;
    v40 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v33 = v9;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v44;
      unint64_t v13 = 0x1E68A4000uLL;
      uint64_t v39 = *(void *)v44;
      do
      {
        uint64_t v14 = 0;
        uint64_t v41 = v11;
        do
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
          v16 = [v15 startDate];
          v17 = [v15 endDate];
          if ([v16 compare:v17] == 1)
          {
            v18 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v48 = v16;
              __int16 v49 = 2112;
              v50 = v17;
              _os_log_fault_impl(&dword_1D0F43000, v18, OS_LOG_TYPE_FAULT, "ATXHeuristicOngoingFlightEventUtilities: start %@ is after end %@", buf, 0x16u);
            }
          }
          else
          {
            v18 = [*(id *)(v13 + 1440) flightInformationSchemaForEvent:v15];
            v19 = [*(id *)(v13 + 1440) flightInformationSpotlightSuggestionForEvent:v15 schemaForFlight:v18 predictionReasons:0x100000000 score:v16 validStartDate:v17 validEndDate:70.0];
            if (v19)
            {
              [*(id *)(v13 + 1440) logSuggestion:v19 description:@"ATXHeuristicOngoingFlightEventUtilities: FlightInfo suggestion"];
              [v40 addObject:v19];
            }
            v20 = [v18 objectForKeyedSubscript:@"reservationFor"];
            v21 = [v20 objectForKeyedSubscript:@"arrivalAirport"];
            v22 = [v21 objectForKeyedSubscript:@"address"];
            v23 = [v22 objectForKeyedSubscript:@"addressLocality"];

            if ([v23 length])
            {
              v24 = +[ATXHeuristicFlightEventUtilities _dateIntervalWithEvent:v15];
              v25 = [ATXContextFlightEventSuggestionProducer alloc];
              v26 = [v15 title];
              v27 = [(ATXContextFlightEventSuggestionProducer *)v25 initWithTitle:v26 flightInformationSchema:v18 urlString:0 teamIdentifier:0 validFromStartDate:v16 validToEndDate:v17 alternateDestinationTitle:0 dateInterval:v24];

              v28 = [(ATXContextFlightEventSuggestionProducer *)v27 suggestionForAirplaneModeWithPredictionReasons:0x100000000 score:80.0];
              if (v28)
              {
                +[ATXHeuristicFlightEventUtilities logSuggestion:v28 description:@"ATXHeuristicOngoingFlightEventUtilities: Airplane Mode suggestion"];
                [v40 addObject:v28];
              }

              uint64_t v11 = v41;
              uint64_t v12 = v39;
            }
            else
            {
              v24 = __atxlog_handle_context_heuristic();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v23;
                _os_log_impl(&dword_1D0F43000, v24, OS_LOG_TYPE_DEFAULT, "ATXHeuristicOngoingFlightEventUtilities: Airplane mode: Missing information: Arrival City %@. Skipping airplane mode suggestion", buf, 0xCu);
              }
              uint64_t v11 = v41;
              uint64_t v12 = v39;
            }

            unint64_t v13 = 0x1E68A4000;
          }

          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v11);
    }

    v29 = [ATXContextHeuristicResult alloc];
    v30 = [MEMORY[0x1E4F1CAD0] set];
    v31 = [(ATXContextHeuristicResult *)v29 initWithSuggestions:v40 additionalRefreshTriggers:v30];

    v4 = v37;
    id v3 = v38;
    v7 = v35;
    v5 = v36;
    v9 = v33;
    v8 = v34;
  }
  else
  {
    v31 = (ATXContextHeuristicResult *)objc_opt_new();
  }

  return v31;
}

@end