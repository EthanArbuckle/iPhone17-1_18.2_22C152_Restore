@interface SBFluidSwitcherViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAppQuitNotificationsRegistered;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)_axHasMultirowLayout;
- (BOOL)_axIsVisible;
- (BOOL)_axPerformScrollToIndex:(unint64_t)a3 completion:(id)a4;
- (BOOL)_axShouldReverseElements;
- (BOOL)_removeVisibleItemContainerForAppLayout:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)appElementIsAccessibilityElement:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilityAppLayoutAtCurrentContentOffset;
- (id)_axAppLayoutForAppIdentifier:(id)a3;
- (id)_axAppLayouts;
- (id)_axChamoisActiveAppLayouts;
- (id)_axChamoisActiveApps;
- (id)_axCollectedAppLayouts;
- (id)_axCollectedVisibleItemContainers;
- (id)_axContentView;
- (id)_axGridLayoutModifierIfExists;
- (id)_axIdentifierOfAppInLayoutState:(id)a3;
- (id)_axMainSwitcher;
- (id)_axScrollStatusForIndex:(unint64_t)a3;
- (id)_axSortedElementArray:(id)a3;
- (id)_axSwitcherType;
- (id)_axVisibleAppLayouts;
- (int64_t)_axEnvironmentMode;
- (unint64_t)_axAdjustedIndex:(unint64_t)a3 forScrollDirection:(int64_t)a4;
- (unint64_t)_axCurrentAppLayoutIndex;
- (unint64_t)_axNumberOfPages;
- (unint64_t)_axPageForIndex:(unint64_t)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityRegisterAppQuitNotifications;
- (void)_accessibilitySetAppQuitNotificationsRegistered:(BOOL)a3;
- (void)_accessibilityUnregisterAppQuitNotifications;
- (void)_addVisibleItemContainerForAppLayout:(id)a3 reusingItemContainerIfExists:(id)a4;
- (void)_axCreateAppElements;
- (void)_axCreateAppElementsForLayouts:(id)a3 visibleItemContainers:(id)a4;
- (void)_axCreateInitialAppElements;
- (void)_axDidQuitApp:(id)a3;
- (void)_axScrollToAppLayout:(id)a3 completion:(id)a4;
- (void)_axUpdateElementOrderingIfNecessary;
- (void)_axUpdateElements:(id)a3 withVisibleItemContainers:(id)a4;
- (void)_handlePerformTransitionFinishedWithIdentifier:(id)a3 environmentMode:(int64_t)a4;
- (void)_performEventResponse:(id)a3;
- (void)_setAXSwitcherType:(id)a3;
- (void)_setupContentAndTransientViews;
- (void)_updatePlusButtonPresence;
- (void)dealloc;
- (void)handleReopenClosedWindowsButtonTapped:(id)a3;
- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation SBFluidSwitcherViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFluidSwitcherViewController";
}

- (void)_addVisibleItemContainerForAppLayout:(id)a3 reusingItemContainerIfExists:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  [(SBFluidSwitcherViewControllerAccessibility *)&v12 _addVisibleItemContainerForAppLayout:v6 reusingItemContainerIfExists:v7];
  v8 = [(SBFluidSwitcherViewControllerAccessibility *)self _axContentView];
  objc_opt_class();
  v9 = [(SBFluidSwitcherViewControllerAccessibility *)self safeValueForKey:@"visibleItemContainers"];
  v10 = __UIAccessibilityCastAsClass();

  v11 = [v10 objectForKey:v6];
  [v8 _axAddVisibleItemContainer:v11 forAppLayout:v6];
}

- (void)_setAXSwitcherType:(id)a3
{
  id v3 = (id)MEMORY[0x2456635C0](a3, a2);
  __UIAccessibilitySetAssociatedCopiedObject();
}

- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 safeValueForKey:@"previousLayoutState"];
  uint64_t v11 = [v10 safeIntegerForKey:@"unlockedEnvironmentMode"];
  objc_super v12 = [(SBFluidSwitcherViewControllerAccessibility *)self _axIdentifierOfAppInLayoutState:v10];
  [(SBFluidSwitcherViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  [(SBFluidSwitcherViewControllerAccessibility *)self _axCreateAppElements];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __95__SBFluidSwitcherViewControllerAccessibility_performTransitionWithContext_animated_completion___block_invoke;
  v17[3] = &unk_2651541F8;
  v17[4] = self;
  id v18 = v12;
  id v19 = v8;
  uint64_t v20 = v11;
  id v13 = v12;
  id v14 = v8;
  v15 = (void *)MEMORY[0x2456635C0](v17);
  v16.receiver = self;
  v16.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  [(SBFluidSwitcherViewControllerAccessibility *)&v16 performTransitionWithContext:v9 animated:v5 completion:v15];
}

- (void)_axCreateAppElements
{
  BOOL v3 = [(SBFluidSwitcherViewControllerAccessibility *)self _axIsVisible];
  id v17 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedAppLayouts];
  uint64_t v4 = [v17 count];
  if (!v3)
  {
    if (v4) {
      goto LABEL_13;
    }
LABEL_5:
    BOOL v5 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedVisibleItemContainers];
    id v6 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
    int v7 = [v6 _axIsAppSwitcherPeekingSlideOver];

    id v8 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
    id v9 = v8;
    if (v7)
    {
      v10 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
      uint64_t v11 = AXSwitcherController(@"activeDisplayWindowScene", v10);
      objc_super v12 = [v11 safeValueForKeyPath:@"_currentLayoutState.floatingAppLayout"];
      id v13 = [v9 _appLayoutContainingDisplayItem:v12];
    }
    else
    {
      int v14 = [v8 _axIsAppSwitcherPeekingSplitView];

      if (!v14) {
        goto LABEL_11;
      }
      id v9 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
      v10 = AXSwitcherController(@"activeDisplayWindowScene", v9);
      id v13 = [v10 safeValueForKeyPath:@"_currentLayoutState.appLayout"];
    }

    if (v13)
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v13);

      id v16 = (id)v15;
