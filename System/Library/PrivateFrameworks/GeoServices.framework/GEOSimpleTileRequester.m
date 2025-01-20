@interface GEOSimpleTileRequester
- (BOOL)downloadsDataToDisk;
- (BOOL)needsLocalizationForKey:(void *)a1;
- (BOOL)shouldParticipateInBalancerScheduling;
- (GEOSimpleTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5;
- (GEOSimpleTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5 dataURLSession:(id)a6;
- (GEOTileRequestBalancer)balancer;
- (OS_dispatch_queue)workQueue;
- (OS_os_activity)activity;
- (id)_createOperationsForTileKey:(unsigned int)a3 priority:;
- (id)mergeBaseTile:(id)a3 withLocalizationTile:(id)a4;
- (id)mergeBaseTileEtag:(id)a3 withLocalizationTileEtag:(id)a4;
- (id)removeOperationsForKey:(id *)a1;
- (id)verifyDataIntegrity:(id)a3 checksumMethod:(int)a4;
- (uint64_t)_removeRunningOperation:(id *)a1;
- (uint64_t)_shouldReportAnalyticsForTileKey:(unsigned __int8 *)a3;
- (uint64_t)additionalAnalyticsStatesForKey:;
- (uint64_t)checksumMethodForIncomingTileDataWithKey:;
- (uint64_t)estimatedNumberOfOperationsForTileKey:(uint64_t)a3;
- (uint64_t)localizationURLForTileKey:;
- (uint64_t)newRequestWithKind:(unsigned char *)a1 URL:(uint64_t)a2 useProxyAuth:(void *)a3 entityTag:(int)a4 cachedData:(void *)a5 timeout:(void *)a6 requestCounterTicket:(void *)a7;
- (uint64_t)shouldAllowEmptyDataForTileKey:;
- (uint64_t)shouldDownloadToDiskForTileKey:estimatedDataSize:;
- (uint64_t)shouldReportAnalyticsOnErrorWithRetryForTileKey:;
- (uint64_t)tileDataIsCacheableForTileKey:(unsigned __int8 *)a3;
- (uint64_t)tileEditionForKey:(void *)a1;
- (uint64_t)tileSetForKey:(void *)a1;
- (uint64_t)urlForTileKey:(void *)a1;
- (unint64_t)kindForTileKey:(uint64_t)a3;
- (unsigned)highestRunningOperationPriority;
- (void)_cancelAllRunningOperations;
- (void)_checkIfDone;
- (void)_cleanup;
- (void)_generateEndSignpostEventIfNecessary:(uint64_t)a3;
- (void)_operationFailed:(id)a3 error:(id)a4;
- (void)_operationFinished:(id)a3;
- (void)_updateRunningCountAndCheckIfDone;
- (void)cancel;
- (void)cancelKey:(long long *)a3;
- (void)createAndStartOperationsForTileKeys:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didStartOperationsForAllTileKeys;
- (void)operationFailed:(id)a3 error:(id)a4;
- (void)operationFinished:(id)a3;
- (void)reprioritizeKey:(long long *)a3 newPriority:(int)a4;
- (void)start;
@end

@implementation GEOSimpleTileRequester

- (GEOSimpleTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5
{
  return [(GEOSimpleTileRequester *)self initWithTileRequest:a3 delegateQueue:a4 delegate:a5 dataURLSession:0];
}

- (GEOSimpleTileRequester)initWithTileRequest:(id)a3 delegateQueue:(id)a4 delegate:(id)a5 dataURLSession:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)GEOSimpleTileRequester;
  v12 = [(GEOTileRequester *)&v28 initWithTileRequest:v10 delegateQueue:a4 delegate:a5];
  v13 = v12;
  if (v12)
  {
    v12->_didStart.lock._os_unfair_lock_opaque = 0;
    v12->_didStart.didRun = 0;
    v12->_didCallDelegate.lock._os_unfair_lock_opaque = 0;
    v12->_didCallDelegate.didRun = 0;
    v14 = v11;
    if (!v11)
    {
      v14 = +[GEODataURLSession sharedDataURLSession];
    }
    objc_storeStrong((id *)&v13->_dataSession, v14);
    if (!v11) {

    }
    if (qword_1E91168A0 != -1) {
      dispatch_once(&qword_1E91168A0, &__block_literal_global_215);
    }
    id v15 = (id)qword_1E9116898;
    uint64_t v16 = geo_dispatch_queue_create_with_target();
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [v10 signpostIDs];
    signpostIDs = v13->_signpostIDs;
    v13->_signpostIDs = (GEOTileKeyMap *)v18;

    v20 = [v10 priorities];
    uint64_t v21 = [v20 copy];
    priorities = v13->_priorities;
    v13->_priorities = (GEOTileKeyMap *)v21;

    uint64_t v23 = [v10 createTimes];
    tileLoaderCreateTimes = v13->_tileLoaderCreateTimes;
    v13->_tileLoaderCreateTimes = (GEOTileKeyMap *)v23;

    uint64_t v25 = geo_isolater_create();
    highestRunningOperationPriorityIsolation = v13->_highestRunningOperationPriorityIsolation;
    v13->_highestRunningOperationPriorityIsolation = (geo_isolater *)v25;

    v13->_includeReasonHeader = GEOConfigGetBOOL(GeoServicesConfig_IncludeTileReasonHeader, (uint64_t)off_1E9113E48);
    v13->_allowTLSSessionTicketUse = GEOConfigGetBOOL(GeoServicesConfig_TLSSessionTicketsEnabled, (uint64_t)off_1E9113C58);
  }

  return v13;
}

- (unsigned)highestRunningOperationPriority
{
  v2 = self;
  v4 = self->_highestRunningOperationPriorityIsolation;
  _geo_isolate_lock_data();
  LODWORD(v2) = v2->_highestRunningOperationPriority;
  _geo_isolate_unlock();

  return v2;
}

- (void)start
{
  os_activity_t v3 = _os_activity_create(&dword_188D96000, "Request tiles", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  qos_class_t v4 = qos_class_self();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__GEOSimpleTileRequester_start__block_invoke;
  v5[3] = &unk_1E53D7E80;
  v5[4] = self;
  v5[5] = v3;
  qos_class_t v6 = v4;
  GEOOnce((uint64_t)&self->_didStart, v5);
}

void __31__GEOSimpleTileRequester_start__block_invoke(uint64_t a1)
{
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)GEOSimpleTileRequester;
  objc_msgSendSuper2(&v9, sel_start);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__GEOSimpleTileRequester_start__block_invoke_2;
  v6[3] = &unk_1E53D7E80;
  long long v7 = *(_OWORD *)(a1 + 32);
  int v8 = *(_DWORD *)(a1 + 48);
  id v2 = (id)v7;
  os_activity_t v3 = v6;
  qos_class_t v4 = [v2 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_work_block_invoke;
  block[3] = &unk_1E53D7ED0;
  id v11 = v2;
  id v12 = v3;
  id v5 = v2;
  dispatch_async(v4, block);
}

uint64_t __31__GEOSimpleTileRequester_start__block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) keyList];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v35;
    unint64_t v6 = 0x1E9106000uLL;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        objc_super v9 = [*(id *)(*(void *)(a1 + 32) + *(int *)(v6 + 2052)) objectForKey:v8];
        id v10 = v9;
        if (v9)
        {
          os_signpost_id_t v11 = [v9 unsignedLongLongValue];
          id v12 = [*(id *)(a1 + 32) activeTileSetForKey:v8];
          v13 = GEOGetTileLoadingLog();
          v14 = v13;
          if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
          {
            uint64_t v15 = [v12 style];
            uint64_t v16 = @"RASTER_STANDARD";
            switch((int)v15)
            {
              case 0:
                break;
              case 1:
                uint64_t v16 = @"VECTOR_STANDARD";
                break;
              case 2:
                uint64_t v16 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
                break;
              case 3:
                uint64_t v16 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
                break;
              case 4:
                uint64_t v16 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
                break;
              case 5:
                uint64_t v16 = @"RASTER_STANDARD_BACKGROUND";
                break;
              case 6:
                uint64_t v16 = @"RASTER_HYBRID";
                break;
              case 7:
                uint64_t v16 = @"RASTER_SATELLITE";
                break;
              case 8:
                uint64_t v16 = @"RASTER_TERRAIN";
                break;
              case 11:
                uint64_t v16 = @"VECTOR_BUILDINGS";
                break;
              case 12:
                uint64_t v16 = @"VECTOR_TRAFFIC";
                break;
              case 13:
                uint64_t v16 = @"VECTOR_POI";
                break;
              case 14:
                uint64_t v16 = @"SPUTNIK_METADATA";
                break;
              case 15:
                uint64_t v16 = @"SPUTNIK_C3M";
                break;
              case 16:
                uint64_t v16 = @"SPUTNIK_DSM";
                break;
              case 17:
                uint64_t v16 = @"SPUTNIK_DSM_GLOBAL";
                break;
              case 18:
                uint64_t v16 = @"VECTOR_REALISTIC";
                break;
              case 19:
                uint64_t v16 = @"VECTOR_LEGACY_REALISTIC";
                break;
              case 20:
                uint64_t v16 = @"VECTOR_ROADS";
                break;
              case 21:
                uint64_t v16 = @"RASTER_VEGETATION";
                break;
              case 22:
                uint64_t v16 = @"VECTOR_TRAFFIC_SKELETON";
                break;
              case 23:
                uint64_t v16 = @"RASTER_COASTLINE_MASK";
                break;
              case 24:
                uint64_t v16 = @"RASTER_HILLSHADE";
                break;
              case 25:
                uint64_t v16 = @"VECTOR_TRAFFIC_WITH_GREEN";
                break;
              case 26:
                uint64_t v16 = @"VECTOR_TRAFFIC_STATIC";
                break;
              case 27:
                uint64_t v16 = @"RASTER_COASTLINE_DROP_MASK";
                break;
              case 28:
                uint64_t v16 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
                break;
              case 29:
                uint64_t v16 = @"VECTOR_SPEED_PROFILES";
                break;
              case 30:
                uint64_t v16 = @"VECTOR_VENUES";
                break;
              case 31:
                uint64_t v16 = @"RASTER_DOWN_SAMPLED";
                break;
              case 32:
                uint64_t v16 = @"RASTER_COLOR_BALANCED";
                break;
              case 33:
                uint64_t v16 = @"RASTER_SATELLITE_NIGHT";
                break;
              case 34:
                uint64_t v16 = @"SPUTNIK_VECTOR_BORDER";
                break;
              case 35:
                uint64_t v16 = @"RASTER_SATELLITE_DIGITIZE";
                break;
              case 36:
                uint64_t v16 = @"RASTER_HILLSHADE_PARKS";
                break;
              case 37:
                uint64_t v16 = @"VECTOR_TRANSIT";
                break;
              case 38:
                uint64_t v16 = @"RASTER_STANDARD_BASE";
                break;
              case 39:
                uint64_t v16 = @"RASTER_STANDARD_LABELS";
                break;
              case 40:
                uint64_t v16 = @"RASTER_HYBRID_ROADS";
                break;
              case 41:
                uint64_t v16 = @"RASTER_HYBRID_LABELS";
                break;
              case 42:
                uint64_t v16 = @"FLYOVER_C3M_MESH";
                break;
              case 43:
                uint64_t v16 = @"FLYOVER_C3M_JPEG_TEXTURE";
                break;
              case 44:
                uint64_t v16 = @"FLYOVER_C3M_ASTC_TEXTURE";
                break;
              case 45:
                uint64_t v16 = @"RASTER_SATELLITE_ASTC";
                break;
              case 46:
                uint64_t v16 = @"RASTER_HYBRID_ROADS_AND_LABELS";
                break;
              case 47:
                uint64_t v16 = @"VECTOR_TRANSIT_SELECTION";
                break;
              case 48:
                uint64_t v16 = @"VECTOR_COVERAGE";
                break;
              case 52:
                uint64_t v16 = @"FLYOVER_METADATA";
                break;
              case 53:
                uint64_t v16 = @"VECTOR_ROAD_NETWORK";
                break;
              case 54:
                uint64_t v16 = @"VECTOR_LAND_COVER";
                break;
              case 55:
                uint64_t v16 = @"VECTOR_DEBUG";
                break;
              case 56:
                uint64_t v16 = @"VECTOR_STREET_POI";
                break;
              case 57:
                uint64_t v16 = @"MUNIN_METADATA";
                break;
              case 58:
                uint64_t v16 = @"VECTOR_SPR_MERCATOR";
                break;
              case 59:
                uint64_t v16 = @"VECTOR_SPR_MODELS";
                break;
              case 60:
                uint64_t v16 = @"VECTOR_SPR_MATERIALS";
                break;
              case 61:
                uint64_t v16 = @"VECTOR_SPR_METADATA";
                break;
              case 62:
                uint64_t v16 = @"VECTOR_TRACKS";
                break;
              case 63:
                uint64_t v16 = @"VECTOR_RESERVED_2";
                break;
              case 64:
                uint64_t v16 = @"VECTOR_STREET_LANDMARKS";
                break;
              case 65:
                uint64_t v16 = @"COARSE_LOCATION_POLYGONS";
                break;
              case 66:
                uint64_t v16 = @"VECTOR_SPR_ROADS";
                break;
              case 67:
                uint64_t v16 = @"VECTOR_SPR_STANDARD";
                break;
              case 68:
                uint64_t v16 = @"VECTOR_POI_V2";
                break;
              case 69:
                uint64_t v16 = @"VECTOR_POLYGON_SELECTION";
                break;
              case 70:
                uint64_t v16 = @"VL_METADATA";
                break;
              case 71:
                uint64_t v16 = @"VL_DATA";
                break;
              case 72:
                uint64_t v16 = @"PROACTIVE_APP_CLIP";
                break;
              case 73:
                uint64_t v16 = @"VECTOR_BUILDINGS_V2";
                break;
              case 74:
                uint64_t v16 = @"POI_BUSYNESS";
                break;
              case 75:
                uint64_t v16 = @"POI_DP_BUSYNESS";
                break;
              case 76:
                uint64_t v16 = @"SMART_INTERFACE_SELECTION";
                break;
              case 77:
                uint64_t v16 = @"VECTOR_ASSETS";
                break;
              case 78:
                uint64_t v16 = @"SPR_ASSET_METADATA";
                break;
              case 79:
                uint64_t v16 = @"VECTOR_SPR_POLAR";
                break;
              case 80:
                uint64_t v16 = @"SMART_DATA_MODE";
                break;
              case 81:
                uint64_t v16 = @"CELLULAR_PERFORMANCE_SCORE";
                break;
              case 82:
                uint64_t v16 = @"VECTOR_SPR_MODELS_OCCLUSION";
                break;
              case 83:
                uint64_t v16 = @"VECTOR_TOPOGRAPHIC";
                break;
              case 84:
                uint64_t v16 = @"VECTOR_POI_V2_UPDATE";
                break;
              case 85:
                uint64_t v16 = @"VECTOR_LIVE_DATA_UPDATES";
                break;
              case 86:
                uint64_t v16 = @"VECTOR_TRAFFIC_V2";
                break;
              case 87:
                uint64_t v16 = @"VECTOR_ROAD_SELECTION";
                break;
              case 88:
                uint64_t v16 = @"VECTOR_REGION_METADATA";
                break;
              case 89:
                uint64_t v16 = @"RAY_TRACING";
                break;
              case 90:
                uint64_t v16 = @"VECTOR_CONTOURS";
                break;
              case 91:
                uint64_t v16 = @"RASTER_SATELLITE_POLAR";
                break;
              case 92:
                uint64_t v16 = @"VMAP4_ELEVATION";
                break;
              case 93:
                uint64_t v16 = @"VMAP4_ELEVATION_POLAR";
                break;
              case 94:
                uint64_t v16 = @"CELLULAR_COVERAGE_PLMN";
                break;
              case 95:
                uint64_t v16 = @"RASTER_SATELLITE_POLAR_NIGHT";
                break;
              case 96:
                uint64_t v16 = @"UNUSED_96";
                break;
              case 97:
                uint64_t v16 = @"UNUSED_97";
                break;
              case 98:
                uint64_t v16 = @"UNUSED_98";
                break;
              case 99:
                uint64_t v16 = @"UNUSED_99";
                break;
              case 100:
                uint64_t v16 = @"UNUSED_100";
                break;
              case 101:
                uint64_t v16 = @"UNUSED_101";
                break;
              case 102:
                uint64_t v16 = @"UNUSED_102";
                break;
              case 103:
                uint64_t v16 = @"UNUSED_103";
                break;
              case 104:
                uint64_t v16 = @"UNUSED_104";
                break;
              case 105:
                uint64_t v16 = @"UNUSED_105";
                break;
              case 106:
                uint64_t v16 = @"UNUSED_106";
                break;
              case 107:
                uint64_t v16 = @"UNUSED_107";
                break;
              case 108:
                uint64_t v16 = @"UNUSED_108";
                break;
              case 109:
                uint64_t v16 = @"UNUSED_109";
                break;
              case 110:
                uint64_t v16 = @"UNUSED_110";
                break;
              case 111:
                uint64_t v16 = @"UNUSED_111";
                break;
              case 112:
                uint64_t v16 = @"UNUSED_112";
                break;
              case 113:
                uint64_t v16 = @"UNUSED_113";
                break;
              case 114:
                uint64_t v16 = @"UNUSED_114";
                break;
              case 115:
                uint64_t v16 = @"UNUSED_115";
                break;
              case 116:
                uint64_t v16 = @"UNUSED_116";
                break;
              case 117:
                uint64_t v16 = @"UNUSED_117";
                break;
              case 118:
                uint64_t v16 = @"UNUSED_118";
                break;
              case 119:
                uint64_t v16 = @"UNUSED_119";
                break;
              default:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
                uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
            *(_DWORD *)buf = 138543362;
            v39 = v16;
            _os_signpost_emit_with_name_impl(&dword_188D96000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SubmittedToRequester", "Type=%{public}@", buf, 0xCu);

            unint64_t v6 = 0x1E9106000;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v4);
  }

  id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v18 = [*(id *)(a1 + 32) tileRequest];
  v19 = [v18 keyList];
  uint64_t v20 = objc_msgSend(v17, "initWithCapacity:", 2 * objc_msgSend(v19, "count"));
  uint64_t v21 = *(void *)(a1 + 32);
  v22 = *(void **)(v21 + 72);
  *(void *)(v21 + 72) = v20;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  uint64_t v23 = voucher_copy();
  uint64_t v24 = *(void *)(a1 + 32);
  uint64_t v25 = *(void **)(v24 + 184);
  *(void *)(v24 + 184) = v23;

  *(_DWORD *)(*(void *)(a1 + 32) + 104) = *(_DWORD *)(a1 + 48);
  *(unsigned char *)(*(void *)(a1 + 32) + 125) = 1;
  uint64_t v26 = +[GEOTileRequestBalancer balancerForRequester:*(void *)(a1 + 32)];
  uint64_t v27 = *(void *)(a1 + 32);
  objc_super v28 = *(void **)(v27 + 64);
  *(void *)(v27 + 64) = v26;

  uint64_t v29 = *(void *)(a1 + 32);
  v30 = *(void **)(v29 + 64);
  if (!v30)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _balancer != nil", buf, 2u);
    }
    __break(1u);
  }
  v31 = [*(id *)(a1 + 32) tileRequest];
  v32 = [v31 keyList];
  [v30 addRequester:v29 tileKeys:v32 priorities:*(void *)(*(void *)(a1 + 32) + 168)];

  return [*(id *)(a1 + 32) _updateRunningCountAndCheckIfDone];
}

