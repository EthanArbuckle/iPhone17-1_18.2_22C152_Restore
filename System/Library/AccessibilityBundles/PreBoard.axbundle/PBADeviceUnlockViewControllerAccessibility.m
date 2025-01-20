@interface PBADeviceUnlockViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)deviceUnlocked:(id)a3;
@end

@implementation PBADeviceUnlockViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBADeviceUnlockViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBADeviceUnlockViewController", @"deviceUnlocked:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBADeviceUnlockViewController", @"_homeButtonPressed:", "v", "@", 0);
}

- (void)deviceUnlocked:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBADeviceUnlockViewControllerAccessibility;
  [(PBADeviceUnlockViewControllerAccessibility *)&v5 deviceUnlocked:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  v4 = accessibilityLocalizedString(@"upgrade.announcement");
  UIAccessibilityPostNotification(v3, v4);
}

@end