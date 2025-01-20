@interface AXShotflowDetector
+ (id)cpuDetectorWithModelPath:(id)a3 configuration:(id)a4 version:(int)a5;
+ (id)gpuDetectorWithModelPath:(id)a3 configuration:(id)a4 preferredMetalDeviceID:(int)a5 version:(int)a6 modelType:(int64_t)a7;
- (AXShotflowDetector)initWithNetwork:(id)a3 nmsThreshold:(float)a4 filterThreshold:(id)a5;
- (NSArray)filterThreshold;
- (float)mergeHeadsThreshold;
- (float)nmsThreshold;
- (float)olmcsThreshold;
- (float)osfsSizeRatio;
- (float)osfsThreshold;
- (float)overlap_threshold;
- (float)smartDistanceFactor;
- (float)smartThreshold;
- (float)threshold;
- (id)detect:(id)a3;
- (id)enforceSquareFaces:(id)a3 withHeight:(float)a4 andWidth:(float)a5;
- (id)filterBoxes:(id)a3;
- (id)mergeBoxes:(id)a3;
- (id)mergeHeadsBoxes:(id)a3;
- (id)nmsBoxes:(id)a3;
- (id)overlappingLowMergeCountSuppression:(id)a3;
- (id)overlappingSmallFacesSuppression:(id)a3;
- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5;
- (id)smartMergeBoxes:(id)a3;
- (int)olmcsMergeCountDelta;
- (void)setFilterThreshold:(id)a3;
- (void)setMergeHeadsThreshold:(float)a3;
- (void)setNmsThreshold:(float)a3;
- (void)setOlmcsMergeCountDelta:(int)a3;
- (void)setOlmcsThreshold:(float)a3;
- (void)setOsfsSizeRatio:(float)a3;
- (void)setOsfsThreshold:(float)a3;
- (void)setOverlap_threshold:(float)a3;
- (void)setSmartDistanceFactor:(float)a3;
- (void)setSmartThreshold:(float)a3;
- (void)setThreshold:(float)a3;
@end

@implementation AXShotflowDetector

+ (id)cpuDetectorWithModelPath:(id)a3 configuration:(id)a4 version:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  v9 = +[AXShotflowNetwork cpuNetworkWithModelPath:a3 configuration:v8 version:v5 modelType:1];
  id v10 = objc_alloc((Class)a1);
  v11 = [v8 nmsThreshold];
  [v11 floatValue];
  int v13 = v12;
  v14 = [v8 filterThresholds];
  LODWORD(v15) = v13;
  v16 = (void *)[v10 initWithNetwork:v9 nmsThreshold:v14 filterThreshold:v15];

  return v16;
}

+ (id)gpuDetectorWithModelPath:(id)a3 configuration:(id)a4 preferredMetalDeviceID:(int)a5 version:(int)a6 modelType:(int64_t)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  int v13 = +[AXShotflowNetwork gpuNetworkWithModelPath:a3 configuration:v12 preferredMetalDeviceID:v9 version:v8 modelType:a7];
  id v14 = objc_alloc((Class)a1);
  double v15 = [v12 nmsThreshold];
  [v15 floatValue];
  int v17 = v16;
  v18 = [v12 filterThresholds];
  LODWORD(v19) = v17;
  v20 = (void *)[v14 initWithNetwork:v13 nmsThreshold:v18 filterThreshold:v19];

  return v20;
}

- (AXShotflowDetector)initWithNetwork:(id)a3 nmsThreshold:(float)a4 filterThreshold:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AXShotflowDetector;
  v11 = [(AXShotflowDetector *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_network, a3);
    v12->_nmsThreshold = a4;
    *(_OWORD *)&v12->_mergeHeadsThreshold = xmmword_1B58AC8C0;
    v12->_olmcsMergeCountDelta = 5;
    *(void *)&v12->_smartThreshold = 0x3F8000003F19999ALL;
    objc_storeStrong((id *)&v12->_filterThreshold, a5);
  }

  return v12;
}

- (float)threshold
{
  [(AXShotflowNetwork *)self->_network threshold];
  return result;
}

- (void)setThreshold:(float)a3
{
}

