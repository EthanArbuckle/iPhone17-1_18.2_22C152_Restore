@interface VKFeatureAccessibilityElement
- (BOOL)_allowCustomActionHintSpeakOverride;
- (BOOL)isPOI;
- (BOOL)isRoad;
- (BOOL)isRouteEta;
- (BOOL)isTransitLine;
- (BOOL)isTransitStop;
- (BOOL)pointInside:(CGPoint)a3;
- (CGRect)accessibilityFrame;
- (NSMutableArray)hitTestPaths;
- (NSMutableArray)paths;
- (NSMutableDictionary)pointToFeatureDict;
- (NSMutableSet)featureSet;
- (NSString)shieldText;
- (VKFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3;
- (VKFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3 feature:(id)a4 ignoreMissingName:(BOOL)a5 useLocalizedLabels:(BOOL)a6;
- (float)strokeWidth;
- (id)_accessibilityMapDetailedInfoAtPoint:(CGPoint)a3;
- (id)_accessibilityShortAddress:(id)a3;
- (id)_accessibilityShortAddress:(id)a3 alwaysIncludeLocality:(BOOL)a4;
- (id)_distanceAwayString;
- (id)_distanceStringForPoint:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityPaths;
- (id)description;
- (id)detailedFeatureElementInfoAtPoint:(CGPoint)a3;
- (id)pointsFromFeatureWrapper:(id)a3;
- (int)sortKey;
- (int)style;
- (int64_t)_accessibilityMapFeatureType;
- (unint64_t)shieldType;
- (void)_mergePaths;
- (void)_updateElementStatus;
- (void)addFeature:(id)a3;
- (void)addFeatureWrapper:(id)a3;
- (void)addFeaturesFromElement:(id)a3;
- (void)dealloc;
- (void)removeFeatures;
- (void)setHitTestPaths:(id)a3;
- (void)setIsPOI:(BOOL)a3;
- (void)setIsRouteEta:(BOOL)a3;
- (void)setIsTransitLine:(BOOL)a3;
- (void)setIsTransitStop:(BOOL)a3;
- (void)setPaths:(id)a3;
- (void)setPointToFeatureDict:(id)a3;
- (void)setShieldText:(id)a3;
- (void)setShieldType:(unint64_t)a3;
- (void)setSortKey:(int)a3;
- (void)setStrokeWidth:(float)a3;
- (void)setStyle:(int)a3;
- (void)startLocationInformationRequest:(CGPoint)a3;
@end

@implementation VKFeatureAccessibilityElement

- (VKFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3 feature:(id)a4 ignoreMissingName:(BOOL)a5 useLocalizedLabels:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (v11
    && ([v11 feature], (v13 = objc_claimAutoreleasedReturnValue()) != 0)
    && (([v12 feature],
         v14 = objc_claimAutoreleasedReturnValue(),
         uint64_t v15 = [v14 name],
         v14,
         v13,
         v15)
     || v7))
  {
    v18 = [v12 feature];
    if (v6)
    {
      GEOFeatureGetLocalizedLabel();
      GEOFeatureGetLocalizedShield();
    }
    else
    {
      GEOFeatureGetNativeLabel();
      GEOFeatureGetNativeShield();
    }
    if (v7)
    {
      v19 = -[VKFeatureAccessibilityElement initWithAccessibilityContainer:](self, "initWithAccessibilityContainer:", v10, 0);
      if (v19)
      {
        [(VKFeatureAccessibilityElement *)v19 setAccessibilityLabel:0];
        [(VKFeatureAccessibilityElement *)v19 setAccessibilityLanguage:0];
        [(VKFeatureAccessibilityElement *)v19 addFeature:v12];
        objc_storeStrong((id *)&v19->_shieldText, 0);
        v19->_shieldType = 0;
        v19->_style = [v18 styleID];
      }
      self = v19;
      v16 = self;
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_allowCustomActionHintSpeakOverride
{
  return 0;
}

- (void)_updateElementStatus
{
  id v3 = [(VKFeatureAccessibilityElement *)self accessibilityContainer];
  [(VKFeatureAccessibilityElement *)self accessibilityActivationPoint];
  -[VKFeatureAccessibilityElement setIsAccessibilityElement:](self, "setIsAccessibilityElement:", objc_msgSend(v3, "accessibilityViewBoundsContainsPathPoint:"));
}

- (id)accessibilityLabel
{
  if ([(VKFeatureAccessibilityElement *)self mapFeatureType] == 25)
  {
    id v3 = AXVectorKitLocString(@"POI_BUILDING");
    v8.receiver = self;
    v8.super_class = (Class)VKFeatureAccessibilityElement;
    BOOL v6 = [(VKFeatureAccessibilityElement *)&v8 accessibilityLabel];
    v4 = __UIAXStringForVariables();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VKFeatureAccessibilityElement;
    v4 = [(VKFeatureAccessibilityElement *)&v7 accessibilityLabel];
  }

  return v4;
}

- (void)removeFeatures
{
  [(NSMutableSet *)self->_featureSet removeAllObjects];
  [(NSMutableArray *)self->_paths removeAllObjects];

  [(VKFeatureAccessibilityElement *)self setHitTestPaths:0];
}

- (void)addFeature:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = [[AXVKMultiSectionFeatureWrapper alloc] initWithFeature:v4];
    [(VKFeatureAccessibilityElement *)self addFeatureWrapper:v5];

    id v4 = v6;
  }
}

- (void)addFeatureWrapper:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableSet *)self->_featureSet addObject:v4];
    [(NSMutableArray *)self->_paths removeAllObjects];
    [(VKFeatureAccessibilityElement *)self setHitTestPaths:0];
  }
}

