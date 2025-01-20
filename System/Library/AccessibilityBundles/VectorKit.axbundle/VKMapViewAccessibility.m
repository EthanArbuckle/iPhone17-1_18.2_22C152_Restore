@interface VKMapViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- ($01BB1521EC52D44A8E7628F5261DCEC8)_axBoundsOfElements;
- ($01BB1521EC52D44A8E7628F5261DCEC8)accessibilityBounds;
- ($F24F406B2B787EFB06265DBA3D28CBD5)accessibilityCenter;
- ($F24F406B2B787EFB06265DBA3D28CBD5)accessibilityConvertScreenPointToCoordinate:(CGPoint)a3;
- (BOOL)_accessibilityMapsExplorationIsActive;
- (BOOL)_accessibilityMapsExplorationIsPending;
- (BOOL)_allowCustomActionHintSpeakOverride;
- (BOOL)_axElementsInvalidForVisibleBounds;
- (BOOL)_axShouldSummarizeVisibleBounds;
- (BOOL)_axTrackingEnabled;
- (BOOL)_axTrackingWithHeadingEnabled;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityIsInTourGuideMode;
- (BOOL)accessibilityIsShowingCalloutAnnotationView;
- (BOOL)accessibilityIsShowingRoutes;
- (BOOL)accessibilityMapLoadingComplete;
- (BOOL)accessibilityMapTypeShouldShowTransit;
- (BOOL)accessibilityMapTypeSupportsAccessibility;
- (BOOL)accessibilityOnlyShowRouteNodesDuringTransit;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)accessibilityViewBoundsContainsPathPoint:(CGPoint)a3;
- (BOOL)accessibilityZoom:(double)a3 point:(CGPoint)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (BOOL)accessibilityZoom:(double)a3 point:(CGPoint)a4 completionHandler:(id)a5;
- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3;
- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)_accessibilityMapViewPointForZoomPoint:(CGPoint)a3;
- (CGPoint)_axIntersectionBetweenRoad:(id)a3 andOtherRoad:(id)a4;
- (CGPoint)accessibilityConvertCoordinateToWindow:(id)a3;
- (CGRect)accessibilityPositionFrameForElement:(id)a3;
- (CGRect)accessibilityVisibleAXViewBounds;
- (double)accessibilityYaw;
- (float)accessibilityDistance:(CGPoint)a3 forAngle:(float)a4 toRoad:(id)a5 withElement:(id)a6;
- (float)accessibilityDistanceToEndOfRoad:(CGPoint)a3 forAngle:(float)a4 withElement:(id)a5;
- (float)accessibilityRealDistanceBetweenPoint:(CGPoint)a3 screenPoint2:(CGPoint)a4;
- (float)accessibilityZoomLevel;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityMapsExplorationCurrentIntersectionDescription;
- (id)_accessibilityMapsExplorationCurrentRoadsWithAngles;
- (id)_accessibilityMapsExplorationDecreaseVerbosity;
- (id)_accessibilityMapsExplorationIncreaseVerbosity;
- (id)_accessibilityScrollStatus;
- (id)_axCurrentLocationText;
- (id)_axElements;
- (id)_axLastSummaryForVisibleBounds;
- (id)_axMapLabelLayoutTimer;
- (id)_axMapViewDelegate;
- (id)_axMapsDelegate;
- (id)_axTourGuideElement;
- (id)_axTourGuideManager;
- (id)_axUserLocationMarker;
- (id)_axWalkAssistManager;
- (id)_axWindow;
- (id)_retrieveAXElementManager;
- (id)accessibilityCalloutAnnotationView;
- (id)accessibilityElementManager;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityIntersectorsForRoad:(id)a3 withPoint:(CGPoint)a4;
- (id)accessibilityLabel;
- (id)accessibilityTourStatus;
- (id)accessibilityUpcomingRoadsForPoint:(CGPoint)a3 forAngle:(float)a4 withElement:(id)a5;
- (id)initShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7 allowsAntialiasing:(BOOL)a8;
- (int)_accessibilityMapType;
- (int64_t)_axOrientationOfElements;
- (int64_t)_axTrackingMode;
- (int64_t)accessibilityContainerType;
- (int64_t)accessibilityOrientation;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityMapViewDidChangeRegionAnimated:(BOOL)a3;
- (void)_accessibilityMapViewDidChangeVisibleRegion;
- (void)_accessibilityMapsExplorationContinueWithVertexIndex:(unint64_t)a3;
- (void)_accessibilityMapsExplorationEnd;
- (void)_accessibilityMapsExplorationRecordTouchpoint:(CGPoint)a3;
- (void)_axHandleLabelsDidLayout;
- (void)_axInitializeTimers;
- (void)_axLoadAccessibility;
- (void)_axMapVisibleRegionDidChange;
- (void)_axMapsAccessibilityPotentiallyEnabled;
- (void)_axSetCurrentLocationText:(id)a3;
- (void)_axSetLastSummaryForVisibleBounds:(id)a3;
- (void)_axSetMapLabelLayoutTimer:(id)a3;
- (void)_axSetTrackingMode:(int64_t)a3;
- (void)_axStartListeningForMapAccessibilityEnabled;
- (void)_axStartListeningForMapVisibleRegionChanged;
- (void)_axStartListeningForUpdateAccessibilityElementsComplete;
- (void)_axStartListeningForUserTrackingModeChange;
- (void)_axSummaryForVisibleBounds;
- (void)_axUpdateElements;
- (void)_axUpdateElementsComplete:(id)a3;
- (void)_axUserTrackingModeChange:(id)a3;
- (void)accessibilityClearVisibleAXBoundsFrame;
- (void)accessibilityDecreaseTrackingDetail;
- (void)accessibilityIncreaseTrackingDetail;
- (void)accessibilitySetMapZoomLevel:(double)a3 center:(id)a4 yaw:(double)a5 completionHandler:(id)a6;
- (void)didUpdateSceneStatus:(unsigned __int8)a3;
- (void)labelManagerDidLayout;
- (void)setCurrentLocationText:(id)a3;
- (void)setMapType:(int)a3;
@end

@implementation VKMapViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VKMapView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCurrentLocationText
{
}

- (void)_axSetCurrentLocationText:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"initShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:", "@", "B", "B", "d", "@", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"setMapType:", "v", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"zoomToLevel: withFocusPoint:", "v", "d", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"zoom: withFocusPoint: completionHandler:", "v", "d", "{CGPoint=dd}", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"setCurrentLocationText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"mapDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"cameraDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"didUpdateSceneStatus:", "v", "C", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapView", @"labelManagerDidLayout", "v", 0);
  [v3 validateClass:@"VKMapCameraController"];
  [v3 validateClass:@"VKMapView" hasInstanceVariable:@"_navigationCameraController" withType:"VKNavCameraController"];
  [v3 validateClass:@"VKMapView" hasInstanceVariable:@"_mapCameraController" withType:"VKMapCameraController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKMapCameraController", @"tapZoom: levels: completionHandler:", "v", "{CGPoint=dd}", "d", "@?", 0);
  [v3 validateClass:@"VKScreenCameraController"];
  [v3 validateClass:@"VKMapCameraController" isKindOfClass:@"VKScreenCameraController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKScreenCameraController", @"startPanningAtPoint: panAtStartPoint:", "v", "{CGPoint=dd}", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VKScreenCameraController", @"updatePanWithTranslation:", "v", "{CGPoint=dd}", 0);
  [v3 validateClass:@"VKScreenCameraController" hasInstanceVariable:@"_gestureCameraControllerBehavior" withType:"VKGestureCameraBehavior"];
  objc_opt_class();
  [v3 validateClass:@"VKGestureCameraBehavior" hasInstanceVariable:@"_panLastScreenPoint" withType:__ax_verbose_encode_with_type_encoding_group_class()];
  [v3 validateClass:@"VKMapView" hasInstanceVariable:@"_canvas" withType:"VKMapCanvas"];
  [v3 validateClass:@"VKScreenCanvas"];
  [v3 validateClass:@"VKMapCanvas" isKindOfClass:@"VKScreenCanvas"];
  [v3 validateClass:@"VKCamera"];
  objc_opt_class();
  [v3 validateClass:@"VKScreenCanvas" hasInstanceVariable:@"_vkCamera" withType:__ax_verbose_encode_with_type_encoding_group_class()];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"userTrackingMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"setUserTrackingMode:", "v", "q", 0);
  [v3 validateClass:@"MKUserLocation"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"_zoomLevel", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"_maximumZoomLevel", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMapView", @"_minimumZoomLevel", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKAnnotationContainerView", @"userLocationView", "@", 0);
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0x100000;
}

- (void)_axInitializeTimers
{
  id v3 = [(VKMapViewAccessibility *)self _axMapLabelLayoutTimer];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F22868]);
    id v5 = (id)[v4 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    [(VKMapViewAccessibility *)self _axSetMapLabelLayoutTimer:v5];
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)VKMapViewAccessibility;
  [(VKMapViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(VKMapViewAccessibility *)self _accessibilityMapViewDidChangeVisibleRegion];
  [(VKMapViewAccessibility *)self _axInitializeTimers];
}

