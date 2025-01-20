@interface GEOSpatialLookupRequester
+ (id)sharedInstance;
- (id)_validateResponse:(id)a3;
- (void)startWithRequest:(id)a3 traits:(id)a4 timeout:(double)a5 auditToken:(id)a6 completionHandler:(id)a7;
@end

@implementation GEOSpatialLookupRequester

+ (id)sharedInstance
{
  if (_MergedGlobals_212 != -1) {
    dispatch_once(&_MergedGlobals_212, &__block_literal_global_51);
  }
  v2 = (void *)qword_1EB29F828;

  return v2;
}

void __43__GEOSpatialLookupRequester_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(GEOSpatialLookupRequester);
  v1 = (void *)qword_1EB29F828;
  qword_1EB29F828 = (uint64_t)v0;
}

- (void)startWithRequest:(id)a3 traits:(id)a4 timeout:(double)a5 auditToken:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = GEOFindOrCreateLog("com.apple.greentea", "GEO");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO) && [v12 hasGreenTeaWithValue:1]) {
    GEOGreenTeaLog(v16, (uint64_t)"SpatialLookup", v14);
  }

  if (!v13)
  {
    v17 = +[GEOMapService sharedService];
    id v13 = [v17 defaultTraits];
  }
  v18 = [GEOSpatialLookupRequestConfig alloc];
  if (v18)
  {
    v24.receiver = v18;
    v24.super_class = (Class)GEOSpatialLookupRequestConfig;
    v19 = [(GEOServiceRequester *)&v24 init];
    v20 = v19;
    if (v19) {
      *(double *)&v19->super._pendingRequests = a5;
    }
  }
  else
  {
    v20 = 0;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__GEOSpatialLookupRequester_startWithRequest_traits_timeout_auditToken_completionHandler___block_invoke;
  v22[3] = &unk_1E53D7E50;
  id v23 = v15;
  id v21 = v15;
  [(GEOServiceRequester *)self _startWithRequest:v12 traits:v13 auditToken:v14 config:v20 throttleToken:0 options:0 completionHandler:v22];
}

void __90__GEOSpatialLookupRequester_startWithRequest_traits_timeout_auditToken_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v21 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = v4;
  id obj = [v20 responses];
  uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v5;
        v6 = *(void **)(*((void *)&v30 + 1) + 8 * v5);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v7 = [v6 places];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v27 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              uint64_t v13 = +[GEOPDSpatialLookupResult spatialLookupResultForPlaceData:v12];
              uint64_t v14 = v13;
              if (v13)
              {
                -[GEOPDSpatialLookupResult _readCenter](v13);
                if (*(void *)(v14 + 56))
                {
                  id v15 = -[GEOPDSpatialLookupResult center]((id *)v14);
                  [v15 coordinate];
                  BOOL v16 = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

                  if (v16) {
                    uint64_t v17 = 2;
                  }
                  else {
                    uint64_t v17 = 1;
                  }
                  [v12 setReferenceFrame:v17];
                }
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }

  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v20, v21);
  }
}

- (id)_validateResponse:(id)a3
{
  int v3 = [a3 statusCode];
  id v4 = 0;
  if (v3 > 19)
  {
    if (v3 == 20)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Received no results status from server";
      uint64_t v7 = -8;
      goto LABEL_9;
    }
    if (v3 == 30) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (!v3) {
    goto LABEL_10;
  }
  if (v3 != 5)
  {
LABEL_7:
    uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    v6 = @"Received failure status from server";
    uint64_t v7 = -7;
    goto LABEL_9;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  v6 = @"Received invalid request status from server";
  uint64_t v7 = -10;
LABEL_9:
  id v4 = [v5 GEOErrorWithCode:v7 reason:v6];
LABEL_10:

  return v4;
}

@end