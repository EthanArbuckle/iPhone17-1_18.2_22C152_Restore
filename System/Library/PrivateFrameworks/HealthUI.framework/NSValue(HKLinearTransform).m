@interface NSValue(HKLinearTransform)
+ (id)valueWithHKLinearTransform:()HKLinearTransform;
- (double)HKLinearTransformValue;
@end

@implementation NSValue(HKLinearTransform)

+ (id)valueWithHKLinearTransform:()HKLinearTransform
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{HKLinearTransform=dd}"];
  return v2;
}

- (double)HKLinearTransformValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2];
  return *(double *)v2;
}

@end