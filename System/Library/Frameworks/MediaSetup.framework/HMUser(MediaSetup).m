@interface HMUser(MediaSetup)
- (uint64_t)_settingForKeyPath:()MediaSetup home:;
- (uint64_t)ms_allowiTunesAccountInHome:()MediaSetup;
- (uint64_t)ms_voiceRecognitionEnabledInHome:()MediaSetup;
@end

@implementation HMUser(MediaSetup)

- (uint64_t)ms_allowiTunesAccountInHome:()MediaSetup
{
  return [a1 _settingForKeyPath:@"root.music.allowiTunesAccount" home:a3];
}

- (uint64_t)ms_voiceRecognitionEnabledInHome:()MediaSetup
{
  return [a1 _settingForKeyPath:@"root.siri.identifyVoice" home:a3];
}

- (uint64_t)_settingForKeyPath:()MediaSetup home:
{
  id v6 = a3;
  uint64_t v7 = 0;
  if (v6 && a4)
  {
    v8 = [a1 userSettingsForHome:a4];
    v9 = [v8 settings];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 rootGroup];
      v12 = findSettingWithKeyPath(v6, v11);
      v13 = [v12 value];
      uint64_t v7 = [v13 BOOLValue];
    }
    else
    {
      v14 = _MSLogingFacility();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[HMUser(MediaSetup) _settingForKeyPath:home:]((uint64_t)v8, v14);
      }

      uint64_t v7 = 0;
    }
  }
  return v7;
}

- (void)_settingForKeyPath:()MediaSetup home:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_225D52000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch HomeKit settings objects. settingsContainer: %@, settings: %@", (uint8_t *)&v2, 0x16u);
}

@end