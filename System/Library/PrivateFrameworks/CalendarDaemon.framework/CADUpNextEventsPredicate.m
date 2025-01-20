@interface CADUpNextEventsPredicate
+ (BOOL)_occurrencePassesFilter:(CalEventOccurrence *)a3 event:(void *)a4;
+ (BOOL)supportsSecureCoding;
+ (id)_descriptionForOccurrence:(CalEventOccurrence *)a3 ofEvent:(void *)a4;
- (BOOL)isEqual:(id)a3;
- (CADUpNextEventsPredicate)initWithCalendarIDs:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (CADUpNextEventsPredicate)initWithCoder:(id)a3;
- (double)startDateRestrictionThreshold;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)predicateFormat;
- (void)encodeWithCoder:(id)a3;
- (void)setStartDateRestrictionThreshold:(double)a3;
@end

@implementation CADUpNextEventsPredicate

- (CADUpNextEventsPredicate)initWithCalendarIDs:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CADUpNextEventsPredicate;
  v10 = [(EKPredicate *)&v22 initWithCalendars:a3];
  if (!v10) {
    goto LABEL_12;
  }
  if (v8 && v9)
  {
    if ([v8 CalIsAfterDate:v9])
    {
      v11 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138412802;
        v24 = v14;
        __int16 v25 = 2112;
        id v26 = v8;
        __int16 v27 = 2112;
        id v28 = v9;
        v15 = "[%@] must be given a 'startDate' that occurs before the given 'endDate.'  startDate: [%@] endDate: [%@]";
        v16 = v12;
        uint32_t v17 = 32;
LABEL_9:
        _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
    [(EKPredicate *)v10 setStartDate:v8];
    [(EKPredicate *)v10 setEndDate:v9];
LABEL_12:
    v20 = v10;
    goto LABEL_13;
  }
  v18 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v12 = v18;
    v19 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138412290;
    v24 = v14;
    v15 = "[%@] must be given non-nil 'startDate' and 'endDate'";
    v16 = v12;
    uint32_t v17 = 12;
    goto LABEL_9;
  }
LABEL_10:
  v20 = 0;
