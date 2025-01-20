@interface ACSettingsGuidedAccess
- (ACSettingsGuidedAccess)init;
- (BOOL)enabled;
- (Class)settingsDetailClass;
- (void)setEnabled:(BOOL)a3;
@end

@implementation ACSettingsGuidedAccess

- (ACSettingsGuidedAccess)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACSettingsGuidedAccess;
  v2 = [(ACSettingsGuidedAccess *)&v6 init];
  if (v2)
  {
    uint64_t v3 = ACSettingsLocalizedString(@"SETTING_GUIDED_ACCESS");
    name = v2->super.super._name;
    v2->super.super._name = (NSString *)v3;

    v2->super._settingsDetailClass = 0;
  }
  return v2;
}

- (Class)settingsDetailClass
{
  return (Class)objc_opt_class();
}

- (void)setEnabled:(BOOL)a3
{
  if (a3) {
    +[PSGuidedAccessSettingsDetail enterGuidedAccessMode];
  }
}

- (BOOL)enabled
{
  return 0;
}

@end