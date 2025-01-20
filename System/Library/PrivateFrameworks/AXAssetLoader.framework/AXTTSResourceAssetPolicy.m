@interface AXTTSResourceAssetPolicy
- (BOOL)daemonShouldDownloadInBackgroundIfNeeded;
- (BOOL)shouldDownloadAsset:(id)a3 withInstalledAssets:(id)a4;
- (id)_voiceIdentifierForAsset:(id)a3;
- (id)assetType;
- (id)assetsToPurgeFromInstalledAssets:(id)a3 withRefreshedAssets:(id)a4;
- (id)compatibilityVersion;
- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4;
- (id)launchActivityIdentifier;
@end

@implementation AXTTSResourceAssetPolicy

- (id)assetType
{
  return @"com.apple.MobileAsset.TTSAXResourceModelAssets";
}

- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)AXTTSResourceAssetPolicy;
  v5 = -[AXAssetPolicy downloadOptionsForOperation:userInitiated:](&v7, sel_downloadOptionsForOperation_userInitiated_, a3);
  [v5 setAllowsCellularAccess:v4];
  return v5;
}

- (id)launchActivityIdentifier
{
  return @"com.apple.ax.TTSResource.LaunchActivity";
}

- (BOOL)daemonShouldDownloadInBackgroundIfNeeded
{
  return 1;
}

- (BOOL)shouldDownloadAsset:(id)a3 withInstalledAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AXTTSResourceAssetPolicy *)self _voiceIdentifierForAsset:v6];
  v9 = v8;
  if (v8)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __68__AXTTSResourceAssetPolicy_shouldDownloadAsset_withInstalledAssets___block_invoke;
    v19 = &unk_1E6C41F60;
    v20 = self;
    id v21 = v8;
    uint64_t v10 = [v7 indexOfObjectPassingTest:&v16];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v11 = 0;
    }
    else
    {
      v13 = objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v16, v17, v18, v19, v20);
      unint64_t v14 = [v6 contentVersion];
      BOOL v11 = v14 > [v13 contentVersion];
    }
  }
  else
  {
    v12 = AXLogAssetLoader();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AXTTSResourceAssetPolicy shouldDownloadAsset:withInstalledAssets:]((uint64_t)v6, v12);
    }

    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __68__AXTTSResourceAssetPolicy_shouldDownloadAsset_withInstalledAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) _voiceIdentifierForAsset:a2];
  uint64_t v4 = [*(id *)(a1 + 40) isEqualToString:v3];

  return v4;
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3 withRefreshedAssets:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v23 = a4;
  id v21 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    uint64_t v10 = &unk_1E6C41F88;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v13 = -[AXTTSResourceAssetPolicy _voiceIdentifierForAsset:](self, "_voiceIdentifierForAsset:", v12, v21);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __81__AXTTSResourceAssetPolicy_assetsToPurgeFromInstalledAssets_withRefreshedAssets___block_invoke;
        v24[3] = v10;
        v24[4] = self;
        id v14 = v13;
        id v25 = v14;
        v26 = v12;
        uint64_t v15 = [v23 indexOfObjectPassingTest:v24];
        if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v16 = v10;
          uint64_t v17 = [v23 objectAtIndex:v15];
          unint64_t v18 = [v17 contentVersion];
          if (v18 > [v12 contentVersion]) {
            [v21 addObject:v12];
          }

          uint64_t v10 = v16;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v8);
  }

  v19 = AXLogAssetLoader();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v21;
    _os_log_impl(&dword_1DC53F000, v19, OS_LOG_TYPE_INFO, "TTSResourceAssetPolicy will purge the following assets: %@", buf, 0xCu);
  }

  return v21;
}

uint64_t __81__AXTTSResourceAssetPolicy_assetsToPurgeFromInstalledAssets_withRefreshedAssets___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] _voiceIdentifierForAsset:v3];
  if ([a1[5] isEqualToString:v4])
  {
    v5 = [a1[6] assetId];
    id v6 = [v3 assetId];
    uint64_t v7 = [v5 isEqualToString:v6] ^ 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_voiceIdentifierForAsset:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 properties];
  v5 = [v4 objectForKeyedSubscript:@"VoiceId"];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = [v3 properties];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"Sample"];

    if ([v8 BOOLValue]) {
      id v6 = @"Sample";
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)compatibilityVersion
{
  return &unk_1F3680C20;
}

- (void)shouldDownloadAsset:(uint64_t)a1 withInstalledAssets:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC53F000, a2, OS_LOG_TYPE_ERROR, "Failed to get voice id for asset: %@", (uint8_t *)&v2, 0xCu);
}

@end