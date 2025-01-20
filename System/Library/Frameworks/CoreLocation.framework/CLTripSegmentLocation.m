@interface CLTripSegmentLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isCourseValid;
- (BOOL)isDenseUrbanSignalEnvironment;
- (BOOL)isFoliageSignalEnvironment;
- (BOOL)isGPSLocationType;
- (BOOL)isGoodGPSFix;
- (BOOL)isGoodGPSFixWithGoodCourse;
- (BOOL)isInertialIntegrated;
- (BOOL)isLinearInterpolated;
- (BOOL)isLoiLocationType;
- (BOOL)isMapMatched;
- (BOOL)isOriginalLocationType;
- (BOOL)isRuralSignalEnvironment;
- (BOOL)isSpeedValid;
- (BOOL)isUrbanSignalEnvironment;
- (BOOL)isWiFiLocationType;
- (CLTripSegmentLocation)initWithCLLocation:(id)a3;
- (CLTripSegmentLocation)initWithCoder:(id)a3;
- (CLTripSegmentLocation)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5;
- (CLTripSegmentLocation)initWithTime:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 altitude:(double)a11 altitudeAccuracy:(double)a12 locType:(int)a13;
- (CLTripSegmentLocation)initWithTime:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 altitude:(double)a11 altitudeAccuracy:(double)a12 locType:(int)a13 referenceFrame:(int)a14;
- (CLTripSegmentLocation)initWithTime:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 altitude:(double)a11 altitudeAccuracy:(double)a12 locType:(int)a13 referenceFrame:(int)a14 signalEnvironmentType:(int)a15;
- (NSDate)timestamp;
- (double)altitude;
- (double)altitudeAccuracy;
- (double)course;
- (double)courseAccuracy;
- (double)distanceFromLatitude:(double)a3 longitude:(double)a4;
- (double)distanceFromLocation:(id)a3;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)rawLatitude;
- (double)rawLongitude;
- (double)speed;
- (double)speedAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (int)locType;
- (int)locTypeStart;
- (int)locTypeStop;
- (int)mapsFormOfWay;
- (int)mapsRoadClass;
- (int)rawReferenceFrame;
- (int)referenceFrame;
- (int)signalEnvironmentType;
- (unint64_t)reconstructionType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setAltitudeAccuracy:(double)a3;
- (void)setCourse:(double)a3;
- (void)setCourseAccuracy:(double)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLocType:(int)a3;
- (void)setLocTypeStart:(int)a3;
- (void)setLocTypeStop:(int)a3;
- (void)setLocationReconstructionType:(unint64_t)a3;
- (void)setLongitude:(double)a3;
- (void)setMapsFormOfWay:(int)a3;
- (void)setMapsRoadClass:(int)a3;
- (void)setRawLatitude:(double)a3;
- (void)setRawLatitude:(double)a3 longitude:(double)a4 referenceFrame:(int)a5;
- (void)setRawLongitude:(double)a3;
- (void)setReconstructionType:(unint64_t)a3;
- (void)setSignalEnvironmentType:(int)a3;
- (void)setSpeed:(double)a3;
- (void)setSpeedAccuracy:(double)a3;
- (void)setStartLocationType:(int)a3;
- (void)setStartLocationType:(int)a3 andStopLocationType:(int)a4;
- (void)setStopLocationType:(int)a3;
- (void)updateAltitude:(double)a3 andAltitudeAccuracy:(double)a4;
- (void)updateCourse:(double)a3 andCourseAccuracy:(double)a4;
- (void)updateLatitude:(double)a3 longitude:(double)a4 horizontalAccuracy:(double)a5 referenceFrame:(int)a6;
- (void)updateSpeed:(double)a3 andSpeedAccuracy:(double)a4;
@end

@implementation CLTripSegmentLocation

- (CLTripSegmentLocation)initWithTime:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 altitude:(double)a11 altitudeAccuracy:(double)a12 locType:(int)a13 referenceFrame:(int)a14 signalEnvironmentType:(int)a15
{
  uint64_t v16 = *(void *)&a14;
  v29.receiver = self;
  v29.super_class = (Class)CLTripSegmentLocation;
  v27 = [(CLTripSegmentLocation *)&v29 init];
  if (v27)
  {
    v27->_timestamp = (NSDate *)a3;
    v27->_latitude = a4;
    v27->_longitude = a5;
    v27->_horizontalAccuracy = a6;
    v27->_course = a7;
    v27->_courseAccuracy = a8;
    v27->_speed = a9;
    v27->_speedAccuracy = a10;
    v27->_altitude = a11;
    v27->_altitudeAccuracy = a12;
    v27->_locType = a13;
    v27->_referenceFrame = v16;
    v27->_signalEnvironmentType = a15;
    [(CLTripSegmentLocation *)v27 setRawLatitude:v16 longitude:a4 referenceFrame:a5];
  }
  return v27;
}

