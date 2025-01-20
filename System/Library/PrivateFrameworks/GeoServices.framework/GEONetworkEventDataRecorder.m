@interface GEONetworkEventDataRecorder
+ (id)sharedRecorder;
+ (void)_recordNetworkEventForDataRequestKind:(id)a3 networkService:(int)a4 usedBackgroundURL:(id)a5 requestAppIdentifier:(id)a6 appMajorVersion:(id)a7 appMinorVersion:(id)a8 error:(id)a9 clientMetrics:(id)a10 states:(id)a11;
+ (void)recordNetworkEventDataForDataRequestKind:(id)a3 networkService:(int)a4 usedBackgroundURL:(id)a5 requestAppIdentifier:(id)a6 appMajorVersion:(id)a7 appMinorVersion:(id)a8 error:(id)a9 clientMetrics:(id)a10 additionalStates:(id)a11;
+ (void)recordNetworkEventDataForDataRequestKind:(id)a3 usedBackgroundURL:(id)a4 requestAppIdentifier:(id)a5 appMajorVersion:(id)a6 appMinorVersion:(id)a7 error:(id)a8 clientMetrics:(id)a9 additionalStates:(id)a10;
+ (void)recordNetworkEventDataForTileKey:(uint64_t)a3 requestAppIdentifier:(uint64_t)a4 appMajorVersion:(void *)a5 appMinorVersion:(void *)a6 error:(void *)a7 clientMetrics:(void *)a8 additionalStates:(void *)a9;
@end

@implementation GEONetworkEventDataRecorder

+ (void)recordNetworkEventDataForDataRequestKind:(id)a3 usedBackgroundURL:(id)a4 requestAppIdentifier:(id)a5 appMajorVersion:(id)a6 appMinorVersion:(id)a7 error:(id)a8 clientMetrics:(id)a9 additionalStates:(id)a10
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (+[GEOPlatform isRunningInGeod])
  {
    id v33 = a1;
    v23 = GEODataRequestKindAsString(*(void *)&a3);
    v24 = GEOGetNetEventRecorderLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v23;
      _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_DEBUG, "saving netevent data for kind %@", buf, 0xCu);
    }

    if (a3.var0 <= 767)
    {
      if (a3.var0 == 673) {
        int v26 = 6;
      }
      else {
        int v26 = 0;
      }
      if (a3.var0 == 672) {
        int v27 = 7;
      }
      else {
        int v27 = v26;
      }
      if (a3.var0 == 512) {
        unsigned int v28 = 4;
      }
      else {
        unsigned int v28 = v27;
      }
      if (HIDWORD(*(unint64_t *)&a3) == 57) {
        int v29 = 25;
      }
      else {
        int v29 = 5;
      }
      if (a3.var0 != 256) {
        int v29 = 0;
      }
      if (a3.var0 == 6) {
        int v30 = 24;
      }
      else {
        int v30 = v29;
      }
      if (a3.var0 <= 511) {
        unsigned int v28 = v30;
      }
      if ((a3.var0 - 4) >= 2) {
        int v31 = 0;
      }
      else {
        int v31 = 14;
      }
      if ((a3.var0 - 2) >= 2) {
        unsigned int v32 = v31;
      }
      else {
        unsigned int v32 = 19;
      }
      if (a3.var0 <= 5) {
        uint64_t v25 = v32;
      }
      else {
        uint64_t v25 = v28;
      }
    }
    else
    {
      uint64_t v25 = 0;
      if (a3.var0 <= 2847)
      {
        if (a3.var0 == 768 || a3.var0 == 1280 || a3.var0 == 1792) {
          uint64_t v25 = 13;
        }
      }
      else
      {
        switch(a3.var0)
        {
          case 0xB20:
            uint64_t v25 = 11;
            break;
          case 0xB21:
            uint64_t v25 = 12;
            break;
          case 0xB22:
            uint64_t v25 = 18;
            break;
          case 0xB23:
            uint64_t v25 = 17;
            break;
          case 0xB27:
            uint64_t v25 = 9;
            break;
          case 0xB28:
            uint64_t v25 = 23;
            break;
          case 0xB2A:
            uint64_t v25 = 27;
            break;
          default:
            break;
        }
      }
    }
    [v33 _recordNetworkEventForDataRequestKind:a3 networkService:v25 usedBackgroundURL:v16 requestAppIdentifier:v17 appMajorVersion:v18 appMinorVersion:v19 error:v20 clientMetrics:v21 states:v22];
  }
}

