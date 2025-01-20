@interface UINavigationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanPerformEscapeAction;
- (BOOL)_accessibilityNavigationControllerShouldSendScreenChange;
- (BOOL)accessibilityPerformEscape;
- (id)_accessibilityOutermostNavigationController;
- (id)_accessibilitySpeakThisViewController;
- (uint64_t)_accessibilityPostScreenChangeForAppearingView:(void *)a1;
- (uint64_t)_accessibilityVoiceOverFocusIsInView:(uint64_t)a1;
- (void)transitionConductor:(id)a3 beginPinningInputViewsForTransitionFromViewController:(id)a4 toViewController:(id)a5 forTransitionType:(int)a6;
- (void)transitionConductor:(id)a3 didEndTransitionFromView:(id)a4 toView:(id)a5;
@end

@implementation UINavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UINavigationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = "@";
  [location[0] validateClass:@"UIViewController" hasInstanceMethod:@"navigationItem" withFullSignature:0];
  v4 = @"UINavigationController";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UINavigationItem", @"_titleView", v5, 0);
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"transitionConductor:beginPinningInputViewsForTransitionFromViewController:toViewController:forTransitionType:", v5, v5, v5, "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"transitionConductor:didEndTransitionFromView:toView:", v3, v5, v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_isNestedNavigationController", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"navigationTransitionView", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"disappearingViewController", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"topViewController", v5, 0);
  objc_storeStrong(v7, v6);
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  v7 = self;
  SEL v6 = a2;
  id v3 = (id)[(UINavigationControllerAccessibility *)self safeValueForKey:@"visibleViewController"];
  char v4 = [v3 _accessibilityCanPerformEscapeAction];

  if (v4) {
    return 1;
  }
  v5.receiver = v7;
  v5.super_class = (Class)UINavigationControllerAccessibility;
  return [(UINavigationControllerAccessibility *)&v5 _accessibilityCanPerformEscapeAction];
}

- (BOOL)accessibilityPerformEscape
{
  v7 = self;
  SEL v6 = a2;
  id v3 = (id)[(UINavigationControllerAccessibility *)self safeValueForKey:@"visibleViewController"];
  char v4 = [v3 accessibilityPerformEscape];

  if (v4) {
    return 1;
  }
  v5.receiver = v7;
  v5.super_class = (Class)UINavigationControllerAccessibility;
  return [(UINavigationControllerAccessibility *)&v5 accessibilityPerformEscape];
}

- (id)_accessibilitySpeakThisViewController
{
  v9 = self;
  SEL v8 = a2;
  char v7 = 0;
  objc_opt_class();
  id v4 = (id)[(UINavigationControllerAccessibility *)v9 topViewController];
  id v6 = (id)__UIAccessibilityCastAsSafeCategory();

  id v5 = v6;
  objc_storeStrong(&v6, 0);
  id v3 = (id)[v5 _accessibilitySpeakThisViewController];

  return v3;
}

- (id)_accessibilityOutermostNavigationController
{
  id v6 = a1;
  if (a1)
  {
    id v5 = v6;
    while (([v5 safeBoolForKey:@"_isNestedNavigationController"] & 1) != 0)
    {
      id v1 = (id)[v5 navigationController];
      id v2 = v5;
      id v5 = v1;
    }
    id v7 = v5;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    id v7 = 0;
  }
  id v3 = v7;

  return v3;
}

- (uint64_t)_accessibilityVoiceOverFocusIsInView:(uint64_t)a1
{
  uint64_t v18 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v18)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    int v13 = 0x20000000;
    int v14 = 32;
    char v15 = 0;
    if (UIAccessibilityIsVoiceOverRunning())
    {
      id v10 = UIAccessibilityFocusedElement((UIAccessibilityAssistiveTechnologyIdentifier)*MEMORY[0x263F1CE28]);
      id v3 = v10;
      uint64_t v4 = MEMORY[0x263EF8330];
      int v5 = -1073741824;
      int v6 = 0;
      id v7 = __76__UINavigationControllerAccessibility__accessibilityVoiceOverFocusIsInView___block_invoke;
      SEL v8 = &unk_2650AEFE8;
      v9[0] = location;
      v9[1] = &v11;
      [v3 accessibilityEnumerateAncestorsUsingBlock:&v4];
      objc_storeStrong(v9, 0);
      objc_storeStrong(&v10, 0);
    }
    char v19 = v12[3] & 1;
    int v16 = 1;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    char v19 = 0;
    int v16 = 1;
  }
  objc_storeStrong(&location, 0);
  return v19 & 1;
}

void __76__UINavigationControllerAccessibility__accessibilityVoiceOverFocusIsInView___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0] == *(id *)(a1 + 32))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  objc_storeStrong(location, 0);
}