- (CLTripSegmentLocation)initWithTime:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 altitude:(double)a11 altitudeAccuracy:(double)a12 locType:(int)a13 referenceFrame:(int)a14
{
  return -[CLTripSegmentLocation initWithTime:latitude:longitude:horizontalAccuracy:course:courseAccuracy:speed:speedAccuracy:altitude:altitudeAccuracy:locType:referenceFrame:signalEnvironmentType:](self, "initWithTime:latitude:longitude:horizontalAccuracy:course:courseAccuracy:speed:speedAccuracy:altitude:altitudeAccuracy:locType:referenceFrame:signalEnvironmentType:", a3, *(void *)&a13, *(void *)&a14, 0, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (CLTripSegmentLocation)initWithTime:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 altitude:(double)a11 altitudeAccuracy:(double)a12 locType:(int)a13
{
  return -[CLTripSegmentLocation initWithTime:latitude:longitude:horizontalAccuracy:course:courseAccuracy:speed:speedAccuracy:altitude:altitudeAccuracy:locType:referenceFrame:](self, "initWithTime:latitude:longitude:horizontalAccuracy:course:courseAccuracy:speed:speedAccuracy:altitude:altitudeAccuracy:locType:referenceFrame:", a3, *(void *)&a13, 1, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (CLTripSegmentLocation)initWithCLLocation:(id)a3
{
  uint64_t v5 = [a3 timestamp];
  [a3 coordinate];
  double v23 = v6;
  [a3 coordinate];
  double v8 = v7;
  [a3 horizontalAccuracy];
  double v10 = v9;
  [a3 course];
  double v12 = v11;
  [a3 courseAccuracy];
  double v14 = v13;
  [a3 speed];
  double v16 = v15;
  [a3 speedAccuracy];
  double v18 = v17;
  [a3 altitude];
  double v20 = v19;
  [a3 verticalAccuracy];
  return -[CLTripSegmentLocation initWithTime:latitude:longitude:horizontalAccuracy:course:courseAccuracy:speed:speedAccuracy:altitude:altitudeAccuracy:locType:referenceFrame:signalEnvironmentType:](self, "initWithTime:latitude:longitude:horizontalAccuracy:course:courseAccuracy:speed:speedAccuracy:altitude:altitudeAccuracy:locType:referenceFrame:signalEnvironmentType:", v5, [a3 type], objc_msgSend(a3, "referenceFrame"), objc_msgSend(a3, "signalEnvironmentType"), v23, v8, v10, v12, v14, v16, v18, v20, v21);
}

- (CLTripSegmentLocation)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5
{
  return -[CLTripSegmentLocation initWithTime:latitude:longitude:horizontalAccuracy:course:courseAccuracy:speed:speedAccuracy:altitude:altitudeAccuracy:locType:referenceFrame:](self, "initWithTime:latitude:longitude:horizontalAccuracy:course:courseAccuracy:speed:speedAccuracy:altitude:altitudeAccuracy:locType:referenceFrame:", [MEMORY[0x1E4F1C9C8] now], 0, 0, a3, a4, 1.0, -1.0, -1.0, -1.0, -1.0, a5, 0x3FF0000000000000);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 40) = [(CLTripSegmentLocation *)self timestamp];
  [(CLTripSegmentLocation *)self latitude];
  *(void *)(v4 + 48) = v5;
  [(CLTripSegmentLocation *)self longitude];
  *(void *)(v4 + 56) = v6;
  [(CLTripSegmentLocation *)self rawLatitude];
  *(void *)(v4 + 64) = v7;
  [(CLTripSegmentLocation *)self rawLongitude];
  *(void *)(v4 + 72) = v8;
  *(_DWORD *)(v4 + 12) = [(CLTripSegmentLocation *)self rawReferenceFrame];
  [(CLTripSegmentLocation *)self horizontalAccuracy];
  *(void *)(v4 + 80) = v9;
  [(CLTripSegmentLocation *)self course];
  *(void *)(v4 + 88) = v10;
  [(CLTripSegmentLocation *)self courseAccuracy];
  *(void *)(v4 + 96) = v11;
  [(CLTripSegmentLocation *)self speed];
  *(void *)(v4 + 104) = v12;
  [(CLTripSegmentLocation *)self speedAccuracy];
  *(void *)(v4 + 112) = v13;
  [(CLTripSegmentLocation *)self altitude];
  *(void *)(v4 + 120) = v14;
  [(CLTripSegmentLocation *)self altitudeAccuracy];
  *(void *)(v4 + 128) = v15;
  *(_DWORD *)(v4 + 24) = [(CLTripSegmentLocation *)self locType];
  *(_DWORD *)(v4 + 8) = [(CLTripSegmentLocation *)self referenceFrame];
  *(_DWORD *)(v4 + 16) = [(CLTripSegmentLocation *)self mapsRoadClass];
  *(_DWORD *)(v4 + 20) = [(CLTripSegmentLocation *)self mapsFormOfWay];
  *(_DWORD *)(v4 + 28) = [(CLTripSegmentLocation *)self locTypeStart];
  *(_DWORD *)(v4 + 32) = [(CLTripSegmentLocation *)self locTypeStop];
  *(void *)(v4 + 136) = [(CLTripSegmentLocation *)self reconstructionType];
  *(_DWORD *)(v4 + 36) = [(CLTripSegmentLocation *)self signalEnvironmentType];
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentLocation;
  [(CLTripSegmentLocation *)&v3 dealloc];
}

- (void)updateLatitude:(double)a3 longitude:(double)a4 horizontalAccuracy:(double)a5 referenceFrame:(int)a6
{
  self->_latitude = a3;
  self->_longitude = a4;
  self->_horizontalAccuracy = a5;
  self->_referenceFrame = a6;
}

- (void)setMapsRoadClass:(int)a3
{
  self->_mapsRoadClass = a3;
}

- (void)setMapsFormOfWay:(int)a3
{
  self->_mapsFormOfWay = a3;
}

- (void)setLocationReconstructionType:(unint64_t)a3
{
  self->_reconstructionType |= a3;
}

- (BOOL)isOriginalLocationType
{
  return self->_reconstructionType & 1;
}

- (BOOL)isInertialIntegrated
{
  return (LOBYTE(self->_reconstructionType) >> 1) & 1;
}

- (BOOL)isMapMatched
{
  return (LOBYTE(self->_reconstructionType) >> 3) & 1;
}

- (BOOL)isLinearInterpolated
{
  return (LOBYTE(self->_reconstructionType) >> 2) & 1;
}

- (void)setStartLocationType:(int)a3
{
  self->_locTypeStart = a3;
}

- (void)setStopLocationType:(int)a3
{
  self->_locTypeStop = a3;
}

- (void)setSignalEnvironmentType:(int)a3
{
  self->_signalEnvironmentType = a3;
}

- (void)setStartLocationType:(int)a3 andStopLocationType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(CLTripSegmentLocation *)self setStartLocationType:*(void *)&a3];

  [(CLTripSegmentLocation *)self setStopLocationType:v4];
}

- (void)setRawLatitude:(double)a3 longitude:(double)a4 referenceFrame:(int)a5
{
  self->_rawLatitude = a3;
  self->_rawLongitude = a4;
  self->_rawReferenceFrame = a5;
}

- (void)updateAltitude:(double)a3 andAltitudeAccuracy:(double)a4
{
  self->_altitude = a3;
  self->_altitudeAccuracy = a4;
}

- (void)updateCourse:(double)a3 andCourseAccuracy:(double)a4
{
  self->_course = a3;
  self->_courseAccuracy = a4;
}

- (void)updateSpeed:(double)a3 andSpeedAccuracy:(double)a4
{
  self->_speed = a3;
  self->_speedAccuracy = a4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[CLTripSegmentLocation timestamp](self, "timestamp"), @"timestamp");
  [(CLTripSegmentLocation *)self latitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"latitude");
  [(CLTripSegmentLocation *)self longitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"longitude");
  [(CLTripSegmentLocation *)self horizontalAccuracy];
  objc_msgSend(a3, "encodeDouble:forKey:", @"horizontalAccuracy");
  [(CLTripSegmentLocation *)self course];
  objc_msgSend(a3, "encodeDouble:forKey:", @"course");
  [(CLTripSegmentLocation *)self courseAccuracy];
  objc_msgSend(a3, "encodeDouble:forKey:", @"courseAccuracy");
  [(CLTripSegmentLocation *)self speed];
  objc_msgSend(a3, "encodeDouble:forKey:", @"speed");
  [(CLTripSegmentLocation *)self speedAccuracy];
  objc_msgSend(a3, "encodeDouble:forKey:", @"speedAccuracy");
  [(CLTripSegmentLocation *)self altitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"altitude");
  [(CLTripSegmentLocation *)self altitudeAccuracy];
  objc_msgSend(a3, "encodeDouble:forKey:", @"altitudeAccuracy");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLTripSegmentLocation mapsRoadClass](self, "mapsRoadClass"), @"mapsRoadClass");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLTripSegmentLocation mapsFormOfWay](self, "mapsFormOfWay"), @"mapsFormOfWay");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLTripSegmentLocation locType](self, "locType"), @"locType");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLTripSegmentLocation locTypeStart](self, "locTypeStart"), @"locTypeStart");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLTripSegmentLocation locTypeStop](self, "locTypeStop"), @"locTypeStop");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLTripSegmentLocation reconstructionType](self, "reconstructionType"), @"reconstructionType");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLTripSegmentLocation referenceFrame](self, "referenceFrame"), @"referenceFrame");
  [(CLTripSegmentLocation *)self rawLatitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"rawLatitude");
  [(CLTripSegmentLocation *)self rawLongitude];
  objc_msgSend(a3, "encodeDouble:forKey:", @"rawLongitude");
  objc_msgSend(a3, "encodeInt:forKey:", -[CLTripSegmentLocation rawReferenceFrame](self, "rawReferenceFrame"), @"rawReferenceFrame");
  uint64_t v5 = [(CLTripSegmentLocation *)self signalEnvironmentType];

  [a3 encodeInt:v5 forKey:@"signalEnvironmentType"];
}

