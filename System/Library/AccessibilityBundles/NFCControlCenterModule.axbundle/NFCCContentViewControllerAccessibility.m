@interface NFCCContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setModuleState:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation NFCCContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NFCCContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NFCCContentViewController" hasInstanceVariable:@"_contentView" withType:"NFCCContentView"];
  [v3 validateClass:@"NFCCContentViewController" hasInstanceVariable:@"_moduleState" withType:"q"];
  [v3 validateClass:@"NFCCContentView" hasInstanceVariable:@"_statusView" withType:"NFCCStatusView"];
  [v3 validateClass:@"NFCCStatusView" hasInstanceVariable:@"_scanTagPromptLabelWrapper" withType:"NFCCWrappedLabel"];
  [v3 validateClass:@"NFCCStatusView" hasInstanceVariable:@"_unavailablePromptLabelWrapper" withType:"NFCCWrappedLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NFCCContentViewController", @"_setModuleState:animated:", "v", "q", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)NFCCContentViewControllerAccessibility;
  [(NFCCContentViewControllerAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(NFCCContentViewControllerAccessibility *)self safeValueForKey:@"buttonView"];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__NFCCContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_26513EB30;
  objc_copyWeak(&v7, &location);
  [v3 _setAccessibilityValueBlock:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __84__NFCCContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v4[3] = &unk_26513EB58;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityTraitsBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __84__NFCCContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_contentView"];
  id v3 = [v2 safeValueForKey:@"_statusView"];
  v4 = [v3 safeUIViewForKey:@"_scanTagPromptLabelWrapper"];
  id v5 = [v3 safeUIViewForKey:@"_unavailablePromptLabelWrapper"];
  [v4 alpha];
  v6 = v4;
  if (v7 <= 0.5 && ([v5 alpha], v6 = v5, v8 <= 0.5))
  {
    objc_super v9 = 0;
  }
  else
  {
    objc_super v9 = [v6 accessibilityLabel];
  }

  return v9;
}

uint64_t __84__NFCCContentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained safeBoolForKey:@"isExpanded"];
  id v3 = (uint64_t *)MEMORY[0x263F1CF18];
  if (!v2) {
    id v3 = (uint64_t *)MEMORY[0x263F1CEE8];
  }
  uint64_t v4 = *v3;

  return v4;
}

- (void)_setModuleState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(NFCCContentViewControllerAccessibility *)self safeIntegerForKey:@"_moduleState"];
  v10.receiver = self;
  v10.super_class = (Class)NFCCContentViewControllerAccessibility;
  [(NFCCContentViewControllerAccessibility *)&v10 _setModuleState:a3 animated:v4];
  if ([(NFCCContentViewControllerAccessibility *)self safeBoolForKey:@"isExpanded"]&& v7 != a3&& (unint64_t)a3 <= 5)
  {
    uint64_t v8 = accessibilityLocalizedString(off_26513EB78[a3]);
    if (v8)
    {
      objc_super v9 = (void *)v8;
      UIAccessibilitySpeakOrQueueIfNeeded();
    }
  }
}

@end