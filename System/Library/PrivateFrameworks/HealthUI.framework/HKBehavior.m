@interface HKBehavior
@end

@implementation HKBehavior

void __50___HKBehavior_HealthUI__hkui_isRunningInHealthApp__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  hkui_isRunningInHealthApp_isRunningInHealthApp = [v0 isEqualToString:*MEMORY[0x1E4F2BDC0]];
}

void __55___HKBehavior_HealthUI__hkui_isRunningInPreferencesApp__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  hkui_isRunningInPreferencesApp_isRunningInPreferencesApp = [v0 isEqualToString:@"com.apple.Preferences"];
}

void __44___HKBehavior_HealthUI__hkui_isRunningInApp__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v0 infoDictionary];

  id v1 = [v2 objectForKey:@"CFBundlePackageType"];
  hkui_isRunningInApp_isRunningInApp = [v1 isEqualToString:@"APPL"];
}

@end