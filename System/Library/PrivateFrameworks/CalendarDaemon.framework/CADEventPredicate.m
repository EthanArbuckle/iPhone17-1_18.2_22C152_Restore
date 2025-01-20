@interface CADEventPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6;
+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6 propertyLoadMode:(unint64_t)a7;
+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 eventUUID:(id)a6 calendars:(id)a7;
- (BOOL)excludeAllDayEvents;
- (BOOL)excludeDeclined;
- (BOOL)excludeDeclinedUnlessProposed;
- (BOOL)excludeNoAttendeeEvents;
- (BOOL)excludeNoLocationEvents;
- (BOOL)excludeProposed;
- (BOOL)excludeSkippedReminders;
- (BOOL)excludeTimedEvents;
- (BOOL)isEqual:(id)a3;
- (BOOL)randomize;
- (BOOL)shouldLoadProposedTimesInRange;
- (CADEventPredicate)initWithCoder:(id)a3;
- (CADEventPredicate)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6;
- (CADEventPredicate)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6 propertyLoadMode:(unint64_t)a7;
- (CADEventPredicate)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 eventUUID:(id)a6 calendars:(id)a7;
- (NSSet)filteredOutTitles;
- (NSString)eventUUID;
- (NSTimeZone)timeZone;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)defaultPropertiesToLoad;
- (id)predicateFormat;
- (id)relatedObjectPropertiesToLoad;
- (int64_t)limit;
- (unint64_t)propertyLoadMode;
- (void)beginSignpostWithHandle:(id)a3 signpostID:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setExcludeAllDayEvents:(BOOL)a3;
- (void)setExcludeDeclined:(BOOL)a3;
- (void)setExcludeDeclinedUnlessProposed:(BOOL)a3;
- (void)setExcludeNoAttendeeEvents:(BOOL)a3;
- (void)setExcludeNoLocationEvents:(BOOL)a3;
- (void)setExcludeProposed:(BOOL)a3;
- (void)setExcludeSkippedReminders:(BOOL)a3;
- (void)setExcludeTimedEvents:(BOOL)a3;
- (void)setFilteredOutTitles:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setRandomize:(BOOL)a3;
@end

@implementation CADEventPredicate

- (BOOL)excludeSkippedReminders
{
  return self->_excludeSkippedReminders;
}

void __44__CADEventPredicate_defaultPropertiesToLoad__block_invoke()
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = CADEKPersistentEventDefaultPropertiesToLoad();
  v1 = (void *)defaultPropertiesToLoad_extendedPropertiesToLoad;
  defaultPropertiesToLoad_extendedPropertiesToLoad = v0;

  v2 = (void *)defaultPropertiesToLoad_extendedPropertiesToLoad;
  uint64_t v3 = *MEMORY[0x1E4F56C58];
  v7[0] = *MEMORY[0x1E4F56BA8];
  v7[1] = v3;
  v7[2] = *MEMORY[0x1E4F56F90];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  uint64_t v5 = [v2 arrayByAddingObjectsFromArray:v4];
  v6 = (void *)defaultPropertiesToLoad_extendedPropertiesToLoad;
  defaultPropertiesToLoad_extendedPropertiesToLoad = v5;
}

- (void)beginSignpostWithHandle:(id)a3 signpostID:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  v7 = v6;
  if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v8 = objc_opt_class();
    id v9 = v8;
    v10 = [(CADEventPredicate *)self predicateFormat];
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2114;
    v14 = v10;
    _os_signpost_emit_with_name_impl(&dword_1BBC88000, v7, OS_SIGNPOST_INTERVAL_BEGIN, a4, "EKPredicateSearch", "predicateClass=%@; predicateFormat=%{public}@",
      (uint8_t *)&v11,
      0x16u);
  }
}

