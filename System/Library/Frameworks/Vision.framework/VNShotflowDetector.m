@interface VNShotflowDetector
+ (CGSize)getSuggestedImageSize:(CGSize)a3;
+ (CGSize)inputImageSize;
+ (NSSet)supportedLabelKeys;
+ (NSString)inputLayerName;
+ (NSString)modelName;
+ (float)inputImageAspectRatio;
+ (float)inputImageMaxDimension;
+ (float)inputImageMinDimension;
+ (float)networkThreshold;
+ (id)_filterThresholdsArrayFromKeys:(void *)a3 inFilterThresholds:(void *)a4 error:;
+ (id)processingDeviceDetectorWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4;
+ (id)processingDeviceDetectorWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4 networkThreshold:(float)a5;
+ (id)processingDeviceDetectorWithModelPath:(id)a3 networkThreshold:(float)a4 preferredDeviceID:(int)a5 engineID:(int)a6 storageType:(int)a7;
+ (id)processingDeviceDetectorWithModelPath:(id)a3 preferredDeviceID:(int)a4 engineID:(int)a5 storageType:(int)a6;
- (VNShotflowDetector)initWithNetwork:(id)a3;
- (float)nmsThreshold;
- (float)olmcsThreshold;
- (float)osfsSizeRatio;
- (float)osfsThreshold;
- (float)smartDistanceFactor;
- (float)smartThreshold;
- (float)threshold;
- (id)detect:(const vImage_Buffer *)a3 inputIsBGR:(BOOL)a4;
- (id)detectAndProcessObjects:(const vImage_Buffer *)a3 filterThresholds:(id)a4 inputIsBGR:(BOOL)a5;
- (id)enforceSquareFaces:(id)a3 withHeight:(float)a4 andWidth:(float)a5;
- (id)filterBoxes:(id)a3 usingThresholds:(id)a4;
- (id)mergeBoxes:(id)a3;
- (id)nmsBoxes:(id)a3 usingThresholds:(id)a4;
- (id)overlappingLowMergeCountSuppression:(id)a3;
- (id)overlappingSmallFacesSuppression:(id)a3;
- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6;
- (id)smartMergeBoxes:(id)a3;
- (id)sortBoxes:(id)a3 filterThresholdIndex:(unint64_t)a4;
- (int)olmcsMergeCountDelta;
- (void)setNmsThreshold:(float)a3;
- (void)setOlmcsMergeCountDelta:(int)a3;
- (void)setOlmcsThreshold:(float)a3;
- (void)setOsfsSizeRatio:(float)a3;
- (void)setOsfsThreshold:(float)a3;
- (void)setSmartDistanceFactor:(float)a3;
- (void)setSmartThreshold:(float)a3;
- (void)setThreshold:(float)a3;
@end

@implementation VNShotflowDetector

+ (NSString)modelName
{
  v2 = (void *)[a1 VNShotflowNetworkClass];

  return (NSString *)[v2 modelName];
}

- (void).cxx_destruct
{
}

- (void)setSmartDistanceFactor:(float)a3
{
  self->_smartDistanceFactor = a3;
}

- (float)smartDistanceFactor
{
  return self->_smartDistanceFactor;
}

- (void)setSmartThreshold:(float)a3
{
  self->_smartThreshold = a3;
}

- (float)smartThreshold
{
  return self->_smartThreshold;
}

- (void)setOlmcsMergeCountDelta:(int)a3
{
  self->_olmcsMergeCountDelta = a3;
}

- (int)olmcsMergeCountDelta
{
  return self->_olmcsMergeCountDelta;
}

- (void)setOlmcsThreshold:(float)a3
{
  self->_olmcsThreshold = a3;
}

- (float)olmcsThreshold
{
  return self->_olmcsThreshold;
}

- (void)setOsfsSizeRatio:(float)a3
{
  self->_osfsSizeRatio = a3;
}

- (float)osfsSizeRatio
{
  return self->_osfsSizeRatio;
}

- (void)setOsfsThreshold:(float)a3
{
  self->_osfsThreshold = a3;
}

- (float)osfsThreshold
{
  return self->_osfsThreshold;
}

- (void)setNmsThreshold:(float)a3
{
  self->_nmsThreshold = a3;
}

- (float)nmsThreshold
{
  return self->_nmsThreshold;
}

