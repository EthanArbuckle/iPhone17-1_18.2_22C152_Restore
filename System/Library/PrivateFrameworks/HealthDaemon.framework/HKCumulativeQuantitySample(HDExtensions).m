@interface HKCumulativeQuantitySample(HDExtensions)
+ (uint64_t)hd_dataEntityClass;
@end

@implementation HKCumulativeQuantitySample(HDExtensions)

+ (uint64_t)hd_dataEntityClass
{
  return objc_opt_class();
}

@end