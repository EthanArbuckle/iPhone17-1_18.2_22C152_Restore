@interface _UIRemoteViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityServesAsFirstResponder;
- (id)_accessibilityActiveKeyboard;
- (id)_accessibilityGetRemoteElementArray;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityRemoteElementCommunicationQueue;
- (id)_accessibilityResponderElement;
- (id)accessibilityElements;
- (id)accessibilityIdentifier;
- (uint64_t)_accessibilityRemoteMachPort;
- (uint64_t)_accessibilityRemoteViewPid;
- (uint64_t)_accessibilitySetRemoteMachPort:(uint64_t)result;
- (uint64_t)_accessibilitySetRemoteViewPid:(uint64_t)result;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetFocusOnElement:(BOOL)a3;
- (void)_accessibilitySetRemoteElementArray:(uint64_t)a1;
- (void)_accessibilitySetRemoteElementIfNecessary;
- (void)_accessibilityTransmitRemoteUUIDToPid:(int)a3 machPort:(id)obj value:;
- (void)_accessibilityUnregisterRemoteView;
- (void)dealloc;
@end

@implementation _UIRemoteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIRemoteView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (uint64_t)_accessibilityRemoteMachPort
{
  if (a1) {
    return __UIAccessibilityGetAssociatedUnsignedInt();
  }
  else {
    return 0;
  }
}

- (uint64_t)_accessibilitySetRemoteMachPort:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedUnsignedInt();
  }
  return result;
}

- (uint64_t)_accessibilityRemoteViewPid
{
  if (a1) {
    return __UIAccessibilityGetAssociatedInt();
  }
  else {
    return 0;
  }
}

- (uint64_t)_accessibilitySetRemoteViewPid:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedInt();
  }
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"_UISizeTrackingView"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIRemoteView", @"hostedWindowHostingHandle", "@", 0);
  [location[0] validateClass:@"_UIHostedWindowHostingHandle" hasInstanceVariable:@"_pid" withType:"i"];
  objc_storeStrong(v4, obj);
}

