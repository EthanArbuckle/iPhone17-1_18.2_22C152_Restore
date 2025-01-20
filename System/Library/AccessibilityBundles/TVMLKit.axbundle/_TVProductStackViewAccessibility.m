@interface _TVProductStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setTitleView:(id)a3;
@end

@implementation _TVProductStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVProductStackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVProductStackView", @"setTitleView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVProductStackView", @"titleView", "@", 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)_TVProductStackViewAccessibility;
  [(_TVProductStackViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(_TVProductStackViewAccessibility *)self safeValueForKey:@"titleView"];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v4];
}

- (void)setTitleView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVProductStackViewAccessibility;
  [(_TVProductStackViewAccessibility *)&v4 setTitleView:a3];
  [(_TVProductStackViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end