@interface NSValue(CACornerRadiiAdditions)
+ (uint64_t)valueWithCACornerRadii:()CACornerRadiiAdditions;
- (uint64_t)CACornerRadiiValue;
@end

@implementation NSValue(CACornerRadiiAdditions)

- (uint64_t)CACornerRadiiValue
{
  x8_0[2] = 0u;
  x8_0[3] = 0u;
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return [a1 getValue:x8_0 size:64];
}

+ (uint64_t)valueWithCACornerRadii:()CACornerRadiiAdditions
{
  return [a1 valueWithBytes:a3 objCType:"{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}"];
}

@end