@interface VNShotflowDetectorANSTv1
+ (Class)VNShotflowNetworkClass;
+ (id)defaultFilterThresholds;
+ (id)filterThresholdsArrayForFilterThresholds:(id)a3 error:(id *)a4;
+ (id)supportedLabelKeys;
- (VNShotflowDetectorANSTv1)initWithNetwork:(id)a3;
- (id)getIndexBoxes:(id)a3 filterThresholdIndex:(unint64_t)a4;
- (id)modifySmallFaceThreshold:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6;
- (id)nmsBoxes:(id)a3 usingThresholds:(id)a4;
- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6;
@end

@implementation VNShotflowDetectorANSTv1

+ (Class)VNShotflowNetworkClass
{
  return (Class)objc_opt_class();
}

+ (id)filterThresholdsArrayForFilterThresholds:(id)a3 error:(id *)a4
{
  v10[12] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v10[0] = @"VNShotflowDetectorFilterThresholdKey_HumanFace";
  v10[1] = @"VNShotflowDetectorFilterThresholdKey_HumanHead";
  v10[2] = @"VNShotflowDetectorFilterThresholdKey_HumanBody";
  v10[3] = @"VNShotflowDetectorFilterThresholdKey_CatBody";
  v10[4] = @"VNShotflowDetectorFilterThresholdKey_DogBody";
  v10[5] = @"VNShotflowDetectorFilterThresholdKey_Other";
  v10[6] = @"VNShotflowDetectorFilterThresholdKey_Food";
  v10[7] = @"VNShotflowDetectorFilterThresholdKey_Drink";
  v10[8] = @"VNShotflowDetectorFilterThresholdKey_CatHead";
  v10[9] = @"VNShotflowDetectorFilterThresholdKey_DogHead";
  v10[10] = @"VNShotflowDetectorFilterThresholdKey_SportsBall";
  v10[11] = @"VNShotflowDetectorFilterThresholdKey_FullBody";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:12];
  v8 = +[VNShotflowDetector _filterThresholdsArrayFromKeys:inFilterThresholds:error:]((uint64_t)a1, v7, v6, a4);

  return v8;
}

+ (id)defaultFilterThresholds
{
  if (+[VNShotflowDetectorANSTv1 defaultFilterThresholds]::onceToken != -1) {
    dispatch_once(&+[VNShotflowDetectorANSTv1 defaultFilterThresholds]::onceToken, &__block_literal_global_269);
  }
  v2 = (void *)+[VNShotflowDetectorANSTv1 defaultFilterThresholds]::filterThresholds;

  return v2;
}

void __51__VNShotflowDetectorANSTv1_defaultFilterThresholds__block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNShotflowDetectorFilterThresholdKey_HumanFace";
  v2[1] = @"VNShotflowDetectorFilterThresholdKey_HumanHead";
  v3[0] = &unk_1EF7A8290;
  v3[1] = &unk_1EF7A82A0;
  v2[2] = @"VNShotflowDetectorFilterThresholdKey_HumanBody";
  v2[3] = @"VNShotflowDetectorFilterThresholdKey_CatBody";
  v3[2] = &unk_1EF7A82B0;
  v3[3] = &unk_1EF7A82C0;
  v2[4] = @"VNShotflowDetectorFilterThresholdKey_DogBody";
  v2[5] = @"VNShotflowDetectorFilterThresholdKey_Other";
  v3[4] = &unk_1EF7A82D0;
  v3[5] = &unk_1EF7A8040;
  v2[6] = @"VNShotflowDetectorFilterThresholdKey_Food";
  v2[7] = @"VNShotflowDetectorFilterThresholdKey_Drink";
  v3[6] = &unk_1EF7A82E0;
  v3[7] = &unk_1EF7A82F0;
  v2[8] = @"VNShotflowDetectorFilterThresholdKey_CatHead";
  v2[9] = @"VNShotflowDetectorFilterThresholdKey_DogHead";
  v3[8] = &unk_1EF7A8300;
  v3[9] = &unk_1EF7A8310;
  v2[10] = @"VNShotflowDetectorFilterThresholdKey_SportsBall";
  v2[11] = @"VNShotflowDetectorFilterThresholdKey_FullBody";
  v3[10] = &unk_1EF7A8320;
  v3[11] = &unk_1EF7A8100;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  v1 = (void *)+[VNShotflowDetectorANSTv1 defaultFilterThresholds]::filterThresholds;
  +[VNShotflowDetectorANSTv1 defaultFilterThresholds]::filterThresholds = v0;
}