- (uint64_t)_accessibilityPostScreenChangeForAppearingView:(void *)a1
{
  v13[3] = *MEMORY[0x263EF8340];
  id v10 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v10)
  {
    id v7 = (id)[location _accessibilityElementToFocusForAppearanceScreenChange];
    if (v7)
    {
      v12[0] = *MEMORY[0x263F21A78];
      v13[0] = MEMORY[0x263EFFA88];
      v12[1] = *MEMORY[0x263F21AB8];
      id v3 = NSNumber;
      id v5 = -[UINavigationControllerAccessibility _accessibilityOutermostNavigationController](v10);
      id v4 = (id)objc_msgSend(v3, "numberWithUnsignedLongLong:");
      v13[1] = v4;
      v12[2] = *MEMORY[0x263F81300];
      v13[2] = v7;
      id argument = (id)[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

      UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], argument);
      char v11 = 1;
      int v8 = 1;
      objc_storeStrong(&argument, 0);
    }
    else
    {
      char v11 = 0;
      int v8 = 1;
    }
    objc_storeStrong(&v7, 0);
  }
  else
  {
    char v11 = 0;
    int v8 = 1;
  }
  objc_storeStrong(&location, 0);
  return v11 & 1;
}

- (void)transitionConductor:(id)a3 beginPinningInputViewsForTransitionFromViewController:(id)a4 toViewController:(id)a5 forTransitionType:(int)a6
{
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  unsigned int v23 = a6;
  id v6 = (id)[(UINavigationControllerAccessibility *)v27 safeValueForKey:@"navigationTransitionView"];
  BOOL v12 = v6 != 0;

  BOOL v22 = v12;
  char v21 = 0;
  if (v12)
  {
    id v8 = (id)[(UINavigationControllerAccessibility *)v27 safeValueForKey:@"disappearingViewController"];
    id v20 = (id)[v8 safeUIViewForKey:@"view"];

    char v21 = -[UINavigationControllerAccessibility _accessibilityVoiceOverFocusIsInView:]((uint64_t)v27, v20) & 1;
    objc_storeStrong(&v20, 0);
  }
  v19.receiver = v27;
  v19.super_class = (Class)UINavigationControllerAccessibility;
  [(UINavigationControllerAccessibility *)&v19 transitionConductor:location[0] beginPinningInputViewsForTransitionFromViewController:v25 toViewController:v24 forTransitionType:v23];
  if (v22 && (v21 & 1) != 0)
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    int v16 = __148__UINavigationControllerAccessibility_transitionConductor_beginPinningInputViewsForTransitionFromViewController_toViewController_forTransitionType___block_invoke;
    v17 = &unk_2650ADF18;
    uint64_t v18 = v27;
    dispatch_async(queue, &v13);

    objc_storeStrong((id *)&v18, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

void __148__UINavigationControllerAccessibility_transitionConductor_beginPinningInputViewsForTransitionFromViewController_toViewController_forTransitionType___block_invoke(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = (id)[a1[4] safeValueForKey:@"topViewController"];
  id v2 = (id)[v3[0] safeValueForKey:@"view"];
  -[UINavigationControllerAccessibility _accessibilityPostScreenChangeForAppearingView:](a1[4], v2);
  objc_storeStrong(&v2, 0);
  objc_storeStrong(v3, 0);
}

- (void)transitionConductor:(id)a3 didEndTransitionFromView:(id)a4 toView:(id)a5
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  v16.receiver = v20;
  v16.super_class = (Class)UINavigationControllerAccessibility;
  [(UINavigationControllerAccessibility *)&v16 transitionConductor:location[0] didEndTransitionFromView:v18 toView:v17];
  id v5 = (id)[(UINavigationControllerAccessibility *)v20 safeValueForKey:@"navigationTransitionView"];
  BOOL v10 = v5 != 0;

  BOOL v15 = v10;
  if (v17 && v15)
  {
    id v7 = (id)[(UINavigationControllerAccessibility *)v20 viewControllers];
    id v14 = (id)[v7 lastObject];

    char v13 = 0;
    if (objc_opt_respondsToSelector()) {
      char v13 = [v14 _accessibilityHandleNavigationControllerDidEndTransition] & 1;
    }
    if ((v13 & 1) == 0)
    {
      char v12 = 0;
      if (-[UINavigationControllerAccessibility _accessibilityVoiceOverFocusIsInView:]((uint64_t)v20, v18))
      {
        id v6 = (id)[v17 _accessibilitySortedElementsWithin];
        id v11 = (id)[v6 firstObject];

        char v12 = -[UINavigationControllerAccessibility _accessibilityPostScreenChangeForAppearingView:](v20, v11) & 1;
        objc_storeStrong(&v11, 0);
      }
      if ((v12 & 1) == 0
        && (-[UINavigationControllerAccessibility _accessibilityVoiceOverFocusIsInView:]((uint64_t)v20, v17) & 1) == 0)
      {
        UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], (id)*MEMORY[0x263F21A78]);
      }
    }
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityNavigationControllerShouldSendScreenChange
{
  v9 = self;
  SEL v8 = a2;
  char v7 = 0;
  objc_opt_class();
  id v6 = (id)__UIAccessibilityCastAsClass();
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  id v3 = (id)[v5 view];
  int v4 = [v3 isHiddenOrHasHiddenAncestor] ^ 1;

  return v4 & 1;
}

@end