- (id)nmsBoxes:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  NSUInteger v23 = [(NSArray *)self->_filterThreshold count];
  [(AXShotflowDetector *)self nmsThreshold];
  float v5 = v4;
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v23)
  {
    uint64_t v6 = 0;
    uint64_t v22 = MEMORY[0x1E4F143A8];
    do
    {
      v30[0] = v22;
      v30[1] = 3221225472;
      v30[2] = __31__AXShotflowDetector_nmsBoxes___block_invoke;
      v30[3] = &__block_descriptor_40_e45_B24__0__AXElementDetection_8__NSDictionary_16l;
      uint64_t v25 = v6;
      v30[4] = v6;
      v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v30];
      v26 = [v24 filteredArrayUsingPredicate:v7];

      uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
      v31[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
      id v10 = [v26 sortedArrayUsingDescriptors:v9];

      unint64_t v11 = [v10 count];
      unsigned __int8 v28 = 0;
      std::vector<BOOL>::vector(&__p, v11, &v28);
      if (v11)
      {
        unint64_t v12 = 0;
        do
        {
          int v13 = [v10 objectAtIndexedSubscript:v12];
          objc_super v14 = __p;
          unint64_t v15 = v12 >> 6;
          uint64_t v16 = 1 << v12;
          uint64_t v17 = *((void *)__p + (v12++ >> 6));
          if ((v17 & v16) == 0)
          {
            unint64_t v18 = v12;
            if (v12 < v11)
            {
              do
              {
                if ((*((void *)__p + (v18 >> 6)) & (1 << v18)) == 0)
                {
                  double v19 = [v10 objectAtIndexedSubscript:v18];
                  [v13 overlap:v19];
                  if (v20 > v5) {
                    *((void *)__p + (v18 >> 6)) |= 1 << v18;
                  }
                }
                ++v18;
              }
              while (v11 != v18);
              objc_super v14 = __p;
              uint64_t v17 = *((void *)__p + v15);
            }
            v14[v15] = v17 | v16;
            [v27 addObject:v13];
          }
        }
        while (v12 != v11);
      }
      if (__p) {
        operator delete(__p);
      }

      uint64_t v6 = v25 + 1;
    }
    while (v25 + 1 != v23);
  }

  return v27;
}

BOOL __31__AXShotflowDetector_nmsBoxes___block_invoke(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 32) + 1 == (int)[a2 label];
}

- (id)overlappingSmallFacesSuppression:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  float v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
  v24[0] = v4;
  float v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  uint64_t v6 = [v21 sortedArrayUsingDescriptors:v5];

  unint64_t v7 = [v6 count];
  unsigned __int8 v22 = 0;
  std::vector<BOOL>::vector(&__p, v7, &v22);
  [(AXShotflowDetector *)self osfsThreshold];
  int v9 = v8;
  [(AXShotflowDetector *)self osfsSizeRatio];
  int v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    unint64_t v13 = 0;
    do
    {
      objc_super v14 = [v6 objectAtIndexedSubscript:v13];
      uint64_t v15 = *((void *)__p + (v13 >> 6));
      if ((v15 & (1 << v13)) != 0)
      {
        ++v13;
      }
      else
      {
        *((void *)__p + (v13 >> 6)) = v15 | (1 << v13);
        [v12 addObject:v14];
        unint64_t v16 = ++v13;
        if (v13 < v7)
        {
          do
          {
            if ((*((void *)__p + (v16 >> 6)) & (1 << v16)) == 0)
            {
              uint64_t v17 = [v6 objectAtIndexedSubscript:v16];
              LODWORD(v18) = v9;
              LODWORD(v19) = v11;
              if ([v14 isOverlappingSmallFace:v17 withOverlapThreshold:v18 withSizeRatio:v19])*((void *)__p + (v16 >> 6)) |= 1 << v16; {
            }
              }
            ++v16;
          }
          while (v7 != v16);
        }
      }
    }
    while (v13 != v7);
  }
  if (__p) {
    operator delete(__p);
  }

  return v12;
}

