@interface ATXHeuristicAlarmUtilities
+ (BOOL)isValidNonRecentlyModifiedAlarm:(id)a3 duringInterval:(id)a4;
+ (id)alarmDataWithAlarmDict:(id)a3;
+ (id)alarmTrigger;
+ (id)fireDateWithAlarmDict:(id)a3;
+ (id)firstFiringAmongAlarms:(id)a3;
+ (id)localizedTimeWithAlarmDict:(id)a3;
@end

@implementation ATXHeuristicAlarmUtilities

+ (id)alarmTrigger
{
  v2 = +[ATXHeuristicDevice sharedAlarmManager];
  [v2 checkIn];

  v3 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v4 = [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v3 initWithNotification:*MEMORY[0x1E4F78A50] type:0];

  return v4;
}

+ (id)localizedTimeWithAlarmDict:(id)a3
{
  v3 = [a1 fireDateWithAlarmDict:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateStyle:0];
  [v4 setTimeStyle:1];
  v5 = [v4 stringFromDate:v3];

  return v5;
}

+ (BOOL)isValidNonRecentlyModifiedAlarm:(id)a3 duringInterval:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"playsOnThisDevice"];
  v8 = [v5 objectForKeyedSubscript:@"lastModifiedTS"];
  v9 = [v6 startDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  v12 = [v6 endDate];

  [v12 timeIntervalSinceReferenceDate];
  double v14 = v13;

  [v8 doubleValue];
  if (v15 >= v11)
  {
    [v8 doubleValue];
    BOOL v16 = v17 <= v14;
  }
  else
  {
    BOOL v16 = 0;
  }
  v18 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = +[ATXHeuristicAlarmUtilities localizedTimeWithAlarmDict:v5];
    v20 = (void *)MEMORY[0x1E4F1C9C8];
    [v8 doubleValue];
    v21 = objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");
    if (v21)
    {
      v22 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v21 dateStyle:1 timeStyle:1];
    }
    else
    {
      v22 = 0;
    }

    int v25 = 138412802;
    v26 = v19;
    __int16 v27 = 2112;
    v28 = v22;
    __int16 v29 = 1024;
    BOOL v30 = v16;
    _os_log_impl(&dword_1D0F43000, v18, OS_LOG_TYPE_DEFAULT, "ATXHeuristicAlarmUtilities: alarm at %@ was modified at %@ recently? %{BOOL}d", (uint8_t *)&v25, 0x1Cu);
  }
  char v23 = [v7 BOOLValue];

  return v23 & !v16;
}

+ (id)firstFiringAmongAlarms:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v7)
        {
          id v11 = +[ATXHeuristicAlarmUtilities fireDateWithAlarmDict:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if ([v11 compare:v6] == -1)
          {
            id v11 = v11;

            id v12 = v10;
            id v6 = v11;
            id v7 = v12;
          }
        }
        else
        {
          id v7 = v10;
          +[ATXHeuristicAlarmUtilities fireDateWithAlarmDict:v7];
          id v6 = v11 = v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
    id v7 = 0;
  }

  return v7;
}

+ (id)fireDateWithAlarmDict:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"MTAlarm"];
  uint64_t v4 = [v3 nextFireDate];

  return v4;
}

+ (id)alarmDataWithAlarmDict:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"MTAlarm"];
  uint64_t v4 = [v3 intentAlarm];
  id v5 = objc_alloc_init(MEMORY[0x1E4F30520]);
  id v6 = [v5 encodeObject:v4];

  return v6;
}

@end