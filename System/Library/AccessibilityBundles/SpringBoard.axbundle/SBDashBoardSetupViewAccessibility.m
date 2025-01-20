@interface SBDashBoardSetupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (double)setTitleString:(id)a3 forLanguage:(id)a4;
- (id)_accessibilitySafeStackView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_addActivationLockLabels;
- (void)_axSetupActivationLockLabels;
- (void)setActivationLockWarningString:(id)a3 detailString:(id)a4 forLanguage:(id)a5;
@end

@implementation SBDashBoardSetupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDashBoardSetupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBDashBoardSetupView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDashBoardSetupView", @"setTitleString:forLanguage:", "d", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDashBoardSetupView", @"setActivationLockWarningString:detailString:forLanguage:", "v", "@", "@", "@", 0);
  [v3 validateClass:@"SBDashBoardSetupView" hasInstanceVariable:@"_homeAffordanceCallToActionContainer" withType:"UIView"];
  [v3 validateClass:@"SBDashBoardSetupView" hasInstanceVariable:@"_homeAffordanceCallToActionLabel" withType:"SBUILegibilityLabel"];
  [v3 validateClass:@"SBDashBoardSetupView" hasInstanceVariable:@"_activationLockStackView" withType:"UIStackView"];
  [v3 validateClass:@"SBDashBoardSetupView" hasInstanceVariable:@"_activationLockWarningLabel" withType:"UILabel"];
  [v3 validateClass:@"SBDashBoardSetupView" hasInstanceVariable:@"_activationLockDetailLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDashBoardSetupView", @"_addActivationLockLabels", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardSetupViewAccessibility;
  [(SBDashBoardSetupViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBDashBoardSetupViewAccessibility *)self safeValueForKey:@"_homeAffordanceCallToActionContainer"];
  [v3 _accessibilitySetOverridesInvisibility:1];

  v4 = [(SBDashBoardSetupViewAccessibility *)self safeValueForKey:@"_homeAffordanceCallToActionLabel"];
  [v4 accessibilitySetIdentification:@"HomeAffordanceLabel"];

  [(SBDashBoardSetupViewAccessibility *)self _axSetupActivationLockLabels];
}

- (id)_accessibilitySafeStackView
{
  return (id)[(SBDashBoardSetupViewAccessibility *)self safeUIViewForKey:@"_activationLockStackView"];
}

- (void)_axSetupActivationLockLabels
{
  id v5 = [(SBDashBoardSetupViewAccessibility *)self _accessibilitySafeStackView];
  id v3 = [(SBDashBoardSetupViewAccessibility *)self safeUIViewForKey:@"_activationLockWarningLabel"];
  v4 = [(SBDashBoardSetupViewAccessibility *)self safeUIViewForKey:@"_activationLockDetailLabel"];
  [v5 _accessibilitySetOverridesInvisibility:1];
  [v3 _accessibilitySetOverridesInvisibility:1];
  [v4 _accessibilitySetOverridesInvisibility:1];
  [v5 _accessibilitySetViewIsVisible:1];
  [v3 _accessibilitySetViewIsVisible:1];
  [v4 _accessibilitySetViewIsVisible:1];
  [v5 setIsAccessibilityElement:1];
}

- (double)setTitleString:(id)a3 forLanguage:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(SBDashBoardSetupViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v8 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  [v8 _accessibilitySetOverridesInvisibility:1];
  if (v6 && v7)
  {
    id v9 = objc_alloc(MEMORY[0x263F086A0]);
    uint64_t v16 = *MEMORY[0x263F1CE90];
    v17[0] = v7;
    v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v11 = (void *)[v9 initWithString:v6 attributes:v10];

    [v8 setAccessibilityAttributedLabel:v11];
  }
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardSetupViewAccessibility;
  [(SBDashBoardSetupViewAccessibility *)&v15 setTitleString:v6 forLanguage:v7];
  double v13 = v12;

  return v13;
}

- (void)setActivationLockWarningString:(id)a3 detailString:(id)a4 forLanguage:(id)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)SBDashBoardSetupViewAccessibility;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(SBDashBoardSetupViewAccessibility *)&v17 setActivationLockWarningString:v10 detailString:v9 forLanguage:v8];
  v11 = [(SBDashBoardSetupViewAccessibility *)self _accessibilitySafeStackView];
  id v12 = objc_alloc(MEMORY[0x263F086A0]);
  double v13 = __AXStringForVariables();

  uint64_t v18 = *MEMORY[0x263F1CE90];
  v19[0] = v8;
  v14 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, &v18, 1, v9, @"__AXStringForVariablesSentinel");

  objc_super v15 = (void *)[v12 initWithString:v13 attributes:v14];
  [v11 setAccessibilityAttributedLabel:v15];

  LODWORD(v15) = *MEMORY[0x263F1CE18];
  uint64_t v16 = [(SBDashBoardSetupViewAccessibility *)self safeUIViewForKey:@"_activationLockStackView"];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v15, v16);
}

- (void)_addActivationLockLabels
{
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardSetupViewAccessibility;
  [(SBDashBoardSetupViewAccessibility *)&v3 _addActivationLockLabels];
  [(SBDashBoardSetupViewAccessibility *)self _axSetupActivationLockLabels];
}

@end