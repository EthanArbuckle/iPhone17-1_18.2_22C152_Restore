@interface _UIPreviewPresentationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axPerformLeadingAction;
- (BOOL)_axPerformTrailingAction;
- (BOOL)_axShowMoreActions:(id)a3;
- (_UIPreviewPresentationControllerAccessibility)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (id)_axTitleForPreviewAction:(uint64_t)a1;
- (void)_accessibilityDismissPresentation;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axDismissPreview;
- (void)_axSetupContainerView;
- (void)_layoutForRevealTransition;
- (void)_presentSubActionSheetForPreviewActionGroup:(id)a3;
- (void)containerViewWillLayoutSubviews;
- (void)dealloc;
- (void)presentationTransitionWillBegin;
@end

@implementation _UIPreviewPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPreviewPresentationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  id v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIPreviewActionSheetItemView";
  objc_msgSend(location[0], "validateClass:");
  v6 = "@";
  [location[0] validateClass:@"_UIPreviewActionSheetView" hasInstanceMethod:@"actions" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"action", v6, 0);
  v7 = @"_UIPreviewPresentationController";
  v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"presentationContainerView", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_hasPreviewActions", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"leadingQuickActionView", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"trailingQuickActionView", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIPreviewQuickActionView", @"quickAction", v6, 0);
  v4 = @"UIPreviewMenuItem";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"handler", "@?", 0);
  v5 = @"UIPresentationController";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v7 isKindOfClass:v5];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_presentSubActionSheetForPreviewActionGroup:", v8, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"presentationTransitionWillBegin", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"actionSheetContainerView", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"platterView", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"previewActionSheet", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_layoutForRevealTransition", v8, 0);
  objc_storeStrong(v10, v9);
}

- (void)_axSetupContainerView
{
  id v21 = a1;
  if (a1)
  {
    id v20 = (id)[v21 safeValueForKey:@"presentationContainerView"];
    id v19 = (id)[v20 safeValueForKey:@"platterView"];
    [v19 setIsAccessibilityElement:1];
    id v7 = (id)UIKitAccessibilityLocalizedString();
    objc_msgSend(v19, "setAccessibilityLabel:");

    [v19 setAccessibilityIdentifier:@"PreviewContainerElement"];
    id v18 = (id)[MEMORY[0x263EFF980] array];
    if ([v21 safeBoolForKey:@"_hasPreviewActions"])
    {
      id v5 = objc_alloc(MEMORY[0x263F1C390]);
      id v6 = (id)UIKitAccessibilityLocalizedString();
      id v17 = (id)objc_msgSend(v5, "initWithName:target:selector:");

      [v18 addObject:v17];
      objc_storeStrong(&v17, 0);
    }
    id v16 = (id)[v21 safeValueForKey:@"leadingQuickActionView"];
    id v15 = (id)[v21 safeValueForKey:@"trailingQuickActionView"];
    if (v16)
    {
      id v14 = (id)[v16 safeValueForKey:@"quickAction"];
      id v13 = -[_UIPreviewPresentationControllerAccessibility _axTitleForPreviewAction:]((uint64_t)v21, v14);
      if ([v13 length])
      {
        id v1 = objc_alloc(MEMORY[0x263F1C390]);
        id v12 = (id)[v1 initWithName:v13 target:v21 selector:sel__axPerformLeadingAction];
        [v18 addObject:v12];
        objc_storeStrong(&v12, 0);
      }
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
    }
    if (v15)
    {
      id v11 = (id)[v15 safeValueForKey:@"quickAction"];
      id v10 = -[_UIPreviewPresentationControllerAccessibility _axTitleForPreviewAction:]((uint64_t)v21, v11);
      if ([v10 length])
      {
        id v2 = objc_alloc(MEMORY[0x263F1C390]);
        id v9 = (id)[v2 initWithName:v10 target:v21 selector:sel__axPerformTrailingAction];
        [v18 addObject:v9];
        objc_storeStrong(&v9, 0);
      }
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
    }
    id v3 = objc_alloc(MEMORY[0x263F1C390]);
    id v4 = (id)UIKitAccessibilityLocalizedString();
    id v8 = (id)objc_msgSend(v3, "initWithName:target:selector:");

    [v18 addObject:v8];
    if ([v18 count]) {
      [v19 setAccessibilityCustomActions:v18];
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
  }
}

- (id)_axTitleForPreviewAction:(uint64_t)a1
{
  uint64_t v13 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v13)
  {
    char v9 = 0;
    objc_opt_class();
    id v6 = (id)[location safeValueForKey:@"title"];
    id v8 = (id)__UIAccessibilityCastAsClass();

    id v7 = v8;
    objc_storeStrong(&v8, 0);
    id v10 = v7;
    if (![v7 length])
    {
      id v2 = (id)[location accessibilityLabel];
      id v3 = v10;
      id v10 = v2;
    }
    id v14 = v10;
    int v11 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    id v14 = 0;
    int v11 = 1;
  }
  objc_storeStrong(&location, 0);
  id v4 = v14;

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  [(_UIPreviewPresentationControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[_UIPreviewPresentationControllerAccessibility _axSetupContainerView](v4);
}

- (BOOL)_axShowMoreActions:(id)a3
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[location[0] name];
  id v4 = (id)UIKitAccessibilityLocalizedString();
  char v6 = objc_msgSend(v5, "isEqualToString:");

  if (v6)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F812A0], 0);
    id v7 = v9;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong((id *)&v7, 0);
  }
  objc_storeStrong(location, 0);
  return 1;
}

