@interface RTLocationsForTripSegmentFetchOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFetchOptions:(id)a3;
- (CLLocation)boundingBoxLocation;
- (NSDateInterval)dateInterval;
- (RTLocationsForTripSegmentFetchOptions)init;
- (RTLocationsForTripSegmentFetchOptions)initWithCoder:(id)a3;
- (RTLocationsForTripSegmentFetchOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4 boundingBoxLocation:(id)a5 batchSize:(unint64_t)a6 offset:(unint64_t)a7;
- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3;
- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3 preferredDownsamplingLevel:(int64_t)a4;
- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3 preferredDownsamplingLevel:(int64_t)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6;
- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3 preferredDownsamplingLevel:(int64_t)a4 boundingBoxLocation:(id)a5 batchSize:(unint64_t)a6 offset:(unint64_t)a7;
- (int64_t)preferredDownsamplingLevel;
- (unint64_t)batchSize;
- (unint64_t)offset;
- (void)encodeWithCoder:(id)a3;
- (void)setBoundingBoxLocation:(id)a3;
- (void)setPreferredDownsamplingLevel:(int64_t)a3;
@end

@implementation RTLocationsForTripSegmentFetchOptions

- (RTLocationsForTripSegmentFetchOptions)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithTripSegment_preferredDownsamplingLevel_boundingBoxLocation_batchSize_offset_);
}

- (RTLocationsForTripSegmentFetchOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4 boundingBoxLocation:(id)a5 batchSize:(unint64_t)a6 offset:(unint64_t)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  v24.receiver = self;
  v24.super_class = (Class)RTLocationsForTripSegmentFetchOptions;
  v16 = [(RTLocationsForTripSegmentFetchOptions *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_dateInterval, a3);
    v17->_preferredDownsamplingLevel = a4;
    objc_storeStrong((id *)&v17->_boundingBoxLocation, a5);
    v17->_batchSize = a6;
    v17->_offset = a7;
    v18 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      v22 = NSStringFromSelector(a2);
      v23 = [v14 description];
      *(_DWORD *)buf = 138413570;
      v26 = v21;
      __int16 v27 = 2112;
      v28 = v22;
      __int16 v29 = 2112;
      v30 = v23;
      __int16 v31 = 2048;
      int64_t v32 = a4;
      __int16 v33 = 2048;
      unint64_t v34 = a6;
      __int16 v35 = 2048;
      unint64_t v36 = a7;
      _os_log_debug_impl(&dword_1A8FEF000, v18, OS_LOG_TYPE_DEBUG, "%@ %@, dateInterval, %@,preferredDownsamplingLevel,%ld,batchSize,%lu,offset,%lu.", buf, 0x3Eu);
    }
  }

  return v17;
}

- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3 preferredDownsamplingLevel:(int64_t)a4 boundingBoxLocation:(id)a5 batchSize:(unint64_t)a6 offset:(unint64_t)a7
{
  id v12 = a5;
  v13 = [a3 dateInterval];
  id v14 = [(RTLocationsForTripSegmentFetchOptions *)self initWithDateInterval:v13 preferredDownsamplingLevel:a4 boundingBoxLocation:v12 batchSize:a6 offset:a7];

  return v14;
}

- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3 preferredDownsamplingLevel:(int64_t)a4 batchSize:(unint64_t)a5 offset:(unint64_t)a6
{
  v10 = [a3 dateInterval];
  v11 = [(RTLocationsForTripSegmentFetchOptions *)self initWithDateInterval:v10 preferredDownsamplingLevel:a4 boundingBoxLocation:0 batchSize:a5 offset:a6];

  return v11;
}

- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3 preferredDownsamplingLevel:(int64_t)a4
{
  v6 = [a3 dateInterval];
  v7 = [(RTLocationsForTripSegmentFetchOptions *)self initWithDateInterval:v6 preferredDownsamplingLevel:a4 boundingBoxLocation:0 batchSize:0 offset:0];

  return v7;
}

- (RTLocationsForTripSegmentFetchOptions)initWithTripSegment:(id)a3
{
  v4 = [a3 dateInterval];
  v5 = [(RTLocationsForTripSegmentFetchOptions *)self initWithDateInterval:v4 preferredDownsamplingLevel:0 boundingBoxLocation:0 batchSize:0 offset:0];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTLocationsForTripSegmentFetchOptions *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTLocationsForTripSegmentFetchOptions *)self isEqualToFetchOptions:v5];

  return v6;
}

- (BOOL)isEqualToFetchOptions:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  dateInterval = self->_dateInterval;
  if (dateInterval) {
    goto LABEL_2;
  }
  v3 = [v5 dateInterval];
  if (!v3)
  {
    int v12 = 1;
    goto LABEL_11;
  }
  if (self->_dateInterval)
  {
LABEL_2:
    uint64_t v8 = [v6 dateInterval];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = self->_dateInterval;
      v11 = [v6 dateInterval];
      int v12 = [(NSDateInterval *)v10 isEqualToDateInterval:v11];

      if (dateInterval) {
        goto LABEL_12;
      }
    }
    else
    {
      int v12 = 0;
      if (dateInterval) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    int v12 = 0;
  }
LABEL_11:

  if (!self->_batchSize)
  {
    if (![v6 batchSize])
    {
      BOOL v14 = 1;
      goto LABEL_19;
    }
    if (!self->_batchSize) {
      goto LABEL_17;
    }
  }
LABEL_12:
  if ([v6 batchSize])
  {
    unint64_t batchSize = self->_batchSize;
    BOOL v14 = batchSize == [v6 batchSize];
  }
  else
  {
LABEL_17:
    BOOL v14 = 0;
  }
LABEL_19:
  if (!self->_offset)
  {
    if (![v6 offset])
    {
      LOBYTE(offset) = 1;
      if (v12) {
        goto LABEL_28;
      }
      goto LABEL_30;
    }
    unint64_t offset = self->_offset;
    if (!offset)
    {
LABEL_27:
      if (v12) {
        goto LABEL_28;
      }
LABEL_30:
      BOOL v17 = 0;
      goto LABEL_31;
    }
  }
  if (![v6 offset])
  {
    LOBYTE(offset) = 0;
    goto LABEL_27;
  }
  unint64_t v15 = self->_offset;
  LOBYTE(offset) = v15 == [v6 offset];
  if (!v12) {
    goto LABEL_30;
  }
LABEL_28:
  BOOL v17 = v14 & offset;
LABEL_31:

  return v17;
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
  [v5 encodeInteger:self->_preferredDownsamplingLevel forKey:@"downsamplingLevel"];
  [v5 encodeObject:self->_boundingBoxLocation forKey:@"boundingBoxLocation"];
  [v5 encodeInteger:self->_batchSize forKey:@"batchSize"];
  [v5 encodeInteger:self->_offset forKey:@"offset"];
}

- (RTLocationsForTripSegmentFetchOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"downsamplingLevel"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boundingBoxLocation"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"batchSize"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"offset"];

  v10 = [(RTLocationsForTripSegmentFetchOptions *)self initWithDateInterval:v5 preferredDownsamplingLevel:v6 boundingBoxLocation:v7 batchSize:v8 offset:v9];
  return v10;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (CLLocation)boundingBoxLocation
{
  return self->_boundingBoxLocation;
}

- (void)setBoundingBoxLocation:(id)a3
{
}

- (int64_t)preferredDownsamplingLevel
{
  return self->_preferredDownsamplingLevel;
}

- (void)setPreferredDownsamplingLevel:(int64_t)a3
{
  self->_preferredDownsamplingLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxLocation, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end