uint64_t __55__GEOSimpleTileRequester__updateHighestRunningPriority__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 144) = *(_DWORD *)(result + 40);
  return result;
}

- (void)_updateRunningCountAndCheckIfDone
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v9);
  if (!self->_cancelled)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v3 = self->_running;
    unsigned int v4 = 0;
    uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (v4 <= [v8 priority]) {
            unsigned int v4 = [v8 priority];
          }
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }

    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __55__GEOSimpleTileRequester__updateHighestRunningPriority__block_invoke;
    v13 = &unk_1E53D7EA8;
    v14 = self;
    unsigned int v15 = v4;
    geo_isolate_sync_data();
    -[GEOSimpleTileRequester _checkIfDone]((uint64_t)self);
  }
  os_activity_scope_leave(&v9);
}

- (void)_checkIfDone
{
  v21[2] = *(id *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = *(void **)(a1 + 72);
    if ([v2 count]) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = *(unsigned char *)(a1 + 125) == 0;
    }
    unsigned int v4 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [*(id *)(a1 + 72) count];
      int v6 = *(unsigned __int8 *)(a1 + 125);
      long long v7 = [(id)a1 tileRequest];
      uint64_t v8 = [v7 keyList];
      *(_DWORD *)buf = 134219264;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v2 != 0;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v3;
      LOWORD(v20) = 2048;
      *(void *)((char *)&v20 + 2) = v5;
      WORD5(v20) = 1024;
      HIDWORD(v20) = v6;
      LOWORD(v21[0]) = 2048;
      *(id *)((char *)v21 + 2) = (id)[v8 count];
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "%p didStart: %{BOOL}d, didFinish: %{BOOL}d, running: %zu, remaining keys: %{BOOL}d, key count = %zu", buf, 0x32u);
    }
    char v9 = !v3;
    if (!v2) {
      char v9 = 1;
    }
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = GEOGetTileLoadingLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [(id)a1 tileRequest];
        id v12 = [v11 keyList];
        uint64_t v13 = [v12 count];
        uint64_t v14 = [*(id *)(a1 + 80) count];
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&long long v20 = v14;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_INFO, "%p Tile requester is done (key count = %zu, error count = %zu)", buf, 0x20u);
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __38__GEOSimpleTileRequester__checkIfDone__block_invoke;
      v18[3] = &unk_1E53D79D8;
      v18[4] = a1;
      unsigned int v15 = v18;
      long long v16 = GEOGetTileLoadingLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "%p Notifying delegate done.", buf, 0xCu);
      }

      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __46__GEOSimpleTileRequester__notifyDelegateDone___block_invoke;
      *(void *)&long long v20 = &unk_1E53D7ED0;
      *((void *)&v20 + 1) = a1;
      long long v17 = v15;
      v21[0] = v17;
      GEOOnce(a1 + 116, buf);

      [(id)a1 _cleanup];
    }
  }
}

