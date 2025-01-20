@interface _UIDatePickerContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (id)_accessibilityDismissElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_axDatePicker:(id)a3;
- (id)accessibilityElements;
- (void)_setAccessibilityDismissElement:(id)a3;
@end

@implementation _UIDatePickerContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIDatePickerContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerContainerView", @"presentation", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerOverlayPresentation", @"dismissPresentationAnimated:", "v", "B", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  v9[2] = self;
  v9[1] = (id)a2;
  v9[0] = (id)[(_UIDatePickerContainerViewAccessibility *)self safeValueForKey:@"presentation"];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  v6 = __69___UIDatePickerContainerViewAccessibility_accessibilityPerformEscape__block_invoke;
  v7 = &unk_2650ADF18;
  id v8 = v9[0];
  AXPerformSafeBlock();
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  return 1;
}

- (id)_accessibilityDismissElement
{
  return objc_getAssociatedObject(self, &___UIDatePickerContainerViewAccessibility___accessibilityDismissElement);
}

- (void)_setAccessibilityDismissElement:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)accessibilityElements
{
  v43 = self;
  v42[1] = (id)a2;
  char v41 = 0;
  objc_opt_class();
  id v40 = (id)__UIAccessibilityCastAsClass();
  id v39 = v40;
  objc_storeStrong(&v40, 0);
  id v11 = (id)[v39 subviews];
  id v12 = (id)[v11 mutableCopy];
  char v37 = 0;
  if (v12)
  {
    id v2 = v12;
  }
  else
  {
    id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
    char v37 = 1;
    id v2 = v38;
  }
  v42[0] = v2;
  if (v37) {

  }
  id v36 = [(_UIDatePickerContainerViewAccessibility *)v43 _accessibilityDismissElement];
  if (v36)
  {
    id v44 = (id)[v42[0] arrayByAddingObject:v36];
    int v35 = 1;
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x263F1C3A8]);
    id v34 = (id)[v3 initWithAccessibilityContainer:v43];
    objc_initWeak(&v33, v43);
    id v10 = v34;
    uint64_t v27 = MEMORY[0x263EF8330];
    int v28 = -1073741824;
    int v29 = 0;
    v30 = __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke;
    v31 = &unk_2650AE230;
    objc_copyWeak(&v32, &v33);
    [v10 _setAccessibilityFrameBlock:&v27];
    if ([v42[0] count])
    {
      id v26 = [(_UIDatePickerContainerViewAccessibility *)v43 _axDatePicker:v42[0]];
      if (v26)
      {
        id v9 = v34;
        uint64_t v19 = MEMORY[0x263EF8330];
        int v20 = -1073741824;
        int v21 = 0;
        v22 = __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke_2;
        v23 = &unk_2650AE258;
        id v24 = v26;
        objc_copyWeak(&v25, &v33);
        [v9 _setAccessibilityActivationPointBlock:&v19];
        objc_destroyWeak(&v25);
        objc_storeStrong(&v24, 0);
      }
      objc_storeStrong(&v26, 0);
    }
    [v34 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    id v8 = (id)UIKitAccessibilityLocalizedString();
    objc_msgSend(v34, "setAccessibilityLabel:");

    id v7 = (id)UIKitAccessibilityLocalizedString();
    objc_msgSend(v34, "setAccessibilityHint:");

    [v34 setAccessibilityIdentifier:@"PopoverDismissRegion"];
    [v34 _accessibilitySetAdditionalElementOrderedLast:1];
    id v6 = v34;
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    v16 = __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke_3;
    v17 = &unk_2650ADF60;
    objc_copyWeak(&v18, &v33);
    [v6 _setAccessibilityActivateBlock:&v13];
    [(_UIDatePickerContainerViewAccessibility *)v43 _setAccessibilityDismissElement:v34];
    id v44 = (id)[v42[0] arrayByAddingObject:v34];
    int v35 = 1;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v33);
    objc_storeStrong(&v34, 0);
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(v42, 0);
  int v4 = v44;

  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v15 = a3;
  int v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v12 = [(_UIDatePickerContainerViewAccessibility *)v14 accessibilityElements];
  if (![v12 count]) {
    goto LABEL_8;
  }
  id v11 = [(_UIDatePickerContainerViewAccessibility *)v14 _axDatePicker:v12];
  id v10 = [(_UIDatePickerContainerViewAccessibility *)v14 _accessibilityDismissElement];
  if (v11
    && ([(_UIDatePickerContainerViewAccessibility *)v14 accessibilityFrame],
        CGRect rect = v18,
        CGRectContainsPoint(v18, v15))
    && ([v11 accessibilityFrame], CGRect v8 = v19, !CGRectContainsPoint(v19, v15)))
  {
    id v16 = v10;
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  if (!v7)
  {
LABEL_8:
    v6.receiver = v14;
    v6.super_class = (Class)_UIDatePickerContainerViewAccessibility;
    id v16 = -[_UIDatePickerContainerViewAccessibility _accessibilityHitTest:withEvent:](&v6, sel__accessibilityHitTest_withEvent_, location[0], v15.x, v15.y);
    int v7 = 1;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  int v4 = v16;

  return v4;
}

- (id)_axDatePicker:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[location[0] firstObject];
  id v5 = (id)[v7 automationElements];
  id v6 = (id)[v5 firstObject];

  NSClassFromString(&cfstr_Uidatepickerov_0.isa);
  if (objc_opt_isKindOfClass()) {
    id v9 = v6;
  }
  else {
    id v9 = 0;
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  id v3 = v9;

  return v3;
}

@end