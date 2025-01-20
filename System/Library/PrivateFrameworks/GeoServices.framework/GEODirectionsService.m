@interface GEODirectionsService
+ (BOOL)_canCurrentVoiceLanguageHandleWrittenText;
+ (BOOL)canSpeakWrittenAddresses;
+ (BOOL)canSpeakWrittenPlaceNames;
+ (GEODirectionsService)sharedService;
+ (void)customRouteCreationSupportedForLocation:(id)a3 queue:(id)a4 handler:(id)a5;
- (GEODirectionsService)init;
- (NSURL)directionsURL;
- (id)_retryFailedDirectionsRequest:(id)a3 error:(id)a4 directionsError:(id)a5;
- (id)requestDirections:(id)a3 handler:(id)a4;
- (id)requestRoutes:(id)a3 handler:(id)a4;
- (void)_logDirectionsErrorForRequest:(id)a3 error:(id)a4 directionsError:(id)a5;
- (void)_submitDirectionsRequest:(id)a3 waypoints:(id)a4 traits:(id)a5 auditToken:(id)a6 useBackgroundURL:(BOOL)a7 requestPriority:(int64_t)a8 allowRetry:(BOOL)a9 handler:(id)a10;
@end

@implementation GEODirectionsService

- (GEODirectionsService)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEODirectionsService;
  v2 = [(GEODirectionsService *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(GEODirectionsRequester);
    directionsRequester = v2->_directionsRequester;
    v2->_directionsRequester = v3;
  }
  return v2;
}

+ (GEODirectionsService)sharedService
{
  if (qword_1EB2A0270 != -1) {
    dispatch_once(&qword_1EB2A0270, &__block_literal_global_158);
  }
  v2 = (void *)_MergedGlobals_298;

  return (GEODirectionsService *)v2;
}

void __37__GEODirectionsService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(GEODirectionsService);
  v1 = (void *)_MergedGlobals_298;
  _MergedGlobals_298 = (uint64_t)v0;
}

+ (BOOL)canSpeakWrittenAddresses
{
  int BOOL = GEOConfigGetBOOL(GeoServicesConfig_ShouldSpeakWrittenAddresses, (uint64_t)off_1E91142E8);
  if (BOOL)
  {
    LOBYTE(BOOL) = [a1 _canCurrentVoiceLanguageHandleWrittenText];
  }
  return BOOL;
}

+ (BOOL)canSpeakWrittenPlaceNames
{
  int BOOL = GEOConfigGetBOOL(GeoServicesConfig_ShouldSpeakWrittenPlaceNames, (uint64_t)off_1E91142F8);
  if (BOOL)
  {
    LOBYTE(BOOL) = [a1 _canCurrentVoiceLanguageHandleWrittenText];
  }
  return BOOL;
}

+ (void)customRouteCreationSupportedForLocation:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__GEODirectionsService_customRouteCreationSupportedForLocation_queue_handler___block_invoke;
    v9[3] = &unk_1E53EA750;
    id v10 = v7;
    id v11 = v8;
    +[GEOGeographicMetadataRequester fetchPossibleTerritoriesForLocation:v10 responseQueue:a4 responseBlock:v9];
  }
}

void __78__GEODirectionsService_customRouteCreationSupportedForLocation_queue_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = GEOGetDirectionsServiceLog_0();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = [*(id *)(a1 + 32) latLng];
      [v9 lat];
      uint64_t v11 = v10;
      v12 = [*(id *)(a1 + 32) latLng];
      [v12 lng];
      *(_DWORD *)buf = 134284035;
      *(void *)v48 = v11;
      *(_WORD *)&v48[8] = 2049;
      *(void *)&v48[10] = v13;
      *(_WORD *)&v48[18] = 2112;
      *(void *)&v48[20] = v6;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Error fetching territories for location %{private}f, %{private}f: %@", buf, 0x20u);
    }
