@interface SBSwitcherShelfViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SBSwitcherShelfViewControllerAccessibility)initWithShelf:(id)a3 dataSource:(id)a4 delegate:(id)a5;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetupShelfSwitcherViewController;
- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBSwitcherShelfViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSwitcherShelfViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBSwitcherShelfViewController" hasInstanceVariable:@"_contentViewController" withType:"SBFluidSwitcherViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherShelfViewController", @"initWithShelf:dataSource:delegate:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherShelfViewController", @"viewWillAppear:", "v", "B", 0);
  [v3 validateClass:@"SBSwitcherShelfViewController" conformsToProtocol:@"SBAttentionAwarenessClientDelegate"];
  [v3 validateProtocol:@"SBAttentionAwarenessClientDelegate" hasRequiredInstanceMethod:@"clientDidResetForUserAttention:withEvent:"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SBSwitcherShelfViewControllerAccessibility;
  [(SBSwitcherShelfViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SBSwitcherShelfViewControllerAccessibility *)self _axSetupShelfSwitcherViewController];
}

- (SBSwitcherShelfViewControllerAccessibility)initWithShelf:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherShelfViewControllerAccessibility;
  v5 = [(SBSwitcherShelfViewControllerAccessibility *)&v7 initWithShelf:a3 dataSource:a4 delegate:a5];
  [(SBSwitcherShelfViewControllerAccessibility *)v5 _accessibilityLoadAccessibilityInformation];
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherShelfViewControllerAccessibility;
  [(SBSwitcherShelfViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(SBSwitcherShelfViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axSetupShelfSwitcherViewController
{
  objc_opt_class();
  objc_super v3 = [(SBSwitcherShelfViewControllerAccessibility *)self safeValueForKey:@"_contentViewController"];
  objc_super v4 = __UIAccessibilityCastAsSafeCategory();

  [v4 _setAXSwitcherType:&__block_literal_global_4];
}

uint64_t __81__SBSwitcherShelfViewControllerAccessibility__axSetupShelfSwitcherViewController__block_invoke()
{
  return 3;
}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!UIAccessibilityIsVoiceOverRunning()
    && ([(SBSwitcherShelfViewControllerAccessibility *)self _accessibilityIsFKARunningForFocusItem] & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSwitcherShelfViewControllerAccessibility;
    [(SBSwitcherShelfViewControllerAccessibility *)&v8 clientDidResetForUserAttention:v6 withEvent:v7];
  }
}

@end