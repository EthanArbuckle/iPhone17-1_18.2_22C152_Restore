@interface VNFaceExpressionDetector
+ (id)configurationOptionKeysForDetectorKey;
+ (id)createExpressionAndConfidencesDictionaryFromScores:(id)a3;
+ (id)createExpressionDetectionDictionaryFromScores:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (int)expressionTypeFromString:(id)a3;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (void)dealloc;
@end

@implementation VNFaceExpressionDetector

+ (id)createExpressionDetectionDictionaryFromScores:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
  v30[0] = 0;
  v30[1] = 0;
  v29 = (uint64_t *)v30;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v11 = [v6 objectForKey:v10];
        [v11 floatValue];
        int v13 = v12;
        LODWORD(v23) = [a1 expressionTypeFromString:v10];
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v29, (int)v23, &v23)+ 8) = v13;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v7);
  }

  uint64_t v14 = 0;
  v24[0] = 0;
  v24[1] = 0;
  v23 = (uint64_t *)v24;
  do
  {
    int v31 = v14;
    if (*((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v29, v14, &v31)+ 8) <= vision::mod::expressionThresholds[v14])
    {
      int v31 = v14;
      *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v23, v14, &v31)+ 8) = 0;
    }
    else
    {
      int v31 = v14;
      *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v23, v14, &v31)+ 8) = 1065353216;
    }
    ++v14;
  }
  while (v14 != 6);
  v15 = v23;
  if (v23 != (uint64_t *)v24)
  {
    do
    {
      float v16 = *((float *)v15 + 8);
      v17 = [NSString stringWithUTF8String:vision::mod::expressionAttributeTypeDescription[*((unsigned int *)v15 + 7)]];
      v18 = [NSNumber numberWithBool:v16 > 0.75];
      [v5 setObject:v18 forKeyedSubscript:v17];

      v19 = (uint64_t *)v15[1];
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (uint64_t *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (uint64_t *)v15[2];
          BOOL v21 = *v20 == (void)v15;
          v15 = v20;
        }
        while (!v21);
      }
      v15 = v20;
    }
    while (v20 != (uint64_t *)v24);
  }
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v24[0]);
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v30[0]);

  return v5;
}

+ (id)createExpressionAndConfidencesDictionaryFromScores:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
  v36[0] = 0;
  v36[1] = 0;
  v35 = (uint64_t *)v36;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v11 = [v6 objectForKey:v10];
        [v11 floatValue];
        int v13 = v12;
        LODWORD(v29) = [a1 expressionTypeFromString:v10];
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v35, (int)v29, &v29)+ 8) = v13;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v7);
  }

  int v14 = 0;
  v30[0] = 0;
  v30[1] = 0;
  v29 = (uint64_t *)v30;
  float v15 = 0.0;
  float v16 = 3.4028e38;
  do
  {
    int v38 = v14;
    if (v16 > *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v35, v14, &v38)+ 8))
    {
      int v38 = v14;
      float v16 = *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v35, v14, &v38)+ 8);
    }
    int v38 = v14;
    float v15 = v15
        + *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v35, v14++, &v38)+ 8);
  }
  while (v14 != 6);
  int v17 = 0;
  float v18 = v15 + (float)(v16 * -6.0);
  do
  {
    int v38 = v17;
    float v19 = *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v35, v17, &v38)+ 8);
    int v37 = v17;
    *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v29, v17++, &v37)+ 8) = (float)(v19 - v16) / v18;
  }
  while (v17 != 6);
  v20 = v29;
  if (v29 != (uint64_t *)v30)
  {
    do
    {
      int v21 = *((_DWORD *)v20 + 8);
      v22 = [NSString stringWithUTF8String:vision::mod::expressionAttributeTypeDescription[*((unsigned int *)v20 + 7)]];
      LODWORD(v23) = v21;
      v24 = [NSNumber numberWithFloat:v23];
      [v5 setObject:v24 forKeyedSubscript:v22];

      long long v25 = (uint64_t *)v20[1];
      if (v25)
      {
        do
        {
          long long v26 = v25;
          long long v25 = (uint64_t *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          long long v26 = (uint64_t *)v20[2];
          BOOL v27 = *v26 == (void)v20;
          v20 = v26;
        }
        while (!v27);
      }
      v20 = v26;
    }
    while (v26 != (uint64_t *)v30);
  }
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v30[0]);
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v36[0]);

  return v5;
}

