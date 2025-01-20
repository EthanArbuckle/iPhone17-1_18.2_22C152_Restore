@interface GEOSharedNavState(MSPExtras)
- (BOOL)hasEtaInfo;
- (BOOL)hasWaypointInfos;
- (BOOL)updateFromTraffic:()MSPExtras;
- (id)composedRoute;
- (id)composedRouteIfExists;
- (id)destinationName;
- (id)destinationWaypointInfo;
- (id)destinationWaypointMapItem;
- (id)equalityTest;
- (id)etaInfo;
- (id)finalETAInfo;
- (id)mspDescription;
- (id)nextWaypointInfo;
- (id)senderName;
- (id)senderNameOrHandle;
- (uint64_t)isNavigatingToIntermediateStop;
- (uint64_t)numberOfIntermediateStopsRemaining;
- (uint64_t)stripArrivedOrClosedTrip;
- (uint64_t)stripForSendingArrival;
- (uint64_t)stripForSendingResuming;
- (uint64_t)stripForSendingStoppedSharing;
- (uint64_t)stripForSendingUpdatedETA;
- (uint64_t)stripForSendingUpdatedRoute;
- (uint64_t)stripForSendingUpdatedTraffic;
- (uint64_t)stripForSendingUpdatedWaypoints;
- (uint64_t)updateWaypointsFromComposedRoute:()MSPExtras;
- (void)_createPlaceholderETAInfosForWaypoints:()MSPExtras;
- (void)_msp_logWithCategory:()MSPExtras type:object:prefix:;
- (void)merge:()MSPExtras;
- (void)setComposedRoute:()MSPExtras;
- (void)truncatePointDataForPrivacy;
- (void)updateRouteInfoFromComposedRoute:()MSPExtras;
@end

@implementation GEOSharedNavState(MSPExtras)

- (id)destinationName
{
  v1 = [a1 destinationWaypointInfo];
  v2 = [v1 name];

  return v2;
}

- (id)destinationWaypointInfo
{
  if ([a1 waypointInfosCount])
  {
    v2 = [a1 waypointInfos];
    id v3 = [v2 lastObject];

    uint64_t v4 = [v3 mapItemStorage];
    if (v4)
    {
      v5 = (void *)v4;
      goto LABEL_8;
    }
    v6 = [v3 chargingStationInfo];

    if (v6) {
      goto LABEL_9;
    }
  }
  id v3 = [a1 destinationInfo];

  if (!v3) {
    goto LABEL_9;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F64A40]);
  v5 = [a1 destinationInfo];
  [v3 setMapItemStorage:v5];
LABEL_8:

LABEL_9:

  return v3;
}

- (id)destinationWaypointMapItem
{
  v1 = [a1 destinationWaypointInfo];
  v2 = [v1 mapItemStorage];

  return v2;
}

- (id)senderName
{
  v2 = [a1 senderInfo];
  if ([v2 hasLocalContactIdentifier])
  {

LABEL_4:
    v5 = [a1 senderInfo];
    v6 = [v5 localName];

    goto LABEL_6;
  }
  id v3 = [a1 senderInfo];
  int v4 = [v3 hasFromDisplayName];

  if (v4) {
    goto LABEL_4;
  }
  v6 = 0;
LABEL_6:

  return v6;
}

- (id)senderNameOrHandle
{
  v1 = [a1 senderInfo];
  v2 = [v1 localName];

  return v2;
}

- (void)merge:()MSPExtras
{
  id v4 = a3;
  if ([v4 hasDestinationInfo])
  {
    v5 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "Migrating legacy destinationInfo to modern waypointInfos", buf, 2u);
    }

    [a1 clearWaypointInfos];
    id v6 = objc_alloc_init(MEMORY[0x1E4F64A40]);
    v7 = [v4 destinationInfo];
    [v6 setMapItemStorage:v7];

    [a1 addWaypointInfo:v6];
    [a1 setDestinationInfo:0];
  }
  if (([v4 hasLastLocation] & 1) == 0 && objc_msgSend(v4, "etaInfosCount") == 1)
  {
    v8 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_DEFAULT, "Migrating legacy location in etaInfo to modern lastLocation", v41, 2u);
    }

    v9 = [v4 etaInfos];
    v10 = [v9 lastObject];

    if ([v10 hasLatitude] && objc_msgSend(v10, "hasLongitude"))
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F64A20]);
      id v12 = objc_alloc_init(MEMORY[0x1E4F64638]);
      [v10 latitude];
      objc_msgSend(v12, "setLat:");
      [v10 longitude];
      objc_msgSend(v12, "setLng:");
      [v11 setCoordinate:v12];
      [v4 setLastLocation:v11];
      [v10 setHasLatitude:0];
      [v10 setHasLongitude:0];
    }
  }
  v13 = [a1 composedRouteIfExists];

  if (v13)
  {
    if ([v4 hasRouteInfo])
    {
      v14 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v40 = 0;
        v15 = "Clearing generated composedRoute because incoming state has routeInfo";
        v16 = (uint8_t *)&v40;
LABEL_21:
        _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    if ([v4 waypointInfosCount])
    {
      uint64_t v17 = [v4 waypointInfosCount];
      if (v17 != [a1 waypointInfosCount])
      {
        v14 = MSPGetSharedTripLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v39) = 0;
          v15 = "Clearing generated composedRoute because incoming waypoint count differs from ours";
          v16 = (uint8_t *)&v39;
          goto LABEL_21;
        }
LABEL_22:

        [a1 setComposedRoute:0];
      }
    }
  }
  if (!objc_msgSend(v4, "hasRouteInfo", v39)) {
    goto LABEL_31;
  }
  char v18 = [a1 hasRouteInfo];
  v19 = [v4 routeInfo];
  v20 = v19;
  if (v18)
  {
    if ([v19 coordinatesCount])
    {
    }
    else
    {
      v21 = [v4 routeInfo];
      uint64_t v22 = [v21 routingPathLegsCount];

      if (!v22)
      {
        v32 = [a1 routeInfo];
        v33 = [v4 routeInfo];
        uint64_t v34 = [v33 trafficColors];
        v35 = [v4 routeInfo];
        objc_msgSend(v32, "setTrafficColors:count:", v34, objc_msgSend(v35, "trafficColorsCount"));

        v20 = [a1 routeInfo];
        v36 = [v4 routeInfo];
        uint64_t v37 = [v36 trafficColorOffsets];
        v38 = [v4 routeInfo];
        objc_msgSend(v20, "setTrafficColorOffsets:count:", v37, objc_msgSend(v38, "trafficColorOffsetsCount"));

        goto LABEL_30;
      }
    }
    v20 = [v4 routeInfo];
  }
  [a1 setRouteInfo:v20];
