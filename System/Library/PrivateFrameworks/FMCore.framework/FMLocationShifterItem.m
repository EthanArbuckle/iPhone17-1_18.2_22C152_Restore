@interface FMLocationShifterItem
- (BOOL)shifted;
- (CLLocationCoordinate2D)coordinate;
- (FMLocationShifterItem)init;
- (FMLocationShifterItem)initWithCoordinate:(CLLocationCoordinate2D)a3 accuracy:(double)a4 timestamp:(id)a5 context:(id)a6;
- (NSDate)timestamp;
- (NSError)error;
- (double)accuracy;
- (id)context;
- (id)description;
- (void)setAccuracy:(double)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setError:(id)a3;
- (void)setShifted:(BOOL)a3;
@end

@implementation FMLocationShifterItem

- (FMLocationShifterItem)init
{
  return 0;
}

- (FMLocationShifterItem)initWithCoordinate:(CLLocationCoordinate2D)a3 accuracy:(double)a4 timestamp:(id)a5 context:(id)a6
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)FMLocationShifterItem;
  v14 = [(FMLocationShifterItem *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_coordinate.CLLocationDegrees latitude = latitude;
    v14->_coordinate.CLLocationDegrees longitude = longitude;
    v14->_accuracy = a4;
    objc_storeStrong((id *)&v14->_timestamp, a5);
    objc_storeStrong(&v15->_context, a6);
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(FMLocationShifterItem *)self coordinate];
  uint64_t v6 = v5;
  [(FMLocationShifterItem *)self coordinate];
  uint64_t v8 = v7;
  [(FMLocationShifterItem *)self accuracy];
  uint64_t v10 = v9;
  v11 = [(FMLocationShifterItem *)self context];
  BOOL v12 = [(FMLocationShifterItem *)self shifted];
  id v13 = [(FMLocationShifterItem *)self error];
  v14 = [v3 stringWithFormat:@"<%@: %p %.6f, %.6f @ %.3f ctx:%p s:%d e:%@>", v4, self, v6, v8, v10, v11, v12, v13];

  return v14;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(double)a3
{
  self->_accuracy = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (id)context
{
  return self->_context;
}

- (BOOL)shifted
{
  return self->_shifted;
}

- (void)setShifted:(BOOL)a3
{
  self->_shifted = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end