@interface CalRecurrenceGenerator
- (BOOL)_isSimpleYearlyRecurrence;
- (BOOL)_validateCalDate:(id)a3 pinned:(BOOL)a4;
- (BOOL)allDay;
- (BOOL)onlyIncludeInitialDateIfItMatchesRecurrence;
- (BOOL)requiresEndDateConversionFromGMTToEventTimeZone;
- (BOOL)shouldPinMonthDays;
- (CalRecurrenceGenerator)init;
- (NSArray)daysOfTheMonth;
- (NSArray)daysOfTheWeek;
- (NSArray)daysOfTheYear;
- (NSArray)monthsOfTheYear;
- (NSArray)setPositions;
- (NSArray)weeksOfTheYear;
- (NSDate)endDate;
- (NSDate)eventEndDate;
- (NSDate)eventStartDate;
- (NSTimeZone)eventTimeZone;
- (double)convertAbsoluteTime:(double)a3 fromTimeZone:(id)a4 toTimeZone:(id)a5;
- (double)duration;
- (id)_copyDailyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7;
- (id)_copyMonthlyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7;
- (id)_copyWeeklyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7;
- (id)_copyYearlyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7;
- (id)computeRecurrenceEndDate:(unint64_t)a3;
- (id)copyOccurrenceDatesBetweenStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 limit:(int64_t)a6;
- (id)copyOccurrenceDatesBetweenStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 limit:(int64_t)a6 plusExtraOccurrencePastEnd:(BOOL)a7;
- (id)copyOccurrenceDatesBetweenStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 plusExtraOccurrencePastEnd:(BOOL)a6;
- (id)copyOccurrenceDatesWithInitialDate:(id)a3 allDay:(BOOL)a4 rangeStart:(id)a5 rangeEnd:(id)a6 timeZone:(id)a7 limit:(int64_t)a8;
- (int)frequency;
- (int)interval;
- (unint64_t)weekStart;
- (void)setAllDay:(BOOL)a3;
- (void)setDaysOfTheMonth:(id)a3;
- (void)setDaysOfTheWeek:(id)a3;
- (void)setDaysOfTheYear:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setEventEndDate:(id)a3;
- (void)setEventStartDate:(id)a3;
- (void)setEventTimeZone:(id)a3;
- (void)setFrequency:(int)a3;
- (void)setInterval:(int)a3;
- (void)setMonthsOfTheYear:(id)a3;
- (void)setOnlyIncludeInitialDateIfItMatchesRecurrence:(BOOL)a3;
- (void)setSetPositions:(id)a3;
- (void)setShouldPinMonthDays:(BOOL)a3;
- (void)setWeekStart:(unint64_t)a3;
- (void)setWeeksOfTheYear:(id)a3;
@end

@implementation CalRecurrenceGenerator

- (CalRecurrenceGenerator)init
{
  v7.receiver = self;
  v7.super_class = (Class)CalRecurrenceGenerator;
  v2 = [(CalRecurrenceGenerator *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9A8] CalGregorianGMTCalendar];
    uint64_t v4 = [v3 copy];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v4;
  }
  return v2;
}

- (id)copyOccurrenceDatesWithInitialDate:(id)a3 allDay:(BOOL)a4 rangeStart:(id)a5 rangeEnd:(id)a6 timeZone:(id)a7 limit:(int64_t)a8
{
  BOOL v11 = a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  [(CalRecurrenceGenerator *)self setEventStartDate:v17];
  [(CalRecurrenceGenerator *)self setEventEndDate:v17];

  [(CalRecurrenceGenerator *)self setEventTimeZone:v14];
  [(CalRecurrenceGenerator *)self setAllDay:v11];
  id v18 = [(CalRecurrenceGenerator *)self copyOccurrenceDatesBetweenStartDate:v16 endDate:v15 timeZone:v14 limit:a8];

  return v18;
}

- (id)computeRecurrenceEndDate:(unint64_t)a3
{
  eventStartDate = self->_eventStartDate;
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:1577840000.0];
  id v7 = [(CalRecurrenceGenerator *)self copyOccurrenceDatesBetweenStartDate:eventStartDate endDate:v6 timeZone:self->_eventTimeZone limit:a3];

  v8 = [v7 lastObject];

  return v8;
}

- (BOOL)_isSimpleYearlyRecurrence
{
  return self->_frequency == 4
      && self->_interval == 1
      && !self->_endDate
      && !self->_daysOfTheWeek
      && !self->_daysOfTheMonth
      && !self->_daysOfTheYear
      && !self->_weeksOfTheYear
      && !self->_monthsOfTheYear
      && self->_setPositions == 0;
}

