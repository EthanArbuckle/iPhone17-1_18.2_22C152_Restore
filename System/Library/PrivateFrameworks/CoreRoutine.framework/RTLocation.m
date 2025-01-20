@interface RTLocation
+ (BOOL)supportsSecureCoding;
+ (id)sourceAccuracyToString:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLocation:(id)a3;
- (NSDate)date;
- (RTLocation)init;
- (RTLocation)initWithCoder:(id)a3;
- (RTLocation)initWithDictionary:(id)a3;
- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 altitude:(double)a6 verticalUncertainty:(double)a7 date:(id)a8 referenceFrame:(int)a9 speed:(double)a10;
- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 altitude:(double)a6 verticalUncertainty:(double)a7 date:(id)a8 referenceFrame:(int)a9 speed:(double)a10 sourceAccuracy:(unint64_t)a11;
- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 date:(id)a6;
- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 date:(id)a6 referenceFrame:(int)a7;
- (double)altitude;
- (double)horizontalUncertainty;
- (double)latitude;
- (double)longitude;
- (double)speed;
- (double)uncertainty;
- (double)verticalUncertainty;
- (id)coordinateToString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)outputToDictionary;
- (int)referenceFrame;
- (unint64_t)hash;
- (unint64_t)sourceAccuracy;
- (void)encodeWithCoder:(id)a3;
- (void)setHorizontalUncertainty:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setUncertainty:(double)a3;
@end

@implementation RTLocation

- (NSDate)date
{
  return self->_date;
}

- (double)horizontalUncertainty
{
  return self->_horizontalUncertainty;
}

