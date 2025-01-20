@interface CADEventTimeWindowPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)mustStartInInterval;
- (CADEventTimeWindowPredicate)initWithCoder:(id)a3;
- (CADEventTimeWindowPredicate)initWithPredicate:(id)a3 limitWithStartDate:(id)a4 endDate:(id)a5 mustStartInInterval:(BOOL)a6;
- (CADPredicate)wrappedPredicate;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3;
- (id)defaultPropertiesToLoad;
- (id)predicateFormat;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADEventTimeWindowPredicate

- (CADEventTimeWindowPredicate)initWithPredicate:(id)a3 limitWithStartDate:(id)a4 endDate:(id)a5 mustStartInInterval:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CADEventTimeWindowPredicate;
  v14 = [(CADEventTimeWindowPredicate *)&v25 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_wrappedPredicate, a3);
    if (v12)
    {
      v16 = (void *)MEMORY[0x1E4F1C9C8];
      [v12 timeIntervalSinceReferenceDate];
      uint64_t v18 = [v16 dateWithTimeIntervalSinceReferenceDate:floor(v17)];
    }
    else
    {
      uint64_t v18 = 0;
    }
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v18;

    if (v13)
    {
      v20 = (void *)MEMORY[0x1E4F1C9C8];
      [v13 timeIntervalSinceReferenceDate];
      uint64_t v22 = [v20 dateWithTimeIntervalSinceReferenceDate:floor(v21)];
    }
    else
    {
      uint64_t v22 = 0;
    }
    endDate = v15->_endDate;
    v15->_endDate = (NSDate *)v22;

    v15->_mustStartInInterval = a6;
  }

  return v15;
}

- (id)predicateFormat
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:1];
  [v3 setTimeStyle:1];
  v4 = NSString;
  v5 = [(CADEventTimeWindowPredicate *)self startDate];
  v6 = [v3 stringFromDate:v5];
  v7 = [(CADEventTimeWindowPredicate *)self endDate];
  v8 = [v3 stringFromDate:v7];
  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[CADEventTimeWindowPredicate mustStartInInterval](self, "mustStartInInterval"));
  objc_msgSend(v4, "stringWithFormat:", @"CADEventTimeWindowPredicate start:%@; end:%@; mustStartInInterval:%@",
    v6,
    v8,
  v10 = v9);

  return v10;
}

- (id)copyMatchingItemsWithDatabase:(CalDatabase *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = [(CADPredicate *)self->_wrappedPredicate copyMatchingItemsWithDatabase:a3];
  double v21 = objc_opt_new();
  [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
  uint64_t v6 = v5;
  [(NSDate *)self->_endDate timeIntervalSinceReferenceDate];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__CADEventTimeWindowPredicate_copyMatchingItemsWithDatabase___block_invoke;
  v26[3] = &unk_1E624E788;
  v20 = self;
  v26[4] = self;
  v26[5] = v6;
  v26[6] = v7;
  v8 = (unsigned int (**)(void, void))MEMORY[0x1C1867AB0](v26);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    id v19 = v9;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(const void **)(*((void *)&v22 + 1) + 8 * i);
        CFTypeID v15 = CFGetTypeID(v14);
        if (v15 == CalEventOccurrenceGetTypeID())
        {
          uint64_t Event = CalEventOccurrenceGetEvent();
          CalEventOccurrenceGetDate();
          if (v8[2](v8, Event)) {
            [v21 addObject:v14];
          }
        }
        else if (CalEntityGetType() == 2)
        {
          double v17 = (const void *)CalCopyTimeZone();
          [(NSDate *)v20->_startDate timeIntervalSinceReferenceDate];
          CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
          [(NSDate *)v20->_endDate timeIntervalSinceReferenceDate];
          CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
          CalEventGetStartDate();
          if ((((uint64_t (*)(void, const void *))v8[2])(v8, v14) & 1) != 0
            || CalEventOccurrencesExistForEventInDateRange())
          {
            objc_msgSend(v21, "addObject:", v14, v19);
          }
          CFRelease(v17);
          id v9 = v19;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v11);
  }

  return v21;
}

BOOL __61__CADEventTimeWindowPredicate_copyMatchingItemsWithDatabase___block_invoke(uint64_t a1, double a2)
{
  return (!*(unsigned char *)(*(void *)(a1 + 32) + 16) || *(double *)(a1 + 40) <= a2 && *(double *)(a1 + 48) > a2)
      && (double)CalEventGetDuration() + a2 > *(double *)(a1 + 40)
      && *(double *)(a1 + 48) > a2;
}

- (CADEventTimeWindowPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CADEventTimeWindowPredicate;
  uint64_t v5 = [(CADEventTimeWindowPredicate *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedPredicate"];
    wrappedPredicate = v5->_wrappedPredicate;
    v5->_wrappedPredicate = (CADPredicate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    v5->_mustStartInInterval = [v4 decodeBoolForKey:@"mustStartInInterval"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CADEventTimeWindowPredicate;
  id v4 = a3;
  [(CADEventTimeWindowPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_wrappedPredicate, @"wrappedPredicate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_startDate forKey:@"startDate"];
  [v4 encodeObject:self->_endDate forKey:@"endDate"];
  [v4 encodeBool:self->_mustStartInInterval forKey:@"mustStartInInterval"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)defaultPropertiesToLoad
{
  return [(CADPredicate *)self->_wrappedPredicate defaultPropertiesToLoad];
}

- (CADPredicate)wrappedPredicate
{
  return self->_wrappedPredicate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)mustStartInInterval
{
  return self->_mustStartInInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_wrappedPredicate, 0);
}

@end