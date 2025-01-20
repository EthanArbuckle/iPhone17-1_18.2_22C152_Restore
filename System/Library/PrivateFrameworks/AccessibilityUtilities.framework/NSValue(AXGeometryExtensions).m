@interface NSValue(AXGeometryExtensions)
+ (id)axValueWithCGPoint:()AXGeometryExtensions;
+ (id)axValueWithCGRect:()AXGeometryExtensions;
+ (id)axValueWithCGSize:()AXGeometryExtensions;
- (double)axCGPointValue;
- (double)axCGRectValue;
- (double)axCGSizeValue;
@end

@implementation NSValue(AXGeometryExtensions)

+ (id)axValueWithCGPoint:()AXGeometryExtensions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGPoint=dd}"];

  return v2;
}

+ (id)axValueWithCGSize:()AXGeometryExtensions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGSize=dd}"];

  return v2;
}

+ (id)axValueWithCGRect:()AXGeometryExtensions
{
  *(double *)v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  return v4;
}

- (double)axCGPointValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2 size:16];
  return *(double *)v2;
}

- (double)axCGSizeValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2 size:16];
  return *(double *)v2;
}

- (double)axCGRectValue
{
  memset(v2, 0, sizeof(v2));
  [a1 getValue:v2 size:32];
  return *(double *)v2;
}

@end