LABEL_12:
      id v17 = v16;
      [(SBFluidSwitcherViewControllerAccessibility *)self _axCreateAppElementsForLayouts:v16 visibleItemContainers:v5];

      goto LABEL_13;
    }
LABEL_11:
    id v16 = v17;
    goto LABEL_12;
  }
  if (v4) {
    goto LABEL_5;
  }
LABEL_13:
}

- (id)_axCollectedAppLayouts
{
  v2 = [(SBFluidSwitcherViewControllerAccessibility *)self _axAppLayouts];
  BOOL v3 = AXGuaranteedMutableArray();

  return v3;
}

- (id)_axAppLayouts
{
  objc_opt_class();
  BOOL v3 = [(SBFluidSwitcherViewControllerAccessibility *)self safeValueForKey:@"appLayouts"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (id)_axIdentifierOfAppInLayoutState:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = [v3 safeValueForKey:@"elements"];
  BOOL v5 = __UIAccessibilityCastAsClass();

  id v6 = [v5 anyObject];
  int v7 = [v6 safeValueForKey:@"uniqueIdentifier"];

  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  [(SBFluidSwitcherViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBFluidSwitcherViewControllerAccessibility *)self _axContentView];
  [v3 setAccessibilityIdentifier:@"AppSwitcherContentView"];
  [v3 _accessibilitySetAssignedValue:self forKey:@"AppSwitcherViewController"];
  [(SBFluidSwitcherViewControllerAccessibility *)self _axCreateInitialAppElements];
}

- (void)_axCreateInitialAppElements
{
}

void __95__SBFluidSwitcherViewControllerAccessibility_performTransitionWithContext_animated_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__SBFluidSwitcherViewControllerAccessibility_performTransitionWithContext_animated_completion___block_invoke_2;
  block[3] = &unk_2651541D0;
  id v3 = (void *)a1[5];
  block[4] = a1[4];
  id v4 = v3;
  uint64_t v5 = a1[7];
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (BOOL)_axIsVisible
{
  id v3 = [(SBFluidSwitcherViewControllerAccessibility *)self safeUIViewForKey:@"_stashedContentView"];

  if (v3) {
    goto LABEL_2;
  }
  id v4 = [(SBFluidSwitcherViewControllerAccessibility *)self _axSwitcherType];

  if (!v4) {
    return (char)v4;
  }
  uint64_t v5 = [(SBFluidSwitcherViewControllerAccessibility *)self _axSwitcherType];
  uint64_t v6 = v5[2]();

  switch(v6)
  {
    case 3:
      id v7 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
      char v8 = [v7 _axIsShelfSwitcherVisible];
      goto LABEL_10;
    case 2:
      id v7 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
      char v8 = [v7 _axIsFloatingSwitcherVisible];
      goto LABEL_10;
    case 1:
      id v7 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
      char v8 = [v7 _axIsTypeOfMainSwitcherVisible];
LABEL_10:
      LOBYTE(v4) = v8;

      return (char)v4;
  }
LABEL_2:
  LOBYTE(v4) = 0;
  return (char)v4;
}

- (id)_axSwitcherType
{
}

- (void)_updatePlusButtonPresence
{
  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  [(SBFluidSwitcherViewControllerAccessibility *)&v5 _updatePlusButtonPresence];
  id v3 = [(SBFluidSwitcherViewControllerAccessibility *)self safeUIViewForKey:@"_plusButton"];
  id v4 = accessibilityLocalizedString(@"fluid.switcher.plus.button.label");
  [v3 setAccessibilityLabel:v4];
}

- (id)_axContentView
{
  id v3 = [(SBFluidSwitcherViewControllerAccessibility *)self safeValueForKey:@"_stashedContentView"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SBFluidSwitcherViewControllerAccessibility *)self safeValueForKey:@"_contentView"];
  }
  uint64_t v6 = v5;

  objc_opt_class();
  id v7 = __UIAccessibilityCastAsSafeCategory();

  return v7;
}

