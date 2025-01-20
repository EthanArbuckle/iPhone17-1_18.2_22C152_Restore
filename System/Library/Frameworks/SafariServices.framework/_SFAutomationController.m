@interface _SFAutomationController
+ (BOOL)isSystemRemoteAutomationEnabled;
- (BOOL)allowsRemoteAutomation;
- (void)setAllowsRemoteAutomation:(BOOL)a3;
@end

@implementation _SFAutomationController

+ (BOOL)isSystemRemoteAutomationEnabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.webinspectord"];
  char v3 = [v2 BOOLForKey:@"RemoteAutomationEnabled"];

  return v3;
}

- (BOOL)allowsRemoteAutomation
{
  return +[_SFAutomationController isSystemRemoteAutomationEnabled];
}

- (void)setAllowsRemoteAutomation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.webinspectord"];
  [v5 setBool:v3 forKey:@"RemoteAutomationEnabled"];
  [v5 synchronize];
  v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 postNotificationName:@"_SFDeveloperPreferencesDidChangeNotification" object:0];
}

@end