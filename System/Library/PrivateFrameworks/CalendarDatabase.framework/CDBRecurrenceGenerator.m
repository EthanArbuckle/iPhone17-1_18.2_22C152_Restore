@interface CDBRecurrenceGenerator
- (id)_copyOccurrenceDatesWithBirthdayEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7 locked:(BOOL)a8;
- (id)computeRecurrenceEndDateForCalEvent:(void *)a3 recurrenceRule:(void *)a4 locked:(BOOL)a5;
- (id)copyOccurrenceDatesWithCalEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 includeExtraOccurrencesPastEndDate:(BOOL)a7 locked:(BOOL)a8;
- (id)copyOccurrenceDatesWithCalEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7 includeExtraOccurrencesPastEndDate:(BOOL)a8 locked:(BOOL)a9;
- (id)copyOccurrenceDatesWithCalEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7 locked:(BOOL)a8;
- (id)copyOccurrenceDatesWithInitialDate:(id)a3 calRecurrences:(id)a4 rangeStart:(id)a5 rangeEnd:(id)a6 timeZone:(id)a7;
- (id)nextOccurrenceDateWithCalRecurrences:(id)a3 exceptionDates:(id)a4 initialDate:(id)a5 afterDate:(id)a6;
- (void)_prepareForCalRecurrence:(void *)a3 locked:(BOOL)a4;
- (void)_setupForCalEvent:(void *)a3 locked:(BOOL)a4;
@end

@implementation CDBRecurrenceGenerator

- (void)_setupForCalEvent:(void *)a3 locked:(BOOL)a4
{
  if (a4)
  {
    RecordLock = 0;
  }
  else
  {
    RecordLock = (os_unfair_lock_s *)CalGetRecordLock();
    os_unfair_lock_lock(RecordLock);
  }
  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:COERCE_DOUBLE(_CalEventGetStartDate((uint64_t)a3))];
  [(CalRecurrenceGenerator *)self setEventStartDate:v7];

  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:_CalRecurrenceGetEndDate((uint64_t)a3)];
  [(CalRecurrenceGenerator *)self setEventEndDate:v8];

  started = (void *)_CalCalendarItemCopyStartTimeZone((uint64_t)a3);
  [(CalRecurrenceGenerator *)self setEventTimeZone:started];

  [(CalRecurrenceGenerator *)self setAllDay:_CalEventIsAllDay((uint64_t)a3)];
  uint64_t Calendar = _CalEventGetCalendar((uint64_t)a3);
  BOOL v12 = Calendar
     && (CFTypeRef Store = _CalCalendarGetStore(Calendar)) != 0
     && _CalStoreAreRecurrencesPinnedToMonthDays((uint64_t)Store);
  [(CalRecurrenceGenerator *)self setShouldPinMonthDays:v12];
  if (RecordLock)
  {
    if (CDBLockingAssertionsEnabled) {
      os_unfair_lock_assert_owner(RecordLock);
    }
    os_unfair_lock_unlock(RecordLock);
  }
}

- (id)_copyOccurrenceDatesWithBirthdayEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7 locked:(BOOL)a8
{
  BOOL v8 = a8;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v8) {
    uint64_t v15 = _CalCalendarItemCopyCalendarScale((uint64_t)a3);
  }
  else {
    uint64_t v15 = CalCalendarItemCopyCalendarScale((uint64_t)a3);
  }
  v32 = (void *)v15;
  v16 = [MEMORY[0x1E4F1C9A8] CalCalendarWithUnsanitizedCalendarIdentifier:v15];
  v17 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v16 setTimeZone:v17];
  v34 = v12;
  v18 = [MEMORY[0x1E4F57838] calendarDateWithDate:v12 timeZone:v14];
  v33 = v13;
  v19 = [MEMORY[0x1E4F57838] calendarDateWithDate:v13 timeZone:v14];
  id v20 = objc_alloc(MEMORY[0x1E4F576D0]);
  v21 = [v18 date];
  v22 = [v19 date];
  v23 = (void *)[v20 initWithStartDate:v21 endDate:v22];

  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", COERCE_DOUBLE(_CalEventCopyStartDateWhileLocked((uint64_t)a3, v8)));
  CalDateTimeRelease();
  v25 = [v23 startDate];
  LODWORD(v22) = [v24 CalIsAfterOrSameAsDate:v25];

  if (v22)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F576D0]);
    v27 = [v23 endDate];
    uint64_t v28 = [v26 initWithStartDate:v24 endDate:v27];

    v23 = (void *)v28;
  }
  v29 = [v16 components:24 fromDate:v24];
  [v16 setTimeZone:v14];
  v30 = [v16 CalOccurrencesForBirthday:v29 inDateRange:v23];

  return v30;
}

- (id)copyOccurrenceDatesWithCalEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7 locked:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [(CDBRecurrenceGenerator *)self copyOccurrenceDatesWithCalEvent:a3 startDate:a4 endDate:a5 timeZone:a6 limit:a7 includeExtraOccurrencesPastEndDate:0 locked:v9];
}

- (id)copyOccurrenceDatesWithCalEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 includeExtraOccurrencesPastEndDate:(BOOL)a7 locked:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [(CDBRecurrenceGenerator *)self copyOccurrenceDatesWithCalEvent:a3 startDate:a4 endDate:a5 timeZone:a6 limit:0 includeExtraOccurrencesPastEndDate:a7 locked:v9];
}

- (id)copyOccurrenceDatesWithCalEvent:(void *)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 limit:(int64_t)a7 includeExtraOccurrencesPastEndDate:(BOOL)a8 locked:(BOOL)a9
{
  BOOL v35 = a8;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  [(CDBRecurrenceGenerator *)self _setupForCalEvent:a3 locked:a9];
  if (a9)
  {
    v17 = (const void *)_CalEventCopyContactIdentifier((uint64_t)a3);
    if (v17)
    {
LABEL_3:
      CFRelease(v17);
      id v18 = [(CDBRecurrenceGenerator *)self _copyOccurrenceDatesWithBirthdayEvent:a3 startDate:v14 endDate:v15 timeZone:v16 limit:a7 locked:a9];
      goto LABEL_23;
    }
  }
  else
  {
    v17 = (const void *)CalEventCopyContactIdentifier((uint64_t)a3);
    if (v17) {
      goto LABEL_3;
    }
  }
  CFArrayRef v19 = _CalCalendarItemCopyRecurrencesWhileLocked((uint64_t)a3, a9);
  if (!v19)
  {
    id v18 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_23;
  }
  CFArrayRef v20 = v19;
  CFIndex Count = CFArrayGetCount(v19);
  id v36 = v15;
  if (Count >= 2)
  {
    v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:0];
    v23 = 0;
    goto LABEL_10;
  }
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  v22 = 0;
  if (Count == 1)
  {
LABEL_10:
    v34 = v22;
    id v24 = v16;
    id v25 = v14;
    for (CFIndex i = 0; i != Count; ++i)
    {
      uint64_t v27 = [(CDBRecurrenceGenerator *)self _prepareForCalRecurrence:CFArrayGetValueAtIndex(v20, i) locked:a9];
      uint64_t v28 = (void *)MEMORY[0x1AD0E9B90](v27);
      if (a7) {
        id v29 = [(CalRecurrenceGenerator *)self copyOccurrenceDatesBetweenStartDate:v25 endDate:v15 timeZone:v24 limit:a7];
      }
      else {
        id v29 = [(CalRecurrenceGenerator *)self copyOccurrenceDatesBetweenStartDate:v25 endDate:v15 timeZone:v24 plusExtraOccurrencePastEnd:v35];
      }
      v30 = v29;
      if (v23) {
        v31 = v23;
      }
      else {
        v31 = v34;
      }
      objc_msgSend(v31, "addObjectsFromArray:", v30, v34);

      id v15 = v36;
    }
    id v14 = v25;
    id v16 = v24;
    v22 = v34;
  }
  CFRelease(v20);
  if (v23)
  {
    id v18 = v23;
  }
  else
  {
    v32 = [v22 array];
    id v18 = [v32 sortedArrayUsingSelector:sel_compare_];

    id v15 = v36;
  }