- (id)predicateFormat
{
  if (predicateFormat_onceToken != -1) {
    dispatch_once(&predicateFormat_onceToken, &__block_literal_global_65);
  }
  uint64_t v3 = objc_opt_new();
  if ([(CADEventPredicate *)self excludeTimedEvents]) {
    [v3 addObject:@"timed"];
  }
  if ([(CADEventPredicate *)self excludeAllDayEvents]) {
    [v3 addObject:@"allday"];
  }
  if ([(CADEventPredicate *)self excludeDeclined]) {
    [v3 addObject:@"declined"];
  }
  if ([(CADEventPredicate *)self excludeProposed]) {
    [v3 addObject:@"proposed"];
  }
  if ([(CADEventPredicate *)self excludeDeclinedUnlessProposed]) {
    [v3 addObject:@"declinedUnlessProposed"];
  }
  if ([(CADEventPredicate *)self excludeNoAttendeeEvents]) {
    [v3 addObject:@"noAttendee"];
  }
  if ([(CADEventPredicate *)self excludeNoLocationEvents]) {
    [v3 addObject:@"noLocation"];
  }
  v4 = NSString;
  uint64_t v5 = (void *)predicateFormat_formatter;
  v6 = [(EKPredicate *)self startDate];
  v7 = [v5 stringFromDate:v6];
  v8 = (void *)predicateFormat_formatter;
  id v9 = [(EKPredicate *)self endDate];
  v10 = [v8 stringFromDate:v9];
  int v11 = [(EKPredicate *)self calendars];
  v12 = +[CADPredicate conciseCalendarList:v11];
  uint64_t v13 = [v3 componentsJoinedByString:@","];
  v14 = (void *)v13;
  if (self->_randomize) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  objc_msgSend(v4, "stringWithFormat:", @"CADEventPredicate start:%@; end:%@; cals:%@, exclusions:[%@], filterdOutTitles:[%@], limit:%ld, randomize:%@",
    v7,
    v10,
    v12,
    v13,
    self->_filteredOutTitles,
    self->_limit,
  v16 = v15);

  return v16;
}

- (BOOL)excludeTimedEvents
{
  return self->_excludeTimedEvents;
}

- (BOOL)excludeProposed
{
  return self->_excludeProposed;
}

- (BOOL)excludeDeclined
{
  return self->_excludeDeclined;
}

- (BOOL)excludeDeclinedUnlessProposed
{
  return self->_excludeDeclinedUnlessProposed;
}

