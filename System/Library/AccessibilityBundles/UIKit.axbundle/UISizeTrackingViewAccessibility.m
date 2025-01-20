@interface UISizeTrackingViewAccessibility
@end

@implementation UISizeTrackingViewAccessibility

void __68___UISizeTrackingViewAccessibility__accessibilitySetFocusOnElement___block_invoke(uint64_t a1)
{
  id v1 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:");
  [v1 _setWantsKeyboardEnvironmentEventDeferring:0];

  id v3 = (id)[*(id *)(a1 + 32) safeValueForKey:@"remoteViewController"];
  [v3 _setWantsKeyboardEnvironmentEventDeferring:1];
}

void __68___UISizeTrackingViewAccessibility__accessibilitySetFocusOnElement___block_invoke_2(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) safeValueForKey:@"remoteViewController"];
  [v1 _setWantsKeyboardEnvironmentEventDeferring:0];
}

@end