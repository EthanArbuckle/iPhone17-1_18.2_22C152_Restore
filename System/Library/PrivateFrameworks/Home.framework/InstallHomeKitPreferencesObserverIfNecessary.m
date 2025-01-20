@interface InstallHomeKitPreferencesObserverIfNecessary
@end

@implementation InstallHomeKitPreferencesObserverIfNecessary

void ___InstallHomeKitPreferencesObserverIfNecessary_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_HomeDPrefsChangedHandler, @"com.apple.homed.preferenceschanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end