LABEL_30:

LABEL_31:
  if ([v4 etaInfosCount])
  {
    v23 = [v4 etaInfos];
    v24 = (void *)[v23 mutableCopy];
    [a1 setEtaInfos:v24];
  }
  if ([v4 hasSenderInfo])
  {
    v25 = [a1 senderInfo];

    if (v25)
    {
      v26 = [a1 senderInfo];
      v27 = [v4 senderInfo];
      [v26 merge:v27];
    }
    else
    {
      v26 = [v4 senderInfo];
      [a1 setSenderInfo:v26];
    }
  }
  if ([v4 hasArrived]) {
    objc_msgSend(a1, "setArrived:", objc_msgSend(v4, "arrived"));
  }
  if ([v4 hasArrivedTimestamp])
  {
    [v4 arrivedTimestamp];
    objc_msgSend(a1, "setArrivedTimestamp:");
  }
  if ([v4 hasClosed]) {
    objc_msgSend(a1, "setClosed:", objc_msgSend(v4, "closed"));
  }
  if ([v4 hasClosedTimestamp])
  {
    [v4 closedTimestamp];
    objc_msgSend(a1, "setClosedTimestamp:");
  }
  if ([v4 hasGroupIdentifier])
  {
    v28 = [v4 groupIdentifier];
    [a1 setGroupIdentifier:v28];
  }
  if ([v4 hasReferenceFrame]) {
    objc_msgSend(a1, "setReferenceFrame:", objc_msgSend(v4, "referenceFrame"));
  }
  if ([v4 hasMuted]) {
    objc_msgSend(a1, "setMuted:", objc_msgSend(v4, "muted"));
  }
  if ([v4 hasUpdatedTimestamp])
  {
    [v4 updatedTimestamp];
    objc_msgSend(a1, "setUpdatedTimestamp:");
  }
  if ([v4 hasTransportType]) {
    objc_msgSend(a1, "setTransportType:", objc_msgSend(v4, "transportType"));
  }
  if ([v4 waypointInfosCount])
  {
    v29 = [v4 waypointInfos];
    v30 = (void *)[v29 mutableCopy];
    [a1 setWaypointInfos:v30];
  }
  if ([v4 hasLastLocation])
  {
    v31 = [v4 lastLocation];
    [a1 setLastLocation:v31];
  }
  if ([v4 hasCurrentWaypointIndex]) {
    objc_msgSend(a1, "setCurrentWaypointIndex:", objc_msgSend(v4, "currentWaypointIndex"));
  }
  if ([v4 hasResumed]) {
    objc_msgSend(a1, "setResumed:", objc_msgSend(v4, "resumed"));
  }
  if ([v4 hasClosureReason]) {
    objc_msgSend(a1, "setClosureReason:", objc_msgSend(v4, "closureReason"));
  }
}

- (id)mspDescription
{
  v30 = NSString;
  v29 = [a1 groupIdentifier];
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 updatedTimestamp];
  v28 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 localUpdatedTimestamp];
  uint64_t v34 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  if ([a1 closed]) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  v33 = v4;
  uint64_t v27 = [a1 closureReason];
  v31 = [a1 senderInfo];
  v32 = [v31 localName];
  v25 = [a1 destinationName];
  uint64_t v24 = [a1 waypointInfosCount];
  uint64_t v22 = [a1 currentWaypointIndex];
  if ([a1 arrived]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v21 = v5;
  id v6 = [a1 lastLocation];
  v26 = [a1 etaInfos];
  v7 = [v26 valueForKeyPath:@"mspDescription"];
  v8 = NSNumber;
  v23 = [a1 routeInfo];
  v9 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v23, "coordinatesCount"));
  v10 = NSNumber;
  v20 = [a1 routeInfo];
  id v11 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v20, "routingPathLegsCount"));
  id v12 = NSNumber;
  v13 = [a1 routeInfo];
  v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "trafficColorsCount"));
  if ([a1 muted]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  v16 = v15;
  if ([a1 resumed]) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  objc_msgSend(v30, "stringWithFormat:", @"<%p groupID %@, last updated %@, local updated %@, closed %@ (reason: %lu), localName \"%@\", destination \"%@\" (%lu waypoints), current waypoint: %lu, reached %@, location %@, eta %@, (coords %@pt, routingPathLegs %@), traffic colors %@, muted %@, resumed %@", a1, v29, v28, v34, v33, v27, v32, v25, v24, v22, v21, v6, v7, v9, v11, v14,
    v16,
  char v18 = v17);

  return v18;
}