- (CLTripSegmentLocation)initWithCoder:(id)a3
{
  uint64_t v4 = [CLTripSegmentLocation alloc];
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  [a3 decodeDoubleForKey:@"latitude"];
  double v27 = v6;
  [a3 decodeDoubleForKey:@"longitude"];
  double v8 = v7;
  [a3 decodeDoubleForKey:@"horizontalAccuracy"];
  double v10 = v9;
  [a3 decodeDoubleForKey:@"course"];
  double v12 = v11;
  [a3 decodeDoubleForKey:@"courseAccuracy"];
  double v14 = v13;
  [a3 decodeDoubleForKey:@"speed"];
  double v16 = v15;
  [a3 decodeDoubleForKey:@"speedAccuracy"];
  double v18 = v17;
  [a3 decodeDoubleForKey:@"altitude"];
  double v20 = v19;
  [a3 decodeDoubleForKey:@"altitudeAccuracy"];
  v22 = -[CLTripSegmentLocation initWithTime:latitude:longitude:horizontalAccuracy:course:courseAccuracy:speed:speedAccuracy:altitude:altitudeAccuracy:locType:referenceFrame:](v4, "initWithTime:latitude:longitude:horizontalAccuracy:course:courseAccuracy:speed:speedAccuracy:altitude:altitudeAccuracy:locType:referenceFrame:", v5, [a3 decodeIntForKey:@"locType"], objc_msgSend(a3, "decodeIntForKey:", @"referenceFrame"), v27, v8, v10, v12, v14, v16, v18, v20, v21);
  [a3 decodeDoubleForKey:@"rawLatitude"];
  double v24 = v23;
  [a3 decodeDoubleForKey:@"rawLongitude"];
  -[CLTripSegmentLocation setRawLatitude:longitude:referenceFrame:](v22, "setRawLatitude:longitude:referenceFrame:", [a3 decodeIntForKey:@"rawReferenceFrame"], v24, v25);
  -[CLTripSegmentLocation setStartLocationType:](v22, "setStartLocationType:", [a3 decodeIntForKey:@"locTypeStart"]);
  -[CLTripSegmentLocation setStopLocationType:](v22, "setStopLocationType:", [a3 decodeIntForKey:@"locTypeStop"]);
  -[CLTripSegmentLocation setLocationReconstructionType:](v22, "setLocationReconstructionType:", (int)[a3 decodeIntForKey:@"reconstructionType"]);
  -[CLTripSegmentLocation setMapsRoadClass:](v22, "setMapsRoadClass:", [a3 decodeIntForKey:@"mapsRoadClass"]);
  -[CLTripSegmentLocation setMapsRoadClass:](v22, "setMapsRoadClass:", [a3 decodeIntForKey:@"mapsFormOfWay"]);
  -[CLTripSegmentLocation setSignalEnvironmentType:](v22, "setSignalEnvironmentType:", [a3 decodeIntForKey:@"signalEnvironmentType"]);
  return v22;
}

