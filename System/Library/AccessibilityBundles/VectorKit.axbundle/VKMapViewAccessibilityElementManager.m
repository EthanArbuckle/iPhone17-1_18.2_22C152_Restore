@interface VKMapViewAccessibilityElementManager
- ($01BB1521EC52D44A8E7628F5261DCEC8)_boundsForMapView:(id)a3;
- ($01BB1521EC52D44A8E7628F5261DCEC8)bounds;
- ($01BB1521EC52D44A8E7628F5261DCEC8)boundsForMapView:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_centerForMapView:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)center;
- ($F24F406B2B787EFB06265DBA3D28CBD5)centerForMapView:(id)a3;
- (AXVKExplorationVertexElement)currentExplorationVertex;
- (BOOL)_isValidBoundsForMapView:(id)a3 bounds:(id)a4;
- (BOOL)_isValidOrientationForMapView:(id)a3 orientation:(int64_t)a4;
- (BOOL)_isValidYawForMapView:(id)a3 yaw:(double)a4;
- (BOOL)hitPointHasMapAncestor:(CGPoint)a3 inWindow:(id)a4;
- (BOOL)isUpdating;
- (BOOL)roadHasMapAncestor:(id)a3 inWindow:(id)a4;
- (CGPoint)adjacentPointToPoint:(CGPoint)a3 withOtherPoint:(CGPoint)a4 onRoad:(id)a5;
- (CGPoint)explorationLastTouchPoint;
- (NSArray)accessibilityElements;
- (NSMutableArray)lastExplorationVertices;
- (NSMutableArray)neighborExplorationElements;
- (OS_dispatch_queue)properties_queue;
- (VKExplorationAccessibilityElement)currentExplorationElement;
- (VKMapView)currentMapView;
- (VKMapViewAccessibilityElementManager)init;
- (VKMapViewAccessibilityElementManagerDelegate)delegate;
- (double)_yawForMapView:(id)a3;
- (double)accessibilityAngleWithThreePointsFirst:(CGPoint)a3 second:(CGPoint)a4 third:(CGPoint)a5 inRadians:(BOOL)a6;
- (double)accessibilityDistanceBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4 onRoad:(id)a5;
- (double)yaw;
- (double)yawForMapView:(id)a3;
- (float)_zoomForMapView:(id)a3;
- (float)explorationZoomLevel;
- (id)_accessibilityElementsForMapView:(id)a3 mapViewBounds:(id)a4 visibleLabels:(id)a5 visibleTiles:(id)a6 existingElements:(id)a7;
- (id)_descriptionForRouteTransitNodeLabel:(id)a3;
- (id)_descriptionForTransitLineLabel:(id)a3;
- (id)_descriptionForTransitNodeLabel:(id)a3;
- (id)_gatherVisibleLabelMarkersForMapView:(id)a3;
- (id)_gatherVisibleTilesForMapView:(id)a3;
- (id)accessibilityElementsForMapView:(id)a3;
- (id)accessibilityMapsExplorationChangeVerbosityIncreasing:(BOOL)a3;
- (id)accessibilityMapsExplorationCurrentIntersectionDescription;
- (id)accessibilityMapsExplorationCurrentRoadsWithAngles;
- (id)accessibilityMapsExplorationDescriptionForAdjacentPOIs:(id)a3;
- (id)accessibilityMapsExplorationStringForElement:(id)a3 withRelativeAngle:(double)a4;
- (id)accessibilityVisiblePOIsBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4 onRoad:(id)a5;
- (id)edgeBetweenVertex:(id)a3 andVertex:(id)a4;
- (id)roadElementForFeatureWrapper:(id)a3;
- (id)roadsForVertex:(id)a3;
- (int64_t)_orientationForMapView:(id)a3;
- (int64_t)explorationState;
- (int64_t)orientation;
- (int64_t)orientationForMapView:(id)a3;
- (int64_t)verbosityLevel;
- (void)_consolidateAccessibilityElements:(id)a3;
- (void)_filterAccessibilityElements:(id)a3 zoomLevel:(float)a4 mapView:(id)a5;
- (void)_processVisibleTile:(id)a3 accessibilityElements:(id *)a4 mapViewBounds:(id)a5 mapView:(id)a6 roadLabels:(id)a7;
- (void)_sortAccessibilityElements:(id)a3 mapView:(id)a4;
- (void)accessibilityMapsExplorationBacktrack;
- (void)accessibilityMapsExplorationBeginFromCurrentLocation;
- (void)accessibilityMapsExplorationBeginFromLocationCoordinate:(id)a3;
- (void)accessibilityMapsExplorationBeginFromPoint:(CGPoint)a3 withRoad:(id)a4;
- (void)accessibilityMapsExplorationBeginFromRoad:(id)a3;
- (void)accessibilityMapsExplorationContinueWithVertex:(id)a3;
- (void)accessibilityMapsExplorationContinueWithVertex:(id)a3 fromVertex:(id)a4;
- (void)accessibilityMapsExplorationContinueWithVertexIndex:(unint64_t)a3;
- (void)accessibilityMapsExplorationEnd;
- (void)addNeighborsAsRelevantFeaturesForVertex:(id)a3;
- (void)computeVertex:(id)a3;
- (void)setAccessibilityElements:(id)a3;
- (void)setBounds:(id)a3;
- (void)setCenter:(id)a3;
- (void)setCurrentExplorationElement:(id)a3;
- (void)setCurrentExplorationVertex:(id)a3;
- (void)setCurrentMapView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExplorationLastTouchPoint:(CGPoint)a3;
- (void)setExplorationState:(int64_t)a3;
- (void)setExplorationZoomLevel:(float)a3;
- (void)setLastExplorationVertices:(id)a3;
- (void)setNeighborExplorationElements:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setProperties_queue:(id)a3;
- (void)setUpdating:(BOOL)a3;
- (void)setVerbosityLevel:(int64_t)a3;
- (void)setYaw:(double)a3;
- (void)updateAccessibilityElementsForMapView:(id)a3;
- (void)updateAccessibilityElementsForMapView:(id)a3 isRetry:(BOOL)a4;
@end

@implementation VKMapViewAccessibilityElementManager

- (id)_gatherVisibleLabelMarkersForMapView:(id)a3
{
  v3 = [a3 safeValueForKey:@"labelMarkers"];

  return v3;
}

- (id)_gatherVisibleTilesForMapView:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  id v6 = a3;
  id v3 = v6;
  AXPerformSafeBlock();
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);

  return v4;
}

void __70__VKMapViewAccessibilityElementManager__gatherVisibleTilesForMapView___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) safeValueForKey:@"roadLabelTilesInScene"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_descriptionForTransitNodeLabel:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v27 = a3;
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  v28 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = [v27 imageKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v8 dataType] == 2)
        {
          uint64_t v9 = [v8 relatedText];
          if ([v9 length])
          {
            uint64_t v10 = [v3 indexOfObject:v9];
            if (v10 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v11 = objc_msgSend(MEMORY[0x263EFF980], "array", 0x7FFFFFFFFFFFFFFFLL);
              [v3 addObject:v9];
              [v28 addObject:v11];
            }
            else
            {
              v11 = [v28 objectAtIndexedSubscript:v10];
            }
            id v12 = [v8 text];
            if ([v12 length]) {
              [v11 addObject:v12];
            }
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v5);
  }

  uint64_t v13 = [v3 count];
  if (v13)
  {
    v14 = 0;
    for (uint64_t j = 0; j != v13; ++j)
    {
      v16 = objc_msgSend(v3, "objectAtIndexedSubscript:", j, v25, v26);
      v17 = [v28 objectAtIndexedSubscript:j];
      v18 = NSString;
      if ([v17 count] == 1) {
        v19 = @"TRANSIT_LINE_FORMAT_SINGULAR";
      }
      else {
        v19 = @"TRANSIT_LINE_FORMAT_PLURAL";
      }
      v20 = AXVectorKitLocString(v19);
      v21 = AXLabelForElements();
      v22 = objc_msgSend(v18, "stringWithFormat:", v20, v16, v21);

      v25 = v22;
      v26 = @"__AXStringForVariablesSentinel";
      v23 = __AXStringForVariables();

      v14 = v23;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)_descriptionForTransitLineLabel:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 relatedTexts];
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v3 imageKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) shieldText];
        if ([v10 length]) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v11 = NSString;
  if ((unint64_t)[v5 count] >= 2) {
    id v12 = @"TRANSIT_LINE_FORMAT_PLURAL";
  }
  else {
    id v12 = @"TRANSIT_LINE_FORMAT_SINGULAR";
  }
  uint64_t v13 = AXVectorKitLocString(v12);
  v14 = AXLabelForElements();
  v15 = AXLabelForElements();
  v16 = objc_msgSend(v11, "stringWithFormat:", v13, v14, v15);

  return v16;
}

- (id)_descriptionForRouteTransitNodeLabel:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v22 = a3;
  id v3 = [v22 imageKeys];
  id v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v23 = 0;
    uint64_t v8 = *(void *)v25;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v10 dataType] == 3)
        {
          uint64_t v11 = [v10 relatedText];

          uint64_t v12 = [v10 text];
          uint64_t v13 = v5;
          uint64_t v5 = (void *)v12;
        }
        else
        {
          if ([v10 dataType] != 4) {
            continue;
          }
          uint64_t v14 = [v10 relatedText];

          uint64_t v15 = [v10 text];
          uint64_t v13 = v23;
          uint64_t v11 = (uint64_t)v4;
          uint64_t v6 = (void *)v14;
          uint64_t v23 = (void *)v15;
        }

        id v4 = (void *)v11;
      }
      uint64_t v7 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v7) {
        goto LABEL_15;
      }
    }
  }
  uint64_t v23 = 0;
LABEL_15:

  if ([v4 length]
    && [v5 length]
    && [v6 length]
    && [v23 length])
  {
    v16 = NSString;
    v17 = AXVectorKitLocString(@"TRANSIT_TRANSFER_FORMAT");
    uint64_t v18 = objc_msgSend(v16, "localizedStringWithFormat:", v17, v4, v5, v6, v23);
  }
  else
  {
    v17 = AXVectorKitLocString(@"TRANSIT_ROUTE_NODE");
    uint64_t v18 = __AXStringForVariables();
  }
  long long v19 = (void *)v18;

  id v20 = v19;
  return v20;
}

