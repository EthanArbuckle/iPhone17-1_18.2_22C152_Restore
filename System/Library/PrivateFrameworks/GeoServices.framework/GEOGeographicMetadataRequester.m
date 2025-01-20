@interface GEOGeographicMetadataRequester
+ (void)_fetchPossibleTerritoriesForLocation:(id)a3 retryCount:(unint64_t)a4 responseQueue:(id)a5 responseBlock:(id)a6;
+ (void)fetchDataForLocation:(id)a3 type:(unint64_t)a4 responseQueue:(id)a5 responseBlock:(id)a6;
+ (void)fetchPossibleTerritoriesForLocation:(id)a3 responseQueue:(id)a4 responseBlock:(id)a5;
+ (void)fetchSmartDataModeDataForLocation:(id)a3 mcc:(unsigned __int16)a4 mnc:(unsigned __int16)a5 responseQueue:(id)a6 responseBlock:(id)a7;
- (GEOGeographicMetadataRequester)initWithDataType:(unint64_t)a3 delegateQueue:(id)a4 delegate:(id)a5;
- (GEOGeographicMetadataRequester)initWithType:(unint64_t)a3 mcc:(unsigned __int16)a4 mnc:(unsigned __int16)a5 queue:(id)a6 delegate:(id)a7 territoryBlock:(id)a8;
- (GEOLocation)location;
- (id)_doSimpleLookup:(id)a3 rootQuadKey:(unint64_t)a4 error:(id *)a5;
- (id)_doTerritoryRegulatoryLookup:(id)a3 error:(id *)a4;
- (id)initSmartDataModeDataWithMcc:(unsigned __int16)a3 mnc:(unsigned __int16)a4 delegateQueue:(id)a5 delegate:(id)a6;
- (unint64_t)metadataType;
- (unsigned)mcc;
- (unsigned)mnc;
- (void)_fetch;
- (void)_fetchData:(id)a3;
- (void)_fetchTerritories:(id)a3;
- (void)_processResponse:(id)a3 error:(id)a4;
- (void)_processTerritories:(id)a3 error:(id)a4;
- (void)reportCorrupt:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation GEOGeographicMetadataRequester

