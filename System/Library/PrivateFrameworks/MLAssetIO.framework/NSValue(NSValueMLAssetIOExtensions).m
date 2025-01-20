@interface NSValue(NSValueMLAssetIOExtensions)
+ (MIORangeAsValue)valueWithMIORange:()NSValueMLAssetIOExtensions;
- (uint64_t)MIORangeValue;
@end

@implementation NSValue(NSValueMLAssetIOExtensions)

+ (MIORangeAsValue)valueWithMIORange:()NSValueMLAssetIOExtensions
{
  return +[MIORangeAsValue valueWithMIORange:](MIORangeAsValue, "valueWithMIORange:");
}

- (uint64_t)MIORangeValue
{
  id v1 = a1;
  if (strcmp("{_MIORange=qq}", (const char *)[v1 objCType])) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v3[0] = 0;
  v3[1] = 0;
  [v1 getValue:v3];
  return v3[0];
}

@end