- (double)duration
{
  v3 = [(CalRecurrenceGenerator *)self eventEndDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;
  v6 = [(CalRecurrenceGenerator *)self eventStartDate];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v5 - v7;

  return v8;
}

- (double)convertAbsoluteTime:(double)a3 fromTimeZone:(id)a4 toTimeZone:(id)a5
{
  CFTimeZoneRef v7 = (const __CFTimeZone *)a5;
  *(void *)&v10.year = CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone((const __CFTimeZone *)a4, a3);
  double AbsoluteTimeWithFallbackToDefaultTimeZone = CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone(v10, v7);

  return AbsoluteTimeWithFallbackToDefaultTimeZone;
}

- (BOOL)requiresEndDateConversionFromGMTToEventTimeZone
{
  return self->_eventTimeZone == 0;
}

- (id)copyOccurrenceDatesBetweenStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 limit:(int64_t)a6
{
  return [(CalRecurrenceGenerator *)self copyOccurrenceDatesBetweenStartDate:a3 endDate:a4 timeZone:a5 limit:a6 plusExtraOccurrencePastEnd:0];
}

- (id)copyOccurrenceDatesBetweenStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 plusExtraOccurrencePastEnd:(BOOL)a6
{
  return [(CalRecurrenceGenerator *)self copyOccurrenceDatesBetweenStartDate:a3 endDate:a4 timeZone:a5 limit:0 plusExtraOccurrencePastEnd:a6];
}

- (id)copyOccurrenceDatesBetweenStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 limit:(int64_t)a6 plusExtraOccurrencePastEnd:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(CalRecurrenceGenerator *)self eventStartDate];
  if (!v14
    || (id v15 = (void *)v14,
        [(CalRecurrenceGenerator *)self eventEndDate],
        id v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        !v16))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"CalRecurrenceGenerator must have start date and end date set before calling -copyOccurrenceDatesBetweenStartDate:endDate:timeZone:limit:."];
  }
  id v17 = (NSTimeZone *)v11;
  id v18 = v17;
  v19 = v17;
  if (self->_eventTimeZone)
  {
    v19 = v17;
    if ((-[NSTimeZone isEqual:](v17, "isEqual:") & 1) == 0)
    {
      v19 = self->_eventTimeZone;
    }
  }
  if (v19)
  {
    [(NSCalendar *)self->_calendar setTimeZone:v19];
  }
  else
  {
    v20 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
    [(NSCalendar *)self->_calendar setTimeZone:v20];
  }
  id v21 = +[EKCalendarDate calendarDateWithDate:v13 timeZone:v19];

  v22 = +[EKCalendarDate calendarDateWithDate:v12 timeZone:v19];

  v23 = +[EKCalendarDate calendarDateWithDate:self->_eventStartDate timeZone:self->_eventTimeZone];
  v24 = [v23 calendarDateInTimeZone:v19];

  [(NSDate *)self->_endDate timeIntervalSinceReferenceDate];
  double v26 = v25;
  if ([(CalRecurrenceGenerator *)self requiresEndDateConversionFromGMTToEventTimeZone]&& v26 != 0.0)
  {
    CFTimeZoneRef v27 = CalTimeZoneCopyCFTimeZone(@"GMT");
    [(CalRecurrenceGenerator *)self convertAbsoluteTime:v27 fromTimeZone:v19 toTimeZone:v26];
    double v26 = v28;
    CFRelease(v27);
  }
  [v24 absoluteTime];
  double v30 = v29;
  [v22 absoluteTime];
  if (v30 > v31
    || self->_endDate
    && ([v21 absoluteTime],
        double v33 = v32,
        [(CalRecurrenceGenerator *)self duration],
        v33 > v26 + v34))
  {
    v35 = 0;
  }
  else
  {
    [v21 absoluteTime];
    double v37 = v36;
    [v24 absoluteTime];
    if (v37 <= v38) {
      goto LABEL_20;
    }
    [v24 absoluteTime];
    double v40 = v39;
    [(CalRecurrenceGenerator *)self duration];
    double v42 = v40 + v41;
    [v21 absoluteTime];
    if (v42 <= v43 || ([v24 absoluteTime], double v45 = v44, objc_msgSend(v21, "absoluteTime"), v45 >= v46))
    {
      BOOL v85 = v7;
      v48 = [v21 dayTimeComponents];
      v49 = [v24 allComponents];
      objc_msgSend(v48, "setHour:", objc_msgSend(v49, "hour"));
      objc_msgSend(v48, "setMinute:", objc_msgSend(v49, "minute"));
      objc_msgSend(v48, "setSecond:", objc_msgSend(v49, "second"));
      objc_msgSend(v48, "setNanosecond:", objc_msgSend(v49, "nanosecond"));
      v47 = +[EKCalendarDate calendarDateWithDateComponents:v48 timeZone:v19];
      [v21 absoluteTime];
      double v51 = v50;
      [v47 absoluteTime];
      double v53 = v51 - v52;
      if (v53 <= 0.0)
      {
        v84 = v49;
        v56 = objc_opt_new();
        [(CalRecurrenceGenerator *)self duration];
        [v56 setSecond:(uint64_t)v57];
        if (self->_allDay)
        {
          [(CalRecurrenceGenerator *)self duration];
          objc_msgSend(v56, "setDay:", (int)fmax((v58 + 1.0) / *(double *)&CalTimeInterval_OneDayInSeconds, 0.0));
          [v56 setSecond:-1];
        }
        v83 = v56;
        v80 = [v47 calendarDateByComponentwiseAddingComponents:v56];
        v59 = [v80 dayTimeComponents];
        objc_msgSend(v59, "setMonth:", objc_msgSend(v21, "month"));
        objc_msgSend(v59, "setDay:", objc_msgSend(v21, "day"));
        objc_msgSend(v59, "setYear:", (int)objc_msgSend(v21, "year"));
        v82 = v59;
        v60 = +[EKCalendarDate calendarDateWithDateComponents:v59 timeZone:v19];

        v81 = v60;
        [v60 absoluteTime];
        double v62 = v61;
        [v21 absoluteTime];
        v79 = v48;
        if (v62 >= v63)
        {
          v64 = objc_opt_new();
          BOOL allDay = self->_allDay;
          [(CalRecurrenceGenerator *)self duration];
          if (allDay)
          {
            objc_msgSend(v64, "setDay:", (uint64_t)-fmax((v67 + 1.0) / *(double *)&CalTimeInterval_OneDayInSeconds, 0.0));
            uint64_t v68 = 1;
          }
          else
          {
            uint64_t v68 = (uint64_t)-v67;
          }
          [v64 setSecond:v68];
          v65 = v81;
          id v77 = [v81 calendarDateByComponentwiseAddingComponents:v64];
        }
        else
        {
          id v77 = v47;
          v64 = v21;
          v65 = v81;
        }

        id v21 = v77;
        v48 = v79;
        v66 = v83;
        v49 = v84;
      }
      else
      {
        [(CalRecurrenceGenerator *)self duration];
        if (v53 >= v54)
        {
          id v55 = [v47 calendarDateByAddingDays:1];
        }
        else
        {
          id v55 = v47;
        }
        v66 = v21;
        id v21 = v55;
      }

      BOOL v7 = v85;
    }
    else
    {
LABEL_20:
      v47 = v21;
      id v21 = v24;
    }

    if (self->_endDate && ([v22 absoluteTime], v69 > v26))
    {
      uint64_t v70 = +[EKCalendarDate calendarDateWithAbsoluteTime:v19 timeZone:v26 + 1.0];

      LOBYTE(v7) = 0;
      BOOL v71 = 0;
      v22 = (void *)v70;
    }
    else
    {
      BOOL v71 = v7;
    }
    switch(self->_frequency)
    {
      case 1:
        id v72 = [(CalRecurrenceGenerator *)self _copyDailyOccurrencesWithInitialDate:v24 startDate:v21 endDate:v22 count:a6 countPastEndDate:v71];
        goto LABEL_46;
      case 2:
        id v72 = [(CalRecurrenceGenerator *)self _copyWeeklyOccurrencesWithInitialDate:v24 startDate:v21 endDate:v22 count:a6 countPastEndDate:v71];
        goto LABEL_46;
      case 3:
        id v72 = [(CalRecurrenceGenerator *)self _copyMonthlyOccurrencesWithInitialDate:v24 startDate:v21 endDate:v22 count:a6 countPastEndDate:v71];
        goto LABEL_46;
      case 4:
        id v72 = [(CalRecurrenceGenerator *)self _copyYearlyOccurrencesWithInitialDate:v24 startDate:v21 endDate:v22 count:a6 countPastEndDate:v71];
LABEL_46:
        v35 = v72;
        break;
      default:
        v35 = 0;
        break;
    }
    char v73 = !v7;
    if (!self->_endDate) {
      char v73 = 1;
    }
    if ((v73 & 1) == 0)
    {
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __112__CalRecurrenceGenerator_copyOccurrenceDatesBetweenStartDate_endDate_timeZone_limit_plusExtraOccurrencePastEnd___block_invoke;
      v87[3] = &__block_descriptor_40_e33_B24__0__NSDate_8__NSDictionary_16l;
      *(double *)&v87[4] = v26;
      v74 = [MEMORY[0x1E4F28F60] predicateWithBlock:v87];
      uint64_t v75 = [v35 filteredArrayUsingPredicate:v74];

      v35 = (void *)v75;
    }
  }

  return v35;
}

