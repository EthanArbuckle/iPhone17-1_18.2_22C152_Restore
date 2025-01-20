@interface DRSRequestTeamIDStats
+ (Class)childStatsClass;
+ (id)descriptionStringForRequest:(id)a3;
+ (id)keyName;
@end

@implementation DRSRequestTeamIDStats

+ (id)keyName
{
  return @"TeamID";
}

+ (id)descriptionStringForRequest:(id)a3
{
  return (id)[a3 teamID];
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

@end