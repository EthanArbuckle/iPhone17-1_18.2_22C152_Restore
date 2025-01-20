@interface GEOGeographicMetadataTileFetcher
- (id)initForTileStyle:(int)a3 mcc:(unsigned __int16)a4 mnc:(unsigned __int16)a5 options:(unint64_t)a6;
- (id)initForTileStyle:(int)a3 options:(unint64_t)a4;
- (int)tileStyle;
- (uint64_t)_tileKeyMakeWithCoordinate:(uint64_t)a3 zoom:(const unsigned __int8 *)a4;
- (unsigned)mcc;
- (unsigned)mnc;
- (void)_fetchTiles:(uint64_t)a3 withOptions:(void *)a4 queue:(void *)a5 completion:;
- (void)fetchMetadataForLocation:(id)a3 responseQueue:(id)a4 block:(id)a5;
- (void)reportCorrupt:(id)a3;
@end

@implementation GEOGeographicMetadataTileFetcher

- (id)initForTileStyle:(int)a3 options:(unint64_t)a4
{
  v4 = self;
  if (a3 == 80)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: tileStyle != GEOTileSetStyle_SMART_DATA_MODE", v7, 2u);
    }
    v5 = 0;
  }
  else
  {
    v4 = (GEOGeographicMetadataTileFetcher *)[(GEOGeographicMetadataTileFetcher *)self initForTileStyle:*(void *)&a3 mcc:0xFFFFLL mnc:0xFFFFLL options:a4];
    v5 = v4;
  }

  return v5;
}

- (id)initForTileStyle:(int)a3 mcc:(unsigned __int16)a4 mnc:(unsigned __int16)a5 options:(unint64_t)a6
{
  v10 = self;
  BOOL v11 = a5 >= 0x3E8u || a4 >= 0x3E8u;
  if (v11 && (a5 & a4) != 0xFFFF)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: (mcc <= 999 && mnc <= 999) || (mcc == 65535 && mnc == 65535)", buf, 2u);
    }
    v15 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)GEOGeographicMetadataTileFetcher;
    v12 = [(GEOGeographicMetadataTileFetcher *)&v17 init];
    if (v12)
    {
      qos_class_self();
      uint64_t global_queue = geo_get_global_queue();
      workQueue = v12->_workQueue;
      v12->_workQueue = (OS_dispatch_queue *)global_queue;

      v12->_tileStyle = a3;
      v12->_options = a6;
      v12->_mcc = a4;
      v12->_mnc = a5;
    }
    v10 = v12;
    v15 = v10;
  }

  return v15;
}

- (uint64_t)_tileKeyMakeWithCoordinate:(uint64_t)a3 zoom:(const unsigned __int8 *)a4
{
  return GEOGloriaQuadIDTileKeyMakeWithCoordinate(a2, a5, a6, *(unsigned int *)(a1 + 16), a3, a4);
}

- (void)reportCorrupt:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSMapTable *)self->_resultItems objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    unint64_t v7 = [v5 unsignedLongLongValue];
    int tileStyle = self->_tileStyle;
    if (self->_mcc > 0x3E7u || self->_mnc > 0x3E7u)
    {
      long long v13 = xmmword_18A63FCF0;
      char v12 = __clz(v7);
      *(void *)((char *)&v13 + 1) = ((unint64_t)(char)(63
                                                                                             - v12
                                                                                             + (((63 - v12) & 0x80) >> 7)) >> 1) | (v7 << 6);
      *(_WORD *)((char *)&v13 + 9) = (v7 >> 58) & 0x3F | ((tileStyle & 0x3FFF) << 6);
      BYTE11(v13) = (unsigned __int16)(tileStyle & 0x3FFF) >> 10;
      uint64_t v10 = *((void *)&v13 + 1);
      uint64_t v9 = v13;
    }
    else
    {
      uint64_t v9 = GEOCellularInfoTileKeyMakeWithQuadKey(v7);
    }
    BOOL v11 = +[GEOTileLoader modernLoader];
    [v11 reportCorruptTile:&v13];
  }
  else
  {
    BOOL v11 = GEOGetGeographicMetadataLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v13) = 138412290;
      *(void *)((char *)&v13 + 4) = v4;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Unable to report corrupt tile, not tile key matching given item was found: \"%@\"", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_fetchTiles:(uint64_t)a3 withOptions:(void *)a4 queue:(void *)a5 completion:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  uint64_t v9 = a4;
  id v10 = a5;
  BOOL v11 = v10;
  uint64_t v36 = a1;
  if (a1)
  {
    v34 = v10;
    char v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    long long v13 = -[GEOTileKeyList initWithCapacity:]([GEOTileKeyList alloc], "initWithCapacity:", [v8 count]);
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    dispatch_group_t v15 = dispatch_group_create();
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __77__GEOGeographicMetadataTileFetcher__fetchTiles_withOptions_queue_completion___block_invoke;
    v47[3] = &unk_1E53ECEA0;
    id v33 = v12;
    id v48 = v33;
    v32 = v13;
    v49 = v32;
    id v31 = v14;
    id v50 = v31;
    v16 = v15;
    v51 = v16;
    objc_super v17 = (void *)MEMORY[0x18C120660](v47);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v35 = v8;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v44;
      do
      {
        uint64_t v22 = 0;
        do
        {
          v23 = v9;
          if (*(void *)v44 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v43 + 1) + 8 * v22);
          dispatch_group_enter(v16);
          v25 = +[GEOTileLoader modernLoader];
          v26 = [NSString stringWithFormat:@"<%@: %p>", v36, v18];
          uint64_t v27 = v24;
          uint64_t v9 = v23;
          [v25 loadKey:v27 priority:0x3FFFFFFFLL forClient:v26 options:a3 reason:4 callbackQ:v23 beginNetwork:0 callback:v17];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v20);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__GEOGeographicMetadataTileFetcher__fetchTiles_withOptions_queue_completion___block_invoke_81;
    block[3] = &unk_1E53EA428;
    BOOL v11 = v34;
    id v39 = v33;
    v40 = v32;
    id v41 = v31;
    id v42 = v34;
    id v28 = v31;
    v29 = v32;
    id v30 = v33;
    dispatch_group_notify(v16, v9, block);

    id v8 = v35;
  }
}

