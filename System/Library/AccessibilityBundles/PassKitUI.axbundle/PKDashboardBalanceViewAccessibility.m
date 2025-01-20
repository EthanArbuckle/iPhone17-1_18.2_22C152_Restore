@interface PKDashboardBalanceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)createSubviews;
- (void)didMoveToWindow;
@end

@implementation PKDashboardBalanceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKDashboardBalanceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardBalanceView", @"createSubviews", "v", 0);
  [v3 validateClass:@"PKDashboardBalanceView" hasInstanceVariable:@"_actionButton" withType:"PKContinuousButton"];
  [v3 validateClass:@"PKDashboardBalanceView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"PKDashboardBalanceView" hasInstanceVariable:@"_detailLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PKDashboardBalanceViewAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(PKDashboardBalanceViewAccessibility *)self safeUIViewForKey:@"_detailLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardBalanceViewAccessibility;
  [(PKDashboardBalanceViewAccessibility *)&v3 didMoveToWindow];
  [(PKDashboardBalanceViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)createSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardBalanceViewAccessibility;
  [(PKDashboardBalanceViewAccessibility *)&v3 createSubviews];
  [(PKDashboardBalanceViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardBalanceViewAccessibility;
  [(PKDashboardBalanceViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(PKDashboardBalanceViewAccessibility *)self safeUIViewForKey:@"_actionButton"];
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __81__PKDashboardBalanceViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265140F88;
  objc_copyWeak(&v5, &location);
  [v3 _setIsAccessibilityElementBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __81__PKDashboardBalanceViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _accessibilityViewIsVisible];

  return v2;
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v3 = [(PKDashboardBalanceViewAccessibility *)self safeUIViewForKey:@"_actionButton"];
  int v4 = [v3 isAccessibilityElement];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = [(PKDashboardBalanceViewAccessibility *)self safeValueForKey:@"_actionButton"];
    objc_super v7 = objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 1, v6);
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

@end