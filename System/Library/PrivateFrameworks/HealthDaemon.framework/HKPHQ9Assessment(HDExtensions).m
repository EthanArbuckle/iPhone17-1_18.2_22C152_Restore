@interface HKPHQ9Assessment(HDExtensions)
+ (uint64_t)hd_dataEntityClass;
@end

@implementation HKPHQ9Assessment(HDExtensions)

+ (uint64_t)hd_dataEntityClass
{
  return objc_opt_class();
}

@end