LABEL_13:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADUpNextEventsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADUpNextEventsPredicate;
  v5 = [(EKPredicate *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    [(EKPredicate *)v5 setStartDate:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    [(EKPredicate *)v5 setEndDate:v7];

    [v4 decodeDoubleForKey:@"startDateRestrictionThreshold"];
    -[CADUpNextEventsPredicate setStartDateRestrictionThreshold:](v5, "setStartDateRestrictionThreshold:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CADUpNextEventsPredicate;
  id v4 = a3;
  [(EKPredicate *)&v7 encodeWithCoder:v4];
  v5 = [(EKPredicate *)self startDate];
  [v4 encodeObject:v5 forKey:@"startDate"];

  v6 = [(EKPredicate *)self endDate];
  [v4 encodeObject:v6 forKey:@"endDate"];

  [(CADUpNextEventsPredicate *)self startDateRestrictionThreshold];
  objc_msgSend(v4, "encodeDouble:forKey:", @"startDateRestrictionThreshold");
}

- (id)predicateFormat
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:1];
  [v3 setTimeStyle:1];
  id v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  objc_super v7 = [(EKPredicate *)self startDate];
  id v8 = [v3 stringFromDate:v7];
  objc_super v9 = [(EKPredicate *)self endDate];
  v10 = [v3 stringFromDate:v9];
  v11 = [(EKPredicate *)self calendars];
  v12 = +[CADPredicate conciseCalendarList:v11];
  v13 = [v4 stringWithFormat:@"[%@] start:%@; end:%@; cals:%@", v6, v8, v10, v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CADUpNextEventsPredicate *)a3;
  if (v4 == self)
  {
    char v17 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && ([(CADUpNextEventsPredicate *)v4 startDateRestrictionThreshold],
          double v7 = v6,
          [(CADUpNextEventsPredicate *)self startDateRestrictionThreshold],
          vabdd_f64(v7, v8) < 2.22044605e-16))
    {
      objc_super v9 = [(EKPredicate *)v4 startDate];
      v10 = [(EKPredicate *)self startDate];
      if ([v9 isEqual:v10])
      {
        v11 = [(EKPredicate *)v4 endDate];
        v12 = [(EKPredicate *)self endDate];
        if ([v11 isEqual:v12])
        {
          v13 = [(EKPredicate *)v4 calendars];
          v14 = [(EKPredicate *)self calendars];
          if (v13 == v14)
          {
            char v17 = 1;
          }
          else
          {
            v15 = [(EKPredicate *)v4 calendars];
            v16 = [(EKPredicate *)self calendars];
            char v17 = [v15 isEqual:v16];
          }
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = [(EKPredicate *)self startDate];
  uint64_t v5 = [(EKPredicate *)self endDate];
  int v6 = [v4 CalIsAfterDate:v5];

  if (v6)
  {
    double v7 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      double v8 = v7;
      objc_super v9 = [(EKPredicate *)self startDate];
      v10 = [(EKPredicate *)self endDate];
      *(_DWORD *)buf = 138412802;
      v62 = v9;
      __int16 v63 = 2112;
      v64 = v10;
      __int16 v65 = 2112;
      v66 = self;
      _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_ERROR, "Start date [%@] is after end date [%@].  Will not query for events for [%@]", buf, 0x20u);
    }
    return (id)MEMORY[0x1E4F1CBF0];
  }
  v12 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  v14 = [(EKPredicate *)self calendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  v15 = [(EKPredicate *)self restrictedCalendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v14, v15);
  char v17 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v18 = v17;
    v19 = [(EKPredicate *)self startDate];
    v20 = [(EKPredicate *)self endDate];
    v21 = (void *)MEMORY[0x1E4F28ED0];
    [(CADUpNextEventsPredicate *)self startDateRestrictionThreshold];
    objc_super v22 = objc_msgSend(v21, "numberWithDouble:");
    *(_DWORD *)buf = 138413314;
    v62 = v19;
    __int16 v63 = 2112;
    v64 = v20;
    __int16 v65 = 2112;
    v66 = v14;
    __int16 v67 = 2112;
    v68 = v15;
    __int16 v69 = 2112;
    v70 = v22;
    _os_log_impl(&dword_1BBC88000, v18, OS_LOG_TYPE_DEBUG, "Commencing up next event search with start date: [%@] end date: [%@] calendar object IDs: [%@] restricted calendar row IDs: [%@] startDateRestrictionThreshold: [%@]", buf, 0x34u);
  }
  v23 = [(EKPredicate *)self startDate];
  v24 = [(EKPredicate *)self endDate];
  __int16 v25 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  CFArrayRef v26 = (const __CFArray *)CalEventOccurrenceCacheCopyEventOccurrencesInDateRange();

  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11 = v27;
  if (!v26)
  {
    v49 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v62 = self;
      _os_log_impl(&dword_1BBC88000, v49, OS_LOG_TYPE_DEBUG, "NULL occurrences array returned for [%@].", buf, 0xCu);
    }
    goto LABEL_39;
  }
  v59 = v27;
  v56 = v15;
  CFIndex Count = CFArrayGetCount(v26);
  uint64_t v29 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v62 = (CADUpNextEventsPredicate *)Count;
    _os_log_impl(&dword_1BBC88000, v29, OS_LOG_TYPE_DEBUG, "Found [%ld] up next event candidates.  Proceeding to sort and filter.", buf, 0xCu);
  }
  CFArrayRef cf = v26;
  v55 = FilterFromRowIDs;
  v57 = v14;
  v58 = v12;
  CFArrayRef v30 = (const __CFArray *)[(__CFArray *)v26 sortedArrayUsingComparator:&__block_literal_global_4];
  v31 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
  if (Count < 1)
  {
    v32 = 0;
    goto LABEL_38;
  }
  CFIndex v60 = Count;
  v32 = 0;
  CFIndex v33 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v30, v33);
    uint64_t Event = CalEventOccurrenceGetEvent();
    v36 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v37 = v36;
      v38 = [(id)objc_opt_class() _descriptionForOccurrence:ValueAtIndex ofEvent:Event];
      *(_DWORD *)buf = 138412290;
      v62 = v38;
      _os_log_impl(&dword_1BBC88000, v37, OS_LOG_TYPE_DEBUG, "Analyzing 'up next' candidate: [%@]", buf, 0xCu);
    }
    CalEventOccurrenceGetDate();
    v39 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    v40 = [v39 dateByAddingTimeInterval:(double)CalEventGetDuration()];
    if (![v40 CalIsBeforeDate:v31]) {
      break;
    }
    v41 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      v42 = v41;
      v43 = [(id)objc_opt_class() _descriptionForOccurrence:ValueAtIndex ofEvent:Event];
      *(_DWORD *)buf = 138412802;
      v62 = v31;
      __int16 v63 = 2112;
      v64 = v40;
      __int16 v65 = 2112;
      v66 = v43;
      v44 = v42;
      v45 = "Rejected 'up next' candidate because it ended before 'now' at [%@].  End date: [%@].  Candidate: [%@]";
      uint32_t v46 = 32;
