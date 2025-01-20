@interface GEOSimpleRoutePreloadCamera
- (id)implicateAssetMetadataTilesForCoordinate:(id)a3 size:(double)a4;
- (void)implicateTilesForCoordinate:(id)a3 route:(id)a4 nearestRoutePointIdx:(double)a5 stepNearManeuever:(BOOL)a6 into:(id)a7 stepSize:(double)a8 maneuverSize:(double)a9 tileSetStyles:(id)a10;
@end

@implementation GEOSimpleRoutePreloadCamera

- (void)implicateTilesForCoordinate:(id)a3 route:(id)a4 nearestRoutePointIdx:(double)a5 stepNearManeuever:(BOOL)a6 into:(id)a7 stepSize:(double)a8 maneuverSize:(double)a9 tileSetStyles:(id)a10
{
  BOOL v13 = a6;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v66[2] = *MEMORY[0x1E4F143B8];
  id v16 = a7;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = a10;
  uint64_t v42 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v60;
    if (!v13) {
      a9 = a8;
    }
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v60 != v43) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v59 + 1) + 8 * v44);
        unsigned int v18 = [v17 integerValue];
        v51 = [obj objectForKey:v17];
        long double v19 = exp2(15.0 - (double)v18);
        long double v20 = GEOMapRectMakeWithRadialDistance(var0, var1, a9 * v19);
        double v23 = (double)(1 << v18) * 0.0000000037252903;
        unint64_t v48 = vcvtmd_u64_f64(v23 * v20) | 0x3E30000000000000;
        unsigned int v46 = vcvtmd_u64_f64(v23 * (v20 + v24));
        if (v48 <= v46)
        {
          unsigned int v47 = vcvtmd_u64_f64(v23 * v21);
          unsigned int v52 = vcvtmd_u64_f64(v23 * (v21 + v22));
          unint64_t v49 = (unint64_t)(v18 & 0x3F) << 40;
          do
          {
            if (v47 <= v52)
            {
              unint64_t v50 = v48 << 46;
              unsigned int v53 = v47;
              do
              {
                long long v57 = 0u;
                long long v58 = 0u;
                long long v55 = 0u;
                long long v56 = 0u;
                id v54 = v51;
                uint64_t v25 = [v54 countByEnumeratingWithState:&v55 objects:v64 count:16];
                if (v25)
                {
                  uint64_t v26 = *(void *)v56;
                  do
                  {
                    for (uint64_t i = 0; i != v25; ++i)
                    {
                      if (*(void *)v56 != v26) {
                        objc_enumerationMutation(v54);
                      }
                      v28 = *(void **)(*((void *)&v55 + 1) + 8 * i);
                      unsigned int v29 = [v28 style];
                      *(void *)((char *)v66 + 1) = v50 | v49;
                      LOBYTE(v66[0]) = 2;
                      *((void *)&v31 + 1) = (v48 >> 18) | ((unint64_t)(v53 & 0x3FFFFFF) << 8) | ((unint64_t)(v29 & 0x3FFF) << 34) | 0x2000000000000;
                      *(void *)&long long v31 = v50 | v49;
                      uint64_t v30 = v31 >> 56;
                      unint64_t v32 = (unint64_t)(v29 == 26) << 7;
                      if (v29 <= 0x19 && ((1 << v29) & 0x200101C) != 0) {
                        unint64_t v32 = 128;
                      }
                      v63[0] = v32 | v66[0] & 0xFFFFFFFFFFFFFF7FLL;
                      v63[1] = v30;
                      v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "restrictions"));
                      v35 = [v16 objectForKeyedSubscript:v34];
                      BOOL v36 = v35 == 0;

                      if (v36)
                      {
                        v37 = objc_alloc_init(GEOTileKeyList);
                        v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "restrictions"));
                        [v16 setObject:v37 forKeyedSubscript:v38];
                      }
                      v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "restrictions"));
                      v40 = [v16 objectForKeyedSubscript:v39];
                      [v40 addKey:v63];
                    }
                    uint64_t v25 = [v54 countByEnumeratingWithState:&v55 objects:v64 count:16];
                  }
                  while (v25);
                }

                ++v53;
              }
              while (v53 <= v52);
            }
            unint64_t v48 = (v48 + 1);
          }
          while (v48 <= v46);
        }

        ++v44;
      }
      while (v44 != v42);
      uint64_t v41 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      uint64_t v42 = v41;
    }
    while (v41);
  }
}

- (id)implicateAssetMetadataTilesForCoordinate:(id)a3 size:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v35[2] = *MEMORY[0x1E4F143B8];
  v7 = +[GEOResourceManifestManager modernManager];
  v8 = [v7 activeTileGroup];
  v9 = [v8 activeTileSetForStyle:78 size:2 scale:0];

  if (v9 && [v9 availableTilesCount])
  {
    char v10 = objc_msgSend(v9, "maximumZoomLevelForMapPoint:", GEOTilePointForCoordinate(var0, var1, 20.0));
    double v11 = GEOMapRectMakeWithRadialDistance(var0, var1, a4);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    unsigned int v18 = objc_alloc_init(GEOTileKeyList);
    double v19 = (double)(1 << v10) * 0.0000000037252903;
    LODWORD(v20) = vcvtmd_u64_f64(v19 * v11);
    unsigned int v30 = vcvtmd_u64_f64(v19 * (v11 + v15));
    unint64_t v32 = v20;
    if (v20 <= v30)
    {
      unsigned int v31 = vcvtmd_u64_f64(v19 * v13);
      unsigned int v21 = vcvtmd_u64_f64(v19 * (v13 + v17));
      unint64_t v22 = (unint64_t)(v10 & 0x3F) << 40;
      do
      {
        if (v31 <= v21)
        {
          unsigned int v23 = v31;
          do
          {
            unint64_t v33 = 0;
            uint64_t v34 = 0;
            char v24 = [v9 size];
            uint64_t v25 = [v9 scale];
            unsigned int v26 = [v9 style];
            *(void *)((char *)v35 + 1) = (v32 << 46) | v22;
            LOBYTE(v35[0]) = 2;
            if (v26 <= 0x19 && ((1 << v26) & 0x200101C) != 0) {
              unint64_t v27 = 128;
            }
            else {
              unint64_t v27 = (unint64_t)(v26 == 26) << 7;
            }
            *((void *)&v28 + 1) = (v32 >> 18) | ((unint64_t)(v23 & 0x3FFFFFF) << 8) | ((unint64_t)(v26 & 0x3FFF) << 34) | ((unint64_t)(v24 & 0xF) << 48) | (v25 << 52);
            *(void *)&long long v28 = v32 << 46;
            unint64_t v33 = v27 | v35[0] & 0xFFFFFFFFFFFFFF7FLL;
            uint64_t v34 = v28 >> 56;
            [(GEOTileKeyList *)v18 addKey:&v33];
            ++v23;
          }
          while (v23 <= v21);
        }
        unint64_t v32 = (v32 + 1);
      }
      while (v32 <= v30);
    }
  }
  else
  {
    unsigned int v18 = 0;
  }

  return v18;
}

@end