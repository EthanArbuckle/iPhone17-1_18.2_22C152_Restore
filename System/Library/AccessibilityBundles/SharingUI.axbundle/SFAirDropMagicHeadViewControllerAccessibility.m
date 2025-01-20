@interface SFAirDropMagicHeadViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axWheelView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
- (void)resetSecondLabel;
- (void)setSecondLabelText:(id)a3 withTextColor:(id)a4 animated:(BOOL)a5 completion:(id)a6;
@end

@implementation SFAirDropMagicHeadViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFAirDropMagicHeadViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFAirDropMagicHeadViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFAirDropMagicHeadViewController", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFAirDropMagicHeadViewController", @"nameLabel2", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFAirDropMagicHeadViewController", @"secondLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFAirDropMagicHeadViewController", @"resetSecondLabel", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFAirDropMagicHeadViewController", @"setSecondLabelText:withTextColor:animated:completion:", "v", "@", "@", "B", "@?", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)SFAirDropMagicHeadViewControllerAccessibility;
  [(SFAirDropMagicHeadViewControllerAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SFAirDropMagicHeadViewControllerAccessibility *)self safeUIViewForKey:@"nameLabel"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(SFAirDropMagicHeadViewControllerAccessibility *)self safeUIViewForKey:@"nameLabel2"];
  [v4 setIsAccessibilityElement:0];

  v5 = [(SFAirDropMagicHeadViewControllerAccessibility *)self safeUIViewForKey:@"secondLabel"];
  [v5 setIsAccessibilityElement:0];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropMagicHeadViewControllerAccessibility;
  [(SFAirDropMagicHeadViewControllerAccessibility *)&v3 loadView];
  [(SFAirDropMagicHeadViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setSecondLabelText:(id)a3 withTextColor:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __102__SFAirDropMagicHeadViewControllerAccessibility_setSecondLabelText_withTextColor_animated_completion___block_invoke;
  v18[3] = &unk_265150128;
  id v19 = v10;
  id v20 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = a4;
  v15 = (void *)MEMORY[0x245660A00](v18);
  v17.receiver = self;
  v17.super_class = (Class)SFAirDropMagicHeadViewControllerAccessibility;
  [(SFAirDropMagicHeadViewControllerAccessibility *)&v17 setSecondLabelText:v13 withTextColor:v14 animated:v7 completion:v15];

  v16 = [(SFAirDropMagicHeadViewControllerAccessibility *)self _axWheelView];
  [v16 _axSetStatusText:v13];
}

uint64_t __102__SFAirDropMagicHeadViewControllerAccessibility_setSecondLabelText_withTextColor_animated_completion___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], *(id *)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)resetSecondLabel
{
  v4.receiver = self;
  v4.super_class = (Class)SFAirDropMagicHeadViewControllerAccessibility;
  [(SFAirDropMagicHeadViewControllerAccessibility *)&v4 resetSecondLabel];
  objc_super v3 = [(SFAirDropMagicHeadViewControllerAccessibility *)self _axWheelView];
  [v3 _axSetStatusText:0];
}

- (id)_axWheelView
{
  objc_opt_class();
  objc_super v3 = [(SFAirDropMagicHeadViewControllerAccessibility *)self safeValueForKey:@"wheelView"];
  objc_super v4 = __UIAccessibilityCastAsSafeCategory();

  return v4;
}

@end