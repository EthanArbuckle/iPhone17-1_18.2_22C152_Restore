@interface _HKFitnessFriendActivitySnapshot(HDExtensions)
+ (uint64_t)hd_dataEntityClass;
@end

@implementation _HKFitnessFriendActivitySnapshot(HDExtensions)

+ (uint64_t)hd_dataEntityClass
{
  return objc_opt_class();
}

@end