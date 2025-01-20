@interface SBTopAffordanceViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axMainSwitcher;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupView;
- (void)loadView;
@end

@implementation SBTopAffordanceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBTopAffordanceViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBTopAffordanceViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTopAffordanceViewController", @"dotsView", "@", 0);
  [v3 validateClass:@"SBSwitcherController" hasProperty:@"contentViewController" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"visibleShelves", "@", 0);
  [v3 validateClass:@"SBSwitcherShelfViewController" hasInstanceVariable:@"_contentViewController" withType:"SBFluidSwitcherViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"contentView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SBTopAffordanceViewControllerAccessibility;
  [(SBTopAffordanceViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SBTopAffordanceViewControllerAccessibility *)self _axMarkupView];
}

- (void)_axMarkupView
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  objc_super v3 = [v2 view];

  [v3 _setAccessibilityCustomActionsBlock:&__block_literal_global_14];
}

id __59__SBTopAffordanceViewControllerAccessibility__axMarkupView__block_invoke()
{
  v7[1] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F22968] server];
  int v1 = [v0 isShelfSwitcherVisible];

  if (v1)
  {
    id v2 = objc_alloc(MEMORY[0x263F1C390]);
    objc_super v3 = accessibilityLocalizedString(@"top.affordance.button.dismiss.shelf");
    v4 = (void *)[v2 initWithName:v3 actionHandler:&__block_literal_global_313];

    v7[0] = v4;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __59__SBTopAffordanceViewControllerAccessibility__axMarkupView__block_invoke_2()
{
  v0 = [MEMORY[0x263F22968] server];
  [v0 dismissShelfSwitcher];

  return 1;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SBTopAffordanceViewControllerAccessibility;
  [(SBTopAffordanceViewControllerAccessibility *)&v3 loadView];
  [(SBTopAffordanceViewControllerAccessibility *)self _axMarkupView];
}

- (id)_axMainSwitcher
{
  objc_opt_class();
  id v2 = AXSBMainSwitcherControllerCoordinatorSharedInstance();
  objc_super v3 = __UIAccessibilityCastAsSafeCategory();

  return v3;
}

@end