@interface HKVerifiableClinicalRecord(HDExtensions)
+ (uint64_t)hd_dataEntityClass;
@end

@implementation HKVerifiableClinicalRecord(HDExtensions)

+ (uint64_t)hd_dataEntityClass
{
  return objc_opt_class();
}

@end