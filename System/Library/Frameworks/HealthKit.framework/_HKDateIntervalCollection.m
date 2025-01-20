@interface _HKDateIntervalCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)enableRiskyFastMathOptimization;
- (BOOL)isEqual:(id)a3;
- (NSDate)anchorDate;
- (NSDateComponents)intervalComponents;
- (_HKDateIntervalCollection)initWithAnchorDate:(id)a3 intervalComponents:(id)a4;
- (_HKDateIntervalCollection)initWithCoder:(id)a3;
- (id)_dateByAddingInterval:(int64_t)a3 toDate:(id)a4 calendar:(id)a5 workComponents:(id)a6;
- (id)dateIntervalAtIndex:(int64_t)a3;
- (id)dateIntervalContainingDate:(id)a3 index:(int64_t *)a4;
- (id)dateIntervalForIntervalsContainingInterval:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEnableRiskyFastMathOptimization:(BOOL)a3;
@end

@implementation _HKDateIntervalCollection

- (_HKDateIntervalCollection)initWithAnchorDate:(id)a3 intervalComponents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_HKDateIntervalCollection.m", 25, @"Invalid parameter not satisfying: %@", @"anchorDate != nil" object file lineNumber description];
  }
  v9 = [v8 calendar];

  if (!v9)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_HKDateIntervalCollection.m", 26, @"Invalid parameter not satisfying: %@", @"intervalComponents.calendar != nil" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)_HKDateIntervalCollection;
  v10 = [(_HKDateIntervalCollection *)&v23 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    anchorDate = v10->_anchorDate;
    v10->_anchorDate = (NSDate *)v11;

    uint64_t v13 = [v8 copy];
    intervalComponents = v10->_intervalComponents;
    v10->_intervalComponents = (NSDateComponents *)v13;

    v10->_maxComponent = objc_msgSend(v8, "hk_maxComponentValue");
    [(NSDateComponents *)v10->_intervalComponents hk_approximateDuration];
    v10->_approximateIntervalDuration = v15;
    if ([(NSDateComponents *)v10->_intervalComponents year] == 0x7FFFFFFFFFFFFFFFLL
      && [(NSDateComponents *)v10->_intervalComponents month] == 0x7FFFFFFFFFFFFFFFLL
      && [(NSDateComponents *)v10->_intervalComponents weekOfYear] == 0x7FFFFFFFFFFFFFFFLL
      && [(NSDateComponents *)v10->_intervalComponents weekOfMonth] == 0x7FFFFFFFFFFFFFFFLL
      && [(NSDateComponents *)v10->_intervalComponents day] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = [(NSDateComponents *)v10->_intervalComponents hour];
      v10->_canonicalIntervalDuration = 0.0;
      v10->_canUseFastDateMath = v16 == 0x7FFFFFFFFFFFFFFFLL;
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = [(NSDateComponents *)v10->_intervalComponents calendar];
        v18 = [v17 dateByAddingComponents:v10->_intervalComponents toDate:v10->_anchorDate options:0];

        [v18 timeIntervalSinceDate:v10->_anchorDate];
        v10->_canonicalIntervalDuration = v19;
      }
    }
    else
    {
      v10->_canUseFastDateMath = 0;
      v10->_canonicalIntervalDuration = 0.0;
    }
  }

  return v10;
}

- (id)dateIntervalAtIndex:(int64_t)a3
{
  if (self->_canUseFastDateMath && self->_enableRiskyFastMathOptimization)
  {
    v5 = [(NSDate *)self->_anchorDate dateByAddingTimeInterval:self->_canonicalIntervalDuration * (double)a3];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 duration:self->_canonicalIntervalDuration];
  }
  else
  {
    id v7 = [(NSDateComponents *)self->_intervalComponents calendar];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    }
    v5 = v9;

    id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    uint64_t v11 = [(_HKDateIntervalCollection *)self _dateByAddingInterval:a3 toDate:self->_anchorDate calendar:v5 workComponents:v10];
    v12 = [(_HKDateIntervalCollection *)self _dateByAddingInterval:a3 + 1 toDate:self->_anchorDate calendar:v5 workComponents:v10];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v12];
  }

  return v6;
}