- (id)_accessibilityElementsForMapView:(id)a3 mapViewBounds:(id)a4 visibleLabels:(id)a5 visibleTiles:(id)a6 existingElements:(id)a7
{
  double var3 = a4.var3;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__3;
  v67 = __Block_byref_object_dispose__3;
  id v68 = (id)objc_opt_new();
  if (UIAccessibilityIsVoiceOverRunning()
    && (objc_msgSend(v15, "accessibilityMapTypeSupportsAccessibility", v33) & 1) == 0)
  {
    id v31 = (id)v64[5];
  }
  else
  {
    char v16 = objc_msgSend(v15, "accessibilityMapTypeShouldShowTransit", v33);
    char v17 = [v15 accessibilityOnlyShowRouteNodesDuringTransit];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __131__VKMapViewAccessibilityElementManager__accessibilityElementsForMapView_mapViewBounds_visibleLabels_visibleTiles_existingElements___block_invoke;
    v52[3] = &unk_265162EC0;
    char v61 = v16;
    char v62 = v17;
    double v57 = var0;
    double v58 = var1;
    double v59 = var2;
    double v60 = var3;
    id v18 = v15;
    id v53 = v18;
    v54 = self;
    id v55 = v33;
    v56 = &v63;
    [v35 enumerateObjectsUsingBlock:v52];
    if (UIAccessibilityIsVoiceOverRunning())
    {
      long long v19 = [MEMORY[0x263EFF9C0] set];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v20 = v35;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v70 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v49 != v22) {
              objc_enumerationMutation(v20);
            }
            long long v24 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            long long v25 = [v24 text];
            if ([v25 length]
              && ([v24 hasBusinessID] & 1) == 0
              && ([v24 isOneWayArrow] & 1) == 0
              && ([v24 isTrafficIncident] & 1) == 0
              && ([v24 isTransit] & 1) == 0
              && ([v24 isTransitLine] & 1) == 0)
            {
              [v19 addObject:v25];
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v70 count:16];
        }
        while (v21);
      }

      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __131__VKMapViewAccessibilityElementManager__accessibilityElementsForMapView_mapViewBounds_visibleLabels_visibleTiles_existingElements___block_invoke_2;
      v40[3] = &unk_265162EE8;
      v40[4] = self;
      v43 = &v63;
      double v44 = var0;
      double v45 = var1;
      double v46 = var2;
      double v47 = var3;
      id v41 = v18;
      id v26 = v19;
      id v42 = v26;
      [v34 enumerateObjectsUsingBlock:v40];
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v27 = v34;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v69 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v27);
          }
          AXPerformBlockAsynchronouslyOnMainThread();
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v69 count:16];
      }
      while (v28);
    }

    id v31 = (id)v64[5];
  }
  _Block_object_dispose(&v63, 8);

  return v31;
}

void __131__VKMapViewAccessibilityElementManager__accessibilityElementsForMapView_mapViewBounds_visibleLabels_visibleTiles_existingElements___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [v3 featureType];
  int v5 = [v3 featureType];
  BOOL v6 = [v3 featureType] == 7 || objc_msgSend(v3, "featureType") == 9;
  int v8 = v4 == 5 || v5 == 6 || v6;
  int v93 = v8;
  unsigned int v9 = [v3 isCluster];
  int v10 = [v3 isClusterChild];
  BOOL IsPointOfInterest = AXVKLabelMarkerIsPointOfInterest(v3);
  int IsVenueButton = AXVKLabelMarkerIsVenueButton(v3);
  uint64_t IsRouteEta = AXVKLabelMarkerIsRouteEta(v3);
  int v14 = [v3 isRouteWaypoint];
  if (!*(unsigned char *)(a1 + 96))
  {
    if (!(IsPointOfInterest | v9 | IsRouteEta | v14))
    {
      uint64_t v22 = [MEMORY[0x263F22970] sharedInstance];
      char v23 = [v22 ignoreLogging];

      if ((v23 & 1) == 0)
      {
        long long v24 = [MEMORY[0x263F22970] identifier];
        id v18 = AXLoggerForFacility();

        os_log_type_t v25 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v18, v25))
        {
          id v26 = AXColorizeFormatLog();
          id v27 = _AXStringForArgs();
          if (os_log_type_enabled(v18, v25))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v27;
            _os_log_impl(&dword_2426A3000, v18, v25, "%{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
        goto LABEL_42;
      }
      goto LABEL_85;
    }
    goto LABEL_28;
  }
  if (*(unsigned char *)(a1 + 97))
  {
    if (v4 != 5 || ([v3 isOnRoute] & 1) == 0)
    {
      id v15 = [MEMORY[0x263F22970] sharedInstance];
      char v16 = [v15 ignoreLogging];

      if ((v16 & 1) == 0)
      {
        char v17 = [MEMORY[0x263F22970] identifier];
        id v18 = AXLoggerForFacility();

        os_log_type_t v19 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v18, v19))
        {
          id v20 = AXColorizeFormatLog();
          uint64_t v21 = _AXStringForArgs();
          if (os_log_type_enabled(v18, v19))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v21;
            _os_log_impl(&dword_2426A3000, v18, v19, "%{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
LABEL_42:

        goto LABEL_85;
      }
      goto LABEL_85;
    }
LABEL_28:
    [v3 coordinate];
    VKPointForVKLocationCoordinate2D();
    *(void *)&long long buf = v28;
    *((void *)&buf + 1) = v29;
    double v102 = v30;
    if (VKRectContainsPoint())
    {
      id v31 = [[VKPointFeatureAccessibilityElement alloc] initWithAccessibilityContainer:*(void *)(a1 + 32)];
      os_log_t oslog = &v31->super.super.super.super;
      if (v31)
      {
        -[VKPointFeatureAccessibilityElement setLocation:](v31, "setLocation:", buf, v102);
        uint64_t v90 = [v3 text];
        v92 = [v3 featureAnnotation];
        if (v4 == 5)
        {
          long long v32 = *(void **)(a1 + 40);
          id v33 = (void *)v90;
          if (*(unsigned char *)(a1 + 97)) {
            [v32 _descriptionForRouteTransitNodeLabel:v3];
          }
          else {
          long long v48 = [v32 _descriptionForTransitNodeLabel:v3];
          }
          v78 = v48;
          v82 = @"__AXStringForVariablesSentinel";
          __AXStringForVariables();
          os_log_t v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
          goto LABEL_54;
        }
        if (v6)
        {
          os_log_t v95 = [*(id *)(a1 + 40) _descriptionForTransitLineLabel:v3];
          long long v48 = (void *)v90;
LABEL_55:

LABEL_56:
          v91 = objc_msgSend(v92, "accessibilityLabel", v78, v82, v85);
          if (v91)
          {
            os_log_t v79 = v95;
            v83 = @"__AXStringForVariablesSentinel";
            uint64_t v55 = __AXStringForVariables();

            v56 = v55;
          }
          else
          {
            v56 = v95;
          }
          os_log_t v96 = v56;
          if ([v56 hasPrefix:@"♥", v79, v83])
          {
            double v57 = AXVectorKitLocString(@"POI_FAVORITE");
            v80 = -[NSObject stringByReplacingCharactersInRange:withString:](v96, "stringByReplacingCharactersInRange:withString:", 0, [@"♥" length], &stru_26F81E868);
            v84 = @"__AXStringForVariablesSentinel";
            uint64_t v58 = __AXStringForVariables();

            os_log_t v96 = (os_log_t)v58;
          }
          if (IsVenueButton)
          {
            v80 = AXVectorKitLocString(@"LOOK_INSIDE");
            v84 = @"__AXStringForVariablesSentinel";
            uint64_t v59 = __AXStringForVariables();

            os_log_t v96 = (os_log_t)v59;
          }
          if (IsRouteEta)
          {
            v89 = [v3 routeInfo];
            NSClassFromString(&cfstr_Vkalternaterou.isa);
            if (objc_opt_isKindOfClass()) {
              AXVectorKitLocString(@"ALTERNATE_ROUTE_LABEL");
            }
            else {
            v88 = AXVectorKitLocString(@"ACTIVE_ROUTE_LABEL");
            }
            char v61 = objc_msgSend(v89, "etaDescription", v80, v84);
            v84 = [v61 etaText];
            v86 = @"__AXStringForVariablesSentinel";
            v80 = v88;
            uint64_t v62 = __AXStringForVariables();

            double v60 = v62;
          }
          else
          {
            double v60 = v96;
          }
          os_log_t v94 = v60;
          -[NSObject setAccessibilityLabel:](oslog, "setAccessibilityLabel:", v80, v84, v86);
          [oslog setIsPOI:IsPointOfInterest];
          [oslog setIsTransitStop:v4 == 5];
          [oslog setIsTransitLine:v6];
          [oslog setIsRouteEta:IsRouteEta];
          uint64_t v63 = [v3 locale];
          [oslog setAccessibilityLanguage:v63];

          if ([v3 isRouteWaypoint])
          {
            v64 = [v3 waypointInfo];
            uint64_t v81 = [v64 waypointIndex];
            uint64_t v65 = AXCFormattedString();
            -[NSObject setAccessibilityIdentifier:](oslog, "setAccessibilityIdentifier:", v65, v81);
          }
          v66 = (void *)[objc_alloc(MEMORY[0x263EFF980]) init];
          for (unint64_t i = 0; i < [v3 countFeatureIDs]; ++i)
          {
            uint64_t v68 = [v3 featureIDs];
            v69 = [NSNumber numberWithUnsignedLongLong:*(void *)(v68 + 8 * i)];
            [v66 addObject:v69];
          }
          [oslog setFeatureIds:v66];
          if (!v93 || *(unsigned char *)(a1 + 96))
          {
            uint64_t v70 = [*(id *)(a1 + 48) indexOfObject:oslog];
            uint64_t v71 = *(void **)(a1 + 48);
            v72 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            if (!v71 || v70 == 0x7FFFFFFFFFFFFFFFLL)
            {
              [v72 addObject:oslog];
            }
            else
            {
              v73 = objc_msgSend(v71, "objectAtIndexedSubscript:");
              [v72 addObject:v73];
            }
          }
          -[NSObject setSortKey:](oslog, "setSortKey:", [v3 sortKey]);

LABEL_81:
LABEL_82:

          goto LABEL_83;
        }
        if (v5 == 6)
        {
          v99[0] = 0;
          objc_opt_class();
          long long v49 = [v3 iconImageKeys];
          long long v50 = [v49 firstObject];
          long long v51 = __UIAccessibilityCastAsClass();

          long long v48 = [v51 shieldText];

          v52 = [v3 relatedTexts];
          uint64_t v53 = [v52 firstObject];

          v82 = (__CFString *)v53;
          v85 = @"__AXStringForVariablesSentinel";
          v78 = v48;
          v54 = (void *)v90;
          __AXStringForVariables();
          os_log_t v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v9)
          {
            unint64_t v74 = [v3 clusterFeatureCount];
            unint64_t v75 = v74;
            unint64_t v76 = v74 - 1;
            if (v74 <= 1)
            {
              v78 = (void *)v74;
              _AXAssert();
              os_log_t v95 = (os_log_t)v90;
              goto LABEL_56;
            }
            os_log_t v97 = (os_log_t)NSString;
            long long v48 = AXVectorKitLocString(@"CLUSTER_FEATURE_COUNT_FORMAT");
            unint64_t v87 = v76;
            id v33 = (void *)v90;
            -[NSObject localizedStringWithFormat:](v97, "localizedStringWithFormat:", v48, v75, v90, v87);
            os_log_t v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
            goto LABEL_54;
          }
          if (v10)
          {
            id v33 = (void *)v90;
            long long v48 = [v92 safeValueForKey:@"_subtext"];
            v78 = v48;
            v82 = @"__AXStringForVariablesSentinel";
            __AXStringForVariables();
            os_log_t v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
            goto LABEL_54;
          }
          NSClassFromString(&cfstr_Mkannotationvi.isa);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            os_log_t v95 = (os_log_t)v90;
            goto LABEL_56;
          }
          objc_opt_class();
          v77 = [v92 safeValueForKey:@"annotationView"];
          long long v48 = __UIAccessibilityCastAsClass();

          if (!v48)
          {
            os_log_t v95 = (os_log_t)v90;
            goto LABEL_55;
          }
          v54 = (void *)v90;
          uint64_t v53 = [v48 accessibilityLabel];
          v78 = (void *)v53;
          v82 = @"__AXStringForVariablesSentinel";
          __AXStringForVariables();
          os_log_t v95 = (os_log_t)objc_claimAutoreleasedReturnValue();
        }

        id v33 = (void *)v53;
LABEL_54:

        goto LABEL_55;
      }
      double v44 = [MEMORY[0x263F22970] sharedInstance];
      char v45 = [v44 ignoreLogging];

      if ((v45 & 1) == 0)
      {
        double v46 = [MEMORY[0x263F22970] identifier];
        AXLoggerForFacility();
        os_log_t v94 = (os_log_t)objc_claimAutoreleasedReturnValue();

        os_log_type_t v47 = AXOSLogLevelFromAXLogLevel();
        if (!os_log_type_enabled(v94, v47))
        {
LABEL_83:

          goto LABEL_84;
        }
        v92 = AXColorizeFormatLog();
        v91 = _AXStringForArgs();
        if (os_log_type_enabled(v94, v47))
        {
          *(_DWORD *)v99 = 138543362;
          v100 = v91;
          _os_log_impl(&dword_2426A3000, v94, v47, "%{public}@", v99, 0xCu);
        }
        goto LABEL_81;
      }
    }
    else
    {
      id v34 = [MEMORY[0x263F22970] sharedInstance];
      char v35 = [v34 ignoreLogging];

      if (v35) {
        goto LABEL_85;
      }
      long long v36 = [MEMORY[0x263F22970] identifier];
      AXLoggerForFacility();
      os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();

      os_log_type_t v37 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(oslog, v37))
      {
        AXColorizeFormatLog();
        os_log_t v94 = (os_log_t)objc_claimAutoreleasedReturnValue();
        v92 = _AXStringForArgs();
        if (os_log_type_enabled(oslog, v37))
        {
          *(_DWORD *)v99 = 138543362;
          v100 = v92;
          _os_log_impl(&dword_2426A3000, oslog, v37, "%{public}@", v99, 0xCu);
        }
        goto LABEL_82;
      }
    }