- (id)enforceSquareFaces:(id)a3 withHeight:(float)a4 andWidth:(float)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  id v9 = 0;
  if (a4 != 0.0 && a5 != 0.0)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v14, "label", (void)v24) == 1)
          {
            [v14 box];
            double v16 = v15;
            double v18 = v17;
            [v14 boxCenter];
            float v19 = v16;
            float v20 = v18;
            *(float *)&double v21 = v21;
            *(float *)&double v22 = v22;
            objc_msgSend(v14, "setBox:", (float)(*(float *)&v21- (float)((float)((float)((float)((float)(v20 * a4) + (float)(v19 * a5)) * 0.5) / a5) * 0.5)), (float)(*(float *)&v22- (float)((float)((float)((float)((float)(v20 * a4) + (float)(v19 * a5)) * 0.5) / a4) * 0.5)), (float)((float)((float)((float)(v20 * a4) + (float)(v19 * a5)) * 0.5) / a5), (float)((float)((float)((float)(v20 * a4) + (float)(v19 * a5)) * 0.5) / a4));
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    id v9 = v10;
  }

  return v9;
}

- (id)detectAndProcessObjects:(const vImage_Buffer *)a3 filterThresholds:(id)a4 inputIsBGR:(BOOL)a5
{
  id v7 = a4;
  v8 = [(VNShotflowDetector *)self detect:a3 inputIsBGR:1];
  *(float *)&double v9 = (float)a3->height;
  *(float *)&double v10 = (float)a3->width;
  uint64_t v11 = [(VNShotflowDetector *)self processBoxes:v8 withHeight:v7 andWidth:v9 filterThresholds:v10];

  return v11;
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v39, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = v39;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v43;
    double v40 = a4;
    double v41 = a5;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        BOOL v14 = [v13 label] != 1;
        [v13 box];
        double v16 = v15;
        [v13 box];
        double v18 = v17;
        [v13 box];
        double v20 = v19;
        [v13 box];
        double v22 = v21;
        v23 = [VNANFDDetectedObject alloc];
        [v13 confidence];
        unsigned int v25 = v24;
        [v13 rotationAngle];
        int v27 = v26;
        [v13 yawAngle];
        int v29 = v28;
        [v13 pitchAngle];
        int v31 = v30;
        uint64_t v32 = [v13 label];
        uint64_t v33 = [v13 groupId];
        LODWORD(v34) = v27;
        LODWORD(v35) = v29;
        LODWORD(v36) = v31;
        v37 = -[VNANFDDetectedObject initWithObjectType:boundingBox:confidence:rotationAngle:yawAngle:pitchAngle:labelKey:groupId:](v23, "initWithObjectType:boundingBox:confidence:rotationAngle:yawAngle:pitchAngle:labelKey:groupId:", v14, v32, v33, v16 * v41, v40 - (v20 * v40 + v22 * v40), v18 * v41, v22 * v40, COERCE_DOUBLE(__PAIR64__(HIDWORD(v40), v25)), v34, v35, v36);
        [v8 addObject:v37];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v10);
  }

  return v8;
}

- (id)detect:(const vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  network = self->_network;
  long long v5 = *(_OWORD *)&a3->width;
  v8[0] = *(_OWORD *)&a3->data;
  v8[1] = v5;
  v6 = [(VNShotflowNetwork *)network resizeAndProcessVImage:v8 inputIsBGR:a4];

  return v6;
}

- (id)filterBoxes:(id)a3 usingThresholds:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [v6 count];
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v10 = [v6 objectAtIndexedSubscript:i];
      [v10 floatValue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __50__VNShotflowDetector_filterBoxes_usingThresholds___block_invoke;
      v15[3] = &__block_descriptor_44_e46_B24__0__VNShotflowDetection_8__NSDictionary_16l;
      int v16 = v11;
      v15[4] = i;
      uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:v15];
      v13 = [v5 filteredArrayUsingPredicate:v12];

      [v7 addObjectsFromArray:v13];
    }
  }

  return v7;
}

BOOL __50__VNShotflowDetector_filterBoxes_usingThresholds___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 confidence];
  BOOL v5 = v4 >= *(float *)(a1 + 40) && [v3 label] == *(_DWORD *)(a1 + 32) + 1;

  return v5;
}

