@interface CLLocation
+ (BOOL)supportsSecureCoding;
- ($8F8AF229C96C8FD9B1F71011CD0A7A27)clientLocation;
- (BOOL)isAltitudeWgs84Available;
- (BOOL)isCoordinateFused;
- (BOOL)isCoordinateFusedWithVL;
- (CLFloor)floor;
- (CLLocation)init;
- (CLLocation)initWithClientLocation:(id *)a3;
- (CLLocation)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4;
- (CLLocation)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4 coarseMetaData:(id)a5;
- (CLLocation)initWithClientLocation:(id *)a3 coarseMetaData:(id)a4;
- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4;
- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5;
- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6;
- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawAltitude:(double)a10 rawVerticalAccuracy:(double)a11 rawCourseAccuracy:(double)a12 positionContextStateType:(int)a13 probabilityPositionContextStateIndoor:(double)a14 probabilityPositionContextStateOutdoor:(double)a15 gnssOdometerInfo:(id)a16 coarseMetaData:(id)a17;
- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawCourseAccuracy:(double)a10 coarseMetaData:(id)a11;
- (CLLocation)initWithCoder:(id)a3;
- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 timestamp:(id)a7 referenceFrame:(int)a8;
- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy course:(CLLocationDirection)course courseAccuracy:(CLLocationDirectionAccuracy)courseAccuracy speed:(CLLocationSpeed)speed speedAccuracy:(CLLocationSpeedAccuracy)speedAccuracy timestamp:(NSDate *)timestamp;
- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy course:(CLLocationDirection)course courseAccuracy:(CLLocationDirectionAccuracy)courseAccuracy speed:(CLLocationSpeed)speed speedAccuracy:(CLLocationSpeedAccuracy)speedAccuracy timestamp:(NSDate *)timestamp sourceInfo:(CLLocationSourceInformation *)sourceInfo;
- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy course:(CLLocationDirection)course speed:(CLLocationSpeed)speed timestamp:(NSDate *)timestamp;
- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy timestamp:(NSDate *)timestamp;
- (CLLocation)initWithLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude;
- (CLLocation)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 speed:(double)a6 course:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 speedAccuracy:(double)a10 courseAccuracy:(double)a11 type:(int)a12 timestamp:(id)a13;
- (CLLocationAccuracy)horizontalAccuracy;
- (CLLocationAccuracy)verticalAccuracy;
- (CLLocationCoordinate2D)coordinate;
- (CLLocationCoordinate2D)rawCoordinate;
- (CLLocationDirection)course;
- (CLLocationDirectionAccuracy)courseAccuracy;
- (CLLocationDistance)altitude;
- (CLLocationDistance)distanceFromLocation:(const CLLocation *)location;
- (CLLocationDistance)ellipsoidalAltitude;
- (CLLocationGnssOdometerInfo)gnssOdometerInfo;
- (CLLocationMatchInfo)matchInfo;
- (CLLocationSourceInformation)sourceInformation;
- (CLLocationSpeed)speed;
- (CLLocationSpeedAccuracy)speedAccuracy;
- (CLLocationTrackRunInfo)trackRunInfo;
- (NSData)coarseMetaData;
- (NSDate)timestamp;
- (NSString)iso6709Notation;
- (_CLLocationFusionInfo)_fusionInfo;
- (_CLLocationGroundAltitude)_groundAltitude;
- (double)altitudeWgs84;
- (double)magneticDeclination;
- (double)probabilityPositionContextStateIndoor;
- (double)probabilityPositionContextStateOutdoor;
- (double)rawAltitude;
- (double)rawCourse;
- (double)rawCourseAccuracy;
- (double)rawHorizontalAccuracy;
- (double)rawVerticalAccuracy;
- (double)trustedTimestamp;
- (id)_initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 timestamp:(id)a11 floor:(int)a12 type:(int)a13 sourceParams:(id)a14 referenceFrame:(int)a15;
- (id)_initWithRTLocation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)jsonObject;
- (id)propagateLocationToTime:(double)a3;
- (id)shortDescription;
- (id)snapToResolution:(double)a3;
- (int)positionContextState;
- (int)referenceFrame;
- (int)signalEnvironmentType;
- (int)type;
- (unsigned)integrity;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setReferenceFrame:(int)a3;
- (void)unmatch;
@end

@implementation CLLocation

- (CLLocationCoordinate2D)coordinate
{
  internal = (char *)self->_internal;
  double v3 = *(double *)(internal + 12);
  double v4 = *(double *)(internal + 20);
  result.longitude = v4;
  result.latitude = v3;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocation;
  [(CLLocation *)&v3 dealloc];
}

- (CLLocationAccuracy)horizontalAccuracy
{
  return *(double *)((char *)self->_internal + 28);
}

- (int)type
{
  return *((_DWORD *)self->_internal + 26);
}

- (CLLocationSpeed)speed
{
  return *(double *)((char *)self->_internal + 52);
}

- (CLLocationDistance)altitude
{
  return *(double *)((char *)self->_internal + 36);
}

- (CLLocationAccuracy)verticalAccuracy
{
  return *(double *)((char *)self->_internal + 44);
}

- (CLLocationDistance)distanceFromLocation:(const CLLocation *)location
{
  if (!location) {
    return -1.0;
  }
  CLClientGetDistanceHighPrecision((char *)self->_internal + 8, (char *)location->_internal + 8);
  return result;
}

- (int)signalEnvironmentType
{
  return *((_DWORD *)self->_internal + 37);
}

- (int)referenceFrame
{
  return *((_DWORD *)self->_internal + 35);
}

- (CLLocationDirection)course
{
  return *(double *)((char *)self->_internal + 68);
}

- (CLLocation)initWithClientLocation:(id *)a3 coarseMetaData:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CLLocation;
  v6 = [(CLLocation *)&v15 init];
  if (v6)
  {
    v7 = [CLLocationInternal alloc];
    $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
    v13[6] = *(_OWORD *)&a3->var11;
    v13[7] = var13;
    v14[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v14 + 12) = *(_OWORD *)&a3->var16;
    long long v9 = *(_OWORD *)&a3->var5;
    v13[2] = *(_OWORD *)&a3->var3;
    v13[3] = v9;
    long long v10 = *(_OWORD *)&a3->var9;
    v13[4] = *(_OWORD *)&a3->var7;
    v13[5] = v10;
    long long v11 = *(_OWORD *)&a3->var1.var1;
    v13[0] = *(_OWORD *)&a3->var0;
    v13[1] = v11;
    v6->_internal = [(CLLocationInternal *)v7 initWithClientLocation:v13 coarseMetaData:a4];
  }
  return v6;
}

- (CLLocationSpeedAccuracy)speedAccuracy
{
  return *(double *)((char *)self->_internal + 60);
}

- (unsigned)integrity
{
  return *((_DWORD *)self->_internal + 34);
}

