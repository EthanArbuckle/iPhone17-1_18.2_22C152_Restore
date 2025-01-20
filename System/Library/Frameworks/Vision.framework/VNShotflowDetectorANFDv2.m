@interface VNShotflowDetectorANFDv2
+ (Class)VNShotflowNetworkClass;
+ (id)defaultFilterThresholds;
+ (id)filterThresholdsArrayForFilterThresholds:(id)a3 error:(id *)a4;
+ (id)supportedLabelKeys;
- (VNShotflowDetectorANFDv2)initWithNetwork:(id)a3;
- (id)nmsBoxes:(id)a3 usingThresholds:(id)a4;
- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6;
@end

@implementation VNShotflowDetectorANFDv2

+ (Class)VNShotflowNetworkClass
{
  return (Class)objc_opt_class();
}

+ (id)filterThresholdsArrayForFilterThresholds:(id)a3 error:(id *)a4
{
  v10[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v10[0] = @"VNShotflowDetectorFilterThresholdKey_HumanFace";
  v10[1] = @"VNShotflowDetectorFilterThresholdKey_HumanHead";
  v10[2] = @"VNShotflowDetectorFilterThresholdKey_HumanBody";
  v10[3] = @"VNShotflowDetectorFilterThresholdKey_CatBody";
  v10[4] = @"VNShotflowDetectorFilterThresholdKey_DogBody";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];
  v8 = +[VNShotflowDetector _filterThresholdsArrayFromKeys:inFilterThresholds:error:]((uint64_t)a1, v7, v6, a4);

  return v8;
}

+ (id)defaultFilterThresholds
{
  if (+[VNShotflowDetectorANFDv2 defaultFilterThresholds]::onceToken != -1) {
    dispatch_once(&+[VNShotflowDetectorANFDv2 defaultFilterThresholds]::onceToken, &__block_literal_global_198);
  }
  v2 = (void *)+[VNShotflowDetectorANFDv2 defaultFilterThresholds]::filterThresholds;

  return v2;
}

void __51__VNShotflowDetectorANFDv2_defaultFilterThresholds__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNShotflowDetectorFilterThresholdKey_HumanFace";
  v2[1] = @"VNShotflowDetectorFilterThresholdKey_HumanHead";
  v3[0] = &unk_1EF7A7FC0;
  v3[1] = &unk_1EF7A7FB0;
  v2[2] = @"VNShotflowDetectorFilterThresholdKey_HumanBody";
  v2[3] = @"VNShotflowDetectorFilterThresholdKey_CatBody";
  v3[2] = &unk_1EF7A7FD0;
  v3[3] = &unk_1EF7A7FE0;
  v2[4] = @"VNShotflowDetectorFilterThresholdKey_DogBody";
  v3[4] = &unk_1EF7A7FF0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)+[VNShotflowDetectorANFDv2 defaultFilterThresholds]::filterThresholds;
  +[VNShotflowDetectorANFDv2 defaultFilterThresholds]::filterThresholds = v0;
}

+ (id)supportedLabelKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VNShotflowDetectorANFDv2_supportedLabelKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowDetectorANFDv2 supportedLabelKeys]::onceToken != -1) {
    dispatch_once(&+[VNShotflowDetectorANFDv2 supportedLabelKeys]::onceToken, block);
  }
  v2 = (void *)+[VNShotflowDetectorANFDv2 supportedLabelKeys]::supportedLabelKeys;

  return v2;
}

void __46__VNShotflowDetectorANFDv2_supportedLabelKeys__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___VNShotflowDetectorANFDv2;
  uint64_t v1 = objc_msgSendSuper2(&v3, sel_supportedLabelKeys);
  v2 = (void *)+[VNShotflowDetectorANFDv2 supportedLabelKeys]::supportedLabelKeys;
  +[VNShotflowDetectorANFDv2 supportedLabelKeys]::supportedLabelKeys = v1;
}