- (void)_msp_logWithCategory:()MSPExtras type:object:prefix:
{
  uint64_t v169 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    MSPGetSharedTripLog();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v10;
  if (os_log_type_enabled(v13, a4))
  {
    id v14 = v11;
    if (v14)
    {
      v15 = [NSString stringWithFormat:@"%@<%p>", objc_opt_class(), v14];
    }
    else
    {
      v15 = @"<nil>";
    }

    v101 = v15;
    v16 = &stru_1F11F3CF0;
    if (v12) {
      v16 = v12;
    }
    v70 = v16;
    v100 = [a1 groupIdentifier];
    int v83 = [a1 hasTransportType];
    v84 = v12;
    if (v83)
    {
      uint64_t v17 = [a1 transportType];
      if (v17 >= 7)
      {
        v92 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
        goto LABEL_15;
      }
      char v18 = off_1E617C828[(int)v17];
    }
    else
    {
      char v18 = @"n/a";
    }
    v92 = v18;
LABEL_15:
    int v82 = [a1 hasUpdatedTimestamp];
    if (v82)
    {
      v19 = (void *)MEMORY[0x1E4F1C9C8];
      [a1 updatedTimestamp];
      objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
      v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v91 = @"n/a";
    }
    v20 = @"n/a";
    int v80 = [a1 hasLocalUpdatedTimestamp];
    id v85 = v11;
    if (v80)
    {
      v21 = (void *)MEMORY[0x1E4F1C9C8];
      [a1 localUpdatedTimestamp];
      objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
      v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v90 = @"n/a";
    }
    if ([a1 hasSenderInfo]) {
      uint64_t v22 = @"YES";
    }
    else {
      uint64_t v22 = @"NO";
    }
    v99 = v22;
    v79 = [a1 senderInfo];
    if ([v79 hasFromDisplayName]) {
      v23 = @"YES";
    }
    else {
      v23 = @"NO";
    }
    v98 = v23;
    v78 = [a1 senderInfo];
    uint64_t v24 = [v78 fromDisplayName];
    v77 = (void *)v24;
    if (v24) {
      v25 = (__CFString *)v24;
    }
    else {
      v25 = @"n/a";
    }
    v64 = v25;
    v76 = [a1 senderInfo];
    if ([v76 hasFromIdentifier]) {
      v26 = @"YES";
    }
    else {
      v26 = @"NO";
    }
    v97 = v26;
    v75 = [a1 senderInfo];
    uint64_t v27 = [v75 fromIdentifier];
    v74 = (void *)v27;
    if (v27) {
      v28 = (__CFString *)v27;
    }
    else {
      v28 = @"n/a";
    }
    v62 = v28;
    v73 = [a1 senderInfo];
    if ([v73 hasLocalName]) {
      v29 = @"YES";
    }
    else {
      v29 = @"NO";
    }
    v96 = v29;
    v72 = [a1 senderInfo];
    uint64_t v30 = [v72 localName];
    v71 = (void *)v30;
    if (v30) {
      v31 = (__CFString *)v30;
    }
    else {
      v31 = @"n/a";
    }
    v60 = v31;
    v69 = [a1 senderInfo];
    if ([v69 hasLocalContactIdentifier]) {
      v32 = @"YES";
    }
    else {
      v32 = @"NO";
    }
    v106 = v32;
    v68 = [a1 senderInfo];
    uint64_t v33 = [v68 localContactIdentifier];
    v67 = (void *)v33;
    if (v33) {
      uint64_t v34 = (__CFString *)v33;
    }
    else {
      uint64_t v34 = @"n/a";
    }
    v59 = v34;
    int v66 = [a1 hasArrived];
    if (v66)
    {
      if ([a1 arrived]) {
        v35 = @"YES";
      }
      else {
        v35 = @"NO";
      }
      v20 = v35;
    }
    int v65 = [a1 hasArrivedTimestamp];
    if (v65)
    {
      v36 = (void *)MEMORY[0x1E4F1C9C8];
      [a1 arrivedTimestamp];
      objc_msgSend(v36, "dateWithTimeIntervalSinceReferenceDate:");
      v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v89 = @"n/a";
    }
    int v63 = [a1 hasClosed];
    if (v63)
    {
      if ([a1 closed]) {
        uint64_t v37 = @"YES";
      }
      else {
        uint64_t v37 = @"NO";
      }
      v88 = v37;
    }
    else
    {
      v88 = @"n/a";
    }
    int v61 = [a1 hasClosedTimestamp];
    os_log_type_t type = a4;
    if (v61)
    {
      v38 = (void *)MEMORY[0x1E4F1C9C8];
      [a1 closedTimestamp];
      objc_msgSend(v38, "dateWithTimeIntervalSinceReferenceDate:");
      v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v87 = @"n/a";
    }
    int v58 = [a1 hasClosureReason];
    v95 = v20;
    if (v58)
    {
      objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "closureReason"));
      v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v86 = @"n/a";
    }
    v94 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "etaInfosCount"));
    v57 = [a1 etaInfos];
    id v105 = [v57 valueForKey:@"mspDescription"];
    v93 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "waypointInfosCount"));
    v56 = [a1 waypointInfos];
    id v104 = [v56 valueForKey:@"name"];
    if ([a1 hasLastLocation]) {
      uint64_t v39 = @"YES";
    }
    else {
      uint64_t v39 = @"NO";
    }
    v103 = v39;
    v55 = [a1 lastLocation];
    id v102 = [v55 mspDescription];
    __int16 v40 = NSNumber;
    v54 = [a1 routeInfo];
    v41 = objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v54, "routingPathLegsCount"));
    v42 = NSNumber;
    v43 = [a1 routeInfo];
    v44 = objc_msgSend(v42, "numberWithUnsignedInteger:", objc_msgSend(v43, "coordinatesCount"));
    v45 = NSNumber;
    v46 = [a1 routeInfo];
    v47 = objc_msgSend(v45, "numberWithUnsignedInteger:", objc_msgSend(v46, "trafficColorsCount"));
    v48 = NSNumber;
    v49 = [a1 routeInfo];
    v50 = objc_msgSend(v48, "numberWithUnsignedInteger:", objc_msgSend(v49, "trafficColorOffsetsCount"));
    int v51 = [a1 hasReferenceFrame];
    if (v51)
    {
      uint64_t v52 = [a1 referenceFrame];
      if (v52 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v52);
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = off_1E617C860[(int)v52];
      }
    }
    else
    {
      v53 = @"n/a";
    }
    v110 = v70;
    v124 = v64;
    v128 = v62;
    v132 = v60;
    v136 = v59;
    __int16 v123 = 2113;
    __int16 v127 = 2113;
    __int16 v131 = 2113;
    __int16 v135 = 2113;
    __int16 v149 = 2113;
    __int16 v153 = 2113;
    __int16 v157 = 2113;
    v134 = v106;
    v138 = v95;
    v140 = v89;
    v142 = v88;
    v146 = v86;
    v148 = v94;
    id v150 = v105;
    id v154 = v104;
    v156 = v103;
    id v158 = v102;
    v162 = v44;
    v164 = v47;
    v166 = v50;
    __int16 v109 = 2114;
    __int16 v111 = 2114;
    __int16 v113 = 2114;
    __int16 v115 = 2114;
    __int16 v117 = 2114;
    __int16 v119 = 2114;
    __int16 v121 = 2114;
    __int16 v125 = 2114;
    __int16 v129 = 2114;
    __int16 v133 = 2114;
    __int16 v137 = 2114;
    __int16 v139 = 2114;
    __int16 v141 = 2114;
    __int16 v143 = 2114;
    __int16 v145 = 2114;
    __int16 v147 = 2114;
    __int16 v151 = 2114;
    __int16 v155 = 2114;
    __int16 v159 = 2114;
    __int16 v161 = 2114;
    __int16 v163 = 2114;
    __int16 v165 = 2114;
    __int16 v167 = 2114;
    *(_DWORD *)buf = 138551043;
    v108 = v101;
    v112 = v100;
    v114 = v92;
    v116 = v91;
    v118 = v90;
    v120 = v99;
    v122 = v98;
    v126 = v97;
    v130 = v96;
    v144 = v87;
    v152 = v93;
    v160 = v41;
    v168 = v53;
    _os_log_impl(&dword_1B87E5000, v13, type, "[%{public}@] %{public}@\n== Trip %{public}@ ====\n\ttransportType: %{public}@, lastUpdated: %{public}@, locallyUpdated: %{public}@\n\tsenderInfo: %{public}@, fromDisplayName: %{public}@ [ %{private}@ ], fromIdentifier: %{public}@ [ %{private}@ ], localName: %{public}@ [ %{private}@ ], localContactIdentifier: %{public}@ [ %{private}@ ]\n\tarrived: %{public}@, arrivedTimestamp: %{public}@, closed: %{public}@, closedTimestamp: %{public}@, closureReason: %{public}@\n\tETAs: %{public}@ %{private}@\n\twaypoints: %{public}@ %{private}@\n\tlocation: %{public}@ %{private}@ \n\troute: routingPathLegs: %{public}@, coordinates: %{public}@, trafficColors: %{public}@, trafficOffsets: %{public}@, referenceFrame: %{public}@\n================", buf, 0x138u);
    if (v51) {

    }
    if (v58) {
    id v12 = v84;
    }
    id v11 = v85;
    if (v61) {

    }
    if (v63) {
    if (v65)
    }

    if (v66) {
    if (v80)
    }

    if (v82) {
    if (v83)
    }
  }
}

