@interface NSValue(MKCAExtrasAdditions)
+ (id)_mapkit_valueWithCGPoint:()MKCAExtrasAdditions;
+ (uint64_t)_mapkit_valueWithCGAffineTransform:()MKCAExtrasAdditions;
- (uint64_t)_mapkit_CGAffineTransformValue;
@end

@implementation NSValue(MKCAExtrasAdditions)

+ (id)_mapkit_valueWithCGPoint:()MKCAExtrasAdditions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGPoint=dd}"];

  return v2;
}

- (uint64_t)_mapkit_CGAffineTransformValue
{
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return [a1 getValue:x8_0 size:48];
}

+ (uint64_t)_mapkit_valueWithCGAffineTransform:()MKCAExtrasAdditions
{
  return [MEMORY[0x1E4F29238] valueWithBytes:a3 objCType:"{CGAffineTransform=dddddd}"];
}

@end