@interface MKMapViewAccessibility__Weather__MapKit
+ (Class)_axMKAttributionLabelClass;
+ (Class)_axVKFeatureAccessibilityElementClass;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axApplyModel:(id)a3 ifElement:(id)a4 hasLocation:(id)a5;
- (BOOL)_axIsInitialized;
- (BOOL)_axLocationCoordinatesMatch:(id)a3 location:(id)a4;
- (BOOL)_axRequestIsInFlightForLocation:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_axAttributionElement;
- (id)_axCacheKeyForLocation:(id)a3;
- (id)_axCurrentOverlayKey;
- (id)_axFavoritesRotor;
- (id)_axGetCurrentOverlayKeyFromDelegate;
- (id)_axInFlightRequestCleanupTimer;
- (id)_axInFlightRequests;
- (id)_axLocationForVKFeatureAccessibilityElement:(id)a3;
- (id)_axLocationFromVKLocationCoordinates:(VKLocationCoordinate2D)a3;
- (id)_axMapLayer;
- (id)_axModelCache;
- (id)_axModelForLocation:(id)a3;
- (id)_axUpdateDebounceTimer;
- (id)_axVKFeaturePOIElements;
- (id)accessibilityCustomRotors;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyModelToVKFeatureAccessibilityElement:(id)a3;
- (void)_axApplyModelsToVKFeatureAccessibilityElementsIfNeeded;
- (void)_axClearInFlightRequests;
- (void)_axInitialize;
- (void)_axScheduleUpdate;
- (void)_axSetAccessibilityModel:(id)a3 forElementWithLocation:(id)a4;
- (void)_axSetCurrentOverlayKey:(id)a3;
- (void)_axSetFavoritesRotor:(id)a3;
- (void)_axSetInFlightRequestCleanupTimer:(id)a3;
- (void)_axSetInFlightRequests:(id)a3;
- (void)_axSetIsInitialized:(BOOL)a3;
- (void)_axSetModelCache:(id)a3;
- (void)_axSetRequestIsInFlight:(BOOL)a3 forLocation:(id)a4;
- (void)_axSetUpdateDebounceTimer:(id)a3;
- (void)_axStoreModel:(id)a3 location:(id)a4;
- (void)_axUpdateLocation:(id)a3 withModel:(id)a4;
- (void)_axUpdateModelsForCurrentOverlayKind;
- (void)addOverlay:(id)a3 level:(int64_t)a4;
- (void)mapLayerDidFinishLoadingTiles:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MKMapViewAccessibility__Weather__MapKit

