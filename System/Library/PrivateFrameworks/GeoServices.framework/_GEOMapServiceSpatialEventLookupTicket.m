@interface _GEOMapServiceSpatialEventLookupTicket
+ (unint64_t)maxParametersCount;
- (NSArray)parameters;
- (_GEOMapServiceSpatialEventLookupTicket)initWithRequest:(id)a3 parameters:(id)a4 traits:(id)a5;
- (id)eventsForEventLookupResponses:(id)a3 usingIdentifierToEventMap:(id)a4;
- (id)mapItemIdentifiersToPOIEventsMapForPlaces:(id)a3;
- (id)spatialEventLookupResultsFromResponse:(id)a3;
- (void)callCompletion:(id)a3 onQueue:(id)a4 withResult:(id)a5 error:(id)a6;
- (void)createSpatialEventLookupResultForLookupResults:(id)a3 usingPlaces:(id)a4 completion:(id)a5 queue:(id)a6;
- (void)handleResponse:(id)a3 completion:(id)a4 queue:(id)a5;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 queue:(id)a5;
- (void)submitWithHandler:(id)a3 queue:(id)a4;
@end

@implementation _GEOMapServiceSpatialEventLookupTicket

+ (unint64_t)maxParametersCount
{
  return GEOConfigGetUInteger(GeoServicesConfig_BatchSpatialEventLookupMaxParametersCount, (uint64_t)off_1E9113C88);
}

- (_GEOMapServiceSpatialEventLookupTicket)initWithRequest:(id)a3 parameters:(id)a4 traits:(id)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_GEOMapServiceSpatialEventLookupTicket;
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
    unint64_t v11 = +[_GEOMapServiceSpatialEventLookupTicket maxParametersCount];
    if (v11 >= [(NSArray *)self->_parameters count])
    {
      v16 = +[GEOPlaceCardRequester sharedRequester];
      request = self->super._request;
      traits = self->super.super.super._traits;
      unint64_t cachePolicy = self->super.super.super._cachePolicy;
      throttlerToken = self->super.super.super._throttlerToken;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __77___GEOMapServiceSpatialEventLookupTicket_submitWithHandler_auditToken_queue___block_invoke;
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
        _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "SpatialEventLookup ticket submission failed. Too many parameters: %lu max allowed: %lu", buf, 0x16u);
      }

      v14 = objc_msgSend(NSString, "stringWithFormat:", @"Lookup parameters count exceeds maximum allowed count %lu.", v11);
      v15 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:v14];
      [(_GEOMapServiceSpatialEventLookupTicket *)self callCompletion:v8 onQueue:v10 withResult:0 error:v15];
    }
  }
}

- (void)handleResponse:(id)a3 completion:(id)a4 queue:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)&self->super._response, a3);
  if ([v9 hasStatus] && !objc_msgSend(v9, "status"))
  {
    NSUInteger v13 = [(_GEOMapServiceSpatialEventLookupTicket *)self spatialEventLookupResultsFromResponse:v9];
    v14 = v13;
    if (v13 && (uint64_t v15 = [v13 count], v15 == -[NSArray count](self->_parameters, "count")))
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v30;
        NSUInteger v28 = v14;
        while (2)
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * v20);
            if (!v21
              || (*(unsigned char *)(v21 + 56) & 1) == 0
              || -[GEOPDSpatialEventLookupResult statusCode](*(void *)(*((void *)&v29 + 1) + 8 * v20))
              && -[GEOPDSpatialEventLookupResult statusCode](v21) != 20)
            {
              id v26 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Received unexpected response"];
              [(_GEOMapServiceSpatialEventLookupTicket *)self callCompletion:v10 onQueue:v11 withResult:0 error:v26];

              v14 = v28;
              goto LABEL_26;
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
          v14 = v28;
          if (v18) {
            continue;
          }
          break;
        }
      }

      v22 = [v9 resultsWithResultType:1];
      if ([v22 count])
      {
        [(_GEOMapServiceSpatialEventLookupTicket *)self createSpatialEventLookupResultForLookupResults:v16 usingPlaces:v22 completion:v10 queue:v11];
      }
      else
      {
        v27 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:0];
        [(_GEOMapServiceSpatialEventLookupTicket *)self callCompletion:v10 onQueue:v11 withResult:0 error:v27];
      }
      id v16 = v22;
    }
    else
    {
      v23 = GEOGetGEOBatchSpatialLookupLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v14 count];
        NSUInteger v25 = [(NSArray *)self->_parameters count];
        *(_DWORD *)buf = 134218240;
        uint64_t v35 = v24;
        __int16 v36 = 2048;
        NSUInteger v37 = v25;
        _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_ERROR, "SpatialEventLookup received unexpected lookup result count: %lu expected: %lu", buf, 0x16u);
      }

      id v16 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Received unexpected response"];
      [(_GEOMapServiceSpatialEventLookupTicket *)self callCompletion:v10 onQueue:v11 withResult:0 error:v16];
    }
