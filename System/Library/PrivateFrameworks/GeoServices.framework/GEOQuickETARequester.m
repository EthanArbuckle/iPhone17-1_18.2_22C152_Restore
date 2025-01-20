@interface GEOQuickETARequester
+ (BOOL)requestETAFromOrigin:(id)a3 toDestinations:(id)a4 transportType:(int)a5 timepoint:(GEOTimepoint *)a6 includeDistance:(BOOL)a7 commonOptions:(id)a8 automobileOptions:(id)a9 walkingOptions:(id)a10 transitOptions:(id)a11 cyclingOptions:(id)a12 auditToken:(id)a13 handler:(id)a14 callbackQueue:(id)a15;
+ (BOOL)requestTrafficAndETAFromWaypoint:(id)a3 toWaypoints:(id)a4 transportType:(int)a5 automobileOptions:(id)a6 handler:(id)a7;
- (GEOQuickETARequester)initWithRequest:(id)a3;
- (void)_calculateRoutingETAWithHandler:(id)a3;
- (void)_calculateRoutingETAWithSummary:(BOOL)a3 handler:(id)a4;
- (void)_calculateSimpleETAFromAPI:(BOOL)a3 WithHandler:(id)a4;
- (void)_calculateSimpleETAFromAPI:(BOOL)a3 includeSummary:(BOOL)a4 WithHandler:(id)a5;
- (void)calculateETAFromAPI:(BOOL)a3 WithResponseHandler:(id)a4;
- (void)calculateETAFromAPI:(BOOL)a3 includeSummary:(BOOL)a4 WithResponseHandler:(id)a5;
- (void)calculateETAWithResponseHandler:(id)a3;
- (void)cancel;
@end

@implementation GEOQuickETARequester

- (void)calculateETAFromAPI:(BOOL)a3 WithResponseHandler:(id)a4
{
}

void __78__GEOQuickETARequester__calculateSimpleETAFromAPI_includeSummary_WithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  v5 = [v9 etaResultAtIndex:0];
  if ([v9 status] || !v5)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    _errorForResponse(v9);
    v6 = (GEOQuickETAResponse *)objc_claimAutoreleasedReturnValue();
    v7 = *(void (**)(void))(v8 + 16);
  }
  else
  {
    v6 = [[GEOQuickETAResponse alloc] initWithETAResult:v5 fromRequest:*(void *)(*(void *)(a1 + 32) + 8)];
    v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v7();
}

- (void)calculateETAFromAPI:(BOOL)a3 includeSummary:(BOOL)a4 WithResponseHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (v8)
  {
    id v10 = v8;
    id v9 = GEOGetURLWithSource(18, 0);

    if (v9 && GEOConfigGetBOOL(GeoServicesConfig_ShouldUseSimpleETAService, (uint64_t)off_1E9113AA8)) {
      [(GEOQuickETARequester *)self _calculateSimpleETAFromAPI:v6 includeSummary:v5 WithHandler:v10];
    }
    else {
      [(GEOQuickETARequester *)self _calculateRoutingETAWithSummary:v5 handler:v10];
    }
    id v8 = v10;
  }
}

