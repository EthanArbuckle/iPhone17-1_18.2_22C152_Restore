@interface MKBasicMapViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAutomationHitTestReverseOrder;
- (MKBasicMapViewAccessibility)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5 allowsAntialiasing:(BOOL)a6;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomRotors;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MKBasicMapViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKBasicMapView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKBasicMapView", @"initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKBasicMapView", @"mapView", "@", 0);
}

- (MKBasicMapViewAccessibility)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5 allowsAntialiasing:(BOOL)a6
{
  v9.receiver = self;
  v9.super_class = (Class)MKBasicMapViewAccessibility;
  v6 = -[MKBasicMapViewAccessibility initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:](&v9, sel_initWithFrame_andGlobe_shouldRasterize_allowsAntialiasing_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v7 = [(MKBasicMapViewAccessibility *)v6 accessibilityElements];

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)MKBasicMapViewAccessibility;
  [(MKBasicMapViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MKBasicMapViewAccessibility *)self accessibilityElements];
}

- (id)accessibilityLabel
{
  v2 = [(MKBasicMapViewAccessibility *)self safeValueForKey:@"mapView"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityElements
{
  id v3 = objc_opt_new();
  objc_super v4 = [(MKBasicMapViewAccessibility *)self safeValueForKey:@"mapView"];
  v5 = v4;
  if (v4)
  {
    [v4 setAccessibilityContainer:self];
    [v3 addObject:v5];
  }
  v6 = [(MKBasicMapViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  id v7 = [v6 safeValueForKey:@"_annotationContainer"];

  if (v7)
  {
    [v7 setAccessibilityContainer:self];
    [v3 addObject:v7];
  }

  return v3;
}

- (id)accessibilityCustomRotors
{
  v28[3] = *MEMORY[0x263EF8340];
  if (accessibilityCustomRotors__VKFeatureAccessibilityElementClassOnceToken != -1) {
    dispatch_once(&accessibilityCustomRotors__VKFeatureAccessibilityElementClassOnceToken, &__block_literal_global_2);
  }
  id v3 = [(MKBasicMapViewAccessibility *)self safeValueForKey:@"mapView"];
  char v4 = [v3 safeBoolForKey:@"accessibilityIsInTourGuideMode"];
  char v5 = [v3 safeBoolForKey:@"accessibilityIsShowingRoutes"];
  char v6 = [v3 safeBoolForKey:@"accessibilityIsInExplorationMode"];
  id v7 = 0;
  if ((v4 & 1) == 0 && (v5 & 1) == 0 && (v6 & 1) == 0)
  {
    v8 = [(MKBasicMapViewAccessibility *)self _accessibilityValueForKey:@"AXPOIRotor"];
    objc_super v9 = [(MKBasicMapViewAccessibility *)self _accessibilityValueForKey:@"AXTransitStopsRotor"];
    v10 = [(MKBasicMapViewAccessibility *)self _accessibilityValueForKey:@"AXTransitLinesRotor"];
    if (!v8)
    {
      objc_initWeak(&location, self);
      id v11 = objc_alloc(MEMORY[0x263F1C398]);
      v12 = AXMapKitLocString(@"POI_TITLE");
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_2;
      v25[3] = &unk_26512C3F0;
      objc_copyWeak(&v26, &location);
      v8 = (void *)[v11 initWithName:v12 itemSearchBlock:v25];

      [(MKBasicMapViewAccessibility *)self _accessibilitySetRetainedValue:v8 forKey:@"AXPOIRotor"];
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    if (!v9)
    {
      objc_initWeak(&location, self);
      id v13 = objc_alloc(MEMORY[0x263F1C398]);
      v14 = AXMapKitLocString(@"TRANSIT_STOPS_TITLE");
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_4;
      v23[3] = &unk_26512C3F0;
      objc_copyWeak(&v24, &location);
      objc_super v9 = (void *)[v13 initWithName:v14 itemSearchBlock:v23];

      [(MKBasicMapViewAccessibility *)self _accessibilitySetRetainedValue:v9 forKey:@"AXTransitStopsRotor"];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    if (!v10)
    {
      objc_initWeak(&location, self);
      id v15 = objc_alloc(MEMORY[0x263F1C398]);
      v16 = AXMapKitLocString(@"TRANSIT_LINES_TITLE");
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      v20 = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_6;
      v21 = &unk_26512C3F0;
      objc_copyWeak(&v22, &location);
      v10 = (void *)[v15 initWithName:v16 itemSearchBlock:&v18];

      [(MKBasicMapViewAccessibility *)self _accessibilitySetRetainedValue:v10, @"AXTransitLinesRotor", v18, v19, v20, v21 forKey];
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    v28[0] = v8;
    v28[1] = v9;
    v28[2] = v10;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  }

  return v7;
}

Class __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Vkfeatureacces.isa);
  accessibilityCustomRotors__VKFeatureAccessibilityElementClass = (uint64_t)result;
  return result;
}

id __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v5 = [WeakRetained safeValueForKey:@"mapView"];

  char v6 = objc_opt_new();
  id v7 = [v5 accessibilityElements];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_3;
  v12[3] = &unk_26512C3C8;
  id v13 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v12];

  id v9 = objc_loadWeakRetained(v2);
  v10 = [v9 _accessibilityCustomRotorResultHelper:v3 array:v8];

  return v10;
}

void __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 safeBoolForKey:@"isPOI"]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

id __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v5 = [WeakRetained safeValueForKey:@"mapView"];

  char v6 = objc_opt_new();
  id v7 = [v5 accessibilityElements];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_5;
  v12[3] = &unk_26512C3C8;
  id v13 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v12];

  id v9 = objc_loadWeakRetained(v2);
  v10 = [v9 _accessibilityCustomRotorResultHelper:v3 array:v8];

  return v10;
}

void __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 safeBoolForKey:@"isTransitStop"]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

id __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v5 = [WeakRetained safeValueForKey:@"mapView"];

  char v6 = objc_opt_new();
  id v7 = [v5 accessibilityElements];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_7;
  v12[3] = &unk_26512C3C8;
  id v13 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v12];

  id v9 = objc_loadWeakRetained(v2);
  v10 = [v9 _accessibilityCustomRotorResultHelper:v3 array:v8];

  return v10;
}

void __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 safeBoolForKey:@"isTransitLine"]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)accessibilityCustomActions
{
  v2 = [(MKBasicMapViewAccessibility *)self safeValueForKey:@"mapView"];
  id v3 = [v2 accessibilityCustomActions];

  return v3;
}

- (BOOL)_accessibilityAutomationHitTestReverseOrder
{
  return 1;
}

@end