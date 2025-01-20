@interface HKActivityCache(HDExtensions)
+ (uint64_t)hd_dataEntityClass;
@end

@implementation HKActivityCache(HDExtensions)

+ (uint64_t)hd_dataEntityClass
{
  return objc_opt_class();
}

@end