- (BOOL)excludeAllDayEvents
{
  return self->_excludeAllDayEvents;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  uint64_t v5 = [(EKPredicate *)self calendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  v6 = [(EKPredicate *)self restrictedCalendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  uint64_t FilterFromRowIDs = CreateFilterFromRowIDs(v5, v6);
  if (FilterFromRowIDs)
  {
    v8 = (const void *)FilterFromRowIDs;
    id v9 = [(EKPredicate *)self startDate];
    v10 = [(EKPredicate *)self endDate];
    int v11 = [(CADEventPredicate *)self timeZone];
    v12 = v11;
    if (!v11)
    {
      v12 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    }
    [(CADEventPredicate *)self shouldLoadProposedTimesInRange];
    CFArrayRef v13 = (const __CFArray *)CalDatabaseCopyEventOccurrencesInDateRangeEx();
    if (!v11) {

    }
    if (!v13)
    {
      CFMutableArrayRef v15 = 0;
      id v23 = 0;
LABEL_56:
      CFRelease(v8);
      goto LABEL_57;
    }
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    CFMutableArrayRef v15 = Mutable;
    if (Mutable)
    {
      theArray = Mutable;
      v44 = v6;
      CFIndex Count = CFArrayGetCount(v13);
      v17 = objc_opt_new();
      if (Count >= 1)
      {
        for (uint64_t i = 0; i != Count; ++i)
        {
          v19 = [MEMORY[0x1E4F28ED0] numberWithLong:i];
          [v17 addObject:v19];
        }
      }
      CFTypeRef cf = v8;
      v45 = v5;
      if (self->_randomize)
      {
        unint64_t v20 = [v17 count];
        if (v20 >= 2)
        {
          unint64_t v21 = v20;
          uint64_t v22 = 0;
          do
          {
            [v17 exchangeObjectAtIndex:v22 withObjectAtIndex:v22 + arc4random_uniform(v21)];
            ++v22;
            --v21;
          }
          while (v21 != 1);
        }
      }
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v23 = v17;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v48;
        double v27 = *MEMORY[0x1E4F57888];
        while (2)
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v48 != v26) {
              objc_enumerationMutation(v23);
            }
            ValueAtIndex = CFArrayGetValueAtIndex(v13, objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * j), "longValue", cf));
            CFTypeID v30 = CFGetTypeID(ValueAtIndex);
            if (v30 == CalEventOccurrenceGetTypeID())
            {
              CalEventOccurrenceGetEvent();
              if (!self->super._uuid
                || (v31 = (void *)CalEventCopyUniqueIdentifier(),
                    int v32 = [v31 isEqualToString:self->super._uuid],
                    v31,
                    v32))
              {
                if ((!self->_excludeTimedEvents || CalEventIsAllDay())
                  && (!self->_excludeAllDayEvents || (CalEventIsAllDay() & 1) == 0)
                  && (!self->_excludeNoAttendeeEvents || CalCalendarItemHasAttendees())
                  && (!self->_excludeNoLocationEvents || CalCalendarItemHasLocation()))
                {
                  v33 = (void *)CalCalendarItemCopySummary();
                  if (![(NSSet *)self->_filteredOutTitles containsObject:v33])
                  {
                    CalEventGetProposedStartDate();
                    if (v34 == v27)
                    {
                      BOOL v37 = 0;
                    }
                    else
                    {
                      double v35 = v34;
                      CalEventOccurrenceGetDate();
                      BOOL v37 = vabdd_f64(v36, v35) < 2.22044605e-16;
                    }
                    if (CalEventGetParticipationStatus() != 2
                      || (!self->_excludeDeclinedUnlessProposed ? (int v38 = 1) : (int v38 = v37),
                          v38 == 1 && !self->_excludeDeclined))
                    {
                      if (!self->_excludeProposed || !v37)
                      {
                        CFArrayAppendValue(theArray, ValueAtIndex);
                        if (self->_limit >= 1 && self->_limit == CFArrayGetCount(theArray))
                        {

                          goto LABEL_50;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v47 objects:v51 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }
LABEL_50:

      CFMutableArrayRef v15 = theArray;
      v40 = theArray;
      v6 = v44;
      uint64_t v5 = v45;
      v8 = cf;
    }
    else
    {
      id v23 = 0;
    }
    CFRelease(v8);
    CFRelease(v13);
    if (v15)
    {
      v8 = v15;
      goto LABEL_56;
    }
  }
  else
  {
    CFMutableArrayRef v15 = 0;
    id v23 = 0;
  }
LABEL_57:
  v41 = v15;

  return v41;
}

- (NSTimeZone)timeZone
{
  return self->super._timeZone;
}

- (BOOL)shouldLoadProposedTimesInRange
{
  return self->_shouldLoadProposedTimesInRange;
}

- (BOOL)excludeNoLocationEvents
{
  return self->_excludeNoLocationEvents;
}

- (BOOL)excludeNoAttendeeEvents
{
  return self->_excludeNoAttendeeEvents;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CADEventPredicate;
  id v4 = a3;
  [(EKPredicate *)&v7 encodeWithCoder:v4];
  uint64_t v5 = [(EKPredicate *)self startDate];
  [v4 encodeObject:v5 forKey:@"startDate"];

  v6 = [(EKPredicate *)self endDate];
  [v4 encodeObject:v6 forKey:@"endDate"];

  [v4 encodeObject:self->super._uuid forKey:@"UUID"];
  [v4 encodeObject:self->super._timeZone forKey:@"timeZone"];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CADEventPredicate propertyLoadMode](self, "propertyLoadMode"), @"propertyLoadMode");
  [v4 encodeBool:self->_shouldLoadProposedTimesInRange forKey:@"shouldLoadProposedTimesInRange"];
  [v4 encodeBool:self->_excludeTimedEvents forKey:@"excludeTimedEvents"];
  [v4 encodeBool:self->_excludeAllDayEvents forKey:@"excludeAllDayEvents"];
  [v4 encodeBool:self->_excludeDeclined forKey:@"excludeDeclined"];
  [v4 encodeBool:self->_excludeProposed forKey:@"excludeProposed"];
  [v4 encodeBool:self->_excludeDeclinedUnlessProposed forKey:@"excludeDeclinedUnlessProposed"];
  [v4 encodeBool:self->_excludeNoAttendeeEvents forKey:@"excludeNoAttendeeEvents"];
  [v4 encodeBool:self->_excludeNoLocationEvents forKey:@"excludeNoLocationEvents"];
  [v4 encodeObject:self->_filteredOutTitles forKey:@"filteredOutTitles"];
  [v4 encodeBool:self->_randomize forKey:@"randomize"];
  [v4 encodeInteger:self->_limit forKey:@"limit"];
}

- (id)defaultPropertiesToLoad
{
  unint64_t v2 = [(CADEventPredicate *)self propertyLoadMode];
  if (v2 == 2)
  {
    if (defaultPropertiesToLoad_onceToken != -1) {
      dispatch_once(&defaultPropertiesToLoad_onceToken, &__block_literal_global);
    }
    id v3 = (id)defaultPropertiesToLoad_extendedPropertiesToLoad;
  }
  else if (v2 == 1)
  {
    CADEKPersistentEventDefaultPropertiesToLoad();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (unint64_t)propertyLoadMode
{
  return self->_propertyLoadMode;
}

- (id)relatedObjectPropertiesToLoad
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v17[0] = &unk_1F151D620;
  uint64_t v2 = *MEMORY[0x1E4F57180];
  v16[0] = *MEMORY[0x1E4F57150];
  v16[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F571A0];
  v16[2] = *MEMORY[0x1E4F56B78];
  v16[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F57198];
  v16[4] = *MEMORY[0x1E4F571C0];
  v16[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F571B8];
  v16[6] = *MEMORY[0x1E4F571A8];
  v16[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F56B68];
  v16[8] = *MEMORY[0x1E4F56B50];
  v16[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4F571C8];
  v16[10] = *MEMORY[0x1E4F56B60];
  v16[11] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];
  v18[0] = v8;
  v17[1] = &unk_1F151D638;
  uint64_t v15 = *MEMORY[0x1E4F57170];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v18[1] = v9;
  v17[2] = &unk_1F151D650;
  uint64_t v10 = *MEMORY[0x1E4F57078];
  v14[0] = *MEMORY[0x1E4F570D0];
  v14[1] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v18[2] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

  return v12;
}

- (void).cxx_destruct
{
}

+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6 propertyLoadMode:(unint64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStartDate:v14 endDate:v13 timeZone:v12 calendars:v11 propertyLoadMode:a7];

  return v15;
}

- (CADEventPredicate)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6 propertyLoadMode:(unint64_t)a7
{
  result = [(CADEventPredicate *)self initWithStartDate:a3 endDate:a4 timeZone:a5 calendars:a6];
  if (result) {
    result->_propertyLoadMode = a7;
  }
  return result;
}

- (CADEventPredicate)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 eventUUID:(id)a6 calendars:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CADEventPredicate;
  v16 = [(EKPredicate *)&v22 initWithCalendars:a7];
  v17 = v16;
  if (!v16)
  {
LABEL_9:
    v19 = v17;
    goto LABEL_10;
  }
  if (v12 && v13)
  {
    [(EKPredicate *)v16 setStartDate:v12];
    [(EKPredicate *)v17 setEndDate:v13];
    objc_storeStrong((id *)&v17->super._uuid, a6);
    if (v14) {
      v18 = (void *)[v14 copy];
    }
    else {
      v18 = (void *)CalCopyTimeZone();
    }
    unint64_t v20 = v18;
    objc_storeStrong((id *)&v17->super._timeZone, v18);

    v17->_excludeSkippedReminders = 1;
    goto LABEL_9;
  }
  NSLog(&cfstr_WarningCadeven.isa);
  v19 = 0;
LABEL_10:

  return v19;
}

- (CADEventPredicate)initWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6
{
  return [(CADEventPredicate *)self initWithStartDate:a3 endDate:a4 timeZone:a5 eventUUID:0 calendars:a6];
}

- (CADEventPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CADEventPredicate;
  uint64_t v5 = [(EKPredicate *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    [(EKPredicate *)v5 setStartDate:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    [(EKPredicate *)v5 setEndDate:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    uuid = v5->super._uuid;
    v5->super._uuid = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->super._timeZone;
    v5->super._timeZone = (NSTimeZone *)v10;

    v5->_propertyLoadMode = [v4 decodeIntegerForKey:@"propertyLoadMode"];
    v5->_shouldLoadProposedTimesInRange = [v4 decodeBoolForKey:@"shouldLoadProposedTimesInRange"];
    v5->_excludeTimedEvents = [v4 decodeBoolForKey:@"excludeTimedEvents"];
    v5->_excludeAllDayEvents = [v4 decodeBoolForKey:@"excludeAllDayEvents"];
    v5->_excludeDeclined = [v4 decodeBoolForKey:@"excludeDeclined"];
    v5->_excludeProposed = [v4 decodeBoolForKey:@"excludeProposed"];
    v5->_excludeDeclinedUnlessProposed = [v4 decodeBoolForKey:@"excludeDeclinedUnlessProposed"];
    v5->_excludeNoAttendeeEvents = [v4 decodeBoolForKey:@"excludeNoAttendeeEvents"];
    v5->_excludeNoLocationEvents = [v4 decodeBoolForKey:@"excludeNoLocationEvents"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filteredOutTitles"];
    filteredOutTitles = v5->_filteredOutTitles;
    v5->_filteredOutTitles = (NSSet *)v12;

    v5->_randomize = [v4 decodeBoolForKey:@"randomize"];
    v5->_limit = [v4 decodeIntegerForKey:@"limit"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __36__CADEventPredicate_predicateFormat__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)predicateFormat_formatter;
  predicateFormat_formatter = (uint64_t)v0;

  [(id)predicateFormat_formatter setDateStyle:1];
  uint64_t v2 = (void *)predicateFormat_formatter;
  return [v2 setTimeStyle:1];
}

+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 calendars:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStartDate:v12 endDate:v11 timeZone:v10 calendars:v9];

  return v13;
}

+ (id)predicateWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 eventUUID:(id)a6 calendars:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)objc_opt_class()) initWithStartDate:v15 endDate:v14 timeZone:v13 eventUUID:v12 calendars:v11];

  return v16;
}

