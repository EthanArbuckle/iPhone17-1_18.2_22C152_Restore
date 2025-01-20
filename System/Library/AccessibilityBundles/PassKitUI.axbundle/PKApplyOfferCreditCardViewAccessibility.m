@interface PKApplyOfferCreditCardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PKApplyOfferCreditCardViewAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PKApplyOfferCreditCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKApplyOfferCreditCardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKApplyOfferCreditCardView" hasInstanceVariable:@"_creditLimitTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"PKApplyOfferCreditCardView" hasInstanceVariable:@"_creditLimitLabel" withType:"UILabel"];
  [v3 validateClass:@"PKApplyOfferCreditCardView" hasInstanceVariable:@"_aprForPurchaseTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"PKApplyOfferCreditCardView" hasInstanceVariable:@"_aprForPurchaseLabel" withType:"UILabel"];
  [v3 validateClass:@"PKApplyOfferCreditCardView" hasInstanceVariable:@"_feeTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"PKApplyOfferCreditCardView" hasInstanceVariable:@"_feeLabel" withType:"UILabel"];
  [v3 validateClass:@"PKApplyOfferCreditCardView" hasInstanceVariable:@"_bodyLabel" withType:"UILabel"];
  [v3 validateClass:@"PKApplyOfferCreditCardView" hasInstanceVariable:@"_termsLinkButton" withType:"UIButton"];
}

- (PKApplyOfferCreditCardViewAccessibility)init
{
  v4.receiver = self;
  v4.super_class = (Class)PKApplyOfferCreditCardViewAccessibility;
  v2 = [(PKApplyOfferCreditCardViewAccessibility *)&v4 init];
  [(PKApplyOfferCreditCardViewAccessibility *)v2 _accessibilityLoadAccessibilityInformation];

  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v34.receiver = self;
  v34.super_class = (Class)PKApplyOfferCreditCardViewAccessibility;
  [(PKApplyOfferCreditCardViewAccessibility *)&v34 _accessibilityLoadAccessibilityInformation];
  id v3 = objc_alloc(MEMORY[0x263F81178]);
  objc_super v4 = (void *)MEMORY[0x263EFF8C0];
  v5 = [(PKApplyOfferCreditCardViewAccessibility *)self safeUIViewForKey:@"_creditLimitTitleLabel"];
  v6 = [(PKApplyOfferCreditCardViewAccessibility *)self safeUIViewForKey:@"_creditLimitLabel"];
  v7 = objc_msgSend(v4, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v6);
  v8 = (void *)[v3 initWithAccessibilityContainer:self representedElements:v7];

  id v9 = objc_alloc(MEMORY[0x263F81178]);
  v10 = (void *)MEMORY[0x263EFF8C0];
  v11 = [(PKApplyOfferCreditCardViewAccessibility *)self safeUIViewForKey:@"_aprForPurchaseTitleLabel"];
  v12 = [(PKApplyOfferCreditCardViewAccessibility *)self safeUIViewForKey:@"_aprForPurchaseLabel"];
  v13 = objc_msgSend(v10, "axArrayByIgnoringNilElementsWithCount:", 2, v11, v12);
  v14 = (void *)[v9 initWithAccessibilityContainer:self representedElements:v13];

  id v15 = objc_alloc(MEMORY[0x263F81178]);
  v16 = (void *)MEMORY[0x263EFF8C0];
  v17 = [(PKApplyOfferCreditCardViewAccessibility *)self safeUIViewForKey:@"_feeTitleLabel"];
  v18 = [(PKApplyOfferCreditCardViewAccessibility *)self safeUIViewForKey:@"_feeLabel"];
  v19 = objc_msgSend(v16, "axArrayByIgnoringNilElementsWithCount:", 2, v17, v18);
  v20 = (void *)[v15 initWithAccessibilityContainer:self representedElements:v19];

  v21 = [(PKApplyOfferCreditCardViewAccessibility *)self safeUIViewForKey:@"_bodyLabel"];
  v22 = [(PKApplyOfferCreditCardViewAccessibility *)self safeUIViewForKey:@"_termsLinkButton"];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __85__PKApplyOfferCreditCardViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v28[3] = &unk_265140EC0;
  id v29 = v8;
  id v30 = v14;
  id v31 = v20;
  id v32 = v21;
  id v33 = v22;
  id v23 = v22;
  id v24 = v21;
  id v25 = v20;
  id v26 = v14;
  id v27 = v8;
  [(PKApplyOfferCreditCardViewAccessibility *)self _setAccessibilityElementsBlock:v28];
}

uint64_t __85__PKApplyOfferCreditCardViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(void *a1)
{
  return objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 5, a1[4], a1[5], a1[6], a1[7], a1[8]);
}

@end