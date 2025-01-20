@interface UITransitionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (id)_accessibilityDimmingView;
- (id)_accessibilityHitTestingObscuredScreenAllowedViews;
- (id)_accessibilityObscuredScreenAllowedViews;
- (id)_accessibilityPresentationController;
- (id)_accessibilityRetrieveDelegate;
- (id)_axPresentationController;
- (id)axAdditionalElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetPresentationController:(uint64_t)a1;
- (void)_didCompleteTransition:(BOOL)a3;
@end

@implementation UITransitionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITransitionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axPresentationController
{
  if (a1) {
    id v2 = (id)__UIAccessibilityGetAssociatedNonRetainedObject();
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_axSetPresentationController:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedNonRetainedObject();
  }
  objc_storeStrong(&location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v12 = location;
  id v11 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = @"UITransitionView";
  v5 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v10 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", @"UITransitionView", @"_delegate");
  [location[0] validateClass:@"_UIAlertControllerPresentationController" hasInstanceVariable:@"_dimmingView" withType:"UIView"];
  v6 = @"UIPresentationController";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UISearchPresentationController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIDimmingView", @"passthroughViews", "@", 0);
  [location[0] validateClass:@"UIGestureRecognizer" hasInstanceVariable:@"_targets" withType:"NSMutableArray"];
  v4 = @"UIGestureRecognizerTarget";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"target", v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_presentationControllerToNotifyOnLayoutSubviews", v10, 0);
  [location[0] validateClass:@"_UIPageSheetPresentationController"];
  v9 = @"UISheetPresentationController";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v7 = @"_UISheetLayoutInfo";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_layoutInfo", v10, 0);
  [location[0] validateClass:v9 isKindOfClass:v6];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_shouldDismiss", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"delegate", v10, 0);
  v8 = "q";
  [location[0] validateClass:v7 hasInstanceMethod:@"_indexOfCurrentActiveDetent" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UISheetPresentationControllerDetent", @"_type", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_childSheetPresentationController", v10, 0);
  objc_storeStrong(v12, v11);
}

- (id)_accessibilityRetrieveDelegate
{
  if (a1) {
    id v2 = (id)[a1 safeValueForKey:@"delegate"];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_didCompleteTransition:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UITransitionViewAccessibility;
  [(UITransitionViewAccessibility *)&v3 _didCompleteTransition:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (id)_accessibilityDimmingView
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v15 = a1;
  if (a1)
  {
    objc_opt_class();
    id v7 = (id)__UIAccessibilityCastAsClass();
    id v14 = (id)[v7 subviews];

    memset(__b, 0, sizeof(__b));
    id obj = v14;
    uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
    if (v9)
    {
      uint64_t v4 = *(void *)__b[2];
      uint64_t v5 = 0;
      unint64_t v6 = v9;
      while (1)
      {
        uint64_t v3 = v5;
        if (*(void *)__b[2] != v4) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(id *)(__b[1] + 8 * v5);
        NSClassFromString(&cfstr_Uidimmingview.isa);
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v13 _accessibilityViewIsVisible]) {
          break;
        }
        ++v5;
        if (v3 + 1 >= v6)
        {
          uint64_t v5 = 0;
          unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
          if (!v6) {
            goto LABEL_12;
          }
        }
      }
      id v16 = v13;
      int v11 = 1;
    }
    else
    {
LABEL_12:
      int v11 = 0;
    }

    if (!v11)
    {
      id location = -[UITransitionViewAccessibility _accessibilityRetrieveDelegate](v15);
      if (objc_opt_respondsToSelector()) {
        id v16 = (id)[location safeValueForKey:@"_dimmingView"];
      }
      else {
        id v16 = 0;
      }
      int v11 = 1;
      objc_storeStrong(&location, 0);
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    id v16 = 0;
  }
  v1 = v16;

  return v1;
}

- (id)_accessibilityPresentationController
{
  if (a1) {
    id v2 = (id)[a1 safeValueForKey:@"_presentationControllerToNotifyOnLayoutSubviews"];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  v38 = self;
  v37[1] = (id)a2;
  v37[0] = -[UITransitionViewAccessibility _axPresentationController]((uint64_t)self);
  id v18 = (id)[v37[0] presentingViewController];
  id v36 = (id)[v18 view];

  id v35 = (id)objc_opt_new();
  if (v36)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    [v36 accessibilityFrame];
    *(void *)&long long v33 = v2;
    *((void *)&v33 + 1) = v3;
    *(void *)&long long v34 = v4;
    *((void *)&v34 + 1) = v5;
    id v15 = (id)[(UITransitionViewAccessibility *)v38 superview];
    id v14 = (id)[v15 _accessibilitySubviews];
    id v13 = (id)[v14 reverseObjectEnumerator];
    id v32 = (id)[v13 allObjects];

    id v16 = v32;
    uint64_t v23 = MEMORY[0x263EF8330];
    int v24 = -1073741824;
    int v25 = 0;
    v26 = __73__UITransitionViewAccessibility__accessibilityObscuredScreenAllowedViews__block_invoke;
    v27 = &unk_2650AF790;
    v28 = v38;
    id v29 = v36;
    long long v30 = v33;
    long long v31 = v34;
    id v17 = (id)objc_msgSend(v16, "ax_filteredArrayUsingBlock:", &v23);
    unint64_t v6 = (void *)[v17 mutableCopy];
    id v7 = v35;
    id v35 = v6;

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong(&v32, 0);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v21 = 0;
    objc_opt_class();
    id v12 = (id)[v37[0] safeValueForKey:@"_childSheetPresentationController"];
    id v20 = (id)__UIAccessibilityCastAsSafeCategory();

    id v19 = v20;
    objc_storeStrong(&v20, 0);
    id v22 = v19;
    if (v19 && ([v22 _accessibilityPresentationControllerModalizes] & 1) == 0)
    {
      id v10 = v35;
      id v11 = (id)[v22 containerView];
      objc_msgSend(v10, "axSafelyAddObject:");
    }
    objc_storeStrong(&v22, 0);
  }
  id v9 = v35;
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(v37, 0);

  return v9;
}

BOOL __73__UITransitionViewAccessibility__accessibilityObscuredScreenAllowedViews__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0] == *(id *)(a1 + 32))
  {
    *a4 = 1;
    BOOL v13 = 0;
  }
  else if (location[0] != *(id *)(a1 + 40) && ([location[0] _accessibilityViewIsVisible] & 1) != 0)
  {
    [location[0] accessibilityFrame];
    rect2.origin.x = v4;
    rect2.origin.y = v5;
    rect2.size.width = v6;
    rect2.size.height = v7;
    BOOL v13 = !CGRectIntersectsRect(*(CGRect *)(a1 + 48), rect2);
  }
  else
  {
    BOOL v13 = 0;
  }
  objc_storeStrong(location, 0);
  return v13;
}

