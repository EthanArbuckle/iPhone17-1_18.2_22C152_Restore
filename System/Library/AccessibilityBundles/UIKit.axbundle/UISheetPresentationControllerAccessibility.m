@interface UISheetPresentationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanCollapseSheet;
- (BOOL)_accessibilityCanExpandSheet;
- (BOOL)_accessibilityCollapseSheet;
- (BOOL)_accessibilityExpandSheet;
- (BOOL)_accessibilityIsInverted;
- (BOOL)_accessibilityPresentationControllerModalizes;
- (int64_t)_axCurrentGrabberAction;
- (void)_accessibilityChangeSize:(BOOL)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupGrabber:(id)a3;
- (void)_axMarkupGrabbers;
- (void)_containerViewLayoutSubviews;
@end

@implementation UISheetPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISheetPresentationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v13 = location;
  id v12 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UISheetPresentationController";
  v3 = @"UIPresentationController";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v6 = "v";
  [location[0] validateClass:@"UISheetPresentationController" hasInstanceMethod:@"_containerViewLayoutSubviews" withFullSignature:0];
  v9 = "@";
  [location[0] validateClass:v4 hasInstanceMethod:@"_layoutInfo" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_currentPresentedViewFrame", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"presentedView", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"dropShadowView", v9, 0);
  v8 = "B";
  [location[0] validateClass:v3 hasInstanceMethod:@"_shouldDismiss" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"delegate", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"animateChanges:", v6, "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_sendDidChangeSelectedDetentIdentifier", v6, 0);
  v5 = @"UIDropShadowView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_bottomGrabber", v9, 0);
  v7 = @"_UISheetLayoutInfo";
  v10 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_indexOfCurrentActiveDetent", v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_activeDetents", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_presentedViewController", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_setSelectedDetentIdentifier:", v6, v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_isInverted", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UISheetActiveDetent", @"_identifier", v9, 0);
  v11 = @"UISheetPresentationControllerDetent";
  objc_msgSend(location[0], "validateClass:hasProperty:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, @"_type", v10, 0);
  [location[0] validateClass:v11];
  objc_storeStrong(v13, v12);
}

- (void)_containerViewLayoutSubviews
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISheetPresentationControllerAccessibility;
  [(UISheetPresentationControllerAccessibility *)&v2 _containerViewLayoutSubviews];
  [(UISheetPresentationControllerAccessibility *)v4 _axMarkupGrabbers];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISheetPresentationControllerAccessibility;
  [(UISheetPresentationControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  [(UISheetPresentationControllerAccessibility *)v4 _axMarkupGrabbers];
}

- (void)_axMarkupGrabbers
{
  v7 = self;
  v6[1] = (id)a2;
  v6[0] = (id)[(UISheetPresentationControllerAccessibility *)self safeValueForKey:@"dropShadowView"];
  objc_super v2 = v7;
  id v3 = (id)[v6[0] safeValueForKey:@"_topGrabber"];
  -[UISheetPresentationControllerAccessibility _axMarkupGrabber:](v2, "_axMarkupGrabber:");

  v4 = v7;
  id v5 = (id)[v6[0] safeValueForKey:@"_bottomGrabber"];
  -[UISheetPresentationControllerAccessibility _axMarkupGrabber:](v4, "_axMarkupGrabber:");

  objc_storeStrong(v6, 0);
}

- (void)_axMarkupGrabber:(id)a3
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v27, v29);
  uint64_t v20 = MEMORY[0x263EF8330];
  int v21 = -1073741824;
  int v22 = 0;
  v23 = __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke;
  v24 = &unk_2650ADF60;
  objc_copyWeak(&v25, &v27);
  id v26 = (id)MEMORY[0x2455E7040](&v20);
  [location[0] _accessibilitySetSortPriority:1];
  id v7 = location[0];
  CGSizeMake();
  v19[1] = v3;
  v19[2] = v4;
  objc_msgSend(v7, "_accessibilitySetFrameExpansion:", *(double *)&v3, *(double *)&v4);
  [location[0] _setIsAccessibilityElementBlock:v26];
  id v6 = location[0];
  uint64_t v14 = MEMORY[0x263EF8330];
  int v15 = -1073741824;
  int v16 = 0;
  v17 = __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke_2;
  v18 = &unk_2650AE2C8;
  v19[0] = v26;
  [v6 _setAccessibilityTraitsBlock:&v14];
  id v5 = location[0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  v11 = __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke_3;
  id v12 = &unk_2650AE108;
  objc_copyWeak(&v13, &v27);
  [v5 _setAccessibilityHintBlock:&v8];
  objc_destroyWeak(&v13);
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v26, 0);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_storeStrong(location, 0);
}

