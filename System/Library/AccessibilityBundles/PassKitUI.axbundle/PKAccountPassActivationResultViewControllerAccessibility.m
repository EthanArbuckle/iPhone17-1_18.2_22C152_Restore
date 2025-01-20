@interface PKAccountPassActivationResultViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_setupLaterBodyString;
- (void)_updateForSetupLater;
@end

@implementation PKAccountPassActivationResultViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKAccountPassActivationResultViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKAccountPassActivationResultViewController", @"_updateForSetupLater", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKExplanationViewController", @"explanationView", "@", 0);
  [v3 validateClass:@"PKAccountPassActivationResultViewController" isKindOfClass:@"PKExplanationViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKAccountPassActivationResultViewController", @"_setupLaterBodyString", "@", 0);
}

- (id)_setupLaterBodyString
{
  v6.receiver = self;
  v6.super_class = (Class)PKAccountPassActivationResultViewControllerAccessibility;
  v2 = [(PKAccountPassActivationResultViewControllerAccessibility *)&v6 _setupLaterBodyString];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v3 = __UIAccessibilityCastAsClass();

    objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, objc_msgSend(v3, "length"), 0, &__block_literal_global_2);
    v2 = v3;
  }
  id v4 = v2;

  return v4;
}

void __81__PKAccountPassActivationResultViewControllerAccessibility__setupLaterBodyString__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v2 = *MEMORY[0x263F1C208];
  id v3 = [v7 objectForKey:*MEMORY[0x263F1C208]];

  id v4 = v7;
  if (v3)
  {
    v5 = [v7 objectForKey:v2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v6 = accessibilityLocalizedString(@"more.button");
      [v5 setAccessibilityLabel:v6];
    }
    id v4 = v7;
  }
}

- (void)_updateForSetupLater
{
  v6.receiver = self;
  v6.super_class = (Class)PKAccountPassActivationResultViewControllerAccessibility;
  [(PKAccountPassActivationResultViewControllerAccessibility *)&v6 _updateForSetupLater];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
  id v4 = [(PKAccountPassActivationResultViewControllerAccessibility *)self safeValueForKey:@"explanationView"];
  v5 = [v4 _accessibilityFindDescendant:&__block_literal_global_296];
  UIAccessibilityPostNotification(v3, v5);
}

uint64_t __80__PKAccountPassActivationResultViewControllerAccessibility__updateForSetupLater__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

@end