@interface GEORoutePreloaderStatisticsInfo
- (GEORoutePreloaderStatisticsInfo)init;
- (GEORoutePreloaderStatisticsInfo)initWithTransportType:(int)a3;
- (void)finishAndReportIfNecessaryForDistance:(double)a3;
- (void)incrementTileLoadStatistic:(int64_t)a3 amount:(unint64_t)a4;
- (void)loadedTileKey:(uint64_t)a1 source:(uint64_t)a2 sizeInBytes:(uint64_t)a3;
- (void)missedTileKey:(uint64_t)a1 loadedSuccessfully:(uint64_t)a2 sizeInBytes:(uint64_t)a3;
@end

@implementation GEORoutePreloaderStatisticsInfo

- (GEORoutePreloaderStatisticsInfo)init
{
  result = (GEORoutePreloaderStatisticsInfo *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEORoutePreloaderStatisticsInfo)initWithTransportType:(int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEORoutePreloaderStatisticsInfo;
  v4 = [(GEORoutePreloaderStatisticsInfo *)&v10 init];
  if (v4)
  {
    uint64_t v5 = geo_isolater_create();
    isolation = v4->_isolation;
    v4->_isolation = (geo_isolater *)v5;

    v4->_transportType = a3;
    GEOGetMonotonicTime();
    v4->_startMonotonicTimestamp = v7;
    v4->_loggingEnabled = GEOConfigGetBOOL(GeoServicesConfig_RoutePreloaderLogHitsAndMisses, (uint64_t)off_1E9113B78);
    v8 = v4;
  }

  return v4;
}

- (void)incrementTileLoadStatistic:(int64_t)a3 amount:(unint64_t)a4
{
}

void *__69__GEORoutePreloaderStatisticsInfo_incrementTileLoadStatistic_amount___block_invoke(void *result)
{
  uint64_t v1 = result[4] + 8 * result[5];
  *(void *)(v1 + 56) += result[6];
  return result;
}

- (void)loadedTileKey:(uint64_t)a1 source:(uint64_t)a2 sizeInBytes:(uint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = 0;
  if (GEOTileKeyStyle(a3, &v6))
  {
    geo_isolate_sync_data();
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = GEOGetRoutePreloaderLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68157955;
        int v8 = 16;
        __int16 v9 = 2097;
        uint64_t v10 = a3;
        _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Preloaded tile key: %{private,geo:TileKey}.*P", buf, 0x12u);
      }
    }
  }
}

void __68__GEORoutePreloaderStatisticsInfo_loadedTileKey_source_sizeInBytes___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  v3 = *(void **)(*(void *)(a1 + 32) + 112);
  id v18 = (id)v2;
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v4;

    v3 = *(void **)(*(void *)(a1 + 32) + 112);
    uint64_t v2 = (uint64_t)v18;
  }
  double v7 = NSNumber;
  int v8 = [v3 objectForKeyedSubscript:v2];
  __int16 v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "unsignedIntegerValue") + 1);
  [*(id *)(*(void *)(a1 + 32) + 112) setObject:v9 forKeyedSubscript:v18];

  if (*(void *)(a1 + 40) == 2)
  {
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 120);
    id v11 = v18;
    if (!v10)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = *(void **)(v13 + 120);
      *(void *)(v13 + 120) = v12;

      uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 120);
      id v11 = v18;
    }
    v15 = NSNumber;
    v16 = [v10 objectForKeyedSubscript:v11];
    v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", *(void *)(a1 + 48) + objc_msgSend(v16, "unsignedIntegerValue"));
    [*(id *)(*(void *)(a1 + 32) + 120) setObject:v17 forKeyedSubscript:v18];
  }
}

- (void)missedTileKey:(uint64_t)a1 loadedSuccessfully:(uint64_t)a2 sizeInBytes:(uint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  geo_isolate_sync_data();
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v5 = GEOGetRoutePreloaderLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68157955;
      int v7 = 16;
      __int16 v8 = 2097;
      uint64_t v9 = a3;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_DEBUG, "Missed tile key: %{private,geo:TileKey}.*P", buf, 0x12u);
    }
  }
}

