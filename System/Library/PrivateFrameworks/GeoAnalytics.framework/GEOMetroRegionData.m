@interface GEOMetroRegionData
- (GEOMetroRegionData)init;
- (GEOMetroRegionData)initWithFileURL:(id)a3;
- (id)metroNameForLocation:(id)a3;
@end

@implementation GEOMetroRegionData

- (GEOMetroRegionData)init
{
  result = (GEOMetroRegionData *)[MEMORY[0x263EFF940] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOMetroRegionData)initWithFileURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMetroRegionData;
  v5 = [(GEOMetroRegionData *)&v13 init];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = objc_alloc(MEMORY[0x263F417A0]);
  uint64_t v7 = objc_opt_class();
  v8 = GEOGetMetroRegionLog();
  uint64_t v9 = [v6 initWithFileURL:v4 rootQuadKey:0 metadataClass:0 dataClass:v7 log:v8];
  db = v5->_db;
  v5->_db = (GEOGloriaDB *)v9;

  if (v5->_db) {
    v11 = v5;
  }
  else {
LABEL_4:
  }
    v11 = 0;

  return v11;
}

- (id)metroNameForLocation:(id)a3
{
  id v4 = a3;
  [v4 coordinate];
  uint64_t v6 = v5;
  [v4 coordinate];
  uint64_t v8 = v7;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x4012000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = &unk_24FF0C7D9;
  [v4 coordinate];
  *(void *)buf = v9;
  uint64_t v34 = v10;
  [v4 coordinate];
  uint64_t v31 = v11;
  uint64_t v32 = v12;
  gloria::TileId::FromLatLng((gloria::TileId *)buf, (double *)&v32, &metroTileZoom, v13);
  uint64_t v41 = v14;
  uint64_t v42 = v15;
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v17 = v36[6] | gloria::LEADING_BITS_VALUE_LUT[*((unsigned __int8 *)v36 + 56)];
  db = self->_db;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __43__GEOMetroRegionData_metroNameForLocation___block_invoke;
  v26 = &unk_2653458D0;
  v28 = &v35;
  uint64_t v29 = v6;
  uint64_t v30 = v8;
  id v19 = v16;
  id v27 = v19;
  if ([(GEOGloriaDB *)db unsafeDataForQuadKey:v17 result:&v23])
  {
    if ((unint64_t)objc_msgSend(v19, "count", v23, v24, v25, v26) <= 1)
    {
      v20 = [v19 firstObject];
      goto LABEL_9;
    }
    v21 = [v19 sortedArrayUsingComparator:&__block_literal_global_9];
    v20 = [v21 firstObject];
  }
  else
  {
    v21 = GEOGetMetroRegionLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24FE56000, v21, OS_LOG_TYPE_INFO, "Did not find matching polygon in underlying data", buf, 2u);
    }
    v20 = 0;
  }

LABEL_9:
  _Block_object_dispose(&v35, 8);

  return v20;
}

BOOL __43__GEOMetroRegionData_metroNameForLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = gloria::TileId::ToBBOX((gloria::TileId *)(*(void *)(*(void *)(a1 + 40) + 8) + 48));
  uint64_t v25 = v5;
  double v26 = v4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v3 territorys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    int64x2_t v17 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    int64x2_t v18 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasPolygon", *(_OWORD *)&v17, *(_OWORD *)&v18, *(_OWORD *)&v19, *(_OWORD *)&v20))
        {
          int64x2_t v19 = v18;
          int64x2_t v20 = v17;
          if (!GEOCoarseLocationTerritoryInfoContainsPoint()) {
            continue;
          }
        }
        else
        {
          uint64_t v11 = [v10 regionNameStr];
          BOOL v12 = v11 == 0;

          if (v12) {
            continue;
          }
        }
        objc_super v13 = *(void **)(a1 + 32);
        uint64_t v14 = [v10 regionNameStr];
        [v13 addObject:v14];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }

  BOOL v15 = [*(id *)(a1 + 32) count] != 0;
  return v15;
}

uint64_t __43__GEOMetroRegionData_metroNameForLocation___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void).cxx_destruct
{
}

@end