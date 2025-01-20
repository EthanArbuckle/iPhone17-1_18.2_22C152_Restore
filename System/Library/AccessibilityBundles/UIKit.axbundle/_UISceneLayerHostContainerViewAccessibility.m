@interface _UISceneLayerHostContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_rebuildLayersForReason:(id)a3 withFence:(id)a4;
@end

@implementation _UISceneLayerHostContainerViewAccessibility

- (void)_rebuildLayersForReason:(id)a3 withFence:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  v12.receiver = v15;
  v12.super_class = (Class)_UISceneLayerHostContainerViewAccessibility;
  [(_UISceneLayerHostContainerViewAccessibility *)&v12 _rebuildLayersForReason:location[0] withFence:v13];
  id v11 = (id)[(_UISceneLayerHostContainerViewAccessibility *)v15 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uiscenepresent_0.isa)];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __81___UISceneLayerHostContainerViewAccessibility__rebuildLayersForReason_withFence___block_invoke;
  v9 = &unk_2650ADF18;
  id v10 = v11;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

+ (id)safeCategoryTargetClassName
{
  return @"_UISceneLayerHostContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UISceneLayerHostContainerView", @"_rebuildLayersForReason:withFence:", "v", "@", "@", 0);
  objc_storeStrong(v4, obj);
}

@end