@interface UIWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsGroupedParent;
- (BOOL)_accessibilityIsInCarPlay;
- (BOOL)_accessibilityIsInJindo;
- (BOOL)_accessibilityIsSecure;
- (BOOL)_accessibilityIsUserInteractionEnabled;
- (BOOL)_accessibilitySceneContainsOnlySecureWindows;
- (BOOL)_accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren;
- (BOOL)_axShouldPostScreenChangeOnOrderFront:(BOOL)a3;
- (BOOL)_prefersFocusContainment;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityIsWindow;
- (CGPoint)warpPoint:(CGPoint)a3;
- (UIWindowAccessibility)initWithFrame:(CGRect)a3;
- (UIWindowAccessibility)initWithWindowScene:(id)a3;
- (id)_accessibilityAllRemoteElements;
- (id)_accessibilityFirstElement;
- (id)_accessibilityFirstResponderCoalesceTimer;
- (id)_accessibilityGetRemoteElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityMLRemoteElement;
- (id)_accessibilityRemoteElement;
- (id)_accessibilityUserTestingParent;
- (id)_accessibilityWindowSections;
- (id)_targetWindowForPathIndex:(int64_t)a3 atPoint:(CGPoint)a4 scenePointZ:(double)a5 forEvent:(id)a6 windowServerHitTestWindow:(id)a7;
- (id)accessibilityContainer;
- (id)accessibilityRemoteSubstituteChildren:(id)a3;
- (int)_accessibilityRemotePid;
- (int64_t)_accessibilityInterfaceOrientationForScreenCoordinates;
- (uint64_t)_accessibilityShouldUseRemoteElement;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityContextId;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityRegisterRemoteElement:(BOOL)a3;
- (void)_accessibilitySetAllRemoteElements:(id)a3;
- (void)_accessibilitySetFirstResponderCoalesceTimer:(uint64_t)a1;
- (void)_accessibilitySetRemoteElement:(uint64_t)a1;
- (void)_axCheckForExistingRemoteElements;
- (void)_axListenForRemoteElement;
- (void)_axRemoteElementRegistered:(id)a3;
- (void)_axUpdateForRemoteElement:(void *)a1;
- (void)_orderFrontWithoutMakingKey;
- (void)_setBoundContext:(id)a3;
- (void)_setFirstResponder:(id)a3;
- (void)dealloc;
- (void)makeKeyAndVisible;
@end

@implementation UIWindowAccessibility