- (void)_axCreateAppElementsForLayouts:(id)a3 visibleItemContainers:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBFluidSwitcherViewControllerAccessibility *)self _axContentView];
  id v9 = (void *)v8;
  if (v6 && v8)
  {
    v42 = (void *)v8;
    v43 = v7;
    v45 = self;
    v44 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v41 = v6;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v55 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          id v18 = [v17 safeArrayForKey:@"leafAppLayouts"];
          if ((unint64_t)[v18 count] < 2)
          {
            [v11 axSafelyAddObject:v17];
          }
          else
          {
            id v19 = [v18 reverseObjectEnumerator];
            uint64_t v20 = [v19 allObjects];
            [v11 axSafelyAddObjectsFromArray:v20];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v14);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v21 = v11;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v59 count:16];
    id v9 = v42;
    if (v22)
    {
      uint64_t v23 = v22;
      char v24 = 0;
      uint64_t v25 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(v21);
          }
          uint64_t v27 = *(void *)(*((void *)&v50 + 1) + 8 * j);
          v28 = [[SBAppSwitcherAppAccessibilityElement alloc] initWithAccessibilityContainer:v42];
          [(SBAppSwitcherAppAccessibilityElement *)v28 setContentView:v42];
          [(SBAppSwitcherAppAccessibilityElement *)v28 setAppLayout:v27];
          [(SBAppSwitcherAppAccessibilityElement *)v28 setDelegate:v45];
          [(SBAppSwitcherAppAccessibilityElement *)v28 _setAccessibilityIsNotFirstElement:v24 & 1];
          [v44 addObject:v28];
          [v10 setObject:v28 forKeyedSubscript:v27];

          char v24 = 1;
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v23);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v7 = v43;
    v29 = [v43 allKeys];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v47;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v47 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v46 + 1) + 8 * k);
          v35 = [v43 objectForKey:v34];
          v36 = [v10 objectForKeyedSubscript:v34];
          [v36 setItemContainer:v35];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v31);
    }

    if (UIAccessibilityIsSwitchControlRunning())
    {
      v38 = v44;
      v37 = v45;
      id v39 = [(SBFluidSwitcherViewControllerAccessibility *)v45 _axSortedElementArray:v44];
      id v6 = v41;
    }
    else
    {
      v37 = v45;
      id v6 = v41;
      v38 = v44;
      if ([(SBFluidSwitcherViewControllerAccessibility *)v45 _axShouldReverseElements])
      {
        v40 = [v44 reverseObjectEnumerator];
        id v39 = [v40 allObjects];
      }
      else
      {
        id v39 = v44;
      }
    }
    [(SBFluidSwitcherViewControllerAccessibility *)v37 _accessibilityRegisterAppQuitNotifications];
  }
  else
  {
    [(SBFluidSwitcherViewControllerAccessibility *)self _accessibilityUnregisterAppQuitNotifications];
    v10 = 0;
    id v39 = 0;
  }
  [v9 _axSetElementsArray:v39 dictionary:v10];
}

- (void)_accessibilitySetAppQuitNotificationsRegistered:(BOOL)a3
{
}

- (id)_axMainSwitcher
{
  objc_opt_class();
  uint64_t v2 = AXSBMainSwitcherControllerCoordinatorSharedInstance();
  id v3 = __UIAccessibilityCastAsSafeCategory();

  return v3;
}

- (BOOL)_axShouldReverseElements
{
  return 1;
}

- (void)_accessibilityUnregisterAppQuitNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SBAppSwitcherQuitAppNotification" object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:@"AXInternalAppSwitcherAppRemove" object:0];

  [(SBFluidSwitcherViewControllerAccessibility *)self _accessibilitySetAppQuitNotificationsRegistered:0];
}

- (void)_accessibilityRegisterAppQuitNotifications
{
  if (![(SBFluidSwitcherViewControllerAccessibility *)self _accessibilityAppQuitNotificationsRegistered])
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__axDidQuitApp_ name:@"SBAppSwitcherQuitAppNotification" object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel__axDidQuitApp_ name:@"AXInternalAppSwitcherAppRemove" object:0];

    [(SBFluidSwitcherViewControllerAccessibility *)self _accessibilitySetAppQuitNotificationsRegistered:1];
  }
}

- (BOOL)_accessibilityAppQuitNotificationsRegistered
{
  return MEMORY[0x270F09620](self, &__SBFluidSwitcherViewControllerAccessibility___accessibilityAppQuitNotificationsRegistered);
}

- (id)_axCollectedVisibleItemContainers
{
  uint64_t v2 = [(SBFluidSwitcherViewControllerAccessibility *)self safeDictionaryForKey:@"_visibleItemContainers"];
  id v3 = (void *)[v2 mutableCopy];

  return v3;
}