void __38__GEOSimpleTileRequester__checkIfDone__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 tileRequesterFinished:*(void *)(a1 + 32)];
}

void __46__GEOSimpleTileRequester__notifyDelegateDone___block_invoke(uint64_t a1)
{
  v1 = *(_DWORD **)(a1 + 32);
  dispatch_qos_class_t v2 = v1[26];
  id v3 = *(id *)(a1 + 40);
  int v6 = v1;
  unsigned int v4 = [v6 delegateQueue];
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v2, 0, v3);

  dispatch_async(v4, v5);
}

- (id)_createOperationsForTileKey:(unsigned int)a3 priority:
{
  *(void *)((char *)&v71[2] + 2) = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v57 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    dispatch_block_t v5 = [(id)a1 tileRequest];
    int v6 = [v5 cachedData];
    v63 = [v6 objectForKey:a2];

    long long v7 = [(id)a1 tileRequest];
    uint64_t v8 = [v7 cachedEtags];
    v58 = [v8 objectForKey:a2];

    char v9 = [v63 data];

    id v10 = 0;
    if (v9)
    {
      id v59 = 0;
      id v60 = 0;
      id v61 = 0;
      if (v58)
      {
        uint64_t v11 = [v63 data];
        id v67 = 0;
        id v68 = 0;
        GEOTileUnpackageBaseAndLocalization(v11, &v68, &v67);
        id v60 = v68;
        id v59 = v67;

        id v65 = 0;
        id v66 = 0;
        GEOSimpleTileRequesterUnpackETag(v58, &v66, &v65);
        id v61 = v66;
        id v10 = v65;
      }
    }
    else
    {
      id v59 = 0;
      id v60 = 0;
      id v61 = 0;
    }
    uint64_t v12 = [(id)a1 kindForTileKey:a2];
    uint64_t v13 = +[GEORequestCounter sharedCounter];
    uint64_t v14 = [(id)a1 tileRequest];
    unsigned int v15 = [v14 auditToken];
    long long v16 = [v13 requestCounterTicketForType:v12 auditToken:v15 traits:0];

    long long v17 = [(id)a1 resourceManifestManager];
    long long v18 = [v17 activeTileGroup];
    if (GEOAuthProxyEnabledForActiveTileGroup(v18))
    {
      long long v19 = [(id)a1 activeTileSetForKey:a2];
      int v20 = [v19 useAuthProxy];
    }
    else
    {
      int v20 = 0;
    }

    uint64_t v21 = [(id)a1 urlForTileKey:a2];
    v22 = [v16 createSubtask:1];
    uint64_t v23 = (void *)-[GEOSimpleTileRequester newRequestWithKind:URL:useProxyAuth:entityTag:cachedData:timeout:requestCounterTicket:]((unsigned char *)a1, v12, v21, v20, v61, v60, v22);

    uint64_t v24 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = [v21 URL];
      *(_DWORD *)buf = 134218755;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 1040;
      *(_DWORD *)&unsigned char buf[24] = 16;
      __int16 v70 = 2097;
      v71[0] = a2;
      _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_DEBUG, "Created data request %p with URL %p (%{private,geo:TileKey}.*P)", buf, 0x26u);
    }
    uint64_t v26 = [(id)a1 localizationURLForTileKey:a2];
    uint64_t v27 = [v16 createSubtask:1];
    objc_super v28 = (void *)-[GEOSimpleTileRequester newRequestWithKind:URL:useProxyAuth:entityTag:cachedData:timeout:requestCounterTicket:]((unsigned char *)a1, v12, v26, v20, v10, v59, v27);

    if (v28)
    {
      uint64_t v29 = GEOGetTileLoadingLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v30 = [v26 URL];
        *(_DWORD *)buf = 134218755;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v30;
        *(_WORD *)&buf[22] = 1040;
        *(_DWORD *)&unsigned char buf[24] = 16;
        __int16 v70 = 2097;
        v71[0] = a2;
        _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_DEBUG, "Created data request %p with URL %p (%{private,geo:TileKey}.*P) (localization)", buf, 0x26u);
      }
    }

    id v31 = v23;
    id v32 = v28;

    id v33 = v31;
    id v34 = v32;
    long long v35 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219011;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 1040;
      *(_DWORD *)&buf[14] = 16;
      *(_WORD *)&buf[18] = 2097;
      *(void *)&buf[20] = a2;
      __int16 v70 = 1024;
      LODWORD(v71[0]) = a3;
      WORD2(v71[0]) = 1024;
      *(_DWORD *)((char *)v71 + 6) = v34 != 0;
      _os_log_impl(&dword_188D96000, v35, OS_LOG_TYPE_INFO, "%p Request for tile key %{private,geo:TileKey}.*P @ %'u - localization: %{BOOL}d", buf, 0x28u);
    }

    if (v33)
    {
      long long v36 = [*(id *)(a1 + 128) objectForKey:a2];
      long long v37 = v36;
      if (v36) {
        uint64_t v62 = [v36 unsignedLongLongValue];
      }
      else {
        uint64_t v62 = -1;
      }
      v64 = [*(id *)(a1 + 136) objectForKey:a2];
      [v64 doubleValue];
      double v39 = v38;
      v40 = _os_activity_create(&dword_188D96000, "Request tile", *(os_activity_t *)(a1 + 88), OS_ACTIVITY_FLAG_DEFAULT);
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      os_activity_scope_enter(v40, (os_activity_scope_state_t)buf);
      uint64_t v41 = 0;
      if (!v28) {
        uint64_t v41 = [(id)a1 downloadsDataToDisk];
      }
      v42 = [_GEOSimpleTileRequesterOperation alloc];
      v43 = [(id)a1 workQueue];
      v44 = [(_GEOSimpleTileRequesterOperation *)v42 initWithRequest:v33 delegateQueue:v43 delegate:a1];

      -[_GEOSimpleTileRequesterOperation setKey:](v44, "setKey:", *a2, a2[1]);
      [(_GEOSimpleTileRequesterOperation *)v44 setPriority:a3];
      [v33 timeoutInterval];
      [(_GEOSimpleTileRequesterOperation *)v44 setTimeout:"setTimeout:"];
      [(_GEOSimpleTileRequesterOperation *)v44 setSignpostID:v62];
      os_activity_t v45 = _os_activity_create(&dword_188D96000, "Request base tile", v40, OS_ACTIVITY_FLAG_DEFAULT);
      [(_GEOSimpleTileRequesterOperation *)v44 setActivity:v45];

      [(_GEOSimpleTileRequesterOperation *)v44 setParentTileActivity:v40];
      [(_GEOSimpleTileRequesterOperation *)v44 setDataSession:*(void *)(a1 + 96)];
      [(_GEOSimpleTileRequesterOperation *)v44 setShouldDownloadToDisk:v41];
      v46 = [*(id *)(a1 + 8) auditToken];
      v47 = [v46 bundleId];
      [(_GEOSimpleTileRequesterOperation *)v44 setRequestingBundleId:v47];

      [(_GEOSimpleTileRequesterOperation *)v44 setTileLoaderCreateTime:v39];
      [v57 addObject:v44];
      if (v28)
      {
        v48 = [_GEOSimpleTileRequesterOperation alloc];
        v49 = [(id)a1 workQueue];
        v50 = [(_GEOSimpleTileRequesterOperation *)v48 initWithRequest:v34 delegateQueue:v49 delegate:a1];

        [(_GEOSimpleTileRequesterOperation *)v44 setLocalizationTile:v50];
        [(_GEOSimpleTileRequesterOperation *)v50 setBaseTile:v44];
        -[_GEOSimpleTileRequesterOperation setKey:](v50, "setKey:", *a2, a2[1]);
        [(_GEOSimpleTileRequesterOperation *)v50 setPriority:[(_GEOSimpleTileRequesterOperation *)v44 priority]];
        [(_GEOSimpleTileRequesterOperation *)v44 timeout];
        [(_GEOSimpleTileRequesterOperation *)v50 setTimeout:"setTimeout:"];
        [(_GEOSimpleTileRequesterOperation *)v50 setSignpostID:v62];
        os_activity_t v51 = _os_activity_create(&dword_188D96000, "Request localization tile", v40, OS_ACTIVITY_FLAG_DEFAULT);
        [(_GEOSimpleTileRequesterOperation *)v50 setActivity:v51];

        [(_GEOSimpleTileRequesterOperation *)v50 setParentTileActivity:v40];
        v52 = [(_GEOSimpleTileRequesterOperation *)v44 dataSession];
        [(_GEOSimpleTileRequesterOperation *)v50 setDataSession:v52];

        v53 = [*(id *)(a1 + 8) auditToken];
        v54 = [v53 bundleId];
        [(_GEOSimpleTileRequesterOperation *)v50 setRequestingBundleId:v54];

        [(_GEOSimpleTileRequesterOperation *)v50 setTileLoaderCreateTime:v39];
        [v57 addObject:v50];
      }
      os_activity_scope_leave((os_activity_scope_state_t)buf);
    }
    else
    {
      long long v37 = GEOGetTileLoadingLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157955;
        *(_DWORD *)&uint8_t buf[4] = 16;
        *(_WORD *)&buf[8] = 2097;
        *(void *)&buf[10] = a2;
        _os_log_impl(&dword_188D96000, v37, OS_LOG_TYPE_ERROR, "Unable to create GEODataRequest for tile %{private,geo:TileKey}.*P.", buf, 0x12u);
      }
    }
  }
  else
  {
    id v57 = 0;
  }

  return v57;
}