- (void)_axDismissPreview
{
}

- (BOOL)_axPerformLeadingAction
{
  id v14 = self;
  v13[1] = (id)a2;
  id v3 = (id)[(_UIPreviewPresentationControllerAccessibility *)self safeValueForKey:@"leadingQuickActionView"];
  v13[0] = (id)[v3 safeValueForKey:@"quickAction"];

  id v12 = (id)[v13[0] safeValueForKey:@"handler"];
  if (v12)
  {
    uint64_t v4 = MEMORY[0x263EF8330];
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = __72___UIPreviewPresentationControllerAccessibility__axPerformLeadingAction__block_invoke;
    id v8 = &unk_2650AED50;
    id v11 = v12;
    id v9 = v13[0];
    id v10 = v14;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return 1;
}

- (BOOL)_axPerformTrailingAction
{
  id v14 = self;
  v13[1] = (id)a2;
  id v3 = (id)[(_UIPreviewPresentationControllerAccessibility *)self safeValueForKey:@"trailingQuickActionView"];
  v13[0] = (id)[v3 safeValueForKey:@"quickAction"];

  id v12 = (id)[v13[0] safeValueForKey:@"handler"];
  if (v12)
  {
    uint64_t v4 = MEMORY[0x263EF8330];
    int v5 = -1073741824;
    int v6 = 0;
    id v7 = __73___UIPreviewPresentationControllerAccessibility__axPerformTrailingAction__block_invoke;
    id v8 = &unk_2650AED50;
    id v11 = v12;
    id v9 = v13[0];
    id v10 = v14;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return 1;
}

- (void)_accessibilityDismissPresentation
{
  v7[2] = self;
  v7[1] = (id)a2;
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  int v5 = __82___UIPreviewPresentationControllerAccessibility__accessibilityDismissPresentation__block_invoke;
  int v6 = &unk_2650ADF18;
  v7[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v7, 0);
}

- (void)_presentSubActionSheetForPreviewActionGroup:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9.receiver = v11;
  v9.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  [(_UIPreviewPresentationControllerAccessibility *)&v9 _presentSubActionSheetForPreviewActionGroup:location[0]];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = __93___UIPreviewPresentationControllerAccessibility__presentSubActionSheetForPreviewActionGroup___block_invoke;
  id v7 = &unk_2650ADF18;
  id v8 = v11;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)containerViewWillLayoutSubviews
{
  int v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  [(_UIPreviewPresentationControllerAccessibility *)&v2 containerViewWillLayoutSubviews];
  -[_UIPreviewPresentationControllerAccessibility _axSetupContainerView](v4);
}

- (void)_layoutForRevealTransition
{
  int v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  [(_UIPreviewPresentationControllerAccessibility *)&v2 _layoutForRevealTransition];
  -[_UIPreviewPresentationControllerAccessibility _axSetupContainerView](v4);
}

- (_UIPreviewPresentationControllerAccessibility)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  uint64_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  int v4 = v13;
  uint64_t v13 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  uint64_t v13 = [(_UIPreviewPresentationControllerAccessibility *)&v9 initWithPresentedViewController:location[0] presentingViewController:v11];
  id v10 = v13;
  id v7 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:v13 selector:sel__accessibilityDismissPresentation name:@"accessibilityDismissActionSheet" object:0];

  id v8 = v10;
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

- (void)presentationTransitionWillBegin
{
  int v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  [(_UIPreviewPresentationControllerAccessibility *)&v3 presentationTransitionWillBegin];
  if (UIAccessibilityIsSwitchControlRunning())
  {
    id v2 = (id)[(_UIPreviewPresentationControllerAccessibility *)v5 safeValueForKey:@"actionSheetContainerView"];
    [v2 setAccessibilityViewIsModal:1];
  }
}

- (void)dealloc
{
  int v5 = self;
  SEL v4 = a2;
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  [(_UIPreviewPresentationControllerAccessibility *)&v3 dealloc];
}

@end