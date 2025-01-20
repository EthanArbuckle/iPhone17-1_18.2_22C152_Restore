@interface CCUIButtonModuleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityControlCenterButtonIsToggle;
- (CGRect)_accessibilityControlCenterButtonFrame;
- (id)_accessibilityControlCenterButtonHint;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
- (id)_accessibilityControlCenterButtonPath;
- (id)_accessibilityControlCenterElementToFocusAfterClose;
- (unint64_t)_accessibilityControlCenterButtonAdditionalTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation CCUIButtonModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIButtonModuleViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIButtonModuleViewController" hasInstanceVariable:@"_buttonModuleView" withType:"CCUIControlTemplateView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewController", @"isExpanded", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewAccessibility", @"_accesibilityRawTraits", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewController", @"buttonView", "@", 0);
  [v3 validateClass:@"CCUIButtonModuleViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewController", @"appearsSelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIButtonModuleViewController", @"selectedValueText", "@", 0);
  [v3 validateClass:@"CCUIMenuModuleViewController" isKindOfClass:@"CCUIButtonModuleViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v34.receiver = self;
  v34.super_class = (Class)CCUIButtonModuleViewControllerAccessibility;
  [(CCUIButtonModuleViewControllerAccessibility *)&v34 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  LOBYTE(from) = 0;
  objc_opt_class();
  id v3 = [(CCUIButtonModuleViewControllerAccessibility *)self safeValueForKey:@"_buttonModuleView"];
  v4 = __UIAccessibilityCastAsClass();

  objc_initWeak(&from, v4);
  v5 = [v4 accessibilityLabel];
  if (!v5
    || ([(CCUIButtonModuleViewControllerAccessibility *)self _accessibilityControlCenterButtonLabel], v6 = objc_claimAutoreleasedReturnValue(), v6, v5, v6))
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v30[3] = &unk_2651195C0;
    objc_copyWeak(&v31, &location);
    [v4 _setAccessibilityLabelBlock:v30];
    objc_destroyWeak(&v31);
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v27[3] = &unk_2651195E8;
  objc_copyWeak(&v28, &location);
  objc_copyWeak(&v29, &from);
  [v4 _setAccessibilityHintBlock:v27];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v24[3] = &unk_2651195E8;
  objc_copyWeak(&v25, &location);
  objc_copyWeak(&v26, &from);
  [v4 _setAccessibilityValueBlock:v24];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v21[3] = &unk_265119610;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  [v4 _setAccessibilityTraitsBlock:v21];
  v7 = [v4 accessibilityIdentifier];
  if (!v7
    || ([(CCUIButtonModuleViewControllerAccessibility *)self _accessibilityControlCenterButtonIdentifier], v8 = objc_claimAutoreleasedReturnValue(), v8, v7, v8))
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
    v19[3] = &unk_2651195C0;
    objc_copyWeak(&v20, &location);
    [v4 _setAccessibilityIdentifierBlock:v19];
    objc_destroyWeak(&v20);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v17[3] = &unk_265119638;
  objc_copyWeak(&v18, &location);
  [v4 _setAccessibilityFrameBlock:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v15[3] = &unk_265119660;
  objc_copyWeak(&v16, &location);
  [v4 _setAccessibilityPathBlock:v15];
  if (objc_opt_respondsToSelector())
  {
    v9 = [(CCUIButtonModuleViewControllerAccessibility *)self safeValueForKey:@"buttonViewForCollapsedConnectivityModule"];
    [v9 setAccessibilityTraitsBlock:&__block_literal_global_1];
    objc_initWeak(&v14, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9;
    v12[3] = &unk_2651195C0;
    objc_copyWeak(&v13, &v14);
    [v9 setAccessibilityLabelBlock:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_10;
    v10[3] = &unk_2651195C0;
    objc_copyWeak(&v11, &v14);
    [v9 setAccessibilityValueBlock:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

id __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityControlCenterButtonLabel];

  return v2;
}

id __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained _accessibilityControlCenterButtonHint];

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(WeakRetained) = UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction();

  if (WeakRetained)
  {
    v7 = UIAccessibilityControlCenterModuleExpandPlatterHint();
    uint64_t v5 = __UIAXStringForVariables();

    id v3 = (void *)v5;
  }

  return v3;
}

__CFString *__89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = [WeakRetained safeBoolForKey:@"isExpanded"];

  id v5 = objc_loadWeakRetained(v2);
  LODWORD(WeakRetained) = [v5 _accessibilityControlCenterButtonIsToggle];

  v6 = 0;
  if (WeakRetained && (v4 & 1) == 0)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    int v8 = [v7 isSelected];
    v9 = @"0";
    if (v8) {
      v9 = @"1";
    }
    v6 = v9;
  }

  return v6;
}

uint64_t __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = [WeakRetained safeBoolForKey:@"isExpanded"];

  if (v4) {
    return *MEMORY[0x263F1CEF8];
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [v6 safeValueForKey:@"_accesibilityRawTraits"];
  uint64_t v8 = [v7 longLongValue];

  id v9 = objc_loadWeakRetained(v2);
  LODWORD(v7) = [v9 _accessibilityControlCenterButtonIsToggle];

  if (v7) {
    uint64_t v8 = v8 & ~*MEMORY[0x263F1CF38] | *MEMORY[0x263F1CF60];
  }
  id v10 = objc_loadWeakRetained(v2);
  uint64_t v5 = [v10 _accessibilityControlCenterButtonAdditionalTraits] | v8;

  return v5;
}

id __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityControlCenterButtonIdentifier];

  return v2;
}

