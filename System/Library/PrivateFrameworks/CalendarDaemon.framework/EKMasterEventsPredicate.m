@interface EKMasterEventsPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithCalendarIDs:(id)a3;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)predicateFormat;
@end

@implementation EKMasterEventsPredicate

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
  v6 = [(EKPredicate *)self restrictedCalendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  if ([v5 count] || objc_msgSend(v6, "count")) {
    FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v5, v6);
  }
  else {
    FilterFromRowIDs = 0;
  }
  CFArrayRef v8 = (const __CFArray *)CalDatabaseCopyCalendarItemsWithCalendarFilter();
  if (!v8)
  {
    v11 = 0;
    if (!FilterFromRowIDs) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  CFArrayRef v9 = v8;
  CFIndex Count = CFArrayGetCount(v8);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFArrayGetValueAtIndex(v9, i);
      uint64_t v13 = CalEventOccurrenceCreateForInitialOccurrence();
      if (v13)
      {
        v14 = (const void *)v13;
        [v11 addObject:v13];
        CFRelease(v14);
      }
    }
  }
  CFRelease(v9);
  if (FilterFromRowIDs) {
LABEL_11:
  }
    CFRelease(FilterFromRowIDs);
LABEL_12:

  return v11;
}

@end