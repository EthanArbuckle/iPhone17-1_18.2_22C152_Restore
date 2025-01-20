@interface PXNavigationTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PXNavigationTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXNavigationTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXNavigationTitleView", @"_titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXNavigationTitleView", @"_subtitleLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  id v3 = [(PXNavigationTitleViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  char v5 = [v4 _accessibilityViewIsVisible];
  return v5;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(PXNavigationTitleViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  char v5 = [(PXNavigationTitleViewAccessibility *)self safeValueForKey:@"_subtitleLabel"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v4 text];
  v10 = [v6 text];
  v8 = __AXStringForVariables();

  return v8;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PXNavigationTitleViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(PXNavigationTitleViewAccessibility *)&v3 accessibilityTraits];
}

@end