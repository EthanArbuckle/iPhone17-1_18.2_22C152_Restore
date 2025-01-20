@interface UIStepperAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsMacVisualAppearance;
- (BOOL)canBecomeFocused;
- (id)_accessibilityKeyCommands;
- (id)_accessibilityMinusButton;
- (id)_accessibilityPlusButton;
- (id)_axMacIdiomDecrementElement;
- (id)_axMacIdiomIncrementElement;
- (uint64_t)_axIsAccessibilityNumericalPicker;
- (unint64_t)_accessibilityAutomationType;
- (void)_accessibilityKeyCommandActionMinus;
- (void)_accessibilityKeyCommandActionPlus;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateButtons;
- (void)_axSetMacIdiomDecrementElement:(uint64_t)a1;
- (void)_axSetMacIdiomIncrementElement:(uint64_t)a1;
- (void)_commonStepperInit;
- (void)_refreshVisualElement;
- (void)_updateCount:(id)a3;
@end

@implementation UIStepperAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStepper";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = @"UIStepper";
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v7 = "@";
  [location[0] validateClass:v6 hasInstanceMethod:@"visualElement" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_refreshVisualElement", v3, 0);
  v4 = @"UIStepperHorizontalVisualElement";
  v5 = "UIButton";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:v4 hasInstanceVariable:@"_plusButton" withType:v5];
  [location[0] validateClass:v6 hasInstanceVariable:@"_value" withType:"d"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"contentView", v7, 0);
  objc_storeStrong(v9, v8);
}

- (unint64_t)_accessibilityAutomationType
{
  return 79;
}

