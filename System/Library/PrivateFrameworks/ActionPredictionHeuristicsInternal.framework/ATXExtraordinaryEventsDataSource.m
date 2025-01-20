@interface ATXExtraordinaryEventsDataSource
+ (id)_endOfDayAfterDate:(id)a3 numberOfDays:(int64_t)a4;
- (ATXExtraordinaryEventsDataSource)initWithDevice:(id)a3;
- (id)_ekEventForHighlight:(id)a3 eventStore:(id)a4;
- (id)_fetchExtraordinaryEvents;
- (void)_fetchExtraordinaryEvents;
- (void)getEventsWithProminentFeature:(id)a3 callback:(id)a4;
@end

@implementation ATXExtraordinaryEventsDataSource

- (void)getEventsWithProminentFeature:(id)a3 callback:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (ATXHeuristicCanLearnFromApp(&unk_1F27272C0))
  {
    id v29 = v7;
    v31 = objc_opt_new();
    v8 = [(ATXExtraordinaryEventsDataSource *)self _fetchExtraordinaryEvents];
    v34 = [(ATXHeuristicDevice *)self->_device eventStore];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v36;
      id v30 = v6;
      do
      {
        uint64_t v12 = 0;
        uint64_t v32 = v10;
        do
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1D25F43D0]();
          if (!v6 || (uint64_t v15 = [v13 prominentFeature], v15 == objc_msgSend(v6, "unsignedIntegerValue")))
          {
            v16 = -[ATXExtraordinaryEventsDataSource _ekEventForHighlight:eventStore:](self, "_ekEventForHighlight:eventStore:", v13, v34, v29);
            if (v16)
            {
              v17 = self;
              v18 = [(ATXHeuristicDevice *)self->_device dictForEvent:v16];
              v19 = v18;
              if (v18)
              {
                v20 = [v18 objectForKeyedSubscript:@"contacts"];

                if (v20)
                {
                  v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isExtraordinary"));
                  [v19 setObject:v21 forKeyedSubscript:@"isExtraordinary"];

                  [v13 score];
                  if (v22 != 0.0)
                  {
                    v23 = NSNumber;
                    [v13 score];
                    v24 = objc_msgSend(v23, "numberWithDouble:");
                    [v19 setObject:v24 forKeyedSubscript:@"extraordinaryScore"];

                    v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "prominentFeature"));
                    [v19 setObject:v25 forKeyedSubscript:@"extraordinaryProminentFeature"];
                  }
                  [v31 addObject:v19];
                  id v6 = v30;
                }
              }

              self = v17;
              uint64_t v10 = v32;
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v10);
    }

    v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDateTimestamp" ascending:1];
    v39[0] = v26;
    v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"extraordinaryScore" ascending:1];
    v39[1] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    [v31 sortUsingDescriptors:v28];

    id v7 = v29;
    (*((void (**)(id, void *, void))v29 + 2))(v29, v31, 0);
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
  }
}

- (ATXExtraordinaryEventsDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXExtraordinaryEventsDataSource;
  id v6 = [(ATXExtraordinaryEventsDataSource *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = objc_opt_new();
    extraordinaryEventStore = v7->_extraordinaryEventStore;
    v7->_extraordinaryEventStore = (PPEventStore *)v8;
  }
  return v7;
}

- (id)_fetchExtraordinaryEvents
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  id v5 = [(id)objc_opt_class() _endOfDayAfterDate:v4 numberOfDays:2];
  extraordinaryEventStore = self->_extraordinaryEventStore;
  id v20 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __61__ATXExtraordinaryEventsDataSource__fetchExtraordinaryEvents__block_invoke;
  v18 = &unk_1E68A5020;
  id v7 = v3;
  id v19 = v7;
  [(PPEventStore *)extraordinaryEventStore iterEventHighlightsFrom:v4 to:v5 options:0 error:&v20 block:&v15];
  id v8 = v20;
  uint64_t v9 = __atxlog_handle_heuristic();
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(ATXExtraordinaryEventsDataSource *)(uint64_t)v8 _fetchExtraordinaryEvents];
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = objc_msgSend(v7, "count", v15, v16, v17, v18);
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1D0F43000, v10, OS_LOG_TYPE_INFO, "Got %tu event highlights from PersonalPortrait.", buf, 0xCu);
  }

  uint64_t v12 = v19;
  id v13 = v7;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraordinaryEventStore, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

+ (id)_endOfDayAfterDate:(id)a3 numberOfDays:(int64_t)a4
{
  if (a3)
  {
    id v5 = (void *)MEMORY[0x1E4F1C9A8];
    id v6 = a3;
    id v7 = [v5 currentCalendar];
    id v8 = [v7 components:28 fromDate:v6];

    [v8 setHour:23];
    [v8 setMinute:59];
    [v8 setSecond:59];
    [v8 setNanosecond:999999999];
    uint64_t v9 = [v7 dateFromComponents:v8];
    uint64_t v10 = objc_opt_new();
    [v10 setDay:a4];
    uint64_t v11 = [v7 dateByAddingComponents:v10 toDate:v9 options:0];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_ekEventForHighlight:(id)a3 eventStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 eventIdentifier];
  id v8 = [v6 eventWithIdentifier:v7];

  if (!v8)
  {
    uint64_t v9 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXExtraordinaryEventsDataSource _ekEventForHighlight:eventStore:](v5, v9);
    }
  }

  return v8;
}

uint64_t __61__ATXExtraordinaryEventsDataSource__fetchExtraordinaryEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_ekEventForHighlight:(void *)a1 eventStore:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 eventIdentifier];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "Failed to get event with identifier %@", (uint8_t *)&v4, 0xCu);
}

- (void)_fetchExtraordinaryEvents
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "Error when fetching event highlights from PersonalPortrait: %@", (uint8_t *)&v2, 0xCu);
}

@end