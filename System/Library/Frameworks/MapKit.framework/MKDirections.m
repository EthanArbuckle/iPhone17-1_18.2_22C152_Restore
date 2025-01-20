@interface MKDirections
- (BOOL)isCalculating;
- (MKDirections)init;
- (MKDirections)initWithRequest:(MKDirectionsRequest *)request;
- (void)_calculateDirectionsWithTraits:(id)a3 completionHandler:(id)a4;
- (void)_calculateETAWithTraits:(id)a3 completionHandler:(id)a4;
- (void)_cleanupLocationOperation;
- (void)_establishCurrentLocationAndThen:(id)a3;
- (void)_issueDirectionsRequestForOrigin:(id)a3 destination:(id)a4 traits:(id)a5 completionHandler:(id)a6;
- (void)_issueETARequestForOrigin:(id)a3 destination:(id)a4 completionHandler:(id)a5;
- (void)_performWithValidCurrentLocationAndWaypointsForQuickETA:(BOOL)a3 traits:(id)a4 handler:(id)a5;
- (void)calculateDirectionsWithCompletionHandler:(MKDirectionsHandler)completionHandler;
- (void)calculateETAWithCompletionHandler:(MKETAHandler)completionHandler;
- (void)cancel;
- (void)dealloc;
@end

@implementation MKDirections

- (MKDirections)initWithRequest:(MKDirectionsRequest *)request
{
  v4 = request;
  v14.receiver = self;
  v14.super_class = (Class)MKDirections;
  v5 = [(MKDirections *)&v14 init];
  if (v5)
  {
    if (!v4)
    {
      v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
      v12 = [NSString stringWithFormat:@"Cannot initialize %@ with nil request", objc_opt_class()];
      id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

      objc_exception_throw(v13);
    }
    uint64_t v6 = [(MKDirectionsRequest *)v4 copy];
    v7 = v5->_request;
    v5->_request = (MKDirectionsRequest *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)calculateETAWithCompletionHandler:(MKETAHandler)completionHandler
{
  MKETAHandler v4 = completionHandler;
  if (v4)
  {
    v5 = +[MKMapService sharedService];
    uint64_t v6 = objc_msgSend(v5, "defaultTraitsWithTransportType:", -[MKDirectionsRequest transportType](self->_request, "transportType"));

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__MKDirections_calculateETAWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E54BE9C8;
    v7[4] = self;
    id v8 = v4;
    [(MKDirections *)self _calculateETAWithTraits:v6 completionHandler:v7];
  }
}

- (void)_calculateETAWithTraits:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__MKDirections__calculateETAWithTraits_completionHandler___block_invoke;
    v8[3] = &unk_1E54BE950;
    v8[4] = self;
    id v9 = v6;
    [(MKDirections *)self _performWithValidCurrentLocationAndWaypointsForQuickETA:1 traits:a3 handler:v8];
  }
}

- (void)_performWithValidCurrentLocationAndWaypointsForQuickETA:(BOOL)a3 traits:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(MKDirections *)self isCalculating])
  {
    NSLog(&cfstr_CannotCalculat.isa);
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = (void *)[v10 initWithDomain:MKErrorDomain code:1 userInfo:0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke;
    block[3] = &unk_1E54B8360;
    id v19 = v11;
    id v20 = v9;
    id v12 = v9;
    id v13 = v11;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_2;
    v14[3] = &unk_1E54BE888;
    id v16 = v9;
    v14[4] = self;
    BOOL v17 = a3;
    id v15 = v8;
    id v13 = v9;
    [(MKDirections *)self _establishCurrentLocationAndThen:v14];

    id v12 = v16;
  }
}

- (BOOL)isCalculating
{
  if (self->_geoRequest || self->_locationOperation || self->_waypointsDispatchGroup) {
    return 1;
  }
  if (self->_etaRequester) {
    return self->_etaRequest != 0;
  }
  return 0;
}

void __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = a1[5];
  uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v6 = a1[8];
  uint64_t v7 = *(void *)(*(void *)(a1[7] + 8) + 40);
  objc_msgSend(*(id *)(*(void *)(v6 + 8) + 40), "_mapkit_errorWithDirectionsError:", 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v4 + 16))(v4, v5, v7, v8);
}

