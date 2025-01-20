@interface PKStackedTextItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PKStackedTextItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKStackedTextItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKStackedTextItemView" hasInstanceVariable:@"_title" withType:"UILabel"];
  [v3 validateClass:@"PKStackedTextItemView" hasInstanceVariable:@"_primary" withType:"UILabel"];
  [v3 validateClass:@"PKStackedTextItemView" hasInstanceVariable:@"_secondary" withType:"UILabel"];
  [v3 validateClass:@"PKStackedTextItemView" hasInstanceVariable:@"_tertiary" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(PKStackedTextItemViewAccessibility *)self isAccessibilityUserDefinedElement];

  if (!v3) {
    return 1;
  }
  v4 = [(PKStackedTextItemViewAccessibility *)self isAccessibilityUserDefinedElement];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)accessibilityLabel
{
  id v3 = [(PKStackedTextItemViewAccessibility *)self _accessibilityValueForKey:@"AXPKLastTransactionDetailsHeaderTag"];
  v4 = [v3 localizedLowercaseString];

  v7 = [(PKStackedTextItemViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_title, _primary, _secondary, _tertiary"];
  char v5 = __UIAXStringForVariables();

  return v5;
}

@end