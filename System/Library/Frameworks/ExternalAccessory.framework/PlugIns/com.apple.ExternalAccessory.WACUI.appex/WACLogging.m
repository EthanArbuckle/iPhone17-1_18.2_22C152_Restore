@interface WACLogging
+ (BOOL)isEnabled;
@end

@implementation WACLogging

+ (BOOL)isEnabled
{
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 addSuiteNamed:@"com.apple.logging"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DebugWACLogging"];

  return v3;
}

@end