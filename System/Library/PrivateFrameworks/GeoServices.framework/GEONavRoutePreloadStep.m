@interface GEONavRoutePreloadStep
- (BOOL)hasError;
- (BOOL)hasLifetimeError;
- (BOOL)okToLoad;
- (GEONavRoutePreloadStep)init;
- (GEONavRoutePreloadStep)initWithAuditToken:(id)a3 highZoomMetrosAvailabilityFetcher:(id)a4 assetMetadataFetcher:(id)a5 preloaderSignpostID:(unint64_t)a6;
- (double)networkDataRateKB;
- (id)description;
- (void)_loadTiles:(id)a3 requireWiFi:(BOOL)a4 unsuccessfulKeysAccumulator:(id)a5 errorsAccumulator:(id)a6 queue:(id)a7 group:(id)a8 willLoadHandler:(id)a9 progressHandler:(id)a10;
- (void)cancel;
- (void)encounteredErrors:(id)a3;
- (void)loadWithCallbackQueue:(id)a3 requireWiFi:(BOOL)a4 willLoadHandler:(id)a5 progressHandler:(id)a6 finishedHandler:(id)a7 errorHandler:(id)a8;
- (void)resetErrors;
@end

@implementation GEONavRoutePreloadStep

- (GEONavRoutePreloadStep)init
{
  return [(GEONavRoutePreloadStep *)self initWithAuditToken:0 highZoomMetrosAvailabilityFetcher:0 assetMetadataFetcher:0 preloaderSignpostID:0];
}

- (GEONavRoutePreloadStep)initWithAuditToken:(id)a3 highZoomMetrosAvailabilityFetcher:(id)a4 assetMetadataFetcher:(id)a5 preloaderSignpostID:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GEONavRoutePreloadStep;
  v14 = [(GEONavRoutePreloadStep *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_auditToken, a3);
    objc_storeStrong((id *)&v15->_sprMetrosAvailabilityFetcher, a4);
    objc_storeStrong((id *)&v15->_assetMetadataFetcher, a5);
    v15->_parentSignpostID = a6;
    v16 = GEOGetRoutePreloaderLog();
    v15->_signpostID = os_signpost_id_generate(v16);

    v17 = v15;
  }

  return v15;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<GEONavRoutePreloadStep: %p> routeIdx:%f loading:%d loaded:%d errCount:%lu lifetimeErrCount:%lu", self, *(void *)&self->routeIdx, (*((unsigned __int8 *)self + 76) >> 1) & 1, (*((unsigned __int8 *)self + 76) >> 2) & 1, self->_errorCount, self->_lifetimeErrorCount);
}

- (BOOL)okToLoad
{
  return (*((unsigned char *)self + 76) & 6) == 0 && self->_errorCount == 0;
}

- (BOOL)hasError
{
  return self->_errorCount != 0;
}

- (BOOL)hasLifetimeError
{
  return self->_lifetimeErrorCount != 0;
}

- (void)resetErrors
{
  self->_errorCount = 0;
}

- (double)networkDataRateKB
{
  double v2 = self->endTime - self->startTime;
  HIDWORD(v3) = 1051772663;
  if (v2 < 0.000001) {
    return 100000.0;
  }
  LODWORD(v3) = self->bytesLoadedFromNetwork;
  return (double)v3 / 1000.0 / v2;
}

- (void)encounteredErrors:(id)a3
{
  *(int32x2_t *)&self->_errorCount = vadd_s32(*(int32x2_t *)&self->_errorCount, (int32x2_t)0x100000001);
}

