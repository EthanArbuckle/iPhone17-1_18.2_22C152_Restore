@interface RTStoredLocationEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (BOOL)downsampleRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOptions:(id)a3;
- (BOOL)smoothingRequired;
- (CLLocation)boundingBoxLocation;
- (Class)enumeratedType;
- (NSDateInterval)dateInterval;
- (RTStoredLocationEnumerationOptions)init;
- (RTStoredLocationEnumerationOptions)initWithCoder:(id)a3;
- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5;
- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 ascending:(BOOL)a6;
- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6;
- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7;
- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7 downsampleRequired:(BOOL)a8;
- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7 downsampleRequired:(BOOL)a8 smoothingErrorThreshold:(double)a9;
- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7 smoothingRequired:(BOOL)a8 downsampleRequired:(BOOL)a9 smoothingErrorThreshold:(double)a10 ascending:(BOOL)a11;
- (double)horizontalAccuracy;
- (double)smoothingErrorThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)processingBlock;
- (int)type;
- (unint64_t)batchSize;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAscending:(BOOL)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setBoundingBoxLocation:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setDownsampleRequired:(BOOL)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setSmoothingErrorThreshold:(double)a3;
- (void)setSmoothingRequired:(BOOL)a3;
- (void)setType:(int)a3;
@end

@implementation RTStoredLocationEnumerationOptions