- (id)_accessibilityGetRemoteElementArray
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &___UIRemoteViewAccessibility___accessibilityGetRemoteElementArray);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetRemoteElementArray:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityRemoteElementCommunicationQueue
{
  if (a1)
  {
    v4 = (dispatch_once_t *)&_accessibilityRemoteElementCommunicationQueue_onceToken;
    id location = 0;
    objc_storeStrong(&location, &__block_literal_global_56);
    if (*v4 != -1) {
      dispatch_once(v4, location);
    }
    objc_storeStrong(&location, 0);
    id v2 = (id)_accessibilityRemoteElementCommunicationQueue_q;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)accessibilityIdentifier
{
  return @"RemoteViewBridge";
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(_UIRemoteViewAccessibility *)self _accessibilityUnregisterRemoteView];
  v2.receiver = v4;
  v2.super_class = (Class)_UIRemoteViewAccessibility;
  [(_UIRemoteViewAccessibility *)&v2 dealloc];
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v9 = a3;
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (-[_UIRemoteViewAccessibility pointInside:withEvent:](v8, "pointInside:withEvent:", location[0], v9.x, v9.y))
  {
    id v6 = [(_UIRemoteViewAccessibility *)v8 accessibilityElements];
    id v10 = (id)[v6 lastObject];
  }
  else
  {
    id v10 = 0;
  }
  objc_storeStrong(location, 0);
  v4 = v10;

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIRemoteViewAccessibility;
  [(_UIRemoteViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  -[_UIRemoteViewAccessibility _accessibilitySetRemoteElementIfNecessary](v4);
}

- (void)_accessibilitySetRemoteElementIfNecessary
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  v67 = a1;
  if (a1)
  {
    if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
      _AXAssert();
    }
    id v66 = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](v67);
    if (!v66)
    {
      int v39 = 0;
      id v37 = (id)[v67 safeValueForKey:@"layer"];
      unsigned int v38 = [v37 contextId];

      unsigned int v65 = v38;
      unsigned int v64 = -[_UIRemoteViewAccessibility _accessibilityRemoteViewPid]((uint64_t)v67);
      unsigned int v63 = -[_UIRemoteViewAccessibility _accessibilityRemoteMachPort]((uint64_t)v67);
      char v61 = 0;
      int v40 = 0;
      if (!v64)
      {
        id v35 = (id)[v67 safeValueForKey:@"superview"];
        id v62 = v35;
        int v36 = 1;
        char v61 = 1;
        NSClassFromString(&cfstr_Uisizetracking_0.isa);
        int v40 = objc_opt_isKindOfClass() ^ 1;
      }
      int v34 = v40;
      if (v61) {

      }
      if (v34)
      {
        id v33 = (id)[v67 safeValueForKey:@"hostedWindowHostingHandle"];
        unsigned int v64 = [v33 safeIntForKey:@"_pid"];
      }
      if (v64)
      {
        CFUUIDRef v54 = 0;
        v21 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
        CFUUIDRef v54 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
        v68 = (__CFString *)CFUUIDCreateString(*v21, v54);
        id v53 = v68;
        if (v54)
        {
          CFRelease(v54);
          CFUUIDRef v54 = 0;
        }
        id v52 = (id)[objc_alloc(MEMORY[0x263F21678]) initWithUUID:v53 andRemotePid:v64 andContextId:v65];
        [v52 setOnClientSide:1];
        [v52 setAccessibilityContainer:v67];
        [v52 setMachPort:v63];
        id v70 = v52;
        id v1 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v70 count:1];
        id v2 = v66;
        id v66 = v1;

        -[_UIRemoteViewAccessibility _accessibilitySetRemoteElementArray:]((uint64_t)v67, v66);
        id v16 = (id)NSDictionary;
        unint64_t v15 = 0x263F08000uLL;
        id v20 = (id)[NSNumber numberWithUnsignedInt:v63];
        uint64_t v14 = NSNumber;
        id v19 = (id)[NSNumber numberWithInt:getpid()];
        id v18 = (id)[NSNumber numberWithUnsignedInt:v65];
        uint64_t v3 = *MEMORY[0x263EFFB40];
        v17 = &v4;
        id v51 = (id)objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v20, @"ax-machport", v19, @"ax-pid", v18, @"ax-context", v53, @"ax-uuid", v3, @"ax-register", 0);

        osos_log_t log = (os_log_t)(id)AXLogRemoteElement();
        os_log_type_t v49 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
        {
          os_log_t v11 = oslog;
          *(_DWORD *)v12 = v49;
          v13 = v69;
          __os_log_helper_16_2_3_8_64_4_0_8_64((uint64_t)v69, (uint64_t)v67, v64, (uint64_t)v51);
          _os_log_impl(&dword_2402B7000, v11, v12[0], "%@: transmitting UUID to remote side with pid: %d, value: %@", v13, 0x1Cu);
        }
        id obj = 0;
        objc_storeStrong((id *)&oslog, 0);
        dispatch_queue_t queue = (dispatch_queue_t)-[_UIRemoteViewAccessibility _accessibilityRemoteElementCommunicationQueue]((uint64_t)v67);
        dispatch_block_t block = &v41;
        uint64_t v41 = MEMORY[0x263EF8330];
        int v42 = -1073741824;
        int v43 = 0;
        v44 = __71___UIRemoteViewAccessibility__accessibilitySetRemoteElementIfNecessary__block_invoke;
        v45 = &unk_2650AE5F8;
        v8 = (id *)v46;
        v46[0] = v67;
        unsigned int v47 = v64;
        unsigned int v48 = v63;
        v7 = (id *)((char *)block + 40);
        CGPoint v9 = &v51;
        v46[1] = v51;
        dispatch_async(queue, block);

        objc_storeStrong(v7, obj);
        objc_storeStrong(v8, obj);
        objc_storeStrong(v9, obj);
        objc_storeStrong(&v52, obj);
        objc_storeStrong(&v53, obj);
      }
      else if (_AXSApplicationAccessibilityEnabled())
      {
        if ([v67 _accessibilityBoolValueForKey:@"AXDidRequestRemoteViewLoad"])
        {
          id v58 = (id)AXLogRemoteElement();
          os_log_type_t v57 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_INFO))
          {
            os_log_t v25 = (os_log_t)v58;
            *(_DWORD *)v26 = v57;
            v27 = v72;
            __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v67);
            _os_log_impl(&dword_2402B7000, (os_log_t)v58, v57, "%@: no remote pid, but already requested a remote view load once", v72, 0xCu);
          }
          objc_storeStrong(&v58, 0);
        }
        else
        {
          [v67 _accessibilitySetBoolValue:1 forKey:@"AXDidRequestRemoteViewLoad"];
          id location = (id)AXLogRemoteElement();
          os_log_type_t v59 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
          {
            os_log_t log = (os_log_t)location;
            *(_DWORD *)type = v59;
            buf = v73;
            __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v67);
            _os_log_impl(&dword_2402B7000, (os_log_t)location, v59, "%@: no remote pid set, so requesting that info from the remote view controller", v73, 0xCu);
          }
          uint64_t v28 = 0;
          objc_storeStrong(&location, 0);
          id v29 = (id)[MEMORY[0x263F08A00] defaultCenter];
          [v29 postNotificationName:@"AXRequestRemoteViewLoad" object:0];
        }
      }
      else
      {
        id v56 = (id)AXLogRemoteElement();
        os_log_type_t v55 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_INFO))
        {
          os_log_t v22 = (os_log_t)v56;
          *(_DWORD *)v23 = v55;
          v24 = v71;
          __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v67);
          _os_log_impl(&dword_2402B7000, (os_log_t)v56, v55, "%@: no remote pid, but AX is not enabled so there's no use trying to get that info yet", v71, 0xCu);
        }
        objc_storeStrong(&v56, 0);
      }
    }
    objc_storeStrong(&v66, 0);
  }
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (id)_accessibilityActiveKeyboard
{
  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](self);
  id v4 = (id)[v5[0] lastObject];
  id v3 = (id)[v4 _accessibilityActiveKeyboard];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);

  return v3;
}

