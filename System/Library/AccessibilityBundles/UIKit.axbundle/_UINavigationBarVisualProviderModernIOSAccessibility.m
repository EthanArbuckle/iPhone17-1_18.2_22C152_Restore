@interface _UINavigationBarVisualProviderModernIOSAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)layoutSubviews;
@end

@implementation _UINavigationBarVisualProviderModernIOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UINavigationBarVisualProviderModernIOS";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UINavigationBarVisualProviderModernIOS";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v4 = @"_UINavigationBarVisualProvider";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:v3 isKindOfClass:v4];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UINavigationBarAccessibility", @"_accessibilityNavBarElements", "@", 0);
  objc_storeStrong(v6, obj);
}

- (void)layoutSubviews
{
  v12 = self;
  v11[1] = (id)a2;
  v11[0] = (id)[(_UINavigationBarVisualProviderModernIOSAccessibility *)self safeValueForKey:@"_navigationBar"];
  id v2 = (id)[v11[0] safeArrayForKey:@"_accessibilityNavBarElements"];
  BOOL v4 = v2 != 0;

  if (v4)
  {
    id v3 = (id)[v11[0] accessibilityElements];
    id v8 = (id)[v3 copy];

    v7.receiver = v12;
    v7.super_class = (Class)_UINavigationBarVisualProviderModernIOSAccessibility;
    [(_UINavigationBarVisualProviderModernIOSAccessibility *)&v7 layoutSubviews];
    id v5 = v11[0];
    id v6 = v8;
    AXPerformBlockAsynchronouslyOnMainThread();
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v8, 0);
    int v9 = 0;
  }
  else
  {
    v10.receiver = v12;
    v10.super_class = (Class)_UINavigationBarVisualProviderModernIOSAccessibility;
    [(_UINavigationBarVisualProviderModernIOSAccessibility *)&v10 layoutSubviews];
    int v9 = 1;
  }
  objc_storeStrong(v11, 0);
}

@end