void __80__GEORoutePreloaderStatisticsInfo_missedTileKey_loadedSuccessfully_sizeInBytes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 56))
  {
    ++*(void *)(v1 + 32);
    unsigned int v18 = 0;
    if (GEOTileKeyStyle(*(void *)(a1 + 40), &v18))
    {
      v3 = [NSNumber numberWithInt:v18];
      id v4 = *(void **)(*(void *)(a1 + 32) + 128);
      if (!v4)
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v6 = *(void *)(a1 + 32);
        int v7 = *(void **)(v6 + 128);
        *(void *)(v6 + 128) = v5;

        id v4 = *(void **)(*(void *)(a1 + 32) + 128);
      }
      __int16 v8 = NSNumber;
      uint64_t v9 = [v4 objectForKeyedSubscript:v3];
      uint64_t v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + 1);
      [*(id *)(*(void *)(a1 + 32) + 128) setObject:v10 forKeyedSubscript:v3];

      id v11 = *(void **)(*(void *)(a1 + 32) + 136);
      if (!v11)
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v13 = *(void *)(a1 + 32);
        v14 = *(void **)(v13 + 136);
        *(void *)(v13 + 136) = v12;

        id v11 = *(void **)(*(void *)(a1 + 32) + 136);
      }
      v15 = NSNumber;
      v16 = [v11 objectForKeyedSubscript:v3];
      v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", *(void *)(a1 + 48) + objc_msgSend(v16, "unsignedIntegerValue"));
      [*(id *)(*(void *)(a1 + 32) + 136) setObject:v17 forKeyedSubscript:v3];
    }
  }
  else
  {
    ++*(void *)(v1 + 40);
  }
}