- (void).cxx_destruct
{
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 altitude:(double)a6 verticalUncertainty:(double)a7 date:(id)a8 referenceFrame:(int)a9 speed:(double)a10
{
  return [(RTLocation *)self initWithLatitude:a8 longitude:*(void *)&a9 horizontalUncertainty:0 altitude:a3 verticalUncertainty:a4 date:a5 referenceFrame:a6 speed:a7 sourceAccuracy:a10];
}

- (id)coordinateToString
{
  v3 = NSString;
  [(RTLocation *)self latitude];
  uint64_t v5 = v4;
  [(RTLocation *)self longitude];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%+.6f,%+.6f>", v5, v6);
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 date:(id)a6 referenceFrame:(int)a7
{
  return [(RTLocation *)self initWithLatitude:a6 longitude:*(void *)&a7 horizontalUncertainty:a3 altitude:a4 verticalUncertainty:a5 date:0.0 referenceFrame:-1.0 speed:-1.0];
}

- (RTLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"latitude"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"longitude"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"horizontalUncertainty"];
  double v10 = v9;
  [v4 decodeDoubleForKey:@"altitude"];
  double v12 = v11;
  [v4 decodeDoubleForKey:@"verticalUncertainty"];
  double v14 = v13;
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  uint64_t v16 = [v4 decodeIntForKey:@"referenceFrame"];
  [v4 decodeDoubleForKey:@"speed"];
  double v18 = v17;
  uint64_t v19 = [v4 decodeIntegerForKey:@"sourceAccuracy"];

  v20 = [(RTLocation *)self initWithLatitude:v15 longitude:v16 horizontalUncertainty:v19 altitude:v6 verticalUncertainty:v8 date:v10 referenceFrame:v12 speed:v14 sourceAccuracy:v18];
  return v20;
}

- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 altitude:(double)a6 verticalUncertainty:(double)a7 date:(id)a8 referenceFrame:(int)a9 speed:(double)a10 sourceAccuracy:(unint64_t)a11
{
  id v20 = a8;
  v26.receiver = self;
  v26.super_class = (Class)RTLocation;
  v21 = [(RTLocation *)&v26 init];
  v22 = v21;
  if (v21)
  {
    v21->_latitude = a3;
    v21->_longitude = a4;
    v21->_horizontalUncertainty = a5;
    v21->_altitude = a6;
    v21->_verticalUncertainty = a7;
    uint64_t v23 = [v20 copy];
    date = v22->_date;
    v22->_date = (NSDate *)v23;

    v22->_referenceFrame = a9;
    v22->_speed = a10;
    v22->_sourceAccuracy = a11;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  double latitude = self->_latitude;
  id v5 = a3;
  [v5 encodeDouble:@"latitude" forKey:latitude];
  [v5 encodeDouble:@"longitude" forKey:self->_longitude];
  [v5 encodeDouble:@"horizontalUncertainty" forKey:self->_horizontalUncertainty];
  [v5 encodeDouble:@"altitude" forKey:self->_altitude];
  [v5 encodeDouble:@"verticalUncertainty" forKey:self->_verticalUncertainty];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeInt:self->_referenceFrame forKey:@"referenceFrame"];
  [v5 encodeDouble:@"speed" forKey:self->_speed];
  [v5 encodeInteger:self->_sourceAccuracy forKey:@"sourceAccuracy"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTLocation)initWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 date:(id)a6
{
  return [(RTLocation *)self initWithLatitude:a6 longitude:0 horizontalUncertainty:a3 date:a4 referenceFrame:a5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double latitude = self->_latitude;
  double longitude = self->_longitude;
  double horizontalUncertainty = self->_horizontalUncertainty;
  double altitude = self->_altitude;
  double verticalUncertainty = self->_verticalUncertainty;
  uint64_t referenceFrame = self->_referenceFrame;
  double speed = self->_speed;
  date = self->_date;
  unint64_t sourceAccuracy = self->_sourceAccuracy;
  return (id)[v4 initWithLatitude:date longitude:referenceFrame horizontalUncertainty:sourceAccuracy altitude:latitude verticalUncertainty:longitude date:horizontalUncertainty referenceFrame:altitude speed:verticalUncertainty sourceAccuracy:speed];
}

- (RTLocation)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLatitude_longitude_horizontalUncertainty_altitude_verticalUncertainty_date_referenceFrame_speed_sourceAccuracy_);
}

- (double)uncertainty
{
  return self->_horizontalUncertainty;
}

- (void)setUncertainty:(double)a3
{
  self->_double horizontalUncertainty = a3;
}

- (RTLocation)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForKey:@"latitude"];
  double v6 = [v4 valueForKey:@"longitude"];
  double v7 = [v4 valueForKey:@"horizontalUncertainty"];
  double v8 = [v4 valueForKey:@"altitude"];
  double v9 = [v4 valueForKey:@"verticalUncertainty"];
  double v10 = [v4 valueForKey:@"date"];
  double v11 = [v4 valueForKey:@"referenceFrame"];
  double v12 = [v4 valueForKey:@"speed"];

  double v13 = 0;
  if (v5 && v6 && v7 && v8 && v9 && v10 && v11 && v12)
  {
    v29 = self;
    double v14 = (void *)MEMORY[0x1E4F1C9C8];
    [v10 doubleValue];
    v15 = objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
    [v5 doubleValue];
    double v17 = v16;
    [v6 doubleValue];
    double v19 = v18;
    [v7 doubleValue];
    double v21 = v20;
    [v8 doubleValue];
    double v23 = v22;
    [v9 doubleValue];
    double v25 = v24;
    uint64_t v26 = [v11 intValue];
    [v12 doubleValue];
    double v13 = [(RTLocation *)v29 initWithLatitude:v15 longitude:v26 horizontalUncertainty:v17 altitude:v19 verticalUncertainty:v21 date:v23 referenceFrame:v25 speed:v27];

    self = v13;
  }

  return v13;
}

- (id)outputToDictionary
{
  v3 = objc_opt_new();
  id v4 = NSNumber;
  [(RTLocation *)self latitude];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v5 forKey:@"latitude"];

  double v6 = NSNumber;
  [(RTLocation *)self longitude];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKey:@"longitude"];

  double v8 = NSNumber;
  [(RTLocation *)self horizontalUncertainty];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKey:@"horizontalUncertainty"];

  double v10 = NSNumber;
  [(RTLocation *)self altitude];
  double v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKey:@"altitude"];

  double v12 = NSNumber;
  [(RTLocation *)self verticalUncertainty];
  double v13 = objc_msgSend(v12, "numberWithDouble:");
  [v3 setObject:v13 forKey:@"verticalUncertainty"];

  double v14 = NSNumber;
  v15 = [(RTLocation *)self date];
  [v15 timeIntervalSince1970];
  double v16 = objc_msgSend(v14, "numberWithDouble:");
  [v3 setObject:v16 forKey:@"date"];

  double v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[RTLocation referenceFrame](self, "referenceFrame"));
  [v3 setObject:v17 forKey:@"referenceFrame"];

  double v18 = NSNumber;
  [(RTLocation *)self speed];
  double v19 = objc_msgSend(v18, "numberWithDouble:");
  [v3 setObject:v19 forKey:@"speed"];

  return v3;
}