BOOL __112__CalRecurrenceGenerator_copyOccurrenceDatesBetweenStartDate_endDate_timeZone_limit_plusExtraOccurrencePastEnd___block_invoke(uint64_t a1, void *a2)
{
  [a2 timeIntervalSinceReferenceDate];
  return v3 <= *(double *)(a1 + 32);
}

- (id)_copyDailyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7
{
  v59[6] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  unint64_t interval = self->_interval;
  if (interval)
  {
    double v57 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    uint64_t v15 = [v11 calendarDateForDay];
    double v52 = [v12 calendarDateForDay];
    double v53 = (void *)v15;
    unint64_t v16 = [v52 differenceInDays:v15] % interval;
    if (v16)
    {
      uint64_t v17 = [v12 calendarDateByAddingDays:interval - v16];

      id v12 = (id)v17;
    }
    id v18 = self->_daysOfTheWeek;
    v19 = self->_monthsOfTheYear;
    if (v19)
    {
      v20 = self->_daysOfTheMonth;
      v59[0] = _EKRecurrenceByMonthFilter;
      v59[1] = v19;
      v48 = v20;
      if ([(NSArray *)v20 count])
      {
        id v21 = _EKRecurrenceByMonthDayFilterPinned;
        if (!self->_shouldPinMonthDays) {
          id v21 = _EKRecurrenceByMonthDayFilter;
        }
        v59[2] = v21;
        v59[3] = v20;
        unint64_t v22 = 2;
      }
      else
      {
        unint64_t v22 = 1;
      }
    }
    else
    {
      v48 = 0;
      unint64_t v22 = 0;
    }
    double v50 = v19;
    double v51 = v18;
    if ([(NSArray *)v18 count])
    {
      v24 = (BOOL (**)(unint64_t, void *))&v59[2 * v22];
      void *v24 = _EKRecurrenceByDayMaskFilter;
      ++v22;
      v24[1] = (BOOL (*)(unint64_t, void *))_EKRecurrenceByDayMaskFromArrayByDayItems(v18);
    }
    double v25 = [v12 allComponents];
    objc_msgSend(v25, "setHour:", objc_msgSend(v11, "hour"));
    objc_msgSend(v25, "setMinute:", objc_msgSend(v11, "minute"));
    objc_msgSend(v25, "setSecond:", objc_msgSend(v11, "second"));
    double v26 = [(NSCalendar *)self->_calendar dateFromComponents:v25];
    id v27 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v27 setDay:interval];
    [v13 absoluteTime];
    double v29 = v28;
    id v55 = v12;
    if (a6)
    {
      double v30 = fabs(v28);
      if (v29 > 1577840000.0 || v30 < 2.22044605e-16) {
        double v29 = 1577840000.0;
      }
    }
    id v54 = v13;
    v56 = v11;
    [v26 timeIntervalSinceReferenceDate];
    BOOL v32 = a7 != 0;
    if (v33 < v29 || a7)
    {
      unint64_t v35 = a6;
      do
      {
        if (!v22
          || ([v55 timeZone],
              double v36 = objc_claimAutoreleasedReturnValue(),
              +[EKCalendarDate calendarDateWithDateComponents:v25 timeZone:v36], double v37 = objc_claimAutoreleasedReturnValue(), v36, LODWORD(v36) = _EKRecurrenceApplyFiltersToSingleDate(v37, (uint64_t)v59, v22, v56, [(CalRecurrenceGenerator *)self onlyIncludeInitialDateIfItMatchesRecurrence]), v37, v36))
        {
          [v57 addObject:v26];
          if (v35) {
            --v35;
          }
          else {
            unint64_t v35 = 0;
          }
          if (v32)
          {
            [v26 timeIntervalSinceReferenceDate];
            if (v38 >= v29) {
              --a7;
            }
          }
          else
          {
            a7 = 0;
          }
        }
        double v39 = [(NSCalendar *)self->_calendar dateByAddingComponents:v27 toDate:v26 options:0];

        double v34 = [(NSCalendar *)self->_calendar components:254 fromDate:v39];
        uint64_t v40 = [v34 hour];
        if (v40 == [v25 hour]
          && (uint64_t v41 = [v34 minute], v41 == objc_msgSend(v25, "minute"))
          && (uint64_t v42 = [v34 second], v42 == objc_msgSend(v25, "second")))
        {
          double v26 = v39;
        }
        else
        {
          objc_msgSend(v34, "setHour:", objc_msgSend(v25, "hour"));
          objc_msgSend(v34, "setMinute:", objc_msgSend(v25, "minute"));
          objc_msgSend(v34, "setSecond:", objc_msgSend(v25, "second"));
          double v26 = [(NSCalendar *)self->_calendar dateFromComponents:v34];
        }
        [v26 timeIntervalSinceReferenceDate];
        BOOL v32 = a7 != 0;
        if (a7) {
          BOOL v44 = 1;
        }
        else {
          BOOL v44 = v43 < v29;
        }
        if (a6) {
          BOOL v45 = v35 == 0;
        }
        else {
          BOOL v45 = 0;
        }
        char v46 = !v45;
        if (!v44) {
          break;
        }
        double v25 = v34;
      }
      while ((v46 & 1) != 0);
    }
    else
    {
      double v34 = v25;
    }
    v23 = (void *)[v57 copy];

    id v12 = v55;
    id v11 = v56;
    id v13 = v54;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_copyWeeklyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7
{
  v94[4] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v84 = a5;
  v82 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  unint64_t interval = self->_interval;
  uint64_t v93 = 0;
  unint64_t weekStart = self->_weekStart;
  uint64_t v15 = [v11 calendarDateForWeekWithWeekStart:weekStart];
  char v73 = [v12 calendarDateForWeekWithWeekStart:weekStart daysSinceWeekStart:&v93];
  v74 = (void *)v15;
  unint64_t v16 = [v73 differenceInDays:v15] / 7 % interval;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  id v18 = v17;
  uint64_t v19 = 7 * (interval - v16);
  if (!v16) {
    uint64_t v19 = 0;
  }
  [v17 setDay:v19 - v93];
  calendar = self->_calendar;
  uint64_t v75 = v12;
  id v21 = [v12 date];
  id v72 = v18;
  uint64_t v22 = [(NSCalendar *)calendar dateByAddingComponents:v18 toDate:v21 options:0];

  BOOL v71 = (void *)v22;
  v23 = [(NSCalendar *)self->_calendar components:254 fromDate:v22];
  objc_msgSend(v23, "setHour:", objc_msgSend(v11, "hour"));
  objc_msgSend(v23, "setMinute:", objc_msgSend(v11, "minute"));
  v80 = v11;
  objc_msgSend(v23, "setSecond:", objc_msgSend(v11, "second"));
  id v76 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v76 setDay:7 * interval];
  v24 = self->_daysOfTheWeek;
  BOOL v85 = self->_setPositions;
  double v25 = self->_monthsOfTheYear;
  unint64_t v92 = a7;
  CFIndex v88 = 0;
  uint64_t v89 = 0;
  if (v25)
  {
    v94[0] = _EKRecurrenceByMonthFilter;
    v94[1] = v25;
    unint64_t v83 = 1;
  }
  else
  {
    unint64_t v83 = 0;
  }
  v90 = 0;
  id v91 = 0;
  if (![(NSArray *)v85 count])
  {
    v90 = v75;
    id v91 = v84;
    double v26 = (BOOL (**)(uint64_t, void *))&v94[2 * v83++];
    *double v26 = _EKRecurrenceRangeFilter;
    v26[1] = (BOOL (*)(uint64_t, void *))&v90;
  }
  if ([(NSArray *)v24 count]) {
    unint64_t v77 = _EKRecurrenceByDayMaskFromArrayByDayItems(v24);
  }
  else {
    unint64_t v77 = 1 << ([v11 dayOfWeek] - 1);
  }
  uint64_t v70 = v24;
  if (weekStart != 1) {
    unint64_t v77 = ((v77 >> (weekStart - 1)) | (v77 << (8 - weekStart)));
  }
  unint64_t v27 = a6;
  if (!self->_onlyIncludeInitialDateIfItMatchesRecurrence)
  {
    [v11 absoluteTime];
    double v29 = v28;
    [v75 absoluteTime];
    unint64_t v27 = a6;
    if (v29 >= v30)
    {
      if (!v84
        || ([v11 absoluteTime], v32 = v31, objc_msgSend(v84, "absoluteTime"), unint64_t v27 = a6, v32 < v33))
      {
        [v11 absoluteTime];
        _InsertAbsoluteTimeIntoArrayAtIndex(v82, v34);
        unint64_t v27 = a6 ? a6 - 1 : 0;
        if (v85) {
          CFIndex v88 = 1;
        }
      }
    }
  }
  unint64_t v35 = [(NSCalendar *)self->_calendar dateFromComponents:v23];
  id v86 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  double v36 = 0.0;
  double v37 = v84;
  if (v84) {
    objc_msgSend(v84, "absoluteTime", 0.0);
  }
  unint64_t v38 = 0;
  if (v36 <= 1577840000.0 && v36 != 0.0 || a6 == 0) {
    double v41 = v36;
  }
  else {
    double v41 = 1577840000.0;
  }
  id v42 = v11;
  if (v85) {
    id v42 = 0;
  }
  v81 = v42;
  while (2)
  {
    [v35 timeIntervalSinceReferenceDate];
    if (v43 >= v41)
    {
      if (a6) {
        BOOL v44 = v27 == 0;
      }
      else {
        BOOL v44 = 0;
      }
      char v45 = v44;
      if (!v92 || v38 > 0x36 || (v45 & 1) != 0) {
        goto LABEL_98;
      }
    }
    else if (a6 && !v27)
    {
      goto LABEL_98;
    }
    unint64_t v78 = v38;
    v79 = v23;
    unint64_t v46 = weekStart;
    unint64_t v47 = v77;
    do
    {
      if ((v47 & 1) == 0) {
        goto LABEL_66;
      }
      unint64_t v48 = weekStart;
      uint64_t v49 = 7;
      if (v46 >= weekStart) {
        uint64_t v49 = 0;
      }
      [v86 setDay:v46 - weekStart + v49];
      double v50 = v35;
      double v51 = [(NSCalendar *)self->_calendar dateByAddingComponents:v86 toDate:v35 options:0];
      if (self->_onlyIncludeInitialDateIfItMatchesRecurrence
        || ([v80 date],
            id v54 = objc_claimAutoreleasedReturnValue(),
            int v55 = [v51 isEqualToDate:v54],
            v54,
            !v55)
        || v85)
      {
        double v52 = [(NSCalendar *)self->_calendar timeZone];
        double v53 = +[EKCalendarDate calendarDateWithDate:v51 timeZone:v52];

        if (v83
          && !_EKRecurrenceApplyFiltersToSingleDate(v53, (uint64_t)v94, v83, v81, [(CalRecurrenceGenerator *)self onlyIncludeInitialDateIfItMatchesRecurrence]))
        {
          double v37 = v84;
          unint64_t v35 = v50;
          unint64_t weekStart = v48;
          goto LABEL_64;
        }
        [v82 addObject:v51];
        double v37 = v84;
        if (v85)
        {
          unint64_t v35 = v50;
        }
        else
        {
          if (v27) {
            --v27;
          }
          else {
            unint64_t v27 = 0;
          }
          unint64_t v35 = v50;
          if (v92)
          {
            [v51 timeIntervalSinceReferenceDate];
            unint64_t weekStart = v48;
            if (v57 >= v41) {
              --v92;
            }
            goto LABEL_59;
          }
        }
        unint64_t weekStart = v48;
LABEL_59:
        ++v89;
LABEL_64:

        goto LABEL_65;
      }
      unint64_t v35 = v50;
      unint64_t weekStart = v48;
LABEL_65:

LABEL_66:
      BOOL v56 = v37 != 0;
      if (v46 + 1 <= 7) {
        ++v46;
      }
      else {
        unint64_t v46 = 1;
      }
      if (a6) {
        BOOL v56 = v27 != 0;
      }
      if (v47 < 2) {
        break;
      }
      if (v46 == weekStart) {
        break;
      }
      v47 >>= 1;
    }
    while (v56);
    if (!v85)
    {
      unint64_t v58 = v78;
      v23 = v79;
      goto LABEL_90;
    }
    unint64_t v58 = v78;
    v23 = v79;
    if (v89 < 1) {
      goto LABEL_90;
    }
    _EKRecurrenceApplyBySetPosToRange(v82, v85, &v88, v75, v37, v80, v27, &v92);
    if (v27)
    {
      v27 -= v89;
      goto LABEL_90;
    }
    if (v89 || !v92)
    {
LABEL_90:
      v60 = [(NSCalendar *)self->_calendar dateByAddingComponents:v76 toDate:v35 options:0];

      double v61 = [(NSCalendar *)self->_calendar components:254 fromDate:v60];
      uint64_t v62 = [v61 hour];
      if (v62 != [v23 hour]
        || (uint64_t v63 = [v61 minute], v63 != objc_msgSend(v23, "minute"))
        || (uint64_t v64 = [v61 second], v64 != objc_msgSend(v23, "second")))
      {
        objc_msgSend(v61, "setHour:", objc_msgSend(v23, "hour"));
        objc_msgSend(v61, "setMinute:", objc_msgSend(v23, "minute"));
        objc_msgSend(v61, "setSecond:", objc_msgSend(v23, "second"));
        uint64_t v65 = [(NSCalendar *)self->_calendar dateFromComponents:v61];

        v60 = (void *)v65;
      }

      if (v89 <= 0) {
        unint64_t v38 = v58 + 1;
      }
      else {
        unint64_t v38 = 0;
      }
      v88 += v89;
      uint64_t v89 = 0;
      unint64_t v35 = v60;
      v23 = v61;
      continue;
    }
    break;
  }
  [v35 timeIntervalSinceReferenceDate];
  if (v59 < v41)
  {
    unint64_t v27 = 0;
    goto LABEL_90;
  }
LABEL_98:
  v66 = v35;
  double v67 = (void *)[v82 copy];

  return v67;
}

