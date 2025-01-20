@interface RTTripSegmentMetadataFetchOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)fetchFormOfWay;
- (BOOL)fetchLocationType;
- (BOOL)fetchPreferredNames;
- (BOOL)fetchRoadClass;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFetchOptions:(id)a3;
- (NSDateInterval)dateInterval;
- (RTTripSegmentMetadataFetchOptions)init;
- (RTTripSegmentMetadataFetchOptions)initWithCoder:(id)a3;
- (RTTripSegmentMetadataFetchOptions)initWithDateInterval:(id)a3 fetchRoadClass:(BOOL)a4 fetchFormOfWay:(BOOL)a5 fetchLocationType:(BOOL)a6 fetchPreferredNames:(BOOL)a7;
- (RTTripSegmentMetadataFetchOptions)initWithTripSegment:(id)a3;
- (RTTripSegmentMetadataFetchOptions)initWithTripSegment:(id)a3 fetchRoadClass:(BOOL)a4 fetchFormOfWay:(BOOL)a5 fetchLocationType:(BOOL)a6 fetchPreferredNames:(BOOL)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTTripSegmentMetadataFetchOptions

- (RTTripSegmentMetadataFetchOptions)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithTripSegment_);
}

- (RTTripSegmentMetadataFetchOptions)initWithDateInterval:(id)a3 fetchRoadClass:(BOOL)a4 fetchFormOfWay:(BOOL)a5 fetchLocationType:(BOOL)a6 fetchPreferredNames:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTTripSegmentMetadataFetchOptions;
  v15 = [(RTTripSegmentMetadataFetchOptions *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_dateInterval, a3);
    v16->_fetchRoadClass = v10;
    v16->_fetchFormOfWay = v9;
    v16->_fetchLocationType = v8;
    v16->_fetchPreferredNames = v7;
    v17 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      v21 = NSStringFromSelector(a2);
      v22 = [v14 description];
      *(_DWORD *)buf = 138413826;
      v25 = v20;
      __int16 v26 = 2112;
      v27 = v21;
      __int16 v28 = 2112;
      v29 = v22;
      __int16 v30 = 1024;
      BOOL v31 = v10;
      __int16 v32 = 1024;
      BOOL v33 = v9;
      __int16 v34 = 1024;
      BOOL v35 = v8;
      __int16 v36 = 1024;
      BOOL v37 = v7;
      _os_log_debug_impl(&dword_1A8FEF000, v17, OS_LOG_TYPE_DEBUG, "%@ %@, dateInterval,%@,fetchRoadClass,%d,fetchFormOfWay,%d,fetchLocationType,%d,fetchPreferredNames,%d", buf, 0x38u);
    }
  }

  return v16;
}

- (RTTripSegmentMetadataFetchOptions)initWithTripSegment:(id)a3 fetchRoadClass:(BOOL)a4 fetchFormOfWay:(BOOL)a5 fetchLocationType:(BOOL)a6 fetchPreferredNames:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  v12 = [a3 dateInterval];
  v13 = [(RTTripSegmentMetadataFetchOptions *)self initWithDateInterval:v12 fetchRoadClass:v10 fetchFormOfWay:v9 fetchLocationType:v8 fetchPreferredNames:v7];

  return v13;
}

- (RTTripSegmentMetadataFetchOptions)initWithTripSegment:(id)a3
{
  v4 = [a3 dateInterval];
  v5 = [(RTTripSegmentMetadataFetchOptions *)self initWithDateInterval:v4 fetchRoadClass:1 fetchFormOfWay:1 fetchLocationType:1 fetchPreferredNames:1];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTTripSegmentMetadataFetchOptions *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTTripSegmentMetadataFetchOptions *)self isEqualToFetchOptions:v5];

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  dateInterval = self->_dateInterval;
  if (!dateInterval)
  {
    v3 = [v5 dateInterval];
    if (v3)
    {
      if (self->_dateInterval) {
        goto LABEL_2;
      }
      char v12 = 0;
    }
    else
    {
      char v12 = 1;
    }
LABEL_11:

    goto LABEL_12;
  }
LABEL_2:
  uint64_t v8 = [v6 dateInterval];
  if (v8)
  {
    BOOL v9 = (void *)v8;
    BOOL v10 = self->_dateInterval;
    v11 = [v6 dateInterval];
    char v12 = [(NSDateInterval *)v10 isEqualToDateInterval:v11];

    if (!dateInterval) {
      goto LABEL_11;
    }
  }
  else
  {
    char v12 = 0;
    if (!dateInterval) {
      goto LABEL_11;
    }
  }
LABEL_12:
  int fetchRoadClass = self->_fetchRoadClass;
  if (fetchRoadClass == [v6 fetchRoadClass]
    && (int fetchFormOfWay = self->_fetchFormOfWay, fetchFormOfWay == [v6 fetchFormOfWay])
    && (int fetchLocationType = self->_fetchLocationType,
        fetchLocationType == [v6 fetchLocationType]))
  {
    int fetchPreferredNames = self->_fetchPreferredNames;
    BOOL v17 = fetchPreferredNames == [v6 fetchPreferredNames];
  }
  else
  {
    BOOL v17 = 0;
  }
  BOOL v18 = v12 & v17;

  return v18;
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
  [v5 encodeBool:self->_fetchRoadClass forKey:@"fetchRoadClass"];
  [v5 encodeBool:self->_fetchFormOfWay forKey:@"fetchFormOfWay"];
  [v5 encodeBool:self->_fetchLocationType forKey:@"fetchLocationType"];
  [v5 encodeBool:self->_fetchPreferredNames forKey:@"fetchPreferredNames"];
}

- (RTTripSegmentMetadataFetchOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  uint64_t v6 = [v4 decodeBoolForKey:@"fetchRoadClass"];
  uint64_t v7 = [v4 decodeBoolForKey:@"fetchFormOfWay"];
  uint64_t v8 = [v4 decodeBoolForKey:@"fetchLocationType"];
  uint64_t v9 = [v4 decodeBoolForKey:@"fetchPreferredNames"];

  BOOL v10 = [(RTTripSegmentMetadataFetchOptions *)self initWithDateInterval:v5 fetchRoadClass:v6 fetchFormOfWay:v7 fetchLocationType:v8 fetchPreferredNames:v9];
  return v10;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (BOOL)fetchRoadClass
{
  return self->_fetchRoadClass;
}

- (BOOL)fetchFormOfWay
{
  return self->_fetchFormOfWay;
}

- (BOOL)fetchLocationType
{
  return self->_fetchLocationType;
}

- (BOOL)fetchPreferredNames
{
  return self->_fetchPreferredNames;
}

- (void).cxx_destruct
{
}

@end