- (id)description
{
  v3 = NSString;
  [(RTLocation *)self latitude];
  uint64_t v5 = v4;
  [(RTLocation *)self longitude];
  uint64_t v7 = v6;
  [(RTLocation *)self horizontalUncertainty];
  uint64_t v9 = v8;
  [(RTLocation *)self altitude];
  uint64_t v11 = v10;
  [(RTLocation *)self verticalUncertainty];
  uint64_t v13 = v12;
  double v14 = [(RTLocation *)self date];
  v15 = [v14 stringFromDate];
  uint64_t v16 = [(RTLocation *)self referenceFrame];
  double v17 = [(id)objc_opt_class() sourceAccuracyToString:self->_sourceAccuracy];
  double v18 = [v3 stringWithFormat:@"<%f, %f> +/- %f, alt, %f +/- %f, date, %@, referenceFrame, %d, sourceAccuracy, %@", v5, v7, v9, v11, v13, v15, v16, v17];

  return v18;
}

+ (id)sourceAccuracyToString:(unint64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 2) {
    v3 = @"High";
  }
  if (a3 == 1) {
    return @"Low";
  }
  else {
    return v3;
  }
}

- (BOOL)isEqualToLocation:(id)a3
{
  id v5 = a3;
  double latitude = self->_latitude;
  [v5 latitude];
  if (latitude != v7) {
    goto LABEL_15;
  }
  double longitude = self->_longitude;
  [v5 longitude];
  if (longitude != v9
    || (double horizontalUncertainty = self->_horizontalUncertainty,
        [v5 horizontalUncertainty],
        horizontalUncertainty != v11)
    || (double altitude = self->_altitude, [v5 altitude], altitude != v13)
    || (double verticalUncertainty = self->_verticalUncertainty,
        [v5 verticalUncertainty],
        verticalUncertainty != v15))
  {
LABEL_15:
    BOOL v26 = 0;
    goto LABEL_16;
  }
  date = self->_date;
  double v17 = date;
  if (date)
  {
LABEL_9:
    double v18 = [v5 date];
    [(NSDate *)v17 timeIntervalSinceDate:v18];
    double v20 = v19;

    double v21 = -v20;
    if (v20 >= 0.0) {
      double v21 = v20;
    }
    if (v21 >= 0.01) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  v3 = [v5 date];
  if (v3)
  {
    double v17 = self->_date;
    goto LABEL_9;
  }
LABEL_12:
  int referenceFrame = self->_referenceFrame;
  if (referenceFrame == [v5 referenceFrame])
  {
    double speed = self->_speed;
    [v5 speed];
    BOOL v25 = speed == v24;
    BOOL v26 = speed == v24;
    if (!date) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
LABEL_17:
  BOOL v25 = 0;
  BOOL v26 = 0;
  if (!date)
  {
LABEL_18:

    BOOL v26 = v25;
  }
LABEL_16:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RTLocation *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTLocation *)self isEqualToLocation:v5];

  return v6;
}

- (unint64_t)hash
{
  double v20 = [NSNumber numberWithDouble:self->_latitude];
  uint64_t v3 = [v20 hash];
  uint64_t v4 = [NSNumber numberWithDouble:self->_longitude];
  uint64_t v5 = [v4 hash] ^ v3;
  BOOL v6 = [NSNumber numberWithDouble:self->_horizontalUncertainty];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [NSNumber numberWithDouble:self->_altitude];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  uint64_t v10 = [NSNumber numberWithDouble:self->_verticalUncertainty];
  uint64_t v11 = [v10 hash];
  uint64_t v12 = [NSNumber numberWithUnsignedInt:self->_referenceFrame];
  uint64_t v13 = v11 ^ [v12 hash];
  uint64_t v14 = v9 ^ v13 ^ [(NSDate *)self->_date hash];
  double v15 = [NSNumber numberWithDouble:self->_speed];
  uint64_t v16 = [v15 hash];
  double v17 = [NSNumber numberWithUnsignedInteger:self->_sourceAccuracy];
  unint64_t v18 = v14 ^ v16 ^ [v17 hash];

  return v18;
}

- (void)setLatitude:(double)a3
{
  self->_double latitude = a3;
}

- (void)setLongitude:(double)a3
{
  self->_double longitude = a3;
}

- (void)setHorizontalUncertainty:(double)a3
{
  self->_double horizontalUncertainty = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)verticalUncertainty
{
  return self->_verticalUncertainty;
}

- (unint64_t)sourceAccuracy
{
  return self->_sourceAccuracy;
}

- (double)speed
{
  return self->_speed;
}

@end