- (id)mergeHeadsBoxes:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  [(AXShotflowDetector *)self mergeHeadsThreshold];
  float v5 = v4;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke;
  v32[3] = &__block_descriptor_40_e45_B24__0__AXElementDetection_8__NSDictionary_16l;
  v32[4] = 2;
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:v32];
  id v27 = [v28 filteredArrayUsingPredicate:v6];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke_2;
  void v31[3] = &__block_descriptor_40_e45_B24__0__AXElementDetection_8__NSDictionary_16l;
  v31[4] = 1;
  unint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v31];
  int v8 = [v28 filteredArrayUsingPredicate:v7];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke_3;
  v30[3] = &__block_descriptor_40_e45_B24__0__AXElementDetection_8__NSDictionary_16l;
  v30[4] = 2;
  int v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:v30];
  int v10 = [v28 filteredArrayUsingPredicate:v9];

  int v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
  v33[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  unint64_t v13 = [v27 sortedArrayUsingDescriptors:v12];

  uint64_t v14 = [v13 count];
  uint64_t v15 = [v8 count];
  if (v14)
  {
    uint64_t v16 = v15;
    for (uint64_t i = 0; i != v14; ++i)
    {
      double v18 = [v13 objectAtIndexedSubscript:i];
      if (!v16) {
        goto LABEL_11;
      }
      uint64_t v19 = 0;
      BOOL v20 = 1;
      do
      {
        while (!v20)
        {
          BOOL v20 = 0;
          if (++v19 == v16) {
            goto LABEL_12;
          }
        }
        id v21 = [v8 objectAtIndexedSubscript:v19];
        [v18 iOa:v21];
        float v23 = v22;
        BOOL v20 = v22 <= v5;

        ++v19;
      }
      while (v19 != v16);
      if (v23 <= v5) {
LABEL_11:
      }
        [v29 addObject:v18];
LABEL_12:
    }
  }
  for (unint64_t j = 0; j < [v10 count]; ++j)
  {
    uint64_t v25 = [v10 objectAtIndexedSubscript:j];
    [v29 addObject:v25];
  }

  return v29;
}

BOOL __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 32) == (int)[a2 label];
}

BOOL __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke_2(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 32) == (int)[a2 label];
}

BOOL __38__AXShotflowDetector_mergeHeadsBoxes___block_invoke_3(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 32) != (int)[a2 label];
}

- (id)overlappingLowMergeCountSuppression:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  float v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"mergesCount" ascending:0];
  v22[0] = v4;
  float v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  uint64_t v6 = [v18 sortedArrayUsingDescriptors:v5];

  unint64_t v7 = [v6 count];
  unsigned __int8 v20 = 0;
  std::vector<BOOL>::vector(&__p, v7, &v20);
  [(AXShotflowDetector *)self olmcsThreshold];
  int v9 = v8;
  uint64_t v10 = [(AXShotflowDetector *)self olmcsMergeCountDelta];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = [v6 objectAtIndexedSubscript:v11];
      uint64_t v13 = *((void *)__p + (v11 >> 6));
      if ((v13 & (1 << v11)) != 0)
      {
        ++v11;
      }
      else
      {
        *((void *)__p + (v11 >> 6)) = v13 | (1 << v11);
        [v19 addObject:v12];
        ++v11;
        if ((int)[v12 mergesCount] >= 11)
        {
          unint64_t v14 = v11;
          if (v11 < v7)
          {
            do
            {
              if ((*((void *)__p + (v14 >> 6)) & (1 << v14)) == 0)
              {
                uint64_t v15 = [v6 objectAtIndexedSubscript:v14];
                LODWORD(v16) = v9;
                if ([v12 isOverlappingLowMergeDet:v15 withOverlapThreshold:v10 withMergeCountDelta:v16])*((void *)__p + (v14 >> 6)) |= 1 << v14; {
              }
                }
              ++v14;
            }
            while (v7 != v14);
          }
        }
      }
    }
    while (v11 != v7);
  }
  if (__p) {
    operator delete(__p);
  }

  return v19;
}

