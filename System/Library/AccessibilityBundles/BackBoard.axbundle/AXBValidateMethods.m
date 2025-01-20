@interface AXBValidateMethods
@end

@implementation AXBValidateMethods

uint64_t ___AXBValidateMethods_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKUserEventTimer", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUserEventTimer", @"userEventOccurredOnDisplay:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_accessibilityProcessExternHIDEvent:", "v", "^{__IOHIDEvent=}", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_accessibilitySetEventTapCallback:", "v", "^?", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_accessibilityEventTapCallback", "^?", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_accessibilityHIDEventTapCallback", "^?", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_accessibilitySetHIDEventTapCallback:", "v", "^?", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_displayConvertToCAScreen:", "{CGPoint=dd}", "{CGPoint=dd}", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_displayConvertFromCAScreen:", "{CGPoint=dd}", "{CGPoint=dd}", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_objectWithinProximity", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_isDisplayBacklightOff", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_setCapsLockLightOn:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_eventRoutingClientConnectionManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_authenticationMessageForLocationInCAScreenCoordinates:eventType:excludeContextIDsFromHitTest:", "@", "{CGPoint=dd}", "I", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKAccessibility", @"_authenticationMessageForLocationInCAScreenCoordinates:eventType:excludeContextIDsFromHitTest:secureName:", "@", "{CGPoint=dd}", "I", "@", "I", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKSystemShellSentinel", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKSystemShellDescriptor", @"bundleIdentifier", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKSystemShellDescriptor", @"pid", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKSystemShellSentinel", @"systemApplications", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKSystemShellSentinel", @"primarySystemShell", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKHIDClientConnectionManager", @"copyClientForDestination:", "^{__IOHIDEventSystemConnection=}", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKHIDClientConnectionManager", @"copyClientForTaskPort:", "^{__IOHIDEventSystemConnection=}", "I", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKHIDClientConnectionManager", @"pidForBundleID:", "i", "@", 0);
  [v2 validateClass:@"BKSHIDEventDeferringResolution"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKSHIDEventDeferringResolution", @"build:", "@", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKSMutableHIDEventDeferringResolution", @"setPid:", "v", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKHIDEventDeliveryManager", @"destinationsForEvent:sender:", "@", "^{__IOHIDEvent=}", "@", 0);
  [v2 validateClass:@"BKUserEventTimer" hasInstanceVariable:@"_currentMode" withType:"i"];
  [v2 validateClass:@"BKUserEventTimer" hasInstanceVariable:@"_currentTimeout" withType:"d"];
  [v2 validateClass:@"BKUserEventTimer" hasInstanceVariable:@"_queue" withType:"NSObject<OS_dispatch_queue>"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKHIDSystemInterface", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKHIDSystemInterface", @"deliveryManager", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKSHIDEventDeferringResolution", @"pid", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKSHIDEventDeferringResolution", @"processDescription", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"BKBootUIPresenter", @"sharedInstance", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"BKBootUIPresenter", @"isShowingBootUI", "B", 0);
  [v2 validateClass:@"BKBootUIPresenter" hasInstanceVariable:@"_overlay" withType:"BKDisplayRenderOverlay"];
  [v2 validateClass:@"BKDisplayRenderOverlayAppleLogo" hasInstanceVariable:@"_puiProgressWindow" withType:"PUIProgressWindow"];

  return 1;
}

uint64_t ___AXBValidateMethods_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDebugBuild:0];
  [v2 setValidationTargetName:@"AX Backboard Bundle"];
  [v2 setOverrideProcessName:@"Backboard Bundle"];

  return MEMORY[0x270F09468]();
}

@end