- (id)_copyMonthlyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7
{
  v89[6] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v77 = a5;
  unint64_t v80 = a6;
  unint64_t v88 = a6;
  v79 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  uint64_t interval = self->_interval;
  uint64_t v15 = [v12 calendarDateForMonth];
  uint64_t v65 = [v13 calendarDateForMonth];
  v66 = (void *)v15;
  int v16 = [v65 differenceInMonths:v15] % interval;
  id v76 = v13;
  id v17 = objc_msgSend(v13, "calendarDateByAddingDays:", 1 - objc_msgSend(v13, "day"));
  id v18 = (void *)[v17 mutableCopy];

  if (v16 >= 1) {
    [v18 addMonths:(int)interval - v16];
  }
  uint64_t v19 = self->_setPositions;
  v20 = self->_monthsOfTheYear;
  BOOL v85 = 0;
  id v86 = 0;
  unint64_t v87 = a7;
  CFIndex v83 = 0;
  uint64_t v84 = 0;
  uint64_t v21 = [(NSArray *)v20 count];
  uint64_t v64 = v20;
  if (v21)
  {
    v89[0] = _EKRecurrenceByMonthFilter;
    v89[1] = v20;
    uint64_t v70 = 1;
  }
  else
  {
    uint64_t v70 = 0;
  }
  uint64_t v22 = v13;
  v23 = self->_daysOfTheMonth;
  v24 = self->_daysOfTheWeek;
  v81 = 0;
  v82 = 0;
  double v67 = v23;
  uint64_t v63 = v24;
  if (![(NSArray *)v24 count])
  {
    if (![(NSArray *)v23 count])
    {
      uint64_t v75 = 0;
      char v78 = 1;
      goto LABEL_21;
    }
    uint64_t v75 = 0;
    double v28 = _EKRecurrenceByMonthDayGeneratorPinned;
    if (!self->_shouldPinMonthDays) {
      double v28 = _EKRecurrenceByMonthDayGenerator;
    }
    v81 = v28;
    unint64_t v27 = &v82;
    goto LABEL_16;
  }
  v81 = _EKRecurrenceByDayGenerator;
  v82 = v24;
  if ([(NSArray *)v23 count])
  {
    if (self->_shouldPinMonthDays) {
      double v25 = _EKRecurrenceByMonthDayFilterPinned;
    }
    else {
      double v25 = _EKRecurrenceByMonthDayFilter;
    }
    double v26 = (BOOL (**)(void *, void *))&v89[2 * v70];
    *double v26 = v25;
    unint64_t v27 = (NSArray **)(v26 + 1);
    uint64_t v75 = 1;
LABEL_16:
    *unint64_t v27 = v23;
    goto LABEL_18;
  }
  uint64_t v75 = 0;
LABEL_18:
  char v78 = 0;
  if (![(NSArray *)v19 count])
  {
    BOOL v85 = v76;
    id v86 = v77;
    double v29 = (BOOL (**)(uint64_t, void *))&v89[2 * v75++ + 2 * v70];
    *double v29 = _EKRecurrenceRangeFilter;
    v29[1] = (BOOL (*)(uint64_t, void *))&v85;
  }
LABEL_21:
  double v30 = v77;
  if (!self->_onlyIncludeInitialDateIfItMatchesRecurrence)
  {
    [v12 absoluteTime];
    double v32 = v31;
    [v76 absoluteTime];
    if (v32 >= v33)
    {
      if (v77)
      {
        [v12 absoluteTime];
        double v35 = v34;
        [v77 absoluteTime];
        if (v35 >= v36) {
          goto LABEL_30;
        }
      }
      [v12 absoluteTime];
      _InsertAbsoluteTimeIntoArrayAtIndex(v79, v37);
      if (v80) {
        unint64_t v88 = v80 - 1;
      }
      if (v19) {
        CFIndex v83 = 1;
      }
    }
  }
  if (!v77)
  {
    double v38 = 0.0;
    char v68 = 1;
    goto LABEL_32;
  }
LABEL_30:
  [v77 absoluteTime];
  char v68 = 0;
LABEL_32:
  double v39 = 1577840000.0;
  if (v38 <= 1577840000.0 && v38 != 0.0) {
    double v39 = v38;
  }
  if (v80) {
    double v41 = v39;
  }
  else {
    double v41 = v38;
  }
  uint64_t v42 = [v18 timeComponents];
  unint64_t v43 = 0;
  if (v19) {
    id v44 = 0;
  }
  else {
    id v44 = v12;
  }
  char v45 = &v88;
  if (v19) {
    char v45 = 0;
  }
  char v73 = v45;
  v74 = v44;
  unint64_t v46 = &v87;
  if (v19) {
    unint64_t v46 = 0;
  }
  id v72 = v46;
  double v69 = (void *)v42;
  BOOL v71 = &v89[2 * v70];
  while (1)
  {
    [v18 absoluteTime];
    if (v47 >= v41 && (!v87 || v43 > 0x63)) {
      break;
    }
    if (v80 && !v88) {
      break;
    }
    if (v21
      && !_EKRecurrenceApplyFiltersToSingleDate(v18, (uint64_t)v89, 1uLL, v12, [(CalRecurrenceGenerator *)self onlyIncludeInitialDateIfItMatchesRecurrence]))
    {
      goto LABEL_87;
    }
    if (v78)
    {
      unint64_t v48 = [v18 dayComponents];
      objc_msgSend(v48, "setDay:", objc_msgSend(v12, "day"));
      if (self->_shouldPinMonthDays)
      {
        uint64_t v49 = [v18 daysInMonth];
        if ([v48 day] > v49) {
          [v48 setDay:v49];
        }
      }
      double v50 = [v18 calendar];
      int v51 = [v48 isValidDateInCalendar:v50];

      if (v51)
      {
        objc_msgSend(v48, "setHour:", objc_msgSend(v69, "hour"));
        objc_msgSend(v48, "setMinute:", objc_msgSend(v69, "minute"));
        objc_msgSend(v48, "setSecond:", objc_msgSend(v69, "second"));
        double v52 = [v18 calendar];
        double v53 = [v52 dateFromComponents:v48];
        [v53 timeIntervalSinceReferenceDate];
        double v55 = v54;

        uint64_t v22 = v76;
        [v76 absoluteTime];
        if (v55 >= v56
          && ((v68 & 1) != 0 || ([v77 absoluteTime], v55 < v58) || v87)
          && (self->_onlyIncludeInitialDateIfItMatchesRecurrence
           || ([v12 absoluteTime], vabdd_f64(v55, v59) >= 2.22044605e-16)))
        {
          _AppendAbsoluteTimeToArray(v79, v55);
          if (!v19)
          {
            if (v88) {
              --v88;
            }
            if (v87 && v55 >= v41) {
              --v87;
            }
          }
          uint64_t v84 = 1;
          uint64_t v57 = 1;
        }
        else
        {
          uint64_t v57 = 0;
        }
      }
      else
      {
        uint64_t v57 = 0;
        uint64_t v22 = v76;
      }

      double v30 = v77;
      if (!v19) {
        goto LABEL_81;
      }
    }
    else
    {
      uint64_t v57 = _EKRecurrenceApplyGenerator(v79, (uint64_t)&v81, (uint64_t)v71, v75, v74, v22, v30, v18, 3u, v73, v72, self->_onlyIncludeInitialDateIfItMatchesRecurrence);
      uint64_t v84 = v57;
      if (!v19) {
        goto LABEL_81;
      }
    }
    if (v57 >= 1)
    {
      _EKRecurrenceApplyBySetPosToRange(v79, v19, &v83, v22, v30, v12, v88, &v87);
      uint64_t v57 = v84;
      if (v88)
      {
        v88 -= v84;
      }
      else if (!v84 && v87)
      {
        [v18 absoluteTime];
        if (v60 >= v41) {
          break;
        }
LABEL_87:
        [v18 addMonths:interval];
        uint64_t v57 = 0;
        ++v43;
        goto LABEL_88;
      }
    }
LABEL_81:
    [v18 addMonths:interval];
    if (v57 <= 0) {
      ++v43;
    }
    else {
      unint64_t v43 = 0;
    }
LABEL_88:
    v83 += v57;
    uint64_t v84 = 0;
  }
  double v61 = (void *)[v79 copy];

  return v61;
}