- (id)mergeBoxes:(id)a3
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  float v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
  v69[0] = v4;
  float v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
  v66 = [v60 sortedArrayUsingDescriptors:v5];

  unint64_t v6 = [v66 count];
  unsigned __int8 v67 = 0;
  std::vector<BOOL>::vector(&__p, v6, &v67);
  [(AXShotflowDetector *)self nmsThreshold];
  float v65 = v7;
  id v61 = [MEMORY[0x1E4F1CA48] array];
  if (v6)
  {
    unint64_t v8 = 0;
    do
    {
      int v9 = [v66 objectAtIndexedSubscript:v8];
      uint64_t v10 = v9;
      uint64_t v11 = *((void *)__p + (v8 >> 6));
      if ((v11 & (1 << v8)) != 0)
      {
        ++v8;
      }
      else
      {
        *((void *)__p + (v8 >> 6)) = v11 | (1 << v8);
        [v9 confidence];
        float v13 = v12;
        [v10 box];
        *(float *)&double v14 = v14;
        float v15 = v13 * *(float *)&v14;
        *(float *)&double v14 = v16;
        float v17 = v13 * *(float *)&v14;
        *(float *)&double v14 = v18;
        float v19 = v13 * *(float *)&v14;
        *(float *)&double v14 = v20;
        float v21 = v13 * *(float *)&v14;
        ++v8;
        uint64_t v22 = 1;
        if (v8 < v6)
        {
          unint64_t v23 = v8;
          do
          {
            if ((*((void *)__p + (v23 >> 6)) & (1 << v23)) == 0)
            {
              id v24 = [v66 objectAtIndexedSubscript:v23];
              [v10 overlap:v24];
              if (v25 > v65)
              {
                float v63 = v13;
                float v26 = v19;
                float v27 = v17;
                *((void *)__p + (v23 >> 6)) |= 1 << v23;
                [v24 box];
                double v29 = v28;
                double v31 = v30;
                double v33 = v32;
                double v35 = v34;
                [v24 confidence];
                float v36 = v29;
                float v15 = v15 + (float)(v37 * v36);
                float v38 = v31;
                float v17 = v27 + (float)(v37 * v38);
                float v39 = v33;
                float v21 = v21 + (float)(v37 * v39);
                float v40 = v35;
                float v19 = v26 + (float)(v37 * v40);
                float v13 = v63 + v37;
                uint64_t v22 = (v22 + 1);
              }
            }
            ++v23;
          }
          while (v6 != v23);
        }
        float v41 = v21;
        float v64 = v19;
        float v42 = v17;
        v43 = [AXElementDetection alloc];
        [v10 defaultBox];
        double v62 = v44;
        double v46 = v45;
        double v48 = v47;
        double v50 = v49;
        [v10 confidence];
        int v52 = v51;
        uint64_t v53 = [v10 scale];
        uint64_t v54 = [v10 hasLabel];
        uint64_t v55 = [v10 label];
        v56 = [v10 labelName];
        LODWORD(v59) = v52;
        v57 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:](v43, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:", v53, v22, v54, v55, v56, (float)(v15 / v13), (float)(v42 / v13), (float)(v41 / v13), (float)(v64 / v13), v46, v48, v62, v50, v59);

        [v61 addObject:v57];
      }
    }
    while (v8 != v6);
  }
  if (__p) {
    operator delete(__p);
  }

  return v61;
}

