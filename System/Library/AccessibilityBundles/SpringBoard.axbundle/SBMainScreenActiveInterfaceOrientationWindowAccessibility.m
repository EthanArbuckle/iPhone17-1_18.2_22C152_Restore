@interface SBMainScreenActiveInterfaceOrientationWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityWindowVisible;
- (BOOL)_axIsFloatingDockWindow;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityPerformEscape;
- (id)_axFloatingDockController;
@end

@implementation SBMainScreenActiveInterfaceOrientationWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBMainScreenActiveInterfaceOrientationWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBIconController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBIconController", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"floatingDockController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"floatingDockWindow", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"isPresentingFolder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockController", @"dismissPresentedFolderAnimated:completion:", "v", "B", "@?", 0);
}

- (BOOL)accessibilityElementsHidden
{
  if ([(SBMainScreenActiveInterfaceOrientationWindowAccessibility *)self _axIsFloatingDockWindow])
  {
    id v3 = [MEMORY[0x263F22968] server];
    if ([v3 isDockVisible])
    {
      v4 = [MEMORY[0x263F22968] server];
      char v5 = [v4 isControlCenterVisible];
    }
    else
    {
      char v5 = 1;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindowAccessibility;
    return [(SBMainScreenActiveInterfaceOrientationWindowAccessibility *)&v7 accessibilityElementsHidden];
  }
  return v5;
}

- (BOOL)_accessibilityWindowVisible
{
  if ([(SBMainScreenActiveInterfaceOrientationWindowAccessibility *)self _axIsFloatingDockWindow])
  {
    id v3 = [MEMORY[0x263F22968] server];
    char v4 = [v3 isDockVisible];

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindowAccessibility;
    return [(SBMainScreenActiveInterfaceOrientationWindowAccessibility *)&v6 _accessibilityWindowVisible];
  }
}

- (BOOL)accessibilityPerformEscape
{
  if ([(SBMainScreenActiveInterfaceOrientationWindowAccessibility *)self _axIsFloatingDockWindow])
  {
    id v3 = [(SBMainScreenActiveInterfaceOrientationWindowAccessibility *)self _axFloatingDockController];
    if ([v3 safeBoolForKey:@"isPresentingFolder"])
    {
      uint64_t v7 = MEMORY[0x263EF8330];
      uint64_t v8 = 3221225472;
      v9 = __87__SBMainScreenActiveInterfaceOrientationWindowAccessibility_accessibilityPerformEscape__block_invoke;
      v10 = &unk_265153D50;
      id v11 = v3;
      AXPerformSafeBlock();

      BOOL v4 = 1;
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindowAccessibility;
      BOOL v4 = [(SBMainScreenActiveInterfaceOrientationWindowAccessibility *)&v6 accessibilityPerformEscape];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindowAccessibility;
    return [(SBMainScreenActiveInterfaceOrientationWindowAccessibility *)&v12 accessibilityPerformEscape];
  }
  return v4;
}

uint64_t __87__SBMainScreenActiveInterfaceOrientationWindowAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissPresentedFolderAnimated:1 completion:0];
}

- (BOOL)_axIsFloatingDockWindow
{
  if (!AXDeviceIsPad()) {
    return 0;
  }
  id v3 = [(SBMainScreenActiveInterfaceOrientationWindowAccessibility *)self _axFloatingDockController];
  BOOL v4 = [v3 safeValueForKey:@"floatingDockWindow"];
  BOOL v5 = v4 == self;

  return v5;
}

- (id)_axFloatingDockController
{
  v2 = AXWindowScene(@"activeDisplayWindowScene");
  id v3 = [v2 safeValueForKey:@"floatingDockController"];

  return v3;
}

@end