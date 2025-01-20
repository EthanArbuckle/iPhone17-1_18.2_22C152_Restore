@interface UIWindowSceneAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityFocusContainerMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4;
- (BOOL)_accessibilityFocusContainerMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4;
- (BOOL)_accessibilityIsFKARunningForFocusItem;
- (BOOL)_accessibilityIsSecure;
- (BOOL)_accessibilityMoveAppFocusForElementMatchingQuery:(id)a3 heading:(unint64_t)a4;
- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4;
- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4;
- (BOOL)_accessibilityResetAndClearNativeFocusSystem;
- (BOOL)_accessibilitySafeMoveInDirection:(unint64_t)a3 byGroup:(BOOL)a4 withSearchInfo:(id)a5;
- (id)_accessibilityFBSceneIdentifier;
- (id)_accessibilityFocusSystem;
- (id)_accessibilityNativeFocusElement;
- (id)_accessibilityNativeFocusableElements:(id)a3 withQueryString:(id)a4;
- (id)_accessibilityWindowScene;
- (id)_accessibilityWindowSceneIdentifier;
- (id)accessibilityIdentifier;
- (uint64_t)_accessibilityUpdateNativeFocusImmediately;
- (unsigned)_accessibilityContextId;
- (void)_accessibilityDidFocusOnApplication;
- (void)_accessibilitySetFocusEnabledInApplication:(BOOL)a3;
@end

@implementation UIWindowSceneAccessibility

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  v11 = self;
  SEL v10 = a2;
  uint64_t v9 = 0;
  char v8 = 0;
  id v7 = (id)__UIAccessibilitySafeClass();
  id v6 = v7;
  objc_storeStrong(&v7, 0);
  id v3 = (id)[v6 traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  uint64_t v9 = v4;
  BOOL v5 = 0;
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    BOOL v5 = 0;
    if (v9 != 3) {
      return v9 != 2;
    }
  }
  return v5;
}

+ (id)safeCategoryTargetClassName
{
  return @"UIWindowScene";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v14 = location;
  id v13 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = "@";
  id v3 = @"UIWindowScene";
  [location[0] validateClass:"@" hasInstanceMethod:"@" withFullSignature:0];
  uint64_t v9 = "v";
  [location[0] validateClass:v3 hasInstanceMethod:@"_invalidate" withFullSignature:0];
  uint64_t v4 = @"UIWindow";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_installFocusEventRecognizer", v9, 0);
  BOOL v5 = @"_UIFocusEventRecognizer";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"owningView", v12, 0);
  SEL v10 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_didRecognizeFocusMovementRequest:", v12, 0);
  id v6 = @"_UIFocusSearchInfo";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"initWithFocusEvaluator:", v12, "@?", 0);
  char v8 = @"_UIFocusMovementRequest";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"initWithFocusSystem:", v12, 0);
  id v7 = @"UIFocusSystem";
  [location[0] validateClass:v12 hasInstanceMethod:v12 withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_enableWithoutFocusRestoration", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_updateFocusImmediatelyToEnvironment:", v10, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"setMovementInfo:", v9, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"setSearchInfo:", v9, v12, 0);
  v11 = @"_UIFocusMovementInfo";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, @"initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:", v12, "Q", "Q", v10, v10, v10, "q", 0);
  objc_storeStrong(v14, v13);
}

- (id)_accessibilityFocusSystem
{
  id v3 = (id)[(UIWindowSceneAccessibility *)self _focusSystemSceneComponent];
  id v4 = (id)[v3 focusSystem];

  return v4;
}

- (id)_accessibilityNativeFocusElement
{
  id v3 = [(UIWindowSceneAccessibility *)self _accessibilityFocusSystem];
  id v4 = (id)[v3 focusedItem];

  return v4;
}

- (unsigned)_accessibilityContextId
{
  id v3 = (id)[(UIWindowSceneAccessibility *)self keyWindow];
  unsigned int v4 = [v3 _accessibilityContextId];

  return v4;
}