- (uint64_t)newRequestWithKind:(unsigned char *)a1 URL:(uint64_t)a2 useProxyAuth:(void *)a3 entityTag:(int)a4 cachedData:(void *)a5 timeout:(void *)a6 requestCounterTicket:(void *)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    id v60 = 0;
    uint64_t v59 = 0;
    goto LABEL_26;
  }
  id v67 = v16;
  id v68 = v15;
  long long v17 = httpPragmaHeader();

  if (v17)
  {
    long long v18 = (void *)MEMORY[0x1E4F1CA60];
    long long v19 = [v13 headerFields];
    int v20 = [v18 dictionaryWithDictionary:v19];

    uint64_t v21 = httpPragmaHeader();
    [v20 setObject:v21 forKeyedSubscript:@"Pragma"];

    v22 = [GEOURLWithHeaders alloc];
    uint64_t v23 = [v13 URL];
    uint64_t v24 = [(GEOURLWithHeaders *)v22 initWithURL:v23 headerFields:v20];

    id v13 = (id)v24;
  }
  if (a1[176])
  {
    uint64_t v25 = [a1 tileRequest];
    unsigned __int8 v26 = [v25 loadReason] + 1;
    if (v26 <= 6u && ((0x59u >> v26) & 1) != 0)
    {
      uint64_t v27 = off_1E53D8008[(char)v26];

      objc_super v28 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v29 = [v13 headerFields];
      uint64_t v25 = [v28 dictionaryWithDictionary:v29];

      [v25 setObject:v27 forKeyedSubscript:@"Maps-Tile-Reason"];
      v30 = [GEOURLWithHeaders alloc];
      id v31 = [v13 URL];
      uint64_t v32 = [(GEOURLWithHeaders *)v30 initWithURL:v31 headerFields:v25];

      id v13 = (id)v32;
    }
  }
  id v33 = +[GEOPlatform sharedPlatform];
  if (![v33 isInternalInstall]) {
    goto LABEL_13;
  }
  int BOOL = GEOConfigGetBOOL(GeoServicesConfig_TileRequestsIncludeEnvironmentHeader, (uint64_t)off_1E9114C18);

  if (BOOL)
  {
    long long v35 = [a1 resourceManifestManager];
    long long v36 = [v35 activeTileGroup];
    id v33 = [v36 environment];

    if ([v33 length])
    {
      long long v37 = (void *)MEMORY[0x1E4F1CA60];
      double v38 = [v13 headerFields];
      double v39 = [v37 dictionaryWithDictionary:v38];

      [v39 setObject:v33 forKeyedSubscript:@"Maps-Environment"];
      v40 = [GEOURLWithHeaders alloc];
      uint64_t v41 = [v13 URL];
      uint64_t v42 = [(GEOURLWithHeaders *)v40 initWithURL:v41 headerFields:v39];

      id v13 = (id)v42;
    }
LABEL_13:
  }
  if (GEOConfigGetBOOL(GeoServicesConfig_TileRequestsIncludeOSVersionHeader, (uint64_t)off_1E9114C28))
  {
    if (_MergedGlobals_31 != -1) {
      dispatch_once(&_MergedGlobals_31, &__block_literal_global_2);
    }
    v43 = (void *)MEMORY[0x1E4F1CA60];
    v44 = [v13 headerFields];
    os_activity_t v45 = [v43 dictionaryWithDictionary:v44];

    [v45 setObject:qword_1E9116890 forKeyedSubscript:@"Apple-OS-Version"];
    v46 = [GEOURLWithHeaders alloc];
    v47 = [v13 URL];
    uint64_t v48 = [(GEOURLWithHeaders *)v46 initWithURL:v47 headerFields:v45];

    id v13 = (id)v48;
  }
  v49 = [a1 tileRequest];
  uint64_t v50 = [v49 constraints];

  if (a1[177]) {
    uint64_t v51 = v50 | 2;
  }
  else {
    uint64_t v51 = v50;
  }
  if (a4) {
    uint64_t v52 = v51 | 8;
  }
  else {
    uint64_t v52 = v51;
  }
  v53 = [GEODataRequest alloc];
  id v65 = [v13 URL];
  id v66 = [a1 tileRequest];
  v54 = [v66 auditToken];
  v55 = [v13 headerFields];
  v64 = [a1 tileRequest];
  v63 = [v64 auditToken];
  v56 = [v63 bundleId];
  id v57 = [a1 tileRequest];
  v58 = [v57 backgroundSessionIdentifier];
  uint64_t v62 = v52;
  id v15 = v68;
  uint64_t v59 = [(GEODataRequest *)v53 initWithKind:a2 URL:v65 auditToken:v54 timeoutInterval:v55 additionalHTTPHeaders:0 bodyData:v56 userAgent:0.0 entityTag:v14 cachedData:v68 requestCounterTicket:v67 multipathServiceType:0 multipathAlternatePort:0 backgroundSessionIdentifier:v58 throttleToken:0 options:v62];

  id v16 = v67;
  id v60 = v13;
