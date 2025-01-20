@interface RTPlaceInferenceOptions
+ (BOOL)supportsSecureCoding;
+ (id)fidelityPolicyMaskToString:(unint64_t)a3;
- (BOOL)useBackground;
- (NSArray)accessPoints;
- (NSArray)locations;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)clientIdentifier;
- (RTLocation)location;
- (RTPlaceInferenceOptions)init;
- (RTPlaceInferenceOptions)initWithCoder:(id)a3;
- (RTPlaceInferenceOptions)initWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5;
- (RTPlaceInferenceOptions)initWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5 clientIdentifier:(id)a6;
- (RTPlaceInferenceOptions)initWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5 distance:(double)a6 location:(id)a7 startDate:(id)a8 endDate:(id)a9 limit:(int64_t)a10 useBackground:(BOOL)a11 clientIdentifier:(id)a12;
- (RTPlaceInferenceOptions)initWithinDistance:(double)a3 location:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (RTPlaceInferenceOptions)initWithinDistance:(double)a3 location:(id)a4 startDate:(id)a5 endDate:(id)a6 clientIdentifier:(id)a7;
- (double)distance;
- (id)description;
- (int64_t)limit;
- (unint64_t)fidelityPolicy;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTPlaceInferenceOptions

- (unint64_t)fidelityPolicy
{
  return self->_fidelityPolicy;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSArray)accessPoints
{
  return self->_accessPoints;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  unint64_t fidelityPolicy = self->_fidelityPolicy;
  id v9 = a3;
  v6 = [v4 numberWithUnsignedInteger:fidelityPolicy];
  [v9 encodeObject:v6 forKey:@"policy"];

  [v9 encodeObject:self->_locations forKey:@"locations"];
  [v9 encodeObject:self->_accessPoints forKey:@"accessPoints"];
  v7 = [NSNumber numberWithDouble:self->_distance];
  [v9 encodeObject:v7 forKey:@"distance"];

  [v9 encodeObject:self->_location forKey:@"location"];
  [v9 encodeObject:self->_startDate forKey:@"startDate"];
  [v9 encodeObject:self->_endDate forKey:@"endDate"];
  v8 = [NSNumber numberWithInteger:self->_limit];
  [v9 encodeObject:v8 forKey:@"limit"];

  [v9 encodeBool:self->_useBackground forKey:@"useBackground"];
  [v9 encodeObject:self->_clientIdentifier forKey:@"clientIdentifier"];
}

- (RTPlaceInferenceOptions)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"policy"];
  uint64_t v5 = [v4 unsignedIntegerValue];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v3 decodeObjectOfClasses:v8 forKey:@"locations"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v3 decodeObjectOfClasses:v12 forKey:@"accessPoints"];

  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"distance"];
  [v14 doubleValue];
  double v16 = v15;

  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"limit"];
  uint64_t v21 = [v20 integerValue];

  LOBYTE(v20) = [v3 decodeBoolForKey:@"useBackground"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];

  LOBYTE(v25) = (_BYTE)v20;
  v23 = [(RTPlaceInferenceOptions *)self initWithFidelityPolicy:v5 locations:v9 accessPoints:v13 distance:v17 location:v18 startDate:v19 endDate:v16 limit:v21 useBackground:v25 clientIdentifier:v22];

  return v23;
}

- (RTPlaceInferenceOptions)initWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5 clientIdentifier:(id)a6
{
  LOBYTE(v7) = 1;
  return [(RTPlaceInferenceOptions *)self initWithFidelityPolicy:a3 locations:a4 accessPoints:a5 distance:0 location:0 startDate:0 endDate:0.0 limit:-1 useBackground:v7 clientIdentifier:a6];
}

- (RTPlaceInferenceOptions)initWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5 distance:(double)a6 location:(id)a7 startDate:(id)a8 endDate:(id)a9 limit:(int64_t)a10 useBackground:(BOOL)a11 clientIdentifier:(id)a12
{
  id v30 = a4;
  id v29 = a5;
  id v28 = a7;
  id v27 = a8;
  id v20 = a9;
  id v21 = a12;
  if (a3 >= 0x40)
  {
    uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: RTFidelityPolicyMaskValid(policy)", buf, 2u);
    }

    v24 = 0;
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)RTPlaceInferenceOptions;
    v22 = [(RTPlaceInferenceOptions *)&v31 init];
    v23 = v22;
    if (v22)
    {
      v22->_unint64_t fidelityPolicy = a3;
      objc_storeStrong((id *)&v22->_locations, a4);
      objc_storeStrong((id *)&v23->_accessPoints, a5);
      v23->_distance = a6;
      objc_storeStrong((id *)&v23->_location, a7);
      objc_storeStrong((id *)&v23->_startDate, a8);
      objc_storeStrong((id *)&v23->_endDate, a9);
      v23->_limit = a10;
      v23->_useBackground = a11;
      objc_storeStrong((id *)&v23->_clientIdentifier, a12);
    }
    self = v23;
    v24 = self;
  }

  return v24;
}

