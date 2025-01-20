@interface _UIScenePresentationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHandlesRemoteFocusMovement;
- (BOOL)_accessibilityServesAsFirstResponder;
- (BOOL)_axIsPosterLockViewWithScene:(id)a3;
- (BOOL)canBecomeFocused;
- (id)_accessibilityGetRemoteElementArray;
- (id)_accessibilityRemoteSceneID;
- (id)_accessibilityResponderElement;
- (id)_axRemoteChild;
- (id)_viewToAddFocusLayer;
- (id)accessibilityElements;
- (int)_accessibilityRemotePid;
- (uint64_t)_accessibilityShouldUseRemoteElement;
- (void)_accessibilityResetRemoteElementArray;
- (void)_accessibilitySetRemoteElementArray:(uint64_t)a1;
- (void)_accessibilitySetRemoteElementIfNecessary;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _UIScenePresentationViewAccessibility

- (BOOL)_axIsPosterLockViewWithScene:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[location[0] identity];
  id v5 = (id)[v4 workspaceIdentifier];
  char v7 = 0;
  char v6 = 0;
  if ([v5 isEqualToString:@"PosterKit"])
  {
    id v8 = (id)[(_UIScenePresentationViewAccessibility *)v10 safeStringForKey:@"identifier"];
    char v7 = 1;
    char v6 = [v8 isEqualToString:@"PBUIPosterLockViewController"];
  }
  char v11 = v6 & 1;
  if (v7) {

  }
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void)_accessibilitySetRemoteElementIfNecessary
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v42 = a1;
  if (a1)
  {
    if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
    {
      id location = (id)AXLogAppAccessibility();
      char v40 = 17;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_FAULT))
      {
        log = location;
        os_log_type_t type = v40;
        __os_log_helper_16_0_0(v39);
        _os_log_fault_impl(&dword_2402B7000, log, type, "Should always update remote view AX properties on the main thread", v39, 2u);
      }
      objc_storeStrong(&location, 0);
    }
    id v19 = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](v42);
    LOBYTE(v20) = 0;
    if (!v19) {
      int v20 = [v42 safeBoolForKey:@"_invalidated"] ^ 1;
    }

    if (v20)
    {
      char v37 = 0;
      objc_opt_class();
      id v18 = (id)[v42 safeValueForKey:@"_scene"];
      id v36 = (id)__UIAccessibilityCastAsClass();

      id v35 = v36;
      objc_storeStrong(&v36, 0);
      id v38 = v35;
      id v15 = (id)[v35 clientHandle];
      id v14 = (id)[v15 identity];
      id v34 = (id)[v14 processIdentity];

      id v16 = (id)[v38 clientHandle];
      id v33 = (id)[v16 processHandle];

      id v17 = (id)[v38 identity];
      id v32 = (id)[v17 workspaceIdentifier];

      if ([v42 _axIsPosterLockViewWithScene:v38])
      {
        int v31 = 1;
      }
      else
      {
        id v12 = (id)[v38 identifier];
        char RemoteViewForIdentityAndSceneIdentifier = AXShouldCreateRemoteViewForIdentityAndSceneIdentifier(v34, v12, v32);

        if (RemoteViewForIdentityAndSceneIdentifier)
        {
          id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
          unsigned int v29 = [v33 safeIntForKey:@"pid"];
          if (v29 != getpid())
          {
            if (AXShouldCreateRemoteViewForEachLayer(v32))
            {
              memset(__b, 0, sizeof(__b));
              id v9 = (id)[v38 layerManager];
              id obj = (id)[v9 layers];

              uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
              if (v11)
              {
                uint64_t v6 = *(void *)__b[2];
                uint64_t v7 = 0;
                unint64_t v8 = v11;
                while (1)
                {
                  uint64_t v5 = v7;
                  if (*(void *)__b[2] != v6) {
                    objc_enumerationMutation(obj);
                  }
                  id v28 = *(id *)(__b[1] + 8 * v7);
                  unsigned int v26 = 0;
                  unsigned int v26 = [v28 contextID];
                  id v4 = (id)[v38 identifier];
                  id v25 = (id)AXRemoteElementConcatSceneUUIDAndContextId();

                  id v1 = objc_alloc(MEMORY[0x263F21678]);
                  id v24 = (id)[v1 initWithUUID:v25 andRemotePid:v29 andContextId:v26];
                  [v24 setOnClientSide:1];
                  [v24 setAccessibilityContainer:v42];
                  [v30 addObject:v24];
                  objc_storeStrong(&v24, 0);
                  objc_storeStrong(&v25, 0);
                  ++v7;
                  if (v5 + 1 >= v8)
                  {
                    uint64_t v7 = 0;
                    unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
                    if (!v8) {
                      break;
                    }
                  }
                }
              }
            }
            else
            {
              id v2 = objc_alloc(MEMORY[0x263F21678]);
              id v3 = (id)[v38 identifier];
              id v23 = (id)objc_msgSend(v2, "initWithUUID:andRemotePid:andContextId:");

              [v23 setOnClientSide:1];
              [v23 setAccessibilityContainer:v42];
              [v30 addObject:v23];
              objc_storeStrong(&v23, 0);
            }
          }
          if ([v30 count]) {
            -[_UIScenePresentationViewAccessibility _accessibilitySetRemoteElementArray:]((uint64_t)v42, v30);
          }
          objc_storeStrong(&v30, 0);
        }
        else
        {
          -[_UIScenePresentationViewAccessibility _accessibilitySetRemoteElementArray:]((uint64_t)v42, MEMORY[0x263EFFA68]);
        }
        int v31 = 0;
      }
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v38, 0);
    }
  }
}

