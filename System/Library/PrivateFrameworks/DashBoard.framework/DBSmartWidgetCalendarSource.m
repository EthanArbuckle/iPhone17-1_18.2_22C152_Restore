@interface DBSmartWidgetCalendarSource
+ (id)predictionClasses;
+ (id)sourceName;
+ (void)load;
- (BOOL)_includeCalendar:(id)a3;
- (BOOL)_includeEvent:(id)a3 forNow:(id)a4;
- (BOOL)shouldKeepPrediction:(id)a3;
- (DBSmartWidgetCalendarSource)initWithDelegate:(id)a3 resourceProvider:(id)a4;
- (EKCalendarVisibilityManager)calendarVisibilityManager;
- (EKEventStore)eventStore;
- (id)freshPredictions;
- (void)_eventStoreDidChange:(id)a3;
- (void)dealloc;
- (void)freshPredictions;
@end

@implementation DBSmartWidgetCalendarSource

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___DBSmartWidgetCalendarSource;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)sourceName
{
  return @"Calendar";
}

+ (id)predictionClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (BOOL)shouldKeepPrediction:(id)a3
{
  v3 = [(DBSmartWidgetSource *)self predictions];
  v4 = [v3 firstObject];
  v5 = [v4 validRanges];
  v6 = [v5 firstObject];

  v7 = [MEMORY[0x263EFF910] now];
  if ([v6 containsDate:v7])
  {
    v8 = [v6 start];
    v9 = [MEMORY[0x263EFF910] distantPast];
    char v10 = [v8 isEqualToDate:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (DBSmartWidgetCalendarSource)initWithDelegate:(id)a3 resourceProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DBSmartWidgetCalendarSource;
  v8 = [(DBSmartWidgetSource *)&v23 initWithDelegate:v6 resourceProvider:v7];
  if (v8)
  {
    v9 = (EKEventStore *)objc_alloc_init(MEMORY[0x263F04B98]);
    eventStore = v8->_eventStore;
    v8->_eventStore = v9;

    objc_initWeak(&location, v8);
    id v11 = objc_alloc(MEMORY[0x263F04B68]);
    v12 = v8->_eventStore;
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __65__DBSmartWidgetCalendarSource_initWithDelegate_resourceProvider___block_invoke;
    v20 = &unk_2649B4738;
    objc_copyWeak(&v21, &location);
    uint64_t v13 = [v11 initWithEventStore:v12 visibilityChangedCallback:&v17 queue:0];
    calendarVisibilityManager = v8->_calendarVisibilityManager;
    v8->_calendarVisibilityManager = (EKCalendarVisibilityManager *)v13;

    v15 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v17, v18, v19, v20);
    [v15 addObserver:v8 selector:sel__eventStoreDidChange_ name:*MEMORY[0x263F04AD8] object:0];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __65__DBSmartWidgetCalendarSource_initWithDelegate_resourceProvider___block_invoke(uint64_t a1)
{
  objc_super v2 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__DBSmartWidgetCalendarSource_initWithDelegate_resourceProvider___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshPredictions];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)DBSmartWidgetCalendarSource;
  [(DBSmartWidgetCalendarSource *)&v5 dealloc];
}

- (id)freshPredictions
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v3 = +[DBApplicationController sharedInstance];
  v4 = [v3 calendarApplication];

  if (!v4)
  {
    objc_super v5 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(DBSmartWidgetCalendarSource *)v5 freshPredictions];
    }
    goto LABEL_7;
  }
  if ([v4 isLockedOrHidden])
  {
    objc_super v5 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(DBSmartWidgetCalendarSource *)v5 freshPredictions];
    }
LABEL_7:
    char v10 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_35;
  }
  v47 = v4;
  objc_super v5 = [MEMORY[0x263EFF910] date];
  id v11 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    [(DBSmartWidgetCalendarSource *)(uint64_t)v5 freshPredictions];
  }

  +[DBSmartWidgetCalendarPrediction setNow:v5];
  uint64_t v12 = +[DBSmartWidgetCalendarPrediction earliestStartDate];
  uint64_t v13 = +[DBSmartWidgetCalendarPrediction latestStartDate];
  v14 = [(DBSmartWidgetCalendarSource *)self calendarVisibilityManager];
  v15 = [v14 visibleCalendars];

  v16 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v53 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        if ([(DBSmartWidgetCalendarSource *)self _includeCalendar:v22]) {
          [v16 addObject:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v19);
  }
  v43 = v17;

  objc_super v23 = [(DBSmartWidgetCalendarSource *)self eventStore];
  v45 = (void *)v13;
  v46 = (void *)v12;
  v44 = v16;
  uint64_t v24 = [v23 predicateForEventsWithStartDate:v12 endDate:v13 calendars:v16];

  v25 = [(DBSmartWidgetCalendarSource *)self eventStore];
  v42 = (void *)v24;
  v26 = [v25 eventsMatchingPredicate:v24];

  v27 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v28 = v26;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        if ([(DBSmartWidgetCalendarSource *)self _includeEvent:v33 forNow:v5])
        {
          v34 = [v33 startDate];
          v35 = [v27 objectForKeyedSubscript:v34];

          if (v35)
          {
            v36 = [v33 startDate];
            v37 = [v27 objectForKeyedSubscript:v36];
            [v37 addEvent:v33];
          }
          else
          {
            v36 = [[DBSmartWidgetCalendarPrediction alloc] initWithEvent:v33];
            [(DBSmartWidgetPrediction *)v36 setDelegate:self];
            v37 = [v33 startDate];
            [v27 setObject:v36 forKeyedSubscript:v37];
          }
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v30);
  }

  v38 = [v27 allValues];
  char v10 = [v38 sortedArrayUsingComparator:&__block_literal_global_19];

  if ([v10 count])
  {
    unint64_t v39 = 0;
    do
    {
      v40 = [v10 objectAtIndexedSubscript:v39];
      [v40 setSoonestEvent:v39 == 0];

      ++v39;
    }
    while ([v10 count] > v39);
  }

  v4 = v47;
