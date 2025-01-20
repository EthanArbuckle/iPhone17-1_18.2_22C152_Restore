@interface AXVoiceTriggerAssetPolicy
+ (BOOL)_assetsUsedInLastSixMonths;
+ (BOOL)_soundSwitchesEnabled;
- (BOOL)daemonShouldDownloadInBackgroundIfNeeded;
- (BOOL)shouldCopyLocally;
- (id)assetType;
- (id)assetsToPurgeFromInstalledAssets:(id)a3;
- (id)launchActivityIdentifier;
- (id)maxSupportedFormatVersion;
- (id)minSupportedFormatVersion;
@end

@implementation AXVoiceTriggerAssetPolicy

- (id)assetType
{
  return @"com.apple.MobileAsset.AXSoundActions";
}

- (id)launchActivityIdentifier
{
  return @"com.apple.ax.AXSoundActions.LaunchActivity";
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

- (id)maxSupportedFormatVersion
{
  return &unk_1F3680C08;
}

- (id)minSupportedFormatVersion
{
  return &unk_1F3680C08;
}

- (BOOL)daemonShouldDownloadInBackgroundIfNeeded
{
  return +[AXVoiceTriggerAssetPolicy _soundSwitchesEnabled];
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  id v4 = a3;
  if (+[AXVoiceTriggerAssetPolicy _soundSwitchesEnabled](AXVoiceTriggerAssetPolicy, "_soundSwitchesEnabled")|| +[AXVoiceTriggerAssetPolicy _assetsUsedInLastSixMonths])
  {
    v9.receiver = self;
    v9.super_class = (Class)AXVoiceTriggerAssetPolicy;
    id v5 = [(AXAssetPolicy *)&v9 assetsToPurgeFromInstalledAssets:v4];
  }
  else
  {
    v6 = AXLogSoundActions();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC53F000, v6, OS_LOG_TYPE_DEFAULT, "Sound Actions Assets have been unused for 6 months. Purging.", buf, 2u);
    }

    id v5 = v4;
  }
  v7 = v5;

  return v7;
}

+ (BOOL)_assetsUsedInLastSixMonths
{
  v2 = [getAXSettingsClass() sharedInstance];
  [v2 soundActionsLastModelAccess];
  double v4 = v3;

  return CFAbsoluteTimeGetCurrent() - v4 < 15724800.0;
}

+ (BOOL)_soundSwitchesEnabled
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = objc_msgSend(getAXSettingsClass(), "sharedInstance", 0);
  double v3 = [v2 assistiveTouchSwitches];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = [*(id *)(*((void *)&v13 + 1) + 8 * i) source];
        uint64_t v22 = 0;
        v23 = &v22;
        uint64_t v24 = 0x2020000000;
        v8 = (void *)getSCATSwitchSourceSoundSymbolLoc_ptr;
        uint64_t v25 = getSCATSwitchSourceSoundSymbolLoc_ptr;
        if (!getSCATSwitchSourceSoundSymbolLoc_ptr)
        {
          uint64_t v17 = MEMORY[0x1E4F143A8];
          uint64_t v18 = 3221225472;
          v19 = __getSCATSwitchSourceSoundSymbolLoc_block_invoke;
          v20 = &unk_1E6C41EC8;
          v21 = &v22;
          objc_super v9 = (void *)AccessibilityUtilitiesLibrary();
          v10 = dlsym(v9, "SCATSwitchSourceSound");
          *(void *)(v21[1] + 24) = v10;
          getSCATSwitchSourceSoundSymbolLoc_ptr = *(void *)(v21[1] + 24);
          v8 = (void *)v23[3];
        }
        _Block_object_dispose(&v22, 8);
        if (!v8)
        {
          -[AXAudiogramIngestionAssetPolicy init]();
          __break(1u);
        }
        char v11 = [v7 isEqualToString:*v8];

        if (v11)
        {
          LOBYTE(v4) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v26 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v4;
}

@end