- (void)_accessibilityResetRemoteElementArray
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v11 = a1;
  if (a1)
  {
    memset(__b, 0, sizeof(__b));
    id obj = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](v11);
    uint64_t v6 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
    if (v6)
    {
      uint64_t v2 = *(void *)__b[2];
      uint64_t v3 = 0;
      unint64_t v4 = v6;
      while (1)
      {
        uint64_t v1 = v3;
        if (*(void *)__b[2] != v2) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(__b[1] + 8 * v3);
        [v10 unregister];
        ++v3;
        if (v1 + 1 >= v4)
        {
          uint64_t v3 = 0;
          unint64_t v4 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
          if (!v4) {
            break;
          }
        }
      }
    }

    -[_UIScenePresentationViewAccessibility _accessibilitySetRemoteElementArray:]((uint64_t)v11, 0);
    objc_initWeak(&location, v11);
    objc_copyWeak(&v7, &location);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (id)_accessibilityGetRemoteElementArray
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &___UIScenePresentationViewAccessibility___accessibilityGetRemoteElementArray);
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

+ (id)safeCategoryTargetClassName
{
  return @"_UIScenePresentationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  uint64_t v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = @"_UIScenePresentationView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"RBSProcessHandle", @"pid", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"identifier", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"invalidate", "v", 0);
  [location[0] validateClass:v3 hasInstanceVariable:@"_invalidated" withType:"B"];
  objc_storeStrong(v5, obj);
}

- (BOOL)_accessibilityServesAsFirstResponder
{
  return 1;
}

- (id)_accessibilityResponderElement
{
  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](self);
  id v4 = (id)[v5[0] lastObject];
  id v3 = (id)[v4 _accessibilityResponderElement];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);

  return v3;
}

- (id)accessibilityElements
{
  id v7 = self;
  v6[1] = (id)a2;
  v6[0] = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](self);
  if (!v6[0])
  {
    -[_UIScenePresentationViewAccessibility _accessibilitySetRemoteElementIfNecessary](v7);
    v6[0] = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](v7);
  }
  char v5 = -[_UIScenePresentationViewAccessibility _accessibilityShouldUseRemoteElement](v7) & 1;
  if (v6[0] && (v5 & 1) != 0)
  {
    id v8 = v6[0];
  }
  else
  {
    id v4 = (id)[MEMORY[0x263F1CB68] viewControllerForView:v7];
    id v8 = (id)[v4 accessibilityElements];
    objc_storeStrong(&v4, 0);
  }
  objc_storeStrong(v6, 0);
  id v2 = v8;

  return v2;
}

- (uint64_t)_accessibilityShouldUseRemoteElement
{
  id v9 = a1;
  if (a1)
  {
    char v7 = 0;
    objc_opt_class();
    id v4 = (id)[v9 safeValueForKey:@"_scene"];
    id v6 = (id)__UIAccessibilityCastAsClass();

    id v5 = v6;
    objc_storeStrong(&v6, 0);
    id v8 = v5;
    id v2 = (id)[v5 identifier];
    char v3 = [v2 containsString:*MEMORY[0x263F21248]];

    if (v3) {
      char v10 = [v8 accessibilitySceneIsCallServiceBanner] & 1;
    }
    else {
      char v10 = 1;
    }
    objc_storeStrong(&v8, 0);
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

- (void)invalidate
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIScenePresentationViewAccessibility;
  [(_UIScenePresentationViewAccessibility *)&v3 invalidate];
  id v2 = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](v5);
  [v2 makeObjectsPerformSelector:sel_unregister];

  -[_UIScenePresentationViewAccessibility _accessibilitySetRemoteElementArray:]((uint64_t)v5, 0);
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  id v2 = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](self);
  [v2 makeObjectsPerformSelector:sel_unregister];

  v3.receiver = v5;
  v3.super_class = (Class)_UIScenePresentationViewAccessibility;
  [(_UIScenePresentationViewAccessibility *)&v3 dealloc];
}

- (id)_viewToAddFocusLayer
{
  return 0;
}

- (id)_axRemoteChild
{
  if (a1)
  {
    id v2 = -[_UIScenePresentationViewAccessibility _accessibilityGetRemoteElementArray](a1);
    id v3 = (id)[v2 firstObject];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (int)_accessibilityRemotePid
{
  id v4 = -[_UIScenePresentationViewAccessibility _axRemoteChild](self);
  char v5 = 0;
  if ([v4 onClientSide])
  {
    id v6 = -[_UIScenePresentationViewAccessibility _axRemoteChild](self);
    char v5 = 1;
    int v3 = [v6 remotePid];
  }
  else
  {
    int v3 = 0;
  }
  if (v5) {

  }
  return v3;
}

- (id)_accessibilityRemoteSceneID
{
  id v9 = self;
  v8[1] = (id)a2;
  char v7 = 0;
  objc_opt_class();
  id v4 = (id)[(_UIScenePresentationViewAccessibility *)v9 safeValueForKey:@"_scene"];
  id v6 = (id)__UIAccessibilityCastAsClass();

  id v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  id v3 = (id)[v5 identifier];
  objc_storeStrong(v8, 0);

  return v3;
}

- (BOOL)_accessibilityHandlesRemoteFocusMovement
{
  id v3 = -[_UIScenePresentationViewAccessibility _axRemoteChild](self);
  char v4 = [v3 onClientSide];

  return v4 & 1;
}

- (BOOL)canBecomeFocused
{
  id v3 = -[_UIScenePresentationViewAccessibility _axRemoteChild](self);
  char v4 = [v3 onClientSide];

  return v4 & 1;
}

@end