- (id)sortBoxes:(id)a3 filterThresholdIndex:(unint64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__VNShotflowDetector_sortBoxes_filterThresholdIndex___block_invoke;
  v12[3] = &__block_descriptor_40_e46_B24__0__VNShotflowDetection_8__NSDictionary_16l;
  v12[4] = a4;
  id v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:v12];
  id v7 = [v5 filteredArrayUsingPredicate:v6];

  uint64_t v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
  v13[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v10 = [v7 sortedArrayUsingDescriptors:v9];

  return v10;
}

BOOL __53__VNShotflowDetector_sortBoxes_filterThresholdIndex___block_invoke(uint64_t a1, void *a2)
{
  return *(void *)(a1 + 32) + 1 == (int)[a2 label];
}

- (id)nmsBoxes:(id)a3 usingThresholds:(id)a4
{
  return 0;
}

- (id)smartMergeBoxes:(id)a3
{
  v124[1] = *MEMORY[0x1E4F143B8];
  id v108 = a3;
  float v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"smartDistance" ascending:1];
  v124[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:1];
  id v6 = [v108 sortedArrayUsingDescriptors:v5];

  unint64_t v7 = [v6 count];
  unsigned __int8 v122 = 0;
  std::vector<BOOL>::vector(&__p, v7, &v122);
  [(VNShotflowDetector *)self smartThreshold];
  float v117 = v8;
  [(VNShotflowDetector *)self smartDistanceFactor];
  float v116 = v9;
  id v109 = [MEMORY[0x1E4F1CA48] array];
  if (v7)
  {
    unint64_t v10 = 0;
    double v115 = (float)(1.0 - v117);
    do
    {
      int v11 = [v6 objectAtIndexedSubscript:v10];
      uint64_t v12 = v11;
      uint64_t v13 = *((void *)__p + (v10 >> 6));
      if ((v13 & (1 << v10)) != 0)
      {
        ++v10;
      }
      else
      {
        *((void *)__p + (v10 >> 6)) = v13 | (1 << v10);
        [v11 confidence];
        float v114 = v14;
        [v12 box];
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        [v12 boxCenter];
        double v118 = v24;
        double v119 = v23;
        *(float *)&double v23 = v20;
        float v25 = v114 * *(float *)&v23;
        *(float *)&double v23 = v22;
        float v112 = v114 * *(float *)&v23;
        float v113 = v25;
        *(float *)&double v23 = v18;
        float v26 = v114 * *(float *)&v23;
        *(float *)&double v23 = v16;
        float v110 = v114 * *(float *)&v23;
        float v111 = v26;
        ++v10;
        uint64_t v27 = 1;
        if (v10 < v7)
        {
          unint64_t v28 = v10;
          do
          {
            if ((*((void *)__p + (v28 >> 6)) & (1 << v28)) == 0)
            {
              int v29 = [v6 objectAtIndexedSubscript:v28];
              [v29 boxCenter];
              double v31 = v30;
              double v33 = v32;
              [v12 overlap:v29];
              float v35 = v34;
              [v12 box];
              double v37 = v36;
              [v12 box];
              double v39 = v38;
              [v29 box];
              double v41 = v40;
              [v29 box];
              double v43 = v42;
              [v12 box];
              double v45 = v44;
              [v12 box];
              float v47 = v41 + v43;
              float v48 = v45 + v46;
              if (v47 >= v48) {
                float v49 = v45 + v46;
              }
              else {
                float v49 = v41 + v43;
              }
              [v29 box];
              double v51 = v50;
              float v121 = v49;
              [v12 box];
              float v52 = v51;
              float v54 = v53;
              if (v52 >= v54) {
                float v54 = v51;
              }
              float v120 = v54;
              [v29 box];
              double v56 = v55;
              [v29 box];
              double v58 = v57;
              [v12 box];
              double v60 = v59;
              [v12 box];
              float v62 = v56 + v58;
              float v63 = v60 + v61;
              if (v62 >= v63) {
                float v64 = v60 + v61;
              }
              else {
                float v64 = v56 + v58;
              }
              [v29 box];
              double v66 = v65;
              [v12 box];
              float v67 = sqrt((v119 - v31) * (v119 - v31) + (v118 - v33) * (v118 - v33));
              float v68 = fmin(v37, v39);
              float v69 = v66;
              float v71 = v70;
              if (v69 >= v71) {
                float v72 = v66;
              }
              else {
                float v72 = v71;
              }
              if ((float)((float)(1.0 - sqrtf(v35)) + (float)((float)(v116 * v67) / v68)) < v117)
              {
                [v12 box];
                if (v73 * v115 <= fmaxf(v121 - v120, 0.0))
                {
                  [v12 box];
                  if (v74 * v115 <= fmaxf(v64 - v72, 0.0))
                  {
                    *((void *)__p + (v28 >> 6)) |= 1 << v28;
                    [v29 box];
                    double v76 = v75;
                    double v78 = v77;
                    double v80 = v79;
                    double v82 = v81;
                    [v29 confidence];
                    float v83 = v76;
                    float v85 = v110 + (float)(v84 * v83);
                    float v86 = v78;
                    float v110 = v85;
                    float v111 = v111 + (float)(v84 * v86);
                    float v87 = v80;
                    float v88 = v113 + (float)(v84 * v87);
                    float v89 = v82;
                    float v112 = v112 + (float)(v84 * v89);
                    float v113 = v88;
                    float v114 = v114 + v84;
                    uint64_t v27 = (v27 + 1);
                  }
                }
              }
            }
            ++v28;
          }
          while (v7 != v28);
        }
        v90 = [VNShotflowDetection alloc];
        [v12 defaultBox];
        double v92 = v91;
        double v94 = v93;
        double v96 = v95;
        double v98 = v97;
        [v12 confidence];
        unsigned int v100 = v99;
        uint64_t v101 = [v12 scale];
        [v12 rotationAngle];
        unsigned int v103 = v102;
        [v12 yawAngle];
        LODWORD(v107) = v104;
        v105 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:hasLabel:label:](v90, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:hasLabel:label:", v101, v27, [v12 hasLabel], objc_msgSend(v12, "label"), (float)(v110 / v114), (float)(v111 / v114), (float)(v113 / v114), (float)(v112 / v114), v92, v94, v96, v98, __PAIR64__(v103, v100), v107);
        [v109 addObject:v105];
      }
    }
    while (v10 != v7);
  }
  if (__p) {
    operator delete(__p);
  }

  return v109;
}