void __69__GEOGeographicMetadataRequester__doTerritoryRegulatoryLookup_error___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  v6 = GEOGetGeographicMetadataLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    if (v5) {
      int v7 = [v5[1] count];
    }
    else {
      int v7 = 0;
    }
    *(_DWORD *)buf = 134218497;
    v22 = v5;
    __int16 v23 = 1025;
    int v24 = v7;
    __int16 v25 = 2049;
    unint64_t v26 = a2;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Got tileData %p with %{private}d infos for quadKey %{private}llu", buf, 0x1Cu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v15 = v5;
  v8 = -[GEOTerritoryDataTileData territorys](v5);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(id **)(*((void *)&v16 + 1) + 8 * i);
        if (GEOTerritoryDataTerritoryInfoContainsLocation(v13, a2, *(void **)(a1 + 32)))
        {
          v14 = [[GEOTerritoryRegulatoryInfo alloc] initWithUnsafeTerritoryData:v13 nameDB:*(void *)(a1 + 40) iso3to2Mapping:*(void *)(a1 + 48)];
          if (v14) {
            [*(id *)(a1 + 56) addObject:v14];
          }
        }
        else
        {
          GEOGetGeographicMetadataLog();
          v14 = (GEOTerritoryRegulatoryInfo *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138477827;
            v22 = v13;
            _os_log_impl(&dword_188D96000, &v14->super, OS_LOG_TYPE_DEBUG, "Did not match info %{private}@", buf, 0xCu);
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

+ (void)_fetchPossibleTerritoriesForLocation:(id)a3 retryCount:(unint64_t)a4 responseQueue:(id)a5 responseBlock:(id)a6
{
  v8 = a5;
  id v9 = a6;
  uint64_t v10 = (void *)[a3 copy];
  [v10 horizontalAccuracy];
  if (v11 <= GEOConfigGetDouble(GeoServicesConfig_TerritoryRegulatoryMinimumRadius, (uint64_t)off_1E9114C88)) {
    double Double = GEOConfigGetDouble(GeoServicesConfig_TerritoryRegulatoryMinimumRadius, (uint64_t)off_1E9114C88);
  }
  else {
    [v10 horizontalAccuracy];
  }
  [v10 setHorizontalAccuracy:Double];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy__16;
  int v24 = __Block_byref_object_dispose__16;
  __int16 v25 = [[GEOGeographicMetadataRequester alloc] initWithType:0 mcc:0 mnc:0 queue:v8 delegate:0 territoryBlock:v9];
  if (v21[5])
  {
    uint64_t v13 = [v10 copy];
    uint64_t v14 = v21[5];
    v15 = *(void **)(v14 + 24);
    *(void *)(v14 + 24) = v13;

    long long v16 = (void *)v21[5];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __110__GEOGeographicMetadataRequester__fetchPossibleTerritoriesForLocation_retryCount_responseQueue_responseBlock___block_invoke_2;
    v17[3] = &unk_1E53DB3C8;
    v17[4] = &v20;
    [v16 _fetchTerritories:v17];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __110__GEOGeographicMetadataRequester__fetchPossibleTerritoriesForLocation_retryCount_responseQueue_responseBlock___block_invoke;
    block[3] = &unk_1E53DA028;
    id v19 = v9;
    dispatch_async(v8, block);
  }
  _Block_object_dispose(&v20, 8);
}

- (GEOGeographicMetadataRequester)initWithType:(unint64_t)a3 mcc:(unsigned __int16)a4 mnc:(unsigned __int16)a5 queue:(id)a6 delegate:(id)a7 territoryBlock:(id)a8
{
  uint64_t v11 = a5;
  uint64_t v12 = a4;
  id v15 = a6;
  unint64_t v16 = (unint64_t)a7;
  unint64_t v17 = (unint64_t)a8;
  v40.receiver = self;
  v40.super_class = (Class)GEOGeographicMetadataRequester;
  long long v18 = [(GEOGeographicMetadataRequester *)&v40 init];
  id v19 = v18;
  if (!v18) {
    goto LABEL_29;
  }
  if (!(v16 | v17))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
LABEL_29:
      v34 = 0;
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v36 = MEMORY[0x1E4F14500];
    v37 = "Assertion failed: delegate != ((void *)0) || territoryBlock != ((void *)0)";
LABEL_31:
    _os_log_fault_impl(&dword_188D96000, v36, OS_LOG_TYPE_FAULT, v37, buf, 2u);
    goto LABEL_29;
  }
  v38 = v18;
  uint64_t v20 = geo_isolater_create_with_format();
  isolater = v19->_isolater;
  v19->_isolater = (geo_isolater *)v20;

  v19->_type = a3;
  qos_class_self();
  uint64_t global_queue = geo_get_global_queue();
  workQueue = v19->_workQueue;
  v19->_workQueue = (OS_dispatch_queue *)global_queue;

  objc_storeStrong((id *)&v19->_delegateQueue, a6);
  if (v16)
  {
    id v24 = objc_storeWeak((id *)&v19->_delegate, (id)v16);
    v19->_delegateSupportsNoChange = objc_opt_respondsToSelector() & 1;

    id WeakRetained = objc_loadWeakRetained((id *)&v19->_delegate);
    v19->_delegateSupportsErrors = objc_opt_respondsToSelector() & 1;

    id responseTerritoryBlock = objc_loadWeakRetained((id *)&v19->_delegate);
    v19->_delegateSupportsSkipNotifications = objc_opt_respondsToSelector() & 1;
  }
  else
  {
    if (!v17) {
      goto LABEL_8;
    }
    uint64_t v27 = objc_msgSend((id)v17, "copy", v38);
    id responseTerritoryBlock = v19->_responseTerritoryBlock;
    v19->_id responseTerritoryBlock = (id)v27;
  }

LABEL_8:
  v28 = &GEOConfigKey_InvalidBOOL;
  switch(a3)
  {
    case 0uLL:
      v29 = objc_alloc_init(GEOGeographicMetadataRegulatoryFetcher);
      goto LABEL_22;
    case 1uLL:
      goto LABEL_13;
    case 2uLL:
      v28 = &GeoServicesConfig_SmartDataModeAllowCellular;
      goto LABEL_13;
    case 3uLL:
      v28 = &GeoServicesConfig_CellPerfScoreAllowCellular;
      goto LABEL_13;
    case 4uLL:
      v28 = &GeoServicesConfig_CellCoverageAllowCellular;
LABEL_13:
      uint64_t v30 = 2;
      if (*v28)
      {
        uint64_t v31 = v28[1];
        if (v31)
        {
          if (GEOConfigGetBOOL(*v28, v31)) {
            uint64_t v30 = 6;
          }
          else {
            uint64_t v30 = 7;
          }
        }
      }
      if (a3 - 1 > 3) {
        uint64_t v32 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v32 = dword_18A632190[a3 - 1];
      }
      v29 = [[GEOGeographicMetadataTileFetcher alloc] initForTileStyle:v32 mcc:v12 mnc:v11 options:v30];
LABEL_22:
      fetcher = v19->_fetcher;
      v19->_fetcher = (GEOGeographicMetadataFetcher *)v29;

      break;
    default:
      break;
  }
  if (!v19->_fetcher)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v36 = MEMORY[0x1E4F14500];
    v37 = "Assertion failed: _fetcher != ((void *)0)";
    goto LABEL_31;
  }
  v34 = v19;
LABEL_25:

  return v34;
}

- (void)_fetchTerritories:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v5;

  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __52__GEOGeographicMetadataRequester__fetchTerritories___block_invoke;
  uint64_t v12 = &unk_1E53DDEB0;
  objc_copyWeak(&v13, &location);
  int v7 = (void *)MEMORY[0x18C120660](&v9);
  id processBlock = self->_processBlock;
  self->_id processBlock = v7;

  [(GEOGeographicMetadataRequester *)self _fetch];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

+ (void)fetchPossibleTerritoriesForLocation:(id)a3 responseQueue:(id)a4 responseBlock:(id)a5
{
}

