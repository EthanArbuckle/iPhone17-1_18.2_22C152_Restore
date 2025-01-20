@interface ATXHeuristicUpcomingFlightEventUtilities
+ (id)flightCheckInActionSuggestionForEvent:(id)a3 flightSchema:(id)a4 validStartDate:(id)a5 validEndDate:(id)a6;
+ (id)suggestionsForFlightsWithHeuristicDevice:(id)a3;
+ (id)weatherAtTravelDestinationSpotlightEntry:(id)a3 schemaForFlight:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6 validStartDate:(id)a7 validEndDate:(id)a8 heuristicDevice:(id)a9;
@end

@implementation ATXHeuristicUpcomingFlightEventUtilities

+ (id)flightCheckInActionSuggestionForEvent:(id)a3 flightSchema:(id)a4 validStartDate:(id)a5 validEndDate:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    v13 = [v9 customObjectForKey:@"SGEventMetadataKey"];
    v14 = [v13 objectForKeyedSubscript:@"SGEventMetadataEventActivitiesKey"];
    v15 = [v14 firstObject];
    v16 = v15;
    if (v15)
    {
      uint64_t v17 = [v15 objectForKeyedSubscript:@"SGEventActivityTypeKey"];
      if (v17)
      {
        v18 = (void *)v17;
        v19 = [v16 objectForKeyedSubscript:@"SGEventActivityTypeKey"];
        int v20 = [v19 isEqualToString:@"CheckIn"];

        if (v20)
        {
          uint64_t v21 = [v16 objectForKeyedSubscript:@"SGEventActivityUserActivityStringKey"];
          if (v21)
          {
            v22 = (void *)v21;
            uint64_t v23 = [v16 objectForKeyedSubscript:@"SGEventActivityStartDateKey"];
            if (v23)
            {
              v24 = (void *)v23;
              v25 = [v16 objectForKeyedSubscript:@"SGEventActivityEndDateKey"];

              if (v25)
              {
                v26 = __atxlog_handle_context_heuristic();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  v27 = [v9 title];
                  v28 = [v9 startDate];
                  *(_DWORD *)buf = 138412546;
                  v52 = v27;
                  __int16 v53 = 2112;
                  v54 = v28;
                  _os_log_impl(&dword_1D0F43000, v26, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: FlightCheckIn: Event: %@ at start:%@", buf, 0x16u);
                }
                v29 = [v10 objectForKeyedSubscript:@"reservationFor"];
                v30 = [v29 objectForKeyedSubscript:@"arrivalAirport"];
                v31 = [v30 objectForKeyedSubscript:@"iataCode"];

                v32 = [v10 objectForKeyedSubscript:@"reservationFor"];
                v33 = [v32 objectForKeyedSubscript:@"departureAirport"];
                v49 = [v33 objectForKeyedSubscript:@"iataCode"];

                v34 = [v10 objectForKeyedSubscript:@"reservationFor"];
                v35 = [v34 objectForKeyedSubscript:@"flightNumber"];

                if (-[NSObject length](v31, "length") && [v49 length] && objc_msgSend(v35, "length"))
                {
                  os_log_t log = [v16 objectForKeyedSubscript:@"SGEventActivityTeamIdentifierKey"];
                  v47 = v35;
                  if ([log length])
                  {
                    uint64_t v36 = [v16 objectForKeyedSubscript:@"SGEventActivityUserActivityStringKey"];
                    v44 = NSString;
                    v46 = v36;
                    v43 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
                    v37 = [v43 localizedStringForKey:@"FLIGHT_INFO_TITLE" value:&stru_1F2719D20 table:0];
                    v50 = objc_msgSend(v44, "localizedStringWithFormat:", v37, v35, v49, v31);

                    v45 = +[ATXHeuristicFlightEventUtilities _dateIntervalWithEvent:v9];
                    v38 = [[ATXContextFlightEventSuggestionProducer alloc] initWithTitle:v50 flightInformationSchema:v10 urlString:v46 teamIdentifier:log validFromStartDate:v11 validToEndDate:v12 alternateDestinationTitle:0 dateInterval:v45];
                    v39 = [(ATXContextFlightEventSuggestionProducer *)v38 suggestionForFlightCheckInWithReason:0x80000000 score:30.0];
                    +[ATXHeuristicFlightEventUtilities logSuggestion:v39 description:@"ATXHeuristicUpcomingFlightEventUtilities: Flight checkin suggestion"];

                    v40 = v46;
                  }
                  else
                  {
                    v42 = __atxlog_handle_context_heuristic();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1D0F43000, v42, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: FlightCheckIn: Missing TeamId. Unable to create suggestion for Flight Checkin", buf, 2u);
                    }
                    v40 = v42;
                    v39 = 0;
                  }

                  v35 = v47;
                }
                else
                {
                  __atxlog_handle_context_heuristic();
                  os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412803;
                    v52 = v31;
                    __int16 v53 = 2112;
                    v54 = v49;
                    __int16 v55 = 2113;
                    v56 = v35;
                    _os_log_impl(&dword_1D0F43000, log, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: FlightCheckIn: Missing information: Arrival IATA code: %@, Departure IATA code: %@ Flight Number: %{private}@", buf, 0x20u);
                  }
                  v39 = 0;
                }

LABEL_22:
                goto LABEL_23;
              }
            }
            else
            {
            }
          }
        }
      }
    }
    v31 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v31, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: FlightCheckIn: Check-in information is unavailable", buf, 2u);
    }
    v39 = 0;
    goto LABEL_22;
  }
  v13 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: FlightCheckIn: Missing Schema", buf, 2u);
  }
  v39 = 0;