void __58__MKDirections__calculateETAWithTraits_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v9 = _routeAttributesForMKDirectionsRequest(*(void **)(*(void *)(a1 + 32) + 8));
    if ([*(id *)(*(void *)(a1 + 32) + 8) _resolveExtraAutomobileOptions])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F7A080]);
      v15[0] = v7;
      v15[1] = v8;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
      uint64_t v12 = [v10 initWithAttributes:v9 waypoints:v11];
      uint64_t v13 = *(void *)(a1 + 32);
      objc_super v14 = *(void **)(v13 + 56);
      *(void *)(v13 + 56) = v12;
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v9);
    }
    [*(id *)(a1 + 32) _issueETARequestForOrigin:v7 destination:v8 completionHandler:*(void *)(a1 + 40)];
  }
}

- (void)_issueETARequestForOrigin:(id)a3 destination:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  routeAttributes = self->_routeAttributes;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__MKDirections__issueETARequestForOrigin_destination_completionHandler___block_invoke;
  void v15[3] = &unk_1E54BE9A0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(GEORouteAttributes *)routeAttributes buildRouteAttributes:MEMORY[0x1E4F14428] result:v15];
}

void __72__MKDirections__issueETARequestForOrigin_destination_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 32);
  id v4 = a2;
  [v3 cancel];
  id v5 = objc_alloc(MEMORY[0x1E4F64888]);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [v4 automobileOptions];

  uint64_t v10 = [v5 initWithDirectionsRequest:v7 origin:v6 destination:v8 automobileOptions:v9];
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 24);
  *(void *)(v11 + 24) = v10;

  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F64890]) initWithRequest:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 32);
  *(void *)(v14 + 32) = v13;

  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(v16 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__MKDirections__issueETARequestForOrigin_destination_completionHandler___block_invoke_2;
  v18[3] = &unk_1E54BE978;
  v18[4] = v16;
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  [v17 calculateETAFromAPI:1 WithResponseHandler:v18];
}

void __50__MKDirections_calculateETAWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, uint64_t a8)
{
  id v35 = a2;
  id v14 = a3;
  id v15 = a7;
  if (a8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
  double v16 = (double)a4;
  id v17 = [[MKETAResponse alloc] initWithSource:v35 destination:v14 expectedTravelTime:v15 distance:(double)a4 sortedETAs:(double)a6];
  uint64_t v18 = [(MKETAResponse *)v17 expectedDepartureDate];
  if (!v18
    || (id v19 = (void *)v18,
        [(MKETAResponse *)v17 expectedArrivalDate],
        id v20 = objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        !v20))
  {
    id v21 = [*(id *)(*(void *)(a1 + 32) + 8) departureDate];

    v22 = *(void **)(*(void *)(a1 + 32) + 8);
    if (v21)
    {
      v23 = [v22 departureDate];
      [(MKETAResponse *)v17 setExpectedDepartureDate:v23];

      v24 = (void *)MEMORY[0x1E4F1C9C8];
      [(MKETAResponse *)v17 expectedTravelTime];
      double v16 = v25;
      uint64_t v26 = [*(id *)(*(void *)(a1 + 32) + 8) departureDate];
    }
    else
    {
      v29 = [v22 arrivalDate];

      if (v29)
      {
        v30 = [*(id *)(*(void *)(a1 + 32) + 8) arrivalDate];
        [(MKETAResponse *)v17 setExpectedArrivalDate:v30];

        v31 = (void *)MEMORY[0x1E4F1C9C8];
        [(MKETAResponse *)v17 expectedTravelTime];
        double v33 = -v32;
        v27 = [*(id *)(*(void *)(a1 + 32) + 8) arrivalDate];
        v28 = [v31 dateWithTimeInterval:v27 sinceDate:v33];
        [(MKETAResponse *)v17 setExpectedDepartureDate:v28];
        goto LABEL_10;
      }
      v34 = [MEMORY[0x1E4F1C9C8] date];
      [(MKETAResponse *)v17 setExpectedDepartureDate:v34];

      v24 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v26 = [(MKETAResponse *)v17 expectedDepartureDate];
    }
    v27 = (void *)v26;
    v28 = [v24 dateWithTimeInterval:v26 sinceDate:v16];
    [(MKETAResponse *)v17 setExpectedArrivalDate:v28];
LABEL_10:
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_12:
}

void __49__MKDirections__establishCurrentLocationAndThen___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) source];
  if ([v2 isCurrentLocation])
  {

LABEL_4:
    [*(id *)(a1 + 32) _cleanupLocationOperation];
    id v5 = +[MKLocationManager sharedLocationManager];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __49__MKDirections__establishCurrentLocationAndThen___block_invoke_2;
    id v14 = &unk_1E54BE810;
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = v6;
    uint64_t v7 = [v5 singleLocationUpdateWithHandler:&v11];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "start", v11, v12, v13, v14, v15);
    return;
  }
  v3 = [*(id *)(*(void *)(a1 + 32) + 8) destination];
  int v4 = [v3 isCurrentLocation];

  if (v4) {
    goto LABEL_4;
  }
  uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);

  v10();
}

