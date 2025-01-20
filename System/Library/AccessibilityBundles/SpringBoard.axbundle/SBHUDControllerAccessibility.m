@interface SBHUDControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_dismissHUD:(id)a3 animated:(BOOL)a4;
- (void)_presentHUD:(id)a3 animated:(BOOL)a4;
@end

@implementation SBHUDControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHUDController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHUDController", @"_dismissHUD:animated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHUDController", @"_presentHUD:animated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHUDController", @"HUDWindow", "@", 0);
}

- (void)_dismissHUD:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHUDControllerAccessibility;
  [(SBHUDControllerAccessibility *)&v9 _dismissHUD:v6 animated:v4];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_opt_class();
    v7 = [(SBHUDControllerAccessibility *)self safeValueForKey:@"HUDWindow"];
    v8 = __UIAccessibilityCastAsClass();

    [v8 setEnabled:0];
  }
}

- (void)_presentHUD:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHUDControllerAccessibility;
  [(SBHUDControllerAccessibility *)&v9 _presentHUD:v6 animated:v4];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_opt_class();
    v7 = [(SBHUDControllerAccessibility *)self safeValueForKey:@"HUDWindow"];
    v8 = __UIAccessibilityCastAsClass();

    [v8 setEnabled:1];
  }
}

@end