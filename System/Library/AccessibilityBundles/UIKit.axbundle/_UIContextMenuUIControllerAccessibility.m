@interface _UIContextMenuUIControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)platterContainerView;
- (uint64_t)_axPerformEscape;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_createMenuViewIfNecessaryForMenu:(id)a3;
- (void)dismissalTransitionDidEnd;
- (void)presentationTransitionDidEnd;
@end

@implementation _UIContextMenuUIControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIContextMenuUIController";
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
  v5 = @"_UIContextMenuUIController";
  v4 = @"platterContainerView";
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = "v";
  [location[0] validateClass:v5 hasInstanceMethod:@"presentationTransitionDidEnd" withFullSignature:0];
  [location[0] validateClass:v5 hasProperty:@"delegate" withType:v6];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"dismissalTransitionDidEnd", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_createMenuViewIfNecessaryForMenu:", v3, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"menuConfiguration", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFulfilledContextMenuConfiguration", @"menu", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, v4, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"menuView", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIContextMenuView", @"currentListView", v6, 0);
  objc_storeStrong(v8, v7);
}

- (uint64_t)_axPerformEscape
{
  id v3 = a1;
  if (a1)
  {
    id v2 = v3;
    AXPerformSafeBlock();
    char v4 = 1;
    objc_storeStrong(&v2, 0);
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (id)platterContainerView
{
  v14 = self;
  v13[1] = (id)a2;
  v12.receiver = self;
  v12.super_class = (Class)_UIContextMenuUIControllerAccessibility;
  v13[0] = [(_UIContextMenuUIControllerAccessibility *)&v12 platterContainerView];
  [v13[0] setAccessibilityViewIsModal:1];
  objc_initWeak(&location, v14);
  id v4 = v13[0];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __63___UIContextMenuUIControllerAccessibility_platterContainerView__block_invoke;
  v9 = &unk_2650ADF60;
  objc_copyWeak(&v10, &location);
  [v4 _setAccessibilityPerformEscapeBlock:&v5];
  id v3 = v13[0];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  objc_storeStrong(v13, 0);

  return v3;
}

- (void)presentationTransitionDidEnd
{
  v11 = self;
  SEL v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuUIControllerAccessibility;
  [(_UIContextMenuUIControllerAccessibility *)&v9 presentationTransitionDidEnd];
  id v2 = (id)[(_UIContextMenuUIControllerAccessibility *)v11 safeValueForKey:@"platterContainerView"];
  objc_msgSend((id)*MEMORY[0x263F1D020], "_accessibilitySetContainerToStopVisibilityCheck:");

  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = __71___UIContextMenuUIControllerAccessibility_presentationTransitionDidEnd__block_invoke;
  int v7 = &unk_2650ADF18;
  v8 = v11;
  AXPerformBlockOnMainThreadAfterDelay();
  MEMORY[0x2455E6B10](*MEMORY[0x263F1CE68]);
  objc_storeStrong((id *)&v8, 0);
}

- (void)dismissalTransitionDidEnd
{
  int v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIContextMenuUIControllerAccessibility;
  [(_UIContextMenuUIControllerAccessibility *)&v2 dismissalTransitionDidEnd];
  [(id)*MEMORY[0x263F1D020] _accessibilitySetContainerToStopVisibilityCheck:0];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v29[1] = *MEMORY[0x263EF8340];
  v28 = self;
  SEL v27 = a2;
  v26.receiver = self;
  v26.super_class = (Class)_UIContextMenuUIControllerAccessibility;
  [(_UIContextMenuUIControllerAccessibility *)&v26 _accessibilityLoadAccessibilityInformation];
  id v8 = (id)[(_UIContextMenuUIControllerAccessibility *)v28 safeValueForKey:@"menuConfiguration"];
  id v25 = (id)[v8 safeValueForKey:@"menu"];

  id v24 = (id)[(_UIContextMenuUIControllerAccessibility *)v28 safeValueForKey:@"platterContainerView"];
  if (v24)
  {
    id v7 = (id)[v25 accessibilityIdentifier];
    objc_msgSend(v24, "setAccessibilityIdentifier:");

    id v23 = (id)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:v24];
    objc_initWeak(&location, v24);
    id v6 = v23;
    uint64_t v16 = MEMORY[0x263EF8330];
    int v17 = -1073741824;
    int v18 = 0;
    v19 = __85___UIContextMenuUIControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v20 = &unk_2650AE230;
    objc_copyWeak(&v21, &location);
    [v6 _setAccessibilityFrameBlock:&v16];
    [v23 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    id v5 = accessibilityLocalizedString(@"context.menu.dismiss");
    objc_msgSend(v23, "setAccessibilityLabel:");

    [v23 _accessibilitySetAdditionalElementOrderedLast:1];
    id v4 = v24;
    v29[0] = v23;
    id v3 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
    objc_msgSend(v4, "_accessibilitySetAdditionalElements:");

    [v23 _accessibilitySetSortPriority:-1];
    objc_initWeak(&from, v28);
    id v2 = v23;
    uint64_t v9 = MEMORY[0x263EF8330];
    int v10 = -1073741824;
    int v11 = 0;
    objc_super v12 = __85___UIContextMenuUIControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v13 = &unk_2650ADF60;
    objc_copyWeak(&v14, &from);
    [v2 _setAccessibilityActivateBlock:&v9];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
}

- (void)_createMenuViewIfNecessaryForMenu:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIContextMenuUIControllerAccessibility;
  [(_UIContextMenuUIControllerAccessibility *)&v3 _createMenuViewIfNecessaryForMenu:location[0]];
  [(_UIContextMenuUIControllerAccessibility *)v5 _accessibilityLoadAccessibilityInformation];
  objc_storeStrong(location, 0);
}

@end