@interface SUUIProductPageTableExpandableHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation SUUIProductPageTableExpandableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIProductPageTableExpandableHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIProductPageTableExpandableHeaderView" hasInstanceVariable:@"_actionLabel" withType:"UILabel"];
  [v3 validateClass:@"SUUIProductPageTableExpandableHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
}

- (id)accessibilityElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SUUIProductPageTableExpandableHeaderViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  [v3 axSafelyAddObject:v4];
  v5 = [(SUUIProductPageTableExpandableHeaderViewAccessibility *)self safeValueForKey:@"_actionLabel"];
  [v3 axSafelyAddObject:v5];

  return v3;
}

@end