void __72__MKDirections__issueETARequestForOrigin_destination_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v35 = a2;
  id v5 = a3;
  uint64_t v6 = (id *)a1[4];
  uint64_t v7 = v6;
  if (v5
    && (v9 = v6[8], uint64_t v8 = v6 + 8, !v9)
    && (objc_storeStrong(v8, a3),
        int v10 = [*(id *)(a1[4] + 56) shouldRetryForError:v5],
        uint64_t v7 = (id *)a1[4],
        v10))
  {
    [v7 _issueETARequestForOrigin:a1[5] destination:a1[6] completionHandler:a1[7]];
  }
  else
  {
    uint64_t v11 = [v7[1] source];
    if ([v11 isCurrentLocation])
    {
      uint64_t v12 = [v35 sourceLocation];
      v34 = [v12 latLng];

      id v13 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      [v34 lat];
      double v15 = v14;
      [v34 lng];
      id v17 = (void *)[v13 initWithLatitude:v15 longitude:v16];
      uint64_t v18 = [[MKMapItem alloc] initWithCLLocation:v17];

      uint64_t v19 = a1[7];
      id v20 = [*(id *)(a1[4] + 8) destination];
      uint64_t v21 = [v35 responseETASeconds];
      uint64_t v22 = [v35 responseETASeconds];
      [v35 distance];
      uint64_t v24 = v23;
      double v25 = [v35 sortedETAs];
      uint64_t v26 = objc_msgSend(v5, "_mapkit_errorWithDirectionsError:", 0);
      uint64_t v27 = v24;
      v28 = v34;
      (*(void (**)(uint64_t, MKMapItem *, void *, uint64_t, uint64_t, uint64_t, void *, void *))(v19 + 16))(v19, v18, v20, v21, v22, v27, v25, v26);

      uint64_t v11 = v18;
    }
    else
    {
      uint64_t v29 = a1[7];
      v28 = [*(id *)(a1[4] + 8) source];
      id v17 = [*(id *)(a1[4] + 8) destination];
      uint64_t v30 = [v35 responseETASeconds];
      uint64_t v31 = [v35 responseETASeconds];
      [v35 distance];
      uint64_t v33 = v32;
      id v20 = [v35 sortedETAs];
      double v25 = objc_msgSend(v5, "_mapkit_errorWithDirectionsError:", 0);
      (*(void (**)(uint64_t, void *, void *, uint64_t, uint64_t, uint64_t, void *, void *))(v29 + 16))(v29, v28, v17, v30, v31, v33, v20, v25);
    }
  }
}

void __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    dispatch_group_t v4 = dispatch_group_create();
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v4;

    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__21;
    v28[4] = __Block_byref_object_dispose__21;
    id v29 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__21;
    v26[4] = __Block_byref_object_dispose__21;
    id v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__21;
    v24[4] = __Block_byref_object_dispose__21;
    id v25 = 0;
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
    uint64_t v7 = (void *)MEMORY[0x1E4F644F0];
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) source];
    uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_20;
    v23[3] = &unk_1E54BE838;
    v23[5] = v26;
    v23[6] = v28;
    uint64_t v10 = *(void *)(a1 + 40);
    v23[4] = *(void *)(a1 + 32);
    [v7 composedWaypointForMapItem:v8 useAsLocation:0 forQuickETA:v9 traits:v10 completionHandler:v23 networkActivityHandler:0];

    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
    uint64_t v11 = (void *)MEMORY[0x1E4F644F0];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) destination];
    uint64_t v13 = *(unsigned __int8 *)(a1 + 56);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_2_22;
    v22[3] = &unk_1E54BE838;
    v22[5] = v24;
    v22[6] = v28;
    uint64_t v14 = *(void *)(a1 + 40);
    v22[4] = *(void *)(a1 + 32);
    [v11 composedWaypointForMapItem:v12 useAsLocation:0 forQuickETA:v13 traits:v14 completionHandler:v22 networkActivityHandler:0];

    uint64_t v15 = *(void *)(a1 + 32);
    double v16 = *(NSObject **)(v15 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_3;
    block[3] = &unk_1E54BE860;
    void block[4] = v15;
    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = v26;
    id v20 = v24;
    uint64_t v21 = v28;
    dispatch_group_notify(v16, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);

    _Block_object_dispose(v28, 8);
  }
}