- (void)_performEventResponse:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  id v3 = a3;
  [(SBFluidSwitcherViewControllerAccessibility *)&v6 _performEventResponse:v3];
  NSClassFromString(&cfstr_Sbdismissforem.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = accessibilityLocalizedString(@"app.switcher.no.items");
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"scrollView", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"_setupContentAndTransientViews", "v", 0);
  [v3 validateClass:@"SBFluidSwitcherViewController" hasInstanceVariable:@"_contentView" withType:"SBFluidSwitcherContentView"];
  [v3 validateClass:@"SBFluidSwitcherViewController" hasInstanceVariable:@"_stashedContentView" withType:"SBFluidSwitcherContentView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"_performEventResponse:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"visibleItemContainers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"rootModifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"appLayouts", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"layoutContext", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"_updateVisibleItems", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"_removeVisibleItemContainerForAppLayout:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"_addVisibleItemContainerForAppLayout:reusingItemContainerIfExists:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"_scrollToAppLayout:animated:alignment:completion:", "v", "@", "B", "q", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"performTransitionWithContext:animated:completion:", "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"_updatePlusButtonPresence", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherRootSwitcherModifier", @"multitaskingModifier", "@", 0);
  [v3 validateClass:@"SBGridSwitcherModifier"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBGridSwitcherModifier", @"gridLayoutModifier", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherLayoutContext"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherLayoutContext", @"layoutState", "@", 0);
  [v3 validateClass:@"SBLayoutState"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLayoutState", @"elements", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLayoutState", @"elementWithRole:", "@", "q", 0);
  [v3 validateClass:@"SBMainDisplayLayoutState"];
  [v3 validateClass:@"SBMainDisplayLayoutState" isKindOfClass:@"SBLayoutState"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"unlockedEnvironmentMode", "q", 0);
  [v3 validateClass:@"SBLayoutElement"];
  [v3 validateClass:@"SBLayoutElement" conformsToProtocol:@"SBLayoutElementDescriptor"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLayoutElement", @"viewControllerClass", "#", 0);
  [v3 validateProtocol:@"SBLayoutElementDescriptor" hasRequiredInstanceMethod:@"uniqueIdentifier"];
  [v3 validateClass:@"SBGridLayoutSwitcherModifier"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBGridLayoutSwitcherModifier", @"_columnForIndex:", "Q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBGridLayoutSwitcherModifier", @"_numberOfColumns", "Q", 0);
  [v3 validateProtocol:@"SBSwitcherMultitaskingQueryProviding" hasRequiredInstanceMethod:@"contentOffsetForIndex:alignment:"];
  [v3 validateClass:@"SBWorkspaceApplicationSceneTransitionContext"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWorkspaceApplicationSceneTransitionContext", @"previousLayoutState", "@", 0);
  [v3 validateClass:@"SBAppLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"allItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"environment", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"leafAppLayouts", "@", 0);
  [v3 validateClass:@"SBDisplayItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDisplayItem", @"bundleIdentifier", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherViewController" hasInstanceVariable:@"_reopenClosedWindowsButton" withType:"SBFluidSwitcherTitledButton"];
  [v3 validateClass:@"SBFluidSwitcherViewController" hasInstanceVariable:@"_rootModifier" withType:"SBSwitcherModifier"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"handleReopenClosedWindowsButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"numberOfHiddenAppLayoutsForBundleIdentifier:", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherModifier", @"appExposeAccessoryButtonsBundleIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLayoutState", @"appLayout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"rootModifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"_currentLayoutState", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"_appLayoutContainingDisplayItem:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayLayoutState", @"floatingAppLayout", "@", 0);
  [v3 validateClass:@"SBDismissForEmptySwitcherSwitcherEventResponse"];
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  id v3 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
  if (([v3 _axIsShelfSwitcherVisible] & 1) == 0)
  {

    goto LABEL_5;
  }
  id v4 = [(SBFluidSwitcherViewControllerAccessibility *)self _axSwitcherType];
  uint64_t v5 = v4[2]();

  if (v5 != 3)
  {
LABEL_5:
    objc_super v6 = [MEMORY[0x263F22968] server];
    [v6 dismissAppSwitcher];
    goto LABEL_6;
  }
  objc_super v6 = [MEMORY[0x263F22968] server];
  [v6 dismissShelfSwitcher];
LABEL_6:

  return 1;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  char IsPad = AXDeviceIsPad();
  if ((unint64_t)(a3 - 3) >= 0xFFFFFFFFFFFFFFFELL && (IsPad & 1) == 0)
  {
    unint64_t v6 = [(SBFluidSwitcherViewControllerAccessibility *)self _axAdjustedIndex:[(SBFluidSwitcherViewControllerAccessibility *)self _axCurrentAppLayoutIndex] forScrollDirection:a3];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__SBFluidSwitcherViewControllerAccessibility_accessibilityScroll___block_invoke;
    v10[3] = &unk_265153D50;
    v10[4] = self;
    id v7 = (void *)MEMORY[0x2456635C0](v10);
    LOBYTE(v6) = [(SBFluidSwitcherViewControllerAccessibility *)self _axPerformScrollToIndex:v6 completion:v7];

    if (v6) {
      return 1;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  return [(SBFluidSwitcherViewControllerAccessibility *)&v9 accessibilityScroll:a3];
}

uint64_t __66__SBFluidSwitcherViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axUpdateElementOrderingIfNecessary];
}

- (BOOL)_axPerformScrollToIndex:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedAppLayouts];
  unint64_t v8 = [v7 count];
  if (v8 > a3)
  {
    objc_super v9 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedAppLayouts];
    v10 = [v9 objectAtIndexedSubscript:a3];

    [(SBFluidSwitcherViewControllerAccessibility *)self _axScrollToAppLayout:v10 completion:v6];
  }

  return v8 > a3;
}

- (void)_axScrollToAppLayout:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (UIAccessibilityIsSwitchControlRunning())
  {
    unint64_t v8 = 0;
  }
  else
  {
    objc_super v9 = [(SBFluidSwitcherViewControllerAccessibility *)self _axContentView];
    unint64_t v8 = [v9 _axElementForAppLayout:v6];
  }
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  AXPerformSafeBlock();
}

void __78__SBFluidSwitcherViewControllerAccessibility__axScrollToAppLayout_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__SBFluidSwitcherViewControllerAccessibility__axScrollToAppLayout_completion___block_invoke_2;
  v4[3] = &unk_265154180;
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 _scrollToAppLayout:v3 animated:1 alignment:2 completion:v4];
}

void __78__SBFluidSwitcherViewControllerAccessibility__axScrollToAppLayout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE18];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A08]);
  id v4 = *(void **)(a1 + 32);

  UIAccessibilityPostNotification(v3, v4);
}