LABEL_4:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_29;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = [v5 count];
    v15 = [*(id *)(a1 + 32) latLng];
    [v15 lat];
    uint64_t v17 = v16;
    v18 = [*(id *)(a1 + 32) latLng];
    [v18 lng];
    uint64_t v20 = v19;
    v21 = [v5 allObjects];
    v22 = [v21 componentsJoinedByString:@"\n\t"];
    *(_DWORD *)buf = 67109891;
    *(_DWORD *)v48 = v14;
    *(_WORD *)&v48[4] = 2049;
    *(void *)&v48[6] = v17;
    *(_WORD *)&v48[14] = 2049;
    *(void *)&v48[16] = v20;
    *(_WORD *)&v48[24] = 2112;
    *(void *)&v48[26] = v22;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEFAULT, "Got %d territories for %{private}f, %{private}f:\n\t%@", buf, 0x26u);
  }
  if (![v5 count])
  {
    id v8 = GEOGetDirectionsServiceLog_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "No territories found!", buf, 2u);
    }
    goto LABEL_4;
  }
  v23 = +[GEOCountryConfiguration sharedConfiguration];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v24 = v5;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v42;
    while (2)
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [*(id *)(*((void *)&v41 + 1) + 8 * v28) iso3166CountryCode2];
        if (v29 && ([v23 countryCode:v29 supportsFeature:8] & 1) != 0)
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

          goto LABEL_28;
        }

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  v30 = v24;

  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v24, "count"));
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v31 = v30;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v38;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v35), "iso3166CountryCode2", (void)v37);
        if (v36) {
          [v24 addObject:v36];
        }

        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [v31 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v33);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_28:

LABEL_29:
}

- (NSURL)directionsURL
{
  GEOGetURLWithSource(2, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29088] componentsWithURL:v2 resolvingAgainstBaseURL:1];
    v4 = _getValue(GeoServicesConfig_ExperimentalDirectionsService, (uint64_t)off_1E9113AB8, 1, 0, 0, 0);
    if ([v4 length])
    {
      id v5 = [v2 absoluteString];
      id v6 = (void *)[v5 copy];

      if ([v4 hasPrefix:@"?"]) {
        id v7 = @"%@";
      }
      else {
        id v7 = @"?%@";
      }
      id v8 = objc_msgSend(v6, "stringByAppendingFormat:", v7, v4);

      v9 = [MEMORY[0x1E4F29088] componentsWithString:v8];
      uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v11 = [v3 queryItems];
      [v10 addObjectsFromArray:v11];

      v12 = [v9 queryItems];
      [v10 addObjectsFromArray:v12];

      [v3 setQueryItems:v10];
      uint64_t v13 = [v3 URL];

      id v2 = (id)v13;
    }
    int v14 = +[GEOExperimentConfiguration sharedConfiguration];
    v15 = [v14 experimentURLForURL:v2 requestKind:512];

    id v2 = v15;
  }

  return (NSURL *)v2;
}

