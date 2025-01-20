@interface _UIRemoteViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axGetWasFocusEnabled;
- (BOOL)_axShouldTakeBackFocus;
- (id)_accessibilityResponderElement;
- (id)_axMachPortRetrievalTimer;
- (id)disconnect;
- (void)__handleFocusMovementAction:(id)a3;
- (void)__setViewServiceIsDisplayingPopover:(BOOL)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityLoadAccessibilityInformation:(double)a3 retryTime:;
- (void)_accessibilityLoadAccessibilityInformation:(void *)a1;
- (void)_accessibilityRemoteView:(id)a3 pid:(int)a4 machPort:(unsigned int)a5;
- (void)_awakeWithConnectionInfo:(id)a3;
- (void)_axRemoteViewLoadRequest:(id)a3;
- (void)_axSetMachPortRetrievalTimer:(id)a3;
- (void)_axSetWasFocusEnabled:(BOOL)a3;
- (void)_axTakeBakeFocusWithHeading:(id)a3;
@end

@implementation _UIRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIRemoteViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axMachPortRetrievalTimer
{
  return objc_getAssociatedObject(self, &___UIRemoteViewControllerAccessibility___axMachPortRetrievalTimer);
}

- (void)_axSetMachPortRetrievalTimer:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (BOOL)_axGetWasFocusEnabled
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetWasFocusEnabled:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v11 = location;
  id v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIRemoteViewController";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v3 = "_UITextEffectsRemoteView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", @"_UIRemoteViewController", @"_textEffectsAboveStatusBarRemoteView");
  [location[0] validateClass:@"_UIRemoteViewController" hasInstanceVariable:@"_fullScreenTextEffectsRemoteView" withType:"_UITextEffectsRemoteView"];
  [location[0] validateClass:@"_UIRemoteViewController" hasInstanceVariable:@"_remoteKeyboardRemoteView" withType:"_UITextEffectsRemoteView"];
  [location[0] validateClass:@"_UIRemoteViewController" hasInstanceVariable:@"_sizeTrackingView" withType:"_UISizeTrackingView"];
  v9 = "v";
  [location[0] validateClass:@"_UIRemoteViewController" hasInstanceMethod:@"_initializeAccessibilityPortInformation" withFullSignature:0];
  v7 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"__setViewServiceIsDisplayingPopover:", v9, "B", 0);
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"__handleFocusMovementAction:", v9, "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_setWantsKeyboardEnvironmentEventDeferring:", v9, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"disconnect", v6, 0);
  v5 = @"UIViewController";
  [location[0] validateClass:v6 hasClassMethod:v6 withFullSignature:0];
  [location[0] validateClass:v4 isKindOfClass:v5];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"navigationController", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIRemoteViewAccessibility", @"_accessibilityUnregisterRemoteView", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIScreen", @"_focusSystem", v6, 0);
  v8 = @"UIFocusSystem";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_setEnabled:", v9, v7, 0);
  objc_storeStrong(v11, v10);
}

