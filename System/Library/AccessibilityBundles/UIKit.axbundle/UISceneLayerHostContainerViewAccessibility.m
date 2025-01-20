@interface UISceneLayerHostContainerViewAccessibility
@end

@implementation UISceneLayerHostContainerViewAccessibility

void __81___UISceneLayerHostContainerViewAccessibility__rebuildLayersForReason_withFence___block_invoke(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v4 = a1;
  char v3 = 0;
  objc_opt_class();
  id v2 = (id)__UIAccessibilityCastAsSafeCategory();
  id v1 = v2;
  objc_storeStrong(&v2, 0);
  -[_UIScenePresentationViewAccessibility _accessibilityResetRemoteElementArray](v1);
}

@end