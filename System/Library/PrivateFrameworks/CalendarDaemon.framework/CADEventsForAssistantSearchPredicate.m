@interface CADEventsForAssistantSearchPredicate
+ (BOOL)supportsSecureCoding;
- (CADEventsForAssistantSearchPredicate)initWithCoder:(id)a3;
- (CADEventsForAssistantSearchPredicate)initWithTimeZone:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 notes:(id)a8 participants:(id)a9 limit:(int64_t)a10;
- (NSArray)participants;
- (NSString)location;
- (NSString)notes;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)description;
- (id)predicateFormat;
- (int64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setLocation:(id)a3;
- (void)setNotes:(id)a3;
- (void)setParticipants:(id)a3;
@end

@implementation CADEventsForAssistantSearchPredicate

- (CADEventsForAssistantSearchPredicate)initWithTimeZone:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 notes:(id)a8 participants:(id)a9 limit:(int64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  v27.receiver = self;
  v27.super_class = (Class)CADEventsForAssistantSearchPredicate;
  v24 = [(EKPredicate *)&v27 initWithCalendars:0];
  v25 = v24;
  if (v24)
  {
    [(EKPredicate *)v24 setStartDate:v18];
    [(EKPredicate *)v25 setEndDate:v19];
    objc_storeStrong((id *)&v25->super._timeZone, a3);
    [(EKPredicate *)v25 setTitle:v20];
    [(CADEventsForAssistantSearchPredicate *)v25 setLocation:v21];
    [(CADEventsForAssistantSearchPredicate *)v25 setNotes:v22];
    [(CADEventsForAssistantSearchPredicate *)v25 setParticipants:v23];
    [(CADEventsForAssistantSearchPredicate *)v25 setLimit:a10];
  }

  return v25;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v14.receiver = self;
  v14.super_class = (Class)CADEventsForAssistantSearchPredicate;
  v4 = [(CADEventsForAssistantSearchPredicate *)&v14 description];
  v5 = (void *)[v3 initWithSuperclassDescription:v4];

  [v5 setKey:@"timeZone" withObject:self->super._timeZone];
  v6 = [(EKPredicate *)self startDate];
  [v5 setKey:@"startDate" withDate:v6];

  v7 = [(EKPredicate *)self endDate];
  [v5 setKey:@"endDate" withDate:v7];

  v8 = [(EKPredicate *)self title];
  [v5 setKey:@"title" withString:v8];

  v9 = [(CADEventsForAssistantSearchPredicate *)self location];
  [v5 setKey:@"location" withString:v9];

  v10 = [(CADEventsForAssistantSearchPredicate *)self notes];
  [v5 setKey:@"notes" withString:v10];

  v11 = [(CADEventsForAssistantSearchPredicate *)self participants];
  [v5 setKey:@"participants" withArray:v11];

  objc_msgSend(v5, "setKey:withInteger:", @"limit", -[CADEventsForAssistantSearchPredicate limit](self, "limit"));
  v12 = [v5 build];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADEventsForAssistantSearchPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CADEventsForAssistantSearchPredicate;
  v5 = [(EKPredicate *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    [(EKPredicate *)v5 setStartDate:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    [(EKPredicate *)v5 setEndDate:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->super._timeZone;
    v5->super._timeZone = (NSTimeZone *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [(EKPredicate *)v5 setTitle:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    [(CADEventsForAssistantSearchPredicate *)v5 setLocation:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notes"];
    [(CADEventsForAssistantSearchPredicate *)v5 setNotes:v12];

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v16 = [v4 decodeObjectOfClasses:v15 forKey:@"participants"];
    [(CADEventsForAssistantSearchPredicate *)v5 setParticipants:v16];

    id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"limit"];
    -[CADEventsForAssistantSearchPredicate setLimit:](v5, "setLimit:", [v17 integerValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CADEventsForAssistantSearchPredicate;
  id v4 = a3;
  [(EKPredicate *)&v12 encodeWithCoder:v4];
  v5 = [(EKPredicate *)self startDate];
  [v4 encodeObject:v5 forKey:@"startDate"];

  v6 = [(EKPredicate *)self endDate];
  [v4 encodeObject:v6 forKey:@"endDate"];

  [v4 encodeObject:self->super._timeZone forKey:@"timeZone"];
  v7 = [(EKPredicate *)self title];
  [v4 encodeObject:v7 forKey:@"title"];

  uint64_t v8 = [(CADEventsForAssistantSearchPredicate *)self location];
  [v4 encodeObject:v8 forKey:@"location"];

  v9 = [(CADEventsForAssistantSearchPredicate *)self notes];
  [v4 encodeObject:v9 forKey:@"notes"];

  v10 = [(CADEventsForAssistantSearchPredicate *)self participants];
  [v4 encodeObject:v10 forKey:@"participants"];

  v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[CADEventsForAssistantSearchPredicate limit](self, "limit"));
  [v4 encodeObject:v11 forKey:@"limit"];
}

- (id)predicateFormat
{
  return (id)[NSString stringWithFormat:@"%@ <%p>", objc_opt_class(), self];
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v33 = self;
    _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_DEBUG, "Preparing to fetch matching events for predicate: [%@]", buf, 0xCu);
  }
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(EKPredicate *)self startDate];
  uint64_t v7 = [(EKPredicate *)self endDate];
  v26 = [(EKPredicate *)self title];
  v25 = [(CADEventsForAssistantSearchPredicate *)self location];
  uint64_t v8 = [(CADEventsForAssistantSearchPredicate *)self notes];
  v9 = [(CADEventsForAssistantSearchPredicate *)self participants];
  int64_t v23 = [(CADEventsForAssistantSearchPredicate *)self limit];
  uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  v11 = [(EKPredicate *)self calendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  objc_super v12 = [(EKPredicate *)self restrictedCalendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v11, v12);
  if (v6 | v7)
  {
    if (v6 && v7)
    {
      id v17 = [(id)v7 dateByAddingTimeInterval:-1.0];
      timeZone = self->super._timeZone;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __70__CADEventsForAssistantSearchPredicate_copyMatchingItemsWithDatabase___block_invoke;
      v27[3] = &unk_1E624ECC0;
      id v28 = v26;
      id v29 = v25;
      id v30 = v8;
      id v31 = v9;
      objc_super v19 = (const void *)MEMORY[0x1C18657E0](a3, FilterFromRowIDs, v6, v17, timeZone, v23, v27);

      if (v19)
      {
        [v24 addObjectsFromArray:v19];
        CFRelease(v19);
      }
    }
  }
  else
  {
    uint64_t v14 = CalDatabaseCopyEventOccurrenceCache();
    if (v14)
    {
      v15 = (const void *)v14;
      if (v26 || v25 || v8 || v9)
      {
        if (v9) {
          [v9 objectAtIndex:0];
        }
        uint64_t v20 = CalDatabaseCopyEventIDsOfEventsMatching();
        if (!v20) {
          goto LABEL_21;
        }
        id v21 = (const void *)v20;
        CFAbsoluteTimeGetCurrent();
        v16 = (const void *)CalEventOccurrenceCacheCopyEventOccurrencesWithIDsAfterDate();
        CFRelease(v21);
        if (!v16) {
          goto LABEL_21;
        }
      }
      else
      {
        CFAbsoluteTimeGetCurrent();
        v16 = (const void *)CalEventOccurrenceCacheCopyEventOccurrencesAfterDate();
        if (!v16) {
          goto LABEL_21;
        }
      }
      objc_msgSend(v24, "addObjectsFromArray:", v16, v23);
      CFRelease(v16);
LABEL_21:
      CFRelease(v15);
    }
  }
  CFRelease(FilterFromRowIDs);

  return v24;
}

uint64_t __70__CADEventsForAssistantSearchPredicate_copyMatchingItemsWithDatabase___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32)) {
    goto LABEL_5;
  }
  CFStringRef v2 = (const __CFString *)CalCalendarItemCopySummary();
  if (!v2) {
    return 0;
  }
  id v3 = (__CFString *)v2;
  if (CFStringFind(v2, (CFStringRef)*(void *)(a1 + 32), 0x81uLL).location != -1)
  {
    CFRelease(v3);
    goto LABEL_5;
  }
  id v24 = v3;
  [(__CFString *)v24 rangeOfString:@"’"];
  if (!v25)
  {

    CFRelease(v24);
    return 0;
  }
  v26 = [(__CFString *)v24 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

  CFIndex location = CFStringFind(v26, (CFStringRef)*(void *)(a1 + 32), 0x81uLL).location;
  CFRelease(v24);
  if (location == -1) {
    return 0;
  }
LABEL_5:
  if (*(void *)(a1 + 40))
  {
    CFStringRef v4 = (const __CFString *)CalEventCopyLocation_Deprecated();
    if (!v4) {
      return 0;
    }
    CFStringRef v5 = v4;
    CFIndex v6 = CFStringFind(v4, (CFStringRef)*(void *)(a1 + 40), 0x81uLL).location;
    CFRelease(v5);
    if (v6 == -1) {
      return 0;
    }
  }
  if (*(void *)(a1 + 48))
  {
    CFStringRef v7 = (const __CFString *)CalCalendarItemCopyDescription();
    if (!v7) {
      return 0;
    }
    CFStringRef v8 = v7;
    CFIndex v9 = CFStringFind(v7, (CFStringRef)*(void *)(a1 + 48), 0x81uLL).location;
    CFRelease(v8);
    if (v9 == -1) {
      return 0;
    }
  }
  if (![*(id *)(a1 + 56) count]) {
    return 1;
  }
  CFArrayRef v10 = (const __CFArray *)CalCalendarItemCopyAttendees();
  CFArrayRef v11 = v10;
  if (v10 && CFArrayGetCount(v10) >= 1)
  {
    CFIndex Count = CFArrayGetCount(v11);
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v11, i);
        uint64_t v16 = MEMORY[0x1C1864F60](ValueAtIndex);
        if (v16)
        {
          id v17 = (const void *)v16;
          if ([v13 length]) {
            [v13 appendFormat:@" %@", v17];
          }
          else {
            [v13 appendString:v17];
          }
          CFRelease(v17);
        }
      }
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v18 = *(id *)(a1 + 56);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v42;
LABEL_24:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = 1;
        if ([v13 rangeOfString:*(void *)(*((void *)&v41 + 1) + 8 * v22) options:1] != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_47;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v46 count:16];
          if (v20) {
            goto LABEL_24;
          }
          break;
        }
      }
    }
  }
  else
  {
    v13 = (void *)CalCalendarItemCopySummary();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = *(id *)(a1 + 56);
    uint64_t v28 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      CFArrayRef v36 = v11;
      uint64_t v30 = *(void *)v38;
      while (2)
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v18);
          }
          v32 = [NSString stringWithFormat:@"\\b%@\\b", *(void *)(*((void *)&v37 + 1) + 8 * j)];
          v33 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v32 options:0 error:0];
          uint64_t v34 = objc_msgSend(v33, "numberOfMatchesInString:options:range:", v13, 8, 0, objc_msgSend(v13, "length"));

          if (v34)
          {
            uint64_t v23 = 1;
            goto LABEL_46;
          }
        }
        uint64_t v29 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v29) {
          continue;
        }
        break;
      }
      uint64_t v23 = 0;
LABEL_46:
      CFArrayRef v11 = v36;
      goto LABEL_47;
    }
  }
  uint64_t v23 = 0;
LABEL_47:

  if (v11) {
    CFRelease(v11);
  }
  return v23;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end