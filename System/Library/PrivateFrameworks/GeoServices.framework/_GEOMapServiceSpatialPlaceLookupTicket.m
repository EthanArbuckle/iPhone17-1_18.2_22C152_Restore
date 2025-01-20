@interface _GEOMapServiceSpatialPlaceLookupTicket
+ (unint64_t)maxParametersCount;
- (NSArray)parameters;
- (_GEOMapServiceSpatialPlaceLookupTicket)initWithRequest:(id)a3 parameters:(id)a4 traits:(id)a5;
- (id)mapItemsForPlaceLookupResponses:(id)a3 usingIdentifierToMapItemMap:(id)a4;
- (id)spatialPlaceLookupResultsFromResponse:(id)a3;
- (void)callCompletion:(id)a3 onQueue:(id)a4 withResult:(id)a5 error:(id)a6;
- (void)createSpatialPlaceLookupResultForLookupResults:(id)a3 mapItems:(id)a4 completion:(id)a5 queue:(id)a6;
- (void)handleResponse:(id)a3 completion:(id)a4 queue:(id)a5;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 queue:(id)a5;
- (void)submitWithHandler:(id)a3 queue:(id)a4;
@end

@implementation _GEOMapServiceSpatialPlaceLookupTicket

+ (unint64_t)maxParametersCount
{
  return GEOConfigGetUInteger(GeoServicesConfig_BatchSpatialPlaceLookupMaxParametersCount, (uint64_t)off_1E9113C78);
}

- (_GEOMapServiceSpatialPlaceLookupTicket)initWithRequest:(id)a3 parameters:(id)a4 traits:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_GEOMapServiceSpatialPlaceLookupTicket;
  v10 = [(_GEOPlaceRequestTicket *)&v13 initWithRequest:a3 traits:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_parameters, a4);
  }

  return v11;
}

- (void)submitWithHandler:(id)a3 queue:(id)a4
{
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 queue:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    unint64_t v11 = +[_GEOMapServiceSpatialPlaceLookupTicket maxParametersCount];
    if (v11 >= [(NSArray *)self->_parameters count])
    {
      v16 = +[GEOPlaceCardRequester sharedRequester];
      request = self->super._request;
      traits = self->super.super.super._traits;
      unint64_t cachePolicy = self->super.super.super._cachePolicy;
      throttlerToken = self->super.super.super._throttlerToken;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __77___GEOMapServiceSpatialPlaceLookupTicket_submitWithHandler_auditToken_queue___block_invoke;
      v24[3] = &unk_1E53DEBC8;
      v24[4] = self;
      id v26 = v8;
      id v25 = v10;
      id v21 = (id)[v16 performPlaceDataRequest:request traits:traits cachePolicy:cachePolicy timeout:v9 auditToken:throttlerToken throttleToken:0 networkActivity:0.0 requesterHandler:v24];

      v22 = +[GEONotificationPreferenceManager sharedManager];
      LODWORD(request) = [v22 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequestTicket_PlaceDataRequest"];

      if (request)
      {
        v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v23 postNotificationName:@"GEOPPTTest_PlaceRequestTicket_PlaceDataRequestBEGIN" object:self->super._request];
      }
    }
    else
    {
      v12 = GEOGetGEOBatchSpatialLookupLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSUInteger v13 = [(NSArray *)self->_parameters count];
        *(_DWORD *)buf = 134218240;
        NSUInteger v28 = v13;
        __int16 v29 = 2048;
        unint64_t v30 = v11;
        _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "SpatialPlaceLookup ticket submission failed. Too many parameters: %lu max allowed: %lu", buf, 0x16u);
      }

      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Lookup parameters count exceeds maximum allowed count %lu.", v11);
      v15 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:v14];
      [(_GEOMapServiceSpatialPlaceLookupTicket *)self callCompletion:v8 onQueue:v10 withResult:0 error:v15];
    }
  }
}