- (CGPoint)warpPoint:(CGPoint)a3
{
  CGPoint v10 = a3;
  v9 = self;
  SEL v8 = a2;
  if (axShouldDisableHitpointWarping())
  {
    CGPoint v11 = v10;
  }
  else
  {
    v7.receiver = v9;
    v7.super_class = (Class)UIWindowAccessibility;
    [(UIWindowAccessibility *)&v7 warpPoint:v10];
    v11.double x = v3;
    v11.double y = v4;
  }
  double y = v11.y;
  double x = v11.x;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_orderFrontWithoutMakingKey
{
  SEL v8 = self;
  SEL v7 = a2;
  id v3 = (id)[(UIWindowAccessibility *)self windowScene];
  v2 = (UIWindowAccessibility *)(id)[v3 keyWindow];
  BOOL v4 = v2 == v8;

  BOOL v6 = v4;
  v5.receiver = v8;
  v5.super_class = (Class)UIWindowAccessibility;
  [(UIWindowAccessibility *)&v5 _orderFrontWithoutMakingKey];
  if ([(UIWindowAccessibility *)v8 _axShouldPostScreenChangeOnOrderFront:v6]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

- (BOOL)_axShouldPostScreenChangeOnOrderFront:(BOOL)a3
{
  BOOL v6 = a3;
  if (!UIAccessibilityIsVoiceOverRunning()) {
    return 0;
  }
  [(UIWindowAccessibility *)self windowLevel];
  char isKindOfClass = 1;
  if (v3 != 15000001.0)
  {
    NSClassFromString(&cfstr_Uisnapshotwind.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  if (isKindOfClass) {
    return 0;
  }
  if (v6) {
    return 0;
  }
  if (([(UIWindowAccessibility *)self safeBoolForKey:@"isEnabled"] & 1) == 0) {
    return 0;
  }
  NSClassFromString(&cfstr_Sbhudwindow.isa);
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (void)makeKeyAndVisible
{
  v12 = self;
  SEL v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)UIWindowAccessibility;
  [(UIWindowAccessibility *)&v10 makeKeyAndVisible];
  id v3 = (id)objc_opt_new();
  char v4 = [v3 isClarityBoardEnabled];

  if (v4)
  {
    if (NSClassFromString(&cfstr_Srsecurewindow.isa))
    {
      if (objc_opt_isKindOfClass())
      {
        char v7 = 0;
        objc_opt_class();
        id v6 = (id)__UIAccessibilityCastAsClass();
        id v5 = v6;
        objc_storeStrong(&v6, 0);
        id v8 = v5;
        id v2 = (id)[MEMORY[0x263F1C550] clearColor];
        objc_msgSend(v5, "setBackgroundColor:");

        objc_storeStrong(&v8, 0);
      }
    }
  }
}

- (id)_targetWindowForPathIndex:(int64_t)a3 atPoint:(CGPoint)a4 scenePointZ:(double)a5 forEvent:(id)a6 windowServerHitTestWindow:(id)a7
{
  CGPoint v29 = a4;
  v28 = self;
  SEL v27 = a2;
  int64_t v26 = a3;
  double v25 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v23 = 0;
  objc_storeStrong(&v23, a7);
  id v22 = 0;
  uint64_t v21 = 0;
  char v20 = 0;
  objc_opt_class();
  id v19 = (id)__UIAccessibilityCastAsClass();
  id v18 = v19;
  objc_storeStrong(&v19, 0);
  uint64_t v12 = [v18 _hidEvent];

  uint64_t v21 = v12;
  if (v12 && IOHIDEventGetSenderID() == 0x8000000817319380)
  {
    char v17 = 0;
    objc_opt_class();
    id v16 = (id)__UIAccessibilityCastAsClass();
    id v15 = v16;
    objc_storeStrong(&v16, 0);
    id v7 = v22;
    id v22 = v15;
  }
  if (!v22)
  {
    v14.receiver = v28;
    v14.super_class = (Class)UIWindowAccessibility;
    id v8 = -[UIWindowAccessibility _targetWindowForPathIndex:atPoint:scenePointZ:forEvent:windowServerHitTestWindow:](&v14, sel__targetWindowForPathIndex_atPoint_scenePointZ_forEvent_windowServerHitTestWindow_, v26, location, v23, v29.x, v29.y, v25);
    id v9 = v22;
    id v22 = v8;
  }
  id v11 = v22;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&location, 0);

  return v11;
}

- (void)_setFirstResponder:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22.receiver = v24;
  v22.super_class = (Class)UIWindowAccessibility;
  [(UIWindowAccessibility *)&v22 _setFirstResponder:location[0]];
  if ([location[0] accessibilityElementsHidden])
  {
    id v21 = (id)AXLogCommon();
    char v20 = 1;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
    {
      log = v21;
      os_log_type_t type = v20;
      id v19 = (id)objc_opt_class();
      __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v19);
      _os_log_impl(&dword_2402B7000, log, type, "Accessibility ignoring responder change for hidden element: %@", v25, 0xCu);
      objc_storeStrong(&v19, 0);
    }
    objc_storeStrong(&v21, 0);
    int v18 = 1;
  }
  else
  {
    if (location[0])
    {
      id v3 = -[UIWindowAccessibility _accessibilityFirstResponderCoalesceTimer](v24);
      BOOL v9 = v3 != 0;

      if (!v9)
      {
        id v6 = v24;
        id v5 = objc_alloc(MEMORY[0x263F21398]);
        id v8 = MEMORY[0x263EF83A0];
        id v7 = (id)objc_msgSend(v5, "initWithTargetSerialQueue:");
        -[UIWindowAccessibility _accessibilitySetFirstResponderCoalesceTimer:]((uint64_t)v6, v7);
      }
      id v4 = -[UIWindowAccessibility _accessibilityFirstResponderCoalesceTimer](v24);
      uint64_t v12 = MEMORY[0x263EF8330];
      int v13 = -1073741824;
      int v14 = 0;
      id v15 = __44__UIWindowAccessibility__setFirstResponder___block_invoke;
      id v16 = &unk_2650ADF18;
      id v17 = location[0];
      [v4 afterDelay:&v12 processBlock:0.1];

      objc_storeStrong(&v17, 0);
    }
    int v18 = 0;
  }
  objc_storeStrong(location, 0);
}

+ (id)safeCategoryTargetClassName
{
  return @"UIWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityAllRemoteElements
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UIWindow___accessibilityAllRemoteElements);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetAllRemoteElements:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  int v14 = location;
  id v13 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = @"UIWindow";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  uint64_t v12 = "@";
  id v11 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"_initWithFrame: debugName: scene: attached:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "@", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"initWithWindowScene:", v12, 0);
  id v3 = "q";
  [location[0] validateClass:v9 hasInstanceMethod:@"_windowInterfaceOrientation" withFullSignature:0];
  [location[0] validateClass:@"_UISnapshotWindow"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_shouldCreateContextAsSecure", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_isTransparentFocusRegion", v11, 0);
  id v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_setBoundContext:", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_targetWindowForPathIndex:atPoint:scenePointZ:forEvent:windowServerHitTestWindow:", v3, "{CGPoint=dd}", "d", v12, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_isSecure", v11, 0);
  id v4 = @"RBSProcessIdentity";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, @"identityOfCurrentProcess", v12, 0);
  [location[0] validateClass:@"_UIKeyboardWindowScene"];
  id v7 = @"UIScene";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"UIWindowScene");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v7, @"_scenesIncludingInternal:", v12, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_FBSScene", v12, 0);
  id v5 = @"FBSScene";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"identifier", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"FBSProcess", @"pid", "i", 0);
  id v6 = @"UILayoutContainerView";
  objc_super v10 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"_UISplitViewControllerPanelImplView" isKindOfClass:v6];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_focusSystemSceneComponent", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"_sceneComponentForKey:", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFocusSystemSceneComponent", @"_focusBehaviorDidChange:", v8, v12, 0);
  [location[0] validateClass:@"FBSSceneDefinition" hasProperty:@"identity" withType:v12];
  [location[0] validateClass:@"FBSSceneIdentity" hasProperty:@"workspaceIdentifier" withType:v12];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"makeKeyAndVisible", v8, 0);
  [location[0] validateClass:v9 isKindOfClass:v10];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_isEligibleForFocusInteraction", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_isEligibleForFocusOcclusion", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_prefersFocusContainment", v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIApplicationAccessibility", @"_accessibilityUIAppFocusedOnContinuityDisplay", v12, 0);
  objc_storeStrong(v14, v13);
}

