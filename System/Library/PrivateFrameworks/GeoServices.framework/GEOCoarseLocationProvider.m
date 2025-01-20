@interface GEOCoarseLocationProvider
- (BOOL)_snapNonMercatorCoordinateIfNecessary:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
- (GEOCoarseLocationProvider)init;
- (void)_fetchBasicCoarseEquivalentForLocation:(id)a3 fallbackIsPermanent:(BOOL)a4 addLocationNoise:(BOOL)a5 callbackQueue:(id)a6 callback:(id)a7;
- (void)_fetchCoarseEquivalentForLocation:(id)a3 addLocationNoise:(BOOL)a4 callbackQueue:(id)a5 callback:(id)a6;
- (void)_fetchRepresentativePointFromData:(void *)a3 tileKey:(uint64_t)a4 location:(void *)a5 addLocationNoise:(uint64_t)a6 callbackQueue:(void *)a7 callback:(void *)a8;
- (void)fetchCoarseEquivalentForLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
- (void)fetchConsistentCoarseEquivalentForLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5;
@end

@implementation GEOCoarseLocationProvider

- (GEOCoarseLocationProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCoarseLocationProvider;
  v2 = [(GEOCoarseLocationProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = MEMORY[0x18C11FE60]("com.apple.GeoServices.CoarseLocation");
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)_snapNonMercatorCoordinateIfNecessary:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = a4;
  id v9 = a5;
  double v10 = GEOCoordinate2DForMapPoint(0.0, 0.0);
  double v12 = v11;
  double v13 = GEOCoordinate2DForMapPoint(268435456.0, 268435456.0);
  double v15 = v14;
  [v7 coordinate];
  if (v16 >= v10)
  {
    double v18 = 90.0;
    double v19 = 90.0;
    double v20 = v10;
    double v21 = v12;
  }
  else
  {
    if (v16 > v13)
    {
      BOOL v17 = 0;
      goto LABEL_9;
    }
    double v18 = -90.0;
    double v19 = -90.0;
    double v20 = v13;
    double v21 = v15;
  }
  double v22 = GEOCalculateDistanceRadius(v19, 0.0, v20, v21, 6367000.0);
  v23 = (void *)[v7 copy];
  [v23 clearSensitiveFieldsForCoarseLocation];
  v24 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v18, 0.0);
  [v23 setLatLng:v24];

  [v23 setHorizontalAccuracy:v22];
  v25 = [v23 latLng];
  [v25 coordinate];
  v35[0] = v26;
  v35[1] = v27;

  v28 = GEOGetCoarseLocationLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218755;
    double v37 = v13;
    __int16 v38 = 2048;
    double v39 = v10;
    __int16 v40 = 1040;
    int v41 = 16;
    __int16 v42 = 2097;
    v43 = v35;
    _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_INFO, "Location is outside of the Mercator projection's bounds (%.2f -> %.2f). Snapping to nearest pole (%{private,geo:coordinate}.*P)", buf, 0x26u);
  }

  v29 = objc_alloc_init(GEOCoarseLocationMetadata);
  BOOL v17 = 1;
  [(GEOCoarseLocationMetadata *)v29 setType:1];
  [v23 setCoarseMetadata:v29];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __90__GEOCoarseLocationProvider__snapNonMercatorCoordinateIfNecessary_callbackQueue_callback___block_invoke;
  v32[3] = &unk_1E53D7C50;
  id v33 = v23;
  id v34 = v9;
  id v30 = v23;
  dispatch_async(v8, v32);

LABEL_9:
  return v17;
}

uint64_t __90__GEOCoarseLocationProvider__snapNonMercatorCoordinateIfNecessary_callbackQueue_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 3);
}

- (void)fetchCoarseEquivalentForLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
}

- (void)_fetchCoarseEquivalentForLocation:(id)a3 addLocationNoise:(BOOL)a4 callbackQueue:(id)a5 callback:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [v10 coordinate];
  v25[0] = v13;
  v25[1] = v14;
  double v15 = GEOGetCoarseLocationLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68157955;
    int v27 = 16;
    __int16 v28 = 2097;
    v29 = v25;
    _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "Fetching coarse location for coordinate %{private,geo:coordinate}.*P", buf, 0x12u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__GEOCoarseLocationProvider__fetchCoarseEquivalentForLocation_addLocationNoise_callbackQueue_callback___block_invoke;
  block[3] = &unk_1E53E8858;
  block[4] = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  BOOL v24 = a4;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(workQueue, block);
}