- (id)_accessibilityWindowScene
{
  return self;
}

- (id)accessibilityIdentifier
{
  return [(UIWindowSceneAccessibility *)self _accessibilityWindowSceneIdentifier];
}

- (id)_accessibilityWindowSceneIdentifier
{
  return (id)[(UIWindowSceneAccessibility *)self _sceneIdentifier];
}

- (id)_accessibilityFBSceneIdentifier
{
  id v3 = (id)[(UIWindowSceneAccessibility *)self _FBSScene];
  id v4 = (id)[v3 identifier];

  return v4;
}

- (void)_accessibilitySetFocusEnabledInApplication:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  SEL v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id location = (id)AXLogFocusEngine();
  os_log_type_t v6 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    id v3 = (id)[NSNumber numberWithBool:v8];
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v11, (uint64_t)v3, (uint64_t)v10);
    _os_log_debug_impl(&dword_2402B7000, (os_log_t)location, v6, "Setting focus %@ in scene %@", v11, 0x16u);
  }
  objc_storeStrong(&location, 0);
  id v4 = v10;
  BOOL v5 = v8;
  AXPerformSafeBlock();
  objc_storeStrong((id *)&v4, 0);
}

void __73__UIWindowSceneAccessibility__accessibilitySetFocusEnabledInApplication___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _accessibilityFocusSystem];
  [v2 _setEnabled:*(unsigned char *)(a1 + 40) & 1];
}

- (void)_accessibilityDidFocusOnApplication
{
  SEL v9 = self;
  v8[1] = (id)a2;
  v8[0] = [(UIWindowSceneAccessibility *)self _accessibilityNativeFocusElement];
  if (!v8[0])
  {
    id location = (id)FKALogCommon();
    char v6 = 1;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      log = location;
      os_log_type_t type = v6;
      __os_log_helper_16_0_0(v5);
      _os_log_impl(&dword_2402B7000, log, type, "Manually poking focus system in AssistiveTouch because no focused item was found.", v5, 2u);
    }
    objc_storeStrong(&location, 0);
    id v4 = v9;
    AXPerformSafeBlock();
    [(UIWindowSceneAccessibility *)v9 _accessibilityMoveFocusWithHeading:16];
    objc_storeStrong((id *)&v4, 0);
  }
  objc_storeStrong(v8, 0);
}

void __65__UIWindowSceneAccessibility__accessibilityDidFocusOnApplication__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _accessibilityFocusSystem];
  [v1 _enableWithoutFocusRestoration];
}

- (BOOL)_accessibilitySafeMoveInDirection:(unint64_t)a3 byGroup:(BOOL)a4 withSearchInfo:(id)a5
{
  v19 = self;
  SEL v18 = a2;
  v17 = (void *)a3;
  BOOL v16 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  uint64_t v10 = 0;
  v11 = &v10;
  int v12 = 0x20000000;
  int v13 = 32;
  char v14 = 0;
  id v7 = v19;
  BOOL v9 = v16;
  id v8[2] = v17;
  v8[0] = location;
  v8[1] = &v10;
  AXPerformSafeBlock();
  char v6 = *((unsigned char *)v11 + 24);
  objc_storeStrong(v8, 0);
  objc_storeStrong((id *)&v7, 0);
  _Block_object_dispose(&v10, 8);
  objc_storeStrong(&location, 0);
  return v6 & 1;
}

