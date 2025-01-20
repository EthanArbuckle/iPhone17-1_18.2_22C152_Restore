@interface GEOPOIBusynessHelper
+ (BOOL)_checkAvailablePOIForLocation:(id)a3 radius:(int)a4 minZoom:(unsigned __int8)a5 maxZoom:(unsigned __int8)a6 tiles:(id)a7 error:(id *)a8;
+ (id)_generateDPPOIBusynessForCoordinate:(id)a3 tileId:(unint64_t)a4 dpBusynessTileURL:(id)a5 dayOfWeek:(unsigned int)a6 hourOfDay:(unsigned int)a7 radii:(id)a8 minZoom:(unsigned __int8)a9 maxZoom:(unsigned __int8)a10 tileIds:(id)a11 error:(id *)a12;
+ (id)_generateDPPOIBusynessForLocation:(id)a3 radii:(id)a4 minZoom:(unsigned __int8)a5 maxZoom:(unsigned __int8)a6 dpBusynessTiles:(id)a7 error:(id *)a8;
+ (id)dpClientVersionHashWithMCPOIBusynessVersion:(id)a3;
+ (void)checkIsEnabledForLocation:(id)a3 radius:(int)a4 workQueue:(id)a5 result:(id)a6;
+ (void)generateDPPOIBusynessForLocation:(id)a3 radii:(id)a4 workQueue:(id)a5 result:(id)a6;
- (GEOPOIBusynessHelper)init;
@end

@implementation GEOPOIBusynessHelper

- (GEOPOIBusynessHelper)init
{
  result = (GEOPOIBusynessHelper *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

+ (void)checkIsEnabledForLocation:(id)a3 radius:(int)a4 workQueue:(id)a5 result:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  v13 = (void *)[v10 copy];
  [v13 setHorizontalAccuracy:(double)a4];
  [v13 coordinate];
  double v15 = v14;
  double v17 = v16;
  v18 = +[GEOResourceManifestManager modernManager];
  v19 = [v18 activeTileGroup];
  v20 = [v19 activeTileSetForStyle:74];

  if (v20)
  {
    double v21 = GEOMapPointForCoordinate(v15, v17);
    double v23 = v22;
    unsigned __int8 v24 = objc_msgSend(v20, "minimumZoomLevelForMapPoint:");
    unsigned __int8 v25 = objc_msgSend(v20, "maximumZoomLevelForMapPoint:", v21, v23);
    unsigned __int8 v26 = v25;
    uint64_t v27 = v24;
    if (v24 >= v25)
    {
      int v31 = v25;
      v32 = (void *)MEMORY[0x1E4F28C58];
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"Nonsense zooms. min: %d max: %d", v27, v25);
      v34 = [v32 GEOErrorWithCode:-2006 reason:v33];

      v35 = GEOGetPOIBusynessLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v27;
        LOWORD(v45) = 1024;
        *(_DWORD *)((char *)&v45 + 2) = v31;
        _os_log_impl(&dword_188D96000, v35, OS_LOG_TYPE_FAULT, "Invalid zooms for tile style POI_BUSYNESS. min: %d max: %d", buf, 0xEu);
      }

      v12[2](v12, 0, v34);
    }
    else
    {
      *(void *)buf = 0;
      v45 = buf;
      uint64_t v46 = 0x3032000000;
      v47 = __Block_byref_object_copy__81;
      v48 = __Block_byref_object_dispose__81;
      id v49 = [[GEOGeographicMetadataTileFetcher alloc] initForTileStyle:74 options:7];
      v28 = (void *)*((void *)v45 + 5);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __74__GEOPOIBusynessHelper_checkIsEnabledForLocation_radius_workQueue_result___block_invoke;
      v36[3] = &unk_1E53EBEF8;
      int v41 = a4;
      v38 = v12;
      id v40 = a1;
      unsigned __int8 v42 = v24;
      unsigned __int8 v43 = v26;
      id v37 = v13;
      v39 = buf;
      [v28 fetchMetadataForLocation:v37 responseQueue:v11 block:v36];

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    v29 = GEOGetPOIBusynessLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v29, OS_LOG_TYPE_INFO, "POI_BUSYNESS tile style not defined, will fail.", buf, 2u);
    }

    v30 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-6 reason:@"POI_BUSYNESS tile style not defined."];
    v12[2](v12, 0, v30);
  }
}

