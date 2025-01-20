@interface VNShotflowDetectorANFDv1
+ (Class)VNShotflowNetworkClass;
+ (id)defaultFilterThresholds;
+ (id)filterThresholdsArrayForFilterThresholds:(id)a3 error:(id *)a4;
+ (id)supportedLabelKeys;
- (VNShotflowDetectorANFDv1)initWithNetwork:(id)a3;
- (id)nmsBoxes:(id)a3 usingThresholds:(id)a4;
- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6;
@end

@implementation VNShotflowDetectorANFDv1

+ (id)filterThresholdsArrayForFilterThresholds:(id)a3 error:(id *)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v10[0] = @"VNShotflowDetectorFilterThresholdKey_HumanFace";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v8 = +[VNShotflowDetector _filterThresholdsArrayFromKeys:inFilterThresholds:error:]((uint64_t)a1, v7, v6, a4);

  return v8;
}

+ (id)defaultFilterThresholds
{
  if (+[VNShotflowDetectorANFDv1 defaultFilterThresholds]::onceToken != -1) {
    dispatch_once(&+[VNShotflowDetectorANFDv1 defaultFilterThresholds]::onceToken, &__block_literal_global_11881);
  }
  v2 = (void *)+[VNShotflowDetectorANFDv1 defaultFilterThresholds]::filterThresholds;

  return v2;
}

void __51__VNShotflowDetectorANFDv1_defaultFilterThresholds__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = @"VNShotflowDetectorFilterThresholdKey_HumanFace";
  v3[0] = &unk_1EF7A7FB0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)+[VNShotflowDetectorANFDv1 defaultFilterThresholds]::filterThresholds;
  +[VNShotflowDetectorANFDv1 defaultFilterThresholds]::filterThresholds = v0;
}

+ (Class)VNShotflowNetworkClass
{
  return (Class)objc_opt_class();
}

+ (id)supportedLabelKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VNShotflowDetectorANFDv1_supportedLabelKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowDetectorANFDv1 supportedLabelKeys]::onceToken != -1) {
    dispatch_once(&+[VNShotflowDetectorANFDv1 supportedLabelKeys]::onceToken, block);
  }
  v2 = (void *)+[VNShotflowDetectorANFDv1 supportedLabelKeys]::supportedLabelKeys;

  return v2;
}

void __46__VNShotflowDetectorANFDv1_supportedLabelKeys__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___VNShotflowDetectorANFDv1;
  uint64_t v1 = objc_msgSendSuper2(&v3, sel_supportedLabelKeys);
  v2 = (void *)+[VNShotflowDetectorANFDv1 supportedLabelKeys]::supportedLabelKeys;
  +[VNShotflowDetectorANFDv1 supportedLabelKeys]::supportedLabelKeys = v1;
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
      v9 = [(VNShotflowDetector *)v20 sortBoxes:v21 filterThresholdIndex:i];
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
                  [v12 overlap:v15];
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

  return v22;
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = (void *)MEMORY[0x1A6257080]();
  uint64_t v13 = [(VNShotflowDetector *)self smartMergeBoxes:v10];

  unint64_t v14 = [(VNShotflowDetectorANFDv1 *)self nmsBoxes:v13 usingThresholds:v11];

  v15 = [(VNShotflowDetector *)self overlappingSmallFacesSuppression:v14];

  float v16 = [(VNShotflowDetector *)self overlappingLowMergeCountSuppression:v15];

  v17 = [(VNShotflowDetector *)self filterBoxes:v16 usingThresholds:v11];

  *(float *)&double v18 = a4;
  *(float *)&double v19 = a5;
  v20 = [(VNShotflowDetector *)self enforceSquareFaces:v17 withHeight:v18 andWidth:v19];

  v25.receiver = self;
  v25.super_class = (Class)VNShotflowDetectorANFDv1;
  *(float *)&double v21 = a4;
  *(float *)&double v22 = a5;
  unsigned __int8 v23 = [(VNShotflowDetector *)&v25 processBoxes:v20 withHeight:v11 andWidth:v21 filterThresholds:v22];

  return v23;
}

- (VNShotflowDetectorANFDv1)initWithNetwork:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNShotflowDetectorANFDv1;
  objc_super v3 = [(VNShotflowDetector *)&v7 initWithNetwork:a3];
  v4 = v3;
  if (v3)
  {
    v3->super._nmsThreshold = 0.45;
    v5 = v3;
  }

  return v4;
}

@end