- (unint64_t)_accessibilityAutomationType
{
  return 2;
}

- (BOOL)_accessibilityIsGroupedParent
{
  return 0;
}

- (UIWindowAccessibility)initWithWindowScene:(id)a3
{
  BOOL v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v9;
  BOOL v9 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)UIWindowAccessibility;
  BOOL v9 = [(UIWindowAccessibility *)&v6 initWithWindowScene:location[0]];
  id v7 = v9;
  -[UIWindowAccessibility _axListenForRemoteElement](v9);
  id v5 = v7;
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)_axListenForRemoteElement
{
  id v3 = a1;
  if (a1)
  {
    id location = @"_axRegisteredForRemoteElement";
    if (([v3 _accessibilityBoolValueForKey:location] & 1) == 0)
    {
      [v3 _axCheckForExistingRemoteElements];
      id v1 = (id)[MEMORY[0x263F08A00] defaultCenter];
      [v1 addObserver:v3 selector:sel__axRemoteElementRegistered_ name:@"ax_remote_element_registered" object:0];

      [v3 _accessibilitySetBoolValue:1 forKey:location];
    }
    objc_storeStrong(&location, 0);
  }
}

- (UIWindowAccessibility)initWithFrame:(CGRect)a3
{
  CGRect v8 = a3;
  v6[1] = (id)a2;
  id v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)UIWindowAccessibility;
  id v7 = -[UIWindowAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6[0] = v7;
  -[UIWindowAccessibility _axListenForRemoteElement](v7);
  id v4 = (UIWindowAccessibility *)v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v27 = a3;
  uint64_t v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v24 = [(UIWindowAccessibility *)v26 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v17 = 0;
  char v11 = 0;
  if (!v24)
  {
    uint64_t v18 = MEMORY[0x263EF8330];
    int v19 = -1073741824;
    int v20 = 0;
    id v21 = __57__UIWindowAccessibility__accessibilityHitTest_withEvent___block_invoke;
    objc_super v22 = &unk_2650AE580;
    id v23 = v26;
    char v17 = 1;
    id v16 = (id *)&v23;
    char v11 = ((uint64_t (*)(void))__57__UIWindowAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v11)
  {
    -[UIWindowAccessibility _accessibilitySetBoolValue:forKey:](v26, "_accessibilitySetBoolValue:forKey:", 1);
    id v15 = (id)[(UIWindowAccessibility *)v26 accessibilityHitTest:location[0] withEvent:v27];
    [(UIWindowAccessibility *)v26 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    id v28 = v15;
    int v14 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    int v14 = 0;
  }
  if (v17) {
    objc_storeStrong(v16, 0);
  }
  if (!v14)
  {
    id v4 = (id)[(UIWindowAccessibility *)v26 windowScene];
    BOOL v10 = v4 != 0;

    if (v10)
    {
      [(UIWindowAccessibility *)v26 alpha];
      if (v5 <= 0.0 || ([(UIWindowAccessibility *)v26 isHidden] & 1) != 0)
      {
        id v28 = 0;
        int v14 = 1;
      }
      else
      {
        [(UIWindowAccessibility *)v26 warpPoint:v27];
        v13.double x = v6;
        v13.double y = v7;
        CGPoint v27 = v13;
        v12.receiver = v26;
        v12.super_class = (Class)UIWindowAccessibility;
        id v28 = -[UIWindowAccessibility _accessibilityHitTest:withEvent:](&v12, sel__accessibilityHitTest_withEvent_, location[0], v6, v7);
        int v14 = 1;
      }
    }
    else
    {
      id v28 = 0;
      int v14 = 1;
    }
  }
  objc_storeStrong(location, 0);
  CGRect v8 = v28;

  return v8;
}

BOOL __57__UIWindowAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  uint64_t v18 = (dispatch_once_t *)&kAXWindowFocusSystemSceneComponentKey_block_invoke_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_52);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  IMP Implementation = 0;
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v12 = (id)AXLogCommon();
    char v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      os_log_type_t type = v11;
      CGRect v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      id v4 = v8;
      BOOL v10 = v4;
      id v2 = (objc_class *)objc_opt_class();
      double v7 = NSStringFromClass(v2);
      BOOL v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)kAXWindowFocusSystemSceneComponentKey_block_invoke_BaseImplementation;
}

