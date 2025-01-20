@interface PBEffectsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldHitTestLayers;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setUpEffectLayers;
- (void)dealloc;
- (void)toggleEffectsMode:(id)a3;
@end

@implementation PBEffectsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBEffectsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PBEffectsView" hasInstanceVariable:@"_currentMode" withType:"q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBEffectsView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBEffectsView", @"_setUpEffectLayers", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBEffectsView", @"toggleEffectsMode:", "v", "@", 0);
  [v3 validateClass:@"PBEffectsView" hasInstanceVariable:@"_nineUpLayers" withType:"NSArray"];
  [v3 validateClass:@"PBEffectsView" hasInstanceVariable:@"_filters" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PBEffectsController", @"_currentDevicePosition", "q", 0);
}

- (id)accessibilityLabel
{
  v2 = [(PBEffectsViewAccessibility *)self safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Pbeffectscontr.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _AXAssert();
    goto LABEL_6;
  }
  uint64_t v3 = [v2 safeIntegerForKey:@"_currentDevicePosition"];
  if (v3 == 1)
  {
    v4 = @"front.facing.camera.view";
    goto LABEL_8;
  }
  if (v3)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_9;
  }
  v4 = @"back.facing.camera.view";
LABEL_8:
  v5 = axLocalizedString(v4);
LABEL_9:

  return v5;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(PBEffectsViewAccessibility *)self safeValueForKey:@"_currentMode"];
  BOOL v3 = [v2 intValue] == 0;

  return v3;
}

- (id)accessibilityElements
{
  BOOL v3 = [(PBEffectsViewAccessibility *)self safeValueForKey:@"_currentMode"];
  int v4 = [v3 intValue];

  if (v4)
  {
    v5 = [(PBEffectsViewAccessibility *)self safeValueForKey:@"_nineUpLayers"];
    if ([v5 count] != 9) {
      _AXAssert();
    }
    v6 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v7 = [v6 statusBarOrientation];

    if ((unint64_t)(v7 - 3) <= 1 && [v5 count] == 9)
    {
      id v8 = [v5 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];
    }
    else
    {
      id v8 = v5;
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_accessibilityShouldHitTestLayers
{
  v2 = [(PBEffectsViewAccessibility *)self safeValueForKey:@"_currentMode"];
  BOOL v3 = [v2 intValue] == 1;

  return v3;
}

- (void)toggleEffectsMode:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PBEffectsViewAccessibility;
  [(PBEffectsViewAccessibility *)&v3 toggleEffectsMode:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_super v3 = [(PBEffectsViewAccessibility *)self safeValueForKey:@"_nineUpLayers"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setAccessibilityContainer:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)PBEffectsViewAccessibility;
  [(PBEffectsViewAccessibility *)&v8 dealloc];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PBEffectsViewAccessibility;
  [(PBEffectsViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(PBEffectsViewAccessibility *)self safeValueForKey:@"_nineUpLayers"];
  uint64_t v4 = [(PBEffectsViewAccessibility *)self safeValueForKey:@"_filters"];
  uint64_t v5 = [v3 count];
  if (v5 == [v4 count])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __72__PBEffectsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v6[3] = &unk_265143920;
    id v7 = v4;
    objc_super v8 = self;
    [v3 enumerateObjectsUsingBlock:v6];
  }
  else
  {
    _AXAssert();
  }
}

void __72__PBEffectsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v8 = [v5 objectAtIndex:a3];
  id v7 = [v8 safeValueForKey:@"localizedName"];
  [v6 setAccessibilityLabel:v7];
  [v6 setAccessibilityContainer:*(void *)(a1 + 40)];
  [v6 setIsAccessibilityElement:1];
}

- (void)_setUpEffectLayers
{
  v3.receiver = self;
  v3.super_class = (Class)PBEffectsViewAccessibility;
  [(PBEffectsViewAccessibility *)&v3 _setUpEffectLayers];
  [(PBEffectsViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end