- (void)truncatePointDataForPrivacy
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v2 = MSPGetSharedTripLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  id v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "truncatePointDataForPrivacy", (const char *)&unk_1B8876199, buf, 2u);
  }

  id v6 = [a1 composedRoute];
  if (v6)
  {
    unint64_t v61 = v3 - 1;
    v7 = [a1 lastLocation];
    v8 = [v7 coordinate];
    if (!v7)
    {
      v9 = [a1 etaInfo];
      id v10 = v9;
      if (v9 && [v9 hasLatitude] && objc_msgSend(v10, "hasLongitude"))
      {
        v7 = objc_alloc_init(MEMORY[0x1E4F64A20]);
        id v11 = objc_alloc_init(MEMORY[0x1E4F64638]);

        [v7 setCoordinate:v11];
        [v10 latitude];
        objc_msgSend(v11, "setLat:");
        [v10 longitude];
        objc_msgSend(v11, "setLng:");
        v8 = v11;
      }
      else
      {
        v7 = 0;
      }
    }
    v62 = v8;
    if (v8)
    {
      [v8 lat];
      double v15 = v14;
      [v8 lng];
      unint64_t v17 = objc_msgSend(v6, "closestPointOnRoute:", v15, v16);
      unsigned int v18 = v17;
      unint64_t v19 = HIDWORD(v17);
      v20 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v69 = v18;
        _os_log_impl(&dword_1B87E5000, v20, OS_LOG_TYPE_DEBUG, "truncatePointDataForPrivacy closest index %lu, sourced from route + latlng", buf, 0xCu);
      }
    }
    else
    {
      unsigned int v18 = *MEMORY[0x1E4F64198];
      unint64_t v19 = *(unsigned int *)(MEMORY[0x1E4F64198] + 4);
    }
    os_signpost_id_t spid = v3;
    if (GEOPolylineCoordinateIsInvalid())
    {
      v21 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        int v22 = [v7 hasMatchedCoordinate];
        v23 = @"NO";
        if (v22) {
          v23 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        unint64_t v69 = (unint64_t)v23;
        uint64_t v24 = v23;
        _os_log_impl(&dword_1B87E5000, v21, OS_LOG_TYPE_DEBUG, "truncatePointDataForPrivacy no valid closest index, will use whole route (sender provided: %@)", buf, 0xCu);
      }
      unint64_t v19 = 0;
      unsigned int v18 = 0;
    }
    uint64_t v25 = v18;
    unint64_t v26 = v18 | (v19 << 32);
    if (GEOPolylineCoordinateIsInvalid())
    {
      uint64_t v27 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B87E5000, v27, OS_LOG_TYPE_ERROR, "truncatePointDataForPrivacy early exit: closestPointOnRoute returned GEOPolylineCoordinateInvalid", buf, 2u);
      }

      v28 = v5;
      v29 = v28;
      uint64_t v30 = v62;
      if (v61 > 0xFFFFFFFFFFFFFFFDLL)
      {

        v31 = v29;
      }
      else
      {
        if (os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B87E5000, v29, OS_SIGNPOST_EVENT, spid, "truncatePointDataForPrivacy_EarlyExit_GEOPolylineCoordinateInvalid", (const char *)&unk_1B8876199, buf, 2u);
        }

        v31 = v29;
        if (os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B87E5000, v31, OS_SIGNPOST_INTERVAL_END, spid, "truncatePointDataForPrivacy", (const char *)&unk_1B8876199, buf, 2u);
        }
      }
      goto LABEL_67;
    }
    v31 = [a1 routeInfo];
    if (!v31)
    {
      v32 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B87E5000, v32, OS_LOG_TYPE_ERROR, "truncatePointDataForPrivacy: missing routeInfo, creating on-demand", buf, 2u);
      }

      v31 = objc_alloc_init(MEMORY[0x1E4F64A28]);
      [a1 setRouteInfo:v31];
    }
    if ([v6 usesRoutingPathPoints])
    {
      uint64_t v33 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B87E5000, v33, OS_LOG_TYPE_DEBUG, "truncatePointDataForPrivacy truncating routingPathLeg from closest coordinate", buf, 2u);
      }

      uint64_t v34 = [v6 routingPathDataFromStart:v18 | (v19 << 32)];
      v35 = (void *)[v34 mutableCopy];
      [v31 setRoutingPathLegs:v35];
    }
    [v31 clearCoordinates];
    unsigned int v36 = [v6 pointCount];
    if (v36)
    {
      unsigned int v37 = v36;
      int v38 = [v6 pointCount];
      uint64_t v39 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v69 = v37;
        __int16 v70 = 2048;
        uint64_t v71 = (2 * v38);
        _os_log_impl(&dword_1B87E5000, v39, OS_LOG_TYPE_DEBUG, "truncatePointDataForPrivacy composed route coordinates count %lu (%lu)", buf, 0x16u);
      }

      __int16 v40 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v69) = v18;
        _os_log_impl(&dword_1B87E5000, v40, OS_LOG_TYPE_DEBUG, "index for current location %u", buf, 8u);
      }

      unsigned int v41 = v37 - v18;
      if (v37 <= v18)
      {
        v57 = MSPGetSharedTripLog();
        uint64_t v30 = v62;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B87E5000, v57, OS_LOG_TYPE_ERROR, "truncatePointDataForPrivacy early exit: index > number of coordinates", buf, 2u);
        }

        int v58 = v5;
        v59 = v58;
        if (v61 > 0xFFFFFFFFFFFFFFFDLL)
        {

          v47 = v59;
        }
        else
        {
          if (os_signpost_enabled(v58))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B87E5000, v59, OS_SIGNPOST_EVENT, spid, "truncatePointDataForPrivacy_EarlyExit_NumberOfCoordinates", (const char *)&unk_1B8876199, buf, 2u);
          }

          v47 = v59;
          if (os_signpost_enabled(v47))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B87E5000, v47, OS_SIGNPOST_INTERVAL_END, spid, "truncatePointDataForPrivacy", (const char *)&unk_1B8876199, buf, 2u);
          }
        }
        goto LABEL_65;
      }
      do
      {
        [v6 pointAt:v25];
        double v43 = v42;
        -[NSObject addCoordinates:](v31, "addCoordinates:");
        [v31 addCoordinates:v43];
        ++v25;
        --v41;
      }
      while (v41);
      v44 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v45 = (unint64_t)(float)((float)(unint64_t)[v31 coordinatesCount]
                                      * 0.5);
        uint64_t v46 = [v31 coordinatesCount];
        *(_DWORD *)buf = 134218240;
        unint64_t v69 = v45;
        __int16 v70 = 2048;
        uint64_t v71 = v46;
        _os_log_impl(&dword_1B87E5000, v44, OS_LOG_TYPE_DEBUG, "truncatePointDataForPrivacy route info coordinates after truncation count %lu (%lu)", buf, 0x16u);
      }
    }
    [v31 clearTrafficColors];
    [v31 clearTrafficColorOffsets];
    v47 = [v6 truncatedTrafficFromRouteCoordinate:v26];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v48 = [v47 routeTrafficColors];
    uint64_t v49 = [v48 countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v64 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          -[NSObject addTrafficColor:](v31, "addTrafficColor:", [v53 color]);
          [v53 offsetMeters];
          [v31 addTrafficColorOffset:v54];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v63 objects:v67 count:16];
      }
      while (v50);
    }

    v55 = v5;
    v56 = v55;
    if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B87E5000, v56, OS_SIGNPOST_INTERVAL_END, spid, "truncatePointDataForPrivacy", (const char *)&unk_1B8876199, buf, 2u);
    }

    uint64_t v30 = v62;
