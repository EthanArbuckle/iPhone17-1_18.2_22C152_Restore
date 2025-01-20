@interface VNShotflowNetworkANODv3
+ (BOOL)hasPose;
+ (BOOL)inputBGR;
+ (const)importantClasses;
+ (float)inputScale;
+ (id)inputLayerName;
+ (id)modelName;
+ (tuple<float,)inputBiasRGB;
+ (unint64_t)mumberPosClasses;
- (VNShotflowNetworkANODv3)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6 threshold:(float)a7;
- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4;
- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4;
- (void)initializeBuffers;
@end

@implementation VNShotflowNetworkANODv3

+ (id)modelName
{
  return @"model_opt.espresso";
}

- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  BOOL v4 = a4;
  vImagePixelCount height = a3->height;
  vImagePixelCount width = a3->width;
  if ([(VNShotflowNetworkANODv3 *)self setInputShape:width height:height])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  long long v9 = *(_OWORD *)&a3->width;
  v51[0] = *(_OWORD *)&a3->data;
  v51[1] = v9;
  [(VNShotflowNetwork *)self runNetwork:v51 inputIsBGR:v4];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VNShotflowNetwork *)self threshold];
  if (v11 == 1.0)
  {
    v45 = __cxa_allocate_exception(8uLL);
    void *v45 = 6012;
    __cxa_throw(v45, MEMORY[0x1E4FBA3E0], 0);
  }
  v12 = objc_opt_class();
  begin = (uint64_t **)self->super.super._logitsPosOutputs.__begin_;
  uint64_t v14 = *begin[2];
  uint64_t v15 = *begin[4];
  uint64_t v16 = **begin;
  uint64_t v17 = (*begin)[3];
  if ([v12 hasPose])
  {
    v18 = (void **)self->super.super._logitsPosOutputs.__begin_;
    uint64_t v48 = *v18[8];
    uint64_t v49 = *v18[6];
    uint64_t v47 = *v18[10];
  }
  else
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
  }
  if ((int)v17 >= 1)
  {
    uint64_t v19 = 0;
    float v50 = (float)width;
    float v20 = (float)height;
    uint64_t v21 = 4 * v17;
    float v22 = 0.5;
    do
    {
      float v23 = *(float *)(v14 + v19);
      if (v23 >= v22)
      {
        float v24 = *(float *)(v15 + v19);
        int v25 = [v12 hasPose];
        uint64_t v26 = (int)(float)(v24 + 1.0);
        if (v26 == 1) {
          int v27 = v25;
        }
        else {
          int v27 = 0;
        }
        int v28 = 0;
        unsigned int v29 = 0;
        if (v27 == 1)
        {
          int v30 = (int)*(float *)(v49 + v19);
          unsigned int v29 = dword_1A4124710[*(float *)(v48 + 4 * v30)];
          int v28 = dword_1A4124740[*(float *)(v47 + 4 * v30)];
        }
        float v31 = *(float *)(v16 + 4 * v19);
        float v32 = *(float *)(v16 + 4 * (v19 + 1));
        float v33 = *(float *)(v16 + 4 * (v19 + 2));
        float v34 = *(float *)(v16 + 4 * (v19 + 3));
        v35 = [VNShotflowDetection alloc];
        v36 = (void *)[v12 importantClasses];
        double v37 = (float)(v31 / v50);
        double v38 = (float)(v32 / v20);
        double v39 = (float)(v33 / v50) - v37;
        double v40 = (float)(v34 / v20) - v38;
        double v41 = 1.0 - (v40 * 0.5 + v38) - v40 * 0.5;
        LODWORD(v46) = v28;
        v42 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:hasLabel:label:](v35, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:hasLabel:label:", 0, v36[1] - *v36 > 8uLL, v26, v39 * 0.5 + v37 - v39 * 0.5, v41, v39, v40, v39 * 0.5 + v37 - v39 * 0.5, v41, v39, v40, __PAIR64__(v29, LODWORD(v23)), v46);
        [v10 addObject:v42];

        float v22 = 0.5;
      }
      v19 += 4;
    }
    while (v21 != v19);
  }

  return v10;
}

- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4
{
  int v4 = a4;
  int v5 = a3;
  if (*(_OWORD *)&self->super.super._currentNetworkWidth == __PAIR128__(a4, a3)) {
    return 0;
  }
  id v8 = [(id)objc_opt_class() inputLayerName];
  [v8 UTF8String];

  [(id)objc_opt_class() inputImageSize];
  if ((unint64_t)v10 != v4 || (unint64_t)v9 != v5)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6005;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  int result = espresso_plan_build_clean();
  if (!result)
  {
    int result = espresso_network_change_input_blob_shapes();
    if (!result)
    {
      int result = espresso_plan_build();
      if (!result)
      {
        [(VNShotflowNetworkANODv3 *)self initializeBuffers];
        return 0;
      }
    }
  }
  return result;
}

- (void)initializeBuffers
{
  v3 = objc_opt_class();
  *(void *)&long long v26 = 0;
  std::vector<unsigned long>::vector(__p, 4uLL, &v26);
  id v4 = [v3 inputLayerName];
  [v4 UTF8String];
  int blob_dimensions = espresso_network_query_blob_dimensions();

  if (blob_dimensions)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  p_logitsPosOutputs = &self->super.super._logitsPosOutputs;
  std::vector<std::shared_ptr<rtcv::Logger::Target>>::__clear[abi:nn180100]((uint64_t *)&self->super.super._logitsPosOutputs);
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
  *(void *)&long long v26 = v6 + 24;
  *((void *)&v26 + 1) = v6;
  [@"rcnn_output" UTF8String];
  if (espresso_network_bind_buffer())
  {
    uint64_t v14 = __cxa_allocate_exception(8uLL);
    *uint64_t v14 = 6014;
    __cxa_throw(v14, MEMORY[0x1E4FBA3E0], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)p_logitsPosOutputs, &v26);
  v7 = (char *)operator new(0xC0uLL);
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = 0;
  *(void *)v7 = &unk_1EF753380;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  *(_OWORD *)(v7 + 56) = 0u;
  *(_OWORD *)(v7 + 72) = 0u;
  *(_OWORD *)(v7 + 88) = 0u;
  *(_OWORD *)(v7 + 104) = 0u;
  *(_OWORD *)(v7 + 120) = 0u;
  *(_OWORD *)(v7 + 136) = 0u;
  *(_OWORD *)(v7 + 152) = 0u;
  *(_OWORD *)(v7 + 168) = 0u;
  *((void *)v7 + 23) = 0;
  *(void *)&long long v25 = v7 + 24;
  *((void *)&v25 + 1) = v7;
  [@"rcnn_output_scores" UTF8String];
  if (espresso_network_bind_buffer())
  {
    uint64_t v15 = __cxa_allocate_exception(8uLL);
    *uint64_t v15 = 6014;
    __cxa_throw(v15, MEMORY[0x1E4FBA3E0], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)p_logitsPosOutputs, &v25);
  id v8 = (char *)operator new(0xC0uLL);
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *(void *)id v8 = &unk_1EF753380;
  *(_OWORD *)(v8 + 24) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 120) = 0u;
  *(_OWORD *)(v8 + 136) = 0u;
  *(_OWORD *)(v8 + 152) = 0u;
  *(_OWORD *)(v8 + 168) = 0u;
  *((void *)v8 + 23) = 0;
  *(void *)&long long v24 = v8 + 24;
  *((void *)&v24 + 1) = v8;
  [@"rcnn_output_cls" UTF8String];
  if (espresso_network_bind_buffer())
  {
    uint64_t v16 = __cxa_allocate_exception(8uLL);
    *uint64_t v16 = 6014;
    __cxa_throw(v16, MEMORY[0x1E4FBA3E0], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)p_logitsPosOutputs, &v24);
  if ([v3 hasPose])
  {
    double v9 = (char *)operator new(0xC0uLL);
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = 0;
    *(void *)double v9 = &unk_1EF753380;
    *(_OWORD *)(v9 + 24) = 0u;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *(_OWORD *)(v9 + 72) = 0u;
    *(_OWORD *)(v9 + 88) = 0u;
    *(_OWORD *)(v9 + 104) = 0u;
    *(_OWORD *)(v9 + 120) = 0u;
    *(_OWORD *)(v9 + 136) = 0u;
    *(_OWORD *)(v9 + 152) = 0u;
    *(_OWORD *)(v9 + 168) = 0u;
    *((void *)v9 + 23) = 0;
    *(void *)&long long v23 = v9 + 24;
    *((void *)&v23 + 1) = v9;
    [@"rcnn_output_selected_indices" UTF8String];
    if (espresso_network_bind_buffer())
    {
      uint64_t v17 = __cxa_allocate_exception(8uLL);
      *uint64_t v17 = 6014;
      __cxa_throw(v17, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)p_logitsPosOutputs, &v23);
    double v10 = (char *)operator new(0xC0uLL);
    *((void *)v10 + 1) = 0;
    *((void *)v10 + 2) = 0;
    *(void *)double v10 = &unk_1EF753380;
    *(_OWORD *)(v10 + 24) = 0u;
    *(_OWORD *)(v10 + 40) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    *(_OWORD *)(v10 + 72) = 0u;
    *(_OWORD *)(v10 + 88) = 0u;
    *(_OWORD *)(v10 + 104) = 0u;
    *(_OWORD *)(v10 + 120) = 0u;
    *(_OWORD *)(v10 + 136) = 0u;
    *(_OWORD *)(v10 + 152) = 0u;
    *(_OWORD *)(v10 + 168) = 0u;
    *((void *)v10 + 23) = 0;
    *(void *)&long long v22 = v10 + 24;
    *((void *)&v22 + 1) = v10;
    [@"roll_output" UTF8String];
    if (espresso_network_bind_buffer())
    {
      v18 = __cxa_allocate_exception(8uLL);
      void *v18 = 6014;
      __cxa_throw(v18, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)p_logitsPosOutputs, &v22);
    float v11 = (char *)operator new(0xC0uLL);
    *((void *)v11 + 1) = 0;
    *((void *)v11 + 2) = 0;
    *(void *)float v11 = &unk_1EF753380;
    *(_OWORD *)(v11 + 24) = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 56) = 0u;
    *(_OWORD *)(v11 + 72) = 0u;
    *(_OWORD *)(v11 + 88) = 0u;
    *(_OWORD *)(v11 + 104) = 0u;
    *(_OWORD *)(v11 + 120) = 0u;
    *(_OWORD *)(v11 + 136) = 0u;
    *(_OWORD *)(v11 + 152) = 0u;
    *(_OWORD *)(v11 + 168) = 0u;
    *((void *)v11 + 23) = 0;
    *(void *)&long long v21 = v11 + 24;
    *((void *)&v21 + 1) = v11;
    [@"yaw_output" UTF8String];
    if (espresso_network_bind_buffer())
    {
      uint64_t v19 = __cxa_allocate_exception(8uLL);
      *uint64_t v19 = 6014;
      __cxa_throw(v19, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)p_logitsPosOutputs, &v21);
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v11);
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v10);
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v9);
  }
  v12 = __p[0];
  self->super.super._currentNetworkWidth = *(void *)__p[0];
  self->super.super._currentNetworkHeight = v12[1];
  std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v8);
  std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v7);
  std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v6);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (VNShotflowNetworkANODv3)initWithModelPath:(id)a3 espressoEngineID:(int)a4 espressoDeviceID:(int)a5 espressoStorageType:(int)a6 threshold:(float)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNShotflowNetworkANODv3;
  *(float *)&double v13 = a7;
  uint64_t v14 = [(VNShotflowNetworkANODBase *)&v18 initWithModelPath:v12 espressoEngineID:v10 espressoDeviceID:v9 espressoStorageType:v8 threshold:v13];
  uint64_t v15 = v14;
  if (v14)
  {
    [(VNShotflowNetworkANODv3 *)v14 initializeBuffers];
    uint64_t v16 = v15;
  }

  return v15;
}

+ (BOOL)inputBGR
{
  return 0;
}

+ (tuple<float,)inputBiasRGB
{
  float v2 = -2.1398;
  float v3 = -2.0209;
  float v4 = -1.7949;
  result.var0.var2 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

+ (float)inputScale
{
  return 0.017429;
}

+ (BOOL)hasPose
{
  return 1;
}

+ (const)importantClasses
{
  if (+[VNShotflowNetworkANODv3 importantClasses]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetworkANODv3 importantClasses]::onceToken, &__block_literal_global_195);
  }
  return (const void *)+[VNShotflowNetworkANODv3 importantClasses]::importantClasses;
}

void __43__VNShotflowNetworkANODv3_importantClasses__block_invoke()
{
}

+ (unint64_t)mumberPosClasses
{
  return 8;
}

+ (id)inputLayerName
{
  return @"data";
}

@end