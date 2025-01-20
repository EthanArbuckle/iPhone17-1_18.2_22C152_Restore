@interface _UIPlatterTransformViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axCachedPlatterElements;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (uint64_t)_accessibilityIsExpandedTransformView;
- (uint64_t)_accessibilitySetIsExpandedTransformView:(uint64_t)result;
- (uint64_t)_axShowsSourceViewDirectly;
- (void)_axSetCachedPlatterElements:(uint64_t)a1;
@end

@implementation _UIPlatterTransformViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPlatterTransformView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (uint64_t)_accessibilityIsExpandedTransformView
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_accessibilitySetIsExpandedTransformView:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIPlatterTransformView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"shouldTakeOwnershipOfSourceView", "B", 0);
  objc_storeStrong(v5, obj);
}

- (id)_axCachedPlatterElements
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &___UIPlatterTransformViewAccessibility___axCachedPlatterElements);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_axSetCachedPlatterElements:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (int64_t)accessibilityContainerType
{
  v5 = self;
  SEL v4 = a2;
  if (-[_UIPlatterTransformViewAccessibility _accessibilityIsExpandedTransformView]((uint64_t)self)) {
    return 4;
  }
  v3.receiver = v5;
  v3.super_class = (Class)_UIPlatterTransformViewAccessibility;
  return [(_UIPlatterTransformViewAccessibility *)&v3 accessibilityContainerType];
}