uint64_t __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (!location[0])
  {
    char v10 = 0;
    goto LABEL_16;
  }
  uint64_t v4 = [location[0] _axCurrentGrabberAction];
  if (!v4)
  {
LABEL_15:
    char v10 = 1;
    goto LABEL_16;
  }
  if (v4 != 1)
  {
    if ((unint64_t)(v4 - 2) > 1)
    {
      char v10 = 0;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id v3 = (id)[location[0] safeValueForKey:@"delegate"];
  char v7 = 0;
  char v5 = 0;
  if (!v3
    || (id v8 = (id)[location[0] safeValueForKey:@"delegate"],
        char v7 = 1,
        BOOL v2 = 0,
        ([v8 _accessibilityShouldAttemptToAddDismissalElement] & 1) != 0))
  {
    id v6 = (id)[location[0] safeValueForKey:@"_shouldDismiss"];
    char v5 = 1;
    BOOL v2 = v6 != 0;
  }
  char v10 = v2;
  if (v5) {

  }
  if (v7) {
LABEL_16:
  }
  objc_storeStrong(location, 0);
  return v10 & 1;
}

uint64_t __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke_2(uint64_t a1)
{
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))()) {
    return *MEMORY[0x263F1CEE8];
  }
  else {
    return *MEMORY[0x263F1CF18];
  }
}

id __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke_3(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    uint64_t v1 = [location[0] _axCurrentGrabberAction];
    if (v1)
    {
      uint64_t v3 = v1;
      char v2 = 1;
    }
    else
    {
      uint64_t v3 = 0;
      char v2 = 0;
    }
    if (v2)
    {
      id v7 = 0;
    }
    else
    {
      switch(v3)
      {
        case 0:
          id v7 = accessibilityLocalizedString(@"sheet.grabber.dismiss.keyboard.hint");
          break;
        case 1:
          id v7 = accessibilityLocalizedString(@"sheet.grabber.dismiss.sheet.hint");
          break;
        case 2:
          id v7 = accessibilityLocalizedString(@"sheet.grabber.collapse.hint");
          break;
        case 3:
          id v7 = accessibilityLocalizedString(@"sheet.grabber.expand.hint");
          break;
        default:
          JUMPOUT(0);
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v4 = v7;

  return v4;
}

- (int64_t)_axCurrentGrabberAction
{
  id v3 = (id)[(UISheetPresentationControllerAccessibility *)self safeValueForKey:@"_layoutInfo"];
  int64_t v4 = [v3 safeIntegerForKey:@"_grabberAction"];

  return v4;
}

- (BOOL)_accessibilityPresentationControllerModalizes
{
  id v27 = self;
  v26[1] = (id)a2;
  v26[0] = (id)[(UISheetPresentationControllerAccessibility *)self safeValueForKey:@"_layoutInfo"];
  unint64_t v25 = [v26[0] safeIntegerForKey:@"_indexOfCurrentActiveDetent"];
  id v24 = (id)[v26[0] safeArrayForKey:@"_activeDetents"];
  id v11 = (id)[v26[0] safeValueForKey:@"_containerTraitCollection"];
  BOOL v12 = [v11 verticalSizeClass] == 1;

  BOOL v23 = v12;
  char v20 = 0;
  if (v25 >= [v24 count])
  {
    id v2 = 0;
  }
  else
  {
    id v21 = (id)[v24 objectAtIndexedSubscript:v25];
    char v20 = 1;
    id v2 = v21;
  }
  id v22 = v2;
  if (v20) {

  }
  char v18 = 0;
  objc_opt_class();
  id v10 = (id)[v26[0] safeValueForKey:@"_presentedViewController"];
  id v17 = (id)__UIAccessibilityCastAsClass();

  id v16 = v17;
  objc_storeStrong(&v17, 0);
  id v19 = v16;
  uint64_t v15 = 0;
  NSClassFromString(&cfstr_Uisheetpresent_1.isa);
  if (objc_opt_isKindOfClass()) {
    uint64_t v15 = [v22 safeIntegerForKey:@"_type"];
  }
  id v14 = (id)[v22 safeStringForKey:@"identifier"];
  if (([v14 isEqualToString:@"com.apple.UIKit.ColorPicker"] & 1) != 0
    || ([v14 isEqualToString:@"ComplicationGalleryDodge"] & 1) != 0
    || ([v14 isEqualToString:@"homeScreenPickerDodge"] & 1) != 0
    || ([v19 _accessibilityPresentedControllerModalizes] & 1) != 0)
  {
    char v28 = 1;
  }
  else if (v15 == 1 || ([v14 isEqualToString:@"com.apple.UIKit.large"] & 1) != 0)
  {
    char v28 = 1;
  }
  else if (v15 == 2 && v23)
  {
    char v28 = 1;
  }
  else
  {
    if (v15 && v15 != 4) {
      goto LABEL_25;
    }
    id v9 = (id)[(UISheetPresentationControllerAccessibility *)v27 safeUIViewForKey:@"presentedView"];
    id v8 = (id)[v9 window];
    [v8 frame];
    r2.origin.x = v3;
    r2.origin.y = v4;
    r2.size.width = v5;
    r2.size.height = v6;

    [(UISheetPresentationControllerAccessibility *)v27 safeCGRectForKey:@"_currentPresentedViewFrame"];
    CGRect v30 = CGRectIntersection(v29, r2);
    if (v30.size.height / r2.size.height > 0.85 && v30.size.width / r2.size.width >= 0.4) {
      goto LABEL_24;
    }
    if (AXProcessIsShortcuts()) {
LABEL_24:
    }
      char v28 = 1;
    else {
LABEL_25:
    }
      char v28 = 0;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v26, 0);
  return v28 & 1;
}

- (BOOL)_accessibilityExpandSheet
{
  if (![(UISheetPresentationControllerAccessibility *)self _accessibilityCanExpandSheet]) {
    return 0;
  }
  [(UISheetPresentationControllerAccessibility *)self _accessibilityChangeSize:1];
  return 1;
}

- (BOOL)_accessibilityCollapseSheet
{
  if (![(UISheetPresentationControllerAccessibility *)self _accessibilityCanCollapseSheet])return 0; {
  [(UISheetPresentationControllerAccessibility *)self _accessibilityChangeSize:0];
  }
  return 1;
}

- (BOOL)_accessibilityCanCollapseSheet
{
  id v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)[(UISheetPresentationControllerAccessibility *)self safeValueForKey:@"_layoutInfo"];
  unint64_t v3 = [v6[0] safeIntegerForKey:@"_indexOfCurrentActiveDetent"] + 1;
  id v4 = (id)[v6[0] safeArrayForKey:@"_activeDetents"];
  BOOL v5 = v3 < [v4 count];

  objc_storeStrong(v6, 0);
  return v5;
}

- (BOOL)_accessibilityCanExpandSheet
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)[(UISheetPresentationControllerAccessibility *)self safeValueForKey:@"_layoutInfo"];
  BOOL v3 = [v4[0] safeIntegerForKey:@"_indexOfCurrentActiveDetent"] - 1 >= 0;
  objc_storeStrong(v4, 0);
  return v3;
}

