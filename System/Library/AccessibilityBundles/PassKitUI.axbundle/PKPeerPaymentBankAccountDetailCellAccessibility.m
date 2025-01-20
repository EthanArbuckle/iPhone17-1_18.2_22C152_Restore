@interface PKPeerPaymentBankAccountDetailCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKPeerPaymentBankAccountDetailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPeerPaymentBankAccountDetailCell";
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
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentBankAccountDetailCellAccessibility;
  [(PKPeerPaymentBankAccountDetailCellAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  char v7 = 0;
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 editableTextField];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __93__PKPeerPaymentBankAccountDetailCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_265140E18;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityLabelBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __93__PKPeerPaymentBankAccountDetailCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = __UIAccessibilityCastAsClass();

  v4 = [v3 textLabel];
  v5 = [v4 accessibilityLabel];

  return v5;
}

- (id)accessibilityElements
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 editableTextField];
  v5 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

@end