- (double)distanceFromLocation:(id)a3
{
  if (!a3) {
    return -1.0;
  }
  double latitude = self->_latitude;
  double longitude = self->_longitude;
  [a3 latitude];
  double v7 = v6;
  [a3 longitude];

  return CLClientGetDistanceCoordinates(latitude, longitude, v7, v8);
}

- (double)distanceFromLatitude:(double)a3 longitude:(double)a4
{
  return CLClientGetDistanceCoordinates(self->_latitude, self->_longitude, a3, a4);
}

- (BOOL)isLoiLocationType
{
  return self->_locType == 13;
}

- (BOOL)isGPSLocationType
{
  return (self->_locType < 0xAu) & (0x20Au >> self->_locType);
}

- (BOOL)isWiFiLocationType
{
  int locType = self->_locType;
  return locType == 4 || locType == 11;
}

- (BOOL)isCourseValid
{
  BOOL result = 0;
  double course = self->_course;
  if (fabs(course) != INFINITY)
  {
    double courseAccuracy = self->_courseAccuracy;
    double v6 = fabs(courseAccuracy);
    BOOL v7 = v6 < INFINITY;
    if (v6 > INFINITY) {
      BOOL v7 = 1;
    }
    if (course < 0.0) {
      BOOL v7 = 0;
    }
    return courseAccuracy > 0.0 && v7;
  }
  return result;
}

