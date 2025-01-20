@interface FullWidthDetailHeaderCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation FullWidthDetailHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.FullWidthDetailHeaderCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)FullWidthDetailHeaderCellAccessibility;
  [(FullWidthDetailHeaderCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(FullWidthDetailHeaderCellAccessibility *)self _accessibilityDescendantOfType:objc_opt_class()];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v4];
}

@end