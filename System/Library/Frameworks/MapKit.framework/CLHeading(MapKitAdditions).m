@interface CLHeading(MapKitAdditions)
- (BOOL)hasGeomagneticVector;
- (id)compactDescription;
- (uint64_t)heading;
- (uint64_t)initWithHeading:()MapKitAdditions accuracy:;
@end

@implementation CLHeading(MapKitAdditions)

- (uint64_t)heading
{
  [a1 trueHeading];
  if (v2 >= 0.0)
  {
    return [a1 trueHeading];
  }
  else
  {
    return [a1 magneticHeading];
  }
}

- (uint64_t)initWithHeading:()MapKitAdditions accuracy:
{
  memset(v4, 0, sizeof(v4));
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v9 = 0;
  double v5 = a2;
  double v6 = a3;
  return [a1 initWithClientHeading:v4];
}

- (BOOL)hasGeomagneticVector
{
  [a1 x];
  if (v2 != 0.0) {
    return 1;
  }
  [a1 y];
  if (v3 != 0.0) {
    return 1;
  }
  [a1 z];
  return v5 != 0.0;
}

- (id)compactDescription
{
  if ([a1 hasGeomagneticVector])
  {
    [a1 shortDescription];
  }
  else
  {
    double v3 = NSString;
    [a1 heading];
    uint64_t v5 = v4;
    [a1 headingAccuracy];
    objc_msgSend(v3, "stringWithFormat:", @"%+.1f ±%.0f°", v5, v6);
  double v2 = };

  return v2;
}

@end