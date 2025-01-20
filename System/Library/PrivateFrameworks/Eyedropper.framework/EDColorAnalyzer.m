@interface EDColorAnalyzer
- (BOOL)kmeansShouldStopWithPreviousColors:(id)a3 newColors:(id)a4 iterations:(int64_t)a5;
- (EDColorAnalyzer)init;
- (id)colorAtCenterOfSurface:(__IOSurface *)a3 offset:(CGPoint)a4;
- (id)colorsInSurface:(__IOSurface *)a3 offset:(CGPoint)a4 clipToCircle:(BOOL)a5 clipedToRect:(CGRect)a6;
- (id)colorsSuggestionsForSurface:(__IOSurface *)a3 maxSuggestions:(int64_t)a4 clipToCircle:(BOOL)a5 clipedToRect:(CGRect)a6;
- (id)getRandomColors:(int64_t)a3 from:(id)a4;
- (id)kmeansColorsForColors:(id)a3 clusters:(int64_t)a4;
- (id)removeSimilarColors:(id)a3 minDistance:(double)a4;
- (void)clearCache;
@end

@implementation EDColorAnalyzer

- (EDColorAnalyzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)EDColorAnalyzer;
  v2 = [(EDColorAnalyzer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)clearCache
{
}

- (id)colorsSuggestionsForSurface:(__IOSurface *)a3 maxSuggestions:(int64_t)a4 clipToCircle:(BOOL)a5 clipedToRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v10 = a5;
  IOSurfaceLock(a3, 1u, 0);
  v14 = [MEMORY[0x263EFF980] array];
  v15 = -[EDColorAnalyzer colorAtCenterOfSurface:offset:](self, "colorAtCenterOfSurface:offset:", a3, -1.0, -1.0);
  [v14 addObject:v15];

  v16 = -[EDColorAnalyzer colorsInSurface:offset:clipToCircle:clipedToRect:](self, "colorsInSurface:offset:clipToCircle:clipedToRect:", a3, v10, -1.0, -1.0, x, y, width, height);
  v17 = [(EDColorAnalyzer *)self kmeansForColors:v16 clusters:a4 - 1];
  [v14 addObjectsFromArray:v17];

  v18 = [(EDColorAnalyzer *)self removeSimilarColors:v14 minDistance:0.1];
  v19 = (void *)[v18 mutableCopy];

  IOSurfaceUnlock(a3, 1u, 0);

  return v19;
}

- (id)removeSimilarColors:(id)a3 minDistance:(double)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_super v6 = [MEMORY[0x263EFF980] array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [MEMORY[0x263F08D40] valueWithColor:ColorMakeWithColor(*(void **)(*((void *)&v54 + 1) + 8 * i))];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v9);
  }
  v45 = v7;

  v13 = [MEMORY[0x263EFF980] array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        [v19 colorValue];
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        if (![v13 count]) {
          goto LABEL_17;
        }
        char v26 = 0;
        unint64_t v27 = 0;
        do
        {
          v28 = [v13 objectAtIndexedSubscript:v27];
          [v28 colorValue];
          BOOL v32 = ColorDistanceToColor(v21, v23, v25, v29, v30, v31) < a4;

          v26 |= v32;
          ++v27;
        }
        while (v27 < [v13 count]);
        if ((v26 & 1) == 0) {
LABEL_17:
        }
          [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v16);
  }

  v33 = [MEMORY[0x263EFF980] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v34 = v13;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(v34);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * k) colorValue];
        v42 = ColorUIColor(v39, v40, v41);
        [v33 addObject:v42];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v36);
  }

  v43 = [MEMORY[0x263EFF8C0] arrayWithArray:v33];

  return v43;
}

