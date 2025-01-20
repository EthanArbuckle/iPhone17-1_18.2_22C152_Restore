@interface RTSynthesizedLocationEnumerationOptions
+ (BOOL)supportsSecureCoding;
+ (int64_t)NextLessDecimatedDownsamplingPreference:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOptions:(id)a3;
- (CLLocation)boundingBoxLocation;
- (Class)enumeratedType;
- (NSDateInterval)dateInterval;
- (RTSynthesizedLocationEnumerationOptions)init;
- (RTSynthesizedLocationEnumerationOptions)initWithCoder:(id)a3;
- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3;
- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4;
- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4 batchSize:(unint64_t)a5;
- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)processingBlock;
- (int64_t)preferredDownsamplingLevel;
- (unint64_t)batchSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setBoundingBoxLocation:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setPreferredDownsamplingLevel:(int64_t)a3;
@end

@implementation RTSynthesizedLocationEnumerationOptions

- (RTSynthesizedLocationEnumerationOptions)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  v7 = [(RTSynthesizedLocationEnumerationOptions *)self initWithDateInterval:v6 preferredDownsamplingLevel:0 batchSize:0 boundingBoxLocation:0];
  return v7;
}

- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3
{
  return [(RTSynthesizedLocationEnumerationOptions *)self initWithDateInterval:a3 preferredDownsamplingLevel:0 batchSize:0 boundingBoxLocation:0];
}

- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4
{
  return [(RTSynthesizedLocationEnumerationOptions *)self initWithDateInterval:a3 preferredDownsamplingLevel:a4 batchSize:0 boundingBoxLocation:0];
}

- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4 batchSize:(unint64_t)a5
{
  return [(RTSynthesizedLocationEnumerationOptions *)self initWithDateInterval:a3 preferredDownsamplingLevel:a4 batchSize:a5 boundingBoxLocation:0];
}

- (RTSynthesizedLocationEnumerationOptions)initWithDateInterval:(id)a3 preferredDownsamplingLevel:(int64_t)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6
{
  id v12 = a3;
  id v13 = a6;
  v14 = v13;
  if (v13 && ([v13 horizontalAccuracy], v15 <= 0.0))
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: boundingBoxLocation.horizontalAccuracy > 0", buf, 2u);
    }

    v19 = 0;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)RTSynthesizedLocationEnumerationOptions;
    v16 = [(RTSynthesizedLocationEnumerationOptions *)&v24 init];
    if (v16)
    {
      if (v12)
      {
        v17 = (void *)[v12 copy];
      }
      else
      {
        id v20 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
        v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
        v17 = (void *)[v20 initWithStartDate:v6 endDate:v7];
      }
      objc_storeStrong((id *)&v16->_dateInterval, v17);
      if (!v12)
      {

        v17 = (void *)v6;
      }

      v16->_preferredDownsamplingLevel = a4;
      v16->_batchSize = a5;
      uint64_t v21 = [v14 copy];
      boundingBoxLocation = v16->_boundingBoxLocation;
      v16->_boundingBoxLocation = (CLLocation *)v21;
    }
    self = v16;
    v19 = self;
  }

  return v19;
}

+ (int64_t)NextLessDecimatedDownsamplingPreference:(int64_t)a3
{
  return a3 == 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(RTSynthesizedLocationEnumerationOptions *)self dateInterval];
  int64_t v6 = [(RTSynthesizedLocationEnumerationOptions *)self preferredDownsamplingLevel];
  unint64_t v7 = [(RTSynthesizedLocationEnumerationOptions *)self batchSize];
  v8 = [(RTSynthesizedLocationEnumerationOptions *)self boundingBoxLocation];
  v9 = (void *)[v4 initWithDateInterval:v5 preferredDownsamplingLevel:v6 batchSize:v7 boundingBoxLocation:v8];

  return v9;
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
  [v5 encodeInteger:self->_preferredDownsamplingLevel forKey:@"preferredDownsamplingLevel"];
  [v5 encodeInteger:self->_batchSize forKey:@"batchSize"];
  [v5 encodeObject:self->_boundingBoxLocation forKey:@"boundingBoxLocation"];
}

- (RTSynthesizedLocationEnumerationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"preferredDownsamplingLevel"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"batchSize"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boundingBoxLocation"];

  v9 = [(RTSynthesizedLocationEnumerationOptions *)self initWithDateInterval:v5 preferredDownsamplingLevel:v6 batchSize:v7 boundingBoxLocation:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTSynthesizedLocationEnumerationOptions *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTSynthesizedLocationEnumerationOptions *)self isEqualToOptions:v5];

  return v6;
}

- (BOOL)isEqualToOptions:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  dateInterval = self->_dateInterval;
  v8 = dateInterval;
  if (dateInterval)
  {
LABEL_4:
    v9 = [v6 dateInterval];
    char v21 = [(NSDateInterval *)v8 isEqual:v9];

    if (dateInterval) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v3 = [v5 dateInterval];
  if (v3)
  {
    v8 = self->_dateInterval;
    goto LABEL_4;
  }
  char v21 = 1;
LABEL_7:

LABEL_8:
  int64_t preferredDownsamplingLevel = self->_preferredDownsamplingLevel;
  uint64_t v11 = [v6 preferredDownsamplingLevel];
  unint64_t batchSize = self->_batchSize;
  uint64_t v13 = [v6 batchSize];
  boundingBoxLocation = self->_boundingBoxLocation;
  double v15 = boundingBoxLocation;
  if (boundingBoxLocation) {
    goto LABEL_11;
  }
  dateInterval = [v6 boundingBoxLocation];
  if (dateInterval)
  {
    double v15 = self->_boundingBoxLocation;
LABEL_11:
    v16 = [v6 boundingBoxLocation];
    char v17 = [(CLLocation *)v15 isEqual:v16];

    if (boundingBoxLocation) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v17 = 1;
LABEL_14:

LABEL_15:
  char v18 = v21;
  if (preferredDownsamplingLevel != v11) {
    char v18 = 0;
  }
  if (batchSize != v13) {
    char v18 = 0;
  }
  char v19 = v18 & v17;

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDateInterval *)self->_dateInterval hash];
  id v4 = [NSNumber numberWithInteger:self->_preferredDownsamplingLevel];
  uint64_t v5 = [v4 hash] ^ v3;
  BOOL v6 = [NSNumber numberWithUnsignedInteger:self->_batchSize];
  uint64_t v7 = [v6 hash];
  unint64_t v8 = v5 ^ v7 ^ [(CLLocation *)self->_boundingBoxLocation hash];

  return v8;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(NSDateInterval *)self->_dateInterval startDate];
  uint64_t v5 = [v4 stringFromDate];
  BOOL v6 = [(NSDateInterval *)self->_dateInterval endDate];
  uint64_t v7 = [v6 stringFromDate];
  unint64_t v8 = [v3 stringWithFormat:@"start date, %@, end date, %@, horizontal accuracy, %lu, batchSize, %lu, boundingBoxLocation, %@", v5, v7, self->_preferredDownsamplingLevel, self->_batchSize, self->_boundingBoxLocation];

  return v8;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)processingBlock
{
  return 0;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_unint64_t batchSize = a3;
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
  self->_int64_t preferredDownsamplingLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxLocation, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end