void __103__GEOCoarseLocationProvider__fetchCoarseEquivalentForLocation_addLocationNoise_callbackQueue_callback___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) _snapNonMercatorCoordinateIfNecessary:*(void *)(a1 + 40) callbackQueue:*(void *)(a1 + 48) callback:*(void *)(a1 + 56)] & 1) == 0)
  {
    v2 = +[GEOResourceManifestManager modernManager];
    uint64_t v3 = [v2 activeTileGroup];
    v4 = [v3 activeTileSetForTileType:65 scale:0];

    if (v4)
    {
      [*(id *)(a1 + 40) coordinate];
      char v7 = objc_msgSend(v4, "maximumZoomLevelForMapPoint:", GEOTilePointForCoordinate(v5, v6, 20.0));
      [*(id *)(a1 + 40) coordinate];
      *(void *)buf = GEOGloriaQuadIDTileKeyMakeWithCoordinate(v7, v10, v11, 65, v8, v9);
      *(void *)&buf[8] = v12;
      uint64_t v13 = GEOTileLoaderClientIdentifier(*(void **)(a1 + 32));
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(v14 + 16);
      if (!v15)
      {
        double v16 = +[GEOTileLoader modernLoader];
        [v16 openForClient:v13];

        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(v14 + 16);
      }
      *(void *)(v14 + 16) = v15 + 1;
      id v17 = +[GEOTileLoader modernLoader];
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v19 = *(void *)(v18 + 8);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __103__GEOCoarseLocationProvider__fetchCoarseEquivalentForLocation_addLocationNoise_callbackQueue_callback___block_invoke_7;
      v22[3] = &unk_1E53E8830;
      v22[4] = v18;
      id v23 = v13;
      id v24 = *(id *)(a1 + 40);
      char v27 = *(unsigned char *)(a1 + 64);
      id v25 = *(id *)(a1 + 48);
      id v26 = *(id *)(a1 + 56);
      long long v28 = *(_OWORD *)buf;
      id v20 = v13;
      [v17 loadKey:buf priority:0x3FFFFFFFLL forClient:v20 options:3 reason:4 callbackQ:v19 beginNetwork:0 callback:v22];
    }
    else
    {
      id v21 = GEOGetCoarseLocationLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_INFO, "No matching tileset exists. Falling back to base algorithm", buf, 2u);
      }

      [*(id *)(a1 + 32) _fetchBasicCoarseEquivalentForLocation:*(void *)(a1 + 40) fallbackIsPermanent:1 addLocationNoise:*(unsigned __int8 *)(a1 + 64) callbackQueue:*(void *)(a1 + 48) callback:*(void *)(a1 + 56)];
    }
  }
}

void __103__GEOCoarseLocationProvider__fetchCoarseEquivalentForLocation_addLocationNoise_callbackQueue_callback___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void *)(v12 + 16);
  if (v13
    || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)
    && (*(_WORD *)v29 = 0,
        _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _inFlightTileLoadsCount > 0", v29, 2u), uint64_t v12 = *(void *)(a1 + 32), (v13 = *(void *)(v12 + 16)) != 0))
  {
    *(void *)(v12 + 16) = v13 - 1;
    if (!*(void *)(*(void *)(a1 + 32) + 16))
    {
      uint64_t v14 = +[GEOTileLoader modernLoader];
      [v14 closeForClient:*(void *)(a1 + 40)];
    }
  }
  if (v10)
  {
    uint64_t v15 = GEOGetCoarseLocationLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_ERROR, "Failed to load tile data. Falling back to base algorithm", buf, 2u);
    }

    double v16 = [v10 domain];
    id v17 = GEOErrorDomain();
    if ([v16 isEqualToString:v17]) {
      BOOL v18 = [v10 code] == -5;
    }
    else {
      BOOL v18 = 0;
    }

    id v20 = *(void **)(a1 + 32);
    uint64_t v21 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 56);
    uint64_t v24 = *(void *)(a1 + 64);
    uint64_t v25 = v18;
LABEL_13:
    [v20 _fetchBasicCoarseEquivalentForLocation:v22 fallbackIsPermanent:v25 addLocationNoise:v21 callbackQueue:v23 callback:v24];
    goto LABEL_14;
  }
  uint64_t v19 = [v9 fileURL];

  if (!v19)
  {
    id v26 = GEOGetCoarseLocationLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v27 = 0;
      _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_ERROR, "Received tile with no corresponding file URL. Falling back to base algorithm", v27, 2u);
    }

    id v20 = *(void **)(a1 + 32);
    uint64_t v21 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 56);
    uint64_t v24 = *(void *)(a1 + 64);
    uint64_t v25 = 1;
    goto LABEL_13;
  }
  [*(id *)(a1 + 32) _fetchRepresentativePointFromData:v9 tileKey:a1 + 73 location:*(void *)(a1 + 48) addLocationNoise:*(unsigned __int8 *)(a1 + 72) callbackQueue:*(void *)(a1 + 56) callback:*(void *)(a1 + 64)];
