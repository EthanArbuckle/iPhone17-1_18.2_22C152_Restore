@interface ATXContextNavigationSuggestionProducer
- (ATXContextNavigationSuggestionProducer)initWithTitle:(id)a3 event:(id)a4 schemaForEvent:(id)a5 alternateDestinationTitle:(id)a6;
- (id)_contextTitleWithReasons:(unint64_t)a3;
- (id)_dateInterval;
- (id)_stringsWithPredictionReasons:(unint64_t)a3;
- (id)suggestionForNavigationToDestination:(id)a3 transportType:(unint64_t)a4 destinationName:(id)a5 subtitle:(id)a6 predictionReasons:(unint64_t)a7 score:(double)a8 shouldClearOnEngagement:(BOOL)a9 validStartDate:(id)a10 validEndDate:(id)a11;
@end

@implementation ATXContextNavigationSuggestionProducer

- (id)_contextTitleWithReasons:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    title = self->_title;
    *(_DWORD *)buf = 136446466;
    v35 = "-[ATXContextNavigationSuggestionProducer _contextTitleWithReasons:]";
    __int16 v36 = 2112;
    v37 = title;
    _os_log_impl(&dword_1D0F43000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s _eventTitle:%@", buf, 0x16u);
  }

  schemaForEvent = self->_schemaForEvent;
  if (schemaForEvent)
  {
    v8 = [(NSDictionary *)schemaForEvent objectForKeyedSubscript:@"reservationFor"];
    v9 = [v8 objectForKeyedSubscript:@"arrivalAirport"];
    v10 = [v9 objectForKeyedSubscript:@"address"];
    v11 = [v10 objectForKeyedSubscript:@"addressLocality"];
  }
  else
  {
    event = self->_event;
    if (!event) {
      goto LABEL_12;
    }
    v8 = [(EKEvent *)event customObjectForKey:@"SGEventMetadataKey"];
    v9 = [v8 objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
    v10 = [v9 firstObject];
    v13 = [v10 objectForKeyedSubscript:@"reservationFor"];
    v14 = [v13 objectForKeyedSubscript:@"arrivalAirport"];
    v15 = [v14 objectForKeyedSubscript:@"address"];
    v11 = [v15 objectForKeyedSubscript:@"addressLocality"];
  }
  if (v11)
  {
    if ((a3 & 0x80000000) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    v16 = NSString;
    v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = v17;
    v19 = @"CONTEXT_UPCOMING_FLIGHT_TITLE";
    goto LABEL_26;
  }
LABEL_12:
  if ((a3 & 0x380000000) != 0 || (alternateDestinationTitle = self->_alternateDestinationTitle) == 0)
  {
    if ((a3 & 0x80000000) != 0)
    {
      v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v18 = v25;
      v26 = @"CONTEXT_UPCOMING_FLIGHT_NO_ARRIVAL_CITY_TITLE";
    }
    else if ((a3 & 0x100000000) != 0)
    {
      v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v18 = v25;
      v26 = @"CONTEXT_ONGOING_FLIGHT_NO_ARRIVAL_CITY_TITLE";
    }
    else
    {
      if ((a3 & 0x200000000) == 0)
      {
        v11 = 0;
        goto LABEL_20;
      }
      v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v18 = v25;
      v26 = @"CONTEXT_CONCLUDED_FLIGHT_NO_ARRIVAL_CITY_TITLE";
    }
    v23 = [v25 localizedStringForKey:v26 value:&stru_1F2719D20 table:0];
    v11 = 0;
    goto LABEL_37;
  }
  v11 = alternateDestinationTitle;
  if ((a3 & 0x80000000) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  if ((a3 & 0x100000000) != 0)
  {
    v16 = NSString;
    v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = v17;
    v19 = @"CONTEXT_ONGOING_FLIGHT_TITLE";
    goto LABEL_26;
  }
  if ((a3 & 0x200000000) != 0)
  {
    v16 = NSString;
    v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = v17;
    v19 = @"CONTEXT_CONCLUDED_FLIGHT_TITLE";
LABEL_26:
    v24 = [v17 localizedStringForKey:v19 value:&stru_1F2719D20 table:0];
    objc_msgSend(v16, "localizedStringWithFormat:", v24, v11);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_37:
    goto LABEL_38;
  }
LABEL_20:
  if ((a3 & 0x300000) != 0)
  {
    v21 = self->_event;
    if (v21)
    {
      v18 = [(EKEvent *)v21 title];
      v22 = (NSString *)v18;
      if (!v18) {
        v22 = self->_title;
      }
      v23 = v22;
      goto LABEL_37;
    }
  }
  if ((a3 & 0x1000000000) != 0)
  {
    v28 = NSString;
    v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v30 = v29;
    v31 = @"CONTEXT_TITLE_UPCOMING_TO_WORK_COMMUTE";
LABEL_42:
    v33 = [v29 localizedStringForKey:v31 value:&stru_1F2719D20 table:0];
    v23 = [v28 localizedStringWithFormat:v33];

    goto LABEL_38;
  }
  if ((a3 & 0x2000000000) != 0)
  {
    v28 = NSString;
    v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v30 = v29;
    v31 = @"CONTEXT_TITLE_UPCOMING_FROM_WORK_COMMUTE";
    goto LABEL_42;
  }
  v27 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
    [(ATXContextNavigationSuggestionProducer *)self _contextTitleWithReasons:v27];
  }

  v23 = self->_title;
LABEL_38:

  return v23;
}

- (id)_stringsWithPredictionReasons:(unint64_t)a3
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  id v10 = (id)objc_opt_new();
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __72__ATXContextNavigationSuggestionProducer__stringsWithPredictionReasons___block_invoke(uint64_t a1)
{
  stringForATXSuggestionPredictionReasonCode();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v2];
}

