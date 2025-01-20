@interface ATXHeuristicRideshare
+ (void)_appRegistrationChange:(id)a3;
+ (void)subscribeNotification;
- (ATXHeuristicRideshare)init;
- (id)_dateIntervalWithEvent:(id)a3;
- (id)_rideShareSuggestionActionForDestination:(id)a3 heuristicDevice:(id)a4 flightInformationSchema:(id)a5 predictionReasons:(unint64_t)a6 score:(double)a7 validFromStartDate:(id)a8 validToEndDate:(id)a9 dateInterval:(id)a10;
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
- (id)rideShareAppWithHeuristicDevice:(id)a3;
- (id)rideShareSuggestionActionForEvent:(id)a3 heuristicDevice:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6 validFromStartDate:(id)a7 validToEndDate:(id)a8;
- (id)suggestionForConcludedFlightWithHeuristicDevice:(id)a3;
- (id)suggestionForUpcomingFlightWithHeuristicDevice:(id)a3;
- (void)dealloc;
- (void)sendRefreshNotificationIfRequired:(id)a3;
- (void)setupCellularNetworkMonitoring;
@end

@implementation ATXHeuristicRideshare

- (void)setupCellularNetworkMonitoring
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = (OS_dispatch_queue *)dispatch_queue_create("ATXHeuristicsRideshareRefresh", v3);
  accessQueue = self->_accessQueue;
  self->_accessQueue = v4;

  v6 = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ATXHeuristicRideshare_setupCellularNetworkMonitoring__block_invoke;
  block[3] = &unk_1E68A5418;
  block[4] = self;
  dispatch_async(v6, block);
}

void __55__ATXHeuristicRideshare_setupCellularNetworkMonitoring__block_invoke(uint64_t a1)
{
  nw_path_monitor_t v2 = nw_path_monitor_create_with_type(nw_interface_type_cellular);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  v5 = nw_parameters_create();
  nw_parameters_set_required_interface_type(v5, nw_interface_type_cellular);
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  if (evaluator_for_endpoint)
  {
    v7 = nw_path_evaluator_copy_path();
    if (nw_path_uses_interface_type(v7, nw_interface_type_cellular)) {
      *(_DWORD *)(*(void *)(a1 + 32) + 32) = nw_path_get_status(v7);
    }
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ATXHeuristicRideshare_setupCellularNetworkMonitoring__block_invoke_2;
  v9[3] = &unk_1E68A53F0;
  objc_copyWeak(&v10, &location);
  nw_path_monitor_set_update_handler(v8, v9);
  nw_path_monitor_set_queue(*(nw_path_monitor_t *)(*(void *)(a1 + 32) + 8), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 24));
  nw_path_monitor_start(*(nw_path_monitor_t *)(*(void *)(a1 + 32) + 8));
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __55__ATXHeuristicRideshare_setupCellularNetworkMonitoring__block_invoke_2(uint64_t a1, void *a2)
{
  v4 = a2;
  if (nw_path_uses_interface_type(v4, nw_interface_type_cellular))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained sendRefreshNotificationIfRequired:v4];
  }
}

- (void)sendRefreshNotificationIfRequired:(id)a3
{
  nw_path_status_t status = nw_path_get_status((nw_path_t)a3);
  nw_path_status_t v5 = status;
  int currentStatus = self->_currentStatus;
  p_int currentStatus = &self->_currentStatus;
  if (currentStatus != 1 && status == nw_path_status_satisfied)
  {
    v9 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ATXHeuristicRideshare sendRefreshNotificationIfRequired:](p_currentStatus, v9);
    }

    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"ATXCellularEnabledNotification" object:0];
  }
  int *p_currentStatus = v5;
}

+ (void)subscribeNotification
{
  nw_path_monitor_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:objc_opt_class() selector:sel__appRegistrationChange_ name:@"com.apple.LaunchServices.applicationRegistered" object:0];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:objc_opt_class() selector:sel__appRegistrationChange_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
}

