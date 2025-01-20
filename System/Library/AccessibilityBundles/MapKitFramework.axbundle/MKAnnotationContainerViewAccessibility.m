@interface MKAnnotationContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityZoom:(BOOL)a3 point:(CGPoint)a4;
- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3;
- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAnnotationViews;
- (id)_accessibilityFilterVisibleElements:(id)a3;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)deselectAnnotationView:(id)a3 animated:(BOOL)a4;
@end

@implementation MKAnnotationContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKAnnotationContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKAnnotationContainerView", @"deselectAnnotationView: animated:", "v", "@", "B", 0);
  [v3 validateClass:@"MKAnnotationContainerView" hasInstanceVariable:@"_annotationViews" withType:"NSMutableOrderedSet"];
  [v3 validateClass:@"MKAnnotationView" hasInstanceVariable:@"_calloutView" withType:"MKCalloutView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MKAnnotationContainerViewAccessibility;
  [(MKAnnotationContainerViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MKAnnotationContainerViewAccessibility *)self _accessibilitySetViewIsVisible:0];
}

- (id)accessibilityElements
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  objc_super v3 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v4 = [(MKAnnotationContainerViewAccessibility *)self _accessibilityAnnotationViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [(MKAnnotationContainerViewAccessibility *)self accessibilityFrame];
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        [v9 accessibilityFrame];
        v34.origin.x = v18;
        v34.origin.y = v19;
        v34.size.width = v20;
        v34.size.height = v21;
        v33.origin.x = v11;
        v33.origin.y = v13;
        v33.size.width = v15;
        v33.size.height = v17;
        if (CGRectContainsRect(v33, v34))
        {
          [v9 setAccessibilityContainer:self];
          [v3 axSafelyAddObject:v9];
        }
        if (_CFMZEnabled())
        {
          v22 = [v9 safeUIViewForKey:@"_calloutView"];
          v23 = AXMapKitLocString(@"INFO_PANEL");
          [v22 setAccessibilityLabel:v23];

          [v22 setAccessibilityContainer:self];
          [v3 axSafelyAddObject:v22];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  v24 = [(MKAnnotationContainerViewAccessibility *)self _accessibilityFilterVisibleElements:v3];

  return v24;
}

- (id)_accessibilityFilterVisibleElements:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityFilterVisibleElements", self);
  uint64_t v34 = 0;
  int PossiblyNilObjectForKey = _AXServerCacheGetPossiblyNilObjectForKey();
  id v7 = 0;
  v8 = v7;
  if (PossiblyNilObjectForKey)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263EFF980] array];
    double v10 = [(MKAnnotationContainerViewAccessibility *)self window];
    [v10 accessibilityFrame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v19 = v4;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (AXRequestingClient() == 11) {
            goto LABEL_10;
          }
          [v24 accessibilityFrame];
          v39.origin.x = v25;
          v39.origin.y = v26;
          v39.size.width = v27;
          v39.size.height = v28;
          v38.origin.x = v12;
          v38.origin.y = v14;
          v38.size.width = v16;
          v38.size.height = v18;
          if (CGRectIntersectsRect(v38, v39)) {
LABEL_10:
          }
            [v9 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v21);
    }

    _AXServerCacheInsertPossiblyNilObjectForKey();
  }

  return v9;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  return -[MKAnnotationContainerViewAccessibility _accessibilityZoom:point:](self, "_accessibilityZoom:point:", 1, a3.x, a3.y);
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  return -[MKAnnotationContainerViewAccessibility _accessibilityZoom:point:](self, "_accessibilityZoom:point:", 0, a3.x, a3.y);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityAnnotationViews
{
  v2 = [(MKAnnotationContainerViewAccessibility *)self safeValueForKey:@"annotationViews"];
  objc_super v3 = __UIAccessibilitySafeClass();

  return v3;
}

- (BOOL)_accessibilityZoom:(BOOL)a3 point:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v6 = a3;
  if (_accessibilityZoom_point___VKMapViewClassOnceToken != -1) {
    dispatch_once(&_accessibilityZoom_point___VKMapViewClassOnceToken, &__block_literal_global_1);
  }
  v8 = [(MKAnnotationContainerViewAccessibility *)self safeValueForKey:@"delegate"];
  id v9 = [v8 safeValueForKey:@"_mapView"];

  if (objc_opt_isKindOfClass())
  {
    if (v6) {
      char v10 = objc_msgSend(v9, "accessibilityZoomInAtPoint:", x, y);
    }
    else {
      char v10 = objc_msgSend(v9, "accessibilityZoomOutAtPoint:", x, y);
    }
    BOOL v11 = v10;
  }
  else
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21918]);
    BOOL v11 = 1;
  }

  return v11;
}

Class __67__MKAnnotationContainerViewAccessibility__accessibilityZoom_point___block_invoke()
{
  Class result = NSClassFromString(&cfstr_Vkmapview.isa);
  _accessibilityZoom_point___VKMapViewClass = (uint64_t)result;
  return result;
}

- (void)deselectAnnotationView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MKAnnotationContainerViewAccessibility;
  [(MKAnnotationContainerViewAccessibility *)&v28 deselectAnnotationView:v6 animated:v4];
  [v6 accessibilityFrame];
  CGFloat x = v31.origin.x;
  CGFloat y = v31.origin.y;
  CGFloat width = v31.size.width;
  CGFloat height = v31.size.height;
  double MidX = CGRectGetMidX(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v32);
  double v13 = [(MKAnnotationContainerViewAccessibility *)self safeValueForKey:@"delegate"];
  CGFloat v14 = [v13 safeValueForKey:@"_mapView"];
  double v15 = [v14 accessibilityElements];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    id v19 = 0;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        NSClassFromString(&cfstr_Vkfeatureacces.isa);
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ((objc_msgSend(v22, "safeBoolForKey:", @"isPOI", (void)v24) & 1) != 0
           || [v22 safeBoolForKey:@"isRouteEta"]))
        {
          if (objc_msgSend(v22, "pointInside:", MidX, MidY))
          {
            id v23 = v22;

            id v19 = v23;
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v18);
  }
  else
  {
    id v19 = 0;
  }

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v19);
}

@end