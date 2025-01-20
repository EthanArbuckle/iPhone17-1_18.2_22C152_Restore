@interface GEOPOIEventHours
+ (BOOL)supportsSecureCoding;
+ (id)eventHoursForDateTimeRanges:(id)a3;
- (GEOPOIEventHours)init;
- (GEOPOIEventHours)initWithCoder:(id)a3;
- (GEOPOIEventHours)initWithDateInterval:(id)a3;
- (GEOPOIEventHours)initWithDateTimeRange:(id)a3;
- (NSArray)hours;
- (NSDateInterval)dateInterval;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setHours:(id)a3;
@end

@implementation GEOPOIEventHours

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventHoursForDateTimeRanges:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v11 = [GEOPOIEventHours alloc];
          v12 = -[GEOPOIEventHours initWithDateTimeRange:](v11, "initWithDateTimeRange:", v10, (void)v14);
          if (v12) {
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GEOPOIEventHours)init
{
  result = (GEOPOIEventHours *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOPOIEventHours)initWithDateInterval:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPOIEventHours;
  uint64_t v6 = [(GEOPOIEventHours *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dateInterval, a3);
  }

  return v7;
}

- (GEOPOIEventHours)initWithDateTimeRange:(id)a3
{
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOPOIEventHours;
  id v5 = [(GEOPOIEventHours *)&v24 init];
  if (!v5)
  {
LABEL_21:
    uint64_t v19 = v5;
    goto LABEL_22;
  }
  if ([v4 hasValidStartAndEndDates])
  {
    double v6 = 0.0;
    double v7 = 0.0;
    if (v4) {
      double v7 = (double)(unint64_t)v4[6];
    }
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v7];
    if (v4) {
      double v6 = (double)(unint64_t)v4[5];
    }
    objc_super v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v6];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v10;

    id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
    if (v4) {
      uint64_t v13 = v4[3];
    }
    else {
      uint64_t v13 = 0;
    }
    long long v14 = (void *)[v12 initWithCapacity:v13];
    unint64_t v15 = 0;
    if (!v4) {
      goto LABEL_15;
    }
LABEL_10:
    for (unint64_t i = v4[3]; v15 < i; unint64_t i = 0)
    {
      int v23 = 0;
      uint64_t v22 = 0;
      uint64_t v22 = -[GEOPDDateTimeRange timeRangeAtIndex:]((uint64_t)v4, v15);
      int v23 = v17;
      v18 = [[GEOLocalTimeInterval alloc] initWithLocalTimeRange:&v22];
      if (v18) {
        [v14 addObject:v18];
      }

      ++v15;
      if (v4) {
        goto LABEL_10;
      }
LABEL_15:
      ;
    }
    if ([v14 count]) {
      v20 = v14;
    }
    else {
      v20 = 0;
    }
    objc_storeStrong((id *)&v5->_hours, v20);

    goto LABEL_21;
  }
  uint64_t v19 = 0;
LABEL_22:

  return v19;
}

- (GEOPOIEventHours)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPOIEventHours;
  id v5 = [(GEOPOIEventHours *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEOPOIEventHoursDateIntervalKey"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"GEOPOIEventHoursHoursKey"];
    hours = v5->_hours;
    v5->_hours = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"GEOPOIEventHoursDateIntervalKey"];
  [v5 encodeObject:self->_hours forKey:@"GEOPOIEventHoursHoursKey"];
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSArray)hours
{
  return self->_hours;
}

- (void)setHours:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hours, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end