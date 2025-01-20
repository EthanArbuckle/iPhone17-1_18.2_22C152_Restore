@interface ExpandingDetailDescriptionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ExpandingDetailDescriptionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.ExpandingDetailDescriptionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)ExpandingDetailDescriptionCellAccessibility;
  [(ExpandingDetailDescriptionCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(ExpandingDetailDescriptionCellAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
}

@end