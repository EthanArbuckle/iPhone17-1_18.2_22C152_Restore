@interface DRSRequestOutcomeStats
+ (Class)childStatsClass;
+ (id)descriptionStringForRequest:(id)a3;
+ (id)keyName;
@end

@implementation DRSRequestOutcomeStats

+ (id)keyName
{
  return @"RequestOutcome";
}

+ (id)descriptionStringForRequest:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 requestOutcomeString];

  v7 = (void *)[v5 initWithFormat:@"%@", v6];

  return v7;
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

@end