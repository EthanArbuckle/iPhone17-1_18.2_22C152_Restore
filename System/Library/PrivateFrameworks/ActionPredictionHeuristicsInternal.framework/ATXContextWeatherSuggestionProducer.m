@interface ATXContextWeatherSuggestionProducer
- (ATXContextWeatherSuggestionProducer)initWithValidDateInterval:(id)a3 reasonCode:(int64_t)a4 score:(double)a5;
- (id)_dummySuggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 score:(double)a5;
- (id)_suggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 score:(double)a5;
- (id)dummySuggestion;
- (id)weatherSuggestionWithRefreshTriggers:(id)a3;
@end

@implementation ATXContextWeatherSuggestionProducer

- (ATXContextWeatherSuggestionProducer)initWithValidDateInterval:(id)a3 reasonCode:(int64_t)a4 score:(double)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXContextWeatherSuggestionProducer;
  v10 = [(ATXContextWeatherSuggestionProducer *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_validDateInterval, a3);
    v11->_score = a5;
    v11->_reasonCode = a4;
    uint64_t v12 = [MEMORY[0x1E4F935D0] sharedInstance];
    locationManager = v11->_locationManager;
    v11->_locationManager = (ATXLocationManager *)v12;
  }
  return v11;
}

- (id)weatherSuggestionWithRefreshTriggers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F4AE40]);
  v6 = [(NSDateInterval *)self->_validDateInterval startDate];
  v7 = [(NSDateInterval *)self->_validDateInterval endDate];
  v8 = (void *)[v5 initWithStartDate:v6 endDate:v7 lockScreenEligible:0 predicate:0];

  id v9 = [(ATXLocationManager *)self->_locationManager getCurrentLocation];
  if (v9)
  {
    v10 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
    [v9 coordinate];
    v11 = -[ATXInformationHeuristicRefreshLocationTrigger initWithExitingLocation:radiusInMeters:](v10, "initWithExitingLocation:radiusInMeters:");
    [v4 addObject:v11];
    [v9 coordinate];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithWeatherLatitude:v8 longitude:v12 criteria:v13];
    objc_super v15 = [(ATXContextWeatherSuggestionProducer *)self _suggestionWithAction:v14 predictionReasons:1 << self->_reasonCode score:self->_score];
  }
  else
  {
    v16 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ATXContextWeatherSuggestionProducer weatherSuggestionWithRefreshTriggers:](v16);
    }

    objc_super v15 = 0;
  }

  return v15;
}

- (id)dummySuggestion
{
  id v3 = objc_alloc(MEMORY[0x1E4F4AE40]);
  id v4 = [(NSDateInterval *)self->_validDateInterval startDate];
  id v5 = [(NSDateInterval *)self->_validDateInterval endDate];
  v6 = (void *)[v3 initWithStartDate:v4 endDate:v5 lockScreenEligible:0 predicate:0];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B328]) initWithEntityName:&stru_1F2719D20 qid:&stru_1F2719D20 criteria:v6];
  v8 = [(ATXContextWeatherSuggestionProducer *)self _dummySuggestionWithAction:v7 predictionReasons:1 << self->_reasonCode score:self->_score];

  return v8;
}

- (id)_suggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 score:(double)a5
{
  id v7 = a3;
  v8 = stringForATXSuggestionPredictionReasonCode();
  id v9 = +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:v7 predictionReasons:a4 localizedReason:v8 score:0 dateInterval:a5];

  return v9;
}

- (id)_dummySuggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 score:(double)a5
{
  id v7 = a3;
  v8 = stringForATXSuggestionPredictionReasonCode();
  id v9 = +[ATXContextHeuristicSuggestionProducer dummySuggestionWithSpotlightAction:v7 predictionReasons:a4 localizedReason:v8 score:a5];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_validDateInterval, 0);
}

- (void)weatherSuggestionWithRefreshTriggers:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0F43000, log, OS_LOG_TYPE_ERROR, "Current location nil for weather suggestion", v1, 2u);
}

@end