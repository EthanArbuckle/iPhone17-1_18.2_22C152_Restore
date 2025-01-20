@interface SBSlideOverTongueViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axPerformGestureForAction:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (id)_accessibilityActionsForSlideOverApp;
- (id)_accessibilitySlideOverApplication;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityIdentification;
- (id)accessibilityLabel;
- (unint64_t)_accessibilityState;
- (unint64_t)accessibilityTraits;
@end

@implementation SBSlideOverTongueViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBSlideOverTongueView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"_switcherControllerForDisplayItem:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"_deviceApplicationSceneHandleForDisplayItem:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"bundleIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSlideOverTongueView", @"state", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSlideOverTongueView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"rootModifier", "@", 0);
  [v3 validateClass:@"SBMainSwitcherRootSwitcherModifier" isKindOfClass:@"SBSwitcherModifier"];
  [v3 validateClass:@"SBSwitcherModifier" conformsToProtocol:@"SBSwitcherMultitaskingQueryProviding"];
  [v3 validateProtocol:@"SBSwitcherMultitaskingQueryProviding" conformsToProtocol:@"SBSwitcherQueryProviding"];
  [v3 validateProtocol:@"SBSwitcherQueryProviding" hasRequiredInstanceMethod:@"appLayoutToAttachSlideOverTongue"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"allItems", "@", 0);
  [v3 validateClass:@"SBDeviceApplicationSceneHandle" isKindOfClass:@"SBApplicationSceneHandle"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationSceneHandle", @"application", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SBSlideOverTongueViewAccessibility *)self _accessibilitySlideOverApplication];
  id v3 = [v2 safeStringForKey:@"displayName"];
  if ([v3 length])
  {
    v4 = NSString;
    v5 = accessibilityLocalizedString(@"app.pip.nib.label");
    v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);
  }
  else
  {
    v6 = accessibilityLocalizedString(@"app.pip.slide.over.tongue");
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)SBSlideOverTongueViewAccessibility;
  unint64_t v3 = [(SBSlideOverTongueViewAccessibility *)&v8 accessibilityTraits];
  v4 = [(SBSlideOverTongueViewAccessibility *)self _accessibilitySlideOverApplication];
  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | v3;

  return v6;
}

- (id)accessibilityHint
{
  if ([(SBSlideOverTongueViewAccessibility *)self _accessibilityState] == 1)
  {
    v2 = accessibilityLocalizedString(@"app.pip.slide.over.tongue.hint");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)accessibilityIdentification
{
  v2 = [(SBSlideOverTongueViewAccessibility *)self _accessibilitySlideOverApplication];
  unint64_t v3 = [v2 safeStringForKey:@"bundleIdentifier"];

  return v3;
}

- (CGRect)accessibilityFrame
{
  v2 = [(SBSlideOverTongueViewAccessibility *)self safeUIViewForKey:@"_tongueContainerView"];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 1)
  {
    double v3 = [MEMORY[0x263F22968] server];
    char v4 = [v3 performMedusaGesture:16];

    UIAccessibilityPostNotification(*MEMORY[0x263F1CE30], &stru_26F7D3690);
    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBSlideOverTongueViewAccessibility;
    return -[SBSlideOverTongueViewAccessibility accessibilityScroll:](&v6, sel_accessibilityScroll_);
  }
}

- (id)accessibilityCustomActions
{
  double v3 = AXSpringBoardFloatingBundleID();
  if (v3
    && ([(SBSlideOverTongueViewAccessibility *)self accessibilityIdentification],
        char v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:v3],
        v4,
        v5))
  {
    objc_super v6 = [(SBSlideOverTongueViewAccessibility *)self _accessibilityActionsForSlideOverApp];
  }
  else
  {
    objc_super v6 = 0;
  }
  if ([v6 count])
  {
    id v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSlideOverTongueViewAccessibility;
    id v7 = [(SBSlideOverTongueViewAccessibility *)&v10 accessibilityCustomActions];
  }
  double v8 = v7;

  return v8;
}

