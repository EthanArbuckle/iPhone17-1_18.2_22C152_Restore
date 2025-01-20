@interface ATXHeuristicEarlyEventAlarm
- (BOOL)_willAlarm:(id)a3 fireFrom:(double)a4 to:(double)a5;
- (BOOL)isEventInterestingForSettingAlarm:(id)a3;
- (BOOL)shouldShowSuggestionForEarlyEvent:(id)a3 alarms:(id)a4 environment:(id)a5;
- (double)_timestampByOffsettingDays:(double)a3 dayOffset:(int64_t)a4;
- (double)_timestampByOffsettingStartOfTodayByNumberOfDays:(int64_t)a3;
- (double)_timestampWithHour:(unint64_t)a3 minute:(unint64_t)a4 atDayOfTimestamp:(double)a5;
- (id)_enabledAlarmsFromTS:(double)a3 toTS:(double)a4 environment:(id)a5;
- (id)_usualAlarmTimeOfDayDataSourceWithEnvironment:(id)a3;
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
@end

@implementation ATXHeuristicEarlyEventAlarm

- (id)permanentRefreshTriggers
{
  v2 = +[ATXHeuristicDevice sharedAlarmManager];
  [v2 checkIn];

  v3 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v4 = [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v3 initWithNotification:*MEMORY[0x1E4F25460] type:0];
  v5 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v6 = [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v5 initWithNotification:*MEMORY[0x1E4F78A50] type:0];
  v7 = (void *)MEMORY[0x1D25F43D0]();
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v4, v6, 0);

  return v8;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [ATXExtraordinaryEventsDataSource alloc];
  v6 = [v4 heuristicDevice];
  v7 = [(ATXExtraordinaryEventsDataSource *)v5 initWithDevice:v6];

  uint64_t v124 = 0;
  v125 = &v124;
  uint64_t v126 = 0x3032000000;
  v127 = __Block_byref_object_copy__4;
  v128 = __Block_byref_object_dispose__4;
  id v129 = 0;
  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__4;
  v122 = __Block_byref_object_dispose__4;
  id v123 = 0;
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = __62__ATXHeuristicEarlyEventAlarm_heuristicResultWithEnvironment___block_invoke;
  v117[3] = &unk_1E68A4F18;
  v117[4] = &v124;
  v117[5] = &v118;
  [(ATXExtraordinaryEventsDataSource *)v7 getEventsWithProminentFeature:&unk_1F2727488 callback:v117];
  if (v119[5])
  {
    v8 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicEarlyEventAlarm heuristicResultWithEnvironment:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = objc_opt_new();
LABEL_40:
    v66 = (ATXContextHeuristicResult *)v16;
    goto LABEL_41;
  }
  v17 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [(id)v125[5] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v132 = v18;
    _os_log_impl(&dword_1D0F43000, v17, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment %lu events", buf, 0xCu);
  }

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v19 = (id)v125[5];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v113 objects:v142 count:16];
  if (!v20)
  {
LABEL_15:

LABEL_37:
    v65 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v65, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: No unusually early event found to set alarm", buf, 2u);
    }

    uint64_t v16 = objc_opt_new();
    goto LABEL_40;
  }
  uint64_t v21 = *(void *)v114;