- (BOOL)isSpeedValid
{
  BOOL result = 0;
  double speed = self->_speed;
  if (fabs(speed) != INFINITY)
  {
    double speedAccuracy = self->_speedAccuracy;
    double v6 = fabs(speedAccuracy);
    BOOL v7 = v6 < INFINITY;
    if (v6 > INFINITY) {
      BOOL v7 = 1;
    }
    if (speed < 0.0) {
      BOOL v7 = 0;
    }
    return speedAccuracy > 0.0 && v7;
  }
  return result;
}

- (BOOL)isGoodGPSFix
{
  double horizontalAccuracy = self->_horizontalAccuracy;
  return horizontalAccuracy > 0.0
      && horizontalAccuracy < 60.0
      && [(CLTripSegmentLocation *)self isGPSLocationType];
}

- (BOOL)isGoodGPSFixWithGoodCourse
{
  BOOL v3 = [(CLTripSegmentLocation *)self isGoodGPSFix];
  if (v3)
  {
    BOOL v3 = [(CLTripSegmentLocation *)self isCourseValid];
    if (v3) {
      LOBYTE(v3) = self->_courseAccuracy < 60.0;
    }
  }
  return v3;
}

- (BOOL)isRuralSignalEnvironment
{
  return self->_signalEnvironmentType == 1;
}

- (BOOL)isUrbanSignalEnvironment
{
  return self->_signalEnvironmentType == 2;
}

- (BOOL)isDenseUrbanSignalEnvironment
{
  return (self->_signalEnvironmentType - 3) < 2;
}

- (BOOL)isFoliageSignalEnvironment
{
  return self->_signalEnvironmentType == 6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
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

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (double)rawLatitude
{
  return self->_rawLatitude;
}

- (void)setRawLatitude:(double)a3
{
  self->_rawLatitude = a3;
}

- (double)rawLongitude
{
  return self->_rawLongitude;
}

- (void)setRawLongitude:(double)a3
{
  self->_rawLongitude = a3;
}

- (int)rawReferenceFrame
{
  return self->_rawReferenceFrame;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_double horizontalAccuracy = a3;
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

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)altitudeAccuracy
{
  return self->_altitudeAccuracy;
}

- (void)setAltitudeAccuracy:(double)a3
{
  self->_altitudeAccuracy = a3;
}

- (int)mapsRoadClass
{
  return self->_mapsRoadClass;
}

- (int)mapsFormOfWay
{
  return self->_mapsFormOfWay;
}

- (int)locType
{
  return self->_locType;
}

- (void)setLocType:(int)a3
{
  self->_int locType = a3;
}

- (int)locTypeStart
{
  return self->_locTypeStart;
}

- (void)setLocTypeStart:(int)a3
{
  self->_locTypeStart = a3;
}

- (int)locTypeStop
{
  return self->_locTypeStop;
}

- (void)setLocTypeStop:(int)a3
{
  self->_locTypeStop = a3;
}

- (unint64_t)reconstructionType
{
  return self->_reconstructionType;
}

- (void)setReconstructionType:(unint64_t)a3
{
  self->_reconstructionType = a3;
}

- (int)signalEnvironmentType
{
  return self->_signalEnvironmentType;
}

@end