- (id)_dateByAddingInterval:(int64_t)a3 toDate:(id)a4 calendar:(id)a5 workComponents:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v10;
  v14 = v13;
  double v15 = v13;
  if (a3)
  {
    int64_t maxComponent = self->_maxComponent;
    double v15 = v13;
    if (maxComponent)
    {
      v17 = v13;
      uint64_t v18 = 0x7FFFFFFF / maxComponent;
      do
      {
        if (a3 >= 0) {
          int64_t v19 = a3;
        }
        else {
          int64_t v19 = -a3;
        }
        if (v19 >= v18) {
          int64_t v19 = v18;
        }
        if (a3 >= 0) {
          int64_t v20 = v19;
        }
        else {
          int64_t v20 = -v19;
        }
        if ([(NSDateComponents *)self->_intervalComponents year] != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v12, "setYear:", -[NSDateComponents year](self->_intervalComponents, "year") * v20);
        }
        if ([(NSDateComponents *)self->_intervalComponents month] != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v12, "setMonth:", -[NSDateComponents month](self->_intervalComponents, "month") * v20);
        }
        if ([(NSDateComponents *)self->_intervalComponents weekOfYear] != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v12, "setWeekOfYear:", -[NSDateComponents weekOfYear](self->_intervalComponents, "weekOfYear") * v20);
        }
        if ([(NSDateComponents *)self->_intervalComponents weekOfMonth] != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v12, "setWeekOfMonth:", -[NSDateComponents weekOfMonth](self->_intervalComponents, "weekOfMonth") * v20);
        }
        if ([(NSDateComponents *)self->_intervalComponents day] != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v12, "setDay:", -[NSDateComponents day](self->_intervalComponents, "day") * v20);
        }
        if ([(NSDateComponents *)self->_intervalComponents hour] != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v12, "setHour:", -[NSDateComponents hour](self->_intervalComponents, "hour") * v20);
        }
        if ([(NSDateComponents *)self->_intervalComponents minute] != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v12, "setMinute:", -[NSDateComponents minute](self->_intervalComponents, "minute") * v20);
        }
        if ([(NSDateComponents *)self->_intervalComponents second] != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v12, "setSecond:", -[NSDateComponents second](self->_intervalComponents, "second") * v20);
        }
        if ([(NSDateComponents *)self->_intervalComponents nanosecond] != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v12, "setNanosecond:", -[NSDateComponents nanosecond](self->_intervalComponents, "nanosecond") * v20);
        }
        double v15 = [v11 dateByAddingComponents:v12 toDate:v17 options:0];

        v17 = v15;
        a3 -= v20;
      }
      while (a3);
    }
  }
  id v21 = v15;

  return v21;
}

- (id)dateIntervalContainingDate:(id)a3 index:(int64_t *)a4
{
  id v6 = a3;
  [v6 timeIntervalSinceDate:self->_anchorDate];
  int64_t v8 = vcvtmd_s64_f64(v7 / self->_approximateIntervalDuration);
  id v9 = [(_HKDateIntervalCollection *)self dateIntervalAtIndex:v8];
  id v10 = [v9 endDate];
  int v11 = objc_msgSend(v10, "hk_isBeforeOrEqualToDate:", v6);

  if (v11)
  {
    do
    {
      id v12 = [(_HKDateIntervalCollection *)self dateIntervalAtIndex:++v8];

      id v13 = [v12 endDate];
      char v14 = objc_msgSend(v13, "hk_isBeforeOrEqualToDate:", v6);

      id v9 = v12;
    }
    while ((v14 & 1) != 0);
  }
  else
  {
    id v12 = v9;
  }
  double v15 = [v12 startDate];
  int v16 = objc_msgSend(v15, "hk_isAfterDate:", v6);

  if (v16)
  {
    do
    {
      v17 = [(_HKDateIntervalCollection *)self dateIntervalAtIndex:--v8];

      uint64_t v18 = [v17 startDate];
      char v19 = objc_msgSend(v18, "hk_isAfterDate:", v6);

      id v12 = v17;
    }
    while ((v19 & 1) != 0);
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v17 = v12;
  if (a4) {
LABEL_8:
  }
    *a4 = v8;
LABEL_9:

  return v17;
}

- (id)dateIntervalForIntervalsContainingInterval:(id)a3
{
  id v4 = a3;
  v5 = [v4 startDate];
  id v6 = [(_HKDateIntervalCollection *)self dateIntervalContainingDate:v5 index:0];

  double v7 = [v4 endDate];

  int64_t v8 = [(_HKDateIntervalCollection *)self dateIntervalContainingDate:v7 index:0];

  id v9 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v10 = [v6 startDate];
  int v11 = [v8 endDate];
  id v12 = (void *)[v9 initWithStartDate:v10 endDate:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HKDateIntervalCollection *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(NSDate *)self->_anchorDate isEqualToDate:v4->_anchorDate])
    {
      char v5 = [(NSDateComponents *)self->_intervalComponents isEqual:v4->_intervalComponents];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_anchorDate hash];
  return [(NSDateComponents *)self->_intervalComponents hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKDateIntervalCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anchor_date"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interval_components"];

  double v7 = [(_HKDateIntervalCollection *)self initWithAnchorDate:v5 intervalComponents:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  anchorDate = self->_anchorDate;
  id v5 = a3;
  [v5 encodeObject:anchorDate forKey:@"anchor_date"];
  [v5 encodeObject:self->_intervalComponents forKey:@"interval_components"];
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (BOOL)enableRiskyFastMathOptimization
{
  return self->_enableRiskyFastMathOptimization;
}

- (void)setEnableRiskyFastMathOptimization:(BOOL)a3
{
  self->_enableRiskyFastMathOptimization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalComponents, 0);

  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end