- (void)handleResponse:(id)a3 completion:(id)a4 queue:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)&self->super._response, a3);
  if ([v9 hasStatus] && !objc_msgSend(v9, "status"))
  {
    NSUInteger v13 = [(_GEOMapServiceSpatialPlaceLookupTicket *)self spatialPlaceLookupResultsFromResponse:v9];
    v14 = v13;
    if (v13 && (uint64_t v15 = [v13 count], v15 == -[NSArray count](self->_parameters, "count")))
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      unint64_t v30 = v14;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v36;
        while (2)
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * v20);
            if (!v21
              || (*(unsigned char *)(v21 + 56) & 1) == 0
              || -[GEOPDSpatialPlaceLookupResult statusCode](*(void *)(*((void *)&v35 + 1) + 8 * v20))
              && -[GEOPDSpatialPlaceLookupResult statusCode](v21) != 20)
            {
              __int16 v29 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Received unexpected response"];
              [(_GEOMapServiceSpatialPlaceLookupTicket *)self callCompletion:v10 onQueue:v11 withResult:0 error:v29];

              goto LABEL_23;
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      uint64_t v22 = [(GEOPDPlaceRequest *)self->super._request requestType];
      v23 = [v9 resultsWithResultType:1];
      v24 = [v9 _disambiguationLabels];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __74___GEOMapServiceSpatialPlaceLookupTicket_handleResponse_completion_queue___block_invoke;
      v31[3] = &unk_1E53DE7A8;
      v31[4] = self;
      id v34 = v10;
      id v32 = v11;
      id v33 = v16;
      _attributedGeoMapItemsForPlaceDatasWithHandler(v22, v23, v24, 0, 0, 0, v31);

LABEL_23:
      v14 = v30;
    }
    else
    {
      id v25 = GEOGetGEOBatchSpatialLookupLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = [v14 count];
        NSUInteger v27 = [(NSArray *)self->_parameters count];
        *(_DWORD *)buf = 134218240;
        uint64_t v41 = v26;
        __int16 v42 = 2048;
        NSUInteger v43 = v27;
        _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_ERROR, "SpatialPlaceLookup received unexpected lookup result count: %lu expected: %lu", buf, 0x16u);
      }

      NSUInteger v28 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Received unexpected response"];
      [(_GEOMapServiceSpatialPlaceLookupTicket *)self callCompletion:v10 onQueue:v11 withResult:0 error:v28];
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Received unexpected response"];
    [(_GEOMapServiceSpatialPlaceLookupTicket *)self callCompletion:v10 onQueue:v11 withResult:0 error:v12];
  }
}

- (id)spatialPlaceLookupResultsFromResponse:(id)a3
{
  v3 = [a3 globalResult];
  uint64_t v4 = -[GEOPDPlaceGlobalResult batchSpatialLookupResult](v3);

  if (v4 && (*(unsigned char *)(v4 + 56) & 1) != 0 && !-[GEOPDBatchSpatialLookupResult statusCode](v4))
  {
    v5 = -[GEOPDBatchSpatialLookupResult spatialPlaceLookupResults]((id *)v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)createSpatialPlaceLookupResultForLookupResults:(id)a3 mapItems:(id)a4 completion:(id)a5 queue:(id)a6
{
  id v10 = a4;
  id v11 = (void *)MEMORY[0x1E4F28E10];
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = [v11 strongToStrongObjectsMapTable];
  id v16 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __115___GEOMapServiceSpatialPlaceLookupTicket_createSpatialPlaceLookupResultForLookupResults_mapItems_completion_queue___block_invoke;
  v21[3] = &unk_1E53DE7D0;
  v21[4] = self;
  id v22 = v10;
  id v23 = (id)MEMORY[0x1E4F1CBF0];
  id v24 = v15;
  id v25 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v10;
  [v14 enumerateObjectsUsingBlock:v21];

  uint64_t v20 = [[GEOSpatialPlaceLookupResult alloc] initWithMapItemMap:v18 resultItemMap:v17];
  [(_GEOMapServiceSpatialPlaceLookupTicket *)self callCompletion:v13 onQueue:v12 withResult:v20 error:0];
}

- (id)mapItemsForPlaceLookupResponses:(id)a3 usingIdentifierToMapItemMap:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    id v10 = 0;
    uint64_t v11 = *(void *)v30;
    id v12 = off_1E53D4000;
    *(void *)&long long v8 = 138477827;
    long long v27 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v28 = v9;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v5);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
        if (objc_msgSend(v14, "hasPlaceId", v27))
        {
          id v15 = objc_alloc(v12[269]);
          id v16 = [v14 placeId];
          id v17 = (void *)[v15 initWithMapsIdentifier:v16];

          id v18 = [v6 objectForKey:v17];
          if (v18)
          {
            if (!v10) {
              id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
            }
            [v10 addObject:v18];
          }
          else
          {
            uint64_t v19 = v11;
            uint64_t v20 = v10;
            id v21 = v5;
            id v22 = v6;
            id v23 = v12;
            id v24 = GEOGetGEOBatchSpatialLookupLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              id v25 = [v14 placeId];
              *(_DWORD *)buf = v27;
              id v34 = v25;
              _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "SpatialPlaceLookup place data missing for place identifier: %{private}@", buf, 0xCu);
            }
            id v12 = v23;
            id v6 = v22;
            id v5 = v21;
            id v10 = v20;
            uint64_t v11 = v19;
            uint64_t v9 = v28;
          }
        }
        ++v13;
      }
      while (v9 != v13);
      uint64_t v9 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)callCompletion:(id)a3 onQueue:(id)a4 withResult:(id)a5 error:(id)a6
{
  id v10 = a3;
  uint64_t v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    uint64_t v11 = MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82___GEOMapServiceSpatialPlaceLookupTicket_callCompletion_onQueue_withResult_error___block_invoke;
  v18[3] = &unk_1E53DE528;
  v18[4] = self;
  id v19 = v12;
  id v20 = v13;
  id v21 = v10;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  dispatch_async(v11, v18);
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
}

@end