- (id)smartMergeBoxes:(id)a3
{
  v177[1] = *MEMORY[0x1E4F143B8];
  id v161 = a3;
  float v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"smartDistance" ascending:1];
  v177[0] = v4;
  float v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:1];
  v173 = [v161 sortedArrayUsingDescriptors:v5];

  unint64_t v6 = [v173 count];
  unsigned __int8 v175 = 0;
  std::vector<BOOL>::vector(&__p, v6, &v175);
  [(AXShotflowDetector *)self smartThreshold];
  float v170 = v7;
  [(AXShotflowDetector *)self smartDistanceFactor];
  float v169 = v8;
  id v162 = [MEMORY[0x1E4F1CA48] array];
  if (v6)
  {
    unint64_t v9 = 0;
    double v168 = (float)(1.0 - v170);
    do
    {
      uint64_t v10 = [v173 objectAtIndexedSubscript:v9];
      uint64_t v11 = v10;
      uint64_t v12 = *((void *)__p + (v9 >> 6));
      if ((v12 & (1 << v9)) != 0)
      {
        ++v9;
      }
      else
      {
        *((void *)__p + (v9 >> 6)) = v12 | (1 << v9);
        [v10 confidence];
        float v167 = v13;
        [v11 box];
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        [v11 boxCenter];
        double v171 = v23;
        double v172 = v22;
        *(float *)&double v22 = v19;
        float v24 = v167 * *(float *)&v22;
        *(float *)&double v22 = v21;
        float v165 = v167 * *(float *)&v22;
        float v166 = v24;
        *(float *)&double v22 = v17;
        float v25 = v167 * *(float *)&v22;
        *(float *)&double v22 = v15;
        float v163 = v167 * *(float *)&v22;
        float v164 = v25;
        ++v9;
        uint64_t v26 = 1;
        if (v9 < v6)
        {
          unint64_t v27 = v9;
          do
          {
            if ((*((void *)__p + (v27 >> 6)) & (1 << v27)) == 0)
            {
              double v28 = [v173 objectAtIndexedSubscript:v27];
              [v28 boxCenter];
              double v30 = v29;
              double v32 = v31;
              [v11 overlap:v28];
              float v34 = v33;
              [v11 box];
              double v36 = v35;
              [v11 box];
              double v38 = v37;
              [v28 box];
              double v40 = v39;
              [v28 box];
              double v42 = v41;
              [v11 box];
              double v44 = v43;
              [v11 box];
              float v45 = v40 + v42;
              float v47 = v44 + v46;
              if (v45 >= v47)
              {
                [v11 box];
                double v49 = v51;
                [v11 box];
              }
              else
              {
                [v28 box];
                double v49 = v48;
                [v28 box];
              }
              double v52 = v50;
              [v28 box];
              double v54 = v53;
              [v11 box];
              float v55 = v54;
              *(float *)&double v56 = v56;
              if (v55 <= *(float *)&v56) {
                [v11 box];
              }
              else {
                [v28 box];
              }
              float v58 = v49 + v52;
              float v59 = v57;
              float v174 = 0.0;
              if ((float)(v58 - v59) >= 0.0)
              {
                [v28 box];
                double v61 = v60;
                [v28 box];
                double v63 = v62;
                [v11 box];
                double v65 = v64;
                [v11 box];
                float v66 = v61 + v63;
                float v68 = v65 + v67;
                if (v66 >= v68)
                {
                  [v11 box];
                  double v70 = v72;
                  [v11 box];
                }
                else
                {
                  [v28 box];
                  double v70 = v69;
                  [v28 box];
                }
                double v73 = v71;
                [v28 box];
                double v75 = v74;
                [v11 box];
                float v76 = v75;
                *(float *)&double v77 = v77;
                if (v76 <= *(float *)&v77) {
                  [v11 box];
                }
                else {
                  [v28 box];
                }
                float v79 = v70 + v73;
                float v80 = v78;
                float v174 = v79 - v80;
              }
              [v28 box];
              double v82 = v81;
              [v28 box];
              double v84 = v83;
              [v11 box];
              double v86 = v85;
              [v11 box];
              float v87 = v82 + v84;
              float v89 = v86 + v88;
              if (v87 >= v89)
              {
                [v11 box];
                double v91 = v93;
                [v11 box];
              }
              else
              {
                [v28 box];
                double v91 = v90;
                [v28 box];
              }
              double v94 = v92;
              [v28 box];
              double v96 = v95;
              [v11 box];
              float v97 = v96;
              *(float *)&double v98 = v98;
              if (v97 <= *(float *)&v98) {
                [v11 box];
              }
              else {
                [v28 box];
              }
              float v100 = v91 + v94;
              float v101 = v99;
              float v102 = 0.0;
              if ((float)(v100 - v101) >= 0.0)
              {
                [v28 box];
                double v104 = v103;
                [v28 box];
                double v106 = v105;
                [v11 box];
                double v108 = v107;
                [v11 box];
                float v109 = v104 + v106;
                float v111 = v108 + v110;
                if (v109 >= v111)
                {
                  [v11 box];
                  double v113 = v115;
                  [v11 box];
                }
                else
                {
                  [v28 box];
                  double v113 = v112;
                  [v28 box];
                }
                double v116 = v114;
                [v28 box];
                double v118 = v117;
                [v11 box];
                float v119 = v118;
                *(float *)&double v120 = v120;
                if (v119 <= *(float *)&v120) {
                  [v11 box];
                }
                else {
                  [v28 box];
                }
                float v122 = v113 + v116;
                float v123 = v121;
                float v102 = v122 - v123;
              }
              float v124 = sqrt((v172 - v30) * (v172 - v30) + (v171 - v32) * (v171 - v32));
              float v125 = fmin(v36, v38);
              if ((float)((float)(1.0 - sqrtf(v34)) + (float)((float)(v169 * v124) / v125)) < v170)
              {
                [v11 box];
                if (v126 * v168 <= v174)
                {
                  objc_msgSend(v11, "box", v174, v126 * v168);
                  if (v127 * v168 <= v102)
                  {
                    *((void *)__p + (v27 >> 6)) |= 1 << v27;
                    objc_msgSend(v28, "box", v102, v127 * v168);
                    double v129 = v128;
                    double v131 = v130;
                    double v133 = v132;
                    double v135 = v134;
                    [v28 confidence];
                    float v136 = v129;
                    float v138 = v163 + (float)(v137 * v136);
                    float v139 = v131;
                    float v163 = v138;
                    float v164 = v164 + (float)(v137 * v139);
                    float v140 = v133;
                    float v141 = v166 + (float)(v137 * v140);
                    float v142 = v135;
                    float v165 = v165 + (float)(v137 * v142);
                    float v166 = v141;
                    float v167 = v167 + v137;
                    uint64_t v26 = (v26 + 1);
                  }
                }
              }
            }
            ++v27;
          }
          while (v6 != v27);
        }
        v143 = [AXElementDetection alloc];
        [v11 defaultBox];
        double v145 = v144;
        double v147 = v146;
        double v149 = v148;
        double v151 = v150;
        [v11 confidence];
        int v153 = v152;
        uint64_t v154 = [v11 scale];
        uint64_t v155 = [v11 hasLabel];
        uint64_t v156 = [v11 label];
        v157 = [v11 labelName];
        LODWORD(v160) = v153;
        v158 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:](v143, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:", v154, v26, v155, v156, v157, (float)(v163 / v167), (float)(v164 / v167), (float)(v166 / v167), (float)(v165 / v167), v145, v147, v149, v151, v160);

        [v162 addObject:v158];
      }
    }
    while (v9 != v6);
  }
  if (__p) {
    operator delete(__p);
  }

  return v162;
}