void __74__GEOPOIBusynessHelper_checkIsEnabledForLocation_radius_workQueue_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    int v7 = *(_DWORD *)(a1 + 64);
    if (v7 <= 10) {
      int v7 = 10;
    }
    if (v7 >= 250) {
      uint64_t v8 = 250;
    }
    else {
      uint64_t v8 = v7;
    }
    v9 = *(void **)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 68);
    uint64_t v12 = *(unsigned __int8 *)(a1 + 69);
    id v17 = 0;
    [v9 _checkAvailablePOIForLocation:v10 radius:v8 minZoom:v11 maxZoom:v12 tiles:v5 error:&v17];
    id v13 = v17;
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    double v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    double v16 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2000 reason:@"No tiles returned" underlyingError:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (BOOL)_checkAvailablePOIForLocation:(id)a3 radius:(int)a4 minZoom:(unsigned __int8)a5 maxZoom:(unsigned __int8)a6 tiles:(id)a7 error:(id *)a8
{
  int v10 = a6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  [v13 coordinate];
  v19 = GEOGetQuadKeysWithinRadiusFromCoordinate(v10, a4, v15, v16, v17, v18);
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  uint64_t v42 = 0;
  unsigned __int8 v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__81;
  id v40 = __Block_byref_object_dispose__81;
  id v41 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __89__GEOPOIBusynessHelper__checkAvailablePOIForLocation_radius_minZoom_maxZoom_tiles_error___block_invoke;
  v30[3] = &unk_1E53EBF20;
  v32 = &v36;
  id v20 = v19;
  unsigned __int8 v35 = a5;
  id v31 = v20;
  v33 = &v46;
  v34 = &v42;
  [v14 enumerateKeysAndObjectsUsingBlock:v30];
  if (*((unsigned char *)v43 + 24))
  {
    double v21 = GEOGetPOIBusynessLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 67109120;
    int v51 = v10;
    double v22 = "POI found at zoom %d, Analytics allowed";
    double v23 = v21;
    uint32_t v24 = 8;
  }
  else
  {
    double v21 = GEOGetPOIBusynessLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    int v25 = *((_DWORD *)v47 + 6);
    uint64_t v26 = v37[5];
    *(_DWORD *)buf = 67109634;
    int v51 = v25;
    __int16 v52 = 1024;
    int v53 = v10;
    __int16 v54 = 2112;
    uint64_t v55 = v26;
    double v22 = "No POIs found in %d tiles at zoom %d, Analytics disabled. Last error: %@";
    double v23 = v21;
    uint32_t v24 = 24;
  }
  _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_DEBUG, v22, buf, v24);
LABEL_7:

  if (*((unsigned char *)v43 + 24)) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = (void *)v37[5];
  }
  *a8 = v27;
  BOOL v28 = *((unsigned char *)v43 + 24) != 0;

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v28;
}