LABEL_26:

  return v59;
}

void __112__GEOSimpleTileRequester_newRequestWithKind_URL_useProxyAuth_entityTag_cachedData_timeout_requestCounterTicket___block_invoke()
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v0 = +[GEOPlatform sharedPlatform];
  v1 = [v0 osVersion];
  v7[1] = v1;
  dispatch_qos_class_t v2 = +[GEOPlatform sharedPlatform];
  id v3 = [v2 buildVersion];
  v7[2] = v3;
  unsigned int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  uint64_t v5 = [v4 componentsJoinedByString:@"/"];
  int v6 = (void *)qword_1E9116890;
  qword_1E9116890 = v5;
}

- (void)_cleanup
{
  id v3 = [(GEOSimpleTileRequester *)self balancer];
  [v3 removeRequester:self];

  balancer = self->_balancer;
  self->_balancer = 0;

  -[GEOSimpleTileRequester _cancelAllRunningOperations]((uint64_t)self);
}

- (void)_cancelAllRunningOperations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1 && [*(id *)(a1 + 72) count])
  {
    dispatch_qos_class_t v2 = (void *)[*(id *)(a1 + 72) copy];
    [*(id *)(a1 + 72) removeAllObjects];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          objc_msgSend(v8, "cancel", (void)v9);
          [v8 setBaseTile:0];
          [v8 setLocalizationTile:0];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = GEOGetTileLoadingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "%p Tile requester is being cancelled.", (uint8_t *)&buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__GEOSimpleTileRequester_cancel__block_invoke;
  v8[3] = &unk_1E53D79D8;
  v8[4] = self;
  uint64_t v4 = self;
  uint64_t v5 = v8;
  uint64_t v6 = [(GEOSimpleTileRequester *)v4 workQueue];
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  long long v10 = __dispatch_work_block_invoke;
  long long v11 = &unk_1E53D7ED0;
  long long v12 = v4;
  id v13 = v5;
  long long v7 = v4;
  dispatch_async(v6, &buf);
}

uint64_t __32__GEOSimpleTileRequester_cancel__block_invoke(uint64_t result)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    *(unsigned char *)(v1 + 124) = 1;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(v1 + 72);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v2);
          }
          long long v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          objc_msgSend(v7, "cancel", (void)v10);
          uint64_t v8 = [v7 key];
          [(GEOSimpleTileRequester *)v1 _generateEndSignpostEventIfNecessary:v9];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }

    return [(id)v1 _cleanup];
  }
  return result;
}

- (void)_generateEndSignpostEventIfNecessary:(uint64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v10[0] = a2;
  v10[1] = a3;
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 128) objectForKey:v10];
    uint64_t v5 = v4;
    if (v4)
    {
      os_signpost_id_t v6 = [v4 unsignedLongLongValue];
      long long v7 = GEOGetTileLoadingLog();
      uint64_t v8 = v7;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_signpost_emit_with_name_impl(&dword_188D96000, v8, OS_SIGNPOST_INTERVAL_END, v6, "SubmittedToRequester", "", v9, 2u);
      }

      [*(id *)(a1 + 128) removeObjectForKey:v10];
    }
  }
}

- (void)cancelKey:(long long *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v11 = *a3;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__GEOSimpleTileRequester_cancelKey___block_invoke;
    void v10[3] = &unk_1E53D7FE8;
    v10[4] = a1;
    id v3 = a1;
    uint64_t v4 = v10;
    uint64_t v5 = [v3 workQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __dispatch_work_block_invoke;
    v7[3] = &unk_1E53D7ED0;
    id v8 = v3;
    id v9 = v4;
    id v6 = v3;
    dispatch_async(v5, v7);
  }
}