- (id)accessibilityElements
{
  v41[1] = *MEMORY[0x263EF8340];
  [(VKMapViewAccessibility *)self _axLoadAccessibility];
  if ([(VKMapViewAccessibility *)self accessibilityIsShowingRoutes]) {
    BOOL v3 = [(VKMapViewAccessibility *)self accessibilityOnlyShowRouteNodesDuringTransit];
  }
  else {
    BOOL v3 = 0;
  }
  BOOL v4 = [(VKMapViewAccessibility *)self accessibilityIsInTourGuideMode];
  BOOL v5 = [(VKMapViewAccessibility *)self accessibilityIsShowingCalloutAnnotationView];
  int v6 = AXRequiresMapAccessibilityPurelyForAutomation();
  v7 = (void *)MEMORY[0x263F81490];
  uint64_t v8 = *MEMORY[0x263F81490];
  if (v6 || !v4 && !v5)
  {
    v11 = [(VKMapViewAccessibility *)self _accessibilityValueForKey:v8];
    if ([(VKMapViewAccessibility *)self _accessibilityMapsExplorationIsActive])
    {
      v12 = [MEMORY[0x263EFF980] array];
      v13 = [(VKMapViewAccessibility *)self accessibilityElementManager];
      v14 = [v13 currentExplorationElement];
      [v12 axSafelyAddObject:v14];

      v15 = [(VKMapViewAccessibility *)self accessibilityElementManager];
      v16 = [v15 neighborExplorationElements];
      [v12 axSafelyAddObjectsFromArray:v16];

      id v17 = v12;
      v18 = +[VKMapDebugView sharedInstance];
      v19 = [(VKMapViewAccessibility *)self accessibilityElementManager];
      v20 = [v19 currentExplorationVertex];
      [v18 setCurrentExplorationVertex:v20];

      v11 = v17;
    }
    else if (!v11)
    {
      if (v3)
      {
        id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v22 = [(VKMapViewAccessibility *)self _axElements];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v37 != v24) {
                objc_enumerationMutation(v22);
              }
              v26 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              if ([v26 isRouteEta]) {
                [v21 addObject:v26];
              }
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
          }
          while (v23);
        }

        v11 = (void *)[v21 copy];
      }
      else
      {
        v11 = [(VKMapViewAccessibility *)self _axElements];
      }
      [(VKMapViewAccessibility *)self _accessibilitySetRetainedValue:v11 forKey:*v7];
    }
    v10 = +[VKMapDebugView sharedInstance];
    [v10 removePointsAndPaths];
    uint64_t v27 = objc_opt_class();
    v28 = AXVKAccessibilityPaths(v11, v27, 25);
    [v10 addBuildingPaths:v28];

    uint64_t v29 = objc_opt_class();
    v30 = AXVKAccessibilityPaths(v11, v29, 0);
    [v10 addPOIPaths:v30];

    uint64_t v31 = objc_opt_class();
    v32 = AXVKAccessibilityPaths(v11, v31, 1);
    [v10 addRoadPaths:v32];

    uint64_t v33 = objc_opt_class();
    v34 = AXVKAccessibilityPoints(v11, v33, 1);
    [v10 addRoadPoints:v34];
  }
  else
  {
    [(VKMapViewAccessibility *)self _accessibilityRemoveValueForKey:v8];
    if (v5 || v3)
    {
      v9 = +[VKMapDebugView sharedInstance];
      [v9 removePointsAndPaths];
    }
    if (!v4)
    {
      v11 = 0;
      goto LABEL_29;
    }
    v10 = [(VKMapViewAccessibility *)self _axTourGuideElement];
    v41[0] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
  }

LABEL_29:

  return v11;
}

- (CGPoint)accessibilityConvertCoordinateToWindow:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  int v6 = [(VKMapViewAccessibility *)self _axWindow];
  v7 = [v6 layer];
  -[VKMapViewAccessibility convertCoordinate:toPointToLayer:](self, "convertCoordinate:toPointToLayer:", v7, var0, var1);
  double v9 = v8;
  double v11 = v10;

  if (v6)
  {
    objc_msgSend(v6, "convertPoint:toWindow:", 0, v9, v11);
    double v9 = v12;
    double v11 = v13;
  }

  double v14 = v9;
  double v15 = v11;
  result.y = v15;
  result.x = v14;
  return result;
}

- (BOOL)accessibilityActivate
{
  if ([(VKMapViewAccessibility *)self accessibilityIsShowingCalloutAnnotationView])
  {
    return [(VKMapViewAccessibility *)self accessibilityPerformEscape];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)VKMapViewAccessibility;
    return [(VKMapViewAccessibility *)&v4 accessibilityActivate];
  }
}

- (id)accessibilityHint
{
  BOOL v3 = [(VKMapViewAccessibility *)self isAccessibilityElement];
  BOOL v4 = [(VKMapViewAccessibility *)self accessibilityIsShowingCalloutAnnotationView];
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  v10.receiver = self;
  v10.super_class = (Class)VKMapViewAccessibility;
  int v6 = [(VKMapViewAccessibility *)&v10 accessibilityHint];
  if ([(VKMapViewAccessibility *)self accessibilityMapLoadingComplete]
    || !IsVoiceOverRunning)
  {
    if (!v3 || !IsVoiceOverRunning) {
      goto LABEL_9;
    }
    if (v4) {
      UIKitAccessibilityLocalizedString();
    }
    else {
    uint64_t v7 = AXVectorKitLocString(@"MAP_NO_ELEMENTS_HINT");
    }
  }
  else
  {
    uint64_t v7 = AXVectorKitLocString(@"MAP_LOADING_HINT");
  }
  double v8 = (void *)v7;

  int v6 = v8;
LABEL_9:

  return v6;
}

- (id)accessibilityLabel
{
  BOOL v3 = [(VKMapViewAccessibility *)self isAccessibilityElement];
  BOOL v4 = [(VKMapViewAccessibility *)self accessibilityIsShowingCalloutAnnotationView];
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  v10.receiver = self;
  v10.super_class = (Class)VKMapViewAccessibility;
  int v6 = [(VKMapViewAccessibility *)&v10 accessibilityLabel];
  if (v3 && v4 && IsVoiceOverRunning)
  {
    UIKitAccessibilityLocalizedString();
    int v6 = v7 = v6;
LABEL_8:

    goto LABEL_9;
  }
  if (AXDoesRequestingClientDeserveAutomation())
  {
    uint64_t v7 = [(VKMapViewAccessibility *)self _axCurrentLocationText];
    if ([v7 length])
    {
      id v8 = v7;

      int v6 = v8;
    }
    goto LABEL_8;
  }
  if (!v6)
  {
    int v6 = AXVectorKitLocString(@"MAP");
  }
LABEL_9:

  return v6;
}

- (id)accessibilityIdentifier
{
  BOOL v3 = [(VKMapViewAccessibility *)self accessibilityIsShowingCalloutAnnotationView];
  v6.receiver = self;
  v6.super_class = (Class)VKMapViewAccessibility;
  BOOL v4 = [(VKMapViewAccessibility *)&v6 accessibilityIdentifier];
  if (v3)
  {

    BOOL v4 = @"PopoverDismissRegion";
  }

  return v4;
}

- (BOOL)accessibilityPerformEscape
{
  if ([(VKMapViewAccessibility *)self accessibilityIsShowingCalloutAnnotationView])
  {
    BOOL v3 = [(VKMapViewAccessibility *)self _axMapViewDelegate];
    BOOL v4 = [v3 safeValueForKey:@"_annotationContainer"];
    char v5 = [v4 accessibilityPerformEscape];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VKMapViewAccessibility;
    return [(VKMapViewAccessibility *)&v7 accessibilityPerformEscape];
  }
  return v5;
}

