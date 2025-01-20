@interface GEOPlaceCardRequester
+ (id)sharedRequester;
- (GEOPlaceCardRequester)init;
- (id)_createServerConnection:(id)a3;
- (id)_takeConnectionForRequestUUID:(id)a3;
- (id)performPlaceDataRequest:(id)a3 traits:(id)a4 cachePolicy:(unint64_t)a5 timeout:(double)a6 auditToken:(id)a7 throttleToken:(id)a8 networkActivity:(id)a9 requesterHandler:(id)a10;
- (id)requestIdentifiers:(id)a3 resultProviderID:(int)a4 traits:(id)a5 options:(unint64_t)a6 auditToken:(id)a7 throttleToken:(id)a8 networkActivity:(id)a9 requesterHandler:(id)a10;
- (id)requestPhoneNumbers:(id)a3 allowCellularDataForLookup:(BOOL)a4 traits:(id)a5 auditToken:(id)a6 throttleToken:(id)a7 networkActivity:(id)a8 requesterHandler:(id)a9;
- (unint64_t)calculateFreeableSpaceSync;
- (unint64_t)shrinkBySizeSync:(unint64_t)a3;
- (void)calculateFreeableSpaceWithHandler:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)clearCache;
- (void)fetchAllCacheEntriesWithRequesterHandler:(id)a3;
- (void)shrinkBySize:(unint64_t)a3 finished:(id)a4;
- (void)trackPlaceData:(id)a3;
@end

@implementation GEOPlaceCardRequester

+ (id)sharedRequester
{
  if (qword_1EB29F628 != -1) {
    dispatch_once(&qword_1EB29F628, &__block_literal_global_24);
  }
  v2 = (void *)_MergedGlobals_194;

  return v2;
}