- (id)_doTerritoryRegulatoryLookup:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 stringByAppendingPathComponent:@"tiles/data"];
  v8 = [v6 stringByAppendingPathComponent:@"names/data"];
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v9 fileExistsAtPath:v7] & 1) == 0)
  {

    goto LABEL_13;
  }
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v11 = [v10 fileExistsAtPath:v8];

  if ((v11 & 1) == 0)
  {
LABEL_13:
    uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = [NSString stringWithFormat:@"DB missing, expected dbs at \"%@\" and \"%@\"", v7, v8];
    *a4 = [v31 GEOErrorWithCode:-17 reason:v32];

    id v33 = 0;
    goto LABEL_28;
  }
  v51 = self;
  v52 = a4;
  uint64_t v12 = [GEOGloriaDB alloc];
  id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  unint64_t v16 = GEOGetGeographicMetadataLog();
  unint64_t v17 = [(GEOGloriaDB *)v12 initWithFileURL:v13 rootQuadKey:0 metadataClass:v14 dataClass:v15 log:v16];

  if (v17)
  {
    long long v18 = [GEOGloriaDB alloc];
    id v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    uint64_t v20 = GEOGetGeographicMetadataLog();
    v21 = [(GEOGloriaDB *)v18 initWithFileURL:v19 rootQuadKey:0 log:v20];

    if (!v21)
    {
      v36 = (void *)MEMORY[0x1E4F28C58];
      v37 = [NSString stringWithFormat:@"Unable to open Gloria name DB at \"%@\"", v8];
      *a4 = [v36 GEOErrorWithCode:-17 reason:v37];

      id v33 = 0;
LABEL_26:

      goto LABEL_27;
    }
    uint64_t v22 = [v6 stringByAppendingPathComponent:@"ISO_Country_Codes_31661_3to2.plist"];
    __int16 v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v24 = [v23 fileExistsAtPath:v22];

    if (!v24)
    {
      v28 = 0;
LABEL_22:
      if ([v28 count])
      {
        v38 = [(GEOGeographicMetadataRequester *)v51 location];
        v39 = [MEMORY[0x1E4F1CA80] set];
        [v38 coordinate];
        double v41 = v40;
        double v43 = v42;
        [v38 horizontalAccuracy];
        double v45 = v44;
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __69__GEOGeographicMetadataRequester__doTerritoryRegulatoryLookup_error___block_invoke;
        v53[3] = &unk_1E53DDF78;
        id v54 = v38;
        v55 = v21;
        id v56 = v28;
        id v46 = v39;
        id v57 = v46;
        id v47 = v38;
        -[GEOGloriaDB unsafeEnumerateDataAtLocation:radius:visitor:](v17, "unsafeEnumerateDataAtLocation:radius:visitor:", v53, v41, v43, v45);
        v48 = v57;
        id v33 = v46;
      }
      else
      {
        v49 = (void *)MEMORY[0x1E4F28C58];
        id v47 = [NSString stringWithFormat:@"Unable to read ISO 3 to 2 mapping at \"%@\"", v22];
        [v49 GEOErrorWithCode:-17 reason:v47];
        id v33 = 0;
        id *v52 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_26;
    }
    id v59 = 0;
    __int16 v25 = v22;
    unint64_t v26 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v22 options:0 error:&v59];
    id v27 = v59;
    if (![v26 length] || v27)
    {
      uint64_t v30 = GEOGetGeographicMetadataLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_ERROR, "Could not read ISO 3 to 2 cc mapping", buf, 2u);
      }
      v28 = 0;
    }
    else
    {
      id v58 = 0;
      v28 = [MEMORY[0x1E4F28F98] propertyListWithData:v26 options:0 format:0 error:&v58];
      id v29 = v58;
      id v27 = v29;
      if (v28 && !v29) {
        goto LABEL_21;
      }
      uint64_t v30 = GEOGetGeographicMetadataLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v61 = v27;
        _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_ERROR, "Could not read ISO 3 to 2 cc mapping: %@", buf, 0xCu);
      }
    }

LABEL_21:
    uint64_t v22 = v25;
    goto LABEL_22;
  }
  v34 = (void *)MEMORY[0x1E4F28C58];
  v35 = [NSString stringWithFormat:@"Unable to open Gloria tile DB at \"%@\"", v7];
  *a4 = [v34 GEOErrorWithCode:-17 reason:v35];

  id v33 = 0;
LABEL_27:

LABEL_28:

  return v33;
}

