@interface PKDashboardTitleHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)createSubviews;
- (void)didMoveToWindow;
@end

@implementation PKDashboardTitleHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKDashboardTitleHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKDashboardTitleHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardTitleHeaderView", @"createSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDashboardTitleHeaderView", @"action", "@?", 0);
  [v3 validateClass:@"PKDashboardTitleHeaderView" hasInstanceVariable:@"_actionButton" withType:"UIButton"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PKDashboardTitleHeaderViewAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardTitleHeaderViewAccessibility;
  [(PKDashboardTitleHeaderViewAccessibility *)&v3 didMoveToWindow];
  [(PKDashboardTitleHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)createSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardTitleHeaderViewAccessibility;
  [(PKDashboardTitleHeaderViewAccessibility *)&v3 createSubviews];
  [(PKDashboardTitleHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardTitleHeaderViewAccessibility;
  [(PKDashboardTitleHeaderViewAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  objc_super v3 = [(PKDashboardTitleHeaderViewAccessibility *)self safeUIViewForKey:@"_actionButton"];
  v4 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __85__PKDashboardTitleHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_265140FB0;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  id v5 = v4;
  id v7 = v5;
  [v5 _setIsAccessibilityElementBlock:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

BOOL __85__PKDashboardTitleHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if ([WeakRetained _accessibilityViewIsVisible])
  {
    id v3 = objc_loadWeakRetained(a1 + 6);
    v4 = [v3 safeValueForKey:@"_action"];
    if (v4)
    {
      BOOL v5 = 1;
    }
    else
    {
      v6 = [a1[4] menu];
      BOOL v5 = v6 != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [(PKDashboardTitleHeaderViewAccessibility *)self safeUIViewForKey:@"_actionButton"];
  int v4 = [v3 isAccessibilityElement];

  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = [(PKDashboardTitleHeaderViewAccessibility *)self safeValueForKey:@"_actionButton"];
    id v7 = objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 1, v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

@end