- (id)requestDirections:(id)a3 handler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = GEOGetDirectionsServiceLog_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = GEODirectionsServiceRequestTypeAsString([v6 requestType]);
    LODWORD(buf.receiver) = 138412290;
    *(id *)((char *)&buf.receiver + 4) = v9;
  }
  if (v6)
  {
    uint64_t v10 = +[GEODirectionsServiceRequestBuilder builderForRequestType:](GEODirectionsServiceRequestBuilder, "builderForRequestType:", [v6 requestType]);
    if (!v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf.receiver) = 0;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: builder != nil", (uint8_t *)&buf, 2u);
      }
      __break(1u);
    }
    uint64_t v11 = v10;
    uint64_t v12 = [v10 buildDirectionsRequestWithParameters:v6];
    uint64_t v13 = v12;
    if (v12) {
      int v14 = *(void **)(v12 + 24);
    }
    else {
      int v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      if (!v7)
      {
        v18 = 0;
LABEL_28:

        goto LABEL_29;
      }
      if (v13) {
        uint64_t v16 = *(void **)(v13 + 24);
      }
      else {
        uint64_t v16 = 0;
      }
      id v17 = v16;
      (*((void (**)(id, void, void, void, id, void))v7 + 2))(v7, 0, 0, 0, v17, 0);
      v18 = 0;
    }
    else
    {
      if (v13)
      {
        id v20 = *(id *)(v13 + 8);
        v21 = *(void **)(v13 + 16);
      }
      else
      {
        id v20 = 0;
        v21 = 0;
      }
      id v22 = v21;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __50__GEODirectionsService_requestDirections_handler___block_invoke;
      v34[3] = &unk_1E53EA778;
      id v23 = v22;
      id v35 = v23;
      id v36 = v6;
      long long v37 = self;
      id v17 = v20;
      id v38 = v17;
      id v39 = v7;
      uint64_t v24 = MEMORY[0x18C120660](v34);
      uint64_t v25 = [v23 routeAttributes];
      id obj = v21;
      uint64_t v33 = (void *)v24;
      if (v25)
      {
        global_queue = (void *)geo_get_global_queue();
        [v25 buildRouteAttributes:v17 queue:global_queue result:v24];
      }
      else
      {
        (*(void (**)(uint64_t, void, void))(v24 + 16))(v24, 0, 0);
      }
      v18 = [GEODirectionsServiceRequest alloc];
      directionsRequester = self->_directionsRequester;
      id v28 = v23;
      v29 = directionsRequester;
      if (v18)
      {
        buf.receiver = v18;
        buf.super_class = (Class)GEODirectionsServiceRequest;
        v30 = [(GEODirectionsService *)&buf init];
        v18 = (GEODirectionsServiceRequest *)v30;
        if (v30)
        {
          objc_storeStrong((id *)&v30->_directionsRequester, obj);
          objc_storeStrong((id *)&v18->_directionsRequester, directionsRequester);
          v18->_isCancelled = 0;
        }
      }
    }
    goto LABEL_28;
  }
  uint64_t v19 = GEOGetDirectionsServiceLog_0();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.receiver) = 0;
    _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "Error: GEODirectionsServiceRequestParameters is nil.", (uint8_t *)&buf, 2u);
  }

  if (!v7)
  {
    v18 = 0;
    goto LABEL_30;
  }
  uint64_t v11 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:@"GEODirectionsServiceRequestParameters is nil"];
  (*((void (**)(id, void, void, void, void *, void))v7 + 2))(v7, 0, 0, 0, v11, 0);
  v18 = 0;
LABEL_29:

LABEL_30:

  return v18;
}

void __50__GEODirectionsService_requestDirections_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setRouteAttributes:a2];
  v3 = [*(id *)(a1 + 40) requestCallback];

  if (v3)
  {
    v4 = [*(id *)(a1 + 40) requestCallback];
    v4[2](v4, *(void *)(a1 + 32));
  }
  BOOL v5 = [*(id *)(a1 + 40) requestType] == 13;
  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) traits];
  v9 = [*(id *)(a1 + 40) auditToken];
  LOBYTE(v10) = 1;
  objc_msgSend(v6, "_submitDirectionsRequest:waypoints:traits:auditToken:useBackgroundURL:requestPriority:allowRetry:handler:", v8, v7, v11, v9, v5, objc_msgSend(*(id *)(a1 + 40), "requestPriority"), v10, *(void *)(a1 + 64));
}

