@interface EKScheduleAgentClientEventsPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithCalendarIDs:(id)a3;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)predicateFormat;
@end

@implementation EKScheduleAgentClientEventsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithCalendarIDs:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCalendars:v4];

  return v5;
}

- (id)predicateFormat
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  v5 = [(EKPredicate *)self calendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  v6 = v5;
  if (v5 && [v5 count])
  {
    v7 = [(EKPredicate *)self restrictedCalendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
    FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v6, v7);
  }
  else
  {
    FilterFromRowIDs = 0;
  }
  CFArrayRef v9 = (const __CFArray *)CalDatabaseCopyOfAllEventsWithScheduleAgentClientAndCalendarUID();
  if (!v9)
  {
    v12 = 0;
    if (!FilterFromRowIDs) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  CFArrayRef v10 = v9;
  CFIndex Count = CFArrayGetCount(v9);
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFArrayGetValueAtIndex(v10, i);
      uint64_t v14 = CalEventOccurrenceCreateForInitialOccurrence();
      if (v14)
      {
        v15 = (const void *)v14;
        [v12 addObject:v14];
        CFRelease(v15);
      }
    }
  }
  CFRelease(v10);
  if (FilterFromRowIDs) {
LABEL_12:
  }
    CFRelease(FilterFromRowIDs);
LABEL_13:

  return v12;
}

@end