- (void)finishAndReportIfNecessaryForDistance:(double)a3
{
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  GEOGetMonotonicTime();
  double v7 = v6 - self->_startMonotonicTimestamp;
  if (v7 <= 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: totalDuration > 0", buf, 2u);
    }
  }
  else
  {
    *(void *)buf = 0;
    v36 = buf;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __73__GEORoutePreloaderStatisticsInfo_finishAndReportIfNecessaryForDistance___block_invoke;
    v17 = &unk_1E53F7278;
    unsigned int v18 = self;
    v19 = buf;
    v20 = &v31;
    v21 = &v27;
    v22 = &v23;
    geo_isolate_sync_data();
    if (v36[24])
    {
      __int16 v8 = [v5 dateByAddingTimeInterval:-v7];
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v5];
      [v9 duration];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__GEORoutePreloaderStatisticsInfo_finishAndReportIfNecessaryForDistance___block_invoke_23;
      v12[3] = &unk_1E53F72A0;
      v12[8] = v10;
      unsigned int v13 = vcvtad_u64_f64(a3 / 1000.0);
      v12[4] = self;
      v12[5] = &v31;
      v12[6] = &v27;
      v12[7] = &v23;
      geoAnalyticsSendEventLazy(@"com.apple.GeoServices.routepreloader.session", v12);
      id v11 = +[GEORequestCounter sharedCounter];
      [v11 recordRoutePreloadSessionAt:v9 transportType:self->_transportType tilesPreloaded:v32[3] tilesUsed:v28[3] tilesMissed:v24[3]];
    }
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __73__GEORoutePreloaderStatisticsInfo_finishAndReportIfNecessaryForDistance___block_invoke(void *a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 56) != 0;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v2 = GEOGetRoutePreloaderLog();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

    if (v3)
    {
      v42 = [MEMORY[0x1E4F28E78] stringWithString:@"\tLoaded tiles:\n"];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      obuint64_t j = *(id *)(a1[4] + 112);
      uint64_t v4 = [obj countByEnumeratingWithState:&v47 objects:v74 count:16];
      if (v4)
      {
        uint64_t v5 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            if (*(void *)v48 != v5) {
              objc_enumerationMutation(obj);
            }
            double v7 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            uint64_t v8 = [v7 unsignedIntegerValue];
            uint64_t v9 = [*(id *)(a1[4] + 112) objectForKeyedSubscript:v7];
            uint64_t v10 = [v9 unsignedIntegerValue];

            id v11 = [*(id *)(a1[4] + 120) objectForKeyedSubscript:v7];
            uint64_t v12 = [v11 unsignedIntegerValue];

            uint64_t v13 = v8;
            int v14 = v8;
            uint64_t v15 = @"RASTER_STANDARD";
            switch(v14)
            {
              case 0:
                break;
              case 1:
                uint64_t v15 = @"VECTOR_STANDARD";
                break;
              case 2:
                uint64_t v15 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
                break;
              case 3:
                uint64_t v15 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
                break;
              case 4:
                uint64_t v15 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
                break;
              case 5:
                uint64_t v15 = @"RASTER_STANDARD_BACKGROUND";
                break;
              case 6:
                uint64_t v15 = @"RASTER_HYBRID";
                break;
              case 7:
                uint64_t v15 = @"RASTER_SATELLITE";
                break;
              case 8:
                uint64_t v15 = @"RASTER_TERRAIN";
                break;
              case 11:
                uint64_t v15 = @"VECTOR_BUILDINGS";
                break;
              case 12:
                uint64_t v15 = @"VECTOR_TRAFFIC";
                break;
              case 13:
                uint64_t v15 = @"VECTOR_POI";
                break;
              case 14:
                uint64_t v15 = @"SPUTNIK_METADATA";
                break;
              case 15:
                uint64_t v15 = @"SPUTNIK_C3M";
                break;
              case 16:
                uint64_t v15 = @"SPUTNIK_DSM";
                break;
              case 17:
                uint64_t v15 = @"SPUTNIK_DSM_GLOBAL";
                break;
              case 18:
                uint64_t v15 = @"VECTOR_REALISTIC";
                break;
              case 19:
                uint64_t v15 = @"VECTOR_LEGACY_REALISTIC";
                break;
              case 20:
                uint64_t v15 = @"VECTOR_ROADS";
                break;
              case 21:
                uint64_t v15 = @"RASTER_VEGETATION";
                break;
              case 22:
                uint64_t v15 = @"VECTOR_TRAFFIC_SKELETON";
                break;
              case 23:
                uint64_t v15 = @"RASTER_COASTLINE_MASK";
                break;
              case 24:
                uint64_t v15 = @"RASTER_HILLSHADE";
                break;
              case 25:
                uint64_t v15 = @"VECTOR_TRAFFIC_WITH_GREEN";
                break;
              case 26:
                uint64_t v15 = @"VECTOR_TRAFFIC_STATIC";
                break;
              case 27:
                uint64_t v15 = @"RASTER_COASTLINE_DROP_MASK";
                break;
              case 28:
                uint64_t v15 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
                break;
              case 29:
                uint64_t v15 = @"VECTOR_SPEED_PROFILES";
                break;
              case 30:
                uint64_t v15 = @"VECTOR_VENUES";
                break;
              case 31:
                uint64_t v15 = @"RASTER_DOWN_SAMPLED";
                break;
              case 32:
                uint64_t v15 = @"RASTER_COLOR_BALANCED";
                break;
              case 33:
                uint64_t v15 = @"RASTER_SATELLITE_NIGHT";
                break;
              case 34:
                uint64_t v15 = @"SPUTNIK_VECTOR_BORDER";
                break;
              case 35:
                uint64_t v15 = @"RASTER_SATELLITE_DIGITIZE";
                break;
              case 36:
                uint64_t v15 = @"RASTER_HILLSHADE_PARKS";
                break;
              case 37:
                uint64_t v15 = @"VECTOR_TRANSIT";
                break;
              case 38:
                uint64_t v15 = @"RASTER_STANDARD_BASE";
                break;
              case 39:
                uint64_t v15 = @"RASTER_STANDARD_LABELS";
                break;
              case 40:
                uint64_t v15 = @"RASTER_HYBRID_ROADS";
                break;
              case 41:
                uint64_t v15 = @"RASTER_HYBRID_LABELS";
                break;
              case 42:
                uint64_t v15 = @"FLYOVER_C3M_MESH";
                break;
              case 43:
                uint64_t v15 = @"FLYOVER_C3M_JPEG_TEXTURE";
                break;
              case 44:
                uint64_t v15 = @"FLYOVER_C3M_ASTC_TEXTURE";
                break;
              case 45:
                uint64_t v15 = @"RASTER_SATELLITE_ASTC";
                break;
              case 46:
                uint64_t v15 = @"RASTER_HYBRID_ROADS_AND_LABELS";
                break;
              case 47:
                uint64_t v15 = @"VECTOR_TRANSIT_SELECTION";
                break;
              case 48:
                uint64_t v15 = @"VECTOR_COVERAGE";
                break;
              case 52:
                uint64_t v15 = @"FLYOVER_METADATA";
                break;
              case 53:
                uint64_t v15 = @"VECTOR_ROAD_NETWORK";
                break;
              case 54:
                uint64_t v15 = @"VECTOR_LAND_COVER";
                break;
              case 55:
                uint64_t v15 = @"VECTOR_DEBUG";
                break;
              case 56:
                uint64_t v15 = @"VECTOR_STREET_POI";
                break;
              case 57:
                uint64_t v15 = @"MUNIN_METADATA";
                break;
              case 58:
                uint64_t v15 = @"VECTOR_SPR_MERCATOR";
                break;
              case 59:
                uint64_t v15 = @"VECTOR_SPR_MODELS";
                break;
              case 60:
                uint64_t v15 = @"VECTOR_SPR_MATERIALS";
                break;
              case 61:
                uint64_t v15 = @"VECTOR_SPR_METADATA";
                break;
              case 62:
                uint64_t v15 = @"VECTOR_TRACKS";
                break;
              case 63:
                uint64_t v15 = @"VECTOR_RESERVED_2";
                break;
              case 64:
                uint64_t v15 = @"VECTOR_STREET_LANDMARKS";
                break;
              case 65:
                uint64_t v15 = @"COARSE_LOCATION_POLYGONS";
                break;
              case 66:
                uint64_t v15 = @"VECTOR_SPR_ROADS";
                break;
              case 67:
                uint64_t v15 = @"VECTOR_SPR_STANDARD";
                break;
              case 68:
                uint64_t v15 = @"VECTOR_POI_V2";
                break;
              case 69:
                uint64_t v15 = @"VECTOR_POLYGON_SELECTION";
                break;
              case 70:
                uint64_t v15 = @"VL_METADATA";
                break;
              case 71:
                uint64_t v15 = @"VL_DATA";
                break;
              case 72:
                uint64_t v15 = @"PROACTIVE_APP_CLIP";
                break;
              case 73:
                uint64_t v15 = @"VECTOR_BUILDINGS_V2";
                break;
              case 74:
                uint64_t v15 = @"POI_BUSYNESS";
                break;
              case 75:
                uint64_t v15 = @"POI_DP_BUSYNESS";
                break;
              case 76:
                uint64_t v15 = @"SMART_INTERFACE_SELECTION";
                break;
              case 77:
                uint64_t v15 = @"VECTOR_ASSETS";
                break;
              case 78:
                uint64_t v15 = @"SPR_ASSET_METADATA";
                break;
              case 79:
                uint64_t v15 = @"VECTOR_SPR_POLAR";
                break;
              case 80:
                uint64_t v15 = @"SMART_DATA_MODE";
                break;
              case 81:
                uint64_t v15 = @"CELLULAR_PERFORMANCE_SCORE";
                break;
              case 82:
                uint64_t v15 = @"VECTOR_SPR_MODELS_OCCLUSION";
                break;
              case 83:
                uint64_t v15 = @"VECTOR_TOPOGRAPHIC";
                break;
              case 84:
                uint64_t v15 = @"VECTOR_POI_V2_UPDATE";
                break;
              case 85:
                uint64_t v15 = @"VECTOR_LIVE_DATA_UPDATES";
                break;
              case 86:
                uint64_t v15 = @"VECTOR_TRAFFIC_V2";
                break;
              case 87:
                uint64_t v15 = @"VECTOR_ROAD_SELECTION";
                break;
              case 88:
                uint64_t v15 = @"VECTOR_REGION_METADATA";
                break;
              case 89:
                uint64_t v15 = @"RAY_TRACING";
                break;
              case 90:
                uint64_t v15 = @"VECTOR_CONTOURS";
                break;
              case 91:
                uint64_t v15 = @"RASTER_SATELLITE_POLAR";
                break;
              case 92:
                uint64_t v15 = @"VMAP4_ELEVATION";
                break;
              case 93:
                uint64_t v15 = @"VMAP4_ELEVATION_POLAR";
                break;
              case 94:
                uint64_t v15 = @"CELLULAR_COVERAGE_PLMN";
                break;
              case 95:
                uint64_t v15 = @"RASTER_SATELLITE_POLAR_NIGHT";
                break;
              case 96:
                uint64_t v15 = @"UNUSED_96";
                break;
              case 97:
                uint64_t v15 = @"UNUSED_97";
                break;
              case 98:
                uint64_t v15 = @"UNUSED_98";
                break;
              case 99:
                uint64_t v15 = @"UNUSED_99";
                break;
              case 100:
                uint64_t v15 = @"UNUSED_100";
                break;
              case 101:
                uint64_t v15 = @"UNUSED_101";
                break;
              case 102:
                uint64_t v15 = @"UNUSED_102";
                break;
              case 103:
                uint64_t v15 = @"UNUSED_103";
                break;
              case 104:
                uint64_t v15 = @"UNUSED_104";
                break;
              case 105:
                uint64_t v15 = @"UNUSED_105";
                break;
              case 106:
                uint64_t v15 = @"UNUSED_106";
                break;
              case 107:
                uint64_t v15 = @"UNUSED_107";
                break;
              case 108:
                uint64_t v15 = @"UNUSED_108";
                break;
              case 109:
                uint64_t v15 = @"UNUSED_109";
                break;
              case 110:
                uint64_t v15 = @"UNUSED_110";
                break;
              case 111:
                uint64_t v15 = @"UNUSED_111";
                break;
              case 112:
                uint64_t v15 = @"UNUSED_112";
                break;
              case 113:
                uint64_t v15 = @"UNUSED_113";
                break;
              case 114:
                uint64_t v15 = @"UNUSED_114";
                break;
              case 115:
                uint64_t v15 = @"UNUSED_115";
                break;
              case 116:
                uint64_t v15 = @"UNUSED_116";
                break;
              case 117:
                uint64_t v15 = @"UNUSED_117";
                break;
              case 118:
                uint64_t v15 = @"UNUSED_118";
                break;
              case 119:
                uint64_t v15 = @"UNUSED_119";
                break;
              default:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
                uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
            [v42 appendFormat:@"\t\t%@: %llu (%llu bytes)\n", v15, v10, v12];
          }
          uint64_t v4 = [obj countByEnumeratingWithState:&v47 objects:v74 count:16];
        }
        while (v4);
      }

      v16 = [MEMORY[0x1E4F28E78] stringWithString:@"\tMissed tiles:\n"];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obja = *(id *)(a1[4] + 128);
      uint64_t v17 = 0;
      uint64_t v18 = [obja countByEnumeratingWithState:&v43 objects:v73 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v44 != v19) {
              objc_enumerationMutation(obja);
            }
            v21 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            uint64_t v22 = [v21 unsignedIntegerValue];
            uint64_t v23 = [*(id *)(a1[4] + 128) objectForKeyedSubscript:v21];
            uint64_t v24 = [v23 unsignedIntegerValue];

            uint64_t v25 = [*(id *)(a1[4] + 136) objectForKeyedSubscript:v21];
            uint64_t v26 = [v25 unsignedIntegerValue];

            uint64_t v27 = v22;
            int v28 = v22;
            uint64_t v29 = @"RASTER_STANDARD";
            switch(v28)
            {
              case 0:
                break;
              case 1:
                uint64_t v29 = @"VECTOR_STANDARD";
                break;
              case 2:
                uint64_t v29 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
                break;
              case 3:
                uint64_t v29 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
                break;
              case 4:
                uint64_t v29 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
                break;
              case 5:
                uint64_t v29 = @"RASTER_STANDARD_BACKGROUND";
                break;
              case 6:
                uint64_t v29 = @"RASTER_HYBRID";
                break;
              case 7:
                uint64_t v29 = @"RASTER_SATELLITE";
                break;
              case 8:
                uint64_t v29 = @"RASTER_TERRAIN";
                break;
              case 11:
                uint64_t v29 = @"VECTOR_BUILDINGS";
                break;
              case 12:
                uint64_t v29 = @"VECTOR_TRAFFIC";
                break;
              case 13:
                uint64_t v29 = @"VECTOR_POI";
                break;
              case 14:
                uint64_t v29 = @"SPUTNIK_METADATA";
                break;
              case 15:
                uint64_t v29 = @"SPUTNIK_C3M";
                break;
              case 16:
                uint64_t v29 = @"SPUTNIK_DSM";
                break;
              case 17:
                uint64_t v29 = @"SPUTNIK_DSM_GLOBAL";
                break;
              case 18:
                uint64_t v29 = @"VECTOR_REALISTIC";
                break;
              case 19:
                uint64_t v29 = @"VECTOR_LEGACY_REALISTIC";
                break;
              case 20:
                uint64_t v29 = @"VECTOR_ROADS";
                break;
              case 21:
                uint64_t v29 = @"RASTER_VEGETATION";
                break;
              case 22:
                uint64_t v29 = @"VECTOR_TRAFFIC_SKELETON";
                break;
              case 23:
                uint64_t v29 = @"RASTER_COASTLINE_MASK";
                break;
              case 24:
                uint64_t v29 = @"RASTER_HILLSHADE";
                break;
              case 25:
                uint64_t v29 = @"VECTOR_TRAFFIC_WITH_GREEN";
                break;
              case 26:
                uint64_t v29 = @"VECTOR_TRAFFIC_STATIC";
                break;
              case 27:
                uint64_t v29 = @"RASTER_COASTLINE_DROP_MASK";
                break;
              case 28:
                uint64_t v29 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
                break;
              case 29:
                uint64_t v29 = @"VECTOR_SPEED_PROFILES";
                break;
              case 30:
                uint64_t v29 = @"VECTOR_VENUES";
                break;
              case 31:
                uint64_t v29 = @"RASTER_DOWN_SAMPLED";
                break;
              case 32:
                uint64_t v29 = @"RASTER_COLOR_BALANCED";
                break;
              case 33:
                uint64_t v29 = @"RASTER_SATELLITE_NIGHT";
                break;
              case 34:
                uint64_t v29 = @"SPUTNIK_VECTOR_BORDER";
                break;
              case 35:
                uint64_t v29 = @"RASTER_SATELLITE_DIGITIZE";
                break;
              case 36:
                uint64_t v29 = @"RASTER_HILLSHADE_PARKS";
                break;
              case 37:
                uint64_t v29 = @"VECTOR_TRANSIT";
                break;
              case 38:
                uint64_t v29 = @"RASTER_STANDARD_BASE";
                break;
              case 39:
                uint64_t v29 = @"RASTER_STANDARD_LABELS";
                break;
              case 40:
                uint64_t v29 = @"RASTER_HYBRID_ROADS";
                break;
              case 41:
                uint64_t v29 = @"RASTER_HYBRID_LABELS";
                break;
              case 42:
                uint64_t v29 = @"FLYOVER_C3M_MESH";
                break;
              case 43:
                uint64_t v29 = @"FLYOVER_C3M_JPEG_TEXTURE";
                break;
              case 44:
                uint64_t v29 = @"FLYOVER_C3M_ASTC_TEXTURE";
                break;
              case 45:
                uint64_t v29 = @"RASTER_SATELLITE_ASTC";
                break;
              case 46:
                uint64_t v29 = @"RASTER_HYBRID_ROADS_AND_LABELS";
                break;
              case 47:
                uint64_t v29 = @"VECTOR_TRANSIT_SELECTION";
                break;
              case 48:
                uint64_t v29 = @"VECTOR_COVERAGE";
                break;
              case 52:
                uint64_t v29 = @"FLYOVER_METADATA";
                break;
              case 53:
                uint64_t v29 = @"VECTOR_ROAD_NETWORK";
                break;
              case 54:
                uint64_t v29 = @"VECTOR_LAND_COVER";
                break;
              case 55:
                uint64_t v29 = @"VECTOR_DEBUG";
                break;
              case 56:
                uint64_t v29 = @"VECTOR_STREET_POI";
                break;
              case 57:
                uint64_t v29 = @"MUNIN_METADATA";
                break;
              case 58:
                uint64_t v29 = @"VECTOR_SPR_MERCATOR";
                break;
              case 59:
                uint64_t v29 = @"VECTOR_SPR_MODELS";
                break;
              case 60:
                uint64_t v29 = @"VECTOR_SPR_MATERIALS";
                break;
              case 61:
                uint64_t v29 = @"VECTOR_SPR_METADATA";
                break;
              case 62:
                uint64_t v29 = @"VECTOR_TRACKS";
                break;
              case 63:
                uint64_t v29 = @"VECTOR_RESERVED_2";
                break;
              case 64:
                uint64_t v29 = @"VECTOR_STREET_LANDMARKS";
                break;
              case 65:
                uint64_t v29 = @"COARSE_LOCATION_POLYGONS";
                break;
              case 66:
                uint64_t v29 = @"VECTOR_SPR_ROADS";
                break;
              case 67:
                uint64_t v29 = @"VECTOR_SPR_STANDARD";
                break;
              case 68:
                uint64_t v29 = @"VECTOR_POI_V2";
                break;
              case 69:
                uint64_t v29 = @"VECTOR_POLYGON_SELECTION";
                break;
              case 70:
                uint64_t v29 = @"VL_METADATA";
                break;
              case 71:
                uint64_t v29 = @"VL_DATA";
                break;
              case 72:
                uint64_t v29 = @"PROACTIVE_APP_CLIP";
                break;
              case 73:
                uint64_t v29 = @"VECTOR_BUILDINGS_V2";
                break;
              case 74:
                uint64_t v29 = @"POI_BUSYNESS";
                break;
              case 75:
                uint64_t v29 = @"POI_DP_BUSYNESS";
                break;
              case 76:
                uint64_t v29 = @"SMART_INTERFACE_SELECTION";
                break;
              case 77:
                uint64_t v29 = @"VECTOR_ASSETS";
                break;
              case 78:
                uint64_t v29 = @"SPR_ASSET_METADATA";
                break;
              case 79:
                uint64_t v29 = @"VECTOR_SPR_POLAR";
                break;
              case 80:
                uint64_t v29 = @"SMART_DATA_MODE";
                break;
              case 81:
                uint64_t v29 = @"CELLULAR_PERFORMANCE_SCORE";
                break;
              case 82:
                uint64_t v29 = @"VECTOR_SPR_MODELS_OCCLUSION";
                break;
              case 83:
                uint64_t v29 = @"VECTOR_TOPOGRAPHIC";
                break;
              case 84:
                uint64_t v29 = @"VECTOR_POI_V2_UPDATE";
                break;
              case 85:
                uint64_t v29 = @"VECTOR_LIVE_DATA_UPDATES";
                break;
              case 86:
                uint64_t v29 = @"VECTOR_TRAFFIC_V2";
                break;
              case 87:
                uint64_t v29 = @"VECTOR_ROAD_SELECTION";
                break;
              case 88:
                uint64_t v29 = @"VECTOR_REGION_METADATA";
                break;
              case 89:
                uint64_t v29 = @"RAY_TRACING";
                break;
              case 90:
                uint64_t v29 = @"VECTOR_CONTOURS";
                break;
              case 91:
                uint64_t v29 = @"RASTER_SATELLITE_POLAR";
                break;
              case 92:
                uint64_t v29 = @"VMAP4_ELEVATION";
                break;
              case 93:
                uint64_t v29 = @"VMAP4_ELEVATION_POLAR";
                break;
              case 94:
                uint64_t v29 = @"CELLULAR_COVERAGE_PLMN";
                break;
              case 95:
                uint64_t v29 = @"RASTER_SATELLITE_POLAR_NIGHT";
                break;
              case 96:
                uint64_t v29 = @"UNUSED_96";
                break;
              case 97:
                uint64_t v29 = @"UNUSED_97";
                break;
              case 98:
                uint64_t v29 = @"UNUSED_98";
                break;
              case 99:
                uint64_t v29 = @"UNUSED_99";
                break;
              case 100:
                uint64_t v29 = @"UNUSED_100";
                break;
              case 101:
                uint64_t v29 = @"UNUSED_101";
                break;
              case 102:
                uint64_t v29 = @"UNUSED_102";
                break;
              case 103:
                uint64_t v29 = @"UNUSED_103";
                break;
              case 104:
                uint64_t v29 = @"UNUSED_104";
                break;
              case 105:
                uint64_t v29 = @"UNUSED_105";
                break;
              case 106:
                uint64_t v29 = @"UNUSED_106";
                break;
              case 107:
                uint64_t v29 = @"UNUSED_107";
                break;
              case 108:
                uint64_t v29 = @"UNUSED_108";
                break;
              case 109:
                uint64_t v29 = @"UNUSED_109";
                break;
              case 110:
                uint64_t v29 = @"UNUSED_110";
                break;
              case 111:
                uint64_t v29 = @"UNUSED_111";
                break;
              case 112:
                uint64_t v29 = @"UNUSED_112";
                break;
              case 113:
                uint64_t v29 = @"UNUSED_113";
                break;
              case 114:
                uint64_t v29 = @"UNUSED_114";
                break;
              case 115:
                uint64_t v29 = @"UNUSED_115";
                break;
              case 116:
                uint64_t v29 = @"UNUSED_116";
                break;
              case 117:
                uint64_t v29 = @"UNUSED_117";
                break;
              case 118:
                uint64_t v29 = @"UNUSED_118";
                break;
              case 119:
                uint64_t v29 = @"UNUSED_119";
                break;
              default:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v27);
                uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
            [v16 appendFormat:@"\t\t%@: %llu (%llu bytes)\n", v29, v24, v26];

            v17 += v26;
          }
          uint64_t v18 = [obja countByEnumeratingWithState:&v43 objects:v73 count:16];
        }
        while (v18);
      }

      uint64_t v30 = GEOGetRoutePreloaderLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = (void *)a1[4];
        uint64_t v32 = v31[7];
        uint64_t v33 = v31[8];
        uint64_t v34 = v31[9];
        uint64_t v36 = v31[11];
        uint64_t v35 = v31[12];
        uint64_t v37 = v31[13];
        uint64_t v39 = v31[4];
        uint64_t v38 = v31[5];
        *(_DWORD *)buf = 134220546;
        uint64_t v52 = v32;
        __int16 v53 = 2048;
        uint64_t v54 = v33;
        __int16 v55 = 2048;
        uint64_t v56 = v35;
        __int16 v57 = 2048;
        uint64_t v58 = v34;
        __int16 v59 = 2048;
        uint64_t v60 = v36;
        __int16 v61 = 2048;
        uint64_t v62 = v37;
        __int16 v63 = 2048;
        uint64_t v64 = v39;
        __int16 v65 = 2048;
        uint64_t v66 = v17;
        __int16 v67 = 2048;
        uint64_t v68 = v38;
        __int16 v69 = 2114;
        v70 = v42;
        __int16 v71 = 2114;
        v72 = v16;
        _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_INFO, "Preload session complete. Final statistics:\n\tTiles attempted: %llu\n\tTiles loaded from network: %llu\n\tBytes loaded from network: %{bytes}llu\n\tTiles already in cache: %llu\n\tTiles failed: %llu\n\tTiles used: %llu\n\tMissed tiles (subsequently successful): %llu\n\tMissed bytes: %{bytes}llu\n\tMissed tiles (subsequently failed): %llu\n\n%{public}@\n\n%{public}@", buf, 0x70u);
      }
    }
    *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 64);
    *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(a1[4] + 104);
    *(void *)(*(void *)(a1[8] + 8) + 24) = *(void *)(a1[4] + 40) + *(void *)(a1[4] + 32);
  }
}