void __89__GEOPOIBusynessHelper__checkAvailablePOIForLocation_radius_minZoom_maxZoom_tiles_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v9 = [GEOGloriaDB alloc];
  uint64_t v10 = [v7 unsignedLongLongValue];
  uint64_t v11 = GEOGetPOIBusynessLog();
  uint64_t v12 = [(GEOGloriaDB *)v9 initWithFileURL:v8 rootQuadKey:v10 metadataClass:0 dataClass:0 log:v11];

  if (v12)
  {
    double v23 = a4;
    uint64_t v13 = [v7 unsignedLongLongValue];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          unint64_t v19 = [*(id *)(*((void *)&v24 + 1) + 8 * i) unsignedLongLongValue];
          if (GEOQuadKeyAncestorAt(v19, *(unsigned __int8 *)(a1 + 64)) == v13)
          {
            ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
            if ([(GEOGloriaDB *)v12 containsQuadKey:v19])
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
              *double v23 = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2003 reason:@"DB returned nil"];
    uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
    double v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

+ (id)dpClientVersionHashWithMCPOIBusynessVersion:(id)a3
{
  v3 = [NSString stringWithFormat:@"GEO:%@.MC:%@", @"1", a3];
  v4 = [v3 dataUsingEncoding:4];
  id v5 = objc_msgSend(v4, "_geo_MD5Hash");
  id v6 = objc_msgSend(v5, "_geo_hexString");

  return v6;
}

+ (void)generateDPPOIBusynessForLocation:(id)a3 radii:(id)a4 workQueue:(id)a5 result:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id obj = a4;
  id v48 = a5;
  int v49 = (void (**)(id, void, void *))a6;
  v47 = v9;
  int v51 = (void *)[v9 copy];
  uint64_t v10 = +[GEOResourceManifestManager modernManager];
  uint64_t v11 = [v10 activeTileGroup];
  uint64_t v50 = [v11 activeTileSetForStyle:75];

  if (v50)
  {
    [v51 coordinate];
    double v14 = GEOMapPointForCoordinate(v12, v13);
    double v16 = v15;
    unsigned __int8 v17 = objc_msgSend(v50, "minimumZoomLevelForMapPoint:");
    unsigned __int8 v18 = objc_msgSend(v50, "maximumZoomLevelForMapPoint:", v14, v16);
    uint64_t v19 = v17;
    if (v17 >= v18)
    {
      int v32 = v18;
      v33 = (void *)MEMORY[0x1E4F28C58];
      v34 = objc_msgSend(NSString, "stringWithFormat:", @"Nonsense zooms. min: %d max: %d", v19, v18);
      unsigned __int8 v35 = [v33 GEOErrorWithCode:-2006 reason:v34];

      uint64_t v36 = GEOGetPOIBusynessLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v19;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = v32;
        _os_log_impl(&dword_188D96000, v36, OS_LOG_TYPE_FAULT, "Invalid zooms for tile style POI_DP_BUSYNESS. min: %d max: %d", buf, 0xEu);
      }

      v49[2](v49, MEMORY[0x1E4F1CC08], v35);
    }
    else
    {
      unsigned __int8 v44 = v18;
      unsigned __int8 v45 = v17;
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(obj, "count"));
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id obj = obj;
      uint64_t v21 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (v21)
      {
        int v22 = 0;
        uint64_t v23 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v62 != v23) {
              objc_enumerationMutation(obj);
            }
            int v25 = [*(id *)(*((void *)&v61 + 1) + 8 * i) intValue];
            if (v25 <= 10) {
              unsigned int v26 = 10;
            }
            else {
              unsigned int v26 = v25;
            }
            if (v26 >= 0xFA) {
              uint64_t v27 = 250;
            }
            else {
              uint64_t v27 = v26;
            }
            BOOL v28 = [NSNumber numberWithInt:v27];
            [v20 addObject:v28];

            if (v22 <= (int)v27) {
              int v22 = v27;
            }
          }
          uint64_t v21 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
        }
        while (v21);
        double v29 = (double)v22;
      }
      else
      {
        double v29 = 0.0;
      }

      uint64_t v37 = [v20 count];
      if (v37 == [obj count]) {
        goto LABEL_30;
      }
      uint64_t v38 = GEOGetPOIBusynessLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = obj;
        _os_log_impl(&dword_188D96000, v38, OS_LOG_TYPE_ERROR, "Clamped radii (%@) has fewer than the original (%@)", buf, 0x16u);
      }

      if ([v20 count])
      {
LABEL_30:
        v39 = [v20 array];

        [v51 setHorizontalAccuracy:v29];
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v66 = __Block_byref_object_copy__81;
        v67 = __Block_byref_object_dispose__81;
        id v68 = [[GEOGeographicMetadataTileFetcher alloc] initForTileStyle:75 options:7];
        id v40 = *(void **)(*(void *)&buf[8] + 40);
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __80__GEOPOIBusynessHelper_generateDPPOIBusynessForLocation_radii_workQueue_result___block_invoke;
        v53[3] = &unk_1E53EBF48;
        uint64_t v56 = v49;
        id v58 = a1;
        id v54 = v51;
        unsigned __int8 v59 = v45;
        unsigned __int8 v60 = v44;
        id obj = v39;
        id v55 = obj;
        v57 = buf;
        [v40 fetchMetadataForLocation:v54 responseQueue:v48 block:v53];

        _Block_object_dispose(buf, 8);
      }
      else
      {
        id v41 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v42 = [obj componentsJoinedByString:@", "];
        unsigned __int8 v43 = [v41 GEOErrorWithCode:-2007 reason:v42];

        v49[2](v49, MEMORY[0x1E4F1CC08], v43);
      }
    }
  }
  else
  {
    v30 = GEOGetPOIBusynessLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_INFO, "POI_DP_BUSYNESS tile style not defined, will fail.", buf, 2u);
    }

    id v31 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-6 reason:@"POI_DP_BUSYNESS tile style not defined."];
    v49[2](v49, MEMORY[0x1E4F1CC08], v31);
  }
}