void __57__UIWindowAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    kAXWindowFocusSystemSceneComponentKey_block_invoke_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      double v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      id v3 = v7;
      BOOL v9 = v3;
      id v2 = (objc_class *)objc_opt_class();
      double v6 = NSStringFromClass(v2);
      CGRect v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityRemoteElement
{
  char v6 = 0;
  char v4 = 0;
  if (-[UIWindowAccessibility _accessibilityShouldUseRemoteElement](self))
  {
    id v7 = -[UIWindowAccessibility _accessibilityAllRemoteElements](self);
    char v6 = 1;
    id v5 = (id)[v7 lastObject];
    char v4 = 1;
    id v2 = v5;
  }
  else
  {
    id v2 = 0;
  }
  BOOL v9 = v2;
  if (v4) {

  }
  if (v6) {

  }
  return v9;
}

- (uint64_t)_accessibilityShouldUseRemoteElement
{
  id v10 = a1;
  if (a1)
  {
    id v9 = v10;
    id v8 = (id)[v9 windowScene];
    char v6 = 0;
    objc_opt_class();
    id v2 = (id)[v8 safeValueForKey:@"_FBSScene"];
    id v5 = (id)__UIAccessibilityCastAsClass();

    id v4 = v5;
    objc_storeStrong(&v5, 0);
    id v7 = v4;
    id v3 = (id)[v4 safeStringForKey:@"identifier"];
    if ([v3 containsString:*MEMORY[0x263F21248]]) {
      char v11 = [v7 accessibilitySceneIsCallServiceBanner] & 1;
    }
    else {
      char v11 = 1;
    }
    objc_storeStrong(&v3, 0);
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

- (id)_accessibilityUserTestingParent
{
  id v2 = [(UIWindowAccessibility *)self _accessibilityRemoteElement];
  BOOL v4 = v2 == 0;

  if (v4) {
    id v6 = (id)*MEMORY[0x263F1D020];
  }
  else {
    id v6 = [(UIWindowAccessibility *)self _accessibilityRemoteElement];
  }

  return v6;
}

- (id)accessibilityContainer
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = [(UIWindowAccessibility *)self _accessibilityRemoteElement];
  if (location[0])
  {
    id v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UIWindowAccessibility;
    id v8 = [(UIWindowAccessibility *)&v4 accessibilityContainer];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  id v2 = v8;

  return v2;
}

- (id)_accessibilityWindowSections
{
  v80 = self;
  v79[1] = (id)a2;
  char v78 = 0;
  objc_opt_class();
  id v30 = (id)[(UIWindowAccessibility *)v80 safeValueForKey:@"rootViewController"];
  id v77 = (id)__UIAccessibilityCastAsClass();

  id v76 = v77;
  objc_storeStrong(&v77, 0);
  v79[0] = v76;
  id v75 = (id)objc_opt_new();
  id v74 = (id)objc_opt_new();
  [v74 axSafelyAddObject:v79[0]];
  while ([v74 count])
  {
    id v73 = (id)objc_msgSend(v74, "ax_dequeueObject");
    id v2 = (id)[v73 presentedViewController];
    BOOL v29 = v2 == 0;

    if (v29)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v71 = 0;
        objc_opt_class();
        id v70 = (id)__UIAccessibilityCastAsClass();
        if (v71) {
          abort();
        }
        id v69 = v70;
        objc_storeStrong(&v70, 0);
        id v72 = v69;
        id v26 = (id)[v69 viewControllers];
        uint64_t v63 = MEMORY[0x263EF8330];
        int v64 = -1073741824;
        int v65 = 0;
        v66 = __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke;
        v67 = &unk_2650AFA18;
        id v68 = v74;
        [v26 enumerateObjectsUsingBlock:&v63];

        objc_storeStrong(&v68, 0);
        objc_storeStrong(&v72, 0);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v61 = 0;
          objc_opt_class();
          id v60 = (id)__UIAccessibilityCastAsClass();
          if (v61) {
            abort();
          }
          id v59 = v60;
          objc_storeStrong(&v60, 0);
          id v62 = v59;
          id v24 = (id)[v59 toolbar];
          char v25 = [v24 _accessibilityViewIsVisible];

          if (v25)
          {
            id v22 = v75;
            id v23 = (id)[v62 toolbar];
            objc_msgSend(v22, "axSafelyAddObject:");
          }
          id v20 = (id)[v62 navigationBar];
          char v21 = [v20 _accessibilityViewIsVisible];

          if (v21)
          {
            id v58 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptionsHonoringGroups];
            id v57 = (id)[v58 leafNodePredicate];
            uint64_t v50 = MEMORY[0x263EF8330];
            int v51 = -1073741824;
            int v52 = 0;
            v53 = __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_2;
            v54 = &unk_2650AFA40;
            id v55 = v62;
            id v56 = v57;
            [v58 setLeafNodePredicate:&v50];
            id v18 = (id)[v62 navigationBar];
            id v49 = (id)[v18 _accessibilityLeafDescendantsWithOptions:v58];

            id v19 = v49;
            uint64_t v43 = MEMORY[0x263EF8330];
            int v44 = -1073741824;
            int v45 = 0;
            v46 = __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_3;
            v47 = &unk_2650AE910;
            id v48 = v75;
            [v19 enumerateObjectsWithOptions:2 usingBlock:&v43];
            objc_storeStrong(&v48, 0);
            objc_storeStrong(&v49, 0);
            objc_storeStrong(&v56, 0);
            objc_storeStrong(&v55, 0);
            objc_storeStrong(&v57, 0);
            objc_storeStrong(&v58, 0);
          }
          id v16 = v74;
          id v17 = (id)[v62 topViewController];
          objc_msgSend(v16, "ax_enqueueObject:");

          objc_storeStrong(&v62, 0);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v41 = 0;
            objc_opt_class();
            id v40 = (id)__UIAccessibilityCastAsClass();
            if (v41) {
              abort();
            }
            id v39 = v40;
            objc_storeStrong(&v40, 0);
            id v42 = v39;
            id v14 = (id)[v39 tabBar];
            char v15 = [v14 _accessibilityViewIsVisible];

            if (v15)
            {
              id v12 = v75;
              id v13 = (id)[v42 tabBar];
              objc_msgSend(v12, "axSafelyAddObject:");
            }
            id v10 = v74;
            id v11 = (id)[v42 selectedViewController];
            objc_msgSend(v10, "ax_enqueueObject:");

            objc_storeStrong(&v42, 0);
          }
          else
          {
            id v38 = (id)[MEMORY[0x263F81198] options];
            [v38 setLeafNodePredicate:&__block_literal_global_429];
            id v8 = (id)[v73 view];
            id v37 = (id)[v8 _accessibilityLeafDescendantsWithOptions:v38];

            id v3 = (id)objc_msgSend(v37, "ax_filteredArrayUsingBlock:", &__block_literal_global_432);
            id v4 = v37;
            id v37 = v3;

            id v9 = v37;
            uint64_t v31 = MEMORY[0x263EF8330];
            int v32 = -1073741824;
            int v33 = 0;
            v34 = __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_6;
            v35 = &unk_2650AE910;
            id v36 = v75;
            [v9 enumerateObjectsUsingBlock:&v31];
            objc_storeStrong(&v36, 0);
            objc_storeStrong(&v37, 0);
            objc_storeStrong(&v38, 0);
          }
        }
      }
    }
    else
    {
      id v27 = v74;
      id v28 = (id)[v73 presentedViewController];
      objc_msgSend(v27, "ax_enqueueObject:");
    }
    objc_storeStrong(&v73, 0);
  }
  id v6 = (id)[v75 reverseObjectEnumerator];
  id v7 = (id)[v6 allObjects];

  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v75, 0);
  objc_storeStrong(v79, 0);

  return v7;
}

