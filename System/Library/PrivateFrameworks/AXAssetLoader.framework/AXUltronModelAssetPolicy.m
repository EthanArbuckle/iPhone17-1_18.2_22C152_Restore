@interface AXUltronModelAssetPolicy
+ (BOOL)_isUltronAssetCompatible:(id)a3;
+ (id)assetsToDownloadFromAssets:(id)a3;
+ (id)compatibleAssetsFromRefreshedAssets:(id)a3;
+ (id)newestCompatiableAssetsFromAssets:(id)a3;
+ (id)ultronAssetType;
+ (int64_t)maximumCompatibilityVersion;
+ (int64_t)minimumCompatibilityVersion;
- (BOOL)_assetUsedRecently;
- (BOOL)shouldCopyLocally;
- (id)assetType;
- (id)assetsToDownloadFromRefreshedAssets:(id)a3;
- (id)assetsToPurgeFromInstalledAssets:(id)a3;
- (id)launchActivityIdentifier;
@end

@implementation AXUltronModelAssetPolicy

- (id)assetType
{
  return +[AXUltronModelAssetPolicy ultronAssetType];
}

- (id)launchActivityIdentifier
{
  return @"com.apple.ax.SoundDetectionModels.LaunchActivity";
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

- (id)assetsToDownloadFromRefreshedAssets:(id)a3
{
  return +[AXUltronModelAssetPolicy assetsToDownloadFromAssets:a3];
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__AXUltronModelAssetPolicy_assetsToPurgeFromInstalledAssets___block_invoke;
  v5[3] = &unk_1E6C41FC0;
  v5[4] = self;
  v3 = objc_msgSend(a3, "ax_filteredArrayUsingBlock:", v5);
  return v3;
}

uint64_t __61__AXUltronModelAssetPolicy_assetsToPurgeFromInstalledAssets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = +[AXUltronModelAssetPolicy _isUltronAssetCompatible:v3];
  uint64_t v5 = [*(id *)(a1 + 32) _assetUsedRecently];
  int v6 = v4 & v5;
  if (!(v4 & v5))
  {
    uint64_t v7 = v5;
    v8 = AXLogUltron();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v3 ultronModelName];
      v10 = [NSNumber numberWithBool:v4];
      v11 = [NSNumber numberWithBool:v7];
      int v13 = 138412802;
      v14 = v9;
      __int16 v15 = 2112;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1DC53F000, v8, OS_LOG_TYPE_DEFAULT, "Purging asset: %@. Is Compatiable: %@, Used Recently: %@", (uint8_t *)&v13, 0x20u);
    }
  }

  return v6 ^ 1u;
}

+ (id)ultronAssetType
{
  return @"com.apple.MobileAsset.SoundDetectionModels";
}

+ (int64_t)minimumCompatibilityVersion
{
  v2 = +[AXAssetMetadataStore store];
  id v3 = [v2 overrideMinimumCompatibilityVersionForAssetType:@"com.apple.MobileAsset.SoundDetectionModels"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

+ (int64_t)maximumCompatibilityVersion
{
  v2 = +[AXAssetMetadataStore store];
  id v3 = [v2 overrideMaximumCompatibilityVersionForAssetType:@"com.apple.MobileAsset.SoundDetectionModels"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 3;
  }

  return v4;
}

+ (id)assetsToDownloadFromAssets:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AXLogAssetLoader();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    v10 = @"com.apple.MobileAsset.SoundDetectionModels";
    _os_log_impl(&dword_1DC53F000, v5, OS_LOG_TYPE_INFO, "Asset type [%@] - will evaluate downloadable assets for items to download", (uint8_t *)&v9, 0xCu);
  }

  int v6 = [a1 newestCompatiableAssetsFromAssets:v4];

  uint64_t v7 = objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &__block_literal_global);

  return v7;
}

uint64_t __55__AXUltronModelAssetPolicy_assetsToDownloadFromAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInstalled] ^ 1;
}

+ (id)compatibleAssetsFromRefreshedAssets:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[AXAssetMetadataStore store];
  int v6 = [v5 overrideMinimumCompatibilityVersionForAssetType:@"com.apple.MobileAsset.SoundDetectionModels"];

  if (v6)
  {
    uint64_t v7 = AXLogAssetLoader();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v16 = @"com.apple.MobileAsset.SoundDetectionModels";
      __int16 v17 = 2048;
      uint64_t v18 = 1;
      __int16 v19 = 2048;
      uint64_t v20 = [v6 integerValue];
      _os_log_impl(&dword_1DC53F000, v7, OS_LOG_TYPE_INFO, "Asset type [%@] default minimumCompatibilityVersion=%ld BEING OVERRIDDEN: %ld", buf, 0x20u);
    }
  }
  v8 = +[AXAssetMetadataStore store];
  int v9 = [v8 overrideMaximumCompatibilityVersionForAssetType:@"com.apple.MobileAsset.SoundDetectionModels"];

  if (v9)
  {
    v10 = AXLogAssetLoader();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v9 integerValue];
      *(_DWORD *)buf = 138412802;
      v16 = @"com.apple.MobileAsset.SoundDetectionModels";
      __int16 v17 = 2048;
      uint64_t v18 = 3;
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1DC53F000, v10, OS_LOG_TYPE_INFO, "Asset type [%@] default maximumCompatibilityVersion=%ld BEING OVERRIDDEN: %ld", buf, 0x20u);
    }
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__AXUltronModelAssetPolicy_compatibleAssetsFromRefreshedAssets___block_invoke;
  v14[3] = &__block_descriptor_40_e24_B32__0__AXAsset_8Q16_B24l;
  v14[4] = a1;
  v12 = objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v14);

  return v12;
}

