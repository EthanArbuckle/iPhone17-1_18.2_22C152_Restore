@interface AXSBLockScreenManager
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_authenticationStateChanged:(id)a3;
- (void)lockUIFromSource:(int)a3 withOptions:(id)a4;
@end

@implementation AXSBLockScreenManager

+ (id)safeCategoryTargetClassName
{
  return @"SBLockScreenManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)lockUIFromSource:(int)a3 withOptions:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AXSBLockScreenManager;
  [(AXSBLockScreenManager *)&v4 lockUIFromSource:*(void *)&a3 withOptions:a4];
  [(id)SBServerHelper _accessibilityHandleHomeOrLockButtonPress];
}

- (void)_authenticationStateChanged:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXSBLockScreenManager;
  [(AXSBLockScreenManager *)&v4 _authenticationStateChanged:a3];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F8B140], 0, 0, 1u);
}

@end