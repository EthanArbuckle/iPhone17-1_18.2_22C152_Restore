@interface ContainerHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateSubviews;
- (void)_customInit;
- (void)didMoveToWindow;
@end

@implementation ContainerHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ContainerHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ContainerHeaderView", @"_customInit", "v", 0);
  [v3 validateClass:@"ContainerHeaderView" hasInstanceVariable:@"_defaultTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"ContainerHeaderView" hasInstanceVariable:@"_buttonView" withType:"CardButton"];
  [v3 validateClass:@"ContainerHeaderView" isKindOfClass:@"UIView"];
}

- (void)_axAnnotateSubviews
{
  id v3 = [(ContainerHeaderViewAccessibility *)self safeValueForKey:@"_defaultTitleLabel"];
  uint64_t v2 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v2];
}

- (id)accessibilityElements
{
  id v3 = [(ContainerHeaderViewAccessibility *)self safeValueForKey:@"_buttonView"];
  v4 = [(ContainerHeaderViewAccessibility *)self _accessibilitySubviews];
  v5 = [v4 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];

  uint64_t v6 = [v5 indexOfObject:v3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    v8 = (void *)[v5 mutableCopy];

    objc_msgSend(v8, "exchangeObjectAtIndex:withObjectAtIndex:", objc_msgSend(v8, "count") - 1, v7);
    v5 = v8;
  }

  return v5;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)ContainerHeaderViewAccessibility;
  [(ContainerHeaderViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(ContainerHeaderViewAccessibility *)self _axAnnotateSubviews];
}

- (void)_customInit
{
  v3.receiver = self;
  v3.super_class = (Class)ContainerHeaderViewAccessibility;
  [(ContainerHeaderViewAccessibility *)&v3 _customInit];
  [(ContainerHeaderViewAccessibility *)self _axAnnotateSubviews];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)ContainerHeaderViewAccessibility;
  [(ContainerHeaderViewAccessibility *)&v3 didMoveToWindow];
  [(ContainerHeaderViewAccessibility *)self _axAnnotateSubviews];
}

@end