+ (int)expressionTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Smile"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Disgust"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Neutral"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Surprise"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Scream"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Suspicious"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 3;
  }

  return v4;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VNFaceExpressionDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceExpressionDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNFaceExpressionDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNFaceExpressionDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __65__VNFaceExpressionDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceExpressionDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNDetectorInitOption_ModelBackingStore"];
  uint64_t v3 = [v2 copy];
  int v4 = (void *)+[VNFaceExpressionDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceExpressionDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"VNComputeStageMain";
  int v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->m_FaceAttributesImpl.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  int v12 = [(VNDetector *)self validatedImageBufferFromOptions:v11 error:a8];
  if (!v12)
  {
    float v16 = 0;
    goto LABEL_30;
  }
  int v13 = +[VNValidationUtilities requiredFaceObservationInOptions:v11 error:a8];
  int v14 = v13;
  if (!v13)
  {
    float v16 = 0;
    goto LABEL_29;
  }
  float v15 = [v13 expressionsAndScores];

  if (!v15)
  {
    int v17 = objc_msgSend(v14, "vn_cloneObject");
    float v18 = v17;
    if (!v17)
    {
      if (a8)
      {
        +[VNError errorForMemoryAllocationFailure];
        float v16 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        float v16 = 0;
      }
      goto LABEL_28;
    }
    float v19 = [v17 landmarkPoints65];
    v20 = v19;
    if (v19)
    {
      id v21 = v19;
      v22 = (const void *)[v21 bytes];
      if ((unint64_t)[v21 length] > 0x1F7)
      {
        v59 = 0;
        uint64_t v60 = 0;
        uint64_t v61 = 0;
        std::vector<_Geometry2D_point2D_>::__init_with_size[abi:ne180100]<_Geometry2D_point2D_*,_Geometry2D_point2D_*>(&v59, v22, (uint64_t)v22 + 504, 0x3FuLL);
        [v18 alignedBoundingBox];
        float v25 = v24;
        float v27 = v26;
        float v29 = v28;
        float v31 = v30;
        unint64_t v32 = [v12 width];
        unint64_t v33 = [v12 height];
        unint64_t v34 = [v12 width];
        unint64_t v35 = [v12 height];
        uint64_t v36 = 0;
        float v37 = v25 * (float)v32;
        int v38 = v59;
        do
        {
          v39.f32[1] = v29 * (float)v35;
          v39.f32[0] = v31 * (float)v34;
          *(float32x2_t *)&v38[v36] = vmul_f32(v39, *(float32x2_t *)&v38[v36]);
          v36 += 8;
        }
        while (v36 != 504);
        v57[0] = 0;
        v57[1] = v57;
        v57[2] = 0x4812000000;
        v57[3] = __Block_byref_object_copy__8572;
        v57[4] = __Block_byref_object_dispose__8573;
        v57[5] = "";
        v58[0] = 0;
        v58[1] = 0;
        v57[6] = v58;
        uint64_t v43 = MEMORY[0x1E4F143A8];
        uint64_t v44 = 3321888768;
        v45 = __126__VNFaceExpressionDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
        v46 = &unk_1EF754290;
        v49 = v57;
        __p = 0;
        v47 = self;
        float v53 = v37;
        float v54 = v27 * (float)v33;
        float v55 = v29 * (float)v35;
        float v56 = v31 * (float)v34;
        v51 = 0;
        uint64_t v52 = 0;
        std::vector<_Geometry2D_point2D_>::__init_with_size[abi:ne180100]<_Geometry2D_point2D_*,_Geometry2D_point2D_*>(&__p, v38, v60, (v60 - (uint64_t)v38) >> 3);
        id v40 = v18;
        id v48 = v40;
        v41 = _Block_copy(&v43);
        if (VNExecuteBlock(v41, (uint64_t)a8))
        {
          id v62 = v40;
          float v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v62, 1, v43, v44, v45, v46, v47);
        }
        else
        {
          float v16 = 0;
        }

        if (__p)
        {
          v51 = __p;
          operator delete(__p);
        }
        _Block_object_dispose(v57, 8);
        std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v58[0]);
        operator delete(v38);
        goto LABEL_27;
      }
      if (a8)
      {
        id v23 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Corrupt face mark data"];
LABEL_16:
        float v16 = 0;
        *a8 = v23;
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
    }
    else if (a8)
    {
      id v23 = +[VNError errorForInternalErrorWithLocalizedDescription:@"VNFaceExpressionDetector face does not have landmark points"];
      goto LABEL_16;
    }
    float v16 = 0;
    goto LABEL_27;
  }
  v63[0] = v14;
  float v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
LABEL_29:

LABEL_30:

  return v16;
}