- (void)_fetch
{
  if (self->_processBlock)
  {
    switch(self->_type)
    {
      case 0uLL:
        int BOOL = GEOConfigGetBOOL(GeoServicesConfig_TerritoryRegulatoryAssetIsShiftedInChina, (uint64_t)off_1E9114C78);
        id v4 = [(GEOGeographicMetadataRequester *)self location];
        if (BOOL) {
          goto LABEL_11;
        }
        goto LABEL_14;
      case 1uLL:
        v5 = &GeoServicesConfig_SmartInterfaceSelectionIsShiftedInChina;
        goto LABEL_10;
      case 2uLL:
        v5 = &GeoServicesConfig_SmartDataModeIsShiftedInChina;
        goto LABEL_10;
      case 3uLL:
        v5 = &GeoServicesConfig_CellPerfScoreIsShiftedInChina;
        goto LABEL_10;
      case 4uLL:
        v5 = &GeoServicesConfig_CellCoverageIsShiftedInChina;
LABEL_10:
        char v6 = GEOConfigGetBOOL(*v5, v5[1]);
        id v4 = [(GEOGeographicMetadataRequester *)self location];
        if ((v6 & 1) == 0) {
          goto LABEL_14;
        }
LABEL_11:
        if ([v4 referenceFrame] == 2
          || ([v4 coordinate],
              !+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:")))
        {
LABEL_14:
          [(GEOGeographicMetadataFetcher *)self->_fetcher fetchMetadataForLocation:v4 responseQueue:self->_workQueue block:self->_processBlock];
        }
        else
        {
          int v7 = objc_alloc_init(GEOLocationShifter);
          v8 = [v4 latLng];
          [v4 horizontalAccuracy];
          double v10 = v9;
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __40__GEOGeographicMetadataRequester__fetch__block_invoke;
          v12[3] = &unk_1E53DDF28;
          id v4 = v4;
          id v13 = v4;
          uint64_t v14 = self;
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __40__GEOGeographicMetadataRequester__fetch__block_invoke_3;
          v11[3] = &unk_1E53D9070;
          v11[4] = self;
          [(GEOLocationShifter *)v7 shiftLatLng:v8 accuracy:v12 withCompletionHandler:0 mustGoToNetworkCallback:v11 errorHandler:self->_workQueue callbackQueue:v10];
        }
        break;
      default:
        id v4 = [(GEOGeographicMetadataRequester *)self location];
        goto LABEL_14;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _processBlock != ((void *)0)", buf, 2u);
  }
}

- (GEOLocation)location
{
  v5 = self->_isolater;
  _geo_isolate_lock_data();
  v3 = (void *)[(GEOLocation *)self->_location copy];
  _geo_isolate_unlock();

  return (GEOLocation *)v3;
}

void __52__GEOGeographicMetadataRequester__fetchTerritories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _processTerritories:v6 error:v5];
}

- (void)_processTerritories:(id)a3 error:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7 && [v6 count] == 1)
  {
    v8 = [v6 allValues];
    double v9 = [v8 firstObject];

    double v10 = [v9 path];
    id v26 = 0;
    char v11 = [(GEOGeographicMetadataRequester *)self _doTerritoryRegulatoryLookup:v10 error:&v26];
    id v12 = v26;
    id v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 domain];
      uint64_t v15 = GEOErrorDomain();
      if (([v14 isEqual:v15] & 1) == 0)
      {

LABEL_17:
        goto LABEL_18;
      }
      uint64_t v16 = [v13 code];

      if (v16 == -17)
      {
        [(GEOGeographicMetadataRequester *)self reportCorrupt:v9];
        unint64_t retryCounter = self->_retryCounter;
        unint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_MAResourceCorruptMaxRetries, (uint64_t)off_1E9114DD8);
        uint64_t v14 = GEOGetGeographicMetadataLog();
        BOOL v19 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
        if (retryCounter < UInteger)
        {
          if (v19)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "Reported corrupt MAResource, will retry request", buf, 2u);
          }

          ++self->_retryCounter;
          [(GEOGeographicMetadataRequester *)self _fetch];
          goto LABEL_19;
        }
        if (v19)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "Reported corrupt MAResource but out of retries, will fail", buf, 2u);
        }
        goto LABEL_17;
      }
    }
LABEL_18:
    delegateQueue = self->_delegateQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__GEOGeographicMetadataRequester__processTerritories_error___block_invoke_39;
    v23[3] = &unk_1E53D99F0;
    v23[4] = self;
    id v24 = v11;
    id v25 = v13;
    dispatch_async(delegateQueue, v23);

LABEL_19:
    goto LABEL_15;
  }
  uint64_t v20 = GEOGetGeographicMetadataLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v7;
    _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_FAULT, "Got error and/or nil path when trying to locate the territory db. This should never happen: %@", buf, 0xCu);
  }

  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Missing territory db"];
  }
  v21 = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__GEOGeographicMetadataRequester__processTerritories_error___block_invoke;
  block[3] = &unk_1E53D8998;
  void block[4] = self;
  id v28 = v7;
  id v13 = v7;
  dispatch_async(v21, block);

LABEL_15:
}

void __60__GEOGeographicMetadataRequester__processTerritories_error___block_invoke_39(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 128);
  uint64_t v3 = [*(id *)(a1 + 40) count];
  id v4 = *(void **)(a1 + 40);
  if ([v4 count]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(a1 + 48);
  }
  if (v3) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v6, v5);
  double v9 = (void (**)(void))MEMORY[0x18C120660](*(void *)(*(void *)(a1 + 32) + 136));
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 136);
  *(void *)(v7 + 136) = 0;

  v9[2]();
}

void __110__GEOGeographicMetadataRequester__fetchPossibleTerritoriesForLocation_retryCount_responseQueue_responseBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_responseTerritoryBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong(&self->_processBlock, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_lastUsedTileKeysMaxZoom, 0);
  objc_storeStrong((id *)&self->_lastUsedTileKeysMinZoom, 0);
  objc_storeStrong((id *)&self->_nextLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

- (GEOGeographicMetadataRequester)initWithDataType:(unint64_t)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3 <= 4 && ((1 << a3) & 0x1A) != 0)
  {
    self = [(GEOGeographicMetadataRequester *)self initWithType:a3 mcc:0 mnc:0 queue:v8 delegate:v9 territoryBlock:0];
    double v10 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      v12[0] = 67109120;
      v12[1] = a3;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid type: %d", (uint8_t *)v12, 8u);
    }
    double v10 = 0;
  }

  return v10;
}

- (id)initSmartDataModeDataWithMcc:(unsigned __int16)a3 mnc:(unsigned __int16)a4 delegateQueue:(id)a5 delegate:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  id v10 = a5;
  id v11 = a6;
  if (v8 && v7)
  {
    self = [(GEOGeographicMetadataRequester *)self initWithType:2 mcc:v8 mnc:v7 queue:v10 delegate:v11 territoryBlock:0];
    id v12 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: mcc != 0 && mnc != 0", v14, 2u);
    }
    id v12 = 0;
  }

  return v12;
}

