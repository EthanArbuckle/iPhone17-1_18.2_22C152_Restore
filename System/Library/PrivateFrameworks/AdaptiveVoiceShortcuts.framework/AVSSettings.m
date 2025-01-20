@interface AVSSettings
+ (BOOL)avsFeatureEnabled;
+ (BOOL)shouldHideAudioDonationPrompt;
+ (void)setAvsFeatureEnabled:(BOOL)a3;
+ (void)setShouldHideAudioDonationPrompt:(BOOL)a3;
- (AVSSettings)init;
@end

@implementation AVSSettings

+ (BOOL)avsFeatureEnabled
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  unsigned __int8 v3 = objc_msgSend(v2, sel_isAdaptiveVoiceShortcutsEnabled);

  return v3;
}

+ (void)setAvsFeatureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v4, sel_setAdaptiveVoiceShortcutsEnabled_, v3);
}

+ (BOOL)shouldHideAudioDonationPrompt
{
  id v2 = objc_msgSend(self, sel_standardUserDefaults);
  BOOL v3 = (void *)sub_247750AF8();
  unsigned __int8 v4 = objc_msgSend(v2, sel_BOOLForKey_, v3);

  return v4;
}

+ (void)setShouldHideAudioDonationPrompt:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_msgSend(self, sel_standardUserDefaults);
  id v5 = (id)sub_247750AF8();
  objc_msgSend(v4, sel_setBool_forKey_, v3, v5);
}

- (AVSSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVSSettings;
  return [(AVSSettings *)&v3 init];
}

@end