@interface CADContactEventsPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)_isCandidate:(void *)a3 allowAllDayEvent:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (CADContactEventsPredicate)initWithCalendarIDs:(id)a3 startDate:(id)a4 endDate:(id)a5 contacts:(id)a6;
- (CADContactEventsPredicate)initWithCoder:(id)a3;
- (NSSet)contactEmailAddresses;
- (NSSet)contactNameComponents;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)predicateFormat;
- (void)encodeWithCoder:(id)a3;
- (void)setContactEmailAddresses:(id)a3;
- (void)setContactNameComponents:(id)a3;
@end

@implementation CADContactEventsPredicate

- (CADContactEventsPredicate)initWithCalendarIDs:(id)a3 startDate:(id)a4 endDate:(id)a5 contacts:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v64.receiver = self;
  v64.super_class = (Class)CADContactEventsPredicate;
  v13 = [(EKPredicate *)&v64 initWithCalendars:a3];
  if (!v13) {
    goto LABEL_31;
  }
  if (v10 && v11)
  {
    if ([v10 CalIsAfterDate:v11])
    {
      v14 = (void *)CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138412802;
        v68 = v17;
        __int16 v69 = 2112;
        id v70 = v10;
        __int16 v71 = 2112;
        id v72 = v11;
        v18 = "[%@] must be given a 'startDate' that occurs before the given 'endDate.'  startDate: [%@] endDate: [%@]";
        v19 = v15;
        uint32_t v20 = 32;
LABEL_9:
        _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);

        goto LABEL_10;
      }
      goto LABEL_10;
    }
    id v49 = v10;
    [(EKPredicate *)v13 setStartDate:v10];
    v46 = v13;
    id v48 = v11;
    [(EKPredicate *)v13 setEndDate:v11];
    v24 = objc_opt_new();
    v50 = objc_opt_new();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v47 = v12;
    id obj = v12;
    uint64_t v25 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v61;
      uint64_t v28 = *MEMORY[0x1E4F1ADC8];
      uint64_t v55 = *MEMORY[0x1E4F1ADF0];
      uint64_t v51 = *MEMORY[0x1E4F1ADE0];
      uint64_t v52 = *MEMORY[0x1E4F1ADC8];
      do
      {
        uint64_t v29 = 0;
        uint64_t v53 = v26;
        do
        {
          if (*(void *)v61 != v27) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v60 + 1) + 8 * v29);
          if ([v30 isKeyAvailable:v28])
          {
            uint64_t v31 = v27;
            v32 = [v30 emailAddresses];
            v33 = [v32 valueForKey:@"value"];
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v65 count:16];
            if (v34)
            {
              uint64_t v35 = v34;
              uint64_t v36 = *(void *)v57;
              do
              {
                for (uint64_t i = 0; i != v35; ++i)
                {
                  if (*(void *)v57 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  v38 = [*(id *)(*((void *)&v56 + 1) + 8 * i) lowercaseString];
                  [v24 addObject:v38];
                }
                uint64_t v35 = [v33 countByEnumeratingWithState:&v56 objects:v65 count:16];
              }
              while (v35);
            }

            uint64_t v27 = v31;
            uint64_t v28 = v52;
            uint64_t v26 = v53;
          }
          if ([v30 isKeyAvailable:v55]
            && [v30 isKeyAvailable:v51])
          {
            v39 = [v30 familyName];
            v40 = [v30 givenName];
            v41 = [v39 stringByAppendingString:v40];
            [v50 addObject:v41];

            v42 = [v30 givenName];
            v43 = [v30 familyName];
            v44 = [v42 stringByAppendingString:v43];
            [v50 addObject:v44];
          }
          ++v29;
        }
        while (v29 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v26);
    }

    v13 = v46;
    [(CADContactEventsPredicate *)v46 setContactEmailAddresses:v24];
    [(CADContactEventsPredicate *)v46 setContactNameComponents:v50];

    id v11 = v48;
    id v10 = v49;
    id v12 = v47;
LABEL_31:
    v23 = v13;
    goto LABEL_32;
  }
  v21 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v15 = v21;
    v22 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138412290;
    v68 = v17;
    v18 = "[%@] must be given non-nil 'startDate' and 'endDate'";
    v19 = v15;
    uint32_t v20 = 12;
    goto LABEL_9;
  }
LABEL_10:
  v23 = 0;
