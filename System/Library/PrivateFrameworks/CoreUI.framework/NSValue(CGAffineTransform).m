@interface NSValue(CGAffineTransform)
+ (id)valueWithCGAffineTransform:()CGAffineTransform;
- (id)cgAffineTransformValue;
@end

@implementation NSValue(CGAffineTransform)

- (id)cgAffineTransformValue
{
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return [a1 getValue:x8_0];
}

+ (id)valueWithCGAffineTransform:()CGAffineTransform
{
  return [a1 valueWithBytes:a3 objCType:"{CGAffineTransform=dddddd}"];
}

@end