LABEL_23:

  return v39;
}

+ (id)weatherAtTravelDestinationSpotlightEntry:(id)a3 schemaForFlight:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6 validStartDate:(id)a7 validEndDate:(id)a8 heuristicDevice:(id)a9
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v14 = a4;
  id v50 = a7;
  id v49 = a8;
  id v48 = a9;
  v15 = [v14 objectForKeyedSubscript:@"reservationFor"];
  v16 = [v15 objectForKeyedSubscript:@"arrivalAirport"];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"iataCode"];

  v18 = [v14 objectForKeyedSubscript:@"reservationFor"];
  v19 = [v18 objectForKeyedSubscript:@"arrivalAirport"];
  int v20 = [v19 objectForKeyedSubscript:@"address"];
  uint64_t v21 = [v20 objectForKeyedSubscript:@"addressLocality"];

  v22 = [v14 objectForKeyedSubscript:@"reservationFor"];
  uint64_t v23 = [v22 objectForKeyedSubscript:@"flightNumber"];

  v24 = [v14 objectForKeyedSubscript:@"reservationFor"];
  v25 = [v24 objectForKeyedSubscript:@"arrivalAirport"];
  v26 = [v25 objectForKeyedSubscript:@"address"];
  v27 = [v26 objectForKeyedSubscript:@"addressCountry"];

  if (-[NSObject length](v17, "length") && [v21 length] && objc_msgSend(v23, "length"))
  {
    v28 = NSString;
    v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringForKey:@"FLIGHT_TRAVEL_INFO_TITLE" value:&stru_1F2719D20 table:0];
    v31 = objc_msgSend(v28, "localizedStringWithFormat:", v30, v23, v21);

    v46 = +[ATXHeuristicFlightEventUtilities _dateIntervalWithEvent:v51];
    v45 = [[ATXContextFlightEventSuggestionProducer alloc] initWithTitle:v31 flightInformationSchema:v14 urlString:0 teamIdentifier:0 validFromStartDate:v50 validToEndDate:v49 alternateDestinationTitle:0 dateInterval:v46];
    v32 = [v14 objectForKeyedSubscript:@"reservationFor"];
    v33 = [v32 objectForKeyedSubscript:@"arrivalAirport"];
    v34 = v48;
    +[ATXHeuristicFlightEventUtilities locationAtArrivalAirport:v33 event:v51 heuristicDevice:v48];
    double v36 = v35;
    double v38 = v37;

    v60.latitude = v36;
    v60.longitude = v38;
    if (CLLocationCoordinate2DIsValid(v60))
    {
      if (v27) {
        id v39 = (id)[[NSString alloc] initWithFormat:@"%@, %@", v21, v27];
      }
      else {
        id v39 = v21;
      }
      v43 = v39;
      v42 = v45;
      v40 = -[ATXContextFlightEventSuggestionProducer suggestionForWeatherAtFlightDestinationLocation:destination:predictionReasons:score:](v45, "suggestionForWeatherAtFlightDestinationLocation:destination:predictionReasons:score:", v39, a5, v36, v38, a6);
      +[ATXHeuristicFlightEventUtilities logSuggestion:v40 description:@"ATXHeuristicUpcomingFlightEventUtilities: Weather at travel destination suggestion"];
    }
    else
    {
      v41 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v53 = v31;
        _os_log_impl(&dword_1D0F43000, v41, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: no location for flight destination: %@", buf, 0xCu);
      }

      v40 = 0;
      v42 = v45;
    }
  }
  else
  {
    v31 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v53 = v17;
      __int16 v54 = 2112;
      __int16 v55 = v21;
      __int16 v56 = 2112;
      uint64_t v57 = v23;
      _os_log_impl(&dword_1D0F43000, v31, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: Weather for flight: Missing information: Arrival IATA code: %@, arrival city: %@ flight number: %@", buf, 0x20u);
    }
    v40 = 0;
    v34 = v48;
  }

  return v40;
}

