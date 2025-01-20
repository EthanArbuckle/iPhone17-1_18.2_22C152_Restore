@interface MediaControlsTransportStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MediaControlsTransportStackViewAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilityDescriptionForCommandRequest:(id)a3;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateButtonVisualStyling:(id)a3;
- (void)setResponse:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation MediaControlsTransportStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsTransportStackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTransportStackView", @"_updateButtonVisualStyling:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTransportStackView", @"leftButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTransportStackView", @"middleButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTransportStackView", @"rightButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTransportButton", @"touchUpInsideCommandRequest", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTransportStackView", @"tvRemoteButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTransportStackView", @"languageOptionsButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTransportStackView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTransportStackView", @"setResponse:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTransportStackView", @"setStyle:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MediaControlsTransportStackView", @"style", "q", 0);
  [v3 validateClass:@"MPCPlayerCommandRequest"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerCommandRequest", @"options", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerCommandRequest", @"command", "I", 0);
}

- (id)_accessibilityDescriptionForCommandRequest:(id)a3
{
  id v3 = a3;
  if (_accessibilityDescriptionForCommandRequest__onceToken != -1) {
    dispatch_once(&_accessibilityDescriptionForCommandRequest__onceToken, &__block_literal_global_6);
  }
  if (objc_opt_isKindOfClass())
  {
    int v4 = [v3 safeUnsignedIntegerForKey:@"command"];
    objc_opt_class();
    v5 = [v3 safeValueForKey:@"options"];
    v6 = __UIAccessibilityCastAsClass();

    v7 = 0;
    switch(v4)
    {
      case 0:
        v8 = @"play.button.label";
        goto LABEL_18;
      case 1:
        v8 = @"pause.button.label";
        goto LABEL_18;
      case 2:
        break;
      case 3:
        v8 = @"stop.button.label";
        goto LABEL_18;
      case 4:
        v8 = @"next.track.button.label";
        goto LABEL_18;
      case 5:
        v8 = @"previous.track.button.label";
LABEL_18:
        v7 = accessibilityLocalizedString(v8);
        break;
      default:
        if ((v4 - 17) < 2)
        {
          v9 = [v6 objectForKey:*MEMORY[0x263F54D90]];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([v9 doubleValue], v10 > 0.0))
          {
            double v12 = v10;
            v13 = NSString;
            if (v4 == 18) {
              v14 = @"rewind.button.label.with.seconds";
            }
            else {
              v14 = @"fast.forward.button.label.with.seconds";
            }
            v15 = accessibilityLocalizedString(v14);
            v7 = objc_msgSend(v13, "stringWithFormat:", v15, (uint64_t)v12);
          }
          else
          {
            if (v4 == 18) {
              v11 = @"rewind.button.label";
            }
            else {
              v11 = @"fast.forward.button.label";
            }
            v7 = accessibilityLocalizedString(v11);
          }
        }
        break;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

Class __91__MediaControlsTransportStackViewAccessibility__accessibilityDescriptionForCommandRequest___block_invoke()
{
  Class result = NSClassFromString(&cfstr_Mpcplayercomma.isa);
  _accessibilityDescriptionForCommandRequest__MPCPlayerCommandRequestClass = (uint64_t)result;
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v33.receiver = self;
  v33.super_class = (Class)MediaControlsTransportStackViewAccessibility;
  [(MediaControlsTransportStackViewAccessibility *)&v33 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MediaControlsTransportStackViewAccessibility *)self safeValueForKey:@"leftButton"];
  int v4 = [(MediaControlsTransportStackViewAccessibility *)self safeValueForKey:@"middleButton"];
  v5 = [(MediaControlsTransportStackViewAccessibility *)self safeValueForKey:@"rightButton"];
  v6 = [(MediaControlsTransportStackViewAccessibility *)self safeValueForKey:@"tvRemoteButton"];
  v7 = [(MediaControlsTransportStackViewAccessibility *)self safeValueForKey:@"languageOptionsButton"];
  [v3 accessibilitySetIdentification:@"rewind"];
  [v5 accessibilitySetIdentification:@"fastforward"];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v28[3] = &unk_2651305A8;
  objc_copyWeak(&v29, &from);
  objc_copyWeak(&v30, &location);
  [v4 _setAccessibilityLabelBlock:v28];
  objc_initWeak(&v27, v3);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v24[3] = &unk_2651305A8;
  objc_copyWeak(&v25, &v27);
  objc_copyWeak(&v26, &location);
  [v3 _setAccessibilityLabelBlock:v24];
  objc_initWeak(&v23, v5);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v20[3] = &unk_2651305A8;
  objc_copyWeak(&v21, &v23);
  objc_copyWeak(&v22, &location);
  [v5 _setAccessibilityLabelBlock:v20];
  v8 = accessibilityLocalizedString(@"tv.remote.button.label");
  [v6 setAccessibilityLabel:v8];

  v9 = accessibilityLocalizedString(@"language.options.button.label");
  [v7 setAccessibilityLabel:v9];

  LOBYTE(v9) = [(MediaControlsTransportStackViewAccessibility *)self safeIntegerForKey:@"style"] == 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v18[3] = &__block_descriptor_33_e15___NSString_8__0l;
  char v19 = (char)v9;
  [v3 _setAccessibilityHintBlock:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v16[3] = &__block_descriptor_33_e15___NSString_8__0l;
  char v17 = (char)v9;
  [v5 _setAccessibilityHintBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v14[3] = &__block_descriptor_33_e15___NSString_8__0l;
  char v15 = (char)v9;
  [v4 _setAccessibilityHintBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v12[3] = &__block_descriptor_33_e15___NSString_8__0l;
  char v13 = (char)v9;
  [v6 _setAccessibilityHintBlock:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
  v10[3] = &__block_descriptor_33_e15___NSString_8__0l;
  char v11 = (char)v9;
  [v7 _setAccessibilityHintBlock:v10];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"touchUpInsideCommandRequest"];

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [v4 _accessibilityDescriptionForCommandRequest:v3];

  return v5;
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"touchUpInsideCommandRequest"];

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = [v4 _accessibilityDescriptionForCommandRequest:v3];
  }
  else
  {
    v5 = accessibilityLocalizedString(@"previous.track.button.label");
  }

  return v5;
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained safeValueForKey:@"touchUpInsideCommandRequest"];

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = [v4 _accessibilityDescriptionForCommandRequest:v3];
  }
  else
  {
    v5 = accessibilityLocalizedString(@"next.track.button.label");
  }

  return v5;
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    v1 = 0;
  }
  else
  {
    v1 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  }

  return v1;
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    v1 = 0;
  }
  else
  {
    v1 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  }

  return v1;
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    v1 = 0;
  }
  else
  {
    v1 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  }

  return v1;
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    v1 = 0;
  }
  else
  {
    v1 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  }

  return v1;
}

