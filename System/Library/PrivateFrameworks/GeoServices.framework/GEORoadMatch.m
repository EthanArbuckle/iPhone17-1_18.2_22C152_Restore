@interface GEORoadMatch
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnRoad;
- (GEOMultiSectionFeature)roadFeature;
- (GEORoadMatch)initWithCoder:(id)a3;
- (GEORoadMatch)initWithCoordinateOnRoad:(id)a3 courseOnRoad:(double)a4;
- (NSString)roadName;
- (double)courseOnRoad;
- (double)distanceFromJunction;
- (double)distanceFromRoad;
- (double)junctionRadius;
- (double)roadWidth;
- (void)encodeWithCoder:(id)a3;
- (void)setCoordinateOnRoad:(id)a3;
- (void)setCourseOnRoad:(double)a3;
- (void)setDistanceFromJunction:(double)a3;
- (void)setDistanceFromRoad:(double)a3;
- (void)setJunctionRadius:(double)a3;
- (void)setRoadFeature:(id)a3;
- (void)setRoadName:(id)a3;
- (void)setRoadWidth:(double)a3;
@end

@implementation GEORoadMatch

- (GEORoadMatch)initWithCoordinateOnRoad:(id)a3 courseOnRoad:(double)a4
{
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v9.receiver = self;
  v9.super_class = (Class)GEORoadMatch;
  result = [(GEORoadMatch *)&v9 init];
  if (result)
  {
    result->_coordinateOnRoad.latitude = var0;
    result->_coordinateOnRoad.longitude = var1;
    result->_coordinateOnRoad.altitude = var2;
    result->_courseOnRoad = a4;
  }
  return result;
}

- (void)setRoadFeature:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORoadMatch)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEORoadMatch;
  v5 = [(GEORoadMatch *)&v13 init];
  if (v5)
  {
    unint64_t v12 = 0;
    id v6 = v4;
    v7 = (const void *)[v6 decodeBytesForKey:@"_coordinateOnRoad" returnedLength:&v12];
    if (v12 && v7)
    {
      if (v12 >= 0x18) {
        size_t v8 = 24;
      }
      else {
        size_t v8 = v12;
      }
      memcpy(&v5->_coordinateOnRoad, v7, v8);
    }
    [v6 decodeDoubleForKey:@"_courseOnRoad"];
    v5->_courseOnRoad = v9;
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBytes:&self->_coordinateOnRoad length:24 forKey:@"_coordinateOnRoad"];
  [v4 encodeDouble:@"_courseOnRoad" forKey:self->_courseOnRoad];
}

- (GEOMultiSectionFeature)roadFeature
{
  return self->_roadFeature;
}

- (NSString)roadName
{
  return self->_roadName;
}

- (void)setRoadName:(id)a3
{
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateOnRoad
{
  double latitude = self->_coordinateOnRoad.latitude;
  double longitude = self->_coordinateOnRoad.longitude;
  double altitude = self->_coordinateOnRoad.altitude;
  result.double var2 = altitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (void)setCoordinateOnRoad:(id)a3
{
  self->_coordinateOnRoad = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (double)courseOnRoad
{
  return self->_courseOnRoad;
}

- (void)setCourseOnRoad:(double)a3
{
  self->_courseOnRoad = a3;
}

- (double)distanceFromRoad
{
  return self->_distanceFromRoad;
}

- (void)setDistanceFromRoad:(double)a3
{
  self->_distanceFromRoad = a3;
}

- (double)roadWidth
{
  return self->_roadWidth;
}

- (void)setRoadWidth:(double)a3
{
  self->_roadWidth = a3;
}

- (double)distanceFromJunction
{
  return self->_distanceFromJunction;
}

- (void)setDistanceFromJunction:(double)a3
{
  self->_distanceFromJunction = a3;
}

- (double)junctionRadius
{
  return self->_junctionRadius;
}

- (void)setJunctionRadius:(double)a3
{
  self->_junctionRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadName, 0);

  objc_storeStrong((id *)&self->_roadFeature, 0);
}

@end