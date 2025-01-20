@interface UIStatusBarWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanBeConsideredAsMainWindow;
- (BOOL)_accessibilityIsIsolatedWindow;
- (BOOL)_wantsFocusEngine;
- (BOOL)accessibilityElementsHidden;
- (int64_t)_accessibilitySortPriority;
@end

@implementation UIStatusBarWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIWindow";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"UIStatusBarWindow");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"_wantsFocusEngine", "B", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)accessibilityElementsHidden
{
  if (_UIApplicationIsExtension()) {
    return 1;
  }
  id v2 = (id)[(UIStatusBarWindowAccessibility *)self storedAccessibilityElementsHidden];
  BOOL v5 = v2 == 0;

  if (v5) {
    return 0;
  }
  id v4 = (id)[(UIStatusBarWindowAccessibility *)self storedAccessibilityElementsHidden];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (BOOL)_accessibilityIsIsolatedWindow
{
  return 1;
}

- (int64_t)_accessibilitySortPriority
{
  BOOL v5 = self;
  SEL v4 = a2;
  if ((AXProcessIsSpringBoard() & 1) == 0 || (AXDeviceHasJindo() & 1) == 0 || AXRequestingClient() != 3) {
    return 0x7FFFFFFFLL;
  }
  v3.receiver = v5;
  v3.super_class = (Class)UIStatusBarWindowAccessibility;
  return [(UIStatusBarWindowAccessibility *)&v3 _accessibilitySortPriority];
}

- (BOOL)_accessibilityCanBeConsideredAsMainWindow
{
  return 0;
}

- (BOOL)_wantsFocusEngine
{
  BOOL v5 = self;
  SEL v4 = a2;
  if ([(UIStatusBarWindowAccessibility *)self _accessibilityIsFKARunningForFocusItem])return 1; {
  v3.receiver = v5;
  }
  v3.super_class = (Class)UIStatusBarWindowAccessibility;
  return [(UIStatusBarWindowAccessibility *)&v3 _wantsFocusEngine];
}

@end