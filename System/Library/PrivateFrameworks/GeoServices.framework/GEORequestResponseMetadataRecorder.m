@interface GEORequestResponseMetadataRecorder
+ (void)_populateOfflineStateInRRData:(id)a3 forCohortId:(id)a4;
+ (void)_populateSessionStateInRRData:(id)a3;
+ (void)recordDirectionsRequestResponseAnalyticsData:(id)a3 forCohortId:(id)a4;
+ (void)recordPlacesRequestResponseAnalyticsData:(id)a3 forCohortId:(id)a4;
@end

@implementation GEORequestResponseMetadataRecorder

+ (void)_populateSessionStateInRRData:(id)a3
{
  id v3 = a3;
  v4 = +[GEOUserSession sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__GEORequestResponseMetadataRecorder__populateSessionStateInRRData___block_invoke;
  v6[3] = &unk_1E53DC588;
  id v7 = v3;
  id v5 = v3;
  [v4 shortSessionValues:v6];
}

uint64_t __68__GEORequestResponseMetadataRecorder__populateSessionStateInRRData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  v14 = objc_alloc_init(GEOLogMsgStateUserSession);
  [*(id *)(a1 + 32) setStateUserSession:v14];

  v15 = [*(id *)(a1 + 32) stateUserSession];
  [v15 setRelativeTimestamp:a7];

  v16 = [*(id *)(a1 + 32) stateUserSession];
  objc_msgSend(v16, "setSessionId:", a2, a3);

  v17 = [[GEOLocalTime alloc] initWithCFAbsoluteTime:a5];
  v18 = [*(id *)(a1 + 32) stateUserSession];
  [v18 setEventTime:v17];

  v19 = [*(id *)(a1 + 32) stateUserSession];
  [v19 setSequenceNumber:a4];

  v20 = *(void **)(a1 + 32);

  return [v20 setSessionBatchIdBits:a6];
}

+ (void)_populateOfflineStateInRRData:(id)a3 forCohortId:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (+[GEOPlatform isRunningInGeod])
  {
    id v7 = objc_alloc_init(GEOLogMsgStateOffline);
    v8 = +[GEOOfflineStateManager shared];
    __int16 v9 = [v8 currentStateForCohortId:v6];
    int v10 = v9;
    if (v9 < 2u)
    {
      [(GEOLogMsgStateOffline *)v7 setIsMapsInOfflineMode:0];
      goto LABEL_4;
    }
    if (v9 == 2)
    {
      __int16 v12 = v9;
      [(GEOLogMsgStateOffline *)v7 setIsMapsInOfflineMode:1];
      if (HIBYTE(v12) < 3u)
      {
        BOOL v11 = (v12 & 0x700) == 512;
        goto LABEL_12;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
LABEL_4:
        BOOL v11 = 0;
LABEL_12:
        [(GEOLogMsgStateOffline *)v7 setIsOnlyUseOffline:v11];
        v15 = +[GEONetworkObserver sharedNetworkObserver];
        -[GEOLogMsgStateOffline setIsNetworkConnected:](v7, "setIsNetworkConnected:", [v15 isNetworkReachable]);

        if ([v8 subscriptionCount] <= 2) {
          uint64_t v16 = [v8 subscriptionCount];
        }
        else {
          uint64_t v16 = 2;
        }
        [(GEOLogMsgStateOffline *)v7 setNumberOfDownloadedRegions:v16];
        if ([(GEOLogMsgStateOffline *)v7 isMapsInOfflineMode])
        {
          v17 = +[GEOOfflineDataConfiguration sharedConfiguration];
          v18 = [[GEOOfflineVersionMetadata alloc] initWithDataConfiguration:v17];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __80__GEORequestResponseMetadataRecorder__populateOfflineStateInRRData_forCohortId___block_invoke;
          v21[3] = &unk_1E53EDA40;
          v22 = v7;
          [(GEOOfflineVersionMetadata *)v18 enumerateLayerVersions:v21];
        }
        [v5 setStateOffline:v7];

        goto LABEL_18;
      }
      *(_DWORD *)buf = 67109120;
      int v24 = HIBYTE(v12);
      v19 = MEMORY[0x1E4F14500];
      v20 = "Unreachable reached: invalid offline reason value %x";
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v24 = v10;
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: invalid offline mode value %x", buf, 8u);
      }
      [(GEOLogMsgStateOffline *)v7 setIsMapsInOfflineMode:0];
      BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      BOOL v11 = 0;
      if (!v14) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 67109120;
      int v24 = v10;
      v19 = MEMORY[0x1E4F14500];
      v20 = "Unreachable reached: invalid offline mode value %x";
    }
    _os_log_fault_impl(&dword_188D96000, v19, OS_LOG_TYPE_FAULT, v20, buf, 8u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [GEOPlatform isRunningInGeod]", buf, 2u);
  }
LABEL_18:
}

uint64_t __80__GEORequestResponseMetadataRecorder__populateOfflineStateInRRData_forCohortId___block_invoke(uint64_t result, int a2)
{
  if (a2 == 7) {
    return objc_msgSend(*(id *)(result + 32), "setSearchOdsVersion:");
  }
  if (a2 == 2) {
    return objc_msgSend(*(id *)(result + 32), "setRoutingOdsVersion:");
  }
  return result;
}

