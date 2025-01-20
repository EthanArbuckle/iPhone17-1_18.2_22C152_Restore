@interface CADTravelEventsPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CADTravelEventsPredicate)initWithCalendarIDs:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (CADTravelEventsPredicate)initWithCoder:(id)a3;
- (id)_fetchTravelEventsWithDatabase:(CalDatabase *)a3;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)predicateFormat;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADTravelEventsPredicate

- (CADTravelEventsPredicate)initWithCalendarIDs:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CADTravelEventsPredicate;
  v10 = [(EKPredicate *)&v16 initWithCalendars:a3];
  v11 = v10;
  if (!v10) {
    goto LABEL_5;
  }
  if (v8 && v9)
  {
    [(EKPredicate *)v10 setStartDate:v8];
    [(EKPredicate *)v11 setEndDate:v9];
LABEL_5:
    v12 = v11;
    goto LABEL_9;
  }
  v13 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "CADTravelEventsPredicate must be given non-nil 'startDate' and 'endDate'", v15, 2u);
  }
  v12 = 0;
LABEL_9:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADTravelEventsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADTravelEventsPredicate;
  v5 = [(EKPredicate *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    [(EKPredicate *)v5 setStartDate:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    [(EKPredicate *)v5 setEndDate:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CADTravelEventsPredicate;
  id v4 = a3;
  [(EKPredicate *)&v7 encodeWithCoder:v4];
  v5 = [(EKPredicate *)self startDate];
  [v4 encodeObject:v5 forKey:@"startDate"];

  v6 = [(EKPredicate *)self endDate];
  [v4 encodeObject:v6 forKey:@"endDate"];
}

- (id)predicateFormat
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:1];
  [v3 setTimeStyle:1];
  id v4 = NSString;
  v5 = [(EKPredicate *)self startDate];
  v6 = [v3 stringFromDate:v5];
  objc_super v7 = [(EKPredicate *)self endDate];
  id v8 = [v3 stringFromDate:v7];
  objc_super v9 = [(EKPredicate *)self calendars];
  v10 = +[CADPredicate conciseCalendarList:v9];
  v11 = [v4 stringWithFormat:@"CADTravelEventsPredicate start:%@; end:%@; cals:%@", v6, v8, v10];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CADTravelEventsPredicate *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      objc_super v7 = [(EKPredicate *)v4 startDate];
      id v8 = [(EKPredicate *)self startDate];
      if ([v7 isEqual:v8])
      {
        objc_super v9 = [(EKPredicate *)v4 endDate];
        v10 = [(EKPredicate *)self endDate];
        if ([v9 isEqual:v10])
        {
          v11 = [(EKPredicate *)v4 calendars];
          v12 = [(EKPredicate *)self calendars];
          if (v11 == v12)
          {
            char v6 = 1;
          }
          else
          {
            v13 = [(EKPredicate *)v4 calendars];
            v14 = [(EKPredicate *)self calendars];
            char v6 = [v13 isEqual:v14];
          }
        }
        else
        {
          char v6 = 0;
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F57440] shared];
  char v6 = objc_msgSend(v5, "get_enableTravelAdvisoriesForAutomaticBehavior");

  if (v6)
  {
    [(CADTravelEventsPredicate *)self _fetchTravelEventsWithDatabase:a3];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_DEBUG, "Will not perform travel event search because travel advisories are not enabled globally.  Predicate: [%@]", (uint8_t *)&v9, 0xCu);
    }
    return 0;
  }
}