- (CGRect)accessibilityPositionFrameForElement:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning()
    && ![(VKMapViewAccessibility *)self accessibilityMapTypeSupportsAccessibility])
  {
    double v16 = *MEMORY[0x263F001A8];
    double v17 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v22 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v23 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    VKLocationCoordinate2DForVKPoint();
    double v5 = v4;
    double v7 = v6;
    VKLocationCoordinate2DForVKPoint();
    double v9 = v8;
    double v11 = v10;
    -[VKMapViewAccessibility convertCoordinate:toPointToLayer:](self, "convertCoordinate:toPointToLayer:", self, v5, v7);
    double v13 = v12;
    double v15 = v14;
    -[VKMapViewAccessibility convertCoordinate:toPointToLayer:](self, "convertCoordinate:toPointToLayer:", self, v9, v11);
    double v18 = v16;
    double v19 = v17;
    BOOL v20 = v13 <= v16;
    if (v13 < v16) {
      double v16 = v13;
    }
    if (!v20) {
      double v18 = v13;
    }
    BOOL v21 = v15 <= v17;
    if (v15 < v17) {
      double v17 = v15;
    }
    if (!v21) {
      double v19 = v15;
    }
    double v22 = v18 - v16;
    double v23 = v19 - v17;
  }
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (float)accessibilityRealDistanceBetweenPoint:(CGPoint)a3 screenPoint2:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[VKMapViewAccessibility accessibilityConvertScreenPointToCoordinate:](self, "accessibilityConvertScreenPointToCoordinate:", a3.x, a3.y);
  double v8 = v7;
  double v10 = v9;
  -[VKMapViewAccessibility accessibilityConvertScreenPointToCoordinate:](self, "accessibilityConvertScreenPointToCoordinate:", x, y);
  long double v11 = v8 * 0.0174532925;
  long double v13 = v12 * 0.0174532925;
  double v15 = v14 * 0.0174532925;
  long double v16 = v13 - v8 * 0.0174532925;
  double v17 = v15 - v10 * 0.0174532925;
  long double v18 = sin(v16 * 0.5);
  long double v19 = v18 * v18;
  long double v20 = sin(v17 * 0.5);
  long double v21 = cos(v11) * (v20 * v20);
  long double v22 = cos(v13);
  long double v23 = atan2(sqrt(v19 + v21 * v22), sqrt(1.0 - (v19 + v21 * v22)));
  return (v23 + v23) * 6378137.0;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  double v5 = [(VKMapViewAccessibility *)self _axMapViewDelegate];
  double v6 = [v5 safeValueForKey:@"scrollEnabled"];

  if (v6 && ([v6 BOOLValue] & 1) == 0)
  {
    BOOL v13 = 0;
  }
  else
  {
    [(VKMapViewAccessibility *)self frame];
    if ([(VKMapViewAccessibility *)self mapType] == 5)
    {
      double v7 = [(VKMapViewAccessibility *)self safeValueForKey:@"_navigationCameraController"];
      double v8 = __UIAccessibilitySafeClass();

      AX_CGRectGetCenter();
    }
    else
    {
      double v9 = [(VKMapViewAccessibility *)self safeValueForKey:@"_mapCameraController"];
      double v8 = __UIAccessibilitySafeClass();

      double v10 = [v8 safeValueForKey:@"_gestureCameraControllerBehavior"];
      long double v11 = [v10 safeValueForKey:@"_panLastScreenPoint"];
      [v11 CGPointValue];
    }
    id v12 = v8;
    AXPerformSafeBlock();
    switch(a3)
    {
      case 1:
      case 2:
      case 3:
      case 4:
        id v15 = v12;
        AXPerformSafeBlock();
        [(VKMapViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"ScrollNotification"];
        AXPerformSafeBlock();

        BOOL v13 = 1;
        break;
      default:
        BOOL v13 = 0;
        break;
    }
  }
  return v13;
}

uint64_t __46__VKMapViewAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  AX_CGRectGetCenter();

  return objc_msgSend(v1, "startPanningAtPoint:panAtStartPoint:", 1);
}

uint64_t __46__VKMapViewAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePanWithTranslation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __46__VKMapViewAccessibility_accessibilityScroll___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) safeValueForKey:@"cameraDelegate"];
  [v1 mapLayerDidChangeVisibleRegion];
}

- (unint64_t)_accessibilityAutomationType
{
  return 57;
}

- (int64_t)accessibilityContainerType
{
  if ([(VKMapViewAccessibility *)self isAccessibilityElement]) {
    return 0;
  }
  else {
    return 4;
  }
}

- (unint64_t)accessibilityTraits
{
  v10.receiver = self;
  v10.super_class = (Class)VKMapViewAccessibility;
  unint64_t v3 = [(VKMapViewAccessibility *)&v10 accessibilityTraits];
  BOOL v4 = [(VKMapViewAccessibility *)self accessibilityIsShowingCalloutAnnotationView];
  uint64_t v5 = *MEMORY[0x263F813A8];
  if (v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | v3;
  BOOL v7 = [(VKMapViewAccessibility *)self accessibilityIsInTourGuideMode];
  uint64_t v8 = *MEMORY[0x263F21B40];
  if (!v7) {
    uint64_t v8 = 0;
  }
  return v6 | v8;
}

- (CGPoint)_axIntersectionBetweenRoad:(id)a3 andOtherRoad:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v20 = a4;
  uint64_t v29 = 0;
  v30 = (double *)&v29;
  uint64_t v31 = 0x4012000000;
  v32 = __Block_byref_object_copy__1;
  uint64_t v33 = __Block_byref_object_dispose__1;
  v34 = &unk_2426D40D2;
  int64x2_t v35 = vdupq_n_s64(0x47EFFFFFE0000000uLL);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [a3 paths];
  long double v19 = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v8 = 0;
      uint64_t v18 = v6;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        double v9 = objc_msgSend(v20, "originalPaths", v17);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v36 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v22;
          while (2)
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v9);
              }
              AX_CGPathEnumerateElementsUsingBlock();
              double v13 = v30[6];
              if (v13 < 3.40282347e38)
              {
                double v14 = v30[7];

                goto LABEL_18;
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v36 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        ++v8;
        uint64_t v5 = v19;
        uint64_t v7 = v17;
      }
      while (v8 != v18);
      uint64_t v6 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v6);
  }

  double v13 = v30[6];
  double v14 = v30[7];
LABEL_18:
  _Block_object_dispose(&v29, 8);

  double v15 = v13;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

BOOL __66__VKMapViewAccessibility__axIntersectionBetweenRoad_andOtherRoad___block_invoke(uint64_t a1, uint64_t a2, CGFloat *a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  CGFloat v8 = *a3;
  CGFloat v9 = a3[1];
  v12.double x = *a3;
  v12.double y = v9;
  BOOL result = CGPathContainsPoint(*(CGPathRef *)(a1 + 32), 0, v12, 0);
  if (result)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    *(CGFloat *)(v11 + 48) = v8;
    *(CGFloat *)(v11 + 56) = v9;
    *a6 = 1;
  }
  return result;
}

- (void)_accessibilityMapsExplorationContinueWithVertexIndex:(unint64_t)a3
{
  id v4 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  [v4 accessibilityMapsExplorationContinueWithVertexIndex:a3];
}

- (void)_accessibilityMapsExplorationRecordTouchpoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  objc_msgSend(v5, "setExplorationLastTouchPoint:", x, y);
}

- (id)_accessibilityMapsExplorationCurrentRoadsWithAngles
{
  v2 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  unint64_t v3 = [v2 accessibilityMapsExplorationCurrentRoadsWithAngles];

  return v3;
}

- (id)_accessibilityMapsExplorationCurrentIntersectionDescription
{
  v2 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  unint64_t v3 = [v2 accessibilityMapsExplorationCurrentIntersectionDescription];

  return v3;
}

- (id)_accessibilityMapsExplorationIncreaseVerbosity
{
  v2 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  unint64_t v3 = [v2 accessibilityMapsExplorationChangeVerbosityIncreasing:1];

  return v3;
}

- (id)_accessibilityMapsExplorationDecreaseVerbosity
{
  v2 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  unint64_t v3 = [v2 accessibilityMapsExplorationChangeVerbosityIncreasing:0];

  return v3;
}

- (BOOL)_accessibilityMapsExplorationIsActive
{
  v2 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  BOOL v3 = [v2 explorationState] == 2;

  return v3;
}

- (BOOL)_accessibilityMapsExplorationIsPending
{
  v2 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  BOOL v3 = [v2 explorationState] == 1;

  return v3;
}

- (void)_accessibilityMapsExplorationEnd
{
  id v2 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  [v2 accessibilityMapsExplorationEnd];
}

