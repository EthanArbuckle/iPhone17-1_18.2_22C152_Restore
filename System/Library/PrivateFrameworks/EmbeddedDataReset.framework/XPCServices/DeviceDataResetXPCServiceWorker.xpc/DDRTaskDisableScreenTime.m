@interface DDRTaskDisableScreenTime
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskDisableScreenTime

- (void)run
{
  id v2 = (id)objc_opt_new();
  [v2 setScreenTimeEnabled:0 error:0];
}

- (id)identifier
{
  return @"com.apple.devicedatareset.disableScreenTime";
}

@end