@interface PKCreditBalanceCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PKCreditBalanceCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKCreditBalanceCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKCreditBalanceCell" hasInstanceVariable:@"_labelBalance" withType:"UILabel"];
  [v3 validateClass:@"PKCreditBalanceCell" hasInstanceVariable:@"_labelAmount" withType:"UILabel"];
  [v3 validateClass:@"PKCreditBalanceCell" hasInstanceVariable:@"_labelCreditAvailable" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  id v3 = [(PKCreditBalanceCellAccessibility *)self safeUIViewForKey:@"_labelBalance"];
  v4 = [v3 accessibilityLabel];
  v5 = [(PKCreditBalanceCellAccessibility *)self safeUIViewForKey:@"_labelAmount"];
  v6 = [v5 accessibilityLabel];
  v7 = [(PKCreditBalanceCellAccessibility *)self safeUIViewForKey:@"_labelCreditAvailable"];
  v10 = [v7 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

@end