- (id)accessibilityIntersectorsForRoad:(id)a3 withPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v52 = self;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v53 = a3;
  id v63 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = [v53 featureSet];
  uint64_t v6 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v6)
  {
    uint64_t v55 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v66 != v55) {
          objc_enumerationMutation(obj);
        }
        v56 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * i), "feature", v52);
        uint64_t v7 = [v56 feature];
        v64 = [v7 containingTile];

        if (!v64) {
          _AXAssert();
        }
        uint64_t v58 = [v64 geoConnectivityPointOnRoad];
        v61 = [v64 junctionsWithoutFeature];
        CGFloat v8 = [v64 lines];
        id v9 = v56;
        uint64_t v10 = [v64 geoSortedConnectivityPointOnRoad];
        uint64_t v11 = [v9 roadPointIndex];
        uint64_t v60 = [v9 roadPointCount];
        if (v60)
        {
          uint64_t v12 = 0;
          uint64_t v59 = v10 + 8 * v11;
          do
          {
            double v13 = *(unsigned int **)(v59 + 8 * v12);
            v62 = [v61 objectAtIndexedSubscript:*v13];
            unsigned int v14 = [v62 pointsOnRoadIndex];
            unsigned int v15 = [v62 pointsOnRoadCount];
            if (v15)
            {
              double v16 = (unsigned int *)(v58 + 16 * v14);
              uint64_t v17 = v15;
              do
              {
                if (v16 != v13)
                {
                  uint64_t v18 = [v8 objectAtIndexedSubscript:v16[1]];
                  if ((GEOMultiSectionFeatureIsSameRoad() & 1) == 0)
                  {
                    uint64_t v20 = v13[2];
                    uint64_t v19 = v13[3];
                    GEOMultiSectionFeatureGetSectionData();
                    uint64_t v21 = v69[2 * v20 + 100];
                    [v64 geoTileKey];
                    VKWorldBoundsFromGEOTileKey();
                    AXVKPointForTileGLPoint(v22, v23, v24, v25, *(float *)&v69[v21 + v19]);
                    VKLocationCoordinate2DForVKPoint();
                    long long v28 = -[AXVKIntersector initWithFeature:coordinates:isDeadEnd:]([AXVKIntersector alloc], "initWithFeature:coordinates:isDeadEnd:", v18, 0, v26, v27);
                    [v63 addObject:v28];
                  }
                }
                v16 += 4;
                --v17;
              }
              while (v17);
            }

            ++v12;
          }
          while (v12 != v60);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v6);
  }

  uint64_t v29 = objc_msgSend(v53, "featureAndPointIndicesForPoint:", x, y);
  if (v29 != -1)
  {
    v30 = [v53 consolidatedAndOrderedFeatures];
    uint64_t v31 = [v30 objectAtIndex:v29];
    v32 = [v31 firstObject];
    uint64_t v33 = [v31 lastObject];
    [v32 CGPointValue];
    double v35 = v34;
    double v37 = v36;
    [v33 CGPointValue];
    double v39 = v38;
    double v41 = v40;
    v42 = [AXVKIntersector alloc];
    v43 = [v53 pointToFeatureDict];
    v44 = [v43 objectForKey:v32];
    -[VKMapViewAccessibility accessibilityConvertScreenPointToCoordinate:](v52, "accessibilityConvertScreenPointToCoordinate:", v35, v37);
    v45 = -[AXVKIntersector initWithFeatureWrapper:coordinates:isDeadEnd:](v42, "initWithFeatureWrapper:coordinates:isDeadEnd:", v44, 1);

    v46 = [AXVKIntersector alloc];
    v47 = [v53 pointToFeatureDict];
    v48 = [v47 objectForKey:v33];
    -[VKMapViewAccessibility accessibilityConvertScreenPointToCoordinate:](v52, "accessibilityConvertScreenPointToCoordinate:", v39, v41);
    v49 = -[AXVKIntersector initWithFeatureWrapper:coordinates:isDeadEnd:](v46, "initWithFeatureWrapper:coordinates:isDeadEnd:", v48, 1);

    [v63 addObject:v45];
    [v63 addObject:v49];
  }
  v50 = objc_msgSend(v63, "allObjects", v52);

  return v50;
}

- (void)accessibilitySetMapZoomLevel:(double)a3 center:(id)a4 yaw:(double)a5 completionHandler:(id)a6
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v11 = a6;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __84__VKMapViewAccessibility_accessibilitySetMapZoomLevel_center_yaw_completionHandler___block_invoke;
  v17[3] = &unk_265162C88;
  v17[4] = self;
  double v19 = a3;
  double v20 = var0;
  double v21 = var1;
  id v12 = v11;
  id v18 = v12;
  double v13 = (void *)MEMORY[0x245668F10](v17);
  [(VKMapViewAccessibility *)self altitude];
  double v15 = v14;
  [(VKMapViewAccessibility *)self pitch];
  -[VKMapViewAccessibility setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](self, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", *MEMORY[0x263F84660], v13, var0, var1, v15, a5, v16, 0.1);
}

uint64_t __84__VKMapViewAccessibility_accessibilitySetMapZoomLevel_center_yaw_completionHandler___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  [*(id *)(a1 + 32) accessibilityZoomLevel];
  double v4 = v2 - v3;
  objc_msgSend(*(id *)(a1 + 32), "accessibilityConvertCoordinateToWindow:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);

  return objc_msgSend(v7, "accessibilityZoom:point:animated:completionHandler:", 0, v8, v4, v5, v6);
}

- (id)accessibilityUpcomingRoadsForPoint:(CGPoint)a3 forAngle:(float)a4 withElement:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v56 = a5;
  id v9 = [v56 intersectingRoads];
  if (!v9)
  {
    v52 = [MEMORY[0x263EFF980] array];
    id obj = [MEMORY[0x263EFF980] array];
    objc_msgSend(v56, "setIntersectingRoads:");
    uint64_t v10 = [(VKMapViewAccessibility *)self accessibilityElements];
    id v11 = (void *)[v10 copy];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v64;
      double v15 = (double *)MEMORY[0x263F00148];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v64 != v14) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(id *)(*((void *)&v63 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & (v17 != v56)) != 0)
          {
            [(VKMapViewAccessibility *)self _axIntersectionBetweenRoad:v56 andOtherRoad:v17];
            double v20 = v19;
            double v21 = fabs(v19 + -3.40282347e38);
            if (v21 >= 0.001)
            {
              double v24 = v18;
            }
            else
            {
              [(VKMapViewAccessibility *)self _axIntersectionBetweenRoad:v17 andOtherRoad:v56];
              double v20 = v22;
              double v24 = v23;
              double v21 = fabs(v22 + -3.40282347e38);
            }
            if (v21 > 0.001 && (*v15 != v20 || v15[1] != v24))
            {
              v70[0] = v17;
              double v26 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v20, v24);
              v70[1] = v26;
              double v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:2];
              [obj addObject:v27];

              long long v28 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v20, v24);
              [v52 addObject:v28];
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v13);
    }

    id v9 = obj;
    uint64_t v29 = +[VKMapDebugView sharedInstance];
    [v29 addIntersectionPoints:v52];
  }
  if ([v9 count])
  {
    id v53 = [MEMORY[0x263EFF980] array];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v51 = v9;
    id obja = v9;
    uint64_t v30 = [obja countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v60;
      double v32 = a4;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v60 != v31) {
            objc_enumerationMutation(obja);
          }
          double v34 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          double v35 = [v34 objectAtIndex:1];
          [v35 CGPointValue];
          CGFloat v37 = v36;
          CGFloat v39 = v38;

          double v57 = 0.0;
          double v58 = 0.0;
          v74.CGFloat x = x;
          v74.CGFloat y = y;
          v75.CGFloat x = v37;
          v75.CGFloat y = v39;
          AXVKMathGetVectorAndDistanceForPoints(&v58, &v57, v74, v75);
          double v40 = v57;
          if (vabdd_f64(v58, v32) < 35.0 && v57 < 40.0)
          {
            v67[0] = @"distance";
            v42 = [NSNumber numberWithDouble:v57];
            v67[1] = @"item";
            v68[0] = v42;
            v43 = [v34 firstObject];
            v68[1] = v43;
            v44 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
            [v53 addObject:v44];
          }
        }
        uint64_t v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v69, 16, v40);
      }
      while (v30);
    }

    [v53 sortUsingComparator:&__block_literal_global_4];
    v45 = [v53 firstObject];
    v46 = [v45 objectForKey:@"item"];

    if ((unint64_t)[v53 count] < 2)
    {
      v48 = 0;
    }
    else
    {
      v47 = [v53 objectAtIndex:1];
      v48 = [v47 objectForKey:@"item"];
    }
    v49 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v46, v48);

    id v9 = v51;
  }
  else
  {
    v49 = 0;
  }

  return v49;
}

uint64_t __82__VKMapViewAccessibility_accessibilityUpcomingRoadsForPoint_forAngle_withElement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 objectForKeyedSubscript:@"distance"];
  double v6 = [v4 objectForKeyedSubscript:@"distance"];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

- (float)accessibilityDistance:(CGPoint)a3 forAngle:(float)a4 toRoad:(id)a5 withElement:(id)a6
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(VKMapViewAccessibility *)self _axIntersectionBetweenRoad:a6 andOtherRoad:a5];
  v14.CGFloat x = v8;
  v14.CGFloat y = v9;
  double v11 = 0.0;
  double v12 = 0.0;
  v13.CGFloat x = x;
  v13.CGFloat y = y;
  AXVKMathGetVectorAndDistanceForPoints(&v12, &v11, v13, v14);
  return v11;
}