+ (id)supportedLabelKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VNShotflowDetectorANSTv1_supportedLabelKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowDetectorANSTv1 supportedLabelKeys]::onceToken != -1) {
    dispatch_once(&+[VNShotflowDetectorANSTv1 supportedLabelKeys]::onceToken, block);
  }
  v2 = (void *)+[VNShotflowDetectorANSTv1 supportedLabelKeys]::supportedLabelKeys;

  return v2;
}

void __46__VNShotflowDetectorANSTv1_supportedLabelKeys__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___VNShotflowDetectorANSTv1;
  uint64_t v1 = objc_msgSendSuper2(&v3, sel_supportedLabelKeys);
  v2 = (void *)+[VNShotflowDetectorANSTv1 supportedLabelKeys]::supportedLabelKeys;
  +[VNShotflowDetectorANSTv1 supportedLabelKeys]::supportedLabelKeys = v1;
}

- (id)nmsBoxes:(id)a3 usingThresholds:(id)a4
{
  id v21 = a3;
  id v18 = a4;
  v20 = self;
  [(VNShotflowDetector *)self nmsThreshold];
  float v7 = v6;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v19 = [v18 count];
  if (v19)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (i)
      {
        v9 = [(VNShotflowDetectorANSTv1 *)v20 getIndexBoxes:v21 filterThresholdIndex:i];
        [v22 addObjectsFromArray:v9];
      }
      else
      {
        v9 = [(VNShotflowDetector *)v20 sortBoxes:v21 filterThresholdIndex:0];
        unint64_t v10 = [v9 count];
        unsigned __int8 v23 = 0;
        std::vector<BOOL>::vector(&__p, v10, &v23);
        if (v10)
        {
          unint64_t v11 = 0;
          do
          {
            v12 = [v9 objectAtIndexedSubscript:v11];
            uint64_t v13 = *((void *)__p + (v11 >> 6));
            if ((v13 & (1 << v11)) != 0)
            {
              ++v11;
            }
            else
            {
              *((void *)__p + (v11 >> 6)) = v13 | (1 << v11);
              [v22 addObject:v12];
              unint64_t v14 = ++v11;
              if (v11 < v10)
              {
                do
                {
                  if ((*((void *)__p + (v14 >> 6)) & (1 << v14)) == 0)
                  {
                    v15 = [v9 objectAtIndexedSubscript:v14];
                    [v12 intersectionOverMinArea:v15];
                    if (v16 > v7) {
                      *((void *)__p + (v14 >> 6)) |= 1 << v14;
                    }
                  }
                  ++v14;
                }
                while (v10 != v14);
              }
            }
          }
          while (v11 != v10);
        }
        if (__p) {
          operator delete(__p);
        }
      }
    }
  }

  return v22;
}

- (id)getIndexBoxes:(id)a3 filterThresholdIndex:(unint64_t)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__VNShotflowDetectorANSTv1_getIndexBoxes_filterThresholdIndex___block_invoke;
  v9[3] = &__block_descriptor_40_e46_B24__0__VNShotflowDetection_8__NSDictionary_16l;
  v9[4] = a4;
  float v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:v9];
  float v7 = [v5 filteredArrayUsingPredicate:v6];

  return v7;
}

BOOL __63__VNShotflowDetectorANSTv1_getIndexBoxes_filterThresholdIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label] == *(_DWORD *)(a1 + 32) + 1;
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = (void *)MEMORY[0x1A6257080]();
  *(float *)&double v13 = a4;
  *(float *)&double v14 = a5;
  v15 = [(VNShotflowDetectorANSTv1 *)self modifySmallFaceThreshold:v10 withHeight:v11 andWidth:v13 filterThresholds:v14];

  float v16 = [(VNShotflowDetector *)self filterBoxes:v15 usingThresholds:v11];

  v17 = [(VNShotflowDetectorANSTv1 *)self nmsBoxes:v16 usingThresholds:v11];

  *(float *)&double v18 = a4;
  *(float *)&double v19 = a5;
  v20 = [(VNShotflowDetector *)self enforceSquareFaces:v17 withHeight:v18 andWidth:v19];

  id v21 = [(VNShotflowDetectorANODBase *)self mergeHeadsBoxes:v20];

  v26.receiver = self;
  v26.super_class = (Class)VNShotflowDetectorANSTv1;
  *(float *)&double v22 = a4;
  *(float *)&double v23 = a5;
  v24 = [(VNShotflowDetector *)&v26 processBoxes:v21 withHeight:v11 andWidth:v22 filterThresholds:v23];

  return v24;
}

