@interface VNFaceLandmarkDetector
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (_Geometry2D_point2D_)computeCentroidUsingPoints:(const _Geometry2D_point2D_ *)a3 indicies:(const int *)a4 numberOfIndicies:(int)a5;
+ (const)allLandmarksPointsIndexesForConstellation:(unint64_t)a3;
+ (const)landmarksMeshPartsForConstellation:(unint64_t)a3;
+ (id)configurationOptionKeysForDetectorKey;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)detectBlinkOnFaceImage:(const vImage_Buffer *)a3 faceObservation:(id)a4 lumaRec2DInImageCoordinates:(_Geometry2D_rect2D_ *)a5 landmarks:(const void *)a6 warningRecorder:(id)a7 error:(id *)a8;
- (BOOL)loadRefinersAndReturnError:(id *)a3;
- (BOOL)postprocessLandmarkResultsForLandmarks:(const void *)a3 imageBuffer:(id)a4 outputFace:(id)a5 options:(id)a6 warningRecorder:(id)a7 error:(id *)a8;
- (CGRect)normalizedFaceBBoxForLandmarks:(id)a3;
- (id).cxx_construct;
- (id)computeLandmarksScoreOnImage:(const vImage_Buffer *)a3 withFaceBoundingBox:(const _Geometry2D_rect2D_ *)a4 andLandmarks:(const void *)a5 error:(id *)a6;
- (void)calculatePupilLocationAndUpdateLandmarkPoints:(void *)a3;
- (void)dealloc;
@end

@implementation VNFaceLandmarkDetector

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 specifyingRequestClass:objc_opt_class() error:a4];
  v7 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v8 = [v6 requestRevision];
  if ((unint64_t)(v8 - 1) < 2 || (v8 != 3 ? (BOOL v9 = v8 == 3737841664) : (BOOL v9 = 1), v9))
  {
    v10 = objc_opt_class();
    goto LABEL_12;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRequestSpecifier:v7];
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v10 = 0;
  }
