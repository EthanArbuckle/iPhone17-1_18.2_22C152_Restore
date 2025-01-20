@interface ACAccount
- (NSDate)ams_lastAuthenticated;
- (void)ams_setLastAuthenticated:(id)a3;
@end

@implementation ACAccount

- (NSDate)ams_lastAuthenticated
{
  v2 = [(ACAccount *)self objectForKeyedSubscript:@"lastAuthenticated"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDate *)v3;
}

- (void)ams_setLastAuthenticated:(id)a3
{
}

@end