- (void)handleReopenClosedWindowsButtonTapped:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  [(SBFluidSwitcherViewControllerAccessibility *)&v20 handleReopenClosedWindowsButtonTapped:v4];
  id v5 = [(SBFluidSwitcherViewControllerAccessibility *)self safeValueForKey:@"_rootModifier"];
  id v6 = [v5 safeStringForKey:@"appExposeAccessoryButtonsBundleIdentifier"];

  if ([v6 length])
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = self;
    id v15 = v6;
    AXPerformSafeBlock();
    uint64_t v7 = v17[3];

    _Block_object_dispose(&v16, 8);
    if (v7 < 2)
    {
      unint64_t v8 = AXSBApplicationWithIdentifier();
      objc_super v9 = NSString;
      id v10 = accessibilityLocalizedString(@"fluid.switcher.reopen.closed.window");
      id v11 = [v8 safeStringForKey:@"displayName"];
      id v12 = objc_msgSend(v9, "stringWithFormat:", v10, v11, v13, 3221225472, __84__SBFluidSwitcherViewControllerAccessibility_handleReopenClosedWindowsButtonTapped___block_invoke, &unk_265153DF0, v14);
      UIAccessibilitySpeakAndDoNotBeInterrupted();
    }
    else
    {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    }
  }
}

uint64_t __84__SBFluidSwitcherViewControllerAccessibility_handleReopenClosedWindowsButtonTapped___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) numberOfHiddenAppLayoutsForBundleIdentifier:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_setupContentAndTransientViews
{
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  [(SBFluidSwitcherViewControllerAccessibility *)&v3 _setupContentAndTransientViews];
  [(SBFluidSwitcherViewControllerAccessibility *)self _axCreateAppElements];
}

- (BOOL)_removeVisibleItemContainerForAppLayout:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  id v4 = a3;
  BOOL v5 = [(SBFluidSwitcherViewControllerAccessibility *)&v8 _removeVisibleItemContainerForAppLayout:v4];
  id v6 = [(SBFluidSwitcherViewControllerAccessibility *)self _axContentView];
  [v6 _axRemoveVisibleItemContainerForAppLayout:v4];

  if ((AXDeviceIsPad() & 1) == 0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A78]);
  }

  return v5;
}

uint64_t __95__SBFluidSwitcherViewControllerAccessibility_performTransitionWithContext_animated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePerformTransitionFinishedWithIdentifier:*(void *)(a1 + 40) environmentMode:*(void *)(a1 + 48)];
}

- (void)_handlePerformTransitionFinishedWithIdentifier:(id)a3 environmentMode:(int64_t)a4
{
  id v32 = a3;
  id v6 = [(SBFluidSwitcherViewControllerAccessibility *)self _axContentView];
  if ([(SBFluidSwitcherViewControllerAccessibility *)self _axIsVisible]
    && ([(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 _axIsChamoisSwitcherVisible],
        v7,
        (v8 & 1) == 0))
  {
    uint64_t v14 = [v6 accessibilityElements];
    id v15 = objc_msgSend(v14, "ax_filteredArrayUsingBlock:", &__block_literal_global_6);

    uint64_t v16 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedVisibleItemContainers];
    id v17 = [v16 allValues];
    [(SBFluidSwitcherViewControllerAccessibility *)self _axUpdateElements:v15 withVisibleItemContainers:v17];

    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - *(double *)&_handlePerformTransitionFinishedWithIdentifier_environmentMode__LastAnnouncement > 1.0
      && (AXSpringBoardIsAssistantVisible() & 1) == 0)
    {
      uint64_t v19 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
      int v20 = [v19 _axIsMainSwitcherVisible];

      if (v20)
      {
        id v21 = objc_allocWithZone(NSDictionary);
        uint64_t v22 = [NSNumber numberWithInt:1];
        uint64_t v23 = objc_msgSend(v21, "initWithObjectsAndKeys:", v22, *MEMORY[0x263F216D8], 0);

        id v24 = objc_allocWithZone(MEMORY[0x263F086A0]);
        uint64_t v25 = accessibilityLocalizedString(@"app.switcher.announce");
        v26 = (void *)[v24 initWithString:v25 attributes:v23];

        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v26);
        _handlePerformTransitionFinishedWithIdentifier_environmentMode__LastAnnouncement = *(void *)&Current;
      }
    }
    if (a4 == 1)
    {
      v28 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedAppLayouts];
      uint64_t v27 = [v28 firstObject];
    }
    else if (a4 == 3)
    {
      uint64_t v27 = [(SBFluidSwitcherViewControllerAccessibility *)self _axAppLayoutForAppIdentifier:v32];
    }
    else
    {
      uint64_t v27 = 0;
    }
    v29 = [v6 _axElementForAppLayout:v27];
    uint64_t v30 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
    int v31 = [v30 _axIsMainSwitcherVisible];

    if (v31) {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], v29);
    }
  }
  else
  {
    objc_super v9 = [(SBFluidSwitcherViewControllerAccessibility *)self _axContentView];
    id v10 = [v9 _axSwitcherViewController];
    char v11 = [v10 _axIsVisible];

    if ((v11 & 1) == 0)
    {
      id v12 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
      char v13 = [v12 _axIsShelfSwitcherVisible];

      if ((v13 & 1) == 0) {
        [(SBFluidSwitcherViewControllerAccessibility *)self _axCreateAppElementsForLayouts:0 visibleItemContainers:0];
      }
    }
  }
}

