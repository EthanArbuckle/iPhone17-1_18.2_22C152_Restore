@interface ATXCalendarEventsDataSource
- (ATXCalendarEventsDataSource)initWithDevice:(id)a3;
- (id)eventsFromStartDate:(id)a3 endDate:(id)a4 category:(id)a5 reason:(id)a6;
- (id)eventsFromStartDate:(id)a3 endDate:(id)a4 reason:(id)a5;
- (id)flightEventsFromStartDate:(id)a3 endDate:(id)a4 reason:(id)a5;
- (id)hotelEventsFromStartDate:(id)a3 endDate:(id)a4 reason:(id)a5;
- (id)sortEkEvents:(id)a3;
- (void)calendarEventsFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5;
- (void)visibleCalendarsWithCallback:(id)a3;
@end

@implementation ATXCalendarEventsDataSource

uint64_t __78__ATXCalendarEventsDataSource_calendarEventsFromStartDate_toEndDate_callback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "atx_isAllowedCalendar");
}

- (void)calendarEventsFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, id, void))a5;
  if (ATXHeuristicCanLearnFromApp(&unk_1F2727428))
  {
    v11 = [(ATXHeuristicDevice *)self->_device eventStore];
    v12 = [(ATXHeuristicDevice *)self->_device visibleCalendarsInCurrentFocus];
    v25 = objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_16);
    v24 = objc_msgSend(v11, "predicateForEventsWithStartDate:endDate:calendars:", v8, v9);
    v13 = objc_msgSend(v11, "eventsMatchingPredicate:");
    id v26 = v8;
    [v9 timeIntervalSinceDate:v8];
    unint64_t v15 = vcvtpd_u64_f64(v14 / 86400.0 * 50.0);
    v16 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218752;
      v32 = (__CFString *)v15;
      __int16 v33 = 2048;
      uint64_t v34 = [v13 count];
      __int16 v35 = 2048;
      v36 = v11;
      __int16 v37 = 2048;
      uint64_t v38 = [v12 count];
      _os_log_impl(&dword_1D0F43000, v16, OS_LOG_TYPE_DEFAULT, "Fetching calendar events with limit count of: %ld; actual count: %ld; event store: %p; visible calendars: %ld",
        buf,
        0x2Au);
    }

    v17 = objc_opt_new();
    v18 = (void *)MEMORY[0x1D25F43D0]();
    v19 = v12;
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F93B48]) initWithCountLimit:50];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __78__ATXCalendarEventsDataSource_calendarEventsFromStartDate_toEndDate_callback___block_invoke_19;
    v27[3] = &unk_1E68A5858;
    unint64_t v30 = v15;
    v27[4] = self;
    id v28 = v20;
    id v21 = v17;
    id v29 = v21;
    id v22 = v20;
    [v13 enumerateObjectsUsingBlock:v27];

    v10[2](v10, v21, 0);

    id v8 = v26;
  }
  else
  {
    v23 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = @"com.apple.mobilecal";
      _os_log_impl(&dword_1D0F43000, v23, OS_LOG_TYPE_DEFAULT, "Events data source is not learnable for %{public}@", buf, 0xCu);
    }

    v10[2](v10, (id)MEMORY[0x1E4F1CBF0], 0);
  }
}

- (ATXCalendarEventsDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCalendarEventsDataSource;
  v6 = [(ATXCalendarEventsDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

void __78__ATXCalendarEventsDataSource_calendarEventsFromStartDate_toEndDate_callback___block_invoke_19(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = (void *)MEMORY[0x1D25F43D0]();
  if (a4 && *(void *)(a1 + 56) <= (unint64_t)a3)
  {
    objc_super v9 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      v16 = a3;
      _os_log_impl(&dword_1D0F43000, v9, OS_LOG_TYPE_DEFAULT, "Stopped iterating events early after index: %ld", (uint8_t *)&v15, 0xCu);
    }

    *a4 = 1;
  }
  else
  {
    v10 = [*(id *)(*(void *)(a1 + 32) + 8) dictForEvent:v7 contactCache:*(void *)(a1 + 40)];
    v11 = __atxlog_handle_heuristic();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        v13 = [v7 eventIdentifier];
        int v15 = 138412547;
        v16 = v13;
        __int16 v17 = 2117;
        id v18 = v7;
        _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "Considering event: %@ %{sensitive}@", (uint8_t *)&v15, 0x16u);
      }
      [*(id *)(a1 + 48) addObject:v10];
    }
    else
    {
      if (v12)
      {
        double v14 = [v7 eventIdentifier];
        int v15 = 138412547;
        v16 = v14;
        __int16 v17 = 2117;
        id v18 = v7;
        _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring event: %@ %{sensitive}@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (void)visibleCalendarsWithCallback:(id)a3
{
  v6 = (void (**)(id, void *, void))a3;
  if (ATXHeuristicCanLearnFromApp(&unk_1F2727440))
  {
    v4 = [(ATXHeuristicDevice *)self->_device visibleCalendarsInCurrentFocus];
    id v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_26_0);
    v6[2](v6, v5, 0);
  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E4F1CBF0], 0);
  }
}