- (id)_accessibilitySlideOverApplication
{
  v2 = [(SBSlideOverTongueViewAccessibility *)self safeValueForKey:@"delegate"];
  double v3 = [v2 safeValueForKeyPath:@"rootModifier.appLayoutToAttachSlideOverTongue"];
  char v4 = [v3 safeArrayForKey:@"allItems"];
  int v5 = [v4 firstObject];

  AXSBMainSwitcherControllerCoordinatorSharedInstance();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v5;
  AXPerformSafeBlock();
  id v6 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  id v11 = v6;
  id v12 = v14;
  AXPerformSafeBlock();
  id v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  double v8 = objc_msgSend(v7, "safeValueForKey:", @"application", v10, 3221225472, __72__SBSlideOverTongueViewAccessibility__accessibilitySlideOverApplication__block_invoke_2, &unk_265153DF0);

  return v8;
}

uint64_t __72__SBSlideOverTongueViewAccessibility__accessibilitySlideOverApplication__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _switcherControllerForDisplayItem:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __72__SBSlideOverTongueViewAccessibility__accessibilitySlideOverApplication__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _deviceApplicationSceneHandleForDisplayItem:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityActionsForSlideOverApp
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = AXSpringBoardFloatingAppLabel();
  double v3 = [MEMORY[0x263F22968] server];
  char v4 = [v3 allowedMedusaGestures];

  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v29 = [(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v32 + 1) + 8 * v9) integerValue];
        switch(v10)
        {
          case 5:
          case 6:
            id v11 = NSString;
            id v12 = accessibilityLocalizedString(@"app.pip.nib.action.create.split.view.app");
            id v13 = objc_msgSend(v11, "stringWithFormat:", v12, v2);

            if (v13) {
              goto LABEL_18;
            }
            break;
          case 9:
            uint64_t v15 = NSString;
            if (v29 == 1)
            {
              uint64_t v16 = accessibilityLocalizedString(@"app.pip.nib.action.move.app.left");
              v28 = (void *)v16;
            }
            else
            {
              uint64_t v16 = accessibilityLocalizedString(@"app.pip.nib.action.move.app.right");
              v27 = (void *)v16;
            }
            id v13 = objc_msgSend(v15, "stringWithFormat:", v16, v2);
            if (v29 == 1) {
              v22 = v28;
            }
            else {
              v22 = v27;
            }
            goto LABEL_29;
          case 10:
            uint64_t v17 = NSString;
            if (v29 == 1)
            {
              uint64_t v18 = accessibilityLocalizedString(@"app.pip.nib.action.move.app.right");
              v26 = (void *)v18;
            }
            else
            {
              uint64_t v18 = accessibilityLocalizedString(@"app.pip.nib.action.move.app.left");
              v25 = (void *)v18;
            }
            id v13 = objc_msgSend(v17, "stringWithFormat:", v18, v2);
            if (v29 == 1) {
              v22 = v26;
            }
            else {
              v22 = v25;
            }
LABEL_29:

            if (!v13) {
              break;
            }
            goto LABEL_18;
          case 14:
            v19 = NSString;
            id v20 = accessibilityLocalizedString(@"app.pip.nib.action.dismiss.app");
            id v13 = objc_msgSend(v19, "stringWithFormat:", v20, v2);

            if (!v13) {
              break;
            }
            goto LABEL_18;
          case 15:
            id v14 = @"app.pip.open.floating.switcher";
            goto LABEL_17;
          case 16:
            id v14 = @"app.pip.swipe.right.floating.switcher";
LABEL_17:
            id v13 = accessibilityLocalizedString(v14);
            if (v13)
            {
LABEL_18:
              v21 = [[AXSBSideAppCustomAction alloc] initWithName:v13 gesture:v10 target:self selector:sel__axPerformGestureForAction_];
              [v31 axSafelyAddObject:v21];
            }
            break;
          default:
            break;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v23 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
      uint64_t v7 = v23;
    }
    while (v23);
  }

  return v31;
}

- (BOOL)_axPerformGestureForAction:(id)a3
{
  double v3 = (void *)MEMORY[0x263F22968];
  id v4 = a3;
  id v5 = [v3 server];
  uint64_t v6 = [v4 gesture];

  LOBYTE(v4) = [v5 performMedusaGesture:v6];
  return (char)v4;
}

- (unint64_t)_accessibilityState
{
  return [(SBSlideOverTongueViewAccessibility *)self safeUnsignedIntegerForKey:@"state"];
}

@end