uint64_t __109__SBFluidSwitcherViewControllerAccessibility__handlePerformTransitionFinishedWithIdentifier_environmentMode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axAppLayoutForAppIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedAppLayouts];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v19)
  {
    uint64_t v6 = *(void *)v27;
    int v20 = v5;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v5);
        }
        char v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        char v25 = 0;
        objc_opt_class();
        objc_super v9 = [v8 safeValueForKey:@"allItems"];
        id v10 = __UIAccessibilityCastAsClass();

        if (v25) {
          abort();
        }
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "safeStringForKey:", @"bundleIdentifier", v19);
              if ([v4 isEqualToString:v16])
              {
                id v17 = v8;

                id v5 = v20;
                goto LABEL_20;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v30 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        id v5 = v20;
      }
      id v17 = 0;
      uint64_t v19 = [v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v19);
  }
  else
  {
    id v17 = 0;
  }
LABEL_20:

  return v17;
}

- (id)_axChamoisActiveAppLayouts
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedVisibleItemContainers];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v4 objectForKey:v10];
        char v12 = [v11 isSelectable];

        if ((v12 & 1) == 0) {
          [v3 axSafelyAddObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)_axChamoisActiveApps
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(SBFluidSwitcherViewControllerAccessibility *)self _axChamoisActiveAppLayouts];
  if ([v4 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedVisibleItemContainers];
          char v12 = [v11 objectForKey:v10];
          [v3 axSafelyAddObject:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }

  return v3;
}

- (id)_axVisibleAppLayouts
{
  id v2 = [(SBFluidSwitcherViewControllerAccessibility *)self safeDictionaryForKey:@"visibleItemContainers"];
  objc_super v3 = [v2 allKeys];

  return v3;
}

- (int64_t)_axEnvironmentMode
{
  id v2 = [(SBFluidSwitcherViewControllerAccessibility *)self safeValueForKeyPath:@"layoutContext.layoutState.unlockedEnvironmentMode"];
  int64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (id)_axScrollStatusForIndex:(unint64_t)a3
{
  if (a3
    && (unint64_t v5 = [(SBFluidSwitcherViewControllerAccessibility *)self _axPageForIndex:[(SBFluidSwitcherViewControllerAccessibility *)self _axCurrentAppLayoutIndex]], v5 != [(SBFluidSwitcherViewControllerAccessibility *)self _axPageForIndex:a3]))
  {
    uint64_t v7 = accessibilityLocalizedString(@"springboard.page.status");
    unint64_t v8 = [(SBFluidSwitcherViewControllerAccessibility *)self _axPageForIndex:a3] + 1;
    unint64_t v9 = [(SBFluidSwitcherViewControllerAccessibility *)self _axNumberOfPages];
    uint64_t v10 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, v8, v9);
    id v11 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedAppLayouts];
    char v12 = [v11 axSafeObjectAtIndex:a3];

    uint64_t v13 = [(SBFluidSwitcherViewControllerAccessibility *)self _axContentView];
    long long v14 = [v13 _axElementForAppLayout:v12];

    long long v15 = [v14 accessibilityLabel];
    uint64_t v6 = __UIAXStringForVariables();
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_axGridLayoutModifierIfExists
{
  id v2 = [(SBFluidSwitcherViewControllerAccessibility *)self safeValueForKey:@"rootModifier"];
  int64_t v3 = __UIAccessibilitySafeClass();

  id v4 = [v3 safeValueForKey:@"multitaskingModifier"];

  NSClassFromString(&cfstr_Sbgridswitcher.isa);
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [v4 safeValueForKey:@"gridLayoutModifier"];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)_axPageForIndex:(unint64_t)a3
{
  id v4 = [(SBFluidSwitcherViewControllerAccessibility *)self _axGridLayoutModifierIfExists];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = 0;
    unint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v10 = 0;
    id v6 = v4;
    AXPerformSafeBlock();
    a3 = v8[3];

    _Block_object_dispose(&v7, 8);
  }

  return a3;
}

uint64_t __62__SBFluidSwitcherViewControllerAccessibility__axPageForIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _columnForIndex:*(void *)(a1 + 48) - 1];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_axNumberOfPages
{
  int64_t v3 = [(SBFluidSwitcherViewControllerAccessibility *)self _axGridLayoutModifierIfExists];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 safeUnsignedIntegerForKey:@"_numberOfColumns"];
  }
  else
  {
    unint64_t v5 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedAppLayouts];
    unint64_t v4 = [v5 count];
  }
  return v4;
}

- (BOOL)_axHasMultirowLayout
{
  unint64_t v3 = [(SBFluidSwitcherViewControllerAccessibility *)self _axNumberOfPages];
  unint64_t v4 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedAppLayouts];
  LOBYTE(v3) = v3 < [v4 count];

  return v3;
}

- (unint64_t)_axAdjustedIndex:(unint64_t)a3 forScrollDirection:(int64_t)a4
{
  BOOL v6 = [(SBFluidSwitcherViewControllerAccessibility *)self _axHasMultirowLayout];
  uint64_t v7 = 1;
  if (v6) {
    uint64_t v7 = 2;
  }
  unint64_t v8 = a3 - v7;
  unint64_t v9 = v7 + a3;
  if (a4 != 1) {
    unint64_t v9 = a3;
  }
  if (a4 == 2) {
    return v8;
  }
  else {
    return v9;
  }
}