LABEL_84:

    goto LABEL_85;
  }
  if (IsPointOfInterest | v93 | v9) {
    goto LABEL_28;
  }
  long long v38 = [MEMORY[0x263F22970] sharedInstance];
  char v39 = [v38 ignoreLogging];

  if ((v39 & 1) == 0)
  {
    v40 = [MEMORY[0x263F22970] identifier];
    id v18 = AXLoggerForFacility();

    os_log_type_t v41 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v18, v41))
    {
      id v42 = AXColorizeFormatLog();
      v43 = _AXStringForArgs();
      if (os_log_type_enabled(v18, v41))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v43;
        _os_log_impl(&dword_2426A3000, v18, v41, "%{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    goto LABEL_42;
  }
LABEL_85:
}

void __131__VKMapViewAccessibilityElementManager__accessibilityElementsForMapView_mapViewBounds_visibleLabels_visibleTiles_existingElements___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  obuint64_t j = *(id *)(v3 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_processVisibleTile:accessibilityElements:mapViewBounds:mapView:roadLabels:", a2, &obj, *(void *)(a1 + 40), v2, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __131__VKMapViewAccessibilityElementManager__accessibilityElementsForMapView_mapViewBounds_visibleLabels_visibleTiles_existingElements___block_invoke_3(uint64_t a1)
{
  objc_setAssociatedObject(*(id *)(a1 + 32), &_MapTileModelKey, 0, 0);
  uint64_t v2 = *(void **)(a1 + 32);

  objc_setAssociatedObject(v2, &_TileInScene, 0, 0);
}

- (void)_processVisibleTile:(id)a3 accessibilityElements:(id *)a4 mapViewBounds:(id)a5 mapView:(id)a6 roadLabels:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = [v11 safeValueForKey:@"localizeLabels"];
  [v13 BOOLValue];

  [(VKMapViewAccessibilityElementManager *)self explorationState];
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  AXPerformSafeBlock();
}

void __115__VKMapViewAccessibilityElementManager__processVisibleTile_accessibilityElements_mapViewBounds_mapView_roadLabels___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __115__VKMapViewAccessibilityElementManager__processVisibleTile_accessibilityElements_mapViewBounds_mapView_roadLabels___block_invoke_2;
  v5[3] = &unk_265162F10;
  char v9 = *(unsigned char *)(a1 + 64);
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  char v10 = *(unsigned char *)(a1 + 65);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  [v2 enumerateVisibleRoadsUsingBlock:v5];
}

void __115__VKMapViewAccessibilityElementManager__processVisibleTile_accessibilityElements_mapViewBounds_mapView_roadLabels___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (!*(unsigned char *)(a1 + 56))
  {
    if ((AXVKRoadShouldBeVisible(v6, *(void **)(a1 + 32)) & 1) == 0) {
      goto LABEL_15;
    }
    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_11;
    }
  }
  if ([v6 roadClass] == 8
    || [v6 formOfWay] == 6
    || [v6 formOfWay] == 7
    || [v6 formOfWay] == 8
    || [v6 formOfWay] == 12
    || [v6 formOfWay] == 21)
  {
LABEL_11:
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 1;
  }
  uint64_t v4 = [(VKMultiSectionFeatureAccessibilityElement *)[VKRoadFeatureAccessibilityElement alloc] initWithAccessibilityContainer:*(void *)(a1 + 40) feature:v6 ignoreMissingName:v3 useLocalizedLabels:*(unsigned __int8 *)(a1 + 57)];
  if (v4)
  {
    *(float *)&double v5 = AXVKStrokeWidthForRoad(v6, *(void **)(a1 + 40));
    [(VKFeatureAccessibilityElement *)v4 setStrokeWidth:v5];
    -[VKRoadFeatureAccessibilityElement setTravelDirection:](v4, "setTravelDirection:", [v6 travelDirection]);
    [(VKFeatureAccessibilityElement *)v4 setIsPOI:0];
    [**(id **)(a1 + 48) addObject:v4];
  }

LABEL_15:
}

- (void)_consolidateAccessibilityElements:(id)a3
{
  id v9 = a3;
  uint64_t v3 = objc_opt_new();
  for (unint64_t i = 0; i < [v9 count]; ++i)
  {
    double v5 = [v9 objectAtIndex:i];
    if ([v5 isRoad])
    {
      id v6 = [v5 trueLabel];
      if ([v6 length])
      {
        id v7 = [v3 objectForKey:v6];
        uint64_t v8 = v7;
        if (v7)
        {
          [v7 addFeaturesFromElement:v5];
          [v9 removeObjectAtIndex:i--];
        }
        else
        {
          [v3 setObject:v5 forKey:v6];
        }
      }
    }
  }
}

- (void)_sortAccessibilityElements:(id)a3 mapView:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if ([v5 accessibilityMapTypeShouldShowTransit]) {
    AXVKTransitRouteElementComparator();
  }
  else {
  id v6 = AXVKMapElementComparator();
  }
  [v7 sortUsingComparator:v6];
}

- (void)_filterAccessibilityElements:(id)a3 zoomLevel:(float)a4 mapView:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v40 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", v7);
  char v10 = [v9 bundleIdentifier];
  int v11 = [v10 isEqualToString:@"com.apple.Maps"];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        [v16 accessibilityFrame];
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        id v25 = [v16 accessibilityPath];
        uint64_t v26 = [v25 CGPath];

        v49.origin.x = v18;
        v49.origin.y = v20;
        v49.size.width = v22;
        v49.size.height = v24;
        LODWORD(v25) = CGRectIsEmpty(v49);
        v50.origin.x = v18;
        v50.origin.y = v20;
        v50.size.width = v22;
        v50.size.height = v24;
        if (((v25 | CGRectIsNull(v50)) & 1) == 0 && v26)
        {
          id v27 = [v8 _accessibilityParentView];
          uint64_t v28 = [v27 window];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v29 = v16;
            if (!v11
              || [(VKMapViewAccessibilityElementManager *)self roadHasMapAncestor:v29 inWindow:v28])
            {
              [v40 addObject:v29];
            }
          }
          else
          {
            v51.origin.x = v18;
            v51.origin.y = v20;
            v51.size.width = v22;
            v51.size.height = v24;
            double MidX = CGRectGetMidX(v51);
            v52.origin.x = v18;
            v52.origin.y = v20;
            v52.size.width = v22;
            v52.size.height = v24;
            double MidY = CGRectGetMidY(v52);
            if (!v11
              || -[VKMapViewAccessibilityElementManager hitPointHasMapAncestor:inWindow:](self, "hitPointHasMapAncestor:inWindow:", v28, MidX, MidY))
            {
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              id v33 = v42;
              if (isKindOfClass)
              {
                if ([v16 isPOI]) {
                  id v33 = v39;
                }
                else {
                  id v33 = v42;
                }
              }
              [v33 addObject:v16];
            }
          }
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v13);
  }

  unint64_t v34 = _maximumVisiblePOIs(a4);
  if ([v39 count] <= v34)
  {
    [v38 addObjectsFromArray:v39];
  }
  else
  {
    [v39 sortUsingComparator:&__block_literal_global_6];
    char v35 = objc_msgSend(v39, "subarrayWithRange:", 0, v34);
    [v38 addObjectsFromArray:v35];
  }
  unint64_t v36 = _maximumVisibleRoads(a4);
  if ([v40 count] <= v36)
  {
    [v38 addObjectsFromArray:v40];
  }
  else
  {
    [v40 sortUsingComparator:&__block_literal_global_373];
    os_log_type_t v37 = objc_msgSend(v40, "subarrayWithRange:", 0, v36);
    [v38 addObjectsFromArray:v37];
  }
  [v38 addObjectsFromArray:v42];
  [v12 removeAllObjects];
  [v12 addObjectsFromArray:v38];
}

