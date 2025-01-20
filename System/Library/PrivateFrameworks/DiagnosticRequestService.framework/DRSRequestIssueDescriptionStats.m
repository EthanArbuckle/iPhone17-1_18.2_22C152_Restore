@interface DRSRequestIssueDescriptionStats
+ (Class)childStatsClass;
+ (id)descriptionStringForRequest:(id)a3;
+ (id)keyName;
@end

@implementation DRSRequestIssueDescriptionStats

+ (id)keyName
{
  return @"IssueDescription";
}

+ (id)descriptionStringForRequest:(id)a3
{
  return (id)[a3 issueDescription];
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

@end