- (id)mergeBoxes:(id)a3
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  float v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
  v68[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
  id v6 = [v58 sortedArrayUsingDescriptors:v5];

  unint64_t v7 = [v6 count];
  unsigned __int8 v66 = 0;
  std::vector<BOOL>::vector(&__p, v7, &v66);
  [(VNShotflowDetector *)self nmsThreshold];
  float v65 = v8;
  id v59 = [MEMORY[0x1E4F1CA48] array];
  if (v7)
  {
    unint64_t v9 = 0;
    do
    {
      unint64_t v10 = [v6 objectAtIndexedSubscript:v9];
      int v11 = v10;
      uint64_t v12 = *((void *)__p + (v9 >> 6));
      if ((v12 & (1 << v9)) != 0)
      {
        ++v9;
      }
      else
      {
        *((void *)__p + (v9 >> 6)) = v12 | (1 << v9);
        [v10 confidence];
        float v14 = v13;
        [v11 box];
        *(float *)&double v15 = v15;
        float v16 = v14 * *(float *)&v15;
        *(float *)&double v15 = v17;
        float v18 = v14 * *(float *)&v15;
        *(float *)&double v15 = v19;
        float v20 = v14 * *(float *)&v15;
        *(float *)&double v15 = v21;
        float v22 = v14 * *(float *)&v15;
        ++v9;
        uint64_t v23 = 1;
        if (v9 < v7)
        {
          unint64_t v24 = v9;
          do
          {
            if ((*((void *)__p + (v24 >> 6)) & (1 << v24)) == 0)
            {
              float v25 = [v6 objectAtIndexedSubscript:v24];
              [v11 overlap:v25];
              if (v26 > v65)
              {
                float v63 = v14;
                float v27 = v20;
                float v28 = v18;
                *((void *)__p + (v24 >> 6)) |= 1 << v24;
                [v25 box];
                double v30 = v29;
                double v32 = v31;
                double v34 = v33;
                double v36 = v35;
                [v25 confidence];
                float v37 = v30;
                float v16 = v16 + (float)(v38 * v37);
                float v39 = v32;
                float v18 = v28 + (float)(v38 * v39);
                float v40 = v34;
                float v22 = v22 + (float)(v38 * v40);
                float v41 = v36;
                float v20 = v27 + (float)(v38 * v41);
                float v14 = v63 + v38;
                uint64_t v23 = (v23 + 1);
              }
            }
            ++v24;
          }
          while (v7 != v24);
        }
        float v42 = v22;
        float v43 = v16;
        double v44 = [VNShotflowDetection alloc];
        [v11 defaultBox];
        double v62 = v46;
        double v64 = v45;
        double v60 = v48;
        double v61 = v47;
        [v11 confidence];
        unsigned int v50 = v49;
        uint64_t v51 = [v11 scale];
        [v11 rotationAngle];
        unsigned int v53 = v52;
        [v11 yawAngle];
        LODWORD(v57) = v54;
        double v55 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:hasLabel:label:](v44, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:hasLabel:label:", v51, v23, [v11 hasLabel], objc_msgSend(v11, "label"), (float)(v43 / v14), (float)(v18 / v14), (float)(v42 / v14), (float)(v20 / v14), v64, v62, v61, v60, __PAIR64__(v53, v50), v57);
        [v59 addObject:v55];
      }
    }
    while (v9 != v7);
  }
  if (__p) {
    operator delete(__p);
  }

  return v59;
}

