@interface _CLLocationFusionInfo
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)isCoordinateFused;
- (BOOL)isCoordinateFusedWithVL;
- (_CLLocationFusionInfo)init;
- (_CLLocationFusionInfo)initWithCoder:(id)a3;
- (_CLLocationFusionInfo)initWithCoordinateFused:(BOOL)a3 coordinateFusedWithVL:(BOOL)a4 coordinate:(id)a5 horizontalAccuracy:(double)a6 referenceFrame:(int)a7 altitude:(double)a8 verticalAccuracy:(double)a9 course:(double)a10 courseAccuracy:(double)a11;
- (double)altitude;
- (double)course;
- (double)courseAccuracy;
- (double)horizontalAccuracy;
- (double)verticalAccuracy;
- (int)referenceFrame;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CLLocationFusionInfo

- (_CLLocationFusionInfo)init
{
  return -[_CLLocationFusionInfo initWithCoordinateFused:coordinateFusedWithVL:coordinate:horizontalAccuracy:referenceFrame:altitude:verticalAccuracy:course:courseAccuracy:](self, "initWithCoordinateFused:coordinateFusedWithVL:coordinate:horizontalAccuracy:referenceFrame:altitude:verticalAccuracy:course:courseAccuracy:", 0, 0, 0, 0.0, 0.0, -1.0, 0.0, -1.0, -1.0, -1.0);
}

