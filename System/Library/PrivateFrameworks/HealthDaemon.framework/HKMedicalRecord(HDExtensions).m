@interface HKMedicalRecord(HDExtensions)
+ (uint64_t)hd_dataEntityClass;
@end

@implementation HKMedicalRecord(HDExtensions)

+ (uint64_t)hd_dataEntityClass
{
  return objc_opt_class();
}

@end