@interface CLSInputTimeClue
+ (id)clueWithDates:(id)a3 serviceManager:(id)a4;
- (NSArray)events;
- (double)timeInterval;
- (id)description;
- (id)localDates;
- (id)localEndDate;
- (id)localStartDate;
- (id)universalDates;
- (id)universalEndDate;
- (id)universalStartDate;
- (unint64_t)numberOfDays;
- (void)_computeDateProperties;
- (void)_prepareWithProgressBlock:(id)a3;
- (void)setEvents:(id)a3;
@end

@implementation CLSInputTimeClue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
  objc_storeStrong((id *)&self->_universalDates, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_localDates, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_dateComponentsArray, 0);
}

- (void)_computeDateProperties
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  v19 = [MEMORY[0x1E4F1CA80] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_dateComponentsArray;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v9 = +[CLSCalendar dateFromComponents:v8 inTimeZone:0];
        [v3 addObject:v9];
        v10 = [v8 timeZone];
        v11 = +[CLSCalendar dateFromComponents:v8 inTimeZone:v10];

        [v19 addObject:v11];
        p_universalStartDate = &self->_universalStartDate;
        if (!self->_universalStartDate)
        {
          objc_storeStrong((id *)&self->_universalStartDate, v9);
          objc_storeStrong((id *)&self->_universalEndDate, v9);
          objc_storeStrong((id *)&self->_localStartDate, v11);
          p_localEndDate = &self->_localEndDate;
LABEL_14:
          objc_storeStrong((id *)p_localEndDate, v11);
          goto LABEL_15;
        }
        if (objc_msgSend(v9, "compare:") == -1
          || (p_universalStartDate = &self->_universalEndDate, [v9 compare:self->_universalEndDate] == 1))
        {
          objc_storeStrong((id *)p_universalStartDate, v9);
        }
        p_localEndDate = &self->_localStartDate;
        if ([v11 compare:self->_localStartDate] == -1) {
          goto LABEL_14;
        }
        p_localEndDate = &self->_localEndDate;
        if ([v11 compare:self->_localEndDate] == 1) {
          goto LABEL_14;
        }
LABEL_15:
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  v14 = [MEMORY[0x1E4F1CAD0] setWithSet:v3];
  universalDates = self->_universalDates;
  self->_universalDates = v14;

  v16 = [MEMORY[0x1E4F1CAD0] setWithSet:v19];
  localDates = self->_localDates;
  self->_localDates = v16;
}

- (void)_prepareWithProgressBlock:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!self->_dateComponentsArray)
  {
    location = (id *)&self->_dateComponentsArray;
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v31 = self;
    uint64_t v5 = [(CLSClue *)self value];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      unint64_t v9 = 0x1E4F1C000uLL;
      v32 = v5;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v4 addObject:v11];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v12 = +[CLSCalendar componentsFromDate:v11 inTimeZone:0];
              [v4 addObject:v12];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unint64_t v13 = v9;
                v14 = (void *)[objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:8 error:0];
                v15 = objc_msgSend(v14, "matchesInString:options:range:", v11, 0, 0, objc_msgSend(v11, "length"));
                v16 = [v15 objectAtIndex:0];

                v17 = [v16 timeZone];
                v18 = v17;
                if (v17)
                {
                  id v19 = v17;
                }
                else
                {
                  id v19 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
                }
                long long v22 = v19;

                long long v23 = [v16 date];
                v24 = +[CLSCalendar componentsFromDate:v23 inTimeZone:v22];
                [v4 addObject:v24];

                unint64_t v9 = v13;
                uint64_t v5 = v32;
              }
              else
              {
                long long v20 = +[CLSLogging sharedLogging];
                long long v21 = [v20 loggingConnection];

                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v39 = v11;
                  _os_log_error_impl(&dword_1D2150000, v21, OS_LOG_TYPE_ERROR, "Failed to convert date \"%@\" when creating clue", buf, 0xCu);
                }
              }
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v7);
    }

    objc_storeStrong(location, v4);
    if (!v31->_universalDates) {
      [(CLSInputTimeClue *)v31 _computeDateProperties];
    }
    if (!v31->_events)
    {
      if (CLSDeviceIs2GBOrLess_onceToken != -1) {
        dispatch_once(&CLSDeviceIs2GBOrLess_onceToken, &__block_literal_global_216);
      }
      if (CLSDeviceIs2GBOrLess_sDeviceIs2GBOrLess)
      {
        events = v31->_events;
        v31->_events = (NSArray *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        serviceManager = v31->_serviceManager;
        universalEndDate = v31->_universalEndDate;
        v37[0] = v31->_universalStartDate;
        v37[1] = universalEndDate;
        events = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
        uint64_t v28 = [(CLSServiceManager *)serviceManager eventsForDates:events];
        v29 = v31->_events;
        v31->_events = (NSArray *)v28;
      }
    }
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v15.receiver = self;
  v15.super_class = (Class)CLSInputTimeClue;
  uint64_t v4 = [(CLSClue *)&v15 description];
  uint64_t v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(CLSInputTimeClue *)self universalDates];
  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = [v7 flattenWithSeparator:@", "];
  [v5 appendFormat:@"\n\tuniversalDates:[%@]", v8];

  unint64_t v9 = [(CLSInputTimeClue *)self localDates];
  v10 = [v9 allObjects];
  v11 = [v10 flattenWithSeparator:@", "];
  [v5 appendFormat:@"\n\tlocalDates:[%@]", v11];

  if ([(NSArray *)self->_events count])
  {
    v12 = [(NSArray *)self->_events valueForKeyPath:@"title"];
    unint64_t v13 = [v12 flattenWithSeparator:@", "];
    [v5 appendFormat:@"\n\tevents:[%@]", v13];
  }
  return v5;
}

- (void)setEvents:(id)a3
{
}

- (NSArray)events
{
  [(CLSInputClue *)self prepareIfNeeded];
  events = self->_events;
  return events;
}

- (unint64_t)numberOfDays
{
  [(CLSInputClue *)self prepareIfNeeded];
  [(NSDate *)self->_localEndDate timeIntervalSinceDate:self->_localStartDate];
  return (unint64_t)(ceil(v3) / 86400.0);
}

- (double)timeInterval
{
  [(CLSInputClue *)self prepareIfNeeded];
  localEndDate = self->_localEndDate;
  localStartDate = self->_localStartDate;
  [(NSDate *)localEndDate timeIntervalSinceDate:localStartDate];
  return result;
}

- (id)localEndDate
{
  [(CLSInputClue *)self prepareIfNeeded];
  localEndDate = self->_localEndDate;
  return localEndDate;
}

- (id)localStartDate
{
  [(CLSInputClue *)self prepareIfNeeded];
  localStartDate = self->_localStartDate;
  return localStartDate;
}

- (id)localDates
{
  [(CLSInputClue *)self prepareIfNeeded];
  localDates = self->_localDates;
  return localDates;
}

- (id)universalEndDate
{
  [(CLSInputClue *)self prepareIfNeeded];
  universalEndDate = self->_universalEndDate;
  return universalEndDate;
}

- (id)universalStartDate
{
  [(CLSInputClue *)self prepareIfNeeded];
  universalStartDate = self->_universalStartDate;
  return universalStartDate;
}

- (id)universalDates
{
  [(CLSInputClue *)self prepareIfNeeded];
  universalDates = self->_universalDates;
  return universalDates;
}

+ (id)clueWithDates:(id)a3 serviceManager:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[CLSClue _clueWithValue:a3 forKey:@"Global Time"];
  uint64_t v7 = (void *)v6[21];
  v6[21] = v5;

  return v6;
}

@end