@interface EKRecurrenceGenerator
+ (BOOL)_isLunarBirthdayRecurrenceRule:(id)a3 lunarCalendarString:(id)a4;
+ (id)_copyDatesForLunarBirthdayFromDate:(id)a3 toDate:(id)a4 inTimeZone:(id)a5 lunarCalendarString:(id)a6;
+ (id)_daysOfWeekFromICSRule:(id)a3;
+ (id)datesByExpandingRule:(id)a3 fromDate:(id)a4 toDate:(id)a5 inTimezone:(id)a6 isAllDay:(BOOL)a7 lunarCalendarString:(id)a8;
+ (int)_convertEKRecurrenceFrequencyToCalRecurrenceFrequency:(int64_t)a3;
+ (unint64_t)_weekStartFromICSRule:(id)a3;
- (BOOL)isOccurrenceDate:(id)a3 validForEvent:(id)a4;
- (BOOL)occurrenceDate:(id)a3 matchesRecurrenceRule:(id)a4 forEvent:(id)a5 includeDetachedEventsInSeries:(BOOL)a6;
- (id)_copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 exceptionDates:(id)a8 limit:(int64_t)a9 adjustDatesForAllDayEvents:(BOOL)a10;
- (id)adjustedExceptionDatesFromDates:(id)a3 fromGMTToTimeZone:(id)a4;
- (id)copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 exceptionDates:(id)a8 limit:(int64_t)a9;
- (id)copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 exceptionDates:(id)a8 limit:(int64_t)a9 adjustDatesForAllDayEvents:(BOOL)a10;
- (id)copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 limit:(int64_t)a8;
- (id)copyOccurrenceDatesWithEKEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 exceptionDates:(id)a7 limit:(int64_t)a8 adjustDatesForAllDayEvents:(BOOL)a9;
- (id)copyOccurrenceDatesWithEKEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7;
- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 exceptionDates:(id)a5 initialDate:(id)a6 afterDate:(id)a7;
- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 exceptionDates:(id)a5 initialDate:(id)a6 afterDate:(id)a7 inclusive:(BOOL)a8;
- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 initialDate:(id)a5 afterDate:(id)a6;
- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 initialDate:(id)a5 afterDate:(id)a6 inclusive:(BOOL)a7;
- (void)_prepareForEKRecurrence:(id)a3 forCalendarItem:(id)a4;
- (void)_setupForEKEvent:(id)a3 adjustDatesForAllDayEvents:(BOOL)a4;
@end

@implementation EKRecurrenceGenerator

- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 exceptionDates:(id)a5 initialDate:(id)a6 afterDate:(id)a7 inclusive:(BOOL)a8
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v52 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [v15 date];
  [(CalRecurrenceGenerator *)self setEventStartDate:v17];

  v18 = [v15 date];
  [(CalRecurrenceGenerator *)self setEventEndDate:v18];

  v19 = [v15 timeZone];
  [(CalRecurrenceGenerator *)self setEventTimeZone:v19];

  [(CalRecurrenceGenerator *)self setAllDay:0];
  v20 = (void *)MEMORY[0x1E4F57838];
  v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:1577840000.0];
  v46 = v15;
  v22 = [v15 timeZone];
  v47 = [v20 calendarDateWithDate:v21 timeZone:v22];

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v13;
  uint64_t v50 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v50)
  {
    uint64_t v49 = *(void *)v60;
LABEL_3:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v60 != v49) {
        objc_enumerationMutation(obj);
      }
      v24 = (void *)MEMORY[0x1A62664B0]([(EKRecurrenceGenerator *)self _prepareForEKRecurrence:*(void *)(*((void *)&v59 + 1) + 8 * v23) forCalendarItem:v52]);
      if (a8)
      {
        uint64_t v25 = [v16 copy];
      }
      else
      {
        uint64_t v25 = [v16 calendarDateByAddingSeconds:1];
      }
      v26 = (void *)v25;
      v27 = [(CalRecurrenceGenerator *)self endDate];

      if (v27)
      {
        v28 = (void *)MEMORY[0x1E4F57838];
        v29 = [(CalRecurrenceGenerator *)self endDate];
        v30 = [v16 timeZone];
        v31 = [v28 calendarDateWithDate:v29 timeZone:v30];

        v32 = [v31 date];
        v33 = [v32 dateByAddingTimeInterval:1.0];
      }
      else
      {
        v33 = [v47 date];
      }
      uint64_t v34 = [v14 count] + 1;
      v35 = [v26 date];
      v36 = [v16 timeZone];
      id v37 = [(CalRecurrenceGenerator *)self copyOccurrenceDatesBetweenStartDate:v35 endDate:v33 timeZone:v36 limit:v34];

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v38 = v37;
      id v39 = (id)[v38 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v39)
      {
        v53 = v26;
        v54 = v24;
        v40 = self;
        id v41 = v16;
        uint64_t v42 = *(void *)v56;
        while (2)
        {
          for (i = 0; i != v39; i = (char *)i + 1)
          {
            if (*(void *)v56 != v42) {
              objc_enumerationMutation(v38);
            }
            v44 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            if (([v14 containsObject:v44] & 1) == 0)
            {
              id v39 = v44;
              goto LABEL_22;
            }
          }
          id v39 = (id)[v38 countByEnumeratingWithState:&v55 objects:v63 count:16];
          if (v39) {
            continue;
          }
          break;
        }
LABEL_22:
        id v16 = v41;
        self = v40;
        v26 = v53;
        v24 = v54;
      }

      if (v39) {
        break;
      }
      if (++v23 == v50)
      {
        uint64_t v50 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
        if (v50) {
          goto LABEL_3;
        }
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    id v39 = 0;
  }

  return v39;
}

- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 exceptionDates:(id)a5 initialDate:(id)a6 afterDate:(id)a7
{
  return [(EKRecurrenceGenerator *)self nextOccurrenceDateWithEKRecurrences:a3 forCalendarItem:a4 exceptionDates:a5 initialDate:a6 afterDate:a7 inclusive:0];
}

- (void)_prepareForEKRecurrence:(id)a3 forCalendarItem:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  -[CalRecurrenceGenerator setInterval:](self, "setInterval:", [v22 interval]);
  -[CalRecurrenceGenerator setFrequency:](self, "setFrequency:", objc_msgSend((id)objc_opt_class(), "_convertEKRecurrenceFrequencyToCalRecurrenceFrequency:", objc_msgSend(v22, "frequency")));
  -[CalRecurrenceGenerator setWeekStart:](self, "setWeekStart:", (int)[v22 firstDayOfTheWeek]);
  if (![(CalRecurrenceGenerator *)self weekStart]) {
    [(CalRecurrenceGenerator *)self setWeekStart:2];
  }
  v7 = [v6 constraints];
  -[CalRecurrenceGenerator setShouldPinMonthDays:](self, "setShouldPinMonthDays:", [v7 recurrencesShouldPinToMonthDays]);

  v8 = [v22 daysOfTheWeek];
  [(CalRecurrenceGenerator *)self setDaysOfTheWeek:v8];

  v9 = [v22 daysOfTheMonth];
  [(CalRecurrenceGenerator *)self setDaysOfTheMonth:v9];

  v10 = [v22 daysOfTheYear];
  [(CalRecurrenceGenerator *)self setDaysOfTheYear:v10];

  v11 = [v22 weeksOfTheYear];
  [(CalRecurrenceGenerator *)self setWeeksOfTheYear:v11];

  v12 = [v22 monthsOfTheYear];
  [(CalRecurrenceGenerator *)self setMonthsOfTheYear:v12];

  id v13 = [v22 setPositions];
  [(CalRecurrenceGenerator *)self setSetPositions:v13];

  [(CalRecurrenceGenerator *)self setEndDate:0];
  id v14 = [v22 recurrenceEnd];
  uint64_t v15 = [v14 occurrenceCount];

  id v16 = [v22 recurrenceEnd];
  v17 = v16;
  if (v15)
  {
    v18 = -[CalRecurrenceGenerator computeRecurrenceEndDate:](self, "computeRecurrenceEndDate:", [v16 occurrenceCount]);
    [(CalRecurrenceGenerator *)self setEndDate:v18];
  }
  else
  {
    v19 = [v16 endDate];
    [(CalRecurrenceGenerator *)self setEndDate:v19];

    if (![(CalRecurrenceGenerator *)self allDay]) {
      goto LABEL_8;
    }
    v17 = [(CalRecurrenceGenerator *)self endDate];
    v18 = [v6 eventStore];
    v20 = [v18 timeZone];
    v21 = [v17 dateInTimeZone:0 fromTimeZone:v20];
    [(CalRecurrenceGenerator *)self setEndDate:v21];
  }
