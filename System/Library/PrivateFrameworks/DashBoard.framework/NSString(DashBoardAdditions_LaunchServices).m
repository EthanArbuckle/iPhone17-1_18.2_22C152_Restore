@interface NSString(DashBoardAdditions_LaunchServices)
- (id)_db_stringByTrimmingAppSuffix;
@end

@implementation NSString(DashBoardAdditions_LaunchServices)

- (id)_db_stringByTrimmingAppSuffix
{
  if ([a1 hasSuffix:@".app"])
  {
    id v2 = [a1 stringByReplacingOccurrencesOfString:@".app" withString:&stru_26E13A820];
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

@end