@interface SBFluidSwitcherItemContainerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanCloseApp;
- (BOOL)_accessibilityCanPerformAction:(int)a3;
- (BOOL)_accessibilityElementVisibilityAffectsLayout;
- (BOOL)_accessibilityHasMultipleWindows;
- (BOOL)_accessibilityIsInAppSwitcher;
- (BOOL)_accessibilityIsNewWindowContainer;
- (BOOL)_accessibilityIsNotFirstElement;
- (BOOL)_accessibilityIsShelfItemContainer;
- (BOOL)_accessibilityIsSlideOver;
- (BOOL)_accessibilityRetainsCustomRotorActionSetting;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (CGRect)_accessibilityVisibleFrame;
- (id)_accessibilityCustomActionGroupIdentifier;
- (id)_accessibilityItemContainerFooterView;
- (id)_accessibilityItemContainerHeaderView;
- (id)_accessibilityPreferredScrollActions;
- (id)_accessibilityScrollStatus;
- (id)_accessibilityTitleItem;
- (id)_axAppLayout;
- (id)_axBundleIdentifier;
- (id)_axFluidSwitcher;
- (id)_axMainSwitcher;
- (id)_axParentAppLayout;
- (id)_viewToAddFocusLayer;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityCloseApp:(id)a3;
@end

@implementation SBFluidSwitcherItemContainerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFluidSwitcherItemContainer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherItemContainer", @"isKillable", "B", 0);
  [v3 validateClass:@"SBFluidSwitcherItemContainer" hasInstanceVariable:@"_delegate" withType:"<SBFluidSwitcherItemContainerDelegate>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"_scrollToAppLayout:animated:alignment:completion:", "v", "@", "B", "q", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"appLayouts", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherItemContainer" hasInstanceVariable:@"_appLayout" withType:"SBAppLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBContinuityDisplayItem", @"appSuggestion", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBestAppSuggestion", @"originatingDeviceType", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBestAppSuggestion", @"isLocallyGeneratedSuggestion", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"isOrContainsAppLayout:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherSpaceTitleItem", @"titleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherSpaceTitleItem", @"subtitleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherSpaceTitleItem", @"showsMultiWindowIndicator", "B", 0);
  [v3 validateClass:@"SBFluidSwitcherItemContainer" hasInstanceVariable:@"_pageView" withType:"SBAppSwitcherPageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppSwitcherPageView", @"cornerRadii", "{UIRectCornerRadii=dddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayoutAccessibility", @"_axLabelForInCallService", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"bundleIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"killContainer:forReason:", "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationController", @"applicationWithBundleIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"enumerate:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"environment", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDisplayItem", @"type", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"itemForLayoutRole:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"visibleUnderlayAccessoryViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"layoutRoleForItem:", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"visibleOverlayAccessoryViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherItemContainerHeaderView", @"titleItems", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherItemContainerFooterView" hasInstanceVariable:@"_titleItems" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherItemContainerHeaderView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherSpaceUnderlayAccessoryView", @"itemContainerHeaderView:didSelectTitleItem:", "v", "@", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherSpaceUnderlayAccessoryView" hasInstanceVariable:@"_headerView" withType:"SBFluidSwitcherItemContainerHeaderView"];
  [v3 validateClass:@"SBFluidSwitcherSpaceOverlayAccessoryView" hasInstanceVariable:@"_footerView" withType:"SBFluidSwitcherItemContainerFooterView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"leafAppLayouts", "@", 0);
  [v3 validateClass:@"SBFluidSwitcherItemContainer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"isChamoisWindowingUIEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"didSelectContainer:modifierFlags:", "v", "@", "q", 0);
}

- (id)_axBundleIdentifier
{
  v2 = [(SBFluidSwitcherItemContainerAccessibility *)self _axAppLayout];
  id v3 = [v2 _axBundleIdentifier];

  return v3;
}

- (BOOL)_accessibilityIsInAppSwitcher
{
  return 1;
}

- (id)accessibilityPath
{
  v2 = [(SBFluidSwitcherItemContainerAccessibility *)self safeUIViewForKey:@"_pageView"];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x4010000000;
  v8[3] = &unk_2425A78AD;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v6 = MEMORY[0x263EF8330];
  v7 = v2;
  AXPerformSafeBlock();

  _Block_object_dispose(v8, 8);
  [(UIView *)v7 bounds];
  UIRectInsetEdges();
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1);
  id v3 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v4 = UIAccessibilityConvertPathToScreenCoordinates(v3, v7);

  return v4;
}

