@interface RTTripSegmentFormOfWay
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDateInterval)dateInterval;
- (RTDistanceInterval)distanceInterval;
- (RTTripSegmentFormOfWay)initWithCoder:(id)a3;
- (RTTripSegmentFormOfWay)initWithDateInterval:(id)a3 distanceInterval:(id)a4 geoFormOfWay:(int64_t)a5;
- (id)description;
- (int64_t)geoFormOfWay;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTTripSegmentFormOfWay

- (RTTripSegmentFormOfWay)initWithDateInterval:(id)a3 distanceInterval:(id)a4 geoFormOfWay:(int64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (!v9)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v15 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: dateInterval";
LABEL_14:
    _os_log_error_impl(&dword_1A8FEF000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_11;
  }
  if (!v10)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: distanceInterval";
    goto LABEL_14;
  }
  v19.receiver = self;
  v19.super_class = (Class)RTTripSegmentFormOfWay;
  v12 = [(RTTripSegmentFormOfWay *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dateInterval, a3);
    objc_storeStrong((id *)&v13->_distanceInterval, a4);
    v13->_geoFormOfWay = a5;
    v14 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_debug_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_DEBUG, "tripSegmentFormOfWay, %@", buf, 0xCu);
    }
  }
  self = v13;
  v15 = self;
LABEL_12:

  return v15;
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
  [v5 encodeInt64:self->_geoFormOfWay forKey:@"geoFormOfWay"];
}

- (RTTripSegmentFormOfWay)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"distanceInterval"];
  int v7 = [v4 decodeIntForKey:@"geoFormOfWay"];

  v8 = [(RTTripSegmentFormOfWay *)self initWithDateInterval:v5 distanceInterval:v6 geoFormOfWay:v7];
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

  int64_t geoFormOfWay = self->_geoFormOfWay;
  uint64_t v13 = [v4 geoFormOfWay];

  if (geoFormOfWay == v13) {
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
  v6 = [v3 stringWithFormat:@"dateInterval,%@,distanceInterval,%@,geoFormOfWay,%lu", v4, v5, self->_geoFormOfWay];

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

- (int64_t)geoFormOfWay
{
  return self->_geoFormOfWay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceInterval, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end