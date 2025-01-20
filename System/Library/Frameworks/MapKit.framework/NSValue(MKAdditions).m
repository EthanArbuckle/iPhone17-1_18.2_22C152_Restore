@interface NSValue(MKAdditions)
- (double)CADoublePointValue;
- (double)CADoubleRectValue;
- (double)MKMapRectValue;
- (double)_mapkit_zoomRegionValue;
- (uint64_t)_mapkit_initWithCADoublePoint:()MKAdditions;
- (uint64_t)_mapkit_initWithCADoubleRect:()MKAdditions;
- (uint64_t)_mapkit_initWithCGPoint:()MKAdditions;
- (uint64_t)_mapkit_initWithCGRect:()MKAdditions;
- (uint64_t)_mapkit_initWithMKMapRect:()MKAdditions;
- (uint64_t)_mapkit_initWithZoomRegion:()MKAdditions;
@end

@implementation NSValue(MKAdditions)

- (uint64_t)_mapkit_initWithCGPoint:()MKAdditions
{
  *(double *)v4 = a2;
  *(double *)&v4[1] = a3;
  return [a1 initWithBytes:v4 objCType:"{CGPoint=dd}"];
}

- (uint64_t)_mapkit_initWithCADoublePoint:()MKAdditions
{
  *(double *)v4 = a2;
  *(double *)&v4[1] = a3;
  return [a1 initWithBytes:v4 objCType:"{CGPoint=dd}"];
}

- (double)CADoublePointValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2 size:16];
  return *(double *)v2;
}

- (uint64_t)_mapkit_initWithCADoubleRect:()MKAdditions
{
  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  return [a1 initWithBytes:v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
}

- (double)CADoubleRectValue
{
  memset(v2, 0, sizeof(v2));
  [a1 getValue:v2 size:32];
  return *(double *)v2;
}

- (uint64_t)_mapkit_initWithCGRect:()MKAdditions
{
  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  return [a1 initWithBytes:v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
}

- (uint64_t)_mapkit_initWithZoomRegion:()MKAdditions
{
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  *(double *)&v5[2] = a4;
  return [a1 initWithBytes:v5 objCType:"{?=d{CLLocationCoordinate2D=dd}}"];
}

- (double)_mapkit_zoomRegionValue
{
  memset(v2, 0, sizeof(v2));
  [a1 getValue:v2 size:24];
  return *(double *)v2;
}

- (uint64_t)_mapkit_initWithMKMapRect:()MKAdditions
{
  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  return [a1 initWithBytes:v6 objCType:"{?={?=dd}{?=dd}}"];
}

- (double)MKMapRectValue
{
  memset(v2, 0, sizeof(v2));
  [a1 getValue:v2 size:32];
  return *(double *)v2;
}

@end