uint64_t __62__SBFluidSwitcherItemContainerAccessibility_accessibilityPath__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cornerRadii];
  id v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (id)accessibilityLabel
{
  id v3 = [(SBFluidSwitcherItemContainerAccessibility *)self _axAppLayout];
  uint64_t v4 = [v3 _axBundleIdentifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x263F21248]];

  if (v5)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__5;
    v28 = __Block_byref_object_dispose__5;
    id v29 = 0;
    id v23 = v3;
    AXPerformSafeBlock();
    uint64_t v6 = (__CFString *)(id)v25[5];

    _Block_object_dispose(&v24, 8);
    if ([(__CFString *)v6 length])
    {
      uint64_t v7 = v6;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v6 = &stru_26F7D3690;
  }
  v8 = [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityTitleItem];
  long long v9 = [v8 safeValueForKey:@"titleText"];
  v22 = [v8 safeValueForKey:@"subtitleText"];
  long long v10 = __UIAXStringForVariables();

  v11 = [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityItemContainerHeaderView];
  v12 = [v11 safeArrayForKey:@"_titleItems"];

  v13 = [(SBFluidSwitcherItemContainerAccessibility *)self _axMainSwitcher];
  if (![v13 _axIsAppSwitcherPeeking]) {
    goto LABEL_11;
  }
  uint64_t v14 = [v12 count];

  if (v14)
  {
    v15 = [v12 firstObject];
    v13 = [v15 safeValueForKey:@"titleText"];

    v16 = [(SBFluidSwitcherItemContainerAccessibility *)self _axMainSwitcher];
    if ([v16 _axIsAppSwitcherPeekingSlideOver]) {
      v17 = @"temporary.slide.over";
    }
    else {
      v17 = @"temporary.split.view";
    }
    v18 = accessibilityLocalizedString(v17);

    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", v18, v13);

    long long v10 = (void *)v19;
LABEL_11:
  }
  if (![v10 length])
  {
    uint64_t v20 = [v3 _axDisplayName];

    long long v10 = (void *)v20;
  }
  uint64_t v7 = v10;

LABEL_15:

  return v7;
}

uint64_t __63__SBFluidSwitcherItemContainerAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _axLabelForInCallService];

  return MEMORY[0x270F9A758]();
}

- (id)accessibilityValue
{
  id v3 = [(SBFluidSwitcherItemContainerAccessibility *)self _axMainSwitcher];
  char v4 = [v3 _axIsChamoisSwitcherVisible];

  if (v4)
  {
    int v5 = 0;
    goto LABEL_13;
  }
  uint64_t v6 = [(SBFluidSwitcherItemContainerAccessibility *)self _axAppLayout];
  uint64_t v7 = [(SBFluidSwitcherItemContainerAccessibility *)self _axParentAppLayout];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __63__SBFluidSwitcherItemContainerAccessibility_accessibilityValue__block_invoke;
  v25 = &unk_265153DF0;
  v28 = &v16;
  id v8 = v7;
  id v26 = v8;
  id v9 = v6;
  id v27 = v9;
  AXPerformSafeBlock();
  uint64_t v10 = v17[3];

  _Block_object_dispose(&v16, 8);
  if (v10 == 1)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__5;
    uint64_t v20 = __Block_byref_object_dispose__5;
    id v21 = 0;
    id v15 = v8;
    AXPerformSafeBlock();
    id v12 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
    if (v12)
    {
      v11 = @"affordance.split.view.left";
      goto LABEL_10;
    }
  }
  else if (v10 == 2)
  {
    v11 = @"affordance.split.view.right";
    goto LABEL_10;
  }
  if (![(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityIsSlideOver])
  {
    int v5 = 0;
    goto LABEL_12;
  }
  v11 = @"affordance.slide.over";
LABEL_10:
  uint64_t v14 = accessibilityLocalizedString(v11);
  int v5 = __UIAXStringForVariables();

LABEL_12:
LABEL_13:

  return v5;
}

void __63__SBFluidSwitcherItemContainerAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) itemForLayoutRole:1];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 layoutRoleForItem:v3];
}

uint64_t __63__SBFluidSwitcherItemContainerAccessibility_accessibilityValue__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) itemForLayoutRole:2];

  return MEMORY[0x270F9A758]();
}