- (void)loadWithCallbackQueue:(id)a3 requireWiFi:(BOOL)a4 willLoadHandler:(id)a5 progressHandler:(id)a6 finishedHandler:(id)a7 errorHandler:(id)a8
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v56 = a7;
  id v57 = a8;
  *((unsigned char *)self + 76) |= 2u;
  self->startTime = CFAbsoluteTimeGetCurrent();
  self->bytesLoadedFromNetwork = 0;
  if (self->_assetMetadataFetcher) {
    BOOL v16 = [(GEOTileKeyList *)self->assetMetadataTiles count] != 0;
  }
  else {
    BOOL v16 = 0;
  }
  v17 = GEOGetRoutePreloaderLog();
  v18 = v17;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    unint64_t parentSignpostID = self->_parentSignpostID;
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = parentSignpostID;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v18, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "PreloadStep", "parent_signpost=%llu", buf, 0xCu);
  }

  dispatch_group_t v21 = dispatch_group_create();
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2020000000;
  uint64_t v111 = 0;
  wantedTiles = self->wantedTiles;
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke;
  v107[3] = &unk_1E53DFB60;
  v107[4] = &v108;
  [(NSMutableDictionary *)wantedTiles enumerateKeysAndObjectsUsingBlock:v107];
  id v23 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v24 = (void *)[v23 initWithCapacity:v109[3]];
  v25 = [GEOTileKeyList alloc];
  v26 = [(GEOTileKeyList *)v25 initWithMaxCapacity:v109[3]];
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x2020000000;
  BOOL v106 = v16;
  v27 = self->wantedTiles;
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_2;
  v94[3] = &unk_1E53DFB88;
  v101 = &v103;
  v94[4] = self;
  BOOL v102 = a4;
  v28 = v26;
  v95 = v28;
  id v29 = v24;
  id v96 = v29;
  v30 = v13;
  v97 = v30;
  v31 = v21;
  v98 = v31;
  id v58 = v14;
  id v99 = v58;
  id v59 = v15;
  id v100 = v59;
  [(NSMutableDictionary *)v27 enumerateKeysAndObjectsUsingBlock:v94];
  if (*((unsigned char *)v104 + 24) && self->_sprMetrosAvailabilityFetcher)
  {
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_3;
    v85[3] = &unk_1E53DFBD8;
    v54 = v30;
    v86 = v54;
    v87 = self;
    BOOL v93 = a4;
    v50 = v28;
    v88 = v50;
    id v53 = v29;
    id v89 = v53;
    v32 = v31;
    v90 = v32;
    id v52 = v58;
    id v91 = v52;
    id v51 = v59;
    id v92 = v51;
    v33 = (uint64_t (**)(void, void))MEMORY[0x18C120660](v85);
    if (v16) {
      v34 = dispatch_group_create();
    }
    else {
      v34 = 0;
    }
    group = v34;
    if (self->_metrosSupported)
    {
      uint64_t v35 = ((uint64_t (**)(void, BOOL))v33)[2](v33, self->_metrosSupported == 2);
      if (!v35)
      {
LABEL_24:
        if (v16)
        {
          v49 = v33;
          dispatch_group_enter(v32);
          dispatch_group_enter(v34);
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v113 = __Block_byref_object_copy__29;
          v114 = __Block_byref_object_dispose__29;
          id v115 = 0;
          assetMetadataFetcher = self->_assetMetadataFetcher;
          v48 = v32;
          assetMetadataTiles = self->assetMetadataTiles;
          v75[0] = MEMORY[0x1E4F143A8];
          v75[1] = 3221225472;
          v75[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_9;
          v75[3] = &unk_1E53DFC28;
          id v42 = v53;
          id v76 = v42;
          v78 = buf;
          v43 = v34;
          v77 = v43;
          [(GEOMapAssetMetadataFetcher *)assetMetadataFetcher fetchAssetMetadataForMetadataKeys:assetMetadataTiles callbackQueue:v54 completionHandler:v75];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_11;
          block[3] = &unk_1E53DFC50;
          block[4] = self;
          v73 = buf;
          BOOL v74 = a4;
          v67 = v50;
          id v68 = v42;
          v69 = v54;
          v70 = v48;
          id v71 = v52;
          id v72 = v51;
          dispatch_group_notify(v43, v69, block);

          v33 = v49;
          _Block_object_dispose(buf, 8);

          v34 = group;
        }

        goto LABEL_27;
      }
      v36 = GEOGetRoutePreloaderLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v37 = "NO";
        if (self->_metrosSupported == 2) {
          v37 = "YES";
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v35;
        _os_log_impl(&dword_188D96000, v36, OS_LOG_TYPE_DEBUG, "[NavStrategy] Feature availability is known: %s. Loading %llu relevant tiles", buf, 0x16u);
      }
    }
    else
    {
      v38 = GEOGetRoutePreloaderLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v38, OS_LOG_TYPE_DEBUG, "[NavStrategy] Some tiles are conditional on feature availability. Determining availability for step", buf, 2u);
      }

      dispatch_group_enter(v32);
      if (group) {
        dispatch_group_enter(group);
      }
      sprMetrosAvailabilityFetcher = self->_sprMetrosAvailabilityFetcher;
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_7;
      v79[3] = &unk_1E53DFC00;
      v80 = v53;
      v81 = v32;
      v82 = group;
      v83 = self;
      v84 = v33;
      -[GEOSPRMetroAvailabilityFetcher determineAvailabilityForCoordinate:callbackQueue:completionHandler:](sprMetrosAvailabilityFetcher, "determineAvailabilityForCoordinate:callbackQueue:completionHandler:", v54, v79, self->coord.latitude, self->coord.longitude);

      v36 = v80;
    }

    v34 = group;
    goto LABEL_24;
  }