- (unint64_t)_axCurrentAppLayoutIndex
{
  unint64_t v3 = UIAccessibilityFocusedElement(0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 appLayout];
  }
  else {
  unint64_t v4 = [(SBFluidSwitcherViewControllerAccessibility *)self _accessibilityAppLayoutAtCurrentContentOffset];
  }
  unint64_t v5 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedAppLayouts];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (void)_axUpdateElements:(id)a3 withVisibleItemContainers:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v19 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v5;
  uint64_t v20 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v6;
        uint64_t v7 = *(void **)(*((void *)&v26 + 1) + 8 * v6);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v8 = v19;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v23;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
              long long v14 = [v7 appLayout];
              long long v15 = [v13 safeValueForKey:@"appLayout"];
              int v16 = [v14 isEqual:v15];

              if (v16) {
                [v7 setItemContainer:v13];
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }
}

- (void)_axUpdateElementOrderingIfNecessary
{
  if (UIAccessibilityIsSwitchControlRunning())
  {
    id v8 = [(SBFluidSwitcherViewControllerAccessibility *)self _axContentView];
    unint64_t v3 = [v8 _axAppElements];
    unint64_t v4 = (void *)[v3 mutableCopy];

    id v5 = [v8 _axAppElementsDictionary];
    uint64_t v6 = (void *)[v5 mutableCopy];

    uint64_t v7 = [(SBFluidSwitcherViewControllerAccessibility *)self _axSortedElementArray:v4];
    [v8 _axSetElementsArray:v7 dictionary:v6];
  }
}

- (void)dealloc
{
  [(SBFluidSwitcherViewControllerAccessibility *)self _accessibilityUnregisterAppQuitNotifications];
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  [(SBFluidSwitcherViewControllerAccessibility *)&v3 dealloc];
}

- (id)_axSortedElementArray:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__SBFluidSwitcherViewControllerAccessibility__axSortedElementArray___block_invoke;
  v7[3] = &unk_265154240;
  objc_copyWeak(&v8, &location);
  id v5 = [v4 sortedArrayUsingComparator:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __68__SBFluidSwitcherViewControllerAccessibility__axSortedElementArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 accessibilityFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v5 accessibilityFrame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = *(double *)(MEMORY[0x263F001B0] + 8);
  BOOL v23 = v11 == *MEMORY[0x263F001B0];
  if (v13 != v22) {
    BOOL v23 = 0;
  }
  if (v19 == *MEMORY[0x263F001B0] && v21 == v22) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = -1;
  }
  if ((v19 != *MEMORY[0x263F001B0] || v21 != v22) && !v23)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v26 = [WeakRetained _axShouldReverseElements];

    if (v26)
    {
      if ((AXDeviceIsPad() & 1) == 0) {
        goto LABEL_14;
      }
      v40.origin.x = v7;
      v40.origin.y = v9;
      v40.size.width = v11;
      v40.size.height = v13;
      double rectb = CGRectGetMinY(v40);
      v41.origin.x = v15;
      v41.origin.y = v17;
      v41.size.width = v19;
      v41.size.height = v21;
      if (rectb > CGRectGetMinY(v41)) {
        return -1;
      }
      v42.origin.x = v7;
      v42.origin.y = v9;
      v42.size.width = v11;
      v42.size.height = v13;
      double rectc = CGRectGetMinY(v42);
      v43.origin.x = v15;
      v43.origin.y = v17;
      v43.size.width = v19;
      v43.size.height = v21;
      if (rectc >= CGRectGetMinY(v43))
      {
        v44.origin.x = v7;
        v44.origin.y = v9;
        v44.size.width = v11;
        v44.size.height = v13;
        double rectd = CGRectGetMinX(v44);
        v45.origin.x = v15;
        v45.origin.y = v17;
        v45.size.width = v19;
        v45.size.height = v21;
        if (rectd > CGRectGetMinX(v45)) {
          return -1;
        }
        v46.origin.x = v7;
        v46.origin.y = v9;
        v46.size.width = v11;
        v46.size.height = v13;
        double recte = CGRectGetMinX(v46);
        v47.origin.x = v15;
        v47.origin.y = v17;
        v47.size.width = v19;
        v47.size.height = v21;
        if (recte >= CGRectGetMinX(v47))
        {
LABEL_14:
          v48.origin.x = v7;
          v48.origin.y = v9;
          v48.size.width = v11;
          v48.size.height = v13;
          CGFloat rect = v9;
          CGFloat v27 = v15;
          CGFloat v28 = v17;
          double MinX = CGRectGetMinX(v48);
          v49.origin.x = v27;
          v49.origin.y = v28;
          v49.size.width = v19;
          v49.size.height = v21;
          if (MinX >= CGRectGetMinX(v49))
          {
            v50.origin.x = v7;
            v50.origin.y = rect;
            v50.size.width = v11;
            v50.size.height = v13;
            double v30 = CGRectGetMinX(v50);
            v51.origin.x = v27;
            v51.origin.y = v28;
            v51.size.width = v19;
            v51.size.height = v21;
            return v30 > CGRectGetMinX(v51);
          }
          return -1;
        }
      }
    }
    else
    {
      v52.origin.x = v7;
      v52.origin.y = v9;
      v52.size.width = v11;
      v52.size.height = v13;
      CGFloat recta = v9;
      CGFloat v31 = v17;
      double v32 = CGRectGetMinX(v52);
      v53.origin.x = v15;
      v53.origin.y = v31;
      v53.size.width = v19;
      v53.size.height = v21;
      if (v32 > CGRectGetMinX(v53)) {
        return -1;
      }
      v54.origin.x = v7;
      v54.origin.y = recta;
      v54.size.width = v11;
      v54.size.height = v13;
      double v33 = CGRectGetMinX(v54);
      v55.origin.x = v15;
      v55.origin.y = v31;
      v55.size.width = v19;
      v55.size.height = v21;
      if (v33 >= CGRectGetMinX(v55)) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

- (id)_accessibilityAppLayoutAtCurrentContentOffset
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  objc_super v3 = [(SBFluidSwitcherViewControllerAccessibility *)self _axCollectedAppLayouts];
  LOBYTE(v17) = 0;
  objc_opt_class();
  id v4 = [(SBFluidSwitcherViewControllerAccessibility *)self safeValueForKey:@"scrollView"];
  id v5 = __UIAccessibilityCastAsClass();

  [v5 contentOffset];
  double v7 = v6;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [(SBFluidSwitcherViewControllerAccessibility *)self _axVisibleAppLayouts];
  double v8 = 0;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v3 indexOfObject:v12];
        uint64_t v17 = 0;
        double v18 = (double *)&v17;
        uint64_t v19 = 0x3010000000;
        double v20 = &unk_2425A78AD;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        AXPerformSafeBlock();
        double v13 = v18[4];
        _Block_object_dispose(&v17, 8);
        if (vabdd_f64(v7, v13) < 0.001)
        {
          id v14 = v12;

          double v8 = v14;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  return v8;
}