- (ATXContextNavigationSuggestionProducer)initWithTitle:(id)a3 event:(id)a4 schemaForEvent:(id)a5 alternateDestinationTitle:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXContextNavigationSuggestionProducer;
  v15 = [(ATXContextNavigationSuggestionProducer *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_event, a4);
    objc_storeStrong((id *)&v16->_schemaForEvent, a5);
    objc_storeStrong((id *)&v16->_alternateDestinationTitle, a6);
  }

  return v16;
}

- (id)suggestionForNavigationToDestination:(id)a3 transportType:(unint64_t)a4 destinationName:(id)a5 subtitle:(id)a6 predictionReasons:(unint64_t)a7 score:(double)a8 shouldClearOnEngagement:(BOOL)a9 validStartDate:(id)a10 validEndDate:(id)a11
{
  id v17 = a11;
  id v18 = a10;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  v22 = [(ATXContextNavigationSuggestionProducer *)self _contextTitleWithReasons:a7];
  title = self->_title;
  v24 = [(ATXContextNavigationSuggestionProducer *)self _dateInterval];
  LOBYTE(v27) = a9;
  v25 = +[ATXContextHeuristicSuggestionProducer navigationToDestination:v21 title:title subtitle:v19 transportType:a4 destinationName:v20 predictionReasons:a7 localizedReason:a8 score:v22 shouldClearOnEngagement:v27 validStartDate:v18 validEndDate:v17 dateInterval:v24];

  return v25;
}

- (id)_dateInterval
{
  uint64_t v3 = [(EKEvent *)self->_event startDate];
  if (v3
    && (v4 = (void *)v3,
        [(EKEvent *)self->_event endDate],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v7 = [(EKEvent *)self->_event startDate];
    v8 = [(EKEvent *)self->_event endDate];
    v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDestinationTitle, 0);
  objc_storeStrong((id *)&self->_schemaForEvent, 0);
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)_contextTitleWithReasons:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[1];
  uint64_t v5 = [a1 _stringsWithPredictionReasons:a2];
  int v6 = 136446722;
  uint64_t v7 = "-[ATXContextNavigationSuggestionProducer _contextTitleWithReasons:]";
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  id v11 = v5;
  _os_log_fault_impl(&dword_1D0F43000, a3, OS_LOG_TYPE_FAULT, "%{public}s The predictionReasons for the suggestion for event %@ :%@ was not one of UpcomingFlight, OngoingFlight, ConcludedFlight, CommuteToWork and CommuteFromWork. Falling back on the title", (uint8_t *)&v6, 0x20u);
}

@end