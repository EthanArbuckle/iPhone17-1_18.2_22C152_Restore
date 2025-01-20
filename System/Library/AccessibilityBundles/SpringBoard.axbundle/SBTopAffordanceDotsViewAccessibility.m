@interface SBTopAffordanceDotsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsNonDismissableStatusBarElement;
- (BOOL)isAccessibilityElement;
- (CGRect)axBounds;
- (id)_accessibilityRoleDescription;
- (id)_axApplicationDisplayName;
- (id)_axMainSwitcher;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_axSetApplicationDisplayName:(id)a3;
@end

@implementation SBTopAffordanceDotsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBTopAffordanceDotsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBTopAffordanceDotsView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SBMedusaDecoratedDeviceApplicationSceneViewController"];
  [v3 validateClass:@"SBMedusaDecoratedDeviceApplicationSceneViewController" hasInstanceVariable:@"_deviceApplicationSceneHandle" withType:"SBDeviceApplicationSceneHandle"];
  [v3 validateClass:@"SBDeviceApplicationSceneHandle" isKindOfClass:@"SBSceneHandle"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneHandle", @"sceneIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"continuousExposeStripTongueViewTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"rootModifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDefaultImplementationsSwitcherModifier", @"isContinuousExposeStripVisible", "B", 0);
}

- (id)_axApplicationDisplayName
{
}

- (void)_axSetApplicationDisplayName:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(SBTopAffordanceDotsViewAccessibility *)self _axMainSwitcher];
  int v4 = [v3 _axIsChamoisSwitcherVisible];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBTopAffordanceDotsViewAccessibility;
    return [(SBTopAffordanceDotsViewAccessibility *)&v7 accessibilityTraits];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBTopAffordanceDotsViewAccessibility;
    return *MEMORY[0x263F21B38] | [(SBTopAffordanceDotsViewAccessibility *)&v6 accessibilityTraits];
  }
}

- (id)accessibilityLabel
{
  id v3 = NSString;
  int v4 = accessibilityLocalizedString(@"top.affordance.button");
  uint64_t v5 = [(SBTopAffordanceDotsViewAccessibility *)self _axApplicationDisplayName];
  objc_super v6 = (void *)v5;
  objc_super v7 = &stru_26F7D3690;
  if (v5) {
    objc_super v7 = (__CFString *)v5;
  }
  v8 = objc_msgSend(v3, "stringWithFormat:", v4, v7);

  return v8;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(SBTopAffordanceDotsViewAccessibility *)self _axMainSwitcher];
  char v3 = [v2 _axIsAppSwitcherPeeking];

  return v3 ^ 1;
}

- (id)accessibilityHint
{
  char v3 = [(SBTopAffordanceDotsViewAccessibility *)self _axMainSwitcher];
  int v4 = [v3 _axIsChamoisSwitcherVisible];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBTopAffordanceDotsViewAccessibility;
    uint64_t v5 = [(SBTopAffordanceDotsViewAccessibility *)&v7 accessibilityHint];
  }
  else
  {
    uint64_t v5 = accessibilityLocalizedString(@"top.affordance.button.hint");
  }

  return v5;
}

- (id)accessibilityCustomActions
{
  char v3 = [(SBTopAffordanceDotsViewAccessibility *)self _axMainSwitcher];
  int v4 = [v3 _axFluidSwitcherViewController];

  uint64_t v5 = [v4 safeValueForKey:@"rootModifier"];
  int v6 = [v5 safeBoolForKey:@"isContinuousExposeStripVisible"];

  if (v6)
  {
    v17.receiver = self;
    v17.super_class = (Class)SBTopAffordanceDotsViewAccessibility;
    objc_super v7 = [(SBTopAffordanceDotsViewAccessibility *)&v17 accessibilityCustomActions];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F1C390]);
    v9 = accessibilityLocalizedString(@"stage.manager.app.strip.custom.action.label");
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __66__SBTopAffordanceDotsViewAccessibility_accessibilityCustomActions__block_invoke;
    v15 = &unk_265153D78;
    id v16 = v4;
    v10 = (void *)[v8 initWithName:v9 actionHandler:&v12];

    objc_super v7 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v10, v12, v13, v14, v15);
  }

  return v7;
}

uint64_t __66__SBTopAffordanceDotsViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

void __66__SBTopAffordanceDotsViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) continuousExposeStripTongueViewTapped:0];
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE68];

  UIAccessibilityPostNotification(v1, 0);
}

- (id)_accessibilityRoleDescription
{
  id v2 = [(SBTopAffordanceDotsViewAccessibility *)self _accessibilityWindow];
  char v3 = [v2 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_0];

  if ([v3 count])
  {
    int v4 = [v3 firstObject];
    uint64_t v5 = [v4 _accessibilityViewController];

    int v6 = [v5 safeValueForKey:@"_deviceApplicationSceneHandle"];
    objc_super v7 = [v6 safeStringForKey:@"sceneIdentifier"];
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

uint64_t __69__SBTopAffordanceDotsViewAccessibility__accessibilityRoleDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Sbmedusadecora_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CGRect)axBounds
{
  [(SBTopAffordanceDotsViewAccessibility *)self bounds];

  return CGRectInset(*(CGRect *)&v2, -10.0, -10.0);
}

- (id)_axMainSwitcher
{
  objc_opt_class();
  uint64_t v2 = AXSBMainSwitcherControllerCoordinatorSharedInstance();
  char v3 = __UIAccessibilityCastAsSafeCategory();

  return v3;
}

- (BOOL)_accessibilityIsNonDismissableStatusBarElement
{
  return 1;
}

@end