- (uint64_t)_axShowsSourceViewDirectly
{
  if (a1) {
    char v2 = [a1 safeBoolForKey:@"shouldTakeOwnershipOfSourceView"] & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (BOOL)isAccessibilityElement
{
  v8 = self;
  SEL v7 = a2;
  char v5 = 0;
  LOBYTE(v3) = 0;
  if (AXRequestingClient() == 4)
  {
    id v6 = (id)[MEMORY[0x263F22938] sharedInstance];
    char v5 = 1;
    LOBYTE(v3) = 0;
    if (([v6 assistiveTouchScannerSpeechEnabled] & 1) == 0)
    {
      LOBYTE(v3) = 0;
      if (-[_UIPlatterTransformViewAccessibility _accessibilityIsExpandedTransformView]((uint64_t)v8)) {
        int v3 = -[_UIPlatterTransformViewAccessibility _axShowsSourceViewDirectly](v8) ^ 1;
      }
    }
  }
  if (v5) {

  }
  if (v3) {
    return 1;
  }
  v4.receiver = v8;
  v4.super_class = (Class)_UIPlatterTransformViewAccessibility;
  return [(_UIPlatterTransformViewAccessibility *)&v4 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  id v6 = self;
  SEL v5 = a2;
  if (-[_UIPlatterTransformViewAccessibility _accessibilityIsExpandedTransformView]((uint64_t)self))
  {
    id v7 = accessibilityLocalizedString(@"context.menu.preview");
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)_UIPlatterTransformViewAccessibility;
    id v7 = [(_UIPlatterTransformViewAccessibility *)&v4 accessibilityLabel];
  }
  char v2 = v7;

  return v2;
}

- (id)accessibilityElements
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v54 = self;
  v53[1] = (id)a2;
  if ((-[_UIPlatterTransformViewAccessibility _accessibilityIsExpandedTransformView]((uint64_t)self) & 1) == 0
    || (-[_UIPlatterTransformViewAccessibility _axShowsSourceViewDirectly](v54) & 1) != 0)
  {
    v24.receiver = v54;
    v24.super_class = (Class)_UIPlatterTransformViewAccessibility;
    id v55 = [(_UIPlatterTransformViewAccessibility *)&v24 accessibilityElements];
  }
  else
  {
    v53[0] = (id)[(_UIPlatterTransformViewAccessibility *)v54 safeUIViewForKey:@"sourceView"];
    id v52 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%p-sourceViewElements", v54);
    id v51 = (id)[(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v52];
    if (!v51)
    {
      id v50 = (id)[MEMORY[0x263EFF980] array];
      id v49 = (id)[MEMORY[0x263F81198] options];
      uint64_t v43 = MEMORY[0x263EF8330];
      int v44 = -1073741824;
      int v45 = 0;
      v46 = __61___UIPlatterTransformViewAccessibility_accessibilityElements__block_invoke;
      v47 = &unk_2650AE790;
      id v48 = v53[0];
      [v49 setLeafNodePredicate:&v43];
      v21 = (id *)MEMORY[0x263F1D020];
      id v42 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityContainerToStopVisibilityCheck];
      char v41 = 0;
      char v41 = [*v21 _accessibilityShouldIgnoreOpaqueElementProviders] & 1;
      [*v21 _accessibilitySetShouldIgnoreOpaqueElementProviders:1];
      [*v21 _accessibilitySetContainerToStopVisibilityCheck:v53[0]];
      id v40 = (id)[v53[0] _accessibilityLeafDescendantsWithOptions:v49];
      [*v21 _accessibilitySetShouldIgnoreOpaqueElementProviders:v41 & 1];
      [*v21 _accessibilitySetContainerToStopVisibilityCheck:v42];
      id v39 = -[_UIPlatterTransformViewAccessibility _axCachedPlatterElements](v54);
      id v38 = (id)[MEMORY[0x263EFF9A0] dictionary];
      memset(__b, 0, sizeof(__b));
      id obj = v40;
      uint64_t v23 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
      if (v23)
      {
        uint64_t v18 = *(void *)__b[2];
        uint64_t v19 = 0;
        unint64_t v20 = v23;
        while (1)
        {
          uint64_t v17 = v19;
          if (*(void *)__b[2] != v18) {
            objc_enumerationMutation(obj);
          }
          v37 = *(void **)(__b[1] + 8 * v19);
          id v35 = (id)[MEMORY[0x263F08D40] valueWithPointer:v37];
          id location = (id)[v39 objectForKeyedSubscript:v35];
          if (!location)
          {
            if ([v37 _accessibilityIsRemoteElement])
            {
              id v2 = objc_alloc(MEMORY[0x263F1C3A8]);
              int v3 = (void *)[v2 initWithAccessibilityContainer:v54];
              id v4 = location;
              id location = v3;

              [v37 accessibilityFrame];
              uint64_t v28 = v5;
              uint64_t v29 = v6;
              uint64_t v30 = v7;
              uint64_t v31 = v8;
              UIAccessibilityFrameToBounds();
              *(double *)&long long v32 = v9;
              *((double *)&v32 + 1) = v10;
              *(double *)&long long v33 = v11;
              *((double *)&v33 + 1) = v12;
              long long v26 = v32;
              long long v27 = v33;
              objc_msgSend(location, "setAccessibilityFrameInContainerSpace:", v9, v10, v11, v12);
              [location setAccessibilityTraits:*MEMORY[0x263F1CF00]];
              id v16 = accessibilityLocalizedString(@"context.menu.preview");
              objc_msgSend(location, "setAccessibilityLabel:");
            }
            else
            {
              v13 = [AXPlatterContentMockElement alloc];
              id v25 = [(AXPlatterContentMockElement *)v13 initWithAccessibilityContainer:v54];
              -[AXPlatterContentMockElement setSourceElement:]((uint64_t)v25, v37);
              -[AXPlatterContentMockElement setSourceView:]((uint64_t)v25, v53[0]);
              objc_storeStrong(&location, v25);
              objc_storeStrong(&v25, 0);
            }
          }
          [v50 addObject:location];
          [v38 setObject:location forKeyedSubscript:v35];
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v35, 0);
          ++v19;
          if (v17 + 1 >= v20)
          {
            uint64_t v19 = 0;
            unint64_t v20 = [obj countByEnumeratingWithState:__b objects:v56 count:16];
            if (!v20) {
              break;
            }
          }
        }
      }

      -[_UIPlatterTransformViewAccessibility _axSetCachedPlatterElements:]((uint64_t)v54, v38);
      objc_storeStrong(&v51, v50);
      [(id)*MEMORY[0x263F81160] setObject:v51 forKeyedSubscript:v52];
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
      objc_storeStrong(&v42, 0);
      objc_storeStrong(&v48, 0);
      objc_storeStrong(&v49, 0);
      objc_storeStrong(&v50, 0);
    }
    id v55 = v51;
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v52, 0);
    objc_storeStrong(v53, 0);
  }
  v14 = v55;

  return v14;
}

@end