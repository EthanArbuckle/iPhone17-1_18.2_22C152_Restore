@interface GEODirectionsServiceRequestBuilder
+ (id)builderForRequestType:(unint64_t)a3;
- (BOOL)shouldAllowTimepoint;
- (BOOL)shouldUseFullLegForOriginalWaypointRoute;
- (GEODirectionsServiceRequestBuilder)initWithType:(unint64_t)a3;
- (id)_geoWaypointTypedForWaypoint:(id)a3 voiceLanguage:(id)a4;
- (id)_parameters;
- (id)_waypoints;
- (id)_waypointsFromCurrentLocationAndRoute;
- (id)_waypointsFromRequestParameters;
- (id)buildDirectionsRequestWithParameters:(id)a3;
- (id)geoOriginalWaypointRoute;
- (id)typedWaypointsForDirectionsRequest;
- (id)waypointsForRoute;
- (int)directionsRequestFeedbackPurpose;
- (int)originalWaypointRoutePurpose;
- (unint64_t)_type;
- (void)_logBuiltDirectionsRequest:(id)a3;
- (void)_populateMiscFieldsInDirectionsRequest:(id)a3;
- (void)_populateOriginalWaypointRouteInDirectionsRequest:(id)a3;
- (void)_populateRouteAttributesInDirectionsRequest:(id)a3;
- (void)_populateWaypointTypedInDirectionsRequest:(id)a3;
@end

@implementation GEODirectionsServiceRequestBuilder

- (GEODirectionsServiceRequestBuilder)initWithType:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsServiceRequestBuilder;
  v4 = [(GEODirectionsServiceRequestBuilder *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v6 = v4;
  }

  return v5;
}

+ (id)builderForRequestType:(unint64_t)a3
{
  if (a3 - 1 > 0xF) {
    goto LABEL_11;
  }
  v4 = (objc_class *)objc_opt_class();
  if (!v4) {
    goto LABEL_11;
  }
  v5 = (void *)[[v4 alloc] initWithType:a3];
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    __int16 v10 = 0;
    v7 = MEMORY[0x1E4F14500];
    objc_super v8 = "Assertion failed: builder != nil";
    for (i = (uint8_t *)&v10; ; i = (uint8_t *)&v11)
    {
      _os_log_fault_impl(&dword_188D96000, v7, OS_LOG_TYPE_FAULT, v8, i, 2u);
      do
      {
LABEL_10:
        __break(1u);
LABEL_11:
        ;
      }
      while (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT));
      __int16 v11 = 0;
      v7 = MEMORY[0x1E4F14500];
      objc_super v8 = "Assertion failed: class != nil";
    }
  }

  return v5;
}

- (id)buildDirectionsRequestWithParameters:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_parameters, a3);
  v6 = [(GEODirectionsServiceRequestBuilder *)self waypointsForRoute];
  objc_storeStrong((id *)&self->_waypoints, v6);
  if ([v6 count])
  {
    v7 = [v5 feedback];
    objc_super v8 = v7;
    if (v7) {
      v9 = v7;
    }
    else {
      v9 = [[GEODirectionsRequestFeedback alloc] initWithPurpose:[(GEODirectionsServiceRequestBuilder *)self directionsRequestFeedbackPurpose]];
    }
    __int16 v11 = v9;

    v13 = [v5 requestingAppIdentifier];
    if (v13)
    {
      [v11 setRequestingAppId:v13];
    }
    else
    {
      v14 = [v11 requestingAppId];
      [v11 setRequestingAppId:v14];
    }
    v15 = +[GEOUserSession sharedInstance];
    v16 = [v15 mapsUserSessionEntity];
    uint64_t v17 = [v16 sessionID];
    uint64_t v19 = v18;

    v20 = -[GEODirectionsRequest initWithFeedback:sessionID:]([GEODirectionsRequest alloc], "initWithFeedback:sessionID:", v11, v17, v19);
    v21 = [v5 commonOptions];
    [(GEODirectionsRequest *)v20 setCommonOptions:v21];

    -[GEODirectionsRequest setMainTransportTypeMaxRouteCount:](v20, "setMainTransportTypeMaxRouteCount:", [v5 maxRouteCount]);
    v22 = [v5 currentLocation];
    [(GEODirectionsRequest *)v20 setCurrentUserLocation:v22];

    v23 = [v5 visibleRegion];
    [(GEODirectionsRequest *)v20 setCurrentMapRegion:v23];

    v24 = [v5 recentLocationHistory];
    [(GEODirectionsRequest *)v20 setRecentLocationHistory:v24];

    [(GEODirectionsServiceRequestBuilder *)self _populateRouteAttributesInDirectionsRequest:v20];
    [(GEODirectionsServiceRequestBuilder *)self _populateWaypointTypedInDirectionsRequest:v20];
    [(GEODirectionsServiceRequestBuilder *)self _populateOriginalWaypointRouteInDirectionsRequest:v20];
    [(GEODirectionsServiceRequestBuilder *)self _populateMiscFieldsInDirectionsRequest:v20];
    [(GEODirectionsServiceRequestBuilder *)self verifyWaypointsForDirectionsRequest:v20];
    [(GEODirectionsServiceRequestBuilder *)self _logBuiltDirectionsRequest:v20];
    v12 = +[GEODirectionsServiceRequestBuilderResult resultWithWaypoints:v6 directionsRequest:v20];
  }
  else
  {
    __int16 v10 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Error: Invalid waypoints on GEODirectionsServiceRequestParameters.", v26, 2u);
    }

    __int16 v11 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:@"Invalid waypoints on GEODirectionsServiceRequestParameters."];
    v12 = +[GEODirectionsServiceRequestBuilderResult resultWithError:v11];
  }

  return v12;
}

- (void)_populateRouteAttributesInDirectionsRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  v6 = [v5 routeAttributes];
  v7 = (void *)[v6 copy];

  if (![(GEODirectionsServiceRequestBuilder *)self shouldAllowTimepoint])
  {
    memset(v9, 0, sizeof(v9));
    [v7 setTimepoint:v9];
    [v7 setHasTimepoint:0];
  }
  objc_super v8 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  objc_msgSend(v7, "setMainTransportType:", objc_msgSend(v8, "transportType"));

  [v4 setRouteAttributes:v7];
}

- (void)_populateWaypointTypedInDirectionsRequest:(id)a3
{
  id v4 = a3;
  id v6 = [(GEODirectionsServiceRequestBuilder *)self typedWaypointsForDirectionsRequest];
  id v5 = (void *)[v6 mutableCopy];
  [v4 setWaypointTypeds:v5];
}

- (void)_populateOriginalWaypointRouteInDirectionsRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(GEODirectionsServiceRequestBuilder *)self geoOriginalWaypointRoute];
  [v4 setOriginalWaypointRoute:v5];
}

- (void)_populateMiscFieldsInDirectionsRequest:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_opt_new();
  id v5 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  objc_msgSend(v6, "setHasVisitedFirstStop:", objc_msgSend(v5, "hasVisitedFirstStop"));

  [v4 setTripInfo:v6];
  [(GEODirectionsServiceRequestBuilder *)self setMiscFieldsInDirectionsRequest:v4];
}

- (id)_geoWaypointTypedForWaypoint:(id)a3 voiceLanguage:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = a3;
    a3 = [v6 geoWaypointTyped];
    v7 = [v6 mapItemStorage];

    if (v7)
    {
      objc_super v8 = objc_alloc_init(GEOWaypointNameProperties);
      v9 = [v7 contactName];
      uint64_t v10 = [v9 length];

      if (v10) {
        goto LABEL_7;
      }
      if ([v7 _hasTransit])
      {
        __int16 v11 = [v7 _transitInfo];
        v12 = [v11 displayName];
        uint64_t v13 = [v12 length];

        if (v13) {
          goto LABEL_7;
        }
      }
      v14 = [v7 name];
      uint64_t v15 = [v14 length];

      if (v15) {
LABEL_7:
      }
        [(GEOWaypointNameProperties *)v8 setHasDisplayName:1];
      v16 = [v7 addressObject];
      uint64_t v17 = [v16 shortAddress];
      uint64_t v18 = [v17 length];

      if (v18) {
        [(GEOWaypointNameProperties *)v8 setHasDisplayAddress:1];
      }
      if ([v5 length])
      {
        uint64_t v19 = [v7 contactSpokenName];
        uint64_t v20 = [v19 length];

        if (v20) {
          goto LABEL_13;
        }
        v21 = [v7 spokenNameForLocale:v5];
        uint64_t v22 = [v21 length];

        if (v22
          || +[GEODirectionsService canSpeakWrittenPlaceNames](GEODirectionsService, "canSpeakWrittenPlaceNames")&& ([v7 name], v29 = objc_claimAutoreleasedReturnValue(), uint64_t v30 = objc_msgSend(v29, "length"), v29, v30))
        {
LABEL_13:
          [(GEOWaypointNameProperties *)v8 setHasSpokenName:1];
        }
        v23 = [v7 _spokenAddressForLocale:v5];
        uint64_t v24 = [v23 length];

        if (v24
          || +[GEODirectionsService canSpeakWrittenAddresses](GEODirectionsService, "canSpeakWrittenAddresses")&& ([v7 addressObject], v25 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v25, "shortAddress"), v26 = objc_claimAutoreleasedReturnValue(), uint64_t v27 = objc_msgSend(v26, "length"), v26, v25, v27))
        {
          [(GEOWaypointNameProperties *)v8 setHasSpokenAddress:1];
        }
      }
      [a3 setWaypointNameProperties:v8];
    }
  }

  return a3;
}