- (float)accessibilityDistanceToEndOfRoad:(CGPoint)a3 forAngle:(float)a4 withElement:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v7 = [a5 originalPaths];
  uint64_t v8 = [v7 count];
  if (v8 < 1)
  {
    float v10 = 3.4028e38;
  }
  else
  {
    uint64_t v9 = 0;
    float v10 = 3.4028e38;
    do
    {
      [v7 objectAtIndex:v9];
      AX_CGPathGetStartingAndEndingPoints();
      double v15 = 0.0;
      double v16 = 0.0;
      v19.CGFloat x = x;
      v19.CGFloat y = y;
      AXVKMathGetVectorAndDistanceForPoints(&v16, &v15, v18, v19);
      double v11 = v15;
      v20.CGFloat x = x;
      v20.CGFloat y = y;
      AXVKMathGetVectorAndDistanceForPoints(&v16, &v15, v17, v20);
      if (v11 >= v10)
      {
        float v13 = v10;
      }
      else
      {
        float v12 = v11;
        float v13 = v12;
      }
      if (v15 >= v13) {
        float v10 = v13;
      }
      else {
        float v10 = v15;
      }
      ++v9;
    }
    while (v8 != v9);
  }

  return v10;
}

- (CGRect)accessibilityVisibleAXViewBounds
{
  double v2 = [(VKMapViewAccessibility *)self _accessibilityValueForKey:@"AXStoredVisibleViewBounds"];
  [v2 CGRectValue];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)accessibilityClearVisibleAXBoundsFrame
{
}

- (BOOL)accessibilityViewBoundsContainsPathPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v6 = [(VKMapViewAccessibility *)self _accessibilityValueForKey:@"AXStoredVisibleViewBounds"];
  double v7 = v6;
  if (v6)
  {
    [v6 CGRectValue];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    [(VKMapViewAccessibility *)self bounds];
    double v16 = [(VKMapViewAccessibility *)self _axWindow];
    CGPoint v17 = [v16 _accessibilityFindSubviewDescendant:&__block_literal_global_478];

    if (([v17 isHidden] & 1) == 0)
    {
      [v17 frame];
      CGRectGetMaxY(v27);
    }
    CGPoint v18 = [(VKMapViewAccessibility *)self accessibilityContainer];
    UIAccessibilityFrameForBounds();
    double v9 = v19;
    double v11 = v20;
    double v13 = v21;
    double v15 = v22;

    double v23 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v9, v11, v13, v15);
    [(VKMapViewAccessibility *)self _accessibilitySetRetainedValue:v23 forKey:@"AXStoredVisibleViewBounds"];
  }
  v28.origin.CGFloat x = v9;
  v28.origin.CGFloat y = v11;
  v28.size.width = v13;
  v28.size.height = v15;
  v26.CGFloat x = x;
  v26.CGFloat y = y;
  BOOL v24 = CGRectContainsPoint(v28, v26);

  return v24;
}

uint64_t __67__VKMapViewAccessibility_accessibilityViewBoundsContainsPathPoint___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CGPoint)_accessibilityMapViewPointForZoomPoint:(CGPoint)a3
{
  if (a3.x < 0.0 || (double y = a3.y, a3.y < 0.0))
  {
    [(VKMapViewAccessibility *)self bounds];
    AX_CGRectGetCenter();
  }
  else
  {
    double x = a3.x;
    double v6 = [(VKMapViewAccessibility *)self _accessibilityWindow];
    double v7 = [v6 layer];
    -[VKMapViewAccessibility convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v7, x, y);
    double v9 = v8;
    double v11 = v10;

    double v12 = v9;
    double v13 = v11;
  }
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  -[VKMapViewAccessibility _accessibilityMapViewPointForZoomPoint:](self, "_accessibilityMapViewPointForZoomPoint:", a3.x, a3.y);

  return -[VKMapViewAccessibility accessibilityZoom:point:completionHandler:](self, "accessibilityZoom:point:completionHandler:", 0, 1.0, v4, v5);
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  -[VKMapViewAccessibility _accessibilityMapViewPointForZoomPoint:](self, "_accessibilityMapViewPointForZoomPoint:", a3.x, a3.y);

  return -[VKMapViewAccessibility accessibilityZoom:point:completionHandler:](self, "accessibilityZoom:point:completionHandler:", 0, -1.0, v4, v5);
}

- (void)accessibilityIncreaseTrackingDetail
{
}

- (void)accessibilityDecreaseTrackingDetail
{
}

- (BOOL)_allowCustomActionHintSpeakOverride
{
  return 0;
}

- (BOOL)accessibilityMapLoadingComplete
{
  id v2 = [(VKMapViewAccessibility *)self _accessibilityValueForKey:@"MapLoadingComplete"];
  double v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)accessibilityIsInTourGuideMode
{
  id v2 = [(VKMapViewAccessibility *)self _axTourGuideManager];
  char v3 = [v2 isRunning];

  return v3;
}

- (id)accessibilityCalloutAnnotationView
{
  return 0;
}

- (BOOL)accessibilityIsShowingCalloutAnnotationView
{
  char v3 = [(VKMapViewAccessibility *)self accessibilityCalloutAnnotationView];
  [v3 accessibilityFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v22.origin.double x = v5;
  v22.origin.double y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  if (CGRectIsEmpty(v22)) {
    return 0;
  }
  [(VKMapViewAccessibility *)self accessibilityFrame];
  CGFloat v17 = v5;
  CGFloat v18 = v7;
  CGFloat v19 = v9;
  CGFloat v20 = v11;

  return CGRectContainsRect(*(CGRect *)&v13, *(CGRect *)&v17);
}

- (BOOL)accessibilityZoom:(double)a3 point:(CGPoint)a4 completionHandler:(id)a5
{
  return -[VKMapViewAccessibility accessibilityZoom:point:animated:completionHandler:](self, "accessibilityZoom:point:animated:completionHandler:", 0, a5, a3, a4.x, a4.y);
}

- (BOOL)accessibilityZoom:(double)a3 point:(CGPoint)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  double v8 = (void (**)(void))a6;
  CGFloat v9 = [(VKMapViewAccessibility *)self safeValueForKey:@"mapDelegate"];
  double v10 = v9;
  if (a3 == 0.0)
  {
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (![v9 conformsToProtocol:&unk_26F83E980]) {
    goto LABEL_11;
  }
  CGFloat v11 = [v10 safeValueForKey:@"maximumZoomLevel"];
  [v11 floatValue];
  float v13 = v12;

  double v14 = [v10 safeValueForKey:@"minimumZoomLevel"];
  [v14 floatValue];
  float v16 = v15;

  CGFloat v17 = [v10 safeValueForKey:@"_zoomLevel"];
  [v17 floatValue];
  float v19 = roundf(v18);

  if (a3 > 0.0 && v19 >= roundf(v13) || a3 < 0.0 && v19 <= roundf(v16))
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21918]);
    if (v8) {
LABEL_10:
    }
      v8[2](v8);
LABEL_11:
    BOOL v20 = 0;
    goto LABEL_12;
  }
  if ([(VKMapViewAccessibility *)self _axTrackingEnabled]
    || [(VKMapViewAccessibility *)self _axTrackingWithHeadingEnabled])
  {
    objc_opt_class();
    CGRect v22 = [(VKMapViewAccessibility *)self _axUserLocationMarker];
    double v23 = __UIAccessibilityCastAsClass();

    if (v23)
    {
      [v23 _presentationCoordinate];
      VKLocationCoordinate2DMake();
      -[VKMapViewAccessibility accessibilityConvertCoordinateToWindow:](self, "accessibilityConvertCoordinateToWindow:");
    }
    else
    {
      _AXAssert();
      [(VKMapViewAccessibility *)self bounds];
      CGRectGetMidX(v26);
      [(VKMapViewAccessibility *)self bounds];
      CGRectGetMidY(v27);
    }
  }
  BOOL v24 = [(VKMapViewAccessibility *)self accessibilityLayerHostingView];
  UIAccessibilityPointToPoint();

  [(VKMapViewAccessibility *)self bounds];
  if (![(VKMapViewAccessibility *)self accessibilityIsInTourGuideMode]) {
    [(VKMapViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"ZoomNotification"];
  }
  _AXLogWithFacility();
  double v25 = v8;
  AXPerformSafeBlock();

  BOOL v20 = 1;
LABEL_12:

  return v20;
}

void __77__VKMapViewAccessibility_accessibilityZoom_point_animated_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  char v3 = [*(id *)(a1 + 32) safeValueForKey:@"_mapCameraController"];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v2) {
    objc_msgSend(v3, "zoom:withFocusPoint:completionHandler:", v4, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else {
    objc_msgSend(v3, "tapZoom:levels:completionHandler:", v4, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 48));
  }
}

- (float)accessibilityZoomLevel
{
  int v2 = [(VKMapViewAccessibility *)self safeValueForKey:@"mapDelegate"];
  NSClassFromString(&cfstr_Mkmapview.isa);
  float v3 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v2 safeFloatForKey:@"_zoomLevel"];
    float v3 = roundf(v4);
  }

  return v3;
}

- (int)_accessibilityMapType
{
  int v2 = [(VKMapViewAccessibility *)self safeValueForKey:@"mapType"];
  int v3 = [v2 integerValue];

  return v3;
}

- (BOOL)accessibilityMapTypeSupportsAccessibility
{
  return ([(VKMapViewAccessibility *)self _accessibilityMapType] & 0xFFFFFFF7) == 0;
}