LABEL_9:
  uint64_t v22 = 0;
  while (1)
  {
    if (*(void *)v114 != v21) {
      objc_enumerationMutation(v19);
    }
    v23 = *(void **)(*((void *)&v113 + 1) + 8 * v22);
    if ([(ATXHeuristicEarlyEventAlarm *)self isEventInterestingForSettingAlarm:v23])
    {
      break;
    }
    if (v20 == ++v22)
    {
      uint64_t v20 = [v19 countByEnumeratingWithState:&v113 objects:v142 count:16];
      if (v20) {
        goto LABEL_9;
      }
      goto LABEL_15;
    }
  }
  id v108 = v23;

  if (!v108) {
    goto LABEL_37;
  }
  v105 = objc_opt_new();
  if (-[ATXHeuristicEarlyEventAlarm shouldShowSuggestionForEarlyEvent:alarms:environment:](self, "shouldShowSuggestionForEarlyEvent:alarms:environment:", v108))
  {
    v106 = [v108 objectForKeyedSubscript:@"startDateTimestamp"];
    v103 = [v108 objectForKeyedSubscript:@"creationDateTimestamp"];
    [v106 doubleValue];
    -[ATXHeuristicEarlyEventAlarm _timestampByOffsettingDays:dayOffset:](self, "_timestampByOffsettingDays:dayOffset:", -1);
    -[ATXHeuristicEarlyEventAlarm _timestampAtDayOfTimestamp:hour:minute:](self, "_timestampAtDayOfTimestamp:hour:minute:", 0, 0);
    double v25 = v24;
    v26 = [(ATXHeuristicEarlyEventAlarm *)self _usualAlarmTimeOfDayDataSourceWithEnvironment:v4];
    v104 = v26;
    if (v26 && [v26 integerValue])
    {
      uint64_t v27 = [v104 integerValue];
      uint64_t v28 = [v104 integerValue];
      v29 = __atxlog_handle_context_heuristic();
      uint64_t v30 = v27 / 3600;
      unint64_t v31 = (unint64_t)((double)(unint64_t)(v28 - 3600 * v30) / 60.0);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v132 = v30;
        __int16 v133 = 2048;
        unint64_t v134 = v31;
        _os_log_impl(&dword_1D0F43000, v29, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment medianSetAlarmTime: %lu:%lu)", buf, 0x16u);
      }

      [(ATXHeuristicEarlyEventAlarm *)self _timestampWithHour:v30 minute:v31 atDayOfTimestamp:v25];
      double v33 = v32;
      v34 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [NSNumber numberWithDouble:v33];
        v36 = locDate(v35);
        *(_DWORD *)buf = 138412290;
        uint64_t v132 = (uint64_t)v36;
        _os_log_impl(&dword_1D0F43000, v34, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment timestampOfSuggestedSetTime: %@)", buf, 0xCu);
      }
      [v106 doubleValue];
      if (v37 - v33 >= 86400.0)
      {
        v38 = __atxlog_handle_context_heuristic();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          locDate(v106);
          id v39 = (id)objc_claimAutoreleasedReturnValue();
          v40 = [NSNumber numberWithDouble:v33];
          v41 = locDate(v40);
          *(_DWORD *)buf = 138412546;
          uint64_t v132 = (uint64_t)v39;
          __int16 v133 = 2112;
          unint64_t v134 = (unint64_t)v41;
          _os_log_impl(&dword_1D0F43000, v38, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment Night owl case detected. Event start time: %@; O"
            "riginal suggested timestamp to show prediction: %@",
            buf,
            0x16u);
        }
        [(ATXHeuristicEarlyEventAlarm *)self _timestampByOffsettingDays:1 dayOffset:v33];
        double v33 = v42;
      }
      v43 = [MEMORY[0x1E4F1C9C8] date];
      [v43 timeIntervalSinceReferenceDate];
      double v45 = v44;

      double v46 = v33 + -3600.0;
      if (v33 + -3600.0 < v45)
      {
        objc_msgSend(v103, "doubleValue", v46);
        double v48 = v47;
        v49 = __atxlog_handle_context_heuristic();
        double v33 = v48 + 3600.0;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = [NSNumber numberWithDouble:v33];
          v51 = locDate(v50);
          *(_DWORD *)buf = 138412290;
          uint64_t v132 = (uint64_t)v51;
          _os_log_impl(&dword_1D0F43000, v49, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment Suggested timestamp to show prediction detected as being in the past. Updating suggested timestamp to show the prediction to 1 hour + eventCreationTime = %@", buf, 0xCu);
        }
      }
      objc_msgSend(v106, "doubleValue", v46);
      double v53 = v52 + -28800.0;
      if (v33 >= v53) {
        double v33 = v53;
      }
      v54 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = [NSNumber numberWithDouble:v33];
        v56 = locDate(v55);
        *(_DWORD *)buf = 138412290;
        uint64_t v132 = (uint64_t)v56;
        _os_log_impl(&dword_1D0F43000, v54, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: heuristicResultWithEnvironment Final suggested timestamp to show the prediction: %@)", buf, 0xCu);
      }
      [v106 doubleValue];
      double v58 = v57;
      v59 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v101 = [v59 localizedStringForKey:@"ALARM_TITLE" value:&stru_1F2719D20 table:0];
      v60 = (void *)MEMORY[0x1E4F1C9C8];
      [v106 doubleValue];
      uint64_t v61 = objc_msgSend(v60, "dateWithTimeIntervalSinceReferenceDate:");
      uint64_t v62 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v61 dateStyle:0 timeStyle:1];
      v102 = [v108 objectForKeyedSubscript:@"eventTitle"];
      +[ATXHeuristicEventUtilities isEventAtOneWithTimestamp:v106];
      v63 = NSString;
      v64 = [v59 localizedStringForKey:@"ALARM_SUBTITLE_(hour is 1)" value:&stru_1F2719D20 table:0];
      v100 = objc_msgSend(v63, "localizedStringWithFormat:", v64, v102, v62, v59, v61, v62);

      double v70 = v33 + -14400.0;
      double v71 = v33 + 14400.0;
      if (v105)
      {
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        id obj = v105;
        uint64_t v72 = [obj countByEnumeratingWithState:&v109 objects:v141 count:16];
        if (v72)
        {
          uint64_t v73 = *(void *)v110;
          while (2)
          {
            for (uint64_t i = 0; i != v72; ++i)
            {
              if (*(void *)v110 != v73) {
                objc_enumerationMutation(obj);
              }
              v75 = *(void **)(*((void *)&v109 + 1) + 8 * i);
              v76 = __atxlog_handle_context_heuristic();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D0F43000, v76, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: Bailing because an alarm was already modified during the suggestion time span", buf, 2u);
              }

              v77 = [v75 objectForKeyedSubscript:@"lastModifiedTS"];
              BOOL v78 = v77 == 0;

              if (!v78)
              {
                v79 = [v75 objectForKeyedSubscript:@"lastModifiedTS"];
                [v79 doubleValue];
                if (v80 >= v70)
                {
                  [v79 doubleValue];
                  if (v81 <= v71)
                  {
                    v96 = __atxlog_handle_context_heuristic();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1D0F43000, v96, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: Bailing because an alarm was already modified during the suggestion time span", buf, 2u);
                    }

                    v66 = (ATXContextHeuristicResult *)objc_opt_new();
                    goto LABEL_71;
                  }
                }
              }
            }
            uint64_t v72 = [obj countByEnumeratingWithState:&v109 objects:v141 count:16];
            if (v72) {
              continue;
            }
            break;
          }
        }
      }
      id obj = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v58 + -3600.0];
      v82 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        v83 = [NSNumber numberWithDouble:v70];
        locDate(v83);
        id v84 = (id)objc_claimAutoreleasedReturnValue();
        v85 = [NSNumber numberWithDouble:v71];
        v86 = locDate(v85);
        *(_DWORD *)buf = 138740995;
        uint64_t v132 = (uint64_t)v101;
        __int16 v133 = 2117;
        unint64_t v134 = (unint64_t)v100;
        __int16 v135 = 2112;
        id v136 = obj;
        __int16 v137 = 2112;
        id v138 = v84;
        __int16 v139 = 2112;
        v140 = v86;
        _os_log_impl(&dword_1D0F43000, v82, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: action title: %{sensitive}@, subtitle: %{sensitive}@ alarmDate:%@, valid between %@ and %@", buf, 0x34u);
      }
      v87 = (void *)MEMORY[0x1E4F4AE38];
      v88 = [v108 objectForKeyedSubscript:@"eventIdentifier"];
      v79 = objc_msgSend(v87, "atx_setAlarmActionWithTitle:subtitle:eventIdentifier:eventTitle:alarmDate:heuristicName:", v101, v100, v88, v102, obj, @"setAlarmForUnusualEarlyEvents");

      v89 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v70];
      v90 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v71];
      v91 = (void *)[objc_alloc(MEMORY[0x1E4F4AE40]) initWithStartDate:v89 endDate:v90 lockScreenEligible:0 predicate:0];
      [v79 setCriteria:v91];
      v92 = +[ATXContextHeuristicSuggestionProducer suggestionWithAction:v79 predictionReasons:0x4000000000 localizedReason:0 score:0 dateInterval:40.0];
      v93 = objc_opt_new();
      v94 = [ATXContextHeuristicResult alloc];
      v130 = v92;
      v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];
      v66 = [(ATXContextHeuristicResult *)v94 initWithSuggestions:v95 additionalRefreshTriggers:v93];

