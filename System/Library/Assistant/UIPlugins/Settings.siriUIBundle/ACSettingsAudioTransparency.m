@interface ACSettingsAudioTransparency
- (ACSettingsAudioTransparency)init;
@end

@implementation ACSettingsAudioTransparency

- (ACSettingsAudioTransparency)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACSettingsAudioTransparency;
  v2 = [(ACSettingsAudioTransparency *)&v6 init];
  if (v2)
  {
    uint64_t v3 = ACSettingsLocalizedStringWithTable(@"SETTING_AUDIO_TRANSPARENCY", @"Localizable-b298");
    name = v2->super.super._name;
    v2->super.super._name = (NSString *)v3;

    v2->super._settingsDetailClass = (Class)objc_opt_class();
  }
  return v2;
}

@end