void __87__UIWindowSceneAccessibility__accessibilitySafeMoveInDirection_byGroup_withSearchInfo___block_invoke(uint64_t a1)
{
  v23[2] = (id)a1;
  v23[1] = (id)a1;
  id v10 = (id)[*(id *)(a1 + 32) keyWindow];
  char v21 = 0;
  char v19 = 0;
  if (v10)
  {
    id v1 = v10;
  }
  else
  {
    BOOL v8 = (void *)*MEMORY[0x263F1D020];
    id v22 = (id)[*(id *)(a1 + 32) screen];
    char v21 = 1;
    id v20 = (id)objc_msgSend(v8, "_keyWindowForScreen:");
    char v19 = 1;
    id v1 = v20;
  }
  v23[0] = v1;
  if (v19) {

  }
  if (v21) {
  id v18 = (id)[v23[0] safeValueForKey:@"_focusEventRecognizer"];
  }
  uint64_t v17 = 0;
  uint64_t v2 = 2;
  if ((*(unsigned char *)(a1 + 64) & 1) == 0) {
    uint64_t v2 = 0;
  }
  uint64_t v17 = v2;
  char v16 = 0;
  char v16 = (*(unsigned char *)(a1 + 64) ^ 1) & 1;
  char v14 = 0;
  objc_opt_class();
  id v7 = (id)[v18 safeValueForKey:@"_focusMovementSystem"];
  id v13 = (id)__UIAccessibilityCastAsClass();

  id v12 = v13;
  objc_storeStrong(&v13, 0);
  id v15 = v12;
  id v3 = objc_alloc(NSClassFromString(&cfstr_Uifocusmovemen.isa));
  id v11 = (id)[v3 initWithFocusSystem:v15];
  id v5 = v11;
  id v4 = objc_alloc(NSClassFromString(&cfstr_Uifocusmovemen_0.isa));
  id v6 = (id)[v4 initWithHeading:*(void *)(a1 + 56) linearHeading:0 isInitial:1 shouldLoadScrollableContainer:v16 & 1 looping:0 groupFilter:v17];
  objc_msgSend(v5, "setMovementInfo:");

  [v11 setSearchInfo:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v18 _didRecognizeFocusMovementRequest:v11] & 1;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v23, 0);
}

- (BOOL)_accessibilityFocusContainerMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  id v10 = self;
  SEL v9 = a2;
  unint64_t v8 = a3;
  BOOL v7 = a4;
  id v6 = self;
  AXPerformSafeBlock();
  BOOL v5 = [(UIWindowSceneAccessibility *)v10 _accessibilityMoveFocusWithHeading:v8 byGroup:v7];
  objc_storeStrong((id *)&v6, 0);
  return v5;
}

void __87__UIWindowSceneAccessibility__accessibilityFocusContainerMoveFocusWithHeading_byGroup___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _accessibilityFocusSystem];
  [v1 _enableWithoutFocusRestoration];
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v27 = self;
  SEL v26 = a2;
  unint64_t v25 = a3;
  BOOL v24 = a4;
  id location = (id)AXLogFocusEngine();
  os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    id v8 = (id)[NSNumber numberWithUnsignedInteger:v25];
    id v7 = (id)[NSNumber numberWithBool:v24];
    __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v28, (uint64_t)v8, (uint64_t)v7, (uint64_t)v27);
    _os_log_debug_impl(&dword_2402B7000, (os_log_t)location, v22, "Moving focus with heading: %@, byGroup: %@, in scene: %@", v28, 0x20u);
  }
  objc_storeStrong(&location, 0);
  id v21 = [(UIWindowSceneAccessibility *)v27 _accessibilityNativeFocusElement];
  char v20 = [v21 _accessibilityMoveFocusWithHeading:v25] & 1;
  if (!v20)
  {
    BOOL v19 = (v25 & 0x300) != 0;
    uint64_t v11 = 0;
    id v12 = &v11;
    int v13 = 838860800;
    int v14 = 48;
    id v15 = __Block_byref_object_copy__2;
    char v16 = __Block_byref_object_dispose__2;
    id v17 = 0;
    AXPerformSafeBlock();
    id v10 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
    objc_storeStrong(&v17, 0);
    id v18 = v10;
    BOOL v9 = (v25 & 0xF) != 0;
    [v10 setForceFocusToLeaveContainer:(v25 & 0xF) == 0];
    char v6 = 1;
    if (!v9) {
      char v6 = v19;
    }
    [v18 setTreatFocusableItemAsLeaf:v6 & 1];
    char v20 = [(UIWindowSceneAccessibility *)v27 _accessibilitySafeMoveInDirection:v25 byGroup:v24 withSearchInfo:v18];
    objc_storeStrong(&v18, 0);
  }
  char v5 = v20;
  objc_storeStrong(&v21, 0);
  return v5 & 1;
}