- (void)reportCorrupt:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = GEOGetGeographicMetadataLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Reporting corrupt resource at \"%@\"", (uint8_t *)&v6, 0xCu);
  }

  [(GEOGeographicMetadataFetcher *)self->_fetcher reportCorrupt:v4];
}

- (unint64_t)metadataType
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  unint64_t type = self->_type;
  if (type - 1 >= 4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      v4[0] = 67109120;
      v4[1] = type;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid _type(%u)", (uint8_t *)v4, 8u);
    }
    return -1;
  }
  return type;
}

- (unsigned)mcc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t type = self->_type;
  if (type > 4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      return -1;
    }
    v9[0] = 67109120;
    v9[1] = type;
    id v4 = MEMORY[0x1E4F14500];
    uint64_t v5 = "Unreachable reached: Invalid _type(%u)";
    uint32_t v6 = 8;
LABEL_6:
    _os_log_fault_impl(&dword_188D96000, v4, OS_LOG_TYPE_FAULT, v5, (uint8_t *)v9, v6);
    return -1;
  }
  if (type != 2) {
    return -1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      return -1;
    }
    LOWORD(v9[0]) = 0;
    id v4 = MEMORY[0x1E4F14500];
    uint64_t v5 = "Assertion failed: [_fetcher isKindOfClass:GEOGeographicMetadataTileFetcher.class]";
    uint32_t v6 = 2;
    goto LABEL_6;
  }
  fetcher = self->_fetcher;

  return [(GEOGeographicMetadataFetcher *)fetcher mcc];
}

- (unsigned)mnc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t type = self->_type;
  if (type > 4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      return -1;
    }
    v9[0] = 67109120;
    v9[1] = type;
    id v4 = MEMORY[0x1E4F14500];
    uint64_t v5 = "Unreachable reached: Invalid _type(%u)";
    uint32_t v6 = 8;
LABEL_6:
    _os_log_fault_impl(&dword_188D96000, v4, OS_LOG_TYPE_FAULT, v5, (uint8_t *)v9, v6);
    return -1;
  }
  if (type != 2) {
    return -1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      return -1;
    }
    LOWORD(v9[0]) = 0;
    id v4 = MEMORY[0x1E4F14500];
    uint64_t v5 = "Assertion failed: [_fetcher isKindOfClass:GEOGeographicMetadataTileFetcher.class]";
    uint32_t v6 = 2;
    goto LABEL_6;
  }
  fetcher = self->_fetcher;

  return [(GEOGeographicMetadataFetcher *)fetcher mnc];
}

+ (void)fetchDataForLocation:(id)a3 type:(unint64_t)a4 responseQueue:(id)a5 responseBlock:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = a5;
  id v11 = a6;
  if (a4 <= 4 && ((1 << a4) & 0x1A) != 0)
  {
    *(void *)buf = 0;
    uint64_t v32 = buf;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__16;
    v35 = __Block_byref_object_dispose__16;
    v36 = [[_GEOGeographicMetadataRequesterDelegateDataBlockAdapter alloc] initWithBlock:v11];
    uint64_t v22 = 0;
    __int16 v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__16;
    id v26 = __Block_byref_object_dispose__16;
    id v12 = [GEOGeographicMetadataRequester alloc];
    id v27 = [(GEOGeographicMetadataRequester *)v12 initWithType:a4 mcc:0 mnc:0 queue:v10 delegate:*((void *)v32 + 5) territoryBlock:0];
    if (v23[5])
    {
      uint64_t v13 = [v9 copy];
      uint64_t v14 = v23[5];
      uint64_t v15 = *(void **)(v14 + 24);
      *(void *)(v14 + 24) = v13;

      uint64_t v16 = (void *)v23[5];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke_2;
      v19[3] = &unk_1E53DDE88;
      v19[4] = &v22;
      v19[5] = buf;
      [v16 _fetchData:v19];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke_26;
      block[3] = &unk_1E53DA028;
      id v21 = v11;
      dispatch_async(v10, block);
    }
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    unint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid GEOGeographicMetadataType: %d", a4);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke;
    v28[3] = &unk_1E53D7C50;
    id v29 = v17;
    id v30 = v11;
    id v18 = v17;
    dispatch_async(v10, v28);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a4;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: Invalid type: %d", buf, 8u);
    }
  }
}

void __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__GEOGeographicMetadataRequester_fetchDataForLocation_type_responseQueue_responseBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

