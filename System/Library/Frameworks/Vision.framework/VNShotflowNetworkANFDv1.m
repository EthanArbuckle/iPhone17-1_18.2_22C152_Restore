@interface VNShotflowNetworkANFDv1
+ (BOOL)poseSquare;
+ (CGSize)inputImageSize;
+ (const)cellStartsX;
+ (const)cellStartsY;
+ (const)importantClasses;
+ (const)ratios;
+ (id)modelName;
+ (unint64_t)mumberBinsNegativeMaxout;
+ (unint64_t)mumberPosClasses;
+ (unint64_t)numberMaxoutLayers;
- (VNShotflowNetworkANFDv1)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6 threshold:(float)a7;
- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4;
- (void)initializeBuffers;
@end

@implementation VNShotflowNetworkANFDv1

- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)VNShotflowNetworkANFDv1;
  int v4 = [(VNShotflowNetwork *)&v11 setInputShape:a3 height:a4];
  if (!v4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"logits_roll_%ld", v7);
      id v8 = objc_claimAutoreleasedReturnValue();
      [v8 UTF8String];
      int v4 = espresso_network_bind_buffer();
      if (v4) {
        break;
      }
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"logits_yaw_%ld", v7);

      id v10 = v9;
      [v10 UTF8String];
      int v4 = espresso_network_bind_buffer();

      if (v4) {
        return v4;
      }
      ++v7;
      v6 += 16;
      if (v7 == 6) {
        return 0;
      }
    }
  }
  return v4;
}

- (void)initializeBuffers
{
  v13.receiver = self;
  v13.super_class = (Class)VNShotflowNetworkANFDv1;
  [(VNShotflowNetwork *)&v13 initializeBuffers];
  for (uint64_t i = 0; i != 6; ++i)
  {
    int v4 = (char *)operator new(0xC0uLL);
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    *(void *)int v4 = &unk_1EF753380;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 56) = 0u;
    *(_OWORD *)(v4 + 72) = 0u;
    *(_OWORD *)(v4 + 88) = 0u;
    *(_OWORD *)(v4 + 104) = 0u;
    *(_OWORD *)(v4 + 120) = 0u;
    *(_OWORD *)(v4 + 136) = 0u;
    *(_OWORD *)(v4 + 152) = 0u;
    *(_OWORD *)(v4 + 168) = 0u;
    *((void *)v4 + 23) = 0;
    *(void *)&long long v12 = v4 + 24;
    *((void *)&v12 + 1) = v4;
    objc_msgSend(NSString, "stringWithFormat:", @"logits_roll_%ld", i);
    id v5 = objc_claimAutoreleasedReturnValue();
    [v5 UTF8String];
    if (espresso_network_bind_buffer())
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = 6014;
      __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super._rollOutputs, &v12);
    uint64_t v6 = (char *)operator new(0xC0uLL);
    *((void *)v6 + 1) = 0;
    *((void *)v6 + 2) = 0;
    *(void *)uint64_t v6 = &unk_1EF753380;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *(_OWORD *)(v6 + 72) = 0u;
    *(_OWORD *)(v6 + 88) = 0u;
    *(_OWORD *)(v6 + 104) = 0u;
    *(_OWORD *)(v6 + 120) = 0u;
    *(_OWORD *)(v6 + 136) = 0u;
    *(_OWORD *)(v6 + 152) = 0u;
    *(_OWORD *)(v6 + 168) = 0u;
    *((void *)v6 + 23) = 0;
    *(void *)&long long v11 = v6 + 24;
    *((void *)&v11 + 1) = v6;
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"logits_yaw_%ld", i);

    id v8 = v7;
    [v8 UTF8String];
    if (espresso_network_bind_buffer())
    {
      v9 = __cxa_allocate_exception(8uLL);
      void *v9 = 6014;
      __cxa_throw(v9, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super._yawOutputs, &v11);
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v6);
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v4);
  }
}

- (VNShotflowNetworkANFDv1)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6 threshold:(float)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNShotflowNetworkANFDv1;
  *(float *)&double v13 = a7;
  v14 = [(VNShotflowNetwork *)&v18 initWithModelPath:v12 espressoEngineID:v10 espressoDeviceID:v9 espressoStorageType:v8 threshold:v13];
  v15 = v14;
  if (v14)
  {
    [(VNShotflowNetworkANFDv1 *)v14 initializeBuffers];
    v16 = v15;
  }

  return v15;
}

+ (BOOL)poseSquare
{
  return 0;
}

+ (const)importantClasses
{
  if (+[VNShotflowNetworkANFDv1 importantClasses]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetworkANFDv1 importantClasses]::onceToken, &__block_literal_global_140);
  }
  return (const void *)+[VNShotflowNetworkANFDv1 importantClasses]::importantClasses;
}

void __43__VNShotflowNetworkANFDv1_importantClasses__block_invoke()
{
}

+ (unint64_t)mumberPosClasses
{
  return 1;
}

+ (unint64_t)mumberBinsNegativeMaxout
{
  return 4;
}

+ (const)cellStartsY
{
  if (+[VNShotflowNetworkANFDv1 cellStartsY]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetworkANFDv1 cellStartsY]::onceToken, &__block_literal_global_137);
  }
  return (const void *)+[VNShotflowNetworkANFDv1 cellStartsY]::cellStartsY;
}

void __38__VNShotflowNetworkANFDv1_cellStartsY__block_invoke()
{
}

+ (const)cellStartsX
{
  if (+[VNShotflowNetworkANFDv1 cellStartsX]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetworkANFDv1 cellStartsX]::onceToken, &__block_literal_global_134);
  }
  return (const void *)+[VNShotflowNetworkANFDv1 cellStartsX]::cellStartsX;
}

void __38__VNShotflowNetworkANFDv1_cellStartsX__block_invoke()
{
}

+ (const)ratios
{
  if (+[VNShotflowNetworkANFDv1 ratios]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetworkANFDv1 ratios]::onceToken, &__block_literal_global_132);
  }
  return (const void *)+[VNShotflowNetworkANFDv1 ratios]::ratios;
}

void __33__VNShotflowNetworkANFDv1_ratios__block_invoke()
{
}

+ (unint64_t)numberMaxoutLayers
{
  return 2;
}

+ (CGSize)inputImageSize
{
  double v2 = 597.0;
  double v3 = 448.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)modelName
{
  return @"6ziz6uinva_opt.espresso";
}

@end