@interface ACSettingsBasicSetting
+ (id)setting;
+ (id)settingWithAceString:(id)a3;
- (ACSettingsUpdateDelegate)delegate;
- (Class)settingsDetailClass;
- (NSString)name;
- (NSURL)preferencesURL;
- (SiriUISashItem)sashItem;
- (UIImage)icon;
- (void)setDelegate:(id)a3;
@end

@implementation ACSettingsBasicSetting

+ (id)settingWithAceString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SASettingKeyAirplaneModeValue])
  {
    v4 = off_81A8;
  }
  else if ([v3 isEqualToString:SASettingKeyAssistiveTouchValue])
  {
    v4 = off_8198;
  }
  else if ([v3 isEqualToString:SASettingKeyBluetoothValue])
  {
    v4 = off_81C0;
  }
  else if ([v3 isEqualToString:SASettingKeyDisplayBrightnessValue])
  {
    v4 = off_81C8;
  }
  else if ([v3 isEqualToString:SASettingKeyCellularDataValue])
  {
    v4 = off_81D0;
  }
  else if ([v3 isEqualToString:SASettingKeyDoNotDisturbValue])
  {
    v4 = off_81E0;
  }
  else if ([v3 isEqualToString:SASettingKeyGuidedAccessValue])
  {
    v4 = off_81E8;
  }
  else if ([v3 isEqualToString:SASettingKeyInvertColorsValue])
  {
    v4 = off_81F0;
  }
  else if ([v3 isEqualToString:SASettingKeyVoiceOverValue])
  {
    v4 = &off_8210;
  }
  else if ([v3 isEqualToString:SASettingKeyVoiceControlValue])
  {
    v4 = off_81D8;
  }
  else if ([v3 isEqualToString:SASettingKeyNoiseCancellationValue])
  {
    v4 = off_81F8;
  }
  else if ([v3 isEqualToString:SASettingKeyAudioTransparencyValue])
  {
    v4 = off_81B0;
  }
  else if ([v3 isEqualToString:SASettingKeyWiFiValue])
  {
    v4 = off_81A0;
  }
  else if ([v3 isEqualToString:SASettingKeyPowerSavingModeValue])
  {
    v4 = off_8200;
  }
  else
  {
    unsigned int v5 = [v3 isEqualToString:SASettingKeyLocationServicesValue];
    v4 = off_81B8;
    if (v5) {
      v4 = off_8208;
    }
  }
  v6 = [(__objc2_class *)*v4 setting];

  return v6;
}

+ (id)setting
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (Class)settingsDetailClass
{
  return 0;
}

- (UIImage)icon
{
  id v2 = [(ACSettingsBasicSetting *)self settingsDetailClass];

  return (UIImage *)[(objc_class *)v2 iconImage];
}

- (NSURL)preferencesURL
{
  id v2 = [(ACSettingsBasicSetting *)self settingsDetailClass];

  return (NSURL *)[(objc_class *)v2 preferencesURL];
}

- (SiriUISashItem)sashItem
{
  id v3 = [objc_alloc((Class)SiriUISashItem) initWithApplicationBundleIdentifier:@"com.apple.Preferences"];
  id v4 = objc_alloc_init((Class)SAUIAppPunchOut);
  unsigned int v5 = [(ACSettingsBasicSetting *)self preferencesURL];
  [v4 setPunchOutUri:v5];

  id v8 = v4;
  v6 = +[NSArray arrayWithObjects:&v8 count:1];
  [v3 setCommands:v6];

  return (SiriUISashItem *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (ACSettingsUpdateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACSettingsUpdateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_name, 0);
}

@end