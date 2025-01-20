@interface FBKIssueType
+ (id)entityName;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKIssueType

+ (id)entityName
{
  return @"IssueType";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v5 = [a3 objectForKeyedSubscript:@"display_name"];
  v4 = FBKStringIfNSNull(v5);
  [(FBKIssueType *)self setDisplayName:v4];
}

@end