- (CLFloor)floor
{
  internal = (int *)self->_internal;
  if (internal[33] == 0x7FFFFFFF) {
    return 0;
  }
  double v4 = [[CLFloor alloc] initWithLevel:internal[33]];

  return v4;
}

- (CLLocationDirectionAccuracy)courseAccuracy
{
  return *(double *)((char *)self->_internal + 76);
}

- (CLLocationMatchInfo)matchInfo
{
  return (CLLocationMatchInfo *)*((void *)self->_internal + 21);
}

- ($8F8AF229C96C8FD9B1F71011CD0A7A27)clientLocation
{
  double var0 = self->var1.var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v4 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)(*(void *)&var0 + 120);
  *(_OWORD *)&retstr->var11 = *(_OWORD *)(*(void *)&var0 + 104);
  retstr->$F24F406B2B787EFB06265DBA3D28CBD5 var13 = v4;
  *(_OWORD *)&retstr->var14 = *(_OWORD *)(*(void *)&var0 + 136);
  *(_OWORD *)&retstr->var16 = *(_OWORD *)(*(void *)&var0 + 148);
  long long v5 = *(_OWORD *)(*(void *)&var0 + 56);
  *(_OWORD *)&retstr->var3 = *(_OWORD *)(*(void *)&var0 + 40);
  *(_OWORD *)&retstr->var5 = v5;
  long long v6 = *(_OWORD *)(*(void *)&var0 + 88);
  *(_OWORD *)&retstr->var7 = *(_OWORD *)(*(void *)&var0 + 72);
  *(_OWORD *)&retstr->var9 = v6;
  long long v7 = *(_OWORD *)(*(void *)&var0 + 24);
  *(_OWORD *)&retstr->double var0 = *(_OWORD *)(*(void *)&var0 + 8);
  *(_OWORD *)&retstr->var1.var1 = v7;
  return self;
}

- (CLLocation)initWithLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude
{
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];

  return -[CLLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:](self, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v7, latitude, longitude, 0.0, 0.0, -1.0);
}

- (id)description
{
  internal = (char *)self->_internal;
  if (qword_1EB2725A8 != -1) {
    dispatch_once(&qword_1EB2725A8, &unk_1EE0060A0);
  }
  return (id)[NSString stringWithFormat:@"<%+.8f,%+.8f> +/- %.2fm (speed %.2f mps / course %.2f) @ %@", *(void *)(internal + 12), *(void *)(internal + 20), *(void *)(internal + 28), *(void *)(internal + 52), *(void *)(internal + 68), objc_msgSend((id)qword_1EB2725A0, "stringFromDate:", -[CLLocation timestamp](self, "timestamp"))];
}

- (NSDate)timestamp
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)((char *)self->_internal + 84)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v4[1] = [self->_internal copy];
  return v4;
}

- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6
{
  v19.receiver = self;
  v19.super_class = (Class)CLLocation;
  long long v10 = [(CLLocation *)&v19 init];
  if (v10)
  {
    long long v11 = [CLLocationInternal alloc];
    $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
    v17[6] = *(_OWORD *)&a3->var11;
    v17[7] = var13;
    v18[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v18 + 12) = *(_OWORD *)&a3->var16;
    long long v13 = *(_OWORD *)&a3->var5;
    v17[2] = *(_OWORD *)&a3->var3;
    v17[3] = v13;
    long long v14 = *(_OWORD *)&a3->var9;
    v17[4] = *(_OWORD *)&a3->var7;
    v17[5] = v14;
    long long v15 = *(_OWORD *)&a3->var1.var1;
    v17[0] = *(_OWORD *)&a3->var0;
    v17[1] = v15;
    v10->_internal = [(CLLocationInternal *)v11 initWithClientLocation:v17 matchInfo:a4 trustedTimestamp:a6 groundAltitude:a5];
  }
  return v10;
}

- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
  v9[6] = *(_OWORD *)&a3->var11;
  v9[7] = var13;
  v10[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v10 + 12) = *(_OWORD *)&a3->var16;
  long long v5 = *(_OWORD *)&a3->var5;
  v9[2] = *(_OWORD *)&a3->var3;
  v9[3] = v5;
  long long v6 = *(_OWORD *)&a3->var9;
  v9[4] = *(_OWORD *)&a3->var7;
  v9[5] = v6;
  long long v7 = *(_OWORD *)&a3->var1.var1;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v7;
  return [(CLLocation *)self initWithClientLocation:v9 matchInfo:a4 trustedTimestamp:-1.0];
}

- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
  v10[6] = *(_OWORD *)&a3->var11;
  v10[7] = var13;
  v11[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v11 + 12) = *(_OWORD *)&a3->var16;
  long long v6 = *(_OWORD *)&a3->var5;
  _OWORD v10[2] = *(_OWORD *)&a3->var3;
  v10[3] = v6;
  long long v7 = *(_OWORD *)&a3->var9;
  v10[4] = *(_OWORD *)&a3->var7;
  v10[5] = v7;
  long long v8 = *(_OWORD *)&a3->var1.var1;
  v10[0] = *(_OWORD *)&a3->var0;
  v10[1] = v8;
  return [(CLLocation *)self initWithClientLocation:v10 matchInfo:a4 trustedTimestamp:0 groundAltitude:a5];
}