- (void)_calculateSimpleETAFromAPI:(BOOL)a3 includeSummary:(BOOL)a4 WithHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [[GEOETARequest alloc] initWithQuickETARequest:self->_request];
  simpleETARequest = self->_simpleETARequest;
  self->_simpleETARequest = v9;

  [(GEOETARequest *)self->_simpleETARequest setIsFromAPI:v6];
  v11 = [(GEOQuickETARequest *)self->_request requestingAppIdentifier];
  [(GEOETARequest *)self->_simpleETARequest setRequestingAppId:v11];

  if (v5)
  {
    v12 = objc_alloc_init(GEOCommonOptions);
    [(GEOCommonOptions *)v12 setIncludeSummaryForPredictedDestination:1];
    [(GEOETARequest *)self->_simpleETARequest setCommonOptions:v12];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__GEOQuickETARequester__calculateSimpleETAFromAPI_includeSummary_WithHandler___block_invoke;
  v20[3] = &unk_1E53EDB80;
  v20[4] = self;
  id v13 = v8;
  id v21 = v13;
  v14 = (void *)MEMORY[0x18C120660](v20);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__GEOQuickETARequester__calculateSimpleETAFromAPI_includeSummary_WithHandler___block_invoke_2;
  v18[3] = &unk_1E53D8C88;
  v18[4] = self;
  id v19 = v13;
  id v15 = v13;
  v16 = (void *)MEMORY[0x18C120660](v18);
  v17 = +[GEOETARequester sharedRequester];
  [v17 startSimpleETARequest:self->_simpleETARequest auditToken:0 throttleToken:0 callbackQueue:MEMORY[0x1E4F14428] finished:v14 networkActivity:0 error:v16];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingFacility, 0);
  objc_storeStrong((id *)&self->_directionsETARequest, 0);
  objc_storeStrong((id *)&self->_simpleETARequest, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (GEOQuickETARequester)initWithRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOQuickETARequester;
  BOOL v6 = [(GEOQuickETARequester *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    id v8 = v7;
  }

  return v7;
}

- (void)_calculateSimpleETAFromAPI:(BOOL)a3 WithHandler:(id)a4
{
}

void __78__GEOQuickETARequester__calculateSimpleETAFromAPI_includeSummary_WithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  if ([v8 code] != -2
    || ([v8 domain],
        id v5 = objc_claimAutoreleasedReturnValue(),
        GEOErrorDomain(),
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_calculateRoutingETAWithHandler:(id)a3
{
}

- (void)_calculateRoutingETAWithSummary:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  char v7 = [[GEODirectionsRequestFeedback alloc] initWithPurpose:3];
  id v8 = [(GEOQuickETARequest *)self->_request requestingAppIdentifier];
  [(GEODirectionsRequestFeedback *)v7 setRequestingAppId:v8];

  id v9 = [[GEODirectionsRequest alloc] initWithQuickETARequest:self->_request withFeedback:v7];
  directionsETARequest = self->_directionsETARequest;
  self->_directionsETARequest = v9;

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__GEOQuickETARequester__calculateRoutingETAWithSummary_handler___block_invoke;
  v23[3] = &unk_1E53EDB30;
  v23[4] = self;
  id v11 = v6;
  id v24 = v11;
  v12 = (void *)MEMORY[0x18C120660](v23);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __64__GEOQuickETARequester__calculateRoutingETAWithSummary_handler___block_invoke_2;
  v20 = &unk_1E53EDB58;
  id v21 = self;
  id v13 = v11;
  id v22 = v13;
  v14 = (void *)MEMORY[0x18C120660](&v17);
  if (v4)
  {
    id v15 = objc_alloc_init(GEOCommonOptions);
    -[GEOCommonOptions setIncludeSummaryForPredictedDestination:](v15, "setIncludeSummaryForPredictedDestination:", 1, v17, v18, v19, v20, v21);
    [(GEODirectionsRequest *)self->_directionsETARequest setCommonOptions:v15];
  }
  v16 = +[GEODirectionsRequester sharedRequester];
  [v16 startRequest:self->_directionsETARequest callbackQueue:MEMORY[0x1E4F14428] finished:v12 networkActivity:0 error:v14];
}

void __64__GEOQuickETARequester__calculateRoutingETAWithSummary_handler___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;

  if (v8)
  {
    id v5 = [[GEOQuickETAResponse alloc] initWithDirectionsResponse:v8 fromRequest:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    char v7 = GEOErrorDomain();
    id v5 = (GEOQuickETAResponse *)[v6 initWithDomain:v7 code:-8 userInfo:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __64__GEOQuickETARequester__calculateRoutingETAWithSummary_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;

  if ([v8 code] != -2
    || ([v8 domain],
        id v5 = objc_claimAutoreleasedReturnValue(),
        GEOErrorDomain(),
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)calculateETAWithResponseHandler:(id)a3
{
}

- (void)cancel
{
  if (self->_simpleETARequest)
  {
    id v3 = +[GEOETARequester sharedRequester];
    [v3 cancelSimpleETARequest:self->_simpleETARequest];
  }
  else
  {
    if (!self->_directionsETARequest) {
      return;
    }
    id v3 = +[GEODirectionsRequester sharedRequester];
    [v3 cancelRequest:self->_directionsETARequest];
  }
}

+ (BOOL)requestTrafficAndETAFromWaypoint:(id)a3 toWaypoints:(id)a4 transportType:(int)a5 automobileOptions:(id)a6 handler:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_alloc_init(GEOCommonOptions);
  [(GEOCommonOptions *)v16 setIncludeSummaryForPredictedDestination:1];
  uint64_t v19 = 0;
  long long v18 = 0u;
  LOBYTE(v8) = [a1 requestETAFromOrigin:v15 toDestinations:v14 transportType:v8 timepoint:&v18 includeDistance:0 commonOptions:v16 automobileOptions:v13 walkingOptions:0 transitOptions:0 cyclingOptions:0 auditToken:0 handler:v12 callbackQueue:MEMORY[0x1E4F14428]];

  return v8;
}

+ (BOOL)requestETAFromOrigin:(id)a3 toDestinations:(id)a4 transportType:(int)a5 timepoint:(GEOTimepoint *)a6 includeDistance:(BOOL)a7 commonOptions:(id)a8 automobileOptions:(id)a9 walkingOptions:(id)a10 transitOptions:(id)a11 cyclingOptions:(id)a12 auditToken:(id)a13 handler:(id)a14 callbackQueue:(id)a15
{
  BOOL v71 = a7;
  uint64_t v16 = *(void *)&a5;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  id v18 = a4;
  uint64_t v19 = (char *)a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v77 = a12;
  id v23 = a13;
  id v24 = a14;
  id v25 = a15;
  v26 = v25;
  v76 = v21;
  if (v24)
  {
    if (v25)
    {
      v27 = v78;
      if (v78)
      {
        if ([v18 count])
        {
          v61 = v24;
          v63 = v26;
          aSelectora = v19;
          id v70 = v20;
          if (v16) {
            v28 = 0;
          }
          else {
            v28 = v20;
          }
          v29 = v18;
          id v30 = v28;
          if (v16 == 2) {
            v31 = v21;
          }
          else {
            v31 = 0;
          }
          id v32 = v31;
          if (v16 == 1) {
            v33 = v22;
          }
          else {
            v33 = 0;
          }
          id v34 = v33;
          v35 = v77;
          if (v16 != 3) {
            v35 = 0;
          }
          id v36 = v35;
          v37 = [GEOQuickETARequest alloc];
          v66 = v29;
          v38 = [v29 firstObject];
          v62 = v36;
          v64 = v34;
          v65 = v32;
          v67 = v30;
          v39 = [(GEOQuickETARequest *)v37 initWithSource:v78 toDestination:v38 departureDate:0 transportType:v16 currentLocation:0 includeDistance:v71 additionalTransportTypesRequested:0 automobileOptions:v30 transitOptions:v34 walkingOptions:v32 cyclingOptions:v36];

          v40 = [[GEOETARequest alloc] initWithQuickETARequest:v39];
          id v68 = v23;
          id v69 = v22;
          v72 = v39;
          if (v23) {
            [v23 bundleId];
          }
          else {
          v50 = [(GEOQuickETARequest *)v39 requestingAppIdentifier];
          }
          v26 = v63;
          [(GEOETARequest *)v40 setRequestingAppId:v50];

          long long v88 = *(_OWORD *)&a6->_currentUserTime;
          uint64_t v89 = *(void *)&a6->_type;
          [(GEOETARequest *)v40 setTimepoint:&v88];
          [(GEOETARequest *)v40 setCommonOptions:aSelectora];
          -[GEOETARequest setIncludeRouteTrafficDetail:](v40, "setIncludeRouteTrafficDetail:", [aSelectora includeSummaryForPredictedDestination]);
          id v18 = v66;
          v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v66, "count"));
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v52 = v66;
          uint64_t v53 = [v52 countByEnumeratingWithState:&v84 objects:v90 count:16];
          id v24 = v61;
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v85;
            do
            {
              for (uint64_t i = 0; i != v54; ++i)
              {
                if (*(void *)v85 != v55) {
                  objc_enumerationMutation(v52);
                }
                v57 = [*(id *)(*((void *)&v84 + 1) + 8 * i) geoWaypointTyped];
                [v51 addObject:v57];
              }
              uint64_t v54 = [v52 countByEnumeratingWithState:&v84 objects:v90 count:16];
            }
            while (v54);
          }

          [(GEOETARequest *)v40 setDestinationWaypointTypeds:v51];
          v58 = +[GEOETARequester sharedRequester];
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __210__GEOQuickETARequester_requestETAFromOrigin_toDestinations_transportType_timepoint_includeDistance_commonOptions_automobileOptions_walkingOptions_transitOptions_cyclingOptions_auditToken_handler_callbackQueue___block_invoke;
          v81[3] = &unk_1E53EDB80;
          id v82 = v51;
          id v83 = v61;
          v79[0] = MEMORY[0x1E4F143A8];
          v79[1] = 3221225472;
          v79[2] = __210__GEOQuickETARequester_requestETAFromOrigin_toDestinations_transportType_timepoint_includeDistance_commonOptions_automobileOptions_walkingOptions_transitOptions_cyclingOptions_auditToken_handler_callbackQueue___block_invoke_88;
          v79[3] = &unk_1E53DB698;
          id v80 = v83;
          id v59 = v51;
          id v23 = v68;
          [v58 startSimpleETARequest:v40 auditToken:v68 throttleToken:0 callbackQueue:v63 finished:v81 networkActivity:0 error:v79];

          BOOL v44 = 1;
          v27 = v78;
          uint64_t v19 = aSelectora;
          id v22 = v69;
          id v20 = v70;
          goto LABEL_36;
        }
        v48 = (void *)MEMORY[0x1E4F28C58];
        v49 = @"Requires at least one destination";
      }
      else
      {
        v48 = (void *)MEMORY[0x1E4F28C58];
        v49 = @"Requires origin's waypoint";
      }
      v45 = [v48 GEOErrorWithCode:-12 reason:v49];
      (*((void (**)(id, void, NSObject *))v24 + 2))(v24, 0, v45);
    }
    else
    {
      v45 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOQuickETARequester");
      v27 = v78;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v47 = id v46 = v22;
        *(_DWORD *)buf = 138543362;
        v92 = v47;
        _os_log_impl(&dword_188D96000, v45, OS_LOG_TYPE_ERROR, "%{public}@ requires a callbackQueue", buf, 0xCu);

        id v22 = v46;
      }
    }

    BOOL v44 = 0;
    goto LABEL_36;
  }
  v41 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOQuickETARequester");
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v43 = id v42 = v22;
    *(_DWORD *)buf = 138543362;
    v92 = v43;
    _os_log_impl(&dword_188D96000, v41, OS_LOG_TYPE_ERROR, "%{public}@ requires a handler", buf, 0xCu);

    id v22 = v42;
  }

  BOOL v44 = 0;
  v27 = v78;
LABEL_36:

  return v44;
}