LABEL_71:
    }
    else
    {
      v69 = __atxlog_handle_context_heuristic();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0F43000, v69, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: Suppressing action because user has never set alarm before", buf, 2u);
      }

      v66 = (ATXContextHeuristicResult *)objc_opt_new();
    }
  }
  else
  {
    v68 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v68, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: Earliest event is already covered by user alarm. Skipping", buf, 2u);
    }

    v66 = (ATXContextHeuristicResult *)objc_opt_new();
  }

LABEL_41:
  _Block_object_dispose(&v118, 8);

  _Block_object_dispose(&v124, 8);

  return v66;
}

void __62__ATXHeuristicEarlyEventAlarm_heuristicResultWithEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)isEventInterestingForSettingAlarm:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"isAllDay"];

  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"isAllDay"];
    char v6 = [v5 BOOLValue];

    if (v6) {
      goto LABEL_7;
    }
  }
  uint64_t v7 = [v3 objectForKeyedSubscript:@"nlEventCalendar"];

  if (v7)
  {
    v8 = [v3 objectForKeyedSubscript:@"nlEventCalendar"];
    char v9 = [v8 BOOLValue];

    if (v9) {
      goto LABEL_7;
    }
  }
  uint64_t v10 = [v3 objectForKeyedSubscript:@"eventTitle"];

  if (v10
    && ([v3 objectForKeyedSubscript:@"eventTitle"],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqualToString:@"[Placeholder Item]"],
        v11,
        (v12 & 1) != 0))
  {
LABEL_7:
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)shouldShowSuggestionForEarlyEvent:(id)a3 alarms:(id)a4 environment:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a3 objectForKeyedSubscript:@"startDateTimestamp"];
  [v10 doubleValue];
  double v12 = v11;
  [(ATXHeuristicEarlyEventAlarm *)self _timestampByOffsettingStartOfTodayByNumberOfDays:1];
  double v14 = v13;
  double v15 = v12 + -3540.0;
  uint64_t v16 = [(ATXHeuristicEarlyEventAlarm *)self _enabledAlarmsFromTS:v9 toTS:v13 environment:v15];
  if ([v16 count])
  {
    unint64_t v31 = v10;
    id v32 = v9;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v23 = objc_msgSend(v22, "objectForKeyedSubscript:", @"isEnabled", v31, v32);
          if ([v23 BOOLValue]
            && [(ATXHeuristicEarlyEventAlarm *)self _willAlarm:v22 fireFrom:v14 to:v15])
          {

            BOOL v29 = 0;
            goto LABEL_23;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v17 = v17;
    uint64_t v24 = [v17 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(v17);
          }
          uint64_t v28 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "copy", v31, v32, (void)v33);
          [v8 addObject:v28];
        }
        uint64_t v25 = [v17 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v25);
    }
    BOOL v29 = 1;