LABEL_27:
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_13;
  v61[3] = &unk_1E53DFC78;
  v61[4] = self;
  id v62 = v29;
  v63 = v28;
  id v64 = v57;
  id v65 = v56;
  id v44 = v56;
  v45 = v28;
  id v46 = v57;
  id v47 = v29;
  dispatch_group_notify(v31, v30, v61);

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v108, 8);
}

uint64_t __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (([a2 unsignedIntegerValue] & 3) != 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  }
  else {
    [*(id *)(a1 + 32) _loadTiles:v5 requireWiFi:*(unsigned __int8 *)(a1 + 96) unsuccessfulKeysAccumulator:*(void *)(a1 + 40) errorsAccumulator:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) group:*(void *)(a1 + 64) willLoadHandler:*(void *)(a1 + 72) progressHandler:*(void *)(a1 + 80)];
  }
}

uint64_t __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = *(void **)(v3 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_4;
  v7[3] = &unk_1E53DFBB0;
  char v15 = a2;
  id v14 = &v17;
  v7[4] = v3;
  char v16 = *(unsigned char *)(a1 + 88);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 72);
  id v13 = *(id *)(a1 + 80);
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v5 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v5;
}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  char v5 = [a2 unsignedIntegerValue];
  if ((v5 & 1) != 0 && *(unsigned char *)(a1 + 96) || (v5 & 2) != 0 && !*(unsigned char *)(a1 + 96))
  {
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) += [v6 count];
    [*(id *)(a1 + 32) _loadTiles:v6 requireWiFi:*(unsigned __int8 *)(a1 + 97) unsuccessfulKeysAccumulator:*(void *)(a1 + 40) errorsAccumulator:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) group:*(void *)(a1 + 64) willLoadHandler:*(void *)(a1 + 72) progressHandler:*(void *)(a1 + 80)];
  }
}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_7(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char v5 = a3;
  if (v5)
  {
    id v6 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "[NavStrategy] Failed to determine feature availability: %@", (uint8_t *)&v12, 0xCu);
    }

    [*(id *)(a1 + 32) addObject:v5];
  }
  else
  {
    if (a2) {
      char v7 = 2;
    }
    else {
      char v7 = 1;
    }
    *(unsigned char *)(*(void *)(a1 + 56) + 112) = v7;
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
    id v9 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = "NO";
      if (a2) {
        id v10 = "YES";
      }
      int v12 = 136315394;
      id v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "[NavStrategy] Determined feature availability: %s. Loading %llu relevant tiles", (uint8_t *)&v12, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  id v11 = *(NSObject **)(a1 + 48);
  if (v11) {
    dispatch_group_leave(v11);
  }
}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "[NavStrategy] Failed to determine assets to preload: %@", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) addObject:v7];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_11(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 112))
  {
    double v2 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) keysForMetroAvailability:*(unsigned __int8 *)(*(void *)(a1 + 32) + 112) == 2];
    uint64_t v3 = [v2 count];
    v4 = GEOGetRoutePreloaderLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v7 = [v2 count];
        _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "[NavStrategy] Loading %llu relevant assets", buf, 0xCu);
      }

      [*(id *)(a1 + 32) _loadTiles:v2 requireWiFi:*(unsigned __int8 *)(a1 + 96) unsuccessfulKeysAccumulator:*(void *)(a1 + 40) errorsAccumulator:*(void *)(a1 + 48) queue:*(void *)(a1 + 56) group:*(void *)(a1 + 64) willLoadHandler:*(void *)(a1 + 72) progressHandler:*(void *)(a1 + 80)];
    }
    else
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "[NavStrategy] Step requires no external assets", buf, 2u);
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __121__GEONavRoutePreloadStep_loadWithCallbackQueue_requireWiFi_willLoadHandler_progressHandler_finishedHandler_errorHandler___block_invoke_13(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 76) &= ~2u;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = [*(id *)(a1 + 40) count];
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(v5 + 76);
  if (v4)
  {
    *(unsigned char *)(v5 + 76) = v6 & 0xFB;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    *(unsigned char *)(v5 + 76) = v6 | 4;
    *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 56) = CFAbsoluteTimeGetCurrent();
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  uint64_t v7 = GEOGetRoutePreloaderLog();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  os_signpost_id_t v10 = *(void *)(v9 + 128);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v11 = *(unsigned int *)(v9 + 64);
    int v12 = 134349056;
    uint64_t v13 = v11;
    _os_signpost_emit_with_name_impl(&dword_188D96000, v8, OS_SIGNPOST_INTERVAL_END, v10, "PreloadStep", "BytesDownloaded=%{public}llu", (uint8_t *)&v12, 0xCu);
  }
}