- (CLLocation)initWithCoder:(id)a3
{
  *(_OWORD *)v52 = xmmword_1908864C8;
  *(_OWORD *)&v52[16] = unk_1908864D8;
  memset(v53, 0, 28);
  *(_OWORD *)&v51[32] = xmmword_190886488;
  *(_OWORD *)&v51[48] = unk_190886498;
  *(_OWORD *)&v51[64] = xmmword_1908864A8;
  *(_OWORD *)&v51[80] = unk_1908864B8;
  *(_OWORD *)v51 = xmmword_190886468;
  *(_OWORD *)&v51[16] = unk_190886478;
  double v49 = 0.0;
  *(double *)&unint64_t v50 = -1.0;
  *(double *)&unint64_t v47 = -1.0;
  *(double *)&unint64_t v48 = -1.0;
  unsigned int v46 = 0;
  double v44 = 0.0;
  double v45 = 0.0;
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    [a3 decodeValueOfObjCType:"d" at:&v51[4]];
    [a3 decodeValueOfObjCType:"d" at:(unint64_t)v51 | 0xC];
    [a3 decodeValueOfObjCType:"d" at:&v51[20]];
    [a3 decodeValueOfObjCType:"d" at:&v51[28]];
    [a3 decodeValueOfObjCType:"d" at:&v51[36]];
    [a3 decodeValueOfObjCType:"d" at:&v51[44]];
    [a3 decodeValueOfObjCType:"d" at:&v51[52]];
    [a3 decodeValueOfObjCType:"d" at:&v51[60]];
    [a3 decodeValueOfObjCType:"d" at:&v51[68]];
    [a3 decodeValueOfObjCType:"d" at:&v51[76]];
    [a3 decodeValueOfObjCType:"i" at:v52];
    [a3 decodeValueOfObjCType:"d" at:&v51[88]];
    [a3 decodeValueOfObjCType:"i" at:&v52[28]];
    [a3 decodeValueOfObjCType:"I" at:v53];
    [a3 decodeValueOfObjCType:"i" at:(char *)v53 + 4];
    uint64_t v18 = [a3 decodeObject];
    uint64_t v19 = [a3 decodeObject];
    uint64_t v20 = [a3 decodeObject];
    uint64_t v21 = [a3 decodeObject];
    uint64_t v22 = [a3 decodeObject];
    [a3 decodeValueOfObjCType:"d" at:&v52[4]];
    [a3 decodeValueOfObjCType:"d" at:&v52[12]];
    [a3 decodeValueOfObjCType:"d" at:&v50];
    [a3 decodeValueOfObjCType:"i" at:(char *)v53 + 8];
    [a3 decodeValueOfObjCType:"d" at:&v49];
    [a3 decodeValueOfObjCType:"d" at:&v48];
    [a3 decodeValueOfObjCType:"d" at:&v52[20]];
    [a3 decodeValueOfObjCType:"d" at:&v47];
    [a3 decodeValueOfObjCType:"i" at:(char *)v53 + 12];
    [a3 decodeValueOfObjCType:"d" at:&v53[1]];
    [a3 decodeValueOfObjCType:"i" at:&v46];
    [a3 decodeValueOfObjCType:"d" at:&v45];
    [a3 decodeValueOfObjCType:"d" at:&v44];
    [a3 decodeObject];
    uint64_t v35 = [a3 decodeObject];
    double v27 = v49;
    double v25 = *(double *)&v50;
    double v32 = *(double *)&v47;
    double v29 = *(double *)&v48;
    uint64_t v36 = v46;
    double v37 = v44;
    double v38 = v45;
    goto LABEL_33;
  }
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeyCoordinateLatitude"];
  *(void *)&v51[4] = v5;
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeyCoordinateLongitude"];
  *(void *)&v51[12] = v6;
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeyHorizontalAccuracy"];
  *(void *)&v51[20] = v7;
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeyAltitude"];
  *(void *)&v51[28] = v8;
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeyVerticalAccuracy"];
  double v10 = v9;
  *(double *)&v51[36] = v9;
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeySpeed"];
  *(void *)&v51[44] = v11;
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeySpeedAccuracy"];
  *(void *)&v51[52] = v12;
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeyCourse"];
  *(void *)&v51[60] = v13;
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeyCourseAccuracy"];
  *(void *)&v51[68] = v14;
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeyTimestamp"];
  *(void *)&v51[76] = v15;
  *(_DWORD *)v52 = [a3 decodeIntForKey:@"kCLLocationCodingKeyType"];
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeyLifespan"];
  *(void *)&v51[88] = v16;
  *(_DWORD *)&v52[28] = [a3 decodeIntForKey:@"kCLLocationCodingKeyFloor"];
  LODWORD(v53[0]) = [a3 decodeIntForKey:@"kCLLocationCodingKeyIntegrity"];
  int v17 = [a3 containsValueForKey:@"reserved"];
  if (v17) {
    int v17 = [a3 decodeIntForKey:@"reserved"];
  }
  DWORD1(v53[0]) = v17;
  uint64_t v18 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLLocationCodingKeyMatchInfo"];
  uint64_t v19 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLLocationCodingKeyGroundAltitude"];
  uint64_t v20 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLLocationCodingKeyFusionInfo"];
  uint64_t v21 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLLocationCodingKeyTrackRunInfo"];
  uint64_t v22 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLLocationCodingKeyCoarseMetaData"];
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeyRawCoordinateLatitude"];
  *(void *)&v52[4] = v23;
  [a3 decodeDoubleForKey:@"kCLLocationCodingKeyRawCoordinateLongitude"];
  *(void *)&v52[12] = v24;
  double v25 = -1.0;
  if ([a3 containsValueForKey:@"kCLLocationCodingKeyRawHorizontalAccuracy"])
  {
    [a3 decodeDoubleForKey:@"kCLLocationCodingKeyRawHorizontalAccuracy"];
    double v25 = v26;
    *(double *)&unint64_t v50 = v26;
  }
  if ([a3 containsValueForKey:@"kCLLocationCodingKeyRawReferenceFrame"]) {
    DWORD2(v53[0]) = [a3 decodeIntForKey:@"kCLLocationCodingKeyRawReferenceFrame"];
  }
  double v27 = 0.0;
  if ([a3 containsValueForKey:@"kCLLocationCodingKeyRawAltitude"])
  {
    [a3 decodeDoubleForKey:@"kCLLocationCodingKeyRawAltitude"];
    double v27 = v28;
    double v49 = v28;
  }
  double v29 = -1.0;
  if ([a3 containsValueForKey:@"kCLLocationCodingKeyRawVerticalAccuracy"])
  {
    [a3 decodeDoubleForKey:@"kCLLocationCodingKeyRawVerticalAccuracy"];
    double v29 = v30;
    *(double *)&unint64_t v48 = v30;
  }
  if ([a3 containsValueForKey:@"kCLLocationCodingKeyRawCourse"])
  {
    [a3 decodeDoubleForKey:@"kCLLocationCodingKeyRawCourse"];
    *(void *)&v52[20] = v31;
  }
  double v32 = -1.0;
  if ([a3 containsValueForKey:@"kCLLocationCodingKeyRawCourseAccuracy"])
  {
    [a3 decodeDoubleForKey:@"kCLLocationCodingKeyRawCourseAccuracy"];
    double v32 = v33;
    *(double *)&unint64_t v47 = v33;
  }
  if ([a3 containsValueForKey:@"kCLLocationCodingKeySignalEnvironmentType"]) {
    HIDWORD(v53[0]) = [a3 decodeIntForKey:@"kCLLocationCodingKeySignalEnvironmentType"];
  }
  if ([a3 containsValueForKey:@"kCLLocationCodingKeyEllipsoidalAltitude"])
  {
    [a3 decodeDoubleForKey:@"kCLLocationCodingKeyEllipsoidalAltitude"];
LABEL_22:
    *(void *)&v53[1] = v34;
    goto LABEL_23;
  }
  uint64_t v34 = 0;
  if (v10 >= 0.0) {
    goto LABEL_22;
  }
