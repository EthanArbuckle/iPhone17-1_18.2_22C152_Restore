@interface HKGAD7Assessment(HDExtensions)
+ (uint64_t)hd_dataEntityClass;
@end

@implementation HKGAD7Assessment(HDExtensions)

+ (uint64_t)hd_dataEntityClass
{
  return objc_opt_class();
}

@end