void __73__UIWindowSceneAccessibility__accessibilityMoveFocusWithHeading_byGroup___block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(NSClassFromString(&cfstr_Uifocussearchi_0.isa)) initWithFocusEvaluator:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (BOOL)_accessibilityFocusContainerMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4
{
  id v10 = self;
  SEL v9 = a2;
  unint64_t v8 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  char v6 = v10;
  AXPerformSafeBlock();
  BOOL v5 = [(UIWindowSceneAccessibility *)v10 _accessibilityMoveFocusWithHeading:v8 toElementMatchingQuery:location];
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

void __102__UIWindowSceneAccessibility__accessibilityFocusContainerMoveFocusWithHeading_toElementMatchingQuery___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _accessibilityFocusSystem];
  [v1 _enableWithoutFocusRestoration];
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4
{
  id v12 = self;
  SEL v11 = a2;
  unint64_t v10 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unint64_t v8 = v12;
  AXPerformSafeBlock();
  if ((v10 & 0x300) == 0 || -[UIWindowSceneAccessibility _accessibilityResetAndClearNativeFocusSystem](v12))
  {
    id v5 = [(UIWindowSceneAccessibility *)v12 _accessibilityNativeFocusElement];
    char v6 = [v5 _accessibilityMoveFocusWithHeading:v10 toElementMatchingQuery:location];

    char v7 = v6 & 1;
    if ((v6 & 1) == 0) {
      char v7 = [(UIWindowSceneAccessibility *)v12 _accessibilityMoveAppFocusForElementMatchingQuery:location heading:v10];
    }
    char v13 = v7;
  }
  else
  {
    char v13 = 0;
  }
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(&location, 0);
  return v13 & 1;
}

void __88__UIWindowSceneAccessibility__accessibilityMoveFocusWithHeading_toElementMatchingQuery___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _accessibilityFocusSystem];
  [v1 _enableWithoutFocusRestoration];
}

- (BOOL)_accessibilityResetAndClearNativeFocusSystem
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v20 = a1;
  if (a1)
  {
    id v19 = (id)[v20 _accessibilityFocusSystem];
    uint64_t v14 = 0;
    id v15 = &v14;
    int v16 = 0x20000000;
    int v17 = 32;
    char v18 = 0;
    oslog[3] = (os_log_t)MEMORY[0x263EF8330];
    int v9 = -1073741824;
    int v10 = 0;
    SEL v11 = __74__UIWindowSceneAccessibility__accessibilityResetAndClearNativeFocusSystem__block_invoke;
    id v12 = &unk_2650AE390;
    v13[1] = &v14;
    v13[0] = v19;
    AXPerformSafeBlock();
    oslog[0] = (os_log_t)(id)AXLogFocusEngine();
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
    {
      id v3 = (id)NSStringFromBOOL();
      id location = v3;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v22, (uint64_t)location, (uint64_t)v20);
      _os_log_debug_impl(&dword_2402B7000, oslog[0], type, "reset and clear focus system: %@ windowScene: %@", v22, 0x16u);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)oslog, 0);
    char v4 = 0;
    BOOL v2 = 1;
    if ((v15[3] & 1) == 0)
    {
      id v5 = (id)[v19 focusedItem];
      char v4 = 1;
      BOOL v2 = v5 == 0;
    }
    BOOL v21 = v2;
    if (v4) {

    }
    objc_storeStrong(v13, 0);
    _Block_object_dispose(&v14, 8);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    return 0;
  }
  return v21;
}

