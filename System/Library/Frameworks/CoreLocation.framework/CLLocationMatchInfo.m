@interface CLLocationMatchInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isMatchShifted;
- (CLLocationCoordinate2D)matchCoordinate;
- (CLLocationMatchInfo)initWithCoder:(id)a3;
- (CLLocationMatchInfo)initWithMatchQuality:(int64_t)a3 matchCoordinate:(CLLocationCoordinate2D)a4 matchCourse:(double)a5 matchFormOfWay:(int)a6 matchRoadClass:(int)a7 matchShifted:(BOOL)a8;
- (CLLocationMatchInfo)initWithMatchQuality:(int64_t)a3 matchCoordinate:(CLLocationCoordinate2D)a4 matchCourse:(double)a5 matchFormOfWay:(int)a6 matchRoadClass:(int)a7 matchShifted:(BOOL)a8 matchDataArray:(id)a9;
- (NSData)matchDataArray;
- (double)matchCourse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shortDescription;
- (int)matchFormOfWay;
- (int)matchRoadClass;
- (int64_t)matchQuality;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLLocationMatchInfo

- (CLLocationMatchInfo)initWithMatchQuality:(int64_t)a3 matchCoordinate:(CLLocationCoordinate2D)a4 matchCourse:(double)a5 matchFormOfWay:(int)a6 matchRoadClass:(int)a7 matchShifted:(BOOL)a8 matchDataArray:(id)a9
{
  BOOL v10 = a8;
  uint64_t v11 = *(void *)&a7;
  uint64_t v12 = *(void *)&a6;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  v19.receiver = self;
  v19.super_class = (Class)CLLocationMatchInfo;
  v17 = [(CLLocationMatchInfo *)&v19 init];
  if (v17) {
    v17->_internal = -[CLLocationMatchInfoInternal initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:matchDataArray:]([CLLocationMatchInfoInternal alloc], "initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:matchDataArray:", a3, v12, v11, v10, a9, latitude, longitude, a5);
  }
  return v17;
}

- (CLLocationMatchInfo)initWithMatchQuality:(int64_t)a3 matchCoordinate:(CLLocationCoordinate2D)a4 matchCourse:(double)a5 matchFormOfWay:(int)a6 matchRoadClass:(int)a7 matchShifted:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  v17.receiver = self;
  v17.super_class = (Class)CLLocationMatchInfo;
  v15 = [(CLLocationMatchInfo *)&v17 init];
  if (v15) {
    v15->_internal = -[CLLocationMatchInfoInternal initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:matchDataArray:]([CLLocationMatchInfoInternal alloc], "initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:matchDataArray:", a3, v10, v9, v8, 0, latitude, longitude, a5);
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLLocationMatchInfo)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeIntegerForKey:@"kCLLocationMatchInfoCodingKeyMatchQuality"];
  [a3 decodeDoubleForKey:@"kCLLocationMatchInfoCodingKeyMatchCoordinateLatitude"];
  double v7 = v6;
  [a3 decodeDoubleForKey:@"kCLLocationMatchInfoCodingKeyMatchCoordinateLongitude"];
  double v9 = v8;
  [a3 decodeDoubleForKey:@"kCLLocationMatchInfoCodingKeyMatchCourse"];
  double v11 = v10;
  uint64_t v12 = [a3 decodeInt32ForKey:@"kCLLocationMatchInfoCodingKeyMatchFormOfWay"];
  uint64_t v13 = [a3 decodeInt32ForKey:@"kCLLocationMatchInfoCodingKeyMatchRoadClass"];
  uint64_t v14 = [a3 decodeBoolForKey:@"kCLLocationMatchInfoCodingKeyMatchShifted"];
  uint64_t v15 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLLocationMatchInfoCodingKeyMatchDataArray"];

  return -[CLLocationMatchInfo initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:matchDataArray:](self, "initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:matchDataArray:", v5, v12, v13, v14, v15, v7, v9, v11);
}

- (void)encodeWithCoder:(id)a3
{
  internal = (double *)self->_internal;
  [a3 encodeInteger:*((void *)internal + 1) forKey:@"kCLLocationMatchInfoCodingKeyMatchQuality"];
  [a3 encodeDouble:@"kCLLocationMatchInfoCodingKeyMatchCoordinateLatitude" forKey:internal[2]];
  [a3 encodeDouble:@"kCLLocationMatchInfoCodingKeyMatchCoordinateLongitude" forKey:internal[3]];
  [a3 encodeDouble:@"kCLLocationMatchInfoCodingKeyMatchCourse" forKey:internal[4]];
  [a3 encodeInt32:*((unsigned int *)internal + 10) forKey:@"kCLLocationMatchInfoCodingKeyMatchFormOfWay"];
  [a3 encodeInt32:*((unsigned int *)internal + 11) forKey:@"kCLLocationMatchInfoCodingKeyMatchRoadClass"];
  [a3 encodeBool:*((unsigned __int8 *)internal + 48) forKey:@"kCLLocationMatchInfoCodingKeyMatchShifted"];
  uint64_t v5 = *((void *)internal + 7);

  [a3 encodeObject:v5 forKey:@"kCLLocationMatchInfoCodingKeyMatchDataArray"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationMatchInfo;
  [(CLLocationMatchInfo *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [self->_internal copyWithZone:a3];
  return v5;
}

- (id)description
{
  internal = self->_internal;
  return (id)[NSString stringWithFormat:@"matchQuality %ld matchCoordinate <%+.8f,%+.8f> matchCourse %.2f matchFormOfWay %d matchRoadClass %d matchShifted %d", internal[1], internal[2], internal[3], internal[4], *((unsigned int *)internal + 10), *((unsigned int *)internal + 11), *((unsigned __int8 *)internal + 48)];
}

- (id)shortDescription
{
  internal = self->_internal;
  return (id)[NSString stringWithFormat:@"%ld <%+.8f,%+.8f> %.2f %d %d %d", internal[1], internal[2], internal[3], internal[4], *((unsigned int *)internal + 10), *((unsigned int *)internal + 11), *((unsigned __int8 *)internal + 48)];
}

- (int64_t)matchQuality
{
  return *((void *)self->_internal + 1);
}

- (CLLocationCoordinate2D)matchCoordinate
{
  internal = (double *)self->_internal;
  double v3 = internal[2];
  double v4 = internal[3];
  result.double longitude = v4;
  result.double latitude = v3;
  return result;
}

- (double)matchCourse
{
  return *((double *)self->_internal + 4);
}

- (int)matchFormOfWay
{
  return *((_DWORD *)self->_internal + 10);
}

- (int)matchRoadClass
{
  return *((_DWORD *)self->_internal + 11);
}

- (BOOL)isMatchShifted
{
  return *((unsigned char *)self->_internal + 48);
}

- (NSData)matchDataArray
{
  return (NSData *)*((void *)self->_internal + 7);
}

@end