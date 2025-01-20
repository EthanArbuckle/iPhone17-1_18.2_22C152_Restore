@interface MKMapViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (id)_axMapsDelegate;
- (id)accessibilityElements;
- (int64_t)_accessibilitySortPriority;
- (void)_didEndZoom;
- (void)_setCompassVisible:(BOOL)a3 animationAllowed:(BOOL)a4 force:(BOOL)a5;
@end

@implementation MKMapViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKMapView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"_setCompassVisible:animationAllowed:force:", "v", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"_mapLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"_didEndZoom", "v", 0);
  [v3 validateClass:@"MKMapView" hasInstanceVariable:@"_basicMapView" withType:"MKBasicMapView"];
  [v3 validateClass:@"MKMapView" hasInstanceVariable:@"_showsZoomControls" withType:"B"];
  [v3 validateClass:@"MKMapView" hasInstanceVariable:@"_compassVisible" withType:"B"];
  [v3 validateClass:@"MKMapView" hasInstanceVariable:@"_compassView" withType:"UIView<MKCompassView>"];
  [v3 validateClass:@"MKAttributionLabel"];
}

- (id)accessibilityElements
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  char v37 = 0;
  objc_opt_class();
  v4 = [(MKMapViewAccessibility *)self _axMapsDelegate];
  v5 = [v4 safeValueForKey:@"chromeViewController"];
  v6 = __UIAccessibilityCastAsClass();

  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v7 = [v6 childViewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v33 + 1) + 8 * v11);
      NSClassFromString(&cfstr_Lookaroundpuck.isa);
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v12;

    if (!v13) {
      goto LABEL_13;
    }
    v7 = [v13 view];
    [v3 addObject:v7];
  }
  else
  {
LABEL_9:
    id v13 = 0;
  }

LABEL_13:
  if ([(MKMapViewAccessibility *)self safeBoolForKey:@"_compassVisible"])
  {
    v14 = [(MKMapViewAccessibility *)self safeValueForKey:@"_compassView"];
    v15 = v14;
    if (v14)
    {
      [v14 setAccessibilityContainer:self];
      [v3 addObject:v15];
    }
  }
  v16 = [(MKMapViewAccessibility *)self safeValueForKey:@"_basicMapView"];
  v17 = [MEMORY[0x263EFF980] array];
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  v27 = __47__MKMapViewAccessibility_accessibilityElements__block_invoke;
  v28 = &unk_26512C418;
  id v18 = v3;
  id v29 = v18;
  id v19 = v16;
  id v30 = v19;
  id v31 = 0;
  v32 = v17;
  id v20 = v17;
  id v21 = (id)[(MKMapViewAccessibility *)self _accessibilityFindUnsortedSubviewDescendantsPassingTest:&v25];
  if (v19)
  {
    objc_msgSend(v19, "setAccessibilityContainer:", self, v25, v26, v27, v28, v29, v30, v31);
    [v18 addObject:v19];
  }
  [(MKMapViewAccessibility *)self safeBoolForKey:@"_showsZoomControls", v25, v26, v27, v28];
  [v18 addObjectsFromArray:v20];
  v22 = v32;
  id v23 = v18;

  return v23;
}

uint64_t __47__MKMapViewAccessibility_accessibilityElements__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (([a1[4] containsObject:v3] & 1) != 0 || a1[5] == v3 || a1[6] == v3)
  {
    uint64_t v6 = 1;
  }
  else
  {
    if ([v3 isAccessibilityElement])
    {
      NSClassFromString(&cfstr_Mkattributionl_0.isa);
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v5 = 4;
      if (isKindOfClass) {
        uint64_t v5 = 7;
      }
      [a1[v5] addObject:v3];
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v4 = [(MKMapViewAccessibility *)self safeValueForKey:@"_mapLayer"];
  LOBYTE(a3) = [v4 accessibilityScroll:a3];

  return a3;
}

- (int64_t)_accessibilitySortPriority
{
  v2 = __UIAccessibilitySafeClass();
  id v3 = [v2 traitCollection];
  if ([v3 horizontalSizeClass] == 1) {
    int64_t v4 = 1;
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (id)_axMapsDelegate
{
  if (objc_opt_respondsToSelector())
  {
    v2 = [MEMORY[0x263F1C408] safeValueForKey:@"sharedMapsDelegate"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_setCompassVisible:(BOOL)a3 animationAllowed:(BOOL)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  int v9 = [(MKMapViewAccessibility *)self safeBoolForKey:@"_compassVisible"];
  v10.receiver = self;
  v10.super_class = (Class)MKMapViewAccessibility;
  [(MKMapViewAccessibility *)&v10 _setCompassVisible:v7 animationAllowed:v6 force:v5];
  if (v9 != [(MKMapViewAccessibility *)self safeBoolForKey:@"_compassVisible"]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (void)_didEndZoom
{
  v4.receiver = self;
  v4.super_class = (Class)MKMapViewAccessibility;
  [(MKMapViewAccessibility *)&v4 _didEndZoom];
  id v3 = [(MKMapViewAccessibility *)self safeValueForKey:@"_mapLayer"];
  [v3 _accessibilitySetBoolValue:1 forKey:@"ZoomNotification"];
}

@end