- (BOOL)_accessibilityIsNotFirstElement
{
  v2 = [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityValueForKey:@"AXBundleIdentifier"];
  char v3 = [v2 isEqualToString:*MEMORY[0x263F21350]];

  return v3;
}

- (BOOL)_accessibilityCanCloseApp
{
  return [(SBFluidSwitcherItemContainerAccessibility *)self safeBoolForKey:@"isKillable"];
}

- (id)accessibilityCustomActions
{
  char v3 = [MEMORY[0x263EFF980] array];
  if ([(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityCanCloseApp])
  {
    char v4 = NSString;
    int v5 = accessibilityLocalizedString(@"close.app.from.switcher.title");
    uint64_t v6 = [(SBFluidSwitcherItemContainerAccessibility *)self accessibilityLabel];
    uint64_t v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);

    id v8 = [MEMORY[0x263F21660] axAttributedStringWithString:v7];
    [v8 setAttribute:@"AXCloseApp" forKey:*MEMORY[0x263F216A0]];
    id v9 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v8 target:self selector:sel__accessibilityCloseApp_];
    [v9 _accessibilitySetInternalCustomActionIdentifier:@"AX_CLOSE"];
    [v3 addObject:v9];
  }
  if ([(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityHasMultipleWindows])
  {
    objc_initWeak(&location, self);
    id v10 = objc_alloc(MEMORY[0x263F1C390]);
    v11 = accessibilityLocalizedString(@"show.all.shelf.windows");
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke;
    v21[3] = &unk_2651540F8;
    objc_copyWeak(&v22, &location);
    id v12 = (void *)[v10 initWithName:v11 actionHandler:v21];

    [v3 axSafelyAddObject:v12];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  v13 = [(SBFluidSwitcherItemContainerAccessibility *)self _axMainSwitcher];
  int v14 = [v13 _axIsChamoisSwitcherVisible];

  if (v14)
  {
    objc_initWeak(&location, self);
    id v15 = objc_alloc(MEMORY[0x263F1C390]);
    uint64_t v16 = accessibilityLocalizedString(@"fluid.switcher.item.container.add.to.center.stage");
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke_3;
    v19[3] = &unk_2651540F8;
    objc_copyWeak(&v20, &location);
    v17 = (void *)[v15 initWithName:v16 actionHandler:v19];

    [v3 axSafelyAddObject:v17];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v3;
}

uint64_t __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _accessibilityItemContainerHeaderView];
  id v3 = [v2 safeValueForKey:@"_delegate"];
  id v4 = objc_loadWeakRetained(v1);
  id v5 = [v4 _accessibilityItemContainerHeaderView];
  id v6 = objc_loadWeakRetained(v1);
  uint64_t v7 = [v6 _accessibilityTitleItem];
  [v3 itemContainerHeaderView:v5 didSelectTitleItem:v7];
}

uint64_t __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"_delegate"];
  id v3 = objc_loadWeakRetained(v1);
  [v2 didSelectContainer:v3 modifierFlags:0x20000];
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  return 1;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)_accessibilityScrollStatus
{
  id v3 = [(SBFluidSwitcherItemContainerAccessibility *)self safeValueForKey:@"_delegate"];
  id v4 = [v3 safeArrayForKey:@"appLayouts"];
  id v5 = [(SBFluidSwitcherItemContainerAccessibility *)self _axAppLayout];
  [v4 indexOfObject:v5];

  [v4 count];
  id v6 = NSString;
  uint64_t v7 = accessibilityLocalizedString(@"app.switcher.location");
  id v8 = AXFormatInteger();
  id v9 = AXFormatInteger();
  id v10 = objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);

  return v10;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherItemContainerAccessibility;
  unint64_t v3 = [(SBFluidSwitcherItemContainerAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityIsNewWindowContainer];
  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (void)_accessibilityCloseApp:(id)a3
{
  unint64_t v3 = [(SBFluidSwitcherItemContainerAccessibility *)self _axAppLayout];
  LastCustomActionAppQuitFromSwitch = CFAbsoluteTimeGetCurrent();
  uint64_t v5 = v3;
  id v4 = v3;
  AXPerformSafeBlock();
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

void __68__SBFluidSwitcherItemContainerAccessibility__accessibilityCloseApp___block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  v11 = &stru_26F7D3690;
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __68__SBFluidSwitcherItemContainerAccessibility__accessibilityCloseApp___block_invoke_2;
    v5[3] = &unk_265154120;
    v5[4] = &v6;
    [v1 enumerate:v5];
  }
  if ([(id)v7[5] length])
  {
    v2 = NSString;
    unint64_t v3 = accessibilityLocalizedString(@"closing.app");
    id v4 = objc_msgSend(v2, "stringWithFormat:", v3, v7[5]);
    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }
  _Block_object_dispose(&v6, 8);
}