- (id)modifySmallFaceThreshold:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a6;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v77 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        if ([v12 label] == 1 || objc_msgSend(v12, "label") == 2)
        {
          [v12 box];
          double v14 = v13;
          [v12 box];
          float v16 = v14 * v15;
          if (v16 < 0.005)
          {
            [v12 confidence];
            float v18 = v17;
            objc_msgSend(v8, "objectAtIndexedSubscript:", (int)(objc_msgSend(v12, "label") - 1));
            id v19 = (id)objc_claimAutoreleasedReturnValue();
            [v19 floatValue];
            if (v18 < v20)
            {
              [v12 confidence];
              float v22 = v21;
              double v23 = objc_msgSend(v8, "objectAtIndexedSubscript:", (int)(objc_msgSend(v12, "label") - 1));
              [v23 floatValue];
              float v25 = v24;
              objc_super v26 = objc_msgSend(&unk_1EF7A7D18, "objectAtIndexedSubscript:", (int)objc_msgSend(v12, "label"));
              [v26 floatValue];
              BOOL v28 = v22 > (float)(v25 - v27);

              if (!v28) {
                continue;
              }
              [v12 box];
              double v30 = v29;
              [v12 box];
              double v32 = v31;
              [v12 box];
              double v34 = v33;
              [v12 box];
              double v36 = v35;
              long long v74 = 0u;
              long long v75 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              id v19 = obj;
              uint64_t v37 = [v19 countByEnumeratingWithState:&v72 objects:v80 count:16];
              if (v37)
              {
                float v38 = v30 + v32 * 0.5;
                float v39 = v34 + v36 * 0.5;
                uint64_t v40 = *(void *)v73;
                double v71 = v16;
                do
                {
                  for (uint64_t j = 0; j != v37; ++j)
                  {
                    if (*(void *)v73 != v40) {
                      objc_enumerationMutation(v19);
                    }
                    v42 = *(void **)(*((void *)&v72 + 1) + 8 * j);
                    if ([v42 label] == 3)
                    {
                      [v42 confidence];
                      if (v43 > 0.635)
                      {
                        [v42 box];
                        double v45 = v44;
                        [v42 box];
                        double v47 = v46;
                        [v42 box];
                        double v49 = v48;
                        [v42 box];
                        double v51 = v50;
                        [v42 box];
                        double v53 = v52;
                        [v42 box];
                        float v54 = v45;
                        float v58 = v53 + v57;
                        if (v54 < v38)
                        {
                          float v56 = v49 + v51;
                          BOOL v59 = v38 < v56;
                        }
                        else
                        {
                          BOOL v59 = 0;
                        }
                        if (v59)
                        {
                          float v55 = v47;
                          BOOL v60 = v55 < v39;
                        }
                        else
                        {
                          BOOL v60 = 0;
                        }
                        if (v60 && v39 < v58)
                        {
                          [v42 box];
                          double v63 = v62;
                          [v42 box];
                          float v65 = v71 / (v63 * v64);
                          if (v65 > 0.03)
                          {
                            v66 = objc_msgSend(v8, "objectAtIndexedSubscript:", (int)(objc_msgSend(v12, "label") - 1));
                            [v66 floatValue];
                            *(float *)&double v68 = v67 + 0.001;
                            [v12 setConfidence:v68];
                          }
                        }
                      }
                    }
                  }
                  uint64_t v37 = [v19 countByEnumeratingWithState:&v72 objects:v80 count:16];
                }
                while (v37);
              }
            }
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
    }
    while (v9);
  }

  return obj;
}

- (VNShotflowDetectorANSTv1)initWithNetwork:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNShotflowDetectorANSTv1;
  objc_super v3 = [(VNShotflowDetector *)&v7 initWithNetwork:a3];
  v4 = v3;
  if (v3)
  {
    v3->super.super._nmsThreshold = 0.3;
    id v5 = v3;
  }

  return v4;
}

@end