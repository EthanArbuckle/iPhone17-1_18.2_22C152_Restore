@interface GEOPlaceDataRequester
+ (id)sharedInstance;
- (GEOPlaceDataRequester)init;
- (id)_validateResponse:(id)a3;
- (void)startWithRequest:(id)a3 traits:(id)a4 timeout:(double)a5 auditToken:(id)a6 throttleToken:(id)a7 completionHandler:(id)a8;
@end

@implementation GEOPlaceDataRequester

- (void)startWithRequest:(id)a3 traits:(id)a4 timeout:(double)a5 auditToken:(id)a6 throttleToken:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id v17 = a7;
  id v18 = a4;
  v19 = +[GEOExperimentConfiguration sharedConfiguration];
  v20 = [v19 _mapsAbClientMetadata];
  v21 = [v14 clientMetadata];
  [v21 setAbClientMetadata:v20];

  v22 = [v15 bundleId];
  LODWORD(v20) = [v22 isEqualToString:@"com.apple.Maps"];

  if (v20)
  {
    v23 = [GEOLocalTime alloc];
    v24 = [MEMORY[0x1E4F1C9C8] date];
    v25 = [(GEOLocalTime *)v23 initWithDate:v24];
    v26 = [v14 analyticMetadata];
    [v26 setRequestTime:v25];
  }
  v27 = GEOFindOrCreateLog("com.apple.greentea", "GEO");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO) && [v14 hasGreenTeaWithValue:1]) {
    GEOGreenTeaLog(v27, (uint64_t)"Place Lookup", v15);
  }

  if (GEOConfigGetBOOL(GeoServicesConfig_ValidateSensitiveFieldsAtSend_PlaceRequest, (uint64_t)off_1E9114A58)&& GEOPDPlaceRequestHasSensitiveFields(v14, 0))
  {
    [v14 clearSensitiveFields:0];
  }
  v28 = [[GEOPlaceDataRequestConfig alloc] initWithTimeout:v14 request:v18 traits:a5];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __100__GEOPlaceDataRequester_startWithRequest_traits_timeout_auditToken_throttleToken_completionHandler___block_invoke;
  v30[3] = &unk_1E53D7E50;
  id v31 = v16;
  id v29 = v16;
  [(GEOServiceRequester *)self _startWithRequest:v14 traits:v18 auditToken:v15 config:v28 throttleToken:v17 options:0 completionHandler:v30];
}

- (id)_validateResponse:(id)a3
{
  id v3 = a3;
  int v4 = [v3 status];
  v5 = 0;
  if (v4 <= 19)
  {
    if (!v4) {
      goto LABEL_36;
    }
    if (v4 == 5)
    {
      v6 = (void *)MEMORY[0x1E4F28C58];
      v7 = @"Received invalid request status from server";
      uint64_t v8 = -10;
      goto LABEL_21;
    }
LABEL_20:
    v6 = (void *)MEMORY[0x1E4F28C58];
    v7 = @"Received failure status from server";
    uint64_t v8 = -7;
    goto LABEL_21;
  }
  if (v4 != 20)
  {
    if (v4 == 30) {
      goto LABEL_36;
    }
    if (v4 == 60)
    {
      v6 = (void *)MEMORY[0x1E4F28C58];
      v7 = @"Received version mismatch from server";
      uint64_t v8 = -28;
LABEL_21:
      v5 = [v6 GEOErrorWithCode:v8 reason:v7];
      goto LABEL_36;
    }
    goto LABEL_20;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = (id)*MEMORY[0x1E4F1D138];
  [v9 setObject:@"Received no results status from server" forKeyedSubscript:v10];

  if ([v3 requestType] == 10)
  {
    v11 = [v3 globalResult];
    -[GEOPDPlaceGlobalResult autocompleteResult](v11);
    v12 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      int v13 = v12[26];

      if ((v13 & 0x100) == 0) {
        goto LABEL_16;
      }
      id v14 = NSNumber;
      v11 = [v3 globalResult];
      uint64_t v15 = -[GEOPDPlaceGlobalResult autocompleteResult](v11);
      id v16 = (void *)v15;
      if (v15) {
        BOOL v17 = *(unsigned char *)(v15 + 101) != 0;
      }
      else {
        BOOL v17 = 0;
      }
      id v18 = [v14 numberWithBool:v17];
      [v9 setObject:v18 forKeyedSubscript:@"ShouldDisplayNoResults"];
    }
    else
    {
      id v16 = 0;
    }

LABEL_16:
    v19 = [v3 globalResult];
    -[GEOPDPlaceGlobalResult autocompleteResult](v19);
    v20 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      int v21 = v20[26];

      if ((v21 & 0x10) != 0)
      {
        v22 = NSNumber;
        v19 = [v3 globalResult];
        -[GEOPDPlaceGlobalResult autocompleteResult](v19);
        v23 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          uint64_t v24 = 97;
LABEL_32:
          BOOL v29 = v23[v24] != 0;
LABEL_33:
          v30 = [v22 numberWithBool:v29];
          [v9 setObject:v30 forKeyedSubscript:@"ShouldEnableRAPForNoResults"];

LABEL_34:
          goto LABEL_35;
        }
        goto LABEL_41;
      }
      goto LABEL_35;
    }