LABEL_26:
  }
  else
  {
    v12 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Received unexpected response"];
    [(_GEOMapServiceSpatialEventLookupTicket *)self callCompletion:v10 onQueue:v11 withResult:0 error:v12];
  }
}

- (void)createSpatialEventLookupResultForLookupResults:(id)a3 usingPlaces:(id)a4 completion:(id)a5 queue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  NSUInteger v13 = [(_GEOMapServiceSpatialEventLookupTicket *)self mapItemIdentifiersToPOIEventsMapForPlaces:a4];
  v14 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __118___GEOMapServiceSpatialEventLookupTicket_createSpatialEventLookupResultForLookupResults_usingPlaces_completion_queue___block_invoke;
  v22 = &unk_1E53DE7F8;
  v23 = self;
  id v24 = v13;
  id v25 = (id)MEMORY[0x1E4F1CBF0];
  id v26 = v14;
  id v15 = v14;
  id v16 = v13;
  [v12 enumerateObjectsUsingBlock:&v19];

  uint64_t v17 = [GEOSpatialEventLookupResult alloc];
  uint64_t v18 = -[GEOSpatialEventLookupResult initWithMapTable:](v17, "initWithMapTable:", v15, v19, v20, v21, v22, v23);
  [(_GEOMapServiceSpatialEventLookupTicket *)self callCompletion:v11 onQueue:v10 withResult:v18 error:0];
}

- (id)mapItemIdentifiersToPOIEventsMapForPlaces:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [GEOPOIEvent alloc];
        id v12 = -[GEOPOIEvent initWithPlace:](v11, "initWithPlace:", v10, (void)v16);
        NSUInteger v13 = v12;
        if (v12)
        {
          v14 = [(GEOPOIEvent *)v12 identifier];
          [v4 setObject:v13 forKey:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)spatialEventLookupResultsFromResponse:(id)a3
{
  id v3 = [a3 globalResult];
  uint64_t v4 = -[GEOPDPlaceGlobalResult batchSpatialLookupResult](v3);

  if (v4 && (*(unsigned char *)(v4 + 56) & 1) != 0 && !-[GEOPDBatchSpatialLookupResult statusCode](v4))
  {
    id v5 = -[GEOPDBatchSpatialLookupResult spatialEventLookupResults]((id *)v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)eventsForEventLookupResponses:(id)a3 usingIdentifierToEventMap:(id)a4
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
    uint64_t v10 = 0;
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
        v14 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
        if (objc_msgSend(v14, "hasEventId", v27))
        {
          id v15 = objc_alloc(v12[269]);
          long long v16 = [v14 eventId];
          long long v17 = (void *)[v15 initWithMapsIdentifier:v16];

          long long v18 = [v6 objectForKey:v17];
          if (v18)
          {
            if (!v10) {
              uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
            }
            [v10 addObject:v18];
          }
          else
          {
            uint64_t v19 = v11;
            uint64_t v20 = v10;
            id v21 = v5;
            id v22 = v6;
            v23 = v12;
            id v24 = GEOGetGEOBatchSpatialLookupLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              id v25 = [v14 eventId];
              *(_DWORD *)buf = v27;
              v34 = v25;
              _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "SpatialEventLookup place data missing for event identifier: %{private}@", buf, 0xCu);
            }
            id v12 = v23;
            id v6 = v22;
            id v5 = v21;
            uint64_t v10 = v20;
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
    uint64_t v10 = 0;
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
  v18[2] = __82___GEOMapServiceSpatialEventLookupTicket_callCompletion_onQueue_withResult_error___block_invoke;
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