void __210__GEOQuickETARequester_requestETAFromOrigin_toDestinations_transportType_timepoint_includeDistance_commonOptions_automobileOptions_walkingOptions_transitOptions_cyclingOptions_auditToken_handler_callbackQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = _errorForResponse(v3);
  if (!v4)
  {
    uint64_t v44 = a1;
    uint64_t v5 = [*(id *)(a1 + 32) count];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v45 = v3;
    char v7 = [v3 etaResults];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (!v8) {
      goto LABEL_42;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v53;
    id v11 = off_1E53D6000;
    v47 = v7;
    v48 = v6;
    uint64_t v46 = *(void *)v53;
    while (1)
    {
      uint64_t v12 = 0;
      uint64_t v49 = v9;
      do
      {
        if (*(void *)v53 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v52 + 1) + 8 * v12);
        id v14 = objc_alloc_init(v11[136]);
        if (v13 && (*(_WORD *)(v13 + 76) & 8) != 0 && -[GEOETAResult status](v13))
        {
          id v15 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOQuickETARequester");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            uint64_t v16 = v15;
            uint64_t v17 = "A sub-result failed!";
            goto LABEL_21;
          }
          goto LABEL_22;
        }
        id v18 = -[GEOETAResult sortedETAs]((id *)v13);
        uint64_t v19 = [v18 count];

        if (v19 != 1)
        {
          id v15 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOQuickETARequester");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            uint64_t v16 = v15;
            uint64_t v17 = "There should be only one ETA";
LABEL_21:
            _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
          }
LABEL_22:

          [v14 setIsSuccess:0];
          [v14 setSeconds:2.22507386e-308];
          [v14 setShortTrafficString:0];
          [v14 setLongTrafficString:0];
          [v6 addObject:v14];
          goto LABEL_40;
        }
        id v20 = -[GEOETAResult sortedETAs]((id *)v13);
        id v21 = [v20 firstObject];

        if ([v21 hasStatus] && objc_msgSend(v21, "status"))
        {
          id v22 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOQuickETARequester");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v21;
            _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_ERROR, "An etaResultByType failed %@!", buf, 0xCu);
          }

          [v14 setIsSuccess:0];
          [v14 setSeconds:2.22507386e-308];
          [v14 setShortTrafficString:0];
          [v14 setLongTrafficString:0];
          [v14 setSeconds:0.0];
          [v6 addObject:v14];
        }
        else
        {
          v51 = v21;
          id v23 = -[GEOETAResult sortedETAs]((id *)v13);
          id v24 = [v23 firstObject];

          id v25 = [v24 routeTrafficDetail];
          v26 = [v24 summaryForPredictedDestinations];
          v27 = [v26 lastObject];
          v28 = [v27 formatStrings];
          uint64_t v29 = [v28 lastObject];
          id v30 = (void *)v29;
          if (v29) {
            v31 = (__CFString *)v29;
          }
          else {
            v31 = &stru_1ED51F370;
          }
          id v32 = v31;

          v50 = v26;
          v33 = [v26 firstObject];
          id v34 = [v33 formatStrings];
          uint64_t v35 = [v34 firstObject];
          id v36 = (void *)v35;
          if (v35) {
            v37 = (__CFString *)v35;
          }
          else {
            v37 = &stru_1ED51F370;
          }
          v38 = v37;

          [v14 setIsSuccess:1];
          objc_msgSend(v14, "setSeconds:", (double)objc_msgSend(v24, "travelTimeBestEstimate"));
          objc_msgSend(v14, "setAggressiveTravelTime:", (double)objc_msgSend(v24, "travelTimeAggressiveEstimate"));
          objc_msgSend(v14, "setConservativeTravelTime:", (double)objc_msgSend(v24, "travelTimeConservativeEstimate"));
          [v14 setShortTrafficString:v32];
          [v14 setLongTrafficString:v38];

          v39 = [v25 writtenRouteName];
          if (v39)
          {
            [v14 setWrittenRouteName:v39];
          }
          else
          {
            v40 = [v25 unabbreviatedRouteName];
            [v14 setWrittenRouteName:v40];
          }
          v41 = [v25 spokenRouteName];
          uint64_t v10 = v46;
          if (v41)
          {
            [v14 setSpokenRouteName:v41];
          }
          else
          {
            id v42 = [v25 unabbreviatedRouteName];
            if (v42)
            {
              [v14 setSpokenRouteName:v42];
            }
            else
            {
              v43 = [v25 writtenRouteName];
              [v14 setSpokenRouteName:v43];
            }
          }

          id v6 = v48;
          [v48 addObject:v14];

          char v7 = v47;
          id v11 = off_1E53D6000;
          id v21 = v51;
        }

        uint64_t v9 = v49;
LABEL_40:

        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (!v9)
      {
LABEL_42:

        (*(void (**)(void))(*(void *)(v44 + 40) + 16))();
        BOOL v4 = 0;
        id v3 = v45;
        goto LABEL_43;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_43:
}

uint64_t __210__GEOQuickETARequester_requestETAFromOrigin_toDestinations_transportType_timepoint_includeDistance_commonOptions_automobileOptions_walkingOptions_transitOptions_cyclingOptions_auditToken_handler_callbackQueue___block_invoke_88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end