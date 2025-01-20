@interface AXUpdateAssetTaskRestorationState
+ (id)restoreOrCreateStateFromStore:(id)a3 assetType:(id)a4;
- (BOOL)hasCompletedDownloadingAssets;
- (BOOL)hasCompletedPurgingAssets;
- (BOOL)hasCompletedRefreshingAssets;
- (BOOL)isDownloadingAssets;
- (BOOL)isPurgingAssets;
- (BOOL)isRefreshingAssets;
@end

@implementation AXUpdateAssetTaskRestorationState

+ (id)restoreOrCreateStateFromStore:(id)a3 assetType:(id)a4
{
  return _[a1 restoreOrCreateStateFromStore:a3 taskID:@"UpdateAsset" assetType:a4];
}

- (BOOL)isRefreshingAssets
{
  v2 = [(AXManagedAssetTaskRestorationState *)self phase];
  unsigned __int8 v3 = [v2 isEqualToString:@"Refreshing Assets"];

  return v3;
}

- (BOOL)isPurgingAssets
{
  v2 = [(AXManagedAssetTaskRestorationState *)self phase];
  unsigned __int8 v3 = [v2 isEqualToString:@"Purging Assets"];

  return v3;
}

- (BOOL)isDownloadingAssets
{
  v2 = [(AXManagedAssetTaskRestorationState *)self phase];
  unsigned __int8 v3 = [v2 isEqualToString:@"Downloading Assets"];

  return v3;
}

- (BOOL)hasCompletedRefreshingAssets
{
  if ([(AXManagedAssetTaskRestorationState *)self isIdle]) {
    return 0;
  }
  else {
    return ![(AXUpdateAssetTaskRestorationState *)self isRefreshingAssets];
  }
}

- (BOOL)hasCompletedPurgingAssets
{
  BOOL v3 = [(AXUpdateAssetTaskRestorationState *)self hasCompletedRefreshingAssets];
  if (v3) {
    LOBYTE(v3) = ![(AXUpdateAssetTaskRestorationState *)self isPurgingAssets];
  }
  return v3;
}

- (BOOL)hasCompletedDownloadingAssets
{
  BOOL v3 = [(AXUpdateAssetTaskRestorationState *)self hasCompletedPurgingAssets];
  if (v3) {
    LOBYTE(v3) = ![(AXUpdateAssetTaskRestorationState *)self isDownloadingAssets];
  }
  return v3;
}

@end