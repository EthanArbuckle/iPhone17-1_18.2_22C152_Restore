@interface GEOCoarseLocationData
- (GEOCoarseLocationData)init;
- (GEOCoarseLocationData)initWithFileURL:(void *)a3 tileKey:(uint64_t)a4;
- (id)snappedLocationForLocation:(id)a3 addLocationNoise:(BOOL)a4;
@end

@implementation GEOCoarseLocationData

- (GEOCoarseLocationData)init
{
  result = (GEOCoarseLocationData *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOCoarseLocationData)initWithFileURL:(void *)a3 tileKey:(uint64_t)a4
{
  id v6 = a3;
  v25.receiver = a1;
  v25.super_class = (Class)GEOCoarseLocationData;
  v7 = [(GEOCoarseLocationData *)&v25 init];
  if (!v7) {
    goto LABEL_11;
  }
  v8 = [GEOGloriaDB alloc];
  uint64_t v9 = *(unsigned __int8 *)(a4 + 11);
  uint64_t v10 = *(unsigned __int16 *)(a4 + 9);
  uint64_t v11 = *(void *)(a4 + 1);
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = GEOGetCoarseLocationLog();
  *((void *)&v15 + 1) = v10 | (v9 << 16);
  *(void *)&long long v15 = v11;
  uint64_t v16 = [(GEOGloriaDB *)v8 initWithFileURL:v6 rootQuadKey:(unint64_t)(v15 >> 6) metadataClass:v12 dataClass:v13 log:v14];
  db = v7->_db;
  v7->_db = (GEOGloriaDB *)v16;

  v18 = v7->_db;
  if (!v18)
  {
    v21 = GEOGetCoarseLocationLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      v22 = "Failed to load DB";
LABEL_9:
      _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, v22, v24, 2u);
    }
LABEL_10:

LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  v19 = [(GEOGloriaDB *)v18 metadata];

  if (!v19)
  {
    v21 = GEOGetCoarseLocationLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      v22 = "Failed to load DB metadata";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v20 = v7;
LABEL_12:

  return v20;
}

- (id)snappedLocationForLocation:(id)a3 addLocationNoise:(BOOL)a4
{
  id v6 = a3;
  [v6 coordinate];
  uint64_t v8 = v7;
  [v6 coordinate];
  uint64_t v10 = v9;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__71;
  v32 = __Block_byref_object_dispose__71;
  id v33 = 0;
  db = self->_db;
  [v6 coordinate];
  double v13 = v12;
  double v15 = v14;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__GEOCoarseLocationData_snappedLocationForLocation_addLocationNoise___block_invoke;
  v22[3] = &unk_1E53E9968;
  uint64_t v25 = v8;
  uint64_t v26 = v10;
  v24 = &v28;
  id v16 = v6;
  id v23 = v16;
  BOOL v27 = a4;
  -[GEOGloriaDB unsafeEnumerateDataAtLocation:radius:visitor:](db, "unsafeEnumerateDataAtLocation:radius:visitor:", v22, v13, v15, 0.0);
  v17 = (void *)v29[5];
  if (!v17)
  {
    v18 = GEOGetCoarseLocationLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_INFO, "Did not find matching polygon in underlying data", v21, 2u);
    }

    v17 = (void *)v29[5];
  }
  id v19 = v17;

  _Block_object_dispose(&v28, 8);

  return v19;
}

void __69__GEOCoarseLocationData_snappedLocationForLocation_addLocationNoise___block_invoke(uint64_t a1, unint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  context = (void *)MEMORY[0x18C1203C0]();
  int v8 = __clz(a2);
  unsigned __int8 v42 = (int)((63 - v8 + (((63 - v8) & 0x80u) >> 7)) << 24) >> 25;
  unint64_t v41 = a2 - gloria::LEADING_BITS_VALUE_LUT[v42];
  double v9 = gloria::TileId::ToBBOX((gloria::TileId *)&v41);
  v40[0] = v10;
  v40[1] = v9;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v30 = v7;
  uint64_t v11 = [v7 territorys];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v37;
    int64x2_t v31 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    int64x2_t v32 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v11);
        }
        double v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v35[0] = v32;
        v35[1] = v31;
        if (GEOCoarseLocationTerritoryInfoContainsPoint(v15, v40, (double *)(a1 + 48), v35))
        {
          objc_msgSend(v15, "representativePoint", context);
          double v33 = v16;
          double v34 = v17;
          v18 = GEOGetCoarseLocationLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 68157955;
            *(_DWORD *)v44 = 16;
            *(_WORD *)&v44[4] = 2097;
            *(void *)&v44[6] = &v33;
            _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_INFO, "Found matching polygon in underlying data. Snapping to representative point (%{private,geo:coordinate}.*P).", buf, 0x12u);
          }

          [v15 maxDistanceMeters];
          double v20 = v19;
          uint64_t v21 = [*(id *)(a1 + 32) copy];
          uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
          id v23 = *(void **)(v22 + 40);
          *(void *)(v22 + 40) = v21;

          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) clearSensitiveFieldsForCoarseLocation];
          v24 = [GEOLatLng alloc];
          uint64_t v25 = -[GEOLatLng initWithCoordinate:](v24, "initWithCoordinate:", v33, v34);
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setLatLng:v25];

          uint64_t v26 = objc_alloc_init(GEOCoarseLocationMetadata);
          [(GEOCoarseLocationMetadata *)v26 setType:2];
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setCoarseMetadata:v26];
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setHorizontalAccuracy:v20];
          if (*(unsigned char *)(a1 + 64)
            && (([v15 shouldRandomize] & 1) != 0
             || GEOConfigGetBOOL(GeoServicesConfig_CoarseLocationAlwaysRandomizeRepresentativePoint, (uint64_t)off_1E91148F8)))
          {
            uint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_CoarseLocationRepresentativePointRandomizationDistance, (uint64_t)off_1E91148E8);
            uint64_t v28 = GEOGetCoarseLocationLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349056;
              *(void *)v44 = UInteger;
              _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_INFO, "Representative point is of poor quality. Applying randomization <= %{public}llu meters", buf, 0xCu);
            }

            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) applyCoarseLocationRandomizationWithMaximumDistance:(double)(unint64_t)UInteger];
          }
          *a4 = 1;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v12);
  }
}

- (void).cxx_destruct
{
}

@end