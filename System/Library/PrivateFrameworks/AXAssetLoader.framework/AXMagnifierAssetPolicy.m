@interface AXMagnifierAssetPolicy
- (BOOL)shouldCopyLocally;
- (BOOL)shouldUseProductionServerForInternalBuilds;
- (id)assetType;
- (id)launchActivityIdentifier;
- (id)maxSupportedFormatVersion;
- (id)minSupportedFormatVersion;
@end

@implementation AXMagnifierAssetPolicy

- (id)assetType
{
  return @"com.apple.MobileAsset.MagnifierAsset";
}

- (id)launchActivityIdentifier
{
  return @"com.apple.ax.MagnifierAsset.LaunchActivity";
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

- (BOOL)shouldUseProductionServerForInternalBuilds
{
  return 0;
}

- (id)maxSupportedFormatVersion
{
  return &unk_1F3680C68;
}

- (id)minSupportedFormatVersion
{
  return &unk_1F3680C68;
}

@end