- (RTStoredLocationEnumerationOptions)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  v7 = [(RTStoredLocationEnumerationOptions *)self initWithDateInterval:v6 horizontalAccuracy:0 batchSize:0 boundingBoxLocation:0.0];
  return v7;
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5
{
  return [(RTStoredLocationEnumerationOptions *)self initWithDateInterval:a3 horizontalAccuracy:a5 batchSize:0 boundingBoxLocation:14 type:0 downsampleRequired:a4 smoothingErrorThreshold:0.0];
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 ascending:(BOOL)a6
{
  LOBYTE(v7) = a6;
  return [(RTStoredLocationEnumerationOptions *)self initWithDateInterval:a3 horizontalAccuracy:a5 batchSize:0 boundingBoxLocation:14 type:0 smoothingRequired:0 downsampleRequired:a4 smoothingErrorThreshold:0.0 ascending:v7];
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6
{
  return [(RTStoredLocationEnumerationOptions *)self initWithDateInterval:a3 horizontalAccuracy:a5 batchSize:a6 boundingBoxLocation:14 type:0 downsampleRequired:a4 smoothingErrorThreshold:0.0];
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7
{
  return [(RTStoredLocationEnumerationOptions *)self initWithDateInterval:a3 horizontalAccuracy:a5 batchSize:a6 boundingBoxLocation:*(void *)&a7 type:0 downsampleRequired:a4 smoothingErrorThreshold:0.0];
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7 downsampleRequired:(BOOL)a8
{
  return [(RTStoredLocationEnumerationOptions *)self initWithDateInterval:a3 horizontalAccuracy:a5 batchSize:a6 boundingBoxLocation:*(void *)&a7 type:a8 downsampleRequired:a4 smoothingErrorThreshold:0.0];
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7 downsampleRequired:(BOOL)a8 smoothingErrorThreshold:(double)a9
{
  LOBYTE(v10) = 1;
  return [(RTStoredLocationEnumerationOptions *)self initWithDateInterval:a3 horizontalAccuracy:a5 batchSize:a6 boundingBoxLocation:*(void *)&a7 type:0 smoothingRequired:a8 downsampleRequired:a4 smoothingErrorThreshold:a9 ascending:v10];
}

- (RTStoredLocationEnumerationOptions)initWithDateInterval:(id)a3 horizontalAccuracy:(double)a4 batchSize:(unint64_t)a5 boundingBoxLocation:(id)a6 type:(int)a7 smoothingRequired:(BOOL)a8 downsampleRequired:(BOOL)a9 smoothingErrorThreshold:(double)a10 ascending:(BOOL)a11
{
  id v20 = a3;
  id v21 = a6;
  v22 = v21;
  if (v21)
  {
    [v21 horizontalAccuracy];
    if (v23 <= 0.0)
    {
      v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v27 = "Invalid parameter not satisfying: boundingBoxLocation.horizontalAccuracy > 0";
        goto LABEL_18;
      }
LABEL_10:

      v28 = 0;
      goto LABEL_16;
    }
  }
  if (a7 >= 0xF)
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "Invalid parameter not satisfying: type >= kCLLocationType_Unknown && type <= kCLLocationType_Max";
LABEL_18:
      _os_log_error_impl(&dword_1A8FEF000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v37.receiver = self;
  v37.super_class = (Class)RTStoredLocationEnumerationOptions;
  v24 = [(RTStoredLocationEnumerationOptions *)&v37 init];
  if (v24)
  {
    if (v20)
    {
      v25 = (void *)[v20 copy];
    }
    else
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28C18]);
      uint64_t v30 = [MEMORY[0x1E4F1C9C8] distantPast];
      uint64_t v31 = [MEMORY[0x1E4F1C9C8] distantFuture];
      v36 = (void *)v30;
      uint64_t v32 = v30;
      v11 = (void *)v31;
      v25 = (void *)[v29 initWithStartDate:v32 endDate:v31];
    }
    objc_storeStrong((id *)&v24->_dateInterval, v25);
    if (!v20)
    {

      v25 = v36;
    }

    v24->_horizontalAccuracy = a4;
    v24->_batchSize = a5;
    uint64_t v33 = [v22 copy];
    boundingBoxLocation = v24->_boundingBoxLocation;
    v24->_boundingBoxLocation = (CLLocation *)v33;

    v24->_type = a7;
    v24->_smoothingRequired = a8;
    v24->_downsampleRequired = a9;
    v24->_smoothingErrorThreshold = a10;
    v24->_ascending = a11;
  }
  self = v24;
  v28 = self;
LABEL_16:

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(RTStoredLocationEnumerationOptions *)self dateInterval];
  [(RTStoredLocationEnumerationOptions *)self horizontalAccuracy];
  double v7 = v6;
  unint64_t v8 = [(RTStoredLocationEnumerationOptions *)self batchSize];
  v9 = [(RTStoredLocationEnumerationOptions *)self boundingBoxLocation];
  uint64_t v10 = [(RTStoredLocationEnumerationOptions *)self type];
  BOOL v11 = [(RTStoredLocationEnumerationOptions *)self smoothingRequired];
  BOOL v12 = [(RTStoredLocationEnumerationOptions *)self downsampleRequired];
  [(RTStoredLocationEnumerationOptions *)self smoothingErrorThreshold];
  double v14 = v13;
  LOBYTE(v17) = [(RTStoredLocationEnumerationOptions *)self ascending];
  v15 = (void *)[v4 initWithDateInterval:v5 horizontalAccuracy:v8 batchSize:v9 boundingBoxLocation:v10 type:v11 smoothingRequired:v12 downsampleRequired:v7 smoothingErrorThreshold:v14 ascending:v17];

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
  [v5 encodeDouble:@"horizontalAccuracy" forKey:self->_horizontalAccuracy];
  [v5 encodeInteger:self->_batchSize forKey:@"batchSize"];
  [v5 encodeObject:self->_boundingBoxLocation forKey:@"boundingBoxLocation"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeBool:self->_smoothingRequired forKey:@"smoothingRequired"];
  [v5 encodeBool:self->_downsampleRequired forKey:@"downsampleRequired"];
  [v5 encodeDouble:@"smoothingErrorThreshold" forKey:self->_smoothingErrorThreshold];
  [v5 encodeBool:self->_ascending forKey:@"ascending"];
}

- (RTStoredLocationEnumerationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  [v4 decodeDoubleForKey:@"horizontalAccuracy"];
  double v7 = v6;
  uint64_t v8 = [v4 decodeIntegerForKey:@"batchSize"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boundingBoxLocation"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v11 = [v4 decodeBoolForKey:@"smoothingRequired"];
  uint64_t v12 = [v4 decodeBoolForKey:@"downsampleRequired"];
  [v4 decodeDoubleForKey:@"smoothingErrorThreshold"];
  double v14 = v13;
  char v15 = [v4 decodeBoolForKey:@"ascending"];

  LOBYTE(v18) = v15;
  v16 = [(RTStoredLocationEnumerationOptions *)self initWithDateInterval:v5 horizontalAccuracy:v8 batchSize:v9 boundingBoxLocation:v10 type:v11 smoothingRequired:v12 downsampleRequired:v7 smoothingErrorThreshold:v14 ascending:v18];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTStoredLocationEnumerationOptions *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTStoredLocationEnumerationOptions *)self isEqualToOptions:v5];

  return v6;
}