LABEL_32:

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADContactEventsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CADContactEventsPredicate;
  v5 = [(EKPredicate *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    [(EKPredicate *)v5 setStartDate:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    [(EKPredicate *)v5 setEndDate:v7];

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"contactEmailAddresses"];
    [(CADContactEventsPredicate *)v5 setContactEmailAddresses:v11];

    id v12 = [v4 decodeObjectOfClasses:v10 forKey:@"contactNameComponents"];
    [(CADContactEventsPredicate *)v5 setContactNameComponents:v12];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CADContactEventsPredicate;
  id v4 = a3;
  [(EKPredicate *)&v9 encodeWithCoder:v4];
  v5 = [(EKPredicate *)self startDate];
  [v4 encodeObject:v5 forKey:@"startDate"];

  v6 = [(EKPredicate *)self endDate];
  [v4 encodeObject:v6 forKey:@"endDate"];

  v7 = [(CADContactEventsPredicate *)self contactEmailAddresses];
  [v4 encodeObject:v7 forKey:@"contactEmailAddresses"];

  v8 = [(CADContactEventsPredicate *)self contactNameComponents];
  [v4 encodeObject:v8 forKey:@"contactNameComponents"];
}

- (id)predicateFormat
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:1];
  [v3 setTimeStyle:1];
  id v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [(EKPredicate *)self startDate];
  v8 = [v3 stringFromDate:v7];
  objc_super v9 = [(EKPredicate *)self endDate];
  id v10 = [v3 stringFromDate:v9];
  id v11 = [(EKPredicate *)self calendars];
  id v12 = +[CADPredicate conciseCalendarList:v11];
  v13 = [v4 stringWithFormat:@"[%@] start:%@; end:%@; cals:%@", v6, v8, v10, v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (CADContactEventsPredicate *)a3;
  if (v5 == self)
  {
    char v7 = 1;
    goto LABEL_25;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v8 = [(EKPredicate *)v5 startDate];
    objc_super v9 = [(EKPredicate *)self startDate];
    if (![v8 isEqual:v9])
    {
      char v7 = 0;
LABEL_24:

      goto LABEL_25;
    }
    id v10 = [(EKPredicate *)v5 endDate];
    id v11 = [(EKPredicate *)self endDate];
    if (![v10 isEqual:v11])
    {
      char v7 = 0;
LABEL_23:

      goto LABEL_24;
    }
    id v12 = [(EKPredicate *)v5 calendars];
    uint64_t v29 = [(EKPredicate *)self calendars];
    v30 = v12;
    if (v12 != v29)
    {
      id v12 = [(EKPredicate *)v5 calendars];
      id v3 = [(EKPredicate *)self calendars];
      if (![v12 isEqual:v3])
      {
        char v7 = 0;
        goto LABEL_21;
      }
    }
    uint64_t v13 = [(CADContactEventsPredicate *)v5 contactEmailAddresses];
    uint64_t v27 = [(CADContactEventsPredicate *)self contactEmailAddresses];
    uint64_t v28 = (void *)v13;
    if (v13 == v27
      || ([(CADContactEventsPredicate *)v5 contactEmailAddresses],
          objc_super v14 = objc_claimAutoreleasedReturnValue(),
          [(CADContactEventsPredicate *)self contactEmailAddresses],
          uint64_t v25 = objc_claimAutoreleasedReturnValue(),
          uint64_t v26 = v14,
          objc_msgSend(v14, "isEqual:")))
    {
      v15 = [(CADContactEventsPredicate *)v5 contactNameComponents];
      uint64_t v16 = [(CADContactEventsPredicate *)self contactNameComponents];
      if (v15 == (void *)v16)
      {

        char v7 = 1;
      }
      else
      {
        v17 = (void *)v16;
        v18 = [(CADContactEventsPredicate *)v5 contactNameComponents];
        v19 = [(CADContactEventsPredicate *)self contactNameComponents];
        char v7 = [v18 isEqual:v19];
      }
      v21 = (void *)v27;
      uint32_t v20 = v28;
      id v3 = v23;
      id v12 = v24;
      if (v28 == (void *)v27)
      {
LABEL_20:

        if (v30 == v29)
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      char v7 = 0;
      v21 = (void *)v27;
      uint32_t v20 = v28;
    }

    goto LABEL_20;
  }
  char v7 = 0;
LABEL_25:

  return v7;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = [(EKPredicate *)self startDate];
  v5 = [(EKPredicate *)self endDate];
  char v6 = [v4 CalIsAfterDate:v5];

  if (v6) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  v8 = (const void *)CalDatabaseCopyEventOccurrenceCache();
  uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  id v10 = [(EKPredicate *)self calendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  id v11 = [(EKPredicate *)self restrictedCalendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v10, v11);
  uint64_t v13 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    objc_super v14 = v13;
    v15 = [(EKPredicate *)self startDate];
    uint64_t v16 = [(EKPredicate *)self endDate];
    *(_DWORD *)buf = 138412802;
    v33 = v15;
    __int16 v34 = 2112;
    uint64_t v35 = v16;
    __int16 v36 = 2112;
    v37 = v10;
    _os_log_impl(&dword_1BBC88000, v14, OS_LOG_TYPE_DEBUG, "Commencing contact event search with start date: [%@] end date: [%@] calendar object IDs: [%@]", buf, 0x20u);
  }
  v17 = [(EKPredicate *)self startDate];
  v18 = [(EKPredicate *)self endDate];
  v19 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  CFArrayRef v20 = (const __CFArray *)CalEventOccurrenceCacheCopyEventOccurrencesInDateRange();

  if (v20)
  {
    uint64_t v28 = v11;
    CFIndex Count = CFArrayGetCount(v20);
    v22 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v33 = (CADContactEventsPredicate *)Count;
      _os_log_impl(&dword_1BBC88000, v22, OS_LOG_TYPE_DEBUG, "Found [%ld] contact event candidates.  Proceeding to filter.", buf, 0xCu);
    }
    char v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v20, i);
        CalEventOccurrenceGetEvent();
        uint64_t v25 = (void *)CalCalendarItemCopyAttendees();
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __59__CADContactEventsPredicate_copyMatchingItemsWithDatabase___block_invoke;
        v29[3] = &unk_1E624DD78;
        v29[4] = self;
        id v30 = v7;
        uint64_t v31 = ValueAtIndex;
        [v25 enumerateObjectsUsingBlock:v29];
      }
    }
    CFRelease(v20);
    id v11 = v28;
    if (!FilterFromRowIDs) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v27 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v33 = self;
      _os_log_impl(&dword_1BBC88000, v27, OS_LOG_TYPE_DEBUG, "NULL occurrences array returned for [%@].", buf, 0xCu);
    }
    char v7 = 0;
    if (!FilterFromRowIDs) {
      goto LABEL_13;
    }
  }
  CFRelease(FilterFromRowIDs);