+ (void)fetchSmartDataModeDataForLocation:(id)a3 mcc:(unsigned __int16)a4 mnc:(unsigned __int16)a5 responseQueue:(id)a6 responseBlock:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v10 = a4;
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  if (v10 <= 0x3E7 && v9 < 0x3E8)
  {
LABEL_6:
    *(void *)buf = 0;
    uint64_t v31 = buf;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__16;
    v34 = __Block_byref_object_dispose__16;
    v35 = [[_GEOGeographicMetadataRequesterDelegateDataBlockAdapter alloc] initWithBlock:v13];
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__16;
    id v28 = __Block_byref_object_dispose__16;
    uint64_t v16 = [GEOGeographicMetadataRequester alloc];
    id v29 = [(GEOGeographicMetadataRequester *)v16 initWithType:2 mcc:v10 mnc:v9 queue:v12 delegate:*((void *)v31 + 5) territoryBlock:0];
    if (v25[5])
    {
      uint64_t v17 = [v11 copy];
      uint64_t v18 = v25[5];
      BOOL v19 = *(void **)(v18 + 24);
      *(void *)(v18 + 24) = v17;

      uint64_t v20 = (void *)v25[5];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke_2;
      v21[3] = &unk_1E53DDE88;
      v21[4] = &v24;
      v21[5] = buf;
      [v20 _fetchData:v21];
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke_30;
      v22[3] = &unk_1E53DA028;
      id v23 = v13;
      dispatch_async(v12, v22);
    }
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_10;
  }
  uint64_t v14 = [NSString stringWithFormat:@"Invalid MCC (%hu) or MNC (%hu) must be in the range [0, 999]", v10, v9];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke;
  block[3] = &unk_1E53D7C50;
  id v37 = v14;
  id v38 = v13;
  id v15 = v14;
  dispatch_async(v12, block);
  if (v10 <= 0x3E7 && v9 < 0x3E8)
  {

    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: mcc <= 999 && mnc <= 999", buf, 2u);
  }

LABEL_10:
}

void __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-10 reason:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __104__GEOGeographicMetadataRequester_fetchSmartDataModeDataForLocation_mcc_mnc_responseQueue_responseBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (void)_fetchData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v5;

  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __45__GEOGeographicMetadataRequester__fetchData___block_invoke;
  id v12 = &unk_1E53DDEB0;
  objc_copyWeak(&v13, &location);
  id v7 = (void *)MEMORY[0x18C120660](&v9);
  id processBlock = self->_processBlock;
  self->_id processBlock = v7;

  [(GEOGeographicMetadataRequester *)self _fetch];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __45__GEOGeographicMetadataRequester__fetchData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _processResponse:v6 error:v5];
}

- (void)_processResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7 && [v6 count])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = [v6 allKeys];
    id v11 = [v9 setWithArray:v10];

    if (![(NSSet *)self->_lastUsedTileKeysMinZoom isEqualToSet:v11])
    {
      lastUsedTileKeysMaxZoom = self->_lastUsedTileKeysMaxZoom;
      self->_lastUsedTileKeysMaxZoom = 0;
    }
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__16;
    v30[4] = __Block_byref_object_dispose__16;
    id v31 = 0;
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__16;
    v24[4] = __Block_byref_object_dispose__16;
    id v25 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke_2;
    v23[3] = &unk_1E53DDED8;
    v23[4] = self;
    void v23[5] = v30;
    v23[6] = &v26;
    v23[7] = v24;
    [v6 enumerateKeysAndObjectsUsingBlock:v23];
    if (*((unsigned char *)v27 + 24))
    {
      unint64_t retryCounter = self->_retryCounter;
      if (retryCounter < GEOConfigGetUInteger(GeoServicesConfig_MAResourceCorruptMaxRetries, (uint64_t)off_1E9114DD8))
      {
        uint64_t v14 = GEOGetGeographicMetadataLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_INFO, "Reported corrupt tile resource, will retry request", buf, 2u);
        }

        ++self->_retryCounter;
        [(GEOGeographicMetadataRequester *)self _fetch];
        goto LABEL_18;
      }
      if (*((unsigned char *)v27 + 24))
      {
        uint64_t v16 = GEOGetGeographicMetadataLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "Reported corrupt tile resource but out of retries, will return whatever we've got", buf, 2u);
        }
      }
    }
    objc_storeStrong((id *)&self->_lastUsedTileKeysMinZoom, v11);
    delegateQueue = self->_delegateQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke_35;
    v18[3] = &unk_1E53DBF38;
    v18[4] = self;
    id v19 = 0;
    uint64_t v20 = v30;
    id v21 = v24;
    dispatch_async(delegateQueue, v18);

LABEL_18:
    _Block_object_dispose(v24, 8);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(v30, 8);

    goto LABEL_19;
  }
  if (!self->_delegateSupportsErrors)
  {
    id v11 = (void (**)(void))MEMORY[0x18C120660](self->_completionBlock);
    id completionBlock = self->_completionBlock;
    self->_id completionBlock = 0;

    v11[2](v11);
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v8 = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke;
  block[3] = &unk_1E53D8998;
  void block[4] = self;
  id v33 = v7;
  dispatch_async(v8, block);

LABEL_20:
}

void __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [v3 location];
  [WeakRetained geoGeographicMetadataRequester:v3 failedWithError:v4 forLocation:v5];

  uint64_t v8 = (void (**)(void))MEMORY[0x18C120660](*(void *)(*(void *)(a1 + 32) + 136));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = 0;

  v8[2]();
}

void __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [a2 unsignedLongLongValue];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v6 _doSimpleLookup:v5 rootQuadKey:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v10)
  {
    id v11 = [v10 domain];
    id v12 = GEOErrorDomain();
    if ([v11 isEqual:v12])
    {
      uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) code];

      if (v13 == -17)
      {
        [*(id *)(a1 + 32) reportCorrupt:v5];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    else
    {
    }
  }
  if (v9)
  {
    uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    [v14 addObjectsFromArray:v9];
  }
}

