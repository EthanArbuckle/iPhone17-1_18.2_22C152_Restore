@interface UIRemoteViewControllerAccessibility
@end

@implementation UIRemoteViewControllerAccessibility

uint64_t __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke(uint64_t a1)
{
  if (*(double *)(a1 + 40) * 2.0 >= 5.0) {
    double v2 = 5.0;
  }
  else {
    double v2 = *(double *)(a1 + 40) * 2.0;
  }
  return -[_UIRemoteViewControllerAccessibility _accessibilityLoadAccessibilityInformation:retryTime:](*(void *)(a1 + 32), 0, v2);
}

void __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke_384(uint64_t a1)
{
  id v6 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_viewControllerOperatorProxy"];
  id v5 = (id)[v6 _target];
  id v1 = (id)[v5 _target];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

void __93___UIRemoteViewControllerAccessibility__accessibilityLoadAccessibilityInformation_retryTime___block_invoke_2(_xpc_connection_s *a1)
{
  connection[2] = a1;
  connection[1] = a1;
  connection[0] = (xpc_connection_t)(id)[*(id *)(*(void *)(*((void *)a1 + 4)+ 8)+ 40) connection];
  if (connection[0]) {
    *(_DWORD *)(*(void *)(*((void *)a1 + 5) + 8) + 24) = xpc_connection_get_pid(connection[0]);
  }
  objc_storeStrong((id *)connection, 0);
}

void __76___UIRemoteViewControllerAccessibility___setViewServiceIsDisplayingPopover___block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_hostedDimmingView"];
  [v1 setAccessibilityViewIsModal:0];
}

void __50___UIRemoteViewControllerAccessibility_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v15 = a1;
  uint64_t v14 = a1;
  memset(__b, 0, sizeof(__b));
  id v9 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_sizeTrackingView"];
  id obj = (id)[v9 subviews];

  uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v11)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v11;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v6);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v13 _accessibilityUnregisterRemoteView];
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v1 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_remoteKeyboardRemoteView"];
  [v1 _accessibilityUnregisterRemoteView];

  id v2 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_fullScreenTextEffectsRemoteView"];
  [v2 _accessibilityUnregisterRemoteView];

  id v3 = (id)[*(id *)(a1 + 32) safeValueForKey:@"_textEffectsAboveStatusBarRemoteView"];
  [v3 _accessibilityUnregisterRemoteView];
}

uint64_t __68___UIRemoteViewControllerAccessibility___handleFocusMovementAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setEnabled:", 1, a1, a1);
}

void __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) _accessibilityFocusContainer];
  objc_msgSend(v2, "_accessibilityMoveFocusWithHeading:", objc_msgSend(*(id *)(a1 + 40), "heading"));
}

uint64_t __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setHeading:", *(void *)(a1 + 40), a1, a1);
}

void __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke_3(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x263F1C650];
  id v3 = (id)[*(id *)(a1 + 32) view];
  id v2 = (id)objc_msgSend(v1, "focusSystemForEnvironment:");
  [v2 _setEnabled:0];
}

uint64_t __68___UIRemoteViewControllerAccessibility__axTakeBakeFocusWithHeading___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWantsKeyboardEnvironmentEventDeferring:", 0, a1, a1);
}

@end