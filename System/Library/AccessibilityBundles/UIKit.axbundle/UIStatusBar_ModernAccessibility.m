@interface UIStatusBar_ModernAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityViewIsVisible;
- (int64_t)_accessibilitySortPriority;
@end

@implementation UIStatusBar_ModernAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBar_Modern";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"_UIStatusBar" isKindOfClass:@"UIView"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIStatusBar_Modern", @"statusBar", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)_accessibilityViewIsVisible
{
  id v3 = (id)[(UIStatusBar_ModernAccessibility *)self safeUIViewForKey:@"statusBar"];
  int v4 = [v3 isHidden] ^ 1;

  return v4 & 1;
}

- (int64_t)_accessibilitySortPriority
{
  v5 = self;
  SEL v4 = a2;
  if ((AXProcessIsSpringBoard() & 1) == 0 || (AXDeviceHasJindo() & 1) == 0 || AXRequestingClient() != 3) {
    return 0x7FFFFFFFLL;
  }
  v3.receiver = v5;
  v3.super_class = (Class)UIStatusBar_ModernAccessibility;
  return [(UIStatusBar_ModernAccessibility *)&v3 _accessibilitySortPriority];
}

@end