LABEL_29:
      _os_log_impl(&dword_1BBC88000, v44, OS_LOG_TYPE_DEBUG, v45, buf, v46);
    }
LABEL_30:

    if (v60 == ++v33) {
      goto LABEL_38;
    }
  }
  if (!v32 || ([(CADUpNextEventsPredicate *)v32 isEqualToDate:v39] & 1) != 0)
  {
    if ([(id)objc_opt_class() _occurrencePassesFilter:ValueAtIndex event:Event])
    {
      [v59 addObject:ValueAtIndex];
      if (!v32)
      {
        if ([v39 CalIsAfterOrSameAsDate:v31]) {
          v32 = v39;
        }
        else {
          v32 = 0;
        }
      }
      v48 = (void *)CADLogHandle;
      if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_30;
      }
      v42 = v48;
      v43 = [(id)objc_opt_class() _descriptionForOccurrence:ValueAtIndex ofEvent:Event];
      *(_DWORD *)buf = 138412290;
      v62 = v43;
      v44 = v42;
      v45 = "Accepted 'up next' candidate: [%@]";
    }
    else
    {
      v47 = (void *)CADLogHandle;
      if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_30;
      }
      v42 = v47;
      v43 = [(id)objc_opt_class() _descriptionForOccurrence:ValueAtIndex ofEvent:Event];
      *(_DWORD *)buf = 138412290;
      v62 = v43;
      v44 = v42;
      v45 = "Rejected 'up next' candidate because it didn't pass the filter.  Candidate: [%@]";
    }
    uint32_t v46 = 12;
    goto LABEL_29;
  }
  v50 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v51 = v50;
    v52 = [(id)objc_opt_class() _descriptionForOccurrence:ValueAtIndex ofEvent:Event];
    *(_DWORD *)buf = 138412546;
    v62 = v32;
    __int16 v63 = 2112;
    v64 = v52;
    _os_log_impl(&dword_1BBC88000, v51, OS_LOG_TYPE_DEBUG, "Rejected 'up next' candidate because its start date is not equal to the earliest start date on or after now.  Earliest date: [%@]  Candidate: [%@]", buf, 0x16u);
  }
LABEL_38:
  CFRelease(cf);

  v14 = v57;
  v12 = v58;
  FilterFromRowIDs = v55;
  v15 = v56;
  v11 = v59;
LABEL_39:
  if (FilterFromRowIDs) {
    CFRelease(FilterFromRowIDs);
  }
  if (v12) {
    CFRelease(v12);
  }

  return v11;
}

uint64_t __58__CADUpNextEventsPredicate_copyMatchingItemsWithDatabase___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  CalEventOccurrenceGetDate();
  uint64_t v5 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  int v6 = (void *)MEMORY[0x1E4F1C9C8];
  CalEventOccurrenceGetDate();
  double v8 = v7;

  objc_super v9 = [v6 dateWithTimeIntervalSinceReferenceDate:v8];
  uint64_t v10 = [v5 compare:v9];

  return v10;
}

