@interface UIStatusBarCarPlayDockAppItemButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityBundleIdentifier;
@end

@implementation UIStatusBarCarPlayDockAppItemButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarCarPlayDockAppItemButton";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIStatusBarCarPlayDockAppItemButton", @"bundleIdentifier", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)_accessibilityBundleIdentifier
{
  return (id)[(UIStatusBarCarPlayDockAppItemButtonAccessibility *)self _accessibilityStringForLabelKeyValues:@"bundleIdentifier", a2, self];
}

@end