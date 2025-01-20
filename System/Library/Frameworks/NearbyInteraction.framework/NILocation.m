@interface NILocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NILocation)initWithCoder:(id)a3;
- (NILocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 ellipsoidalAltitude:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 speed:(double)a10 speedAccuracy:(double)a11 course:(double)a12 courseAccuracy:(double)a13 floor:(int64_t)a14 locationType:(int64_t)a15 signalEnvironment:(int64_t)a16;
- (NSDate)timestamp;
- (double)altitude;
- (double)course;
- (double)courseAccuracy;
- (double)ellipsoidalAltitude;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)speed;
- (double)speedAccuracy;
- (double)verticalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)floor;
- (int64_t)locationType;
- (int64_t)signalEnvironment;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setCourse:(double)a3;
- (void)setCourseAccuracy:(double)a3;
- (void)setEllipsoidalAltitude:(double)a3;
- (void)setFloor:(int64_t)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationType:(int64_t)a3;
- (void)setLongitude:(double)a3;
- (void)setSignalEnvironment:(int64_t)a3;
- (void)setSpeed:(double)a3;
- (void)setSpeedAccuracy:(double)a3;
- (void)setTimestamp:(id)a3;
- (void)setVerticalAccuracy:(double)a3;
@end

@implementation NILocation

- (NILocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 ellipsoidalAltitude:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 speed:(double)a10 speedAccuracy:(double)a11 course:(double)a12 courseAccuracy:(double)a13 floor:(int64_t)a14 locationType:(int64_t)a15 signalEnvironment:(int64_t)a16
{
  id v28 = a3;
  if (!v28) {
    __assert_rtn("-[NILocation initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:]", "NILocation.mm", 37, "timestamp");
  }
  v33.receiver = self;
  v33.super_class = (Class)NILocation;
  v29 = [(NILocation *)&v33 init];
  if (v29)
  {
    uint64_t v30 = [v28 copy];
    timestamp = v29->_timestamp;
    v29->_timestamp = (NSDate *)v30;

    v29->_latitude = a4;
    v29->_longitude = a5;
    v29->_altitude = a6;
    v29->_ellipsoidalAltitude = a7;
    v29->_horizontalAccuracy = a8;
    v29->_verticalAccuracy = a9;
    v29->_speed = a10;
    v29->_speedAccuracy = a11;
    v29->_course = a12;
    v29->_courseAccuracy = a13;
    v29->_floor = a14;
    v29->_locationType = a15;
    v29->_signalEnvironment = a16;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [+[NILocation allocWithZone:a3] initWithTimestamp:self->_timestamp latitude:self->_floor longitude:self->_locationType altitude:self->_signalEnvironment ellipsoidalAltitude:self->_latitude horizontalAccuracy:self->_longitude verticalAccuracy:self->_altitude speed:self->_ellipsoidalAltitude speedAccuracy:self->_horizontalAccuracy course:self->_verticalAccuracy courseAccuracy:self->_speed floor:self->_speedAccuracy locationType:*(void *)&self->_course signalEnvironment:*(void *)&self->_courseAccuracy];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v4 encodeDouble:@"latitude" forKey:self->_latitude];
  [v4 encodeDouble:@"longitude" forKey:self->_longitude];
  [v4 encodeDouble:@"altitude" forKey:self->_altitude];
  [v4 encodeDouble:@"ellipsoidalAltitude" forKey:self->_ellipsoidalAltitude];
  [v4 encodeDouble:@"horizontalAccuracy" forKey:self->_horizontalAccuracy];
  [v4 encodeDouble:@"verticalAccuracy" forKey:self->_verticalAccuracy];
  [v4 encodeDouble:@"speed" forKey:self->_speed];
  [v4 encodeDouble:@"speedAccuracy" forKey:self->_speedAccuracy];
  [v4 encodeDouble:@"course" forKey:self->_course];
  [v4 encodeDouble:@"courseAccuracy" forKey:self->_courseAccuracy];
  [v4 encodeInteger:self->_floor forKey:@"floor"];
  [v4 encodeInteger:self->_locationType forKey:@"locationType"];
  [v4 encodeInteger:self->_signalEnvironment forKey:@"signalEnvironment"];
}

- (NILocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v4 decodeDoubleForKey:@"latitude"];
    double v26 = v6;
    [v4 decodeDoubleForKey:@"longitude"];
    double v25 = v7;
    [v4 decodeDoubleForKey:@"altitude"];
    double v9 = v8;
    [v4 decodeDoubleForKey:@"ellipsoidalAltitude"];
    double v11 = v10;
    [v4 decodeDoubleForKey:@"horizontalAccuracy"];
    double v13 = v12;
    [v4 decodeDoubleForKey:@"verticalAccuracy"];
    double v15 = v14;
    [v4 decodeDoubleForKey:@"speed"];
    double v17 = v16;
    [v4 decodeDoubleForKey:@"speedAccuracy"];
    double v19 = v18;
    [v4 decodeDoubleForKey:@"course"];
    uint64_t v21 = v20;
    [v4 decodeDoubleForKey:@"courseAccuracy"];
    v23 = -[NILocation initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:]([NILocation alloc], "initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:", v5, [v4 decodeIntegerForKey:@"floor"], objc_msgSend(v4, "decodeIntegerForKey:", @"locationType"), objc_msgSend(v4, "decodeIntegerForKey:", @"signalEnvironment"), v26, v25, v9, v11, v13, v15, v17, v19, v21, v22);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NILocation *)v4;
    double v6 = v5;
    if (v5 == self)
    {
      BOOL v35 = 1;
LABEL_27:

      goto LABEL_28;
    }
    timestamp = self->_timestamp;
    if (!timestamp)
    {
      double v8 = [(NILocation *)v5 timestamp];

      if (!v8)
      {
        int v10 = 1;
        goto LABEL_7;
      }
      timestamp = self->_timestamp;
    }
    double v9 = [(NILocation *)v6 timestamp];
    int v10 = [(NSDate *)timestamp isEqual:v9];

