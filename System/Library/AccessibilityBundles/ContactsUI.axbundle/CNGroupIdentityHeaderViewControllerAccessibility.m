@interface CNGroupIdentityHeaderViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateActionButton;
@end

@implementation CNGroupIdentityHeaderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNGroupIdentityHeaderViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNGroupIdentityHeaderViewController", @"actionButtonTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNGroupIdentityHeaderViewController", @"actionButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNGroupIdentityHeaderViewController", @"updateActionButton", "v", 0);
}

- (void)updateActionButton
{
  v7.receiver = self;
  v7.super_class = (Class)CNGroupIdentityHeaderViewControllerAccessibility;
  [(CNGroupIdentityHeaderViewControllerAccessibility *)&v7 updateActionButton];
  id v3 = [(CNGroupIdentityHeaderViewControllerAccessibility *)self safeValueForKey:@"actionButton"];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__CNGroupIdentityHeaderViewControllerAccessibility_updateActionButton__block_invoke;
  v4[3] = &unk_2651181F8;
  objc_copyWeak(&v5, &location);
  [v3 _setIsAccessibilityElementBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

BOOL __70__CNGroupIdentityHeaderViewControllerAccessibility_updateActionButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeStringForKey:@"actionButtonTitle"];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

@end