- (id)performPlaceDataRequest:(id)a3 traits:(id)a4 cachePolicy:(unint64_t)a5 timeout:(double)a6 auditToken:(id)a7 throttleToken:(id)a8 networkActivity:(id)a9 requesterHandler:(id)a10
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  [v15 clearSensitiveFields:0];
  v63 = v18;
  if (![v15 hasPlaceRequestParameters]) {
    goto LABEL_16;
  }
  uint64_t v20 = [v15 placeRequestParameters];
  if (!v20) {
    goto LABEL_16;
  }
  v21 = (void *)v20;
  -[GEOPDPlaceRequestParameters _readMapsIdentifierPlaceLookupParameters](v20);
  uint64_t v22 = v21[29];

  if (!v22) {
    goto LABEL_16;
  }
  id v60 = v19;
  v23 = [v15 placeRequestParameters];
  -[GEOPDPlaceRequestParameters mapsIdentifierPlaceLookupParameters](v23);
  v24 = (id *)objc_claimAutoreleasedReturnValue();
  v25 = -[GEOPDMapsIdentifierPlaceLookupParameters mapsIds](v24);

  long long v78 = 0u;
  long long v79 = 0u;
  long long v77 = 0u;
  long long v76 = 0u;
  id v26 = v25;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    int v29 = 0;
    uint64_t v30 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v77 != v30) {
          objc_enumerationMutation(v26);
        }
        v29 += [*(id *)(*((void *)&v76 + 1) + 8 * i) isValidMapsIdentifier];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v76 objects:v82 count:16];
    }
    while (v28);
  }
  else
  {
    int v29 = 0;
  }

  if ([v26 count] && v29 == objc_msgSend(v26, "count"))
  {

    id v19 = v60;
LABEL_16:
    if (!v16)
    {
      v32 = +[GEOMapService sharedService];
      id v16 = [v32 defaultTraits];
    }
    id v61 = v17;
    v33 = [[GEOPlaceRequestMessage alloc] initWithTraits:v16 auditToken:v17 throttleToken:v18];
    id v34 = v15;
    v35 = v34;
    if (v34)
    {
      if ([v34 requestType] == 1)
      {
        v36 = NSString;
        v37 = [v35 placeRequestParameters];
        -[GEOPDPlaceRequestParameters searchParameters](v37);
        v38 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDSearchParameters searchString](v38);
        v39 = self;
        id v40 = v15;
        id v41 = v16;
        v43 = id v42 = v19;
        v44 = [v36 stringWithFormat:@"REQUEST_TYPE_SEARCH:'%@'", v43];

        id v19 = v42;
        id v16 = v41;
        id v15 = v40;
        self = v39;
      }
      else
      {
        uint64_t v45 = [v35 requestType];
        if (v45 >= 0x3F)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v45);
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v44 = off_1E53DAE98[(int)v45];
        }
      }
    }
    else
    {
      v44 = @"nil";
    }

    v50 = [MEMORY[0x1E4F29128] UUID];
    [(GEOPlaceRequestMessage *)v33 setRequestUUID:v50];

    [(GEOPlaceRequestMessage *)v33 setRequest:v35];
    [(GEOPlaceRequestMessage *)v33 setCachePolicy:a5];
    [(GEOPlaceRequestMessage *)v33 setTimeout:a6];
    v51 = [(GEOPlaceCardRequester *)self _createServerConnection:v16];
    uint64_t v69 = MEMORY[0x1E4F143A8];
    uint64_t v70 = 3221225472;
    v71 = __134__GEOPlaceCardRequester_performPlaceDataRequest_traits_cachePolicy_timeout_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke;
    v72 = &unk_1E53D99F0;
    v73 = self;
    v52 = v33;
    v74 = v52;
    id v26 = v51;
    id v75 = v26;
    geo_isolate_sync_data();
    v53 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v81 = v35;
      _os_log_impl(&dword_188D96000, v53, OS_LOG_TYPE_DEBUG, "Performing place data request: %p", buf, 0xCu);
    }

    v54 = +[GEONotificationPreferenceManager sharedManager];
    int v55 = [v54 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceDataRequest_GEOD"];

    if (v55)
    {
      v56 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v56 postNotificationName:@"GEOPPTTest_PlaceDataRequest_GEODBEGIN" object:v44];
    }
    requestQ = self->_requestQ;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __134__GEOPlaceCardRequester_performPlaceDataRequest_traits_cachePolicy_timeout_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_45;
    v64[3] = &unk_1E53DAE28;
    v65 = v44;
    v66 = self;
    v67 = v52;
    id v68 = v19;
    v58 = v52;
    v48 = v44;
    [(GEOXPCRequest *)v58 send:v26 withReply:requestQ handler:v64];
    v49 = [(GEOPlaceRequestMessage *)v58 requestUUID];

    id v17 = v61;
    goto LABEL_33;
  }
  v46 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
  id v19 = v60;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
  {
    int v47 = [v26 count];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v81 = v29;
    *(_WORD *)&v81[4] = 1024;
    *(_DWORD *)&v81[6] = v47;
    _os_log_impl(&dword_188D96000, v46, OS_LOG_TYPE_FAULT, "%d of %d requested identifiers were valid.", buf, 0xEu);
  }

  v48 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:@"Invalid MapItemIdentifier(s)"];
  (*((void (**)(id, void, __CFString *))v60 + 2))(v60, 0, v48);
  v49 = 0;
LABEL_33:

  return v49;
}

- (id)_createServerConnection:(id)a3
{
  if (+[GEOPlatform isRunningInGeod])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: !GEOPlatform.isRunningInGeod", v5, 2u);
    }
    v3 = 0;
  }
  else
  {
    v3 = +[GEOXPCConnection createServerConnectionFor:9 debugIdentifier:@"PlaceDataLookup" eventHandler:0];
  }

  return v3;
}