- (id)_accessibilityResponderElement
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v26 = self;
  v25[1] = (id)a2;
  v25[0] = (id)[MEMORY[0x263EFF980] array];
  id v12 = (id)[(_UIRemoteViewControllerAccessibility *)v26 safeValueForKey:@"_sizeTrackingView"];
  id v11 = (id)[v12 subviews];
  objc_msgSend(v25[0], "axSafelyAddObjectsFromArray:");

  id v13 = (id)[(_UIRemoteViewControllerAccessibility *)v26 safeValueForKey:@"_remoteKeyboardRemoteView"];
  objc_msgSend(v25[0], "axSafelyAddObject:");

  id v14 = (id)[(_UIRemoteViewControllerAccessibility *)v26 safeValueForKey:@"_fullScreenTextEffectsRemoteView"];
  objc_msgSend(v25[0], "axSafelyAddObject:");

  id v15 = (id)[(_UIRemoteViewControllerAccessibility *)v26 safeValueForKey:@"_textEffectsAboveStatusBarRemoteView"];
  objc_msgSend(v25[0], "axSafelyAddObject:");

  id v24 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = v25[0];
  uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
  if (v17)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v17;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(id *)(__b[1] + 8 * v9);
      id location = (id)[v23 _accessibilityResponderElement];
      if (location)
      {
        id v27 = location;
        int v20 = 1;
      }
      else
      {
        if (([(_UIRemoteViewControllerAccessibility *)v26 isFirstResponder] & 1) != 0 && !v24)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v6 = (id)[v23 accessibilityElements];
            id v2 = (id)[v6 firstObject];
            id v3 = v24;
            id v24 = v2;
          }
        }
        int v20 = 0;
      }
      objc_storeStrong(&location, 0);
      if (v20) {
        break;
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
        if (!v10) {
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
LABEL_15:
    int v20 = 0;
  }

  if (!v20)
  {
    v18.receiver = v26;
    v18.super_class = (Class)_UIRemoteViewControllerAccessibility;
    id v19 = [(_UIRemoteViewControllerAccessibility *)&v18 _accessibilityResponderElement];
    if (v19) {
      id v27 = v19;
    }
    else {
      id v27 = v24;
    }
    int v20 = 1;
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v25, 0);
  v4 = v27;

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIRemoteViewControllerAccessibility;
  [(_UIRemoteViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[_UIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation:](v4, 0);
}

- (void)_accessibilityLoadAccessibilityInformation:(void *)a1
{
  if (a1) {
    -[_UIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation:retryTime:](a1, a2 & 1, 0.1);
  }
}

- (void)_axRemoteViewLoadRequest:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)AXLogRemoteElement();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v6, (uint64_t)v5);
    _os_log_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_INFO, "%@: will load remote view on request", v6, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[_UIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation:](v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation:(double)a3 retryTime:
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v69 = a1;
  char v68 = a2 & 1;
  double v67 = a3;
  if (a1)
  {
    if (([v69 _accessibilityBoolValueForKey:@"AXDidListenForRemoteViewLoad"] & 1) == 0)
    {
      id v25 = (id)[MEMORY[0x263F08A00] defaultCenter];
      [v25 addObserver:v69 selector:sel__axRemoteViewLoadRequest_ name:@"AXRequestRemoteViewLoad" object:0];

      [v69 _accessibilitySetBoolValue:1 forKey:@"AXDidListenForRemoteViewLoad"];
    }
    if (_AXSApplicationAccessibilityEnabled())
    {
      id v23 = (id)[v69 safeValueForKey:@"_serviceAccessibilityServerPort"];
      unsigned int v24 = [v23 intValue];

      unsigned int v64 = v24;
      if (v24)
      {
        uint64_t v51 = 0;
        v52 = &v51;
        int v53 = 0x20000000;
        int v54 = 32;
        int v55 = 0;
        id v12 = (id)[v69 safeValueForKey:@"serviceProcessIdentifier"];
        int v13 = [v12 intValue];

        int v55 = v13;
        if (!*((_DWORD *)v52 + 6))
        {
          v45[0] = 0;
          v45[1] = v45;
          int v46 = 838860800;
          int v47 = 48;
          v48 = __Block_byref_object_copy__17;
          v49 = __Block_byref_object_dispose__17;
          id v50 = 0;
          uint64_t v39 = MEMORY[0x263EF8330];
          int v40 = -1073741824;
          int v41 = 0;
          v42 = __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke_384;
          v43 = &unk_2650AE390;
          v44[1] = v45;
          v44[0] = v69;
          AXPerformSafeBlock();
          v32[1] = (os_log_t)MEMORY[0x263EF8330];
          int v33 = -1073741824;
          int v34 = 0;
          v35 = __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke_2;
          v36 = &unk_2650AF088;
          v37 = v45;
          v38 = &v51;
          AXPerformSafeBlock();
          objc_storeStrong(v44, 0);
          _Block_object_dispose(v45, 8);
          objc_storeStrong(&v50, 0);
        }
        v32[0] = (os_log_t)(id)AXLogRemoteElement();
        os_log_type_t v31 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v32[0], OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_2_3_8_64_4_0_4_0((uint64_t)v71, (uint64_t)v69, v64, *((_DWORD *)v52 + 6));
          _os_log_impl(&dword_2402B7000, v32[0], v31, "%@: loading ax info - mach port %d, remote pid %d", v71, 0x18u);
        }
        objc_storeStrong((id *)v32, 0);
        memset(__b, 0, sizeof(__b));
        id v11 = (id)[v69 safeValueForKey:@"_sizeTrackingView"];
        id obj = (id)[v11 subviews];

        uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v70 count:16];
        if (v9)
        {
          uint64_t v6 = *(void *)__b[2];
          uint64_t v7 = 0;
          unint64_t v8 = v9;
          while (1)
          {
            uint64_t v5 = v7;
            if (*(void *)__b[2] != v6) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = *(void *)(__b[1] + 8 * v7);
            [v69 _accessibilityRemoteView:v30 pid:*((unsigned int *)v52 + 6) machPort:v64];
            ++v7;
            if (v5 + 1 >= v8)
            {
              uint64_t v7 = 0;
              unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v70 count:16];
              if (!v8) {
                break;
              }
            }
          }
        }

        id v28 = (id)[v69 safeValueForKey:@"_remoteKeyboardRemoteView"];
        [v69 _accessibilityRemoteView:v28 pid:*((unsigned int *)v52 + 6) machPort:v64];
        id v27 = (id)[v69 safeValueForKey:@"_fullScreenTextEffectsRemoteView"];
        [v69 _accessibilityRemoteView:v27 pid:*((unsigned int *)v52 + 6) machPort:v64];
        id v26 = (id)[v69 safeValueForKey:@"_textEffectsAboveStatusBarRemoteView"];
        [v69 _accessibilityRemoteView:v26 pid:*((unsigned int *)v52 + 6) machPort:v64];
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v28, 0);
        _Block_object_dispose(&v51, 8);
      }
      else
      {
        id v3 = (id)[v69 safeValueForKey:@"_initializeAccessibilityPortInformation"];
        id v4 = (id)[v69 _axMachPortRetrievalTimer];
        BOOL v22 = v4 != 0;

        if (!v22)
        {
          id v21 = objc_alloc(MEMORY[0x263F21398]);
          id v19 = MEMORY[0x263EF83A0];
          id v20 = (id)objc_msgSend(v21, "initWithTargetSerialQueue:");
          [v69 _axSetMachPortRetrievalTimer:v20];

          id v18 = (id)[v69 _axMachPortRetrievalTimer];
          [v18 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
        }
        v63[1] = COERCE_OS_LOG_T(5.0);
        id v16 = (id)[v69 _axMachPortRetrievalTimer];
        char v17 = [v16 isPending];

        if ((v17 & 1) == 0)
        {
          v63[0] = (os_log_t)(id)AXLogRemoteElement();
          os_log_type_t v62 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v63[0], OS_LOG_TYPE_INFO))
          {
            __os_log_helper_16_2_2_8_64_8_0((uint64_t)v72, (uint64_t)v69, *(uint64_t *)&v67);
            _os_log_impl(&dword_2402B7000, v63[0], v62, "%@: could not get mach_port - will try again in %f", v72, 0x16u);
          }
          objc_storeStrong((id *)v63, 0);
          id v15 = (id)[v69 _axMachPortRetrievalTimer];
          double v14 = v67;
          uint64_t v56 = MEMORY[0x263EF8330];
          int v57 = -1073741824;
          int v58 = 0;
          v59 = __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke;
          v60 = &unk_2650ADDF0;
          v61[0] = v69;
          v61[1] = *(id *)&v67;
          [v15 afterDelay:&v56 processBlock:v14];

          objc_storeStrong(v61, 0);
        }
      }
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)AXLogRemoteElement();
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v69);
        _os_log_impl(&dword_2402B7000, oslog, type, "%@: not processing because AX is off", v73, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
}

