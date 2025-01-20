@interface DRSRequestBuildStats
+ (Class)childStatsClass;
+ (id)descriptionStringForRequest:(id)a3;
+ (id)keyName;
@end

@implementation DRSRequestBuildStats

+ (id)keyName
{
  return @"Build";
}

+ (id)descriptionStringForRequest:(id)a3
{
  return (id)[a3 build];
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

@end