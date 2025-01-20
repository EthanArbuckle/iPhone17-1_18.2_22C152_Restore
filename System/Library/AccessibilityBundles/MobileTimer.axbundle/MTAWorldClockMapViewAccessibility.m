@interface MTAWorldClockMapViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (void)_accessibilityAnnounceSolarRegionChange:(CGPoint)a3;
- (void)_accessibilityRemoveSolarTerminatorPath;
- (void)addCity:(id)a3;
- (void)removeCity:(id)a3;
@end

@implementation MTAWorldClockMapViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAWorldClockMapView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAWorldClockMapView", @"terminatorPathForDayOfYear: size:", "@", "d", "{CGSize=dd}", 0);
}

- (id)accessibilityElements
{
  v3 = (void *)MEMORY[0x263F81490];
  v4 = [(MTAWorldClockMapViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v4
    || (int v5 = accessibilityElements_wasRTL,
        v5 != [(MTAWorldClockMapViewAccessibility *)self _accessibilityIsRTL]))
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);

    [(MTAWorldClockMapViewAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:*v3];
    v7 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_0];
    v8 = [(MTAWorldClockMapViewAccessibility *)self safeValueForKey:@"subviews"];
    v9 = [v8 filteredArrayUsingPredicate:v7];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__MTAWorldClockMapViewAccessibility_accessibilityElements__block_invoke_2;
    v12[3] = &unk_26513A128;
    v12[4] = self;
    v10 = [v9 sortedArrayUsingComparator:v12];
    [v6 addObjectsFromArray:v10];
    accessibilityElements_wasRTL = [(MTAWorldClockMapViewAccessibility *)self _accessibilityIsRTL];

    v4 = v6;
  }

  return v4;
}

uint64_t __58__MTAWorldClockMapViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x245657200](@"MTAWorldClockMapCityView");
  uint64_t v3 = [v2 isMemberOfClass:objc_opt_class()];

  return v3;
}

uint64_t __58__MTAWorldClockMapViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 frame];
  double v7 = v6;
  [v5 frame];
  double v9 = v8;

  if ([*(id *)(a1 + 32) _accessibilityIsRTL] != v7 >= v9) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"world.map");
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (void)addCity:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockMapViewAccessibility;
  [(MTAWorldClockMapViewAccessibility *)&v4 addCity:a3];
  [(MTAWorldClockMapViewAccessibility *)self _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)removeCity:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockMapViewAccessibility;
  [(MTAWorldClockMapViewAccessibility *)&v4 removeCity:a3];
  [(MTAWorldClockMapViewAccessibility *)self _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_accessibilityAnnounceSolarRegionChange:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(MTAWorldClockMapViewAccessibility *)self _accessibilityValueForKey:@"accessibilitySolarTerminatorPath"];
    if (!v6)
    {
      double v7 = [MEMORY[0x263F1C920] mainScreen];
      [v7 bounds];
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      uint64_t v13 = v12;
      uint64_t v15 = v14;

      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__1;
      v24 = __Block_byref_object_dispose__1;
      id v25 = 0;
      uint64_t v19 = MEMORY[0x263EF8330];
      AXPerformSafeBlock();
      id v6 = (id)v21[5];
      _Block_object_dispose(&v20, 8);

      [(MTAWorldClockMapViewAccessibility *)self _accessibilitySetRetainedValue:v6, @"accessibilitySolarTerminatorPath", v19, 3221225472, __77__MTAWorldClockMapViewAccessibility__accessibilityAnnounceSolarRegionChange___block_invoke, &unk_26513A150, self, &v20, v9, v11, v13, v15 forKey];
    }
    v16 = [(MTAWorldClockMapViewAccessibility *)self _accessibilityValueForKey:@"accessibilitySolarRegion"];
    if (objc_msgSend(v6, "containsPoint:", x, y)) {
      v17 = @"world.map.solar.region.night";
    }
    else {
      v17 = @"world.map.solar.region.day";
    }
    v18 = accessibilityLocalizedString(v17);
    if (([v18 isEqualToString:v16] & 1) == 0) {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v18);
    }
    [(MTAWorldClockMapViewAccessibility *)self _accessibilitySetRetainedValue:v18 forKey:@"accessibilitySolarRegion"];
  }
}

void __77__MTAWorldClockMapViewAccessibility__accessibilityAnnounceSolarRegionChange___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = [MEMORY[0x263EFF910] date];
  uint64_t v3 = objc_msgSend(v2, "terminatorPathForDayOfYear:size:", accessibilityDayOfYear(v6), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [(MTAWorldClockMapViewAccessibility *)self accessibilityElements];
  UIAccessibilityPointForPoint();
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        -[MTAWorldClockMapViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", v18, x, y);
        if (objc_msgSend(v18, "pointInside:withEvent:", v7))
        {
          [(MTAWorldClockMapViewAccessibility *)self _accessibilityRemoveValueForKey:@"accessibilitySolarRegion"];
          id v19 = v18;

          goto LABEL_13;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  [(MTAWorldClockMapViewAccessibility *)self accessibilityFrame];
  v29.double x = v10;
  v29.double y = v12;
  if (CGRectContainsPoint(v30, v29)) {
    -[MTAWorldClockMapViewAccessibility _accessibilityAnnounceSolarRegionChange:](self, "_accessibilityAnnounceSolarRegionChange:", x, y);
  }
  v21.receiver = self;
  v21.super_class = (Class)MTAWorldClockMapViewAccessibility;
  -[MTAWorldClockMapViewAccessibility _accessibilityHitTest:withEvent:](&v21, sel__accessibilityHitTest_withEvent_, v7, x, y);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v19;
}

- (void)_accessibilityRemoveSolarTerminatorPath
{
}

@end