- (void)addFeaturesFromElement:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (VKFeatureAccessibilityElement *)a3;
  [(VKFeatureAccessibilityElement *)self strokeWidth];
  float v6 = v5;
  [(VKFeatureAccessibilityElement *)v4 strokeWidth];
  if (v6 <= v7) {
    objc_super v8 = v4;
  }
  else {
    objc_super v8 = self;
  }
  [(VKFeatureAccessibilityElement *)v8 strokeWidth];
  -[VKFeatureAccessibilityElement setStrokeWidth:](self, "setStrokeWidth:");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v9 = [(VKFeatureAccessibilityElement *)v4 featureSet];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        [(VKFeatureAccessibilityElement *)self addFeatureWrapper:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)pointInside:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(VKFeatureAccessibilityElement *)self accessibilityFrame];
  v18.CGFloat x = x;
  v18.CGFloat y = y;
  if (CGRectContainsPoint(v19, v18))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    float v6 = [(VKFeatureAccessibilityElement *)self accessibilityPaths];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          v17.CGFloat x = x;
          v17.CGFloat y = y;
          if (CGPathContainsPoint(*(CGPathRef *)(*((void *)&v11 + 1) + 8 * i), 0, v17, 0))
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)pointsFromFeatureWrapper:(id)a3
{
  id v4 = [a3 feature];
  float v5 = [v4 feature];
  float v6 = [v5 containingTile];
  [v6 geoTileKey];

  VKWorldBoundsFromGEOTileKey();
  uint64_t v7 = [v4 sectionCount];
  uint64_t v8 = [(VKFeatureAccessibilityElement *)self accessibilityContainer];
  v9 = [MEMORY[0x263EFF980] array];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
      GEOMultiSectionFeatureGetGEOVectorTilePoints();
  }

  return v9;
}

- (void)dealloc
{
  id v3 = [(VKFeatureAccessibilityElement *)self _accessibilityValueForKey:@"CLGeocoder"];
  id v4 = v3;
  if (v3) {
    [v3 cancelGeocode];
  }

  v5.receiver = self;
  v5.super_class = (Class)VKFeatureAccessibilityElement;
  [(VKFeatureAccessibilityElement *)&v5 dealloc];
}

- (VKFeatureAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VKFeatureAccessibilityElement;
  objc_super v5 = [(VKFeatureAccessibilityElement *)&v14 initWithAccessibilityContainer:v4];
  if (v5)
  {
    float v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    paths = v5->_paths;
    v5->_paths = v6;

    uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    featureSet = v5->_featureSet;
    v5->_featureSet = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pointToFeatureDict = v5->_pointToFeatureDict;
    v5->_pointToFeatureDict = v10;

    long long v12 = v5;
  }

  return v5;
}

- (int64_t)_accessibilityMapFeatureType
{
  return 0;
}

- (BOOL)isRoad
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(VKFeatureAccessibilityElement *)self accessibilityLabel];
  float v6 = [(VKFeatureAccessibilityElement *)self accessibilityPaths];
  uint64_t v7 = [v6 count];
  uint64_t v8 = [(VKFeatureAccessibilityElement *)self accessibilityLanguage];
  v9 = [v3 stringWithFormat:@"%@:%p: %@ - Paths: %ld [%@]", v4, self, v5, v7, v8];

  return v9;
}

- (void)_mergePaths
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  CGMutablePathRef Mutable = CGPathCreateMutable();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_paths;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        AX_CGPathEnumerateElementsUsingBlock();
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [MEMORY[0x263F1C478] bezierPathWithCGPath:Mutable];
  [(VKFeatureAccessibilityElement *)self setAccessibilityPath:v8];

  if (Mutable) {
    CFRelease(Mutable);
  }
}