LABEL_7:
    double latitude = self->_latitude;
    [(NILocation *)v6 latitude];
    double v13 = v12;
    double longitude = self->_longitude;
    [(NILocation *)v6 longitude];
    double v16 = v15;
    double altitude = self->_altitude;
    [(NILocation *)v6 altitude];
    double v19 = v18;
    double ellipsoidalAltitude = self->_ellipsoidalAltitude;
    [(NILocation *)v6 ellipsoidalAltitude];
    double v22 = v21;
    double horizontalAccuracy = self->_horizontalAccuracy;
    [(NILocation *)v6 horizontalAccuracy];
    double v48 = v23;
    double verticalAccuracy = self->_verticalAccuracy;
    [(NILocation *)v6 verticalAccuracy];
    double v46 = v24;
    double speed = self->_speed;
    [(NILocation *)v6 speed];
    double v44 = v25;
    double speedAccuracy = self->_speedAccuracy;
    [(NILocation *)v6 speedAccuracy];
    double v42 = v26;
    double course = self->_course;
    [(NILocation *)v6 course];
    double v40 = v27;
    double courseAccuracy = self->_courseAccuracy;
    [(NILocation *)v6 courseAccuracy];
    double v38 = v28;
    int64_t floor = self->_floor;
    uint64_t v30 = [(NILocation *)v6 floor];
    int64_t locationType = self->_locationType;
    uint64_t v32 = [(NILocation *)v6 locationType];
    int64_t signalEnvironment = self->_signalEnvironment;
    uint64_t v34 = [(NILocation *)v6 signalEnvironment];
    BOOL v35 = 0;
    if (v10
      && latitude == v13
      && longitude == v16
      && altitude == v19
      && ellipsoidalAltitude == v22
      && horizontalAccuracy == v48
      && verticalAccuracy == v46
      && speed == v44
      && speedAccuracy == v42
      && course == v40
      && courseAccuracy == v38
      && floor == v30)
    {
      BOOL v35 = locationType == v32 && signalEnvironment == v34;
    }
    goto LABEL_27;
  }
  BOOL v35 = 0;
LABEL_28:

  return v35;
}