uint64_t __126__VNFaceExpressionDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 56);
  float v25 = 0;
  uint64_t v26 = 0;
  float v24 = (uint64_t *)&v25;
  vision::mod::LandmarkAttributes::computePixelDistanceFeature(&__p, a1 + 80, (uint64_t *)(a1 + 56));
  uint64_t v3 = (v29 - (unsigned char *)__p) >> 2;
  if (v3 != *(void *)(v2 + 104) >> 3)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 2940;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  int v4 = *(const float **)(v2 + 112);
  vDSP_vsub(&v4[6 * v3], 1, (const float *)__p, 1, (float *)__p, 1, (v29 - (unsigned char *)__p) >> 2);
  vDSP_vdiv(&v4[7 * v3], 1, (const float *)__p, 1, (float *)__p, 1, (v29 - (unsigned char *)__p) >> 2);
  cblas_sgemv(CblasColMajor, CblasTrans, (unint64_t)(v29 - (unsigned char *)__p) >> 2, 6, 1.0, v4, (unint64_t)(v29 - (unsigned char *)__p) >> 2, (const float *)__p, 1, 0.0, __Y, 1);
  for (uint64_t i = 0; i != 6; ++i)
  {
    float v6 = __Y[i];
    int v27 = i;
    *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>(&v24, i, &v27)+ 8) = v6;
  }
  if (__p)
  {
    float v29 = __p;
    operator delete(__p);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = v7 + 56;
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(*(void **)(v7 + 56));
  v9 = v25;
  *(void *)(v7 + 48) = v24;
  *(void *)(v7 + 56) = v9;
  uint64_t v10 = v26;
  *(void *)(v7 + 64) = v26;
  if (v10)
  {
    v9[2] = v8;
    float v24 = (uint64_t *)&v25;
    float v25 = 0;
    uint64_t v26 = 0;
    v9 = 0;
  }
  else
  {
    *(void *)(v7 + 48) = v8;
  }
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v9);
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  int v13 = *(void **)(v12 + 48);
  int v14 = (void *)(v12 + 56);
  if (v13 != (void *)(v12 + 56))
  {
    do
    {
      int v15 = *((_DWORD *)v13 + 8);
      float v16 = [NSString stringWithUTF8String:vision::mod::expressionAttributeTypeDescription[*((unsigned int *)v13 + 7)]];
      LODWORD(v17) = v15;
      float v18 = [NSNumber numberWithFloat:v17];
      [v11 setObject:v18 forKeyedSubscript:v16];

      float v19 = (void *)v13[1];
      if (v19)
      {
        do
        {
          v20 = v19;
          float v19 = (void *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (void *)v13[2];
          BOOL v21 = *v20 == (void)v13;
          int v13 = v20;
        }
        while (!v21);
      }
      int v13 = v20;
    }
    while (v20 != v14);
  }
  [*(id *)(a1 + 40) setExpressionsAndScores:v11];

  return 1;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  return 1;
}

- (void)dealloc
{
  if (self->_modelFilesWereMemmapped)
  {
    uint64_t v3 = VNBinModelFilePathFromModelNameAndThrow(@"landmarkRefinerAndPupil_v2");
    int v4 = +[VNModelFilesCache sharedInstance];
    [v4 unload:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)VNFaceExpressionDetector;
  [(VNDetector *)&v5 dealloc];
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)VNFaceExpressionDetector;
  if (!-[VNDetector completeInitializationForSession:error:](&v13, sel_completeInitializationForSession_error_, a3)) {
    return 0;
  }
  self->_modelFilesWereMemmapped = [(VNDetector *)self backingStore] < 2;
  float v6 = VNBinModelFilePathFromModelNameAndThrow(@"landmarkRefinerAndPupil_v2");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__VNFaceExpressionDetector_completeInitializationForSession_error___block_invoke;
  v11[3] = &unk_1E5B1FCB8;
  v11[4] = self;
  id v12 = v6;
  id v7 = v6;
  uint64_t v8 = _Block_copy(v11);
  char v9 = VNExecuteBlock(v8, (uint64_t)a4);

  return v9;
}

uint64_t __67__VNFaceExpressionDetector_completeInitializationForSession_error___block_invoke(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 72)) {
    operator new();
  }
  int v4 = +[VNModelFilesCache sharedInstance];
  objc_super v5 = [v4 load:*(void *)(a1 + 40)];
  if (v5)
  {
    memset(v9, 0, sizeof(v9));
    int v10 = 1065353216;
    cvml::util::binserialized_table_of_contents::init((cvml::util::binserialized_table_of_contents *)v9, (unsigned __int16 *)[v5 baseAddress], objc_msgSend(v5, "length"));
    memset(v7, 0, sizeof(v7));
    int v8 = 1065353216;
    cvml::util::binserialized_contents::init_model_values((uint64_t)v7, (uint64_t)v9, 0, vision::mod::LandmarkAttributes::sModelFileInfo);
    operator new();
  }
  if (a2)
  {
    *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Could not read expressions model data"];
  }

  return 0;
}

@end