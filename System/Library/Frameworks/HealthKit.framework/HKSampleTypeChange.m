@interface HKSampleTypeChange
+ (BOOL)supportsSecureCoding;
+ (id)sampleTypeChangeWithSampleType:(id)a3 dateInterval:(id)a4 hasUnfrozenSeries:(BOOL)a5;
- (BOOL)hasUnfrozenSeries;
- (BOOL)isEqual:(id)a3;
- (HKSampleType)sampleType;
- (HKSampleTypeChange)initWithCoder:(id)a3;
- (NSDateInterval)dateInterval;
- (NSString)hk_redactedDescription;
- (double)endTime;
- (double)startTime;
- (id)_initWithSampleType:(id)a3 startTime:(double)a4 endTime:(double)a5 hasUnfrozenSeries:(BOOL)a6 queryStrategy:(int64_t)a7;
- (id)description;
- (int64_t)queryStrategy;
- (void)_extendDateIntervalWithSample:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSampleTypeChange

- (id)_initWithSampleType:(id)a3 startTime:(double)a4 endTime:(double)a5 hasUnfrozenSeries:(BOOL)a6 queryStrategy:(int64_t)a7
{
  id v13 = a3;
  if (a4 > a5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_HKDatabaseChangesQuery.m", 134, @"Invalid parameter not satisfying: %@", @"startTime <= endTime" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)HKSampleTypeChange;
  v14 = [(HKSampleTypeChange *)&v19 init];
  if (v14)
  {
    uint64_t v15 = [v13 copy];
    sampleType = v14->_sampleType;
    v14->_sampleType = (HKSampleType *)v15;

    v14->_startTime = a4;
    v14->_endTime = a5;
    v14->_hasUnfrozenSeries = a6;
    v14->_queryStrategy = a7;
  }

  return v14;
}

+ (id)sampleTypeChangeWithSampleType:(id)a3 dateInterval:(id)a4 hasUnfrozenSeries:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc((Class)a1);
  v11 = v10;
  if (v9)
  {
    v12 = [v9 startDate];
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;
    uint64_t v15 = [v9 endDate];
    [v15 timeIntervalSinceReferenceDate];
    v17 = (void *)[v11 _initWithSampleType:v8 startTime:v5 endTime:0 hasUnfrozenSeries:v14 queryStrategy:v16];
  }
  else
  {
    v17 = (void *)[v10 _initWithSampleType:v8 startTime:v5 endTime:0 hasUnfrozenSeries:-1.79769313e308 queryStrategy:-1.79769313e308];
  }

  return v17;
}

- (NSDateInterval)dateInterval
{
  if (self->_startTime == -1.79769313e308 && self->_endTime == -1.79769313e308)
  {
    v3 = 0;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C18]);
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:self->_startTime];
    v3 = (void *)[v4 initWithStartDate:v5 duration:self->_endTime - self->_startTime];
  }

  return (NSDateInterval *)v3;
}

- (void)_extendDateIntervalWithSample:(id)a3
{
  id v10 = a3;
  double startTime = self->_startTime;
  [v10 _startTimestamp];
  if (startTime >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = startTime;
  }
  if (startTime != -1.79769313e308) {
    double v5 = v6;
  }
  self->_double startTime = v5;
  double endTime = self->_endTime;
  [v10 _endTimestamp];
  if (endTime >= v8 && endTime != -1.79769313e308) {
    double v8 = endTime;
  }
  self->_double endTime = v8;
}

- (NSString)hk_redactedDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(HKSampleTypeChange *)self dateInterval];
  double v6 = (void *)v5;
  v7 = &stru_1EEC60288;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  double v8 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v7];

  return (NSString *)v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  sampleType = self->_sampleType;
  uint64_t v6 = [(HKSampleTypeChange *)self dateInterval];
  v7 = (void *)v6;
  double v8 = &stru_1EEC60288;
  if (v6) {
    double v8 = (__CFString *)v6;
  }
  id v9 = [v3 stringWithFormat:@"<%@:%p %@ %@>", v4, self, sampleType, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKSampleTypeChange *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ((sampleType = self->_sampleType, v7 = v5->_sampleType, sampleType == v7)
       || v7 && -[HKObjectType isEqual:](sampleType, "isEqual:"))
      && self->_startTime == v5->_startTime
      && self->_endTime == v5->_endTime
      && self->_queryStrategy == v5->_queryStrategy;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSampleTypeChange)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sampleType"];
  [v4 decodeDoubleForKey:@"start"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"end"];
  double v9 = v8;
  uint64_t v10 = [v4 decodeBoolForKey:@"unfrozen"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"strategy"];

  v12 = [(HKSampleTypeChange *)self _initWithSampleType:v5 startTime:v10 endTime:v11 hasUnfrozenSeries:v7 queryStrategy:v9];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  sampleType = self->_sampleType;
  id v5 = a3;
  [v5 encodeObject:sampleType forKey:@"sampleType"];
  [v5 encodeDouble:@"start" forKey:self->_startTime];
  [v5 encodeDouble:@"end" forKey:self->_endTime];
  [v5 encodeBool:self->_hasUnfrozenSeries forKey:@"unfrozen"];
  [v5 encodeInteger:self->_queryStrategy forKey:@"strategy"];
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (BOOL)hasUnfrozenSeries
{
  return self->_hasUnfrozenSeries;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (int64_t)queryStrategy
{
  return self->_queryStrategy;
}

- (void).cxx_destruct
{
}

@end