uint64_t __87__VKMapViewAccessibilityElementManager__filterAccessibilityElements_zoomLevel_mapView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 accessibilityFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 accessibilityFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  v32.origin.x = v6;
  v32.origin.y = v8;
  v32.size.width = v10;
  v32.size.height = v12;
  double Width = CGRectGetWidth(v32);
  v33.origin.x = v6;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = v12;
  double Height = CGRectGetHeight(v33);
  v34.origin.x = v14;
  v34.origin.y = v16;
  v34.size.width = v18;
  v34.size.height = v20;
  double v22 = CGRectGetWidth(v34);
  v35.origin.x = v14;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  CGFloat v23 = CGRectGetHeight(v35);
  float v24 = Width;
  float v25 = Height;
  float v26 = sqrtf((float)(v24 * v24) + (float)(v25 * v25));
  float v27 = v22;
  *(float *)&CGFloat v23 = v23;
  float v28 = sqrtf((float)(v27 * v27) + (float)(*(float *)&v23 * *(float *)&v23));
  if (v26 > v28) {
    uint64_t v29 = -1;
  }
  else {
    uint64_t v29 = v26 < v28;
  }

  return v29;
}

uint64_t __87__VKMapViewAccessibilityElementManager__filterAccessibilityElements_zoomLevel_mapView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 accessibilityFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 accessibilityFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  v32.origin.x = v6;
  v32.origin.y = v8;
  v32.size.width = v10;
  v32.size.height = v12;
  double Width = CGRectGetWidth(v32);
  v33.origin.x = v6;
  v33.origin.y = v8;
  v33.size.width = v10;
  v33.size.height = v12;
  double Height = CGRectGetHeight(v33);
  v34.origin.x = v14;
  v34.origin.y = v16;
  v34.size.width = v18;
  v34.size.height = v20;
  double v22 = CGRectGetWidth(v34);
  v35.origin.x = v14;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  CGFloat v23 = CGRectGetHeight(v35);
  float v24 = Width;
  float v25 = Height;
  float v26 = sqrtf((float)(v24 * v24) + (float)(v25 * v25));
  float v27 = v22;
  *(float *)&CGFloat v23 = v23;
  float v28 = sqrtf((float)(v27 * v27) + (float)(*(float *)&v23 * *(float *)&v23));
  if (v26 > v28) {
    uint64_t v29 = -1;
  }
  else {
    uint64_t v29 = v26 < v28;
  }

  return v29;
}

- (BOOL)roadHasMapAncestor:(id)a3 inWindow:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = *((id *)a3 + 19);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        double v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v12);
              }
              [*(id *)(*((void *)&v18 + 1) + 8 * j) CGPointValue];
              if (-[VKMapViewAccessibilityElementManager hitPointHasMapAncestor:inWindow:](self, "hitPointHasMapAncestor:inWindow:", v6))
              {

                BOOL v16 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      BOOL v16 = 0;
    }
    while (v8);
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_19:

  return v16;
}

- (BOOL)hitPointHasMapAncestor:(CGPoint)a3 inWindow:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  objc_msgSend(v6, "_convertPointToSceneReferenceSpace:", x, y);
  EventForSceneReferencePoint = (void *)UIAccessibilityCreateEventForSceneReferencePoint();
  uint64_t v8 = objc_msgSend(v6, "hitTest:withEvent:", EventForSceneReferencePoint, x, y);
  Class v9 = NSClassFromString(&cfstr_Mkmapview.isa);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__VKMapViewAccessibilityElementManager_hitPointHasMapAncestor_inWindow___block_invoke;
  v13[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v13[4] = v9;
  CGFloat v10 = [v8 _accessibilityFindAncestor:v13 startWithSelf:1];
  BOOL v11 = v10 != 0;

  return v11;
}

uint64_t __72__VKMapViewAccessibilityElementManager_hitPointHasMapAncestor_inWindow___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_boundsForMapView:(id)a3
{
  [a3 accessibilityBounds];
  result.double var3 = v6;
  result.double var2 = v5;
  result.double var1 = v4;
  result.double var0 = v3;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_centerForMapView:(id)a3
{
  [a3 accessibilityCenter];
  result.double var1 = v4;
  result.double var0 = v3;
  return result;
}

- (int64_t)_orientationForMapView:(id)a3
{
  return [a3 accessibilityOrientation];
}

- (double)_yawForMapView:(id)a3
{
  [a3 accessibilityYaw];
  return result;
}

- (float)_zoomForMapView:(id)a3
{
  [a3 accessibilityZoomLevel];
  return result;
}

- (BOOL)_isValidBoundsForMapView:(id)a3 bounds:(id)a4
{
  double var3 = a4.var3;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  [(VKMapViewAccessibilityElementManager *)self _boundsForMapView:v9];
  LOBYTE(self) = AXVKRectEqualToRect(var0, var1, var2, var3, v10, v11, v12, v13);

  return (char)self;
}

- (BOOL)_isValidOrientationForMapView:(id)a3 orientation:(int64_t)a4
{
  return [(VKMapViewAccessibilityElementManager *)self _orientationForMapView:a3] == a4;
}

- (BOOL)_isValidYawForMapView:(id)a3 yaw:(double)a4
{
  id v6 = a3;
  [(VKMapViewAccessibilityElementManager *)self _yawForMapView:v6];
  double v8 = v7;
  BOOL v9 = (![v6 accessibilityIsInTourGuideMode]
     || !AXVKIsInvalidLocationDegrees(a4) && !AXVKIsInvalidLocationDegrees(v8))
    && AXVKLocationDegreesEqualToLocationDegrees(a4, v8);

  return v9;
}

- (void)accessibilityMapsExplorationBeginFromCurrentLocation
{
  double v3 = [MEMORY[0x263F10930] sharedLocationManager];
  id v10 = [v3 currentLocation];

  double v4 = [v10 latLng];
  [v4 lat];
  double v6 = v5;
  double v7 = [v10 latLng];
  [v7 lng];
  double v9 = v8;

  -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationBeginFromLocationCoordinate:](self, "accessibilityMapsExplorationBeginFromLocationCoordinate:", v6, v9);
}

- (void)accessibilityMapsExplorationBeginFromLocationCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v66 = *MEMORY[0x263EF8340];
  double v7 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
  objc_msgSend(v7, "accessibilityConvertCoordinateToWindow:", var0, var1);
  double v9 = v8;
  double v11 = v10;

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = [(VKMapViewAccessibilityElementManager *)self accessibilityElements];
  uint64_t v44 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v44)
  {
    id v42 = 0;
    double v12 = 1.79769313e308;
    uint64_t v45 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v60 != v45) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v49 = v13;
          uint64_t v14 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
          BOOL v15 = v14 == 0;

          if (v15)
          {
            char v58 = 0;
            objc_opt_class();
            BOOL v16 = [v49 accessibilityContainer];
            double v17 = __UIAccessibilityCastAsClass();

            if (v58) {
              abort();
            }
            if (!v17) {
              _AXAssert();
            }
            -[VKMapViewAccessibilityElementManager setCurrentMapView:](self, "setCurrentMapView:", v17, *(void *)&v40, *(void *)&v41);
            objc_msgSend(v17, "accessibilityConvertCoordinateToWindow:", var0, var1);
            double v9 = v18;
            double v11 = v19;
          }
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v20 = objc_msgSend(v49, "featureSet", *(void *)&v40, *(void *)&v41);
          id v48 = v20;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v64 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v55;
            double v23 = 1.79769313e308;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v55 != v22) {
                  objc_enumerationMutation(v48);
                }
                long long v25 = [v49 pointsFromFeatureWrapper:*(void *)(*((void *)&v54 + 1) + 8 * j)];
                long long v52 = 0u;
                long long v53 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                id v26 = v25;
                uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v63 count:16];
                if (v27)
                {
                  uint64_t v28 = *(void *)v51;
                  do
                  {
                    for (uint64_t k = 0; k != v27; ++k)
                    {
                      if (*(void *)v51 != v28) {
                        objc_enumerationMutation(v26);
                      }
                      double v30 = *(void **)(*((void *)&v50 + 1) + 8 * k);
                      id v31 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
                      [v30 CGPointValue];
                      objc_msgSend(v31, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v9, v11, v32, v33);
                      float v35 = v34;

                      double v36 = v35;
                      if (v23 > v36)
                      {
                        [v30 CGPointValue];
                        double v3 = v37;
                        double v4 = v38;
                        double v23 = v36;
                      }
                    }
                    uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v63 count:16];
                  }
                  while (v27);
                }
              }
              long long v20 = v48;
              uint64_t v21 = [v48 countByEnumeratingWithState:&v54 objects:v64 count:16];
            }
            while (v21);
          }
          else
          {
            double v23 = 1.79769313e308;
          }

          if (v23 >= v12)
          {
            double v23 = v12;
          }
          else
          {
            id v39 = v49;

            double v40 = v4;
            double v41 = v3;
            id v42 = v39;
          }

          double v12 = v23;
        }
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
    }
    while (v44);
  }
  else
  {
    id v42 = 0;
  }

  -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationBeginFromPoint:withRoad:](self, "accessibilityMapsExplorationBeginFromPoint:withRoad:", v42, v41, v40);
}

- (void)accessibilityMapsExplorationBeginFromRoad:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  char v43 = 0;
  double v33 = (id *)a3;
  objc_opt_class();
  double v4 = [v33 accessibilityContainer];
  float v34 = __UIAccessibilityCastAsClass();

  if (!v34) {
    _AXAssert();
  }
  [(VKMapViewAccessibilityElementManager *)self setCurrentMapView:v34];
  [(VKMapViewAccessibilityElementManager *)self explorationLastTouchPoint];
  double v7 = v6;
  double v8 = v5;
  if (v6 == *MEMORY[0x263F00148] && v5 == *(double *)(MEMORY[0x263F00148] + 8))
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = v33[19];
    uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v10)
    {
      uint64_t v31 = *(void *)v40;
      do
      {
        uint64_t v30 = v10;
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(obj);
          }
          double v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v36;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v36 != v15) {
                  objc_enumerationMutation(v13);
                }
                double v17 = *(void **)(*((void *)&v35 + 1) + 8 * j);
                double v18 = [MEMORY[0x263F1C920] mainScreen];
                [v18 bounds];
                CGFloat v20 = v19;
                CGFloat v22 = v21;
                CGFloat v24 = v23;
                CGFloat v26 = v25;
                [v17 CGPointValue];
                v47.double x = v27;
                v47.double y = v28;
                v48.origin.double x = v20;
                v48.origin.double y = v22;
                v48.size.width = v24;
                v48.size.height = v26;
                BOOL v29 = CGRectContainsPoint(v48, v47);

                if (v29)
                {
                  [v17 CGPointValue];
                  -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationBeginFromPoint:withRoad:](self, "accessibilityMapsExplorationBeginFromPoint:withRoad:", v33);

                  goto LABEL_26;
                }
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v44 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v10);
    }
  }
  -[VKMapViewAccessibilityElementManager accessibilityMapsExplorationBeginFromPoint:withRoad:](self, "accessibilityMapsExplorationBeginFromPoint:withRoad:", v33, v7, v8);
