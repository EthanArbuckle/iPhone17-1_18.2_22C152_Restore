@interface VNShotflowNetworkANODv5
+ (BOOL)hasFaceBodyAssociation;
+ (BOOL)hasPetFaces;
+ (BOOL)hasPose;
+ (BOOL)inputBGR;
+ (CGSize)inputImageSize;
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

@implementation VNShotflowNetworkANODv5

+ (id)modelName
{
  return @"anodv5_drop1_fp16.espresso";
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

+ (BOOL)hasFaceBodyAssociation
{
  return 1;
}

+ (BOOL)hasPetFaces
{
  return 1;
}

+ (BOOL)hasPose
{
  return 1;
}

+ (const)importantClasses
{
  if (+[VNShotflowNetworkANODv5 importantClasses]::onceToken != -1) {
    dispatch_once(&+[VNShotflowNetworkANODv5 importantClasses]::onceToken, &__block_literal_global_250);
  }
  return (const void *)+[VNShotflowNetworkANODv5 importantClasses]::importantClasses;
}

void __43__VNShotflowNetworkANODv5_importantClasses__block_invoke()
{
}

+ (unint64_t)mumberPosClasses
{
  return 12;
}

+ (CGSize)inputImageSize
{
  double v2 = 608.0;
  double v3 = 384.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)inputLayerName
{
  return @"image";
}

- (id)processVImage:(vImage_Buffer *)a3 inputIsBGR:(BOOL)a4
{
  BOOL v4 = a4;
  vImagePixelCount height = a3->height;
  vImagePixelCount width = a3->width;
  if ([(VNShotflowNetworkANODv5 *)self setInputShape:width height:height])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 6014;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  long long v9 = *(_OWORD *)&a3->width;
  v67[0] = *(_OWORD *)&a3->data;
  v67[1] = v9;
  [(VNShotflowNetwork *)self runNetwork:v67 inputIsBGR:v4];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VNShotflowNetwork *)self threshold];
  id v59 = v10;
  if (v11 == 1.0)
  {
    v55 = __cxa_allocate_exception(8uLL);
    void *v55 = 6012;
    __cxa_throw(v55, MEMORY[0x1E4FBA3E0], 0);
  }
  v12 = objc_opt_class();
  begin = (uint64_t **)self->super.super._logitsPosOutputs.__begin_;
  uint64_t v14 = *begin[2];
  uint64_t v62 = *begin[4];
  uint64_t v15 = **begin;
  uint64_t v16 = (*begin)[3];
  unint64_t v65 = height;
  if (([v12 hasPose] & 1) != 0
    || ([v12 hasPetFaces] & 1) != 0
    || [v12 hasFaceBodyAssociation])
  {
    unint64_t v17 = width;
    uint64_t v18 = **((void **)self->super.super._logitsPosOutputs.__begin_ + 6);
  }
  else
  {
    unint64_t v17 = width;
    uint64_t v18 = 0;
  }
  if ([v12 hasPose])
  {
    uint64_t v19 = **((void **)self->super.super._logitsPosOutputs.__begin_ + 8);
    unsigned int v20 = 5;
  }
  else
  {
    uint64_t v19 = 0;
    unsigned int v20 = 4;
  }
  if ([v12 hasPetFaces]) {
    uint64_t v58 = **((void **)self->super.super._logitsPosOutputs.__begin_ + 2 * v20++);
  }
  else {
    uint64_t v58 = 0;
  }
  if ([v12 hasFaceBodyAssociation]) {
    uint64_t v57 = **((void **)self->super.super._logitsPosOutputs.__begin_ + 2 * v20);
  }
  else {
    uint64_t v57 = 0;
  }
  if ((int)v16 >= 1)
  {
    uint64_t v21 = 0;
    float v60 = (float)v65;
    float v61 = (float)v17;
    uint64_t v22 = 4 * v16;
    do
    {
      float v23 = sqrtf(*(float *)(v14 + v21));
      if (v23 >= 0.3)
      {
        float v24 = *(float *)(v62 + v21);
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
          uint64_t v31 = 3 * (int)*(float *)(v18 + v21);
          v32 = (float *)(v19 + 4 * (int)v31);
          float v30 = (float)((float)(1.0 / (float)(expf(-*v32) + 1.0)) * 360.0) + -180.0;
          float v28 = (float)(*(float *)(v19 + 4 * v31 + 4) * 180.0) + -90.0;
          float v33 = v32[2];
          id v10 = v59;
          float v29 = (float)(v33 * 180.0) + -90.0;
        }
        int v34 = [v12 hasPetFaces];
        if ((v26 - 9) < 2) {
          int v35 = v34;
        }
        else {
          int v35 = 0;
        }
        unsigned int v36 = 0;
        if (v35 == 1) {
          unsigned int v36 = *(_DWORD *)(v58 + 4 * (int)*(float *)(v18 + v21));
        }
        float v64 = v28;
        float v66 = v30;
        unsigned int v37 = 0;
        float v63 = v29;
        if ([v12 hasFaceBodyAssociation])
        {
          BOOL v38 = v26 != 12 && (v26 & 0xFFFFFFF7) - 1 > 1;
          int v39 = 0;
          if (!v38)
          {
            float v40 = *(float *)(v18 + v21);
            unsigned int v37 = *(_DWORD *)(v57 + 8 * (int)v40);
            int v39 = *(_DWORD *)(v57 + 8 * (int)v40 + 4);
          }
        }
        else
        {
          int v39 = 0;
        }
        float v41 = *(float *)(v15 + 4 * v21);
        float v42 = *(float *)(v15 + 4 * (v21 + 1));
        float v43 = *(float *)(v15 + 4 * (v21 + 2));
        float v44 = *(float *)(v15 + 4 * (v21 + 3));
        v45 = [VNShotflowDetection alloc];
        v46 = (void *)[v12 importantClasses];
        double v47 = (float)(v41 / v61);
        double v48 = (float)(v42 / v60);
        double v49 = (float)(v43 / v61) - v47;
        double v50 = (float)(v44 / v60) - v48;
        double v51 = 1.0 - (v50 * 0.5 + v48) - v50 * 0.5;
        LODWORD(v56) = v39;
        v52 = -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:hasLabel:label:petFaceScore:associatedX:associatedY:](v45, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:hasLabel:label:petFaceScore:associatedX:associatedY:", 0, v46[1] - *v46 > 8uLL, v26, v49 * 0.5 + v47 - v49 * 0.5, v51, v49, v50, v49 * 0.5 + v47 - v49 * 0.5, v51, v49, v50, __PAIR64__(LODWORD(v66), LODWORD(v23)), __PAIR64__(LODWORD(v63), LODWORD(v64)), __PAIR64__(v37, v36), v56);
        [v10 addObject:v52];
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
        [(VNShotflowNetworkANODv5 *)self initializeBuffers];
        return 0;
      }
    }
  }
  return result;
}