LABEL_14:
}

- (void)_fetchRepresentativePointFromData:(void *)a3 tileKey:(uint64_t)a4 location:(void *)a5 addLocationNoise:(uint64_t)a6 callbackQueue:(void *)a7 callback:(void *)a8
{
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a3;
  BOOL v18 = [GEOCoarseLocationData alloc];
  uint64_t v19 = [v17 fileURL];

  id v20 = [(GEOCoarseLocationData *)v18 initWithFileURL:v19 tileKey:a4];
  if (v20)
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke;
    v45[3] = &unk_1E53E8880;
    v46 = v20;
    char v36 = a6;
    char v51 = a6;
    id v21 = v15;
    id v47 = v21;
    id v22 = v16;
    id v50 = v22;
    v48 = a1;
    id v23 = v14;
    id v49 = v23;
    uint64_t v24 = (void (**)(void, void))MEMORY[0x18C120660](v45);
    if ([v23 referenceFrame] == 1
      && ([v23 coordinate],
          +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:")))
    {
      if (!a1[3])
      {
        uint64_t v25 = objc_alloc_init(GEOLocationShifter);
        id v26 = (void *)a1[3];
        a1[3] = v25;
      }
      char v27 = GEOGetCoarseLocationLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_DEBUG, "Location requires shift", buf, 2u);
      }

      v35 = (void *)a1[3];
      [v23 coordinate];
      double v29 = v28;
      double v31 = v30;
      [v23 horizontalAccuracy];
      double v33 = v32;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_12;
      v42[3] = &unk_1E53E88A8;
      id v43 = v23;
      uint64_t v44 = v24;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_14;
      v37[3] = &unk_1E53E88D0;
      v37[4] = a1;
      id v38 = v43;
      char v41 = v36;
      id v39 = v21;
      id v40 = v22;
      objc_msgSend(v35, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v42, 0, v37, a1[1], v29, v31, v33);
    }
    else
    {
      ((void (**)(void, id))v24)[2](v24, v23);
    }
  }
  else
  {
    id v34 = GEOGetCoarseLocationLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v34, OS_LOG_TYPE_ERROR, "Failed to decode tile data. Falling back to base algorithm", buf, 2u);
    }

    [a1 _fetchBasicCoarseEquivalentForLocation:v14 fallbackIsPermanent:1 addLocationNoise:a6 callbackQueue:v15 callback:v16];
  }
}

void __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) snappedLocationForLocation:a2 addLocationNoise:*(unsigned __int8 *)(a1 + 72)];
  if (v3)
  {
    v4 = *(NSObject **)(a1 + 40);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_2;
    v5[3] = &unk_1E53D7C50;
    id v7 = *(id *)(a1 + 64);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
  else
  {
    [*(id *)(a1 + 48) _fetchBasicCoarseEquivalentForLocation:*(void *)(a1 + 56) fallbackIsPermanent:1 addLocationNoise:*(unsigned __int8 *)(a1 + 72) callbackQueue:*(void *)(a1 + 40) callback:*(void *)(a1 + 64)];
  }
}

uint64_t __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
}

void __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_12(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v8 = GEOGetCoarseLocationLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "Successfully shifted location", v12, 2u);
  }

  id v9 = (void *)[*(id *)(a1 + 32) copy];
  id v10 = [v9 latLng];
  [v10 setLat:a2];

  id v11 = [v9 latLng];
  [v11 setLng:a3];

  [v9 setHorizontalAccuracy:a4];
  [v9 setReferenceFrame:2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __120__GEOCoarseLocationProvider__fetchRepresentativePointFromData_tileKey_location_addLocationNoise_callbackQueue_callback___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = GEOGetCoarseLocationLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "Failed to shift location: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _fetchBasicCoarseEquivalentForLocation:*(void *)(a1 + 40) fallbackIsPermanent:1 addLocationNoise:*(unsigned __int8 *)(a1 + 64) callbackQueue:*(void *)(a1 + 48) callback:*(void *)(a1 + 56)];
}