LABEL_26:
}

- (void)accessibilityMapsExplorationBeginFromPoint:(CGPoint)a3 withRoad:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v24[2] = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotificationName:@"AXCollapseMapsChromeNotification" object:0];

  [(VKMapViewAccessibilityElementManager *)self accessibilityMapsExplorationEnd];
  [(VKMapViewAccessibilityElementManager *)self setExplorationState:1];
  double v9 = objc_msgSend(v7, "adjacentIntersectorsForPoint:isStart:", 1, x, y);
  if ([v9 count])
  {
    uint64_t v10 = [v9 firstObject];
    double v11 = [v10 featureWrapper];
    double v12 = [(VKMapViewAccessibilityElementManager *)self roadElementForFeatureWrapper:v11];

    if (v12)
    {
      if (!v7) {
        goto LABEL_9;
      }
    }
    else
    {
      id v13 = [VKRoadFeatureAccessibilityElement alloc];
      uint64_t v14 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
      uint64_t v15 = [v10 featureWrapper];
      BOOL v16 = [v15 feature];
      double v12 = [(VKMultiSectionFeatureAccessibilityElement *)v13 initWithAccessibilityContainer:v14 feature:v16 ignoreMissingName:1 useLocalizedLabels:1];

      if (!v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    if (v12)
    {
      double v17 = [AXVKExplorationVertexElement alloc];
      [v10 coordinates];
      double v19 = v18;
      double v21 = v20;
      v24[0] = v7;
      v24[1] = v12;
      CGFloat v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
      double v23 = -[AXVKExplorationVertexElement initWithCoordinates:betweenRoads:](v17, "initWithCoordinates:betweenRoads:", v22, v19, v21);

      [(VKMapViewAccessibilityElementManager *)self accessibilityMapsExplorationContinueWithVertex:v23];
    }
    goto LABEL_9;
  }
  _AXLogWithFacility();
LABEL_10:
}

- (void)accessibilityMapsExplorationContinueWithVertexIndex:(unint64_t)a3
{
  id v8 = [(VKMapViewAccessibilityElementManager *)self neighborExplorationElements];
  unint64_t v5 = [v8 count];

  if (v5 > a3)
  {
    id v9 = [(VKMapViewAccessibilityElementManager *)self neighborExplorationElements];
    double v6 = [v9 objectAtIndex:a3];
    id v7 = [v6 vertex];
    [(VKMapViewAccessibilityElementManager *)self accessibilityMapsExplorationContinueWithVertex:v7];
  }
}

- (void)accessibilityMapsExplorationContinueWithVertex:(id)a3
{
}

- (void)accessibilityMapsExplorationContinueWithVertex:(id)a3 fromVertex:(id)a4
{
  id v12 = a3;
  [(VKMapViewAccessibilityElementManager *)self setExplorationState:1];
  [(VKMapViewAccessibilityElementManager *)self setCurrentExplorationVertex:v12];
  [v12 setIsComputed:0];
  unint64_t v5 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
  [(VKMapViewAccessibilityElementManager *)self explorationZoomLevel];
  float v7 = v6;
  [v12 coordinates];
  objc_msgSend(v5, "accessibilitySetMapZoomLevel:center:yaw:completionHandler:", 0, v7, v8, v9, 0.0);

  uint64_t v10 = +[VKMapDebugView sharedInstance];
  double v11 = [(VKMapViewAccessibilityElementManager *)self currentExplorationVertex];
  [v10 setCurrentExplorationVertex:v11];
}

- (void)accessibilityMapsExplorationBacktrack
{
  id v4 = [(NSMutableArray *)self->_lastExplorationVertices lastObject];
  if ((unint64_t)[(NSMutableArray *)self->_lastExplorationVertices count] >= 2)
  {
    double v3 = [(NSMutableArray *)self->_lastExplorationVertices objectAtIndexedSubscript:[(NSMutableArray *)self->_lastExplorationVertices count] - 2];
    if (!v4) {
      goto LABEL_8;
    }
    if (v3)
    {
      [(NSMutableArray *)self->_lastExplorationVertices removeLastObject];
      [(VKMapViewAccessibilityElementManager *)self accessibilityMapsExplorationContinueWithVertex:v4 fromVertex:v3];
      [(NSMutableArray *)self->_lastExplorationVertices removeLastObject];
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v4)
  {
LABEL_6:
    double v3 = 0;
    [(VKMapViewAccessibilityElementManager *)self accessibilityMapsExplorationContinueWithVertex:v4];
    goto LABEL_8;
  }
  double v3 = 0;
LABEL_8:
}

- (void)addNeighborsAsRelevantFeaturesForVertex:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(VKMapViewAccessibilityElementManager *)self neighborExplorationElements];
  [v5 removeAllObjects];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  float v6 = objc_msgSend(v4, "neighbors", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        double v11 = [VKExplorationAccessibilityElement alloc];
        id v12 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
        id v13 = [(VKExplorationAccessibilityElement *)v11 initWithAccessibilityContainer:v12 andVertex:v10];

        uint64_t v14 = [(VKMapViewAccessibilityElementManager *)self neighborExplorationElements];
        [v14 addObject:v13];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)accessibilityMapsExplorationEnd
{
  id v3 = [(VKMapViewAccessibilityElementManager *)self neighborExplorationElements];
  [v3 removeAllObjects];

  [(VKMapViewAccessibilityElementManager *)self setCurrentExplorationVertex:0];
  [(NSMutableArray *)self->_lastExplorationVertices removeAllObjects];
  [(VKMapViewAccessibilityElementManager *)self setExplorationState:0];
  id v4 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
  -[VKMapViewAccessibilityElementManager updateAccessibilityElementsForMapView:](self, "updateAccessibilityElementsForMapView:");
}

- (void)computeVertex:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v49 = a3;
  id v4 = [(VKMapViewAccessibilityElementManager *)self roadsForVertex:v49];
  [v49 setRoads:v4];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = [v49 roads];
  uint64_t v43 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v59;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v59 != v42) {
          objc_enumerationMutation(obj);
        }
        unint64_t v5 = *(void **)(*((void *)&v58 + 1) + 8 * v45);
        [v49 getScreenPoint];
        uint64_t v44 = objc_msgSend(v5, "adjacentIntersectorsForPoint:isStart:", 0);
        if ([v44 count])
        {
          CGPoint v47 = v5;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v46 = v44;
          uint64_t v6 = [v46 countByEnumeratingWithState:&v54 objects:v65 count:16];
          if (v6)
          {
            uint64_t v48 = *(void *)v55;
            do
            {
              uint64_t v7 = 0;
              do
              {
                if (*(void *)v55 != v48) {
                  objc_enumerationMutation(v46);
                }
                uint64_t v8 = *(void **)(*((void *)&v54 + 1) + 8 * v7);
                long long v50 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                uint64_t v9 = [v49 neighbors];
                uint64_t v10 = [(AXVKExplorationVertexElement *)v9 countByEnumeratingWithState:&v50 objects:v64 count:16];
                if (v10)
                {
                  uint64_t v11 = *(void *)v51;
LABEL_14:
                  uint64_t v12 = 0;
                  while (1)
                  {
                    if (*(void *)v51 != v11) {
                      objc_enumerationMutation(v9);
                    }
                    id v13 = *(void **)(*((void *)&v50 + 1) + 8 * v12);
                    uint64_t v14 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
                    [v8 coordinates];
                    objc_msgSend(v14, "accessibilityConvertCoordinateToWindow:");
                    double v16 = v15;
                    double v18 = v17;

                    [v13 getScreenPoint];
                    if (vabdd_f64(v16, v20) < 0.001 && vabdd_f64(v18, v19) < 0.001) {
                      break;
                    }
                    if (v10 == ++v12)
                    {
                      uint64_t v10 = [(AXVKExplorationVertexElement *)v9 countByEnumeratingWithState:&v50 objects:v64 count:16];
                      if (v10) {
                        goto LABEL_14;
                      }
                      goto LABEL_21;
                    }
                  }
                }
                else
                {
LABEL_21:

                  if ([v8 isDeadEnd])
                  {
                    double v21 = [AXVKExplorationVertexElement alloc];
                    [v8 coordinates];
                    double v23 = v22;
                    double v25 = v24;
                    long long v62 = v47;
                    CGFloat v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];
                    uint64_t v9 = -[AXVKExplorationVertexElement initWithCoordinates:betweenRoads:](v21, "initWithCoordinates:betweenRoads:", v26, v23, v25);
                  }
                  else
                  {
                    CGFloat v27 = [v8 featureWrapper];
                    CGFloat v26 = [(VKMapViewAccessibilityElementManager *)self roadElementForFeatureWrapper:v27];

                    if (!v26)
                    {
                      CGFloat v28 = [VKRoadFeatureAccessibilityElement alloc];
                      BOOL v29 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
                      uint64_t v30 = [v8 featureWrapper];
                      uint64_t v31 = [v30 feature];
                      CGFloat v26 = [(VKMultiSectionFeatureAccessibilityElement *)v28 initWithAccessibilityContainer:v29 feature:v31 ignoreMissingName:1 useLocalizedLabels:1];
                    }
                    double v32 = [AXVKExplorationVertexElement alloc];
                    [v8 coordinates];
                    double v34 = v33;
                    double v36 = v35;
                    v63[0] = v47;
                    v63[1] = v26;
                    long long v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:2];
                    uint64_t v9 = -[AXVKExplorationVertexElement initWithCoordinates:betweenRoads:](v32, "initWithCoordinates:betweenRoads:", v37, v34, v36);
                  }
                  long long v38 = [[AXVKExplorationEdgeElement alloc] initWithRoad:v47 betweenFirstVertex:v49 andSecondVertex:v9];
                  long long v39 = [v49 edges];
                  [v39 addObject:v38];

                  long long v40 = [(AXVKExplorationVertexElement *)v9 edges];
                  [v40 addObject:v38];
                }
                ++v7;
              }
              while (v7 != v6);
              uint64_t v6 = [v46 countByEnumeratingWithState:&v54 objects:v65 count:16];
            }
            while (v6);
          }
        }
        ++v45;
      }
      while (v45 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v43);
  }

  [v49 setIsComputed:1];
}