- (id)kmeansColorsForColors:(id)a3 clusters:(int64_t)a4
{
  uint64_t v144 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = 0.0;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v133 objects:v143 count:16];
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v134;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v134 != v13) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v133 + 1) + 8 * i) colorValue];
        double v11 = ColorCombineColors(v11, v10, v9, v15);
        double v10 = v16;
        double v9 = v17;
      }
      uint64_t v12 = [v6 countByEnumeratingWithState:&v133 objects:v143 count:16];
    }
    while (v12);
  }
  double v18 = ColorMake((double)a4, (double)a4, (double)a4);
  v19 = objc_msgSend(MEMORY[0x263F08D40], "valueWithColor:", ColorCombineColors(v11, v10, v9, v18));
  double v20 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v19];

  if (v20)
  {
    double v21 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v19];
  }
  else
  {
    v101 = v19;
    double v22 = [(EDColorAnalyzer *)self getRandomColors:a4 from:v6];
    double v23 = (void *)[v22 mutableCopy];

    double v24 = [MEMORY[0x263EFF980] array];
    if ([(EDColorAnalyzer *)self kmeansShouldStopWithPreviousColors:v24 newColors:v23 iterations:0])
    {
      double v25 = v24;
    }
    else
    {
      uint64_t v26 = 0;
      id v102 = v6;
      v105 = self;
      do
      {
        uint64_t v103 = v26;
        uint64_t v104 = [v23 mutableCopy];

        unint64_t v27 = objc_opt_new();
        long long v129 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        id v28 = v23;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v129 objects:v142 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v130;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v130 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v129 + 1) + 8 * j);
              id v34 = [MEMORY[0x263EFF980] array];
              [v27 setObject:v34 forKeyedSubscript:v33];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v129 objects:v142 count:16];
          }
          while (v30);
        }

        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        obuint64_t j = v6;
        uint64_t v35 = [obj countByEnumeratingWithState:&v125 objects:v141 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v126;
          do
          {
            for (uint64_t k = 0; k != v36; ++k)
            {
              if (*(void *)v126 != v37) {
                objc_enumerationMutation(obj);
              }
              double v39 = *(void **)(*((void *)&v125 + 1) + 8 * k);
              [v39 colorValue];
              double v41 = v40;
              double v43 = v42;
              double v45 = v44;
              long long v121 = 0u;
              long long v122 = 0u;
              long long v123 = 0u;
              long long v124 = 0u;
              id v46 = v28;
              uint64_t v47 = [v46 countByEnumeratingWithState:&v121 objects:v140 count:16];
              double v107 = 0.0;
              double v108 = 0.0;
              if (v47)
              {
                uint64_t v48 = v47;
                uint64_t v49 = *(void *)v122;
                double v50 = 1.79769313e308;
                double v7 = 0.0;
                double v107 = 0.0;
                double v108 = 0.0;
                do
                {
                  for (uint64_t m = 0; m != v48; ++m)
                  {
                    if (*(void *)v122 != v49) {
                      objc_enumerationMutation(v46);
                    }
                    [*(id *)(*((void *)&v121 + 1) + 8 * m) colorValue];
                    double v53 = v52;
                    double v55 = v54;
                    double v57 = v56;
                    double v58 = ColorDistanceToColor(v52, v54, v56, v41, v43, v45);
                    if (v58 < v50)
                    {
                      double v107 = v55;
                      double v108 = v57;
                      double v7 = v53;
                      double v50 = v58;
                    }
                  }
                  uint64_t v48 = [v46 countByEnumeratingWithState:&v121 objects:v140 count:16];
                }
                while (v48);
              }

              v59 = objc_msgSend(MEMORY[0x263F08D40], "valueWithColor:", v7, v107, v108);
              v60 = [v27 objectForKeyedSubscript:v59];
              [v60 addObject:v39];

              double v7 = 0.0;
            }
            uint64_t v36 = [obj countByEnumeratingWithState:&v125 objects:v141 count:16];
          }
          while (v36);
        }

        [v28 removeAllObjects];
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        uint64_t v61 = [v27 allValues];
        uint64_t v62 = [v61 countByEnumeratingWithState:&v117 objects:v139 count:16];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v118;
          do
          {
            for (uint64_t n = 0; n != v63; ++n)
            {
              if (*(void *)v118 != v64) {
                objc_enumerationMutation(v61);
              }
              v66 = *(void **)(*((void *)&v117 + 1) + 8 * n);
              long long v113 = 0u;
              long long v114 = 0u;
              long long v115 = 0u;
              long long v116 = 0u;
              id v67 = v66;
              uint64_t v68 = [v67 countByEnumeratingWithState:&v113 objects:v138 count:16];
              double v69 = 0.0;
              double v70 = 0.0;
              double v71 = 0.0;
              if (v68)
              {
                uint64_t v72 = v68;
                uint64_t v73 = *(void *)v114;
                double v69 = 0.0;
                double v70 = 0.0;
                double v71 = 0.0;
                do
                {
                  for (iuint64_t i = 0; ii != v72; ++ii)
                  {
                    if (*(void *)v114 != v73) {
                      objc_enumerationMutation(v67);
                    }
                    [*(id *)(*((void *)&v113 + 1) + 8 * ii) colorValue];
                    double v69 = ColorCombineColors(v69, v70, v71, v75);
                    double v70 = v76;
                    double v71 = v77;
                  }
                  uint64_t v72 = [v67 countByEnumeratingWithState:&v113 objects:v138 count:16];
                }
                while (v72);
              }

              if ([v67 count])
              {
                double v78 = ColorDivide(v69, v70, v71, (double)(unint64_t)[v67 count]);
                double v80 = v79;
                double v82 = v81;
              }
              else
              {
                v83 = [(EDColorAnalyzer *)v105 getRandomColors:1 from:obj];
                v84 = [v83 firstObject];
                [v84 colorValue];
                double v78 = v85;
                double v80 = v86;
                double v82 = v87;
              }
              v88 = objc_msgSend(MEMORY[0x263F08D40], "valueWithColor:", v78, v80, v82);
              [v28 addObject:v88];
            }
            uint64_t v63 = [v61 countByEnumeratingWithState:&v117 objects:v139 count:16];
          }
          while (v63);
        }
        uint64_t v26 = v103 + 1;

        v89 = [v28 sortedArrayUsingComparator:&__block_literal_global_1];
        double v23 = (void *)[v89 mutableCopy];

        double v25 = (void *)v104;
        self = v105;
        double v24 = (void *)v104;
        id v6 = v102;
      }
      while (![(EDColorAnalyzer *)v105 kmeansShouldStopWithPreviousColors:v104 newColors:v23 iterations:v103 + 1]);
    }
    v90 = [MEMORY[0x263EFF980] array];
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v91 = v23;
    uint64_t v92 = [v91 countByEnumeratingWithState:&v109 objects:v137 count:16];
    if (v92)
    {
      uint64_t v93 = v92;
      uint64_t v94 = *(void *)v110;
      do
      {
        for (juint64_t j = 0; jj != v93; ++jj)
        {
          if (*(void *)v110 != v94) {
            objc_enumerationMutation(v91);
          }
          [*(id *)(*((void *)&v109 + 1) + 8 * jj) colorValue];
          v99 = ColorUIColor(v96, v97, v98);
          [v90 addObject:v99];
        }
        uint64_t v93 = [v91 countByEnumeratingWithState:&v109 objects:v137 count:16];
      }
      while (v93);
    }

    v19 = v101;
    [(NSMutableDictionary *)self->_cache setObject:v90 forKeyedSubscript:v101];
    double v21 = [MEMORY[0x263EFF8C0] arrayWithArray:v90];
  }

  return v21;
}