LABEL_23:
  if ([a3 containsValueForKey:@"kCLLocationCodingKeyPositionContextState"])
  {
    uint64_t v36 = [a3 decodeIntForKey:@"kCLLocationCodingKeyPositionContextState"];
    unsigned int v46 = v36;
  }
  else
  {
    uint64_t v36 = 0;
  }
  double v37 = 0.0;
  double v38 = 0.0;
  if ([a3 containsValueForKey:@"kCLLocationCodingKeyProbabilityPositionContextStateIndoor"])
  {
    [a3 decodeDoubleForKey:@"kCLLocationCodingKeyProbabilityPositionContextStateIndoor"];
    double v38 = v39;
    double v45 = v39;
  }
  if ([a3 containsValueForKey:@"kCLLocationCodingKeyProbabilityPositionContextStateOutdoor"])
  {
    [a3 decodeDoubleForKey:@"kCLLocationCodingKeyProbabilityPositionContextStateOutdoor"];
    double v37 = v40;
    double v44 = v40;
  }
  if ([a3 containsValueForKey:@"kCLLocationCodingKeySimulationParams"]) {
    [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLLocationCodingKeySimulationParams"];
  }
  uint64_t v35 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLLocationCodingKeyGnssOdometerInfo"];
LABEL_33:
  v42[6] = *(_OWORD *)v52;
  v42[7] = *(_OWORD *)&v52[16];
  v43[0] = v53[0];
  *(_OWORD *)((char *)v43 + 12) = *(_OWORD *)((char *)v53 + 12);
  v42[2] = *(_OWORD *)&v51[32];
  v42[3] = *(_OWORD *)&v51[48];
  v42[4] = *(_OWORD *)&v51[64];
  v42[5] = *(_OWORD *)&v51[80];
  v42[0] = *(_OWORD *)v51;
  v42[1] = *(_OWORD *)&v51[16];
  return [(CLLocation *)self initWithClientLocation:v42 matchInfo:v18 trustedTimestamp:v19 groundAltitude:v20 fusionInfo:v21 trackRunInfo:v36 rawHorizontalAccuracy:-1.0 rawAltitude:v25 rawVerticalAccuracy:v27 rawCourseAccuracy:v29 positionContextStateType:v32 probabilityPositionContextStateIndoor:v38 probabilityPositionContextStateOutdoor:v37 gnssOdometerInfo:v35 coarseMetaData:v22];
}

- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawAltitude:(double)a10 rawVerticalAccuracy:(double)a11 rawCourseAccuracy:(double)a12 positionContextStateType:(int)a13 probabilityPositionContextStateIndoor:(double)a14 probabilityPositionContextStateOutdoor:(double)a15 gnssOdometerInfo:(id)a16 coarseMetaData:(id)a17
{
  uint64_t v17 = *(void *)&a13;
  v39.receiver = self;
  v39.super_class = (Class)CLLocation;
  double v30 = [(CLLocation *)&v39 init];
  if (v30)
  {
    uint64_t v31 = [CLLocationInternal alloc];
    $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
    v37[6] = *(_OWORD *)&a3->var11;
    v37[7] = var13;
    v38[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v38 + 12) = *(_OWORD *)&a3->var16;
    long long v33 = *(_OWORD *)&a3->var5;
    v37[2] = *(_OWORD *)&a3->var3;
    v37[3] = v33;
    long long v34 = *(_OWORD *)&a3->var9;
    v37[4] = *(_OWORD *)&a3->var7;
    v37[5] = v34;
    long long v35 = *(_OWORD *)&a3->var1.var1;
    v37[0] = *(_OWORD *)&a3->var0;
    v37[1] = v35;
    v30->_internal = [(CLLocationInternal *)v31 initWithClientLocation:v37 matchInfo:a4 trustedTimestamp:a6 groundAltitude:a7 fusionInfo:a8 trackRunInfo:v17 rawHorizontalAccuracy:a5 rawAltitude:a9 rawVerticalAccuracy:a10 rawCourseAccuracy:a11 positionContextStateType:a12 probabilityPositionContextStateIndoor:a14 probabilityPositionContextStateOutdoor:a15 gnssOdometerInfo:a16 coarseMetaData:a17];
  }
  return v30;
}

- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 timestamp:(id)a7 referenceFrame:(int)a8
{
  return (CLLocation *)-[CLLocation _initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:floor:type:sourceParams:referenceFrame:](self, "_initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:floor:type:sourceParams:referenceFrame:", a7, 0x7FFFFFFFLL, 0, 0, *(void *)&a8, a3.latitude, a3.longitude, a4, a5, a6, -1.0, -1.0, -1.0, 0xBFF0000000000000);
}

- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy timestamp:(NSDate *)timestamp
{
  return (CLLocation *)-[CLLocation _initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:floor:type:sourceParams:referenceFrame:](self, "_initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:floor:type:sourceParams:referenceFrame:", timestamp, 0x7FFFFFFFLL, 0, 0, 0, coordinate.latitude, coordinate.longitude, altitude, hAccuracy, vAccuracy, -1.0, -1.0, -1.0, 0xBFF0000000000000);
}

- (id)_initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 timestamp:(id)a11 floor:(int)a12 type:(int)a13 sourceParams:(id)a14 referenceFrame:(int)a15
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  [a11 timeIntervalSinceReferenceDate];
  uint64_t v27 = v26;
  if (a14) {
    char v28 = [a14 isSimulatedBySoftware];
  }
  else {
    char v28 = 0;
  }
  int v32 = 0xFFFF;
  CLLocationDegrees v33 = latitude;
  CLLocationDegrees v34 = longitude;
  double v35 = a5;
  double v36 = a4;
  double v37 = a6;
  double v38 = a9;
  double v39 = a10;
  double v40 = a7;
  double v41 = a8;
  uint64_t v42 = v27;
  int v43 = 0;
  unint64_t v44 = 0xBFF0000000000000;
  int v45 = a13;
  long long v46 = *(long long *)((char *)&xmmword_1908864C8 + 4);
  unint64_t v47 = 0xBFF0000000000000;
  int v48 = a12;
  int v49 = 0;
  int v50 = a15;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  char v53 = v28;
  __int16 v54 = 0;
  char v55 = 0;
  return [(CLLocation *)self initWithClientLocation:&v32];
}

