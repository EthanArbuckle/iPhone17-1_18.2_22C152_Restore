@interface GEOSPRMetroAvailabilityFetcher
- (GEOSPRMetroAvailabilityFetcher)init;
- (GEOSPRMetroAvailabilityFetcher)initWithTileLoader:(id)a3 auditToken:(id)a4;
- (GEOSPRMetroAvailabilityFetcher)initWithTileLoader:(id)a3 auditToken:(id)a4 forceDisableMetros:(BOOL)a5;
- (uint64_t)_determineAvailabilityForCoordinate:(uint64_t)a3 fromMetadataTile:(double)a4 metadataTileKey:(double)a5;
- (void)determineAvailabilityForCoordinate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5;
@end

@implementation GEOSPRMetroAvailabilityFetcher

- (GEOSPRMetroAvailabilityFetcher)init
{
  return [(GEOSPRMetroAvailabilityFetcher *)self initWithTileLoader:0 auditToken:0];
}

- (GEOSPRMetroAvailabilityFetcher)initWithTileLoader:(id)a3 auditToken:(id)a4
{
  return [(GEOSPRMetroAvailabilityFetcher *)self initWithTileLoader:a3 auditToken:a4 forceDisableMetros:0];
}

- (GEOSPRMetroAvailabilityFetcher)initWithTileLoader:(id)a3 auditToken:(id)a4 forceDisableMetros:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOSPRMetroAvailabilityFetcher;
  v10 = [(GEOSPRMetroAvailabilityFetcher *)&v17 init];
  if (v10)
  {
    if (v8)
    {
      v11 = (GEOTileLoader *)v8;
    }
    else
    {
      v11 = +[GEOTileLoader modernLoader];
    }
    tileLoader = v10->_tileLoader;
    v10->_tileLoader = v11;

    objc_storeStrong((id *)&v10->_auditToken, a4);
    uint64_t v13 = geo_isolater_create();
    isolation = v10->_isolation;
    v10->_isolation = (geo_isolater *)v13;

    v10->_forceDisableMetros = a5;
    v15 = v10;
  }

  return v10;
}

- (void)determineAvailabilityForCoordinate:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v11 = +[GEOPlatform sharedPlatform];
  if (![v11 supportsAdvancedMap])
  {

    goto LABEL_11;
  }
  BOOL forceDisableMetros = self->_forceDisableMetros;

  if (forceDisableMetros)
  {
LABEL_11:
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke;
    v38[3] = &unk_1E53DDD88;
    id v39 = v10;
    dispatch_async(v9, v38);
    v15 = v39;
    goto LABEL_12;
  }
  uint64_t v13 = +[GEOResourceManifestManager modernManager];
  v14 = [v13 activeTileGroup];
  v15 = [v14 activeTileSetForStyle:61 size:2 scale:0];

  if (v15 && [v15 availableTilesCount])
  {
    double v16 = GEOTilePointForCoordinate(var0, var1, 20.0);
    double v18 = v17;
    char v19 = objc_msgSend(v15, "maximumZoomLevelForMapPoint:");
    char v20 = [v15 size];
    uint64_t v21 = [v15 scale];
    unsigned int v22 = [v15 style];
    double v23 = (double)(1 << v19) * 0.0000000037252903;
    unint64_t v24 = vcvtmd_u64_f64(v16 * v23) | 0x3E30000000000000;
    *(void *)((char *)&v53 + 1) = (v24 << 46) | ((unint64_t)(v19 & 0x3F) << 40);
    LOBYTE(v53) = 2;
    *((void *)&v26 + 1) = ((unint64_t)(vcvtmd_u64_f64(v18 * v23) & 0x3FFFFFF) << 8) | (v24 >> 18) | ((unint64_t)(v22 & 0x3FFF) << 34) | ((unint64_t)(v20 & 0xF) << 48) | (v21 << 52);
    *(void *)&long long v26 = v24 << 46;
    uint64_t v25 = v26 >> 56;
    if (v22 <= 0x19 && ((1 << v22) & 0x200101C) != 0) {
      unint64_t v27 = 128;
    }
    else {
      unint64_t v27 = (unint64_t)(v22 == 26) << 7;
    }
    *(void *)&long long v58 = v27 | v53 & 0xFFFFFFFFFFFFFF7FLL;
    *((void *)&v58 + 1) = v25;
    *(void *)&long long v53 = 0;
    *((void *)&v53 + 1) = &v53;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__61;
    v56 = __Block_byref_object_dispose__61;
    id v57 = 0;
    uint64_t v46 = MEMORY[0x1E4F143A8];
    uint64_t v47 = 3221225472;
    v48 = __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_4;
    v49 = &unk_1E53DDBF8;
    long long v52 = v58;
    v50 = self;
    v51 = &v53;
    geo_isolate_sync_data();
    if (*(void *)(*((void *)&v53 + 1) + 40))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_2_5;
      block[3] = &unk_1E53E7488;
      double v43 = var0;
      double v44 = var1;
      block[4] = self;
      v42 = &v53;
      long long v45 = v58;
      id v41 = v10;
      dispatch_async(v9, block);
    }
    else
    {
      v28 = [MEMORY[0x1E4F29128] UUID];
      v29 = GEOTileLoaderClientIdentifier(v28);

      auditToken = self->_auditToken;
      tileLoader = self->_tileLoader;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_3;
      v32[3] = &unk_1E53E74D8;
      v32[4] = self;
      id v33 = v10;
      double v34 = var0;
      double v35 = var1;
      [(GEOTileLoader *)tileLoader loadKey:&v58 priority:2147483646 forClient:v29 options:3 reason:4 auditToken:auditToken callbackQ:v9 beginNetwork:0 callback:v32];
    }
    _Block_object_dispose(&v53, 8);
  }
  else
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_2;
    v36[3] = &unk_1E53DDD88;
    id v37 = v10;
    dispatch_async(v9, v36);
  }
