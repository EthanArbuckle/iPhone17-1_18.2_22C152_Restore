@interface WACLogging
+ (BOOL)isEnabled;
@end

@implementation WACLogging

+ (BOOL)isEnabled
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 addSuiteNamed:@"com.apple.logging"];
  char v3 = [v2 BOOLForKey:@"DebugWACLogging"];

  return v3;
}

@end