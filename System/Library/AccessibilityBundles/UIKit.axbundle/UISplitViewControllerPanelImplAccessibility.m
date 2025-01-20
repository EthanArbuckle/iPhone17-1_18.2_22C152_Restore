@interface UISplitViewControllerPanelImplAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySpeakThisViewController;
- (id)displayModeButtonItem;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityUpdatePanelController;
- (void)_accessibilityUpdateSecondaryOnlyShortcutButtonItem;
- (void)_accessibilityUpdateSideBarToggleButtonItem;
- (void)_axApplyDisplayModeLabelToButtonItem:(void *)a1;
- (void)_updateDisplayModeButtonItem;
- (void)loadView;
- (void)setViewControllers:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation UISplitViewControllerPanelImplAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISplitViewControllerPanelImpl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v11 = location;
  id v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = @"UISplitViewControllerPanelImpl";
  v8 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = @"panelController";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_unspecifiedCompositionDisplayModeButtonItem", v8, 0);
  v4 = "q";
  [location[0] validateClass:v5 hasInstanceMethod:@"_effectiveTargetDisplayMode" withFullSignature:0];
  v6 = "v";
  [location[0] validateClass:v5 hasInstanceMethod:@"loadView" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"setViewControllers:", v6, v8, 0);
  [location[0] validateClass:v5 hasInstanceVariable:@"_svc" withType:"UISplitViewController"];
  [location[0] validateClass:v5 hasInstanceVariable:@"_sidebarToggleButtonItem" withType:"_UIFloatableBarButtonItem"];
  [location[0] validateClass:v5 hasInstanceVariable:@"_secondaryOnlyShortcutButtonItem" withType:"UIBarButtonItem"];
  v9 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"viewDidAppear:", v6, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"displayMode", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"style", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, v3, v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_handleFocusMovementDidFail:", v6, v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"showColumn:", v6, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"hideColumn:", v6, v4, 0);
  v7 = @"UIPanelController";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"mainViewController", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIBarButtonItem", @"_showsChevron", v9, 0);
  objc_storeStrong(v11, v10);
}

- (void)loadView
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  [(UISplitViewControllerPanelImplAccessibility *)&v4 loadView];
  objc_opt_class();
  id v2 = (id)[(UISplitViewControllerPanelImplAccessibility *)v6 safeValueForKey:@"_svc"];
  id v3 = (id)__UIAccessibilityCastAsSafeCategory();

  -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v3);
  objc_storeStrong(&v3, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  [(UISplitViewControllerPanelImplAccessibility *)&v3 viewDidAppear:a3];
  [(UISplitViewControllerPanelImplAccessibility *)v6 _accessibilityUpdatePanelController];
}

- (void)setViewControllers:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  [(UISplitViewControllerPanelImplAccessibility *)&v5 setViewControllers:location[0]];
  objc_opt_class();
  id v3 = (id)[(UISplitViewControllerPanelImplAccessibility *)v7 safeValueForKey:@"_svc"];
  id v4 = (id)__UIAccessibilityCastAsSafeCategory();

  if ([v4 isViewLoaded]) {
    -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v4);
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (id)displayModeButtonItem
{
  v6 = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  v5[0] = [(UISplitViewControllerPanelImplAccessibility *)&v4 displayModeButtonItem];
  -[UISplitViewControllerPanelImplAccessibility _axApplyDisplayModeLabelToButtonItem:](v6, v5[0]);
  id v3 = v5[0];
  objc_storeStrong(v5, 0);

  return v3;
}

