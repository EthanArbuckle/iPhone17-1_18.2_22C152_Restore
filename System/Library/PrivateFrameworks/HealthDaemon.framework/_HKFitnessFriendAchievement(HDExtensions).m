@interface _HKFitnessFriendAchievement(HDExtensions)
+ (uint64_t)hd_dataEntityClass;
@end

@implementation _HKFitnessFriendAchievement(HDExtensions)

+ (uint64_t)hd_dataEntityClass
{
  return objc_opt_class();
}

@end