- (ATXHeuristicRideshare)init
{
  v5.receiver = self;
  v5.super_class = (Class)ATXHeuristicRideshare;
  nw_path_monitor_t v2 = [(ATXHeuristicRideshare *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    [(ATXHeuristicRideshare *)v2 setupCellularNetworkMonitoring];
    [(id)objc_opt_class() subscribeNotification];
  }
  return v3;
}

- (void)dealloc
{
  id v3 = (void *)MEMORY[0x1D25F43D0](self, a2);
  pathMonitor = self->_pathMonitor;
  if (pathMonitor) {
    nw_path_monitor_cancel(pathMonitor);
  }
  v5.receiver = self;
  v5.super_class = (Class)ATXHeuristicRideshare;
  [(ATXHeuristicRideshare *)&v5 dealloc];
}

- (id)permanentRefreshTriggers
{
  nw_path_monitor_t v2 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  id v3 = [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v2 initWithNotification:*MEMORY[0x1E4F25460] type:0];
  v4 = [[ATXInformationHeuristicRefreshNotitifcationTrigger alloc] initWithNotification:@"ATXRideshareAppChangeNotification" type:0];
  objc_super v5 = [[ATXInformationHeuristicRefreshNotitifcationTrigger alloc] initWithNotification:@"ATXCellularEnabledNotification" type:0];
  v6 = (void *)MEMORY[0x1D25F43D0]();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v3, v4, v5, 0);

  return v7;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  v6 = [v4 heuristicDevice];
  v7 = [(ATXHeuristicRideshare *)self suggestionForUpcomingFlightWithHeuristicDevice:v6];

  if (v7) {
    [v5 addObject:v7];
  }
  v8 = [v4 heuristicDevice];
  v9 = [(ATXHeuristicRideshare *)self suggestionForConcludedFlightWithHeuristicDevice:v8];

  if (v9) {
    [v5 addObject:v9];
  }
  id v10 = [ATXContextHeuristicResult alloc];
  v11 = [MEMORY[0x1E4F1CAD0] set];
  v12 = [(ATXContextHeuristicResult *)v10 initWithSuggestions:v5 additionalRefreshTriggers:v11];

  return v12;
}

+ (void)_appRegistrationChange:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  objc_super v5 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[ATXHeuristicRideshare _appRegistrationChange:]();
  }

  v6 = [v4 objectForKeyedSubscript:@"bundleIDs"];
  v7 = (void *)[v6 copy];

  v8 = [v7 firstObject];
  v9 = [v3 name];

  int v10 = [v9 isEqualToString:@"com.apple.LaunchServices.applicationRegistered"];
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"ATXRideshareAppChangeNotification" object:0];

  v12 = __atxlog_handle_context_heuristic();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v13) {
      +[ATXHeuristicRideshare _appRegistrationChange:]((uint64_t)v8, v12);
    }
  }
  else if (v13)
  {
    +[ATXHeuristicRideshare _appRegistrationChange:]((uint64_t)v8, v12);
  }
}

- (id)rideShareAppWithHeuristicDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  id v19 = 0;
  uint64_t v11 = 0;
  v12[0] = &v11;
  v12[1] = 0x3032000000;
  v12[2] = __Block_byref_object_copy__10;
  v12[3] = __Block_byref_object_dispose__10;
  id v13 = 0;
  id v4 = [[ATXUserAppPreferenceDataSource alloc] initWithDevice:v3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ATXHeuristicRideshare_rideShareAppWithHeuristicDevice___block_invoke;
  v10[3] = &unk_1E68A5440;
  v10[4] = &v14;
  v10[5] = &v11;
  [(ATXUserAppPreferenceDataSource *)v4 preferredAppForIntentName:@"INRequestRideIntent" andParameterCombination:&unk_1F2727338 skipAppSchemaCheck:1 callback:v10];
  if (*(void *)(v12[0] + 40))
  {
    objc_super v5 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicRideshare rideShareAppWithHeuristicDevice:]((uint64_t)v12, v5);
    }

    id v6 = 0;
  }
  else
  {
    if (v15[5])
    {
      v7 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = v15[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v8;
        _os_log_impl(&dword_1D0F43000, v7, OS_LOG_TYPE_DEFAULT, "Using \"%@\" app for rideshare", buf, 0xCu);
      }
    }
    else
    {
      v7 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ATXHeuristicRideshare rideShareAppWithHeuristicDevice:]();
      }
    }

    id v6 = (id)v15[5];
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __57__ATXHeuristicRideshare_rideShareAppWithHeuristicDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_rideShareSuggestionActionForDestination:(id)a3 heuristicDevice:(id)a4 flightInformationSchema:(id)a5 predictionReasons:(unint64_t)a6 score:(double)a7 validFromStartDate:(id)a8 validToEndDate:(id)a9 dateInterval:(id)a10
{
  id v17 = a3;
  id v35 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"zkwShowRequestRide", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat))
  {
    unint64_t v33 = a6;
    id v34 = v19;
    uint64_t v22 = NSString;
    v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"REQUEST_RIDE_TO_NEXT_EVENT_TITLE" value:&stru_1F2719D20 table:0];
    v25 = [v17 name];
    v26 = objc_msgSend(v22, "localizedStringWithFormat:", v24, v25);

    v27 = 0;
    if (!v18)
    {
      v27 = [v17 name];
    }
    v28 = v35;
    v29 = [(ATXHeuristicRideshare *)self rideShareAppWithHeuristicDevice:v35];
    id v19 = v34;
    if (v29)
    {
      v30 = [[ATXContextFlightEventSuggestionProducer alloc] initWithTitle:v26 flightInformationSchema:v18 urlString:0 teamIdentifier:0 validFromStartDate:v34 validToEndDate:v20 alternateDestinationTitle:v27 dateInterval:v21];
      v31 = [(ATXContextFlightEventSuggestionProducer *)v30 suggestionForRideShareAppForDestination:v17 source:0 rideOptionName:0 preferredBundleId:v29 predictionReasons:v33 score:a7];
      +[ATXHeuristicFlightEventUtilities logSuggestion:v31 description:@"ATXHeuristicRideshare: Rideshare app for flight suggestion"];

      id v19 = v34;
    }
    else
    {
      v31 = 0;
    }
  }
  else
  {
    v27 = __atxlog_handle_ui();
    v28 = v35;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v27, OS_LOG_TYPE_DEFAULT, "Debug: Skip suggestion for request ride", buf, 2u);
    }
    v31 = 0;
  }

  return v31;
}

- (id)rideShareSuggestionActionForEvent:(id)a3 heuristicDevice:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6 validFromStartDate:(id)a7 validToEndDate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v42 = a7;
  id v43 = a8;
  uint64_t v16 = +[ATXHeuristicFlightEventUtilities flightInformationSchemaForEvent:v14];
  id v17 = +[ATXHeuristicFlightEventUtilities updatedFlightInformationSchemaForEvent:v14 schemaForFlight:v16 heuristicDevice:v15];
  id v18 = [v14 customObjectForKey:@"SGEventMetadataKey"];
  id v19 = [v18 objectForKeyedSubscript:@"SGEventMetadataCategoryDescriptionKey"];
  unsigned int v20 = [v19 isEqualToString:@"Lodging"];

  if ((a5 & 0x80000000) != 0)
  {
    v28 = [v17 objectForKeyedSubscript:@"reservationFor"];
    v29 = [v28 objectForKeyedSubscript:@"departureAirport"];
    v26 = [v29 objectForKeyedSubscript:@"iataCode"];

    if (!v26)
    {
      v30 = [v14 structuredLocation];
      v26 = [v30 title];
    }
    id v31 = v14;
    v32 = v26;
    uint64_t v33 = 0;
  }
  else
  {
    if (((a5 >> 33) & v20) == 1)
    {
      uint64_t v21 = [v14 structuredLocation];
      if (!v21) {
        goto LABEL_6;
      }
      uint64_t v22 = (void *)v21;
      v23 = [v14 structuredLocation];
      v24 = [v23 geoLocation];

      if (!v24
        || ([v14 structuredLocation],
            v25 = objc_claimAutoreleasedReturnValue(),
            [v25 title],
            v26 = objc_claimAutoreleasedReturnValue(),
            v25,
            !v26))
      {
LABEL_6:
        v27 = [v17 objectForKeyedSubscript:@"reservationFor"];
        v26 = [v27 objectForKeyedSubscript:@"name"];
      }
    }
    else
    {
      if ((a5 & 0x100000) == 0)
      {
        id v34 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
          -[ATXHeuristicRideshare rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:]();
        }
        v26 = 0;
        id v35 = 0;
        v36 = v42;
        goto LABEL_19;
      }
      uint64_t v37 = [v14 title];
      if (!v37)
      {
        id v34 = __atxlog_handle_context_heuristic();
        v36 = v42;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
          -[ATXHeuristicRideshare rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:]();
        }
        v26 = 0;
        id v35 = 0;
        goto LABEL_19;
      }
      v26 = (void *)v37;
    }
    id v31 = v14;
    v32 = v26;
    uint64_t v33 = 1;
  }
  uint64_t v38 = +[ATXHeuristicNavigationUtilities destinationPlacemarkForEvent:v31 name:v32 schemaType:v33];
  if (v38)
  {
    id v34 = v38;
    v39 = [(ATXHeuristicRideshare *)self _dateIntervalWithEvent:v14];
    v40 = self;
    v36 = v42;
    id v35 = [(ATXHeuristicRideshare *)v40 _rideShareSuggestionActionForDestination:v34 heuristicDevice:v15 flightInformationSchema:v17 predictionReasons:a5 score:v42 validFromStartDate:v43 validToEndDate:a6 dateInterval:v39];

LABEL_19:
    goto LABEL_21;
  }
  id v35 = 0;
  v36 = v42;
