@interface VNShotflowNetworkANODBase
+ (BOOL)poseSquare;
+ (CGSize)inputImageSize;
+ (const)cellStartsX;
+ (const)cellStartsY;
+ (const)ratios;
+ (float)nonSquareRollDefault;
+ (float)nonSquareYawDefault;
+ (unint64_t)mumberBinsNegativeMaxout;
+ (unint64_t)numberMaxoutLayers;
- (VNShotflowNetworkANODBase)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6 threshold:(float)a7;
- (void)initializeBuffers;
@end

@implementation VNShotflowNetworkANODBase

- (void)initializeBuffers
{
  v13.receiver = self;
  v13.super_class = (Class)VNShotflowNetworkANODBase;
  [(VNShotflowNetwork *)&v13 initializeBuffers];
  for (uint64_t i = 0; i != 6; ++i)
  {
    v4 = (char *)operator new(0xC0uLL);
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    *(void *)v4 = &unk_1EF753380;
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
    v6 = (char *)operator new(0xC0uLL);
    *((void *)v6 + 1) = 0;
    *((void *)v6 + 2) = 0;
    *(void *)v6 = &unk_1EF753380;
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
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"logits_yaw_%ld", i);

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

- (VNShotflowNetworkANODBase)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6 threshold:(float)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNShotflowNetworkANODBase;
  *(float *)&double v13 = a7;
  v14 = [(VNShotflowNetwork *)&v18 initWithModelPath:v12 espressoEngineID:v10 espressoDeviceID:v9 espressoStorageType:v8 threshold:v13];
  v15 = v14;
  if (v14)
  {
    [(VNShotflowNetworkANODBase *)v14 initializeBuffers];
    v16 = v15;
  }

  return v15;
}

+ (BOOL)poseSquare
{
  return 1;
}

+ (float)nonSquareYawDefault
{
  return 1000000.0;
}

+ (float)nonSquareRollDefault
{
  return 1000000.0;
}

+ (unint64_t)mumberBinsNegativeMaxout
{
  return 1;
}

+ (const)cellStartsY
{
  if (+[VNShotflowNetworkANODBase cellStartsY]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetworkANODBase cellStartsY]::onceToken, &__block_literal_global_172);
  }
  return (const void *)+[VNShotflowNetworkANODBase cellStartsY]::cellStartsY;
}

void __40__VNShotflowNetworkANODBase_cellStartsY__block_invoke()
{
}

+ (const)cellStartsX
{
  if (+[VNShotflowNetworkANODBase cellStartsX]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetworkANODBase cellStartsX]::onceToken, &__block_literal_global_169_34305);
  }
  return (const void *)+[VNShotflowNetworkANODBase cellStartsX]::cellStartsX;
}

void __40__VNShotflowNetworkANODBase_cellStartsX__block_invoke()
{
}

+ (const)ratios
{
  if (+[VNShotflowNetworkANODBase ratios]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetworkANODBase ratios]::onceToken, &__block_literal_global_166);
  }
  return (const void *)+[VNShotflowNetworkANODBase ratios]::ratios;
}

void __35__VNShotflowNetworkANODBase_ratios__block_invoke()
{
}

+ (unint64_t)numberMaxoutLayers
{
  return 0;
}

+ (CGSize)inputImageSize
{
  double v2 = 608.0;
  double v3 = 448.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end