- (_CLLocationFusionInfo)initWithCoordinateFused:(BOOL)a3 coordinateFusedWithVL:(BOOL)a4 coordinate:(id)a5 horizontalAccuracy:(double)a6 referenceFrame:(int)a7 altitude:(double)a8 verticalAccuracy:(double)a9 course:(double)a10 courseAccuracy:(double)a11
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  v26.receiver = self;
  v26.super_class = (Class)_CLLocationFusionInfo;
  result = [(_CLLocationFusionInfo *)&v26 init];
  if (result)
  {
    BOOL v23 = (((*(void *)&a6 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF || a6 < 0.0)
       && (unint64_t)(*(void *)&a6 - 1) >= 0xFFFFFFFFFFFFFLL;
    BOOL v24 = !v23 && a3;
    result->_coordinateFused = v24;
    BOOL v25 = !v23 && a4;
    result->_coordinateFusedWithVL = v25;
    result->_coordinate.latitude = var0;
    result->_coordinate.longitude = var1;
    result->_referenceFrame = a7;
    result->_horizontalAccuracy = a6;
    result->_altitude = a8;
    result->_verticalAccuracy = a9;
    result->_course = a10;
    result->_courseAccuracy = a11;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLLocationFusionInfo)initWithCoder:(id)a3
{
  __int16 v31 = 0;
  double v29 = 0.0;
  double v30 = 0.0;
  *(double *)&unint64_t v28 = -1.0;
  unsigned int v27 = 0;
  *(double *)&unint64_t v25 = -1.0;
  double v26 = 0.0;
  *(double *)&unint64_t v23 = -1.0;
  *(double *)&unint64_t v24 = -1.0;
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [a3 decodeBoolForKey:@"coordinateFused"];
    HIBYTE(v31) = v5;
    if ([a3 containsValueForKey:@"coordinateFusedWithVL"])
    {
      int v6 = [a3 decodeBoolForKey:@"coordinateFusedWithVL"];
      LOBYTE(v31) = v6;
    }
    else
    {
      int v6 = 0;
    }
    [a3 decodeDoubleForKey:@"coordinateLatitude"];
    double v7 = v15;
    double v29 = v15;
    [a3 decodeDoubleForKey:@"coordinateLongitude"];
    double v14 = v16;
    double v30 = v16;
    [a3 decodeDoubleForKey:@"horizontalAccuracy"];
    double v8 = v17;
    *(double *)&unint64_t v28 = v17;
    uint64_t v9 = [a3 decodeIntForKey:@"referenceFrame"];
    unsigned int v27 = v9;
    double v10 = 0.0;
    if ([a3 containsValueForKey:@"altitude"])
    {
      [a3 decodeDoubleForKey:@"altitude"];
      double v10 = v18;
      double v26 = v18;
    }
    double v11 = -1.0;
    if ([a3 containsValueForKey:@"verticalAccuracy"])
    {
      [a3 decodeDoubleForKey:@"verticalAccuracy"];
      double v11 = v19;
      *(double *)&unint64_t v25 = v19;
    }
    [a3 decodeDoubleForKey:@"course"];
    double v13 = v20;
    *(double *)&unint64_t v24 = v20;
    [a3 decodeDoubleForKey:@"courseAccuracy"];
    double v12 = v21;
    *(double *)&unint64_t v23 = v21;
  }
  else
  {
    [a3 decodeValueOfObjCType:"B" at:(char *)&v31 + 1];
    [a3 decodeValueOfObjCType:"B" at:&v31];
    [a3 decodeValueOfObjCType:"d" at:&v29];
    [a3 decodeValueOfObjCType:"d" at:&v30];
    [a3 decodeValueOfObjCType:"d" at:&v28];
    [a3 decodeValueOfObjCType:"i" at:&v27];
    [a3 decodeValueOfObjCType:"d" at:&v26];
    [a3 decodeValueOfObjCType:"d" at:&v25];
    [a3 decodeValueOfObjCType:"d" at:&v24];
    [a3 decodeValueOfObjCType:"d" at:&v23];
    int v6 = v31;
    double v8 = *(double *)&v28;
    double v7 = v29;
    uint64_t v9 = v27;
    double v11 = *(double *)&v25;
    double v10 = v26;
    double v12 = *(double *)&v23;
    double v13 = *(double *)&v24;
    double v14 = v30;
    uint64_t v5 = HIBYTE(v31) != 0;
  }
  return -[_CLLocationFusionInfo initWithCoordinateFused:coordinateFusedWithVL:coordinate:horizontalAccuracy:referenceFrame:altitude:verticalAccuracy:course:courseAccuracy:](self, "initWithCoordinateFused:coordinateFusedWithVL:coordinate:horizontalAccuracy:referenceFrame:altitude:verticalAccuracy:course:courseAccuracy:", v5, v6 != 0, v9, v7, v14, v8, v10, v11, v13, v12);
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeBool:self->_coordinateFused forKey:@"coordinateFused"];
    [a3 encodeBool:self->_coordinateFusedWithVL forKey:@"coordinateFusedWithVL"];
    [a3 encodeDouble:@"coordinateLatitude" forKey:self->_coordinate.latitude];
    [a3 encodeDouble:@"coordinateLongitude" forKey:self->_coordinate.longitude];
    [a3 encodeDouble:@"horizontalAccuracy" forKey:self->_horizontalAccuracy];
    [a3 encodeInt:self->_referenceFrame forKey:@"referenceFrame"];
    [a3 encodeDouble:@"altitude" forKey:self->_altitude];
    [a3 encodeDouble:@"verticalAccuracy" forKey:self->_verticalAccuracy];
    [a3 encodeDouble:@"course" forKey:self->_course];
    double courseAccuracy = self->_courseAccuracy;
    [a3 encodeDouble:@"courseAccuracy" forKey:courseAccuracy];
  }
  else
  {
    [a3 encodeValueOfObjCType:"B" at:&self->_coordinateFused];
    [a3 encodeValueOfObjCType:"B" at:&self->_coordinateFusedWithVL];
    [a3 encodeValueOfObjCType:"d" at:&self->_coordinate];
    [a3 encodeValueOfObjCType:"d" at:&self->_coordinate.longitude];
    [a3 encodeValueOfObjCType:"d" at:&self->_horizontalAccuracy];
    [a3 encodeValueOfObjCType:"i" at:&self->_referenceFrame];
    [a3 encodeValueOfObjCType:"d" at:&self->_altitude];
    [a3 encodeValueOfObjCType:"d" at:&self->_verticalAccuracy];
    [a3 encodeValueOfObjCType:"d" at:&self->_course];
    [a3 encodeValueOfObjCType:"d" at:&self->_courseAccuracy];
  }
}

- (BOOL)isCoordinateFused
{
  return self->_coordinateFused;
}

- (BOOL)isCoordinateFusedWithVL
{
  return self->_coordinateFusedWithVL;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (double)course
{
  return self->_course;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

@end