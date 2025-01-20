@interface PKPaymentButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation PKPaymentButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(PKPaymentButtonAccessibility *)self accessibilityUserDefinedLabel];

  if (v3)
  {
    v4 = [(PKPaymentButtonAccessibility *)self accessibilityUserDefinedLabel];
  }
  else
  {
    v5 = [(PKPaymentButtonAccessibility *)self safeValueForKey:@"_type"];
    uint64_t v6 = [v5 integerValue];

    switch(v6)
    {
      case 1:
        v7 = @"buy.apple.pay.button";
        break;
      case 3:
        v7 = @"pay.apple.pay.button";
        break;
      case 4:
        v7 = @"donate.button";
        break;
      default:
        v7 = @"apple.pay.button";
        break;
    }
    v4 = accessibilityLocalizedString(v7);
  }

  return v4;
}

@end