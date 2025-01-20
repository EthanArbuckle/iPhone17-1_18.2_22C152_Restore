@interface AXElementVisionModelAssetPolicy
- (BOOL)shouldDownloadAsset:(id)a3 withInstalledAssets:(id)a4;
- (id)assetType;
- (id)launchActivityIdentifier;
- (id)maxSupportedFormatVersion;
- (id)minSupportedFormatVersion;
@end

@implementation AXElementVisionModelAssetPolicy

- (id)assetType
{
  return @"com.apple.MobileAsset.AXElementVision";
}

- (id)launchActivityIdentifier
{
  return @"com.apple.ax.AXElementVision.LaunchActivity";
}

- (BOOL)shouldDownloadAsset:(id)a3 withInstalledAssets:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(AXAssetPolicy *)self isAssetSupported:v6]) {
    BOOL v8 = [(AXAssetPolicy *)self isAssetContentVersion:v6 greatherThanInstalledAssets:v7];
  }
  else {
    BOOL v8 = 0;
  }
  v9 = AXLogAssetLoader();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109378;
    v11[1] = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1DC53F000, v9, OS_LOG_TYPE_INFO, "Should download asset = %d for %@", (uint8_t *)v11, 0x12u);
  }

  return v8;
}

- (id)maxSupportedFormatVersion
{
  return &unk_1F3680C50;
}

- (id)minSupportedFormatVersion
{
  return &unk_1F3680C50;
}

@end