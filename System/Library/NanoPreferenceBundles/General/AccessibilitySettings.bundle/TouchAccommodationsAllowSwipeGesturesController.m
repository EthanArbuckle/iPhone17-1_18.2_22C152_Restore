@interface TouchAccommodationsAllowSwipeGesturesController
- (TouchAccommodationsAllowSwipeGesturesController)init;
- (void)dealloc;
- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3;
@end

@implementation TouchAccommodationsAllowSwipeGesturesController

- (TouchAccommodationsAllowSwipeGesturesController)init
{
  v5.receiver = self;
  v5.super_class = (Class)TouchAccommodationsAllowSwipeGesturesController;
  v2 = [(AXUISettingsSetupCapableListController *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSettings_0, @"NanoTouchAccommodationsDefaultsChanged", 0, (CFNotificationSuspensionBehavior)1028);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)TouchAccommodationsAllowSwipeGesturesController;
  [(AXUISettingsSetupCapableListController *)&v4 dealloc];
}

- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3
{
}

@end