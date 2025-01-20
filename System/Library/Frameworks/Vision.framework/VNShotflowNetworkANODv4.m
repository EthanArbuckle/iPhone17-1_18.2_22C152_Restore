@interface VNShotflowNetworkANODv4
+ (BOOL)hasPose;
+ (BOOL)inputBGR;
+ (const)importantClasses;
+ (float)inputScale;
+ (id)inputLayerName;
+ (id)modelName;
+ (tuple<float,)inputBiasRGB;
+ (unint64_t)mumberPosClasses;
- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4;
- (int)setInputShape:(unint64_t)a3 height:(unint64_t)a4;
- (void)initializeBuffers;
@end

@implementation VNShotflowNetworkANODv4

+ (id)modelName
{
  return @"anodv4_drop6_fp16.espresso";
}

+ (BOOL)inputBGR
{
  return 1;
}

+ (tuple<float,)inputBiasRGB
{
  [(id)objc_opt_class() inputScale];
  float v3 = v2 * -116.28;
  float v4 = v2 * -123.68;
  float v5 = v2 * -103.53;
  result.var0.var2 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v5;
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
  if (+[VNShotflowNetworkANODv4 importantClasses]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetworkANODv4 importantClasses]::onceToken, &__block_literal_global_227);
  }
  return (const void *)+[VNShotflowNetworkANODv4 importantClasses]::importantClasses;
}

void __43__VNShotflowNetworkANODv4_importantClasses__block_invoke()
{
}

+ (unint64_t)mumberPosClasses
{
  return 12;
}

+ (id)inputLayerName
{
  return @"input_image";
}

- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  BOOL v4 = a4;
  vImagePixelCount height = a3->height;
  vImagePixelCount width = a3->width;
  if ([(VNShotflowNetworkANODv4 *)self setInputShape:width height:height])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  long long v9 = *(_OWORD *)&a3->width;
  v50[0] = *(_OWORD *)&a3->data;
  v50[1] = v9;
  [(VNShotflowNetwork *)self runNetwork:v50 inputIsBGR:v4];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VNShotflowNetwork *)self threshold];
  if (v11 == 1.0)
  {
    v46 = __cxa_allocate_exception(8uLL);
    void *v46 = 6012;
    __cxa_throw(v46, MEMORY[0x1E4FBA3E0], 0);
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
    uint64_t v47 = *v18[6];
    uint64_t v19 = *v18[8];
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v47 = 0;
  }
  if ((int)v17 >= 1)
  {
    unint64_t v20 = width;
    uint64_t v21 = 0;
    float v48 = (float)height;
    float v49 = (float)v20;
    uint64_t v22 = 4 * v17;
    do
    {
      float v23 = sqrtf(*(float *)(v14 + v21));
      if (v23 >= 0.3)
      {
        float v24 = *(float *)(v15 + v21);
        int v25 = [v12 hasPose];
        uint64_t v26 = (int)(float)(v24 + 1.0);
        if (v26 == 1) {
          int v27 = v25;
        }
        else {
          int v27 = 0;
        }
        float v28 = 0.0;
        float v29 = 0.0;
        float v30 = 0.0;
        if (v27 == 1)
        {
          v31 = (float *)(v19 + 12 * (int)*(float *)(v47 + v21));
          float v29 = (float)(*v31 * 180.0) + -90.0;
          float v30 = (float)(*(float *)(v19 + 12 * (int)*(float *)(v47 + v21) + 4) * 360.0) + -180.0;
          float v28 = (float)(v31[2] * 180.0) + -90.0;
        }
        float v32 = *(float *)(v16 + 4 * v21);
        float v33 = *(float *)(v16 + 4 * (v21 + 1));
        float v34 = *(float *)(v16 + 4 * (v21 + 2));
        float v35 = *(float *)(v16 + 4 * (v21 + 3));
        v36 = [VNShotflowDetection alloc];
        v37 = (void *)[v12 importantClasses];
        double v38 = (float)(v32 / v49);
        double v39 = (float)(v33 / v48);
        double v40 = (float)(v34 / v49) - v38;
        double v41 = (float)(v35 / v48) - v39;
        double v42 = 1.0 - (v41 * 0.5 + v39) - v41 * 0.5;
        v43 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:hasLabel:label:](v36, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:hasLabel:label:", 0, v37[1] - *v37 > 8uLL, v26, v40 * 0.5 + v38 - v40 * 0.5, v42, v40, v41, v40 * 0.5 + v38 - v40 * 0.5, v42, v40, v41, __PAIR64__(LODWORD(v30), LODWORD(v23)), __PAIR64__(LODWORD(v29), LODWORD(v28)));
        [v10 addObject:v43];
      }
      v21 += 4;
    }
    while (v22 != v21);
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
        [(VNShotflowNetworkANODv4 *)self initializeBuffers];
        return 0;
      }
    }
  }
  return result;
}

- (void)initializeBuffers
{
  float v3 = objc_opt_class();
  *(void *)&long long v22 = 0;
  std::vector<unsigned long>::vector(__p, 4uLL, &v22);
  id v4 = [v3 inputLayerName];
  [v4 UTF8String];
  int blob_dimensions = espresso_network_query_blob_dimensions();

  if (blob_dimensions)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
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
  *(void *)&long long v22 = v6 + 24;
  *((void *)&v22 + 1) = v6;
  [@"rcnn_output" UTF8String];
  if (espresso_network_bind_buffer())
  {
    v13 = __cxa_allocate_exception(8uLL);
    void *v13 = 6014;
    __cxa_throw(v13, MEMORY[0x1E4FBA3E0], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v22);
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
  *(void *)&long long v21 = v7 + 24;
  *((void *)&v21 + 1) = v7;
  [@"rcnn_output_scores" UTF8String];
  if (espresso_network_bind_buffer())
  {
    uint64_t v14 = __cxa_allocate_exception(8uLL);
    *uint64_t v14 = 6014;
    __cxa_throw(v14, MEMORY[0x1E4FBA3E0], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v21);
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
  *(void *)&long long v20 = v8 + 24;
  *((void *)&v20 + 1) = v8;
  [@"rcnn_output_cls" UTF8String];
  if (espresso_network_bind_buffer())
  {
    uint64_t v15 = __cxa_allocate_exception(8uLL);
    *uint64_t v15 = 6014;
    __cxa_throw(v15, MEMORY[0x1E4FBA3E0], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v20);
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
    *(void *)&long long v19 = v9 + 24;
    *((void *)&v19 + 1) = v9;
    [@"rcnn_output_selected_indices" UTF8String];
    if (espresso_network_bind_buffer())
    {
      uint64_t v16 = __cxa_allocate_exception(8uLL);
      *uint64_t v16 = 6014;
      __cxa_throw(v16, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v19);
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
    *(void *)&long long v18 = v10 + 24;
    *((void *)&v18 + 1) = v10;
    [@"face_pose_topk" UTF8String];
    if (espresso_network_bind_buffer())
    {
      uint64_t v17 = __cxa_allocate_exception(8uLL);
      *uint64_t v17 = 6014;
      __cxa_throw(v17, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v18);
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v10);
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v9);
  }
  float v11 = __p[0];
  self->super.super._currentNetworkWidth = *(void *)__p[0];
  self->super.super._currentNetworkHeight = v11[1];
  std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v8);
  std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v7);
  std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v6);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

@end