- (CLLocation)initWithClientLocation:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CLLocation;
  $F24F406B2B787EFB06265DBA3D28CBD5 v4 = [(CLLocation *)&v13 init];
  if (v4)
  {
    uint64_t v5 = [CLLocationInternal alloc];
    $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
    v11[6] = *(_OWORD *)&a3->var11;
    v11[7] = var13;
    v12[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)&a3->var16;
    long long v7 = *(_OWORD *)&a3->var5;
    _OWORD v11[2] = *(_OWORD *)&a3->var3;
    v11[3] = v7;
    long long v8 = *(_OWORD *)&a3->var9;
    v11[4] = *(_OWORD *)&a3->var7;
    v11[5] = v8;
    long long v9 = *(_OWORD *)&a3->var1.var1;
    v11[0] = *(_OWORD *)&a3->var0;
    v11[1] = v9;
    v4->_internal = [(CLLocationInternal *)v5 initWithClientLocation:v11];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  internal = (double *)self->_internal;
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeDouble:@"kCLLocationCodingKeyCoordinateLatitude" forKey:*(double *)((char *)internal + 12)];
    [a3 encodeDouble:@"kCLLocationCodingKeyCoordinateLongitude" forKey:*(double *)((char *)internal + 20)];
    [a3 encodeDouble:@"kCLLocationCodingKeyHorizontalAccuracy" forKey:*(double *)((char *)internal + 28)];
    [a3 encodeDouble:@"kCLLocationCodingKeyAltitude" forKey:*(double *)((char *)internal + 36)];
    [a3 encodeDouble:@"kCLLocationCodingKeyVerticalAccuracy" forKey:*(double *)((char *)internal + 44)];
    [a3 encodeDouble:@"kCLLocationCodingKeySpeed" forKey:*(double *)((char *)internal + 52)];
    [a3 encodeDouble:@"kCLLocationCodingKeySpeedAccuracy" forKey:*(double *)((char *)internal + 60)];
    [a3 encodeDouble:@"kCLLocationCodingKeyCourse" forKey:*(double *)((char *)internal + 68)];
    [a3 encodeDouble:@"kCLLocationCodingKeyCourseAccuracy" forKey:*(double *)((char *)internal + 76)];
    [a3 encodeDouble:@"kCLLocationCodingKeyTimestamp" forKey:*(double *)((char *)internal + 84)];
    [a3 encodeInt:*((unsigned int *)internal + 26) forKey:@"kCLLocationCodingKeyType"];
    [a3 encodeDouble:@"kCLLocationCodingKeyLifespan" forKey:internal[12]];
    [a3 encodeInt:*((unsigned int *)internal + 33) forKey:@"kCLLocationCodingKeyFloor"];
    [a3 encodeInt:*((unsigned int *)internal + 34) forKey:@"kCLLocationCodingKeyIntegrity"];
    [a3 encodeInt:*((unsigned int *)internal + 35) forKey:@"reserved"];
    [a3 encodeObject:*((void *)internal + 21) forKey:@"kCLLocationCodingKeyMatchInfo"];
    [a3 encodeObject:*((void *)internal + 22) forKey:@"kCLLocationCodingKeyGroundAltitude"];
    [a3 encodeObject:*((void *)internal + 25) forKey:@"kCLLocationCodingKeyFusionInfo"];
    [a3 encodeObject:*((void *)internal + 26) forKey:@"kCLLocationCodingKeyTrackRunInfo"];
    [a3 encodeObject:*((void *)internal + 24) forKey:@"kCLLocationCodingKeyCoarseMetaData"];
    [a3 encodeDouble:@"kCLLocationCodingKeyRawCoordinateLatitude" forKey:*(double *)((char *)internal + 108)];
    [a3 encodeDouble:@"kCLLocationCodingKeyRawCoordinateLongitude" forKey:*(double *)((char *)internal + 116)];
    [a3 encodeDouble:@"kCLLocationCodingKeyRawHorizontalAccuracy" forKey:internal[27]];
    [a3 encodeInt:*((unsigned int *)internal + 36) forKey:@"kCLLocationCodingKeyRawReferenceFrame"];
    [a3 encodeDouble:@"kCLLocationCodingKeyRawAltitude" forKey:internal[28]];
    [a3 encodeDouble:@"kCLLocationCodingKeyRawVerticalAccuracy" forKey:internal[29]];
    [a3 encodeDouble:@"kCLLocationCodingKeyRawCourse" forKey:*(double *)((char *)internal + 124)];
    [a3 encodeDouble:@"kCLLocationCodingKeyRawCourseAccuracy" forKey:internal[30]];
    [a3 encodeInt:*((unsigned int *)internal + 37) forKey:@"kCLLocationCodingKeySignalEnvironmentType"];
    [a3 encodeDouble:@"kCLLocationCodingKeyEllipsoidalAltitude" forKey:internal[19]];
    [a3 encodeInt:*((unsigned int *)internal + 62) forKey:@"kCLLocationCodingKeyPositionContextState"];
    [a3 encodeDouble:@"kCLLocationCodingKeyProbabilityPositionContextStateIndoor" forKey:internal[32]];
    [a3 encodeDouble:@"kCLLocationCodingKeyProbabilityPositionContextStateOutdoor" forKey:internal[33]];
    objc_msgSend(a3, "encodeObject:forKey:", -[CLLocation sourceInformation](self, "sourceInformation"), @"kCLLocationCodingKeySimulationParams");
    uint64_t v6 = *((void *)internal + 34);
    [a3 encodeObject:v6 forKey:@"kCLLocationCodingKeyGnssOdometerInfo"];
  }
  else
  {
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 12];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 20];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 28];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 36];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 44];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 52];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 60];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 68];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 76];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 84];
    [a3 encodeValueOfObjCType:"i" at:internal + 13];
    [a3 encodeValueOfObjCType:"d" at:internal + 12];
    [a3 encodeValueOfObjCType:"i" at:(char *)internal + 132];
    [a3 encodeValueOfObjCType:"I" at:internal + 17];
    [a3 encodeValueOfObjCType:"i" at:(char *)internal + 140];
    [a3 encodeObject:*((void *)internal + 21)];
    [a3 encodeObject:*((void *)internal + 22)];
    [a3 encodeObject:*((void *)internal + 25)];
    [a3 encodeObject:*((void *)internal + 26)];
    [a3 encodeObject:*((void *)internal + 24)];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 108];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 116];
    [a3 encodeValueOfObjCType:"d" at:internal + 27];
    [a3 encodeValueOfObjCType:"i" at:internal + 18];
    [a3 encodeValueOfObjCType:"d" at:internal + 28];
    [a3 encodeValueOfObjCType:"d" at:internal + 29];
    [a3 encodeValueOfObjCType:"d" at:(char *)internal + 124];
    [a3 encodeValueOfObjCType:"d" at:internal + 30];
    [a3 encodeValueOfObjCType:"i" at:(char *)internal + 148];
    [a3 encodeValueOfObjCType:"d" at:internal + 19];
    [a3 encodeValueOfObjCType:"i" at:internal + 31];
    [a3 encodeValueOfObjCType:"d" at:internal + 32];
    [a3 encodeValueOfObjCType:"d" at:internal + 33];
    objc_msgSend(a3, "encodeObject:", -[CLLocation sourceInformation](self, "sourceInformation"));
    uint64_t v7 = *((void *)internal + 34);
    [a3 encodeObject:v7];
  }
}

- (CLLocationSourceInformation)sourceInformation
{
  v2 = [[CLLocationSourceInformation alloc] initWithSoftwareSimulationState:*((unsigned __int8 *)self->_internal + 160) andExternalAccessoryState:*((_DWORD *)self->_internal + 26) == 3];

  return v2;
}

- (NSData)coarseMetaData
{
  id v2 = *((id *)self->_internal + 24);

  return (NSData *)v2;
}

