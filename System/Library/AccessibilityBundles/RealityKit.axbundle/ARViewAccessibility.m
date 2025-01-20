@interface ARViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axCachedElementsByEntityWrapper;
- (id)accessibilityElements;
- (id)accessibilityElementsForEntityWrappers:(id)a3;
- (void)_axSetCachedElementsByEntityWrapper:(id)a3;
@end

@implementation ARViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RealityKit.ARView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"RealityKit.ARView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.ARView", @"entityAccessibilityWrappers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.ARView", @"distanceInMetersFromEntityAccessibilityWrapper:", "f", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.ARView", @"handleTapForEntityAccessibilityWrapper:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"identifier", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"rootEntityWrapper", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entityLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entityDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"isEntityAccessible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"isEntityActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"calculateScreenBoundingRectIn:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entityAccessibilityTraits", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entityValue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entitySupportsAccessibilityActivateAction", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entityPerformAccessibilityActivate", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entityAccessibilityCustomContent", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entityAccessibilityCustomActions", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entityAccessibilityCustomRotors", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entityPerformAccessibilityIncrement", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entityPerformAccessibilityDecrement", "v", 0);
}

- (id)_axCachedElementsByEntityWrapper
{
}

- (void)_axSetCachedElementsByEntityWrapper:(id)a3
{
}

- (id)accessibilityElements
{
  v8.receiver = self;
  v8.super_class = (Class)ARViewAccessibility;
  id v3 = [(ARViewAccessibility *)&v8 accessibilityElements];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(ARViewAccessibility *)self safeArrayForKey:@"entityAccessibilityWrappers"];
    id v5 = [(ARViewAccessibility *)self accessibilityElementsForEntityWrappers:v6];
  }

  return v5;
}

- (id)accessibilityElementsForEntityWrappers:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16 = self;
  id v5 = [(ARViewAccessibility *)self _axCachedElementsByEntityWrapper];
  v6 = [MEMORY[0x263EFF9A0] dictionary];
  v7 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = [v12 safeValueForKey:@"identifier"];
        v14 = [v5 objectForKeyedSubscript:v13];
        if (!v14) {
          v14 = [[AXARViewElement alloc] initWithAccessibilityContainer:v16 entityWrapper:v12];
        }
        [v7 addObject:v14];
        [v6 setObject:v14 forKeyedSubscript:v13];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  [(ARViewAccessibility *)v16 _axSetCachedElementsByEntityWrapper:v6];

  return v7;
}

@end