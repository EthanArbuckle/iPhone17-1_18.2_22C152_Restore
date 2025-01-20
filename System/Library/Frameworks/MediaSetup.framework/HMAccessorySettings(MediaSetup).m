@interface HMAccessorySettings(MediaSetup)
- (id)_getMusicGroup;
- (uint64_t)_settingForKeyPath:()MediaSetup;
- (uint64_t)isAllowExplicitContentEnabled;
- (uint64_t)isUpdateListeningHistoryEnabled;
@end

@implementation HMAccessorySettings(MediaSetup)

- (uint64_t)isAllowExplicitContentEnabled
{
  return [a1 _settingForKeyPath:@"root.music.allowExplicitContent"];
}

- (uint64_t)isUpdateListeningHistoryEnabled
{
  return [a1 _settingForKeyPath:@"root.music.playbackInfluencesForYou"];
}

- (uint64_t)_settingForKeyPath:()MediaSetup
{
  id v4 = a3;
  v5 = [a1 _getMusicGroup];
  if (v5)
  {
    v6 = findSettingWithKeyPath(v4, v5);
    v7 = [v6 value];
    uint64_t v8 = [v7 BOOLValue];
  }
  else
  {
    v9 = _MSLogingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HMAccessorySettings(MediaSetup) _settingForKeyPath:](v9);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_getMusicGroup
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v1 = objc_msgSend(a1, "rootGroup", 0);
  v2 = [v1 groups];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = [v7 keyPath];
        int v9 = [v8 isEqualToString:@"root.music"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)_settingForKeyPath:()MediaSetup .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_225D52000, log, OS_LOG_TYPE_ERROR, "Failed to find Music Group in Accessory Settings", v1, 2u);
}

@end