@interface _GEOTransitPreloadCamera
- (void)implicateTilesForCoordinate:(id)a3 into:(id)a4 radialDistance:(double)a5 tileSetStyles:(id)a6;
@end

@implementation _GEOTransitPreloadCamera

- (void)implicateTilesForCoordinate:(id)a3 into:(id)a4 radialDistance:(double)a5 tileSetStyles:(id)a6
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v56[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  double v12 = GEOMapRectMakeWithRadialDistance(var0, var1, a5);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v11;
  uint64_t v33 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v50;
    double v19 = v12 + v16;
    double v20 = v14 + v18;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v42 = objc_msgSend(obj, "objectForKey:", v21, v33);
        char v22 = [v21 integerValue];
        double v23 = (double)(1 << v22) * 0.0000000037252903;
        unint64_t v39 = vcvtmd_u64_f64(v12 * v23) | 0x3E30000000000000;
        unsigned int v37 = vcvtmd_u64_f64(v19 * v23);
        if (v39 <= v37)
        {
          unsigned int v38 = vcvtmd_u64_f64(v14 * v23);
          unsigned int v43 = vcvtmd_u64_f64(v20 * v23);
          unint64_t v40 = (unint64_t)(v22 & 0x3F) << 40;
          do
          {
            if (v38 <= v43)
            {
              unint64_t v41 = v39 << 46;
              unsigned int v44 = v38;
              do
              {
                long long v47 = 0u;
                long long v48 = 0u;
                long long v45 = 0u;
                long long v46 = 0u;
                id v24 = v42;
                uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v54 count:16];
                if (v25)
                {
                  uint64_t v26 = *(void *)v46;
                  do
                  {
                    for (uint64_t j = 0; j != v25; ++j)
                    {
                      if (*(void *)v46 != v26) {
                        objc_enumerationMutation(v24);
                      }
                      unsigned int v28 = [*(id *)(*((void *)&v45 + 1) + 8 * j) integerValue];
                      *(void *)((char *)v56 + 1) = v41 | v40;
                      LOBYTE(v56[0]) = 2;
                      *((void *)&v30 + 1) = (v39 >> 18) | ((unint64_t)(v44 & 0x3FFFFFF) << 8) | ((unint64_t)(v28 & 0x3FFF) << 34) | 0x2000000000000;
                      *(void *)&long long v30 = v41 | v40;
                      uint64_t v29 = v30 >> 56;
                      unint64_t v31 = (unint64_t)(v28 == 26) << 7;
                      if (v28 <= 0x19 && ((1 << v28) & 0x200101C) != 0) {
                        unint64_t v31 = 128;
                      }
                      v53[0] = v31 | v56[0] & 0xFFFFFFFFFFFFFF7FLL;
                      v53[1] = v29;
                      [v10 addKey:v53];
                    }
                    uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v54 count:16];
                  }
                  while (v25);
                }

                ++v44;
              }
              while (v44 <= v43);
            }
            unint64_t v39 = (v39 + 1);
          }
          while (v39 <= v37);
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v33);
  }
}

@end