void __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_2_22(void *a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  id v12 = v7;
  uint64_t v8 = *(void *)(a1[6] + 8);
  uint64_t v11 = *(void **)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  uint64_t v10 = v11;
  if (v11) {
    id v7 = v10;
  }
  objc_storeStrong(v9, v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 48));
}

void __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke_20(void *a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  id v6 = a2;
  id v7 = a3;
  id v12 = v7;
  uint64_t v8 = *(void *)(a1[6] + 8);
  uint64_t v11 = *(void **)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  uint64_t v10 = v11;
  if (v11) {
    id v7 = v10;
  }
  objc_storeStrong(v9, v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 48));
}

- (void)_cleanupLocationOperation
{
  [(MKLocationManagerOperation *)self->_locationOperation cancel];
  locationOperation = self->_locationOperation;
  self->_locationOperation = 0;
}

void __49__MKDirections__establishCurrentLocationAndThen___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3;
  if (!(a2 | v5))
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:MKErrorDomain code:1 userInfo:0];
  }
  id v8 = (id)v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  [(MKDirections *)self _cleanupLocationOperation];
  v3.receiver = self;
  v3.super_class = (Class)MKDirections;
  [(MKDirections *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousError, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_waypointsDispatchGroup, 0);
  objc_storeStrong((id *)&self->_locationOperation, 0);
  objc_storeStrong((id *)&self->_etaRequester, 0);
  objc_storeStrong((id *)&self->_etaRequest, 0);
  objc_storeStrong((id *)&self->_geoRequest, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)_establishCurrentLocationAndThen:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  id v8 = __49__MKDirections__establishCurrentLocationAndThen___block_invoke;
  uint64_t v9 = &unk_1E54B8630;
  uint64_t v10 = self;
  id v11 = v4;
  uint64_t v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = v4;
  if (objc_msgSend(v5, "isMainThread", v7, 3221225472)) {
    v8((uint64_t)&v7);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v7);
  }
}

- (MKDirections)init
{
  return [(MKDirections *)self initWithRequest:0];
}

- (void)cancel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  objc_super v3 = __22__MKDirections_cancel__block_invoke;
  id v4 = &unk_1E54B8188;
  uint64_t v5 = self;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v3((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void *__22__MKDirections_cancel__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupLocationOperation];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 16))
  {
    objc_super v3 = [MEMORY[0x1E4F64530] sharedRequester];
    [v3 cancelRequest:*(void *)(*(void *)(a1 + 32) + 16)];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  result = *(void **)(v2 + 32);
  if (result)
  {
    return (void *)[result cancel];
  }
  return result;
}

uint64_t __87__MKDirections__performWithValidCurrentLocationAndWaypointsForQuickETA_traits_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)calculateDirectionsWithCompletionHandler:(MKDirectionsHandler)completionHandler
{
  MKDirectionsHandler v4 = completionHandler;
  uint64_t v5 = +[MKMapService sharedService];
  objc_msgSend(v5, "defaultTraitsWithTransportType:", -[MKDirectionsRequest transportType](self->_request, "transportType"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(MKDirections *)self _calculateDirectionsWithTraits:v6 completionHandler:v4];
}

- (void)_calculateDirectionsWithTraits:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MKDirectionsRequest *)self->_request transportType] == 4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __65__MKDirections__calculateDirectionsWithTraits_completionHandler___block_invoke;
    block[3] = &unk_1E54B82E8;
    id v8 = &v15;
    id v15 = v7;
    id v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__MKDirections__calculateDirectionsWithTraits_completionHandler___block_invoke_2;
    v11[3] = &unk_1E54BE8B0;
    id v8 = &v13;
    id v13 = v7;
    v11[4] = self;
    id v12 = v6;
    id v10 = v7;
    [(MKDirections *)self _performWithValidCurrentLocationAndWaypointsForQuickETA:0 traits:v12 handler:v11];
  }
}