BOOL __50__EDColorAnalyzer_kmeansColorsForColors_clusters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 colorValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v4 colorValue];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  return v8 * 0.7152 + v6 * 0.2126 + v10 * 0.0722 > v14 * 0.7152 + v12 * 0.2126 + v16 * 0.0722;
}

- (BOOL)kmeansShouldStopWithPreviousColors:(id)a3 newColors:(id)a4 iterations:(int64_t)a5
{
  if (a5 <= 14) {
    return [a3 isEqualToArray:a4];
  }
  else {
    return 1;
  }
}

- (id)colorsInSurface:(__IOSurface *)a3 offset:(CGPoint)a4 clipToCircle:(BOOL)a5 clipedToRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  BOOL v10 = a5;
  double v11 = a4.y;
  double v12 = a4.x;
  BaseAddress = (char *)IOSurfaceGetBaseAddress(a3);
  OSType PixelFormat = IOSurfaceGetPixelFormat(a3);
  size_t v16 = IOSurfaceGetWidth(a3);
  size_t v17 = IOSurfaceGetHeight(a3);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a3);
  double v18 = [MEMORY[0x263EFF980] array];
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v46);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double v40 = v11;
  double v42 = (double)(uint64_t)MinY;
  if (v11 + CGRectGetMaxY(v47) <= v42)
  {
LABEL_2:
    double v20 = objc_msgSend(v18, "copy", *(void *)&v39);
    goto LABEL_17;
  }
  double v39 = (double)((v17 >> 1) - 1);
  double v43 = (double)(v16 >> 1);
  double v44 = (double)((v16 >> 1) - 1);
  uint64_t v21 = (uint64_t)MinY;
  double v22 = &BaseAddress[BytesPerRow * (uint64_t)MinY];
  while (1)
  {
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v48);
    double v24 = (double)(uint64_t)MinX;
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    if (v12 + CGRectGetMaxX(v49) > v24) {
      break;
    }