id __73__GEORoutePreloaderStatisticsInfo_finishAndReportIfNecessaryForDistance___block_invoke_23(uint64_t a1)
{
  v17[8] = *MEMORY[0x1E4F143B8];
  v16[0] = @"transportType";
  uint64_t v2 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 16)];
  v17[0] = v2;
  v16[1] = @"duration";
  BOOL v3 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v17[1] = v3;
  v16[2] = @"distance";
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
  v17[2] = v4;
  v16[3] = @"tilesPreloaded";
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  v17[3] = v5;
  v16[4] = @"tilesUsed";
  double v6 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  v17[4] = v6;
  v16[5] = @"tilesMissed";
  double v7 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  v17[5] = v7;
  v16[6] = @"tilesUsedRatio";
  unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v8) {
    double v9 = (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) / (double)v8;
  }
  else {
    double v9 = -1.0;
  }
  uint64_t v10 = [NSNumber numberWithDouble:v9];
  v17[6] = v10;
  v16[7] = @"tilesMissedRatio";
  unint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v11) {
    double v12 = (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) / (double)v11;
  }
  else {
    double v12 = -1.0;
  }
  uint64_t v13 = [NSNumber numberWithDouble:v12];
  v17[7] = v13;
  int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:8];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileTypeToMissedBytes, 0);
  objc_storeStrong((id *)&self->_tileTypeToMissedCount, 0);
  objc_storeStrong((id *)&self->_tileTypeToBytes, 0);
  objc_storeStrong((id *)&self->_tileTypeToCount, 0);

  objc_storeStrong((id *)&self->_isolation, 0);
}

@end