LABEL_21:

  return v35;
}

- (id)suggestionForUpcomingFlightWithHeuristicDevice:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v5 dateByAddingTimeInterval:86400.0];
  uint64_t v7 = [[ATXCalendarEventsDataSource alloc] initWithDevice:v4];
  uint64_t v8 = [(ATXCalendarEventsDataSource *)v7 flightEventsFromStartDate:v5 endDate:v6 reason:@"ride share for upcoming flight heuristic"];
  uint64_t v9 = [(ATXCalendarEventsDataSource *)v7 sortEkEvents:v8];
  int v10 = [v9 firstObject];
  if (v10)
  {
    unsigned int v20 = self;
    id v11 = +[ATXHeuristicNavigationUtilities locationFromEvent:v10 schemaType:0];
    v12 = 0;
    if (+[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:v11 maxDistance:250000])
    {
      id v19 = v11;
      id v13 = [v10 startDate];
      id v14 = [v13 dateByAddingTimeInterval:-14400.0];

      id v15 = [v10 startDate];
      uint64_t v16 = [v15 dateByAddingTimeInterval:-2400.0];

      if ([v14 compare:v16] == 1)
      {
        id v17 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[ATXHeuristicRideshare suggestionForUpcomingFlightWithHeuristicDevice:]();
        }

        v12 = 0;
      }
      else
      {
        v12 = [(ATXHeuristicRideshare *)v20 rideShareSuggestionActionForEvent:v10 heuristicDevice:v4 predictionReasons:0x80000000 score:v14 validFromStartDate:v16 validToEndDate:60.0];
        if (v12) {
          +[ATXHeuristicFlightEventUtilities logSuggestion:v12 description:@"ATXHeuristicRideshare: Upcoming flight suggestion"];
        }
      }
      id v11 = v19;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)suggestionForConcludedFlightWithHeuristicDevice:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v4 dateByAddingTimeInterval:-64800.0];
  id v6 = [ATXCalendarEventsDataSource alloc];
  v63 = v3;
  id v7 = v3;
  uint64_t v8 = v4;
  uint64_t v9 = [(ATXCalendarEventsDataSource *)v6 initWithDevice:v7];
  int v10 = [(ATXCalendarEventsDataSource *)v9 flightEventsFromStartDate:v5 endDate:v8 reason:@"ride share for concluded flight heuristic"];
  id v11 = [(ATXCalendarEventsDataSource *)v9 sortEkEvents:v10];
  if (![v11 count])
  {
    v36 = 0;
    goto LABEL_44;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v12 = v11;
  uint64_t v56 = [v12 countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (!v56)
  {
    v36 = 0;
    goto LABEL_43;
  }
  uint64_t v57 = *(void *)v71;
  v54 = v11;
  v55 = v10;
  id v53 = v12;
  v50 = v9;
  v51 = v5;
  while (2)
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v71 != v57) {
        objc_enumerationMutation(v12);
      }
      uint64_t v59 = v13;
      v64 = *(void **)(*((void *)&v70 + 1) + 8 * v13);
      v61 = +[ATXHeuristicFlightEventUtilities flightInformationSchemaForEvent:](ATXHeuristicFlightEventUtilities, "flightInformationSchemaForEvent:");
      v60 = [v8 dateByAddingTimeInterval:-43200.0];
      id v14 = -[ATXCalendarEventsDataSource hotelEventsFromStartDate:endDate:reason:](v9, "hotelEventsFromStartDate:endDate:reason:");
      if (![v14 count])
      {
        [v8 dateByAddingTimeInterval:43200.0];
        uint64_t v16 = v15 = v5;
        uint64_t v17 = [(ATXCalendarEventsDataSource *)v9 hotelEventsFromStartDate:v8 endDate:v16 reason:@"hotel search for concluded flight"];
        id v18 = v14;
        id v14 = (void *)v17;

        id v5 = v15;
      }
      id v19 = [(ATXCalendarEventsDataSource *)v9 sortEkEvents:v14];
      if ([v19 count])
      {
        v58 = v14;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id obj = v19;
        uint64_t v20 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          v52 = v19;
          uint64_t v22 = *(void *)v67;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v67 != v22) {
                objc_enumerationMutation(obj);
              }
              v24 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              v25 = +[ATXHeuristicNavigationUtilities locationFromEvent:v24 schemaType:1];
              if (+[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:v25 maxDistance:250000])
              {
                v26 = [v64 endDate];
                [v26 timeIntervalSinceDate:v8];
                double v28 = v27;

                v29 = [v24 startDate];
                uint64_t v30 = [v8 compare:v29];

                if (v30 == -1 && v28 <= 14400.0)
                {
                  v32 = v8;
                  uint64_t v33 = [v24 endDate];
                  id v34 = [v24 endDate];
                  id v35 = [v34 dateByAddingTimeInterval:14400.0];

                  if ([v33 compare:v35] == 1)
                  {
                    v45 = __atxlog_handle_context_heuristic();
                    uint64_t v9 = v50;
                    id v5 = v51;
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
                      -[ATXHeuristicRideshare suggestionForUpcomingFlightWithHeuristicDevice:]();
                    }

                    v36 = 0;
                    uint64_t v8 = v32;
                    goto LABEL_42;
                  }
                  v36 = [(ATXHeuristicRideshare *)self rideShareSuggestionActionForEvent:v24 heuristicDevice:v63 predictionReasons:0x200000000 score:v33 validFromStartDate:v35 validToEndDate:60.0];
                  if (v36)
                  {
                    +[ATXHeuristicFlightEventUtilities logSuggestion:v36 description:@"ATXHeuristicRideshare: Concluded flight suggestion"];
                    uint64_t v8 = v32;
                    uint64_t v9 = v50;
                    id v5 = v51;
                    goto LABEL_42;
                  }

                  uint64_t v8 = v32;
                }
              }
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
            if (v21) {
              continue;
            }
            break;
          }
          uint64_t v9 = v50;
          id v5 = v51;
          id v11 = v54;
          int v10 = v55;
          id v19 = v52;
          id v12 = v53;
        }
      }
      else
      {
        if (!+[ATXHeuristicFlightEventUtilities currentLocationIsWithinAirportForEvent:v64])goto LABEL_33; {
        v58 = v14;
        }
        id obj = +[ATXHeuristicNavigationUtilities fetchLocationForLOI:0];
        BOOL v37 = +[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:maxDistance:](ATXHeuristicNavigationUtilities, "allowNavigationSuggestionForLocation:maxDistance:");
        uint64_t v38 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          BOOL v75 = v37;
          _os_log_impl(&dword_1D0F43000, v38, OS_LOG_TYPE_DEFAULT, "ATXHeursiticRideshare: Can we go home (%{BOOL}d)", buf, 8u);
        }

        if (v37)
        {
          v39 = v9;
          v40 = v8;
          v41 = NSString;
          id v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          id v43 = [v42 localizedStringForKey:@"HOME_NAVIGATION_TITLE" value:&stru_1F2719D20 table:0];
          v25 = [v41 localizedStringWithFormat:v43];

          uint64_t v44 = +[ATXHeuristicNavigationUtilities placemarkForLOI:0 name:v25];
          if (v44)
          {
            uint64_t v33 = (void *)v44;
            v52 = v19;
            id v35 = [v64 endDate];
            v47 = [v64 endDate];
            v48 = [v47 dateByAddingTimeInterval:14400.0];

            v49 = [(ATXHeuristicRideshare *)self _dateIntervalWithEvent:v64];
            v36 = [(ATXHeuristicRideshare *)self _rideShareSuggestionActionForDestination:v33 heuristicDevice:v63 flightInformationSchema:v61 predictionReasons:0x200000000 score:v35 validFromStartDate:v48 validToEndDate:60.0 dateInterval:v49];

            uint64_t v8 = v40;
            uint64_t v9 = v39;
LABEL_42:

            id v11 = v54;
            int v10 = v55;
            id v12 = v53;
            goto LABEL_43;
          }

          uint64_t v8 = v40;
          uint64_t v9 = v39;
          id v11 = v54;
          int v10 = v55;
          id v12 = v53;
        }
      }

      id v14 = v58;
