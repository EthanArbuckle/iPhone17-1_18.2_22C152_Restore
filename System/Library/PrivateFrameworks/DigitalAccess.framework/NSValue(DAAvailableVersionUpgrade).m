@interface NSValue(DAAvailableVersionUpgrade)
+ (uint64_t)valueWithDAAvailableVersionUpgrade:()DAAvailableVersionUpgrade;
- (uint64_t)availableVersionUpgradeValue;
@end

@implementation NSValue(DAAvailableVersionUpgrade)

+ (uint64_t)valueWithDAAvailableVersionUpgrade:()DAAvailableVersionUpgrade
{
  return [a1 valueWithBytes:a3 objCType:"{_DAVersionUpgrade=QBQQ}"];
}

- (uint64_t)availableVersionUpgradeValue
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return [a1 getValue:x8_0 size:32];
}

@end