void __134__GEOPlaceCardRequester_performPlaceDataRequest_traits_cachePolicy_timeout_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[GEONotificationPreferenceManager sharedManager];
  int v8 = [v7 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceDataRequest_GEOD"];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"GEOPPTTest_PlaceDataRequest_GEODEND" object:*(void *)(a1 + 32)];
  }
  v10 = *(void **)(a1 + 40);
  v11 = [*(id *)(a1 + 48) requestUUID];
  v12 = [v10 _takeConnectionForRequestUUID:v11];

  if (v12)
  {
    v13 = +[GEONotificationPreferenceManager sharedManager];
    int v14 = [v13 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest_ResponseHandling"];

    if (v14)
    {
      id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 postNotificationName:@"GEOPPTTest_PlaceRequest_ResponseHandlingBEGIN" object:*(void *)(a1 + 32)];
    }
    if (v6)
    {
      id v16 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 138477827;
        id v24 = v6;
        _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "Received error: %{private}@", (uint8_t *)&v23, 0xCu);
      }
    }
    uint64_t v17 = *(void *)(a1 + 56);
    id v18 = [v5 response];
    if (v6)
    {
      (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v18, v6);
    }
    else
    {
      id v19 = [v5 error];
      (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v18, v19);
    }
    uint64_t v20 = +[GEONotificationPreferenceManager sharedManager];
    int v21 = [v20 isEnabledForSubTestWithName:@"GEOPPTTest_PlaceRequest_ResponseHandling"];

    if (v21)
    {
      uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v22 postNotificationName:@"GEOPPTTest_PlaceRequest_ResponseHandlingEND" object:*(void *)(a1 + 32)];
    }
  }
}

- (id)_takeConnectionForRequestUUID:(id)a3
{
  id v4 = a3;
  v7 = self->_isolater;
  _geo_isolate_lock_data();
  id v5 = [(NSMutableDictionary *)self->_pendingRequestConnections objectForKeyedSubscript:v4];
  if (v5) {
    [(NSMutableDictionary *)self->_pendingRequestConnections setObject:0 forKeyedSubscript:v4];
  }
  _geo_isolate_unlock();

  return v5;
}

void __134__GEOPlaceCardRequester_performPlaceDataRequest_traits_cachePolicy_timeout_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 40) requestUUID];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

void __134__GEOPlaceCardRequester_requestIdentifiers_resultProviderID_traits_options_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 40) requestUUID];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

- (id)requestIdentifiers:(id)a3 resultProviderID:(int)a4 traits:(id)a5 options:(unint64_t)a6 auditToken:(id)a7 throttleToken:(id)a8 networkActivity:(id)a9 requesterHandler:(id)a10
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v18 = a10;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v19 = [v14 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    int v21 = 0;
    uint64_t v22 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v50 != v22) {
          objc_enumerationMutation(v14);
        }
        v21 += [*(id *)(*((void *)&v49 + 1) + 8 * i) isValid];
      }
      uint64_t v20 = [v14 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v20);
  }
  else
  {
    int v21 = 0;
  }
  if ([v14 count] && v21 == objc_msgSend(v14, "count"))
  {
    id v24 = v16;
    uint64_t v25 = v17;
    if (!v15)
    {
      id v26 = +[GEOMapService sharedService];
      id v15 = [v26 defaultTraits];
    }
    uint64_t v27 = [[GEOPlaceByIdentifiersRequest alloc] initWithTraits:v15 auditToken:v16 throttleToken:v17];
    [(GEOPlaceByIdentifiersRequest *)v27 setIdentifiers:v14];
    [(GEOPlaceByIdentifiersRequest *)v27 setResultProvider:a4];
    [(GEOPlaceByIdentifiersRequest *)v27 setOptions:a6];
    uint64_t v28 = [MEMORY[0x1E4F29128] UUID];
    [(GEOPlaceByIdentifiersRequest *)v27 setRequestUUID:v28];

    int v29 = [(GEOPlaceCardRequester *)self _createServerConnection:v15];
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    v44 = __134__GEOPlaceCardRequester_requestIdentifiers_resultProviderID_traits_options_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke;
    uint64_t v45 = &unk_1E53D99F0;
    v46 = self;
    int v47 = v27;
    id v48 = v29;
    id v30 = v29;
    geo_isolate_sync_data();
    requestQ = self->_requestQ;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __134__GEOPlaceCardRequester_requestIdentifiers_resultProviderID_traits_options_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_2;
    v39[3] = &unk_1E53DAD88;
    v39[4] = self;
    id v40 = v47;
    id v41 = v18;
    v32 = v47;
    [(GEOXPCRequest *)v32 send:v30 withReply:requestQ handler:v39];
    v33 = [(GEOPlaceByIdentifiersRequest *)v32 requestUUID];
  }
  else
  {
    id v34 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
    id v24 = v16;
    uint64_t v25 = v17;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      int v35 = [v14 count];
      *(_DWORD *)buf = 67109376;
      int v54 = v21;
      __int16 v55 = 1024;
      int v56 = v35;
      _os_log_impl(&dword_188D96000, v34, OS_LOG_TYPE_FAULT, "%d of %d requested identifiers were valid.", buf, 0xEu);
    }

    id v30 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:@"Invalid MapItemIdentifier(s)"];
    (*((void (**)(id, void, id))v18 + 2))(v18, 0, v30);
    v33 = 0;
  }

  return v33;
}