LABEL_23:
    uint64_t v10 = v31;
    id v9 = v32;
  }
  else
  {
    v17 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v17, OS_LOG_TYPE_DEFAULT, "ATXHeuristicEarlyEventAlarm: shouldShowSuggestionForEarlyEvent: No existing alarms found", buf, 2u);
    }
    BOOL v29 = 1;
  }

  return v29;
}

- (BOOL)_willAlarm:(id)a3 fireFrom:(double)a4 to:(double)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a3;
  id v9 = [v7 dateWithTimeIntervalSinceReferenceDate:a4];
  uint64_t v10 = [v8 objectForKeyedSubscript:@"MTAlarm"];

  double v11 = [v10 nextFireDateAfterDate:v9];
  double v12 = v11;
  if (v11)
  {
    [v11 timeIntervalSinceReferenceDate];
    BOOL v14 = v13 < a5;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_enabledAlarmsFromTS:(double)a3 toTS:(double)a4 environment:(id)a5
{
  id v7 = a5;
  id v8 = [ATXAlarmsDataSource alloc];
  id v9 = [v7 heuristicDevice];
  uint64_t v10 = [(ATXAlarmsDataSource *)v8 initWithDevice:v9];

  uint64_t v30 = 0;
  unint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = __Block_byref_object_copy__4;
  long long v34 = __Block_byref_object_dispose__4;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a3];
  double v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a4];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __69__ATXHeuristicEarlyEventAlarm__enabledAlarmsFromTS_toTS_environment___block_invoke;
  v23[3] = &unk_1E68A4F18;
  v23[4] = &v30;
  v23[5] = &v24;
  [(ATXAlarmsDataSource *)v10 alarmsFromDate:v11 toDate:v12 completionHandler:v23];
  if (v25[5])
  {
    double v13 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicEarlyEventAlarm _enabledAlarmsFromTS:toTS:environment:](v13, v14, v15, v16, v17, v18, v19, v20);
    }

    id v21 = 0;
  }
  else
  {
    id v21 = (id)v31[5];
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v21;
}

