@interface _HKWorkoutSessionSnapshot
+ (BOOL)supportsSecureCoding;
- (HKWorkoutActivity)currentActivity;
- (NSDate)endDate;
- (NSDate)startDate;
- (_HKWorkoutSessionSnapshot)initWithCoder:(id)a3;
- (id)_initWithSessionState:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 currentActivity:(id)a6;
- (int64_t)sessionState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKWorkoutSessionSnapshot

- (id)_initWithSessionState:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 currentActivity:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_HKWorkoutSessionSnapshot;
  v13 = [(_HKWorkoutSessionSnapshot *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_sessionState = a3;
    uint64_t v15 = [v10 copy];
    startDate = v14->_startDate;
    v14->_startDate = (NSDate *)v15;

    uint64_t v17 = [v11 copy];
    endDate = v14->_endDate;
    v14->_endDate = (NSDate *)v17;

    uint64_t v19 = [v12 copy];
    currentActivity = v14->_currentActivity;
    v14->_currentActivity = (HKWorkoutActivity *)v19;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutSessionSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HKWorkoutSessionSnapshot;
  v5 = [(_HKWorkoutSessionSnapshot *)&v13 init];
  if (v5)
  {
    v5->_sessionState = [v4 decodeIntegerForKey:@"sessionState"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentActivity"];
    currentActivity = v5->_currentActivity;
    v5->_currentActivity = (HKWorkoutActivity *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sessionState = self->_sessionState;
  id v5 = a3;
  [v5 encodeInteger:sessionState forKey:@"sessionState"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeObject:self->_currentActivity forKey:@"currentActivity"];
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (HKWorkoutActivity)currentActivity
{
  return self->_currentActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end