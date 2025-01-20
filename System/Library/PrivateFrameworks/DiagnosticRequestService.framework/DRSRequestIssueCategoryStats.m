@interface DRSRequestIssueCategoryStats
+ (Class)childStatsClass;
+ (id)descriptionStringForRequest:(id)a3;
+ (id)keyName;
@end

@implementation DRSRequestIssueCategoryStats

+ (id)keyName
{
  return @"IssueCategory";
}

+ (id)descriptionStringForRequest:(id)a3
{
  return (id)[a3 issueCategory];
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

@end