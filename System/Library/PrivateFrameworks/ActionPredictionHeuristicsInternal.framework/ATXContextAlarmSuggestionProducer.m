@interface ATXContextAlarmSuggestionProducer
- (ATXContextAlarmSuggestionProducer)initWithValidDateInterval:(id)a3 reasonCode:(int64_t)a4 score:(double)a5;
- (BOOL)_isToggleContextualAction:(id)a3;
- (id)_alarmsWithEnvironment:(id)a3 startTimestamp:(double)a4 endTimestamp:(double)a5;
- (id)_criteriaWithAlarm:(id)a3;
- (id)_filterAlarmsEligible:(id)a3 proposedInterval:(id)a4;
- (id)_morningAlarmsWithEnvironment:(id)a3;
- (id)_nextMorningAlarmsWithEnvironment:(id)a3;
- (id)editNextAlarmSuggestionsWithEnvironment:(id)a3;
- (id)morningAlarmToggleSuggestionsWithEnvironment:(id)a3;
@end

@implementation ATXContextAlarmSuggestionProducer

- (ATXContextAlarmSuggestionProducer)initWithValidDateInterval:(id)a3 reasonCode:(int64_t)a4 score:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXContextAlarmSuggestionProducer;
  v10 = [(ATXContextAlarmSuggestionProducer *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_validDateInterval, a3);
    v11->_reasonCode = a4;
    v11->_score = a5;
  }

  return v11;
}

- (id)morningAlarmToggleSuggestionsWithEnvironment:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  v4 = -[ATXContextAlarmSuggestionProducer _morningAlarmsWithEnvironment:](self, "_morningAlarmsWithEnvironment:");
  v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v38 = self;
  int64_t reasonCode = self->_reasonCode;
  id v35 = (id)objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v4;
  uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  v6 = 0;
  if (v41)
  {
    uint64_t v34 = 1 << reasonCode;
    uint64_t v7 = *(void *)v45;
    unint64_t v8 = 0x1E68A4000uLL;
    uint64_t v36 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v11 = [*(id *)(v8 + 1320) localizedTimeWithAlarmDict:v10];
        v12 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v13 = [v10 objectForKeyedSubscript:@"displayTitle"];
          *(_DWORD *)buf = 138412547;
          v49 = v11;
          __int16 v50 = 2117;
          v51 = v13;
          _os_log_impl(&dword_1D0F43000, v12, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: morningAlarmToggleSuggestionsWithEnvironment found one morning alarm that fires at %@, %{sensitive}@", buf, 0x16u);
        }
        v14 = [v10 objectForKeyedSubscript:@"isSleepAlarm"];
        if ([v14 BOOLValue])
        {
          v15 = __atxlog_handle_context_heuristic();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = [v10 objectForKeyedSubscript:@"isSleepAlarm"];
            *(_DWORD *)buf = 138412546;
            v49 = v11;
            __int16 v50 = 2112;
            v51 = v16;
            _os_log_impl(&dword_1D0F43000, v15, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: %@ morningAlarm[isSleepAlarm]=%@, skipping", buf, 0x16u);
          }
        }
        else
        {
          if (v11)
          {
            id v17 = v11;
          }
          else
          {
            id v17 = [v33 localizedStringForKey:@"TOGGLE_ALARM_TITLE" value:&stru_1F2719D20 table:0];
          }
          id v39 = v17;

          v18 = __atxlog_handle_context_heuristic();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0F43000, v18, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: morningAlarmToggleSuggestionsWithEnvironment Creating update alarm action for one alarm", buf, 2u);
          }
          v40 = v11;

          v15 = [*(id *)(v8 + 1320) alarmDataWithAlarmDict:v10];
          id v19 = objc_alloc(MEMORY[0x1E4FB49E8]);
          v20 = [v10 objectForKeyedSubscript:@"alarmID"];
          v21 = [v10 objectForKeyedSubscript:@"displayTitle"];
          v22 = (void *)[v19 initWithAlarmIdentifier:v20 alarmName:v21 alarmData:v15 operation:2];

          v23 = __atxlog_handle_context_heuristic();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0F43000, v23, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: morningAlarmToggleSuggestionsWithEnvironment Creating WFToggleAlarmContextualAction for one alarm", buf, 2u);
          }

          v24 = [(ATXContextAlarmSuggestionProducer *)v38 _criteriaWithAlarm:v10];
          if (v24)
          {
            v25 = (void *)[objc_alloc(MEMORY[0x1E4F4B2E0]) initWithContextualAction:v22 criteria:v24];
            v26 = +[ATXHeuristicAlarmUtilities fireDateWithAlarmDict:v10];
            v27 = NSString;
            [v26 timeIntervalSinceReferenceDate];
            v29 = objc_msgSend(v27, "stringWithFormat:", @"%f", v28);
            v6 = v39;
            v30 = +[ATXContextHeuristicSuggestionProducer suggestionWithShortcutAction:v25 predictionReasons:v34 localizedReason:0 title:v39 subtitle:v29 score:0 dateInterval:v38->_score];

            [v35 addObject:v30];
            uint64_t v7 = v36;
            v11 = v40;
          }
          else
          {
            v30 = __atxlog_handle_context_heuristic();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
              [(ATXContextAlarmSuggestionProducer *)&v42 morningAlarmToggleSuggestionsWithEnvironment:v30];
            }
            uint64_t v7 = v36;
            v6 = v39;
          }

          unint64_t v8 = 0x1E68A4000;
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v41);
  }

  return v35;
}

