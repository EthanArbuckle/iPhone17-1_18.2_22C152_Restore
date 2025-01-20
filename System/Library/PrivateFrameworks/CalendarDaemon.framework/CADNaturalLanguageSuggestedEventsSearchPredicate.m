@interface CADNaturalLanguageSuggestedEventsSearchPredicate
+ (BOOL)supportsSecureCoding;
- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithCoder:(id)a3;
- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithSearchString:(id)a3 allNLEvents:(BOOL)a4 startDate:(id)a5 timeZone:(id)a6;
- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithSearchString:(id)a3 startDate:(id)a4 timeZone:(id)a5;
- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithSearchString:(id)a3 timeZone:(id)a4;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)defaultPropertiesToLoad;
- (id)description;
- (id)predicateFormat;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADNaturalLanguageSuggestedEventsSearchPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithSearchString:(id)a3 timeZone:(id)a4
{
  return [(CADNaturalLanguageSuggestedEventsSearchPredicate *)self initWithSearchString:a3 allNLEvents:0 startDate:0 timeZone:a4];
}

- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithSearchString:(id)a3 startDate:(id)a4 timeZone:(id)a5
{
  return [(CADNaturalLanguageSuggestedEventsSearchPredicate *)self initWithSearchString:a3 allNLEvents:1 startDate:a4 timeZone:a5];
}

- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithSearchString:(id)a3 allNLEvents:(BOOL)a4 startDate:(id)a5 timeZone:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CADNaturalLanguageSuggestedEventsSearchPredicate;
  v14 = [(CADNaturalLanguageSuggestedEventsSearchPredicate *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_searchString, a3);
    v15->_allNLEvents = a4;
    objc_storeStrong((id *)&v15->_startDate, a5);
    objc_storeStrong((id *)&v15->super._timeZone, a6);
  }

  return v15;
}

- (CADNaturalLanguageSuggestedEventsSearchPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CADNaturalLanguageSuggestedEventsSearchPredicate;
  v5 = [(EKPredicate *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchString"];
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v6;

    v5->_allNLEvents = [v4 decodeBoolForKey:@"allNLEvents"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->super._timeZone;
    v5->super._timeZone = (NSTimeZone *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CADNaturalLanguageSuggestedEventsSearchPredicate;
  id v4 = a3;
  [(EKPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchString, @"searchString", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_allNLEvents forKey:@"allNLEvents"];
  [v4 encodeObject:self->_startDate forKey:@"startDate"];
  [v4 encodeObject:self->super._timeZone forKey:@"timeZone"];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v8.receiver = self;
  v8.super_class = (Class)CADNaturalLanguageSuggestedEventsSearchPredicate;
  id v4 = [(CADNaturalLanguageSuggestedEventsSearchPredicate *)&v8 description];
  objc_super v5 = (void *)[v3 initWithSuperclassDescription:v4];

  [v5 setKey:@"searchString" withObject:self->_searchString];
  [v5 setKey:@"allNLEvents" withBoolean:self->_allNLEvents];
  [v5 setKey:@"startDate" withObject:self->_startDate];
  uint64_t v6 = [v5 build];

  return v6;
}

- (id)defaultPropertiesToLoad
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F56D40];
  v5[0] = *MEMORY[0x1E4F56D38];
  v5[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

- (id)predicateFormat
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = self->super._timeZone;
  if (self->_allNLEvents)
  {
    objc_super v5 = (void *)CalDatabaseCopyAllNaturalLanguageSuggestedEventsMatchingSummary();
    if ([v5 count])
    {
      uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
      [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
      double v8 = v7;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = v5;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = (const void *)CalEventOccurrenceCreateForInitialOccurrenceWithTimeZone();
            if (!self->_startDate
              || (CalEventOccurrenceGetDate(), v15 + (double)CalEventGetDuration() > v8))
            {
              objc_msgSend(v6, "addObject:", v14, v19);
            }
            CFRelease(v14);
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }
    }
    else
    {
      uint64_t v6 = v5;
    }
  }
  else
  {
    NaturalLanguageSuggestedEventMatchingSummary = (const void *)CalDatabaseCopyFirstNaturalLanguageSuggestedEventMatchingSummary();
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    if (NaturalLanguageSuggestedEventMatchingSummary)
    {
      objc_super v17 = (const void *)CalEventOccurrenceCreateForInitialOccurrenceWithTimeZone();
      [v6 addObject:v17];
      CFRelease(v17);
      CFRelease(NaturalLanguageSuggestedEventMatchingSummary);
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end