LABEL_12:
}

uint64_t __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_4(void *a1)
{
  v1 = (void *)a1[4];
  v2 = (void *)v1[7];
  if (v2)
  {
    uint64_t v4 = v1[5];
    uint64_t v3 = v1[6];
    if (v4 == a1[6] && v3 == a1[7]) {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v2);
    }
  }
}

uint64_t __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_2_5(uint64_t a1)
{
  [(GEOSPRMetroAvailabilityFetcher *)*(void *)(a1 + 32) _determineAvailabilityForCoordinate:a1 + 72 fromMetadataTile:*(double *)(a1 + 56) metadataTileKey:*(double *)(a1 + 64)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (uint64_t)_determineAvailabilityForCoordinate:(uint64_t)a3 fromMetadataTile:(double)a4 metadataTileKey:(double)a5
{
  id v9 = a2;
  id v10 = v9;
  if (!a1) {
    goto LABEL_15;
  }
  uint64_t v11 = [v9 daVinciMetaData];
  uint64_t v12 = v11;
  if (!v11 || !*(_WORD *)(v11 + 8)) {
    goto LABEL_15;
  }
  double v13 = GEOTilePointForCoordinate(a4, a5, 20.0);
  double v15 = v14;
  double v16 = GEOMapRectForGEOTileKey(a3);
  uint64_t v20 = 0;
  if (fabs(v16) != INFINITY && fabs(v17) != INFINITY && v13 >= v16 && v13 < v16 + v18 && v15 >= v17 && v15 < v17 + v19)
  {
    uint64_t v21 = *(unsigned __int16 *)(v12 + 8);
    unint64_t v22 = vcvtmd_u64_f64((v13 - v16) / v18 * (double)v21)
        + vcvtmd_u64_f64((v15 - v17) / v19 * (double)v21) * v21;
    if (v22 < (v21 * v21))
    {
      uint64_t v20 = (*(unsigned __int8 *)(*(void *)(v12 + 24) + v22) >> 1) & 1;
      goto LABEL_12;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)unint64_t v24 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: cellIndex < metadata->size * metadata->size", v24, 2u);
    }
LABEL_15:
    uint64_t v20 = 0;
  }
LABEL_12:

  return v20;
}

void __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v10 = [v8 decodedRepresentation];
    if (v10) {
      goto LABEL_4;
    }
    id v17 = 0;
    double v15 = [v8 readDataWithError:&v17];
    uint64_t v11 = (GEOVectorTile *)v17;
    if (!v15)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_5;
    }
    id v10 = [[GEOVectorTile alloc] initWithVMP4:v15 localizationData:0 tileKey:a2];

    if (v10)
    {
LABEL_4:
      uint64_t v11 = v10;
      geo_isolate_sync_data();
      uint64_t v12 = [(GEOSPRMetroAvailabilityFetcher *)*(void *)(a1 + 32) _determineAvailabilityForCoordinate:a2 fromMetadataTile:*(double *)(a1 + 48) metadataTileKey:*(double *)(a1 + 56)];
      (*(void (**)(void, uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v12, 0, v13, v14);
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v11 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Missing metadata tile"];
      (*(void (**)(uint64_t, void, GEOVectorTile *))(v16 + 16))(v16, 0, v11);
    }
LABEL_5:

    goto LABEL_6;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_6:
}

void __101__GEOSPRMetroAvailabilityFetcher_determineAvailabilityForCoordinate_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  *(_OWORD *)(*(void *)(a1 + 32) + 40) = *(_OWORD *)*(void *)(a1 + 48);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLoadedTile, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);

  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end