LABEL_39:
    v23 = 0;
    goto LABEL_34;
  }
  if ([v3 requestType] != 1)
  {
    if ([v3 requestType] != 12) {
      goto LABEL_35;
    }
    v19 = [v3 globalResult];
    -[GEOPDPlaceGlobalResult categorySearchResult](v19);
    v27 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      int v28 = v27[46];

      if ((v28 & 0x10) != 0)
      {
        v22 = NSNumber;
        v19 = [v3 globalResult];
        -[GEOPDPlaceGlobalResult categorySearchResult](v19);
        v23 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          uint64_t v24 = 182;
          goto LABEL_32;
        }
        goto LABEL_41;
      }
      goto LABEL_35;
    }
    goto LABEL_39;
  }
  v19 = [v3 globalResult];
  v25 = -[GEOPDPlaceGlobalResult searchResult](v19);
  if (!v25) {
    goto LABEL_39;
  }
  uint64_t v26 = v25[31];

  if ((v26 & 0x80) != 0)
  {
    v22 = NSNumber;
    v19 = [v3 globalResult];
    -[GEOPDPlaceGlobalResult searchResult](v19);
    v23 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      uint64_t v24 = 242;
      goto LABEL_32;
    }
LABEL_41:
    BOOL v29 = 0;
    goto LABEL_33;
  }
LABEL_35:
  v5 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-8 userInfo:v9];

LABEL_36:

  return v5;
}

