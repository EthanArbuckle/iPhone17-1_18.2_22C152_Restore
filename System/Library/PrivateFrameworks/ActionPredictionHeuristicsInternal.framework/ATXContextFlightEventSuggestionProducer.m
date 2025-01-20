@interface ATXContextFlightEventSuggestionProducer
- (ATXContextFlightEventSuggestionProducer)initWithTitle:(id)a3 flightInformationSchema:(id)a4 urlString:(id)a5 teamIdentifier:(id)a6 validFromStartDate:(id)a7 validToEndDate:(id)a8 alternateDestinationTitle:(id)a9 dateInterval:(id)a10;
- (id)_contextTitleWithReasons:(unint64_t)a3;
- (id)_stringsWithPredictionReasons:(unint64_t)a3;
- (id)sfSearchResult:(id)a3 title:(id)a4 subtitle:(id)a5 type:(int)a6 sectionHeader:(id)a7 score:(double)a8;
- (id)suggestionForAirplaneModeWithPredictionReasons:(unint64_t)a3 score:(double)a4;
- (id)suggestionForFlightCheckInWithReason:(unint64_t)a3 score:(double)a4;
- (id)suggestionForFlightInformationWithReason:(unint64_t)a3 score:(double)a4 date:(id)a5;
- (id)suggestionForRideShareAppForDestination:(id)a3 source:(id)a4 rideOptionName:(id)a5 preferredBundleId:(id)a6 predictionReasons:(unint64_t)a7 score:(double)a8;
- (id)suggestionForWeatherAtFlightDestinationLocation:(CLLocationCoordinate2D)a3 destination:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6;
- (id)suggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 score:(double)a5;
@end

@implementation ATXContextFlightEventSuggestionProducer

- (ATXContextFlightEventSuggestionProducer)initWithTitle:(id)a3 flightInformationSchema:(id)a4 urlString:(id)a5 teamIdentifier:(id)a6 validFromStartDate:(id)a7 validToEndDate:(id)a8 alternateDestinationTitle:(id)a9 dateInterval:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)ATXContextFlightEventSuggestionProducer;
  v18 = [(ATXContextFlightEventSuggestionProducer *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_flightInformationSchema, a4);
    objc_storeStrong((id *)&v19->_urlString, a5);
    objc_storeStrong((id *)&v19->_teamIdentifier, a6);
    objc_storeStrong((id *)&v19->_validFromStartDate, a7);
    objc_storeStrong((id *)&v19->_validToEndDate, a8);
    objc_storeStrong((id *)&v19->_alternateDestinationTitle, a9);
    objc_storeStrong((id *)&v19->_dateInterval, a10);
  }

  return v19;
}

