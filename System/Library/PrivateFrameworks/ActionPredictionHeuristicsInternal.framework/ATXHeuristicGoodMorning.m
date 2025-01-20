@interface ATXHeuristicGoodMorning
+ (id)contextDateInterval;
+ (id)nextDateWithHour:(unint64_t)a3;
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
- (void)_addRefreshTimeTriggerWithHour:(unint64_t)a3 refreshTriggers:(id)a4;
@end

@implementation ATXHeuristicGoodMorning

- (id)permanentRefreshTriggers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() contextDateInterval];
  v3 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [v2 startDate];
    v5 = [v2 endDate];
    *(_DWORD *)buf = 138412546;
    v13 = v4;
    __int16 v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1D0F43000, v3, OS_LOG_TYPE_DEFAULT, "ATXHeuristicGoodMorning permanentRefreshTriggers, context valid from %@ to %@", buf, 0x16u);
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0F43000, v5, OS_LOG_TYPE_DEFAULT, "ATXHeuristicGoodMorning heuristicResultWithEnvironment", buf, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    v6 = objc_opt_new();
    [(ATXHeuristicGoodMorning *)self _addRefreshTimeTriggerWithHour:6 refreshTriggers:v6];
    [(ATXHeuristicGoodMorning *)self _addRefreshTimeTriggerWithHour:10 refreshTriggers:v6];
    v7 = objc_opt_new();
    v8 = [(id)objc_opt_class() contextDateInterval];
    v9 = [MEMORY[0x1E4F1C9C8] now];
    int v10 = [v8 containsDate:v9];

    if (v10)
    {
      v11 = [[ATXContextWeatherSuggestionProducer alloc] initWithValidDateInterval:v8 reasonCode:40 score:50.0];
      v12 = [(ATXContextWeatherSuggestionProducer *)v11 weatherSuggestionWithRefreshTriggers:v6];
      if (!v12)
      {
        v12 = [(ATXContextWeatherSuggestionProducer *)v11 dummySuggestion];
      }
      v24 = v11;
      [v7 addObject:v12];
      v23 = [[ATXContextAlarmSuggestionProducer alloc] initWithValidDateInterval:v8 reasonCode:40 score:45.0];
      v13 = [(ATXContextAlarmSuggestionProducer *)v23 morningAlarmToggleSuggestionsWithEnvironment:v4];
      [v7 addObjectsFromArray:v13];

      __int16 v14 = [[ATXContextWebsiteSuggestionProducer alloc] initWithValidDateInterval:v8 reasonCode:40 score:40.0];
      v15 = [(ATXContextWebsiteSuggestionProducer *)v14 websiteSuggestions];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            [v7 addObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v17);
      }
    }
    v20 = [[ATXContextHeuristicResult alloc] initWithSuggestions:v7 additionalRefreshTriggers:v6];
  }
  else
  {
    v21 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v21, OS_LOG_TYPE_DEFAULT, "ATXHeuristicGoodMorning heuristicResultWithEnvironment feature: zkw_routines is off. Dropping", buf, 2u);
    }

    v20 = (ATXContextHeuristicResult *)objc_opt_new();
  }

  return v20;
}

- (void)_addRefreshTimeTriggerWithHour:(unint64_t)a3 refreshTriggers:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(id)objc_opt_class() nextDateWithHour:a3];
  v7 = [[ATXInformationHeuristicRefreshTimeTrigger alloc] initWithFireDate:v6];
  v8 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    int v10 = v6;
    _os_log_impl(&dword_1D0F43000, v8, OS_LOG_TYPE_DEFAULT, "ATXHeuristicGoodMorning _addRefreshTimeTriggerWithHour adding a trigger at %@", (uint8_t *)&v9, 0xCu);
  }

  [v5 addObject:v7];
}

+ (id)contextDateInterval
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [v3 dateBySettingHour:6 minute:0 second:0 ofDate:v2 options:0];
  id v5 = [v3 dateBySettingHour:10 minute:0 second:0 ofDate:v2 options:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v4 endDate:v5];

  return v6;
}

+ (id)nextDateWithHour:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v5 dateBySettingHour:a3 minute:0 second:0 ofDate:v4 options:0];
  if ([v6 compare:v4] == -1)
  {
    do
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v8 setDay:1];
      v7 = [v5 dateByAddingComponents:v8 toDate:v6 options:0];

      v6 = v7;
    }
    while ([v7 compare:v4] == -1);
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

@end