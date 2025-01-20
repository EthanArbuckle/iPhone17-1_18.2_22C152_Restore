@interface NCInsetGroupedButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NCInsetGroupedButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCInsetGroupedButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCInsetGroupedButton" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"NCInsetGroupedButton" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(NCInsetGroupedButtonAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _subtitleLabel"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end