@interface CLLocationMatchInfoInternal
- (CLLocationMatchInfoInternal)initWithMatchQuality:(int64_t)a3 matchCoordinate:(CLLocationCoordinate2D)a4 matchCourse:(double)a5 matchFormOfWay:(int)a6 matchRoadClass:(int)a7 matchShifted:(BOOL)a8 matchDataArray:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation CLLocationMatchInfoInternal

- (CLLocationMatchInfoInternal)initWithMatchQuality:(int64_t)a3 matchCoordinate:(CLLocationCoordinate2D)a4 matchCourse:(double)a5 matchFormOfWay:(int)a6 matchRoadClass:(int)a7 matchShifted:(BOOL)a8 matchDataArray:(id)a9
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  v20.receiver = self;
  v20.super_class = (Class)CLLocationMatchInfoInternal;
  v17 = [(CLLocationMatchInfoInternal *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->fMatchQuality = a3;
    v17->fMatchCoordinate.CLLocationDegrees latitude = latitude;
    v17->fMatchCoordinate.CLLocationDegrees longitude = longitude;
    v17->fMatchCourse = a5;
    v17->fMatchFormOfWay = a6;
    v17->fMatchRoadClass = a7;
    v17->fMatchShifted = a8;
    v17->fMatchDataArray = (NSData *)[a9 copy];
  }
  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationMatchInfoInternal;
  [(CLLocationMatchInfoInternal *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t fMatchQuality = self->fMatchQuality;
  double longitude = self->fMatchCoordinate.longitude;
  double fMatchCourse = self->fMatchCourse;
  uint64_t fMatchFormOfWay = self->fMatchFormOfWay;
  uint64_t fMatchRoadClass = self->fMatchRoadClass;
  BOOL fMatchShifted = self->fMatchShifted;
  fMatchDataArray = self->fMatchDataArray;
  double latitude = self->fMatchCoordinate.latitude;

  return (id)objc_msgSend(v4, "initWithMatchQuality:matchCoordinate:matchCourse:matchFormOfWay:matchRoadClass:matchShifted:matchDataArray:", fMatchQuality, fMatchFormOfWay, fMatchRoadClass, fMatchShifted, fMatchDataArray, latitude, longitude, fMatchCourse);
}

@end