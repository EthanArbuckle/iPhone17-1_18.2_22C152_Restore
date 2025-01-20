@interface RTTripSegmentLocationType
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDateInterval)dateInterval;
- (RTDistanceInterval)distanceInterval;
- (RTTripSegmentLocationType)initWithCoder:(id)a3;
- (RTTripSegmentLocationType)initWithDateInterval:(id)a3 distanceInterval:(id)a4 locationType:(int64_t)a5;
- (id)description;
- (int64_t)locationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTTripSegmentLocationType

- (RTTripSegmentLocationType)initWithDateInterval:(id)a3 distanceInterval:(id)a4 locationType:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTTripSegmentLocationType;
    v11 = [(RTTripSegmentLocationType *)&v17 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_dateInterval, a3);
      objc_storeStrong((id *)&v12->_distanceInterval, a4);
      v12->_locationType = a5;
      v13 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v12;
        _os_log_debug_impl(&dword_1A8FEF000, v13, OS_LOG_TYPE_DEBUG, "tripSegmentLocationType, %@", buf, 0xCu);
      }
    }
    self = v12;
    v14 = self;
  }
  else
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_distanceInterval forKey:@"distanceInterval"];
  [v5 encodeInt64:self->_locationType forKey:@"locationType"];
}

- (RTTripSegmentLocationType)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"distanceInterval"];
  int v7 = [v4 decodeIntForKey:@"locationType"];

  v8 = [(RTTripSegmentLocationType *)self initWithDateInterval:v5 distanceInterval:v6 locationType:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isMemberOfClass:objc_opt_class()];
  dateInterval = self->_dateInterval;
  int v7 = [v4 dateInterval];
  char v8 = [(NSDateInterval *)dateInterval isEqual:v7];

  distanceInterval = self->_distanceInterval;
  id v10 = [v4 distanceInterval];
  BOOL v11 = [(RTDistanceInterval *)distanceInterval isEqual:v10];

  int64_t locationType = self->_locationType;
  uint64_t v13 = [v4 locationType];

  if (locationType == v13) {
    BOOL v14 = v8;
  }
  else {
    BOOL v14 = 0;
  }
  if (!v11) {
    BOOL v14 = 0;
  }
  return v5 && v14;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NSDateInterval *)self->_dateInterval description];
  int v5 = [(RTDistanceInterval *)self->_distanceInterval description];
  v6 = [v3 stringWithFormat:@"dateInterval,%@,distanceInterval,%@,locationType,%ld", v4, v5, self->_locationType];

  return v6;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (RTDistanceInterval)distanceInterval
{
  return self->_distanceInterval;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceInterval, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end