- (id)_initWithRTLocation:(id)a3
{
  uint64_t v31 = 0;
  uint64_t v30 = 0;
  int v32 = 0;
  uint64_t v37 = 0;
  uint64_t v36 = 0;
  char v38 = 0;
  [a3 latitude];
  uint64_t v6 = v5;
  [a3 longitude];
  uint64_t v8 = v7;
  [a3 horizontalUncertainty];
  uint64_t v10 = v9;
  objc_msgSend((id)objc_msgSend(a3, "date"), "timeIntervalSinceReferenceDate");
  uint64_t v12 = v11;
  int v13 = [a3 referenceFrame];
  int v20 = 0xFFFF;
  uint64_t v21 = v6;
  uint64_t v22 = v8;
  uint64_t v23 = v10;
  __asm { FMOV            V0.2D, #-1.0 }
  long long v24 = xmmword_190882480;
  long long v25 = _Q0;
  long long v26 = _Q0;
  uint64_t v27 = v12;
  int v28 = 0;
  unint64_t v29 = 0xBFF0000000000000;
  unint64_t v33 = 0xBFF0000000000000;
  uint64_t v34 = 0x7FFFFFFFLL;
  int v35 = v13;
  return [(CLLocation *)self initWithClientLocation:&v20];
}

- (CLLocation)init
{
  return [(CLLocation *)self initWithLatitude:0.0 longitude:0.0];
}

- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy course:(CLLocationDirection)course speed:(CLLocationSpeed)speed timestamp:(NSDate *)timestamp
{
  return (CLLocation *)-[CLLocation _initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:floor:type:sourceParams:referenceFrame:](self, "_initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:timestamp:floor:type:sourceParams:referenceFrame:", timestamp, 0x7FFFFFFFLL, 0, 0, 0, coordinate.latitude, coordinate.longitude, altitude, hAccuracy, vAccuracy, course, -1.0, speed, 0xBFF0000000000000);
}

- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy course:(CLLocationDirection)course courseAccuracy:(CLLocationDirectionAccuracy)courseAccuracy speed:(CLLocationSpeed)speed speedAccuracy:(CLLocationSpeedAccuracy)speedAccuracy timestamp:(NSDate *)timestamp
{
  return (CLLocation *)[(CLLocation *)self _initWithCoordinate:timestamp altitude:0x7FFFFFFFLL horizontalAccuracy:0 verticalAccuracy:0 course:0 courseAccuracy:coordinate.latitude speed:coordinate.longitude speedAccuracy:altitude timestamp:hAccuracy floor:vAccuracy type:course sourceParams:courseAccuracy referenceFrame:speed];
}

- (CLLocation)initWithCoordinate:(CLLocationCoordinate2D)coordinate altitude:(CLLocationDistance)altitude horizontalAccuracy:(CLLocationAccuracy)hAccuracy verticalAccuracy:(CLLocationAccuracy)vAccuracy course:(CLLocationDirection)course courseAccuracy:(CLLocationDirectionAccuracy)courseAccuracy speed:(CLLocationSpeed)speed speedAccuracy:(CLLocationSpeedAccuracy)speedAccuracy timestamp:(NSDate *)timestamp sourceInfo:(CLLocationSourceInformation *)sourceInfo
{
  return (CLLocation *)[(CLLocation *)self _initWithCoordinate:timestamp altitude:0x7FFFFFFFLL horizontalAccuracy:0 verticalAccuracy:sourceInfo course:0 courseAccuracy:coordinate.latitude speed:coordinate.longitude speedAccuracy:altitude timestamp:hAccuracy floor:vAccuracy type:course sourceParams:courseAccuracy referenceFrame:speed];
}

- (CLLocation)initWithLatitude:(double)a3 longitude:(double)a4 altitude:(double)a5 speed:(double)a6 course:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 speedAccuracy:(double)a10 courseAccuracy:(double)a11 type:(int)a12 timestamp:(id)a13
{
  return (CLLocation *)[(CLLocation *)self _initWithCoordinate:a13 altitude:0x7FFFFFFFLL horizontalAccuracy:*(void *)&a12 verticalAccuracy:0 course:0 courseAccuracy:a3 speed:a4 speedAccuracy:a5 timestamp:a8 floor:a9 type:a7 sourceParams:a11 referenceFrame:a6];
}

- (CLLocation)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CLLocation;
  uint64_t v6 = [(CLLocation *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [CLLocationInternal alloc];
    $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
    v14[6] = *(_OWORD *)&a3->var11;
    v14[7] = var13;
    v15[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)&a3->var16;
    long long v9 = *(_OWORD *)&a3->var5;
    _OWORD v14[2] = *(_OWORD *)&a3->var3;
    v14[3] = v9;
    long long v10 = *(_OWORD *)&a3->var9;
    v14[4] = *(_OWORD *)&a3->var7;
    v14[5] = v10;
    long long v11 = *(_OWORD *)&a3->var1.var1;
    v14[0] = *(_OWORD *)&a3->var0;
    v14[1] = v11;
    memcpy(v13, a4, sizeof(v13));
    v6->_internal = [(CLLocationInternal *)v7 initWithClientLocation:v14 clientLocationPrivate:v13];
  }
  return v6;
}

- (CLLocation)initWithClientLocation:(id *)a3 clientLocationPrivate:(id *)a4 coarseMetaData:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)CLLocation;
  uint64_t v8 = [(CLLocation *)&v18 init];
  if (v8)
  {
    long long v9 = [CLLocationInternal alloc];
    $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
    v16[6] = *(_OWORD *)&a3->var11;
    v16[7] = var13;
    v17[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v17 + 12) = *(_OWORD *)&a3->var16;
    long long v11 = *(_OWORD *)&a3->var5;
    v16[2] = *(_OWORD *)&a3->var3;
    v16[3] = v11;
    long long v12 = *(_OWORD *)&a3->var9;
    v16[4] = *(_OWORD *)&a3->var7;
    v16[5] = v12;
    long long v13 = *(_OWORD *)&a3->var1.var1;
    v16[0] = *(_OWORD *)&a3->var0;
    v16[1] = v13;
    memcpy(v15, a4, sizeof(v15));
    v8->_internal = [(CLLocationInternal *)v9 initWithClientLocation:v16 clientLocationPrivate:v15 coarseMetaData:a5];
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)shortDescription
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  internal = (char *)self->_internal;
  sub_1907169EC(v10, 8uLL, *(double *)(internal + 68));
  objc_super v3 = NSString;
  long long v9 = *(_OWORD *)(internal + 12);
  uint64_t v4 = *(void *)(internal + 28);
  double v5 = *(double *)(internal + 52);
  if (v5 >= 0.0) {
    double v6 = v5 * 2.23693629;
  }
  else {
    double v6 = -1.0;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return (id)[v3 stringWithFormat:@"<%+.5f,%+.5f> ±%.2fm %.0fmph %s %.0fs", v9, v4, *(void *)&v6, v10, v7 - *(double *)(internal + 84)];
}

