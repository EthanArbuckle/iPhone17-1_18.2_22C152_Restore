@interface CADEventsForConferenceURLPredicate
+ (BOOL)supportsSecureCoding;
- (CADEventsForConferenceURLPredicate)initWithCoder:(id)a3;
- (CADEventsForConferenceURLPredicate)initWithURL:(id)a3 limit:(int64_t)a4;
- (NSString)urlString;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)defaultPropertiesToLoad;
- (id)description;
- (id)predicateFormat;
- (int64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setUrlString:(id)a3;
@end

@implementation CADEventsForConferenceURLPredicate

- (CADEventsForConferenceURLPredicate)initWithURL:(id)a3 limit:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CADEventsForConferenceURLPredicate;
  v7 = [(EKPredicate *)&v10 initWithCalendars:0];
  if (v7)
  {
    v8 = [v6 absoluteString];
    [(CADEventsForConferenceURLPredicate *)v7 setUrlString:v8];

    [(CADEventsForConferenceURLPredicate *)v7 setLimit:a4];
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v9.receiver = self;
  v9.super_class = (Class)CADEventsForConferenceURLPredicate;
  v4 = [(CADEventsForConferenceURLPredicate *)&v9 description];
  v5 = (void *)[v3 initWithSuperclassDescription:v4];

  id v6 = [(CADEventsForConferenceURLPredicate *)self urlString];
  [v5 setKey:@"URL" withObject:v6];

  objc_msgSend(v5, "setKey:withInteger:", @"limit", -[CADEventsForConferenceURLPredicate limit](self, "limit"));
  v7 = [v5 build];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADEventsForConferenceURLPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADEventsForConferenceURLPredicate;
  v5 = [(EKPredicate *)&v9 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlString"];
    [(CADEventsForConferenceURLPredicate *)v5 setUrlString:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"limit"];
    -[CADEventsForConferenceURLPredicate setLimit:](v5, "setLimit:", [v7 integerValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CADEventsForConferenceURLPredicate;
  id v4 = a3;
  [(EKPredicate *)&v7 encodeWithCoder:v4];
  v5 = [(CADEventsForConferenceURLPredicate *)self urlString];
  [v4 encodeObject:v5 forKey:@"urlString"];

  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[CADEventsForConferenceURLPredicate limit](self, "limit"));
  [v4 encodeObject:v6 forKey:@"limit"];
}

- (id)predicateFormat
{
  return (id)[NSString stringWithFormat:@"%@ <%p>", objc_opt_class(), self];
}

- (id)defaultPropertiesToLoad
{
  v2 = (void *)MEMORY[0x1E4F1CA48];
  id v3 = CADEKPersistentEventMinimumDefaultPropertiesToLoad();
  id v4 = [v2 arrayWithArray:v3];

  [v4 addObject:*MEMORY[0x1E4F56C58]];
  return v4;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t AuxilliaryDatabaseID = CalDatabaseGetAuxilliaryDatabaseID();
  v5 = [(EKPredicate *)self calendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  id v6 = [(EKPredicate *)self restrictedCalendarRowIDsForDatabaseID:AuxilliaryDatabaseID];
  FilterFromRowIDs = (const void *)CreateFilterFromRowIDs(v5, v6);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v9 = [(CADEventsForConferenceURLPredicate *)self urlString];
  [(CADEventsForConferenceURLPredicate *)self limit];
  uint64_t v10 = CalDatabaseCopyEventOccurrenceCache();
  if (v10)
  {
    v11 = (const void *)v10;
    if (v9)
    {
      uint64_t v12 = CalDatabaseCopyEventIDsOfEventsMatching();
      if (v12)
      {
        v13 = (const void *)v12;
        CFAbsoluteTimeGetCurrent();
        v14 = (const void *)CalEventOccurrenceCacheCopyEventOccurrencesWithIDsAfterDate();
        CFRelease(v13);
        if (v14)
        {
          [v8 addObjectsFromArray:v14];
          CFRelease(v14);
        }
      }
    }
    CFRelease(v11);
  }
  CFRelease(FilterFromRowIDs);

  return v8;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
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
}

@end