void __65__MKDirections__calculateDirectionsWithTraits_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:MKErrorDomain code:5 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __65__MKDirections__calculateDirectionsWithTraits_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F64528]);
    id v10 = [MEMORY[0x1E4F28B50] mainBundle];
    id v11 = [v10 bundleIdentifier];
    id v12 = (void *)[v9 initWithPurpose:4 andSource:4 andIdentifier:v11];

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F64520]) initWithDirectionsRequest:*(void *)(*(void *)(a1 + 32) + 8) origin:v7 destination:v8 withFeedback:v12];
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 16);
    *(void *)(v14 + 16) = v13;

    [*(id *)(*(void *)(a1 + 32) + 16) setIsFromAPI:1];
    if ([*(id *)(*(void *)(a1 + 32) + 8) _resolveExtraAutomobileOptions])
    {
      id v16 = objc_alloc(MEMORY[0x1E4F7A080]);
      id v17 = [*(id *)(*(void *)(a1 + 32) + 16) routeAttributes];
      v25[0] = v7;
      v25[1] = v8;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      uint64_t v19 = [v16 initWithAttributes:v17 waypoints:v18];
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void **)(v20 + 56);
      *(void *)(v20 + 56) = v19;
    }
    else
    {
      uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 16) routeAttributes];
      uint64_t v23 = *(void *)(a1 + 32);
      uint64_t v24 = *(void **)(v23 + 56);
      *(void *)(v23 + 56) = v22;
    }
    [*(id *)(a1 + 32) _issueDirectionsRequestForOrigin:v7 destination:v8 traits:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

- (void)_issueDirectionsRequestForOrigin:(id)a3 destination:(id)a4 traits:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  routeAttributes = self->_routeAttributes;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke;
  v19[3] = &unk_1E54BE928;
  id v22 = v12;
  id v23 = v13;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  [(GEORouteAttributes *)routeAttributes buildRouteAttributes:MEMORY[0x1E4F14428] result:v19];
}

void __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setRouteAttributes:a2];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke_2;
    v18[3] = &unk_1E54BE8D8;
    objc_super v3 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v3;
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 64);
    MKDirectionsHandler v4 = (void *)MEMORY[0x18C139AE0](v18);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke_3;
    v13[3] = &unk_1E54BE900;
    uint64_t v5 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v14 = v5;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 64);
    id v6 = (void *)MEMORY[0x18C139AE0](v13);
    id v7 = [MEMORY[0x1E4F64530] sharedRequester];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(v8 + 16);
    uint64_t v11 = [*(id *)(v8 + 8) _useBackgroundURL];
    [v7 startRequest:v10 traits:v9 auditToken:0 useBackgroundURL:v11 callbackQueue:MEMORY[0x1E4F14428] finished:v4 networkActivity:0 error:v6];
  }
  else
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v12();
  }
}

void __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke_2(void *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = a1[4];
    uint64_t v3 = a1[5];
    uint64_t v6 = *(void *)(v4 + 8);
    uint64_t v5 = *(void *)(v4 + 16);
    uint64_t v7 = a1[6];
    id v14 = 0;
    uint64_t v8 = +[MKDirectionsResponse _responseWithGEODirectionsRouteResponse:a2 routeRequest:v5 request:v6 origin:v3 destination:v7 error:&v14];
    id v9 = v14;
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = (void *)[v10 initWithDomain:MKErrorDomain code:1 userInfo:0];
    (*(void (**)(void))(a1[7] + 16))();
  }
  uint64_t v12 = a1[4];
  id v13 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = 0;
}

void __86__MKDirections__issueDirectionsRequestForOrigin_destination_traits_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6
    && (uint64_t v8 = *(void *)(a1 + 32), v10 = *(void *)(v8 + 64), v9 = (id *)(v8 + 64), !v10)
    && (objc_storeStrong(v9, a2),
        [*(id *)(*(void *)(a1 + 32) + 56) shouldRetryForError:v6]))
  {
    [*(id *)(a1 + 32) _issueDirectionsRequestForOrigin:*(void *)(a1 + 40) destination:*(void *)(a1 + 48) traits:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
  }
  else
  {
    if ([v6 code] != -2
      || ([v6 domain],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v11 isEqualToString:v12],
          v12,
          v11,
          (v13 & 1) == 0))
    {
      if (*(void *)(a1 + 40) && (uint64_t v14 = *(void *)(a1 + 48)) != 0)
      {
        id v15 = (void *)MEMORY[0x1E4F1C9E8];
        v21[0] = *(void *)(a1 + 40);
        v21[1] = v14;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
        id v17 = objc_msgSend(v15, "_navigation_stringTokensForDirectionsError:waypoints:", v7, v16);
      }
      else
      {
        id v17 = 0;
      }
      id v18 = objc_msgSend(v6, "_mapkit_errorWithDirectionsError:stringTokens:", v7, v17);
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = *(void **)(v19 + 16);
    *(void *)(v19 + 16) = 0;
  }
}

@end