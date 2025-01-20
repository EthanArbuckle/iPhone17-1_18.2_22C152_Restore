@interface ACSettingsInvertColors
- (ACSettingsInvertColors)init;
@end

@implementation ACSettingsInvertColors

- (ACSettingsInvertColors)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACSettingsInvertColors;
  v2 = [(ACSettingsInvertColors *)&v6 init];
  if (v2)
  {
    uint64_t v3 = ACSettingsLocalizedString(@"SETTING_INVERT_COLORS");
    name = v2->super.super._name;
    v2->super.super._name = (NSString *)v3;

    v2->super._settingsDetailClass = (Class)objc_opt_class();
  }
  return v2;
}

@end