- (BOOL)_validateCalDate:(id)a3 pinned:(BOOL)a4
{
  return (int)CalGregorianDateGetDaysInMonth(*(unint64_t *)&a3.var0) >= (uint64_t)a3.var2 || a4;
}

- (id)_copyYearlyOccurrencesWithInitialDate:(id)a3 startDate:(id)a4 endDate:(id)a5 count:(unint64_t)a6 countPastEndDate:(unint64_t)a7
{
  v107[8] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v96 = a5;
  unint64_t v92 = a6;
  unint64_t v106 = a6;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  uint64_t interval = self->_interval;
  uint64_t v16 = [v12 calendarDateForYear];
  BOOL v85 = [v13 calendarDateForYear];
  id v86 = (void *)v16;
  int v17 = [v85 differenceInYears:v16] % interval;
  v95 = v13;
  id v18 = objc_msgSend(v13, "calendarDateByAddingDays:", (int)(1 - objc_msgSend(v13, "dayOfYear")));
  uint64_t v19 = (void *)[v18 mutableCopy];

  if (v17 >= 1) {
    [v19 addYears:(int)interval - v17];
  }
  uint64_t v91 = interval;
  v104 = 0;
  CFTypeRef v105 = 0;
  unint64_t weekStart = 0;
  v103 = 0;
  v99 = 0;
  id v100 = 0;
  unint64_t v101 = a7;
  v20 = self->_daysOfTheYear;
  uint64_t v21 = self->_daysOfTheWeek;
  uint64_t v22 = self->_daysOfTheMonth;
  v23 = self->_weeksOfTheYear;
  v24 = self->_setPositions;
  double v25 = self->_monthsOfTheYear;
  v82 = v22;
  unint64_t v87 = v23;
  uint64_t v84 = v20;
  if (![(NSArray *)v20 count])
  {
    if ([(NSArray *)v22 count])
    {
      if (self->_shouldPinMonthDays) {
        unint64_t v27 = _EKRecurrenceByMonthDayGeneratorPinned;
      }
      else {
        unint64_t v27 = _EKRecurrenceByMonthDayGenerator;
      }
      v104 = v27;
      CFTypeRef v105 = v22;
      if ([(NSArray *)v21 count])
      {
        v107[0] = _EKRecurrenceByDayFilter;
        v107[1] = v21;
        uint64_t v26 = 1;
        goto LABEL_5;
      }
    }
    else
    {
      if ([(NSArray *)v21 count])
      {
        uint64_t v26 = 0;
        unint64_t v27 = _EKRecurrenceByDayGenerator;
        v104 = _EKRecurrenceByDayGenerator;
        CFTypeRef v105 = v21;
        goto LABEL_5;
      }
      if ([(NSArray *)v25 count])
      {
        if (self->_shouldPinMonthDays) {
          unint64_t v27 = _EKRecurrenceByMonthDayGeneratorPinned;
        }
        else {
          unint64_t v27 = _EKRecurrenceByMonthDayGenerator;
        }
        v104 = v27;
        v94 = (void *)MEMORY[0x1E4F1C978];
        char v78 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "day"));
        v79 = v94;
      }
      else
      {
        if (![(NSArray *)v23 count])
        {
          uint64_t v26 = 0;
          int v28 = 0;
          goto LABEL_17;
        }
        char v78 = +[CalRecurrenceDayOfWeek dayOfWeek:](CalRecurrenceDayOfWeek, "dayOfWeek:", [v12 dayOfWeek]);
        unint64_t v27 = _EKRecurrenceByDayGenerator;
        v104 = _EKRecurrenceByDayGenerator;
        v79 = (void *)MEMORY[0x1E4F1C978];
      }
      CFTypeRef v80 = CFRetain((CFTypeRef)[v79 arrayWithObject:v78]);
      CFTypeRef v105 = CFAutorelease(v80);
    }
    uint64_t v26 = 0;
    goto LABEL_5;
  }
  uint64_t v26 = 0;
  unint64_t v27 = _EKRecurrenceByYearDayGenerator;
  v104 = _EKRecurrenceByYearDayGenerator;
  CFTypeRef v105 = v20;
