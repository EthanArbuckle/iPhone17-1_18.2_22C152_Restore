@interface TouchAccommodationsController
- (Class)touchAccomodationsSwipeGestureViewControllerClass;
- (TouchAccommodationsController)init;
- (void)dealloc;
- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3;
- (void)setTouchAccommodationsEnabled:(BOOL)a3;
- (void)setTouchAccommodationsHoldDurationEnabled:(BOOL)a3;
- (void)setTouchAccommodationsIgnoreRepeatEnabled:(BOOL)a3;
- (void)setTouchAccommodationsTapActivationMethod:(int64_t)a3;
@end

@implementation TouchAccommodationsController

- (TouchAccommodationsController)init
{
  v10[1] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)TouchAccommodationsController;
  v2 = [(AXUISettingsSetupCapableListController *)&v9 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263F82C20];
    v10[0] = objc_opt_class();
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    v5 = [v3 appearanceWhenContainedInInstancesOfClasses:v4];
    v6 = BPSBridgeTintColor();
    [v5 setTintColor:v6];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_reloadSettings_1, @"NanoTouchAccommodationsDefaultsChanged", 0, (CFNotificationSuspensionBehavior)1028);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)TouchAccommodationsController;
  [(AXUISettingsSetupCapableListController *)&v4 dealloc];
}

- (Class)touchAccomodationsSwipeGestureViewControllerClass
{
  return (Class)objc_opt_class();
}

- (void)setTouchAccommodationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && (AXGizmoTouchAccommodationsUsageConfirmed() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x263F82400];
    v6 = settingsLocString(@"TOUCH_ACCOMMODATIONS_USAGE_CONFIRM", @"TouchAccommodations");
    v7 = [v5 actionWithTitle:v6 style:0 handler:&__block_literal_global_2];

    v8 = (void *)MEMORY[0x263F82400];
    objc_super v9 = settingsLocString(@"TOUCH_ACCOMMODATIONS_USAGE_CANCEL", @"TouchAccommodations");
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__TouchAccommodationsController_setTouchAccommodationsEnabled___block_invoke_2;
    v15[3] = &unk_2651F20C0;
    v15[4] = self;
    v10 = [v8 actionWithTitle:v9 style:1 handler:v15];

    v11 = (void *)MEMORY[0x263F82418];
    v12 = settingsLocString(@"TOUCH_ACCOMMODATIONS_USAGE_TITLE", @"TouchAccommodations");
    v13 = settingsLocString(@"TOUCH_ACCOMMODATIONS_USAGE_MESSAGE", @"TouchAccommodations");
    v14 = [v11 alertControllerWithTitle:v12 message:v13 preferredStyle:1];

    [v14 addAction:v7];
    [v14 addAction:v10];
    [(TouchAccommodationsController *)self presentViewController:v14 animated:1 completion:0];
  }
  else
  {
    AXGizmoTouchAccommodationsSetEnabled(v3);
  }
}

void __63__TouchAccommodationsController_setTouchAccommodationsEnabled___block_invoke()
{
  AXGizmoTouchAccommodationsSetUsageConfirmed(1);

  AXGizmoTouchAccommodationsSetEnabled(1);
}

uint64_t __63__TouchAccommodationsController_setTouchAccommodationsEnabled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reload];
}

- (void)setTouchAccommodationsHoldDurationEnabled:(BOOL)a3
{
}

- (void)setTouchAccommodationsIgnoreRepeatEnabled:(BOOL)a3
{
}

- (void)setTouchAccommodationsAllowsSwipeGesturesToBypass:(BOOL)a3
{
}

- (void)setTouchAccommodationsTapActivationMethod:(int64_t)a3
{
}

@end