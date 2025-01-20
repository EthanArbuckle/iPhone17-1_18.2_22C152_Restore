@interface HUCardViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIgnoreSettingsDetailScrollLockIn;
- (BOOL)disablePullToUnlockSettings;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_nudgeScrollViewToPoint:(CGPoint)a3;
@end

@implementation HUCardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUCardViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCardViewController", @"disablePullToUnlockSettings", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCardViewController", @"forceUnlockSettings", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCardViewController", @"_nudgeScrollViewToPoint:", "v", "{CGPoint=dd}", 0);
}

- (BOOL)_accessibilityIgnoreSettingsDetailScrollLockIn
{
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning()) {
    return 1;
  }

  return MEMORY[0x270F062D8]();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)HUCardViewControllerAccessibility;
  [(HUCardViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  if ([(HUCardViewControllerAccessibility *)self _accessibilityIgnoreSettingsDetailScrollLockIn])
  {
    id v3 = (id)[(HUCardViewControllerAccessibility *)self safeValueForKey:@"forceUnlockSettings"];
  }
}

- (void)_nudgeScrollViewToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(HUCardViewControllerAccessibility *)self _accessibilityIgnoreSettingsDetailScrollLockIn])
  {
    v6.receiver = self;
    v6.super_class = (Class)HUCardViewControllerAccessibility;
    -[HUCardViewControllerAccessibility _nudgeScrollViewToPoint:](&v6, sel__nudgeScrollViewToPoint_, x, y);
  }
}

- (BOOL)disablePullToUnlockSettings
{
  if ([(HUCardViewControllerAccessibility *)self _accessibilityIgnoreSettingsDetailScrollLockIn])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)HUCardViewControllerAccessibility;
  return [(HUCardViewControllerAccessibility *)&v4 disablePullToUnlockSettings];
}

@end