double __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityControlCenterButtonFrame];
  double v3 = v2;

  return v3;
}

id __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained _accessibilityControlCenterButtonPath];

  return v2;
}

uint64_t __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8()
{
  return *MEMORY[0x263F1CF60];
}

id __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained _accessibilityControlCenterButtonLabel];

  return v2;
}

id __89__CCUIButtonModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_10(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeBoolForKey:@"appearsSelected"]) {
    double v3 = @"control.center.module.status.on";
  }
  else {
    double v3 = @"control.center.module.status.off";
  }
  int v4 = accessibilityLocalizedString(v3);

  id v5 = objc_loadWeakRetained(v1);
  MEMORY[0x245648F70](@"CCUIMenuModuleViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = objc_loadWeakRetained(v1);
    uint64_t v8 = [v7 safeStringForKey:@"selectedValueText"];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = __UIAXStringForVariables();

  return v9;
}

- (CGRect)_accessibilityControlCenterButtonFrame
{
  objc_opt_class();
  double v3 = [(CCUIButtonModuleViewControllerAccessibility *)self safeValueForKey:@"_buttonModuleView"];
  __UIAccessibilityCastAsClass();
  int v4 = (UIView *)objc_claimAutoreleasedReturnValue();

  [(UIView *)v4 bounds];
  CGRect v14 = UIAccessibilityConvertFrameToScreenCoordinates(v13, v4);
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;

  double v9 = x;
  double v10 = y;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (id)_accessibilityControlCenterButtonPath
{
  return 0;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return 0;
}

- (id)_accessibilityControlCenterButtonLabel
{
  double v2 = [(CCUIButtonModuleViewControllerAccessibility *)self accessibilityLabel];
  double v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_opt_class();
    id v5 = __UIAccessibilityCastAsClass();
    id v4 = [v5 title];
  }

  return v4;
}

- (id)_accessibilityControlCenterButtonHint
{
  return 0;
}

- (BOOL)_accessibilityControlCenterButtonIsToggle
{
  return 0;
}

- (unint64_t)_accessibilityControlCenterButtonAdditionalTraits
{
  return *MEMORY[0x263F1CF18];
}

- (id)_accessibilityControlCenterElementToFocusAfterClose
{
  return (id)[(CCUIButtonModuleViewControllerAccessibility *)self safeValueForKey:@"buttonView"];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIButtonModuleViewControllerAccessibility;
  [(CCUIButtonModuleViewControllerAccessibility *)&v3 viewDidLoad];
  [(CCUIButtonModuleViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end