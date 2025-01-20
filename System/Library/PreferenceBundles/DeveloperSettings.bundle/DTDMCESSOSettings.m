@interface DTDMCESSOSettings
+ (BOOL)isAvailable;
- (DTDMCESSOSettings)init;
@end

@implementation DTDMCESSOSettings

+ (BOOL)isAvailable
{
  v2 = sub_1A3EC();
  BOOL v3 = v2 != 0;

  return v3;
}

- (DTDMCESSOSettings)init
{
  BOOL v3 = sub_1A3EC();
  v4 = (objc_class *)[v3 classNamed:@"DMCESSOSettingsViewController"];

  v5 = (DTDMCESSOSettings *)objc_alloc_init(v4);
  return v5;
}

@end