- (id)overlappingLowMergeCountSuppression:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  float v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"mergesCount" ascending:0];
  v22[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v6 = [v18 sortedArrayUsingDescriptors:v5];

  unint64_t v7 = [v6 count];
  unsigned __int8 v20 = 0;
  std::vector<BOOL>::vector(&__p, v7, &v20);
  [(VNShotflowDetector *)self olmcsThreshold];
  int v9 = v8;
  uint64_t v10 = [(VNShotflowDetector *)self olmcsMergeCountDelta];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = [v6 objectAtIndexedSubscript:v11];
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
                double v15 = [v6 objectAtIndexedSubscript:v14];
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

- (id)overlappingSmallFacesSuppression:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  float v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"confidence" ascending:0];
  v24[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v6 = [v21 sortedArrayUsingDescriptors:v5];

  unint64_t v7 = [v6 count];
  unsigned __int8 v22 = 0;
  std::vector<BOOL>::vector(&__p, v7, &v22);
  [(VNShotflowDetector *)self osfsThreshold];
  int v9 = v8;
  [(VNShotflowDetector *)self osfsSizeRatio];
  int v11 = v10;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    unint64_t v13 = 0;
    do
    {
      unint64_t v14 = [v6 objectAtIndexedSubscript:v13];
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
              double v17 = [v6 objectAtIndexedSubscript:v16];
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

- (void)setThreshold:(float)a3
{
}

- (float)threshold
{
  [(VNShotflowNetwork *)self->_network threshold];
  return result;
}

- (VNShotflowDetector)initWithNetwork:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNShotflowDetector;
  id v6 = [(VNShotflowDetector *)&v9 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_network, a3);
    v7->_nmsThreshold = 0.45;
    *(void *)&v7->_osfsThreshold = 0x3F4CCCCD3F0CCCCDLL;
    *(void *)&v7->_olmcsThreshold = 0x53E99999ALL;
    *(void *)&v7->_smartThreshold = 0x3F8000003F19999ALL;
  }

  return v7;
}

+ (CGSize)getSuggestedImageSize:(CGSize)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a3.width >= a3.height) {
    double height = a3.height;
  }
  else {
    double height = a3.width;
  }
  if (a3.height >= a3.width) {
    double width = a3.height;
  }
  else {
    double width = a3.width;
  }
  if (height != 0.0 && width != 0.0)
  {
    double v7 = a3.height;
    double v8 = a3.width;
    [a1 inputImageMinDimension];
    if (v10 != 0.0)
    {
      [a1 inputImageMaxDimension];
      float v12 = v11;
      [a1 inputImageMinDimension];
      if (width / height >= (float)(v12 / v13))
      {
        [a1 inputImageMaxDimension];
        double height = width;
      }
      else
      {
        [a1 inputImageMinDimension];
      }
      double v15 = v14 / height;
      double v3 = round(v8 * v15);
      double v4 = round(v7 * v15);
    }
  }
  double v16 = v3;
  double v17 = v4;
  result.double height = v17;
  result.double width = v16;
  return result;
}