- (void)_loadTiles:(id)a3 requireWiFi:(BOOL)a4 unsuccessfulKeysAccumulator:(id)a5 errorsAccumulator:(id)a6 queue:(id)a7 group:(id)a8 willLoadHandler:(id)a9 progressHandler:(id)a10
{
  BOOL v14 = a4;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v53 = a5;
  id v52 = a6;
  id v56 = a7;
  uint64_t v17 = a8;
  v18 = (unsigned int (**)(id, void))a9;
  uint64_t v19 = v18;
  id v51 = a10;
  v54 = self;
  v55 = GEOTileLoaderClientIdentifier(self);
  BOOL v45 = v14;
  uint64_t v20 = 519;
  if (v14) {
    uint64_t v20 = 527;
  }
  id v49 = (id)v20;
  dispatch_group_t v21 = objc_alloc_init(GEOTileKeyList);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = v16;
  uint64_t v22 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
  id v46 = v18;
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v48 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v74 != v48) {
          objc_enumerationMutation(obj);
        }
        v25 = *(unsigned char **)(*((void *)&v73 + 1) + 8 * i);
        if (!v19 || v19[2](v19, *(void *)(*((void *)&v73 + 1) + 8 * i)))
        {
          dispatch_group_enter(v17);
          v26 = +[GEOTileLoader modernLoader];
          auditToken = v54->_auditToken;
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __139__GEONavRoutePreloadStep__loadTiles_requireWiFi_unsuccessfulKeysAccumulator_errorsAccumulator_queue_group_willLoadHandler_progressHandler___block_invoke;
          v67[3] = &unk_1E53DFCA0;
          id v68 = v52;
          id v69 = v53;
          v70 = v54;
          id v72 = v51;
          id v71 = v17;
          [v26 loadKey:v25 priority:0x3FFFFFFFLL forClient:v55 options:v49 reason:3 auditToken:auditToken callbackQ:v56 beginNetwork:0 callback:v67];

          if ((*v25 & 0x7F) == 2)
          {
            v28 = +[GEOResourceManifestManager modernManager];
            id v29 = [v28 activeTileGroup];
            v30 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1ED73DB70];
            v31 = [v29 regionalResourceKeysForTileKey:v25 scale:0 scenarios:v30];

            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            id v32 = v31;
            uint64_t v33 = [v32 countByEnumeratingWithState:&v63 objects:v78 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v64;
              do
              {
                for (uint64_t j = 0; j != v34; ++j)
                {
                  if (*(void *)v64 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  [(GEOTileKeyList *)v21 addKey:*(void *)(*((void *)&v63 + 1) + 8 * j)];
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v63 objects:v78 count:16];
              }
              while (v34);
            }

            uint64_t v19 = v46;
          }
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
    }
    while (v23);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  if (v45) {
    uint64_t v37 = 523;
  }
  else {
    uint64_t v37 = 515;
  }
  long long v59 = 0uLL;
  long long v60 = 0uLL;
  v50 = v21;
  uint64_t v38 = [(GEOTileKeyList *)v50 countByEnumeratingWithState:&v59 objects:v77 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v60;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v60 != v40) {
          objc_enumerationMutation(v50);
        }
        uint64_t v42 = *(void *)(*((void *)&v59 + 1) + 8 * k);
        dispatch_group_enter(v17);
        v43 = +[GEOTileLoader modernLoader];
        id v44 = v54->_auditToken;
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __139__GEONavRoutePreloadStep__loadTiles_requireWiFi_unsuccessfulKeysAccumulator_errorsAccumulator_queue_group_willLoadHandler_progressHandler___block_invoke_19;
        v57[3] = &unk_1E53DFCC8;
        id v58 = v17;
        [v43 loadKey:v42 priority:0x3FFFFFFFLL forClient:v55 options:v37 reason:3 auditToken:v44 callbackQ:v56 beginNetwork:0 callback:v57];
      }
      uint64_t v39 = [(GEOTileKeyList *)v50 countByEnumeratingWithState:&v59 objects:v77 count:16];
    }
    while (v39);
  }
}

