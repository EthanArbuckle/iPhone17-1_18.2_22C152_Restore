@interface AXUISettingsSetupCapableListController
- (id)_axGetSoundActionsDownloadManager;
- (id)soundActionsDownloadManager;
- (id)soundActionslocalURL;
- (void)_axSetSoundActionsDownloadManager:(id)a3;
- (void)latestAssetDidUpdate:(id)a3;
@end

@implementation AXUISettingsSetupCapableListController

- (id)_axGetSoundActionsDownloadManager
{
  return (id)___UIAccessibilityGetAssociatedObject(self, &__AXUISettingsSetupCapableListController___axGetSoundActionsDownloadManager);
}

- (void)_axSetSoundActionsDownloadManager:(id)a3
{
}

- (id)soundActionsDownloadManager
{
  v3 = [(AXUISettingsSetupCapableListController *)self _axGetSoundActionsDownloadManager];

  if (!v3)
  {
    v4 = objc_alloc_init(SoundActionsAssetsDownloadManager);
    [(SoundActionsAssetsDownloadManager *)v4 setDelegate:self];
    [(SoundActionsAssetsDownloadManager *)v4 refreshAssets];
    [(AXUISettingsSetupCapableListController *)self _axSetSoundActionsDownloadManager:v4];
  }

  return [(AXUISettingsSetupCapableListController *)self _axGetSoundActionsDownloadManager];
}

- (void)latestAssetDidUpdate:(id)a3
{
}

id __77__AXUISettingsSetupCapableListController_SoundActions__latestAssetDidUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) soundActionsAssetDidUpdate];
}

- (id)soundActionslocalURL
{
  v2 = [(AXUISettingsSetupCapableListController *)self soundActionsDownloadManager];
  v3 = [v2 latestAsset];
  v4 = [v3 localURL];

  return v4;
}

@end