- (void)_fetchBasicCoarseEquivalentForLocation:(id)a3 fallbackIsPermanent:(BOOL)a4 addLocationNoise:(BOOL)a5 callbackQueue:(id)a6 callback:(id)a7
{
  BOOL v9 = a5;
  *(void *)&v68[5] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  int v13 = GeoServicesConfig_CoarseLocationGridZoomLevel;
  id v14 = off_1E91148D8;
  id v15 = a6;
  uint64_t UInteger = GEOConfigGetUInteger(v13, (uint64_t)v14);
  id v17 = GEOGetCoarseLocationLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    *(void *)v68 = UInteger;
    _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, "Falling back to grid-snapped location (grid at z=%{public}llu)", buf, 0xCu);
  }

  BOOL v18 = (void *)[v11 copy];
  [v18 clearSensitiveFieldsForCoarseLocation];
  [v11 coordinate];
  double v21 = (double)(1 << UInteger) * 0.0000000037252903;
  unint64_t v22 = vcvtmd_u64_f64(v21 * GEOTilePointForCoordinate(v19, v20, 20.0));
  unint64_t v24 = vcvtmd_u64_f64(v21 * v23);
  [v11 coordinate];
  double v26 = v25;
  [v11 coordinate];
  if (v26 >= 0.0) {
    double v28 = v27;
  }
  else {
    double v28 = -v27;
  }
  BOOL v34 = v28 < GEOConfigGetDouble(GeoServicesConfig_CoarseLocationGridMergeLatitudeThreshold, (uint64_t)off_1E9114918);
  double v29 = 1.0;
  if (!v34)
  {
    objc_msgSend(v11, "coordinate", 1.0);
    double v31 = v30;
    [v11 coordinate];
    if (v31 >= 0.0) {
      double v33 = v32;
    }
    else {
      double v33 = -v32;
    }
    BOOL v34 = v33 < GEOConfigGetDouble(GeoServicesConfig_CoarseLocationGridMergeLatitudeExtremeThreshold, (uint64_t)off_1E9114928);
    double v29 = 4.0;
    if (v34) {
      double v29 = 2.0;
    }
    if (v34) {
      v22 &= ~1uLL;
    }
    else {
      v22 &= 0xFFFFFFFFFFFFFFFCLL;
    }
  }
  double v35 = (double)v22 / v21;
  double v36 = v29 / v21;
  double v37 = 1.0 / v21;
  double v38 = v29 / v21 * 0.5 + v35;
  double v39 = 1.0 / v21 * 0.5;
  double v40 = (double)v24 / v21;
  double v41 = GEOCoordinate2DForMapPoint(v38, v39 + v40);
  double v43 = v42;
  double v44 = v36 + v35;
  double v45 = v37 + v40;
  double v46 = GEOCoordinate2DForMapPoint(v35, v40);
  double v48 = v47;
  double v49 = GEOCoordinate2DForMapPoint(v44, v45);
  long double v51 = GEOCalculateDistanceRadius(v46, v48, v49, v50, 6367000.0) * 0.5;
  v52 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v41, v43);
  [v18 setLatLng:v52];

  [v18 setHorizontalAccuracy:(double)v51];
  if (v9
    && GEOConfigGetBOOL(GeoServicesConfig_CoarseLocationRandomizeGridSnappedLocations, (uint64_t)off_1E9114908))
  {
    uint64_t v53 = GEOConfigGetUInteger(GeoServicesConfig_CoarseLocationRepresentativePointRandomizationDistance, (uint64_t)off_1E91148E8);
    v54 = GEOGetCoarseLocationLog();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)v68 = v53;
      _os_log_impl(&dword_188D96000, v54, OS_LOG_TYPE_INFO, "Applying randomization <= %{public}llu meters", buf, 0xCu);
    }

    [v18 applyCoarseLocationRandomizationWithMaximumDistance:(double)(unint64_t)v53];
  }
  v55 = [v18 latLng];
  [v55 coordinate];
  v66[0] = v56;
  v66[1] = v57;

  v58 = GEOGetCoarseLocationLog();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68157955;
    v68[0] = 16;
    LOWORD(v68[1]) = 2097;
    *(void *)((char *)&v68[1] + 2) = v66;
    _os_log_impl(&dword_188D96000, v58, OS_LOG_TYPE_INFO, "Returning grid-snapped fallback location (%{private,geo:coordinate}.*P)", buf, 0x12u);
  }

  v59 = objc_alloc_init(GEOCoarseLocationMetadata);
  [(GEOCoarseLocationMetadata *)v59 setType:1];
  [v18 setCoarseMetadata:v59];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__GEOCoarseLocationProvider__fetchBasicCoarseEquivalentForLocation_fallbackIsPermanent_addLocationNoise_callbackQueue_callback___block_invoke;
  block[3] = &unk_1E53D94A0;
  id v63 = v18;
  id v64 = v12;
  BOOL v65 = a4;
  id v60 = v18;
  id v61 = v12;
  dispatch_async(v15, block);
}

uint64_t __128__GEOCoarseLocationProvider__fetchBasicCoarseEquivalentForLocation_fallbackIsPermanent_addLocationNoise_callbackQueue_callback___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v1 = 3;
  }
  else {
    uint64_t v1 = 2;
  }
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)fetchConsistentCoarseEquivalentForLocation:(id)a3 callbackQueue:(id)a4 callback:(id)a5
{
}

@end