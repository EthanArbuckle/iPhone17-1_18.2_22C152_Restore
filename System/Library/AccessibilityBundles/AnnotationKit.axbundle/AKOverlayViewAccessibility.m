@interface AKOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axShouldExposeDrawingElement;
- (id)_accessibilityCreateOverlayViewElement;
- (id)_axOverlayViewElement;
- (id)_axOverlayViewLayers;
- (id)accessibilityElements;
- (void)_axSetOverlayViewElement:(id)a3;
- (void)_axSetOverlayViewLayers:(id)a3;
@end

@implementation AKOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKOverlayView", @"pageController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKPageController", @"pageIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKPageController", @"inkPageOverlayController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKInkPageOverlayController", @"inkOverlayView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKInkOverlayView", @"canvasView", "@", 0);
  [v3 validateClass:@"AKInkOverlayView_iOS" isKindOfClass:@"AKInkOverlayView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKPageController", @"controller", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKController", @"toolController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKController", @"annotationEditingEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKController", @"currentPageIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AKToolController", @"toolMode", "Q", 0);
}

- (BOOL)_axShouldExposeDrawingElement
{
  id v3 = [(AKOverlayViewAccessibility *)self safeValueForKey:@"pageController"];
  uint64_t v4 = [v3 safeUnsignedIntegerForKey:@"pageIndex"];

  v5 = [(AKOverlayViewAccessibility *)self safeValueForKey:@"pageController"];
  v6 = [v5 safeValueForKey:@"controller"];

  uint64_t v7 = [v6 safeUnsignedIntegerForKey:@"currentPageIndex"];
  v8 = [v6 safeValueForKey:@"toolController"];
  if ([v8 safeUnsignedIntegerForKey:@"toolMode"] && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = [v6 safeBoolForKey:@"annotationEditingEnabled"];
  }

  return v9;
}

- (id)_axOverlayViewElement
{
}

- (void)_axSetOverlayViewElement:(id)a3
{
}

- (id)_axOverlayViewLayers
{
}

- (void)_axSetOverlayViewLayers:(id)a3
{
}

- (id)_accessibilityCreateOverlayViewElement
{
  if ([(AKOverlayViewAccessibility *)self _axShouldExposeDrawingElement])
  {
    id v3 = [(AKOverlayViewAccessibility *)self _axOverlayViewElement];
    if (!v3)
    {
      id v3 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __68__AKOverlayViewAccessibility__accessibilityCreateOverlayViewElement__block_invoke;
      v8[3] = &unk_265103FE8;
      objc_copyWeak(&v9, &location);
      [v3 _setAccessibilityLabelBlock:v8];
      uint64_t v4 = accessibilityLocalizedString(@"drawing.hint");
      [v3 setAccessibilityHint:v4];

      objc_msgSend(v3, "setAccessibilityActivationPoint:", -1.0, -1.0);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __68__AKOverlayViewAccessibility__accessibilityCreateOverlayViewElement__block_invoke_2;
      v6[3] = &unk_265104010;
      objc_copyWeak(&v7, &location);
      [v3 _setAccessibilityFrameBlock:v6];
      [(AKOverlayViewAccessibility *)self _axSetOverlayViewElement:v3];
      objc_destroyWeak(&v7);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id __68__AKOverlayViewAccessibility__accessibilityCreateOverlayViewElement__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained safeValueForKey:@"pageController"];
  [v2 safeUnsignedIntegerForKey:@"pageIndex"];

  id v3 = NSString;
  uint64_t v4 = accessibilityLocalizedString(@"page.index");
  v5 = AXFormatInteger();
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

double __68__AKOverlayViewAccessibility__accessibilityCreateOverlayViewElement__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  double v3 = v2;

  return v3;
}

- (id)accessibilityElements
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)AKOverlayViewAccessibility;
  double v3 = [(AKOverlayViewAccessibility *)&v32 accessibilityElements];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(AKOverlayViewAccessibility *)self _accessibilityCreateOverlayViewElement];
    char v31 = 0;
    objc_opt_class();
    id v7 = [(AKOverlayViewAccessibility *)self safeValueForKey:@"pageController"];
    v8 = [v7 safeValueForKey:@"layerPresentationManager"];
    id v9 = [v8 safeValueForKey:@"rootLayer"];
    v10 = __UIAccessibilityCastAsClass();

    v11 = [v10 sublayers];
    v12 = [(AKOverlayViewAccessibility *)self _axOverlayViewLayers];
    v26 = v10;
    if (([v11 isEqualToArray:v12] & 1) == 0)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * i) setAccessibilityContainer:0];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
        }
        while (v15);
      }

      v12 = (void *)[v11 copy];
      [(AKOverlayViewAccessibility *)self _axSetOverlayViewLayers:v12];
    }
    if (v6)
    {
      v33 = v6;
      v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
      id v5 = [v18 arrayByAddingObjectsFromArray:v12];
    }
    else
    {
      id v5 = v12;
    }
    char v31 = 0;
    v19 = [(AKOverlayViewAccessibility *)self safeValueForKey:@"pageController"];
    v20 = [v19 safeValueForKey:@"inkPageOverlayController"];
    v21 = [v20 safeValueForKey:@"inkOverlayView"];
    v22 = [v21 safeValueForKey:@"canvasView"];
    v23 = __UIAccessibilitySafeClass();

    if (v31) {
      abort();
    }
    if (v23)
    {
      uint64_t v24 = [v5 arrayByAddingObject:v23];

      id v5 = (id)v24;
    }
  }

  return v5;
}

@end