void __57__GEOGeographicMetadataRequester__processResponse_error___block_invoke_35(void *a1)
{
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v2 = a1[4];
    if (!*(unsigned char *)(v2 + 121)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 112));
    uint64_t v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = [v4 location];
    [WeakRetained geoGeographicMetadataRequester:v4 failedWithError:v5 forLocation:v6];
  }
  else
  {
    uint64_t v2 = a1[4];
    if (*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v2 + 112));
      uint64_t v7 = (void *)a1[4];
      uint64_t v8 = *(void *)(*(void *)(a1[7] + 8) + 40);
      uint64_t v6 = [v7 location];
      [WeakRetained geoGeographicMetadataRequester:v7 returnedNewResults:v8 forLocation:v6];
    }
    else
    {
      if (!*(unsigned char *)(v2 + 120)) {
        goto LABEL_9;
      }
      id WeakRetained = objc_loadWeakRetained((id *)(v2 + 112));
      uint64_t v9 = (void *)a1[4];
      uint64_t v6 = [v9 location];
      [WeakRetained geoGeographicMetadataRequester:v9 resultsDidNotChangeForLocation:v6];
    }
  }

  uint64_t v2 = a1[4];
LABEL_9:
  id v12 = (void (**)(void))MEMORY[0x18C120660](*(void *)(v2 + 136));
  uint64_t v10 = a1[4];
  id v11 = *(void **)(v10 + 136);
  *(void *)(v10 + 136) = 0;

  v12[2]();
}

uint64_t __110__GEOGeographicMetadataRequester__fetchPossibleTerritoriesForLocation_retryCount_responseQueue_responseBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__GEOGeographicMetadataRequester__processTerritories_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 128) + 16))();
  uint64_t v4 = (void (**)(void))MEMORY[0x18C120660](*(void *)(*(void *)(a1 + 32) + 136));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 136);
  *(void *)(v2 + 136) = 0;

  v4[2]();
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__16;
  uint64_t v17 = __Block_byref_object_dispose__16;
  id v18 = 0;
  block[6] = MEMORY[0x1E4F143A8];
  block[7] = 3221225472;
  block[8] = __46__GEOGeographicMetadataRequester_setLocation___block_invoke;
  block[9] = &unk_1E53DDF00;
  id v11 = &v19;
  id v12 = &v13;
  block[10] = self;
  id v5 = v4;
  id v10 = v5;
  geo_isolate_sync_data();
  if (*((unsigned char *)v20 + 24))
  {
    if (v14[5] && self->_delegateSupportsSkipNotifications)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__GEOGeographicMetadataRequester_setLocation___block_invoke_2;
      block[3] = &unk_1E53D7C00;
      void block[4] = self;
      void block[5] = &v13;
      dispatch_async(delegateQueue, block);
    }
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__GEOGeographicMetadataRequester_setLocation___block_invoke_3;
    v8[3] = &unk_1E53D79D8;
    v8[4] = self;
    uint64_t v7 = (void *)MEMORY[0x18C120660](v8);
    if (self->_responseTerritoryBlock) {
      [(GEOGeographicMetadataRequester *)self _fetchTerritories:v7];
    }
    else {
      [(GEOGeographicMetadataRequester *)self _fetchData:v7];
    }
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

void __46__GEOGeographicMetadataRequester_setLocation___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 72);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) copy];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v5;

    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  }
}

void __46__GEOGeographicMetadataRequester_setLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  [WeakRetained geoGeographicMetadataRequester:*(void *)(a1 + 32) skippedLocation:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __46__GEOGeographicMetadataRequester_setLocation___block_invoke_3(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__16;
  uint64_t v8 = __Block_byref_object_dispose__16;
  id v9 = 0;
  uint64_t v2 = MEMORY[0x1E4F143A8];
  uint64_t v3 = *(void *)(a1 + 32);
  geo_isolate_sync_data();
  if (v5[5]) {
    objc_msgSend(*(id *)(a1 + 32), "setLocation:", v2, 3221225472, __46__GEOGeographicMetadataRequester_setLocation___block_invoke_4, &unk_1E53D7C00, v3, &v4);
  }
  _Block_object_dispose(&v4, 8);
}

void __46__GEOGeographicMetadataRequester_setLocation___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

void __40__GEOGeographicMetadataRequester__fetch__block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v4 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", a2, a3);
  [*(id *)(a1 + 32) setLatLng:v4];

  [*(id *)(a1 + 32) setReferenceFrame:2];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  geo_isolate_sync_data();
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "fetchMetadataForLocation:responseQueue:block:", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 80), *(void *)(*(void *)(a1 + 40) + 96), v5, 3221225472, __40__GEOGeographicMetadataRequester__fetch__block_invoke_2, &unk_1E53D8998, v6);
}

void __40__GEOGeographicMetadataRequester__fetch__block_invoke_2(uint64_t a1)
{
}

uint64_t __40__GEOGeographicMetadataRequester__fetch__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 96) + 16))();
}

- (id)_doSimpleLookup:(id)a3 rootQuadKey:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(GEOGeographicMetadataRequester *)self location];
  id v10 = v9;
  uint64_t v11 = 76;
  switch(self->_type)
  {
    case 0uLL:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_30;
      }
      uint64_t v12 = objc_opt_class();
      [v8 URLByAppendingPathComponent:@"tiles/data"];
      unsigned __int8 v13 = 0;
      uint64_t v14 = v8;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
      uint64_t v11 = 80;
      goto LABEL_8;
    case 3uLL:
      uint64_t v11 = 81;
      goto LABEL_8;
    case 4uLL:
      uint64_t v11 = 94;
