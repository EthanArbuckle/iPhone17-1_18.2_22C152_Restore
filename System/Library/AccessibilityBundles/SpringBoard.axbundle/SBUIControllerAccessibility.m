@interface SBUIControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIsAppSwitcherVisible;
- (void)updateBatteryState:(id)a3;
@end

@implementation SBUIControllerAccessibility

- (void)updateBatteryState:(id)a3
{
  id v4 = a3;
  v5 = [(SBUIControllerAccessibility *)self safeValueForKey:@"batteryCapacityAsPercentage"];
  BOOL v6 = [v5 integerValue] > 20;

  v12.receiver = self;
  v12.super_class = (Class)SBUIControllerAccessibility;
  [(SBUIControllerAccessibility *)&v12 updateBatteryState:v4];

  v7 = [(SBUIControllerAccessibility *)self safeValueForKey:@"batteryCapacityAsPercentage"];
  uint64_t v8 = [v7 integerValue];

  if (((v6 ^ (v8 < 21)) & 1) == 0)
  {
    BOOL v9 = v8 < 21;
    UIAccessibilityNotifications v10 = *MEMORY[0x263F812F0];
    v11 = [NSNumber numberWithBool:v9];
    UIAccessibilityPostNotification(v10, v11);
  }
}

+ (id)safeCategoryTargetClassName
{
  return @"SBUIController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsAppSwitcherVisible
{
  v2 = [(id)*MEMORY[0x263F1D020] _accessibilityValueForKey:@"accessibilityIsAppSwitcherVisible"];
  v3 = v2;
  BOOL v4 = v2 && ([v2 BOOLValue] & 1) != 0;

  return v4;
}

@end