void __44__VKFeatureAccessibilityElement__mergePaths__block_invoke(uint64_t a1, int a2, CGFloat *a3)
{
  switch(a2)
  {
    case 0:
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 32), 0, *a3, a3[1]);
      break;
    case 1:
      CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 32), 0, *a3, a3[1]);
      break;
    case 2:
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 32), 0, *a3, a3[1], a3[2], a3[3]);
      break;
    case 3:
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 32), 0, *a3, a3[1], a3[2], a3[3], a3[4], a3[5]);
      break;
    case 4:
      CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 32));
      break;
    default:
      return;
  }
}

- (CGRect)accessibilityFrame
{
  uint64_t v3 = [(NSMutableSet *)self->_featureSet count];
  if (v3 != [(NSMutableArray *)self->_paths count]) {
    [(VKFeatureAccessibilityElement *)self _updatePath];
  }
  v8.receiver = self;
  v8.super_class = (Class)VKFeatureAccessibilityElement;
  [(VKFeatureAccessibilityElement *)&v8 accessibilityFrame];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (id)accessibilityPaths
{
  uint64_t v3 = [(NSMutableSet *)self->_featureSet count];
  if (v3 != [(NSMutableArray *)self->_paths count]) {
    [(VKFeatureAccessibilityElement *)self _updatePath];
  }
  paths = self->_paths;

  return paths;
}

- (id)_accessibilityShortAddress:(id)a3
{
  uint64_t v3 = [(VKFeatureAccessibilityElement *)self _accessibilityShortAddress:a3 alwaysIncludeLocality:1];

  return v3;
}

- (id)_accessibilityShortAddress:(id)a3 alwaysIncludeLocality:(BOOL)a4
{
  double v4 = AXShortAddressDescriptionForPlacemark(a3, a4);

  return v4;
}

- (void)startLocationInformationRequest:(CGPoint)a3
{
  double v4 = [(VKFeatureAccessibilityElement *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  UIAccessibilityPointToPoint();
  double v6 = v5;
  double v8 = v7;

  long long v9 = [(VKFeatureAccessibilityElement *)self accessibilityContainer];
  long long v10 = [(VKFeatureAccessibilityElement *)self accessibilityContainer];
  objc_msgSend(v9, "convertPoint:toCoordinateFromLayer:", v10, v6, v8);
  double v12 = v11;
  double v14 = v13;

  long long v15 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:v12 longitude:v14];
  id v16 = objc_alloc_init(MEMORY[0x263F00A40]);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__VKFeatureAccessibilityElement_startLocationInformationRequest___block_invoke;
  v18[3] = &unk_2651629E8;
  v18[4] = self;
  *(double *)&v18[5] = v6;
  *(double *)&v18[6] = v8;
  CGPoint v17 = (void *)MEMORY[0x245668F10](v18);
  [v16 reverseGeocodeLocation:v15 completionHandler:v17];
  [(VKFeatureAccessibilityElement *)self _accessibilitySetRetainedValue:v16 forKey:@"CLGeocoder"];
}

void __65__VKFeatureAccessibilityElement_startLocationInformationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v18[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  double v6 = [v5 firstObject];
  double v7 = *(void **)(a1 + 32);
  if (a3 || !v6)
  {
    [v7 _accessibilityRemoveValueForKey:@"CLGeocoder"];
  }
  else
  {
    double v8 = [v7 _accessibilityShortAddress:v6];
    long long v15 = [*(id *)(a1 + 32) _distanceAwayString];
    long long v9 = __UIAXStringForVariables();

    long long v10 = *(void **)(a1 + 32);
    v17[0] = @"Point";
    double v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48), v15, @"__AXStringForVariablesSentinel");
    v17[1] = @"String";
    v18[0] = v11;
    v18[1] = v9;
    double v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    [v10 _accessibilitySetRetainedValue:v12 forKey:@"PointInfo"];

    [*(id *)(a1 + 32) _accessibilityRemoveValueForKey:@"CLGeocoder"];
    id v16 = objc_msgSend(*(id *)(a1 + 32), "detailedFeatureElementInfoAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    double v13 = __UIAXStringForVariables();

    double v14 = +[VKMapViewOutputManager sharedOutputManager];
    [v14 queueOutput:v13];
  }
}

- (id)detailedFeatureElementInfoAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)_distanceAwayString
{
  if ([(NSMutableSet *)self->_featureSet count]
    && ([MEMORY[0x263F10930] sharedLocationManager],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 hasLocation],
        v3,
        (v4 & 1) != 0))
  {
    id v5 = [(NSMutableSet *)self->_featureSet anyObject];
    double v6 = [v5 feature];
    double v7 = (float *)GEOMultiSectionFeatureBounds();
    double v8 = [v6 feature];
    long long v9 = [v8 containingTile];
    [v9 geoTileKey];

    VKWorldBoundsFromGEOTileKey();
    double v14 = [(VKFeatureAccessibilityElement *)self _distanceStringForPoint:AXVKPointForTileGLPoint(v10, v11, v12, v13, (float)(*v7 + v7[2]) * 0.5)];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (id)_distanceStringForPoint:(id)a3
{
  VKLocationCoordinate2DForVKPoint();
  uint64_t v3 = [MEMORY[0x263F10930] sharedLocationManager];
  char v4 = [v3 currentLocation];

  id v5 = [v4 latLng];
  [v5 lat];
  double v6 = [v4 latLng];
  [v6 lng];
  GEOCalculateDistance();
  double v8 = v7;

  long long v9 = [MEMORY[0x263EFF960] currentLocale];
  int v10 = objc_msgSend(v9, "_navigation_distanceUsesMetricSystem");

  if (v10)
  {
    double v11 = AXVectorKitLocString(@"POI_DISTANCE_KM");
    double v12 = 1000.0;
  }
  else
  {
    double v11 = AXVectorKitLocString(@"POI_DISTANCE_M");
    double v12 = 1609.344;
  }
  double v13 = [v4 latLng];
  [v13 lat];
  double v14 = [v4 latLng];
  [v14 lng];

  GEOBearingFromCoordinateToCoordinate();
  long long v15 = objc_msgSend(NSString, "localizedStringWithFormat:", v11, v8 / v12);
  CGPoint v18 = AXDescriptionForHeadingInDegrees();
  id v16 = __UIAXStringForVariables();

  return v16;
}

- (id)_accessibilityMapDetailedInfoAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(VKFeatureAccessibilityElement *)self _accessibilityValueForKey:@"PointInfo"];
  double v7 = v6;
  if (v6
    && (([v6 objectForKey:@"Point"],
         double v8 = objc_claimAutoreleasedReturnValue(),
         [v8 CGPointValue],
         double v10 = v9,
         double v12 = v11,
         v8,
         v10 == x)
      ? (BOOL v13 = v12 == y)
      : (BOOL v13 = 0),
        v13))
  {
    long long v15 = [v7 objectForKey:@"String"];
    CGPoint v17 = -[VKFeatureAccessibilityElement detailedFeatureElementInfoAtPoint:](self, "detailedFeatureElementInfoAtPoint:", x, y);
    double v14 = __UIAXStringForVariables();
  }
  else
  {
    -[VKFeatureAccessibilityElement startLocationInformationRequest:](self, "startLocationInformationRequest:", x, y);
    double v14 = 0;
  }

  return v14;
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (unint64_t)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(unint64_t)a3
{
  self->_shieldType = a3;
}

