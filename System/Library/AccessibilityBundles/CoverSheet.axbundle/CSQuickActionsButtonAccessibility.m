@interface CSQuickActionsButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsPasscodeLockVisible;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_axDelegate;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CSQuickActionsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CSQuickActionsButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSQuickActionsButton", @"action", "@", 0);
  [v3 validateClass:@"CSFlashlightQuickAction"];
  [v3 validateClass:@"CSCameraQuickAction"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSQuickAction", @"isSelected", "B", 0);
  [v3 validateClass:@"CSAction"];
  [v3 validateClass:@"CSQuickActionsButton" isKindOfClass:@"CSProminentButtonControl"];
  [v3 validateClass:@"CSProminentButtonControl" hasInstanceVariable:@"_backgroundEffectView" withType:"UIVisualEffectView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSQuickActionsButton", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSQuickActionsView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSQuickActionsViewController", @"coverSheetViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewController", @"isPasscodeLockVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSQuickActionsViewController", @"_resetIdleTimer", "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CSAction", @"actionWithType:", "@", "q", 0);
  [v3 validateClass:@"CSQuickActionsViewController" isKindOfClass:@"CSCoverSheetViewControllerBase"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSCoverSheetViewControllerBase", @"sendAction:", "v", "@", 0);
  [v3 validateClass:@"CSQuickActionsButton" isKindOfClass:@"CSProminentButtonControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSProminentButtonControl", @"setSelected:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSQuickAction", @"supportsSelection", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSQuickAction", @"fireAction", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CSSystemQuickAction", @"viewModel", "@", 0);
  [v3 validateProtocol:@"CHUISControlViewModel" hasRequiredInstanceMethod:@"title"];
}

- (BOOL)isAccessibilityElement
{
  return ![(CSQuickActionsButtonAccessibility *)self _accessibilityIsPasscodeLockVisible];
}

- (id)accessibilityLabel
{
  id v3 = [(CSQuickActionsButtonAccessibility *)self safeValueForKey:@"action"];
  NSClassFromString(&cfstr_Csflashlightqu.isa);
  if (objc_opt_isKindOfClass())
  {
    v4 = @"flashlight";
LABEL_5:
    uint64_t v5 = accessibilitySBLocalizedString(v4);
LABEL_6:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  NSClassFromString(&cfstr_Cscameraquicka.isa);
  if (objc_opt_isKindOfClass())
  {
    v4 = @"camera";
    goto LABEL_5;
  }
  NSClassFromString(&cfstr_Cssystemquicka.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)CSQuickActionsButtonAccessibility;
    uint64_t v5 = [(CSQuickActionsButtonAccessibility *)&v9 accessibilityLabel];
    goto LABEL_6;
  }
  v8 = [v3 safeValueForKey:@"viewModel"];
  v6 = [v8 safeStringForKey:@"title"];

LABEL_7:

  return v6;
}

- (id)accessibilityValue
{
  id v3 = [(CSQuickActionsButtonAccessibility *)self safeValueForKey:@"action"];
  NSClassFromString(&cfstr_Csquickaction.isa);
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v3 safeBoolForKey:@"supportsSelection"])
  {
    if ([v3 safeBoolForKey:@"isSelected"]) {
      v4 = @"quickaction.state.on";
    }
    else {
      v4 = @"quickaction.state.off";
    }
    uint64_t v5 = accessibilitySBLocalizedString(v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSQuickActionsButtonAccessibility;
    uint64_t v5 = [(CSQuickActionsButtonAccessibility *)&v8 accessibilityValue];
  }
  v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CSQuickActionsButtonAccessibility;
  return [(CSQuickActionsButtonAccessibility *)&v3 accessibilityTraits] & ~*MEMORY[0x263F1CF38] | *MEMORY[0x263F1CEE8];
}

- (BOOL)accessibilityActivate
{
  return 1;
}

void __58__CSQuickActionsButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"action"];
  [v5 fireAction];
  if (([v5 supportsSelection] & 1) == 0) {
    [*(id *)(a1 + 32) setSelected:0];
  }
  v2 = [*(id *)(a1 + 32) _axDelegate];
  [v2 _resetIdleTimer];

  objc_super v3 = [*(id *)(a1 + 32) _axDelegate];
  v4 = [NSClassFromString(&cfstr_Csaction.isa) actionWithType:5];
  [v3 sendAction:v4];
}

- (id)accessibilityPath
{
  v2 = [(CSQuickActionsButtonAccessibility *)self safeValueForKey:@"_backgroundEffectView"];
  objc_super v3 = [v2 _accessibilityCirclePathBasedOnBoundsWidth];

  return v3;
}

- (id)_axDelegate
{
  return (id)[(CSQuickActionsButtonAccessibility *)self safeValueForKeyPath:@"delegate.delegate"];
}

- (BOOL)_accessibilityIsPasscodeLockVisible
{
  v2 = [(CSQuickActionsButtonAccessibility *)self _axDelegate];
  objc_super v3 = [v2 safeValueForKey:@"coverSheetViewController"];
  char v4 = [v3 safeBoolForKey:@"isPasscodeLockVisible"];

  return v4;
}

@end