- (void)_accessibilityRemoteView:(id)a3 pid:(int)a4 machPort:(unsigned int)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v5 = (id)__UIAccessibilityCastAsSafeCategory();
    -[_UIRemoteViewAccessibility _accessibilitySetRemoteMachPort:]((uint64_t)v5);

    objc_opt_class();
    id v6 = (id)__UIAccessibilityCastAsSafeCategory();
    -[_UIRemoteViewAccessibility _accessibilitySetRemoteViewPid:]((uint64_t)v6);

    objc_opt_class();
    id v7 = (id)__UIAccessibilityCastAsSafeCategory();
    -[_UIRemoteViewAccessibility _accessibilitySetRemoteElementIfNecessary](v7);
  }
  objc_storeStrong(location, 0);
}

- (void)_awakeWithConnectionInfo:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIRemoteViewControllerAccessibility;
  [(_UIRemoteViewControllerAccessibility *)&v3 _awakeWithConnectionInfo:location[0]];
  -[_UIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation:](v5, 1);
  objc_storeStrong(location, 0);
}

- (void)__setViewServiceIsDisplayingPopover:(BOOL)a3
{
  id v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIRemoteViewControllerAccessibility;
  [(_UIRemoteViewControllerAccessibility *)&v9 __setViewServiceIsDisplayingPopover:a3];
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = __76___UIRemoteViewControllerAccessibility___setViewServiceIsDisplayingPopover___block_invoke;
  id v7 = &unk_2650ADF18;
  unint64_t v8 = v12;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v8, 0);
}

- (id)disconnect
{
  SEL v11 = self;
  v10[1] = (id)a2;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  unint64_t v8 = __50___UIRemoteViewControllerAccessibility_disconnect__block_invoke;
  objc_super v9 = &unk_2650ADF18;
  v10[0] = self;
  AXPerformSafeBlock();
  v4.receiver = v11;
  v4.super_class = (Class)_UIRemoteViewControllerAccessibility;
  id v3 = [(_UIRemoteViewControllerAccessibility *)&v4 disconnect];
  objc_storeStrong(v10, 0);

  return v3;
}

