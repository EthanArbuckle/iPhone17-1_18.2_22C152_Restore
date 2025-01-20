@interface RTTripSegment
+ (BOOL)supportsSecureCoding;
+ (id)mergeTripSegment:(id)a3 other:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDateInterval)dateInterval;
- (NSUUID)identifier;
- (RTTripSegment)initWithCoder:(id)a3;
- (RTTripSegment)initWithTripSegmentIdentifier:(id)a3 dateInterval:(id)a4 tripDistance:(double)a5 tripDistanceUncertainty:(double)a6 modeOfTransportation:(int64_t)a7;
- (double)tripDistance;
- (double)tripDistanceUncertainty;
- (id)description;
- (int64_t)modeOfTransportation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTTripSegment

- (RTTripSegment)initWithTripSegmentIdentifier:(id)a3 dateInterval:(id)a4 tripDistance:(double)a5 tripDistanceUncertainty:(double)a6 modeOfTransportation:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  if (v13)
  {
    v20.receiver = self;
    v20.super_class = (Class)RTTripSegment;
    v15 = [(RTTripSegment *)&v20 init];
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_identifier, a3);
      objc_storeStrong((id *)&v16->_dateInterval, a4);
      v16->_tripDistance = a5;
      v16->_tripDistanceUncertainty = a6;
      v16->_modeOfTransportation = a7;
    }
    self = v16;
    v17 = self;
  }
  else
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v17 = 0;
  }

  return v17;
}

+ (id)mergeTripSegment:(id)a3 other:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 tripDistance];
  double v8 = v7;
  [v6 tripDistance];
  if (v8 <= v9) {
    v10 = v6;
  }
  else {
    v10 = v5;
  }
  v11 = [v10 identifier];
  v12 = [v5 dateInterval];
  id v13 = [v12 startDate];
  id v14 = [v6 dateInterval];
  v15 = [v14 startDate];
  v16 = [v13 earlierDate:v15];

  v17 = [v5 dateInterval];
  v18 = [v17 endDate];
  v19 = [v6 dateInterval];
  objc_super v20 = [v19 endDate];
  v21 = [v18 laterDate:v20];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v16 endDate:v21];
  [v5 tripDistance];
  double v24 = v23;
  [v6 tripDistance];
  if (v24 <= v25) {
    v26 = v6;
  }
  else {
    v26 = v5;
  }
  uint64_t v27 = [v26 modeOfTransportation];
  [v5 tripDistance];
  double v29 = v28;
  [v5 tripDistanceUncertainty];
  double v31 = v29 * v30;
  [v5 tripDistanceUncertainty];
  double v33 = v32;
  [v6 tripDistance];
  double v35 = v34;
  [v6 tripDistanceUncertainty];
  double v37 = v35 * v36;
  [v6 tripDistanceUncertainty];
  double v39 = v37 * v38 + v31 * v33;
  [v5 tripDistance];
  double v41 = v40;
  [v6 tripDistance];
  double v43 = sqrt(v39 / (v41 + v42));
  [v5 tripDistance];
  double v45 = v44;
  [v6 tripDistance];
  v47 = [[RTTripSegment alloc] initWithTripSegmentIdentifier:v11 dateInterval:v22 tripDistance:v27 tripDistanceUncertainty:v45 + v46 modeOfTransportation:v43];

  return v47;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"tripSegmentIdentifier"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v5 encodeDouble:@"tripDistance" forKey:self->_tripDistance];
  [v5 encodeDouble:@"tripDistanceUncertainty" forKey:self->_tripDistanceUncertainty];
  [v5 encodeInteger:self->_modeOfTransportation forKey:@"modeOfTransportation"];
}

- (RTTripSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tripSegmentIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  [v4 decodeDoubleForKey:@"tripDistance"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"tripDistanceUncertainty"];
  double v10 = v9;
  uint64_t v11 = [v4 decodeIntegerForKey:@"modeOfTransportation"];

  v12 = [(RTTripSegment *)self initWithTripSegmentIdentifier:v5 dateInterval:v6 tripDistance:v11 tripDistanceUncertainty:v8 modeOfTransportation:v10];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isMemberOfClass:objc_opt_class()];
  identifier = self->_identifier;
  double v7 = [v4 identifier];
  LOBYTE(identifier) = [(NSUUID *)identifier isEqual:v7];

  dateInterval = self->_dateInterval;
  double v9 = [v4 dateInterval];
  LOBYTE(dateInterval) = [(NSDateInterval *)dateInterval isEqual:v9];

  double tripDistance = self->_tripDistance;
  [v4 tripDistance];
  double v12 = v11;
  double tripDistanceUncertainty = self->_tripDistanceUncertainty;
  [v4 tripDistanceUncertainty];
  double v15 = v14;
  int64_t modeOfTransportation = self->_modeOfTransportation;
  uint64_t v17 = [v4 modeOfTransportation];

  char v18 = v5 & identifier & dateInterval;
  if (tripDistance != v12) {
    char v18 = 0;
  }
  if (tripDistanceUncertainty != v15) {
    char v18 = 0;
  }
  if (modeOfTransportation == v17) {
    return v18;
  }
  else {
    return 0;
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NSUUID *)self->_identifier UUIDString];
  uint64_t v5 = [v4 UTF8String];
  id v6 = [(NSDateInterval *)self->_dateInterval description];
  double v7 = [v3 stringWithFormat:@"UUID,%s,dateInterval,%@,tripDistance,%.1f,tripDistanceUncertainty,%.1f,modeOfTransportation,%llu", v5, v6, *(void *)&self->_tripDistance, *(void *)&self->_tripDistanceUncertainty, self->_modeOfTransportation];

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (double)tripDistance
{
  return self->_tripDistance;
}

- (double)tripDistanceUncertainty
{
  return self->_tripDistanceUncertainty;
}

- (int64_t)modeOfTransportation
{
  return self->_modeOfTransportation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end