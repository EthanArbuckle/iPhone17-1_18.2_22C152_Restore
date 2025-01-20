@interface NCBSAccessibilityPreferenceListController
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NCBSAccessibilityPreferenceListController

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCBSAccessibilityPreferenceListController;
  [(NCBSAccessibilityPreferenceListController *)&v5 viewWillAppear:a3];
  [(NCBSAccessibilityPreferenceListController *)self reloadSpecifiers];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_52B4, @"NanoAccessibilityDefaultsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCBSAccessibilityPreferenceListController;
  [(NCBSAccessibilityPreferenceListController *)&v5 viewWillDisappear:a3];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"NanoAccessibilityDefaultsChanged", 0);
}

@end