+ (id)safeCategoryTargetClassName
{
  return @"MKMapView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsInitialized
{
  return MEMORY[0x270F09620](self, &__MKMapViewAccessibility__Weather__MapKit___axIsInitialized);
}

- (void)_axSetIsInitialized:(BOOL)a3
{
}

- (id)_axModelCache
{
}

- (void)_axSetModelCache:(id)a3
{
}

- (id)_axInFlightRequests
{
}

- (void)_axSetInFlightRequests:(id)a3
{
}

- (id)_axCurrentOverlayKey
{
}

- (void)_axSetCurrentOverlayKey:(id)a3
{
}

- (id)_axUpdateDebounceTimer
{
}

- (void)_axSetUpdateDebounceTimer:(id)a3
{
}

- (id)_axInFlightRequestCleanupTimer
{
}

- (void)_axSetInFlightRequestCleanupTimer:(id)a3
{
}

- (id)_axFavoritesRotor
{
}

- (void)_axSetFavoritesRotor:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"_mapLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"setDelegate:", "v", "@", 0);
  [v3 validateClass:@"MKMapView" hasInstanceVariable:@"_annotationContainer" withType:"MKAnnotationContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"accessibilityElementManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"convertPoint:toCoordinateFromView:", "{CLLocationCoordinate2D=dd}", "{CGPoint=dd}", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
  [(MKMapViewAccessibility__Weather__MapKit *)&v3 _accessibilityLoadAccessibilityInformation];
  [(MKMapViewAccessibility__Weather__MapKit *)self _axUpdateModelsForCurrentOverlayKind];
}

- (void)_axInitialize
{
  objc_super v3 = objc_opt_new();
  [(MKMapViewAccessibility__Weather__MapKit *)self _axSetModelCache:v3];

  v4 = objc_opt_new();
  [(MKMapViewAccessibility__Weather__MapKit *)self _axSetInFlightRequests:v4];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__axDidToggleAXSetting_ name:*MEMORY[0x263F1CF90] object:0];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__axDidToggleAXSetting_ name:*MEMORY[0x263F1CEB8] object:0];

  v7 = [(MKMapViewAccessibility__Weather__MapKit *)self _axMapLayer];
  id v9 = [v7 safeValueForKey:@"accessibilityElementManager"];

  if (v9)
  {
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel__axUpdateElementsComplete_ name:@"UpdateAccessibilityElementsComplete" object:v9];
  }
  [(MKMapViewAccessibility__Weather__MapKit *)self _axSetIsInitialized:1];
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(MKMapViewAccessibility__Weather__MapKit *)self _axAttributionElement];
  [v8 accessibilityFrame];
  v13.double x = x;
  v13.double y = y;
  if (!CGRectContainsPoint(v14, v13))
  {
    v11.receiver = self;
    v11.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
    uint64_t v9 = -[MKMapViewAccessibility__Weather__MapKit _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);

    v8 = (void *)v9;
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
  [(MKMapViewAccessibility__Weather__MapKit *)&v4 setDelegate:a3];
  [(MKMapViewAccessibility__Weather__MapKit *)self _axUpdateModelsForCurrentOverlayKind];
}

- (void)setAccessibilityLabel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
  id v4 = a3;
  [(MKMapViewAccessibility__Weather__MapKit *)&v6 setAccessibilityLabel:v4];
  v5 = [(MKMapViewAccessibility__Weather__MapKit *)self _axMapLayer];
  [v5 setAccessibilityLabel:v4];
}

- (void)addOverlay:(id)a3 level:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
  [(MKMapViewAccessibility__Weather__MapKit *)&v5 addOverlay:a3 level:a4];
  [(MKMapViewAccessibility__Weather__MapKit *)self _axUpdateModelsForCurrentOverlayKind];
}

- (void)mapLayerDidFinishLoadingTiles:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
  [(MKMapViewAccessibility__Weather__MapKit *)&v4 mapLayerDidFinishLoadingTiles:a3];
  [(MKMapViewAccessibility__Weather__MapKit *)self _axScheduleUpdate];
}

- (id)accessibilityCustomRotors
{
  v14[1] = *MEMORY[0x263EF8340];
  if (accessibilityCustomRotors_onceToken != -1) {
    dispatch_once(&accessibilityCustomRotors_onceToken, &__block_literal_global_1);
  }
  objc_super v3 = [(MKMapViewAccessibility__Weather__MapKit *)self _axFavoritesRotor];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x263F1C398]);
    objc_super v5 = AXWeatherLocString(@"FAVORITES_TITLE");
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __68__MKMapViewAccessibility__Weather__MapKit_accessibilityCustomRotors__block_invoke_2;
    objc_super v11 = &unk_2651688F0;
    objc_copyWeak(&v12, &location);
    objc_super v3 = (void *)[v4 initWithName:v5 itemSearchBlock:&v8];

    -[MKMapViewAccessibility__Weather__MapKit _axSetFavoritesRotor:](self, "_axSetFavoritesRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v14[0] = v3;
  objc_super v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

  return v6;
}

- (void)_axScheduleUpdate
{
  objc_super v3 = [(MKMapViewAccessibility__Weather__MapKit *)self _axUpdateDebounceTimer];
  [v3 invalidate];

  id v4 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__axApplyModelsToVKFeatureAccessibilityElementsIfNeeded selector:0 userInfo:0 repeats:0.25];
  [(MKMapViewAccessibility__Weather__MapKit *)self _axSetUpdateDebounceTimer:v4];
}

