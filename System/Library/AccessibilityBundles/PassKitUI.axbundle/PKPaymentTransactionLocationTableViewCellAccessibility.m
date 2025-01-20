@interface PKPaymentTransactionLocationTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation PKPaymentTransactionLocationTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentTransactionLocationTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"maps.location.hint");
}

- (id)accessibilityLabel
{
  v2 = [(PKPaymentTransactionLocationTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel"];
  v3 = NSString;
  v4 = accessibilityLocalizedString(@"maps.location.label");
  v5 = objc_msgSend(v3, "stringWithFormat:", v4, v2);

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end