- (void)setCurrentExplorationVertex:(id)a3
{
  unint64_t v5 = (AXVKExplorationVertexElement *)a3;
  currentExplorationVertedouble x = self->_currentExplorationVertex;
  uint64_t v12 = v5;
  if (currentExplorationVertex != v5)
  {
    if (currentExplorationVertex)
    {
      [(AXVKExplorationVertexElement *)currentExplorationVertex setIsCurrent:0];
      [(NSMutableArray *)self->_lastExplorationVertices addObject:self->_currentExplorationVertex];
      if ((unint64_t)[(NSMutableArray *)self->_lastExplorationVertices count] >= 6) {
        [(NSMutableArray *)self->_lastExplorationVertices removeObjectAtIndex:0];
      }
    }
    objc_storeStrong((id *)&self->_currentExplorationVertex, a3);
    if (v12)
    {
      uint64_t v7 = [VKExplorationAccessibilityElement alloc];
      uint64_t v8 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
      uint64_t v9 = [(VKExplorationAccessibilityElement *)v7 initWithAccessibilityContainer:v8 andVertex:v12];
      currentExplorationElement = self->_currentExplorationElement;
      self->_currentExplorationElement = v9;
    }
    else
    {
      uint64_t v8 = self->_currentExplorationElement;
      self->_currentExplorationElement = 0;
    }

    [(AXVKExplorationVertexElement *)self->_currentExplorationVertex setIsCurrent:1];
    uint64_t v11 = +[VKMapDebugView sharedInstance];
    [v11 setCurrentExplorationVertex:v12];
  }
}

- (void)setExplorationState:(int64_t)a3
{
  self->_explorationState = a3;
  id v4 = [(VKMapViewAccessibilityElementManager *)self delegate];
  [v4 explorationStateChanged:a3];
}

- (id)roadElementForFeatureWrapper:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = [(VKMapViewAccessibilityElementManager *)self accessibilityElements];
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v17 = v5;
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v9 = [v8 featureSet];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v21;
            while (2)
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v21 != v11) {
                  objc_enumerationMutation(v9);
                }
                id v13 = [*(id *)(*((void *)&v20 + 1) + 8 * j) feature];
                uint64_t v14 = [v4 feature];
                char IsSameRoad = GEOMultiSectionFeatureIsSameRoad();

                if (IsSameRoad)
                {

                  goto LABEL_21;
                }
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      id v8 = 0;
    }
    while (v5);
  }
  else
  {
    id v8 = 0;
  }
LABEL_21:

  return v8;
}

- (CGPoint)adjacentPointToPoint:(CGPoint)a3 withOtherPoint:(CGPoint)a4 onRoad:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  id v9 = a5;
  uint64_t v10 = [v9 consolidatedAndOrderedFeatures];
  uint64_t v11 = objc_msgSend(v9, "featureAndPointIndicesForPoint:", v8, v7);
  uint64_t v13 = v12;
  uint64_t v14 = objc_msgSend(v9, "featureAndPointIndicesForPoint:", x, y);
  if (v11 != -1 && v11 == v14)
  {
    uint64_t v16 = v15;
    uint64_t v17 = [v10 objectAtIndex:v11];
    uint64_t v18 = v17;
    if (v16 <= v13)
    {
      if (v16 >= v13)
      {
        double v22 = *MEMORY[0x263F00148];
        double v23 = *(double *)(MEMORY[0x263F00148] + 8);
LABEL_10:

        goto LABEL_11;
      }
      double v19 = [v17 objectAtIndex:v13 - 1];
      [v19 CGPointValue];
    }
    else
    {
      double v19 = [v17 objectAtIndex:v13 + 1];
      [v19 CGPointValue];
    }
    double v22 = v20;
    double v23 = v21;

    goto LABEL_10;
  }
  double v22 = *MEMORY[0x263F00148];
  double v23 = *(double *)(MEMORY[0x263F00148] + 8);
LABEL_11:

  double v24 = v22;
  double v25 = v23;
  result.double y = v25;
  result.double x = v24;
  return result;
}

- (id)accessibilityMapsExplorationCurrentRoadsWithAngles
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v3 = [(VKMapViewAccessibilityElementManager *)self currentExplorationVertex];
  [v3 getScreenPoint];
  double v5 = v4;
  double v7 = v6;

  double v8 = *MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  uint64_t v10 = [(VKMapViewAccessibilityElementManager *)self lastExplorationVertices];
  uint64_t v11 = [v10 lastObject];

  uint64_t v12 = (double *)MEMORY[0x263F00148];
  if (v11)
  {
    uint64_t v13 = [(VKMapViewAccessibilityElementManager *)self currentExplorationVertex];
    uint64_t v14 = [(VKMapViewAccessibilityElementManager *)self edgeBetweenVertex:v13 andVertex:v11];

    [v11 getScreenPoint];
    double v16 = v15;
    double v18 = v17;
    double v19 = [v14 road];
    -[VKMapViewAccessibilityElementManager adjacentPointToPoint:withOtherPoint:onRoad:](self, "adjacentPointToPoint:withOtherPoint:onRoad:", v19, v5, v7, v16, v18);
    double v8 = v20;
    double v9 = v21;

    if (v8 == *v12 && v9 == v12[1])
    {
      [v11 getScreenPoint];
      double v8 = v22;
      double v9 = v23;
    }
  }
  double v24 = objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = [(VKMapViewAccessibilityElementManager *)self neighborExplorationElements];
  uint64_t v25 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v64 != v26) {
          objc_enumerationMutation(obj);
        }
        CGFloat v28 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if (v11)
        {
          BOOL v29 = [(VKMapViewAccessibilityElementManager *)self currentExplorationVertex];
          uint64_t v30 = [v28 vertex];
          uint64_t v31 = [(VKMapViewAccessibilityElementManager *)self edgeBetweenVertex:v29 andVertex:v30];

          double v32 = [v28 vertex];
          [v32 getScreenPoint];
          double v34 = v33;
          double v36 = v35;
          long long v37 = [v31 road];
          -[VKMapViewAccessibilityElementManager adjacentPointToPoint:withOtherPoint:onRoad:](self, "adjacentPointToPoint:withOtherPoint:onRoad:", v37, v5, v7, v34, v36);
          double v39 = v38;
          double v41 = v40;

          if (v39 == *MEMORY[0x263F00148] && v41 == *(double *)(MEMORY[0x263F00148] + 8))
          {
            uint64_t v43 = [v28 vertex];
            [v43 getScreenPoint];
            double v39 = v44;
            double v41 = v45;
          }
          -[VKMapViewAccessibilityElementManager accessibilityAngleWithThreePointsFirst:second:third:inRadians:](self, "accessibilityAngleWithThreePointsFirst:second:third:inRadians:", 1, v8, v9, v5, v7, v39, v41);
          double v47 = v46;
          *(float *)&double v46 = v41 - v7;
          float v48 = v39 - v5;
          float v49 = atan2f(*(float *)&v46, v48);

          double v50 = v49;
        }
        else
        {
          long long v51 = [v28 vertex];
          [v51 getScreenPoint];
          double v53 = v52;
          double v55 = v54;

          float v56 = v55 - v7;
          float v57 = v53 - v5;
          double v50 = atan2f(v56, v57);
          double v47 = v50;
        }
        long long v58 = [NSNumber numberWithDouble:v50];
        v67[0] = v58;
        long long v59 = [(VKMapViewAccessibilityElementManager *)self accessibilityMapsExplorationStringForElement:v28 withRelativeAngle:v47];
        v67[1] = v59;
        long long v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
        [v24 addObject:v60];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v25);
  }

  return v24;
}

- (id)accessibilityMapsExplorationStringForElement:(id)a3 withRelativeAngle:(double)a4
{
  id v6 = a3;
  double v7 = objc_opt_new();
  double v8 = [(VKMapViewAccessibilityElementManager *)self lastExplorationVertices];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = @"DOUBLE_BACK";
    if (a4 >= 0.392699082 && a4 < 5.89048623)
    {
      if (a4 >= 1.17809725)
      {
        if (a4 >= 1.96349541)
        {
          if (a4 >= 2.74889357)
          {
            if (a4 >= 3.53429174)
            {
              if (a4 >= 4.3196899)
              {
                if (a4 >= 5.10508806)
                {
                  if (a4 >= 5.89048623)
                  {
                    uint64_t v11 = 0;
                    goto LABEL_19;
                  }
                  uint64_t v10 = @"HARD_LEFT";
                }
                else
                {
                  uint64_t v10 = @"LEFT";
                }
              }
              else
              {
                uint64_t v10 = @"SLIGHT_LEFT";
              }
            }
            else
            {
              uint64_t v10 = @"CONTINUE_STRAIGHT";
            }
          }
          else
          {
            uint64_t v10 = @"SLIGHT_RIGHT";
          }
        }
        else
        {
          uint64_t v10 = @"RIGHT";
        }
      }
      else
      {
        uint64_t v10 = @"HARD_RIGHT";
      }
    }
    uint64_t v11 = AXVectorKitLocString(v10);
LABEL_19:
    uint64_t v12 = NSString;
    uint64_t v13 = AXVectorKitLocString(@"DIRECTION_FORMAT");
    uint64_t v14 = objc_msgSend(v12, "stringWithFormat:", v13, v11);
    [v7 appendString:v14];
  }
  double v15 = [v6 accessibilityLabel];
  [v7 appendString:v15];

  return v7;
}

- (id)edgeBetweenVertex:(id)a3 andVertex:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [a3 edges];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v11 = objc_msgSend(v10, "vertices", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v18;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v11);
              }
              if (*(id *)(*((void *)&v17 + 1) + 8 * j) == v5)
              {
                id v15 = v10;

                goto LABEL_19;
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      id v15 = 0;
    }
    while (v7);
  }
  else
  {
    id v15 = 0;
  }
LABEL_19:

  return v15;
}

- (double)accessibilityDistanceBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4 onRoad:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  id v10 = a5;
  uint64_t v11 = [v10 consolidatedAndOrderedFeatures];
  uint64_t v12 = objc_msgSend(v10, "featureAndPointIndicesForPoint:", v8, v7);
  uint64_t v14 = v13;
  uint64_t v15 = objc_msgSend(v10, "featureAndPointIndicesForPoint:", x, y);
  double v17 = -1.0;
  if (v12 != -1 && v12 == v15)
  {
    uint64_t v18 = v16;
    long long v19 = [v11 objectAtIndex:v12];
    if (v14 >= v18) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = v14;
    }
    if (v14 > v18) {
      uint64_t v18 = v14;
    }
    double v17 = 0.0;
    if (v20 < v18)
    {
      do
      {
        long long v21 = [v19 objectAtIndex:v20];
        [v21 CGPointValue];
        double v23 = v22;
        double v25 = v24;

        uint64_t v26 = [v19 objectAtIndex:++v20];
        [v26 CGPointValue];
        double v28 = v27;
        double v30 = v29;

        uint64_t v31 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
        objc_msgSend(v31, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v23, v25, v28, v30);
        double v17 = v17 + v32;
      }
      while (v18 != v20);
    }
  }
  return v17;
}