- (id)_criteriaWithAlarm:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v4 objectForKeyedSubscript:@"hour"];
  if (v6)
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"minute"];
    if (v7)
    {
      uint64_t v8 = [v6 integerValue];
      uint64_t v9 = [v7 integerValue];
      v10 = [(NSDateInterval *)self->_validDateInterval startDate];
      v11 = [v5 dateBySettingHour:v8 minute:v9 second:0 ofDate:v10 options:0];

      id v12 = objc_alloc(MEMORY[0x1E4F4AE40]);
      objc_super v13 = [(NSDateInterval *)self->_validDateInterval startDate];
      v14 = (void *)[v12 initWithStartDate:v13 endDate:v11 lockScreenEligible:0 predicate:0];

      goto LABEL_10;
    }
    v15 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[ATXContextAlarmSuggestionProducer _criteriaWithAlarm:](v15);
    }
  }
  else
  {
    uint64_t v7 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXContextAlarmSuggestionProducer _criteriaWithAlarm:](v7);
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (id)editNextAlarmSuggestionsWithEnvironment:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = self->_validDateInterval;
  v6 = [(ATXContextAlarmSuggestionProducer *)self _nextMorningAlarmsWithEnvironment:a3];
  uint64_t v7 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v6;
    _os_log_impl(&dword_1D0F43000, v7, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: editNextAlarmSuggestionsWithEnvironment morningAlarms=%@", buf, 0xCu);
  }

  id v8 = objc_alloc(MEMORY[0x1E4F4AE40]);
  uint64_t v9 = [(NSDateInterval *)v5 startDate];
  v10 = [(NSDateInterval *)v5 endDate];
  v11 = (void *)[v8 initWithStartDate:v9 endDate:v10 lockScreenEligible:0 predicate:0];

  if (v11)
  {
    if ([v6 count])
    {
      id v12 = +[ATXHeuristicAlarmUtilities firstFiringAmongAlarms:v6];
      if (v12)
      {
        id v32 = +[ATXHeuristicAlarmUtilities localizedTimeWithAlarmDict:v12];
        objc_super v13 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [v12 objectForKeyedSubscript:@"displayTitle"];
          *(_DWORD *)buf = 138412547;
          id v35 = v32;
          __int16 v36 = 2117;
          v37 = v14;
          _os_log_impl(&dword_1D0F43000, v13, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: editNextAlarmSuggestionsWithEnvironment found one morning alarm that fires at %@, %{sensitive}@", buf, 0x16u);
        }
        v15 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0F43000, v15, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: editNextAlarmSuggestionsWithEnvironment Creating update alarm action for one alarm", buf, 2u);
        }

        uint64_t v30 = 1 << self->_reasonCode;
        uint64_t v16 = +[ATXHeuristicAlarmUtilities alarmDataWithAlarmDict:v12];
        id v17 = objc_alloc(MEMORY[0x1E4FB49E8]);
        v18 = [v12 objectForKeyedSubscript:@"alarmID"];
        id v19 = [v12 objectForKeyedSubscript:@"displayTitle"];
        v31 = (void *)v16;
        v20 = (void *)[v17 initWithAlarmIdentifier:v18 alarmName:v19 alarmData:v16 operation:2];

        v21 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0F43000, v21, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: morningAlarmToggleSuggestionsWithEnvironment Creating WFToggleAlarmContextualAction for one alarm", buf, 2u);
        }

        v22 = (void *)[objc_alloc(MEMORY[0x1E4F4B2E0]) initWithContextualAction:v20 criteria:v11];
        v23 = +[ATXHeuristicAlarmUtilities fireDateWithAlarmDict:v12];
        v24 = NSString;
        [v23 timeIntervalSinceReferenceDate];
        v26 = objc_msgSend(v24, "stringWithFormat:", @"%f", v25);
        v27 = +[ATXContextHeuristicSuggestionProducer suggestionWithShortcutAction:v22 predictionReasons:v30 localizedReason:0 title:v32 subtitle:v26 score:0 dateInterval:self->_score];

        if (v27)
        {
          v33 = v27;
          uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        }
        else
        {
          uint64_t v28 = (void *)MEMORY[0x1E4F1CBF0];
        }
      }
      else
      {
        uint64_t v28 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      uint64_t v28 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v28 = objc_opt_new();
  }

  return v28;
}

- (BOOL)_isToggleContextualAction:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 settingBiomeStreamIdentifier];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_nextMorningAlarmsWithEnvironment:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[ATXHeuristicGoodMorning contextDateInterval];
  v6 = [(NSDateInterval *)self->_validDateInterval endDate];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  uint64_t v9 = [v5 endDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  +[ATXHeuristicTimeUtilities timestampByOffsettingDays:1 dayOffset:v11];
  objc_super v13 = [(ATXContextAlarmSuggestionProducer *)self _alarmsWithEnvironment:v4 startTimestamp:v8 endTimestamp:v12];

  return v13;
}

