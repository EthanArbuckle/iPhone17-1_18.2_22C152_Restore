@interface HKRaceRouteCluster
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLLocation)lastWorkoutStartingPoint;
- (HKRaceRouteCluster)initWithCoder:(id)a3;
- (NSData)workoutRouteSnapshot;
- (NSDate)bestWorkoutDate;
- (NSDate)lastWorkoutDate;
- (NSString)workoutRouteLabel;
- (NSUUID)bestWorkoutUUID;
- (NSUUID)clusterUUID;
- (NSUUID)lastWorkoutUUID;
- (NSUUID)workoutClusterUUID;
- (double)bestWorkoutDistance;
- (double)bestWorkoutDuration;
- (double)lastWorkoutDistance;
- (double)lastWorkoutDuration;
- (double)relevanceValue;
- (id)_initWithUUID:(id)a3 workoutClusterUUID:(id)a4 clusterSize:(unint64_t)a5 relevanceValue:(double)a6 workoutActivityType:(unint64_t)a7 lastWorkoutUUID:(id)a8 lastWorkoutDate:(id)a9 lastWorkoutDistance:(double)a10 lastWorkoutDuration:(double)a11 lastWorkoutStartingPoint:(id)a12 bestWorkoutUUID:(id)a13 bestWorkoutDate:(id)a14 bestWorkoutDistance:(double)a15 bestWorkoutDuration:(double)a16 workoutRouteSnapshot:(id)a17 workoutRouteLabel:(id)a18;
- (id)description;
- (unint64_t)clusterSize;
- (unint64_t)hash;
- (unint64_t)workoutActivityType;
- (void)_setRelevanceValue:(double)a3;
- (void)_setWorkoutClusterUUID:(id)a3;
- (void)_setWorkoutRouteLabel:(id)a3;
- (void)_setWorkoutRouteSnapshot:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKRaceRouteCluster

- (id)_initWithUUID:(id)a3 workoutClusterUUID:(id)a4 clusterSize:(unint64_t)a5 relevanceValue:(double)a6 workoutActivityType:(unint64_t)a7 lastWorkoutUUID:(id)a8 lastWorkoutDate:(id)a9 lastWorkoutDistance:(double)a10 lastWorkoutDuration:(double)a11 lastWorkoutStartingPoint:(id)a12 bestWorkoutUUID:(id)a13 bestWorkoutDate:(id)a14 bestWorkoutDistance:(double)a15 bestWorkoutDuration:(double)a16 workoutRouteSnapshot:(id)a17 workoutRouteLabel:(id)a18
{
  id v27 = a3;
  id v28 = a4;
  id v29 = a8;
  id v30 = a9;
  v31 = v28;
  id v32 = a12;
  id v33 = a13;
  id v34 = a14;
  id v35 = a17;
  id v36 = a18;
  v59.receiver = self;
  v59.super_class = (Class)HKRaceRouteCluster;
  v37 = [(HKRaceRouteCluster *)&v59 init];
  if (v37)
  {
    uint64_t v38 = [v27 copy];
    clusterUUID = v37->_clusterUUID;
    v37->_clusterUUID = (NSUUID *)v38;

    uint64_t v40 = [v31 copy];
    workoutClusterUUID = v37->_workoutClusterUUID;
    v37->_workoutClusterUUID = (NSUUID *)v40;

    v37->_relevanceValue = a6;
    v37->_clusterSize = a5;
    v37->_workoutActivityType = a7;
    uint64_t v42 = [v29 copy];
    lastWorkoutUUID = v37->_lastWorkoutUUID;
    v37->_lastWorkoutUUID = (NSUUID *)v42;

    uint64_t v44 = [v30 copy];
    lastWorkoutDate = v37->_lastWorkoutDate;
    v37->_lastWorkoutDate = (NSDate *)v44;

    v37->_lastWorkoutDistance = a10;
    v37->_lastWorkoutDuration = a11;
    uint64_t v46 = [v32 copy];
    lastWorkoutStartingPoint = v37->_lastWorkoutStartingPoint;
    v37->_lastWorkoutStartingPoint = (CLLocation *)v46;

    uint64_t v48 = [v33 copy];
    bestWorkoutUUID = v37->_bestWorkoutUUID;
    v37->_bestWorkoutUUID = (NSUUID *)v48;

    uint64_t v50 = [v34 copy];
    bestWorkoutDate = v37->_bestWorkoutDate;
    v37->_bestWorkoutDate = (NSDate *)v50;

    v37->_bestWorkoutDistance = a15;
    v37->_bestWorkoutDuration = a16;
    uint64_t v52 = [v35 copy];
    workoutRouteSnapshot = v37->_workoutRouteSnapshot;
    v37->_workoutRouteSnapshot = (NSData *)v52;

    uint64_t v54 = [v36 copy];
    workoutRouteLabel = v37->_workoutRouteLabel;
    v37->_workoutRouteLabel = (NSString *)v54;
  }
  return v37;
}

- (void)_setWorkoutClusterUUID:(id)a3
{
}