LABEL_8:
}

+ (int)_convertEKRecurrenceFrequencyToCalRecurrenceFrequency:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 1;
  }
  else {
    return a3 + 1;
  }
}

- (void)_setupForEKEvent:(id)a3 adjustDatesForAllDayEvents:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  id v6 = [v17 initialStartDate];
  [(CalRecurrenceGenerator *)self setEventStartDate:v6];

  v7 = [v17 initialEndDate];
  [(CalRecurrenceGenerator *)self setEventEndDate:v7];

  v8 = [v17 timeZone];
  [(CalRecurrenceGenerator *)self setEventTimeZone:v8];

  -[CalRecurrenceGenerator setAllDay:](self, "setAllDay:", [v17 isAllDay]);
  if (v4 && [v17 isFloating])
  {
    v9 = [(CalRecurrenceGenerator *)self eventStartDate];
    v10 = [v17 eventStore];
    v11 = [v10 timeZone];
    v12 = [v9 dateInTimeZone:0 fromTimeZone:v11];
    [(CalRecurrenceGenerator *)self setEventStartDate:v12];

    id v13 = [(CalRecurrenceGenerator *)self eventEndDate];
    id v14 = [v17 eventStore];
    uint64_t v15 = [v14 timeZone];
    id v16 = [v13 dateInTimeZone:0 fromTimeZone:v15];
    [(CalRecurrenceGenerator *)self setEventEndDate:v16];
  }
}

- (id)copyOccurrenceDatesWithEKEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7
{
  LOBYTE(v8) = 1;
  return [(EKRecurrenceGenerator *)self copyOccurrenceDatesWithEKEvent:a3 startDate:a4 endDate:a5 timeZone:a6 exceptionDates:0 limit:a7 adjustDatesForAllDayEvents:v8];
}

- (id)copyOccurrenceDatesWithEKEvent:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 exceptionDates:(id)a7 limit:(int64_t)a8 adjustDatesForAllDayEvents:(BOOL)a9
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v34 = a4;
  id v33 = a5;
  id v35 = a6;
  id v32 = a7;
  [(EKRecurrenceGenerator *)self _setupForEKEvent:v15 adjustDatesForAllDayEvents:a9];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v17 = v15;
  v18 = [v15 recurrenceRules];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = (void *)MEMORY[0x1A62664B0]([(EKRecurrenceGenerator *)self _prepareForEKRecurrence:*(void *)(*((void *)&v40 + 1) + 8 * i) forCalendarItem:v17]);
        id v24 = [(CalRecurrenceGenerator *)self copyOccurrenceDatesBetweenStartDate:v34 endDate:v33 timeZone:v35 limit:a8];
        [v16 addObjectsFromArray:v24];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v20);
  }

  uint64_t v25 = [(EKRecurrenceGenerator *)self adjustedExceptionDatesFromDates:v32 fromGMTToTimeZone:v35];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(v25);
        }
        [v16 removeObject:*(void *)(*((void *)&v36 + 1) + 8 * j)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v27);
  }
  v30 = (void *)[v16 copy];

  return v30;
}

- (id)copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 limit:(int64_t)a8
{
  LOBYTE(v9) = 1;
  return [(EKRecurrenceGenerator *)self _copyOccurrenceDatesWithEKEvent:a3 recurrenceRule:a4 startDate:a5 endDate:a6 timeZone:a7 exceptionDates:0 limit:a8 adjustDatesForAllDayEvents:v9];
}

