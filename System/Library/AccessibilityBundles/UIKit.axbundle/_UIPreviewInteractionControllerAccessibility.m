@interface _UIPreviewInteractionControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityPerformLeadingAction;
- (BOOL)_accessibilityPerformTrailingAction;
- (BOOL)_accessibilityShowMoreActions;
- (BOOL)_preparePreviewViewControllerPresentationFromPreviewInteraction:(id)a3;
- (id)_accessibilityCustomActionsFromPresentedViewController:(uint64_t)a1;
- (uint64_t)_axPerformPreviewAction:(void *)a1;
- (void)_accessibilityDismissPresentation;
- (void)_accessibilityTeardownPresentationState;
- (void)_dismissPreviewViewControllerIfNeededWithCompletion:(id)a3;
- (void)commitInteractivePreview;
@end

@implementation _UIPreviewInteractionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPreviewInteractionController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = "@";
  v4 = @"_UIPreviewInteractionController";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", 0);
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_dismissPreviewViewControllerIfNeededWithCompletion:", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"commitInteractivePreview", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"previewInteraction", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_dismissPreviewViewControllerIfNeeded", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"currentPresentationController", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"previewActionsController", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIPreviewActionsController", @"previewActionsView", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"currentPreviewingContext", v6, 0);
  v5 = @"_UIViewControllerPreviewingContext";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"sourceView", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIPreviewPresentationController2", @"contentPlatterView", v6, 0);
  objc_storeStrong(v8, v7);
}

- (id)_accessibilityCustomActionsFromPresentedViewController:(uint64_t)a1
{
  uint64_t v31 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v31)
  {
    id v28 = (id)[MEMORY[0x263EFF980] array];
    id v14 = objc_alloc(MEMORY[0x263F1C390]);
    id v15 = (id)UIKitAccessibilityLocalizedString();
    id v27 = (id)objc_msgSend(v14, "initWithName:target:selector:");

    [v28 addObject:v27];
    id v26 = (id)[location leadingPreviewAction];
    if (v26)
    {
      id v13 = (id)[v26 accessibilityLabel];
      char v23 = 0;
      if (v13)
      {
        id v2 = v13;
      }
      else
      {
        id v24 = (id)[v26 title];
        char v23 = 1;
        id v2 = v24;
      }
      id v25 = v2;
      if (v23) {

      }
      id v3 = objc_alloc(MEMORY[0x263F1C390]);
      id v22 = (id)[v3 initWithName:v25 target:v31 selector:sel__accessibilityPerformLeadingAction];
      [v28 addObject:v22];
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v25, 0);
    }
    id v21 = (id)[location trailingPreviewAction];
    if (v21)
    {
      id v12 = (id)[v21 accessibilityLabel];
      char v18 = 0;
      if (v12)
      {
        id v4 = v12;
      }
      else
      {
        id v19 = (id)[v21 title];
        char v18 = 1;
        id v4 = v19;
      }
      id v20 = v4;
      if (v18) {

      }
      if ([v20 length])
      {
        id v5 = objc_alloc(MEMORY[0x263F1C390]);
        id v17 = (id)[v5 initWithName:v20 target:v31 selector:sel__accessibilityPerformTrailingAction];
        [v28 addObject:v17];
        objc_storeStrong(&v17, 0);
      }
      objc_storeStrong(&v20, 0);
    }
    id v10 = (id)[location previewActionItems];
    BOOL v11 = [v10 count] == 0;

    if (!v11)
    {
      id v8 = objc_alloc(MEMORY[0x263F1C390]);
      id v9 = (id)UIKitAccessibilityLocalizedString();
      id v16 = (id)objc_msgSend(v8, "initWithName:target:selector:");

      [v28 addObject:v16];
      objc_storeStrong(&v16, 0);
    }
    id v32 = v28;
    int v29 = 1;
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  else
  {
    id v32 = 0;
    int v29 = 1;
  }
  objc_storeStrong(&location, 0);
  v6 = v32;

  return v6;
}