- (NSString)eventUUID
{
  return self->super._uuid;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CADEventPredicate *)a3;
  if (v4 == self)
  {
    char v6 = 1;
    goto LABEL_42;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    uint64_t v7 = [(EKPredicate *)v4 startDate];
    uint64_t v8 = [(EKPredicate *)self startDate];
    if (![v7 isEqual:v8])
    {
      char v6 = 0;
LABEL_41:

      goto LABEL_42;
    }
    id v9 = [(EKPredicate *)v4 endDate];
    id v10 = [(EKPredicate *)self endDate];
    if (![v9 isEqual:v10])
    {
      char v6 = 0;
LABEL_40:

      goto LABEL_41;
    }
    id v11 = [(CADEventPredicate *)v4 timeZone];
    id v12 = [(CADEventPredicate *)self timeZone];
    if (![v11 isEquivalentTo:v12])
    {
      char v6 = 0;
LABEL_39:

      goto LABEL_40;
    }
    id v13 = [(CADEventPredicate *)v4 eventUUID];
    v39 = [(CADEventPredicate *)self eventUUID];
    if (v13 != v39)
    {
      id v14 = [(CADEventPredicate *)v4 eventUUID];
      double v35 = [(CADEventPredicate *)self eventUUID];
      double v36 = v14;
      if (!objc_msgSend(v14, "isEqual:"))
      {
        char v6 = 0;
        goto LABEL_37;
      }
    }
    id v15 = [(EKPredicate *)v4 calendars];
    BOOL v37 = [(EKPredicate *)self calendars];
    int v38 = v15;
    if (v15 == v37)
    {
      v33 = v13;
    }
    else
    {
      uint64_t v16 = [(EKPredicate *)v4 calendars];
      uint64_t v17 = [(EKPredicate *)self calendars];
      int v32 = (void *)v16;
      v18 = (void *)v16;
      id v15 = (void *)v17;
      if (![v18 isEqual:v17])
      {
        char v6 = 0;
        goto LABEL_34;
      }
      v33 = v13;
    }
    uint64_t v19 = [(CADEventPredicate *)v4 propertyLoadMode];
    if (v19 != [(CADEventPredicate *)self propertyLoadMode]) {
      goto LABEL_31;
    }
    BOOL v20 = [(CADEventPredicate *)v4 excludeTimedEvents];
    if (v20 != [(CADEventPredicate *)self excludeTimedEvents]) {
      goto LABEL_31;
    }
    BOOL v21 = [(CADEventPredicate *)v4 excludeAllDayEvents];
    if (v21 != [(CADEventPredicate *)self excludeAllDayEvents]) {
      goto LABEL_31;
    }
    BOOL v22 = [(CADEventPredicate *)v4 excludeDeclined];
    if (v22 == [(CADEventPredicate *)self excludeDeclined]
      && (BOOL v23 = [(CADEventPredicate *)v4 excludeProposed],
          v23 == [(CADEventPredicate *)self excludeProposed])
      && (BOOL v24 = [(CADEventPredicate *)v4 excludeDeclinedUnlessProposed],
          v24 == [(CADEventPredicate *)self excludeDeclinedUnlessProposed])
      && (BOOL v25 = [(CADEventPredicate *)v4 excludeNoAttendeeEvents],
          v25 == [(CADEventPredicate *)self excludeNoAttendeeEvents])
      && (BOOL v26 = [(CADEventPredicate *)v4 excludeNoLocationEvents],
          v26 == [(CADEventPredicate *)self excludeNoLocationEvents])
      && (BOOL v27 = [(CADEventPredicate *)v4 randomize], v27 == [(CADEventPredicate *)self randomize])&& (v28 = [(CADEventPredicate *)v4 limit], v28 == [(CADEventPredicate *)self limit]))
    {
      double v34 = v12;
      v29 = [(CADEventPredicate *)v4 filteredOutTitles];
      CFTypeID v30 = [(CADEventPredicate *)self filteredOutTitles];
      char v6 = [v29 isEqualToSet:v30];

      if (v38 == v37)
      {

        id v13 = v33;
        id v12 = v34;
        if (v33 == v39) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
      id v13 = v33;
      id v12 = v34;
    }
    else
    {
LABEL_31:
      if (v38 == v37)
      {

        char v6 = 0;
        id v13 = v33;
LABEL_36:
        if (v13 == v39)
        {
LABEL_38:

          goto LABEL_39;
        }
LABEL_37:

        goto LABEL_38;
      }
      char v6 = 0;
      id v13 = v33;
    }
LABEL_34:

    goto LABEL_36;
  }
  char v6 = 0;
LABEL_42:

  return v6;
}

