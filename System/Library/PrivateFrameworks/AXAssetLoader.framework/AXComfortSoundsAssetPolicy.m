@interface AXComfortSoundsAssetPolicy
- (BOOL)shouldCopyLocally;
- (id)assetType;
- (id)launchActivityIdentifier;
- (id)maxSupportedFormatVersion;
- (id)minSupportedFormatVersion;
@end

@implementation AXComfortSoundsAssetPolicy

- (id)assetType
{
  return @"com.apple.MobileAsset.ComfortSoundsAssets";
}

- (id)launchActivityIdentifier
{
  return @"com.apple.ax.ComfortSounds.LaunchActivity";
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

- (id)maxSupportedFormatVersion
{
  return &unk_1F3680C38;
}

- (id)minSupportedFormatVersion
{
  return &unk_1F3680C38;
}

@end