- (void)_logBuiltDirectionsRequest:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = [v3 waypointTypeds];
  id v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = objc_msgSend(v3, "waypointTypeds", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v17 + 1) + 8 * v11) loggingDescription];
        if (v12) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v9);
  }

  uint64_t v13 = GEOGetDirectionsServiceLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v3 waypointTypeds];
    int v15 = [v14 count];
    v16 = [v6 componentsJoinedByString:@"\n\t"];
    *(_DWORD *)buf = 67109378;
    int v22 = v15;
    __int16 v23 = 2112;
    uint64_t v24 = v16;
    _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_DEFAULT, "Built directions request with %d waypoints:\n\t%@", buf, 0x12u);
  }
}

- (id)waypointsForRoute
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = objc_opt_class();
  }
  return 0;
}

- (id)typedWaypointsForDirectionsRequest
{
  int v3 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  uint64_t v4 = [v3 routeAttributes];
  uint64_t v5 = [v4 phoneticLocaleIdentifier];

  id v6 = [(GEODirectionsServiceRequestBuilder *)self _waypoints];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__GEODirectionsServiceRequestBuilder_typedWaypointsForDirectionsRequest__block_invoke;
  v10[3] = &unk_1E53E9AC0;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v6, "_geo_compactMap:", v10);

  return v8;
}

id __72__GEODirectionsServiceRequestBuilder_typedWaypointsForDirectionsRequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isServerProvidedWaypoint])
  {
    uint64_t v4 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [v3 name];
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Not adding server waypoint \"%@\" to directions request.", (uint8_t *)&v10, 0xCu);
    }
LABEL_13:
    id v7 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = [*(id *)(a1 + 32) _geoWaypointTypedForWaypoint:v3 voiceLanguage:*(void *)(a1 + 40)];
  if (!v6)
  {
    uint64_t v4 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "Error getting waypointTyped from GEOComposedWaypoint. Ignoring waypoint: %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_13;
  }
  id v7 = (void *)v6;
  if ([*(id *)(a1 + 32) _type] == 7 && (objc_msgSend(v7, "hasWaypointStatus") & 1) == 0)
  {
    uint64_t v4 = GEOGetDirectionsServiceLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    LOWORD(v10) = 0;
    goto LABEL_20;
  }
  if ([*(id *)(a1 + 32) _type] != 7 && objc_msgSend(v7, "hasWaypointStatus"))
  {
    uint64_t v4 = GEOGetDirectionsServiceLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      goto LABEL_15;
    }
    LOWORD(v10) = 0;
LABEL_20:
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v10, 2u);
    goto LABEL_14;
  }
LABEL_15:

  return v7;
}

- (int)directionsRequestFeedbackPurpose
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = objc_opt_class();
  }
  return 0;
}

- (BOOL)shouldAllowTimepoint
{
  return 0;
}

- (int)originalWaypointRoutePurpose
{
  return 0;
}

- (BOOL)shouldUseFullLegForOriginalWaypointRoute
{
  return 1;
}