void __36__GEOSimpleTileRequester_cancelKey___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  long long v23 = *(_OWORD *)(a1 + 40);
  if (v1)
  {
    id v2 = [v1 balancer];
    [v2 requester:v1 removeTileKey:&v23];

    id v3 = -[GEOSimpleTileRequester removeOperationsForKey:]((id *)v1, (uint64_t)&v23);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v7++) cancel];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v5);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          _recursivelyClearAllRelatedOperations(*(void **)(*((void *)&v13 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }

    [(GEOSimpleTileRequester *)(uint64_t)v1 _generateEndSignpostEventIfNecessary:*((uint64_t *)&v23 + 1)];
    objc_msgSend(v1, "_updateRunningCountAndCheckIfDone", (void)v13);
  }
}

- (id)removeOperationsForKey:(id *)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    id v6 = v2[9];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__GEOSimpleTileRequester_removeOperationsForKey___block_invoke;
    v12[3] = &unk_1E53D7F20;
    uint64_t v15 = a2;
    id v7 = v5;
    id v13 = v7;
    long long v14 = v4;
    id v8 = v4;
    [v6 enumerateObjectsUsingBlock:v12];
    [v2[9] removeObjectsAtIndexes:v8];
    uint64_t v9 = [v2 balancer];
    objc_msgSend(v9, "requester:completedOperations:", v2, objc_msgSend(v8, "count"));

    uint64_t v10 = v14;
    id v2 = (id *)v7;
  }

  return v2;
}

- (void)reprioritizeKey:(long long *)a3 newPriority:(int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v13 = *a3;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__GEOSimpleTileRequester_reprioritizeKey_newPriority___block_invoke;
    v11[3] = &unk_1E53D7EF8;
    v11[4] = a1;
    int v12 = a4;
    id v4 = a1;
    uint64_t v5 = v11;
    id v6 = [v4 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_work_block_invoke;
    block[3] = &unk_1E53D7ED0;
    id v9 = v4;
    id v10 = v5;
    id v7 = v4;
    dispatch_async(v6, block);
  }
}

void __54__GEOSimpleTileRequester_reprioritizeKey_newPriority___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  long long v27 = *(_OWORD *)(a1 + 44);
  if (v1)
  {
    id v3 = *(void **)(v1 + 168);
    id v4 = [NSNumber numberWithUnsignedInt:v2];
    [v3 setObject:v4 forKey:&v27];

    uint64_t v5 = [(id)v1 balancer];
    [v5 requester:v1 updatePriority:v2 tileKey:&v27];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 3, 0);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = *(id *)(v1 + 72);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v28 = [v12 key];
          uint64_t v29 = v13;
          if (v28 == (void)v27 && v13 == *((void *)&v27 + 1)) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [v6 countByEnumeratingWithState:&v19 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * j) setPriority:v2];
        }
        uint64_t v16 = [v6 countByEnumeratingWithState:&v19 objects:v30 count:16];
      }
      while (v16);
    }
  }
}

- (void)dealloc
{
  -[GEOSimpleTileRequester _cancelAllRunningOperations]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)GEOSimpleTileRequester;
  [(GEOSimpleTileRequester *)&v3 dealloc];
}

- (uint64_t)_removeRunningOperation:(id *)a1
{
  id v3 = a2;
  if (a1 && (uint64_t v4 = [a1[9] indexOfObjectIdenticalTo:v3], v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    [a1[9] removeObjectAtIndex:v4];
    id v6 = [a1 balancer];
    uint64_t v5 = 1;
    [v6 requester:a1 completedOperations:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __49__GEOSimpleTileRequester_removeOperationsForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  uint64_t v11 = [v10 key];
  id v6 = *(uint64_t **)(a1 + 48);
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  if (v11 == v8 && v5 == v7)
  {
    [*(id *)(a1 + 32) addObject:v10];
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (GEOTileRequestBalancer)balancer
{
  return self->_balancer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_priorities, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_highestRunningOperationPriorityIsolation, 0);
  objc_storeStrong((id *)&self->_tileLoaderCreateTimes, 0);
  objc_storeStrong((id *)&self->_signpostIDs, 0);
  objc_storeStrong((id *)&self->_dataSession, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_running, 0);

  objc_storeStrong((id *)&self->_balancer, 0);
}

- (void)createAndStartOperationsForTileKeys:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_qos_class_t qos = self->_qos;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__GEOSimpleTileRequester_GEOTileRequestBalancer__createAndStartOperationsForTileKeys_completion___block_invoke;
  v16[3] = &unk_1E53D7F70;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  uint64_t v9 = self;
  id v10 = v16;
  id v11 = v7;
  id v12 = v6;
  uint64_t v13 = [(GEOSimpleTileRequester *)v9 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_work_qos_block_invoke;
  block[3] = &unk_1E53D7ED0;
  long long v20 = v9;
  id v21 = v10;
  uint64_t v14 = v9;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, qos, 0, block);
  dispatch_async(v13, v15);
}

void __97__GEOSimpleTileRequester_GEOTileRequestBalancer__createAndStartOperationsForTileKeys_completion___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 184);
  voucher_adopt();
  if ([*(id *)(a1 + 40) count] == 1)
  {
    id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "firstKey"));
    unsigned int v4 = [v3 unsignedIntValue];

    -[GEOSimpleTileRequester _createOperationsForTileKey:priority:](*(void *)(a1 + 32), (void *)[*(id *)(a1 + 40) firstKey], v4);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v36;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v36 != v7) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * v8++) start];
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v6);
    }
  }
  else
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2810000000;
    uint64_t v41 = "";
    int v42 = 0;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", 2 * objc_msgSend(*(id *)(a1 + 40), "count"));
    size_t v10 = [*(id *)(a1 + 40) count];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__GEOSimpleTileRequester_GEOTileRequestBalancer__createAndStartOperationsForTileKeys_completion___block_invoke_2;
    block[3] = &unk_1E53D7F48;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 32);
    id v31 = v11;
    uint64_t v32 = v12;
    id v34 = buf;
    id v13 = v9;
    id v33 = v13;
    dispatch_apply(v10, 0, block);
    uint64_t v14 = v33;
    id v5 = v13;

    _Block_object_dispose(buf, 8);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(a1 + 32);
        if (v19) {
          objc_msgSend(*(id *)(v19 + 72), "addObject:", *(void *)(*((void *)&v26 + 1) + 8 * v18), (void)v26);
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v39 count:16];
    }
    while (v16);
  }

  long long v20 = GEOGetTileLoadingLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = [v15 count];
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = v21;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v22;
    _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_INFO, "%p Started %zu operations.", buf, 0x16u);
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [v15 count]);
  uint64_t v23 = voucher_adopt();
  uint64_t v24 = *(void *)(a1 + 32);
  long long v25 = *(void **)(v24 + 184);
  *(void *)(v24 + 184) = v23;

  [*(id *)(a1 + 32) _updateRunningCountAndCheckIfDone];
}

void __97__GEOSimpleTileRequester_GEOTileRequestBalancer__createAndStartOperationsForTileKeys_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[*(id *)(a1 + 32) keyAtIndex:a2];
  unsigned int v4 = [*(id *)(*(void *)(a1 + 40) + 168) objectForKey:v3];
  unsigned int v5 = [v4 unsignedIntValue];

  uint64_t v6 = -[GEOSimpleTileRequester _createOperationsForTileKey:priority:](*(void *)(a1 + 40), v3, v5);
  if ([v6 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "start", (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    os_unfair_lock_lock_with_options();
    [*(id *)(a1 + 48) addObjectsFromArray:v7];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  }
}

- (uint64_t)estimatedNumberOfOperationsForTileKey:(uint64_t)a3
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = a3;
  v5[1] = a4;
  if ([a1 needsLocalizationForKey:v5]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)didStartOperationsForAllTileKeys
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__GEOSimpleTileRequester_GEOTileRequestBalancer__didStartOperationsForAllTileKeys__block_invoke;
  v6[3] = &unk_1E53D79D8;
  void v6[4] = self;
  id v2 = self;
  id v3 = v6;
  unsigned int v4 = [(GEOSimpleTileRequester *)v2 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_work_block_invoke;
  block[3] = &unk_1E53D7ED0;
  uint64_t v8 = v2;
  id v9 = v3;
  unsigned int v5 = v2;
  dispatch_async(v4, block);
}

void __82__GEOSimpleTileRequester_GEOTileRequestBalancer__didStartOperationsForAllTileKeys__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    *(unsigned char *)(v1 + 125) = 0;
    -[GEOSimpleTileRequester _checkIfDone](v1);
  }
}