BOOL __64__AXUltronModelAssetPolicy_compatibleAssetsFromRefreshedAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 compatibilityVersion];
  if (v4 >= [*(id *)(a1 + 32) minimumCompatibilityVersion])
  {
    unint64_t v6 = [v3 compatibilityVersion];
    BOOL v5 = v6 <= [*(id *)(a1 + 32) maximumCompatibilityVersion];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)newestCompatiableAssetsFromAssets:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 minimumCompatibilityVersion];
  uint64_t v6 = [a1 maximumCompatibilityVersion];
  uint64_t v7 = AXLogAssetLoader();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v32 = @"com.apple.MobileAsset.SoundDetectionModels";
    __int16 v33 = 2048;
    uint64_t v34 = v5;
    __int16 v35 = 2048;
    uint64_t v36 = v6;
    _os_log_impl(&dword_1DC53F000, v7, OS_LOG_TYPE_INFO, "Asset type [%@] - finding newest compatiable assets. Compat version range %ld-%ld", buf, 0x20u);
  }

  v25 = v4;
  v8 = [a1 compatibleAssetsFromRefreshedAssets:v4];
  int v9 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v16 = [v15 ultronModelName];
        if (v16)
        {
          __int16 v17 = [v9 objectForKey:v16];
          uint64_t v18 = v17;
          if (!v17 || [v17 isOlderThanAsset:v15]) {
            [v9 setObject:v15 forKey:v16];
          }
        }
        else
        {
          uint64_t v18 = AXLogAssetLoader();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            __int16 v19 = [v15 properties];
            *(_DWORD *)buf = 138412546;
            v32 = @"com.apple.MobileAsset.SoundDetectionModels";
            __int16 v33 = 2112;
            uint64_t v34 = (uint64_t)v19;
            _os_log_fault_impl(&dword_1DC53F000, v18, OS_LOG_TYPE_FAULT, "Asset type [%@] - Model name for properties %@ was nil", buf, 0x16u);
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  uint64_t v20 = AXLogAssetLoader();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = [v9 allValues];
    uint64_t v22 = [v21 count];
    *(_DWORD *)buf = 138412546;
    v32 = @"com.apple.MobileAsset.SoundDetectionModels";
    __int16 v33 = 2048;
    uint64_t v34 = v22;
    _os_log_impl(&dword_1DC53F000, v20, OS_LOG_TYPE_INFO, "Asset type [%@] - found %lu compatiable assets", buf, 0x16u);
  }
  v23 = [v9 allValues];

  return v23;
}

+ (BOOL)_isUltronAssetCompatible:(id)a3
{
  id v3 = a3;
  if (AXRuntimeCheck_SupportsMedina())
  {
    id v4 = [v3 ultronModelName];
    if (([v4 isEqualToString:@"kshot_general_appliance"] & 1) == 0)
    {
      uint64_t v5 = [v3 ultronModelName];
      if (![v5 isEqualToString:@"kshot_hallucinator"])
      {
        id v10 = [v3 ultronModelName];
        char v11 = [v10 isEqualToString:@"kshot_model_weights"];

        if ((v11 & 1) == 0) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
    }
  }
LABEL_6:
  unint64_t v6 = [v3 compatibilityVersion];
  if (v6 >= +[AXUltronModelAssetPolicy minimumCompatibilityVersion])
  {
    unint64_t v8 = [v3 compatibilityVersion];
    BOOL v7 = v8 <= +[AXUltronModelAssetPolicy maximumCompatibilityVersion];
    goto LABEL_9;
  }
LABEL_7:
  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)_assetUsedRecently
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v2 = (void *)getAXSettingsClass_softClass_1;
  uint64_t v12 = getAXSettingsClass_softClass_1;
  if (!getAXSettingsClass_softClass_1)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getAXSettingsClass_block_invoke_1;
    v8[3] = &unk_1E6C41EC8;
    v8[4] = &v9;
    __getAXSettingsClass_block_invoke_1((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  id v4 = [v3 sharedInstance];
  [v4 soundDetectionLastModelAccess];
  double v6 = v5;

  return CFAbsoluteTimeGetCurrent() - v6 < 2592000.0;
}

@end