LABEL_5:
  if (v25)
  {
    int v28 = 1;
    uint64_t v30 = v91;
    unint64_t v29 = v92;
    goto LABEL_7;
  }
  unint64_t v93 = v26;
  int v28 = 1;
  if ([(NSArray *)v87 count] || v27 == _EKRecurrenceByYearDayGenerator)
  {
    v81 = 0;
    uint64_t v30 = v91;
    unint64_t v29 = v92;
    goto LABEL_20;
  }
  double v32 = (void *)MEMORY[0x1E4F1C978];
  double v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "month"));
  double v25 = [v32 arrayWithObject:v33];

  int v28 = 1;
  uint64_t v26 = v93;
LABEL_17:
  uint64_t v30 = v91;
  unint64_t v29 = v92;
  if (!v25)
  {
    unint64_t v93 = v26;
    v81 = 0;
    goto LABEL_20;
  }
LABEL_7:
  double v31 = (uint64_t (**)(void *, void *))&v107[2 * v26];
  unint64_t v93 = v26 + 1;
  *double v31 = _EKRecurrenceByMonthFilter;
  v31[1] = (uint64_t (*)(void *, void *))v25;
  v81 = v25;
LABEL_20:
  if ([(NSArray *)v87 count])
  {
    unint64_t weekStart = self->_weekStart;
    v103 = v87;
    double v34 = (BOOL (**)(uint64_t, void *))&v107[2 * v93++];
    *double v34 = _EKRecurrenceByWeekNoFilter;
    v34[1] = (BOOL (*)(uint64_t, void *))&weekStart;
  }
  CFIndex v83 = v21;
  if (v28 && ![(NSArray *)v24 count])
  {
    v99 = v95;
    id v100 = v96;
    double v35 = (BOOL (**)(uint64_t, void *))&v107[2 * v93++];
    void *v35 = _EKRecurrenceRangeFilter;
    v35[1] = (BOOL (*)(uint64_t, void *))&v99;
  }
  CFIndex v97 = 0;
  uint64_t v98 = 0;
  if (!self->_onlyIncludeInitialDateIfItMatchesRecurrence)
  {
    [v12 absoluteTime];
    double v37 = v36;
    [v95 absoluteTime];
    if (v37 >= v38)
    {
      if (!v96 || ([v12 absoluteTime], double v40 = v39, objc_msgSend(v96, "absoluteTime"), v40 < v41))
      {
        [v12 absoluteTime];
        _InsertAbsoluteTimeIntoArrayAtIndex(v14, v42);
        if (v106) {
          --v106;
        }
        if (v24) {
          CFIndex v97 = 1;
        }
      }
    }
  }
  [v96 absoluteTime];
  double v44 = v43;
  if (v29)
  {
    double v45 = fabs(v43);
    if (v44 > 1577840000.0 || v45 < 2.22044605e-16) {
      double v44 = 1577840000.0;
    }
  }
  unint64_t v47 = 0;
  if (v24) {
    id v48 = 0;
  }
  else {
    id v48 = v12;
  }
  uint64_t v49 = &v106;
  if (v24) {
    uint64_t v49 = 0;
  }
  uint64_t v89 = v49;
  v90 = v48;
  double v50 = &v101;
  if (v24) {
    double v50 = 0;
  }
  unint64_t v88 = v50;
  while (1)
  {
    [v19 absoluteTime];
    if (v51 >= v44 && (!v101 || v47 > 9)) {
      break;
    }
    if (v29 && !v106) {
      break;
    }
    if (v28)
    {
      uint64_t v53 = _EKRecurrenceApplyGenerator(v14, (uint64_t)&v104, (uint64_t)v107, v93, v90, v95, v96, v19, 4u, v89, v88, self->_onlyIncludeInitialDateIfItMatchesRecurrence);
      uint64_t v98 = v53;
      if (!v24) {
        goto LABEL_80;
      }
    }
    else
    {
      double v54 = v14;
      double v55 = [v19 dayTimeComponents];
      objc_msgSend(v55, "setMonth:", objc_msgSend(v12, "month"));
      if (self->_shouldPinMonthDays)
      {
        double v56 = [EKCalendarDate alloc];
        uint64_t v57 = [v12 timeZone];
        double v58 = [(EKCalendarDate *)v56 initWithDateComponents:v55 timeZone:v57];

        uint64_t v59 = [(EKCalendarDate *)v58 daysInMonth];
        if ([v12 day] <= v59) {
          uint64_t v59 = [v12 day];
        }
        [v55 setDay:v59];
      }
      else
      {
        objc_msgSend(v55, "setDay:", objc_msgSend(v12, "day"));
      }
      double v60 = [v12 calendar];
      int v61 = [v55 isValidDateInCalendar:v60];

      if (v61)
      {
        uint64_t v62 = [v12 timeZone];
        uint64_t v63 = +[EKCalendarDate calendarDateWithDateComponents:v55 timeZone:v62];

        [v63 absoluteTime];
        double v65 = v64;
        [v95 absoluteTime];
        if (v65 >= v66
          && (!v96
           || ([v63 absoluteTime], double v68 = v67, objc_msgSend(v96, "absoluteTime"), v68 < v69)
           || v101)
          && (self->_onlyIncludeInitialDateIfItMatchesRecurrence
           || ([v63 absoluteTime],
               double v71 = v70,
               [v12 absoluteTime],
               vabdd_f64(v71, v72) >= 2.22044605e-16))
          && (!v93
           || _EKRecurrenceApplyFiltersToSingleDate(v63, (uint64_t)v107, v93, v12, [(CalRecurrenceGenerator *)self onlyIncludeInitialDateIfItMatchesRecurrence])))
        {
          [v63 absoluteTime];
          _AppendAbsoluteTimeToArray(v54, v73);
          if (!v24)
          {
            if (v106) {
              --v106;
            }
            if (v101)
            {
              [v63 absoluteTime];
              if (v75 >= v44) {
                --v101;
              }
            }
          }
          uint64_t v98 = 1;
          uint64_t v53 = 1;
        }
        else
        {
          uint64_t v53 = 0;
        }
      }
      else
      {
        uint64_t v53 = 0;
      }

      uint64_t v14 = v54;
      uint64_t v30 = v91;
      unint64_t v29 = v92;
      if (!v24) {
        goto LABEL_80;
      }
    }
    if (v53 < 1) {
      goto LABEL_80;
    }
    _EKRecurrenceApplyBySetPosToRange(v14, v24, &v97, v95, v96, v12, v106, &v101);
    uint64_t v53 = v98;
    if (v106)
    {
      v106 -= v98;
LABEL_80:
      [v19 addYears:v30];
      if (v53 <= 0) {
        ++v47;
      }
      else {
        unint64_t v47 = 0;
      }
      goto LABEL_83;
    }
    if (v98 || !v101) {
      goto LABEL_80;
    }
    [v19 absoluteTime];
    if (v74 >= v44) {
      break;
    }
    [v19 addYears:v30];
    uint64_t v53 = 0;
    ++v47;
LABEL_83:
    v97 += v53;
    uint64_t v98 = 0;
  }
  id v76 = (void *)[v14 copy];

  return v76;
}

