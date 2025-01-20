@interface SBMainSwitcherControllerCoordinatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsAppSwitcherPeeking;
- (BOOL)_axIsAppSwitcherPeekingSlideOver;
- (BOOL)_axIsAppSwitcherPeekingSplitView;
- (BOOL)_axIsChamoisSwitcherVisible;
- (BOOL)_axIsFloatingSwitcherVisible;
- (BOOL)_axIsMainSwitcherVisible;
- (BOOL)_axIsShelfSwitcherVisible;
- (BOOL)_axIsTypeOfMainSwitcherVisible;
- (id)_activeDisplaySwitcherController;
- (id)_axFluidSwitcherViewController;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetUpSwitcherViewControllers;
- (void)_axSetUpWrapperViews;
- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4;
@end

@implementation SBMainSwitcherControllerCoordinatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBMainSwitcherControllerCoordinator";
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SBMainSwitcherControllerCoordinatorAccessibility;
  [(SBMainSwitcherControllerCoordinatorAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SBMainSwitcherControllerCoordinatorAccessibility *)self _axSetUpWrapperViews];
  [(SBMainSwitcherControllerCoordinatorAccessibility *)self _axSetUpSwitcherViewControllers];
}

- (void)_axSetUpWrapperViews
{
  objc_initWeak(&location, self);
  objc_super v3 = [(SBMainSwitcherControllerCoordinatorAccessibility *)self _activeDisplaySwitcherController];
  v4 = [v3 safeValueForKey:@"switcherViewController"];
  v5 = [v4 safeUIViewForKey:@"_contentWrapperView"];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__SBMainSwitcherControllerCoordinatorAccessibility__axSetUpWrapperViews__block_invoke;
  v6[3] = &unk_265154270;
  objc_copyWeak(&v7, &location);
  [v5 _setAccessibilityViewIsModalBlock:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

- (void)_axSetUpSwitcherViewControllers
{
  objc_initWeak(&location, self);
  uint64_t v4 = MEMORY[0x263EF8330];
  objc_copyWeak(&v5, &location);
  objc_super v3 = [(SBMainSwitcherControllerCoordinatorAccessibility *)self _axFluidSwitcherViewController];
  [v3 _setAXSwitcherType:&v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)_axIsAppSwitcherPeekingSplitView
{
  v2 = [(SBMainSwitcherControllerCoordinatorAccessibility *)self _activeDisplaySwitcherController];
  objc_super v3 = [v2 safeValueForKey:@"_currentLayoutState"];
  unint64_t v4 = [v3 safeIntegerForKey:@"peekConfiguration"];

  return v4 > 1;
}

uint64_t __83__SBMainSwitcherControllerCoordinatorAccessibility__axSetUpSwitcherViewControllers__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _axIsTypeOfMainSwitcherVisible])
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = objc_loadWeakRetained(v1);
    if ([v4 _axIsFloatingSwitcherVisible]) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (BOOL)_axIsTypeOfMainSwitcherVisible
{
  if ([(SBMainSwitcherControllerCoordinatorAccessibility *)self _axIsMainSwitcherVisible]) {
    return 1;
  }

  return [(SBMainSwitcherControllerCoordinatorAccessibility *)self _axIsAppSwitcherPeekingSplitView];
}

- (BOOL)_axIsMainSwitcherVisible
{
  if ([(SBMainSwitcherControllerCoordinatorAccessibility *)self _axIsChamoisSwitcherVisible])
  {
    return 1;
  }
  id v4 = [(SBMainSwitcherControllerCoordinatorAccessibility *)self _activeDisplaySwitcherController];
  char v5 = [v4 safeBoolForKey:@"isMainSwitcherVisible"];

  return v5;
}

- (BOOL)_axIsFloatingSwitcherVisible
{
  uint64_t v3 = [(SBMainSwitcherControllerCoordinatorAccessibility *)self _activeDisplaySwitcherController];
  id v4 = [v3 safeValueForKey:@"_currentLayoutState"];
  BOOL v5 = ([v4 safeBoolForKey:@"isFloatingSwitcherVisible"] & 1) != 0
    || [(SBMainSwitcherControllerCoordinatorAccessibility *)self _axIsAppSwitcherPeekingSlideOver];

  return v5;
}

- (BOOL)_axIsAppSwitcherPeekingSlideOver
{
  uint64_t v3 = [(SBMainSwitcherControllerCoordinatorAccessibility *)self _activeDisplaySwitcherController];
  id v4 = [v3 safeValueForKey:@"_currentMainAppLayout"];
  if (v4)
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [(SBMainSwitcherControllerCoordinatorAccessibility *)self _activeDisplaySwitcherController];
    id v7 = [v6 safeValueForKey:@"_currentFloatingAppLayout"];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (id)_activeDisplaySwitcherController
{
  return AXSwitcherController(@"activeDisplayWindowScene", self);
}

- (BOOL)_axIsChamoisSwitcherVisible
{
  v2 = [(SBMainSwitcherControllerCoordinatorAccessibility *)self _activeDisplaySwitcherController];
  uint64_t v3 = [v2 safeValueForKey:@"_currentLayoutState"];
  uint64_t v4 = [v3 safeIntegerForKey:@"unlockedEnvironmentMode"];

  char v5 = [v2 safeBoolForKey:@"isChamoisWindowingUIEnabled"];
  if (v4 == 3) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_axIsShelfSwitcherVisible
{
  v2 = [(SBMainSwitcherControllerCoordinatorAccessibility *)self _axFluidSwitcherViewController];
  uint64_t v3 = [v2 safeDictionaryForKey:@"visibleShelves"];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)_axFluidSwitcherViewController
{
  objc_opt_class();
  uint64_t v3 = [(SBMainSwitcherControllerCoordinatorAccessibility *)self _activeDisplaySwitcherController];
  BOOL v4 = [v3 safeValueForKey:@"contentViewController"];
  char v5 = __UIAccessibilityCastAsSafeCategory();

  return v5;
}

- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBMainSwitcherControllerCoordinatorAccessibility;
  id v5 = a4;
  [(SBMainSwitcherControllerCoordinatorAccessibility *)&v7 keyboardFocusController:a3 externalSceneDidAcquireFocus:v5];
  BOOL v6 = objc_msgSend(v5, "safeStringForKey:", @"identifier", v7.receiver, v7.super_class);

  UIAccessibilityPostNotification(*MEMORY[0x263F812E0], v6);
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBMainSwitcherControllerCoordinator" isKindOfClass:@"NSObject"];
  [v3 validateClass:@"SBSwitcherViewController" hasInstanceVariable:@"_contentWrapperView" withType:"BSUIOrientationTransformWrapperView"];
  [v3 validateClass:@"SBSwitcherController" hasProperty:@"contentViewController" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"isMainSwitcherVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"visibleShelves", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"switcherViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"_currentLayoutState", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"isChamoisWindowingUIEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"isFloatingSwitcherVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIFocusSystem", @"_isEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"_currentMainAppLayout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"_currentFloatingAppLayout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"peekConfiguration", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"unlockedEnvironmentMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"keyboardFocusController:externalSceneDidAcquireFocus:", "v", "@", "@", 0);
}

uint64_t __72__SBMainSwitcherControllerCoordinatorAccessibility__axSetUpWrapperViews__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _axIsTypeOfMainSwitcherVisible])
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = objc_loadWeakRetained(v1);
    uint64_t v3 = [v4 _axIsFloatingSwitcherVisible];
  }
  return v3;
}

- (BOOL)_axIsAppSwitcherPeeking
{
  if ([(SBMainSwitcherControllerCoordinatorAccessibility *)self _axIsAppSwitcherPeekingSlideOver])
  {
    return 1;
  }

  return [(SBMainSwitcherControllerCoordinatorAccessibility *)self _axIsAppSwitcherPeekingSplitView];
}

@end