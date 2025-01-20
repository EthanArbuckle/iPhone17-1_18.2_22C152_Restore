@interface NSValue(NSValueMapKitGeometryExtensions)
+ (id)valueWithMKCoordinate:()NSValueMapKitGeometryExtensions;
+ (id)valueWithMKCoordinateSpan:()NSValueMapKitGeometryExtensions;
- (double)MKCoordinateSpanValue;
- (double)MKCoordinateValue;
@end

@implementation NSValue(NSValueMapKitGeometryExtensions)

- (double)MKCoordinateValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2 size:16];
  return *(double *)v2;
}

+ (id)valueWithMKCoordinate:()NSValueMapKitGeometryExtensions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CLLocationCoordinate2D=dd}"];

  return v2;
}

+ (id)valueWithMKCoordinateSpan:()NSValueMapKitGeometryExtensions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{?=dd}"];

  return v2;
}

- (double)MKCoordinateSpanValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2 size:16];
  return *(double *)v2;
}

@end