LABEL_12:

  return (Class)v10;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VNFaceLandmarkDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceLandmarkDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNFaceLandmarkDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNFaceLandmarkDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __63__VNFaceLandmarkDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceLandmarkDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 removeObject:@"VNDetectorOption_OriginatingRequestSpecifier"];
  [v2 addObject:@"VNDetectorInitOption_ModelBackingStore"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNFaceLandmarkDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceLandmarkDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (_Geometry2D_point2D_)computeCentroidUsingPoints:(const _Geometry2D_point2D_ *)a3 indicies:(const int *)a4 numberOfIndicies:(int)a5
{
  if (a5 < 1)
  {
    float32x2_t v7 = 0;
  }
  else
  {
    uint64_t v6 = a5;
    float32x2_t v7 = 0;
    do
    {
      uint64_t v8 = *a4++;
      float32x2_t v5 = (float32x2_t)a3[v8];
      float32x2_t v7 = vadd_f32(v7, v5);
      --v6;
    }
    while (v6);
  }
  v5.f32[0] = (float)a5;
  float32x2_t v9 = vdiv_f32(v7, (float32x2_t)vdup_lane_s32((int32x2_t)v5, 0));
  float v10 = v9.f32[1];
  result.x = v9.f32[0];
  result.y = v10;
  return result;
}

+ (const)allLandmarksPointsIndexesForConstellation:(unint64_t)a3
{
  if (a3 - 1 > 1)
  {
    uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown constellation type: %lu", a3);
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  if (+[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::onceToken != -1) {
    dispatch_once(&+[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::onceToken, &__block_literal_global_40);
  }
  v4 = *(void **)(+[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::allLandmarksPointsIndexesToConstellationMap
                  + 8);
  if (!v4) {
    goto LABEL_15;
  }
  uint64_t v5 = +[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::allLandmarksPointsIndexesToConstellationMap
     + 8;
  do
  {
    unint64_t v6 = v4[4];
    BOOL v7 = v6 >= a3;
    if (v6 >= a3) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = v4 + 1;
    }
    if (v7) {
      uint64_t v5 = (uint64_t)v4;
    }
    v4 = (void *)*v8;
  }
  while (*v8);
  if (v5 == +[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::allLandmarksPointsIndexesToConstellationMap
           + 8
    || *(void *)(v5 + 32) > a3)
  {
LABEL_15:
    uint64_t v5 = +[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:]::allLandmarksPointsIndexesToConstellationMap
       + 8;
  }
  return (const void *)(v5 + 40);
}

void __68__VNFaceLandmarkDetector_allLandmarksPointsIndexesForConstellation___block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  operator new();
}

+ (const)landmarksMeshPartsForConstellation:(unint64_t)a3
{
  if (a3 - 1 > 1)
  {
    uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown constellation type: %lu", a3);
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v10 userInfo:0];
    objc_exception_throw(v11);
  }
  if (+[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::onceToken != -1) {
    dispatch_once(&+[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::onceToken, &__block_literal_global_4232);
  }
  v4 = *(void **)(+[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::meshPartsToConstellationMap + 8);
  if (!v4) {
    goto LABEL_15;
  }
  uint64_t v5 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::meshPartsToConstellationMap + 8;
  do
  {
    unint64_t v6 = v4[4];
    BOOL v7 = v6 >= a3;
    if (v6 >= a3) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = v4 + 1;
    }
    if (v7) {
      uint64_t v5 = (uint64_t)v4;
    }
    v4 = (void *)*v8;
  }
  while (*v8);
  if (v5 == +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::meshPartsToConstellationMap + 8
    || *(void *)(v5 + 32) > a3)
  {
LABEL_15:
    uint64_t v5 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:]::meshPartsToConstellationMap + 8;
  }
  return *(const _LandmarkDetector_faceMeshParts_ **)(v5 + 40);
}

void __61__VNFaceLandmarkDetector_landmarksMeshPartsForConstellation___block_invoke()
{
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_faceAttributesPupilRefiner.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (BOOL)detectBlinkOnFaceImage:(const vImage_Buffer *)a3 faceObservation:(id)a4 lumaRec2DInImageCoordinates:(_Geometry2D_rect2D_ *)a5 landmarks:(const void *)a6 warningRecorder:(id)a7 error:(id *)a8
{
  __Y[3] = *(void **)MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a7;
  if (a3) {
    _ZF = v14 == 0;
  }
  else {
    _ZF = 1;
  }
  BOOL v18 = _ZF || a5 == 0 || a6 == 0;
  BOOL v19 = !v18;
  if (!v18)
  {
    LODWORD(src.data) = 0;
    BOOL v111 = v19;
    id v108 = v15;
    v109 = v14;
    std::vector<float>::vector(&v116, 0x550uLL, &src);
    LOBYTE(src.data) = 0;
    std::vector<unsigned char>::vector(v115, 0x900uLL, &src);
    LOBYTE(src.data) = 0;
    std::vector<unsigned char>::vector(__p, 0x900uLL, &src);
    v112.size_t rowBytes = 48;
    dest.data = v115[0];
    *(int64x2_t *)&dest.float height = vdupq_n_s64(0x30uLL);
    dest.size_t rowBytes = 48;
    v112.data = __p[0];
    *(_OWORD *)&v112.float height = *(_OWORD *)&dest.height;
    ptr = self->_faceAttributesPupilRefiner.__ptr_;
    LODWORD(src.data) = 0;
    std::vector<float>::vector(__Y, 0x2A8uLL, &src);
    LODWORD(src.data) = 0;
    std::vector<float>::vector(v120, 0x2A8uLL, &src);
    float y = a5->origin.y;
    float v22 = *(float *)(*(void *)a6 + 68) + y;
    float v23 = y + *(float *)(*(void *)a6 + 100);
    float32_t v24 = a5->origin.x + *(float *)(*(void *)a6 + 128);
    float v25 = y + *(float *)(*(void *)a6 + 132);
    float32_t v26 = a5->origin.x + *(float *)(*(void *)a6 + 160);
    float v27 = y + *(float *)(*(void *)a6 + 164);
    float v28 = (float)(a5->origin.x + *(float *)(*(void *)a6 + 96))
        - (float)(*(float *)(*(void *)a6 + 64) + a5->origin.x);
    data = (char *)a3->data;
    size_t rowBytes = a3->rowBytes;
    int32x2_t v31 = vmovn_s64(*(int64x2_t *)&a3->height);
    float height = (float)a3->height;
    v33.f32[0] = height - v22;
    v34.f32[0] = height - v23;
    v35.f32[0] = height - v25;
    v36.f32[0] = height - v27;
    v33.f32[1] = *(float *)(*(void *)a6 + 64) + a5->origin.x;
    v34.f32[1] = a5->origin.x + *(float *)(*(void *)a6 + 96);
    float32x2_t v37 = vmul_f32(vadd_f32(v33, v34), (float32x2_t)0x3F0000003F000000);
    *(float *)v38.i32 = sqrtf((float)((float)(v34.f32[0] - v33.f32[0]) * (float)(v34.f32[0] - v33.f32[0]))+ (float)(v28 * v28))* 0.5;
    *(float *)v39.i32 = sqrtf((float)((float)(v36.f32[0] - v35.f32[0]) * (float)(v36.f32[0] - v35.f32[0]))+ (float)((float)(v26 - v24) * (float)(v26 - v24)))* 0.5;
    float32x2_t v40 = (float32x2_t)vdup_lane_s32(v38, 0);
    float32x2_t v41 = vcvt_f32_s32(vmax_s32(vcvt_s32_f32(vrndp_f32(vsub_f32(v37, v40))), (int32x2_t)0x100000001));
    float v42 = v41.f32[1];
    v43 = (char *)a3->data + rowBytes * (int)v41.f32[0] + (int)v41.f32[1];
    float v107 = v41.f32[0];
    float32x2_t v44 = vsub_f32(vcvt_f32_s32(vmin_s32(vcvt_s32_f32(vrndp_f32(vadd_f32(v37, v40))), v31)), v41);
    __asm { FMOV            V4.2S, #1.0 }
    *(uint64x2_t *)&src.float height = vcvtq_u64_f64(vcvtq_f64_f32(vadd_f32(v44, _D4)));
    v35.f32[1] = v24;
    v36.f32[1] = v26;
    src.data = v43;
    src.size_t rowBytes = rowBytes;
    float32x2_t v49 = vmul_f32(vadd_f32(v35, v36), (float32x2_t)0x3F0000003F000000);
    float32x2_t v50 = (float32x2_t)vdup_lane_s32(v39, 0);
    float32x2_t v51 = vcvt_f32_s32(vmax_s32(vcvt_s32_f32(vrndp_f32(vsub_f32(v49, v50))), (int32x2_t)0x100000001));
    float v52 = v51.f32[1];
    float v106 = v51.f32[0];
    *(uint64x2_t *)&v118.float height = vcvtq_u64_f64(vcvtq_f64_f32(vadd_f32(vsub_f32(vcvt_f32_s32(vmin_s32(vcvt_s32_f32(vrndp_f32(vadd_f32(v49, v50))), v31)), v51), _D4)));
    v118.data = &data[rowBytes * (int)v51.f32[0] + (int)v51.f32[1]];
    v118.size_t rowBytes = rowBytes;
    vImageScale_Planar8(&src, &dest, 0, 0x20u);
    vImageScale_Planar8(&v118, &v112, 0, 0x20u);
    computePhogDescriptor(dest.data, __Y);
    computePhogDescriptor(v112.data, v120);
    if (!*((void *)ptr + 6))
    {
      v74 = 0;
LABEL_58:
      BOOL v19 = v111;
LABEL_71:
      uint64_t v93 = 0;
      v94 = (char *)__Y[0];
      v95 = (char *)v116;
      v96 = (char *)v120[0];
      do
      {
        v97 = &v95[v93];
        *(_DWORD *)v97 = *(_DWORD *)&v94[v93];
        *((_DWORD *)v97 + 680) = *(_DWORD *)&v96[v93];
        v93 += 4;
      }
      while (v93 != 2720);
      v120[1] = v96;
      operator delete(v96);
      if (__Y[0])
      {
        __Y[1] = __Y[0];
        operator delete(__Y[0]);
      }
      v98 = self->_faceAttributesPupilRefiner.__ptr_;
      v118.float height = 0;
      v118.vImagePixelCount width = 0;
      v118.data = &v118.height;
      vision::mod::LandmarkAttributes::computePixelDistanceFeature(&src, (uint64_t)a5, (uint64_t *)a6);
      src.height -= 4;
      uint64_t v99 = (uint64_t)(src.height - (unint64_t)src.data) >> 2;
      if (v99 != *((void *)v98 + 16) >> 2)
      {
        exception = __cxa_allocate_exception(8uLL);
        void *exception = 2940;
        __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
      }
      v100 = (const float *)*((void *)v98 + 17);
      vDSP_vsub((const float *)((char *)v100 + 2 * (src.height - (unint64_t)src.data)), 1, (const float *)src.data, 1, (float *)src.data, 1, (uint64_t)(src.height - (unint64_t)src.data) >> 2);
      vDSP_vdiv(&v100[3 * v99], 1, (const float *)src.data, 1, (float *)src.data, 1, (uint64_t)(src.height - (unint64_t)src.data) >> 2);
      cblas_sgemv(CblasColMajor, CblasTrans, (src.height - (unint64_t)src.data) >> 2, 2, 1.0, v100, (src.height - (unint64_t)src.data) >> 2, (const float *)src.data, 1, 0.0, (float *)__Y, 1);
      LODWORD(v120[0]) = 0;
      if (*((float *)__Y + 1) <= 0.8) {
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 0, v120)+ 8) = 0;
      }
      else {
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 0, v120)+ 8) = 1065353216;
      }
      v101 = (const float *)*((void *)v98 + 20);
      int64_t v102 = v117 - (unsigned char *)v116;
      vDSP_vsub((const float *)((char *)v101 + v117 - (unsigned char *)v116), 1, (const float *)v116, 1, (float *)v116, 1, (v117 - (unsigned char *)v116) >> 2);
      vDSP_vdiv((const float *)((char *)v101 + 2 * v102), 1, (const float *)v116, 1, (float *)v116, 1, (v117 - (unsigned char *)v116) >> 2);
      cblas_sgemv(CblasColMajor, CblasTrans, (unint64_t)(v117 - (unsigned char *)v116) >> 2, 1, 1.0, v101, (unint64_t)(v117 - (unsigned char *)v116) >> 2, (const float *)v116, 1, 0.0, (float *)v120, 1);
      id v15 = v108;
      id v14 = v109;
      int v121 = 1;
      if (*(float *)v120 <= 0.1) {
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 1, &v121)+ 8) = 0;
      }
      else {
        *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 1, &v121)+ 8) = 1065353216;
      }
      if (src.data)
      {
        src.float height = (vImagePixelCount)src.data;
        operator delete(src.data);
      }
      LODWORD(src.data) = 1;
      objc_msgSend(v109, "setIsBlinking:", *((float *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 1, &src)+ 8) > 0.1);
      LODWORD(src.data) = 1;
      LODWORD(v103) = *((_DWORD *)std::__tree<std::__value_type<vision::mod::_blinkType,float>,std::__map_value_compare<vision::mod::_blinkType,std::__value_type<vision::mod::_blinkType,float>,std::less<vision::mod::_blinkType>,true>,std::allocator<std::__value_type<vision::mod::_blinkType,float>>>::__emplace_unique_key_args<vision::mod::_blinkType,std::piecewise_construct_t const&,std::tuple<vision::mod::_blinkType&&>,std::tuple<>>((uint64_t **)&v118, 1, &src)+ 8);
      [v109 setBlinkScore:v103];
      std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy((void *)v118.height);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v115[0])
      {
        v115[1] = v115[0];
        operator delete(v115[0]);
      }
      if (v74) {
        operator delete(v74);
      }
      if (v116)
      {
        v117 = v116;
        operator delete(v116);
      }
      goto LABEL_92;
    }
    espresso_vision_compute_pupil_position();
    float v54 = v53;
    float v56 = v55;
    espresso_vision_compute_pupil_position();
    float v110 = v58;
    float v59 = v57;
    if (v54 < 0.15 || v54 > 0.85 || v56 < 0.15 || v56 > 0.85)
    {
      float v56 = 0.5;
      float v54 = 0.5;
    }
    if (v57 < 0.15 || v57 > 0.85 || v58 < 0.15 || v58 > 0.85)
    {
      float v110 = 0.5;
      float v59 = 0.5;
    }
    vImagePixelCount v61 = src.height;
    vImagePixelCount width = src.width;
    vImagePixelCount v63 = v118.height;
    vImagePixelCount v62 = v118.width;
    vImagePixelCount v64 = a3->height;
    float x = a5->origin.x;
    float v66 = a5->origin.y;
    v67 = (float *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(1uLL);
    v69 = v67;
    float v70 = (float)((float)v64 - (float)(v107 + (float)((float)v61 * v56))) - v66;
    float v71 = (float)(v42 + (float)((float)width * v54)) - x;
    v72 = &v67[v68];
    float *v67 = v71;
    if (v68 < 2)
    {
      uint64_t v75 = 2;
      if ((unint64_t)((4 * v68) >> 1) > 2) {
        uint64_t v75 = (4 * v68) >> 1;
      }
      if ((unint64_t)(4 * v68) >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v76 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v76 = v75;
      }
      if (v76) {
        unint64_t v76 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v76);
      }
      else {
        uint64_t v77 = 0;
      }
      uint64_t v78 = 0;
      v72 = (float *)(v76 + 4 * v77);
      *(float *)(v76 + 4) = v70;
      v73 = (float *)(v76 + 8);
      do
      {
        *(float *)(v76 + v78 * 4) = v69[v78];
        --v78;
      }
      while (v78 != -1);
      v74 = (float *)v76;
      operator delete(v69);
    }
    else
    {
      v67[1] = v70;
      v73 = v67 + 2;
      v74 = v67;
    }
    float v79 = (float)(v52 + (float)((float)v62 * v59)) - x;
    if (v73 >= v72)
    {
      uint64_t v81 = v73 - v74;
      unint64_t v82 = v81 + 1;
      if ((unint64_t)(v81 + 1) >> 62) {
        goto LABEL_94;
      }
      if (((char *)v72 - (char *)v74) >> 1 > v82) {
        unint64_t v82 = ((char *)v72 - (char *)v74) >> 1;
      }
      if ((unint64_t)((char *)v72 - (char *)v74) >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v83 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v83 = v82;
      }
      if (v83) {
        unint64_t v83 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v83);
      }
      else {
        uint64_t v84 = 0;
      }
      v85 = (float *)(v83 + 4 * v81);
      v72 = (float *)(v83 + 4 * v84);
      float *v85 = v79;
      v80 = v85 + 1;
      while (v73 != v74)
      {
        int v86 = *((_DWORD *)v73-- - 1);
        *((_DWORD *)v85-- - 1) = v86;
      }
      operator delete(v74);
      v74 = v85;
    }
    else
    {
      float *v73 = v79;
      v80 = v73 + 1;
    }
    float v87 = (float)((float)v64 - (float)(v106 + (float)((float)v63 * v110))) - v66;
    if (v80 < v72)
    {
      float *v80 = v87;
      goto LABEL_58;
    }
    uint64_t v88 = v80 - v74;
    unint64_t v89 = v88 + 1;
    BOOL v19 = v111;
    if (!((unint64_t)(v88 + 1) >> 62))
    {
      if (((char *)v72 - (char *)v74) >> 1 > v89) {
        unint64_t v89 = ((char *)v72 - (char *)v74) >> 1;
      }
      if ((unint64_t)((char *)v72 - (char *)v74) >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v90 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v90 = v89;
      }
      if (v90)
      {
        unint64_t v90 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v90);
        BOOL v19 = v111;
      }
      v91 = (float *)(v90 + 4 * v88);
      float *v91 = v87;
      while (v80 != v74)
      {
        int v92 = *((_DWORD *)v80-- - 1);
        *((_DWORD *)v91-- - 1) = v92;
      }
      operator delete(v74);
      v74 = v91;
      goto LABEL_71;
    }