LABEL_23:
  return v18;
}

- (id)copyOccurrenceDatesWithInitialDate:(id)a3 calRecurrences:(id)a4 rangeStart:(id)a5 rangeEnd:(id)a6 timeZone:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v27 = a5;
  id v14 = a6;
  id v15 = a7;
  [(CalRecurrenceGenerator *)self setEventStartDate:v12];
  id v16 = v12;
  [(CalRecurrenceGenerator *)self setEventEndDate:v12];
  [(CalRecurrenceGenerator *)self setEventTimeZone:v15];
  [(CalRecurrenceGenerator *)self setAllDay:0];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v13;
  uint64_t v18 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = (void *)MEMORY[0x1AD0E9B90]([(CDBRecurrenceGenerator *)self _prepareForCalRecurrence:*(void *)(*((void *)&v28 + 1) + 8 * v21) locked:0]);
        id v23 = [(CalRecurrenceGenerator *)self copyOccurrenceDatesWithInitialDate:v16 allDay:0 rangeStart:v27 rangeEnd:v14 timeZone:v15 limit:0];
        [v17 addObjectsFromArray:v23];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v19);
  }

  id v24 = (void *)[v17 copy];
  return v24;
}

- (id)nextOccurrenceDateWithCalRecurrences:(id)a3 exceptionDates:(id)a4 initialDate:(id)a5 afterDate:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v12 date];
  [(CalRecurrenceGenerator *)self setEventStartDate:v14];

  id v15 = [v12 date];
  [(CalRecurrenceGenerator *)self setEventEndDate:v15];

  id v16 = [v12 timeZone];
  [(CalRecurrenceGenerator *)self setEventTimeZone:v16];

  [(CalRecurrenceGenerator *)self setAllDay:0];
  v17 = (void *)MEMORY[0x1E4F57838];
  uint64_t v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:1577840000.0];
  v42 = v12;
  uint64_t v19 = [v12 timeZone];
  v43 = [v17 calendarDateWithDate:v18 timeZone:v19];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v10;
  uint64_t v46 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v54;
LABEL_3:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v54 != v45) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = (void *)MEMORY[0x1AD0E9B90]([(CDBRecurrenceGenerator *)self _prepareForCalRecurrence:*(void *)(*((void *)&v53 + 1) + 8 * v20) locked:0]);
      v22 = [v13 calendarDateByAddingSeconds:1];
      id v23 = [(CalRecurrenceGenerator *)self endDate];

      if (v23)
      {
        id v24 = (void *)MEMORY[0x1E4F57838];
        id v25 = [(CalRecurrenceGenerator *)self endDate];
        id v26 = [v13 timeZone];
        id v27 = [v24 calendarDateWithDate:v25 timeZone:v26];

        long long v28 = [v27 date];
        long long v29 = [v28 dateByAddingTimeInterval:1.0];
      }
      else
      {
        long long v29 = [v43 date];
      }
      uint64_t v30 = [v11 count] + 1;
      long long v31 = [v22 date];
      v32 = [v13 timeZone];
      id v33 = [(CalRecurrenceGenerator *)self copyOccurrenceDatesBetweenStartDate:v31 endDate:v29 timeZone:v32 limit:v30];

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v34 = v33;
      id v35 = (id)[v34 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v35)
      {
        v47 = v22;
        v48 = v21;
        id v36 = self;
        id v37 = v13;
        uint64_t v38 = *(void *)v50;
        while (2)
        {
          for (CFIndex i = 0; i != v35; CFIndex i = (char *)i + 1)
          {
            if (*(void *)v50 != v38) {
              objc_enumerationMutation(v34);
            }
            v40 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            if (([v11 containsObject:v40] & 1) == 0)
            {
              id v35 = v40;
              goto LABEL_19;
            }
          }
          id v35 = (id)[v34 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v35) {
            continue;
          }
          break;
        }
LABEL_19:
        id v13 = v37;
        self = v36;
        v22 = v47;
        uint64_t v21 = v48;
      }

      if (v35) {
        break;
      }
      if (++v20 == v46)
      {
        uint64_t v46 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
        if (v46) {
          goto LABEL_3;
        }
        goto LABEL_23;
      }
    }
  }
  else
  {
LABEL_23:
    id v35 = 0;
  }

  return v35;
}