id __60__ATXCalendarEventsDataSource_visibleCalendarsWithCallback___block_invoke(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (!objc_msgSend(v2, "atx_isAllowedCalendar"))
  {
    v6 = 0;
    goto LABEL_12;
  }
  v3 = [v2 title];
  uint64_t v4 = [v2 calendarIdentifier];
  id v5 = (void *)v4;
  if (!v3)
  {
    id v7 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __60__ATXCalendarEventsDataSource_visibleCalendarsWithCallback___block_invoke_cold_1(v7);
    }
    goto LABEL_10;
  }
  if (!v4)
  {
    id v7 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __60__ATXCalendarEventsDataSource_visibleCalendarsWithCallback___block_invoke_cold_2(v7);
    }
LABEL_10:

    v6 = 0;
    goto LABEL_11;
  }
  v9[0] = @"title";
  v9[1] = @"identifier";
  v10[0] = v3;
  v10[1] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
LABEL_11:

LABEL_12:

  return v6;
}

- (id)eventsFromStartDate:(id)a3 endDate:(id)a4 reason:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  if (ATXHeuristicCanLearnFromApp(&unk_1F2727458))
  {
    v11 = [(ATXHeuristicDevice *)self->_device eventStore];
    BOOL v12 = [(ATXHeuristicDevice *)self->_device visibleCalendarsRegardlessOfFocus];
    v13 = objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_38_0);
    double v14 = [v11 predicateForEventsWithStartDate:v8 endDate:v9 calendars:v13];
    int v15 = [v11 eventsMatchingPredicate:v14];
    v16 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138413058;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2048;
      uint64_t v23 = [v15 count];
      __int16 v24 = 2114;
      id v25 = v10;
      _os_log_impl(&dword_1D0F43000, v16, OS_LOG_TYPE_DEFAULT, "Fetching calendar events start: %@, end: %@ count: %ld reason: %{public}@", (uint8_t *)&v18, 0x2Au);
    }
  }
  else
  {
    v11 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      uint64_t v19 = @"com.apple.mobilecal";
      _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "Events data source is not learnable for %{public}@", (uint8_t *)&v18, 0xCu);
    }
    int v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

uint64_t __66__ATXCalendarEventsDataSource_eventsFromStartDate_endDate_reason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "atx_isAllowedCalendar");
}

- (id)sortEkEvents:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_41_0];
}

uint64_t __44__ATXCalendarEventsDataSource_sortEkEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)eventsFromStartDate:(id)a3 endDate:(id)a4 category:(id)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  BOOL v12 = [(ATXCalendarEventsDataSource *)self eventsFromStartDate:v10 endDate:a4 reason:a6];
  v13 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __75__ATXCalendarEventsDataSource_eventsFromStartDate_endDate_category_reason___block_invoke;
  __int16 v22 = &unk_1E68A54B0;
  id v23 = v11;
  id v24 = v10;
  id v14 = v10;
  id v15 = v11;
  v16 = [v13 predicateWithBlock:&v19];
  __int16 v17 = objc_msgSend(v12, "filteredArrayUsingPredicate:", v16, v19, v20, v21, v22);

  return v17;
}

BOOL __75__ATXCalendarEventsDataSource_eventsFromStartDate_endDate_category_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 customObjectForKey:@"SGEventMetadataKey"];
  id v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"SGEventMetadataCategoryDescriptionKey"],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:*(void *)(a1 + 32)],
        v6,
        v7))
  {
    if ([*(id *)(a1 + 32) isEqualToString:@"Lodging"])
    {
      BOOL v8 = 1;
    }
    else
    {
      id v10 = *(void **)(a1 + 40);
      id v11 = [v3 startDate];
      BOOL v8 = [v10 compare:v11] == -1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)flightEventsFromStartDate:(id)a3 endDate:(id)a4 reason:(id)a5
{
  return [(ATXCalendarEventsDataSource *)self eventsFromStartDate:a3 endDate:a4 category:@"Flight" reason:a5];
}

- (id)hotelEventsFromStartDate:(id)a3 endDate:(id)a4 reason:(id)a5
{
  return [(ATXCalendarEventsDataSource *)self eventsFromStartDate:a3 endDate:a4 category:@"Lodging" reason:a5];
}

void __60__ATXCalendarEventsDataSource_visibleCalendarsWithCallback___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0F43000, log, OS_LOG_TYPE_FAULT, "Nullability violation: -[EKCalendar title] returned nil", v1, 2u);
}

void __60__ATXCalendarEventsDataSource_visibleCalendarsWithCallback___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0F43000, log, OS_LOG_TYPE_FAULT, "Nullability violation: -[EKCalendar calendarIdentifier] returned nil", v1, 2u);
}

@end