LABEL_94:
    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
  }
  if (a8)
  {
    *a8 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Invalid parameters passed to blink score computation"];
  }
LABEL_92:

  return v19;
}

- (CGRect)normalizedFaceBBoxForLandmarks:(id)a3
{
  id v3 = a3;
  [v3 alignedBoundingBoxAsCGRect];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  if (CGRectEqualToRect(v16, *MEMORY[0x1E4F1DB28]))
  {
    [v3 boundingBox];
    CGFloat x = v8;
    CGFloat y = v9;
    CGFloat width = v10;
    CGFloat height = v11;
  }

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)postprocessLandmarkResultsForLandmarks:(const void *)a3 imageBuffer:(id)a4 outputFace:(id)a5 options:(id)a6 warningRecorder:(id)a7 error:(id *)a8
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  unsigned __int8 v45 = 0;
  if (!+[VNValidationUtilities getBOOLValue:forKey:inOptions:withDefaultValue:error:](VNValidationUtilities, "getBOOLValue:forKey:inOptions:withDefaultValue:error:", &v45, @"VNFaceLandmarkDetectorProcessOption_BlinkDetection", v16, 0, a8)|| (unsigned __int8 v44 = 0, !+[VNValidationUtilities getBOOLValue:&v44 forKey:@"VNFaceLandmarkDetectorProcessOption_CalculateLandmarkScore" inOptions:v16 withDefaultValue:0 error:a8]))
  {
LABEL_13:
    BOOL v18 = 0;
    goto LABEL_14;
  }
  BOOL v18 = 1;
  if (v45 | v44)
  {
    self->_requireFaceAttributesPupilRefiner = 1;
    if ([(VNFaceLandmarkDetector *)self loadRefinersAndReturnError:a8])
    {
      unsigned int v43 = -1;
      if ([v15 getFaceEXIFOrientation:&v43 error:a8])
      {
        v46 = @"VNImageBufferOption_FeatureOrientationRelativeToUpRight";
        BOOL v19 = [NSNumber numberWithInt:v43];
        v47[0] = v19;
        int32x2_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];

        unint64_t v20 = [(VNEspressoModelFileBasedDetector *)self networkRequiredInputImageWidth];
        unint64_t v21 = [(VNEspressoModelFileBasedDetector *)self networkRequiredInputImageHeight];
        [(VNFaceLandmarkDetector *)self normalizedFaceBBoxForLandmarks:v15];
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        unint64_t v30 = [v14 width];
        unint64_t v31 = [v14 height];
        v32 = (__CVBuffer *)objc_msgSend(v14, "croppedBufferWithWidth:height:format:cropRect:options:error:", v20, v21, 1278226488, v38, a8, v23 * (double)v30, v25 * (double)v31, v27 * (double)v30, v29 * (double)v31);
        float32x2_t v33 = v32;
        if (!v32)
        {
          BOOL v18 = 0;
LABEL_18:

          goto LABEL_14;
        }
        CVPixelBufferLockBaseAddress(v32, 1uLL);
        v42[0] = CVPixelBufferGetBaseAddress(v33);
        v42[1] = CVPixelBufferGetHeight(v33);
        v42[2] = CVPixelBufferGetWidth(v33);
        v42[3] = CVPixelBufferGetBytesPerRow(v33);
        uint64_t v39 = 0;
        float v40 = (float)v21;
        float v41 = (float)v20;
        if (v44)
        {
          float32x2_t v34 = [(VNFaceLandmarkDetector *)self computeLandmarksScoreOnImage:v42 withFaceBoundingBox:&v39 andLandmarks:a3 error:a8];
          float32x2_t v35 = v34;
          if (!v34) {
            goto LABEL_16;
          }
          [v34 floatValue];
          objc_msgSend(v15, "setLandmarkScore:");
        }
        if (!v45
          || [(VNFaceLandmarkDetector *)self detectBlinkOnFaceImage:v42 faceObservation:v15 lumaRec2DInImageCoordinates:&v39 landmarks:a3 warningRecorder:v17 error:a8])
        {
          int v36 = 0;
LABEL_17:
          CVPixelBufferUnlockBaseAddress(v33, 1uLL);
          CVPixelBufferRelease(v33);
          BOOL v18 = v36 == 0;
          goto LABEL_18;
        }
LABEL_16:
        int v36 = 1;
        goto LABEL_17;
      }
    }
    goto LABEL_13;
  }
