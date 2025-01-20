@interface UIInputSwitcherTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation UIInputSwitcherTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInputSwitcherTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  [location[0] validateClass:@"UIInputSwitcherItem" hasInstanceMethod:@"identifier" withFullSignature:0];
  v4 = @"UIInputSwitcherView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v4 hasInstanceVariable:@"m_inputSwitcherItems" withType:"NSArray"];
  objc_storeStrong(v6, obj);
}

- (id)accessibilityLabel
{
  v46 = self;
  v45[1] = (id)a2;
  id v13 = (id)[(UIInputSwitcherTableCellAccessibility *)self textLabel];
  id v12 = (id)[v13 accessibilityLabel];
  id v11 = (id)[(UIInputSwitcherTableCellAccessibility *)v46 detailTextLabel];
  id v8 = (id)[v11 accessibilityLabel];
  v45[0] = (id)__UIAXStringForVariables();

  id v44 = 0;
  id v43 = (id)[(UIInputSwitcherTableCellAccessibility *)v46 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uiinputswitche_13.isa), v8, @"__AXStringForVariablesSentinel"];
  id v42 = (id)[(UIInputSwitcherTableCellAccessibility *)v46 _accessibilityAncestorIsKindOf:objc_opt_class()];
  id v14 = v42;
  char v40 = 0;
  objc_opt_class();
  id v39 = (id)__UIAccessibilityCastAsClass();
  id v38 = v39;
  objc_storeStrong(&v39, 0);
  id v41 = (id)objc_msgSend(v14, "indexPathForCell:");

  if (v41)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    int v32 = 838860800;
    int v33 = 48;
    v34 = __Block_byref_object_copy__11;
    v35 = __Block_byref_object_dispose__11;
    id v36 = 0;
    uint64_t v23 = MEMORY[0x263EF8330];
    int v24 = -1073741824;
    int v25 = 0;
    v26 = __59__UIInputSwitcherTableCellAccessibility_accessibilityLabel__block_invoke;
    v27 = &unk_2650ADF88;
    v29[1] = &v30;
    id v28 = v43;
    v29[0] = v41;
    AXPerformSafeBlock();
    id v22 = (id)v31[5];
    objc_storeStrong(v29, 0);
    objc_storeStrong(&v28, 0);
    _Block_object_dispose(&v30, 8);
    objc_storeStrong(&v36, 0);
    id v37 = v22;
    char v20 = 0;
    objc_opt_class();
    id v10 = (id)[v43 safeValueForKey:@"inputModes"];
    id v19 = (id)__UIAccessibilityCastAsClass();

    id v18 = v19;
    objc_storeStrong(&v19, 0);
    id v21 = v18;
    id v17 = (id)[v37 safeValueForKey:@"identifier"];
    if ([v21 containsObject:v17]) {
      id v2 = v17;
    }
    else {
      id v2 = 0;
    }
    id v16 = v2;
    if (v2)
    {
      id v3 = (id)MEMORY[0x2455E67B0](v16);
      id v4 = v44;
      id v44 = v3;

      id v5 = (id)MEMORY[0x2455E66B0](v44);
      id v6 = v44;
      id v44 = v5;
    }
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v37, 0);
  }
  if (v44)
  {
    id v15 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v45[0]];
    [v15 setAttribute:v44 forKey:*MEMORY[0x263F217A8]];
    objc_storeStrong(v45, v15);
    objc_storeStrong(&v15, 0);
  }
  id v9 = v45[0];
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(v45, 0);

  return v9;
}

void __59__UIInputSwitcherTableCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v9 = a1;
  char v8 = 0;
  id v5 = (id)[*(id *)(a1 + 32) safeValueForKey:@"m_inputSwitcherItems"];
  id v7 = (id)__UIAccessibilitySafeClass();

  id v6 = v7;
  objc_storeStrong(&v7, 0);
  id v1 = (id)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  v8[2] = self;
  v8[1] = (id)a2;
  char v7 = 0;
  objc_opt_class();
  id v6 = (id)__UIAccessibilityCastAsClass();
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = (id)[v5 accessoryView];

  id v4 = (id)[v8[0] accessibilityValue];
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v8, 0);

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  id v15 = self;
  SEL v14 = a2;
  long long v16 = 0uLL;
  v13.receiver = self;
  v13.super_class = (Class)UIInputSwitcherTableCellAccessibility;
  [(UIInputSwitcherTableCellAccessibility *)&v13 accessibilityActivationPoint];
  *(void *)&long long v16 = v2;
  *((void *)&v16 + 1) = v3;
  char v11 = 0;
  objc_opt_class();
  id v10 = (id)__UIAccessibilityCastAsClass();
  id v9 = v10;
  objc_storeStrong(&v10, 0);
  id v12 = (id)[v9 accessoryView];

  if (v12)
  {
    [v12 accessibilityActivationPoint];
    *(void *)&long long v8 = v4;
    *((void *)&v8 + 1) = v5;
    long long v16 = v8;
  }
  objc_storeStrong(&v12, 0);
  double v7 = *((double *)&v16 + 1);
  double v6 = *(double *)&v16;
  result.y = v7;
  result.x = v6;
  return result;
}

@end