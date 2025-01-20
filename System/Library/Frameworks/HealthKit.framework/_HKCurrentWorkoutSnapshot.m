@interface _HKCurrentWorkoutSnapshot
+ (BOOL)supportsSecureCoding;
- (BOOL)isBuilderPaused;
- (BOOL)isFirstPartyWorkout;
- (HKWorkoutConfiguration)configuration;
- (NSDate)builderStartDate;
- (NSDate)snapshotDate;
- (NSString)applicationIdentifier;
- (NSUUID)sessionIdentifier;
- (_HKCurrentWorkoutSnapshot)initWithCoder:(id)a3;
- (double)elapsedTime;
- (double)elapsedTimeAtDate:(id)a3;
- (id)_initWithSessionIdentifier:(id)a3 workoutConfiguration:(id)a4 sessionServerState:(int64_t)a5 isBuilderPaused:(BOOL)a6 applicationIdentifier:(id)a7 elapsedTime:(double)a8 snapshotDate:(id)a9 builderStartDate:(id)a10;
- (id)description;
- (int64_t)internalState;
- (int64_t)sessionState;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HKCurrentWorkoutSnapshot

- (id)_initWithSessionIdentifier:(id)a3 workoutConfiguration:(id)a4 sessionServerState:(int64_t)a5 isBuilderPaused:(BOOL)a6 applicationIdentifier:(id)a7 elapsedTime:(double)a8 snapshotDate:(id)a9 builderStartDate:(id)a10
{
  id v29 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  v30.receiver = self;
  v30.super_class = (Class)_HKCurrentWorkoutSnapshot;
  v22 = [(_HKCurrentWorkoutSnapshot *)&v30 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_sessionIdentifier, a3);
    objc_storeStrong((id *)&v23->_configuration, a4);
    v23->_internalState = a5;
    v23->_sessionState = HKWorkoutSessionStateFromServerState(a5);
    v23->_isBuilderPaused = a6;
    uint64_t v24 = [v19 copy];
    applicationIdentifier = v23->_applicationIdentifier;
    v23->_applicationIdentifier = (NSString *)v24;

    v23->_elapsedTime = a8;
    objc_storeStrong((id *)&v23->_snapshotDate, a9);
    uint64_t v26 = [v21 copy];
    builderStartDate = v23->_builderStartDate;
    v23->_builderStartDate = (NSDate *)v26;
  }
  return v23;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  configuration = self->_configuration;
  v6 = HKWorkoutSessionStateToString(self->_sessionState);
  v7 = _HKWorkoutSessionServerStateToString(self->_internalState);
  applicationIdentifier = self->_applicationIdentifier;
  v9 = [NSNumber numberWithDouble:self->_elapsedTime];
  v10 = [v3 stringWithFormat:@"<%@:%p, configuration:%@, state:%@, internalState:%@, applicationIdentifier:%@, elapsedTime:%@, snapshotDate:%@>", v4, self, configuration, v6, v7, applicationIdentifier, v9, self->_snapshotDate];

  return v10;
}

- (BOOL)isFirstPartyWorkout
{
  return [(NSString *)self->_applicationIdentifier isEqualToString:@"com.apple.SessionTrackerApp"];
}

- (double)elapsedTimeAtDate:(id)a3
{
  id v4 = a3;
  v5 = v4;
  double elapsedTime = 0.0;
  if (self->_elapsedTime != 0.0 && (objc_msgSend(v4, "hk_isBeforeDate:", self->_snapshotDate) & 1) == 0)
  {
    double elapsedTime = self->_elapsedTime;
    if (!self->_isBuilderPaused)
    {
      [v5 timeIntervalSinceDate:self->_snapshotDate];
      double elapsedTime = elapsedTime + v7;
    }
  }

  return elapsedTime;
}

- (int64_t)state
{
  unint64_t v2 = self->_sessionState - 2;
  if (v2 > 4) {
    return 1;
  }
  else {
    return qword_19C3D3FF0[v2];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKCurrentWorkoutSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_HKCurrentWorkoutSnapshot;
  v5 = [(_HKCurrentWorkoutSnapshot *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (HKWorkoutConfiguration *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v10;

    v5->_sessionState = [v4 decodeIntegerForKey:@"state"];
    v5->_internalState = [v4 decodeIntegerForKey:@"internalState"];
    v5->_isBuilderPaused = [v4 decodeBoolForKey:@"isBuilderPaused"];
    [v4 decodeDoubleForKey:@"elapsedTime"];
    v5->_double elapsedTime = v12;
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snapshotDate"];
    snapshotDate = v5->_snapshotDate;
    v5->_snapshotDate = (NSDate *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    builderStartDate = v5->_builderStartDate;
    v5->_builderStartDate = (NSDate *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 encodeObject:sessionIdentifier forKey:@"sessionIdentifier"];
  [v5 encodeObject:self->_configuration forKey:@"configuration"];
  [v5 encodeObject:self->_applicationIdentifier forKey:@"applicationIdentifier"];
  [v5 encodeInteger:self->_sessionState forKey:@"state"];
  [v5 encodeInteger:self->_internalState forKey:@"internalState"];
  [v5 encodeBool:self->_isBuilderPaused forKey:@"isBuilderPaused"];
  [v5 encodeDouble:@"elapsedTime" forKey:self->_elapsedTime];
  [v5 encodeObject:self->_snapshotDate forKey:@"snapshotDate"];
  [v5 encodeObject:self->_builderStartDate forKey:@"startDate"];
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (HKWorkoutConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (int64_t)internalState
{
  return self->_internalState;
}

- (BOOL)isBuilderPaused
{
  return self->_isBuilderPaused;
}

- (NSDate)snapshotDate
{
  return self->_snapshotDate;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (NSDate)builderStartDate
{
  return self->_builderStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builderStartDate, 0);
  objc_storeStrong((id *)&self->_snapshotDate, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end