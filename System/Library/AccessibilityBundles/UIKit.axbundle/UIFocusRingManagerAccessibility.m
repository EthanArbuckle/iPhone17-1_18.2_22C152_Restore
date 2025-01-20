@interface UIFocusRingManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (Class)shapeLayerClassForItem:(id)a3 client:(id)a4;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
+ (void)moveRingToFocusItem:(id)a3 forClient:(id)a4;
+ (void)removeRingFromFocusItem:(id)a3 forClient:(id)a4;
- (BOOL)_focusItemWantsFocusRing:(id)a3 forClient:(id)a4;
- (id)_focusRingPathForItem:(id)a3 inView:(id)a4;
@end

@implementation UIFocusRingManagerAccessibility

void __69__UIFocusRingManagerAccessibility_removeRingFromFocusItem_forClient___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 40) manager];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

+ (void)removeRingFromFocusItem:(id)a3 forClient:(id)a4
{
  id v17 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  v14.receiver = v17;
  v14.super_class = (Class)&OBJC_METACLASS___UIFocusRingManagerAccessibility;
  objc_msgSendSuper2(&v14, sel_removeRingFromFocusItem_forClient_, location[0], v15);
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) == 0)
  {
    uint64_t v6 = 0;
    v7 = &v6;
    int v8 = 838860800;
    int v9 = 48;
    v10 = __Block_byref_object_copy__9;
    v11 = __Block_byref_object_dispose__9;
    id v12 = 0;
    AXPerformSafeBlock();
    id v5 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
    objc_storeStrong(&v12, 0);
    id v13 = v5;
    [v5 _removeActiveFocusLayersForClient:@"AXFKATextFieldClient"];
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

+ (id)safeCategoryTargetClassName
{
  return @"UIFocusRingManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = "@";
  v4 = @"UIFocusRingManager";
  [location[0] validateClass:"@" hasClassMethod:"@" withFullSignature:0];
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, @"moveRingToFocusItem:forClient:", v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, @"removeRingFromFocusItem:forClient:", v3, v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, @"manager", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_removeActiveFocusLayersForClient:", v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_focusRingPathForItem:inView:", v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_focusItemWantsFocusRing:forClient:", "B", v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_viewToAddFocusLayerForItem:forClient:", v5, v5, 0);
  objc_storeStrong(v7, v6);
}

+ (Class)shapeLayerClassForItem:(id)a3 client:(id)a4
{
  id v11 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  if ([v9 isEqualToString:@"AXSpeakFingerManager"]) {
    goto LABEL_4;
  }
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    [v9 isEqualToString:@"AXFKATextFieldClient"];
LABEL_4:
    id v12 = (id)objc_opt_class();
    int v8 = 1;
    goto LABEL_6;
  }
  v7.receiver = v11;
  v7.super_class = (Class)&OBJC_METACLASS___UIFocusRingManagerAccessibility;
  id v12 = objc_msgSendSuper2(&v7, sel_shapeLayerClassForItem_client_, location[0], v9);
  int v8 = 1;
LABEL_6:
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  v4 = v12;

  return (Class)v4;
}

- (BOOL)_focusItemWantsFocusRing:(id)a3 forClient:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  char v16 = [v17 isEqualToString:@"AXSpeakFingerManager"] & 1;
  char v14 = 0;
  objc_opt_class();
  id v13 = (id)__UIAccessibilityCastAsClass();
  id v12 = v13;
  objc_storeStrong(&v13, 0);
  id v15 = v12;
  unsigned __int8 v11 = 0;
  char v7 = 0;
  if ([v12 _accessibilityIsFocusForFocusEverywhereRunningForFocusItem]) {
    char v7 = [v15 _accessibilityDisplayFocusIndicatorForFocusEverywhereView];
  }
  unsigned __int8 v11 = v7 & 1;
  id v10 = (id)[v15 _accessibilityParentView];
  int v6 = 1;
  if (([v10 _accessibilityIsFKARunningForFocusItem] & 1) == 0)
  {
    int v6 = 1;
    if ((v16 & 1) == 0) {
      int v6 = v11;
    }
  }
  if (v6)
  {
    unsigned int v5 = v6;
  }
  else
  {
    v9.receiver = v19;
    v9.super_class = (Class)UIFocusRingManagerAccessibility;
    unsigned int v5 = [(UIFocusRingManagerAccessibility *)&v9 _focusItemWantsFocusRing:location[0] forClient:v17];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v5 != 0;
}