- (id)requestRoutes:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__GEODirectionsService_requestRoutes_handler___block_invoke;
    v10[3] = &unk_1E53EA7A0;
    id v11 = v6;
    id v12 = v7;
    uint64_t v8 = [(GEODirectionsService *)self requestDirections:v11 handler:v10];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __46__GEODirectionsService_requestRoutes_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  unint64_t v16 = [v11 count];
  id v17 = 0;
  if (v13 && v12 && v16 >= 2)
  {
    uint64_t v18 = [*(id *)(a1 + 32) requestType];
    if (v18 == 3)
    {
      uint64_t v19 = objc_opt_new();
      [v19 setWaypoints:v11];
      [v19 setDirectionsRequest:v12];
      [v19 setDirectionsResponse:v13];
      uint64_t v24 = [*(id *)(a1 + 32) currentRoute];
      [v19 setSourceRoute:v24];

      v21 = [v19 buildRoute];
      id v28 = v21;
      id v22 = (void *)MEMORY[0x1E4F1C978];
      id v23 = &v28;
    }
    else
    {
      if (v18 != 2)
      {
        uint64_t v25 = [GEORouteInitializerData alloc];
        uint64_t v26 = [v12 routeAttributes];
        uint64_t v27 = [(GEORouteInitializerData *)v25 initWithWaypoints:v11 routeAttributes:v26 directionsResponse:v13 directionsRequest:v12];

        id v17 = [(GEORouteInitializerData *)v27 allRoutes];

        goto LABEL_10;
      }
      uint64_t v19 = objc_opt_new();
      id v20 = [*(id *)(a1 + 32) anchorPoints];
      [v19 setAnchorPoints:v20];

      [v19 setWaypoints:v11];
      [v19 setDirectionsRequest:v12];
      [v19 setDirectionsResponse:v13];
      v21 = [v19 buildRoute];
      v29[0] = v21;
      id v22 = (void *)MEMORY[0x1E4F1C978];
      id v23 = (void **)v29;
    }
    id v17 = [v22 arrayWithObjects:v23 count:1];
  }
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_submitDirectionsRequest:(id)a3 waypoints:(id)a4 traits:(id)a5 auditToken:(id)a6 useBackgroundURL:(BOOL)a7 requestPriority:(int64_t)a8 allowRetry:(BOOL)a9 handler:(id)a10
{
  BOOL v33 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a10;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke;
  v43[3] = &unk_1E53EA7C8;
  uint64_t v47 = v20;
  id v21 = v15;
  id v44 = v21;
  id v22 = v19;
  id v46 = v22;
  id v23 = v16;
  id v45 = v23;
  uint64_t v24 = (void *)MEMORY[0x18C120660](v43);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke_227;
  v34[3] = &unk_1E53EA818;
  BOOL v41 = a9;
  void v34[4] = self;
  id v35 = v21;
  id v36 = v23;
  id v37 = v17;
  BOOL v42 = v33;
  id v39 = v22;
  int64_t v40 = a8;
  id v38 = v18;
  id v25 = v22;
  id v26 = v18;
  id v27 = v17;
  id v28 = v23;
  id v29 = v21;
  v30 = (void *)MEMORY[0x18C120660](v34);
  directionsRequester = self->_directionsRequester;
  uint64_t v32 = [NSNumber numberWithInteger:a8];
  [(GEODirectionsRequester *)directionsRequester startRequest:v29 traits:v27 auditToken:v26 skipFinalize:0 useBackgroundURL:v33 requestPriority:v32 callbackQueue:MEMORY[0x1E4F14428] finished:v24 networkActivity:0 error:v30];
}

void __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4;
  double v6 = *(double *)(a1 + 56);
  id v7 = GEOGetDirectionsServiceLog_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 134218496;
    id v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    double v15 = v5 - v6;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEFAULT, "Received directions response %p for directions request %p. Response time: %f seconds", (uint8_t *)&v10, 0x20u);
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, void, void, id, void, void))(v9 + 16))(v9, *(void *)(a1 + 40), *(void *)(a1 + 32), v3, 0, 0);
  }
}

void __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 88)
    && ([*(id *)(a1 + 32) _retryFailedDirectionsRequest:*(void *)(a1 + 40) error:v5 directionsError:v6], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v8 = (void *)v7;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke_2;
    v20[3] = &unk_1E53EA7F0;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v21 = v9;
    uint64_t v22 = v10;
    id v23 = v8;
    id v24 = *(id *)(a1 + 48);
    id v25 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 64);
    char v29 = *(unsigned char *)(a1 + 89);
    uint64_t v13 = *(void **)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 80);
    id v26 = v11;
    uint64_t v28 = v12;
    id v27 = v13;
    id v14 = v8;
    double v15 = (void *)MEMORY[0x18C120660](v20);
    uint64_t v16 = [*(id *)(a1 + 40) routeAttributes];
    uint64_t v17 = *(void *)(a1 + 48);
    global_queue = (void *)geo_get_global_queue();
    [v16 buildRouteAttributes:v17 queue:global_queue result:v15];
  }
  else
  {
    [*(id *)(a1 + 32) _logDirectionsErrorForRequest:*(void *)(a1 + 40) error:v5 directionsError:v6];
    uint64_t v19 = *(void *)(a1 + 72);
    if (v19) {
      (*(void (**)(uint64_t, void, void, void, id, id))(v19 + 16))(v19, *(void *)(a1 + 48), *(void *)(a1 + 40), 0, v5, v6);
    }
  }
}