LABEL_65:

LABEL_67:
    goto LABEL_68;
  }
  id v12 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_ERROR, "truncatePointDataForPrivacy early exit: no composed route to truncate", buf, 2u);
  }

  v13 = v5;
  v7 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B87E5000, v7, OS_SIGNPOST_INTERVAL_END, v3, "truncatePointDataForPrivacy", (const char *)&unk_1B8876199, buf, 2u);
  }
LABEL_68:
}

- (uint64_t)updateWaypointsFromComposedRoute:()MSPExtras
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v3 = [a3 legs];
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  double v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = v3;
  id v6 = (void *)v4;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v44 objects:v48 count:16];
  double v43 = (void *)v4;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v12 = objc_alloc_init(MEMORY[0x1E4F64A40]);
        [v6 addObject:v12];
        v13 = [v11 destination];
        double v14 = [v13 uniqueWaypointID];

        if (v14)
        {
          double v15 = [v11 destination];
          double v16 = [v15 uniqueWaypointID];

          unint64_t v17 = objc_msgSend(MEMORY[0x1E4F29128], "_geo_uuidForData:", v16);
          unsigned int v18 = [v17 UUIDString];
        }
        else
        {
          double v16 = [MEMORY[0x1E4F29128] UUID];
          unsigned int v18 = [v16 UUIDString];
        }

        [v12 setUniqueIdentifier:v18];
        unint64_t v19 = [v11 destination];
        v20 = [v11 destination];
        v21 = [v20 chargingInfo];

        if (v21)
        {
          id v22 = objc_alloc_init(MEMORY[0x1E4F64A10]);
          objc_msgSend(v22, "setMuid:", objc_msgSend(v21, "muid"));
          v23 = [v21 name];
          uint64_t v24 = (void *)[v23 copy];
          [v22 setName:v24];

          [v21 chargingTime];
          objc_msgSend(v22, "setChargingTime:");
          [v12 setChargingStationInfo:v22];
          [v42 addObject:v22];
        }
        else
        {
          uint64_t v25 = [v19 geoMapItem];

          if (!v25) {
            goto LABEL_14;
          }
          unint64_t v26 = (void *)MEMORY[0x1E4F646E0];
          uint64_t v27 = [v19 geoMapItem];
          id v22 = [v26 mapItemStorageForGEOMapItem:v27 forUseType:2];

          [v12 setMapItemStorage:v22];
        }

        id v6 = v43;