LABEL_13:
  if (v8) {
    CFRelease(v8);
  }

  return v7;
}

void __59__CADContactEventsPredicate_copyMatchingItemsWithDatabase___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v20 = a2;
  char v6 = (void *)MEMORY[0x1C1864F70]();
  char v7 = [*(id *)(a1 + 32) contactEmailAddresses];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 48)];
    *a4 = 1;
    goto LABEL_10;
  }
  objc_super v9 = (void *)MEMORY[0x1C1864F80](v20);
  uint64_t v10 = MEMORY[0x1C1864F90](v20);
  id v11 = (void *)v10;
  if (v9 && v10)
  {
    id v12 = v9;
    id v13 = v11;
    objc_super v14 = [*(id *)(a1 + 32) contactNameComponents];
    v15 = [v12 stringByAppendingString:v13];
    if ([v14 containsObject:v15])
    {
    }
    else
    {
      uint64_t v16 = [*(id *)(a1 + 32) contactNameComponents];
      [v13 stringByAppendingString:v12];
      v17 = id v19 = v12;
      int v18 = [v16 containsObject:v17];

      id v12 = v19;
      if (!v18)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    [*(id *)(a1 + 40) addObject:*(void *)(a1 + 48)];
    *a4 = 1;
    goto LABEL_15;
  }
  if (!v9)
  {
    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_16:
  CFRelease(v9);
  if (v11) {
LABEL_9:
  }
    CFRelease(v11);
LABEL_10:
}

- (BOOL)_isCandidate:(void *)a3 allowAllDayEvent:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  if (!a4 && (CalEventIsAllDay() & 1) != 0 || CalCalendarItemGetStatus() == 3) {
    return 0;
  }
  if (CalCalendarItemHasAttendees())
  {
    uint64_t v5 = CalCalendarItemCopyOrganizer();
    if (v5)
    {
      char v6 = (const void *)v5;
      if (CalOrganizerIsSelf())
      {
        CFRelease(v6);
      }
      else
      {
        int ParticipationStatus = CalEventGetParticipationStatus();
        CFRelease(v6);
        if (ParticipationStatus == 2) {
          return 0;
        }
      }
    }
  }
  uint64_t v8 = CalEventCopyStore();
  if (v8)
  {
    objc_super v9 = (const void *)v8;
    if (CalStoreGetType() == 5)
    {
      uint64_t v10 = CalCalendarItemCopyCalendar();
      if (v10)
      {
        id v11 = (const void *)v10;
        char IsFoundInMailCalendar = CalCalendarIsFoundInMailCalendar();
        CFRelease(v11);
        CFRelease(v9);
        return (IsFoundInMailCalendar & 1) != 0;
      }
    }
    CFRelease(v9);
  }
  return 1;
}

- (NSSet)contactEmailAddresses
{
  return (NSSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setContactEmailAddresses:(id)a3
{
}

- (NSSet)contactNameComponents
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setContactNameComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactNameComponents, 0);
  objc_storeStrong((id *)&self->_contactEmailAddresses, 0);
}

@end