- (unint64_t)hash
{
  timestamp = self->_timestamp;
  if (timestamp) {
    uint64_t v24 = [(NSDate *)timestamp hash];
  }
  else {
    uint64_t v24 = 0;
  }
  v31 = [NSNumber numberWithDouble:self->_latitude];
  uint64_t v23 = [v31 hash];
  uint64_t v30 = [NSNumber numberWithDouble:self->_longitude];
  uint64_t v22 = [v30 hash];
  v29 = [NSNumber numberWithDouble:self->_altitude];
  uint64_t v20 = [v29 hash];
  double v28 = [NSNumber numberWithDouble:self->_ellipsoidalAltitude];
  uint64_t v19 = [v28 hash];
  double v27 = [NSNumber numberWithDouble:self->_horizontalAccuracy];
  uint64_t v18 = [v27 hash];
  double v26 = [NSNumber numberWithDouble:self->_verticalAccuracy];
  uint64_t v17 = [v26 hash];
  double v25 = [NSNumber numberWithDouble:self->_speed];
  uint64_t v16 = [v25 hash];
  double v21 = [NSNumber numberWithDouble:self->_speedAccuracy];
  uint64_t v15 = [v21 hash];
  id v4 = [NSNumber numberWithDouble:self->_course];
  uint64_t v5 = [v4 hash];
  double v6 = [NSNumber numberWithDouble:self->_courseAccuracy];
  uint64_t v7 = [v6 hash];
  double v8 = [NSNumber numberWithInteger:self->_floor];
  uint64_t v9 = [v8 hash];
  int v10 = [NSNumber numberWithInteger:self->_locationType];
  uint64_t v11 = [v10 hash];
  double v12 = [NSNumber numberWithInteger:self->_signalEnvironment];
  unint64_t v13 = v23 ^ v24 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v7 ^ v9 ^ v11 ^ [v12 hash];

  return v13;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  double v6 = [(NILocation *)self descriptionInternal];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  if (+[NIPlatformInfo isInternalBuild])
  {
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%.7fdeg", *(void *)&self->_latitude);
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%.7fdeg", *(void *)&self->_longitude);
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.1fm", *(void *)&self->_altitude);
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%.1fm", *(void *)&self->_ellipsoidalAltitude);
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%.1fm", *(void *)&self->_horizontalAccuracy);
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%.1fm", *(void *)&self->_verticalAccuracy);
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%.1fm/s", *(void *)&self->_speed);
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%.1fm/s", *(void *)&self->_speedAccuracy);
    double v14 = objc_msgSend(NSString, "stringWithFormat:", @"%.1fdeg", *(void *)&self->_course);
    unint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%.1fdeg", *(void *)&self->_courseAccuracy);
    double v6 = (void *)v4;
    if (self->_floor == NILocationFloorNotAvailable)
    {
      uint64_t v7 = (void *)v3;
      double v8 = @"-";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_floor);
      uint64_t v7 = (void *)v3;
      double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    int v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_locationType);
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", self->_signalEnvironment);
    uint64_t v9 = [NSString stringWithFormat:@"Time: %@. Pos: [%@, %@, %@ (sea) %@ (ell)] +/- [%@, %@]. Spd: %@ +/- %@. Crs: %@ +/- %@. Flr: %@. LocType: %@. SigEnv: %@.", self->_timestamp, v17, v16, v7, v6, v19, v18, v15, v5, v14, v13, v8, v10, v11];
  }
  else
  {
    uint64_t v9 = @"***";
  }

  return v9;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_double latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_double longitude = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_double altitude = a3;
}

- (double)ellipsoidalAltitude
{
  return self->_ellipsoidalAltitude;
}

- (void)setEllipsoidalAltitude:(double)a3
{
  self->_double ellipsoidalAltitude = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_double horizontalAccuracy = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_double verticalAccuracy = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_double speed = a3;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (void)setSpeedAccuracy:(double)a3
{
  self->_double speedAccuracy = a3;
}

- (double)course
{
  return self->_course;
}

- (void)setCourse:(double)a3
{
  self->_double course = a3;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (void)setCourseAccuracy:(double)a3
{
  self->_double courseAccuracy = a3;
}

- (int64_t)floor
{
  return self->_floor;
}

- (void)setFloor:(int64_t)a3
{
  self->_int64_t floor = a3;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_int64_t locationType = a3;
}

- (int64_t)signalEnvironment
{
  return self->_signalEnvironment;
}

- (void)setSignalEnvironment:(int64_t)a3
{
  self->_int64_t signalEnvironment = a3;
}

- (void).cxx_destruct
{
}

@end