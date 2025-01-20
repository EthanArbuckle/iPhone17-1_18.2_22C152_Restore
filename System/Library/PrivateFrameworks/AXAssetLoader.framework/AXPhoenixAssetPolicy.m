@interface AXPhoenixAssetPolicy
- (BOOL)shouldCopyLocally;
- (id)assetType;
- (id)launchActivityIdentifier;
@end

@implementation AXPhoenixAssetPolicy

- (id)assetType
{
  return @"com.apple.MobileAsset.AXBackTapModel";
}

- (id)launchActivityIdentifier
{
  return @"com.apple.ax.AXBackTapModel.LaunchActivity";
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

@end