void __80__GEOPOIBusynessHelper_generateDPPOIBusynessForLocation_radii_workQueue_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = *(void **)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 73);
    id v17 = 0;
    double v12 = [v7 _generateDPPOIBusynessForLocation:v8 radii:v9 minZoom:v10 maxZoom:v11 dpBusynessTiles:v5 error:&v17];
    id v13 = v17;
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    double v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;

    if (v12) {
      double v16 = v12;
    }
    else {
      double v16 = (void *)MEMORY[0x1E4F1CC08];
    }
    (*(void (**)(void, void *, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v16, v13);
  }
  else
  {
    double v12 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2000 reason:@"No tiles returned" underlyingError:v6];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (id)_generateDPPOIBusynessForLocation:(id)a3 radii:(id)a4 minZoom:(unsigned __int8)a5 maxZoom:(unsigned __int8)a6 dpBusynessTiles:(id)a7 error:(id *)a8
{
  int v9 = a6;
  id v11 = a3;
  id v36 = a4;
  id v12 = a7;
  id v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v39 = v12;
  if (GEOConfigGetBOOL(GeoServicesConfig_POIBusynessDPUseUTC, (uint64_t)off_1E9114C48)) {
    [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  }
  else {
  uint64_t v14 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  }
  [v13 setTimeZone:v14];

  double v15 = (void *)MEMORY[0x1E4F1C9C8];
  [v11 timestamp];
  double v16 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
  id v17 = [v13 components:544 fromDate:v16];
  int v18 = [v17 weekday] - 1;
  LODWORD(v15) = [v17 hour];
  [v11 coordinate];
  double v20 = v19;
  double v22 = v21;
  [v11 horizontalAccuracy];
  unsigned int v26 = GEOGetQuadKeysWithinRadiusFromCoordinate(v9, (int)v23, v24, v25, v20, v22);
  uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v52 = 0;
  int v53 = &v52;
  uint64_t v54 = 0x3032000000;
  id v55 = __Block_byref_object_copy__81;
  uint64_t v56 = __Block_byref_object_dispose__81;
  id v57 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __102__GEOPOIBusynessHelper__generateDPPOIBusynessForLocation_radii_minZoom_maxZoom_dpBusynessTiles_error___block_invoke;
  v40[3] = &unk_1E53EBF70;
  id v45 = a1;
  double v46 = v20;
  double v47 = v22;
  int v48 = v18;
  int v49 = (int)v15;
  id v28 = v36;
  id v41 = v28;
  unsigned __int8 v50 = a5;
  char v51 = v9;
  id v29 = v26;
  id v42 = v29;
  id v30 = v27;
  id v43 = v30;
  unsigned __int8 v44 = &v52;
  [v39 enumerateKeysAndObjectsUsingBlock:v40];
  if ([v30 count]) {
    id v31 = 0;
  }
  else {
    id v31 = (void *)v53[5];
  }
  *a8 = v31;
  int v32 = v43;
  id v33 = v30;

  _Block_object_dispose(&v52, 8);

  return v33;
}

void __102__GEOPOIBusynessHelper__generateDPPOIBusynessForLocation_radii_minZoom_maxZoom_dpBusynessTiles_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 64);
  id v6 = a3;
  uint64_t v7 = [a2 unsignedLongLongValue];
  uint64_t v8 = *(unsigned int *)(a1 + 88);
  uint64_t v9 = *(unsigned int *)(a1 + 92);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 96);
  char v11 = *(unsigned char *)(a1 + 97);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  double v14 = *(double *)(a1 + 72);
  double v15 = *(double *)(a1 + 80);
  id v21 = 0;
  LOBYTE(v20) = v11;
  double v16 = objc_msgSend(v5, "_generateDPPOIBusynessForCoordinate:tileId:dpBusynessTileURL:dayOfWeek:hourOfDay:radii:minZoom:maxZoom:tileIds:error:", v7, v6, v8, v9, v12, v10, v14, v15, v20, v13, &v21);

  id v17 = v21;
  id v18 = v21;
  [*(id *)(a1 + 48) addEntriesFromDictionary:v16];
  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(void *)(v19 + 40)) {
    goto LABEL_4;
  }
  if (![v16 count])
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
LABEL_4:
    objc_storeStrong((id *)(v19 + 40), v17);
  }
}