- (id)copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 exceptionDates:(id)a8 limit:(int64_t)a9 adjustDatesForAllDayEvents:(BOOL)a10
{
  return -[EKRecurrenceGenerator _copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:](self, "_copyOccurrenceDatesWithEKEvent:recurrenceRule:startDate:endDate:timeZone:exceptionDates:limit:adjustDatesForAllDayEvents:", a3, a4, a5, a6, a7, a8);
}

- (id)copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 exceptionDates:(id)a8 limit:(int64_t)a9
{
  LOBYTE(v10) = 1;
  return [(EKRecurrenceGenerator *)self _copyOccurrenceDatesWithEKEvent:a3 recurrenceRule:a4 startDate:a5 endDate:a6 timeZone:a7 exceptionDates:a8 limit:a9 adjustDatesForAllDayEvents:v10];
}

- (id)_copyOccurrenceDatesWithEKEvent:(id)a3 recurrenceRule:(id)a4 startDate:(id)a5 endDate:(id)a6 timeZone:(id)a7 exceptionDates:(id)a8 limit:(int64_t)a9 adjustDatesForAllDayEvents:(BOOL)a10
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  [(EKRecurrenceGenerator *)self _setupForEKEvent:v16 adjustDatesForAllDayEvents:a10];
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v36 = v17;
  id v23 = v17;
  id v24 = v18;
  context = (void *)MEMORY[0x1A62664B0]([(EKRecurrenceGenerator *)self _prepareForEKRecurrence:v23 forCalendarItem:v16]);
  id v35 = v19;
  id v25 = v19;
  uint64_t v26 = v21;
  id v27 = [(CalRecurrenceGenerator *)self copyOccurrenceDatesBetweenStartDate:v18 endDate:v25 timeZone:v20 limit:a9];
  [v22 addObjectsFromArray:v27];
  uint64_t v28 = [(EKRecurrenceGenerator *)self adjustedExceptionDatesFromDates:v21 fromGMTToTimeZone:v20];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v38;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v38 != v31) {
          objc_enumerationMutation(v28);
        }
        [v22 removeObject:*(void *)(*((void *)&v37 + 1) + 8 * v32++)];
      }
      while (v30 != v32);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v30);
  }

  return v22;
}

