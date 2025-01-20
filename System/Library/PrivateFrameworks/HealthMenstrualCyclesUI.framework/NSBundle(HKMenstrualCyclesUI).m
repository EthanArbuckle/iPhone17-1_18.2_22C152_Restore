@interface NSBundle(HKMenstrualCyclesUI)
+ (uint64_t)hkmcui_bundle;
@end

@implementation NSBundle(HKMenstrualCyclesUI)

+ (uint64_t)hkmcui_bundle
{
  uint64_t v2 = objc_opt_class();
  return [a1 bundleForClass:v2];
}

@end