void __139__GEONavRoutePreloadStep__loadTiles_requireWiFi_unsuccessfulKeysAccumulator_errorsAccumulator_queue_group_willLoadHandler_progressHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5, void *a6)
{
  id v12 = a5;
  os_signpost_id_t v10 = [a6 objectForKey:@"GEOTileLoadResultSource"];
  uint64_t v11 = [v10 integerValue];

  if (v12)
  {
    [*(id *)(a1 + 32) addObject:v12];
    [*(id *)(a1 + 40) addKey:a2];
  }
  else if (v11 == 2)
  {
    *(_DWORD *)(*(void *)(a1 + 48) + 64) += a4;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __139__GEONavRoutePreloadStep__loadTiles_requireWiFi_unsuccessfulKeysAccumulator_errorsAccumulator_queue_group_willLoadHandler_progressHandler___block_invoke_19(uint64_t a1)
{
}

- (void)cancel
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 76) & 2) != 0)
  {
    uint64_t v3 = GEOTileLoaderClientIdentifier(self);
    uint64_t v4 = +[GEOTileLoader modernLoader];
    [v4 cancelAllForClient:v3];

    *((unsigned char *)self + 76) &= ~2u;
    uint64_t v5 = GEOGetRoutePreloaderLog();
    char v6 = v5;
    os_signpost_id_t signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      bytesLoadedFromNetworuint64_t k = self->bytesLoadedFromNetwork;
      int v9 = 134349056;
      uint64_t v10 = bytesLoadedFromNetwork;
      _os_signpost_emit_with_name_impl(&dword_188D96000, v6, OS_SIGNPOST_INTERVAL_END, signpostID, "PreloadStep", "Result=Canceled BytesDownloaded=%{public}llu", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetMetadataFetcher, 0);
  objc_storeStrong((id *)&self->_sprMetrosAvailabilityFetcher, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->assetMetadataTiles, 0);

  objc_storeStrong((id *)&self->wantedTiles, 0);
}

@end