void __91__SBFluidSwitcherViewControllerAccessibility__accessibilityAppLayoutAtCurrentContentOffset__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"rootModifier"];
  [v5 contentOffsetForIndex:*(void *)(a1 + 48) alignment:2];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
}

- (void)_axDidQuitApp:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"SBAppSwitcherQuitAppBundleIdentifierKey"];

  [(SBFluidSwitcherViewControllerAccessibility *)self _axCreateAppElements];
  double v6 = [(SBFluidSwitcherViewControllerAccessibility *)self _axContentView];
  double v7 = [v6 _axAppElements];
  double v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [v6 _axAppElementsDictionary];
  uint64_t v10 = (void *)[v9 mutableCopy];

  if ([v8 count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      double v12 = [v8 objectAtIndexedSubscript:v11];
      double v13 = [v12 appLayout];
      id v14 = [v13 _axBundleIdentifier];
      int v15 = [v14 isEqualToString:v5];

      if (v15) {
        break;
      }

      if (++v11 >= (unint64_t)[v8 count]) {
        goto LABEL_15;
      }
    }
    [v8 removeObjectAtIndex:v11];
    double v16 = [v12 appLayout];
    [v10 removeObjectForKey:v16];

    if ([v8 count])
    {
      if (v11) {
        uint64_t v17 = v11 - 1;
      }
      else {
        uint64_t v17 = 0;
      }
      double v18 = [v8 objectAtIndexedSubscript:v17];
    }
    else
    {
      double v18 = 0;
    }
    if (CFAbsoluteTimeGetCurrent() - *(double *)&LastCustomActionAppQuitFromSwitch > 2.0)
    {
      id v19 = v18;
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
LABEL_15:
  [v6 _axSetElementsArray:v8 dictionary:v10];
}

void __60__SBFluidSwitcherViewControllerAccessibility__axDidQuitApp___block_invoke(uint64_t a1)
{
}

- (BOOL)appElementIsAccessibilityElement:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 appLayout];
  uint64_t v6 = [v5 safeIntegerForKey:@"environment"];

  switch(v6)
  {
    case 0:
    case 3:
      double v7 = AXLogSpringboardServer();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v18 = 134218242;
        uint64_t v19 = v6;
        __int16 v20 = 2112;
        id v21 = v4;
        _os_log_impl(&dword_242561000, v7, OS_LOG_TYPE_INFO, "Invalid app switcher environment {%ld} found on element %@", (uint8_t *)&v18, 0x16u);
      }

      goto LABEL_5;
    case 1:
      uint64_t v9 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
      if ([v9 _axIsShelfSwitcherVisible])
      {
        uint64_t v10 = [(SBFluidSwitcherViewControllerAccessibility *)self _axSwitcherType];
        uint64_t v11 = v10[2]();

        if (v11 == 3) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      int v15 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
      char v16 = [v15 _axIsTypeOfMainSwitcherVisible];
      goto LABEL_16;
    case 2:
      double v12 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
      if ([v12 _axIsTypeOfMainSwitcherVisible])
      {
        double v13 = [(SBFluidSwitcherViewControllerAccessibility *)self _axSwitcherType];
        uint64_t v14 = v13[2]();

        if (v14 == 1)
        {
LABEL_11:
          BOOL v8 = 1;
          goto LABEL_17;
        }
      }
      else
      {
      }
      int v15 = [(SBFluidSwitcherViewControllerAccessibility *)self _axMainSwitcher];
      char v16 = [v15 _axIsFloatingSwitcherVisible];
LABEL_16:
      BOOL v8 = v16;

LABEL_17:
      return v8;
    default:
LABEL_5:
      BOOL v8 = 0;
      goto LABEL_17;
  }
}

@end