id __90__MediaControlsTransportStackViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    v1 = 0;
  }
  else
  {
    v1 = UIAccessibilityControlCenterModuleExpandPlatterHint();
  }

  return v1;
}

- (id)accessibilityElements
{
  id v3 = [(MediaControlsTransportStackViewAccessibility *)self safeArrayForKey:@"subviews"];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(MediaControlsTransportStackViewAccessibility *)self safeValueForKey:@"leftButton"];
  v6 = [(MediaControlsTransportStackViewAccessibility *)self safeValueForKey:@"middleButton"];
  v7 = [(MediaControlsTransportStackViewAccessibility *)self safeValueForKey:@"rightButton"];
  unint64_t v8 = [v4 indexOfObject:v5];
  unint64_t v9 = [v4 indexOfObject:v6];
  unint64_t v10 = [v4 indexOfObject:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8 >= v9) {
      unint64_t v11 = v9;
    }
    else {
      unint64_t v11 = v8;
    }
    if (v11 >= v10) {
      unint64_t v12 = v10;
    }
    else {
      unint64_t v12 = v11;
    }
    [v4 exchangeObjectAtIndex:v12 withObjectAtIndex:v8];
  }
  unint64_t v13 = [v4 indexOfObject:v5];
  unint64_t v14 = [v4 indexOfObject:v6];
  unint64_t v15 = [v4 indexOfObject:v7];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL && v14 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v13 <= v14) {
      unint64_t v16 = v14;
    }
    else {
      unint64_t v16 = v13;
    }
    if (v16 <= v15) {
      unint64_t v17 = v15;
    }
    else {
      unint64_t v17 = v16;
    }
    [v4 exchangeObjectAtIndex:v17 withObjectAtIndex:v15];
  }

  return v4;
}

- (void)_updateButtonVisualStyling:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MediaControlsTransportStackViewAccessibility;
  [(MediaControlsTransportStackViewAccessibility *)&v9 _updateButtonVisualStyling:v4];
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  v6 = [v5 imageForState:0];

  v7 = [v6 _accessibilityValueForKey:@"AXInterval"];
  uint64_t v8 = [v7 integerValue];

  [v4 _accessibilitySetIntegerValue:v8 forKey:@"AXInterval"];
}

- (MediaControlsTransportStackViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsTransportStackViewAccessibility;
  id v3 = -[MediaControlsTransportStackViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MediaControlsTransportStackViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)setResponse:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MediaControlsTransportStackViewAccessibility;
  [(MediaControlsTransportStackViewAccessibility *)&v4 setResponse:a3];
  [(MediaControlsTransportStackViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)setStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MediaControlsTransportStackViewAccessibility;
  [(MediaControlsTransportStackViewAccessibility *)&v4 setStyle:a3];
  [(MediaControlsTransportStackViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end