- (NSDate)eventStartDate
{
  return self->_eventStartDate;
}

- (void)setEventStartDate:(id)a3
{
}

- (NSDate)eventEndDate
{
  return self->_eventEndDate;
}

- (void)setEventEndDate:(id)a3
{
}

- (NSTimeZone)eventTimeZone
{
  return self->_eventTimeZone;
}

- (void)setEventTimeZone:(id)a3
{
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_BOOL allDay = a3;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSArray)daysOfTheWeek
{
  return self->_daysOfTheWeek;
}

- (void)setDaysOfTheWeek:(id)a3
{
}

- (NSArray)daysOfTheMonth
{
  return self->_daysOfTheMonth;
}

- (void)setDaysOfTheMonth:(id)a3
{
}

- (NSArray)daysOfTheYear
{
  return self->_daysOfTheYear;
}

- (void)setDaysOfTheYear:(id)a3
{
}

- (NSArray)weeksOfTheYear
{
  return self->_weeksOfTheYear;
}

- (void)setWeeksOfTheYear:(id)a3
{
}

- (NSArray)monthsOfTheYear
{
  return self->_monthsOfTheYear;
}

- (void)setMonthsOfTheYear:(id)a3
{
}

- (NSArray)setPositions
{
  return self->_setPositions;
}

