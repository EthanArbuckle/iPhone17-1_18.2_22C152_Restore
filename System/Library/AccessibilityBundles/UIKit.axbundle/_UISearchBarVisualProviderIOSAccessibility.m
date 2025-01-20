@interface _UISearchBarVisualProviderIOSAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setUpScopeBar;
@end

@implementation _UISearchBarVisualProviderIOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UISearchBarVisualProviderIOS";
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
  v3 = @"_UISearchBarVisualProviderIOS";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"scopeBar", "@", 0);
  objc_storeStrong(v5, obj);
}

- (void)setUpScopeBar
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UISearchBarVisualProviderIOSAccessibility;
  [(_UISearchBarVisualProviderIOSAccessibility *)&v3 setUpScopeBar];
  id v2 = (id)-[_UISearchBarVisualProviderIOSAccessibility safeValueForKey:](v5, "safeValueForKey:");
  [v2 setAccessibilityIdentifier:@"scopeBar"];
}

@end