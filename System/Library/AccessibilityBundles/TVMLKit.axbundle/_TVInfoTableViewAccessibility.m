@interface _TVInfoTableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)accessibilityElements;
@end

@implementation _TVInfoTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVInfoTableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVInfoTableView", @"headerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVInfoTableView", @"infoViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVInfoTableView", @"footerView", "@", 0);
  [v3 validateClass:@"_TVProductBannerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVProductBannerView", @"stackView", "@", 0);
  [v3 validateClass:@"_TVProductStackView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVProductStackView", @"titleView", "@", 0);
}

- (id)accessibilityElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(_TVInfoTableViewAccessibility *)self safeValueForKey:@"headerView"];
  [v3 axSafelyAddObject:v4];

  v5 = [(_TVInfoTableViewAccessibility *)self safeValueForKey:@"infoViews"];
  [v3 axSafelyAddObjectsFromArray:v5];

  v6 = [(_TVInfoTableViewAccessibility *)self safeValueForKey:@"footerView"];
  [v3 axSafelyAddObject:v6];

  return v3;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end