- (BOOL)shouldParticipateInBalancerScheduling
{
  id v3 = [(GEOTileRequest *)self->super._tileRequest backgroundSessionIdentifier];
  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [(GEOTileRequest *)self->super._tileRequest shouldParticipateInBalancer];
  }

  return v4;
}

- (BOOL)downloadsDataToDisk
{
  return 0;
}

- (uint64_t)_shouldReportAnalyticsForTileKey:(unsigned __int8 *)a3
{
  unsigned int v5 = [a1 tileRequest];
  if ([v5 loadReason] == 1)
  {
  }
  else
  {
    uint64_t v6 = [a1 tileRequest];
    int v7 = [v6 loadReason];

    if (v7 != 4)
    {
      char v9 = 0;
      return v9 & 1;
    }
  }
  int16x4_t v8 = (int16x4_t)vand_s8((int8x8_t)vdup_n_s32(*a3), (int8x8_t)0x7E0000007FLL);
  char v9 = vmaxv_u16((uint16x4_t)vceq_s16(vuzp1_s16(v8, v8), (int16x4_t)0xE000C00020004)) | (v8.i32[0] == 9);
  return v9 & 1;
}

- (uint64_t)shouldReportAnalyticsOnErrorWithRetryForTileKey:
{
  return 0;
}

- (uint64_t)additionalAnalyticsStatesForKey:
{
  return 0;
}

- (uint64_t)urlForTileKey:(void *)a1
{
  return 0;
}

- (unint64_t)kindForTileKey:(uint64_t)a3
{
  unsigned int v4 = 0;
  GEOTileKeyStyle(a3, &v4);
  return ((unint64_t)v4 << 32) | 0x100;
}

- (uint64_t)localizationURLForTileKey:
{
  return 0;
}

- (BOOL)needsLocalizationForKey:(void *)a1
{
  uint64_t v1 = objc_msgSend(a1, "localizationURLForTileKey:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)mergeBaseTileEtag:(id)a3 withLocalizationTileEtag:(id)a4
{
  return GEOSimpleTileRequesterPackETags(a3, a4);
}

- (id)mergeBaseTile:(id)a3 withLocalizationTile:(id)a4
{
  return GEOTilePackageBaseAndLocalization(a3, a4);
}

- (uint64_t)tileEditionForKey:(void *)a1
{
  uint64_t v1 = objc_msgSend(a1, "activeTileSetForKey:");
  uint64_t v2 = [v1 version];

  return v2;
}

- (uint64_t)tileSetForKey:(void *)a1
{
  uint64_t v1 = objc_msgSend(a1, "activeTileSetForKey:");
  uint64_t v2 = v1;
  if (v1)
  {
    __int16 v3 = [v1 style];
    char v4 = [v2 scale];
    uint64_t v5 = ((v3 & 0x3FFF | (([v2 size] & 0xF) << 14) & 0xFFC3FFFF | ((v4 & 0xF) << 18)) << 8) | 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: tileSet != ((void *)0)", v7, 2u);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)operationFinished:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "parentTileActivity", 0, 0);
  os_activity_scope_enter(v5, &v6);

  [(GEOSimpleTileRequester *)self _operationFinished:v4];
  [(GEOSimpleTileRequester *)self _updateRunningCountAndCheckIfDone];
  os_activity_scope_leave(&v6);
}

- (void)_operationFinished:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_cancelled)
  {
    if ((-[GEOSimpleTileRequester _removeRunningOperation:]((id *)&self->super.super.isa, v4) & 1) == 0)
    {
      [v5 clearAllRelatedOperations];
      goto LABEL_44;
    }
    uint64_t v6 = [v5 baseTile];
    int v7 = (void *)v6;
    if (v6) {
      int16x4_t v8 = (void *)v6;
    }
    else {
      int16x4_t v8 = v5;
    }
    id v9 = v8;

    uint64_t v10 = [v9 localizationTile];
    if (![v9 finished] || v10 && !objc_msgSend(v10, "finished"))
    {
LABEL_43:

      goto LABEL_44;
    }
    *(void *)&long long v79 = [v9 key];
    *((void *)&v79 + 1) = v11;
    long long v12 = [(GEOTileRequester *)self activeTileSetForKey:&v79];
    BOOL v13 = [v9 responseIsCacheable]
       && (!v10 || [v10 responseIsCacheable])
       && [(GEOSimpleTileRequester *)self tileDataIsCacheableForTileKey:&v79];
    int v14 = [v12 hasTimeToLiveSeconds];
    id v15 = v9;
    id v16 = v10;
    id v17 = v15;
    id v60 = v12;
    id v61 = v10;
    if (qword_1E91168C0 != -1) {
      dispatch_once(&qword_1E91168C0, &__block_literal_global_600);
    }
    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:qword_1E91168B8];
    uint64_t v19 = [v17 URL];
    [v18 setObject:v19 forKeyedSubscript:@"tileURL"];

    long long v20 = [v16 URL];
    [v18 setObject:v20 forKeyedSubscript:@"localizationURL"];

    if ([v17 contentLength] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "contentLength"));
      [v18 setObject:v21 forKeyedSubscript:@"tileLength"];
    }
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "httpResponseStatusCode"));
    [v18 setObject:v22 forKeyedSubscript:@"GEOTileLoadResultHTTPStatusCode"];

    uint64_t v23 = [NSNumber numberWithBool:v13];
    [v18 setObject:v23 forKeyedSubscript:@"TileIsCacheable"];

    if (v13 || v10 || !v17 || v14 == 1)
    {
      if (!v17)
      {
        uint64_t v26 = 1;
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v24 = [v17 responseMaxAge];
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v25 = [NSNumber numberWithUnsignedInteger:v24];
        [v18 setObject:v25 forKeyedSubscript:@"GEOTileLoadResultMaxAge"];
      }
    }
    uint64_t v26 = [v17 isExistingCachedDataCurrent];
LABEL_29:
    if (v10)
    {
      int v27 = [v16 isExistingCachedDataCurrent];
      long long v28 = [NSNumber numberWithBool:v26 & v27];
      [v18 setObject:v28 forKeyedSubscript:@"CachedDataWasCurrent"];

      long long v29 = [v17 data];
      v30 = [v16 data];
      id v31 = [(GEOSimpleTileRequester *)self mergeBaseTile:v29 withLocalizationTile:v30];

      uint64_t v32 = [[GEOTileData alloc] initWithData:v31];
      id v33 = [v17 responseEtag];
      id v34 = [v16 responseEtag];
      uint64_t v59 = [(GEOSimpleTileRequester *)self mergeBaseTileEtag:v33 withLocalizationTileEtag:v34];
    }
    else
    {
      long long v35 = [NSNumber numberWithBool:v26];
      [v18 setObject:v35 forKeyedSubscript:@"CachedDataWasCurrent"];

      long long v36 = [v5 downloadedFileURL];

      long long v37 = [GEOTileData alloc];
      if (v36)
      {
        long long v38 = [v5 downloadedFileURL];
        uint64_t v39 = [(GEOTileData *)v37 initWithFileURL:v38];
      }
      else
      {
        long long v38 = [v5 data];
        uint64_t v39 = [(GEOTileData *)v37 initWithData:v38];
      }
      uint64_t v32 = (GEOTileData *)v39;

      uint64_t v59 = [v5 responseEtag];
    }
    unsigned int v40 = [(GEOSimpleTileRequester *)self tileEditionForKey:&v79];
    uint64_t v41 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      int v42 = [v5 request];
      [v5 request];
      v58 = v18;
      v43 = v32;
      os_activity_t v45 = v44 = v40;
      v46 = [v45 URL];
      *(_DWORD *)long long buf = 134218755;
      *(void *)&uint8_t buf[4] = v42;
      __int16 v73 = 2048;
      v74 = v46;
      __int16 v75 = 1040;
      int v76 = 16;
      __int16 v77 = 2097;
      v78 = &v79;
      _os_log_impl(&dword_188D96000, v41, OS_LOG_TYPE_DEBUG, "Finished data request %p with URL %p (%{private,geo:TileKey}.*P) (online)", buf, 0x26u);

      unsigned int v40 = v44;
      uint64_t v32 = v43;
      uint64_t v18 = v58;
    }
    *(void *)long long buf = 0;
    if (objc_opt_respondsToSelector())
    {
      obuint64_t j = 0;
      v47 = [(GEOSimpleTileRequester *)self processTileData:v32 forKey:&v79 error:&obj];
      objc_storeStrong((id *)buf, obj);

      if (*(void *)buf)
      {
        errors = self->_errors;
        if (errors)
        {
          -[NSMutableArray addObject:](errors, "addObject:");
        }
        else
        {
          v56 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:buf count:1];
          id v57 = self->_errors;
          self->_errors = v56;
        }
      }
    }
    else
    {
      v47 = v32;
    }
    [(GEOSimpleTileRequester *)(uint64_t)self _generateEndSignpostEventIfNecessary:*((uint64_t *)&v79 + 1)];
    dispatch_qos_class_t qos = self->_qos;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__GEOSimpleTileRequester_OperationDelegate___operationFinished___block_invoke;
    block[3] = &unk_1E53D7F98;
    id v64 = *(id *)buf;
    id v65 = self;
    long long v71 = v79;
    unsigned int v70 = v40;
    id v66 = v47;
    id v67 = v60;
    id v68 = v59;
    id v69 = v18;
    id v50 = v18;
    id v51 = v59;
    id v52 = v60;
    id v53 = v47;
    v54 = [(GEOTileRequester *)self delegateQueue];
    dispatch_block_t v55 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, qos, 0, block);
    dispatch_async(v54, v55);

    [(GEOSimpleTileRequester *)self finishedLoadingTileForKey:v79 baseOperation:v17];
    _recursivelyClearAllRelatedOperations(v17);

    uint64_t v10 = v61;
    goto LABEL_43;
  }
  _recursivelyClearAllRelatedOperations(v4);
