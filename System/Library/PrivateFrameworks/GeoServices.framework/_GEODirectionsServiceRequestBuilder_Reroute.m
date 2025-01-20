@interface _GEODirectionsServiceRequestBuilder_Reroute
- (int)directionsRequestFeedbackPurpose;
- (int)originalWaypointRoutePurpose;
- (void)setMiscFieldsInDirectionsRequest:(id)a3;
- (void)verifyWaypointsForDirectionsRequest:(id)a3;
@end

@implementation _GEODirectionsServiceRequestBuilder_Reroute

- (int)directionsRequestFeedbackPurpose
{
  return 5;
}

- (int)originalWaypointRoutePurpose
{
  if ([(GEODirectionsServiceRequestBuilder *)self _type] == 4) {
    return 1;
  }
  else {
    return 13;
  }
}

- (void)setMiscFieldsInDirectionsRequest:(id)a3
{
  id v4 = a3;
  id v6 = [(GEODirectionsServiceRequestBuilder *)self _parameters];
  [v6 displayRemainingTimeToDestination];
  [v4 setLastEtaDisplayed:v5];
}

- (void)verifyWaypointsForDirectionsRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = objc_msgSend(v3, "originalWaypointRoute", 0);
  double v5 = [v4 routeLegs];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v11 destinationWaypointInfo];
        if (v12)
        {
          v13 = (void *)v12;
          v14 = [v11 destinationWaypointInfo];
          int v15 = [v14 source];

          if (v15 == 2) {
            continue;
          }
        }
        ++v9;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v9 = 1;
  }

  v16 = [v3 originalWaypointRoute];

  if (v16)
  {
    v17 = [v3 waypointTypeds];
    uint64_t v18 = [v17 count];

    if (v18 != v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v19 = [v3 waypointTypeds];
        int v20 = [v19 count];
        v21 = [v3 originalWaypointRoute];
        v22 = [v21 routeLegs];
        int v23 = [v22 count];
        *(_DWORD *)buf = 67109376;
        int v29 = v20;
        __int16 v30 = 1024;
        int v31 = v23;
        _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Mismatched number of waypoints (%d) and legs (%d) in DirectionsRequest. This request will most likely fail.", buf, 0xEu);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: directionsRequest.waypointTypeds.count == expectedWaypointsCount", buf, 2u);
      }
    }
  }
}

@end