void __68__SBFluidSwitcherItemContainerAccessibility__accessibilityCloseApp___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = AXSBApplicationControllerSharedInstance();
  uint64_t v6 = [v4 safeValueForKey:@"bundleIdentifier"];

  objc_super v7 = [v5 applicationWithBundleIdentifier:v6];

  uint64_t v8 = [v7 safeStringForKey:@"bundleIdentifier"];
  if (v8)
  {
    id v9 = [v7 safeStringForKey:@"displayName"];
    if (v9)
    {
      id v15 = v9;
      uint64_t v16 = @"__AXStringForVariablesSentinel";
      uint64_t v10 = __AXStringForVariables();
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    v13 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v15, v16);
    v17 = @"SBAppSwitcherQuitAppBundleIdentifierKey";
    v18[0] = v8;
    int v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    [v13 postNotificationName:@"AXInternalAppSwitcherAppRemove" object:0 userInfo:v14];
  }
}

void __68__SBFluidSwitcherItemContainerAccessibility__accessibilityCloseApp___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_delegate"];
  [v2 killContainer:*(void *)(a1 + 32) forReason:0];
}

- (BOOL)_accessibilityScrollToVisible
{
  unint64_t v3 = [(SBFluidSwitcherItemContainerAccessibility *)self safeValueForKey:@"_delegate"];
  id v4 = [v3 safeArrayForKey:@"appLayouts"];
  if ([v4 count])
  {
    uint64_t v5 = [(SBFluidSwitcherItemContainerAccessibility *)self _axAppLayout];
    if (!v5 || [v4 indexOfObject:v5] != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = v3;
      id v8 = v5;
      AXPerformSafeBlock();
    }
  }

  return 1;
}

uint64_t __74__SBFluidSwitcherItemContainerAccessibility__accessibilityScrollToVisible__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scrollToAppLayout:*(void *)(a1 + 40) animated:0 alignment:2 completion:0];
}