LABEL_14:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v8);
  }

  uint64_t v28 = [v6 count];
  if (v28 != [a1 waypointInfosCount]) {
    goto LABEL_20;
  }
  v29 = [a1 waypointInfos];
  unint64_t v30 = v6;
  unint64_t v31 = v29;
  if (!(v30 | v31)
    || (v32 = (void *)v31,
        char v33 = [(id)v30 isEqual:v31],
        v32,
        (id)v30,
        v32,
        (v33 & 1) != 0))
  {
    uint64_t v34 = 0;
  }
  else
  {
LABEL_20:
    [a1 setWaypointInfos:v6];
    [a1 setCurrentWaypointIndex:0];
    [a1 _createPlaceholderETAInfosForWaypoints:v6];
    v35 = [a1 waypointInfos];
    unsigned int v36 = [v35 lastObject];
    unsigned int v37 = [v36 mapItemStorage];
    [a1 setDestinationInfo:v37];

    id v6 = v43;
    int v38 = [a1 routeInfo];
    [v38 setChargingStations:v42];

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(a1, "setUpdatedTimestamp:");
    uint64_t v34 = 1;
  }

  return v34;
}

- (void)_createPlaceholderETAInfosForWaypoints:()MSPExtras
{
  id v4 = a3;
  [a1 clearEtaInfos];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__GEOSharedNavState_MSPExtras___createPlaceholderETAInfosForWaypoints___block_invoke;
  v5[3] = &unk_1E617C7C0;
  v5[4] = a1;
  [v4 enumerateObjectsUsingBlock:v5];
}

- (void)updateRouteInfoFromComposedRoute:()MSPExtras
{
  objc_msgSend(a1, "setComposedRoute:");
  id v2 = objc_alloc_init(MEMORY[0x1E4F64A28]);
  [a1 setRouteInfo:v2];
  [a1 truncatePointDataForPrivacy];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(a1, "setUpdatedTimestamp:");
}

- (BOOL)updateFromTraffic:()MSPExtras
{
  unint64_t v4 = a3;
  id v5 = [a1 composedRoute];
  id v6 = [v5 mutableData];
  uint64_t v7 = [v6 traffic];
  BOOL v8 = (v4 | v7) != 0;
  if (!(v4 | v7))
  {

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v9 = (void *)v7;
  char v10 = [(id)v7 isEqual:v4];

  if ((v10 & 1) == 0)
  {
    id v11 = [a1 composedRoute];
    id v12 = [v11 mutableData];
    [v12 setTraffic:v4];

    [a1 truncatePointDataForPrivacy];
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(a1, "setUpdatedTimestamp:");
    goto LABEL_6;
  }
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

- (void)setComposedRoute:()MSPExtras
{
}

- (id)composedRoute
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 composedRouteIfExists];
  if (!v2)
  {
    os_signpost_id_t v3 = [a1 routeInfo];
    unint64_t v4 = [v3 routingPathLegs];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      if (![v3 coordinatesCount])
      {
LABEL_40:
        id v2 = 0;
LABEL_48:

        goto LABEL_49;
      }
      v13 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v59 = [v3 coordinatesCount];
        _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_DEFAULT, "Building composedRoute from routeInfo (%lu coordinates)", buf, 0xCu);
      }

      unint64_t v14 = (unint64_t)[v3 coordinatesCount] >> 1;
      id v15 = objc_alloc_init(MEMORY[0x1E4F64998]);
      double v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v3, "coordinates"), 16 * v14);
      [v15 setUnpackedLatLngVertices:v16];

      objc_msgSend(v15, "setTrafficColors:count:", objc_msgSend(v3, "trafficColors"), objc_msgSend(v3, "trafficColorsCount"));
      objc_msgSend(v15, "setTrafficColorOffsets:count:", objc_msgSend(v3, "trafficColorOffsets"), objc_msgSend(v3, "trafficColorOffsetsCount"));
      id v17 = objc_alloc_init(MEMORY[0x1E4F64A78]);
      [v17 setManeuverStartZilchIndex:0];
      uint64_t v18 = (v14 - 1);
      [v17 setManeuverEndBasicIndex:v18];
      [v17 setManeuverEndZilchIndex:v18];
      [v15 addStep:v17];
      if ([v15 hasUnpackedLatLngVertices])
      {
        [v15 coordinateAt:0];
        v21 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithLatitude:v19 longitude:v20];
        id v22 = (void *)[objc_alloc(MEMORY[0x1E4F644F0]) initWithLocation:v21 isCurrentLocation:1];
        id v23 = objc_alloc(MEMORY[0x1E4F644F0]);
        uint64_t v24 = [a1 destinationWaypointMapItem];
        uint64_t v25 = (void *)[v23 initWithMapItem:v24];

        v57[0] = v22;
        v57[1] = v25;
        unint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
        uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F649D0]) initWithWaypoints:v26 routeAttributes:0 directionsResponse:0];
      }
      else
      {
        uint64_t v27 = 0;
      }
      id v51 = objc_alloc_init(MEMORY[0x1E4F64C00]);
      [v51 addRouteLeg:v15];
      id v2 = (void *)[objc_alloc(MEMORY[0x1E4F644A0]) initWithGeoWaypointRoute:v51 initializerData:v27];