- (id)adjustedExceptionDatesFromDates:(id)a3 fromGMTToTimeZone:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CalRecurrenceGenerator *)self requiresEndDateConversionFromGMTToEventTimeZone];
  if (v7 && v8)
  {
    id v9 = [MEMORY[0x1E4F1CA80] set];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v18 = v6;
    id obj = v6;
    uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v15 = objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneForSecondsFromGMT:", 0, v18);
          [v14 timeIntervalSinceReferenceDate];
          -[CalRecurrenceGenerator convertAbsoluteTime:fromTimeZone:toTimeZone:](self, "convertAbsoluteTime:fromTimeZone:toTimeZone:", v15, v7);
          id v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
          [v9 addObject:v16];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    id v6 = v18;
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (BOOL)isOccurrenceDate:(id)a3 validForEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v8 = objc_msgSend(v7, "recurrenceRules", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([(EKRecurrenceGenerator *)self occurrenceDate:v6 matchesRecurrenceRule:*(void *)(*((void *)&v15 + 1) + 8 * i) forEvent:v7 includeDetachedEventsInSeries:0])
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)occurrenceDate:(id)a3 matchesRecurrenceRule:(id)a4 forEvent:(id)a5 includeDetachedEventsInSeries:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [(EKRecurrenceGenerator *)self _setupForEKEvent:v12 adjustDatesForAllDayEvents:1];
  BOOL v13 = [v10 date];
  id v14 = [v13 dateByAddingTimeInterval:1.0];
  long long v15 = (void *)MEMORY[0x1A62664B0]([(EKRecurrenceGenerator *)self _prepareForEKRecurrence:v11 forCalendarItem:v12]);
  long long v16 = [v10 timeZone];
  id v17 = [(CalRecurrenceGenerator *)self copyOccurrenceDatesBetweenStartDate:v13 endDate:v14 timeZone:v16 limit:1];

  if ([v17 count])
  {
    id v33 = v15;
    BOOL v18 = a6;
    id v19 = [v17 objectAtIndex:0];
    uint64_t v20 = [v10 date];
    int v21 = [v19 isEqual:v20];

    if (v21)
    {
      long long v22 = [v12 exceptionDatesAdjustedForFloatingEvents];
      uint64_t v23 = [v22 count];

      if (v23)
      {
        id v24 = [v12 exceptionDatesAdjustedForFloatingEvents];
        LOBYTE(v23) = [v24 containsObject:v19];
      }
      char v25 = 1;
      if ((v23 & 1) == 0 && !v18)
      {
        char v26 = v23;
        id v27 = [v12 detachedItems];
        uint64_t v28 = [v27 count];

        if (v28)
        {
          uint64_t v29 = [v12 detachedItems];
          uint64_t v30 = [v29 valueForKey:@"startDate"];
          char v32 = [v30 containsObject:v19];

          char v25 = v32 ^ 1;
        }
        else
        {
          char v25 = 1;
        }
        LOBYTE(v23) = v26;
      }
      LOBYTE(v21) = v25 & ~(_BYTE)v23;
    }
    long long v15 = v33;
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 initialDate:(id)a5 afterDate:(id)a6
{
  return [(EKRecurrenceGenerator *)self nextOccurrenceDateWithEKRecurrences:a3 forCalendarItem:a4 initialDate:a5 afterDate:a6 inclusive:0];
}

- (id)nextOccurrenceDateWithEKRecurrences:(id)a3 forCalendarItem:(id)a4 initialDate:(id)a5 afterDate:(id)a6 inclusive:(BOOL)a7
{
  return [(EKRecurrenceGenerator *)self nextOccurrenceDateWithEKRecurrences:a3 forCalendarItem:a4 exceptionDates:0 initialDate:a5 afterDate:a6 inclusive:a7];
}

+ (id)datesByExpandingRule:(id)a3 fromDate:(id)a4 toDate:(id)a5 inTimezone:(id)a6 isAllDay:(BOOL)a7 lunarCalendarString:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  BOOL v18 = [a5 dateByAddingTimeInterval:1.0];
  if ([a1 _isLunarBirthdayRecurrenceRule:v14 lunarCalendarString:v17])
  {
    id v19 = (void *)[a1 _copyDatesForLunarBirthdayFromDate:v15 toDate:v18 inTimeZone:v16 lunarCalendarString:v17];
    goto LABEL_20;
  }
  uint64_t v20 = [MEMORY[0x1E4FB7F78] recurrenceRuleFromICSString:v14];
  if (v20)
  {
    int v21 = objc_opt_new();
    [v20 freq];
    [v21 setFrequency:CalRecurrenceFrequencyFromICSFrequency()];
    long long v22 = [v20 interval];
    BOOL v45 = v9;
    int v23 = [v22 intValue];

    if (v23 <= 1) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = v23;
    }
    BOOL v25 = v45;
    [v21 setInterval:v24];
    objc_msgSend(v21, "setWeekStart:", objc_msgSend(a1, "_weekStartFromICSRule:", v20));
    char v26 = [a1 _daysOfWeekFromICSRule:v20];
    [v21 setDaysOfTheWeek:v26];

    id v27 = [v20 bysetpos];
    [v21 setSetPositions:v27];

    uint64_t v28 = [v20 bymonth];
    [v21 setMonthsOfTheYear:v28];

    uint64_t v29 = [v20 bymonthday];
    [v21 setDaysOfTheMonth:v29];

    uint64_t v30 = [v20 byweekno];
    [v21 setWeeksOfTheYear:v30];

    [v21 setEventStartDate:v15];
    if (v45)
    {
      uint64_t v31 = objc_msgSend(v15, "ek_ios_dateForEndOfDayInTimeZone:", v16);
      [v21 setEventEndDate:v31];
    }
    else
    {
      [v21 setEventEndDate:v15];
    }
    char v32 = [v20 count];

    if (v32)
    {
      id v33 = [v20 count];
      id v34 = objc_msgSend(v21, "computeRecurrenceEndDate:", objc_msgSend(v33, "unsignedIntegerValue"));
      [v21 setEndDate:v34];
    }
    else
    {
      id v35 = [v20 until];

      if (!v35)
      {
LABEL_18:
        [v21 setEventTimeZone:v16];
        [v21 setAllDay:v25];
        id v19 = (void *)[v21 copyOccurrenceDatesBetweenStartDate:v15 endDate:v18 timeZone:v16 limit:0];

        goto LABEL_19;
      }
      id v36 = objc_alloc(MEMORY[0x1E4FB7F28]);
      long long v37 = [v20 until];
      id v33 = (void *)[v36 initWithValue:v37];

      id v34 = [v33 components];
      long long v38 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      [v38 setTimeZone:v16];
      v44 = v38;
      long long v43 = [v38 dateFromComponents:v34];
      long long v39 = [v20 until];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      long long v40 = v43;
      if ((isKindOfClass & 1) == 0)
      {
        long long v40 = [v43 dateForEndOfDayInTimeZone:v16];
      }
      [v21 setEndDate:v40];
    }
    BOOL v25 = v45;
    goto LABEL_18;
  }
  id v19 = 0;
LABEL_19:

LABEL_20:

  return v19;
}