- (id)_contextTitleWithReasons:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    title = self->_title;
    *(_DWORD *)buf = 136446466;
    id v24 = "-[ATXContextFlightEventSuggestionProducer _contextTitleWithReasons:]";
    __int16 v25 = 2112;
    id v26 = title;
    _os_log_impl(&dword_1D0F43000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s _eventTitle:%@", buf, 0x16u);
  }

  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [(NSDictionary *)self->_flightInformationSchema objectForKeyedSubscript:@"reservationFor"];
  v9 = [v8 objectForKeyedSubscript:@"arrivalAirport"];
  v10 = [v9 objectForKeyedSubscript:@"address"];
  v11 = [v10 objectForKeyedSubscript:@"addressLocality"];

  if (v11)
  {
    if ((a3 & 0x80000000) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    if (!v11)
    {
      v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v17 = v16;
      v18 = @"CONTEXT_UPCOMING_FLIGHT_NO_ARRIVAL_CITY_TITLE";
      goto LABEL_21;
    }
    v14 = NSString;
    v15 = @"CONTEXT_UPCOMING_FLIGHT_TITLE";
LABEL_18:
    id v17 = [v7 localizedStringForKey:v15 value:&stru_1F2719D20 table:0];
    uint64_t v19 = objc_msgSend(v14, "localizedStringWithFormat:", v17, v11);
LABEL_22:
    v13 = (NSString *)v19;

    goto LABEL_23;
  }
  v11 = self->_alternateDestinationTitle;
  if ((a3 & 0x80000000) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((a3 & 0x100000000) != 0)
  {
    if (!v11)
    {
      v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v17 = v16;
      v18 = @"CONTEXT_ONGOING_FLIGHT_NO_ARRIVAL_CITY_TITLE";
      goto LABEL_21;
    }
    v14 = NSString;
    v15 = @"CONTEXT_ONGOING_FLIGHT_TITLE";
    goto LABEL_18;
  }
  if ((a3 & 0x200000000) != 0)
  {
    if (v11)
    {
      v14 = NSString;
      v15 = @"CONTEXT_CONCLUDED_FLIGHT_TITLE";
      goto LABEL_18;
    }
    v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v17 = v16;
    v18 = @"CONTEXT_CONCLUDED_FLIGHT_NO_ARRIVAL_CITY_TITLE";
LABEL_21:
    uint64_t v19 = [v16 localizedStringForKey:v18 value:&stru_1F2719D20 table:0];
    goto LABEL_22;
  }
  v12 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    id v21 = self->_title;
    id v22 = [(ATXContextFlightEventSuggestionProducer *)self _stringsWithPredictionReasons:a3];
    *(_DWORD *)buf = 136446978;
    id v24 = "-[ATXContextFlightEventSuggestionProducer _contextTitleWithReasons:]";
    __int16 v25 = 2112;
    id v26 = v21;
    __int16 v27 = 2112;
    objc_super v28 = v22;
    __int16 v29 = 2112;
    v30 = v11;
    _os_log_fault_impl(&dword_1D0F43000, v12, OS_LOG_TYPE_FAULT, "%{public}s The predictionReasons for the suggestion for event%@ :%@ was not one of UpcomingFlight, OngoingFlight, ConcludedFlight. Arrival city: %@. Falling back on the title", buf, 0x2Au);
  }
  v13 = self->_title;
LABEL_23:

  return v13;
}

- (id)_stringsWithPredictionReasons:(unint64_t)a3
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__11;
  v9 = __Block_byref_object_dispose__11;
  id v10 = (id)objc_opt_new();
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __73__ATXContextFlightEventSuggestionProducer__stringsWithPredictionReasons___block_invoke(uint64_t a1)
{
  stringForATXSuggestionPredictionReasonCode();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v2];
}

- (id)suggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 score:(double)a5
{
  id v8 = a3;
  v9 = [(ATXContextFlightEventSuggestionProducer *)self _contextTitleWithReasons:a4];
  id v10 = +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:v8 predictionReasons:a4 localizedReason:v9 score:0 dateInterval:a5];

  return v10;
}

- (id)suggestionForFlightInformationWithReason:(unint64_t)a3 score:(double)a4 date:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  flightInformationSchema = self->_flightInformationSchema;
  id v10 = a5;
  v11 = [(NSDictionary *)flightInformationSchema objectForKeyedSubscript:@"reservationFor"];
  v12 = [v11 objectForKeyedSubscript:@"flightNumber"];

  if (!v12)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"ATXContextFlightEventSuggestionProducer.m" lineNumber:117 description:@"Missing Flight Number for retrieving flight information"];
  }
  v13 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136446466;
    v20 = "-[ATXContextFlightEventSuggestionProducer suggestionForFlightInformationWithReason:score:date:]";
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_DEFAULT, "Flight Info: %{public}s flightNumber:%@", (uint8_t *)&v19, 0x16u);
  }

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:self->_validFromStartDate endDate:self->_validToEndDate lockScreenEligible:0 predicate:0];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithFlightCode:v12 date:v10 criteria:v14];

  v16 = [(ATXContextFlightEventSuggestionProducer *)self suggestionWithAction:v15 predictionReasons:a3 score:a4];

  return v16;
}

