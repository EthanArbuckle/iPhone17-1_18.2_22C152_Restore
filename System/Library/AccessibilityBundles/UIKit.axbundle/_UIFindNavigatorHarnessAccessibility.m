@interface _UIFindNavigatorHarnessAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation _UIFindNavigatorHarnessAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFindNavigatorHarness";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIFindNavigatorView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"_UIFindNavigatorSearchTextField" isKindOfClass:@"UISearchTextField"];
  v7 = "@";
  [location[0] validateClass:@"_UIFindNavigatorView" hasInstanceMethod:@"searchTextField" withFullSignature:0];
  v4 = "B";
  v6 = @"_UIFindNavigatorHarness";
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"endHoistingFindNavigator:", v5, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"hostView", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_findNavigatorView", v7, 0);
  objc_storeStrong(v9, v8);
}

@end