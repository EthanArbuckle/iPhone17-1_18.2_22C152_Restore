@interface PKPaymentAuthorizationItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_createSubviews;
@end

@implementation PKPaymentAuthorizationItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPaymentAuthorizationItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPaymentAuthorizationItemCell" hasInstanceVariable:@"_arrowView" withType:"UIImageView"];
  [v3 validateClass:@"PKPaymentAuthorizationItemCell" hasInstanceVariable:@"_alertView" withType:"UIImageView"];
  [v3 validateClass:@"PKPaymentAuthorizationItemCell" hasInstanceVariable:@"_labelView" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPaymentAuthorizationItemCell", @"_createSubviews", "v", 0);
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentAuthorizationItemCellAccessibility;
  unint64_t v3 = [(PKPaymentAuthorizationItemCellAccessibility *)&v8 accessibilityTraits];
  v4 = [(PKPaymentAuthorizationItemCellAccessibility *)self safeValueForKey:@"_arrowView"];
  if ([v4 isHidden])
  {
    v5 = [(PKPaymentAuthorizationItemCellAccessibility *)self safeValueForKey:@"_alertView"];
    char v6 = [v5 isHidden];

    if (v6) {
      return v3;
    }
  }
  else
  {
  }
  v3 |= *MEMORY[0x263F1CEE8];
  return v3;
}

- (void)_createSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationItemCellAccessibility;
  [(PKPaymentAuthorizationItemCellAccessibility *)&v3 _createSubviews];
  [(PKPaymentAuthorizationItemCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentAuthorizationItemCellAccessibility;
  [(PKPaymentAuthorizationItemCellAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(PKPaymentAuthorizationItemCellAccessibility *)self safeValueForKey:@"_alertView"];
  [v3 setIsAccessibilityElement:1];

  v4 = [(PKPaymentAuthorizationItemCellAccessibility *)self safeValueForKey:@"_alertView"];
  v5 = accessibilityLocalizedString(@"field.required.error");
  [v4 setAccessibilityLabel:v5];

  LOBYTE(location) = 0;
  char v6 = [(PKPaymentAuthorizationItemCellAccessibility *)self safeUIViewForKey:@"_labelView"];
  v7 = __UIAccessibilitySafeClass();

  objc_initWeak(&location, v7);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__PKPaymentAuthorizationItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_265140E18;
  objc_copyWeak(&v9, &location);
  [v7 _setAccessibilityLabelBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __89__PKPaymentAuthorizationItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v2 = AXRequestingClient();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained text];
  v5 = v4;
  if (v2 == 3)
  {
    uint64_t v6 = [v4 localizedCapitalizedString];

    v5 = (void *)v6;
  }

  return v5;
}

@end