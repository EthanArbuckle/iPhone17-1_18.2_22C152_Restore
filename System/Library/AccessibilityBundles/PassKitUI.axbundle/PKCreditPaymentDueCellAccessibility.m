@interface PKCreditPaymentDueCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)createSubviews;
@end

@implementation PKCreditPaymentDueCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKCreditPaymentDueCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKCreditPaymentDueCell" hasInstanceVariable:@"_payButton" withType:"PKContinuousButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKCreditPaymentDueCell", @"paymentDueLabelText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKCreditPaymentDueCell", @"dateLabelText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKCreditPaymentDueCell", @"detailLabelText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKCreditPaymentDueCell", @"createSubviews", "v", 0);
}

- (void)createSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKCreditPaymentDueCellAccessibility;
  [(PKCreditPaymentDueCellAccessibility *)&v3 createSubviews];
  [(PKCreditPaymentDueCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_super v3 = [(PKCreditPaymentDueCellAccessibility *)self safeStringForKey:@"paymentDueLabelText"];
  v4 = [(PKCreditPaymentDueCellAccessibility *)self safeStringForKey:@"dateLabelText"];
  v7 = [(PKCreditPaymentDueCellAccessibility *)self safeStringForKey:@"detailLabelText"];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)PKCreditPaymentDueCellAccessibility;
  [(PKCreditPaymentDueCellAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(PKCreditPaymentDueCellAccessibility *)self safeValueForKey:@"item"];
  unint64_t v4 = [v3 safeIntegerForKey:@"type"];

  if (v4 > 4) {
    v5 = @"check.activity.button";
  }
  else {
    v5 = off_265140F58[v4];
  }
  v6 = accessibilityLocalizedString(v5);
  v7 = [(PKCreditPaymentDueCellAccessibility *)self safeUIViewForKey:@"_payButton"];
  [v7 setAccessibilityLabel:v6];
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v3 = [(PKCreditPaymentDueCellAccessibility *)self safeUIViewForKey:@"_payButton"];
  int v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = [(PKCreditPaymentDueCellAccessibility *)self safeUIViewForKey:@"_payButton"];
    v7 = objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 1, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF48];
}

@end