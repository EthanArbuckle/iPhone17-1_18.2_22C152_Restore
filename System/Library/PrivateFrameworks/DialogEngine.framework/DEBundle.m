@interface DEBundle
+ (id)frameworkBundle;
+ (id)frameworkInternalUserSettings;
+ (id)frameworkUserSettings;
@end

@implementation DEBundle

+ (id)frameworkInternalUserSettings
{
  if (os_variant_has_internal_diagnostics())
  {
    v2 = +[DEBundle frameworkUserSettings];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)frameworkUserSettings
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];

  if (v3 && [v3 isEqualToString:@"com.apple.siri.DialogEngine"])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.siri.DialogEngine"];
  }
  v5 = (void *)v4;

  return v5;
}

+ (id)frameworkBundle
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

@end