- (id)_accessibilityHitTestingObscuredScreenAllowedViews
{
  CGFloat v5 = self;
  location[1] = (id)a2;
  location[0] = -[UITransitionViewAccessibility _accessibilityDimmingView](self);
  NSClassFromString(&cfstr_Uidimmingview.isa);
  if (objc_opt_isKindOfClass()) {
    id v6 = (id)[location[0] safeValueForKey:@"passthroughViews"];
  }
  else {
    id v6 = [(UITransitionViewAccessibility *)v5 _accessibilityObscuredScreenAllowedViews];
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v6;

  return v2;
}

- (BOOL)accessibilityViewIsModal
{
  id v19 = self;
  v18[1] = (id)a2;
  v18[0] = -[UITransitionViewAccessibility _accessibilityRetrieveDelegate](self);
  NSClassFromString(&cfstr_Uisearchpresen_0.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v8 = (id)[v18[0] safeValueForKey:@"presentedViewController"];
    id v7 = (id)__UIAccessibilityCastAsClass();
    id v2 = (id)[v7 searchResultsController];
    BOOL v9 = v2 != 0;

    if (!v9)
    {
      char v20 = 0;
      int v17 = 1;
      goto LABEL_21;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v20 = 0;
      int v17 = 1;
      goto LABEL_21;
    }
    id v5 = (id)[(UITransitionViewAccessibility *)v19 accessibilityIdentifier];
    char v6 = [v5 isEqualToString:@"UIColorPickerView"];

    if (v6)
    {
      char v20 = 1;
      int v17 = 1;
      goto LABEL_21;
    }
  }
  char v15 = 0;
  objc_opt_class();
  id v4 = -[UITransitionViewAccessibility _axPresentationController]((uint64_t)v19);
  char v12 = 0;
  if (!v4)
  {
    id v13 = -[UITransitionViewAccessibility _accessibilityPresentationController](v19);
    char v12 = 1;
  }
  id v14 = (id)__UIAccessibilityCastAsSafeCategory();
  if (v12) {

  }
  id v11 = v14;
  objc_storeStrong(&v14, 0);
  id v16 = v11;
  if (!v11 || ([v16 _accessibilityPresentationControllerModalizes] & 1) != 0)
  {
    id v10 = (id)[(UITransitionViewAccessibility *)v19 storedAccessibilityViewIsModal];
    if (v10) {
      char v20 = [v10 BOOLValue] & 1;
    }
    else {
      char v20 = 1;
    }
    int v17 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    char v20 = 0;
    int v17 = 1;
  }
  objc_storeStrong(&v16, 0);
LABEL_21:
  objc_storeStrong(v18, 0);
  return v20 & 1;
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v31 = self;
  v30[1] = (id)a2;
  char v29 = 0;
  objc_opt_class();
  id v28 = (id)__UIAccessibilityCastAsClass();
  id v27 = v28;
  objc_storeStrong(&v28, 0);
  v30[0] = v27;
  long long v34 = (dispatch_once_t *)&accessibilityPerformEscape_onceToken;
  id v33 = 0;
  objc_storeStrong(&v33, &__block_literal_global_50);
  if (*v34 != -1) {
    dispatch_once(v34, v33);
  }
  objc_storeStrong(&v33, 0);
  memset(__b, 0, sizeof(__b));
  id obj = (id)[v30[0] gestureRecognizers];
  uint64_t v16 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
  if (v16)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    unint64_t v14 = v16;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      id v26 = *(id *)(__b[1] + 8 * v13);
      char v23 = 0;
      objc_opt_class();
      id v10 = (id)[v26 safeValueForKey:@"_targets"];
      id v22 = (id)__UIAccessibilityCastAsClass();

      if (v23) {
        abort();
      }
      id v21 = v22;
      objc_storeStrong(&v22, 0);
      id v24 = v21;
      memset(v19, 0, sizeof(v19));
      id v8 = v21;
      uint64_t v9 = [v8 countByEnumeratingWithState:v19 objects:v35 count:16];
      if (v9)
      {
        uint64_t v5 = *(void *)v19[2];
        uint64_t v6 = 0;
        unint64_t v7 = v9;
        while (1)
        {
          uint64_t v4 = v6;
          if (*(void *)v19[2] != v5) {
            objc_enumerationMutation(v8);
          }
          id v20 = *(id *)(v19[1] + 8 * v6);
          id v18 = (id)[v20 safeValueForKey:@"target"];
          if (objc_opt_isKindOfClass())
          {
            char v32 = [v18 accessibilityPerformEscape] & 1;
            int v17 = 1;
          }
          else
          {
            int v17 = 0;
          }
          objc_storeStrong(&v18, 0);
          if (v17) {
            break;
          }
          ++v6;
          if (v4 + 1 >= v7)
          {
            uint64_t v6 = 0;
            unint64_t v7 = [v8 countByEnumeratingWithState:v19 objects:v35 count:16];
            if (!v7) {
              goto LABEL_19;
            }
          }
        }
      }
      else
      {
LABEL_19:
        int v17 = 0;
      }

      if (!v17) {
        int v17 = 0;
      }
      objc_storeStrong(&v24, 0);
      if (v17) {
        break;
      }
      ++v13;
      if (v11 + 1 >= v14)
      {
        uint64_t v13 = 0;
        unint64_t v14 = [obj countByEnumeratingWithState:__b objects:v36 count:16];
        if (!v14) {
          goto LABEL_25;
        }
      }
    }
  }
  else
  {
LABEL_25:
    int v17 = 0;
  }

  if (!v17)
  {
    id v3 = -[UITransitionViewAccessibility _accessibilityDimmingView](v31);
    char v32 = [v3 accessibilityActivate] & 1;
  }
  objc_storeStrong(v30, 0);
  return v32 & 1;
}