- (BOOL)_accessibilityMoveAppFocusForElementMatchingQuery:(id)a3 heading:(unint64_t)a4
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v17 = a4;
  uint64_t v9 = 0;
  int v10 = &v9;
  int v11 = 838860800;
  int v12 = 48;
  char v13 = __Block_byref_object_copy__2;
  uint64_t v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  v8[1] = &v9;
  v8[0] = location[0];
  AXPerformSafeBlock();
  id v7 = (id)v10[5];
  objc_storeStrong(v8, 0);
  _Block_object_dispose(&v9, 8);
  objc_storeStrong(&v15, 0);
  id v16 = v7;
  [v7 setForceFocusToLeaveContainer:1];
  [v16 setTreatFocusableItemAsLeaf:0];
  BOOL v5 = [(UIWindowSceneAccessibility *)v19 _accessibilitySafeMoveInDirection:v17 byGroup:0 withSearchInfo:v16];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v5;
}

void __88__UIWindowSceneAccessibility__accessibilityMoveAppFocusForElementMatchingQuery_heading___block_invoke(uint64_t a1)
{
  v11[2] = (id)a1;
  v11[1] = (id)a1;
  id v4 = objc_alloc(NSClassFromString(&cfstr_Uifocussearchi_0.isa));
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __88__UIWindowSceneAccessibility__accessibilityMoveAppFocusForElementMatchingQuery_heading___block_invoke_2;
  int v10 = &unk_2650AE368;
  v11[0] = *(id *)(a1 + 32);
  uint64_t v1 = objc_msgSend(v4, "initWithFocusEvaluator:");
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;

  objc_storeStrong(v11, 0);
}

uint64_t __88__UIWindowSceneAccessibility__accessibilityMoveAppFocusForElementMatchingQuery_heading___block_invoke_2(id *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v16 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = (id)[location[0] _accessibilityAXAttributedUserInputLabelsIncludingFallbacks];
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v12)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v12;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(id *)(__b[1] + 8 * v8);
      id v4 = (id)[v15 localizedLowercaseString];
      id v3 = (id)[a1[4] localizedLowercaseString];
      char v5 = objc_msgSend(v4, "containsString:");

      if (v5) {
        break;
      }
      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v9) {
          goto LABEL_9;
        }
      }
    }
    char v18 = 1;
    int v13 = 1;
  }
  else
  {
LABEL_9:
    int v13 = 0;
  }

  if (!v13) {
    char v18 = 0;
  }
  objc_storeStrong(location, 0);
  return v18 & 1;
}

void __74__UIWindowSceneAccessibility__accessibilityResetAndClearNativeFocusSystem__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = (id)objc_msgSend(v1, "_contextForUpdateToEnvironment:allowsOverridingPreferedFocusEnvironments:allowsDeferral:");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v1, "_updateFocusWithContext:report:") & 1;
}

- (uint64_t)_accessibilityUpdateNativeFocusImmediately
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v16 = a1;
  if (a1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    int v13 = 0x20000000;
    int v14 = 32;
    char v15 = 0;
    oslog[3] = (os_log_t)MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    uint64_t v8 = __72__UIWindowSceneAccessibility__accessibilityUpdateNativeFocusImmediately__block_invoke;
    unint64_t v9 = &unk_2650AE390;
    v10[1] = &v11;
    v10[0] = v16;
    AXPerformSafeBlock();
    oslog[0] = (os_log_t)(id)AXLogFocusEngine();
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
    {
      id v2 = (id)NSStringFromBOOL();
      id location = v2;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v18, (uint64_t)location, (uint64_t)v16);
      _os_log_debug_impl(&dword_2402B7000, oslog[0], type, "did update native focus system: %@ windowScene: %@", v18, 0x16u);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)oslog, 0);
    char v17 = v12[3] & 1;
    objc_storeStrong(v10, 0);
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    char v17 = 0;
  }
  return v17 & 1;
}

void __72__UIWindowSceneAccessibility__accessibilityUpdateNativeFocusImmediately__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _accessibilityFocusSystem];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 _updateFocusImmediatelyToEnvironment:0] & 1;
}

- (id)_accessibilityNativeFocusableElements:(id)a3 withQueryString:(id)a4
{
  unint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityNativeFocusableElements:v9 withQueryString:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (BOOL)_accessibilityIsSecure
{
  return 0;
}

@end