+ (void)recordDirectionsRequestResponseAnalyticsData:(id)a3 forCohortId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[GEOReferenceTimeManager sharedManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__GEORequestResponseMetadataRecorder_recordDirectionsRequestResponseAnalyticsData_forCohortId___block_invoke;
  v11[3] = &unk_1E53EDA68;
  id v13 = v6;
  id v14 = a1;
  id v12 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 referenceTimeResult:v11];
}

void __95__GEORequestResponseMetadataRecorder_recordDirectionsRequestResponseAnalyticsData_forCohortId___block_invoke(uint64_t a1, char a2, double a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v5 = objc_alloc_init(GEORequestResponseMetadata);
    [*(id *)(a1 + 48) _populateSessionStateInRRData:v5];
    [*(id *)(a1 + 48) _populateOfflineStateInRRData:v5 forCohortId:*(void *)(a1 + 32)];
    id v6 = GEOGetRRMetadataRecorderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v14[0] = 67174657;
      v14[1] = [(GEORequestResponseMetadata *)v5 sessionBatchIdBits];
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "saving directions request metadata (%{private}u)", (uint8_t *)v14, 8u);
    }

    id v7 = objc_alloc_init(GEOLogMsgEventServiceMetadata);
    [(GEORequestResponseMetadata *)v5 setEventMetadata:v7];

    v8 = [(GEORequestResponseMetadata *)v5 eventMetadata];
    [v8 setServiceMetadataType:1];

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [(GEORequestResponseMetadata *)v5 eventMetadata];
    [v10 setDirectionsMetadata:v9];

    [(GEORequestResponseMetadata *)v5 setCollectionTime:a3];
    unsigned int v11 = [(GEORequestResponseMetadata *)v5 sessionBatchIdBits];
    unint64_t v12 = v11 | ((unint64_t)(unsigned __int16)geo_userActionAndMetadataSessionType << 32) | ((unint64_t)geo_userActionAndMetadataUploadType << 48);
    id v13 = +[GEORequestResponseMetadataFileManager sharedManager];
    [v13 saveRequestResponseMetadata:v5 batchID:v12];
  }
  else
  {
    GEOGetRRMetadataRecorderLog();
    id v5 = (GEORequestResponseMetadata *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_188D96000, &v5->super.super, OS_LOG_TYPE_DEBUG, "no time sync; not saving directions request metadata",
        (uint8_t *)v14,
        2u);
    }
  }
}

+ (void)recordPlacesRequestResponseAnalyticsData:(id)a3 forCohortId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[GEOReferenceTimeManager sharedManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__GEORequestResponseMetadataRecorder_recordPlacesRequestResponseAnalyticsData_forCohortId___block_invoke;
  v11[3] = &unk_1E53EDA68;
  id v13 = v6;
  id v14 = a1;
  id v12 = v7;
  id v9 = v6;
  id v10 = v7;
  [v8 referenceTimeResult:v11];
}

void __91__GEORequestResponseMetadataRecorder_recordPlacesRequestResponseAnalyticsData_forCohortId___block_invoke(uint64_t a1, char a2, double a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v5 = objc_alloc_init(GEORequestResponseMetadata);
    [*(id *)(a1 + 48) _populateSessionStateInRRData:v5];
    [*(id *)(a1 + 48) _populateOfflineStateInRRData:v5 forCohortId:*(void *)(a1 + 32)];
    id v6 = GEOGetRRMetadataRecorderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v14[0] = 67174657;
      v14[1] = [(GEORequestResponseMetadata *)v5 sessionBatchIdBits];
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "saving place request metadata (%{private}u)", (uint8_t *)v14, 8u);
    }

    id v7 = objc_alloc_init(GEOLogMsgEventServiceMetadata);
    [(GEORequestResponseMetadata *)v5 setEventMetadata:v7];

    v8 = [(GEORequestResponseMetadata *)v5 eventMetadata];
    [v8 setServiceMetadataType:2];

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [(GEORequestResponseMetadata *)v5 eventMetadata];
    [v10 setPlacesMetadata:v9];

    [(GEORequestResponseMetadata *)v5 setCollectionTime:a3];
    unsigned int v11 = [(GEORequestResponseMetadata *)v5 sessionBatchIdBits];
    unint64_t v12 = v11 | ((unint64_t)(unsigned __int16)geo_userActionAndMetadataSessionType << 32) | ((unint64_t)geo_userActionAndMetadataUploadType << 48);
    id v13 = +[GEORequestResponseMetadataFileManager sharedManager];
    [v13 saveRequestResponseMetadata:v5 batchID:v12];
  }
  else
  {
    GEOGetRRMetadataRecorderLog();
    id v5 = (GEORequestResponseMetadata *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_188D96000, &v5->super.super, OS_LOG_TYPE_DEBUG, "no time sync; not saving place request metadata",
        (uint8_t *)v14,
        2u);
    }
  }
}

@end