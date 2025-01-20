@interface AXUISettingsTouchAccommodationsController
@end

@implementation AXUISettingsTouchAccommodationsController

void __60__AXUISettingsTouchAccommodationsController_AXSettings_init__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v3 = [WeakRetained shouldIgnoreNextEnabledChangedNotification];

  id v4 = objc_loadWeakRetained(v1);
  id v5 = v4;
  if (v3) {
    [v4 setShouldIgnoreNextEnabledChangedNotification:0];
  }
  else {
    [v4 reloadSpecifiers];
  }
}

@end