- (void)setSetPositions:(id)a3
{
}

- (int)interval
{
  return self->_interval;
}

- (void)setInterval:(int)a3
{
  self->_uint64_t interval = a3;
}

- (int)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(int)a3
{
  self->_frequency = a3;
}

- (unint64_t)weekStart
{
  return self->_weekStart;
}

- (void)setWeekStart:(unint64_t)a3
{
  self->_unint64_t weekStart = a3;
}

- (BOOL)shouldPinMonthDays
{
  return self->_shouldPinMonthDays;
}

- (void)setShouldPinMonthDays:(BOOL)a3
{
  self->_shouldPinMonthDays = a3;
}

- (BOOL)onlyIncludeInitialDateIfItMatchesRecurrence
{
  return self->_onlyIncludeInitialDateIfItMatchesRecurrence;
}

- (void)setOnlyIncludeInitialDateIfItMatchesRecurrence:(BOOL)a3
{
  self->_onlyIncludeInitialDateIfItMatchesRecurrence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setPositions, 0);
  objc_storeStrong((id *)&self->_monthsOfTheYear, 0);
  objc_storeStrong((id *)&self->_weeksOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheMonth, 0);
  objc_storeStrong((id *)&self->_daysOfTheWeek, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_eventTimeZone, 0);
  objc_storeStrong((id *)&self->_eventEndDate, 0);
  objc_storeStrong((id *)&self->_eventStartDate, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end