- (id)filterBoxes:(id)a3
{
  id v4 = a3;
  if ([(AXShotflowNetwork *)self->_network modelType] == 1
    || [(AXShotflowNetwork *)self->_network modelType] == 2)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    NSUInteger v6 = [(NSArray *)self->_filterThreshold count];
    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        float v8 = [(NSArray *)self->_filterThreshold objectAtIndexedSubscript:i];
        [v8 floatValue];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __34__AXShotflowDetector_filterBoxes___block_invoke;
        v15[3] = &__block_descriptor_44_e45_B24__0__AXElementDetection_8__NSDictionary_16l;
        int v16 = v9;
        v15[4] = i;
        uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:v15];
        uint64_t v11 = [v4 filteredArrayUsingPredicate:v10];

        for (unint64_t j = 0; j < [v11 count]; ++j)
        {
          float v13 = [v11 objectAtIndexedSubscript:j];
          [v5 addObject:v13];
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

BOOL __34__AXShotflowDetector_filterBoxes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 confidence];
  BOOL v5 = v4 >= *(float *)(a1 + 40) && *(void *)(a1 + 32) + 1 == (int)[v3 label];

  return v5;
}

- (id)enforceSquareFaces:(id)a3 withHeight:(float)a4 andWidth:(float)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  if ([(AXShotflowNetwork *)self->_network version] == 6
    || [(AXShotflowNetwork *)self->_network version] >= 9)
  {
    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obunint64_t j = v45;
    uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v52 != v7) {
            objc_enumerationMutation(obj);
          }
          int v9 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if ([v9 label] == 1)
          {
            [v9 box];
            double v11 = v10;
            double v13 = v12;
            [v9 boxCenter];
            double v15 = v14;
            double v17 = v16;
            double v18 = [AXElementDetection alloc];
            [v9 defaultBox];
            double v49 = v19;
            double v21 = v20;
            double v23 = v22;
            double v25 = v24;
            [v9 confidence];
            int v27 = v26;
            uint64_t v28 = [v9 scale];
            uint64_t v29 = [v9 mergesCount];
            uint64_t v30 = [v9 hasLabel];
            uint64_t v31 = [v9 label];
            double v32 = [v9 labelName];
            float v33 = v11;
            float v34 = v13;
            float v35 = (float)((float)(v34 * a4) + (float)(v33 * a5)) * 0.5;
            float v36 = v35 / a5;
            float v37 = v35 / a4;
            float v38 = v15;
            double v39 = v36;
            float v40 = v38 + v36 * -0.5;
            float v41 = v17;
            LODWORD(v44) = v27;
            double v42 = -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:](v18, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:", v28, v29, v30, v31, v32, v40, (float)(v41 - (float)(v37 * 0.5)), v39, v37, v21, v23, v49, v25, v44);

            [v50 addObject:v42];
          }
          else
          {
            [v50 addObject:v9];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v50 = v45;
  }

  return v50;
}

