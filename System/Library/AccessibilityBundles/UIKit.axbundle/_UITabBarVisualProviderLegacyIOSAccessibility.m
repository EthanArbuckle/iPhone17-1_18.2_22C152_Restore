@interface _UITabBarVisualProviderLegacyIOSAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)createViewForTabBarItem:(id)a3;
@end

@implementation _UITabBarVisualProviderLegacyIOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UITabBarVisualProviderLegacyIOS";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UITabBarVisualProviderLegacyIOS", @"createViewForTabBarItem:", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)createViewForTabBarItem:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)_UITabBarVisualProviderLegacyIOSAccessibility;
  id v6 = [(_UITabBarVisualProviderLegacyIOSAccessibility *)&v5 createViewForTabBarItem:location[0]];
  AXApplyTabBarItemPropertiesToView(location[0], v6);
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

@end