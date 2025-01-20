@interface VKRouteContext(MKMapViewRouteContextUpdates)
- (uint64_t)_setRouteContextInspectedSegmentIndex:()MKMapViewRouteContextUpdates inspectedStepIndex:;
- (void)_setAlternateRouteContextAnnotationETAComparison:()MKMapViewRouteContextUpdates forRoute:;
- (void)_setRouteContextAnnotationFocus:()MKMapViewRouteContextUpdates forRoute:;
- (void)_setRouteContextAnnotationText:()MKMapViewRouteContextUpdates advisoryStyleAttributes:forRoute:;
- (void)_setRouteContextAnnotationText:()MKMapViewRouteContextUpdates etaType:tollCurrency:advisoryStyleAttributes:forRoute:;
- (void)_setRouteContextAnnotationText:()MKMapViewRouteContextUpdates tollCurrency:forRoute:;
- (void)_setRouteContextAnnotationTexts:()MKMapViewRouteContextUpdates forLegsInRoute:;
- (void)_updateWaypointCaptions;
@end

@implementation VKRouteContext(MKMapViewRouteContextUpdates)

- (uint64_t)_setRouteContextInspectedSegmentIndex:()MKMapViewRouteContextUpdates inspectedStepIndex:
{
  objc_msgSend(a1, "setInspectedSegmentIndex:");

  return [a1 setInspectedStepIndex:a4];
}

- (void)_setRouteContextAnnotationText:()MKMapViewRouteContextUpdates etaType:tollCurrency:advisoryStyleAttributes:forRoute:
{
  id v15 = a3;
  id v12 = a6;
  v13 = [a1 _routeInfoForRoute:a7];
  if (a4 || v12)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB3A80]) initWithEtaText:v15 etaAdvisoryStyleAttributes:v12 routeEtaType:a4];
    [v13 setEtaDescription:v14];
  }
  else
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB3A80]) initWithEtaText:v15 glyphType:a5 != 0];
    [v13 setEtaDescription:v14];
  }
}

- (void)_setRouteContextAnnotationText:()MKMapViewRouteContextUpdates tollCurrency:forRoute:
{
  id v10 = a3;
  v8 = [a1 _routeInfoForRoute:a5];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4FB3A80]) initWithEtaText:v10 glyphType:a4 != 0];
  [v8 setEtaDescription:v9];
}

- (void)_setRouteContextAnnotationText:()MKMapViewRouteContextUpdates advisoryStyleAttributes:forRoute:
{
  id v11 = a3;
  id v8 = a4;
  v9 = [a1 _routeInfoForRoute:a5];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB3A80]) initWithEtaText:v11 etaAdvisoryStyleAttributes:v8];
  [v9 setEtaDescription:v10];
}

- (void)_setRouteContextAnnotationTexts:()MKMapViewRouteContextUpdates forLegsInRoute:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _routeInfoForRoute:v7];
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v10 = [v6 count];
  id v11 = [v7 legs];
  uint64_t v12 = [v11 count];

  if (v10 == v12)
  {
    v13 = [v7 legs];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __95__VKRouteContext_MKMapViewRouteContextUpdates___setRouteContextAnnotationTexts_forLegsInRoute___block_invoke;
    v18 = &unk_1E54BC430;
    id v19 = v6;
    id v20 = v9;
    [v13 enumerateObjectsUsingBlock:&v15];
  }
  v14 = objc_msgSend(v9, "copy", v15, v16, v17, v18);
  [v8 setRouteLegEtaAnnotations:v14];
}

- (void)_setRouteContextAnnotationFocus:()MKMapViewRouteContextUpdates forRoute:
{
  id v5 = [a1 _routeInfoForRoute:a4];
  [v5 setHasFocus:a3];
}

- (void)_setAlternateRouteContextAnnotationETAComparison:()MKMapViewRouteContextUpdates forRoute:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = objc_msgSend(a1, "alternateRoutes", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v11 route];
        BOOL v13 = v12 == v6;

        if (v13)
        {
          [v11 setEtaComparisionToMain:a3];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_updateWaypointCaptions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v1 = [a1 routeInfo];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = objc_msgSend(v1, "waypoints", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v6 type] == 2)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v7 = [v1 route];
            uint64_t v8 = [v6 waypoint];
            uint64_t v9 = [(id)v7 waypointDisplayInfoForWaypoint:v8];

            uint64_t v10 = [v9 waypointCaption];
            LOBYTE(v7) = v10 == 0;

            if (v7)
            {
              id v11 = v6;
              id v12 = NSString;
              BOOL v13 = [v11 chargeInfo];
              [v13 chargingTime];
              long long v15 = objc_msgSend(v12, "_navigation_stringWithSeconds:abbreviated:", (unint64_t)v14, 1);
              [v11 setChargeTimeText:v15];
            }
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
}

@end