void __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(a1[4], "ax_enqueueObject:", location[0]);
  objc_storeStrong(location, 0);
}

uint64_t __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_2(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = location[0];
  id v5 = (id)[*(id *)(a1 + 32) navigationBar];
  char v6 = 0;
  if (v4 != v5) {
    char v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  objc_storeStrong(location, 0);
  return v6 & 1;
}

void __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_3(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v2 = [location[0] accessibilityTraits];
  if ((v2 & *MEMORY[0x263F1CEF8]) == 0) {
    [a1[4] axSafelyAddObject:location[0]];
  }
  objc_storeStrong(location, 0);
}

BOOL __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_4(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BOOL v3 = [location[0] accessibilityContainerType] == 4;
  objc_storeStrong(location, 0);
  return v3;
}

uint64_t __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_5(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] _accessibilityParentView];
  char v4 = [v3 _accessibilityViewIsVisible];

  objc_storeStrong(location, 0);
  return v4 & 1;
}

void __53__UIWindowAccessibility__accessibilityWindowSections__block_invoke_6(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [a1[4] axSafelyAddObject:location[0]];
  objc_storeStrong(location, 0);
}

- (int)_accessibilityRemotePid
{
  id v3 = [(UIWindowAccessibility *)self accessibilityContainer];
  int v4 = [v3 remotePid];

  return v4;
}

- (id)_accessibilityFirstElement
{
  return (id)[(UIWindowAccessibility *)self _accessibilityFirstDescendant];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v13 = self;
  SEL v12 = a2;
  memset(__b, 0, sizeof(__b));
  id obj = -[UIWindowAccessibility _accessibilityAllRemoteElements](v13);
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v5);
      [v11 setRemoteChildrenDelegate:0];
      [v11 unregister];
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:v13 name:@"ax_remote_element_registered" object:0];

  v9.receiver = v13;
  v9.super_class = (Class)UIWindowAccessibility;
  [(UIWindowAccessibility *)&v9 dealloc];
}