- (id)accessibilityVisiblePOIsBetweenPoint:(CGPoint)a3 andPoint:(CGPoint)a4 onRoad:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v57 = a5;
  long long v64 = objc_opt_new();
  uint64_t v68 = objc_opt_new();
  long long v59 = [v57 consolidatedAndOrderedFeatures];
  uint64_t v10 = objc_msgSend(v57, "featureAndPointIndicesForPoint:", v8, v7);
  uint64_t v65 = v11;
  uint64_t v12 = v10;
  uint64_t v13 = objc_msgSend(v57, "featureAndPointIndicesForPoint:", x, y);
  uint64_t v60 = v14;
  id v15 = 0;
  if (v12 != -1 && v12 == v13)
  {
    long long v61 = [v59 objectAtIndex:v12];
    if (v65 != v60)
    {
      uint64_t v17 = 1;
      if (v65 >= v60) {
        uint64_t v17 = -1;
      }
      uint64_t v58 = v17;
      uint64_t v18 = v65;
      do
      {
        uint64_t v66 = v18;
        long long v19 = objc_msgSend(v61, "objectAtIndex:");
        [v19 CGPointValue];
        double v67 = v20;
        double v22 = v21;

        double v23 = objc_msgSend(v61, "objectAtIndex:");
        [v23 CGPointValue];
        double v25 = v24;
        double v27 = v26;

        double v28 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
        objc_msgSend(v28, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v67, v22, v25, v27);
        float v30 = v29;

        double v31 = v67;
        double v62 = (v27 - v22) / v30 * 50.0;
        double v63 = (v25 - v67) / v30 * 50.0;
        for (double i = v22; ; double i = v62 + i)
        {
          -[VKMapViewAccessibilityElementManager accessibilityAngleWithThreePointsFirst:second:third:inRadians:](self, "accessibilityAngleWithThreePointsFirst:second:third:inRadians:", 1, v67, v22, v25, v27, v31, i);
          if (v33 != 0.0) {
            break;
          }
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          double v34 = [(VKMapViewAccessibilityElementManager *)self accessibilityElements];
          uint64_t v35 = [v34 countByEnumeratingWithState:&v69 objects:v74 count:16];
          if (v35)
          {
            uint64_t v36 = *(void *)v70;
            do
            {
              for (uint64_t j = 0; j != v35; ++j)
              {
                if (*(void *)v70 != v36) {
                  objc_enumerationMutation(v34);
                }
                double v38 = *(void **)(*((void *)&v69 + 1) + 8 * j);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v39 = v38;
                  if ([v39 isPOI])
                  {
                    [v39 location];
                    VKLocationCoordinate2DForVKPoint();
                    double v41 = v40;
                    double v43 = v42;
                    double v44 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
                    objc_msgSend(v44, "accessibilityConvertCoordinateToWindow:", v41, v43);
                    double v46 = v45;
                    double v48 = v47;

                    float v49 = [(VKMapViewAccessibilityElementManager *)self currentMapView];
                    objc_msgSend(v49, "accessibilityRealDistanceBetweenPoint:screenPoint2:", v46, v48, v31, i);
                    if (v50 <= 50.0)
                    {
                      char v51 = [v68 containsObject:v39];

                      if ((v51 & 1) == 0)
                      {
                        -[VKMapViewAccessibilityElementManager accessibilityAngleWithThreePointsFirst:second:third:inRadians:](self, "accessibilityAngleWithThreePointsFirst:second:third:inRadians:", 1, v67, v22, v25, v27, v46, v48);
                        double v53 = v52;
                        if (v66 != v65
                          || (-[VKMapViewAccessibilityElementManager accessibilityAngleWithThreePointsFirst:second:third:inRadians:](self, "accessibilityAngleWithThreePointsFirst:second:third:inRadians:", 1, v25, v27, v67, v22, v46, v48), v54 <= 1.57079633)|| v54 >= 4.71238898)
                        {
                          double v55 = [NSNumber numberWithDouble:v53];
                          v73[0] = v55;
                          v73[1] = v39;
                          float v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:2];
                          [v64 addObject:v56];

                          [v68 addObject:v39];
                        }
                      }
                    }
                    else
                    {
                    }
                  }
                }
              }
              uint64_t v35 = [v34 countByEnumeratingWithState:&v69 objects:v74 count:16];
            }
            while (v35);
          }

          double v31 = v63 + v31;
        }
        uint64_t v18 = v66 + v58;
      }
      while (v66 + v58 != v60);
    }
    id v15 = v64;
  }

  return v15;
}

- (id)accessibilityMapsExplorationDescriptionForAdjacentPOIs:(id)a3
{
  id v3 = a3;
  double v4 = objc_opt_new();
  id v5 = objc_opt_new();
  uint64_t v6 = [v3 count];
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      double v8 = [v3 objectAtIndex:i];
      uint64_t v9 = [v8 firstObject];
      [v9 floatValue];
      float v11 = v10;

      uint64_t v12 = [v3 objectAtIndex:i];
      uint64_t v13 = [v12 objectAtIndex:1];
      uint64_t v14 = [v13 accessibilityLabel];

      if (v11 <= 3.14159265) {
        id v15 = v4;
      }
      else {
        id v15 = v5;
      }
      id v16 = v15;
      [v16 addObject:v14];
    }
  }
  if ((unint64_t)[v4 count] > 2) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = [v4 count];
  }
  uint64_t v18 = objc_msgSend(v4, "subarrayWithRange:", 0, v17);
  long long v19 = AXFormatAndListWithElements();

  if ((unint64_t)[v5 count] > 2) {
    uint64_t v20 = 3;
  }
  else {
    uint64_t v20 = [v5 count];
  }
  double v21 = objc_msgSend(v5, "subarrayWithRange:", 0, v20);
  double v22 = AXFormatAndListWithElements();

  double v23 = objc_opt_new();
  if ([v19 length])
  {
    double v24 = NSString;
    double v25 = AXVectorKitLocString(@"ON_LEFT_FORMAT");
    double v26 = objc_msgSend(v24, "stringWithFormat:", v25, v19);
    [v23 appendString:v26];
  }
  if ([v22 length])
  {
    double v27 = NSString;
    double v28 = AXVectorKitLocString(@"ON_RIGHT_FORMAT");
    float v29 = objc_msgSend(v27, "stringWithFormat:", v28, v22);
    [v23 appendString:v29];
  }

  return v23;
}

- (id)accessibilityMapsExplorationCurrentIntersectionDescription
{
  uint64_t v2 = objc_opt_new();

  return v2;
}

- (id)accessibilityMapsExplorationChangeVerbosityIncreasing:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(VKMapViewAccessibilityElementManager *)self verbosityLevel];
  if (v5 == 2)
  {
    uint64_t v7 = AXVectorKitLocString(@"VERBOSITY_HIGH");
    uint64_t v6 = !v3;
LABEL_11:
    double v8 = (void *)v7;
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  if (v5 == 1)
  {
    uint64_t v7 = AXVectorKitLocString(@"VERBOSITY_AVERAGE");
    if (v3) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    goto LABEL_11;
  }
  if (!v5)
  {
    uint64_t v7 = AXVectorKitLocString(@"VERBOSITY_LOW");
    if (v3) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    goto LABEL_11;
  }
  double v8 = 0;
LABEL_13:
  [(VKMapViewAccessibilityElementManager *)self setVerbosityLevel:v6];

  return v8;
}

- (double)accessibilityAngleWithThreePointsFirst:(CGPoint)a3 second:(CGPoint)a4 third:(CGPoint)a5 inRadians:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v9 = a4.y;
  CGFloat v10 = a4.x;
  double v14 = 0.0;
  double v15 = 0.0;
  AXVKMathGetVectorAndDistanceForPoints(&v15, &v14, a3, a4);
  uint64_t v12 = 0;
  double v13 = 0.0;
  v16.CGFloat x = x;
  v16.CGFloat y = y;
  v17.CGFloat x = v10;
  v17.CGFloat y = v9;
  AXVKMathGetVectorAndDistanceForPoints(&v13, (long double *)&v12, v16, v17);
  double result = v15 - v13;
  if (v15 - v13 < 0.0) {
    double result = v15 - v13 + 360.0;
  }
  if (v6) {
    return result / 180.0 * 3.14159265;
  }
  return result;
}

- (id)roadsForVertex:(id)a3
{
  id v4 = a3;
  [v4 getScreenPoint];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  CGFloat v9 = [(VKMapViewAccessibilityElementManager *)self accessibilityElements];
  CGFloat v10 = (void *)[v9 copy];

  uint64_t v15 = 0;
  CGPoint v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  long long v19 = __Block_byref_object_dispose__3;
  id v20 = (id)objc_opt_new();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__VKMapViewAccessibilityElementManager_roadsForVertex___block_invoke;
  v14[3] = &unk_265162FC0;
  v14[5] = v6;
  v14[6] = v8;
  v14[4] = &v15;
  [v10 enumerateObjectsUsingBlock:v14];
  if (![(id)v16[5] count]) {
    _AXAssert();
  }
  if ([(id)v16[5] count])
  {
    id v11 = (id)v16[5];
  }
  else
  {
    id v11 = [v4 roads];
  }
  uint64_t v12 = v11;
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __55__VKMapViewAccessibilityElementManager_roadsForVertex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((objc_msgSend(v3, "pointInside:", *(double *)(a1 + 40), *(double *)(a1 + 48)) & 1) != 0
     || (objc_msgSend(v3, "pointInside:", *(double *)(a1 + 40) + 1.0, *(double *)(a1 + 48) + 1.0) & 1) != 0
     || (objc_msgSend(v3, "pointInside:", *(double *)(a1 + 40) + 1.0, *(double *)(a1 + 48) + -1.0) & 1) != 0
     || (objc_msgSend(v3, "pointInside:", *(double *)(a1 + 40) + -1.0, *(double *)(a1 + 48) + 1.0) & 1) != 0
     || objc_msgSend(v3, "pointInside:", *(double *)(a1 + 40) + -1.0, *(double *)(a1 + 48) + -1.0)))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

- (id)accessibilityElementsForMapView:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  CGFloat v10 = __Block_byref_object_copy__3;
  id v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  properties_queue = self->_properties_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__VKMapViewAccessibilityElementManager_accessibilityElementsForMapView___block_invoke;
  v6[3] = &unk_265162D40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(properties_queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__VKMapViewAccessibilityElementManager_accessibilityElementsForMapView___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) accessibilityElements];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)boundsForMapView:(id)a3
{
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x5012000000;
  CGPoint v16 = __Block_byref_object_copy__443;
  uint64_t v17 = __Block_byref_object_dispose__444;
  uint64_t v18 = &unk_2426D40D2;
  long long v19 = 0u;
  long long v20 = 0u;
  properties_queue = self->_properties_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__VKMapViewAccessibilityElementManager_boundsForMapView___block_invoke;
  v12[3] = &unk_265162D40;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(properties_queue, v12);
  double v4 = v14[6];
  double v5 = v14[7];
  double v6 = v14[8];
  double v7 = v14[9];
  _Block_object_dispose(&v13, 8);
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  result.double var3 = v11;
  result.double var2 = v10;
  result.double var1 = v9;
  result.double var0 = v8;
  return result;
}