- (void)_axUpdateModelsForCurrentOverlayKind
{
  id v5 = [(MKMapViewAccessibility__Weather__MapKit *)self _axGetCurrentOverlayKeyFromDelegate];
  if (v5)
  {
    objc_super v3 = [(MKMapViewAccessibility__Weather__MapKit *)self _axCurrentOverlayKey];
    if (!v3 || ([v5 isEqualToString:v3] & 1) == 0)
    {
      [(MKMapViewAccessibility__Weather__MapKit *)self _axSetCurrentOverlayKey:v5];
      id v4 = [(MKMapViewAccessibility__Weather__MapKit *)self _axModelCache];
      [v4 removeAllObjects];

      [(MKMapViewAccessibility__Weather__MapKit *)self _axApplyModelsToVKFeatureAccessibilityElementsIfNeeded];
    }
  }
}

- (id)_axGetCurrentOverlayKeyFromDelegate
{
  objc_super v3 = [(MKMapViewAccessibility__Weather__MapKit *)self safeValueForKey:@"delegate"];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 accessibilityModelOverlayKeyForMapView:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_axApplyModelsToVKFeatureAccessibilityElementsIfNeeded
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(MKMapViewAccessibility__Weather__MapKit *)self _axIsInitialized]) {
    [(MKMapViewAccessibility__Weather__MapKit *)self _axInitialize];
  }
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    objc_super v3 = [(MKMapViewAccessibility__Weather__MapKit *)self _axCurrentOverlayKey];

    if (!v3)
    {
      uint64_t v4 = [(MKMapViewAccessibility__Weather__MapKit *)self _axGetCurrentOverlayKeyFromDelegate];
      if (!v4) {
        return;
      }
      id v5 = (void *)v4;
      [(MKMapViewAccessibility__Weather__MapKit *)self _axSetCurrentOverlayKey:v4];
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v6 = [(MKMapViewAccessibility__Weather__MapKit *)self _axVKFeaturePOIElements];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [(MKMapViewAccessibility__Weather__MapKit *)self _axApplyModelToVKFeatureAccessibilityElement:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_axApplyModelToVKFeatureAccessibilityElement:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() _axVKFeatureAccessibilityElementClass];
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(MKMapViewAccessibility__Weather__MapKit *)self _axLocationForVKFeatureAccessibilityElement:v4];
    if (!v5)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_super v6 = [(MKMapViewAccessibility__Weather__MapKit *)self _axModelForLocation:v5];
    if (v6)
    {
      uint64_t v7 = [(MKMapViewAccessibility__Weather__MapKit *)self _axCurrentOverlayKey];
      if (v7
        && ([v6 overlayDescriptionKey],
            uint64_t v8 = objc_claimAutoreleasedReturnValue(),
            int v9 = [v7 isEqualToString:v8],
            v8,
            v9))
      {
        uint64_t v10 = [v6 expiration];
        long long v11 = [MEMORY[0x263EFF910] date];
        uint64_t v12 = [v10 compare:v11];

        long long v13 = [v6 accessibilityDescription];
        [v4 setAccessibilityValue:v13];

        if (v12 == 1)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        [v4 setAccessibilityValue:0];
      }
    }
    long long v14 = [(MKMapViewAccessibility__Weather__MapKit *)self safeValueForKey:@"delegate"];
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, self);
      if (![(MKMapViewAccessibility__Weather__MapKit *)self _axRequestIsInFlightForLocation:v5])
      {
        uint64_t v15 = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        v17 = __88__MKMapViewAccessibility__Weather__MapKit__axApplyModelToVKFeatureAccessibilityElement___block_invoke;
        v18 = &unk_265168918;
        objc_copyWeak(&v19, &location);
        [v14 mapView:self requestedAccessibilityModelForLocation:v5 completion:&v15];
        -[MKMapViewAccessibility__Weather__MapKit _axSetRequestIsInFlight:forLocation:](self, "_axSetRequestIsInFlight:forLocation:", 1, v5, v15, v16, v17, v18);
        objc_destroyWeak(&v19);
      }
      objc_destroyWeak(&location);
    }

    goto LABEL_14;
  }