LABEL_33:

      uint64_t v13 = v59 + 1;
    }
    while (v59 + 1 != v56);
    v36 = 0;
    uint64_t v56 = [v12 countByEnumeratingWithState:&v70 objects:v77 count:16];
    if (v56) {
      continue;
    }
    break;
  }
LABEL_43:

LABEL_44:

  return v36;
}

- (id)_dateIntervalWithEvent:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28C18];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 startDate];
  id v7 = [v4 endDate];

  uint64_t v8 = (void *)[v5 initWithStartDate:v6 endDate:v7];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_networkPath, 0);

  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

- (void)sendRefreshNotificationIfRequired:(int *)a1 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = 1;
  _os_log_debug_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_DEBUG, "ATXHeuristicRideshare: Network Connectivity restored (%d -> %d). Refreshing Rideshare suggestions", (uint8_t *)v3, 0xEu);
}

+ (void)_appRegistrationChange:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_DEBUG, "ATXHeuristicRideshare: App \"%@\" installed. Refreshing suggestions...", (uint8_t *)&v2, 0xCu);
}

+ (void)_appRegistrationChange:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_DEBUG, "ATXHeuristicRideshare: App \"%@\" uninstalled. Refreshing suggestions...", (uint8_t *)&v2, 0xCu);
}

