@interface PKTableHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation PKTableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKTableHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKTableHeaderView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKTableHeaderView", @"layoutSubviews", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PKTableHeaderViewAccessibility;
  [(PKTableHeaderViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(PKTableHeaderViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKTableHeaderViewAccessibility;
  [(PKTableHeaderViewAccessibility *)&v3 layoutSubviews];
  [(PKTableHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end