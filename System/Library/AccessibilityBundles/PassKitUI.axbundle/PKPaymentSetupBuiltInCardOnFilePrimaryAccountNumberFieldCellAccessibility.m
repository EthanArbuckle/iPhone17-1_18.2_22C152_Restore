@interface PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell", @"paymentCredentialType", "q", 0);
  [v3 validateClass:@"PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell" isKindOfClass:@"UITableViewCell"];
}

- (id)accessibilityLabel
{
  [(PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCellAccessibility *)self safeIntegerForKey:@"paymentCredentialType"];
  id v3 = PKDisplayablePaymentNetworkNameForPaymentCredentialType();
  v4 = [(PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCellAccessibility *)self safeUIViewForKey:@"textLabel"];
  v5 = [v4 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end