- (id)accessibilityRemoteSubstituteChildren:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  BOOL v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(UIWindowAccessibility *)v29 accessibilityElementsHidden]
    || (int)[location[0] remotePid] < 0)
  {
    id v30 = MEMORY[0x263EFFA68];
    int v27 = 1;
  }
  else
  {
    id v26 = 0;
    if (([location[0] isAccessibilityOpaqueElementProvider] & 1) != 0
      && ([(id)*MEMORY[0x263F1D020] _accessibilityWantsOpaqueElementProviders] & 1) != 0)
    {
      id v5 = (id)[(UIWindowAccessibility *)v29 _accessibilitySortedElementsWithin];
      id v6 = v26;
      id v26 = v5;
    }
    else
    {
      id v3 = (id)[(UIWindowAccessibility *)v29 subviews];
      id v4 = v26;
      id v26 = v3;
    }
    if ([(UIWindowAccessibility *)v29 _accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren])
    {
      id v25 = (id)[MEMORY[0x263F1CBD0] _scenesIncludingInternal:1];
      memset(__b, 0, 0x40uLL);
      id obj = v25;
      uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
      if (v19)
      {
        uint64_t v15 = *(void *)__b[2];
        uint64_t v16 = 0;
        unint64_t v17 = v19;
        while (1)
        {
          uint64_t v14 = v16;
          if (*(void *)__b[2] != v15) {
            objc_enumerationMutation(obj);
          }
          void __b[8] = *(void *)(__b[1] + 8 * v16);
          NSClassFromString(&cfstr_Uikeyboardwind.isa);
          if (objc_opt_isKindOfClass())
          {
            id v13 = (void *)MEMORY[0x263EFF8C0];
            char v23 = 0;
            objc_opt_class();
            id v22 = (id)__UIAccessibilityCastAsClass();
            if (v23) {
              abort();
            }
            id v21 = v22;
            objc_storeStrong(&v22, 0);
            id v12 = (id)[v21 _allWindows];
            id v7 = (id)objc_msgSend(v13, "axArrayWithPossiblyNilArrays:", 2, v12, v26);
            id v8 = v26;
            id v26 = v7;
          }
          ++v16;
          if (v14 + 1 >= v17)
          {
            uint64_t v16 = 0;
            unint64_t v17 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
            if (!v17) {
              break;
            }
          }
        }
      }

      objc_storeStrong(&v25, 0);
    }
    id v11 = (id)[v26 reverseObjectEnumerator];
    id v20 = (id)[v11 allObjects];

    id v30 = (id)[MEMORY[0x263F1CB60] _subviewsReplacedByModalViewSubviewsIfNecessary:v20];
    int v27 = 1;
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v26, 0);
  }
  objc_storeStrong(location, 0);
  objc_super v9 = v30;

  return v9;
}

- (BOOL)_accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren
{
  return AXRequestingClient() == 3;
}

- (void)_axRemoteElementRegistered:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v10 = 0;
  objc_opt_class();
  id v5 = (id)[location[0] userInfo];
  id v9 = (id)__UIAccessibilityCastAsClass();

  id v8 = v9;
  objc_storeStrong(&v9, 0);
  id v11 = (id)[v8 objectForKey:@"element"];

  if (!v11) {
    _AXAssert();
  }
  int v7 = [v11 contextId];
  if (v11 && v7 == [(UIWindowAccessibility *)v13 _accessibilityContextId] && v7)
  {
    -[UIWindowAccessibility _axUpdateForRemoteElement:](v13, v11);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogRemoteElement();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      id v4 = v13;
      int v3 = [(UIWindowAccessibility *)v13 _accessibilityContextId];
      __os_log_helper_16_2_3_8_64_4_0_8_64((uint64_t)v14, (uint64_t)v4, v3, (uint64_t)v11);
      _os_log_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_INFO, "This remote element does not belong to me: %@ (contextId: %u). Remote element: %@ ", v14, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)_axUpdateForRemoteElement:(void *)a1
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v6 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    id v3 = -[UIWindowAccessibility _accessibilityAllRemoteElements](v6);
    if (!v3)
    {
      id v3 = (id)[MEMORY[0x263EFF980] array];

      [v6 _accessibilitySetAllRemoteElements:v3];
    }
    if (([v3 containsObject:location] & 1) == 0)
    {
      [location setRemoteChildrenDelegate:v6];
      [v3 addObject:location];
      os_log_t oslog = (os_log_t)(id)AXLogRemoteElement();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v7, (uint64_t)v6, (uint64_t)location);
        _os_log_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_INFO, "Added remote element to me: %@, remoteElement: %@", v7, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&v3, 0);
    int v4 = 0;
  }
  else
  {
    int v4 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (void)_axCheckForExistingRemoteElements
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = self;
  SEL v13 = a2;
  unsigned int v12 = [(UIWindowAccessibility *)self _accessibilityContextId];
  if (v12)
  {
    memset(__b, 0, sizeof(__b));
    id obj = (id)[MEMORY[0x263F21678] remoteElementsForContextId:v12];
    uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      unint64_t v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(__b[1] + 8 * v6);
        id v2 = (id)[v11 accessibilityContainer];
        NSClassFromString(&cfstr_Wkcontentview.isa);
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          -[UIWindowAccessibility _axUpdateForRemoteElement:](v14, v11);
        }
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
          if (!v7) {
            break;
          }
        }
      }
    }
  }
}