LABEL_35:

  return v10;
}

uint64_t __47__DBSmartWidgetCalendarSource_freshPredictions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_super v5 = [a2 startDate];
  uint64_t v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)_includeCalendar:(id)a3
{
  id v3 = a3;
  id v4 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(DBSmartWidgetCalendarSource *)(uint64_t)v3 _includeCalendar:v5];
  }

  uint64_t v6 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetCalendarSource _includeCalendar:]((uint64_t)v3, v6);
  }

  return 1;
}

- (BOOL)_includeEvent:(id)a3 forNow:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetCalendarSource _includeEvent:forNow:].cold.6(v5, v7);
  }

  int v8 = [v5 isAllDay];
  if (v8)
  {
    uint64_t v9 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[DBSmartWidgetCalendarSource _includeEvent:forNow:].cold.5();
    }
  }
  char v10 = [v5 endDate];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;
  [v6 timeIntervalSinceReferenceDate];
  double v14 = v13;

  if (v12 <= v14)
  {
    v16 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[DBSmartWidgetCalendarSource _includeEvent:forNow:].cold.4();
    }

    char v15 = 0;
  }
  else
  {
    char v15 = v8 ^ 1;
  }
  if ([v5 status] == 3)
  {
    id v17 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[DBSmartWidgetCalendarSource _includeEvent:forNow:]();
    }

    char v15 = 0;
  }
  uint64_t v18 = [v5 selfAttendee];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [v5 selfAttendee];
    uint64_t v21 = [v20 participantStatus];

    if (v21 == 3)
    {
      uint64_t v22 = DBLogForCategory(7uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[DBSmartWidgetCalendarSource _includeEvent:forNow:]();
      }

      char v15 = 0;
    }
  }
  objc_super v23 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetCalendarSource _includeEvent:forNow:](v15, v5, v23);
  }

  return v15;
}

- (void)_eventStoreDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F04AD0]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  if (v6)
  {
    uint64_t v7 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DBSmartWidgetCalendarSource _eventStoreDidChange:]();
    }

    [(DBSmartWidgetSource *)self refreshPredictions];
  }
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (EKCalendarVisibilityManager)calendarVisibilityManager
{
  return self->_calendarVisibilityManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarVisibilityManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

void __65__DBSmartWidgetCalendarSource_initWithDelegate_resourceProvider___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Refreshing predictions for visibility change", v2, v3, v4, v5, v6);
}

- (void)freshPredictions
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[DBDateFormatter formattedDateTimeStamp:a1];
  int v5 = 138543362;
  uint8_t v6 = v3;
  OUTLINED_FUNCTION_2_2(&dword_22D6F0000, a2, v4, "now=%{public}@", (uint8_t *)&v5);
}

- (void)_includeCalendar:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = @"including";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ calendar %{public}@", (uint8_t *)&v2, 0x16u);
}

- (void)_includeCalendar:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_2_2(&dword_22D6F0000, a2, a3, "considering calendar %{public}@", (uint8_t *)&v3);
}

- (void)_includeEvent:(NSObject *)a3 forNow:.cold.1(char a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1) {
    uint64_t v4 = @"including";
  }
  else {
    uint64_t v4 = @"NOT including";
  }
  uint64_t v5 = objc_msgSend(a2, "db_ShortDescription");
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_22D6F0000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ event %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_includeEvent:forNow:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "event declined", v2, v3, v4, v5, v6);
}

- (void)_includeEvent:forNow:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "event canceled", v2, v3, v4, v5, v6);
}

- (void)_includeEvent:forNow:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "event ends before now", v2, v3, v4, v5, v6);
}

- (void)_includeEvent:forNow:.cold.5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "event is allDay", v2, v3, v4, v5, v6);
}

- (void)_includeEvent:(void *)a1 forNow:(NSObject *)a2 .cold.6(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(a1, "db_ShortDescription");
  int v5 = 138412290;
  uint8_t v6 = v3;
  OUTLINED_FUNCTION_2_2(&dword_22D6F0000, a2, v4, "considering event %@", (uint8_t *)&v5);
}

- (void)_eventStoreDidChange:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_7(&dword_22D6F0000, v0, v1, "Refreshing predictions for event store change", v2, v3, v4, v5, v6);
}

@end