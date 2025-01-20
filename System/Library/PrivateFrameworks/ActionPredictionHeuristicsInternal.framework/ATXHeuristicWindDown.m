@interface ATXHeuristicWindDown
- (id)_contextDateInterval;
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
- (void)_addRefreshTimeTriggerWithHour:(unint64_t)a3 refreshTriggers:(id)a4;
@end

@implementation ATXHeuristicWindDown

- (id)permanentRefreshTriggers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(ATXHeuristicWindDown *)self _contextDateInterval];
  v3 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [v2 startDate];
    v5 = [v2 endDate];
    *(_DWORD *)buf = 138412546;
    v13 = v4;
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1D0F43000, v3, OS_LOG_TYPE_DEFAULT, "ATXHeuristicWindDown permanentRefreshTriggers, context valid from %@ to %@", buf, 0x16u);
  }
  v6 = +[ATXHeuristicAlarmUtilities alarmTrigger];
  v7 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v8 = [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v7 initWithNotification:*MEMORY[0x1E4F1C4F8] type:0];
  v9 = (void *)MEMORY[0x1D25F43D0]();
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, v8, 0);

  return v10;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v5, OS_LOG_TYPE_DEFAULT, "ATXHeuristicWindDown heuristicResultWithEnvironment", buf, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    v6 = objc_opt_new();
    v7 = [(ATXHeuristicWindDown *)self _contextDateInterval];
    v8 = [MEMORY[0x1E4F1C9C8] now];
    int v9 = [v7 containsDate:v8];

    if (v9)
    {
      v10 = [[ATXContextAlarmSuggestionProducer alloc] initWithValidDateInterval:v7 reasonCode:41 score:40.0];
      v11 = [(ATXContextAlarmSuggestionProducer *)v10 editNextAlarmSuggestionsWithEnvironment:v4];
      [v6 addObjectsFromArray:v11];

      v12 = [[ATXContextWebsiteSuggestionProducer alloc] initWithValidDateInterval:v7 reasonCode:41 score:40.0];
      v13 = [(ATXContextWebsiteSuggestionProducer *)v12 websiteSuggestions];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            [v6 addObject:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v15);
      }
      v18 = [[ATXContextWeatherSuggestionProducer alloc] initWithValidDateInterval:v7 reasonCode:41 score:40.0];
      v19 = [(ATXContextWeatherSuggestionProducer *)v18 dummySuggestion];
      if (v19) {
        [v6 addObject:v19];
      }
    }
    v20 = objc_opt_new();
    [(ATXHeuristicWindDown *)self _addRefreshTimeTriggerWithHour:21 refreshTriggers:v20];
    [(ATXHeuristicWindDown *)self _addRefreshTimeTriggerWithHour:23 refreshTriggers:v20];
    v21 = [[ATXContextHeuristicResult alloc] initWithSuggestions:v6 additionalRefreshTriggers:v20];
  }
  else
  {
    v22 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v22, OS_LOG_TYPE_DEFAULT, "ATXHeuristicWindDown heuristicResultWithEnvironment feature: zkw_routines is off. Dropping", buf, 2u);
    }

    v21 = (ATXContextHeuristicResult *)objc_opt_new();
  }

  return v21;
}

- (void)_addRefreshTimeTriggerWithHour:(unint64_t)a3 refreshTriggers:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = +[ATXHeuristicGoodMorning nextDateWithHour:a3];
  v7 = [[ATXInformationHeuristicRefreshTimeTrigger alloc] initWithFireDate:v6];
  v8 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_DEFAULT, "ATXHeuristicWindDown _addRefreshTimeTriggerWithHour adding a trigger at %@", (uint8_t *)&v9, 0xCu);
  }

  [v5 addObject:v7];
}

- (id)_contextDateInterval
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [v3 dateBySettingHour:21 minute:0 second:0 ofDate:v2 options:0];
  id v5 = [v3 dateBySettingHour:23 minute:0 second:0 ofDate:v2 options:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v4 endDate:v5];

  return v6;
}

@end