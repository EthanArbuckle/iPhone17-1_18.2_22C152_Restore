@interface TPSBridgeSettingsController
- (BOOL)suppressAlertSpecifiers;
- (BOOL)suppressMirrorOption;
- (BOOL)suppressSendToNotificationCenterOption;
- (id)applicationBundleIdentifier;
- (id)localizedPaneTitle;
@end

@implementation TPSBridgeSettingsController

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"NANOTIPS_PANE_TITLE" value:&stru_4050 table:0];

  return v3;
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.NanoTips";
}

- (BOOL)suppressMirrorOption
{
  return 1;
}

- (BOOL)suppressAlertSpecifiers
{
  return 0;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

@end