- (CGRect)_accessibilityVisibleFrame
{
  [(SBFluidSwitcherItemContainerAccessibility *)self accessibilityFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  uint64_t v11 = [(SBFluidSwitcherItemContainerAccessibility *)self window];
  [v11 bounds];
  v27.origin.CGFloat x = v12;
  v27.origin.CGFloat y = v13;
  v27.size.CGFloat width = v14;
  v27.size.CGFloat height = v15;
  v24.origin.CGFloat x = v4;
  v24.origin.CGFloat y = v6;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v10;
  CGRect v25 = CGRectIntersection(v24, v27);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;

  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 4)
  {
    if ([(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityCanCloseApp])
    {
      BOOL v4 = 1;
      [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"AppDeleted"];
      [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityCloseApp:0];
      [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilitySetBoolValue:0 forKey:@"AppDeleted"];
      if (AXDeviceIsPad()) {
        UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A78]);
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFluidSwitcherItemContainerAccessibility;
    return -[SBFluidSwitcherItemContainerAccessibility accessibilityScroll:](&v6, sel_accessibilityScroll_);
  }
  return v4;
}

- (id)accessibilityHint
{
  if ([(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityCanCloseApp])
  {
    if ([(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityIsSlideOver]) {
      double v3 = @"swipe.up.to.hide.slide.over.hint";
    }
    else {
      double v3 = @"swipe.up.to.hide.hint";
    }
    BOOL v4 = accessibilityLocalizedString(v3);
  }
  else
  {
    BOOL v4 = 0;
  }
  if (AXDeviceIsPad())
  {
    uint64_t v5 = [(SBFluidSwitcherItemContainerAccessibility *)self _axFluidSwitcher];
    if (v5)
    {
      objc_super v6 = (void *)v5;
      double v7 = [(SBFluidSwitcherItemContainerAccessibility *)self _axFluidSwitcher];
      CGFloat v8 = [v7 _axSwitcherType];

      if (v8)
      {
        double v9 = [(SBFluidSwitcherItemContainerAccessibility *)self _axFluidSwitcher];
        CGFloat v10 = [v9 _axSwitcherType];
        uint64_t v11 = v10[2]();

        if (v11 == 1)
        {
          CGFloat v12 = [(SBFluidSwitcherItemContainerAccessibility *)self _axMainSwitcher];
          CGFloat v13 = AXSwitcherController(@"activeDisplayWindowScene", v12);

          if (([v13 safeBoolForKey:@"isChamoisWindowingUIEnabled"] & 1) == 0)
          {
            double v22 = accessibilityLocalizedString(@"app.icon.reorder.hint");
            double v23 = @"__AXStringForVariablesSentinel";
            uint64_t v14 = __UIAXStringForVariables();

            BOOL v4 = (void *)v14;
          }
        }
      }
    }
  }
  CGFloat v15 = [(SBFluidSwitcherItemContainerAccessibility *)self _axMainSwitcher];
  char v16 = [v15 _axIsAppSwitcherPeekingSlideOver];

  if (v16)
  {
    v17 = @"temporary.slide.over.hint";
  }
  else
  {
    uint64_t v18 = [(SBFluidSwitcherItemContainerAccessibility *)self _axMainSwitcher];
    int v19 = [v18 _axIsAppSwitcherPeekingSplitView];

    if (!v19) {
      goto LABEL_19;
    }
    v17 = @"temporary.split.view.hint";
  }
  uint64_t v20 = accessibilityLocalizedString(v17);

  BOOL v4 = (void *)v20;
LABEL_19:

  return v4;
}

- (BOOL)_accessibilityElementVisibilityAffectsLayout
{
  return 1;
}

- (BOOL)_accessibilityCanPerformAction:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 2008;
}

- (id)_accessibilityPreferredScrollActions
{
  v9[2] = *MEMORY[0x263EF8340];
  int v2 = [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityApplicationIsRTL];
  if (v2) {
    uint64_t v3 = 2009;
  }
  else {
    uint64_t v3 = 2008;
  }
  if (v2) {
    uint64_t v4 = 2008;
  }
  else {
    uint64_t v4 = 2009;
  }
  uint64_t v5 = [NSNumber numberWithUnsignedInt:v3];
  v9[0] = v5;
  objc_super v6 = [NSNumber numberWithUnsignedInt:v4];
  v9[1] = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  return v7;
}

- (id)_accessibilityItemContainerHeaderView
{
  uint64_t v3 = [(SBFluidSwitcherItemContainerAccessibility *)self safeValueForKey:@"_delegate"];
  uint64_t v4 = [v3 safeDictionaryForKey:@"visibleUnderlayAccessoryViews"];
  uint64_t v5 = [(SBFluidSwitcherItemContainerAccessibility *)self _axParentAppLayout];
  objc_super v6 = [v4 objectForKey:v5];
  double v7 = [v6 safeValueForKey:@"_headerView"];

  return v7;
}

- (id)_accessibilityItemContainerFooterView
{
  uint64_t v3 = [(SBFluidSwitcherItemContainerAccessibility *)self safeValueForKey:@"_delegate"];
  uint64_t v4 = [v3 safeDictionaryForKey:@"visibleOverlayAccessoryViews"];
  uint64_t v5 = [(SBFluidSwitcherItemContainerAccessibility *)self _axParentAppLayout];
  objc_super v6 = [v4 objectForKey:v5];
  double v7 = [v6 safeValueForKey:@"_footerView"];

  return v7;
}

- (id)_accessibilityTitleItem
{
  uint64_t v3 = [(SBFluidSwitcherItemContainerAccessibility *)self _axFluidSwitcher];
  if (v3)
  {
    uint64_t v4 = [(SBFluidSwitcherItemContainerAccessibility *)self _axFluidSwitcher];
    uint64_t v5 = [v4 _axSwitcherType];

    if (v5)
    {
      objc_super v6 = [(SBFluidSwitcherItemContainerAccessibility *)self _axFluidSwitcher];
      double v7 = [v6 _axSwitcherType];
      if (v7[2]() == 3) {
        [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityItemContainerFooterView];
      }
      else {
      uint64_t v3 = [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityItemContainerHeaderView];
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  CGFloat v8 = [v3 safeArrayForKey:@"_titleItems"];
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x3032000000;
  CGRect v25 = __Block_byref_object_copy__5;
  id v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __68__SBFluidSwitcherItemContainerAccessibility__accessibilityTitleItem__block_invoke;
  int v19 = &unk_265153E18;
  uint64_t v20 = self;
  double v21 = &v22;
  AXPerformSafeBlock();
  id v9 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  if (v9)
  {
    CGFloat v10 = [(SBFluidSwitcherItemContainerAccessibility *)self _axAppLayout];
    uint64_t v11 = [v10 _axDisplayItems];
    int v12 = [v11 containsObject:v9];

    if (v12)
    {
      uint64_t v13 = [v8 lastObject];
LABEL_13:
      uint64_t v14 = (void *)v13;
      goto LABEL_15;
    }
  }
  if (objc_msgSend(v8, "count", v16, v17, v18, v19, v20, v21))
  {
    uint64_t v13 = [v8 firstObject];
    goto LABEL_13;
  }
  uint64_t v14 = 0;
LABEL_15:

  return v14;
}

void __68__SBFluidSwitcherItemContainerAccessibility__accessibilityTitleItem__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _axParentAppLayout];
  uint64_t v2 = [v5 itemForLayoutRole:2];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_axParentAppLayout
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(SBFluidSwitcherItemContainerAccessibility *)self safeValueForKey:@"_delegate"];
  uint64_t v3 = [v2 safeArrayForKey:@"appLayouts"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = 0;
        uint64_t v13 = &v12;
        uint64_t v14 = 0x2020000000;
        char v15 = 0;
        AXPerformSafeBlock();
        int v8 = *((unsigned __int8 *)v13 + 24);
        _Block_object_dispose(&v12, 8);
        if (v8)
        {
          id v9 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

void __63__SBFluidSwitcherItemContainerAccessibility__axParentAppLayout__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _axAppLayout];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 isOrContainsAppLayout:v3];
}

- (BOOL)_accessibilityIsShelfItemContainer
{
  uint64_t v2 = [(SBFluidSwitcherItemContainerAccessibility *)self _axFluidSwitcher];
  id v3 = [v2 _axSwitcherType];
  BOOL v4 = v3[2]() == 3;

  return v4;
}

- (BOOL)_accessibilityHasMultipleWindows
{
  uint64_t v2 = [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityTitleItem];
  char v3 = [v2 safeBoolForKey:@"showsMultiWindowIndicator"];

  return v3;
}

- (BOOL)_accessibilityIsNewWindowContainer
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  CGFloat v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  uint64_t v5 = MEMORY[0x263EF8330];
  AXPerformSafeBlock();
  id v2 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  uint64_t v3 = objc_msgSend(v2, "safeIntegerForKey:", @"type", v5, 3221225472, __79__SBFluidSwitcherItemContainerAccessibility__accessibilityIsNewWindowContainer__block_invoke, &unk_265153E18, self, &v7);
  return v3 == 6;
}

void __79__SBFluidSwitcherItemContainerAccessibility__accessibilityIsNewWindowContainer__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _axAppLayout];
  uint64_t v2 = [v5 itemForLayoutRole:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_axAppLayout
{
  objc_opt_class();
  uint64_t v3 = [(SBFluidSwitcherItemContainerAccessibility *)self safeValueForKey:@"_appLayout"];
  BOOL v4 = __UIAccessibilityCastAsSafeCategory();

  return v4;
}

- (id)_axMainSwitcher
{
  objc_opt_class();
  uint64_t v2 = AXSBMainSwitcherControllerCoordinatorSharedInstance();
  uint64_t v3 = __UIAccessibilityCastAsSafeCategory();

  return v3;
}

- (id)_axFluidSwitcher
{
  objc_opt_class();
  uint64_t v3 = [(SBFluidSwitcherItemContainerAccessibility *)self safeValueForKey:@"_delegate"];
  BOOL v4 = __UIAccessibilityCastAsSafeCategory();

  return v4;
}

- (BOOL)_accessibilityIsSlideOver
{
  uint64_t v2 = [(SBFluidSwitcherItemContainerAccessibility *)self _axAppLayout];
  BOOL v3 = [v2 safeIntegerForKey:@"environment"] == 2;

  return v3;
}

- (id)_viewToAddFocusLayer
{
  objc_opt_class();
  BOOL v3 = [(SBFluidSwitcherItemContainerAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbfluidswitche_6.isa)];
  BOOL v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityIdentifier:@"ax-focusLayerView"];

  return v4;
}

@end