void __77__GEOGeographicMetadataTileFetcher__fetchTiles_withOptions_queue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11)
  {
    [*(id *)(a1 + 40) addKey:a2];
    [*(id *)(a1 + 48) addObject:v11];
    goto LABEL_3;
  }
  if (([v10 hasFileDescriptor] & 1) == 0)
  {
    id v18 = [v10 fileURL];

    if (!v18)
    {
      [*(id *)(a1 + 40) addKey:a2];
LABEL_3:
      long long v13 = GEOGetGeographicMetadataLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v23 = 138412290;
        id v24 = v11;
        uint64_t v14 = "Received tile with no corresponding file. Error : %@";
        dispatch_group_t v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        uint32_t v17 = 12;
LABEL_9:
        _os_log_impl(&dword_188D96000, v15, v16, v14, (uint8_t *)&v23, v17);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  uint64_t v19 = *(void **)(a1 + 32);
  *((void *)&v20 + 1) = *(unsigned __int16 *)(a2 + 9) | ((unint64_t)*(unsigned __int8 *)(a2 + 11) << 16);
  *(void *)&long long v20 = *(void *)(a2 + 1);
  uint64_t v21 = [NSNumber numberWithUnsignedLongLong:(unint64_t)(v20 >> 6)];
  [v19 setObject:v10 forKeyedSubscript:v21];

  long long v13 = GEOGetGeographicMetadataLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v22 = ((*(unsigned __int16 *)(a2 + 9) | (*(unsigned __int8 *)(a2 + 11) << 16)) >> 6) & 0x3FFF;
    int v23 = 67109120;
    LODWORD(v24) = v22;
    uint64_t v14 = "Received (style %d)";
    dispatch_group_t v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
    uint32_t v17 = 8;
    goto LABEL_9;
  }
LABEL_10:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __77__GEOGeographicMetadataTileFetcher__fetchTiles_withOptions_queue_completion___block_invoke_81(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = [*(id *)(a1 + 48) firstObject];
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v3 + 16))(v3, v1, v2, v4);
}

