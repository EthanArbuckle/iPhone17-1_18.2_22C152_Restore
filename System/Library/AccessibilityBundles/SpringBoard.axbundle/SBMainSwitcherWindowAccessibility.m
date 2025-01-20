@interface SBMainSwitcherWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking;
- (BOOL)_axIsAnySwitcherVisible;
- (BOOL)_axIsControlCenterVisible;
- (BOOL)_axIsVisible;
- (BOOL)_axMultiAppNubletsVisible;
- (id)_axMainSwitcher;
- (id)_axSideAppDivider;
- (id)_axTongueGrabber;
- (int64_t)_accessibilityInterfaceOrientationForScreenCoordinates;
@end

@implementation SBMainSwitcherWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBMainSwitcherWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBMainSwitcherWindow" isKindOfClass:@"UIWindow"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"delegate", "@", 0);
  [v3 validateClass:@"SBMainSwitcherControllerCoordinator"];
  [v3 validateClass:@"SBSwitcherController" hasProperty:@"contentViewController" withType:"@"];
  [v3 validateClass:@"SBFluidSwitcherViewController" hasInstanceVariable:@"_slideOverTongue" withType:"SBSlideOverTongueView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"visibleUnderlayAccessoryViews", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherSpaceUnderlayAccessoryView" hasInstanceVariable:@"_resizeGrabber" withType:"SBSeparatorView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"isAnySwitcherVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"_currentLayoutState", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"unlockedEnvironmentMode", "q", 0);
  [v3 validateClass:@"SBControlCenterController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBControlCenterController", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBControlCenterController", @"isPresented", "B", 0);
  [v3 validateClass:@"SBSwitcherViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherViewController", @"delegate", "@", 0);
}

- (id)_axTongueGrabber
{
  v2 = [(SBMainSwitcherWindowAccessibility *)self _axMainSwitcher];
  id v3 = AXSwitcherController(@"activeDisplayWindowScene", v2);

  v4 = [v3 safeValueForKey:@"contentViewController"];
  v5 = [v4 safeUIViewForKey:@"_slideOverTongue"];

  return v5;
}

- (id)_axSideAppDivider
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(SBMainSwitcherWindowAccessibility *)self _axMainSwitcher];
  id v3 = AXSwitcherController(@"activeDisplayWindowScene", v2);

  v4 = [v3 safeValueForKey:@"contentViewController"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(v4, "safeDictionaryForKey:", @"visibleUnderlayAccessoryViews", 0);
  v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) safeUIViewForKey:@"_resizeGrabber"];
      if ([v11 _accessibilityViewIsVisible]) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (BOOL)_axMultiAppNubletsVisible
{
  id v3 = [(SBMainSwitcherWindowAccessibility *)self _axTongueGrabber];
  if ([v3 _accessibilityViewIsVisible])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(SBMainSwitcherWindowAccessibility *)self _axSideAppDivider];
    char v4 = [v5 _accessibilityViewIsVisible];
  }
  return v4;
}

- (BOOL)_axIsAnySwitcherVisible
{
  id v3 = [(SBMainSwitcherWindowAccessibility *)self _axMainSwitcher];
  char v4 = [v3 safeBoolForKey:@"isAnySwitcherVisible"];

  v5 = [(SBMainSwitcherWindowAccessibility *)self _axMainSwitcher];
  v6 = AXSwitcherController(@"activeDisplayWindowScene", v5);

  uint64_t v7 = [v6 safeValueForKeyPath:@"_currentLayoutState"];
  uint64_t v8 = [v7 safeIntegerForKey:@"unlockedEnvironmentMode"];

  char v9 = 1;
  if ((v4 & 1) == 0 && v8 != 3)
  {
    uint64_t v10 = [(SBMainSwitcherWindowAccessibility *)self _axMainSwitcher];
    if (([v10 _axIsShelfSwitcherVisible] & 1) == 0)
    {
      v11 = [(SBMainSwitcherWindowAccessibility *)self _axMainSwitcher];
      char v9 = [v11 _axIsAppSwitcherPeeking];
    }
  }

  return v9;
}

- (BOOL)_axIsVisible
{
  if ([(SBMainSwitcherWindowAccessibility *)self _axIsAnySwitcherVisible]) {
    return 1;
  }

  return [(SBMainSwitcherWindowAccessibility *)self _axMultiAppNubletsVisible];
}

- (BOOL)_axIsControlCenterVisible
{
  v2 = [NSClassFromString(&cfstr_Sbcontrolcente.isa) safeValueForKey:@"sharedInstanceIfExists"];
  char v3 = [v2 safeBoolForKey:@"isPresented"];

  return v3;
}

- (int64_t)_accessibilityInterfaceOrientationForScreenCoordinates
{
  return 1;
}

- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking
{
  return 1;
}

- (id)_axMainSwitcher
{
  objc_opt_class();
  v2 = AXSBMainSwitcherControllerCoordinatorSharedInstance();
  char v3 = __UIAccessibilityCastAsSafeCategory();

  return v3;
}

@end