- (BOOL)accessibilityMapTypeShouldShowTransit
{
  return [(VKMapViewAccessibility *)self _accessibilityMapType] == 8;
}

- (BOOL)accessibilityOnlyShowRouteNodesDuringTransit
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  if ([(VKMapViewAccessibility *)self accessibilityIsShowingRoutes]) {
    BOOL v3 = [(VKMapViewAccessibility *)self accessibilityMapTypeShouldShowTransit];
  }
  else {
    BOOL v3 = 1;
  }
  float v4 = [(VKMapViewAccessibility *)self accessibilityElements];
  uint64_t v5 = [v4 count];

  return !v5 && v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  double v8 = [(VKMapViewAccessibility *)self _accessibilityParentView];
  UIAccessibilityPointForPoint();
  uint64_t v10 = v9;
  uint64_t v12 = v11;

  float v13 = [(VKMapViewAccessibility *)self accessibilityElements];
  double v14 = (void *)[v13 copy];

  uint64_t v26 = 0;
  CGRect v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__622;
  uint64_t v30 = __Block_byref_object_dispose__623;
  id v31 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__VKMapViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
  v19[3] = &unk_265162D18;
  uint64_t v22 = v10;
  uint64_t v23 = v12;
  CGFloat v24 = x;
  CGFloat v25 = y;
  double v21 = &v26;
  v19[4] = self;
  id v15 = v7;
  id v20 = v15;
  [v14 enumerateObjectsUsingBlock:v19];
  float v16 = (VKMapViewAccessibility *)v27[5];
  if (!v16) {
    float v16 = self;
  }
  CGFloat v17 = v16;

  _Block_object_dispose(&v26, 8);

  return v17;
}

void __58__VKMapViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (objc_msgSend(v14, "pointInside:", *(double *)(a1 + 56), *(double *)(a1 + 64)))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {
    double v7 = *(double *)(a1 + 72);
    double v8 = *(double *)(a1 + 80);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = *(void **)(a1 + 32);
      uint64_t v10 = [v14 layer];
      objc_msgSend(v9, "convertPoint:toLayer:", v10, v7, v8);
      double v7 = v11;
      double v8 = v12;
    }
    float v13 = objc_msgSend(v14, "_accessibilityHitTest:withEvent:", *(void *)(a1 + 40), v7, v8);
    if ([v13 isAccessibilityElement])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v13);
      *a4 = 1;
    }
  }
}

- (id)_accessibilityScrollStatus
{
  if ([(VKMapViewAccessibility *)self _axTrackingWithHeadingEnabled])
  {
    BOOL v3 = [(VKMapViewAccessibility *)self accessibilityTourStatus];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VKMapViewAccessibility;
    BOOL v3 = [(VKMapViewAccessibility *)&v5 _accessibilityScrollStatus];
  }

  return v3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)accessibilityBounds
{
  uint64_t v31 = 0;
  double v32 = &v31;
  uint64_t v33 = 0x5012000000;
  double v34 = __Block_byref_object_copy__630;
  double v35 = __Block_byref_object_dispose__631;
  double v36 = &unk_2426D40D2;
  long long v2 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v37 = *MEMORY[0x263F001A8];
  long long v38 = v2;
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  CGRect v27 = __45__VKMapViewAccessibility_accessibilityBounds__block_invoke;
  uint64_t v28 = &unk_265162D40;
  uint64_t v29 = self;
  uint64_t v30 = &v31;
  AXPerformSafeBlock();
  CGRectGetMaxX(*(CGRect *)(v32 + 6));
  CGRectGetMaxY(*(CGRect *)(v32 + 6));
  CGRectGetMinX(*(CGRect *)(v32 + 6));
  CGRectGetMinY(*(CGRect *)(v32 + 6));
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x4012000000;
  v22[3] = __Block_byref_object_copy__633;
  v22[4] = __Block_byref_object_dispose__634;
  v22[5] = &unk_2426D40D2;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  VKLocationCoordinate2DMake();
  uint64_t v23 = v3;
  uint64_t v24 = v4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x4012000000;
  v19[3] = __Block_byref_object_copy__633;
  v19[4] = __Block_byref_object_dispose__634;
  void v19[5] = &unk_2426D40D2;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  VKLocationCoordinate2DMake();
  uint64_t v20 = v5;
  uint64_t v21 = v6;
  AXPerformSafeBlock();
  VKPointForVKLocationCoordinate2D();
  double v8 = v7;
  double v10 = v9;
  VKPointForVKLocationCoordinate2D();
  if (v8 <= v11) {
    double v13 = v11;
  }
  else {
    double v13 = v8;
  }
  if (v8 >= v11) {
    double v8 = v11;
  }
  if (v10 <= v12) {
    double v14 = v12;
  }
  else {
    double v14 = v10;
  }
  if (v10 >= v12) {
    double v10 = v12;
  }
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v31, 8);
  double v15 = v8;
  double v16 = v13;
  double v17 = v10;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.double var1 = v16;
  result.double var0 = v15;
  return result;
}

uint64_t __45__VKMapViewAccessibility_accessibilityBounds__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) bounds];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[6] = v4;
  v3[7] = v5;
  v3[8] = v6;
  v3[9] = v7;
  return result;
}

uint64_t __45__VKMapViewAccessibility_accessibilityBounds__block_invoke_637(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toCoordinateFromLayer:", *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v2 + 48) = v3;
  *(void *)(v2 + 56) = v4;
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "convertPoint:toCoordinateFromLayer:", *(void *)(a1 + 32), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v6 + 48) = v7;
  *(void *)(v6 + 56) = v8;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)accessibilityCenter
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4812000000;
  v11[3] = __Block_byref_object_copy__638;
  v11[4] = __Block_byref_object_dispose__639;
  v11[5] = &unk_2426D40D2;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  VKLocationCoordinate3DMake();
  uint64_t v12 = v2;
  uint64_t v13 = v3;
  uint64_t v14 = v4;
  AXPerformSafeBlock();
  VKLocationCoordinate2DMake();
  double v6 = v5;
  double v8 = v7;
  _Block_object_dispose(v11, 8);
  double v9 = v6;
  double v10 = v8;
  result.double var1 = v10;
  result.double var0 = v9;
  return result;
}

uint64_t __45__VKMapViewAccessibility_accessibilityCenter__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) centerCoordinate];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[6] = v4;
  v3[7] = v5;
  v3[8] = v6;
  return result;
}

- (int64_t)accessibilityOrientation
{
  uint64_t v2 = [(VKMapViewAccessibility *)self _accessibilityParentView];
  uint64_t v3 = [v2 window];
  uint64_t v4 = [v3 windowScene];
  int64_t v5 = [v4 interfaceOrientation];

  return v5;
}

- (double)accessibilityYaw
{
  uint64_t v4 = 0;
  int64_t v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  AXPerformSafeBlock();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __42__VKMapViewAccessibility_accessibilityYaw__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) yaw];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (id)_axMapViewDelegate
{
  double v2 = [(VKMapViewAccessibility *)self safeValueForKey:@"mapDelegate"];
  NSClassFromString(&cfstr_Mklookaroundvi.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = 0;
  }
  else
  {
    objc_opt_class();
    uint64_t v3 = __UIAccessibilityCastAsClass();
  }

  return v3;
}

- (id)_axMapsDelegate
{
  if (objc_opt_respondsToSelector())
  {
    double v2 = [MEMORY[0x263F1C408] safeValueForKey:@"sharedMapsDelegate"];
  }
  else
  {
    double v2 = 0;
  }

  return v2;
}

- (id)_axWindow
{
  double v2 = [(VKMapViewAccessibility *)self accessibilityContainer];
  uint64_t v3 = [v2 safeValueForKey:@"window"];

  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)accessibilityConvertScreenPointToCoordinate:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(VKMapViewAccessibility *)self frame];
  uint64_t v6 = [(VKMapViewAccessibility *)self _axWindow];
  objc_msgSend(v6, "convertPoint:fromWindow:", 0, x, y);
  double v8 = v7;
  double v10 = v9;

  double v11 = [(VKMapViewAccessibility *)self _axWindow];
  uint64_t v12 = [v11 layer];
  -[VKMapViewAccessibility convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v12, v8, v10);

  uint64_t v13 = [(VKMapViewAccessibility *)self safeValueForKey:@"currentCanvas"];
  [v13 valueForKey:@"_vkCamera"];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x4812000000;
  v21[3] = __Block_byref_object_copy__657;
  v21[4] = __Block_byref_object_dispose__658;
  v21[5] = &unk_2426D40D2;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  VKLocationCoordinate2DForVKPoint();
  double v15 = v14;
  double v17 = v16;

  _Block_object_dispose(v21, 8);
  double v18 = v15;
  double v19 = v17;
  result.double var1 = v19;
  result.double var0 = v18;
  return result;
}

uint64_t __70__VKMapViewAccessibility_accessibilityConvertScreenPointToCoordinate___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "groundPointFromScreenPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[6] = v4;
  v3[7] = v5;
  v3[8] = v6;
  return result;
}

