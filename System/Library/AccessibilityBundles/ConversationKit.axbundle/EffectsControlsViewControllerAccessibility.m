@interface EffectsControlsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation EffectsControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.EffectsControlsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.EffectsControlsViewController", @"effectsButtonIsVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.EffectsControlsViewController", @"effectsButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)EffectsControlsViewControllerAccessibility;
  [(EffectsControlsViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(EffectsControlsViewControllerAccessibility *)self safeUIViewForKey:@"effectsButton"];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __88__EffectsControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_265119F78;
  objc_copyWeak(&v5, &location);
  [v3 _setIsAccessibilityElementBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __88__EffectsControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"effectsButtonIsVisible"];

  return v2;
}

@end