LABEL_16:
}

- (void)_axUpdateLocation:(id)a3 withModel:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(MKMapViewAccessibility__Weather__MapKit *)self _axCurrentOverlayKey];
  if (v7)
  {
    uint64_t v8 = [v6 overlayDescriptionKey];
    int v9 = [v8 isEqualToString:v7];

    if (v9)
    {
      [(MKMapViewAccessibility__Weather__MapKit *)self _axStoreModel:v6 location:v10];
      [(MKMapViewAccessibility__Weather__MapKit *)self _axSetAccessibilityModel:v6 forElementWithLocation:v10];
    }
  }
}

- (id)_axLocationFromVKLocationCoordinates:(VKLocationCoordinate2D)a3
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:a3.var0 longitude:a3.var1];

  return v3;
}

- (id)_axLocationForVKFeatureAccessibilityElement:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() _axVKFeatureAccessibilityElementClass];
  if (objc_opt_isKindOfClass())
  {
    [v4 accessibilityActivationPoint];
    UIAccessibilityPointToPoint();
    -[MKMapViewAccessibility__Weather__MapKit convertPoint:toCoordinateFromView:](self, "convertPoint:toCoordinateFromView:", self);
    id v5 = -[MKMapViewAccessibility__Weather__MapKit _axLocationFromVKLocationCoordinates:](self, "_axLocationFromVKLocationCoordinates:");
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_axCacheKeyForLocation:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  [v5 coordinate];
  uint64_t v7 = v6;
  [v5 coordinate];
  uint64_t v9 = v8;

  id v10 = [MEMORY[0x263EFF960] currentLocale];
  long long v11 = [v10 localeIdentifier];
  uint64_t v12 = [(MKMapViewAccessibility__Weather__MapKit *)self _axCurrentOverlayKey];
  long long v13 = [v4 stringWithFormat:@"%.3f %.3f %@ %@", v7, v9, v11, v12];

  return v13;
}

- (BOOL)_axApplyModel:(id)a3 ifElement:(id)a4 hasLocation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(MKMapViewAccessibility__Weather__MapKit *)self _axLocationForVKFeatureAccessibilityElement:v9];
  BOOL v12 = [(MKMapViewAccessibility__Weather__MapKit *)self _axLocationCoordinatesMatch:v11 location:v10];

  if (v12)
  {
    long long v13 = [(MKMapViewAccessibility__Weather__MapKit *)self _axCurrentOverlayKey];
    if (v13
      && ([v8 overlayDescriptionKey],
          long long v14 = objc_claimAutoreleasedReturnValue(),
          int v15 = [v13 isEqualToString:v14],
          v14,
          v15))
    {
      uint64_t v16 = [v8 accessibilityDescription];
      [v9 setAccessibilityValue:v16];

      BOOL v17 = 1;
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)_axSetAccessibilityModel:(id)a3 forElementWithLocation:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(MKMapViewAccessibility__Weather__MapKit *)self _axVKFeaturePOIElements];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      if ([(MKMapViewAccessibility__Weather__MapKit *)self _axApplyModel:v6 ifElement:*(void *)(*((void *)&v13 + 1) + 8 * v12) hasLocation:v7])
      {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)_axLocationCoordinatesMatch:(id)a3 location:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 coordinate];
  double v8 = v7;
  [v5 coordinate];
  BOOL v10 = vabdd_f64(v8, v9) < 2.22044605e-16;
  [v6 coordinate];
  double v12 = v11;

  [v5 coordinate];
  double v14 = v13;

  return vabdd_f64(v12, v14) < 2.22044605e-16 && v10;
}

- (id)_axMapLayer
{
  return (id)[(MKMapViewAccessibility__Weather__MapKit *)self safeValueForKey:@"_mapLayer"];
}

- (void)_axStoreModel:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v8 = [(MKMapViewAccessibility__Weather__MapKit *)self _axCacheKeyForLocation:a4];
  double v7 = [(MKMapViewAccessibility__Weather__MapKit *)self _axModelCache];
  [v7 setObject:v6 forKey:v8];
}