- (id)suggestionForWeatherAtFlightDestinationLocation:(CLLocationCoordinate2D)a3 destination:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  v11 = (objc_class *)MEMORY[0x1E4F4AE40];
  id v12 = a4;
  v13 = (void *)[[v11 alloc] initWithStartDate:self->_validFromStartDate endDate:self->_validToEndDate lockScreenEligible:0 predicate:0];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithWeatherLocation:v12 latitude:v13 longitude:latitude criteria:longitude];

  v15 = [(ATXContextFlightEventSuggestionProducer *)self suggestionWithAction:v14 predictionReasons:a5 score:a6];

  return v15;
}

- (id)suggestionForRideShareAppForDestination:(id)a3 source:(id)a4 rideOptionName:(id)a5 preferredBundleId:(id)a6 predictionReasons:(unint64_t)a7 score:(double)a8
{
  id v12 = a6;
  id v13 = a3;
  v14 = [(ATXContextFlightEventSuggestionProducer *)self _contextTitleWithReasons:a7];
  v15 = +[ATXContextHeuristicSuggestionProducer rideshareAppActionForDestination:v13 preferredBundleId:v12 predictionReasons:a7 title:self->_title localizedReason:v14 score:self->_validFromStartDate validFromStartDate:a8 validToEndDate:self->_validToEndDate dateInterval:self->_dateInterval];

  return v15;
}

- (id)suggestionForFlightCheckInWithReason:(unint64_t)a3 score:(double)a4
{
  if (!self->_title)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"ATXContextFlightEventSuggestionProducer.m" lineNumber:166 description:@"Missing flight checkIn title "];
  }
  if (!self->_teamIdentifier)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"ATXContextFlightEventSuggestionProducer.m" lineNumber:167 description:@"Missing flight checkIn teamIdentifier"];
  }
  id v8 = [(ATXContextFlightEventSuggestionProducer *)self _contextTitleWithReasons:a3];
  v9 = +[ATXContextHeuristicSuggestionProducer flightCheckInActivityWithSubtitle:self->_title url:self->_urlString teamIdentifier:self->_teamIdentifier predictionReasons:a3 localizedReason:v8 score:self->_validFromStartDate validStartDate:a4 validEndDate:self->_validToEndDate];

  return v9;
}

- (id)suggestionForAirplaneModeWithPredictionReasons:(unint64_t)a3 score:(double)a4
{
  uint64_t v7 = -[ATXContextFlightEventSuggestionProducer _contextTitleWithReasons:](self, "_contextTitleWithReasons:");
  id v8 = +[ATXContextHeuristicSuggestionProducer toggleAirplaneModeWithPredictionReasons:a3 localizedReason:v7 score:self->_validFromStartDate validFromStartDate:self->_validToEndDate validToEndDate:self->_dateInterval dateInterval:a4];

  return v8;
}

- (id)sfSearchResult:(id)a3 title:(id)a4 subtitle:(id)a5 type:(int)a6 sectionHeader:(id)a7 score:(double)a8
{
  uint64_t v9 = *(void *)&a6;
  id v13 = (objc_class *)MEMORY[0x1E4F9A3C0];
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc_init(v13);
  int v19 = objc_opt_new();
  [v19 setText:v16];
  [v18 setTitle:v19];
  [v18 setSecondaryTitle:v15];

  [v18 setCompletion:v16];
  [v18 setResultBundleId:@"com.apple.searchd.suggestion"];
  [v18 setSectionBundleIdentifier:@"com.apple.searchd.recent.suggestions"];
  [v18 setRankingScore:a8];
  [v18 setType:v9];
  [v18 setIdentifier:v17];

  [v18 setSectionHeader:v14];

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_alternateDestinationTitle, 0);
  objc_storeStrong((id *)&self->_validToEndDate, 0);
  objc_storeStrong((id *)&self->_validFromStartDate, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_flightInformationSchema, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end