- (BOOL)_accessibilityIsInCarPlay
{
  id v3 = (id)[(UIWindowAccessibility *)self traitCollection];
  BOOL v4 = [v3 userInterfaceIdiom] == 3;

  return v4;
}

- (BOOL)_accessibilityIsInJindo
{
  return 0;
}

- (int64_t)_accessibilityInterfaceOrientationForScreenCoordinates
{
  return [(UIWindowAccessibility *)self _windowInterfaceOrientation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  BOOL v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIWindowAccessibility;
  [(UIWindowAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[UIWindowAccessibility _axListenForRemoteElement](v4);
  [(UIWindowAccessibility *)v4 _accessibilityRegisterRemoteElement:1];
}

- (id)_accessibilityFirstResponderCoalesceTimer
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UIWindow___accessibilityFirstResponderCoalesceTimer);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetFirstResponderCoalesceTimer:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

void __44__UIWindowAccessibility__setFirstResponder___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = a1[4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong(location, 0);
  }
  _UIAccessibilitySetAssociatedElementContextForNextNotification();
  UIAccessibilityPostNotification(*MEMORY[0x263F812B8], 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

- (BOOL)accessibilityIsWindow
{
  return 1;
}

- (unsigned)_accessibilityContextId
{
  uint64_t v8 = self;
  SEL v7 = a2;
  char v6 = 0;
  objc_opt_class();
  id v5 = (id)__UIAccessibilityCastAsClass();
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  unsigned int v3 = [v4 _contextId];

  return v3;
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = self;
  char v3 = [v4[0] isUserInteractionEnabled];
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (BOOL)accessibilityElementsHidden
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int v12 = self;
  SEL v11 = a2;
  char v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)UIWindowAccessibility;
  char v10 = [(UIWindowAccessibility *)&v9 accessibilityElementsHidden];
  if (!v10)
  {
    char v8 = _isDevicePasscodeLocked() & 1;
    BOOL v7 = 0;
    BOOL v3 = 1;
    if (AXRequestingClient() != 16) {
      BOOL v3 = AXDoesRequestingClientDeserveAutomation() != 0;
    }
    BOOL v7 = v3;
    if ((v8 & 1) != 0
      && v7
      && ([(id)*MEMORY[0x263F1D020] safeBoolForKey:@"_accessibilityUIAppFocusedOnContinuityDisplay"] & 1) != 0)
    {
      os_log_t oslog = (os_log_t)(id)AXLogCommon();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v14, (uint64_t)v12);
        _os_log_impl(&dword_2402B7000, oslog, type, "App is active in Oneness session, not hiding window : %@", v14, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      char v8 = 0;
    }
    if ([(UIWindowAccessibility *)v12 _accessibilityIsInCarPlay]) {
      char v8 = 0;
    }
    if ((v8 & 1) != 0
      && ([(UIWindowAccessibility *)v12 safeBoolForKey:@"_shouldCreateContextAsSecure"] & 1) == 0)
    {
      os_log_t v4 = (os_log_t)(id)AXLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)v12);
        _os_log_impl(&dword_2402B7000, v4, OS_LOG_TYPE_DEFAULT, "Hiding this window since not secure: %@", v13, 0xCu);
      }
      objc_storeStrong((id *)&v4, 0);
      char v10 = 1;
    }
  }
  return v10 & 1;
}

- (BOOL)_accessibilitySceneContainsOnlySecureWindows
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v16 = self;
  SEL v15 = a2;
  char v14 = 1;
  id v13 = self;
  id location = (id)[v13 windowScene];
  memset(__b, 0, sizeof(__b));
  id obj = (id)[location windows];
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(__b[1] + 8 * v6);
      if (([v11 isHidden] & 1) == 0 && (objc_msgSend(v11, "_accessibilityIsSecure") & 1) == 0) {
        break;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v7) {
          goto LABEL_10;
        }
      }
    }
    char v14 = 0;
  }
LABEL_10:

  char v3 = v14;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v13, 0);
  return v3 & 1;
}