- (NSMutableSet)featureSet
{
  return self->_featureSet;
}

- (NSMutableDictionary)pointToFeatureDict
{
  return self->_pointToFeatureDict;
}

- (void)setPointToFeatureDict:(id)a3
{
}

- (NSMutableArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
}

- (NSMutableArray)hitTestPaths
{
  return self->_hitTestPaths;
}

- (void)setHitTestPaths:(id)a3
{
}

- (BOOL)isPOI
{
  return self->_isPOI;
}

- (void)setIsPOI:(BOOL)a3
{
  self->_isPOI = a3;
}

- (BOOL)isTransitStop
{
  return self->_isTransitStop;
}

- (void)setIsTransitStop:(BOOL)a3
{
  self->_isTransitStop = a3;
}

- (BOOL)isTransitLine
{
  return self->_isTransitLine;
}

- (void)setIsTransitLine:(BOOL)a3
{
  self->_isTransitLine = a3;
}

- (BOOL)isRouteEta
{
  return self->_isRouteEta;
}

- (void)setIsRouteEta:(BOOL)a3
{
  self->_isRouteEta = a3;
}

- (float)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(float)a3
{
  self->_strokeWidth = a3;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (void)setShieldText:(id)a3
{
}

- (int)sortKey
{
  return self->_sortKey;
}

- (void)setSortKey:(int)a3
{
  self->_sortKedouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_hitTestPaths, 0);
  objc_storeStrong((id *)&self->_pointToFeatureDict, 0);
  objc_storeStrong((id *)&self->_paths, 0);

  objc_storeStrong((id *)&self->_featureSet, 0);
}

@end