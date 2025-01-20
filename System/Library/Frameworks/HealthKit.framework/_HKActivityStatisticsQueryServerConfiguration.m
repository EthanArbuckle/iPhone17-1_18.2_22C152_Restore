@interface _HKActivityStatisticsQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateComponents)exerciseIntervalComponents;
- (NSDateComponents)moveIntervalComponents;
- (_HKActivityStatisticsQueryServerConfiguration)initWithCoder:(id)a3;
- (double)updateInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setExerciseIntervalComponents:(id)a3;
- (void)setMoveIntervalComponents:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setUpdateInterval:(double)a3;
@end

@implementation _HKActivityStatisticsQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKActivityStatisticsQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setStartDate:self->_startDate];
  [v4 setEndDate:self->_endDate];
  [v4 setMoveIntervalComponents:self->_moveIntervalComponents];
  [v4 setExerciseIntervalComponents:self->_exerciseIntervalComponents];
  [v4 setUpdateInterval:self->_updateInterval];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKActivityStatisticsQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_HKActivityStatisticsQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_startDate);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_endDate);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_moveIntervalComponents);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    moveIntervalComponents = v5->_moveIntervalComponents;
    v5->_moveIntervalComponents = (NSDateComponents *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_exerciseIntervalComponents);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    exerciseIntervalComponents = v5->_exerciseIntervalComponents;
    v5->_exerciseIntervalComponents = (NSDateComponents *)v20;

    v22 = NSStringFromSelector(sel_updateInterval);
    [v4 decodeDoubleForKey:v22];
    v5->_updateInterval = v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_HKActivityStatisticsQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v15 encodeWithCoder:v4];
  startDate = self->_startDate;
  uint64_t v6 = NSStringFromSelector(sel_startDate);
  objc_msgSend(v4, "encodeObject:forKey:", startDate, v6, v15.receiver, v15.super_class);

  endDate = self->_endDate;
  uint64_t v8 = NSStringFromSelector(sel_endDate);
  [v4 encodeObject:endDate forKey:v8];

  moveIntervalComponents = self->_moveIntervalComponents;
  uint64_t v10 = NSStringFromSelector(sel_moveIntervalComponents);
  [v4 encodeObject:moveIntervalComponents forKey:v10];

  exerciseIntervalComponents = self->_exerciseIntervalComponents;
  uint64_t v12 = NSStringFromSelector(sel_exerciseIntervalComponents);
  [v4 encodeObject:exerciseIntervalComponents forKey:v12];

  double updateInterval = self->_updateInterval;
  uint64_t v14 = NSStringFromSelector(sel_updateInterval);
  [v4 encodeDouble:v14 forKey:updateInterval];
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSDateComponents)moveIntervalComponents
{
  return self->_moveIntervalComponents;
}

- (void)setMoveIntervalComponents:(id)a3
{
}

- (NSDateComponents)exerciseIntervalComponents
{
  return self->_exerciseIntervalComponents;
}

- (void)setExerciseIntervalComponents:(id)a3
{
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_double updateInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exerciseIntervalComponents, 0);
  objc_storeStrong((id *)&self->_moveIntervalComponents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end