- (void)__handleFocusMovementAction:(id)a3
{
  char v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15.receiver = v17;
  v15.super_class = (Class)_UIRemoteViewControllerAccessibility;
  [(_UIRemoteViewControllerAccessibility *)&v15 __handleFocusMovementAction:location[0]];
  char v13 = 0;
  objc_opt_class();
  id v12 = (id)__UIAccessibilityCastAsClass();
  id v11 = v12;
  objc_storeStrong(&v12, 0);
  id v14 = v11;
  id v7 = (id)[v11 view];
  char v8 = [v7 _accessibilityIsFKARunningForFocusItem];

  if ((v8 & 1) != 0 && location[0] && -[_UIRemoteViewControllerAccessibility _axShouldTakeBackFocus](v17))
  {
    id v3 = (void *)MEMORY[0x263F1C650];
    id v4 = (id)[v14 view];
    id v10 = (id)objc_msgSend(v3, "focusSystemForEnvironment:");

    -[_UIRemoteViewControllerAccessibility _axSetWasFocusEnabled:](v17, "_axSetWasFocusEnabled:", [v10 safeBoolForKey:@"_isEnabled"] & 1);
    id v9 = v10;
    AXPerformSafeBlock();
    uint64_t v5 = v17;
    id v6 = (id)[location[0] focusMovementInfo];
    -[_UIRemoteViewControllerAccessibility _axTakeBakeFocusWithHeading:](v5, "_axTakeBakeFocusWithHeading:");

    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_axShouldTakeBackFocus
{
  id v12 = a1;
  if (a1)
  {
    char v10 = 0;
    objc_opt_class();
    id v9 = (id)__UIAccessibilityCastAsClass();
    id v8 = v9;
    objc_storeStrong(&v9, 0);
    id v11 = (id)[v8 view];

    id v3 = (void *)MEMORY[0x263F1CB68];
    id v2 = v11;
    id v4 = (id)[v11 window];
    char v6 = 0;
    BOOL v5 = 1;
    if (objc_msgSend(v3, "_isViewSizeFullScreen:inWindow:", v2))
    {
      id v7 = (id)[v12 safeValueForKey:@"navigationController"];
      char v6 = 1;
      BOOL v5 = v7 != 0;
    }
    BOOL v13 = v5;
    if (v6) {

    }
    objc_storeStrong(&v11, 0);
  }
  else
  {
    return 0;
  }
  return v13;
}

- (void)_axTakeBakeFocusWithHeading:(id)a3
{
  int v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = (id)[(_UIRemoteViewControllerAccessibility *)v34 safeValueForKey:@"_sizeTrackingView"];
  _UIAXAssignFocusToItem();

  v26[1] = (id)MEMORY[0x263EF8330];
  int v27 = -1073741824;
  int v28 = 0;
  uint64_t v29 = __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke;
  uint64_t v30 = &unk_2650ADFB0;
  os_log_type_t v31 = v34;
  id v32 = location[0];
  AXPerformSafeBlock();
  char v25 = 0;
  objc_opt_class();
  id v24 = (id)__UIAccessibilityCastAsClass();
  id v23 = v24;
  objc_storeStrong(&v24, 0);
  v26[0] = v23;
  id v8 = (id)[v23 view];
  id v7 = (id)[v8 window];
  id v6 = (id)[v7 windowScene];
  id v5 = (id)[v6 focusSystem];
  id v4 = (id)[v5 focusedItem];
  id v3 = (id)[(_UIRemoteViewControllerAccessibility *)v34 safeValueForKey:@"_sizeTrackingView"];
  BOOL v9 = v4 != v3;

  if (v9)
  {
    v11[0] = v34;
    AXPerformSafeBlock();
    objc_storeStrong(v11, 0);
  }
  else
  {
    uint64_t v22 = 0;
    if ([location[0] heading] == 16)
    {
      uint64_t v22 = 256;
    }
    else if ([location[0] heading] == 32)
    {
      uint64_t v22 = 512;
    }
    if (v22)
    {
      v16[1] = (id)MEMORY[0x263EF8330];
      int v17 = -1073741824;
      int v18 = 0;
      id v19 = __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke_2;
      id v20 = &unk_2650ADDF0;
      v21[0] = location[0];
      v21[1] = (id)v22;
      AXPerformSafeBlock();
      [(_UIRemoteViewControllerAccessibility *)v34 _axTakeBakeFocusWithHeading:location[0]];
      objc_storeStrong(v21, 0);
    }
    else if (![(_UIRemoteViewControllerAccessibility *)v34 _axGetWasFocusEnabled])
    {
      v11[1] = (id)MEMORY[0x263EF8330];
      int v12 = -1073741824;
      int v13 = 0;
      id v14 = __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke_3;
      objc_super v15 = &unk_2650ADF18;
      v16[0] = v26[0];
      AXPerformSafeBlock();
      objc_storeStrong(v16, 0);
    }
  }
  objc_storeStrong(v26, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong((id *)&v31, 0);
  objc_storeStrong(location, 0);
}

@end