@interface PKDiscoveryCardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_dismissButtonPressed;
@end

@implementation PKDiscoveryCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKDiscoveryCardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKDiscoveryCardView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"PKDiscoveryCardView" hasInstanceVariable:@"_headingLabel" withType:"UILabel"];
  [v3 validateClass:@"PKContinuousButton"];
  [v3 validateClass:@"PKDiscoveryCardView" hasInstanceVariable:@"_dismissButton" withType:"PKContinuousButton"];
  [v3 validateClass:@"PKDiscoveryCallToActionFooterView"];
  [v3 validateClass:@"PKDiscoveryCardView" hasInstanceVariable:@"_ctaFooterView" withType:"PKDiscoveryCallToActionFooterView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKDiscoveryCardView", @"_dismissButtonPressed", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PKDiscoveryCardViewAccessibility;
  [(PKDiscoveryCardViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PKDiscoveryCardViewAccessibility *)self safeValueForKey:@"_dismissButton"];
  v4 = accessibilityLocalizedString(@"dismiss.button");
  [v3 setAccessibilityLabel:v4];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PKDiscoveryCardViewAccessibility *)self safeValueForKey:@"_headingLabel"];
  v4 = [v3 accessibilityLabel];
  objc_super v5 = [(PKDiscoveryCardViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(PKDiscoveryCardViewAccessibility *)self safeUIViewForKey:@"_dismissButton"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(PKDiscoveryCardViewAccessibility *)self safeUIViewForKey:@"_ctaFooterView"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (BOOL)_accessibilityScrollToVisible
{
  id v3 = [(PKDiscoveryCardViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Pkdiscoverygal.isa)];
  char v14 = 0;
  objc_opt_class();
  v4 = [(PKDiscoveryCardViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  objc_super v5 = __UIAccessibilityCastAsClass();

  if (v5)
  {
    [(PKDiscoveryCardViewAccessibility *)self frame];
    double v7 = v6;
    [v5 contentOffset];
    if (v8 <= 0.0 || v8 >= v7 || v3 == 0)
    {
      v13.receiver = self;
      v13.super_class = (Class)PKDiscoveryCardViewAccessibility;
      BOOL v11 = [(PKDiscoveryCardViewAccessibility *)&v13 _accessibilityScrollToVisible];
    }
    else
    {
      objc_msgSend(v5, "setContentOffset:animated:", 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_dismissButtonPressed
{
  v2.receiver = self;
  v2.super_class = (Class)PKDiscoveryCardViewAccessibility;
  [(PKDiscoveryCardViewAccessibility *)&v2 _dismissButtonPressed];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end