+ (BOOL)_occurrencePassesFilter:(CalEventOccurrence *)a3 event:(void *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if (CalEventIsAllDay())
    {
      double v7 = (void *)CADLogHandle;
      BOOL v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        objc_super v9 = v7;
        uint64_t v10 = [(id)objc_opt_class() _descriptionForOccurrence:a3 ofEvent:a4];
        int v25 = 138412290;
        id v26 = v10;
        v11 = "Occurrence does not pass filter since it is an all-day event.  Occurrence: [%@]";
LABEL_10:
        _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v25, 0xCu);

        goto LABEL_11;
      }
    }
    else
    {
      if (CalCalendarItemGetStatus() != 3)
      {
        if (CalCalendarItemHasAttendees())
        {
          uint64_t v14 = CalCalendarItemCopyOrganizer();
          if (v14)
          {
            v15 = (const void *)v14;
            if (CalOrganizerIsSelf())
            {
              CFRelease(v15);
            }
            else
            {
              int ParticipationStatus = CalEventGetParticipationStatus();
              CFRelease(v15);
              if (ParticipationStatus == 2)
              {
                char v17 = (void *)CADLogHandle;
                BOOL v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
                if (!v8) {
                  return v8;
                }
                objc_super v9 = v17;
                uint64_t v10 = [(id)objc_opt_class() _descriptionForOccurrence:a3 ofEvent:a4];
                int v25 = 138412290;
                id v26 = v10;
                v11 = "Occurrence does not pass filter since it is a declined event.  Occurrence: [%@]";
                goto LABEL_10;
              }
            }
          }
        }
        uint64_t v18 = CalEventCopyStore();
        if (v18)
        {
          v19 = (const void *)v18;
          if (CalStoreGetType() == 5 && (uint64_t v20 = CalCalendarItemCopyCalendar()) != 0)
          {
            v21 = (const void *)v20;
            char IsFoundInMailCalendar = CalCalendarIsFoundInMailCalendar();
            CFRelease(v21);
            CFRelease(v19);
            if ((IsFoundInMailCalendar & 1) == 0)
            {
              v23 = (void *)CADLogHandle;
              BOOL v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
              if (!v8) {
                return v8;
              }
              objc_super v9 = v23;
              uint64_t v10 = [(id)objc_opt_class() _descriptionForOccurrence:a3 ofEvent:a4];
              int v25 = 138412290;
              id v26 = v10;
              v11 = "Occurrence does not pass filter since it is a birthday event.  Occurrence: [%@]";
              goto LABEL_10;
            }
          }
          else
          {
            CFRelease(v19);
          }
        }
        LOBYTE(v8) = 1;
        return v8;
      }
      v13 = (void *)CADLogHandle;
      BOOL v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        objc_super v9 = v13;
        uint64_t v10 = [(id)objc_opt_class() _descriptionForOccurrence:a3 ofEvent:a4];
        int v25 = 138412290;
        id v26 = v10;
        v11 = "Occurrence does not pass filter since it is a cancelled event.  Occurrence: [%@]";
        goto LABEL_10;
      }
    }
  }
  else
  {
    v12 = CADLogHandle;
    BOOL v8 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      int v25 = 138412290;
      id v26 = a1;
      _os_log_impl(&dword_1BBC88000, v12, OS_LOG_TYPE_ERROR, "NULL 'event' given.  Will not check to see if the event passes the filter for [%@]", (uint8_t *)&v25, 0xCu);
LABEL_11:
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

+ (id)_descriptionForOccurrence:(CalEventOccurrence *)a3 ofEvent:(void *)a4
{
  if (a3)
  {
    if (a4)
    {
      id v4 = (void *)CalCalendarItemCopySummary();
      uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
      CalEventOccurrenceGetDate();
      int v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
      double v7 = (void *)MEMORY[0x1E4F1C9C8];
      CalEventOccurrenceGetDate();
      objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
      BOOL v8 = (void *)CalEventCopyURI();
      objc_super v9 = [NSString stringWithFormat:@"summary: [%@], occurrence start date: [%@], URI: [%@]", v4, v6, v8];

      goto LABEL_10;
    }
    uint64_t v10 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "NULL 'event' given.  Will not find a description for the occurrence.";
      v12 = buf;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v10 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = 0;
      v11 = "NULL 'occurrence' given.  Will not find a description for the occurrence.";
      v12 = (uint8_t *)&v15;
LABEL_8:
      _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    }
  }
  objc_super v9 = &stru_1F1509B08;
LABEL_10:
  return v9;
}

- (double)startDateRestrictionThreshold
{
  return self->_startDateRestrictionThreshold;
}

- (void)setStartDateRestrictionThreshold:(double)a3
{
  self->_startDateRestrictionThreshold = a3;
}

@end