@interface _KSDeviceStateMonitor
+ (BOOL)isRunningOnInternalBuild;
+ (id)deviceStateMonitor;
- (BOOL)deviceHasBeenUnlockedSinceBoot;
- (BOOL)deviceIsPasswordConfigured;
- (BOOL)isContentProtectionAvailable;
- (BOOL)isDataAvailableForClassC;
- (_KSDeviceStateMonitor)init;
- (void)dealloc;
- (void)handleKeyBagLockNotification;
- (void)setIsContentProtectionAvailable:(BOOL)a3;
@end

@implementation _KSDeviceStateMonitor

- (BOOL)isDataAvailableForClassC
{
  if ([(_KSDeviceStateMonitor *)self deviceHasBeenUnlockedSinceBoot]) {
    return 1;
  }
  else {
    return ![(_KSDeviceStateMonitor *)self deviceIsPasswordConfigured];
  }
}

- (BOOL)deviceHasBeenUnlockedSinceBoot
{
  return softLinkMKBDeviceUnlockedSinceBoot() != 0;
}

+ (id)deviceStateMonitor
{
  if (deviceStateMonitor_onceToken != -1) {
    dispatch_once(&deviceStateMonitor_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)deviceStateMonitor_sharedInstance;
  return v2;
}

- (_KSDeviceStateMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)_KSDeviceStateMonitor;
  v2 = [(_KSDeviceStateMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_isContentProtectionAvailable = 0;
    int v4 = MKBDeviceFormattedForContentProtection();
    v3->_isContentProtectionAvailable = v4 != 0;
    if (v4)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      if (DarwinNotifyCenter) {
        CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_handleKeyBagNotification, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter) {
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.keybagd.first_unlock", 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)_KSDeviceStateMonitor;
  [(_KSDeviceStateMonitor *)&v4 dealloc];
}

- (void)handleKeyBagLockNotification
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"KSDeviceProtectionClassDidChange" object:0];
}

- (BOOL)deviceIsPasswordConfigured
{
  id v2 = (const void *)softLinkMGCopyAnswer(@"PasswordConfigured", 0);
  v3 = v2;
  objc_super v4 = (const void *)*MEMORY[0x263EFFB40];
  if (v2) {
    CFRelease(v2);
  }
  return v3 == v4;
}

+ (BOOL)isRunningOnInternalBuild
{
  if (isRunningOnInternalBuild_onceToken != -1) {
    dispatch_once(&isRunningOnInternalBuild_onceToken, &__block_literal_global_12);
  }
  return isRunningOnInternalBuild_isInternalBuild;
}

- (BOOL)isContentProtectionAvailable
{
  return self->_isContentProtectionAvailable;
}

- (void)setIsContentProtectionAvailable:(BOOL)a3
{
  self->_isContentProtectionAvailable = a3;
}

@end