void __69__ATXHeuristicEarlyEventAlarm__enabledAlarmsFromTS_toTS_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_usualAlarmTimeOfDayDataSourceWithEnvironment:(id)a3
{
  id v3 = a3;
  id v4 = [ATXSetAlarmTimeOfDayDataSource alloc];
  id v5 = [v3 heuristicDevice];
  id v6 = [(ATXSetAlarmTimeOfDayDataSource *)v4 initWithDevice:v5];

  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__4;
  uint64_t v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__4;
  uint64_t v22 = __Block_byref_object_dispose__4;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__ATXHeuristicEarlyEventAlarm__usualAlarmTimeOfDayDataSourceWithEnvironment___block_invoke;
  v17[3] = &unk_1E68A4F40;
  v17[4] = &v24;
  v17[5] = &v18;
  [(ATXSetAlarmTimeOfDayDataSource *)v6 alarmTimeOfDay:v17];
  if (v19[5])
  {
    uint64_t v7 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXHeuristicEarlyEventAlarm _usualAlarmTimeOfDayDataSourceWithEnvironment:](v7, v8, v9, v10, v11, v12, v13, v14);
    }

    id v15 = 0;
  }
  else
  {
    id v15 = (id)v25[5];
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v15;
}

void __77__ATXHeuristicEarlyEventAlarm__usualAlarmTimeOfDayDataSourceWithEnvironment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (double)_timestampByOffsettingStartOfTodayByNumberOfDays:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v4 startOfDayForDate:v5];

  if (a3)
  {
    uint64_t v7 = [v4 dateByAddingUnit:16 value:a3 toDate:v6 options:0];
    [v7 timeIntervalSinceReferenceDate];
    double v9 = v8;
  }
  else
  {
    [v6 timeIntervalSinceReferenceDate];
    double v9 = v10;
  }

  return v9;
}

- (double)_timestampWithHour:(unint64_t)a3 minute:(unint64_t)a4 atDayOfTimestamp:(double)a5
{
  double v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a5];
  double v10 = [v8 components:28 fromDate:v9];
  [v10 setHour:a3];
  [v10 setMinute:a4];
  id v11 = [v8 dateFromComponents:v10];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  return v13;
}

- (double)_timestampByOffsettingDays:(double)a3 dayOffset:(int64_t)a4
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a3];
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v7 = [v6 dateByAddingUnit:16 value:a4 toDate:v5 options:0];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;

  return v9;
}

- (void)heuristicResultWithEnvironment:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_enabledAlarmsFromTS:(uint64_t)a3 toTS:(uint64_t)a4 environment:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_usualAlarmTimeOfDayDataSourceWithEnvironment:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end