LABEL_47:
      [a1 setComposedRoute:v2];
      goto LABEL_48;
    }
    id v6 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v59 = [v3 routingPathLegsCount];
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEFAULT, "Building composedRoute from routeInfo (%lu routingPathLegs)", buf, 0xCu);
    }

    uint64_t v7 = [v3 trafficColorsCount];
    if (v7 != [v3 trafficColorOffsetsCount])
    {
      BOOL v8 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = [v3 trafficColorsCount];
        int v10 = [v3 trafficColorOffsetsCount];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v59 = v9;
        *(_WORD *)&v59[4] = 1024;
        *(_DWORD *)&v59[6] = v10;
        _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_ERROR, "SharedNavRouteInfo traffic colors count (%d) is not equal to traffic color offsets count (%d). Attempting to continue anyway", buf, 0xEu);
      }
    }
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    if ([a1 waypointInfosCount]) {
      uint64_t v12 = [a1 waypointInfosCount];
    }
    else {
      uint64_t v12 = 1;
    }
    id v15 = (id)[v11 initWithCapacity:v12];
    if ([a1 waypointInfosCount])
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v28 = objc_msgSend(a1, "waypointInfos", 0);
      v29 = (void *)[v28 copy];

      uint64_t v30 = [v29 countByEnumeratingWithState:&v53 objects:v63 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v54 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            id v35 = objc_alloc(MEMORY[0x1E4F644F0]);
            unsigned int v36 = [v34 mapItemStorage];
            unsigned int v37 = (void *)[v35 initWithMapItem:v36];

            [v15 addObject:v37];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v53 objects:v63 count:16];
        }
        while (v31);
      }
    }
    else
    {
      if (![a1 hasDestinationInfo]) {
        goto LABEL_29;
      }
      id v38 = objc_alloc(MEMORY[0x1E4F644F0]);
      v29 = [a1 destinationWaypointMapItem];
      uint64_t v39 = (void *)[v38 initWithMapItem:v29];
      [v15 addObject:v39];
    }
LABEL_29:
    unint64_t v40 = [v3 routingPathLegsCount];
    if (v40 != [v15 count] && objc_msgSend(v15, "count") > v40)
    {
      unint64_t v41 = [v15 count] - v40;
      double v42 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = [v15 count];
        *(_DWORD *)buf = 134218496;
        *(void *)v59 = v40;
        *(_WORD *)&v59[8] = 2048;
        uint64_t v60 = v43;
        __int16 v61 = 2048;
        unint64_t v62 = v41;
        _os_log_impl(&dword_1B87E5000, v42, OS_LOG_TYPE_DEFAULT, "Found %lu routingPathLegs for %lu waypoints, dropping %lu leading waypoints", buf, 0x20u);
      }

      objc_msgSend(v15, "removeObjectsInRange:", 0, v41);
    }
    if (![v15 count] || !v40 || v40 > objc_msgSend(v15, "count"))
    {
      long long v44 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        uint64_t v45 = [v15 count];
        *(_DWORD *)buf = 134218240;
        *(void *)v59 = v40;
        *(_WORD *)&v59[8] = 2048;
        uint64_t v60 = v45;
        _os_log_impl(&dword_1B87E5000, v44, OS_LOG_TYPE_ERROR, "Cannot create composedRoute from %lu routingPathLegs and %lu waypoints", buf, 0x16u);
      }

      goto LABEL_40;
    }
    id v17 = (id)objc_opt_new();
    objc_msgSend(v17, "setTransportType:", objc_msgSend(a1, "transportType"));
    id v46 = objc_alloc(MEMORY[0x1E4F648E0]);
    long long v47 = [v3 routingPathLegs];
    v48 = (void *)[v46 initWithRawData:v47];
    [v17 setRawRouteGeometry:v48];

    [v17 setDestinations:v15];
    [v17 setIsOriginCurrentLocation:1];
    [v17 setSource:4];
    unint64_t v49 = [v3 trafficColorsCount];
    if (v49 >= [v3 trafficColorOffsetsCount]) {
      uint64_t v50 = [v3 trafficColorOffsetsCount];
    }
    else {
      uint64_t v50 = [v3 trafficColorsCount];
    }
    objc_msgSend(v17, "setTrafficColors:offsets:count:", objc_msgSend(v3, "trafficColors"), objc_msgSend(v3, "trafficColorOffsets"), v50);
    id v2 = [v17 buildRoute];
    goto LABEL_47;
  }
LABEL_49:

  return v2;
}

- (id)composedRouteIfExists
{
  return objc_getAssociatedObject(a1, sel_composedRoute);
}

- (id)equalityTest
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__GEOSharedNavState_MSPExtras__equalityTest__block_invoke;
  v3[3] = &unk_1E617C7E8;
  v3[4] = a1;
  v1 = (void *)MEMORY[0x1BA9C2AF0](v3);

  return v1;
}

