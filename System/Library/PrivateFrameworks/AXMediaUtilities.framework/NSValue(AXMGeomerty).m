@interface NSValue(AXMGeomerty)
+ (id)axmValueWithCGPoint:()AXMGeomerty;
+ (id)axmValueWithCGRect:()AXMGeomerty;
+ (id)axmValueWithCGSize:()AXMGeomerty;
+ (id)axmValueWithCGVector:()AXMGeomerty;
+ (uint64_t)axmValueWithCGAffineTransform:()AXMGeomerty;
- (double)AXMPointValue;
- (double)AXMRectValue;
- (double)AXMSizeValue;
- (double)AXMVectorValue;
- (uint64_t)AXMAffineTransformValue;
@end

@implementation NSValue(AXMGeomerty)

+ (id)axmValueWithCGPoint:()AXMGeomerty
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGPoint=dd}"];

  return v2;
}

+ (id)axmValueWithCGVector:()AXMGeomerty
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGVector=dd}"];

  return v2;
}

+ (id)axmValueWithCGSize:()AXMGeomerty
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGSize=dd}"];

  return v2;
}

+ (id)axmValueWithCGRect:()AXMGeomerty
{
  *(double *)v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  return v4;
}

+ (uint64_t)axmValueWithCGAffineTransform:()AXMGeomerty
{
  return [MEMORY[0x1E4F29238] valueWithBytes:a3 objCType:"{CGAffineTransform=dddddd}"];
}

- (double)AXMPointValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2];
  return *(double *)v2;
}

- (double)AXMVectorValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2];
  return *(double *)v2;
}

- (double)AXMSizeValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2];
  return *(double *)v2;
}

- (double)AXMRectValue
{
  memset(v2, 0, sizeof(v2));
  [a1 getValue:v2];
  return *(double *)v2;
}

- (uint64_t)AXMAffineTransformValue
{
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return [a1 getValue:x8_0];
}

@end