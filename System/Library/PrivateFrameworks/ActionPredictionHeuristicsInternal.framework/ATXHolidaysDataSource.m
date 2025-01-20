@interface ATXHolidaysDataSource
- (ATXHolidaysDataSource)initWithDevice:(id)a3;
- (id)_holidayCalendarForEventStore:(id)a3;
- (void)holidaysFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5;
@end

@implementation ATXHolidaysDataSource

- (ATXHolidaysDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHolidaysDataSource;
  v6 = [(ATXHolidaysDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (id)_holidayCalendarForEventStore:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = [a3 sources];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        objc_super v9 = objc_msgSend(v8, "calendarsForEntityType:", 0, 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v18;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v17 + 1) + 8 * j);
              if ([v14 type] == 3 && (objc_msgSend(v14, "isSubscribedHolidayCalendar") & 1) != 0)
              {
                id v15 = v14;

                goto LABEL_20;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      id v15 = 0;
    }
    while (v5);
  }
  else
  {
    id v15 = 0;
  }
LABEL_20:

  return v15;
}

- (void)holidaysFromStartDate:(id)a3 toEndDate:(id)a4 callback:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  if (ATXHeuristicCanLearnFromApp(&unk_1F2727410))
  {
    uint64_t v11 = [(ATXHeuristicDevice *)self->_device eventStore];
    uint64_t v12 = [(ATXHolidaysDataSource *)self _holidayCalendarForEventStore:v11];
    v13 = (void *)v12;
    if (v12)
    {
      v25 = (void *)v12;
      v32[0] = v12;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      id v26 = v8;
      uint64_t v15 = [v11 predicateForEventsWithStartDate:v8 endDate:v9 calendars:v14];

      v16 = [MEMORY[0x1E4F1CA48] array];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v24 = (void *)v15;
      long long v17 = [v11 eventsMatchingPredicate:v15];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v17);
            }
            long long v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if ([v22 isAllDay])
            {
              long long v23 = [(ATXHeuristicDevice *)self->_device dictForEvent:v22];
              if (v23) {
                [v16 addObject:v23];
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v19);
      }

      v10[2](v10, v16, 0);
      v13 = v25;
      id v8 = v26;
    }
    else
    {
      v10[2](v10, (void *)MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    v10[2](v10, (void *)MEMORY[0x1E4F1CBF0], 0);
  }
}

- (void).cxx_destruct
{
}

@end