- (id)jsonObject
{
  v5[21] = *MEMORY[0x1E4F143B8];
  internal = (double *)self->_internal;
  v4[0] = @"suitability";
  v5[0] = [NSNumber numberWithUnsignedInt:*((unsigned int *)internal + 2)];
  v4[1] = @"latitude";
  v5[1] = [NSNumber numberWithDouble:*(double *)((char *)internal + 12)];
  v4[2] = @"longitude";
  v5[2] = [NSNumber numberWithDouble:*(double *)((char *)internal + 20)];
  v4[3] = @"horizontalAccuracy";
  v5[3] = [NSNumber numberWithDouble:*(double *)((char *)internal + 28)];
  v4[4] = @"altitude";
  v5[4] = [NSNumber numberWithDouble:*(double *)((char *)internal + 36)];
  v4[5] = @"verticalAccuracy";
  v5[5] = [NSNumber numberWithDouble:*(double *)((char *)internal + 44)];
  v4[6] = @"speed";
  v5[6] = [NSNumber numberWithDouble:*(double *)((char *)internal + 52)];
  v4[7] = @"course";
  v5[7] = [NSNumber numberWithDouble:*(double *)((char *)internal + 68)];
  v4[8] = @"courseAccuracy";
  v5[8] = [NSNumber numberWithDouble:*(double *)((char *)internal + 76)];
  v4[9] = @"timestamp";
  v5[9] = [NSNumber numberWithDouble:*(double *)((char *)internal + 84)];
  v4[10] = @"confidence";
  v5[10] = [NSNumber numberWithInt:*((unsigned int *)internal + 23)];
  v4[11] = @"lifespan";
  v5[11] = [NSNumber numberWithDouble:internal[12]];
  v4[12] = @"type";
  v5[12] = [NSNumber numberWithUnsignedInt:*((unsigned int *)internal + 26)];
  v4[13] = @"rawLatitude";
  v5[13] = [NSNumber numberWithDouble:*(double *)((char *)internal + 108)];
  v4[14] = @"rawLongitude";
  v5[14] = [NSNumber numberWithDouble:*(double *)((char *)internal + 116)];
  v4[15] = @"referenceFrame";
  v5[15] = [NSNumber numberWithUnsignedInt:*((unsigned int *)internal + 35)];
  v4[16] = @"rawReferenceFrame";
  v5[16] = [NSNumber numberWithUnsignedInt:*((unsigned int *)internal + 36)];
  v4[17] = @"signalEnvironment";
  v5[17] = [NSNumber numberWithUnsignedInt:*((unsigned int *)internal + 37)];
  v4[18] = @"ellipsoidalAltitude";
  v5[18] = [NSNumber numberWithDouble:internal[19]];
  v4[19] = @"isSoftwareSimulated";
  v5[19] = [NSNumber numberWithBool:*((unsigned __int8 *)internal + 160)];
  v4[20] = @"isFromExternalAccessory";
  v5[20] = [NSNumber numberWithInt:*((_DWORD *)internal + 26) == 3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:21];
}

- (void)setReferenceFrame:(int)a3
{
  *((_DWORD *)self->_internal + 35) = a3;
}

- (CLLocationCoordinate2D)rawCoordinate
{
  internal = (char *)self->_internal;
  double v3 = *(double *)(internal + 108);
  double v4 = *(double *)(internal + 116);
  result.CLLocationDegrees longitude = v4;
  result.CLLocationDegrees latitude = v3;
  return result;
}

- (double)rawAltitude
{
  return *((double *)self->_internal + 28);
}

- (CLLocationDistance)ellipsoidalAltitude
{
  return *((double *)self->_internal + 19);
}

- (double)rawHorizontalAccuracy
{
  return *((double *)self->_internal + 27);
}

- (double)rawVerticalAccuracy
{
  return *((double *)self->_internal + 29);
}

- (double)rawCourse
{
  return *(double *)((char *)self->_internal + 124);
}

- (double)rawCourseAccuracy
{
  return *((double *)self->_internal + 30);
}

- (double)magneticDeclination
{
  internal = (char *)self->_internal;
  strcpy((char *)&xmmword_1E92A0020, "/System/Library/Frameworks/CoreLocation.framework/Support/WMM.dat");
  float v3 = *(double *)(internal + 12);
  float v4 = *(double *)(internal + 20);
  float v5 = *(double *)(internal + 36);
  float v6 = sub_19073E4AC();
  v9[0] = 0;
  v9[1] = 0;
  int v11 = 0;
  uint64_t v10 = 0;
  int v7 = sub_190733E80((uint64_t)v9, v3, v4, v5, v6);
  double result = *((float *)&v10 + 1);
  if (v7) {
    return 0.0;
  }
  return result;
}

- (double)trustedTimestamp
{
  return *((double *)self->_internal + 23);
}

- (int)positionContextState
{
  return *((_DWORD *)self->_internal + 62);
}

- (double)probabilityPositionContextStateIndoor
{
  return *((double *)self->_internal + 32);
}

- (double)probabilityPositionContextStateOutdoor
{
  return *((double *)self->_internal + 33);
}

- (BOOL)isAltitudeWgs84Available
{
  internal = (char *)self->_internal;
  float v3 = (void *)*((void *)internal + 22);
  return *(double *)(internal + 44) >= 0.0 && v3 != 0 && [v3 undulationModel] != -1;
}

- (double)altitudeWgs84
{
  internal = (char *)self->_internal;
  float v3 = (void *)*((void *)internal + 22);
  BOOL v4 = [(CLLocation *)self isAltitudeWgs84Available];
  double v5 = *(double *)(internal + 36);
  if (v4)
  {
    [v3 undulation];
    return v5 + v6;
  }
  return v5;
}

- (BOOL)isCoordinateFused
{
  return [*((id *)self->_internal + 25) isCoordinateFused];
}

- (BOOL)isCoordinateFusedWithVL
{
  return MEMORY[0x1F4181798](*((void *)self->_internal + 25), sel_isCoordinateFusedWithVL);
}

- (id)snapToResolution:(double)a3
{
  internal = (char *)self->_internal;
  long long v4 = *(_OWORD *)(internal + 120);
  long long v19 = *(_OWORD *)(internal + 104);
  long long v20 = v4;
  v21[0] = *(_OWORD *)(internal + 136);
  *(_OWORD *)((char *)v21 + 12) = *(_OWORD *)(internal + 148);
  long long v5 = *(_OWORD *)(internal + 56);
  long long v15 = *(_OWORD *)(internal + 40);
  long long v16 = v5;
  long long v6 = *(_OWORD *)(internal + 88);
  long long v17 = *(_OWORD *)(internal + 72);
  long long v18 = v6;
  unsigned long long v7 = *(_OWORD *)(internal + 24);
  long long v13 = *(_OWORD *)(internal + 8);
  unsigned long long v14 = v7;
  double v8 = a3 * 1.41421356;
  if (COERCE_DOUBLE(v7 >> 32) < a3 * 1.41421356)
  {
    sub_190715718((double *)((char *)&v13 + 4), (double *)((unint64_t)&v13 | 0xC), a3);
    *(double *)((char *)&v14 + 4) = v8;
  }
  long long v9 = [CLLocation alloc];
  v11[6] = v19;
  v11[7] = v20;
  v12[0] = v21[0];
  *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)((char *)v21 + 12);
  _OWORD v11[2] = v15;
  v11[3] = v16;
  v11[4] = v17;
  v11[5] = v18;
  v11[0] = v13;
  v11[1] = v14;
  return [(CLLocation *)v9 initWithClientLocation:v11];
}