+ (unint64_t)_weekStartFromICSRule:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 wkst];

  if (v4)
  {
    v5 = [v3 wkst];
    unint64_t v6 = (int)[v5 intValue];

    if (v6 - 1 >= 7) {
      unint64_t v7 = 2;
    }
    else {
      unint64_t v7 = v6;
    }
  }
  else
  {
    unint64_t v7 = 2;
  }

  return v7;
}

+ (id)_daysOfWeekFromICSRule:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 byday];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CA48];
    unint64_t v6 = [v3 byday];
    unint64_t v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    BOOL v8 = objc_msgSend(v3, "byday", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v14 = objc_alloc(MEMORY[0x1E4F57798]);
          uint64_t v15 = [v13 weekday];
          id v16 = [v13 number];
          id v17 = objc_msgSend(v14, "initWithDayOfTheWeek:weekNumber:", v15, objc_msgSend(v16, "integerValue"));

          [v7 addObject:v17];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    BOOL v18 = (void *)[v7 copy];
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (id)_copyDatesForLunarBirthdayFromDate:(id)a3 toDate:(id)a4 inTimeZone:(id)a5 lunarCalendarString:(id)a6
{
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9A8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  BOOL v13 = [v9 CalCalendarWithUnsanitizedCalendarIdentifier:a6];
  id v14 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v13 setTimeZone:v14];
  uint64_t v15 = [MEMORY[0x1E4F57838] calendarDateWithDate:v12 timeZone:v10];
  id v16 = [MEMORY[0x1E4F57838] calendarDateWithDate:v11 timeZone:v10];

  id v17 = objc_alloc(MEMORY[0x1E4F576D0]);
  BOOL v18 = [v15 date];
  id v19 = [v16 date];
  long long v20 = (void *)[v17 initWithStartDate:v18 endDate:v19];

  long long v21 = [v13 components:24 fromDate:v12];

  [v13 setTimeZone:v10];
  long long v22 = [v13 CalOccurrencesForBirthday:v21 inDateRange:v20];

  return v22;
}

+ (BOOL)_isLunarBirthdayRecurrenceRule:(id)a3 lunarCalendarString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = v6;
  if (v6 && ([v6 isEqualToString:*MEMORY[0x1E4F1C318]] & 1) == 0)
  {
    if (([v5 isEqualToString:@"FREQ=YEARLY"] & 1) != 0
      || ([v5 isEqualToString:@"FREQ=YEARLY;INTERVAL=1"] & 1) != 0)
    {
      BOOL v8 = 1;
      goto LABEL_7;
    }
    id v10 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      +[EKRecurrenceGenerator(Deprecated) _isLunarBirthdayRecurrenceRule:lunarCalendarString:]((uint64_t)v5, (uint64_t)v7, v10);
    }
  }
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

@end