- (uint64_t)stripArrivedOrClosedTrip
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (![a1 arrived]
    || [a1 hasClosed] && (objc_msgSend(a1, "closed") & 1) != 0
    || (uint64_t result = [a1 isNavigatingToIntermediateStop], (result & 1) == 0))
  {
    if ([a1 closed])
    {
      os_signpost_id_t v3 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v4 = [a1 groupIdentifier];
        int v7 = 138412290;
        BOOL v8 = v4;
        _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "Stripping route and ETAs from trip %@ (closed)", (uint8_t *)&v7, 0xCu);
      }
      uint64_t v5 = [a1 waypointInfos];
      [a1 _createPlaceholderETAInfosForWaypoints:v5];
    }
    else
    {
      if (![a1 arrived])
      {
LABEL_13:
        [a1 setRouteInfo:0];
        return [a1 setComposedRoute:0];
      }
      uint64_t v5 = MSPGetSharedTripLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [a1 groupIdentifier];
        int v7 = 138412290;
        BOOL v8 = v6;
        _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "Stripping route from trip %@ (arrived)", (uint8_t *)&v7, 0xCu);
      }
    }

    goto LABEL_13;
  }
  return result;
}

- (BOOL)hasEtaInfo
{
  return [a1 etaInfosCount] != 0;
}

- (id)etaInfo
{
  if ([a1 hasCurrentWaypointIndex]
    && (unsigned int v2 = [a1 currentWaypointIndex], objc_msgSend(a1, "etaInfosCount") > (unint64_t)v2))
  {
    os_signpost_id_t v3 = [a1 etaInfos];
    uint64_t v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(a1, "currentWaypointIndex"));
  }
  else
  {
    os_signpost_id_t v3 = [a1 etaInfos];
    uint64_t v4 = [v3 firstObject];
  }
  uint64_t v5 = (void *)v4;

  return v5;
}

- (id)finalETAInfo
{
  v1 = [a1 etaInfos];
  unsigned int v2 = [v1 lastObject];

  return v2;
}

- (uint64_t)numberOfIntermediateStopsRemaining
{
  if ([a1 waypointInfosCount])
  {
    uint64_t v2 = [a1 waypointInfosCount];
    if ([a1 hasCurrentWaypointIndex]) {
      unint64_t v3 = ~(unint64_t)[a1 currentWaypointIndex];
    }
    else {
      unint64_t v3 = -1;
    }
    return v3 + v2;
  }
  else
  {
    uint64_t v4 = [a1 routeInfo];
    uint64_t v5 = [v4 chargingStationsCount];

    return v5;
  }
}

- (uint64_t)isNavigatingToIntermediateStop
{
  uint64_t result = [a1 waypointInfosCount];
  if (result)
  {
    uint64_t result = [a1 hasCurrentWaypointIndex];
    if (result)
    {
      unsigned int v3 = [a1 currentWaypointIndex];
      return [a1 waypointInfosCount] - 1 > (unint64_t)v3;
    }
  }
  return result;
}

- (BOOL)hasWaypointInfos
{
  return [a1 waypointInfosCount] != 0;
}

- (id)nextWaypointInfo
{
  if ([a1 hasCurrentWaypointIndex]
    && (unsigned int v2 = [a1 currentWaypointIndex], objc_msgSend(a1, "waypointInfosCount") > (unint64_t)v2))
  {
    unsigned int v3 = [a1 waypointInfos];
    uint64_t v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(a1, "currentWaypointIndex"));
  }
  else
  {
    uint64_t v4 = [a1 destinationWaypointInfo];
  }

  return v4;
}

- (uint64_t)stripForSendingUpdatedWaypoints
{
  if ([a1 hasCurrentWaypointIndex])
  {
    unint64_t v2 = [a1 waypointInfosCount];
    if (v2 > [a1 currentWaypointIndex])
    {
      unsigned int v3 = [a1 currentWaypointIndex];
      uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v3);
      uint64_t v5 = [a1 waypointInfos];
      [v5 enumerateObjectsAtIndexes:v4 options:0 usingBlock:&__block_literal_global_3];
    }
  }
  [a1 setLastLocation:0];

  return [a1 setRouteInfo:0];
}

- (uint64_t)stripForSendingUpdatedRoute
{
  [a1 setSenderInfo:0];
  [a1 setDestinationInfo:0];
  [a1 setLastLocation:0];
  [a1 truncatePointDataForPrivacy];

  return [a1 clearWaypointInfos];
}

- (uint64_t)stripForSendingUpdatedETA
{
  [a1 setSenderInfo:0];
  [a1 setRouteInfo:0];
  [a1 setDestinationInfo:0];

  return [a1 clearWaypointInfos];
}

- (uint64_t)stripForSendingUpdatedTraffic
{
  unint64_t v2 = [a1 routeInfo];
  [v2 clearCoordinates];

  unsigned int v3 = [a1 routeInfo];
  [v3 clearRoutingPathLegs];

  [a1 setLastLocation:0];
  [a1 setSenderInfo:0];
  [a1 setDestinationInfo:0];

  return [a1 clearWaypointInfos];
}

- (uint64_t)stripForSendingArrival
{
  [a1 setSenderInfo:0];
  [a1 setRouteInfo:0];
  uint64_t result = [a1 waypointInfosCount];
  if (result)
  {
    uint64_t result = [a1 waypointInfosCount];
    if (result != 1)
    {
      unint64_t v3 = 0;
      do
      {
        uint64_t result = [a1 currentWaypointIndex];
        if (v3 == result) {
          break;
        }
        uint64_t v4 = [a1 waypointInfos];
        uint64_t v5 = [v4 objectAtIndex:v3];

        [v5 setMapItemStorage:0];
        [v5 setChargingStationInfo:0];

        ++v3;
        uint64_t result = [a1 waypointInfosCount];
      }
      while (v3 < result - 1);
    }
  }
  return result;
}

- (uint64_t)stripForSendingResuming
{
  [a1 setSenderInfo:0];

  return [a1 setRouteInfo:0];
}

- (uint64_t)stripForSendingStoppedSharing
{
  [a1 setRouteInfo:0];
  [a1 setDestinationInfo:0];
  [a1 setLastLocation:0];
  [a1 clearWaypointInfos];

  return [a1 clearEtaInfos];
}

@end