- (void)_setRelevanceValue:(double)a3
{
  self->_relevanceValue = a3;
}

- (void)_setWorkoutRouteSnapshot:(id)a3
{
}

- (void)_setWorkoutRouteLabel:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v12 = [(NSUUID *)self->_clusterUUID isEqual:*((void *)v5 + 1)]
       && [(NSUUID *)self->_workoutClusterUUID isEqual:*((void *)v5 + 2)]
       && self->_relevanceValue == *((double *)v5 + 3)
       && self->_clusterSize == *((void *)v5 + 4)
       && self->_workoutActivityType == *((void *)v5 + 5)
       && [(NSUUID *)self->_lastWorkoutUUID isEqual:*((void *)v5 + 6)]
       && [(NSDate *)self->_lastWorkoutDate isEqualToDate:*((void *)v5 + 7)]
       && self->_lastWorkoutDistance == *((double *)v5 + 8)
       && self->_lastWorkoutDuration == *((double *)v5 + 9)
       && ([(CLLocation *)self->_lastWorkoutStartingPoint coordinate],
           double v7 = v6,
           [*((id *)v5 + 10) coordinate],
           v7 == v8)
       && ([(CLLocation *)self->_lastWorkoutStartingPoint coordinate],
           double v10 = v9,
           [*((id *)v5 + 10) coordinate],
           v10 == v11)
       && [(NSUUID *)self->_bestWorkoutUUID isEqual:*((void *)v5 + 11)]
       && [(NSDate *)self->_bestWorkoutDate isEqualToDate:*((void *)v5 + 12)]
       && self->_bestWorkoutDistance == *((double *)v5 + 13)
       && self->_bestWorkoutDuration == *((double *)v5 + 14)
       && [(NSData *)self->_workoutRouteSnapshot isEqualToData:*((void *)v5 + 15)]
       && [(NSString *)self->_workoutRouteLabel isEqualToString:*((void *)v5 + 16)];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v18 = [(NSUUID *)self->_clusterUUID hash];
  uint64_t v17 = [(NSUUID *)self->_workoutClusterUUID hash];
  double relevanceValue = self->_relevanceValue;
  int8x16_t v16 = *(int8x16_t *)&self->_clusterSize;
  uint64_t v4 = [(NSUUID *)self->_lastWorkoutUUID hash];
  uint64_t v5 = [(NSDate *)self->_lastWorkoutDate hash];
  int8x16_t v15 = *(int8x16_t *)&self->_lastWorkoutDistance;
  uint64_t v6 = [(CLLocation *)self->_lastWorkoutStartingPoint hash];
  uint64_t v7 = [(NSUUID *)self->_bestWorkoutUUID hash];
  uint64_t v8 = [(NSDate *)self->_bestWorkoutDate hash];
  double bestWorkoutDistance = self->_bestWorkoutDistance;
  double bestWorkoutDuration = self->_bestWorkoutDuration;
  uint64_t v11 = [(NSData *)self->_workoutRouteSnapshot hash];
  NSUInteger v12 = [(NSString *)self->_workoutRouteLabel hash];
  int8x16_t v13 = veorq_s8(v16, v15);
  return *(void *)&veor_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)) ^ *(void *)&relevanceValue ^ *(void *)&bestWorkoutDistance ^ *(void *)&bestWorkoutDuration ^ v12 ^ v11 ^ v8 ^ v7 ^ v6 ^ v5 ^ v4 ^ v17 ^ v18;
}