- (id)propagateLocationToTime:(double)a3
{
  internal = (char *)self->_internal;
  long long v14 = xmmword_1908864C8;
  long long v15 = unk_1908864D8;
  memset(v16, 0, 28);
  long long v10 = xmmword_190886488;
  long long v11 = unk_190886498;
  long long v12 = xmmword_1908864A8;
  long long v13 = unk_1908864B8;
  long long v8 = xmmword_190886468;
  long long v9 = unk_190886478;
  sub_1907BC0C0(internal + 8, (uint64_t)&v8, a3);
  long long v4 = [CLLocation alloc];
  v6[6] = v14;
  v6[7] = v15;
  v7[0] = v16[0];
  *(_OWORD *)((char *)v7 + 12) = *(_OWORD *)((char *)v16 + 12);
  v6[2] = v10;
  v6[3] = v11;
  v6[4] = v12;
  v6[5] = v13;
  v6[0] = v8;
  v6[1] = v9;
  return [(CLLocation *)v4 initWithClientLocation:v6];
}

- (NSString)iso6709Notation
{
  Iso6709Notation = (__CFString *)CLClientCreateIso6709Notation((uint64_t)self->_internal + 8);

  return (NSString *)Iso6709Notation;
}

- (CLLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4 trustedTimestamp:(double)a5 groundAltitude:(id)a6 fusionInfo:(id)a7 trackRunInfo:(id)a8 rawHorizontalAccuracy:(double)a9 rawCourseAccuracy:(double)a10 coarseMetaData:(id)a11
{
  v33.receiver = self;
  v33.super_class = (Class)CLLocation;
  long long v20 = [(CLLocation *)&v33 init];
  if (v20)
  {
    uint64_t v21 = [CLLocationInternal alloc];
    double v22 = *(double *)((char *)&a3->var2 + 4);
    $F24F406B2B787EFB06265DBA3D28CBD5 var13 = a3->var13;
    long long v24 = *(_OWORD *)&a3->var14;
    long long v25 = *(_OWORD *)&a3->var9;
    v31[6] = *(_OWORD *)&a3->var11;
    v31[7] = var13;
    v32[0] = v24;
    *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)&a3->var16;
    long long v26 = *(_OWORD *)&a3->var5;
    long long v27 = *(_OWORD *)&a3->var7;
    v31[2] = *(_OWORD *)&a3->var3;
    v31[3] = v26;
    double v28 = *(double *)((char *)&a3->var3 + 4);
    v31[4] = v27;
    v31[5] = v25;
    long long v29 = *(_OWORD *)&a3->var1.var1;
    v31[0] = *(_OWORD *)&a3->var0;
    v31[1] = v29;
    v20->_internal = [(CLLocationInternal *)v21 initWithClientLocation:v31 matchInfo:a4 trustedTimestamp:a6 groundAltitude:a7 fusionInfo:a8 trackRunInfo:0 rawHorizontalAccuracy:a5 rawAltitude:a9 rawVerticalAccuracy:v22 rawCourseAccuracy:v28 positionContextStateType:a10 probabilityPositionContextStateIndoor:0.0 probabilityPositionContextStateOutdoor:0.0 gnssOdometerInfo:0 coarseMetaData:a11];
  }
  return v20;
}

- (void)unmatch
{
  internal = (char *)self->_internal;
  if ([*((id *)internal + 25) isCoordinateFused])
  {
    [*((id *)internal + 25) coordinate];
    *(void *)(internal + 12) = v3;
    *(void *)(internal + 20) = v4;
    [*((id *)internal + 25) horizontalAccuracy];
    *(void *)(internal + 28) = v5;
    *((_DWORD *)internal + 35) = [*((id *)internal + 25) referenceFrame];
    [*((id *)internal + 25) verticalAccuracy];
    if (fabs(v6) != INFINITY)
    {
      [*((id *)internal + 25) verticalAccuracy];
      if (v7 > 0.0)
      {
        [*((id *)internal + 25) altitude];
        *(void *)(internal + 36) = v8;
        [*((id *)internal + 25) verticalAccuracy];
        *(void *)(internal + 44) = v9;
      }
    }
    [*((id *)internal + 25) courseAccuracy];
    if (fabs(v10) != INFINITY)
    {
      [*((id *)internal + 25) courseAccuracy];
      if (v11 > 0.0)
      {
        [*((id *)internal + 25) course];
        *(void *)(internal + 68) = v12;
        [*((id *)internal + 25) courseAccuracy];
LABEL_32:
        *(void *)(internal + 76) = v13;
      }
    }
  }
  else
  {
    *(_OWORD *)(internal + 12) = *(_OWORD *)(internal + 108);
    *((_DWORD *)internal + 35) = *((_DWORD *)internal + 36);
    uint64_t v14 = *((void *)internal + 27);
    if (v14 >= 0 && ((v14 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
      || (unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      *(void *)(internal + 28) = *((void *)internal + 27);
    }
    uint64_t v17 = *((void *)internal + 29);
    if (v17 >= 0 && ((v17 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
      || (unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      *(void *)(internal + 36) = *((void *)internal + 28);
      *(void *)(internal + 44) = v17;
    }
    double v20 = *(double *)(internal + 124);
    if (v20 >= 0.0)
    {
      *(double *)(internal + 68) = v20;
      uint64_t v13 = *((void *)internal + 30);
      BOOL v21 = v13 < 0 || ((v13 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
      if (!v21 || (unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFELL) {
        goto LABEL_32;
      }
    }
  }
}

- (_CLLocationGroundAltitude)_groundAltitude
{
  id internal = self->_internal;
  uint64_t v3 = (_CLLocationGroundAltitude *)*((void *)internal + 22);
  if (!v3) {
    return 0;
  }
  [*((id *)internal + 22) uncertainty];
  [(_CLLocationGroundAltitude *)v3 uncertainty];
  if (v4 <= 0.0) {
    return 0;
  }
  return v3;
}

- (_CLLocationFusionInfo)_fusionInfo
{
  return (_CLLocationFusionInfo *)*((void *)self->_internal + 25);
}

- (CLLocationGnssOdometerInfo)gnssOdometerInfo
{
  return (CLLocationGnssOdometerInfo *)*((void *)self->_internal + 34);
}

- (CLLocationTrackRunInfo)trackRunInfo
{
  return (CLLocationTrackRunInfo *)*((void *)self->_internal + 26);
}

@end