+ (void)_recordNetworkEventForDataRequestKind:(id)a3 networkService:(int)a4 usedBackgroundURL:(id)a5 requestAppIdentifier:(id)a6 appMajorVersion:(id)a7 appMinorVersion:(id)a8 error:(id)a9 clientMetrics:(id)a10 states:(id)a11
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = +[GEOReferenceTimeManager sharedManager];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __182__GEONetworkEventDataRecorder__recordNetworkEventForDataRequestKind_networkService_usedBackgroundURL_requestAppIdentifier_appMajorVersion_appMinorVersion_error_clientMetrics_states___block_invoke;
  v28[3] = &unk_1E53E81A8;
  int v35 = a4;
  $C4D369C9F02205611300857CFD58F739 v36 = a3;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  id v34 = v20;
  id v22 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  id v27 = v15;
  [v21 referenceTimeResult:v28];
}

void __182__GEONetworkEventDataRecorder__recordNetworkEventForDataRequestKind_networkService_usedBackgroundURL_requestAppIdentifier_appMajorVersion_appMinorVersion_error_clientMetrics_states___block_invoke(uint64_t a1, int a2, double a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:a3];
    v6 = objc_alloc_init(GEONetworkEventData);
    [(GEONetworkEventData *)v6 setEventTimestamp:a3];
    [(GEONetworkEventData *)v6 setNetworkService:*(unsigned int *)(a1 + 80)];
    [(GEONetworkEventData *)v6 setDataRequestKindType:*(unsigned int *)(a1 + 84)];
    [(GEONetworkEventData *)v6 setDataRequestKindSubtype:*(unsigned int *)(a1 + 88)];
    [(GEONetworkEventData *)v6 setAppIdentifier:*(void *)(a1 + 32)];
    [(GEONetworkEventData *)v6 setRequestingAppIdentifier:*(void *)(a1 + 32)];
    [(GEONetworkEventData *)v6 setRequestingAppMajorVer:*(void *)(a1 + 40)];
    [(GEONetworkEventData *)v6 setRequestingAppMinorVer:*(void *)(a1 + 48)];
    v7 = *(void **)(a1 + 56);
    if (v7)
    {
      v8 = [v7 domain];
      [(GEONetworkEventData *)v6 setErrorDomain:v8];

      -[GEONetworkEventData setErrorCode:](v6, "setErrorCode:", [*(id *)(a1 + 56) code]);
    }
    [(GEONetworkEventData *)v6 setClientMetrics:*(void *)(a1 + 64)];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = *(id *)(a1 + 72);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          -[GEONetworkEventData addAdditionalStates:](v6, "addAdditionalStates:", *(void *)(*((void *)&v26 + 1) + 8 * v13++), (void)v26);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }

    v14 = +[GEOCountryConfiguration sharedConfiguration];
    id v15 = [v14 countryCode];
    [(GEONetworkEventData *)v6 setCountryCode:v15];

    id v16 = +[GEOResourceManifestManager modernManager];
    id v17 = [v16 activeTileGroup];
    -[GEONetworkEventData setTilesetId:](v6, "setTilesetId:", [v17 identifier]);

    id v18 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v19 = [v18 localeIdentifier];
    [(GEONetworkEventData *)v6 setLocale:v19];

    id v20 = _getValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1E9113958, 1, 0, 0, 0);
    [(GEONetworkEventData *)v6 setManifestEnvironment:v20];

    id v21 = +[GEOExperimentConfiguration sharedConfiguration];
    id v22 = [v21 experimentsInfo];
    id v23 = [v22 mapsAbClientMetadata];
    id v24 = [v23 clientDatasetMetadata];
    -[GEONetworkEventData setDatasetId:](v6, "setDatasetId:", [v24 datasetId]);

    id v25 = +[GEONetworkEventFileManager sharedManager];
    [v25 saveNetworkEventData:v6 atTime:v5];
  }
}