- (id)_focusRingPathForItem:(id)a3 inView:(id)a4
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v7 = (id)[v15 traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  uint64_t v14 = v8;
  BOOL v13 = 0;
  BOOL v9 = 0;
  if (v8 != 3) {
    BOOL v9 = v14 != 2;
  }
  BOOL v13 = v9;
  if (!v9
    || ((id v12 = (id)[location[0] accessibilityPath]) == 0
      ? (int v11 = 0)
      : (id v18 = (id)UIAccessibilityConvertAccessibilityPathToViewCoordinates(),
         int v11 = 1),
        objc_storeStrong(&v12, 0),
        !v11))
  {
    v10.receiver = v17;
    v10.super_class = (Class)UIFocusRingManagerAccessibility;
    id v18 = [(UIFocusRingManagerAccessibility *)&v10 _focusRingPathForItem:location[0] inView:v15];
    int v11 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  v4 = v18;

  return v4;
}

+ (void)moveRingToFocusItem:(id)a3 forClient:(id)a4
{
  id v19 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  char v15 = 0;
  objc_opt_class();
  id v14 = (id)__UIAccessibilityCastAsClass();
  id v13 = v14;
  objc_storeStrong(&v14, 0);
  id v16 = v13;
  id v4 = v13;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  objc_super v10 = __65__UIFocusRingManagerAccessibility_moveRingToFocusItem_forClient___block_invoke;
  int v11 = &unk_2650AEDC8;
  id v12 = v13;
  [v4 accessibilityEnumerateAncestorsUsingBlock:&v7];
  v21 = (dispatch_once_t *)&moveRingToFocusItem_forClient__onceToken;
  id v20 = 0;
  objc_storeStrong(&v20, &__block_literal_global_20);
  if (*v21 != -1) {
    dispatch_once(v21, v20);
  }
  objc_storeStrong(&v20, 0);
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0
    && (([v17 isEqualToString:@"FocusEngineClient"] & 1) != 0
     || ([v17 isEqualToString:@"AXFKATextFieldClient"] & 1) != 0)
    && !_AXSFullKeyboardAccessFocusRingEnabled())
  {
    [MEMORY[0x263F1C648] removeRingFromFocusItem:location[0] forClient:v17];
  }
  else
  {
    v6.receiver = v19;
    v6.super_class = (Class)&OBJC_METACLASS___UIFocusRingManagerAccessibility;
    objc_msgSendSuper2(&v6, sel_moveRingToFocusItem_forClient_, location[0], v17);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __65__UIFocusRingManagerAccessibility_moveRingToFocusItem_forClient___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (([location[0] _accessibilityRemembersLastFocusedChild] & 1) != 0 && location[0] != (id)a1[4]) {
    [location[0] _axSetLastFocusedChild:a1[4]];
  }
  objc_storeStrong(location, 0);
}

void __65__UIFocusRingManagerAccessibility_moveRingToFocusItem_forClient___block_invoke_2()
{
  id v4 = (id)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v2 = *MEMORY[0x263F8B1C0];
  id v3 = (id)[MEMORY[0x263F08A48] mainQueue];
  id v0 = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v2, 0);
  id v1 = (void *)moveRingToFocusItem_forClient__FocusRingEnabledObserver;
  moveRingToFocusItem_forClient__FocusRingEnabledObserver = (uint64_t)v0;
}

void __65__UIFocusRingManagerAccessibility_moveRingToFocusItem_forClient___block_invoke_3(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7[1] = a1;
  id v4 = (id)[MEMORY[0x263F1C920] mainScreen];
  v7[0] = (id)[v4 _accessibilityNativeFocusElement];

  BOOL v6 = _AXSFullKeyboardAccessFocusRingEnabled() != 0;
  if (v7[0])
  {
    if (v6) {
      [MEMORY[0x263F1C648] moveRingToFocusItem:v7[0] forClient:@"FocusEngineClient"];
    }
    else {
      [MEMORY[0x263F1C648] removeRingFromFocusItem:v7[0] forClient:@"FocusEngineClient"];
    }
  }
  else if (v6)
  {
    id v5 = (id)[MEMORY[0x263F1CBC8] _applicationKeyWindow];
    if (v5)
    {
      id v2 = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:v5];
      [v2 setNeedsFocusUpdate];
    }
    objc_storeStrong(&v5, 0);
  }
  AXPerformSafeBlock();
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
}

void __65__UIFocusRingManagerAccessibility_moveRingToFocusItem_forClient___block_invoke_4(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v6 = a1;
  char v5 = 0;
  objc_opt_class();
  id v2 = (id)[MEMORY[0x263F1CBC8] _applicationKeyWindow];
  id v1 = (id)[v2 firstResponder];
  id v4 = (id)__UIAccessibilityCastAsSafeCategory();

  id v3 = v4;
  objc_storeStrong(&v4, 0);
  -[UITextInputUIResponderAccessibility _axDrawFocusRingAroundFirstResponderAndMoveFocus:](v3, 0);
}

@end