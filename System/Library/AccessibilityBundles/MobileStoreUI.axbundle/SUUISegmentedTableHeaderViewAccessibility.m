@interface SUUISegmentedTableHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (int64_t)_accessibilitySortPriority;
- (void)setSegmentedControl:(id)a3;
@end

@implementation SUUISegmentedTableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUISegmentedTableHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUISegmentedTableHeaderView", @"setSegmentedControl:", "v", "@", 0);
  [v3 validateClass:@"SUSegmentedControl" hasInstanceVariable:@"_segmentedControl" withType:"UISegmentedControl"];
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)setSegmentedControl:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUISegmentedTableHeaderViewAccessibility;
  id v3 = a3;
  [(SUUISegmentedTableHeaderViewAccessibility *)&v4 setSegmentedControl:v3];
  objc_msgSend(v3, "setShouldGroupAccessibilityChildren:", 0, v4.receiver, v4.super_class);
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end