void __134__GEOPlaceCardRequester_requestIdentifiers_resultProviderID_traits_options_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) requestUUID];
  int v8 = [v6 _takeConnectionForRequestUUID:v7];

  if (v8)
  {
    if (v5)
    {
      id v9 = v5;
    }
    else
    {
      id v9 = [v16 error];
    }
    v10 = v9;
    v11 = [v16 response];
    uint64_t v12 = [v11 resultsCountWithResultType:1];

    if (!v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"No Results"];

      v10 = (void *)v13;
    }
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = [v16 response];
    (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v10);
  }
}

void __40__GEOPlaceCardRequester_sharedRequester__block_invoke()
{
  v0 = objc_alloc_init(GEOPlaceCardRequester);
  uint64_t v1 = (void *)_MergedGlobals_194;
  _MergedGlobals_194 = (uint64_t)v0;
}

- (GEOPlaceCardRequester)init
{
  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceCardRequester;
  v2 = [(GEOPlaceCardRequester *)&v10 init];
  if (v2)
  {
    uint64_t global_queue = geo_get_global_queue();
    requestQ = v2->_requestQ;
    v2->_requestQ = (OS_dispatch_queue *)global_queue;

    uint64_t v5 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
    pendingRequestConnections = v2->_pendingRequestConnections;
    v2->_pendingRequestConnections = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (id)requestPhoneNumbers:(id)a3 allowCellularDataForLookup:(BOOL)a4 traits:(id)a5 auditToken:(id)a6 throttleToken:(id)a7 networkActivity:(id)a8 requesterHandler:(id)a9
{
  BOOL v35 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v37 = a6;
  id v36 = a7;
  id v15 = a9;
  id v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v49 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = GEOStringForPhoneNumber(*(void **)(*((void *)&v48 + 1) + 8 * i));
        int v23 = (void *)v22;
        if (v22) {
          id v24 = (__CFString *)v22;
        }
        else {
          id v24 = &stru_1ED51F370;
        }
        [v16 addObject:v24];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v19);
  }

  if (!v14)
  {
    uint64_t v25 = +[GEOMapService sharedService];
    id v14 = [v25 defaultTraits];
  }
  id v26 = [[GEOPlaceByPhoneNumberRequest alloc] initWithTraits:v14 auditToken:v37 throttleToken:v36];
  [(GEOPlaceByPhoneNumberRequest *)v26 setPhoneNumbers:v16];
  [(GEOPlaceByPhoneNumberRequest *)v26 setAllowCellular:v35];
  uint64_t v27 = [MEMORY[0x1E4F29128] UUID];
  [(GEOPlaceByPhoneNumberRequest *)v26 setRequestUUID:v27];

  uint64_t v28 = [(GEOPlaceCardRequester *)self _createServerConnection:v14];
  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  uint64_t v43 = __137__GEOPlaceCardRequester_requestPhoneNumbers_allowCellularDataForLookup_traits_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke;
  v44 = &unk_1E53D99F0;
  uint64_t v45 = self;
  v46 = v26;
  id v47 = v28;
  id v29 = v28;
  geo_isolate_sync_data();
  requestQ = self->_requestQ;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __137__GEOPlaceCardRequester_requestPhoneNumbers_allowCellularDataForLookup_traits_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_2;
  v38[3] = &unk_1E53DADD8;
  v38[4] = self;
  v39 = v46;
  id v40 = v15;
  id v31 = v15;
  v32 = v46;
  [(GEOXPCRequest *)v32 send:v29 withReply:requestQ handler:v38];
  v33 = [(GEOPlaceByPhoneNumberRequest *)v32 requestUUID];

  return v33;
}

