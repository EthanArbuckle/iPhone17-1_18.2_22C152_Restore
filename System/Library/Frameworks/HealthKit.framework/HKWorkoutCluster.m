@interface HKWorkoutCluster
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKWorkoutCluster)initWithCoder:(id)a3;
- (HKWorkoutCluster)initWithWorkoutUUIDs:(id)a3 lastWorkoutUUID:(id)a4 bestWorkoutUUID:(id)a5 relevanceValue:(double)a6 workoutRouteSnapshot:(id)a7 workoutRouteLabel:(id)a8;
- (NSArray)workoutUUIDs;
- (NSData)workoutRouteSnapshot;
- (NSString)workoutRouteLabel;
- (NSUUID)bestWorkoutUUID;
- (NSUUID)clusterUUID;
- (NSUUID)lastWorkoutUUID;
- (double)relevanceValue;
- (id)_initWithUUID:(id)a3 workoutUUIDs:(id)a4 lastWorkoutUUID:(id)a5 bestWorkoutUUID:(id)a6 relevanceValue:(double)a7 workoutRouteSnapshot:(id)a8 workoutRouteLabel:(id)a9;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKWorkoutCluster

- (HKWorkoutCluster)initWithWorkoutUUIDs:(id)a3 lastWorkoutUUID:(id)a4 bestWorkoutUUID:(id)a5 relevanceValue:(double)a6 workoutRouteSnapshot:(id)a7 workoutRouteLabel:(id)a8
{
  v14 = (void *)MEMORY[0x1E4F29128];
  id v15 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [v14 UUID];
  v21 = [(HKWorkoutCluster *)self _initWithUUID:v20 workoutUUIDs:v19 lastWorkoutUUID:v18 bestWorkoutUUID:v17 relevanceValue:v16 workoutRouteSnapshot:v15 workoutRouteLabel:a6];

  return v21;
}

- (id)_initWithUUID:(id)a3 workoutUUIDs:(id)a4 lastWorkoutUUID:(id)a5 bestWorkoutUUID:(id)a6 relevanceValue:(double)a7 workoutRouteSnapshot:(id)a8 workoutRouteLabel:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  v36.receiver = self;
  v36.super_class = (Class)HKWorkoutCluster;
  v22 = [(HKWorkoutCluster *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    clusterUUID = v22->_clusterUUID;
    v22->_clusterUUID = (NSUUID *)v23;

    uint64_t v25 = [v17 copy];
    workoutUUIDs = v22->_workoutUUIDs;
    v22->_workoutUUIDs = (NSArray *)v25;

    uint64_t v27 = [v18 copy];
    lastWorkoutUUID = v22->_lastWorkoutUUID;
    v22->_lastWorkoutUUID = (NSUUID *)v27;

    uint64_t v29 = [v19 copy];
    bestWorkoutUUID = v22->_bestWorkoutUUID;
    v22->_bestWorkoutUUID = (NSUUID *)v29;

    v22->_relevanceValue = a7;
    uint64_t v31 = [v20 copy];
    workoutRouteSnapshot = v22->_workoutRouteSnapshot;
    v22->_workoutRouteSnapshot = (NSData *)v31;

    uint64_t v33 = [v21 copy];
    workoutRouteLabel = v22->_workoutRouteLabel;
    v22->_workoutRouteLabel = (NSString *)v33;
  }
  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (double *)v4;
    if (self->_workoutUUIDs)
    {
      v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
    }
    else
    {
      v6 = 0;
    }
    if (*((void *)v5 + 2))
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
      v9 = (void *)v8;
      int v10 = 0;
      if (v6 && v8) {
        int v10 = [v6 isEqualToSet:v8] ^ 1;
      }
    }
    else
    {
      v9 = 0;
      int v10 = 0;
    }
    workoutRouteSnapshot = self->_workoutRouteSnapshot;
    if (workoutRouteSnapshot && *((void *)v5 + 6)) {
      int v12 = !-[NSData isEqualToData:](workoutRouteSnapshot, "isEqualToData:");
    }
    else {
      LOBYTE(v12) = 0;
    }
    BOOL v7 = (([(NSUUID *)self->_clusterUUID isEqual:*((void *)v5 + 1)] ^ 1 | v10) & 1) == 0
      && [(NSUUID *)self->_lastWorkoutUUID isEqual:*((void *)v5 + 3)]
      && [(NSUUID *)self->_bestWorkoutUUID isEqual:*((void *)v5 + 4)]
      && (self->_relevanceValue != v5[5] ? (char v13 = 1) : (char v13 = v12), (v13 & 1) == 0)
      && [(NSString *)self->_workoutRouteLabel isEqualToString:*((void *)v5 + 7)];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_clusterUUID hash];
  uint64_t v4 = [(NSArray *)self->_workoutUUIDs hash] ^ v3;
  uint64_t v5 = [(NSUUID *)self->_lastWorkoutUUID hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSUUID *)self->_bestWorkoutUUID hash];
  double relevanceValue = self->_relevanceValue;
  uint64_t v8 = *(void *)&relevanceValue ^ [(NSData *)self->_workoutRouteSnapshot hash];
  return v6 ^ v8 ^ [(NSString *)self->_workoutRouteLabel hash];
}