uint64_t __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setRouteAttributes:a2];
  LOBYTE(v4) = 0;
  return [*(id *)(a1 + 40) _submitDirectionsRequest:*(void *)(a1 + 48) waypoints:*(void *)(a1 + 56) traits:*(void *)(a1 + 64) auditToken:*(void *)(a1 + 72) useBackgroundURL:*(unsigned __int8 *)(a1 + 96) requestPriority:*(void *)(a1 + 88) allowRetry:v4 handler:*(void *)(a1 + 80)];
}

- (id)_retryFailedDirectionsRequest:(id)a3 error:(id)a4 directionsError:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 originalWaypointRoute];
  int v11 = [v10 purpose];

  if (v11 == 9)
  {
    uint64_t v12 = GEOGetDirectionsServiceLog_0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Offline to online upgrade failed with 'OFFLINE_TO_ONLINE_NAV_TRANSITION'. Retrying with 'OFFLINE_TO_ONLINE_NEW_ROUTE'. Error: %@", (uint8_t *)&v19, 0xCu);
    }

    id v13 = (id)[v7 copy];
    id v14 = [v13 originalWaypointRoute];
    [v14 setPurpose:10];
  }
  else if (v8 {
         && ([v7 routeAttributes],
  }
             double v15 = objc_claimAutoreleasedReturnValue(),
             int v16 = [v15 shouldRetryForError:v8],
             v15,
             v16))
  {
    uint64_t v17 = GEOGetDirectionsServiceLog_0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_ERROR, "Directions request failed with error and retrying: %@ | %@", (uint8_t *)&v19, 0x16u);
    }

    id v13 = v7;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)_logDirectionsErrorForRequest:(id)a3 error:(id)a4 directionsError:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 domain];
  int v11 = GEOErrorDomain();
  int v12 = [v10 isEqualToString:v11];

  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v13 = [v7 originalWaypointRoute];
  if (v13)
  {
    id v14 = (void *)v13;
    double v15 = [v7 originalWaypointRoute];
    int v16 = [v15 purpose];

    if (v16 == 12)
    {
      uint64_t v17 = [v7 data];
      id v18 = [v17 base64EncodedStringWithOptions:0];

      int v19 = GEOGetDirectionsServiceLog_0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = GEOStringForError((__CFString *)[v8 code]);
        int v21 = 138413314;
        id v22 = v20;
        __int16 v23 = 1024;
        int v24 = [v8 code];
        __int16 v25 = 2112;
        id v26 = v8;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 2112;
        v30 = v18;
        _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_ERROR, "Directions request failed with error (%@: %d) and not retrying:\n%@\n\n%@\n\nBase64:\n%@", (uint8_t *)&v21, 0x30u);
      }
      goto LABEL_9;
    }
  }
  if (v9)
  {
    id v18 = GEOGetDirectionsServiceLog_0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = GEOStringForError((__CFString *)[v8 code]);
      int v21 = 138413058;
      id v22 = v19;
      __int16 v23 = 1024;
      int v24 = [v8 code];
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Directions request failed with error (%@: %d) and not retrying:\n%@\n\n%@", (uint8_t *)&v21, 0x26u);
LABEL_9:
    }
  }
  else
  {
LABEL_10:
    id v18 = GEOGetDirectionsServiceLog_0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "Directions request failed with error and not retrying: %@", (uint8_t *)&v21, 0xCu);
    }
  }
}

+ (BOOL)_canCurrentVoiceLanguageHandleWrittenText
{
  return 1;
}

- (void).cxx_destruct
{
}

@end