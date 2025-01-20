@interface UIRemoteViewAccessibility
@end

@implementation UIRemoteViewAccessibility

void __75___UIRemoteViewAccessibility__accessibilityRemoteElementCommunicationQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.accessibility.remoteview.communication", 0);
  v1 = (void *)_accessibilityRemoteElementCommunicationQueue_q;
  _accessibilityRemoteElementCommunicationQueue_q = (uint64_t)v0;
}

void __83___UIRemoteViewAccessibility__accessibilityTransmitRemoteUUIDToPid_machPort_value___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  if (*(_DWORD *)(a1 + 48))
  {
    oslog[0] = (os_log_t)(id)AXLogRemoteElement();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_64_4_0_8_0_8_64((uint64_t)v6, *(void *)(a1 + 32), *(_DWORD *)(a1 + 52), *(int *)(a1 + 48), *(void *)(a1 + 40));
      _os_log_error_impl(&dword_2402B7000, oslog[0], type, "%@: error connecting to remote view(pid: %d): %ld : (remote app %@)", v6, 0x26u);
    }
    objc_storeStrong((id *)oslog, 0);
    -[_UIRemoteViewAccessibility _accessibilitySetRemoteElementArray:](*(void *)(a1 + 32), 0);
  }
  else
  {
    os_log_t v2 = (os_log_t)(id)AXLogRemoteElement();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_4_8_64_4_0_8_0_8_64((uint64_t)v5, *(void *)(a1 + 32), *(_DWORD *)(a1 + 52), *(int *)(a1 + 48), *(void *)(a1 + 40));
      _os_log_impl(&dword_2402B7000, v2, OS_LOG_TYPE_INFO, "%@: successfully transmitted to remote view(pid: %d): %ld : (remote app %@)", v5, 0x26u);
    }
    objc_storeStrong((id *)&v2, 0);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __71___UIRemoteViewAccessibility__accessibilitySetRemoteElementIfNecessary__block_invoke(uint64_t a1)
{
}

void __64___UIRemoteViewAccessibility__accessibilityUnregisterRemoteView__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("ax-remoteview-unregister-queue", 0);
  v1 = (void *)_accessibilityUnregisterRemoteView_UnregisterQueue;
  _accessibilityUnregisterRemoteView_UnregisterQueue = (uint64_t)v0;
}

void __64___UIRemoteViewAccessibility__accessibilityUnregisterRemoteView__block_invoke_2()
{
  element = (const __AXUIElement *)_AXUIElementCreateAppElementWithPid();
  AXUIElementSetMessagingTimeout(element, 0.5);
  AXUIElementPerformFencedActionWithValue();
  if (element) {
    CFRelease(element);
  }
}

@end