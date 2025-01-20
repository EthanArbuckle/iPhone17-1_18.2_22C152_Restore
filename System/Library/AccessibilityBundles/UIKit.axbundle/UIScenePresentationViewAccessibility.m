@interface UIScenePresentationViewAccessibility
@end

@implementation UIScenePresentationViewAccessibility

void __78___UIScenePresentationViewAccessibility__accessibilityResetRemoteElementArray__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIScenePresentationViewAccessibility _accessibilitySetRemoteElementIfNecessary](WeakRetained);
}

@end