- (id)_axLastSummaryForVisibleBounds
{
}

- (void)_axSetLastSummaryForVisibleBounds:(id)a3
{
}

- (void)_axSummaryForVisibleBounds
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  double v2 = [(VKMapViewAccessibility *)self accessibilityElements];
  uint64_t v3 = (void *)[v2 copy];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = v3;
  uint64_t v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v6)
  {
    double v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ((objc_msgSend(v9, "_accessibilityIsFrameOutOfBounds", v32, v33) & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v9;
            if ([v10 mapFeatureType] == 25)
            {
              ++v5;
            }
            else if ([v10 isRoad])
            {
              ++v37;
            }
            else if ([v10 mapFeatureType] && v36 <= 2)
            {
              double v32 = [v10 accessibilityLabel];
              uint64_t v33 = @"__AXStringForVariablesSentinel";
              uint64_t v11 = __UIAXStringForVariables();

              double v35 = (void *)v11;
              ++v36;
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v6);
  }
  else
  {
    double v35 = 0;
    uint64_t v37 = 0;
  }

  uint64_t v12 = NSString;
  uint64_t v13 = AXVectorKitLocString(@"ROAD_SUMMARY_FORMAT");
  long long v38 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v37);

  double v14 = NSString;
  double v15 = AXVectorKitLocString(@"POI_SUMMARY");
  double v16 = v35;
  if (!v35)
  {
    double v16 = AXFormatInteger();
  }
  double v17 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v16);
  if (!v35) {

  }
  double v18 = NSString;
  double v19 = AXVectorKitLocString(@"BUILDING_SUMMARY_FORMAT");
  id v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v5);

  uint64_t v21 = __UIAXStringForVariables();
  if ([(VKMapViewAccessibility *)self _accessibilityBoolValueForKey:@"TransitionNotification", v38, v20, @"__AXStringForVariablesSentinel"])
  {
    if (![v21 length]) {
      goto LABEL_31;
    }
    uint64_t v22 = [(VKMapViewAccessibility *)self _axLastSummaryForVisibleBounds];
    char v23 = [v21 isEqualToString:v22];

    if (v23) {
      goto LABEL_31;
    }
    uint64_t v24 = [MEMORY[0x263F21660] axAttributedStringWithString:v21];
    [v24 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
    uint64_t v25 = +[VKMapViewOutputManager sharedOutputManager];
    [v25 queueOutput:v24];
  }
  else
  {
    if (![(VKMapViewAccessibility *)self _accessibilityBoolValueForKey:@"ZoomNotification"])
    {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE30], v21);
      uint64_t v31 = self;
      goto LABEL_33;
    }
    [(VKMapViewAccessibility *)self accessibilityZoomLevel];
    uint64_t v26 = NSString;
    CGRect v27 = AXVectorKitLocString(@"ZOOM_STEP_LEVEL");
    uint64_t v28 = AXFormatInteger();
    uint64_t v24 = objc_msgSend(v26, "localizedStringWithFormat:", v27, v28);

    uint64_t v29 = __UIAXStringForVariables();

    uint64_t v30 = +[VKMapViewOutputManager sharedOutputManager];
    [v30 clearOutputQueue];

    uint64_t v25 = +[VKMapViewOutputManager sharedOutputManager];
    [v25 queueOutput:v29];
    uint64_t v21 = (void *)v29;
  }

LABEL_31:
  uint64_t v31 = self;
LABEL_33:
  [(VKMapViewAccessibility *)v31 _accessibilitySetBoolValue:0 forKey:@"ScrollNotification"];
  [(VKMapViewAccessibility *)v31 _accessibilitySetBoolValue:0 forKey:@"TransitionNotification"];
  [(VKMapViewAccessibility *)v31 _accessibilitySetBoolValue:0 forKey:@"ZoomNotification"];
  [(VKMapViewAccessibility *)v31 _axSetLastSummaryForVisibleBounds:v21];
}

- (void)_accessibilityMapViewDidChangeVisibleRegion
{
  if (_UIAccessibilityIsEnabled()
    && ![(VKMapViewAccessibility *)self _axTrackingWithHeadingEnabled]
    && ([(VKMapViewAccessibility *)self accessibilityElementsHidden] & 1) == 0)
  {
    uint64_t v3 = [(VKMapViewAccessibility *)self _axMapLabelLayoutTimer];
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __69__VKMapViewAccessibility__accessibilityMapViewDidChangeVisibleRegion__block_invoke;
    v4[3] = &unk_265162DB8;
    objc_copyWeak(&v5, &location);
    [v3 afterDelay:v4 processBlock:0.25];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __69__VKMapViewAccessibility__accessibilityMapViewDidChangeVisibleRegion__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axUpdateElements];
}

- (void)_accessibilityMapViewDidChangeRegionAnimated:(BOOL)a3
{
  if (_UIAccessibilityIsEnabled())
  {
    if ([(VKMapViewAccessibility *)self _axTrackingEnabled]) {
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

void __71__VKMapViewAccessibility__accessibilityMapViewDidChangeRegionAnimated___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _axElements];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    [*(id *)(a1 + 32) _accessibilitySetBoolValue:1 forKey:@"TransitionNotification"];
    id v4 = *(void **)(a1 + 32);
    [v4 _axUpdateElements];
  }
}

- (BOOL)_axElementsInvalidForVisibleBounds
{
  [(VKMapViewAccessibility *)self accessibilityBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(VKMapViewAccessibility *)self _axBoundsOfElements];
  return !AXVKRectEqualToRect(v4, v6, v8, v10, v11, v12, v13, v14);
}

- (int64_t)_axTrackingMode
{
  double v2 = [(VKMapViewAccessibility *)self _axMapViewDelegate];
  double v3 = [v2 safeValueForKey:@"userTrackingMode"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)_axSetTrackingMode:(int64_t)a3
{
}

void __45__VKMapViewAccessibility__axSetTrackingMode___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _axMapViewDelegate];
  [v2 setUserTrackingMode:*(void *)(a1 + 40)];
}

- (BOOL)_axTrackingWithHeadingEnabled
{
  return [(VKMapViewAccessibility *)self _axTrackingMode] == 2;
}

- (BOOL)_axTrackingEnabled
{
  return [(VKMapViewAccessibility *)self _axTrackingMode] == 1;
}

