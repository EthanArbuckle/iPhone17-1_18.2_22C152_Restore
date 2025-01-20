@interface NSUserDefaults
@end

@implementation NSUserDefaults

void __40__NSUserDefaults_Email__em_userDefaults__block_invoke()
{
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v1 = (id)[v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.mail"];

  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"group.com.apple.mail"];
  v3 = (void *)em_userDefaults_userDefaults;
  em_userDefaults_userDefaults = v2;
}

void __47__NSUserDefaults_Email__em_lockdownModeEnabled__block_invoke()
{
  id v0 = [MEMORY[0x1E4F73068] shared];
  em_lockdownModeEnabled_lockdownModeEnabled = [v0 enabled];
}

@end