LABEL_14:
    ++v21;
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    v22 += BytesPerRow;
    double v42 = (double)v21;
    if (v40 + CGRectGetMaxY(v51) <= (double)v21) {
      goto LABEL_2;
    }
  }
  uint64_t v26 = (uint64_t)MinX;
  unint64_t v27 = *(void *)&v42;
  double v28 = v39 - v42;
  double v29 = v28 * v28;
  uint64_t v30 = v26 + 1;
  uint64_t v31 = 4 * v26;
  while (1)
  {
    if (v10)
    {
      unint64_t v27 = *(void *)&v43;
      double v28 = (double)(uint64_t)floor(sqrt(v29 + (v44 - v24) * (v44 - v24)));
      if (v28 > v43) {
        goto LABEL_13;
      }
    }
    if (PixelFormat == 1111970369)
    {
      LOBYTE(v28) = v22[v31 + 2];
      double v34 = (double)*(unint64_t *)&v28 / 255.0;
      LOBYTE(v27) = v22[v31 + 1];
      double v35 = (double)v27 / 255.0;
      LOBYTE(v25) = v22[v31];
      uint64_t v33 = (void *)MEMORY[0x263F08D40];
      double v36 = (double)v25 / 255.0;
      goto LABEL_12;
    }
    if (PixelFormat != 1999843442) {
      break;
    }
    unsigned int v32 = *(_DWORD *)&v22[v31];
    uint64_t v33 = (void *)MEMORY[0x263F08D40];
    double v34 = (float)((float)((float)((v32 >> 20) & 0x3FF) + -384.0) / 510.0);
    double v35 = (float)((float)((float)((v32 >> 10) & 0x3FF) + -384.0) / 510.0);
    double v36 = (float)((float)((float)(v32 & 0x3FF) + -384.0) / 510.0);
LABEL_12:
    uint64_t v37 = objc_msgSend(v33, "valueWithColor:", ColorMake(v34, v35, v36));
    [v18 addObject:v37];

LABEL_13:
    double v24 = (double)v30;
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    double v28 = v12 + CGRectGetMaxX(v50);
    ++v30;
    v31 += 4;
    if (v28 <= v24) {
      goto LABEL_14;
    }
  }
  double v20 = 0;
LABEL_17:

  return v20;
}

- (id)colorAtCenterOfSurface:(__IOSurface *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BaseAddress = IOSurfaceGetBaseAddress(a3);
  OSType PixelFormat = IOSurfaceGetPixelFormat(a3);
  unint64_t v9 = (unint64_t)(x + (double)(IOSurfaceGetWidth(a3) >> 1));
  unint64_t v10 = (unint64_t)(y + (double)(IOSurfaceGetHeight(a3) >> 1));
  size_t v11 = (size_t)BaseAddress + IOSurfaceGetBytesPerRow(a3) * v10;
  if (PixelFormat == 1111970369)
  {
    v19 = (unsigned char *)(v11 + 4 * v9);
    LOBYTE(v12) = v19[2];
    double v16 = (double)v12 / 255.0;
    LOBYTE(v13) = v19[1];
    double v17 = (double)v13 / 255.0;
    LOBYTE(v14) = *v19;
    double v18 = (double)v14 / 255.0;
    goto LABEL_5;
  }
  if (PixelFormat == 1999843442)
  {
    unsigned int v15 = *(_DWORD *)(v11 + 4 * v9);
    double v16 = (float)((float)((float)((v15 >> 20) & 0x3FF) + -384.0) / 510.0);
    double v17 = (float)((float)((float)((v15 >> 10) & 0x3FF) + -384.0) / 510.0);
    double v18 = (float)((float)((float)(v15 & 0x3FF) + -384.0) / 510.0);
LABEL_5:
    double v20 = ColorMake(v16, v17, v18);
    double v23 = ColorUIColor(v20, v21, v22);
    goto LABEL_7;
  }
  double v23 = 0;
LABEL_7:

  return v23;
}

- (id)getRandomColors:(int64_t)a3 from:(id)a4
{
  id v5 = a4;
  if ([v5 count] >= (unint64_t)a3)
  {
    double v7 = [MEMORY[0x263EFF9C0] set];
    double v8 = [MEMORY[0x263EFF980] array];
    if ([v5 count])
    {
      unint64_t v9 = 0;
      do
      {
        unint64_t v10 = [NSNumber numberWithInteger:v9];
        [v8 addObject:v10];

        ++v9;
      }
      while (v9 < [v5 count]);
    }
    while ([v8 count] && objc_msgSend(v7, "count") < (unint64_t)a3)
    {
      unint64_t v11 = arc4random();
      unint64_t v12 = v11 % [v8 count];
      unint64_t v13 = [v8 objectAtIndexedSubscript:v12];
      uint64_t v14 = [v13 integerValue];

      [v8 removeObjectAtIndex:v12];
      unsigned int v15 = [v5 objectAtIndexedSubscript:v14];
      [v7 addObject:v15];
    }
    double v6 = [v7 allObjects];
  }
  else
  {
    double v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end