uint64_t __57__VKMapViewAccessibilityElementManager_boundsForMapView___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) bounds];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[6] = v4;
  v3[7] = v5;
  v3[8] = v6;
  v3[9] = v7;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)centerForMapView:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x4012000000;
  uint64_t v15 = __Block_byref_object_copy__446;
  CGPoint v16 = __Block_byref_object_dispose__447;
  uint64_t v17 = &unk_2426D40D2;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  VKLocationCoordinate2DMake();
  uint64_t v18 = v4;
  uint64_t v19 = v5;
  properties_queue = self->_properties_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__VKMapViewAccessibilityElementManager_centerForMapView___block_invoke;
  v11[3] = &unk_265162D40;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(properties_queue, v11);
  double v7 = v13[6];
  double v8 = v13[7];
  _Block_object_dispose(&v12, 8);
  double v9 = v7;
  double v10 = v8;
  result.double var1 = v10;
  result.double var0 = v9;
  return result;
}

uint64_t __57__VKMapViewAccessibilityElementManager_centerForMapView___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) center];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 48) = v4;
  *(void *)(v3 + 56) = v5;
  return result;
}

- (int64_t)orientationForMapView:(id)a3
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1;
  properties_queue = self->_properties_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__VKMapViewAccessibilityElementManager_orientationForMapView___block_invoke;
  v6[3] = &unk_265162D40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(properties_queue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __62__VKMapViewAccessibilityElementManager_orientationForMapView___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) orientation];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)yawForMapView:(id)a3
{
  uint64_t v7 = 0;
  double v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  properties_queue = self->_properties_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__VKMapViewAccessibilityElementManager_yawForMapView___block_invoke;
  v6[3] = &unk_265162D40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(properties_queue, v6);
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __54__VKMapViewAccessibilityElementManager_yawForMapView___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) yaw];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)updateAccessibilityElementsForMapView:(id)a3
{
}

- (void)updateAccessibilityElementsForMapView:(id)a3 isRetry:(BOOL)a4
{
  id v4 = a3;
  if (!v4) {
    _AXAssert();
  }
  _AXLogWithFacility();
  id v5 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _boundsForMapView:*(void *)(a1 + 40)];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [*(id *)(a1 + 32) _centerForMapView:*(void *)(a1 + 40)];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = [*(id *)(a1 + 32) _orientationForMapView:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _yawForMapView:*(void *)(a1 + 40)];
  double v16 = v15;
  [*(id *)(a1 + 32) _zoomForMapView:*(void *)(a1 + 40)];
  int v18 = v17;
  uint64_t v19 = [*(id *)(a1 + 32) _gatherVisibleLabelMarkersForMapView:*(void *)(a1 + 40)];
  long long v20 = [*(id *)(a1 + 32) _gatherVisibleTilesForMapView:*(void *)(a1 + 40)];
  uint64_t v42 = 0;
  double v43 = &v42;
  uint64_t v44 = 0x3032000000;
  double v45 = __Block_byref_object_copy__3;
  double v46 = __Block_byref_object_dispose__3;
  id v47 = 0;
  double v21 = *(void **)(a1 + 32);
  uint64_t v22 = *(void *)(a1 + 40);
  double v23 = [v21 accessibilityElements];
  uint64_t v24 = objc_msgSend(v21, "_accessibilityElementsForMapView:mapViewBounds:visibleLabels:visibleTiles:existingElements:", v22, v19, v20, v23, v3, v5, v7, v9);
  double v25 = (void *)v43[5];
  v43[5] = v24;

  [*(id *)(a1 + 32) _consolidateAccessibilityElements:v43[5]];
  [*(id *)(a1 + 32) _sortAccessibilityElements:v43[5] mapView:*(void *)(a1 + 40)];
  LODWORD(v26) = v18;
  [*(id *)(a1 + 32) _filterAccessibilityElements:v43[5] zoomLevel:*(void *)(a1 + 40) mapView:v26];
  LODWORD(v23) = objc_msgSend(*(id *)(a1 + 32), "_isValidBoundsForMapView:bounds:", *(void *)(a1 + 40), v3, v5, v7, v9);
  LODWORD(v21) = [*(id *)(a1 + 32) _isValidOrientationForMapView:*(void *)(a1 + 40) orientation:v14];
  if ((v23 & v21 & [*(id *)(a1 + 32) _isValidYawForMapView:*(void *)(a1 + 40) yaw:v16]) == 1)
  {
    LOBYTE(v38) = 1;
    _AXLogWithFacility();
    uint64_t v27 = *(void *)(a1 + 32);
    double v28 = *(NSObject **)(v27 + 96);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke_2;
    block[3] = &unk_265162FE8;
    block[4] = v27;
    block[5] = &v42;
    *(double *)&block[6] = v3;
    *(double *)&block[7] = v5;
    *(double *)&block[8] = v7;
    *(double *)&block[9] = v9;
    block[10] = v11;
    block[11] = v13;
    block[12] = v14;
    *(double *)&block[13] = v16;
    dispatch_sync(v28, block);
    float v29 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v38, @"Update request succeeded");
    if ([*(id *)(a1 + 32) explorationState] == 1)
    {
      float v30 = *(void **)(a1 + 32);
      double v31 = [v30 currentExplorationVertex];
      [v30 computeVertex:v31];

      float v32 = *(void **)(a1 + 32);
      double v33 = [v32 currentExplorationVertex];
      [v32 addNeighborsAsRelevantFeaturesForVertex:v33];

      [*(id *)(a1 + 32) setExplorationState:2];
      double v34 = [*(id *)(a1 + 32) currentExplorationElement];
      [v29 setObject:v34 forKey:@"AXVKUpdateAccessibilityElementsFocusedElementKey"];
    }
    uint64_t v35 = [MEMORY[0x263F08A00] defaultCenter];
    [v35 postNotificationName:@"UpdateAccessibilityElementsComplete" object:*(void *)(a1 + 32) userInfo:v29];
  }
  else
  {
    _AXLogWithFacility();
    uint64_t v36 = *(void *)(a1 + 32);
    long long v37 = *(NSObject **)(v36 + 96);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke_3;
    v40[3] = &unk_265162AD8;
    v40[4] = v36;
    dispatch_sync(v37, v40);
    id v39 = *(id *)(a1 + 40);
    AXPerformBlockOnMainThreadAfterDelay();
  }
  _Block_object_dispose(&v42, 8);
}

uint64_t __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAccessibilityElements:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  [*(id *)(a1 + 32) setOrientation:*(void *)(a1 + 96)];
  [*(id *)(a1 + 32) setYaw:*(double *)(a1 + 104)];
  double v2 = *(void **)(a1 + 32);

  return [v2 setUpdating:0];
}

uint64_t __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUpdating:0];
}

uint64_t __86__VKMapViewAccessibilityElementManager_updateAccessibilityElementsForMapView_isRetry___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAccessibilityElementsForMapView:*(void *)(a1 + 40) isRetry:1];
}

- (VKMapViewAccessibilityElementManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)VKMapViewAccessibilityElementManager;
  double v2 = [(VKMapViewAccessibilityElementManager *)&v14 init];
  double v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_bounds.x0 = 0u;
    *(_OWORD *)&v2->_bounds.y0 = 0u;
    VKLocationCoordinate2DMake();
    v3->_center.latitude = v4;
    v3->_center.longitude = v5;
    v3->_orientation = 1;
    v3->_yaw = 0.0;
    v3->_updating = 0;
    dispatch_queue_t v6 = dispatch_queue_create("com.maps.accessibility.properties", 0);
    properties_queue = v3->_properties_queue;
    v3->_properties_queue = (OS_dispatch_queue *)v6;

    *(_OWORD *)&v3->_explorationState = xmmword_2426CBE40;
    currentExplorationVerteCGFloat x = v3->_currentExplorationVertex;
    v3->_currentExplorationVerteCGFloat x = 0;

    uint64_t v9 = objc_opt_new();
    lastExplorationVertices = v3->_lastExplorationVertices;
    v3->_lastExplorationVertices = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    neighborExplorationElements = v3->_neighborExplorationElements;
    v3->_neighborExplorationElements = (NSMutableArray *)v11;

    v3->_explorationZoomLevel = 18.0;
  }
  return v3;
}

- (VKMapViewAccessibilityElementManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VKMapViewAccessibilityElementManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (float)explorationZoomLevel
{
  return self->_explorationZoomLevel;
}

- (void)setExplorationZoomLevel:(float)a3
{
  self->_explorationZoomLevel = a3;
}

- (CGPoint)explorationLastTouchPoint
{
  double x = self->_explorationLastTouchPoint.x;
  double y = self->_explorationLastTouchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setExplorationLastTouchPoint:(CGPoint)a3
{
  self->_explorationLastTouchPoint = a3;
}

- (int64_t)explorationState
{
  return self->_explorationState;
}

- (int64_t)verbosityLevel
{
  return self->_verbosityLevel;
}

- (void)setVerbosityLevel:(int64_t)a3
{
  self->_verbosityLevel = a3;
}

- (AXVKExplorationVertexElement)currentExplorationVertex
{
  return self->_currentExplorationVertex;
}

- (NSMutableArray)lastExplorationVertices
{
  return self->_lastExplorationVertices;
}

- (void)setLastExplorationVertices:(id)a3
{
}

- (VKExplorationAccessibilityElement)currentExplorationElement
{
  return self->_currentExplorationElement;
}

- (void)setCurrentExplorationElement:(id)a3
{
}

- (NSMutableArray)neighborExplorationElements
{
  return self->_neighborExplorationElements;
}

- (void)setNeighborExplorationElements:(id)a3
{
}

- (NSArray)accessibilityElements
{
  return self->_accessibilityElements;
}

- (void)setAccessibilityElements:(id)a3
{
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)bounds
{
  double x0 = self->_bounds.x0;
  double x1 = self->_bounds.x1;
  double y0 = self->_bounds.y0;
  double y1 = self->_bounds.y1;
  result.double var3 = y1;
  result.double var2 = y0;
  result.double var1 = x1;
  result.double var0 = x0;
  return result;
}

- (void)setBounds:(id)a3
{
  self->_bounds = ($2785BDE8E87B0E5EAD863C2AFF5498A8)a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)center
{
  double latitude = self->_center.latitude;
  double longitude = self->_center.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (void)setCenter:(id)a3
{
  self->_center = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  self->_yaw = a3;
}

- (BOOL)isUpdating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (OS_dispatch_queue)properties_queue
{
  return self->_properties_queue;
}

- (void)setProperties_queue:(id)a3
{
}

- (VKMapView)currentMapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentMapView);

  return (VKMapView *)WeakRetained;
}

- (void)setCurrentMapView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentMapView);
  objc_storeStrong((id *)&self->_properties_queue, 0);
  objc_storeStrong((id *)&self->_accessibilityElements, 0);
  objc_storeStrong((id *)&self->_neighborExplorationElements, 0);
  objc_storeStrong((id *)&self->_currentExplorationElement, 0);
  objc_storeStrong((id *)&self->_lastExplorationVertices, 0);
  objc_storeStrong((id *)&self->_currentExplorationVertex, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end