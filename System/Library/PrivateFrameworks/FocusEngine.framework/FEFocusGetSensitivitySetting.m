@interface FEFocusGetSensitivitySetting
@end

@implementation FEFocusGetSensitivitySetting

void ___FEFocusGetSensitivitySetting_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_FEFocusClearCachedSensitivitySettingObserver, @"_FEFocusSensitivityUpdateNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
}

@end