- (id)nmsBoxes:(id)a3 usingThresholds:(id)a4
{
  id v37 = a3;
  id v35 = a4;
  v40 = self;
  [(VNShotflowDetector *)self nmsThreshold];
  float v7 = v6;
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v36 = [v35 count];
  if (v36)
  {
    for (uint64_t i = 0; i != v36; ++i)
    {
      v9 = [(VNShotflowDetector *)v40 sortBoxes:v37 filterThresholdIndex:i];
      unint64_t v10 = [v9 count];
      unsigned __int8 v42 = 0;
      std::vector<BOOL>::vector(&__p, v10, &v42);
      if (v10)
      {
        unint64_t v11 = 0;
        uint64_t v41 = i;
        do
        {
          v12 = v9;
          v13 = [v9 objectAtIndexedSubscript:v11];
          unint64_t v15 = v11 >> 6;
          uint64_t v16 = 1 << v11;
          uint64_t v17 = *((void *)__p + (v11++ >> 6));
          if ((v17 & v16) == 0)
          {
            if (v11 < v10)
            {
              uint64_t v38 = v16;
              float v18 = 0.0;
              unint64_t v19 = v11;
              float v20 = 0.0;
              float v21 = 0.0;
              do
              {
                if ((*((void *)__p + (v19 >> 6)) & (1 << v19)) == 0)
                {
                  v22 = [v12 objectAtIndexedSubscript:v19];
                  [v13 overlap:v22];
                  if (v23 > v7)
                  {
                    *((void *)__p + (v19 >> 6)) |= 1 << v19;
                    if (!v41)
                    {
                      [v13 yawAngle];
                      float v25 = v24;
                      objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "VNShotflowNetworkClass"), "nonSquareYawDefault");
                      if (v25 == v26)
                      {
                        [v22 yawAngle];
                        float v28 = v27;
                        objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "VNShotflowNetworkClass"), "nonSquareYawDefault");
                        if (v28 < v29)
                        {
                          [v22 rotationAngle];
                          float v31 = v30;
                          [v22 yawAngle];
                          float v21 = v21 + v31;
                          float v20 = v20 + v32;
                          float v18 = v18 + 1.0;
                        }
                      }
                    }
                  }
                }
                ++v19;
              }
              while (v10 != v19);
              uint64_t i = v41;
              uint64_t v16 = v38;
              if (!v41 && v18 > 0.0)
              {
                *(float *)&double v14 = v21 / v18;
                [v13 setRotationAngle:v14];
                *(float *)&double v33 = v20 / v18;
                [v13 setYawAngle:v33];
              }
            }
            *((void *)__p + v15) |= v16;
            [v39 addObject:v13];
          }

          v9 = v12;
        }
        while (v11 != v10);
      }
      if (__p) {
        operator delete(__p);
      }
    }
  }

  return v39;
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v12 = (void *)MEMORY[0x1A6257080]();
  v13 = [(VNShotflowDetectorANFDv2 *)self nmsBoxes:v10 usingThresholds:v11];

  double v14 = [(VNShotflowDetector *)self filterBoxes:v13 usingThresholds:v11];

  *(float *)&double v15 = a4;
  *(float *)&double v16 = a5;
  uint64_t v17 = [(VNShotflowDetector *)self enforceSquareFaces:v14 withHeight:v15 andWidth:v16];

  float v18 = [(VNShotflowDetectorANODBase *)self mergeHeadsBoxes:v17];

  v23.receiver = self;
  v23.super_class = (Class)VNShotflowDetectorANFDv2;
  *(float *)&double v19 = a4;
  *(float *)&double v20 = a5;
  float v21 = [(VNShotflowDetector *)&v23 processBoxes:v18 withHeight:v11 andWidth:v19 filterThresholds:v20];

  return v21;
}

- (VNShotflowDetectorANFDv2)initWithNetwork:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNShotflowDetectorANFDv2;
  objc_super v3 = [(VNShotflowDetector *)&v7 initWithNetwork:a3];
  v4 = v3;
  if (v3)
  {
    v3->super.super._nmsThreshold = 0.5;
    v5 = v3;
  }

  return v4;
}

@end