- (BOOL)isEqualToOptions:(id)a3
{
  id v5 = a3;
  BOOL v6 = v5;
  dateInterval = self->_dateInterval;
  uint64_t v8 = dateInterval;
  if (dateInterval)
  {
LABEL_4:
    v9 = [v6 dateInterval];
    char v32 = [(NSDateInterval *)v8 isEqual:v9];

    if (dateInterval) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v3 = [v5 dateInterval];
  if (v3)
  {
    uint64_t v8 = self->_dateInterval;
    goto LABEL_4;
  }
  char v32 = 1;
LABEL_7:

LABEL_8:
  double horizontalAccuracy = self->_horizontalAccuracy;
  [v6 horizontalAccuracy];
  double v12 = v11;
  unint64_t batchSize = self->_batchSize;
  uint64_t v14 = [v6 batchSize];
  boundingBoxLocation = self->_boundingBoxLocation;
  v16 = boundingBoxLocation;
  if (boundingBoxLocation) {
    goto LABEL_11;
  }
  dateInterval = [v6 boundingBoxLocation];
  if (dateInterval)
  {
    v16 = self->_boundingBoxLocation;
LABEL_11:
    uint64_t v17 = [v6 boundingBoxLocation];
    char v18 = [(CLLocation *)v16 isEqual:v17];

    if (boundingBoxLocation) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v18 = 1;
LABEL_14:

LABEL_15:
  int smoothingRequired = self->_smoothingRequired;
  int v20 = [v6 smoothingRequired];
  int downsampleRequired = self->_downsampleRequired;
  int v22 = [v6 downsampleRequired];
  double smoothingErrorThreshold = self->_smoothingErrorThreshold;
  [v6 smoothingErrorThreshold];
  double v25 = v24;
  int ascending = self->_ascending;
  int v27 = [v6 ascending];
  char v28 = v32;
  if (horizontalAccuracy != v12) {
    char v28 = 0;
  }
  if (batchSize != v14) {
    char v28 = 0;
  }
  char v29 = v28 & v18;
  if (smoothingRequired != v20) {
    char v29 = 0;
  }
  if (downsampleRequired != v22) {
    char v29 = 0;
  }
  if (smoothingErrorThreshold != v25) {
    char v29 = 0;
  }
  if (ascending == v27) {
    BOOL v30 = v29;
  }
  else {
    BOOL v30 = 0;
  }

  return v30;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDateInterval *)self->_dateInterval hash];
  v19 = [NSNumber numberWithDouble:self->_horizontalAccuracy];
  uint64_t v4 = [v19 hash] ^ v3;
  id v5 = [NSNumber numberWithUnsignedInteger:self->_batchSize];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = v4 ^ v6 ^ [(CLLocation *)self->_boundingBoxLocation hash];
  uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_type];
  uint64_t v9 = [v8 hash];
  uint64_t v10 = [NSNumber numberWithBool:self->_smoothingRequired];
  uint64_t v11 = v9 ^ [v10 hash];
  double v12 = [NSNumber numberWithBool:self->_downsampleRequired];
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];
  uint64_t v14 = [NSNumber numberWithDouble:self->_smoothingErrorThreshold];
  uint64_t v15 = [v14 hash];
  v16 = [NSNumber numberWithBool:self->_ascending];
  unint64_t v17 = v13 ^ v15 ^ [v16 hash];

  return v17;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(NSDateInterval *)self->_dateInterval startDate];
  id v5 = [v4 stringFromDate];
  uint64_t v6 = [(NSDateInterval *)self->_dateInterval endDate];
  uint64_t v7 = [v6 stringFromDate];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = @"YES";
  if (self->_smoothingRequired) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (self->_downsampleRequired) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (!self->_ascending) {
    uint64_t v9 = @"NO";
  }
  double v12 = [v3 stringWithFormat:@"start date, %@, end date, %@, horizontal accuracy, %lf, batchSize, %lu, boundingBoxLocation, %@, type, %lu, smoothingRequired, %@, downsampleRequired, %@, smoothingErrorThreshold, %lf, ascending, %@", v5, v7, *(void *)&self->_horizontalAccuracy, self->_batchSize, self->_boundingBoxLocation, self->_type, v10, v11, *(void *)&self->_smoothingErrorThreshold, v9];

  return v12;
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

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_double horizontalAccuracy = a3;
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

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)smoothingRequired
{
  return self->_smoothingRequired;
}

- (void)setSmoothingRequired:(BOOL)a3
{
  self->_int smoothingRequired = a3;
}

- (BOOL)downsampleRequired
{
  return self->_downsampleRequired;
}

- (void)setDownsampleRequired:(BOOL)a3
{
  self->_int downsampleRequired = a3;
}

- (double)smoothingErrorThreshold
{
  return self->_smoothingErrorThreshold;
}

- (void)setSmoothingErrorThreshold:(double)a3
{
  self->_double smoothingErrorThreshold = a3;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void)setAscending:(BOOL)a3
{
  self->_int ascending = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxLocation, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end