- (id)_accessibilityResponderElement
{
  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](self);
  id v4 = (id)[v5[0] lastObject];
  id v3 = (id)[v4 _accessibilityResponderElement];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);

  return v3;
}

- (void)_accessibilityTransmitRemoteUUIDToPid:(int)a3 machPort:(id)obj value:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v22 = a1;
  int v21 = a2;
  int v20 = a3;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (v22)
  {
    v5 = -[_UIRemoteViewAccessibility _accessibilityRemoteElementCommunicationQueue]((uint64_t)v22);
    dispatch_assert_queue_V2(v5);

    AXUIElementRef AppElementWithPid = (AXUIElementRef)_AXUIElementCreateAppElementWithPid();
    AXUIElementSetMessagingTimeout(AppElementWithPid, 1.0);
    if (!v20)
    {
      int v20 = [(id)*MEMORY[0x263F1D020] _accessibilityMachPort];
      id v16 = (id)AXLogRemoteElement();
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v23, v20);
        _os_log_impl(&dword_2402B7000, (os_log_t)v16, v15, "mach port was not initialized by the remote view controller, so using app's mach port %u", v23, 8u);
      }
      objc_storeStrong(&v16, 0);
    }
    _AXUIElementSetMachPortForNextMessage();
    int v14 = AXUIElementPerformFencedActionWithValue();
    dispatch_queue_t queue = MEMORY[0x263EF83A0];
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    CGPoint v9 = __83___UIRemoteViewAccessibility__accessibilityTransmitRemoteUUIDToPid_machPort_value___block_invoke;
    id v10 = &unk_2650AF2E8;
    int v12 = v14;
    v11[0] = v22;
    int v13 = v21;
    v11[1] = AppElementWithPid;
    dispatch_async(queue, &v6);

    objc_storeStrong(v11, 0);
    int v18 = 0;
  }
  else
  {
    int v18 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)accessibilityElements
{
  v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](self);
  if (!v4[0])
  {
    -[_UIRemoteViewAccessibility _accessibilitySetRemoteElementIfNecessary](v5);
    v4[0] = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](v5);
  }
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