- (BOOL)_accessibilityIsSecure
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIWindowAccessibility *)self _windowHostingScene];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = 1;
    if (([(UIWindowAccessibility *)v5 safeBoolForKey:@"_isSecure"] & 1) == 0) {
      char v3 = [location[0] _accessibilityIsSecure];
    }
    char v6 = v3 & 1;
  }
  else
  {
    char v6 = [(UIWindowAccessibility *)v5 safeBoolForKey:@"_isSecure"] & 1;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (id)_accessibilityGetRemoteElement
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UIWindowAccessibility___accessibilityGetRemoteElement);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetRemoteElement:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityMLRemoteElement
{
  uint64_t v9 = a1;
  if (a1)
  {
    id v8 = -[UIWindowAccessibility _accessibilityGetRemoteElement](v9);
    if (!v8)
    {
      CFUUIDRef uuid = 0;
      uint64_t v5 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
      CFUUIDRef uuid = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
      id v11 = (__CFString *)CFUUIDCreateString(*v5, uuid);
      id location = v11;
      if (uuid)
      {
        CFRelease(uuid);
        CFUUIDRef uuid = 0;
      }
      id v1 = (void *)[objc_alloc(MEMORY[0x263F21680]) initWithUUID:location andContextId:0];
      id v2 = v8;
      id v8 = v1;

      if (v8)
      {
        [v8 setOnClientSide:1];
        [v8 setRemoteChildrenDelegate:v9];
        [v8 setAccessibilityContainer:v9];
      }
      -[UIWindowAccessibility _accessibilitySetRemoteElement:]((uint64_t)v9, v8);
      objc_storeStrong(&location, 0);
    }
    id v10 = v8;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v3 = v10;

  return v3;
}

- (void)_setBoundContext:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UIWindowAccessibility *)v5 _accessibilityRegisterRemoteElement:0];
  v3.receiver = v5;
  v3.super_class = (Class)UIWindowAccessibility;
  [(UIWindowAccessibility *)&v3 _setBoundContext:location[0]];
  [(UIWindowAccessibility *)v5 _accessibilityRegisterRemoteElement:1];
  objc_storeStrong(location, 0);
}

- (void)_accessibilityRegisterRemoteElement:(BOOL)a3
{
  v34[4] = *MEMORY[0x263EF8340];
  uint64_t v32 = self;
  SEL v31 = a2;
  BOOL v30 = a3;
  if ((AXProcessIsSystemApplication() & 1) == 0)
  {
    id v29 = v32;
    unsigned int v28 = [v29 _contextId];
    if (v28)
    {
      id v27 = (id)[v29 windowScene];
      id v26 = (id)[v27 safeValueForKey:@"_FBSScene"];
      id location = (id)[v26 safeStringForKey:@"identifier"];
      id v11 = (id)[v26 safeValueForKey:@"identity"];
      id v24 = (id)[v11 safeStringForKey:@"workspaceIdentifier"];

      char v23 = 0;
      char v21 = 0;
      char RemoteViewForIdentityAndSceneIdentifier = 0;
      if (AXShouldCreateRemoteViewForEachLayer(v24))
      {
        id v22 = (id)[NSClassFromString(&cfstr_Rbsprocessiden.isa) safeValueForKey:@"identityOfCurrentProcess"];
        char v21 = 1;
        char RemoteViewForIdentityAndSceneIdentifier = AXShouldCreateRemoteViewForIdentityAndSceneIdentifier(v22, location, v24);
      }
      if (v21) {

      }
      char v23 = RemoteViewForIdentityAndSceneIdentifier & 1;
      NSClassFromString(&cfstr_Uikeyboardwind.isa);
      if (objc_opt_isKindOfClass() & 1) == 0 && (v23)
      {
        id v9 = (id)[v26 safeValueForKey:@"hostProcess"];
        unsigned int v10 = [v9 safeIntForKey:@"pid"];

        unsigned int v20 = v10;
        if (!location) {
          objc_storeStrong(&location, &stru_26F458D38);
        }
        id v19 = (id)AXRemoteElementConcatSceneUUIDAndContextId();
        uint64_t v4 = (void *)MEMORY[0x263F21678];
        v33[0] = @"ax-pid";
        id v8 = (id)[NSNumber numberWithInt:v20];
        v34[0] = v8;
        v33[1] = @"ax-context";
        id v7 = (id)[NSNumber numberWithUnsignedInt:v28];
        v34[1] = v7;
        v33[2] = @"ax-uuid";
        v34[2] = v19;
        v33[3] = @"ax-register";
        id v6 = (id)[NSNumber numberWithBool:v30];
        v34[3] = v6;
        id v5 = (id)[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
        objc_msgSend(v4, "registerRemoteElement:remotePort:");

        if (!v30)
        {
          id v3 = -[UIWindowAccessibility _accessibilityAllRemoteElements](v32);
          uint64_t v13 = MEMORY[0x263EF8330];
          int v14 = -1073741824;
          int v15 = 0;
          uint64_t v16 = __61__UIWindowAccessibility__accessibilityRegisterRemoteElement___block_invoke;
          unint64_t v17 = &unk_2650AFA68;
          id v18 = v19;
          objc_msgSend(v3, "ax_removeObjectsFromArrayUsingBlock:", &v13);

          objc_storeStrong(&v18, 0);
        }
        objc_storeStrong(&v19, 0);
      }
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v27, 0);
    }
    objc_storeStrong(&v29, 0);
  }
}

uint64_t __61__UIWindowAccessibility__accessibilityRegisterRemoteElement___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[location[0] uuid];
  char v5 = [v4 isEqualToString:a1[4]];

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)_prefersFocusContainment
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIWindowAccessibility;
  BOOL v5 = [(UIWindowAccessibility *)&v4 _prefersFocusContainment];
  if (v5) {
    return v5;
  }
  char v3 = 1;
  if (([(UIWindowAccessibility *)v7 _accessibilityIsTouchContainer] & 1) == 0) {
    char v3 = [(UIWindowAccessibility *)v7 shouldGroupAccessibilityChildren];
  }
  return v3 & 1;
}

@end