- (void)_prepareForCalRecurrence:(void *)a3 locked:(BOOL)a4
{
  if (a4)
  {
    RecordLocuint64_t k = 0;
  }
  else
  {
    RecordLocuint64_t k = (os_unfair_lock_s *)CalGetRecordLock();
    os_unfair_lock_lock(RecordLock);
  }
  [(CalRecurrenceGenerator *)self setWeekStart:_CalRecurrenceGetWeekStart((uint64_t)a3) + 1];
  [(CalRecurrenceGenerator *)self setFrequency:_CalRecurrenceGetFrequency((uint64_t)a3)];
  [(CalRecurrenceGenerator *)self setInterval:_CalRecurrenceGetInterval((uint64_t)a3)];
  uint64_t v7 = _CalRecurrenceCopyBySetPos((uint64_t)a3);
  if (v7)
  {
    CFArrayRef v8 = (const __CFArray *)v7;
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    CFIndex Count = CFArrayGetCount(v8);
    if (Count >= 1)
    {
      CFIndex v11 = Count;
      for (CFIndex i = 0; i != v11; ++i)
      {
        id v13 = objc_msgSend(NSNumber, "numberWithInteger:", CFArrayGetValueAtIndex(v8, i));
        [v9 addObject:v13];
      }
    }
    id v14 = (void *)[v9 copy];
    [(CalRecurrenceGenerator *)self setSetPositions:v14];

    CFRelease(v8);
  }
  uint64_t v15 = _CalRecurrenceCopyByDayDays((uint64_t)a3);
  if (v15)
  {
    CFArrayRef v16 = (const __CFArray *)v15;
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    CFIndex v18 = CFArrayGetCount(v16);
    if (v18 >= 1)
    {
      CFIndex v19 = v18;
      for (CFIndex j = 0; j != v19; ++j)
      {
        ValueAtIndex = (int *)CFArrayGetValueAtIndex(v16, j);
        v22 = [MEMORY[0x1E4F57798] dayOfWeek:(ValueAtIndex[1] + 1) weekNumber:*ValueAtIndex];
        [v17 addObject:v22];
      }
    }
    id v23 = (void *)[v17 copy];
    [(CalRecurrenceGenerator *)self setDaysOfTheWeek:v23];

    CFRelease(v16);
  }
  int v24 = _CalRecurrenceGetByMonthMonths((uint64_t)a3);
  if (v24)
  {
    int v25 = v24;
    id v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    for (uint64_t k = 0; k != 12; ++k)
    {
      if (((1 << k) & v25) != 0)
      {
        long long v28 = [NSNumber numberWithInteger:(unint64_t)(log2((double)(1 << k)) + 1.0)];
        [v26 addObject:v28];
      }
    }
    long long v29 = (void *)[v26 copy];
    [(CalRecurrenceGenerator *)self setMonthsOfTheYear:v29];
  }
  uint64_t v30 = _CalRecurrenceCopyByMonthDayDays((uint64_t)a3);
  if (v30)
  {
    CFArrayRef v31 = (const __CFArray *)v30;
    v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    CFIndex v33 = CFArrayGetCount(v31);
    if (v33 >= 1)
    {
      CFIndex v34 = v33;
      for (CFIndex m = 0; m != v34; ++m)
      {
        id v36 = objc_msgSend(NSNumber, "numberWithInteger:", CFArrayGetValueAtIndex(v31, m));
        [v32 addObject:v36];
      }
    }
    id v37 = (void *)[v32 copy];
    [(CalRecurrenceGenerator *)self setDaysOfTheMonth:v37];

    CFRelease(v31);
  }
  uint64_t v38 = _CalRecurrenceCopyByWeekWeeks((uint64_t)a3);
  if (v38)
  {
    CFArrayRef v39 = (const __CFArray *)v38;
    v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    CFIndex v41 = CFArrayGetCount(v39);
    if (v41 >= 1)
    {
      CFIndex v42 = v41;
      for (CFIndex n = 0; n != v42; ++n)
      {
        v44 = objc_msgSend(NSNumber, "numberWithInteger:", CFArrayGetValueAtIndex(v39, n));
        [v40 addObject:v44];
      }
    }
    uint64_t v45 = (void *)[v40 copy];
    [(CalRecurrenceGenerator *)self setWeeksOfTheYear:v45];

    CFRelease(v39);
  }
  uint64_t v46 = _CalRecurrenceCopyByYearDayDays((uint64_t)a3);
  if (v46)
  {
    CFArrayRef v47 = (const __CFArray *)v46;
    v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    CFIndex v49 = CFArrayGetCount(v47);
    if (v49 >= 1)
    {
      CFIndex v50 = v49;
      for (iCFIndex i = 0; ii != v50; ++ii)
      {
        long long v52 = objc_msgSend(NSNumber, "numberWithInteger:", CFArrayGetValueAtIndex(v47, ii));
        [v48 addObject:v52];
      }
    }
    long long v53 = (void *)[v48 copy];
    [(CalRecurrenceGenerator *)self setDaysOfTheYear:v53];

    CFRelease(v47);
  }
  if (vabdd_f64(COERCE_DOUBLE(_CalRecurrenceCopyCachedEndDate((uint64_t)a3)), *MEMORY[0x1E4F57888]) >= 2.22044605e-16)
  {
    v60 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    [(CalRecurrenceGenerator *)self setEndDate:v60];

    CalDateTimeRelease();
    if (!RecordLock) {
      return;
    }
    goto LABEL_44;
  }
  if (vabdd_f64(_CalRecurrenceGetEndDate((uint64_t)a3), *MEMORY[0x1E4F57888]) >= 2.22044605e-16)
  {
    v61 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    [(CalRecurrenceGenerator *)self setEndDate:v61];

LABEL_43:
    if (!RecordLock) {
      return;
    }
    goto LABEL_44;
  }
  if (!_CalRecurrenceGetCount((uint64_t)a3)) {
    goto LABEL_43;
  }
  long long v54 = [(CalRecurrenceGenerator *)self computeRecurrenceEndDate:_CalRecurrenceGetCount((uint64_t)a3)];
  [(CalRecurrenceGenerator *)self setEndDate:v54];

  long long v55 = [(CalRecurrenceGenerator *)self endDate];
  [v55 timeIntervalSinceReferenceDate];
  uint64_t v62 = v56;

  v57 = [(CalRecurrenceGenerator *)self eventTimeZone];
  if (v57)
  {
    v58 = [(CalRecurrenceGenerator *)self eventTimeZone];
    uint64_t v59 = (__CFString *)CalCFTimeZoneCopyCalTimeZone();
  }
  else
  {
    uint64_t v59 = @"_float";
  }

  CalDateTimeSetTimeZone();
  _CalRecurrenceSetCachedEndDate((uint64_t)a3, v62);
  CalDateTimeRelease();
  CFRelease(v59);
  if (RecordLock)
  {
LABEL_44:
    if (CDBLockingAssertionsEnabled) {
      os_unfair_lock_assert_owner(RecordLock);
    }
    os_unfair_lock_unlock(RecordLock);
  }
}

- (id)computeRecurrenceEndDateForCalEvent:(void *)a3 recurrenceRule:(void *)a4 locked:(BOOL)a5
{
  BOOL v5 = a5;
  [(CDBRecurrenceGenerator *)self _setupForCalEvent:a3 locked:a5];
  [(CDBRecurrenceGenerator *)self _prepareForCalRecurrence:a4 locked:v5];
  return [(CalRecurrenceGenerator *)self endDate];
}

@end