void __100__GEOPlaceDataRequester_startWithRequest_traits_timeout_auditToken_throttleToken_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v57 = a3;
  id v5 = v4;
  if (v5)
  {
    v6 = +[GEOExperimentConfiguration sharedConfiguration];
    v7 = [v5 datasetAbStatus];
    [v6 refreshDatasetABStatus:v7];
  }
  double Current = CFAbsoluteTimeGetCurrent();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v58 = v5;
  id v9 = [v5 legacyPlaceResults];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v75 objects:v82 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v76 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        [v14 setFirstSeenTimestamp:Current];
        uint64_t v15 = +[GEOPDPlaceInfo placeInfoForPlaceData:v14];
        uint64_t v16 = v15;
        if (v15)
        {
          -[GEOPDPlaceInfo _readCenter](v15);
          if (*(void *)(v16 + 40))
          {
            BOOL v17 = -[GEOPDPlaceInfo center]((id *)v16);
            [v17 coordinate];
            BOOL v18 = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

            if (v18) {
              uint64_t v19 = 2;
            }
            else {
              uint64_t v19 = 1;
            }
            [v14 setReferenceFrame:v19];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v75 objects:v82 count:16];
    }
    while (v11);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v20 = [v58 mapsResults];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v72 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v71 + 1) + 8 * j);
        if ([v25 resultType] == 1)
        {
          uint64_t v26 = [v25 place];
          [v26 setFirstSeenTimestamp:Current];
          uint64_t v27 = +[GEOPDPlaceInfo placeInfoForPlaceData:v26];
          uint64_t v28 = v27;
          if (v27)
          {
            -[GEOPDPlaceInfo _readCenter](v27);
            if (*(void *)(v28 + 40))
            {
              BOOL v29 = -[GEOPDPlaceInfo center]((id *)v28);
              [v29 coordinate];
              BOOL v30 = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

              if (v30) {
                uint64_t v31 = 2;
              }
              else {
                uint64_t v31 = 1;
              }
              [v26 setReferenceFrame:v31];
            }
          }
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v22);
  }

  v32 = v58;
  uint64_t v33 = [v58 globalResult];
  if (v33)
  {
    v34 = (void *)v33;
    -[GEOPDPlaceGlobalResult _readAutocompleteResult](v33);
    uint64_t v35 = v34[8];

    if (!v35) {
      goto LABEL_57;
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v36 = [v58 globalResult];
    -[GEOPDPlaceGlobalResult autocompleteResult](v36);
    v37 = (id *)objc_claimAutoreleasedReturnValue();
    v38 = -[GEOPDAutocompleteResult sections](v37);

    obuint64_t j = v38;
    uint64_t v61 = [v38 countByEnumeratingWithState:&v67 objects:v80 count:16];
    if (v61)
    {
      uint64_t v60 = *(void *)v68;
      do
      {
        uint64_t v39 = 0;
        do
        {
          if (*(void *)v68 != v60) {
            objc_enumerationMutation(obj);
          }
          uint64_t v62 = v39;
          v40 = *(id **)(*((void *)&v67 + 1) + 8 * v39);
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          v41 = -[GEOPDAutocompleteResultSection entries](v40);
          uint64_t v42 = [v41 countByEnumeratingWithState:&v63 objects:v79 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v64;
            do
            {
              for (uint64_t k = 0; k != v43; ++k)
              {
                if (*(void *)v64 != v44) {
                  objc_enumerationMutation(v41);
                }
                v46 = *(void **)(*((void *)&v63 + 1) + 8 * k);
                if ([v46 hasBusiness])
                {
                  v47 = [v46 business];
                  v48 = [v47 place];
                  uint64_t v49 = +[GEOPDPlaceInfo placeInfoForPlaceData:v48];

                  if (v49)
                  {
                    -[GEOPDPlaceInfo _readCenter](v49);
                    if (*(void *)(v49 + 40))
                    {
                      v50 = -[GEOPDPlaceInfo center]((id *)v49);
                      [v50 coordinate];
                      BOOL v51 = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

                      if (v51) {
                        uint64_t v52 = 2;
                      }
                      else {
                        uint64_t v52 = 1;
                      }
                      v53 = [v46 business];
                      v54 = [v53 place];
                      [v54 setReferenceFrame:v52];
                    }
                  }
                }
              }
              uint64_t v43 = [v41 countByEnumeratingWithState:&v63 objects:v79 count:16];
            }
            while (v43);
          }

          uint64_t v39 = v62 + 1;
        }
        while (v62 + 1 != v61);
        uint64_t v61 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
      }
      while (v61);
    }
  }
  else
  {
  }
  v32 = v58;
LABEL_57:
  uint64_t v55 = *(void *)(a1 + 32);
  if (v55) {
    (*(void (**)(uint64_t, void *, id))(v55 + 16))(v55, v32, v57);
  }
}

+ (id)sharedInstance
{
  if (_MergedGlobals_47 != -1) {
    dispatch_once(&_MergedGlobals_47, &__block_literal_global_50_0);
  }
  v2 = (void *)qword_1E91169D8;

  return v2;
}

void __39__GEOPlaceDataRequester_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(GEOPlaceDataRequester);
  v1 = (void *)qword_1E91169D8;
  qword_1E91169D8 = (uint64_t)v0;
}

- (GEOPlaceDataRequester)init
{
  v4.receiver = self;
  v4.super_class = (Class)GEOPlaceDataRequester;
  v2 = [(GEOServiceRequester *)&v4 init];
  if (v2) {
    [(GEOServiceRequester *)v2 setOfflineOperationClass:objc_opt_class()];
  }
  return v2;
}

@end