LABEL_8:
      [v9 coordinate];
      double v16 = v15;
      double v18 = v17;
      uint64_t v19 = +[GEOResourceManifestManager modernManager];
      uint64_t v20 = [v19 activeTileGroup];
      uint64_t v14 = [v20 activeTileSetForStyle:v11];

      if (!v14)
      {
        double v43 = NSString;
        uint64_t v44 = v11 - 76;
        if (v44 >= 0x13)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
          double v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          double v45 = off_1E53DDF98[v44];
        }
        id v46 = [v43 stringWithFormat:@"Tile style %@ not defined", v45];

        *a5 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2000 reason:v46];

        goto LABEL_30;
      }
      unsigned __int8 v13 = objc_msgSend(v14, "maximumZoomLevelForMapPoint:", GEOMapPointForCoordinate(v16, v18));
      uint64_t v12 = 0;
LABEL_10:

LABEL_11:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v22 = [v8 path];
        char v23 = [v21 fileExistsAtPath:v22];

        if ((v23 & 1) == 0)
        {
          double v42 = (void *)MEMORY[0x1E4F28C58];
          [NSString stringWithFormat:@"DB missing, expected at \"%@\"", v8];
          goto LABEL_29;
        }
        uint64_t v24 = [GEOGloriaDB alloc];
        id v25 = GEOGetGeographicMetadataLog();
        uint64_t v26 = [(GEOGloriaDB *)v24 initWithFileURL:v8 rootQuadKey:a4 metadataClass:v12 dataClass:0 log:v25];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_22:
          double v42 = (void *)MEMORY[0x1E4F28C58];
          [NSString stringWithFormat:@"Unable to open Gloria DB at \"%@\"", v8];
          id v47 = LABEL_29:;
          *a5 = [v42 GEOErrorWithCode:-17 reason:v47];

LABEL_30:
          id v48 = 0;
          goto LABEL_31;
        }
        if ((int)[v8 fileDescriptor] <= 0)
        {
          double v42 = (void *)MEMORY[0x1E4F28C58];
          [NSString stringWithFormat:@"DB missing, file descriptor was invalid", v50];
          goto LABEL_29;
        }
        id v27 = [GEOGloriaDB alloc];
        id v25 = GEOGetGeographicMetadataLog();
        uint64_t v26 = [(GEOGloriaDB *)v27 initWithFileHandle:v8 rootQuadKey:a4 metadataClass:v12 dataClass:0 log:v25];
      }
      uint64_t v28 = (void *)v26;

      if (!v28) {
        goto LABEL_22;
      }
      char v29 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v30 = objc_opt_class();
      [v10 coordinate];
      double v32 = v31;
      double v34 = v33;
      [v10 horizontalAccuracy];
      double v36 = v35;
      if (v12 == v30)
      {
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __68__GEOGeographicMetadataRequester__doSimpleLookup_rootQuadKey_error___block_invoke;
        v53[3] = &unk_1E53DDF50;
        double v40 = &v54;
        id v54 = v29;
        objc_msgSend(v28, "enumerateDataAtLocation:radius:visitor:", v53, v32, v34, v36);
      }
      else
      {
        lastUsedTileKeysMaxZoom = self->_lastUsedTileKeysMaxZoom;
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __68__GEOGeographicMetadataRequester__doSimpleLookup_rootQuadKey_error___block_invoke_63;
        v51[3] = &unk_1E53DDF50;
        id v38 = v29;
        id v52 = v38;
        objc_msgSend(v28, "enumerateDataAtLocation:radius:zoom:ifDifferentFrom:visitor:", v13, lastUsedTileKeysMaxZoom, v51, v32, v34, v36);
        v39 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (-[NSSet isEqualToSet:](v39, "isEqualToSet:", self->_lastUsedTileKeysMaxZoom) && ![v38 count])
        {

          id v48 = 0;
          goto LABEL_36;
        }
        double v40 = &v52;
        double v41 = self->_lastUsedTileKeysMaxZoom;
        self->_lastUsedTileKeysMaxZoom = v39;
      }
      id v48 = v29;
LABEL_36:

LABEL_31:
      return v48;
    default:
      unsigned __int8 v13 = 0;
      uint64_t v12 = 0;
      goto LABEL_11;
  }
}

void __68__GEOGeographicMetadataRequester__doSimpleLookup_rootQuadKey_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = GEOGetGeographicMetadataLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134218497;
    id v8 = v5;
    __int16 v9 = 1025;
    int v10 = [v5 length];
    __int16 v11 = 2049;
    uint64_t v12 = a2;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Got tileData %p of %{private}d bytes for quadKey %{private}llu", (uint8_t *)&v7, 0x1Cu);
  }

  [*(id *)(a1 + 32) addObject:v5];
}

void __68__GEOGeographicMetadataRequester__doSimpleLookup_rootQuadKey_error___block_invoke_63(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = GEOGetGeographicMetadataLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134218497;
    id v8 = v5;
    __int16 v9 = 1025;
    int v10 = [v5 length];
    __int16 v11 = 2049;
    uint64_t v12 = a2;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Got tileData %p of %{private}d bytes for quadKey %{private}llu", (uint8_t *)&v7, 0x1Cu);
  }

  [*(id *)(a1 + 32) addObject:v5];
}

@end