+ (id)suggestionsForFlightsWithHeuristicDevice:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [v4 dateByAddingTimeInterval:86400.0];
  v6 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v6, OS_LOG_TYPE_DEFAULT, "Upcoming flight Event search", buf, 2u);
  }

  v7 = v3;
  v8 = [[ATXCalendarEventsDataSource alloc] initWithDevice:v3];
  id v9 = [(ATXCalendarEventsDataSource *)v8 flightEventsFromStartDate:v4 endDate:v5 reason:@"upcoming flights heuristic"];
  id v10 = [(ATXCalendarEventsDataSource *)v8 sortEkEvents:v9];
  id v11 = objc_opt_new();
  id v12 = objc_opt_new();
  if ([v10 count])
  {
    v52 = v4;
    __int16 v53 = v12;
    id v49 = v9;
    id v50 = v8;
    id v51 = v5;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v48 = v10;
    id obj = v10;
    uint64_t v63 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v63)
    {
      uint64_t v13 = *(void *)v69;
      unint64_t v14 = 0x1E68A4000uLL;
      uint64_t v54 = *(void *)v69;
      __int16 v55 = v7;
      uint64_t v58 = v11;
      do
      {
        for (uint64_t i = 0; i != v63; ++i)
        {
          if (*(void *)v69 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          uint64_t v17 = [*(id *)(v14 + 1440) flightInformationSchemaForEvent:v16];
          v18 = *(void **)(v14 + 1440);
          v65 = (void *)v17;
          v19 = v7;
          uint64_t v20 = objc_msgSend(v18, "updatedFlightInformationSchemaForEvent:schemaForFlight:heuristicDevice:", v16);
          uint64_t v21 = [v16 startDate];
          v22 = [v21 dateByAddingTimeInterval:-86400.0];

          uint64_t v23 = [v16 startDate];
          v66 = v22;
          v67 = (void *)v20;
          if ([v22 compare:v23] == 1)
          {
            v24 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v73 = v66;
              __int16 v74 = 2112;
              v75 = v23;
              _os_log_impl(&dword_1D0F43000, v24, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: flightInfoWindowStartTime %@ is after flightInfoWindowEndTime %@. Skipping event", buf, 0x16u);
            }
            unint64_t v14 = 0x1E68A4000;
          }
          else
          {
            v25 = v11;
            v24 = v22;
            v26 = [v16 startDate];
            uint64_t v27 = [v26 dateByAddingTimeInterval:-2400.0];

            uint64_t v28 = [a1 flightCheckInActionSuggestionForEvent:v16 flightSchema:v20 validStartDate:v24 validEndDate:v27];
            if (v28) {
              [v25 addObject:v28];
            }
            v61 = (void *)v28;
            uint64_t v29 = +[ATXHeuristicFlightEventUtilities flightInformationSpotlightSuggestionForEvent:v16 schemaForFlight:v20 predictionReasons:0x80000000 score:v24 validStartDate:v23 validEndDate:70.0];
            if (v29) {
              [v25 addObject:v29];
            }
            uint64_t v30 = [a1 weatherAtTravelDestinationSpotlightEntry:v16 schemaForFlight:v20 predictionReasons:0x80000000 score:v24 validStartDate:v23 validEndDate:v19 heuristicDevice:40.0];
            if (v30) {
              [v25 addObject:v30];
            }
            v59 = (void *)v30;
            v64 = +[ATXHeuristicNavigationUtilities locationFromEvent:v16 schemaType:0];
            v62 = (void *)v27;
            CLLocationCoordinate2D v60 = (void *)v29;
            if (+[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:maxDistance:](ATXHeuristicNavigationUtilities, "allowNavigationSuggestionForLocation:maxDistance:"))
            {
              v31 = [v16 startDate];
              v32 = [v31 dateByAddingTimeInterval:-14400.0];

              v33 = [v16 startDate];
              v34 = [v33 dateByAddingTimeInterval:-2400.0];

              if ([v32 compare:v34] == 1)
              {
                double v35 = __atxlog_handle_context_heuristic();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v73 = v32;
                  __int16 v74 = 2112;
                  v75 = v34;
                  _os_log_fault_impl(&dword_1D0F43000, v35, OS_LOG_TYPE_FAULT, "ATXHeuristicUpcomingFlightEventUtilities: start %@ is after end %@", buf, 0x16u);
                }
              }
              else
              {
                double v35 = +[ATXHeuristicNavigationUtilities navigationSuggestionActionForEvent:v16 schemaForEvent:v67 transportType:@"AUTOMOBILE" predictionReasons:0x80000000 heuristicDevice:v19 score:v32 validStartDate:65.0 validEndDate:v34];
                if (v35)
                {
                  [v58 addObject:v35];
                  double v36 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
                  [v64 coordinate];
                  double v37 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v36, "initWithEnteringLocation:radiusInMeters:");
                  [v53 addObject:v37];
                }
              }
            }
            else
            {
              v32 = __atxlog_handle_context_heuristic();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D0F43000, v32, OS_LOG_TYPE_DEFAULT, "ATXHeuristicUpcomingFlightEventUtilities: Skipped Navigation suggestions", buf, 2u);
              }
            }

            double v38 = [v16 startDate];
            id v39 = [v38 dateByAddingTimeInterval:-1200.0];

            v40 = [v16 startDate];
            unint64_t v14 = 0x1E68A4000uLL;
            v41 = +[ATXHeuristicFlightEventUtilities _dateIntervalWithEvent:v16];
            v42 = [ATXContextFlightEventSuggestionProducer alloc];
            v43 = [v16 title];
            v44 = [(ATXContextFlightEventSuggestionProducer *)v42 initWithTitle:v43 flightInformationSchema:v67 urlString:0 teamIdentifier:0 validFromStartDate:v39 validToEndDate:v40 alternateDestinationTitle:0 dateInterval:v41];

            v45 = [(ATXContextFlightEventSuggestionProducer *)v44 suggestionForAirplaneModeWithPredictionReasons:0x80000000 score:80.0];
            if (v45)
            {
              +[ATXHeuristicFlightEventUtilities logSuggestion:v45 description:@"ATXHeuristicUpcomingFlightEventUtilities: Airplane Mode suggestion"];
              [v58 addObject:v45];
            }

            uint64_t v13 = v54;
            v7 = v55;
            id v11 = v58;
          }
        }
        uint64_t v63 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v63);
    }

    id v12 = v53;
    v46 = [[ATXContextHeuristicResult alloc] initWithSuggestions:v11 additionalRefreshTriggers:v53];
    v5 = v51;
    v4 = v52;
    id v9 = v49;
    v8 = v50;
    id v10 = v48;
  }
  else
  {
    v46 = (ATXContextHeuristicResult *)objc_opt_new();
  }

  return v46;
}

@end