- (BOOL)_preparePreviewViewControllerPresentationFromPreviewInteraction:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = (id)[(_UIPreviewInteractionControllerAccessibility *)v17 safeValueForKey:@"currentPreviewingContext"];
  id v14 = (id)[v15 safeValueForKey:@"sourceView"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  char v12 = 0;
  objc_opt_class();
  id v11 = (id)__UIAccessibilityCastAsClass();
  id v10 = v11;
  objc_storeStrong(&v11, 0);
  id v13 = v10;
  if ([v10 isEditing])
  {
    v9.receiver = v17;
    v9.super_class = (Class)_UIPreviewInteractionControllerAccessibility;
    char v18 = [(_UIPreviewInteractionControllerAccessibility *)&v9 _preparePreviewViewControllerPresentationFromPreviewInteraction:location[0]];
    int v8 = 1;
  }
  else
  {
    int v8 = 0;
  }
  objc_storeStrong(&v13, 0);
  if (!v8)
  {
LABEL_6:
    UIAccessibilityPostNotification(*MEMORY[0x263F812A8], MEMORY[0x263EFFA88]);
    char v7 = 0;
    v6.receiver = v17;
    v6.super_class = (Class)_UIPreviewInteractionControllerAccessibility;
    char v7 = [(_UIPreviewInteractionControllerAccessibility *)&v6 _preparePreviewViewControllerPresentationFromPreviewInteraction:location[0]];
    if (v7)
    {
      id v4 = (id)[MEMORY[0x263F08A00] defaultCenter];
      objc_msgSend(v4, "addObserver:selector:name:object:", v17, sel__accessibilityDismissPresentation, @"accessibilityDismissActionSheet");

      id v5 = v17;
      AXPerformBlockOnMainThreadAfterDelay();
      objc_storeStrong((id *)&v5, 0);
    }
    else
    {
      UIAccessibilityPostNotification(*MEMORY[0x263F812A8], MEMORY[0x263EFFA80]);
    }
    char v18 = v7 & 1;
    int v8 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (uint64_t)_axPerformPreviewAction:(void *)a1
{
  id v21 = a1;
  int v20 = a2;
  if (a1)
  {
    char v18 = 0;
    objc_opt_class();
    id v4 = (id)[v21 safeValueForKey:@"currentPresentationController"];
    id v17 = (id)__UIAccessibilityCastAsClass();

    id v16 = v17;
    objc_storeStrong(&v17, 0);
    id v19 = v16;
    id v15 = (id)[v16 presentedViewController];
    char v12 = 0;
    char v10 = 0;
    if (v20)
    {
      id v11 = (id)[v15 trailingPreviewAction];
      char v10 = 1;
      id v2 = v11;
    }
    else
    {
      id v13 = (id)[v15 leadingPreviewAction];
      char v12 = 1;
      id v2 = v13;
    }
    id v14 = v2;
    if (v10) {

    }
    if (v12) {
    id v9 = (id)[v14 handler];
    }
    if (v9)
    {
      id v8 = v9;
      id v5 = v14;
      id v6 = v15;
      id v7 = v21;
      AXPerformSafeBlock();
      char v22 = 1;
      objc_storeStrong(&v7, 0);
      objc_storeStrong(&v6, 0);
      objc_storeStrong(&v5, 0);
      objc_storeStrong(&v8, 0);
    }
    else
    {
      char v22 = 0;
    }
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    char v22 = 0;
  }
  return v22 & 1;
}

- (BOOL)_accessibilityPerformTrailingAction
{
  return -[_UIPreviewInteractionControllerAccessibility _axPerformPreviewAction:](self, 1) & 1;
}

- (BOOL)_accessibilityPerformLeadingAction
{
  return -[_UIPreviewInteractionControllerAccessibility _axPerformPreviewAction:](self, 0) & 1;
}

- (BOOL)_accessibilityShowMoreActions
{
  id v9 = self;
  v8[1] = (id)a2;
  UIAccessibilityPostNotification(*MEMORY[0x263F812A0], 0);
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __77___UIPreviewInteractionControllerAccessibility__accessibilityShowMoreActions__block_invoke;
  id v7 = &unk_2650ADF18;
  v8[0] = v9;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(v8, 0);
  return 1;
}

- (void)_accessibilityDismissPresentation
{
  id v8 = self;
  SEL v7 = a2;
  char v6 = 0;
  objc_opt_class();
  id v2 = (id)[(_UIPreviewInteractionControllerAccessibility *)v8 safeValueForKey:@"previewInteraction"];
  id v5 = (id)__UIAccessibilityCastAsClass();

  id v4 = v5;
  objc_storeStrong(&v5, 0);
  [v4 cancelInteraction];

  uint64_t v3 = v8;
  AXPerformSafeBlock();
  -[_UIPreviewInteractionControllerAccessibility _accessibilityTeardownPresentationState]((uint64_t)v8);
  objc_storeStrong((id *)&v3, 0);
}

- (void)_accessibilityTeardownPresentationState
{
  if (a1)
  {
    id v1 = (id)[MEMORY[0x263F08A00] defaultCenter];
    [v1 removeObserver:a1 name:@"accessibilityDismissActionSheet" object:0];

    UIAccessibilityPostNotification(*MEMORY[0x263F812A8], MEMORY[0x263EFFA80]);
  }
}

- (void)_dismissPreviewViewControllerIfNeededWithCompletion:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIPreviewInteractionControllerAccessibility;
  [(_UIPreviewInteractionControllerAccessibility *)&v3 _dismissPreviewViewControllerIfNeededWithCompletion:location[0]];
  -[_UIPreviewInteractionControllerAccessibility _accessibilityTeardownPresentationState]((uint64_t)v5);
  objc_storeStrong(location, 0);
}

- (void)commitInteractivePreview
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIPreviewInteractionControllerAccessibility;
  [(_UIPreviewInteractionControllerAccessibility *)&v2 commitInteractivePreview];
  -[_UIPreviewInteractionControllerAccessibility _accessibilityTeardownPresentationState]((uint64_t)v4);
}

@end