- (void)cancelRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = v8;
    if (isKindOfClass)
    {
      id v6 = [(GEOPlaceCardRequester *)self _takeConnectionForRequestUUID:v8];
      if (v6)
      {
        uint64_t v7 = [[GEOPlaceCancelRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
        [(GEOPlaceCancelRequest *)v7 setRequestUUID:v8];
        [(GEOXPCRequest *)v7 send:v6];
      }
      id v4 = v8;
    }
  }
}

void __137__GEOPlaceCardRequester_requestPhoneNumbers_allowCellularDataForLookup_traits_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) requestUUID];
  id v8 = [v6 _takeConnectionForRequestUUID:v7];

  if (v8)
  {
    if (v5)
    {
      id v9 = v5;
    }
    else
    {
      objc_super v10 = [v16 error];
      v11 = v16;
      if (v10) {
        goto LABEL_7;
      }
      id v14 = [v16 response];
      uint64_t v15 = [v14 resultsCountWithResultType:1];

      if (v15)
      {
        objc_super v10 = 0;
        goto LABEL_5;
      }
      id v9 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 reason:@"No Results"];
    }
    objc_super v10 = v9;
LABEL_5:
    v11 = v16;
LABEL_7:
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [v11 response];
    (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v10);
  }
}

void __137__GEOPlaceCardRequester_requestPhoneNumbers_allowCellularDataForLookup_traits_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 40) requestUUID];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

- (void)fetchAllCacheEntriesWithRequesterHandler:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOPlaceFetchCacheRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  id v6 = [(GEOPlaceCardRequester *)self _createServerConnection:0];
  requestQ = self->_requestQ;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__GEOPlaceCardRequester_fetchAllCacheEntriesWithRequesterHandler___block_invoke;
  v9[3] = &unk_1E53DADB0;
  id v10 = v4;
  id v8 = v4;
  [(GEOXPCRequest *)v5 send:v6 withReply:requestQ handler:v9];
}

void __66__GEOPlaceCardRequester_fetchAllCacheEntriesWithRequesterHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [v9 allCacheEntries];
  if (v5)
  {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  }
  else
  {
    id v8 = [v9 error];
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);
  }
}

- (void)trackPlaceData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[GEOPlaceCachePlaceRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134283777;
    uint64_t v13 = [v4 muid];
    __int16 v14 = 2049;
    uint64_t v15 = [v4 hash];
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Attempting to track place with muid: (%{private}llu) and hash: (%{private}lu)", buf, 0x16u);
  }

  [(GEOPlaceCachePlaceRequest *)v5 setPlace:v4];
  uint64_t v7 = [(GEOPlaceCardRequester *)self _createServerConnection:0];
  requestQ = self->_requestQ;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__GEOPlaceCardRequester_trackPlaceData___block_invoke;
  v10[3] = &unk_1E53DAE00;
  id v11 = v4;
  id v9 = v4;
  [(GEOXPCRequest *)v5 send:v7 withReply:requestQ handler:v10];
}

