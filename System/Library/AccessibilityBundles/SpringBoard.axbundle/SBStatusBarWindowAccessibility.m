@interface SBStatusBarWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanBeConsideredAsMainWindow;
- (BOOL)_accessibilityIsIsolatedWindow;
- (BOOL)_wantsFocusEngine;
- (BOOL)accessibilityElementsHidden;
- (int64_t)_accessibilitySortPriority;
@end

@implementation SBStatusBarWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBStatusBarWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBStatusBarWindow" isKindOfClass:@"UIWindow"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"_wantsFocusEngine", "B", 0);
}

- (BOOL)accessibilityElementsHidden
{
  if (_UIApplicationIsExtension()) {
    return 1;
  }
  v4 = [(SBStatusBarWindowAccessibility *)self storedAccessibilityElementsHidden];

  if (!v4) {
    return 0;
  }
  v5 = [(SBStatusBarWindowAccessibility *)self storedAccessibilityElementsHidden];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (int64_t)_accessibilitySortPriority
{
  if (!AXProcessIsSpringBoard() || !AXDeviceHasJindo() || AXRequestingClient() != 3) {
    return 0x7FFFFFFFLL;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBStatusBarWindowAccessibility;
  return [(SBStatusBarWindowAccessibility *)&v4 _accessibilitySortPriority];
}

- (BOOL)_accessibilityCanBeConsideredAsMainWindow
{
  return 0;
}

- (BOOL)_wantsFocusEngine
{
  if ([(SBStatusBarWindowAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)SBStatusBarWindowAccessibility;
  return [(SBStatusBarWindowAccessibility *)&v4 _wantsFocusEngine];
}

@end