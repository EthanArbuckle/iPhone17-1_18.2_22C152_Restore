@interface NSValue(CAColorMatrixAdditions)
+ (uint64_t)valueWithCAColorMatrix:()CAColorMatrixAdditions;
- (uint64_t)CAColorMatrixValue;
@end

@implementation NSValue(CAColorMatrixAdditions)

+ (uint64_t)valueWithCAColorMatrix:()CAColorMatrixAdditions
{
  return [a1 valueWithBytes:a3 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
}

- (uint64_t)CAColorMatrixValue
{
  x8_0[3] = 0u;
  x8_0[4] = 0u;
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return [a1 getValue:x8_0 size:80];
}

@end