LABEL_44:
}

void __64__GEOSimpleTileRequester_OperationDelegate___operationFinished___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  __int16 v3 = [*(id *)(a1 + 40) delegate];
  id v4 = *(void **)(a1 + 40);
  id v5 = v3;
  if (v2) {
    objc_msgSend(v3, "tileRequester:receivedError:forKey:", v4, *(void *)(a1 + 32), *(void *)(a1 + 84), *(void *)(a1 + 92));
  }
  else {
    objc_msgSend(v3, "tileRequester:receivedData:tileEdition:tileSetDB:tileSet:etag:forKey:userInfo:", v4, *(void *)(a1 + 48), *(unsigned int *)(a1 + 80), objc_msgSend(v4, "tileSetForKey:", a1 + 84), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 84), *(void *)(a1 + 92), *(void *)(a1 + 72));
  }
}

- (void)operationFailed:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int16x4_t v8 = objc_msgSend(v6, "parentTileActivity", 0, 0);
  os_activity_scope_enter(v8, &v9);

  [(GEOSimpleTileRequester *)self _operationFailed:v6 error:v7];
  [(GEOSimpleTileRequester *)self _updateRunningCountAndCheckIfDone];
  os_activity_scope_leave(&v9);
}

- (void)_operationFailed:(id)a3 error:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v33 = v7;
  if (self->_cancelled)
  {
    _recursivelyClearAllRelatedOperations(v6);
  }
  else if (-[GEOSimpleTileRequester _removeRunningOperation:]((id *)&self->super.super.isa, v6))
  {
    uint64_t v8 = [v6 key];
    uint64_t v10 = v9;
    *(void *)&long long v42 = v8;
    *((void *)&v42 + 1) = v9;
    uint64_t v11 = [v6 activity];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__GEOSimpleTileRequester_OperationDelegate___operationFailed_error___block_invoke;
    block[3] = &unk_1E53D7FC0;
    id v12 = v6;
    id v39 = v12;
    long long v41 = v42;
    id v13 = v7;
    id v40 = v13;
    os_activity_apply(v11, block);

    if (v13)
    {
      errors = self->_errors;
      if (errors)
      {
        [(NSMutableArray *)errors addObject:v13];
      }
      else
      {
        id v15 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:&v33 count:1];
        id v16 = self->_errors;
        self->_errors = v15;

        id v13 = v33;
      }
    }
    dispatch_qos_class_t qos = self->_qos;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __68__GEOSimpleTileRequester_OperationDelegate___operationFailed_error___block_invoke_146;
    v35[3] = &unk_1E53D7FC0;
    v35[4] = self;
    id v36 = v13;
    long long v37 = v42;
    uint64_t v18 = [(GEOTileRequester *)self delegateQueue];
    dispatch_block_t v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, qos, 0, v35);
    dispatch_async(v18, v19);

    uint64_t v20 = [v12 baseTile];
    uint64_t v21 = (void *)v20;
    if (v20) {
      id v22 = (id)v20;
    }
    else {
      id v22 = v12;
    }
    -[GEOSimpleTileRequester failedLoadingTileForKey:baseOperation:error:](self, "failedLoadingTileForKey:baseOperation:error:", v8, v10, v22, v33);

    uint64_t v23 = -[GEOSimpleTileRequester removeOperationsForKey:]((id *)&self->super.super.isa, (uint64_t)&v42);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v30 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v28 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          [v28 cancel];
          _recursivelyClearAllRelatedOperations(v28);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v25);
    }
    _recursivelyClearAllRelatedOperations(v12);
    [(GEOSimpleTileRequester *)(uint64_t)self _generateEndSignpostEventIfNecessary:*((uint64_t *)&v42 + 1)];
    [(GEOSimpleTileRequester *)self _updateRunningCountAndCheckIfDone];

    id v7 = v33;
  }
  else
  {
    [v6 clearAllRelatedOperations];
  }
}

void __68__GEOSimpleTileRequester_OperationDelegate___operationFailed_error___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = GEOGetTileLoadingLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    __int16 v3 = [*(id *)(a1 + 32) request];
    id v4 = [*(id *)(a1 + 32) request];
    id v5 = [v4 URL];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 134219011;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 1040;
    int v12 = 16;
    __int16 v13 = 2097;
    uint64_t v14 = a1 + 48;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_ERROR, "Operation failed request %p with URL %p (%{private,geo:TileKey}.*P) error: %@", (uint8_t *)&v7, 0x30u);
  }
}

void __68__GEOSimpleTileRequester_OperationDelegate___operationFailed_error___block_invoke_146(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v2, "tileRequester:receivedError:forKey:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (id)verifyDataIntegrity:(id)a3 checksumMethod:(int)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 length])
  {
    uint64_t v8 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v19 = 134217984;
      uint64_t v20 = self;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "%p Got nil for a tile data", (uint8_t *)&v19, 0xCu);
    }

    goto LABEL_10;
  }
  if (a4 == 1)
  {
    if ((unint64_t)[v6 length] >= 0x10)
    {
      uint64_t v10 = [v6 length] - 16;
      id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v12 = v6;
      __int16 v13 = objc_msgSend(v11, "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v12, "bytes"), v10, 0);
      id v14 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v15 = v12;
      uint64_t v16 = objc_msgSend(v14, "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v15, "bytes") + v10, 16, 0);
      uint64_t v17 = objc_msgSend(v13, "_geo_MD5Hash");
      if ([v16 isEqualToData:v17])
      {
        objc_msgSend(v15, "subdataWithRange:", 0, v10);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v9 = 0;
      }

      goto LABEL_17;
    }
    goto LABEL_12;
  }
  if (!a4)
  {
LABEL_10:
    id v9 = v6;
    goto LABEL_17;
  }
  int v7 = GEOGetTileLoadingLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v19 = 134218240;
    uint64_t v20 = self;
    __int16 v21 = 1024;
    int v22 = a4;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "%p Doesn't know about checksum method %d", (uint8_t *)&v19, 0x12u);
  }

LABEL_12:
  id v9 = 0;
LABEL_17:

  return v9;
}

- (uint64_t)checksumMethodForIncomingTileDataWithKey:
{
  return 0;
}

- (uint64_t)shouldAllowEmptyDataForTileKey:
{
  return 0;
}

- (uint64_t)tileDataIsCacheableForTileKey:(unsigned __int8 *)a3
{
  return (*a3 >> 7) ^ 1u;
}

- (uint64_t)shouldDownloadToDiskForTileKey:estimatedDataSize:
{
  return 0;
}

@end