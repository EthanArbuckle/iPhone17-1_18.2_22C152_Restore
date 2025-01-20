@interface _GEOPlaceRequestTicket
- ($C4D369C9F02205611300857CFD58F739)dataRequestKind;
- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4;
- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4 mapItemToRefine:(id)a5;
- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4 mapItemToRefine:(id)a5 preSubmitUpdateRequestBlock:(id)a6 retryForErrorBlock:(id)a7;
- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4 preSubmitUpdateRequestBlock:(id)a5 retryForErrorBlock:(id)a6;
- (_GEOPlaceRequestTicket)initWithTraits:(id)a3;
- (id)description;
- (id)geoMapItemIdentifier:(id)a3;
- (id)resultSectionHeader;
- (void)_processRequest:(id)a3 auditToken:(id)a4 timeout:(double)a5 withHandler:(id)a6 refinedHandler:(id)a7 networkActivity:(id)a8;
- (void)applyToCorrectedSearch:(id)a3;
- (void)applyToPlaceInfo:(id)a3;
- (void)cancel;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
@end

@implementation _GEOPlaceRequestTicket

- (void)_processRequest:(id)a3 auditToken:(id)a4 timeout:(double)a5 withHandler:(id)a6 refinedHandler:(id)a7 networkActivity:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v16)
  {
    int v19 = [v14 requestType];
    uint64_t v20 = 6;
    uint64_t v21 = 5;
    if (v19 != 32) {
      uint64_t v21 = 0;
    }
    if (v19 != 49) {
      uint64_t v20 = v21;
    }
    if (v19 == 6) {
      uint64_t v22 = 4;
    }
    else {
      uint64_t v22 = v20;
    }
    if (_dispatcherSupportsService(v22))
    {
      id v38 = v15;
      v39 = v17;
      if ((([v14 requestType] - 2) & 0xFFFFFFFD) != 0)
      {
        v23 = 0;
      }
      else
      {
        v23 = objc_alloc_init(GEOMapItemInitialRequestData);
        -[GEOMapItemInitialRequestData setRequestType:](v23, "setRequestType:", [v14 requestType]);
        v25 = [v14 placeRequestParameters];
        v26 = (void *)[v25 copy];
        [(GEOMapItemInitialRequestData *)v23 setPlaceRequestParameters:v26];
      }
      v27 = +[GEOPlaceCardRequester sharedRequester];
      traits = self->super.super._traits;
      unint64_t cachePolicy = self->super.super._cachePolicy;
      throttlerToken = self->super.super._throttlerToken;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke;
      v40[3] = &unk_1E53DE690;
      v40[4] = self;
      id v43 = v16;
      v31 = v23;
      v41 = v31;
      id v32 = v14;
      id v42 = v32;
      id v44 = v39;
      v33 = traits;
      id v15 = v38;
      v34 = [v27 performPlaceDataRequest:v32 traits:v33 cachePolicy:cachePolicy timeout:v38 auditToken:throttlerToken throttleToken:v18 networkActivity:a5 requesterHandler:v40];
      id requestToken = self->_requestToken;
      self->_id requestToken = v34;

      v36 = +[GEONotificationPreferenceManager sharedManager];
      LODWORD(throttlerToken) = [v36 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequestTicket_PlaceDataRequest"];

      if (throttlerToken)
      {
        v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v37 postNotificationName:@"GEOPPTTest_PlaceRequestTicket_PlaceDataRequestBEGIN" object:v32];
      }
      id v17 = v39;
    }
    else
    {
      v24 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-6];
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v24);
    }
  }
}

- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4 mapItemToRefine:(id)a5 preSubmitUpdateRequestBlock:(id)a6 retryForErrorBlock:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_GEOPlaceRequestTicket;
  id v17 = [(GEOAbstractTicket *)&v25 initWithTraits:a4];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_request, a3);
    objc_storeStrong((id *)&v18->_mapItemToRefine, a5);
    uint64_t v19 = MEMORY[0x18C120660](v15);
    id preSubmitUpdateRequestBlock = v18->_preSubmitUpdateRequestBlock;
    v18->_id preSubmitUpdateRequestBlock = (id)v19;

    uint64_t v21 = MEMORY[0x18C120660](v16);
    id retryRequestForErrorBlock = v18->_retryRequestForErrorBlock;
    v18->_id retryRequestForErrorBlock = (id)v21;

    v23 = v18;
  }

  return v18;
}

- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4
{
  return [(_GEOPlaceRequestTicket *)self initWithRequest:a3 traits:a4 mapItemToRefine:0 preSubmitUpdateRequestBlock:0 retryForErrorBlock:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryRequestForErrorBlock, 0);
  objc_storeStrong(&self->_preSubmitUpdateRequestBlock, 0);
  objc_storeStrong((id *)&self->_mapItemToRefine, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_requestToken, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (self->_retryRequestForErrorBlock)
  {
    id v13 = (void *)MEMORY[0x18C120660](v10);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
    v33[3] = &unk_1E53DE6B8;
    v33[4] = self;
    id v35 = v13;
    id v34 = v11;
    int64_t v37 = a5;
    id v36 = v12;
    id v14 = v13;
    id v15 = (void *)MEMORY[0x18C120660](v33);
    uint64_t v16 = MEMORY[0x18C120660]();

    id v10 = (id)v16;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2;
  v28[3] = &unk_1E53DE6E0;
  v28[4] = self;
  id v17 = v11;
  id v29 = v17;
  int64_t v32 = a5;
  id v18 = v10;
  id v30 = v18;
  id v19 = v12;
  id v31 = v19;
  uint64_t v20 = (void (**)(void))MEMORY[0x18C120660](v28);
  uint64_t v21 = +[GEONotificationPreferenceManager sharedManager];
  int v22 = [v21 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest"];

  if (v22)
  {
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 postNotificationName:@"GEOPPTTest_PlaceRequestBEGIN" object:0];
  }
  v24 = +[GEONotificationPreferenceManager sharedManager];
  int v25 = [v24 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest_RequestPreparing"];

  if (v25)
  {
    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 postNotificationName:@"GEOPPTTest_PlaceRequest_RequestPreparingBEGIN" object:0];
  }
  if (self->_preSubmitUpdateRequestBlock)
  {
    v27 = v20;
    geo_dispatch_async_qos();
  }
  else
  {
    v20[2](v20);
  }
}

- (_GEOPlaceRequestTicket)initWithTraits:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_GEOPlaceRequestTicket;
  return [(GEOAbstractTicket *)&v4 initWithTraits:a3];
}

- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4 preSubmitUpdateRequestBlock:(id)a5 retryForErrorBlock:(id)a6
{
  return [(_GEOPlaceRequestTicket *)self initWithRequest:a3 traits:a4 mapItemToRefine:0 preSubmitUpdateRequestBlock:a5 retryForErrorBlock:a6];
}

- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4 mapItemToRefine:(id)a5
{
  return [(_GEOPlaceRequestTicket *)self initWithRequest:a3 traits:a4 mapItemToRefine:a5 preSubmitUpdateRequestBlock:0 retryForErrorBlock:0];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_GEOPlaceRequestTicket;
  objc_super v4 = [(GEOAbstractTicket *)&v8 description];
  v5 = [(GEOPDPlaceRequest *)self->_request formattedText];
  v6 = [v3 stringWithFormat:@"%@ request: %@", v4, v5];

  return v6;
}

- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    if (self->_retryRequestForErrorBlock)
    {
      id v13 = (void *)MEMORY[0x18C120660](v10);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke;
      v26[3] = &unk_1E53DE708;
      v26[4] = self;
      id v28 = v13;
      id v27 = v11;
      int64_t v30 = a5;
      id v29 = v12;
      id v14 = v13;
      id v15 = (void *)MEMORY[0x18C120660](v26);
      uint64_t v16 = MEMORY[0x18C120660]();

      id v10 = (id)v16;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_2;
    v21[3] = &unk_1E53DE6E0;
    v21[4] = self;
    id v22 = v11;
    int64_t v25 = a5;
    id v17 = v10;
    id v23 = v17;
    id v24 = v12;
    id v18 = (void (**)(void))MEMORY[0x18C120660](v21);
    id v19 = v18;
    if (self->_preSubmitUpdateRequestBlock)
    {
      uint64_t v20 = v18;
      geo_dispatch_async_qos();
    }
    else
    {
      v18[2](v18);
    }
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)_GEOPlaceRequestTicket;
  [(GEOAbstractTicket *)&v4 cancel];
  v3 = +[GEOPlaceCardRequester sharedRequester];
  [v3 cancelRequest:self->_requestToken];
}

- (void)applyToCorrectedSearch:(id)a3
{
  request = self->_request;
  id v5 = a3;
  [v5 setPlaceRequest:request];
  [v5 setPlaceResponse:self->_response];
}

- (void)applyToPlaceInfo:(id)a3
{
  request = self->_request;
  id v5 = a3;
  [v5 setPlaceRequest:request];
  [v5 setPlaceResponse:self->_response];
}

- (id)resultSectionHeader
{
  if ([(GEOPDPlaceResponse *)self->_response requestType] == 13)
  {
    v3 = [(GEOPDPlaceResponse *)self->_response globalResult];
    -[GEOPDPlaceGlobalResult popularNearbySearchResult](v3);
    objc_super v4 = (id *)objc_claimAutoreleasedReturnValue();
    id v5 = -[GEOPDPopularNearbySearchResult sectionHeader](v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  int v3 = [(GEOMapServiceTraits *)self->super.super._traits requestPriority];
  if (v3 == 2)
  {
    p_request = &self->_request;
    uint64_t v5 = 1792;
  }
  else
  {
    if (v3 == 1)
    {
      p_request = &self->_request;
LABEL_8:
      uint64_t v5 = 1280;
      return ($C4D369C9F02205611300857CFD58F739)(v5 | ([(GEOPDPlaceRequest *)*p_request requestType] << 32));
    }
    p_request = &self->_request;
    if ([(GEOPDPlaceRequest *)self->_request requestType] == 32
      && ![(GEOMapServiceTraits *)self->super.super._traits hasRequestPriority])
    {
      goto LABEL_8;
    }
    uint64_t v5 = 768;
  }
  return ($C4D369C9F02205611300857CFD58F739)(v5 | ([(GEOPDPlaceRequest *)*p_request requestType] << 32));
}

- (id)geoMapItemIdentifier:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[GEOMapItemIdentifier alloc] initWithMapsIdentifier:v3];

  return v4;
}

@end