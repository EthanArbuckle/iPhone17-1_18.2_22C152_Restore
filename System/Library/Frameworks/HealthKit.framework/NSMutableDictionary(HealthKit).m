@interface NSMutableDictionary(HealthKit)
- (void)hk_addEntriesFromNonNilDictionary:()HealthKit;
@end

@implementation NSMutableDictionary(HealthKit)

- (void)hk_addEntriesFromNonNilDictionary:()HealthKit
{
  if (a3) {
    return objc_msgSend(a1, "addEntriesFromDictionary:");
  }
  return a1;
}

@end