void __40__GEOPlaceCardRequester_trackPlaceData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      uint64_t v16 = (uint64_t)v6;
      id v8 = "XPC error tracking place: %{public}@";
LABEL_7:
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    id v9 = [v5 error];

    if (v9)
    {
      uint64_t v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138543362;
        uint64_t v16 = 0;
        id v8 = "geod error tracking place: %{public}@";
        goto LABEL_7;
      }
    }
    else
    {
      id v10 = [v5 identifiers];
      uint64_t v7 = [v10 firstObject];

      id v11 = [[GEOMapItemIdentifier alloc] initWithPlace:*(void *)(a1 + 32)];
      if (([v7 isEqual:v11] & 1) == 0)
      {
        uint64_t v12 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = [v7 muid];
          uint64_t v14 = [*(id *)(a1 + 32) muid];
          int v15 = 134283777;
          uint64_t v16 = v13;
          __int16 v17 = 2049;
          uint64_t v18 = v14;
          _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Tracked place had a different muid (%{private}llu) from the one submitted: %{private}llu", (uint8_t *)&v15, 0x16u);
        }
      }
    }
  }
}

- (void)calculateFreeableSpaceWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = [[GEOPlaceCalculateFreeableSpaceRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  id v6 = [(GEOPlaceCardRequester *)self _createServerConnection:0];
  requestQ = self->_requestQ;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__GEOPlaceCardRequester_calculateFreeableSpaceWithHandler___block_invoke;
  v9[3] = &unk_1E53DAE50;
  id v10 = v4;
  id v8 = v4;
  [(GEOXPCRequest *)v5 send:v6 withReply:requestQ handler:v9];
}

uint64_t __59__GEOPlaceCardRequester_calculateFreeableSpaceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 freeableBytes];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (unint64_t)calculateFreeableSpaceSync
{
  uint64_t v3 = [[GEOPlaceCalculateFreeableSpaceRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  id v4 = [(GEOPlaceCardRequester *)self _createServerConnection:0];
  id v5 = [(GEOXPCRequest *)v3 sendSync:v4 error:0];
  unint64_t v6 = [v5 freeableBytes];

  return v6;
}

- (void)shrinkBySize:(unint64_t)a3 finished:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [[GEOPlaceFreeSpaceRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  uint64_t v7 = [(GEOPlaceCardRequester *)self _createServerConnection:0];
  requestQ = self->_requestQ;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__GEOPlaceCardRequester_shrinkBySize_finished___block_invoke;
  v10[3] = &unk_1E53DAE78;
  id v11 = v5;
  id v9 = v5;
  [(GEOXPCRequest *)v6 send:v7 withReply:requestQ handler:v10];
}

uint64_t __47__GEOPlaceCardRequester_shrinkBySize_finished___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 freedBytes];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (unint64_t)shrinkBySizeSync:(unint64_t)a3
{
  id v4 = [[GEOPlaceFreeSpaceRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  id v5 = [(GEOPlaceCardRequester *)self _createServerConnection:0];
  unint64_t v6 = [(GEOXPCRequest *)v4 sendSync:v5 error:0];
  unint64_t v7 = [v6 freedBytes];

  return v7;
}

- (void)clearCache
{
  id v4 = [[GEOPlaceClearCacheRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  uint64_t v3 = [(GEOPlaceCardRequester *)self _createServerConnection:0];
  [(GEOXPCRequest *)v4 send:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestConnections, 0);
  objc_storeStrong((id *)&self->_isolater, 0);

  objc_storeStrong((id *)&self->_requestQ, 0);
}

@end