+ (void)_appRegistrationChange:.cold.3()
{
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(&dword_1D0F43000, v0, OS_LOG_TYPE_DEBUG, "ATXHeuristicRideshare: App install/uninstall notification handler", v1, 2u);
}

- (void)rideShareAppWithHeuristicDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  _os_log_error_impl(&dword_1D0F43000, v0, OS_LOG_TYPE_ERROR, "ATXHeuristicRideshare: Did not find any ride share app. Cant create rideshare suggestion", v1, 2u);
}

- (void)rideShareAppWithHeuristicDevice:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "Error while resolving ride share apps: %@", (uint8_t *)&v3, 0xCu);
}

- (void)rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  _os_log_fault_impl(&dword_1D0F43000, v0, OS_LOG_TYPE_FAULT, "ATXHeuristicFlightEventUtilities: Rideshare called for an unsupported prediction reason", v1, 2u);
}

- (void)rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  _os_log_fault_impl(&dword_1D0F43000, v0, OS_LOG_TYPE_FAULT, "ATXHeuristicFlightEventUtilities: For Upcoming flight, destination is empty", v1, 2u);
}

- (void)suggestionForUpcomingFlightWithHeuristicDevice:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_5(&dword_1D0F43000, v0, v1, "ATXHeuristicRideshare: Start %@ is after End %@");
}

@end