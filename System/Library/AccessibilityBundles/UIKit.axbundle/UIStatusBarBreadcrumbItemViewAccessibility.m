@interface UIStatusBarBreadcrumbItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarBreadcrumbItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarBreadcrumbItemView";
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
  v4 = @"UIStatusBarSystemNavigationItemView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = @"UIStatusBarBreadcrumbItemView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:v3 isKindOfClass:v4];
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v12 = self;
  v11[1] = (id)a2;
  char v10 = 0;
  objc_opt_class();
  id v7 = (id)[(UIStatusBarBreadcrumbItemViewAccessibility *)v12 safeValueForKey:@"button"];
  id v9 = (id)__UIAccessibilityCastAsClass();

  id v8 = v9;
  objc_storeStrong(&v9, 0);
  v11[0] = v8;
  v3 = NSString;
  id v5 = accessibilityLocalizedString(@"breadcrumb.return.to.app");
  id v4 = (id)[v11[0] accessibilityLabel];
  id v6 = (id)objc_msgSend(v3, "stringWithFormat:", v5, v4);

  objc_storeStrong(v11, 0);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8] | *MEMORY[0x263F813F0];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end