- (id)_axModelForLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(MKMapViewAccessibility__Weather__MapKit *)self _axModelCache];
  id v6 = [(MKMapViewAccessibility__Weather__MapKit *)self _axCacheKeyForLocation:v4];

  double v7 = [v5 objectForKey:v6];

  return v7;
}

- (BOOL)_axRequestIsInFlightForLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(MKMapViewAccessibility__Weather__MapKit *)self _axInFlightRequests];
  id v6 = [(MKMapViewAccessibility__Weather__MapKit *)self _axCacheKeyForLocation:v4];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (void)_axClearInFlightRequests
{
  objc_super v3 = [(MKMapViewAccessibility__Weather__MapKit *)self _axInFlightRequests];
  [v3 removeAllObjects];

  id v4 = [(MKMapViewAccessibility__Weather__MapKit *)self _axInFlightRequestCleanupTimer];
  [v4 invalidate];

  [(MKMapViewAccessibility__Weather__MapKit *)self _axSetInFlightRequestCleanupTimer:0];
}

- (void)_axSetRequestIsInFlight:(BOOL)a3 forLocation:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    double v7 = [(MKMapViewAccessibility__Weather__MapKit *)self _axInFlightRequests];
    id v8 = [(MKMapViewAccessibility__Weather__MapKit *)self _axCacheKeyForLocation:v6];

    [v7 addObject:v8];
    double v9 = [(MKMapViewAccessibility__Weather__MapKit *)self _axInFlightRequestCleanupTimer];

    if (v9) {
      return;
    }
    id v12 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__axClearInFlightRequests selector:0 userInfo:0 repeats:60.0];
    -[MKMapViewAccessibility__Weather__MapKit _axSetInFlightRequestCleanupTimer:](self, "_axSetInFlightRequestCleanupTimer:");
  }
  else
  {
    BOOL v10 = [(MKMapViewAccessibility__Weather__MapKit *)self _axInFlightRequestCleanupTimer];
    [v10 invalidate];

    [(MKMapViewAccessibility__Weather__MapKit *)self _axSetInFlightRequestCleanupTimer:0];
    id v12 = [(MKMapViewAccessibility__Weather__MapKit *)self _axInFlightRequests];
    double v11 = [(MKMapViewAccessibility__Weather__MapKit *)self _axCacheKeyForLocation:v6];

    [v12 removeObject:v11];
  }
}

+ (Class)_axVKFeatureAccessibilityElementClass
{
  if (_axVKFeatureAccessibilityElementClass__VKFeatureAccessibilityElementClassOnceToken != -1) {
    dispatch_once(&_axVKFeatureAccessibilityElementClass__VKFeatureAccessibilityElementClassOnceToken, &__block_literal_global_351);
  }
  v2 = (void *)_axVKFeatureAccessibilityElementClass__VKFeatureAccessibilityElementClass;

  return (Class)v2;
}

+ (Class)_axMKAttributionLabelClass
{
  if (_axMKAttributionLabelClass__MKAttributionLabelClassOnceToken != -1) {
    dispatch_once(&_axMKAttributionLabelClass__MKAttributionLabelClassOnceToken, &__block_literal_global_356);
  }
  v2 = (void *)_axMKAttributionLabelClass__MKAttributionLabelClass;

  return (Class)v2;
}

- (id)_axVKFeaturePOIElements
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(MKMapViewAccessibility__Weather__MapKit *)self _axMapLayer];
  [(id)objc_opt_class() _axVKFeatureAccessibilityElementClass];
  objc_super v3 = [v2 accessibilityElements];
  BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v10, "safeBoolForKey:", @"isPOI", (void)v13))
        {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  double v11 = (void *)[v4 copy];

  return v11;
}

- (id)_axAttributionElement
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(MKMapViewAccessibility__Weather__MapKit *)self accessibilityElements];
  objc_super v3 = [v2 reverseObjectEnumerator];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [(id)objc_opt_class() _axMKAttributionLabelClass];
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

@end