+ (float)networkThreshold
{
  return 0.1;
}

+ (id)processingDeviceDetectorWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4
{
  uint64_t v5 = *(void *)&a3.var1;
  var0 = a3.var0;
  double v8 = (void *)[a1 VNShotflowNetworkClass];
  [a1 networkThreshold];
  objc_super v9 = [v8 processingDeviceDetectorWithEspressoNetwork:var0 espressoPlan:v5 threshold:a4];
  float v10 = (void *)[objc_alloc((Class)a1) initWithNetwork:v9];

  return v10;
}

+ (id)processingDeviceDetectorWithEspressoNetwork:(id)a3 espressoPlan:(void *)a4 networkThreshold:(float)a5
{
  uint64_t v7 = *(void *)&a3.var1;
  var0 = a3.var0;
  float v10 = (void *)[a1 VNShotflowNetworkClass];
  *(float *)&double v11 = a5;
  float v12 = objc_msgSend(v10, "processingDeviceDetectorWithEspressoNetwork:espressoPlan:threshold:", var0, v7, a4, v11);
  float v13 = (void *)[objc_alloc((Class)a1) initWithNetwork:v12];

  return v13;
}

+ (id)processingDeviceDetectorWithModelPath:(id)a3 preferredDeviceID:(int)a4 engineID:(int)a5 storageType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  double v11 = (void *)[a1 VNShotflowNetworkClass];
  [a1 networkThreshold];
  float v12 = objc_msgSend(v11, "processingDeviceNetworkWithModelPath:threshold:preferredDeviceID:engineID:storageType:", v10, v8, v7, v6);
  float v13 = (void *)[objc_alloc((Class)a1) initWithNetwork:v12];

  return v13;
}

+ (id)processingDeviceDetectorWithModelPath:(id)a3 networkThreshold:(float)a4 preferredDeviceID:(int)a5 engineID:(int)a6 storageType:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  float v13 = (void *)[a1 VNShotflowNetworkClass];
  *(float *)&double v14 = a4;
  double v15 = [v13 processingDeviceNetworkWithModelPath:v12 threshold:v9 preferredDeviceID:v8 engineID:v7 storageType:v14];
  double v16 = (void *)[objc_alloc((Class)a1) initWithNetwork:v15];

  return v16;
}

+ (NSSet)supportedLabelKeys
{
  v2 = objc_msgSend((id)objc_msgSend(a1, "VNShotflowNetworkClass"), "importantClasses");
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:(uint64_t)(v2[1] - *v2) >> 3];
  double v4 = (void *)*v2;
  uint64_t v5 = (void *)v2[1];
  if ((void *)*v2 != v5)
  {
    do
    {
      uint64_t v6 = [NSNumber numberWithUnsignedLong:*v4];
      [v3 addObject:v6];

      ++v4;
    }
    while (v4 != v5);
  }
  uint64_t v7 = (void *)[v3 copy];

  return (NSSet *)v7;
}

+ (float)inputImageAspectRatio
{
  v2 = (void *)[a1 VNShotflowNetworkClass];

  [v2 inputImageAspectRatio];
  return result;
}

+ (float)inputImageMaxDimension
{
  v2 = (void *)[a1 VNShotflowNetworkClass];

  [v2 inputImageMaxDimension];
  return result;
}

+ (float)inputImageMinDimension
{
  v2 = (void *)[a1 VNShotflowNetworkClass];

  [v2 inputImageMinDimension];
  return result;
}

+ (CGSize)inputImageSize
{
  v2 = (void *)[a1 VNShotflowNetworkClass];

  [v2 inputImageSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

+ (NSString)inputLayerName
{
  v2 = (void *)[a1 VNShotflowNetworkClass];

  return (NSString *)[v2 inputLayerName];
}

+ (id)_filterThresholdsArrayFromKeys:(void *)a3 inFilterThresholds:(void *)a4 error:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  self;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        double v14 = [v7 objectForKeyedSubscript:v13];
        if (!v14)
        {
          if (a4)
          {
            double v16 = (void *)[[NSString alloc] initWithFormat:@"could not obtain the threshold value for %@", v13];
            *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v16];
          }
          id v15 = 0;
          goto LABEL_13;
        }
        [v8 addObject:v14];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v15 = v8;
LABEL_13:

  return v15;
}

@end