- (BOOL)_accessibilityIsInverted
{
  id v3 = (id)[(UISheetPresentationControllerAccessibility *)self safeValueForKey:@"_layoutInfo"];
  char v4 = [v3 safeBoolForKey:@"_isInverted"];

  return v4 & 1;
}

- (void)_accessibilityChangeSize:(BOOL)a3
{
  id v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  id v11 = (id)[(UISheetPresentationControllerAccessibility *)self safeValueForKey:@"_layoutInfo"];
  uint64_t v3 = [v11 safeIntegerForKey:@"_indexOfCurrentActiveDetent"];
  int v4 = 1;
  uint64_t v10 = v3;
  id v9 = 0;
  if (v12) {
    int v4 = -1;
  }
  id v9 = (void *)(v10 + v4);
  id v8 = (id)[v11 safeArrayForKey:@"_activeDetents"];
  if ((uint64_t)v9 >= 0 && (unint64_t)v9 < [v8 count])
  {
    BOOL v5 = v14;
    id v6 = v11;
    v7[0] = v8;
    v7[1] = v9;
    AXPerformSafeBlock();
    objc_storeStrong(v7, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong((id *)&v5, 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v11, 0);
}

void __71__UISheetPresentationControllerAccessibility__accessibilityChangeSize___block_invoke(id *a1)
{
  v10[3] = a1;
  v10[2] = a1;
  id v2 = a1[4];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __71__UISheetPresentationControllerAccessibility__accessibilityChangeSize___block_invoke_2;
  id v7 = &unk_2650AE2F0;
  id v8 = a1[5];
  id v9 = a1[6];
  v10[1] = a1[7];
  v10[0] = a1[4];
  objc_msgSend(v2, "animateChanges:");
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v8, 0);
}

void __71__UISheetPresentationControllerAccessibility__accessibilityChangeSize___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = (id)[*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(a1 + 56)];
  id v2 = (id)[v3 safeStringForKey:@"_identifier"];
  objc_msgSend(v1, "_setSelectedDetentIdentifier:");

  [*(id *)(a1 + 48) _sendDidChangeSelectedDetentIdentifier];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end