- (RTLocation)location
{
  return self->_location;
}

- (double)distance
{
  return self->_distance;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)limit
{
  return self->_limit;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

- (BOOL)useBackground
{
  return self->_useBackground;
}

- (RTPlaceInferenceOptions)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithFidelityPolicy_locations_accessPoints_distance_location_startDate_endDate_limit_useBackground_clientIdentifier_);
}

- (RTPlaceInferenceOptions)initWithFidelityPolicy:(unint64_t)a3 locations:(id)a4 accessPoints:(id)a5
{
  LOBYTE(v6) = 1;
  return [(RTPlaceInferenceOptions *)self initWithFidelityPolicy:a3 locations:a4 accessPoints:a5 distance:0 location:0 startDate:0 endDate:0.0 limit:-1 useBackground:v6 clientIdentifier:0];
}

- (RTPlaceInferenceOptions)initWithinDistance:(double)a3 location:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  return [(RTPlaceInferenceOptions *)self initWithinDistance:a4 location:a5 startDate:a6 endDate:0 clientIdentifier:a3];
}

- (RTPlaceInferenceOptions)initWithinDistance:(double)a3 location:(id)a4 startDate:(id)a5 endDate:(id)a6 clientIdentifier:(id)a7
{
  LOBYTE(v8) = 1;
  return [(RTPlaceInferenceOptions *)self initWithFidelityPolicy:4 locations:0 accessPoints:0 distance:a4 location:a5 startDate:a6 endDate:a3 limit:-1 useBackground:v8 clientIdentifier:a7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fidelityPolicyMaskToString:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = v5;
  if (!a3)
  {
    uint64_t v7 = @"Local";
LABEL_16:
    [v6 addObject:v7];
    goto LABEL_17;
  }
  if (a3)
  {
    [v5 addObject:@"Network"];
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_12;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  [v6 addObject:@"High Fidelity Location"];
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v6 addObject:@"Fallback"];
  if ((a3 & 8) == 0)
  {
LABEL_6:
    if ((a3 & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    [v6 addObject:@"Skip Labelling"];
    if ((a3 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_13:
  [v6 addObject:@"Best Reference Location"];
  if ((a3 & 0x10) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((a3 & 0x20) != 0)
  {
LABEL_15:
    uint64_t v7 = @"Blue POI Only";
    goto LABEL_16;
  }
LABEL_17:
  if (![v6 count])
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      int v12 = 138413058;
      v13 = v11;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2080;
      v17 = "+[RTPlaceInferenceOptions fidelityPolicyMaskToString:]";
      __int16 v18 = 1024;
      int v19 = 232;
      _os_log_error_impl(&dword_1A8FEF000, v8, OS_LOG_TYPE_ERROR, "%@ does not handle RTFidelityPolicyMask, %lu (in %s:%d)", (uint8_t *)&v12, 0x26u);
    }
  }
  if ([v6 count])
  {
    id v9 = [v6 componentsJoinedByString:@" + "];
  }
  else
  {
    id v9 = &stru_1EFF84648;
  }

  return v9;
}

- (id)description
{
  id v3 = NSString;
  v4 = [(id)objc_opt_class() fidelityPolicyMaskToString:self->_fidelityPolicy];
  NSUInteger v5 = [(NSArray *)self->_locations count];
  uint64_t v6 = [(NSArray *)self->_locations lastObject];
  NSUInteger v7 = [(NSArray *)self->_accessPoints count];
  uint64_t v8 = [(NSArray *)self->_accessPoints lastObject];
  location = self->_location;
  double distance = self->_distance;
  uint64_t v11 = [(NSDate *)self->_startDate stringFromDate];
  uint64_t v12 = [(NSDate *)self->_endDate stringFromDate];
  v13 = (void *)v12;
  if (self->_useBackground) {
    __int16 v14 = @"YES";
  }
  else {
    __int16 v14 = @"NO";
  }
  unint64_t v15 = [v3 stringWithFormat:@"fidelityPolicy, %@, locations count, %lu, last location, %@, accessPoints count, %lu, last accessPoint, %@, location, %@, distance, %f, startDate, %@, endDate, %@, limit, %ld, useBackground, %@, clientIdentifier, %@", v4, v5, v6, v7, v8, location, *(void *)&distance, v11, v12, self->_limit, v14, self->_clientIdentifier];

  return v15;
}

@end