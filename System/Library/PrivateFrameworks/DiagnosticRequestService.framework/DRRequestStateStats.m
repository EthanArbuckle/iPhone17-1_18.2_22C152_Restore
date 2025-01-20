@interface DRRequestStateStats
+ (id)descriptionStringForRequest:(id)a3;
+ (id)keyName;
@end

@implementation DRRequestStateStats

+ (id)keyName
{
  return @"RequestState";
}

+ (id)descriptionStringForRequest:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 requestStateString];

  v7 = (void *)[v5 initWithFormat:@"%@", v6];

  return v7;
}

@end