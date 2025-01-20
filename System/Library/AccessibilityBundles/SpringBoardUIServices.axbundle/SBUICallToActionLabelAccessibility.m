@interface SBUICallToActionLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityScannerShouldUseActivateInPointMode;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityAttributedLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityHandlePreboardUnlock;
- (void)_accessibilityTryUnlockForControllerClassName:(id)a3;
@end

@implementation SBUICallToActionLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUICallToActionLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUICallToActionLabel", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUILegibilityLabel", @"attributedText", "@", 0);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SBUICallToActionLabelAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SBUICallToActionLabelAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)_accessibilityScannerShouldUseActivateInPointMode
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  objc_super v3 = [MEMORY[0x263F22968] server];
  [v3 unlockDevice];

  v4 = [MEMORY[0x263F22968] server];

  if (!v4) {
    [(SBUICallToActionLabelAccessibility *)self _accessibilityHandlePreboardUnlock];
  }
  return 1;
}

- (id)accessibilityAttributedLabel
{
  v14[1] = *MEMORY[0x263EF8340];
  v2 = [(SBUICallToActionLabelAccessibility *)self safeValueForKey:@"label"];
  objc_opt_class();
  objc_super v3 = [v2 safeValueForKey:@"attributedText"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [v4 attribute:@"NSLanguage" atIndex:0 effectiveRange:0];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v2 accessibilityLabel];
  id v8 = objc_alloc(MEMORY[0x263F086A0]);
  v9 = v8;
  if (v6)
  {
    uint64_t v13 = *MEMORY[0x263F1CE90];
    v14[0] = v6;
    v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v11 = (void *)[v9 initWithString:v7 attributes:v10];
  }
  else
  {
    v11 = (void *)[v8 initWithString:v7];
  }

  return v11;
}

- (void)_accessibilityHandlePreboardUnlock
{
  [(SBUICallToActionLabelAccessibility *)self _accessibilityTryUnlockForControllerClassName:@"PBADeviceUnlockViewController"];

  [(SBUICallToActionLabelAccessibility *)self _accessibilityTryUnlockForControllerClassName:@"PBADataRecoveryViewController"];
}

- (void)_accessibilityTryUnlockForControllerClassName:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__SBUICallToActionLabelAccessibility__accessibilityTryUnlockForControllerClassName___block_invoke;
  v9[3] = &unk_265159D38;
  id v10 = v4;
  id v5 = v4;
  v6 = [(SBUICallToActionLabelAccessibility *)self _accessibilityFindAncestor:v9 startWithSelf:0];
  v7 = [v6 _accessibilityViewController];

  id v8 = v7;
  AXPerformSafeBlock();
}

uint64_t __84__SBUICallToActionLabelAccessibility__accessibilityTryUnlockForControllerClassName___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 _accessibilityViewController];
  NSClassFromString(*(NSString **)(a1 + 32));
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

uint64_t __84__SBUICallToActionLabelAccessibility__accessibilityTryUnlockForControllerClassName___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _homeButtonPressed:0];
}

@end