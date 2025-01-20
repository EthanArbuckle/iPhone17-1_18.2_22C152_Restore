@interface GEOSharedNavState(ReceiverCapabilities)
- (BOOL)requiresChangesForCompatibilityWithReceiverCapabilities:()ReceiverCapabilities;
- (id)instanceCompatibleWithReceiverCapabilities:()ReceiverCapabilities;
@end

@implementation GEOSharedNavState(ReceiverCapabilities)

- (BOOL)requiresChangesForCompatibilityWithReceiverCapabilities:()ReceiverCapabilities
{
  id v4 = a3;
  BOOL v5 = (![v4 supportsRoutingPathLeg] || GEOConfigGetBOOL())
    && ([a1 hasRouteInfo] & 1) != 0
    || (![v4 supportsWaypointRouteSharing] || GEOConfigGetBOOL())
    && (([a1 hasRouteInfo] & 1) != 0
     || [a1 waypointInfosCount]
     || [a1 etaInfosCount]);

  return v5;
}

- (id)instanceCompatibleWithReceiverCapabilities:()ReceiverCapabilities
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__8;
  v22 = __Block_byref_object_dispose__8;
  id v23 = a1;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__GEOSharedNavState_ReceiverCapabilities__instanceCompatibleWithReceiverCapabilities___block_invoke;
  v17[3] = &unk_1E617EA30;
  v17[4] = v23;
  v17[5] = &v18;
  BOOL v5 = (void (**)(void))MEMORY[0x1BA9C2AF0](v17);
  if (![(id)v19[5] hasRouteInfo]) {
    goto LABEL_7;
  }
  if (GEOConfigGetBOOL()) {
    goto LABEL_3;
  }
  if ([v4 supportsRoutingPathLeg])
  {
    v6 = v5[2](v5);
    v7 = [v6 routeInfo];
    [v7 clearCoordinates];
    goto LABEL_6;
  }
  if (([v4 supportsRoutingPathLeg] & 1) == 0)
  {
LABEL_3:
    v6 = v5[2](v5);
    v7 = [v6 routeInfo];
    [v7 clearRoutingPathLegs];
LABEL_6:
  }
LABEL_7:
  if (([(id)v19[5] hasRouteInfo] & 1) != 0
    || [(id)v19[5] waypointInfosCount]
    || [(id)v19[5] etaInfosCount])
  {
    if (GEOConfigGetBOOL()) {
      goto LABEL_11;
    }
    if ([v4 supportsWaypointRouteSharing])
    {
      v8 = v5[2](v5);
      v14 = [v8 routeInfo];
      [v14 clearChargingStations];

      [v8 setDestinationInfo:0];
LABEL_21:

      goto LABEL_22;
    }
    if (([v4 supportsWaypointRouteSharing] & 1) == 0)
    {
LABEL_11:
      v8 = v5[2](v5);
      if ([v8 arrived] && objc_msgSend(v8, "isNavigatingToIntermediateStop")) {
        [v8 setArrived:0];
      }
      [v8 clearWaypointInfos];
      v9 = [v8 finalETAInfo];
      if (v9)
      {
        v10 = [v8 lastLocation];
        if ([v10 hasCoordinate])
        {
          v11 = [v10 coordinate];
          [v11 lat];
          objc_msgSend(v9, "setLatitude:");

          v12 = [v10 coordinate];
          [v12 lng];
          objc_msgSend(v9, "setLongitude:");

          [v8 setLastLocation:0];
        }
        v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
        [v8 setEtaInfos:v13];
      }
      goto LABEL_21;
    }
  }
LABEL_22:
  id v15 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v15;
}

@end