- (id)detect:(id)a3
{
  id v3 = [(AXShotflowNetwork *)self->_network processCIImage:a3];

  return v3;
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5
{
  id v8 = a3;
  int v9 = (void *)MEMORY[0x1BA9A10B0]();
  double v10 = [(AXShotflowDetector *)self nmsBoxes:v8];

  double v11 = [(AXShotflowDetector *)self filterBoxes:v10];

  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  double v14 = [(AXShotflowDetector *)self enforceSquareFaces:v11 withHeight:v12 andWidth:v13];

  double v15 = [(AXShotflowDetector *)self mergeHeadsBoxes:v14];

  return v15;
}

- (float)overlap_threshold
{
  return self->_overlap_threshold;
}

- (void)setOverlap_threshold:(float)a3
{
  self->_overlap_threshold = a3;
}

- (NSArray)filterThreshold
{
  return self->_filterThreshold;
}

- (void)setFilterThreshold:(id)a3
{
}

- (float)nmsThreshold
{
  return self->_nmsThreshold;
}

- (void)setNmsThreshold:(float)a3
{
  self->_nmsThreshold = a3;
}

- (float)mergeHeadsThreshold
{
  return self->_mergeHeadsThreshold;
}

- (void)setMergeHeadsThreshold:(float)a3
{
  self->_mergeHeadsThreshold = a3;
}

- (float)osfsThreshold
{
  return self->_osfsThreshold;
}

- (void)setOsfsThreshold:(float)a3
{
  self->_osfsThreshold = a3;
}

- (float)osfsSizeRatio
{
  return self->_osfsSizeRatio;
}

- (void)setOsfsSizeRatio:(float)a3
{
  self->_osfsSizeRatio = a3;
}

- (float)olmcsThreshold
{
  return self->_olmcsThreshold;
}

- (void)setOlmcsThreshold:(float)a3
{
  self->_olmcsThreshold = a3;
}

- (int)olmcsMergeCountDelta
{
  return self->_olmcsMergeCountDelta;
}

- (void)setOlmcsMergeCountDelta:(int)a3
{
  self->_olmcsMergeCountDelta = a3;
}

- (float)smartThreshold
{
  return self->_smartThreshold;
}

- (void)setSmartThreshold:(float)a3
{
  self->_smartThreshold = a3;
}

- (float)smartDistanceFactor
{
  return self->_smartDistanceFactor;
}

- (void)setSmartDistanceFactor:(float)a3
{
  self->_smartDistanceFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterThreshold, 0);

  objc_storeStrong((id *)&self->_network, 0);
}

@end