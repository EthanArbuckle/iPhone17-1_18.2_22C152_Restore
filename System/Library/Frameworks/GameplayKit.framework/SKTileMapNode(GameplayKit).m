@interface SKTileMapNode(GameplayKit)
+ (id)tileMapNodesWithTileSet:()GameplayKit columns:rows:tileSize:fromNoiseMap:tileTypeNoiseMapThresholds:;
@end

@implementation SKTileMapNode(GameplayKit)

+ (id)tileMapNodesWithTileSet:()GameplayKit columns:rows:tileSize:fromNoiseMap:tileTypeNoiseMapThresholds:
{
  unint64_t v75 = a7;
  unint64_t v77 = a6;
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a8;
  id v87 = a9;
  id v76 = v14;
  uint64_t v88 = [v87 count];
  [v14 sampleCount];
  long long v86 = v15;
  [v14 sampleCount];
  long long v85 = v16;
  unint64_t v17 = v88 + 1;
  v18 = (char *)&v69 - ((8 * (v88 + 1) + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v18, 8 * (v88 + 1));
  if (v17)
  {
    v19 = (void **)((char *)&v69 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v20 = v17;
    do
    {
      uint64_t v21 = [MEMORY[0x263EFF980] array];
      v22 = *v19;
      *v19++ = (void *)v21;

      --v20;
    }
    while (v20);
  }
  uint64_t v69 = (uint64_t)&v69;
  double v70 = a1;
  double v71 = a2;
  v23 = [MEMORY[0x263F17C40] emptyTileGroup];
  if (!v75 || !v77) {
    goto LABEL_30;
  }
  unint64_t v24 = 0;
  long long v26 = v85;
  long long v25 = v86;
  float v82 = (float)(int)v86;
  float v73 = (float)SDWORD1(v85);
  if (v17 <= 1) {
    uint64_t v27 = 1;
  }
  else {
    uint64_t v27 = v17;
  }
  *(void *)&long long v86 = v27 - 1;
  float v72 = 1.0 / (float)v75;
  float v81 = 1.0 / (float)v77;
  while (2)
  {
    unint64_t v28 = 0;
    unint64_t v74 = v24;
    *(float *)&long long v26 = (float)((float)((float)v24 + 0.16667) * v73) * v72;
    long long v85 = v26;
    *(float *)&long long v26 = (float)((float)((float)v24 + 0.5) * v73) * v72;
    long long v84 = v26;
    *(float *)&long long v25 = (float)((float)((float)v24 + 0.83333) * v73) * v72;
    long long v83 = v25;
    do
    {
      *(float *)&long long v25 = (float)((float)((float)v28 + 0.16667) * v82) * v81;
      long long v80 = v25;
      DWORD1(v25) = v85;
      id v29 = v76;
      [v76 interpolatedValueAtPosition:*(double *)&v25];
      float v31 = v30;
      *(float *)&long long v32 = (float)((float)((float)v28 + 0.5) * v82) * v81;
      long long v79 = v32;
      DWORD1(v32) = v85;
      [v29 interpolatedValueAtPosition:*(double *)&v32];
      float v34 = v33;
      *(float *)&long long v35 = (float)((float)((float)v28 + 0.83333) * v82) * v81;
      long long v78 = v35;
      DWORD1(v35) = v85;
      [v29 interpolatedValueAtPosition:*(double *)&v35];
      float v37 = v36;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v84, v80)));
      float v39 = v38;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v84, v79)));
      float v41 = v40;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v84, v78)));
      float v43 = v42;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v83, v80)));
      float v45 = v44;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v83, v79)));
      float v47 = v46;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v83, v78)));
      if (!v88)
      {
        unint64_t v49 = 0;
LABEL_22:
        unint64_t v54 = 0;
        do
        {
          while (1)
          {
            unint64_t v55 = v54 > v49 ? -1 : v54;
            v56 = [v13 tileGroups];
            unint64_t v57 = [v56 count];

            v58 = *(void **)&v18[8 * v54];
            if (v55 < v57) {
              break;
            }
            [*(id *)&v18[8 * v54++] addObject:v23];
            if (v17 == v54) {
              goto LABEL_12;
            }
          }
          v59 = [v13 tileGroups];
          v60 = [v59 objectAtIndexedSubscript:v55];
          [v58 addObject:v60];

          ++v54;
        }
        while (v17 != v54);
        goto LABEL_12;
      }
      unint64_t v49 = 0;
      float v50 = (float)((float)(v48 + v47)
                  + (float)((float)(v45 + (float)(v43 + v41)) + (float)((float)(v39 + v37) + (float)(v34 + v31))))
          * 0.11111;
      while (1)
      {
        v51 = [v87 objectAtIndexedSubscript:v49];
        [v51 floatValue];
        float v53 = v52;

        if (v50 < v53) {
          break;
        }
        if ((void)v86 == v49) {
          goto LABEL_12;
        }
        if (v88 == ++v49)
        {
          unint64_t v49 = v88;
          break;
        }
      }
      if (v17) {
        goto LABEL_22;
      }
LABEL_12:
      ++v28;
    }
    while (v28 != v77);
    unint64_t v24 = v74 + 1;
    if (v74 + 1 != v75) {
      continue;
    }
    break;
  }
LABEL_30:
  id v61 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v62 = v71;
  double v63 = v70;
  if (v17)
  {
    v64 = (uint64_t *)((char *)&v69 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v65 = v17;
    do
    {
      v66 = objc_msgSend(MEMORY[0x263F17C48], "tileMapNodeWithTileSet:columns:rows:tileSize:tileGroupLayout:", v13, v77, v75, *v64, v63, v62);
      [v61 addObject:v66];

      ++v64;
      --v65;
    }
    while (v65);

    uint64_t v67 = 8 * v88;
    do
    {

      v67 -= 8;
    }
    while (v67 != -8);
  }
  else
  {
  }

  return v61;
}

@end