+ (id)sharedRecorder
{
  if (qword_1EB29FE60 != -1) {
    dispatch_once(&qword_1EB29FE60, &__block_literal_global_122);
  }
  v2 = (void *)_MergedGlobals_265;

  return v2;
}

void __45__GEONetworkEventDataRecorder_sharedRecorder__block_invoke()
{
  v0 = objc_alloc_init(GEONetworkEventDataRecorder);
  v1 = (void *)_MergedGlobals_265;
  _MergedGlobals_265 = (uint64_t)v0;
}

+ (void)recordNetworkEventDataForTileKey:(uint64_t)a3 requestAppIdentifier:(uint64_t)a4 appMajorVersion:(void *)a5 appMinorVersion:(void *)a6 error:(void *)a7 clientMetrics:(void *)a8 additionalStates:(void *)a9
{
  v37[1] = *MEMORY[0x1E4F143B8];
  uint64_t v36 = a3;
  v37[0] = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  if (+[GEOPlatform isRunningInGeod])
  {
    id v20 = GEOGetNetEventRecorderLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v21 = GEOStringFromTileKey((char *)&v36);
      *(_DWORD *)buf = 138477827;
      int v35 = v21;
      _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_DEBUG, "saving netevent data for tilekey %{private}@", buf, 0xCu);
    }
    *(_DWORD *)buf = 0;
    if (GEOTileKeyStyle((uint64_t)&v36, buf))
    {
      uint64_t v22 = *(unsigned int *)buf;
      unint64_t v23 = ((unint64_t)*(unsigned int *)buf << 32) | 0x100;
      if (*(_DWORD *)buf == 57 || (v36 & 0x7F) == 7)
      {
        uint64_t v24 = 25;
LABEL_17:
        [a1 _recordNetworkEventForDataRequestKind:v23 networkService:v24 usedBackgroundURL:0 requestAppIdentifier:v14 appMajorVersion:v15 appMinorVersion:v16 error:v17 clientMetrics:v18 states:v19];
        goto LABEL_18;
      }
      id v25 = objc_alloc_init(GEOTileSetInfo);
      [(GEOTileSetInfo *)v25 setCount:1];
      id v32 = v25;
      [(GEOTileSetInfo *)v25 setStyle:v22];
      int v26 = v36 & 0x7F;
      if (v26 == 15)
      {
        long long v27 = (unsigned __int8 *)v37 + 1;
      }
      else
      {
        if (v26 != 13)
        {
LABEL_13:
          long long v28 = objc_alloc_init(GEOLogMsgState);
          [(GEOLogMsgState *)v28 setStateType:706];
          long long v29 = objc_alloc_init(GEOLogMsgStateTileSet);
          [(GEOLogMsgState *)v28 setTileSet:v29];

          id v30 = [(GEOLogMsgState *)v28 tileSet];
          [v30 addTileSetInfo:v32];

          if (v19)
          {
            uint64_t v31 = [v19 arrayByAddingObject:v28];

            id v19 = (id)v31;
          }
          else
          {
            id v33 = v28;
            id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
          }

          uint64_t v24 = 5;
          goto LABEL_17;
        }
        long long v27 = (unsigned __int8 *)&v36 + 3;
      }
      [(GEOTileSetInfo *)v25 setUncertainty:*v27];
      goto LABEL_13;
    }
  }
LABEL_18:
}

+ (void)recordNetworkEventDataForDataRequestKind:(id)a3 networkService:(int)a4 usedBackgroundURL:(id)a5 requestAppIdentifier:(id)a6 appMajorVersion:(id)a7 appMinorVersion:(id)a8 error:(id)a9 clientMetrics:(id)a10 additionalStates:(id)a11
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  if (+[GEOPlatform isRunningInGeod])
  {
    uint64_t v22 = GEODataRequestKindAsString(*(void *)&a3);
    unint64_t v23 = GEOGetNetEventRecorderLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      long long v27 = v22;
      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_DEBUG, "saving netevent data for kind %@", buf, 0xCu);
    }

    [a1 _recordNetworkEventForDataRequestKind:a3 networkService:a4 usedBackgroundURL:v15 requestAppIdentifier:v16 appMajorVersion:v17 appMinorVersion:v18 error:v19 clientMetrics:v20 states:v21];
  }
}

@end