- (id)_axMacIdiomDecrementElement
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UIStepperAccessibility___axMacIdiomDecrementElement);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_axSetMacIdiomDecrementElement:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)_axMacIdiomIncrementElement
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UIStepperAccessibility___axMacIdiomIncrementElement);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_axSetMacIdiomIncrementElement:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (void)_axAnnotateButtons
{
  v87[2] = *MEMORY[0x263EF8340];
  v86 = a1;
  if (a1)
  {
    objc_initWeak(&location, v86);
    uint64_t v78 = MEMORY[0x263EF8330];
    int v79 = -1073741824;
    int v80 = 0;
    v81 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke;
    v82 = &unk_2650AE108;
    objc_copyWeak(&v83, &location);
    id v84 = (id)MEMORY[0x2455E7040](&v78);
    uint64_t v71 = MEMORY[0x263EF8330];
    int v72 = -1073741824;
    int v73 = 0;
    v74 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_2;
    v75 = &unk_2650AE108;
    objc_copyWeak(&v76, &location);
    id v77 = (id)MEMORY[0x2455E7040](&v71);
    if ([v86 _accessibilityViewIsMacIdiom])
    {
      id v70 = -[UIStepperAccessibility _axMacIdiomIncrementElement](v86);
      id v69 = -[UIStepperAccessibility _axMacIdiomDecrementElement](v86);
      if (!v70 || !v69)
      {
        id v18 = objc_alloc(MEMORY[0x263F1C3A8]);
        v17 = (void *)[v18 initWithAccessibilityContainer:v86];
        id v1 = v70;
        id v70 = v17;

        id v16 = objc_alloc(MEMORY[0x263F1C3A8]);
        v15 = (void *)[v16 initWithAccessibilityContainer:v86];
        id v2 = v69;
        id v69 = v15;

        -[UIStepperAccessibility _axSetMacIdiomIncrementElement:]((uint64_t)v86, v17);
        -[UIStepperAccessibility _axSetMacIdiomDecrementElement:]((uint64_t)v86, v15);
        [v17 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
        [v15 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
        v14 = v86;
        v87[0] = v17;
        v87[1] = v15;
        id v13 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v87 count:2];
        objc_msgSend(v14, "setAccessibilityElements:");
      }
      [v70 _setAccessibilityLabelBlock:v77];
      [v69 _setAccessibilityLabelBlock:v84];
      id v12 = v70;
      uint64_t v63 = MEMORY[0x263EF8330];
      int v64 = -1073741824;
      int v65 = 0;
      v66 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_3;
      v67 = &unk_2650AE108;
      objc_copyWeak(&v68, &location);
      [v12 _setAccessibilityValueBlock:&v63];
      id v11 = v69;
      uint64_t v57 = MEMORY[0x263EF8330];
      int v58 = -1073741824;
      int v59 = 0;
      v60 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_4;
      v61 = &unk_2650AE108;
      objc_copyWeak(&v62, &location);
      [v11 _setAccessibilityValueBlock:&v57];
      id v10 = v70;
      uint64_t v51 = MEMORY[0x263EF8330];
      int v52 = -1073741824;
      int v53 = 0;
      v54 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_5;
      v55 = &unk_2650AE230;
      objc_copyWeak(&v56, &location);
      [v10 _setAccessibilityFrameBlock:&v51];
      id v9 = v69;
      uint64_t v45 = MEMORY[0x263EF8330];
      int v46 = -1073741824;
      int v47 = 0;
      v48 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_6;
      v49 = &unk_2650AE230;
      objc_copyWeak(&v50, &location);
      [v9 _setAccessibilityFrameBlock:&v45];
      objc_destroyWeak(&v50);
      objc_destroyWeak(&v56);
      objc_destroyWeak(&v62);
      objc_destroyWeak(&v68);
      objc_storeStrong(&v69, 0);
      objc_storeStrong(&v70, 0);
    }
    else
    {
      id v8 = (id)[v86 safeValueForKey:@"visualElement"];
      id v44 = (id)[v8 safeUIViewForKey:@"_plusButton"];

      id v7 = (id)[v86 safeValueForKey:@"visualElement"];
      id v43 = (id)[v7 safeUIViewForKey:@"_minusButton"];

      [v44 _setAccessibilityLabelBlock:v77];
      [v43 _setAccessibilityLabelBlock:v84];
      id v6 = v44;
      uint64_t v37 = MEMORY[0x263EF8330];
      int v38 = -1073741824;
      int v39 = 0;
      v40 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_7;
      v41 = &unk_2650AE108;
      objc_copyWeak(&v42, &location);
      [v6 _setAccessibilityIdentifierBlock:&v37];
      id v5 = v43;
      uint64_t v31 = MEMORY[0x263EF8330];
      int v32 = -1073741824;
      int v33 = 0;
      v34 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_8;
      v35 = &unk_2650AE108;
      objc_copyWeak(&v36, &location);
      [v5 _setAccessibilityIdentifierBlock:&v31];
      id v4 = v44;
      uint64_t v25 = MEMORY[0x263EF8330];
      int v26 = -1073741824;
      int v27 = 0;
      v28 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_9;
      v29 = &unk_2650AE108;
      objc_copyWeak(&v30, &location);
      [v4 _setAccessibilityValueBlock:&v25];
      id v3 = v43;
      uint64_t v19 = MEMORY[0x263EF8330];
      int v20 = -1073741824;
      int v21 = 0;
      v22 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_10;
      v23 = &unk_2650AE108;
      objc_copyWeak(&v24, &location);
      [v3 _setAccessibilityValueBlock:&v19];
      [v44 _accessibilitySetScannerActivateBehavior:1];
      [v43 _accessibilitySetScannerActivateBehavior:1];
      if (-[UIStepperAccessibility _axIsAccessibilityNumericalPicker](v86))
      {
        [v44 _setAccessibilityAdditionalTraitsBlock:&__block_literal_global_33];
        [v43 _setAccessibilityAdditionalTraitsBlock:&__block_literal_global_354];
      }
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&v42);
      objc_storeStrong(&v43, 0);
      objc_storeStrong(&v44, 0);
    }
    objc_storeStrong(&v77, 0);
    objc_destroyWeak(&v76);
    objc_storeStrong(&v84, 0);
    objc_destroyWeak(&v83);
    objc_destroyWeak(&location);
  }
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke(id *a1)
{
  v6[2] = a1;
  v6[1] = a1;
  v6[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = (id)[v6[0] accessibilityLabel];
  id v2 = accessibilityLocalizedString(@"ui.stepper.decrement");
  id v5 = (id)__UIAXStringForVariables();

  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);

  return v4;
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_2(id *a1)
{
  v6[2] = a1;
  v6[1] = a1;
  v6[0] = objc_loadWeakRetained(a1 + 4);
  id v3 = (id)[v6[0] accessibilityLabel];
  id v2 = accessibilityLocalizedString(@"ui.stepper.increment");
  id v5 = (id)__UIAXStringForVariables();

  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);

  return v4;
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_3(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  id v2 = (id)[v3[0] accessibilityValue];
  objc_storeStrong(v3, 0);

  return v2;
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_4(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  id v2 = (id)[v3[0] accessibilityValue];
  objc_storeStrong(v3, 0);

  return v2;
}

double __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_5(id *a1)
{
  v7[2] = a1;
  v7[1] = a1;
  v7[0] = objc_loadWeakRetained(a1 + 4);
  [v7[0] accessibilityFrame];
  CGRect rect = v12;
  CGRectGetMinX(v12);
  CGRectGetMinY(rect);
  CGRectGetWidth(rect);
  CGRectGetHeight(rect);
  CGRectMake_2();
  double v8 = v1;
  uint64_t v9 = v2;
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  objc_storeStrong(v7, 0);
  return v8;
}

double __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_6(id *a1)
{
  v7[2] = a1;
  v7[1] = a1;
  v7[0] = objc_loadWeakRetained(a1 + 4);
  [v7[0] accessibilityFrame];
  CGRect rect = v12;
  CGRectGetMinX(v12);
  CGRectGetMinY(rect);
  CGRectGetHeight(rect);
  CGRectGetWidth(rect);
  CGRectGetHeight(rect);
  CGRectMake_2();
  double v8 = v1;
  uint64_t v9 = v2;
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  objc_storeStrong(v7, 0);
  return v8;
}

__CFString *__44__UIStepperAccessibility__axAnnotateButtons__block_invoke_7(id *a1)
{
  v4[2] = a1;
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  id location = (id)[v4[0] accessibilityIdentifier];
  if ([location length]) {
    id v5 = (__CFString *)(id)[NSString stringWithFormat:@"%@-Increment", location];
  }
  else {
    id v5 = @"Increment";
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v4, 0);
  double v1 = v5;

  return v1;
}

__CFString *__44__UIStepperAccessibility__axAnnotateButtons__block_invoke_8(id *a1)
{
  v4[2] = a1;
  v4[1] = a1;
  v4[0] = objc_loadWeakRetained(a1 + 4);
  id location = (id)[v4[0] accessibilityIdentifier];
  if ([location length]) {
    id v5 = (__CFString *)(id)[NSString stringWithFormat:@"%@-Decrement", location];
  }
  else {
    id v5 = @"Decrement";
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v4, 0);
  double v1 = v5;

  return v1;
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_9(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  id v2 = (id)[v3[0] accessibilityValue];
  objc_storeStrong(v3, 0);

  return v2;
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_10(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  id v2 = (id)[v3[0] accessibilityValue];
  objc_storeStrong(v3, 0);

  return v2;
}

- (uint64_t)_axIsAccessibilityNumericalPicker
{
  if (a1)
  {
    id v2 = (id)[a1 accessibilityIdentification];
    char v3 = [v2 isEqualToString:@"AXStepper"] & 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

uint64_t __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_11()
{
  return *MEMORY[0x263F1CF40];
}

uint64_t __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_12()
{
  return *MEMORY[0x263F1CF40];
}

- (void)_commonStepperInit
{
  uint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIStepperAccessibility;
  [(UIStepperAccessibility *)&v2 _commonStepperInit];
  -[UIStepperAccessibility _axAnnotateButtons](v4);
}

- (void)_refreshVisualElement
{
  uint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIStepperAccessibility;
  [(UIStepperAccessibility *)&v2 _refreshVisualElement];
  -[UIStepperAccessibility _axAnnotateButtons](v4);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIStepperAccessibility;
  [(UIStepperAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[UIStepperAccessibility _axAnnotateButtons](v4);
}

- (void)_updateCount:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23.receiver = v25;
  v23.super_class = (Class)UIStepperAccessibility;
  [(UIStepperAccessibility *)&v23 _updateCount:location[0]];
  [(UIStepperAccessibility *)v25 safeDoubleForKey:@"_value"];
  v22[1] = v3;
  v22[0] = 0;
  if (-[UIStepperAccessibility _axIsAccessibilityNumericalPicker](v25))
  {
    id v21 = (id)[(UIStepperAccessibility *)v25 _accessibilityFindAncestor:&__block_literal_global_367 startWithSelf:1];
    id v20 = (id)[v21 safeValueForKey:@"contentView"];
    id v19 = (id)[v20 subviews];
    memset(__b, 0, sizeof(__b));
    id obj = v19;
    uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
    if (v13)
    {
      uint64_t v9 = *(void *)__b[2];
      uint64_t v10 = 0;
      unint64_t v11 = v13;
      while (1)
      {
        uint64_t v8 = v10;
        if (*(void *)__b[2] != v9) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(id *)(__b[1] + 8 * v10);
        NSClassFromString(&cfstr_Uilabel.isa);
        if (objc_opt_isKindOfClass())
        {
          id v4 = (id)[v18 text];
          id v5 = v22[0];
          v22[0] = v4;
        }
        ++v10;
        if (v8 + 1 >= v11)
        {
          uint64_t v10 = 0;
          unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
          if (!v11) {
            break;
          }
        }
      }
    }

    id v7 = (id)AXFormatFloat();
    id v6 = v22[0];
    id v16 = (id)__UIAXStringForVariables();

    id v15 = (id)objc_msgSend(MEMORY[0x263F21660], "axAttributedStringWithString:", v16, v6, @"__AXStringForVariablesSentinel");
    [v15 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
    id v14 = v15;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(v22, 0);
  objc_storeStrong(location, 0);
}

uint64_t __39__UIStepperAccessibility__updateCount___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Axuisettingsed.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

void __39__UIStepperAccessibility__updateCount___block_invoke_2(uint64_t a1)
{
}

- (id)_accessibilityKeyCommands
{
  v13[2] = *MEMORY[0x263EF8340];
  char v11 = [(UIStepperAccessibility *)self _accessibilityViewIsMacIdiom] & 1;
  char v10 = [(UIStepperAccessibility *)self _accessibilityIsRTL] & 1;
  if (v11)
  {
    uint64_t v9 = *MEMORY[0x263F1D3E8];
  }
  else
  {
    if (v10) {
      uint64_t v8 = *MEMORY[0x263F1D3D8];
    }
    else {
      uint64_t v8 = *MEMORY[0x263F1D3E0];
    }
    uint64_t v9 = v8;
  }
  id v7 = (id)[MEMORY[0x263F1C708] keyCommandWithInput:v9 modifierFlags:0 action:sel__accessibilityKeyCommandActionPlus];
  v13[0] = v7;
  if (v11)
  {
    uint64_t v6 = *MEMORY[0x263F1D3C8];
  }
  else
  {
    if (v10) {
      uint64_t v5 = *MEMORY[0x263F1D3E0];
    }
    else {
      uint64_t v5 = *MEMORY[0x263F1D3D8];
    }
    uint64_t v6 = v5;
  }
  id v3 = (id)[MEMORY[0x263F1C708] keyCommandWithInput:v6 modifierFlags:0 action:sel__accessibilityKeyCommandActionMinus];
  v13[1] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  return v4;
}

- (BOOL)_accessibilityIsMacVisualAppearance
{
  return 0;
}

- (id)_accessibilityPlusButton
{
  if (a1)
  {
    char v7 = 0;
    char v5 = 0;
    char v3 = 0;
    if ([a1 _accessibilityViewIsMacIdiom])
    {
      id v8 = -[UIStepperAccessibility _axMacIdiomIncrementElement](a1);
      char v7 = 1;
      id v1 = v8;
    }
    else
    {
      id v6 = (id)[a1 safeValueForKey:@"visualElement"];
      char v5 = 1;
      id v4 = (id)[v6 safeUIViewForKey:@"_plusButton"];
      char v3 = 1;
      id v1 = v4;
    }
    char v10 = v1;
    if (v3) {

    }
    if (v5) {
    if (v7)
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_accessibilityMinusButton
{
  if (a1)
  {
    char v7 = 0;
    char v5 = 0;
    char v3 = 0;
    if ([a1 _accessibilityViewIsMacIdiom])
    {
      id v8 = -[UIStepperAccessibility _axMacIdiomIncrementElement](a1);
      char v7 = 1;
      id v1 = v8;
    }
    else
    {
      id v6 = (id)[a1 safeValueForKey:@"visualElement"];
      char v5 = 1;
      id v4 = (id)[v6 safeUIViewForKey:@"_minusButton"];
      char v3 = 1;
      id v1 = v4;
    }
    char v10 = v1;
    if (v3) {

    }
    if (v5) {
    if (v7)
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)_accessibilityKeyCommandActionPlus
{
  v7[2] = self;
  v7[1] = (id)a2;
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  char v5 = __60__UIStepperAccessibility__accessibilityKeyCommandActionPlus__block_invoke;
  id v6 = &unk_2650ADF18;
  v7[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v7, 0);
}

void __60__UIStepperAccessibility__accessibilityKeyCommandActionPlus__block_invoke(uint64_t a1)
{
  id v1 = -[UIStepperAccessibility _accessibilityPlusButton](*(void **)(a1 + 32));
  [v1 _keyboardActivate];
}

- (void)_accessibilityKeyCommandActionMinus
{
  v7[2] = self;
  v7[1] = (id)a2;
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  char v5 = __61__UIStepperAccessibility__accessibilityKeyCommandActionMinus__block_invoke;
  id v6 = &unk_2650ADF18;
  v7[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v7, 0);
}

void __61__UIStepperAccessibility__accessibilityKeyCommandActionMinus__block_invoke(uint64_t a1)
{
  id v1 = -[UIStepperAccessibility _accessibilityMinusButton](*(void **)(a1 + 32));
  [v1 _keyboardActivate];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

@end