- (BOOL)accessibilityIsShowingRoutes
{
  id v2 = [(VKMapViewAccessibility *)self _axMapsDelegate];
  double v3 = [v2 safeValueForKey:@"chromeViewController"];

  int64_t v4 = [v3 safeValueForKey:@"routeAnnotationsController"];
  double v5 = [v4 safeValueForKey:@"configuration"];
  double v6 = [v5 safeArrayForKey:@"routes"];
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0 && [v6 count] != 0;
  if (![v5 safeIntegerForKey:@"routeMarkerOptions"]) {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_retrieveAXElementManager
{
  return (id)[(VKMapViewAccessibility *)self _accessibilityValueForKey:@"AccessibilityElementManager"];
}

- (id)accessibilityElementManager
{
  if (AXRequiresMapAccessibility())
  {
    double v3 = [(VKMapViewAccessibility *)self _accessibilityValueForKey:@"AccessibilityElementManager"];
    if (!v3)
    {
      double v3 = objc_opt_new();
      [v3 setDelegate:self];
      [(VKMapViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"AccessibilityElementManager"];
    }
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)_axTourGuideManager
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    double v3 = [(VKMapViewAccessibility *)self _accessibilityValueForKey:@"TourGuideManager"];
    if (!v3)
    {
      int64_t v4 = [VKMapViewTourGuideManager alloc];
      double v5 = [(VKMapViewAccessibility *)self accessibilityElementManager];
      double v3 = [(VKMapViewTourGuideManager *)v4 initWithMapView:self elementManager:v5];

      [(VKMapViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"TourGuideManager"];
    }
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)_axWalkAssistManager
{
  if (UIAccessibilityIsVoiceOverRunning() && (AXDeviceIsPad() & 1) == 0)
  {
    double v3 = [(VKMapViewAccessibility *)self _accessibilityValueForKey:@"WalkAssistManager"];
    if (!v3)
    {
      double v3 = objc_opt_new();
      [(VKMapViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"WalkAssistManager"];
    }
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (void)_axStartListeningForUpdateAccessibilityElementsComplete
{
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  double v3 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  [v4 addObserver:self selector:sel__axUpdateElementsComplete_ name:@"UpdateAccessibilityElementsComplete" object:v3];
}

- (void)_axStartListeningForUserTrackingModeChange
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__axUserTrackingModeChange_ name:@"MKUserTrackingViewDidUpdateUserLocationNotification" object:0];
}

- (void)_axStartListeningForMapAccessibilityEnabled
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = AXNotificationsForMapAccessibilityClients();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        double v8 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", (void)v9);
        [v8 addObserver:self selector:sel__axMapsAccessibilityPotentiallyEnabled name:v7 object:0];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_axStartListeningForMapVisibleRegionChanged
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__axMapVisibleRegionDidChange name:@"AXMapVisibleRegionDidChange" object:0];
}

- (BOOL)_axShouldSummarizeVisibleBounds
{
  char v3 = [(VKMapViewAccessibility *)self _accessibilityBoolValueForKey:@"ScrollNotification"];
  char v4 = [(VKMapViewAccessibility *)self _accessibilityBoolValueForKey:@"TransitionNotification"];
  return v3 | v4 | [(VKMapViewAccessibility *)self _accessibilityBoolValueForKey:@"ZoomNotification"];
}

- (id)_axUserLocationMarker
{
  id v2 = [(VKMapViewAccessibility *)self safeValueForKey:@"mapDelegate"];
  char v3 = [v2 safeValueForKey:@"_annotationContainer"];
  char v4 = [v3 safeValueForKey:@"userLocationView"];

  return v4;
}

- (id)_axTourGuideElement
{
  char v3 = [(VKMapViewAccessibility *)self _axUserLocationMarker];
  char v4 = [(VKMapViewAccessibility *)self _accessibilityValueForKey:@"TourGuideElement"];
  uint64_t v5 = v4;
  if (!v4
    || ([(VKTourGuideAccessibilityElement *)v4 userLocationMarker],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6 != v3))
  {
    uint64_t v7 = [[VKTourGuideAccessibilityElement alloc] initWithAccessibilityContainer:self userLocationMarker:v3];

    uint64_t v5 = v7;
    [(VKMapViewAccessibility *)self _accessibilitySetRetainedValue:v7 forKey:@"TourGuideElement"];
  }

  return v5;
}

- (void)_axLoadAccessibility
{
  char v3 = [(VKMapViewAccessibility *)self _accessibilityValueForKey:@"didLoadAccessibility"];
  char v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    [(VKMapViewAccessibility *)self _accessibilitySetRetainedValue:MEMORY[0x263EFFA88] forKey:@"didLoadAccessibility"];
    [(VKMapViewAccessibility *)self _axStartListeningForUpdateAccessibilityElementsComplete];
    [(VKMapViewAccessibility *)self _axStartListeningForUserTrackingModeChange];
    [(VKMapViewAccessibility *)self _axStartListeningForMapAccessibilityEnabled];
    [(VKMapViewAccessibility *)self _axStartListeningForMapVisibleRegionChanged];
  }
}

- (id)_axElements
{
  char v3 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  if (objc_opt_respondsToSelector())
  {
    char v4 = [v3 accessibilityElementsForMapView:self];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_axBoundsOfElements
{
  char v3 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  if (objc_opt_respondsToSelector())
  {
    [v3 boundsForMapView:self];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = 0.0;
    double v7 = 0.0;
    double v9 = 0.0;
    double v11 = 0.0;
  }

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.var3 = v15;
  result.var2 = v14;
  result.double var1 = v13;
  result.double var0 = v12;
  return result;
}

- (int64_t)_axOrientationOfElements
{
  char v3 = [(VKMapViewAccessibility *)self accessibilityElementManager];
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 orientationForMapView:self];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (void)_axUpdateElements
{
  if (([(VKMapViewAccessibility *)self accessibilityElementsHidden] & 1) == 0)
  {
    id v3 = [(VKMapViewAccessibility *)self accessibilityElementManager];
    if (objc_opt_respondsToSelector()) {
      [v3 updateAccessibilityElementsForMapView:self];
    }
  }
}

- (id)accessibilityTourStatus
{
  id v3 = [(VKMapViewAccessibility *)self _axTourGuideManager];
  if ([v3 isRunning])
  {
    if (objc_opt_respondsToSelector())
    {
      int64_t v4 = [v3 tourStatusForMapView:self];
    }
    else
    {
      int64_t v4 = 0;
    }
    double v6 = [(VKMapViewAccessibility *)self _axUserLocationMarker];
    double v7 = [v6 safeValueForKey:@"annotation"];
    double v8 = [v7 safeValueForKey:@"accessibilityLocality"];

    double v5 = __UIAXStringForVariables();
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (void)_axUpdateElementsComplete:(id)a3
{
  id v7 = a3;
  if (![(VKMapViewAccessibility *)self accessibilityIsInTourGuideMode])
  {
    if ([(VKMapViewAccessibility *)self _axElementsInvalidForVisibleBounds]
      || ([(VKMapViewAccessibility *)self _axElements],
          int64_t v4 = objc_claimAutoreleasedReturnValue(),
          v4,
          !v4))
    {
      [(VKMapViewAccessibility *)self _axUpdateElements];
    }
    else
    {
      [(VKMapViewAccessibility *)self _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
      double v5 = [v7 userInfo];
      double v6 = [v5 objectForKey:@"AXVKUpdateAccessibilityElementsFocusedElementKey"];

      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v6);
      if ([(VKMapViewAccessibility *)self _axShouldSummarizeVisibleBounds]) {
        [(VKMapViewAccessibility *)self _axSummaryForVisibleBounds];
      }
    }
  }
}

- (void)_axUserTrackingModeChange:(id)a3
{
  id v5 = [(VKMapViewAccessibility *)self _axTourGuideManager];
  if ([(VKMapViewAccessibility *)self _axTrackingWithHeadingEnabled])
  {
    if (([v5 isRunning] & 1) == 0) {
      [v5 startTour];
    }
  }
  else if ([v5 isRunning])
  {
    [v5 stopTour];
  }
  int64_t v4 = [(VKMapViewAccessibility *)self _axWalkAssistManager];
  if ([v4 isInWalkingNavigatingState] && (objc_msgSend(v4, "hasArrived") & 1) == 0)
  {
    if (([v4 isRunning] & 1) == 0) {
      [v4 start];
    }
  }
  else if ([v4 isRunning])
  {
    [v4 stop];
  }
}

- (void)_axMapsAccessibilityPotentiallyEnabled
{
  id v3 = +[VKMapDebugView sharedInstance];
  [v3 removePointsAndPaths];

  if (AXRequiresMapAccessibility())
  {
    [(VKMapViewAccessibility *)self _axUpdateElements];
  }
}

- (void)_axMapVisibleRegionDidChange
{
  if (AXRequiresMapAccessibility())
  {
    [(VKMapViewAccessibility *)self _axUpdateElements];
  }
}

- (id)_axMapLabelLayoutTimer
{
}

- (void)_axSetMapLabelLayoutTimer:(id)a3
{
}

- (id)initShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7 allowsAntialiasing:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a4;
  BOOL v12 = a3;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VKMapViewAccessibility;
  id v15 = [(VKMapViewAccessibility *)&v18 initShouldRasterize:v12 inBackground:v11 contentScale:v14 auditToken:a7 mapViewPurpose:v8 allowsAntialiasing:a5];
  double v16 = v15;
  if (v15) {
    [v15 _axInitializeTimers];
  }

  return v16;
}

- (void)didUpdateSceneStatus:(unsigned __int8)a3
{
  int v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKMapViewAccessibility;
  -[VKMapViewAccessibility didUpdateSceneStatus:](&v5, sel_didUpdateSceneStatus_);
  if (v3)
  {
    UIAccessibilityPostNotification(0xBD4u, 0);
    [(VKMapViewAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"MapLoadingComplete"];
    [(VKMapViewAccessibility *)self _accessibilityMapViewDidChangeVisibleRegion];
  }
  else
  {
    [(VKMapViewAccessibility *)self _accessibilitySetBoolValue:0 forKey:@"MapLoadingComplete"];
  }
}

- (void)labelManagerDidLayout
{
  v3.receiver = self;
  v3.super_class = (Class)VKMapViewAccessibility;
  [(VKMapViewAccessibility *)&v3 labelManagerDidLayout];
  [(VKMapViewAccessibility *)self _axHandleLabelsDidLayout];
}

- (void)_axHandleLabelsDidLayout
{
  if (([(VKMapViewAccessibility *)self accessibilityElementsHidden] & 1) == 0)
  {
    [(VKMapViewAccessibility *)self _axInitializeTimers];
    objc_super v3 = [(VKMapViewAccessibility *)self _axMapLabelLayoutTimer];
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __50__VKMapViewAccessibility__axHandleLabelsDidLayout__block_invoke;
    v4[3] = &unk_265162DB8;
    objc_copyWeak(&v5, &location);
    [v3 afterDelay:v4 processBlock:0.25];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __50__VKMapViewAccessibility__axHandleLabelsDidLayout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axUpdateElements];
}

- (void)setMapType:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VKMapViewAccessibility;
  [(VKMapViewAccessibility *)&v3 setMapType:*(void *)&a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __37__VKMapViewAccessibility_setMapType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axUpdateElements];
}

- (void)setCurrentLocationText:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKMapViewAccessibility;
  [(VKMapViewAccessibility *)&v5 setCurrentLocationText:v4];
  [(VKMapViewAccessibility *)self _axSetCurrentLocationText:v4];
}

@end