- (void)setExcludeAllDayEvents:(BOOL)a3
{
  self->_excludeAllDayEvents = a3;
}

- (void)setExcludeTimedEvents:(BOOL)a3
{
  self->_excludeTimedEvents = a3;
}

- (void)setExcludeDeclined:(BOOL)a3
{
  self->_excludeDeclined = a3;
}

- (void)setExcludeProposed:(BOOL)a3
{
  self->_excludeProposed = a3;
}

- (void)setExcludeDeclinedUnlessProposed:(BOOL)a3
{
  self->_excludeDeclinedUnlessProposed = a3;
}

- (void)setExcludeNoAttendeeEvents:(BOOL)a3
{
  self->_excludeNoAttendeeEvents = a3;
}

- (void)setExcludeNoLocationEvents:(BOOL)a3
{
  self->_excludeNoLocationEvents = a3;
}

- (void)setExcludeSkippedReminders:(BOOL)a3
{
  self->_excludeSkippedReminders = a3;
}

- (NSSet)filteredOutTitles
{
  return self->_filteredOutTitles;
}

- (void)setFilteredOutTitles:(id)a3
{
}

- (BOOL)randomize
{
  return self->_randomize;
}

- (void)setRandomize:(BOOL)a3
{
  self->_randomize = a3;
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

@end