- (void)_accessibilityUnregisterRemoteView
{
  uint64_t v28 = 0;
  uint64_t v48 = *MEMORY[0x263EF8340];
  v44 = self;
  SEL v43 = a2;
  int v42 = -[_UIRemoteViewAccessibility _accessibilityRemoteViewPid]((uint64_t)self);
  int v41 = -[_UIRemoteViewAccessibility _accessibilityRemoteMachPort]((uint64_t)v44);
  if (v42)
  {
    id v40 = -[_UIRemoteViewAccessibility _accessibilityGetRemoteElementArray](v44);
    os_log_t v25 = __b;
    memset(__b, 0, sizeof(__b));
    id obj = v40;
    uint64_t v27 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
    if (v27)
    {
      uint64_t v22 = *(void *)__b[2];
      uint64_t v23 = v28;
      unint64_t v24 = v27;
      while (1)
      {
        unint64_t v20 = v24;
        uint64_t v21 = v23;
        if (*(void *)__b[2] != v22) {
          objc_enumerationMutation(obj);
        }
        id v39 = *(id *)(__b[1] + 8 * v21);
        id v15 = (id)NSDictionary;
        unint64_t v13 = 0x263F08000uLL;
        uint64_t v12 = NSNumber;
        id v19 = (id)[NSNumber numberWithInt:getpid()];
        id v14 = *(id *)(v13 + 2584);
        uint64_t v2 = [v39 contextId];
        id v18 = (id)[v14 numberWithUnsignedInt:v2];
        id v17 = (id)[v39 uuid];
        uint64_t v3 = *MEMORY[0x263EFFB38];
        id v16 = &v5;
        id v37 = (id)objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v19, @"ax-pid", v18, @"ax-context", v17, @"ax-uuid", v3, @"ax-register", 0);

        v46 = (dispatch_once_t *)&_accessibilityUnregisterRemoteView_onceToken;
        id location = 0;
        objc_storeStrong(&location, &__block_literal_global_355);
        if (*v46 != -1) {
          dispatch_once(v46, location);
        }
        id v11 = 0;
        objc_storeStrong(&location, 0);
        dispatch_queue_t queue = (dispatch_queue_t)_accessibilityUnregisterRemoteView_UnregisterQueue;
        dispatch_block_t block = &v29;
        uint64_t v29 = MEMORY[0x263EF8330];
        int v30 = -1073741824;
        int v31 = 0;
        v32 = __64___UIRemoteViewAccessibility__accessibilityUnregisterRemoteView__block_invoke_2;
        id v33 = &unk_2650ADDF0;
        int v35 = v42;
        CGPoint v9 = &v34;
        id v10 = &v37;
        id v34 = v37;
        int v36 = v41;
        dispatch_async(queue, block);
        [v39 setAccessibilityContainer:v11];
        [v39 unregister];
        objc_storeStrong(v9, v11);
        objc_storeStrong(v10, v11);
        uint64_t v23 = v21 + 1;
        unint64_t v24 = v20;
        if (v21 + 1 >= v20)
        {
          uint64_t v4 = [obj countByEnumeratingWithState:__b objects:v47 count:16];
          uint64_t v23 = v28;
          unint64_t v24 = v4;
          if (!v4) {
            break;
          }
        }
      }
    }

    id v6 = 0;
    -[_UIRemoteViewAccessibility _accessibilitySetRemoteElementArray:]((uint64_t)v44, 0);
    objc_storeStrong(&v40, v6);
  }
}

- (void)_accessibilitySetFocusOnElement:(BOOL)a3
{
  BOOL v4 = a3;
  id v3 = (id)[(_UIRemoteViewAccessibility *)self accessibilityContainer];
  [v3 _accessibilitySetFocusOnElement:v4];
}

@end