void __72__GEOGeographicMetadataTileFetcher__fetchTilesForZoom_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = GEOGetGeographicMetadataLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67240448;
    int v19 = [v7 count];
    __int16 v20 = 1026;
    int v21 = [v8 count];
    _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "Fetched %{public}d tiles and failed %{public}d \"fresh\" tiles", buf, 0xEu);
  }

  if ([v8 count] && *(unsigned char *)(a1 + 56))
  {
    if (*(unsigned char *)(a1 + 57)) {
      uint64_t v11 = 321;
    }
    else {
      uint64_t v11 = 65;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    long long v13 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__GEOGeographicMetadataTileFetcher__fetchTilesForZoom_queue_completion___block_invoke_82;
    v14[3] = &unk_1E53ECEC8;
    id v15 = v7;
    id v17 = *(id *)(a1 + 48);
    id v16 = v9;
    -[GEOGeographicMetadataTileFetcher _fetchTiles:withOptions:queue:completion:](v12, v8, v11, v13, v14);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __72__GEOGeographicMetadataTileFetcher__fetchTilesForZoom_queue_completion___block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = GEOGetGeographicMetadataLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12[0] = 67240448;
    v12[1] = [v5 count];
    __int16 v13 = 1026;
    int v14 = [v6 count];
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Fetched %{public}d tiles and failed %{public}d \"stale\" tiles", (uint8_t *)v12, 0xEu);
  }

  uint64_t v8 = [*(id *)(a1 + 32) count];
  uint64_t v9 = [v5 count];
  if (v8 && v9)
  {
    id v10 = (void *)[v5 mutableCopy];
    [v10 addEntriesFromDictionary:*(void *)(a1 + 32)];
  }
  else
  {
    if (v8)
    {
      id v11 = *(id *)(a1 + 32);
    }
    else
    {
      if (!v9)
      {
        id v10 = (void *)MEMORY[0x1E4F1CC08];
        goto LABEL_11;
      }
      id v11 = v5;
    }
    id v10 = v11;
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchMetadataForLocation:(id)a3 responseQueue:(id)a4 block:(id)a5
{
  v73[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void, __CFString *))a5;
  uint64_t v8 = (GEOLocation *)[a3 copy];
  location = self->_location;
  self->_location = v8;

  [(GEOLocation *)self->_location coordinate];
  double v11 = v10;
  double v13 = v12;
  int v14 = +[GEOResourceManifestManager modernManager];
  uint64_t v15 = [v14 activeTileGroup];
  id v16 = [v15 activeTileSetForStyle:self->_tileStyle];

  if (v16)
  {
    double v17 = GEOMapPointForCoordinate(v11, v13);
    double v19 = v18;
    unsigned __int8 v20 = objc_msgSend(v16, "minimumZoomLevelForMapPoint:");
    unsigned __int8 v21 = objc_msgSend(v16, "maximumZoomLevelForMapPoint:", v17, v19);
    int v22 = v20;
    if (v20 >= v21)
    {
      int v53 = v21;
      v54 = (void *)MEMORY[0x1E4F28C58];
      v55 = objc_msgSend(NSString, "stringWithFormat:", @"Nonsense zooms. min: %d max: %d", v20, v21);
      v52 = [v54 GEOErrorWithCode:-2006 reason:v55];

      v56 = GEOGetGeographicMetadataLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      {
        uint64_t tileStyle = self->_tileStyle;
        v58 = @"RASTER_STANDARD";
        switch((int)tileStyle)
        {
          case 0:
            break;
          case 1:
            v58 = @"VECTOR_STANDARD";
            break;
          case 2:
            v58 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
            break;
          case 3:
            v58 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
            break;
          case 4:
            v58 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
            break;
          case 5:
            v58 = @"RASTER_STANDARD_BACKGROUND";
            break;
          case 6:
            v58 = @"RASTER_HYBRID";
            break;
          case 7:
            v58 = @"RASTER_SATELLITE";
            break;
          case 8:
            v58 = @"RASTER_TERRAIN";
            break;
          case 11:
            v58 = @"VECTOR_BUILDINGS";
            break;
          case 12:
            v58 = @"VECTOR_TRAFFIC";
            break;
          case 13:
            v58 = @"VECTOR_POI";
            break;
          case 14:
            v58 = @"SPUTNIK_METADATA";
            break;
          case 15:
            v58 = @"SPUTNIK_C3M";
            break;
          case 16:
            v58 = @"SPUTNIK_DSM";
            break;
          case 17:
            v58 = @"SPUTNIK_DSM_GLOBAL";
            break;
          case 18:
            v58 = @"VECTOR_REALISTIC";
            break;
          case 19:
            v58 = @"VECTOR_LEGACY_REALISTIC";
            break;
          case 20:
            v58 = @"VECTOR_ROADS";
            break;
          case 21:
            v58 = @"RASTER_VEGETATION";
            break;
          case 22:
            v58 = @"VECTOR_TRAFFIC_SKELETON";
            break;
          case 23:
            v58 = @"RASTER_COASTLINE_MASK";
            break;
          case 24:
            v58 = @"RASTER_HILLSHADE";
            break;
          case 25:
            v58 = @"VECTOR_TRAFFIC_WITH_GREEN";
            break;
          case 26:
            v58 = @"VECTOR_TRAFFIC_STATIC";
            break;
          case 27:
            v58 = @"RASTER_COASTLINE_DROP_MASK";
            break;
          case 28:
            v58 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
            break;
          case 29:
            v58 = @"VECTOR_SPEED_PROFILES";
            break;
          case 30:
            v58 = @"VECTOR_VENUES";
            break;
          case 31:
            v58 = @"RASTER_DOWN_SAMPLED";
            break;
          case 32:
            v58 = @"RASTER_COLOR_BALANCED";
            break;
          case 33:
            v58 = @"RASTER_SATELLITE_NIGHT";
            break;
          case 34:
            v58 = @"SPUTNIK_VECTOR_BORDER";
            break;
          case 35:
            v58 = @"RASTER_SATELLITE_DIGITIZE";
            break;
          case 36:
            v58 = @"RASTER_HILLSHADE_PARKS";
            break;
          case 37:
            v58 = @"VECTOR_TRANSIT";
            break;
          case 38:
            v58 = @"RASTER_STANDARD_BASE";
            break;
          case 39:
            v58 = @"RASTER_STANDARD_LABELS";
            break;
          case 40:
            v58 = @"RASTER_HYBRID_ROADS";
            break;
          case 41:
            v58 = @"RASTER_HYBRID_LABELS";
            break;
          case 42:
            v58 = @"FLYOVER_C3M_MESH";
            break;
          case 43:
            v58 = @"FLYOVER_C3M_JPEG_TEXTURE";
            break;
          case 44:
            v58 = @"FLYOVER_C3M_ASTC_TEXTURE";
            break;
          case 45:
            v58 = @"RASTER_SATELLITE_ASTC";
            break;
          case 46:
            v58 = @"RASTER_HYBRID_ROADS_AND_LABELS";
            break;
          case 47:
            v58 = @"VECTOR_TRANSIT_SELECTION";
            break;
          case 48:
            v58 = @"VECTOR_COVERAGE";
            break;
          case 52:
            v58 = @"FLYOVER_METADATA";
            break;
          case 53:
            v58 = @"VECTOR_ROAD_NETWORK";
            break;
          case 54:
            v58 = @"VECTOR_LAND_COVER";
            break;
          case 55:
            v58 = @"VECTOR_DEBUG";
            break;
          case 56:
            v58 = @"VECTOR_STREET_POI";
            break;
          case 57:
            v58 = @"MUNIN_METADATA";
            break;
          case 58:
            v58 = @"VECTOR_SPR_MERCATOR";
            break;
          case 59:
            v58 = @"VECTOR_SPR_MODELS";
            break;
          case 60:
            v58 = @"VECTOR_SPR_MATERIALS";
            break;
          case 61:
            v58 = @"VECTOR_SPR_METADATA";
            break;
          case 62:
            v58 = @"VECTOR_TRACKS";
            break;
          case 63:
            v58 = @"VECTOR_RESERVED_2";
            break;
          case 64:
            v58 = @"VECTOR_STREET_LANDMARKS";
            break;
          case 65:
            v58 = @"COARSE_LOCATION_POLYGONS";
            break;
          case 66:
            v58 = @"VECTOR_SPR_ROADS";
            break;
          case 67:
            v58 = @"VECTOR_SPR_STANDARD";
            break;
          case 68:
            v58 = @"VECTOR_POI_V2";
            break;
          case 69:
            v58 = @"VECTOR_POLYGON_SELECTION";
            break;
          case 70:
            v58 = @"VL_METADATA";
            break;
          case 71:
            v58 = @"VL_DATA";
            break;
          case 72:
            v58 = @"PROACTIVE_APP_CLIP";
            break;
          case 73:
            v58 = @"VECTOR_BUILDINGS_V2";
            break;
          case 74:
            v58 = @"POI_BUSYNESS";
            break;
          case 75:
            v58 = @"POI_DP_BUSYNESS";
            break;
          case 76:
            v58 = @"SMART_INTERFACE_SELECTION";
            break;
          case 77:
            v58 = @"VECTOR_ASSETS";
            break;
          case 78:
            v58 = @"SPR_ASSET_METADATA";
            break;
          case 79:
            v58 = @"VECTOR_SPR_POLAR";
            break;
          case 80:
            v58 = @"SMART_DATA_MODE";
            break;
          case 81:
            v58 = @"CELLULAR_PERFORMANCE_SCORE";
            break;
          case 82:
            v58 = @"VECTOR_SPR_MODELS_OCCLUSION";
            break;
          case 83:
            v58 = @"VECTOR_TOPOGRAPHIC";
            break;
          case 84:
            v58 = @"VECTOR_POI_V2_UPDATE";
            break;
          case 85:
            v58 = @"VECTOR_LIVE_DATA_UPDATES";
            break;
          case 86:
            v58 = @"VECTOR_TRAFFIC_V2";
            break;
          case 87:
            v58 = @"VECTOR_ROAD_SELECTION";
            break;
          case 88:
            v58 = @"VECTOR_REGION_METADATA";
            break;
          case 89:
            v58 = @"RAY_TRACING";
            break;
          case 90:
            v58 = @"VECTOR_CONTOURS";
            break;
          case 91:
            v58 = @"RASTER_SATELLITE_POLAR";
            break;
          case 92:
            v58 = @"VMAP4_ELEVATION";
            break;
          case 93:
            v58 = @"VMAP4_ELEVATION_POLAR";
            break;
          case 94:
            v58 = @"CELLULAR_COVERAGE_PLMN";
            break;
          case 95:
            v58 = @"RASTER_SATELLITE_POLAR_NIGHT";
            break;
          case 96:
            v58 = @"UNUSED_96";
            break;
          case 97:
            v58 = @"UNUSED_97";
            break;
          case 98:
            v58 = @"UNUSED_98";
            break;
          case 99:
            v58 = @"UNUSED_99";
            break;
          case 100:
            v58 = @"UNUSED_100";
            break;
          case 101:
            v58 = @"UNUSED_101";
            break;
          case 102:
            v58 = @"UNUSED_102";
            break;
          case 103:
            v58 = @"UNUSED_103";
            break;
          case 104:
            v58 = @"UNUSED_104";
            break;
          case 105:
            v58 = @"UNUSED_105";
            break;
          case 106:
            v58 = @"UNUSED_106";
            break;
          case 107:
            v58 = @"UNUSED_107";
            break;
          case 108:
            v58 = @"UNUSED_108";
            break;
          case 109:
            v58 = @"UNUSED_109";
            break;
          case 110:
            v58 = @"UNUSED_110";
            break;
          case 111:
            v58 = @"UNUSED_111";
            break;
          case 112:
            v58 = @"UNUSED_112";
            break;
          case 113:
            v58 = @"UNUSED_113";
            break;
          case 114:
            v58 = @"UNUSED_114";
            break;
          case 115:
            v58 = @"UNUSED_115";
            break;
          case 116:
            v58 = @"UNUSED_116";
            break;
          case 117:
            v58 = @"UNUSED_117";
            break;
          case 118:
            v58 = @"UNUSED_118";
            break;
          case 119:
            v58 = @"UNUSED_119";
            break;
          default:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", tileStyle);
            v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v58;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v20;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v53;
        _os_log_impl(&dword_188D96000, v56, OS_LOG_TYPE_FAULT, "Invalid zooms for tile style %@. min: %d max: %d", buf, 0x18u);
      }
      v7[2](v7, 0, v52);
    }
    else
    {
      workQueue = self->_workQueue;
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __81__GEOGeographicMetadataTileFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke;
      v63[3] = &unk_1E53DD310;
      v63[4] = self;
      v64 = v7;
      id v24 = workQueue;
      uint64_t v25 = v63;
      [(GEOLocation *)self->_location coordinate];
      double v27 = v26;
      double v29 = v28;
      *(double *)v65 = v26;
      *(double *)&v65[1] = v28;
      v73[0] = -[GEOGeographicMetadataTileFetcher _tileKeyMakeWithCoordinate:zoom:]((uint64_t)self, v20, v30, v31, v26, v28);
      v73[1] = v32;
      id v33 = [[GEOTileKeyList alloc] initWithCapacity:4];
      [(GEOTileKeyList *)v33 addKey:v73];
      unsigned int v34 = -45;
      double v35 = 45.0;
      do
      {
        [(GEOLocation *)self->_location horizontalAccuracy];
        double v37 = GEOCoordinate2DAlongBearing(v27, v29, v35, v36);
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        *(void *)buf = -[GEOGeographicMetadataTileFetcher _tileKeyMakeWithCoordinate:zoom:]((uint64_t)self, v20, v38, v39, v37, v40);
        *(void *)&buf[8] = v41;
        [(GEOTileKeyList *)v33 addKey:buf];
        double v35 = v35 + 90.0;
        v34 += 90;
      }
      while (v34 < 0x10E);
      id v42 = GEOGetGeographicMetadataLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        [(GEOLocation *)self->_location horizontalAccuracy];
        int v44 = (int)v43;
        int v45 = [(GEOTileKeyList *)v33 count];
        *(_DWORD *)buf = 68158723;
        *(_DWORD *)&uint8_t buf[4] = 16;
        *(_WORD *)&buf[8] = 2097;
        *(void *)&buf[10] = v65;
        *(_WORD *)&buf[18] = 1025;
        *(_DWORD *)&buf[20] = v22;
        LOWORD(v67) = 1024;
        *(_DWORD *)((char *)&v67 + 2) = v44;
        HIWORD(v67) = 1025;
        LODWORD(v68) = v45;
        _os_log_impl(&dword_188D96000, v42, OS_LOG_TYPE_DEBUG, "Coordinate %{private,geo:coordinate}.*P zoom %{private}d and radius %d will require %{private}d tile(s)", buf, 0x24u);
      }

      unint64_t options = self->_options;
      uint64_t v47 = (options >> 2) & 1;
      if (options) {
        uint64_t v48 = 11;
      }
      else {
        uint64_t v48 = 3;
      }
      unint64_t v49 = v48 & 0xFFFFFFFFFFFFFEFFLL | ((((self->_options & 4) >> 2) & 1) << 8);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __72__GEOGeographicMetadataTileFetcher__fetchTilesForZoom_queue_completion___block_invoke;
      v67 = &unk_1E53ECEF0;
      BOOL v71 = (options & 2) != 0;
      id v50 = v25;
      char v72 = v47;
      id v70 = v50;
      v68 = self;
      v51 = v24;
      v69 = v51;
      -[GEOGeographicMetadataTileFetcher _fetchTiles:withOptions:queue:completion:]((uint64_t)self, v33, v49, v51, buf);

      v52 = v64;
    }
  }
  else
  {
    v52 = @"RASTER_STANDARD";
    switch(self->_tileStyle)
    {
      case 0:
        break;
      case 1:
        v52 = @"VECTOR_STANDARD";
        break;
      case 2:
        v52 = @"VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER";
        break;
      case 3:
        v52 = @"VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER";
        break;
      case 4:
        v52 = @"VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER";
        break;
      case 5:
        v52 = @"RASTER_STANDARD_BACKGROUND";
        break;
      case 6:
        v52 = @"RASTER_HYBRID";
        break;
      case 7:
        v52 = @"RASTER_SATELLITE";
        break;
      case 8:
        v52 = @"RASTER_TERRAIN";
        break;
      case 0xB:
        v52 = @"VECTOR_BUILDINGS";
        break;
      case 0xC:
        v52 = @"VECTOR_TRAFFIC";
        break;
      case 0xD:
        v52 = @"VECTOR_POI";
        break;
      case 0xE:
        v52 = @"SPUTNIK_METADATA";
        break;
      case 0xF:
        v52 = @"SPUTNIK_C3M";
        break;
      case 0x10:
        v52 = @"SPUTNIK_DSM";
        break;
      case 0x11:
        v52 = @"SPUTNIK_DSM_GLOBAL";
        break;
      case 0x12:
        v52 = @"VECTOR_REALISTIC";
        break;
      case 0x13:
        v52 = @"VECTOR_LEGACY_REALISTIC";
        break;
      case 0x14:
        v52 = @"VECTOR_ROADS";
        break;
      case 0x15:
        v52 = @"RASTER_VEGETATION";
        break;
      case 0x16:
        v52 = @"VECTOR_TRAFFIC_SKELETON";
        break;
      case 0x17:
        v52 = @"RASTER_COASTLINE_MASK";
        break;
      case 0x18:
        v52 = @"RASTER_HILLSHADE";
        break;
      case 0x19:
        v52 = @"VECTOR_TRAFFIC_WITH_GREEN";
        break;
      case 0x1A:
        v52 = @"VECTOR_TRAFFIC_STATIC";
        break;
      case 0x1B:
        v52 = @"RASTER_COASTLINE_DROP_MASK";
        break;
      case 0x1C:
        v52 = @"VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL";
        break;
      case 0x1D:
        v52 = @"VECTOR_SPEED_PROFILES";
        break;
      case 0x1E:
        v52 = @"VECTOR_VENUES";
        break;
      case 0x1F:
        v52 = @"RASTER_DOWN_SAMPLED";
        break;
      case 0x20:
        v52 = @"RASTER_COLOR_BALANCED";
        break;
      case 0x21:
        v52 = @"RASTER_SATELLITE_NIGHT";
        break;
      case 0x22:
        v52 = @"SPUTNIK_VECTOR_BORDER";
        break;
      case 0x23:
        v52 = @"RASTER_SATELLITE_DIGITIZE";
        break;
      case 0x24:
        v52 = @"RASTER_HILLSHADE_PARKS";
        break;
      case 0x25:
        v52 = @"VECTOR_TRANSIT";
        break;
      case 0x26:
        v52 = @"RASTER_STANDARD_BASE";
        break;
      case 0x27:
        v52 = @"RASTER_STANDARD_LABELS";
        break;
      case 0x28:
        v52 = @"RASTER_HYBRID_ROADS";
        break;
      case 0x29:
        v52 = @"RASTER_HYBRID_LABELS";
        break;
      case 0x2A:
        v52 = @"FLYOVER_C3M_MESH";
        break;
      case 0x2B:
        v52 = @"FLYOVER_C3M_JPEG_TEXTURE";
        break;
      case 0x2C:
        v52 = @"FLYOVER_C3M_ASTC_TEXTURE";
        break;
      case 0x2D:
        v52 = @"RASTER_SATELLITE_ASTC";
        break;
      case 0x2E:
        v52 = @"RASTER_HYBRID_ROADS_AND_LABELS";
        break;
      case 0x2F:
        v52 = @"VECTOR_TRANSIT_SELECTION";
        break;
      case 0x30:
        v52 = @"VECTOR_COVERAGE";
        break;
      case 0x34:
        v52 = @"FLYOVER_METADATA";
        break;
      case 0x35:
        v52 = @"VECTOR_ROAD_NETWORK";
        break;
      case 0x36:
        v52 = @"VECTOR_LAND_COVER";
        break;
      case 0x37:
        v52 = @"VECTOR_DEBUG";
        break;
      case 0x38:
        v52 = @"VECTOR_STREET_POI";
        break;
      case 0x39:
        v52 = @"MUNIN_METADATA";
        break;
      case 0x3A:
        v52 = @"VECTOR_SPR_MERCATOR";
        break;
      case 0x3B:
        v52 = @"VECTOR_SPR_MODELS";
        break;
      case 0x3C:
        v52 = @"VECTOR_SPR_MATERIALS";
        break;
      case 0x3D:
        v52 = @"VECTOR_SPR_METADATA";
        break;
      case 0x3E:
        v52 = @"VECTOR_TRACKS";
        break;
      case 0x3F:
        v52 = @"VECTOR_RESERVED_2";
        break;
      case 0x40:
        v52 = @"VECTOR_STREET_LANDMARKS";
        break;
      case 0x41:
        v52 = @"COARSE_LOCATION_POLYGONS";
        break;
      case 0x42:
        v52 = @"VECTOR_SPR_ROADS";
        break;
      case 0x43:
        v52 = @"VECTOR_SPR_STANDARD";
        break;
      case 0x44:
        v52 = @"VECTOR_POI_V2";
        break;
      case 0x45:
        v52 = @"VECTOR_POLYGON_SELECTION";
        break;
      case 0x46:
        v52 = @"VL_METADATA";
        break;
      case 0x47:
        v52 = @"VL_DATA";
        break;
      case 0x48:
        v52 = @"PROACTIVE_APP_CLIP";
        break;
      case 0x49:
        v52 = @"VECTOR_BUILDINGS_V2";
        break;
      case 0x4A:
        v52 = @"POI_BUSYNESS";
        break;
      case 0x4B:
        v52 = @"POI_DP_BUSYNESS";
        break;
      case 0x4C:
        v52 = @"SMART_INTERFACE_SELECTION";
        break;
      case 0x4D:
        v52 = @"VECTOR_ASSETS";
        break;
      case 0x4E:
        v52 = @"SPR_ASSET_METADATA";
        break;
      case 0x4F:
        v52 = @"VECTOR_SPR_POLAR";
        break;
      case 0x50:
        v52 = @"SMART_DATA_MODE";
        break;
      case 0x51:
        v52 = @"CELLULAR_PERFORMANCE_SCORE";
        break;
      case 0x52:
        v52 = @"VECTOR_SPR_MODELS_OCCLUSION";
        break;
      case 0x53:
        v52 = @"VECTOR_TOPOGRAPHIC";
        break;
      case 0x54:
        v52 = @"VECTOR_POI_V2_UPDATE";
        break;
      case 0x55:
        v52 = @"VECTOR_LIVE_DATA_UPDATES";
        break;
      case 0x56:
        v52 = @"VECTOR_TRAFFIC_V2";
        break;
      case 0x57:
        v52 = @"VECTOR_ROAD_SELECTION";
        break;
      case 0x58:
        v52 = @"VECTOR_REGION_METADATA";
        break;
      case 0x59:
        v52 = @"RAY_TRACING";
        break;
      case 0x5A:
        v52 = @"VECTOR_CONTOURS";
        break;
      case 0x5B:
        v52 = @"RASTER_SATELLITE_POLAR";
        break;
      case 0x5C:
        v52 = @"VMAP4_ELEVATION";
        break;
      case 0x5D:
        v52 = @"VMAP4_ELEVATION_POLAR";
        break;
      case 0x5E:
        v52 = @"CELLULAR_COVERAGE_PLMN";
        break;
      case 0x5F:
        v52 = @"RASTER_SATELLITE_POLAR_NIGHT";
        break;
      case 0x60:
        v52 = @"UNUSED_96";
        break;
      case 0x61:
        v52 = @"UNUSED_97";
        break;
      case 0x62:
        v52 = @"UNUSED_98";
        break;
      case 0x63:
        v52 = @"UNUSED_99";
        break;
      case 0x64:
        v52 = @"UNUSED_100";
        break;
      case 0x65:
        v52 = @"UNUSED_101";
        break;
      case 0x66:
        v52 = @"UNUSED_102";
        break;
      case 0x67:
        v52 = @"UNUSED_103";
        break;
      case 0x68:
        v52 = @"UNUSED_104";
        break;
      case 0x69:
        v52 = @"UNUSED_105";
        break;
      case 0x6A:
        v52 = @"UNUSED_106";
        break;
      case 0x6B:
        v52 = @"UNUSED_107";
        break;
      case 0x6C:
        v52 = @"UNUSED_108";
        break;
      case 0x6D:
        v52 = @"UNUSED_109";
        break;
      case 0x6E:
        v52 = @"UNUSED_110";
        break;
      case 0x6F:
        v52 = @"UNUSED_111";
        break;
      case 0x70:
        v52 = @"UNUSED_112";
        break;
      case 0x71:
        v52 = @"UNUSED_113";
        break;
      case 0x72:
        v52 = @"UNUSED_114";
        break;
      case 0x73:
        v52 = @"UNUSED_115";
        break;
      case 0x74:
        v52 = @"UNUSED_116";
        break;
      case 0x75:
        v52 = @"UNUSED_117";
        break;
      case 0x76:
        v52 = @"UNUSED_118";
        break;
      case 0x77:
        v52 = @"UNUSED_119";
        break;
      default:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_tileStyle);
        v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    v59 = GEOGetGeographicMetadataLog();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v52;
      _os_log_impl(&dword_188D96000, v59, OS_LOG_TYPE_INFO, "%@ tile style not defined, will fail.", buf, 0xCu);
    }

    v60 = (void *)MEMORY[0x1E4F28C58];
    v61 = [NSString stringWithFormat:@"%@ tile style not defined.", v52];
    v62 = [v60 GEOErrorWithCode:-6 reason:v61];

    v7[2](v7, 0, v62);
  }
}

void __81__GEOGeographicMetadataTileFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v9 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:2 valueOptions:0];
    uint64_t v25 = 0;
    double v26 = &v25;
    uint64_t v27 = 0x3032000000;
    double v28 = __Block_byref_object_copy__86;
    double v29 = __Block_byref_object_dispose__86;
    id v30 = 0;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    double v19 = __81__GEOGeographicMetadataTileFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke_96;
    unsigned __int8 v20 = &unk_1E53ECF18;
    id v10 = v7;
    id v21 = v10;
    id v11 = v9;
    id v22 = v11;
    id v24 = &v25;
    id v12 = v8;
    id v23 = v12;
    [v5 enumerateKeysAndObjectsUsingBlock:&v17];
    if (objc_msgSend(v12, "count", v17, v18, v19, v20)) {
      double v13 = v12;
    }
    else {
      double v13 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), v13);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v9);
    uint64_t v14 = *(void *)(a1 + 40);
    if ([v10 count]) {
      id v15 = v10;
    }
    else {
      id v15 = 0;
    }
    if ([v10 count]) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v26[5];
    }
    (*(void (**)(uint64_t, id, uint64_t))(v14 + 16))(v14, v15, v16);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2000 reason:@"No tiles returned" underlyingError:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __81__GEOGeographicMetadataTileFetcher_fetchMetadataForLocation_responseQueue_block___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if ([v5 hasFileDescriptor])
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28CB0]), "initWithFileDescriptor:closeOnDealloc:", objc_msgSend(v5, "consumeFileDescriptor"), 1);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v14];
    id v7 = *(void **)(a1 + 40);
LABEL_5:
    [v7 setObject:v14 forKey:v6];

    [*(id *)(a1 + 48) addObject:v5];
    goto LABEL_7;
  }
  uint64_t v8 = [v5 fileURL];

  if (v8)
  {
    uint64_t v9 = [v5 fileURL];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v14];

    id v10 = *(void **)(a1 + 40);
    id v6 = [v5 fileURL];
    id v7 = v10;
    goto LABEL_5;
  }
  uint64_t v11 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2001 reason:@"Tile is missing a file"];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  double v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

LABEL_7:
}

- (int)tileStyle
{
  return self->_tileStyle;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultItems, 0);
  objc_storeStrong((id *)&self->_tileDatas, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end