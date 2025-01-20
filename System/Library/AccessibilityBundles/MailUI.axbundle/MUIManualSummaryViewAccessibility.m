@interface MUIManualSummaryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSummaryButtonLabel;
- (void)_axSummaryHeaderTrait;
- (void)updateTextView;
@end

@implementation MUIManualSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUIManualSummaryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MUIManualSummaryView" hasSwiftField:@"button" withSwiftType:"UIButton"];
  [v3 validateClass:@"MUIManualSummaryView" hasSwiftField:@"viewModel" withSwiftType:"Optional<Model>"];
  [v3 validateClass:@"MUIManualSummaryView" hasSwiftField:@"showSummaryButtonTitle" withSwiftType:"String"];
  [v3 validateClass:@"MUIManualSummaryView" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUIManualSummaryView", @"updateTextView", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MUIManualSummaryViewAccessibility;
  [(MUIManualSummaryViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MUIManualSummaryViewAccessibility *)self _axSummaryButtonLabel];
  [(MUIManualSummaryViewAccessibility *)self _axSummaryHeaderTrait];
}

- (void)_axSummaryHeaderTrait
{
  objc_super v3 = [(MUIManualSummaryViewAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__MUIManualSummaryViewAccessibility__axSummaryHeaderTrait__block_invoke;
  v4[3] = &unk_26512BE40;
  objc_copyWeak(&v5, &location);
  [v3 setAccessibilityTraitsBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __58__MUIManualSummaryViewAccessibility__axSummaryHeaderTrait__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeSwiftValueForKey:@"viewModel"];
  objc_super v3 = [v2 safeSwiftValueForKey:@"state"];
  v4 = [v3 safeSwiftEnumCase];

  int v5 = [v4 isEqualToString:@"initial"];
  v6 = (uint64_t *)MEMORY[0x263F1CEF8];
  if (!v5) {
    v6 = (uint64_t *)MEMORY[0x263F1CF48];
  }
  uint64_t v7 = *v6;

  return v7;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(MUIManualSummaryViewAccessibility *)self safeSwiftValueForKey:@"viewModel"];
  objc_super v3 = [v2 safeSwiftValueForKey:@"state"];
  v4 = [v3 safeSwiftEnumCase];

  LOBYTE(v2) = [v4 isEqualToString:@"initial"];
  return (char)v2;
}

- (id)accessibilityLabel
{
  v2 = [(MUIManualSummaryViewAccessibility *)self safeSwiftValueForKey:@"button"];
  objc_super v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(MUIManualSummaryViewAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  objc_super v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(MUIManualSummaryViewAccessibility *)self safeSwiftValueForKey:@"button"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)_axSummaryButtonLabel
{
  double v3 = [(MUIManualSummaryViewAccessibility *)self safeSwiftValueForKey:@"button"];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__MUIManualSummaryViewAccessibility__axSummaryButtonLabel__block_invoke;
  v4[3] = &unk_26512BE68;
  objc_copyWeak(&v5, &location);
  [v3 setAccessibilityLabelBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __58__MUIManualSummaryViewAccessibility__axSummaryButtonLabel__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = [WeakRetained safeSwiftValueForKey:@"viewModel"];
  double v4 = [v3 safeSwiftValueForKey:@"state"];
  id v5 = [v4 safeSwiftEnumCase];

  if ([v5 isEqualToString:@"initial"])
  {
    id v6 = objc_loadWeakRetained(v1);
    double v7 = [v6 safeSwiftValueForKey:@"showSummaryButtonTitle"];
  }
  else
  {
    if ([v5 isEqualToString:@"loading"]) {
      double v8 = @"summary.state.loading";
    }
    else {
      double v8 = @"summary.state.complete";
    }
    double v7 = accessibilityLocalizedString(v8);
  }

  return v7;
}

- (void)updateTextView
{
  v6.receiver = self;
  v6.super_class = (Class)MUIManualSummaryViewAccessibility;
  [(MUIManualSummaryViewAccessibility *)&v6 updateTextView];
  double v3 = [(MUIManualSummaryViewAccessibility *)self safeSwiftValueForKey:@"viewModel"];
  double v4 = [v3 safeSwiftValueForKey:@"state"];
  id v5 = [v4 safeSwiftEnumCase];

  if ([v5 isEqualToString:@"complete"]) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __51__MUIManualSummaryViewAccessibility_updateTextView__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];
  id v2 = [*(id *)(a1 + 32) safeSwiftValueForKey:@"textView"];
  UIAccessibilityPostNotification(v1, v2);
}

@end