- (id)description
{
  double v3 = (double)[(NSData *)self->_workoutRouteSnapshot length] * 0.0009765625;
  return (id)[NSString stringWithFormat:@"<%@:%p uuid:%@, workout-cluster:%@, relevance:%f, activity-type:%lu, frequency:%lu, age:%@, snapshot:%0.1lf kB, label:'%@'>", objc_opt_class(), self, self->_clusterUUID, self->_workoutClusterUUID, *(void *)&self->_relevanceValue, self->_workoutActivityType, self->_clusterSize, self->_lastWorkoutDate, *(void *)&v3, self->_workoutRouteLabel, 0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKRaceRouteCluster)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HKRaceRouteCluster;
  uint64_t v5 = [(HKRaceRouteCluster *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    clusterUUID = v5->_clusterUUID;
    v5->_clusterUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cluster_uuid"];
    workoutClusterUUID = v5->_workoutClusterUUID;
    v5->_workoutClusterUUID = (NSUUID *)v8;

    [v4 decodeDoubleForKey:@"relevance"];
    v5->_double relevanceValue = v10;
    v5->_clusterSize = [v4 decodeIntegerForKey:@"size"];
    v5->_workoutActivityType = [v4 decodeIntegerForKey:@"activity_type"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"last_workout_uuid"];
    lastWorkoutUUID = v5->_lastWorkoutUUID;
    v5->_lastWorkoutUUID = (NSUUID *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"last_workout_date"];
    lastWorkoutDate = v5->_lastWorkoutDate;
    v5->_lastWorkoutDate = (NSDate *)v13;

    [v4 decodeDoubleForKey:@"last_workout_distance"];
    v5->_lastWorkoutDistance = v15;
    [v4 decodeDoubleForKey:@"last_workout_duration"];
    v5->_lastWorkoutDuration = v16;
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"last_workout_starting_point"];
    lastWorkoutStartingPoint = v5->_lastWorkoutStartingPoint;
    v5->_lastWorkoutStartingPoint = (CLLocation *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"best_workout_uuid"];
    bestWorkoutUUID = v5->_bestWorkoutUUID;
    v5->_bestWorkoutUUID = (NSUUID *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"best_workout_date"];
    bestWorkoutDate = v5->_bestWorkoutDate;
    v5->_bestWorkoutDate = (NSDate *)v21;

    [v4 decodeDoubleForKey:@"best_workout_distance"];
    v5->_double bestWorkoutDistance = v23;
    [v4 decodeDoubleForKey:@"best_workout_duration"];
    v5->_double bestWorkoutDuration = v24;
    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"route_snapshot"];
    workoutRouteSnapshot = v5->_workoutRouteSnapshot;
    v5->_workoutRouteSnapshot = (NSData *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"route_label"];
    workoutRouteLabel = v5->_workoutRouteLabel;
    v5->_workoutRouteLabel = (NSString *)v27;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  clusterUUID = self->_clusterUUID;
  id v5 = a3;
  [v5 encodeObject:clusterUUID forKey:@"uuid"];
  [v5 encodeObject:self->_workoutClusterUUID forKey:@"cluster_uuid"];
  [v5 encodeDouble:@"relevance" forKey:self->_relevanceValue];
  [v5 encodeInteger:self->_clusterSize forKey:@"size"];
  [v5 encodeInteger:self->_workoutActivityType forKey:@"activity_type"];
  [v5 encodeObject:self->_lastWorkoutUUID forKey:@"last_workout_uuid"];
  [v5 encodeObject:self->_lastWorkoutDate forKey:@"last_workout_date"];
  [v5 encodeDouble:@"last_workout_distance" forKey:self->_lastWorkoutDistance];
  [v5 encodeDouble:@"last_workout_duration" forKey:self->_lastWorkoutDuration];
  [v5 encodeObject:self->_lastWorkoutStartingPoint forKey:@"last_workout_starting_point"];
  [v5 encodeObject:self->_bestWorkoutUUID forKey:@"best_workout_uuid"];
  [v5 encodeObject:self->_bestWorkoutDate forKey:@"best_workout_date"];
  [v5 encodeDouble:@"best_workout_distance" forKey:self->_bestWorkoutDistance];
  [v5 encodeDouble:@"best_workout_duration" forKey:self->_bestWorkoutDuration];
  [v5 encodeObject:self->_workoutRouteSnapshot forKey:@"route_snapshot"];
  [v5 encodeObject:self->_workoutRouteLabel forKey:@"route_label"];
}

- (NSUUID)clusterUUID
{
  return self->_clusterUUID;
}

- (NSUUID)workoutClusterUUID
{
  return self->_workoutClusterUUID;
}

- (double)relevanceValue
{
  return self->_relevanceValue;
}

- (unint64_t)clusterSize
{
  return self->_clusterSize;
}

- (unint64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (NSUUID)lastWorkoutUUID
{
  return self->_lastWorkoutUUID;
}

- (NSDate)lastWorkoutDate
{
  return self->_lastWorkoutDate;
}

- (double)lastWorkoutDistance
{
  return self->_lastWorkoutDistance;
}

- (double)lastWorkoutDuration
{
  return self->_lastWorkoutDuration;
}

- (CLLocation)lastWorkoutStartingPoint
{
  return self->_lastWorkoutStartingPoint;
}

- (NSUUID)bestWorkoutUUID
{
  return self->_bestWorkoutUUID;
}

- (NSDate)bestWorkoutDate
{
  return self->_bestWorkoutDate;
}

- (double)bestWorkoutDistance
{
  return self->_bestWorkoutDistance;
}

- (double)bestWorkoutDuration
{
  return self->_bestWorkoutDuration;
}

- (NSData)workoutRouteSnapshot
{
  return self->_workoutRouteSnapshot;
}

- (NSString)workoutRouteLabel
{
  return self->_workoutRouteLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutRouteLabel, 0);
  objc_storeStrong((id *)&self->_workoutRouteSnapshot, 0);
  objc_storeStrong((id *)&self->_bestWorkoutDate, 0);
  objc_storeStrong((id *)&self->_bestWorkoutUUID, 0);
  objc_storeStrong((id *)&self->_lastWorkoutStartingPoint, 0);
  objc_storeStrong((id *)&self->_lastWorkoutDate, 0);
  objc_storeStrong((id *)&self->_lastWorkoutUUID, 0);
  objc_storeStrong((id *)&self->_workoutClusterUUID, 0);

  objc_storeStrong((id *)&self->_clusterUUID, 0);
}

@end