+ (id)_generateDPPOIBusynessForCoordinate:(id)a3 tileId:(unint64_t)a4 dpBusynessTileURL:(id)a5 dayOfWeek:(unsigned int)a6 hourOfDay:(unsigned int)a7 radii:(id)a8 minZoom:(unsigned __int8)a9 maxZoom:(unsigned __int8)a10 tileIds:(id)a11 error:(id *)a12
{
  unsigned int v12 = a9;
  uint64_t v14 = *(void *)&a7;
  uint64_t v15 = *(void *)&a6;
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v63 = a5;
  id v66 = a8;
  id v62 = a11;
  uint64_t v19 = [GEOGloriaDB alloc];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  double v22 = GEOGetPOIBusynessLog();
  double v23 = [(GEOGloriaDB *)v19 initWithFileURL:v63 rootQuadKey:a4 metadataClass:v20 dataClass:v21 log:v22];

  v71 = v23;
  if (v23)
  {
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x2020000000;
    int v92 = 0;
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __141__GEOPOIBusynessHelper__generateDPPOIBusynessForCoordinate_tileId_dpBusynessTileURL_dayOfWeek_hourOfDay_radii_minZoom_maxZoom_tileIds_error___block_invoke;
    v88[3] = &unk_1E53EBF98;
    v88[4] = &v89;
    if ([(GEOGloriaDB *)v23 unsafeMetadata:v88])
    {
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v62, "count"));
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v25 = v62;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v84 objects:v102 count:16];
      if (v26)
      {
        int v72 = 0;
        uint64_t v27 = *(void *)v85;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v85 != v27) {
              objc_enumerationMutation(v25);
            }
            unint64_t v29 = [*(id *)(*((void *)&v84 + 1) + 8 * i) unsignedLongLongValue];
            if (GEOQuadKeyAncestorAt(v29, v12) == a4)
            {
              id v30 = [(GEOGloriaDB *)v71 dataForQuadKey:v29];
              if (v30) {
                [v24 addObject:v30];
              }

              ++v72;
            }
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v84 objects:v102 count:16];
        }
        while (v26);
      }
      else
      {
        int v72 = 0;
      }

      id v31 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a4);
      v101[0] = v31;
      v101[1] = &stru_1ED51F370;
      int v32 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v15);
      v101[2] = v32;
      id v33 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v14);
      v101[3] = v33;
      v101[4] = &stru_1ED51F370;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:5];
      unsigned __int8 v35 = (void *)[v34 mutableCopy];

      unint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_POIBusynessDPSliceSize, (uint64_t)off_1E9114C38);
      unint64_t v36 = *((unsigned int *)v90 + 6);
      id v75 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id obj = v24;
      uint64_t v37 = [obj countByEnumeratingWithState:&v80 objects:v100 count:16];
      if (v37)
      {
        int v38 = 0;
        uint64_t v60 = v37;
        uint64_t v61 = *(void *)v81;
        unint64_t v73 = v36 / UInteger;
        do
        {
          for (uint64_t j = 0; j != v60; ++j)
          {
            if (*(void *)v81 != v61) {
              objc_enumerationMutation(obj);
            }
            v39 = *(void **)(*((void *)&v80 + 1) + 8 * j);
            if (v39)
            {
              -[GEOBusynessPoiLookupTile _readLatitudeE7s](*(void *)(*((void *)&v80 + 1) + 8 * j));
              uint64_t v69 = v39[2];
              -[GEOBusynessPoiLookupTile _readLongitudeE7s]((uint64_t)v39);
              uint64_t v68 = v39[5];
              -[GEOBusynessPoiLookupTile _readLatitudeE7s]((uint64_t)v39);
              uint64_t v67 = v39[3];
              if (v67)
              {
                v65 = v39;
                uint64_t v40 = 0;
                do
                {
                  uint64_t v70 = v40;
                  double v41 = GEOCalculateDistanceRadius(var0, var1, (double)*(int *)(v69 + 4 * v40) * 0.0000001, (double)*(int *)(v68 + 4 * v40) * 0.0000001, 6367000.0);
                  uint64_t v42 = *((unsigned int *)v65 + 19);
                  long long v78 = 0u;
                  long long v79 = 0u;
                  long long v76 = 0u;
                  long long v77 = 0u;
                  id v43 = v66;
                  uint64_t v44 = [v43 countByEnumeratingWithState:&v76 objects:v99 count:16];
                  if (v44)
                  {
                    unint64_t v45 = (v70 + v42) / UInteger;
                    unint64_t v46 = (v70 + v42) % UInteger;
                    uint64_t v47 = *(void *)v77;
                    do
                    {
                      for (uint64_t k = 0; k != v44; ++k)
                      {
                        if (*(void *)v77 != v47) {
                          objc_enumerationMutation(v43);
                        }
                        int v49 = *(void **)(*((void *)&v76 + 1) + 8 * k);
                        [v49 doubleValue];
                        if (v41 < v50)
                        {
                          char v51 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v49, "intValue"));
                          [v35 setObject:v51 atIndexedSubscript:1];

                          uint64_t v52 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v45);
                          [v35 setObject:v52 atIndexedSubscript:4];

                          int v53 = [v35 componentsJoinedByString:@"."];
                          uint64_t v54 = [v75 objectForKeyedSubscript:v53];
                          if (!v54)
                          {
                            unint64_t v55 = UInteger;
                            if (v45 >= v73) {
                              unint64_t v55 = *((unsigned int *)v90 + 6) % UInteger;
                            }
                            uint64_t v54 = [MEMORY[0x1E4F1CA58] dataWithLength:v55];
                            [v75 setObject:v54 forKeyedSubscript:v53];
                          }
                          id v56 = v54;
                          *(unsigned char *)([v56 mutableBytes] + v46) = 1;

                          ++v38;
                        }
                      }
                      uint64_t v44 = [v43 countByEnumeratingWithState:&v76 objects:v99 count:16];
                    }
                    while (v44);
                  }

                  uint64_t v40 = v70 + 1;
                }
                while (v70 + 1 != v67);
              }
            }
          }
          uint64_t v60 = [obj countByEnumeratingWithState:&v80 objects:v100 count:16];
        }
        while (v60);
      }
      else
      {
        int v38 = 0;
      }

      id v57 = GEOGetPOIBusynessLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67175169;
        int v94 = v38;
        __int16 v95 = 1025;
        int v96 = v72;
        __int16 v97 = 1025;
        int v98 = a10;
        _os_log_impl(&dword_188D96000, v57, OS_LOG_TYPE_DEBUG, "Found %{private}d DP matches in %{private}d tiles at zoom %{private}d", buf, 0x14u);
      }

      *a12 = 0;
    }
    else
    {
      *a12 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2005 reason:@"DB metadata was invalid"];
      id v75 = (id)MEMORY[0x1E4F1CC08];
    }
    _Block_object_dispose(&v89, 8);
  }
  else
  {
    *a12 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2003 reason:@"DB returned nil"];
    id v75 = (id)MEMORY[0x1E4F1CC08];
  }

  return v75;
}

BOOL __141__GEOPOIBusynessHelper__generateDPPOIBusynessForCoordinate_tileId_dpBusynessTileURL_dayOfWeek_hourOfDay_radii_minZoom_maxZoom_tileIds_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    int v2 = *(_DWORD *)(a2 + 24);
  }
  else {
    int v2 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 0;
}

@end