- (id)_morningAlarmsWithEnvironment:(id)a3
{
  validDateInterval = self->_validDateInterval;
  id v5 = a3;
  v6 = [(NSDateInterval *)validDateInterval startDate];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  uint64_t v9 = [(NSDateInterval *)self->_validDateInterval endDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  double v12 = [(ATXContextAlarmSuggestionProducer *)self _alarmsWithEnvironment:v5 startTimestamp:v8 endTimestamp:v11];

  return v12;
}

- (id)_alarmsWithEnvironment:(id)a3 startTimestamp:(double)a4 endTimestamp:(double)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = [NSNumber numberWithDouble:a4];
    double v11 = locDate(v10);
    double v12 = [NSNumber numberWithDouble:a5];
    objc_super v13 = locDate(v12);
    int v28 = 138412546;
    uint64_t v29 = (uint64_t)v11;
    __int16 v30 = 2112;
    v31 = v13;
    _os_log_impl(&dword_1D0F43000, v9, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _alarmsWithEnvironment looking for alarms between %@ and %@", (uint8_t *)&v28, 0x16u);
  }
  v14 = +[ATXHeuristicTimeUtilities enabledAlarmsFromTS:v8 toTS:a4 environment:a5];

  uint64_t v15 = [v14 count];
  uint64_t v16 = __atxlog_handle_context_heuristic();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      uint64_t v18 = [v14 count];
      int v28 = 134217984;
      uint64_t v29 = v18;
      _os_log_impl(&dword_1D0F43000, v16, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _alarmsWithEnvironment Found a total of %lu alarm(s)", (uint8_t *)&v28, 0xCu);
    }

    id v19 = [(ATXContextAlarmSuggestionProducer *)self _filterAlarmsEligible:v14 proposedInterval:self->_validDateInterval];
    uint64_t v20 = [v19 count];
    v21 = __atxlog_handle_context_heuristic();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        uint64_t v23 = [v19 count];
        v24 = [(NSDateInterval *)self->_validDateInterval endDate];
        int v28 = 134218242;
        uint64_t v29 = v23;
        __int16 v30 = 2112;
        v31 = v24;
        _os_log_impl(&dword_1D0F43000, v21, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _alarmsWithEnvironment Found %lu morning alarm(s) that will fire before %@", (uint8_t *)&v28, 0x16u);
      }
      id v19 = v19;
      uint64_t v25 = v19;
    }
    else
    {
      if (v22)
      {
        v26 = [(NSDateInterval *)self->_validDateInterval endDate];
        int v28 = 138412290;
        uint64_t v29 = (uint64_t)v26;
        _os_log_impl(&dword_1D0F43000, v21, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _alarmsWithEnvironment Suppressing action because there are no enabled alarms before %@", (uint8_t *)&v28, 0xCu);
      }
      uint64_t v25 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    if (v17)
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1D0F43000, v16, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _alarmsWithEnvironment No existing alarms found", (uint8_t *)&v28, 2u);
    }

    id v19 = (id)MEMORY[0x1E4F1CBF0];
    uint64_t v25 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v25;
}

- (id)_filterAlarmsEligible:(id)a3 proposedInterval:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__ATXContextAlarmSuggestionProducer__filterAlarmsEligible_proposedInterval___block_invoke;
  v9[3] = &unk_1E68A5620;
  id v10 = v5;
  id v6 = v5;
  double v7 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v9);

  return v7;
}

BOOL __76__ATXContextAlarmSuggestionProducer__filterAlarmsEligible_proposedInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"zkwAllowModifedAlarms", (CFStringRef)*MEMORY[0x1E4F4B688], &keyExistsAndHasValidFormat))
  {
    id v4 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_1D0F43000, v4, OS_LOG_TYPE_DEFAULT, "ATXContextAlarmSuggestionProducer: _filterAlarmsEligible  internal setting zkwAllowModifedAlarms is on. Allowing even modified alarms", v7, 2u);
    }

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = +[ATXHeuristicAlarmUtilities isValidNonRecentlyModifiedAlarm:v3 duringInterval:*(void *)(a1 + 32)];
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)morningAlarmToggleSuggestionsWithEnvironment:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1D0F43000, log, OS_LOG_TYPE_FAULT, "ATXContextAlarmSuggestionProducer: _criteriaWithAlarm is nil, skipping", buf, 2u);
}

- (void)_criteriaWithAlarm:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0F43000, log, OS_LOG_TYPE_FAULT, "ATXContextAlarmSuggestionProducer: _criteriaWithAlarm alarmDict[hour] is nil", v1, 2u);
}

- (void)_criteriaWithAlarm:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0F43000, log, OS_LOG_TYPE_FAULT, "ATXContextAlarmSuggestionProducer: _criteriaWithAlarm alarmDict[minute] is nil", v1, 2u);
}

@end