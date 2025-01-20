@interface PKExplanationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation PKExplanationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKExplanationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKExplanationView" hasInstanceVariable:@"_bodyTextView" withType:"UITextView"];
  [v3 validateClass:@"PKExplanationView" hasInstanceVariable:@"_titleLabel" withType:"PKTrailingAccessoryLabel"];
  [v3 validateClass:@"PKExplanationView" hasInstanceVariable:@"_logoImageView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKExplanationView", @"layoutSubviews", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v15.receiver = self;
  v15.super_class = (Class)PKExplanationViewAccessibility;
  [(PKExplanationViewAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CEF8];
  uint64_t v4 = *MEMORY[0x263F1CF48] | *MEMORY[0x263F1CEF8];
  v5 = [(PKExplanationViewAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  [v5 setAccessibilityTraits:v4];

  v6 = [(PKExplanationViewAccessibility *)self safeUIViewForKey:@"_bodyTextView"];
  [v6 _accessibilitySetTextViewShouldBreakUpParagraphs:1];

  v7 = [(PKExplanationViewAccessibility *)self safeUIViewForKey:@"_logoImageView"];
  objc_initWeak(&location, v7);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __76__PKExplanationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v12 = &unk_265140F88;
  objc_copyWeak(&v13, &location);
  [v7 _setIsAccessibilityElementBlock:&v9];
  v8 = accessibilityLocalizedString(@"apple.pay.label");
  objc_msgSend(v7, "setAccessibilityLabel:", v8, v9, v10, v11, v12);

  [v7 setAccessibilityTraits:v3];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __76__PKExplanationViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _accessibilityViewIsVisible])
  {
    id v3 = objc_loadWeakRetained(v1);
    uint64_t v4 = [v3 accessibilityIdentifier];
    uint64_t v5 = [v4 isEqualToString:@"Payment_SetupLogo"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKExplanationViewAccessibility;
  [(PKExplanationViewAccessibility *)&v3 layoutSubviews];
  [(PKExplanationViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end