LABEL_14:

  return v18;
}

- (id)computeLandmarksScoreOnImage:(const vImage_Buffer *)a3 withFaceBoundingBox:(const _Geometry2D_rect2D_ *)a4 andLandmarks:(const void *)a5 error:(id *)a6
{
  if (a3 && a4 && a5)
  {
    ptr = self->_faceAttributesPupilRefiner.__ptr_;
    uint64_t v11 = (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3;
    LODWORD(__p[0]) = 0;
    std::vector<float>::vector(&v49, ((unint64_t)((v11 - 1) * v11) >> 1) + 1, __p);
    size_t v12 = (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3;
    char v51 = 0;
    std::vector<unsigned char>::vector(__p, v12, &v51);
    double v13 = *(float **)a5;
    if (*(void *)a5 == *((void *)a5 + 1))
    {
      double v26 = *(float **)a5;
    }
    else
    {
      uint64_t v14 = 0;
      do
      {
        vImagePixelCount height = a3->height;
        float v16 = *v13;
        float v17 = v13[1];
        v13 += 2;
        int v18 = llroundf(v16 + a4->origin.x);
        int v19 = llroundf((float)height - (float)(v17 + a4->origin.y));
        int v20 = v18 & ~(v18 >> 31);
        int width = a3->width;
        BOOL v22 = v20 < width;
        int v23 = width - 1;
        int v24 = v19 & ~(v19 >> 31);
        if (!v22) {
          int v20 = v23;
        }
        if (v24 >= (int)height) {
          int v25 = height - 1;
        }
        else {
          int v25 = v24;
        }
        *((unsigned char *)__p[0] + v14++) = *((unsigned char *)a3->data + a3->rowBytes * v25 + v20);
      }
      while (v13 != *((float **)a5 + 1));
      double v26 = v13;
      double v13 = *(float **)a5;
    }
    uint64_t v29 = (char *)v26 - (char *)v13;
    unint64_t v30 = (unint64_t)((char *)v26 - (char *)v13) >> 3;
    unint64_t v31 = (float *)v49;
    v32 = (unsigned __int8 *)__p[0];
    if ((int)v30 < 2)
    {
      LODWORD(v34) = 0;
    }
    else
    {
      uint64_t v33 = 0;
      LODWORD(v34) = 0;
      uint64_t v35 = (v30 - 1);
      uint64_t v36 = (int)(v29 >> 3);
      uint64_t v37 = ((unint64_t)v29 >> 3) - 1;
      uint64_t v38 = 1;
      do
      {
        uint64_t v39 = v33 + 1;
        if (v33 + 1 < v36)
        {
          uint64_t v34 = (int)v34;
          float v40 = v32;
          uint64_t v41 = v37;
          do
          {
            v31[v34++] = (float)(v32[v33] - v40[v38]);
            ++v40;
            --v41;
          }
          while (v41);
        }
        ++v38;
        --v37;
        ++v33;
      }
      while (v39 != v35);
      unint64_t v31 = (float *)v49;
      v32 = (unsigned __int8 *)__p[0];
    }
    v31[(int)v34] = 1.0;
    if (v32)
    {
      __p[1] = v32;
      operator delete(v32);
    }
    int64_t v42 = v50 - (unsigned char *)v49;
    vDSP_Length v43 = (v50 - (unsigned char *)v49) >> 2;
    if (v43 != *((void *)ptr + 3) / 3uLL)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = 2940;
      __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
    }
    unsigned __int8 v44 = (const float *)*((void *)ptr + 4);
    vDSP_vsub(&v44[v43], 1, (const float *)v49, 1, (float *)v49, 1, v43);
    vDSP_vdiv((const float *)((char *)v44 + 2 * v42), 1, (const float *)v49, 1, (float *)v49, 1, (v50 - (unsigned char *)v49) >> 2);
    LODWORD(__p[0]) = 0;
    vDSP_dotpr((const float *)v49, 1, v44, 1, (float *)__p, (v50 - (unsigned char *)v49) >> 2);
    int v46 = (int)__p[0];
    if (v49)
    {
      float32x2_t v50 = v49;
      operator delete(v49);
    }
    LODWORD(v45) = v46;
    double v28 = [NSNumber numberWithFloat:v45];
  }
  else if (a6)
  {
    id v27 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Invalid parameters passed to landmark score computation", a4, a5];
    double v28 = 0;
    *a6 = v27;
  }
  else
  {
    double v28 = 0;
  }

  return v28;
}

- (void)calculatePupilLocationAndUpdateLandmarkPoints:(void *)a3
{
  +[VNFaceLandmarkDetector computeCentroidUsingPoints:*(void *)a3 indicies:&unk_1A41241A8 numberOfIndicies:8];
  int v6 = v4;
  int v7 = v5;
  double v9 = (_DWORD *)*((void *)a3 + 1);
  unint64_t v8 = *((void *)a3 + 2);
  if ((unint64_t)v9 >= v8)
  {
    uint64_t v11 = *(_DWORD **)a3;
    uint64_t v12 = ((uint64_t)v9 - *(void *)a3) >> 3;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61) {
      goto LABEL_32;
    }
    uint64_t v14 = v8 - (void)v11;
    if (v14 >> 2 > v13) {
      unint64_t v13 = v14 >> 2;
    }
    BOOL v15 = (unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8;
    unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
    if (!v15) {
      unint64_t v16 = v13;
    }
    if (v16)
    {
      unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v16);
      uint64_t v11 = *(_DWORD **)a3;
      double v9 = (_DWORD *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v17 = 0;
    }
    int v18 = (_DWORD *)(v16 + 8 * v12);
    unint64_t v19 = v16 + 8 * v17;
    *int v18 = v6;
    v18[1] = v7;
    double v10 = v18 + 2;
    if (v9 != v11)
    {
      do
      {
        uint64_t v20 = *((void *)v9 - 1);
        v9 -= 2;
        *((void *)v18 - 1) = v20;
        v18 -= 2;
      }
      while (v9 != v11);
      uint64_t v11 = *(_DWORD **)a3;
    }
    *(void *)a3 = v18;
    *((void *)a3 + 1) = v10;
    *((void *)a3 + 2) = v19;
    if (v11) {
      operator delete(v11);
    }
  }
  else
  {
    *double v9 = v4;
    v9[1] = v5;
    double v10 = v9 + 2;
  }
  *((void *)a3 + 1) = v10;
  +[VNFaceLandmarkDetector computeCentroidUsingPoints:*(void *)a3 indicies:&unk_1A4124328 numberOfIndicies:8];
  int v23 = v21;
  int v24 = v22;
  double v26 = (_DWORD *)*((void *)a3 + 1);
  unint64_t v25 = *((void *)a3 + 2);
  if ((unint64_t)v26 < v25)
  {
    *double v26 = v21;
    v26[1] = v22;
    id v27 = v26 + 2;
    goto LABEL_31;
  }
  double v28 = *(_DWORD **)a3;
  uint64_t v29 = ((uint64_t)v26 - *(void *)a3) >> 3;
  unint64_t v30 = v29 + 1;
  if ((unint64_t)(v29 + 1) >> 61) {
LABEL_32:
  }
    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
  uint64_t v31 = v25 - (void)v28;
  if (v31 >> 2 > v30) {
    unint64_t v30 = v31 >> 2;
  }
  BOOL v15 = (unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8;
  unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
  if (!v15) {
    unint64_t v32 = v30;
  }
  if (v32)
  {
    unint64_t v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v32);
    double v28 = *(_DWORD **)a3;
    double v26 = (_DWORD *)*((void *)a3 + 1);
  }
  else
  {
    uint64_t v33 = 0;
  }
  uint64_t v34 = (_DWORD *)(v32 + 8 * v29);
  unint64_t v35 = v32 + 8 * v33;
  *uint64_t v34 = v23;
  v34[1] = v24;
  id v27 = v34 + 2;
  if (v26 != v28)
  {
    do
    {
      uint64_t v36 = *((void *)v26 - 1);
      v26 -= 2;
      *((void *)v34 - 1) = v36;
      v34 -= 2;
    }
    while (v26 != v28);
    double v28 = *(_DWORD **)a3;
  }
  *(void *)a3 = v34;
  *((void *)a3 + 1) = v27;
  *((void *)a3 + 2) = v35;
  if (v28) {
    operator delete(v28);
  }
LABEL_31:
  *((void *)a3 + 1) = v27;
}

- (void)dealloc
{
  if (self->_modelFilesWereMemmapped)
  {
    id v3 = VNBinModelFilePathFromModelNameAndThrow(@"landmarkRefinerAndPupil_v2");
    int v4 = +[VNModelFilesCache sharedInstance];
    [v4 unload:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)VNFaceLandmarkDetector;
  [(VNDetector *)&v5 dealloc];
}

- (BOOL)loadRefinersAndReturnError:(id *)a3
{
  if (self->_faceAttributesPupilRefiner.__ptr_) {
    return 1;
  }
  if (!self->_requireFaceAttributesPupilRefiner)
  {
    double v9 = [(VNDetector *)self configurationOptions];
    double v10 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v9 specifyingRequestClass:objc_opt_class() error:a3];
    uint64_t v11 = v10;
    char v3 = v10 != 0;
    if (!v10 || (unint64_t)([v10 requestRevision] - 1) >= 2)
    {

      return v3;
    }
    self->_requireFaceAttributesPupilRefiner = 1;
  }
  self->_modelFilesWereMemmapped = [(VNDetector *)self backingStore] < 2;
  int v6 = VNBinModelFilePathFromModelNameAndThrow(@"landmarkRefinerAndPupil_v2");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__VNFaceLandmarkDetector_loadRefinersAndReturnError___block_invoke;
  v13[3] = &unk_1E5B1FCB8;
  v13[4] = self;
  id v14 = v6;
  id v7 = v6;
  unint64_t v8 = _Block_copy(v13);
  char v3 = VNExecuteBlock(v8, (uint64_t)a3);

  return v3;
}

uint64_t __53__VNFaceLandmarkDetector_loadRefinersAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 105))
  {
    double v10 = (char *)[*(id *)(a1 + 40) UTF8String];
    uint64_t v11 = operator new(0xC8uLL);
    v11[1] = 0;
    v11[2] = 0;
    *uint64_t v11 = &unk_1EF753620;
    *(void *)&long long v12 = vision::mod::LandmarkAttributes::LandmarkAttributes((vision::mod::LandmarkAttributes *)(v11 + 3), v10, 1);
    *((void *)&v12 + 1) = v11;
    unint64_t v13 = *(std::__shared_weak_count **)(*(void *)(a1 + 32) + 96);
    *(_OWORD *)(*(void *)(a1 + 32) + 88) = v12;
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v13);
    }
    return 1;
  }
  int v4 = +[VNModelFilesCache sharedInstance];
  objc_super v5 = [v4 load:*(void *)(a1 + 40)];
  int v6 = v5;
  if (v5)
  {
    memset(v17, 0, sizeof(v17));
    int v18 = 1065353216;
    cvml::util::binserialized_table_of_contents::init((cvml::util::binserialized_table_of_contents *)v17, (unsigned __int16 *)[v5 baseAddress], objc_msgSend(v5, "length"));
    memset(v15, 0, sizeof(v15));
    int v16 = 1065353216;
    cvml::util::binserialized_contents::init_model_values((uint64_t)v15, (uint64_t)v17, 0, vision::mod::LandmarkAttributes::sModelFileInfo);
    id v7 = operator new(0xC8uLL);
    v7[1] = 0;
    v7[2] = 0;
    void *v7 = &unk_1EF753620;
    *(void *)&long long v8 = vision::mod::LandmarkAttributes::LandmarkAttributes(v7 + 3, v15, 1);
    *((void *)&v8 + 1) = v7;
    double v9 = *(std::__shared_weak_count **)(*(void *)(a1 + 32) + 96);
    *(_OWORD *)(*(void *)(a1 + 32) + 88) = v8;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v9);
    }
    std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)v15);
    std::__hash_table<std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,cvml::util::binserialized_table_of_contents::blob_info>>>::~__hash_table((uint64_t)v17);

    return 1;
  }
  if (a2)
  {
    *a2 = +[VNError errorWithCode:9 message:@"Could not read landmark refiner model data"];
  }

  return 0;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VNFaceLandmarkDetector;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v9, sel_completeInitializationForSession_error_, a3))return 0; {
  int v6 = [(VNDetector *)self configurationOptions];
  }
  BOOL v7 = +[VNValidationUtilities getBOOLValue:&self->_requireFaceAttributesPupilRefiner forKey:@"VNFaceLandmarkDetectorOption_LoadRefinersModel" inOptions:v6 withDefaultValue:0 error:a4]&& [(VNFaceLandmarkDetector *)self loadRefinersAndReturnError:a4];

  return v7;
}

@end