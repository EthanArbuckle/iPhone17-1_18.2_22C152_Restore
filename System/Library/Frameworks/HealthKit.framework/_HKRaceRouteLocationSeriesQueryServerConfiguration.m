@interface _HKRaceRouteLocationSeriesQueryServerConfiguration
+ (BOOL)supportsSecureCoding;
- (NSUUID)clusterUUID;
- (NSUUID)workoutUUID;
- (_HKRaceRouteLocationSeriesQueryServerConfiguration)initWithCoder:(id)a3;
- (double)timestampAnchor;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)limit;
- (unint64_t)workoutSelection;
- (void)encodeWithCoder:(id)a3;
- (void)setClusterUUID:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setTimestampAnchor:(double)a3;
- (void)setWorkoutSelection:(unint64_t)a3;
- (void)setWorkoutUUID:(id)a3;
@end

@implementation _HKRaceRouteLocationSeriesQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_HKRaceRouteLocationSeriesQueryServerConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v6 copyWithZone:a3];
  [v4 setClusterUUID:self->_clusterUUID];
  [v4 setWorkoutSelection:self->_workoutSelection];
  [v4 setWorkoutUUID:self->_workoutUUID];
  [v4 setTimestampAnchor:self->_timestampAnchor];
  [v4 setLimit:self->_limit];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKRaceRouteLocationSeriesQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKRaceRouteLocationSeriesQueryServerConfiguration;
  v5 = [(HKQueryServerConfiguration *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cluster_uuid"];
    clusterUUID = v5->_clusterUUID;
    v5->_clusterUUID = (NSUUID *)v6;

    v5->_workoutSelection = [v4 decodeIntegerForKey:@"workout_selection"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workout_uuid"];
    workoutUUID = v5->_workoutUUID;
    v5->_workoutUUID = (NSUUID *)v8;

    [v4 decodeDoubleForKey:@"timestamp_anchor"];
    v5->_timestampAnchor = v10;
    v5->_limit = [v4 decodeIntegerForKey:@"limit"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKRaceRouteLocationSeriesQueryServerConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_clusterUUID, @"cluster_uuid", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_workoutSelection forKey:@"workout_selection"];
  [v4 encodeObject:self->_workoutUUID forKey:@"workout_uuid"];
  [v4 encodeDouble:@"timestamp_anchor" forKey:self->_timestampAnchor];
  [v4 encodeInteger:self->_limit forKey:@"limit"];
}

- (NSUUID)clusterUUID
{
  return self->_clusterUUID;
}

- (void)setClusterUUID:(id)a3
{
}

- (unint64_t)workoutSelection
{
  return self->_workoutSelection;
}

- (void)setWorkoutSelection:(unint64_t)a3
{
  self->_workoutSelection = a3;
}

- (NSUUID)workoutUUID
{
  return self->_workoutUUID;
}

- (void)setWorkoutUUID:(id)a3
{
}

- (double)timestampAnchor
{
  return self->_timestampAnchor;
}

- (void)setTimestampAnchor:(double)a3
{
  self->_timestampAnchor = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutUUID, 0);

  objc_storeStrong((id *)&self->_clusterUUID, 0);
}

@end