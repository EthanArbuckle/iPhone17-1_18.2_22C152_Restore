@interface HKCoordinateTransform
- (BOOL)isEqual:(id)a3;
- (double)coordinateForValue:(id)a3;
- (id)valueForCoordinate:(double)a3;
@end

@implementation HKCoordinateTransform

- (double)coordinateForValue:(id)a3
{
  [a3 doubleValue];
  return result;
}

- (id)valueForCoordinate:(double)a3
{
  return (id)[NSNumber numberWithDouble:a3];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = objc_opt_class();
  return [(HKCoordinateTransform *)self isMemberOfClass:v4];
}

@end