- (void)initializeBuffers
{
  double v3 = objc_opt_class();
  *(void *)&long long v25 = 0;
  std::vector<unsigned long>::vector(__p, 4uLL, &v25);
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
  *(void *)&long long v25 = v6 + 24;
  *((void *)&v25 + 1) = v6;
  [@"rcnn_output" UTF8String];
  if (espresso_network_bind_buffer())
  {
    uint64_t v15 = __cxa_allocate_exception(8uLL);
    *uint64_t v15 = 6014;
    __cxa_throw(v15, MEMORY[0x1E4FBA3E0], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v25);
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
  *(void *)&long long v24 = v7 + 24;
  *((void *)&v24 + 1) = v7;
  [@"rcnn_output_scores" UTF8String];
  if (espresso_network_bind_buffer())
  {
    uint64_t v16 = __cxa_allocate_exception(8uLL);
    *uint64_t v16 = 6014;
    __cxa_throw(v16, MEMORY[0x1E4FBA3E0], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v24);
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
  *(void *)&long long v23 = v8 + 24;
  *((void *)&v23 + 1) = v8;
  [@"rcnn_output_cls" UTF8String];
  if (espresso_network_bind_buffer())
  {
    unint64_t v17 = __cxa_allocate_exception(8uLL);
    *unint64_t v17 = 6014;
    __cxa_throw(v17, MEMORY[0x1E4FBA3E0], 0);
  }
  std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v23);
  if (([v3 hasPose] & 1) != 0
    || ([v3 hasPetFaces] & 1) != 0
    || [v3 hasFaceBodyAssociation])
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
    *(void *)&long long v22 = v9 + 24;
    *((void *)&v22 + 1) = v9;
    [@"rcnn_output_selected_indices" UTF8String];
    if (espresso_network_bind_buffer())
    {
      uint64_t v18 = __cxa_allocate_exception(8uLL);
      *uint64_t v18 = 6014;
      __cxa_throw(v18, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v22);
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v9);
  }
  if ([v3 hasPose])
  {
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
    [@"fcos/human_pose" UTF8String];
    if (espresso_network_bind_buffer())
    {
      uint64_t v19 = __cxa_allocate_exception(8uLL);
      *uint64_t v19 = 6014;
      __cxa_throw(v19, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v22);
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v10);
  }
  if ([v3 hasPetFaces])
  {
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
    *(void *)&long long v22 = v11 + 24;
    *((void *)&v22 + 1) = v11;
    [@"fcos/pet_face_scores" UTF8String];
    if (espresso_network_bind_buffer())
    {
      unsigned int v20 = __cxa_allocate_exception(8uLL);
      *unsigned int v20 = 6014;
      __cxa_throw(v20, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v22);
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v11);
  }
  if ([v3 hasFaceBodyAssociation])
  {
    v12 = (char *)operator new(0xC0uLL);
    *((void *)v12 + 1) = 0;
    *((void *)v12 + 2) = 0;
    *(void *)v12 = &unk_1EF753380;
    *(_OWORD *)(v12 + 24) = 0u;
    *(_OWORD *)(v12 + 40) = 0u;
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 72) = 0u;
    *(_OWORD *)(v12 + 88) = 0u;
    *(_OWORD *)(v12 + 104) = 0u;
    *(_OWORD *)(v12 + 120) = 0u;
    *(_OWORD *)(v12 + 136) = 0u;
    *(_OWORD *)(v12 + 152) = 0u;
    *(_OWORD *)(v12 + 168) = 0u;
    *((void *)v12 + 23) = 0;
    *(void *)&long long v22 = v12 + 24;
    *((void *)&v22 + 1) = v12;
    [@"fcos/association_preds" UTF8String];
    if (espresso_network_bind_buffer())
    {
      uint64_t v21 = __cxa_allocate_exception(8uLL);
      *uint64_t v21 = 6014;
      __cxa_throw(v21, MEMORY[0x1E4FBA3E0], 0);
    }
    std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100]((uint64_t)&self->super.super._logitsPosOutputs, &v22);
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v12);
  }
  v13 = __p[0];
  self->super.super._currentNetworkWidth = *(void *)__p[0];
  self->super.super._currentNetworkHeight = v13[1];
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