Class __59__UITransitionViewAccessibility_accessibilityPerformEscape__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Uipreviewprese_3.isa);
  accessibilityPerformEscape_UIPreviewPresentationControllerClass = (uint64_t)result;
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  unint64_t v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UITransitionViewAccessibility;
  [(UITransitionViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v2 = -[UITransitionViewAccessibility _accessibilityPresentationController](v7);
  [v2 _accessibilityLoadAccessibilityInformation];

  id v3 = v7;
  id v4 = [(UITransitionViewAccessibility *)v7 axAdditionalElements];
  -[UITransitionViewAccessibility _accessibilitySetAdditionalElements:](v3, "_accessibilitySetAdditionalElements:");
}

- (id)axAdditionalElements
{
  v39 = self;
  v38[1] = (id)a2;
  v38[0] = (id)[MEMORY[0x263EFF980] array];
  id v9 = v38[0];
  v37.receiver = v39;
  v37.super_class = (Class)UITransitionViewAccessibility;
  id v10 = [(UITransitionViewAccessibility *)&v37 accessibilityElements];
  objc_msgSend(v9, "axSafelyAddObjectsFromArray:");

  id v11 = -[UITransitionViewAccessibility _accessibilityPresentationController](v39);
  NSClassFromString(&cfstr_Uipagesheetpre.isa);
  char v35 = 0;
  char v33 = 0;
  char v12 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v36 = -[UITransitionViewAccessibility _accessibilityPresentationController](v39);
    char v35 = 1;
    id v34 = (id)[v36 safeValueForKey:@"delegate"];
    char v33 = 1;
    char v12 = [v34 _accessibilityShouldAttemptToAddDismissalElement];
  }
  if (v33) {

  }
  if (v35) {
  if (v12)
  }
  {
    id v2 = objc_alloc(MEMORY[0x263F1C3A8]);
    id v32 = (id)[v2 initWithAccessibilityContainer:v39];
    objc_initWeak(&location, v39);
    id v8 = v32;
    uint64_t v25 = MEMORY[0x263EF8330];
    int v26 = -1073741824;
    int v27 = 0;
    id v28 = __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke;
    char v29 = &unk_2650ADF60;
    objc_copyWeak(&v30, &location);
    [v8 _setIsAccessibilityElementBlock:&v25];
    id v7 = v32;
    uint64_t v19 = MEMORY[0x263EF8330];
    int v20 = -1073741824;
    int v21 = 0;
    id v22 = __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke_2;
    char v23 = &unk_2650AE230;
    objc_copyWeak(&v24, &location);
    [v7 _setAccessibilityFrameBlock:&v19];
    id v6 = v32;
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    uint64_t v16 = __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke_3;
    int v17 = &unk_2650ADF60;
    objc_copyWeak(&v18, &location);
    [v6 _setAccessibilityActivateBlock:&v13];
    [v32 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    id v5 = accessibilityLocalizedString(@"popover.view.dimiss.region.hint");
    objc_msgSend(v32, "setAccessibilityLabel:");

    [v38[0] axSafelyAddObject:v32];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    objc_storeStrong(&v32, 0);
  }
  id v4 = v38[0];
  objc_storeStrong(v38, 0);

  return v4;
}

BOOL __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke(id *a1)
{
  v9[2] = a1;
  v9[1] = a1;
  v9[0] = objc_loadWeakRetained(a1 + 4);
  id v4 = -[UITransitionViewAccessibility _accessibilityPresentationController](v9[0]);
  id v8 = (id)[v4 safeValueForKey:@"_layoutInfo"];

  id v7 = (id)[v8 safeArrayForKey:@"_detents"];
  uint64_t v6 = [v8 safeIntegerForKey:@"_indexOfCurrentActiveDetent"];
  if (v6 < 0 || v6 >= (unint64_t)[v7 count])
  {
    BOOL v10 = 0;
  }
  else
  {
    id location = (id)[v7 objectAtIndex:v6];
    id v2 = -[UITransitionViewAccessibility _accessibilityPresentationController](v9[0]);
    BOOL v3 = 0;
    if ([v2 safeBoolForKey:@"_shouldDismiss"]) {
      BOOL v3 = [location safeIntegerForKey:@"_type"] == 1;
    }
    BOOL v10 = v3;

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  return v10;
}

double __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke_2(id *a1)
{
  v16[2] = a1;
  v16[1] = a1;
  v16[0] = objc_loadWeakRetained(a1 + 4);
  char v14 = 0;
  objc_opt_class();
  id v7 = -[UITransitionViewAccessibility _accessibilityPresentationController](v16[0]);
  id v6 = (id)[v7 safeValueForKey:@"dropShadowView"];
  id v13 = (id)__UIAccessibilityCastAsClass();

  id v12 = v13;
  objc_storeStrong(&v13, 0);
  id v15 = v12;
  char v10 = 0;
  objc_opt_class();
  id v9 = (id)__UIAccessibilityCastAsClass();
  id v8 = v9;
  objc_storeStrong(&v9, 0);
  id v11 = v8;
  [v8 bounds];
  [v15 bounds];
  UIAccessibilityFrameForBounds();
  double v17 = v1;
  uint64_t v18 = v2;
  uint64_t v19 = v3;
  uint64_t v20 = v4;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  return v17;
}

uint64_t __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke_3(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  v2[0] = objc_loadWeakRetained(a1 + 4);
  [v2[0] accessibilityPerformEscape];
  objc_storeStrong(v2, 0);
  return 1;
}

@end