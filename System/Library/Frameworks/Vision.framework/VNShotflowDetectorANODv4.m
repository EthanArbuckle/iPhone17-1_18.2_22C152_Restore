@interface VNShotflowDetectorANODv4
+ (Class)VNShotflowNetworkClass;
+ (id)defaultFilterThresholds;
+ (id)filterThresholdsArrayForFilterThresholds:(id)a3 error:(id *)a4;
+ (id)supportedLabelKeys;
- (VNShotflowDetectorANODv4)initWithNetwork:(id)a3;
- (id)getIndexBoxes:(id)a3 filterThresholdIndex:(unint64_t)a4;
- (id)nmsBoxes:(id)a3 usingThresholds:(id)a4;
- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6;
@end

@implementation VNShotflowDetectorANODv4

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
  if (+[VNShotflowDetectorANODv4 defaultFilterThresholds]::onceToken != -1) {
    dispatch_once(&+[VNShotflowDetectorANODv4 defaultFilterThresholds]::onceToken, &__block_literal_global_240);
  }
  v2 = (void *)+[VNShotflowDetectorANODv4 defaultFilterThresholds]::filterThresholds;

  return v2;
}

void __51__VNShotflowDetectorANODv4_defaultFilterThresholds__block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNShotflowDetectorFilterThresholdKey_HumanFace";
  v2[1] = @"VNShotflowDetectorFilterThresholdKey_HumanHead";
  v3[0] = &unk_1EF7A8070;
  v3[1] = &unk_1EF7A8080;
  v2[2] = @"VNShotflowDetectorFilterThresholdKey_HumanBody";
  v2[3] = @"VNShotflowDetectorFilterThresholdKey_CatBody";
  v3[2] = &unk_1EF7A8090;
  v3[3] = &unk_1EF7A80A0;
  v2[4] = @"VNShotflowDetectorFilterThresholdKey_DogBody";
  v2[5] = @"VNShotflowDetectorFilterThresholdKey_Other";
  v3[4] = &unk_1EF7A80B0;
  v3[5] = &unk_1EF7A8040;
  v2[6] = @"VNShotflowDetectorFilterThresholdKey_Food";
  v2[7] = @"VNShotflowDetectorFilterThresholdKey_Drink";
  v3[6] = &unk_1EF7A7FD0;
  v3[7] = &unk_1EF7A80C0;
  v2[8] = @"VNShotflowDetectorFilterThresholdKey_CatHead";
  v2[9] = @"VNShotflowDetectorFilterThresholdKey_DogHead";
  v3[8] = &unk_1EF7A80D0;
  v3[9] = &unk_1EF7A80E0;
  v2[10] = @"VNShotflowDetectorFilterThresholdKey_SportsBall";
  v2[11] = @"VNShotflowDetectorFilterThresholdKey_FullBody";
  v3[10] = &unk_1EF7A80F0;
  v3[11] = &unk_1EF7A8100;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  v1 = (void *)+[VNShotflowDetectorANODv4 defaultFilterThresholds]::filterThresholds;
  +[VNShotflowDetectorANODv4 defaultFilterThresholds]::filterThresholds = v0;
}

+ (id)supportedLabelKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VNShotflowDetectorANODv4_supportedLabelKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowDetectorANODv4 supportedLabelKeys]::onceToken != -1) {
    dispatch_once(&+[VNShotflowDetectorANODv4 supportedLabelKeys]::onceToken, block);
  }
  v2 = (void *)+[VNShotflowDetectorANODv4 supportedLabelKeys]::supportedLabelKeys;

  return v2;
}

void __46__VNShotflowDetectorANODv4_supportedLabelKeys__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___VNShotflowDetectorANODv4;
  uint64_t v1 = objc_msgSendSuper2(&v3, sel_supportedLabelKeys);
  v2 = (void *)+[VNShotflowDetectorANODv4 supportedLabelKeys]::supportedLabelKeys;
  +[VNShotflowDetectorANODv4 supportedLabelKeys]::supportedLabelKeys = v1;
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
        v9 = [(VNShotflowDetectorANODv4 *)v20 getIndexBoxes:v21 filterThresholdIndex:i];
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
  v9[2] = __63__VNShotflowDetectorANODv4_getIndexBoxes_filterThresholdIndex___block_invoke;
  v9[3] = &__block_descriptor_40_e46_B24__0__VNShotflowDetection_8__NSDictionary_16l;
  v9[4] = a4;
  float v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:v9];
  float v7 = [v5 filteredArrayUsingPredicate:v6];

  return v7;
}

BOOL __63__VNShotflowDetectorANODv4_getIndexBoxes_filterThresholdIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label] == *(_DWORD *)(a1 + 32) + 1;
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = (void *)MEMORY[0x1A6257080]();
  uint64_t v13 = [(VNShotflowDetector *)self filterBoxes:v10 usingThresholds:v11];

  unint64_t v14 = [(VNShotflowDetectorANODv4 *)self nmsBoxes:v13 usingThresholds:v11];

  *(float *)&double v15 = a4;
  *(float *)&double v16 = a5;
  v17 = [(VNShotflowDetector *)self enforceSquareFaces:v14 withHeight:v15 andWidth:v16];

  id v18 = [(VNShotflowDetectorANODBase *)self mergeHeadsBoxes:v17];

  v23.receiver = self;
  v23.super_class = (Class)VNShotflowDetectorANODv4;
  *(float *)&double v19 = a4;
  *(float *)&double v20 = a5;
  id v21 = [(VNShotflowDetector *)&v23 processBoxes:v18 withHeight:v11 andWidth:v19 filterThresholds:v20];

  return v21;
}

- (VNShotflowDetectorANODv4)initWithNetwork:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNShotflowDetectorANODv4;
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