- (id)geoOriginalWaypointRoute
{
  uint64_t v3 = [(GEODirectionsServiceRequestBuilder *)self originalWaypointRoutePurpose];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
    uint64_t v6 = [v5 currentRoute];

    if (!v6)
    {
      uint64_t v30 = 0;
      goto LABEL_24;
    }
    id v7 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
    uint64_t v8 = [v7 routeCoordinate];

    LODWORD(v9) = HIDWORD(v8);
    if (*((float *)&v8 + 1) < 0.0)
    {
      int v10 = GEOGetDirectionsServiceLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v32 = 0;
      }

      uint64_t v8 = 0;
    }
    id v11 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
    unint64_t v12 = [v11 startingLegIndex];

    BOOL v13 = [(GEODirectionsServiceRequestBuilder *)self shouldUseFullLegForOriginalWaypointRoute];
    v14 = [v6 legs];
    unint64_t v15 = [v14 count];

    if (v13)
    {
      if (v12 < v15)
      {
        v16 = [v6 legs];
        long long v17 = [v16 objectAtIndexedSubscript:v12];
        uint64_t v18 = [v17 startRouteCoordinate];

LABEL_17:
        uint64_t v26 = 0;
LABEL_22:

        goto LABEL_23;
      }
      unint64_t v22 = [v6 legIndexForRouteCoordinate:v8];
      __int16 v23 = [v6 legs];
      unint64_t v24 = [v23 count];

      if (v22 < v24)
      {
        v25 = [v6 legs];
        v16 = [v25 objectAtIndexedSubscript:v22];

        uint64_t v18 = [v16 startRouteCoordinate];
        goto LABEL_17;
      }
LABEL_18:
      uint64_t v26 = 0;
      uint64_t v18 = v8;
LABEL_23:
      v28 = [(GEODirectionsServiceRequestBuilder *)self _waypoints];
      v29 = [v28 firstObject];
      uint64_t v30 = [v6 geoOriginalWaypointRouteFromRouteCoordinate:v18 purpose:v4 userPosition:v8 origin:v29 startPathSegment:v26];

LABEL_24:
      goto LABEL_25;
    }
    if (v12 >= v15) {
      goto LABEL_18;
    }
    long long v19 = [v6 legs];
    v16 = [v19 objectAtIndexedSubscript:v12];

    uint64_t v20 = [v16 startRouteCoordinate];
    uint64_t v18 = v20;
    if (v20 == v8)
    {
      LODWORD(v21) = HIDWORD(v20);
      if (*((float *)&v20 + 1) == *((float *)&v8 + 1) || *((float *)&v20 + 1) >= *((float *)&v8 + 1)) {
        goto LABEL_21;
      }
    }
    else if (v20 >= v8)
    {
LABEL_21:
      uint64_t v27 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
      uint64_t v26 = [v27 pathSegment];

      uint64_t v8 = v18;
      goto LABEL_22;
    }
    uint64_t v18 = v8;
    goto LABEL_21;
  }
  uint64_t v30 = 0;
LABEL_25:

  return v30;
}

- (unint64_t)_type
{
  return self->_type;
}

- (id)_parameters
{
  return self->_parameters;
}

- (id)_waypoints
{
  return self->_waypoints;
}

- (id)_waypointsFromRequestParameters
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  uint64_t v4 = [v3 waypoints];

  if ([v4 count])
  {
    if ([v4 count] != 1) {
      goto LABEL_11;
    }
    uint64_t v5 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
    uint64_t v6 = [v5 currentLocation];

    if (!v6)
    {
      id v7 = GEOGetDirectionsServiceLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
      }
    }
    uint64_t v8 = [GEOComposedWaypoint alloc];
    double v9 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
    int v10 = [v9 currentLocation];
    id v11 = [(GEOComposedWaypoint *)v8 initWithLocation:v10 isCurrentLocation:1];

    unint64_t v12 = objc_msgSend(v4, "firstObject", v11);
    v16[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

    uint64_t v4 = (void *)v13;
  }
  else
  {
    id v11 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = GEODirectionsServiceRequestTypeAsString([(GEODirectionsServiceRequestBuilder *)self _type]);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v14;
    }
  }

LABEL_11:

  return v4;
}

- (id)_waypointsFromCurrentLocationAndRoute
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  uint64_t v4 = [v3 currentLocation];

  uint64_t v5 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  uint64_t v6 = [v5 currentRoute];

  if (!v4 || !v6)
  {
    id v7 = GEOGetDirectionsServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = GEODirectionsServiceRequestTypeAsString([(GEODirectionsServiceRequestBuilder *)self _type]);
      int v23 = 138412290;
      unint64_t v24 = v8;
    }
  }
  double v9 = [MEMORY[0x1E4F1CA48] array];
  if (v6)
  {
    int v10 = [[GEOComposedWaypoint alloc] initWithLocation:v4 isCurrentLocation:1];
    [v9 addObject:v10];
    id v11 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
    uint64_t v12 = [v11 startingLegIndex];

    uint64_t v13 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
    v14 = v13;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v15 = objc_msgSend(v6, "waypointsFromRouteCoordinate:", objc_msgSend(v13, "routeCoordinate"));
      [v9 addObjectsFromArray:v15];
    }
    else
    {
      unint64_t v17 = [v13 startingLegIndex];

      while (1)
      {
        uint64_t v18 = [v6 legs];
        unint64_t v19 = [v18 count];

        if (v17 >= v19) {
          break;
        }
        uint64_t v20 = [v6 legs];
        double v21 = [v20 objectAtIndexedSubscript:v17];
        unint64_t v22 = [v21 destination];
        [v9 addObject:v22];

        ++v17;
      }
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypoints, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

uint64_t __83___GEODirectionsServiceRequestBuilder_EditRoute_typedWaypointsForDirectionsRequest__block_invoke(uint64_t a1, void *a2)
{
  return [a2 geoWaypointTyped];
}

@end