- (void)_axApplyDisplayModeLabelToButtonItem:(void *)a1
{
  id v8 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v8 && location)
  {
    char v6 = 0;
    if ([v8 safeIntegerForKey:@"style"] == 1)
    {
      id v4 = (id)[v8 safeValueForKey:@"_effectiveTargetDisplayMode"];
      uint64_t v5 = [v4 integerValue];

      if (v5 == 1)
      {
        id v2 = location;
        id v3 = (id)accessibilityUIKitLocalizedString();
        objc_msgSend(v2, "setAccessibilityLabel:");

        [location accessibilitySetIdentification:@"DisplayMode"];
        [location setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
        char v6 = 1;
      }
    }
    if ((v6 & 1) == 0)
    {
      objc_msgSend(location, "setAccessibilityLabel:");
      [location accessibilitySetIdentification:0];
      [location setAccessibilityTraits:*MEMORY[0x263F1CEE8] | *MEMORY[0x263F81370]];
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)_updateDisplayModeButtonItem
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  [(UISplitViewControllerPanelImplAccessibility *)&v2 _updateDisplayModeButtonItem];
  [(UISplitViewControllerPanelImplAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  [(UISplitViewControllerPanelImplAccessibility *)v4 _accessibilityUpdatePanelController];
}

- (void)_accessibilityUpdateSideBarToggleButtonItem
{
  id v16 = a1;
  if (a1)
  {
    char v14 = 0;
    objc_opt_class();
    id v4 = (id)[v16 safeValueForKey:@"_sidebarToggleButtonItem"];
    id v13 = (id)__UIAccessibilityCastAsClass();

    id v12 = v13;
    objc_storeStrong(&v13, 0);
    id v15 = v12;
    if ([v12 safeBoolForKey:@"_showsChevron"])
    {
      objc_msgSend(v15, "_setAccessibilityLabelBlock:");
      [v15 setAccessibilityIdentifier:0];
      [v15 setAccessibilityTraits:*MEMORY[0x263F1CEE8] | *MEMORY[0x263F81370]];
    }
    else
    {
      objc_initWeak(&v11, v16);
      id v3 = v15;
      uint64_t v5 = MEMORY[0x263EF8330];
      int v6 = -1073741824;
      int v7 = 0;
      id v8 = __90__UISplitViewControllerPanelImplAccessibility__accessibilityUpdateSideBarToggleButtonItem__block_invoke;
      v9 = &unk_2650AE108;
      objc_copyWeak(&v10, &v11);
      [v3 _setAccessibilityLabelBlock:&v5];
      id v2 = v15;
      id v1 = AXNoLoc(@"ToggleSidebar");
      objc_msgSend(v2, "setAccessibilityIdentifier:");

      [v15 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&v11);
    }
    objc_storeStrong(&v15, 0);
  }
}

id __90__UISplitViewControllerPanelImplAccessibility__accessibilityUpdateSideBarToggleButtonItem__block_invoke(uint64_t a1)
{
  uint64_t v22 = a1;
  uint64_t v21 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = [WeakRetained safeUnsignedIntegerForKey:@"displayMode"];

  uint64_t v20 = v10;
  id v12 = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v13 = [v12 safeIntegerForKey:@"style"];

  uint64_t v19 = v13;
  BOOL v18 = v13 == 1;
  BOOL v17 = v13 == 2;
  char v16 = 0;
  if (v13 != 1 || (char v8 = 1, v20 != 2))
  {
    char v7 = 0;
    if (v17)
    {
      BOOL v6 = 1;
      if (v20 != 4) {
        BOOL v6 = v20 == 5;
      }
      char v7 = v6;
    }
    char v8 = v7;
  }
  char v16 = v8;
  char v15 = 0;
  if (!v18 || (char v5 = 1, v20 != 1))
  {
    char v4 = 0;
    if (v17)
    {
      BOOL v3 = 1;
      if (v20 != 2)
      {
        BOOL v3 = 1;
        if (v20 != 1)
        {
          BOOL v3 = 1;
          if (v20 != 3) {
            BOOL v3 = v20 == 6;
          }
        }
      }
      char v4 = v3;
    }
    char v5 = v4;
  }
  char v15 = v5;
  id location = 0;
  if (v16)
  {
    objc_storeStrong(&location, @"hide.sidebar");
  }
  else if (v15)
  {
    objc_storeStrong(&location, @"show.sidebar");
  }
  id v2 = (id)UIKitAccessibilityLocalizedString();
  objc_storeStrong(&location, 0);

  return v2;
}

- (void)_accessibilityUpdateSecondaryOnlyShortcutButtonItem
{
  id v16 = a1;
  if (a1)
  {
    char v14 = 0;
    objc_opt_class();
    id v4 = (id)[v16 safeValueForKey:@"_secondaryOnlyShortcutButtonItem"];
    id v13 = (id)__UIAccessibilityCastAsClass();

    id v12 = v13;
    objc_storeStrong(&v13, 0);
    id v15 = v12;
    objc_initWeak(&v11, v16);
    id v3 = v15;
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    char v8 = __98__UISplitViewControllerPanelImplAccessibility__accessibilityUpdateSecondaryOnlyShortcutButtonItem__block_invoke;
    v9 = &unk_2650AE108;
    objc_copyWeak(&v10, &v11);
    [v3 _setAccessibilityLabelBlock:&v5];
    id v2 = v15;
    id v1 = AXNoLoc(@"ToggleFullscreen");
    objc_msgSend(v2, "setAccessibilityIdentifier:");

    [v15 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v11);
    objc_storeStrong(&v15, 0);
  }
}

id __98__UISplitViewControllerPanelImplAccessibility__accessibilityUpdateSecondaryOnlyShortcutButtonItem__block_invoke(id *a1)
{
  v6[3] = a1;
  v6[2] = a1;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v4 = (void *)[WeakRetained safeUnsignedIntegerForKey:@"displayMode"];

  v6[1] = v4;
  if (v4 == (void *)1) {
    id v1 = @"exit.fullscreen";
  }
  else {
    id v1 = @"enter.fullscreen";
  }
  v6[0] = v1;
  id v5 = (id)UIKitAccessibilityLocalizedString();
  objc_storeStrong(v6, 0);

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  int v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  [(UISplitViewControllerPanelImplAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  -[UISplitViewControllerPanelImplAccessibility _accessibilityUpdateSideBarToggleButtonItem](v6);
  -[UISplitViewControllerPanelImplAccessibility _accessibilityUpdateSecondaryOnlyShortcutButtonItem](v6);
  id v2 = v6;
  id v3 = (id)[(UISplitViewControllerPanelImplAccessibility *)v6 safeValueForKey:@"_unspecifiedCompositionDisplayModeButtonItem"];
  -[UISplitViewControllerPanelImplAccessibility _axApplyDisplayModeLabelToButtonItem:](v2, v3);
}

- (id)_accessibilitySpeakThisViewController
{
  char v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)[(UISplitViewControllerPanelImplAccessibility *)self safeValueForKeyPath:@"panelController.collapsedViewController"];
  if (!v7[0])
  {
    v7[0] = (id)[(UISplitViewControllerPanelImplAccessibility *)v8 safeValueForKeyPath:@"panelController.mainViewController"];
  }
  char v6 = 0;
  objc_opt_class();
  id v5 = (id)__UIAccessibilityCastAsSafeCategory();
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  id v3 = (id)[v4 _accessibilitySpeakThisViewController];

  objc_storeStrong(v7, 0);

  return v3;
}

- (void)_accessibilityUpdatePanelController
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UISplitViewControllerPanelImplAccessibility *)self safeValueForKey:@"panelController"];
  NSClassFromString(&cfstr_Uipanelcontrol_0.isa);
  if (objc_opt_isKindOfClass()) {
    [location[0] _accessibilityLoadAccessibilityInformation];
  }
  objc_storeStrong(location, 0);
}

@end