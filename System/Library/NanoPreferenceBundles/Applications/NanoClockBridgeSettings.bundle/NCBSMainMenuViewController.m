@interface NCBSMainMenuViewController
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)localizedPaneTitle;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NCBSMainMenuViewController

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PANE_TITLE" value:&stru_C500 table:@"NanoClockBridgeSettings"];

  return v3;
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.mobiletimer";
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NCBSMainMenuViewController;
  [(NCBSMainMenuViewController *)&v7 viewWillAppear:a3];
  [(NCBSMainMenuViewController *)self reloadSpecifiers];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_7E1C, @"NanoAccessibilityDefaultsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)sub_7E1C, @"com.apple.NanoTimeKit.NTKNanoPrefsChanges", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)sub_7E1C, @"FaceSupportFastSwitching", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NCBSMainMenuViewController;
  [(NCBSMainMenuViewController *)&v7 viewWillDisappear:a3];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"NanoAccessibilityDefaultsChanged", 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, @"com.apple.NanoTimeKit.NTKNanoPrefsChanges", 0);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self, @"FaceSupportFastSwitching", 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)NCBSMainMenuViewController;
  id v6 = a4;
  [(NCBSMainMenuViewController *)&v20 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[NCBSMainMenuViewController indexForIndexPath:](self, "indexForIndexPath:", v6, v20.receiver, v20.super_class);
  v8 = [(NCBSMainMenuViewController *)self specifiers];
  v9 = [v8 objectAtIndex:v7];

  id v10 = [v6 section];
  v11 = [(NCBSMainMenuViewController *)self specifierAtIndex:[(NCBSMainMenuViewController *)self indexOfGroup:v10]];
  v12 = [v11 propertyForKey:PSIsRadioGroupKey];
  unsigned int v13 = [v12 BOOLValue];

  if (v13)
  {
    v14 = [v11 identifier];
    unsigned int v15 = [v14 isEqualToString:@"TapToSpeakTimeSettingsGroupID"];

    if (v15)
    {
      v16 = [v9 propertyForKey:PSValueKey];
      v17 = v16;
      if (v16)
      {
        id v18 = [v16 integerValue];
        v19 = +[AXTimeOutputPreferences sharedInstance];
        [v19 setTapToSpeakTimeAvailability:v18];

        [(NCBSMainMenuViewController *)self reloadSpecifiers];
      }
    }
  }
}

@end