@interface CCUILabeledRoundButtonViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityControlCenterButtonIsToggle;
- (BOOL)_accessibilityControlCenterButtonWillExpand;
- (CGRect)_accessibilityControlCenterButtonFrame;
- (id)_accessibilityControlCenterButtonHint;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
- (id)_accessibilityControlCenterButtonPath;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CCUILabeledRoundButtonViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUILabeledRoundButtonViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUILabeledRoundButtonViewController", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUILabeledRoundButtonViewController", @"buttonContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUILabeledRoundButton", @"title", "@", 0);
  [v3 validateClass:@"CCUILabeledRoundButtonViewController" hasInstanceVariable:@"_labelsVisible" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUILabeledRoundButtonViewController", @"button", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIRoundButtonAccessibility", @"_accesibilityRawTraits", "Q", 0);
  [v3 validateClass:@"CCUILabeledRoundButtonViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  if (([(CCUILabeledRoundButtonViewControllerAccessibility *)self _accessibilityBoolValueForKey:@"IsInAXLoadAX"] & 1) == 0)
  {
    [(CCUILabeledRoundButtonViewControllerAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"IsInAXLoadAX"];
    v24.receiver = self;
    v24.super_class = (Class)CCUILabeledRoundButtonViewControllerAccessibility;
    [(CCUILabeledRoundButtonViewControllerAccessibility *)&v24 _accessibilityLoadAccessibilityInformation];
    objc_initWeak(&location, self);
    LOBYTE(from) = 0;
    objc_opt_class();
    id v3 = [(CCUILabeledRoundButtonViewControllerAccessibility *)self safeValueForKey:@"button"];
    v4 = __UIAccessibilityCastAsClass();

    objc_initWeak(&from, v4);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v20[3] = &unk_2651195C0;
    objc_copyWeak(&v21, &location);
    [v4 _setAccessibilityLabelBlock:v20];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v17[3] = &unk_2651195E8;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    [v4 _setAccessibilityHintBlock:v17];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
    v14[3] = &unk_2651195E8;
    objc_copyWeak(&v15, &location);
    objc_copyWeak(&v16, &from);
    [v4 _setAccessibilityValueBlock:v14];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
    v11[3] = &unk_265119610;
    objc_copyWeak(&v12, &from);
    objc_copyWeak(&v13, &location);
    [v4 _setAccessibilityTraitsBlock:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
    v9[3] = &unk_2651195C0;
    objc_copyWeak(&v10, &location);
    [v4 _setAccessibilityIdentifierBlock:v9];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
    v7[3] = &unk_265119638;
    objc_copyWeak(&v8, &location);
    [v4 _setAccessibilityFrameBlock:v7];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
    v5[3] = &unk_265119660;
    objc_copyWeak(&v6, &location);
    [v4 _setAccessibilityPathBlock:v5];
    [(CCUILabeledRoundButtonViewControllerAccessibility *)self _accessibilitySetBoolValue:0 forKey:@"IsInAXLoadAX"];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }
}

id __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained _accessibilityControlCenterButtonIsToggle];

  id v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (v3)
  {
    id v6 = [v4 _accessibilityControlCenterButtonLabel];
  }
  else
  {
    v7 = [v4 safeValueForKey:@"buttonContainer"];
    id v6 = [v7 safeStringForKey:@"title"];
  }

  return v6;
}

id __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained _accessibilityControlCenterButtonHint];

  id v5 = objc_loadWeakRetained(v2);
  if ([v5 _accessibilityControlCenterButtonWillExpand])
  {
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    int ShouldIncludeOpenModuleAction = UIAccessibilityControlCenterElementShouldIncludeOpenModuleAction();

    if (!ShouldIncludeOpenModuleAction) {
      goto LABEL_5;
    }
  }
  id v10 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  uint64_t v8 = __UIAXStringForVariables();

  id v4 = (void *)v8;
LABEL_5:

  return v4;
}

__CFString *__95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = [WeakRetained _accessibilityControlCenterButtonIsToggle];

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = [v5 isSelected];
    v7 = @"0";
    if (v6) {
      v7 = @"1";
    }
    uint64_t v8 = v7;
    goto LABEL_7;
  }
  id v9 = objc_loadWeakRetained(v2);
  int v10 = [v9 safeBoolForKey:@"_labelsVisible"];

  if (v10)
  {
    id v5 = objc_loadWeakRetained(v2);
    uint64_t v8 = [v5 safeStringForKey:@"subtitle"];
LABEL_7:
    v11 = v8;

    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

uint64_t __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = [WeakRetained storedAccessibilityTraits];

  if (v4)
  {
    uint64_t v5 = [v4 unsignedLongLongValue];
  }
  else
  {
    id v6 = objc_loadWeakRetained(v2);
    v7 = [v6 safeValueForKey:@"_accesibilityRawTraits"];
    uint64_t v5 = [v7 longLongValue];

    uint64_t v8 = (id *)(a1 + 40);
    id v9 = objc_loadWeakRetained(v8);
    LODWORD(v7) = [v9 _accessibilityControlCenterButtonIsToggle];

    if (v7)
    {
      uint64_t v5 = v5 & ~*MEMORY[0x263F1CF38] | *MEMORY[0x263F1CF60];
    }
    else
    {
      id v10 = objc_loadWeakRetained(v8);
      int v11 = [v10 safeBoolForKey:@"_labelsVisible"];

      if (v11) {
        v5 &= ~*MEMORY[0x263F1CF38];
      }
    }
  }

  return v5;
}

id __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityControlCenterButtonIdentifier];

  return v2;
}

double __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityControlCenterButtonFrame];
  double v3 = v2;

  return v3;
}

id __95__CCUILabeledRoundButtonViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained _accessibilityControlCenterButtonPath];

  return v2;
}

- (CGRect)_accessibilityControlCenterButtonFrame
{
  objc_opt_class();
  double v3 = [(CCUILabeledRoundButtonViewControllerAccessibility *)self safeValueForKey:@"button"];
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

- (id)_accessibilityControlCenterButtonLabel
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(CCUILabeledRoundButtonViewControllerAccessibility *)self _accessibilityStringForLabelKeyValues:@"title, subtitle"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CCUILabeledRoundButtonViewControllerAccessibility;
    double v3 = [(CCUILabeledRoundButtonViewControllerAccessibility *)&v5 accessibilityLabel];
  }

  return v3;
}

- (id)_accessibilityControlCenterButtonHint
{
  return 0;
}

- (BOOL)_accessibilityControlCenterButtonIsToggle
{
  return [(CCUILabeledRoundButtonViewControllerAccessibility *)self safeBoolForKey:@"_labelsVisible"] ^ 1;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return 0;
}

- (BOOL)_accessibilityControlCenterButtonWillExpand
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUILabeledRoundButtonViewControllerAccessibility;
  [(CCUILabeledRoundButtonViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(CCUILabeledRoundButtonViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end