- (id)_fetchTravelEventsWithDatabase:(CalDatabase *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  char v6 = [(EKPredicate *)self calendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  objc_super v7 = [(EKPredicate *)self restrictedCalendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  uint64_t FilterFromRowIDs = CreateFilterFromRowIDs(v6, v7);
  int v9 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v10 = v9;
    uint64_t v11 = [(EKPredicate *)self startDate];
    [(EKPredicate *)self endDate];
    v13 = uint64_t v12 = FilterFromRowIDs;
    *(_DWORD *)buf = 138413058;
    v44 = v11;
    __int16 v45 = 2112;
    v46 = v13;
    __int16 v47 = 2112;
    v48 = v6;
    __int16 v49 = 2112;
    v50 = v7;
    _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_DEBUG, "Commencing travel event search with start date: [%@] end date: [%@] calendar object IDs: [%@] restricted calendar row IDs: [%@]", buf, 0x2Au);

    uint64_t FilterFromRowIDs = v12;
  }
  v14 = [(EKPredicate *)self startDate];
  v15 = [(EKPredicate *)self endDate];
  objc_super v16 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  CFTypeRef cf = (CFTypeRef)FilterFromRowIDs;
  CFArrayRef v17 = (const __CFArray *)CalEventOccurrenceCacheCopyEventOccurrencesInDateRange();

  if (v17)
  {
    v38 = v7;
    v39 = v6;
    v40 = v4;
    CFIndex Count = CFArrayGetCount(v17);
    v19 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v44 = (CADTravelEventsPredicate *)Count;
      _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_DEBUG, "Found [%ld] travel event candidates.", buf, 0xCu);
    }
    id v42 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
    if (Count >= 1)
    {
      for (CFIndex i = 0; Count != i; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v17, i);
        CalEventOccurrenceGetEvent();
        if (CalEventIsCandidateForTravelAdvisories())
        {
          [v42 addObject:ValueAtIndex];
          v22 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
          {
            v23 = (void *)MEMORY[0x1E4F1C9C8];
            v24 = v22;
            CalEventOccurrenceGetDate();
            objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
            v25 = (CADTravelEventsPredicate *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)CalCalendarItemCopySummary();
            v27 = (void *)MEMORY[0x1E4F1C9C8];
            id v28 = v26;
            CalEventOccurrenceGetDate();
            objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
            v29 = (void *)CalEventCopyURI();
            *(_DWORD *)buf = 138412802;
            v44 = v25;
            __int16 v45 = 2112;
            v46 = v26;
            __int16 v47 = 2112;
            v48 = v29;
            _os_log_impl(&dword_1BBC88000, v24, OS_LOG_TYPE_DEBUG, "Accepted travel event candidate.  Start date: [%@] title: [%@] URI: [%@]", buf, 0x20u);

LABEL_13:
          }
        }
        else
        {
          v30 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
          {
            v31 = (void *)MEMORY[0x1E4F1C9C8];
            v24 = v30;
            CalEventOccurrenceGetDate();
            objc_msgSend(v31, "dateWithTimeIntervalSinceReferenceDate:");
            v25 = (CADTravelEventsPredicate *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)CalCalendarItemCopySummary();
            v33 = (void *)MEMORY[0x1E4F1C9C8];
            id v34 = v32;
            CalEventOccurrenceGetDate();
            objc_msgSend(v33, "dateWithTimeIntervalSinceReferenceDate:");
            v35 = (void *)CalEventCopyURI();
            *(_DWORD *)buf = 138412802;
            v44 = v25;
            __int16 v45 = 2112;
            v46 = v32;
            __int16 v47 = 2112;
            v48 = v35;
            _os_log_impl(&dword_1BBC88000, v24, OS_LOG_TYPE_DEBUG, "Rejected travel event candidate.  Start date: [%@] title: [%@] URI: [%@]", buf, 0x20u);

            goto LABEL_13;
          }
        }
      }
    }
    CFRelease(v17);
    char v6 = v39;
    id v4 = v40;
    objc_super v7 = v38;
  }
  else
  {
    v36 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v44 = self;
      _os_log_impl(&dword_1BBC88000, v36, OS_LOG_TYPE_DEBUG, "NULL occurrences array returned for [%@].", buf, 0xCu);
    }
    id v42 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v4) {
    CFRelease(v4);
  }

  return v42;
}

@end