- (id)description
{
  unint64_t v3 = [(NSData *)self->_workoutRouteSnapshot length];
  if (self->_workoutRouteSnapshot)
  {
    uint64_t v4 = [NSString stringWithFormat:@"snapshot:%0.1lf kB, ", (double)v3 * 0.0009765625];
  }
  else
  {
    uint64_t v4 = &stru_1EEC60288;
  }
  if (self->_workoutUUIDs)
  {
    uint64_t v5 = [NSString stringWithFormat:@", workouts:%@", self->_workoutUUIDs];
  }
  else
  {
    uint64_t v5 = &stru_1EEC60288;
  }
  uint64_t v6 = [NSString stringWithFormat:@"<%@:%p uuid:%@, last:%@, best:%@, relevance:%f, %@label:'%@'%@>", objc_opt_class(), self, self->_clusterUUID, self->_lastWorkoutUUID, self->_bestWorkoutUUID, *(void *)&self->_relevanceValue, v4, self->_workoutRouteLabel, v5, 0];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkoutCluster)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKWorkoutCluster;
  uint64_t v5 = [(HKWorkoutCluster *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cluster_uuid"];
    clusterUUID = v5->_clusterUUID;
    v5->_clusterUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"last_workout"];
    lastWorkoutUUID = v5->_lastWorkoutUUID;
    v5->_lastWorkoutUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"best_workout"];
    bestWorkoutUUID = v5->_bestWorkoutUUID;
    v5->_bestWorkoutUUID = (NSUUID *)v10;

    [v4 decodeDoubleForKey:@"relevance"];
    v5->_double relevanceValue = v12;
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"route_snapshot"];
    workoutRouteSnapshot = v5->_workoutRouteSnapshot;
    v5->_workoutRouteSnapshot = (NSData *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"route_label"];
    workoutRouteLabel = v5->_workoutRouteLabel;
    v5->_workoutRouteLabel = (NSString *)v15;

    id v17 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"workout_uuids"];
    uint64_t v18 = objc_msgSend(v17, "hk_map:", &__block_literal_global_24);
    workoutUUIDs = v5->_workoutUUIDs;
    v5->_workoutUUIDs = (NSArray *)v18;
  }
  return v5;
}

id __34__HKWorkoutCluster_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  clusterUUID = self->_clusterUUID;
  id v5 = a3;
  [v5 encodeObject:clusterUUID forKey:@"cluster_uuid"];
  [v5 encodeObject:self->_lastWorkoutUUID forKey:@"last_workout"];
  [v5 encodeObject:self->_bestWorkoutUUID forKey:@"best_workout"];
  [v5 encodeDouble:@"relevance" forKey:self->_relevanceValue];
  [v5 encodeObject:self->_workoutRouteSnapshot forKey:@"route_snapshot"];
  [v5 encodeObject:self->_workoutRouteLabel forKey:@"route_label"];
  id v6 = [(NSArray *)self->_workoutUUIDs hk_map:&__block_literal_global_37];
  [v5 encodeObject:v6 forKey:@"workout_uuids"];
}

uint64_t __36__HKWorkoutCluster_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (NSUUID)clusterUUID
{
  return self->_clusterUUID;
}

- (NSArray)workoutUUIDs
{
  return self->_workoutUUIDs;
}

- (NSUUID)lastWorkoutUUID
{
  return self->_lastWorkoutUUID;
}

- (NSUUID)bestWorkoutUUID
{
  return self->_bestWorkoutUUID;
}

- (double)relevanceValue
{
  return self->_relevanceValue;
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
  objc_storeStrong((id *)&self->_bestWorkoutUUID, 0);
  objc_storeStrong((id *)&self->_lastWorkoutUUID, 0);
  objc_storeStrong((id *)&self->_workoutUUIDs, 0);

  objc_storeStrong((id *)&self->_clusterUUID, 0);
}

@end