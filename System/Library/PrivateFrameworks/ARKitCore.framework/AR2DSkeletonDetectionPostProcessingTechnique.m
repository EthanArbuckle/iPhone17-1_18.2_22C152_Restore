@interface AR2DSkeletonDetectionPostProcessingTechnique
- (ABPK2DDetectionResult)abpkPrevious3DSkeleton;
- (double)requiredTimeInterval;
- (id)processData:(id)a3;
- (void)_process2DSkeletonRawEspressoResultInBackground:(id)a3;
- (void)prepare:(BOOL)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
@end

@implementation AR2DSkeletonDetectionPostProcessingTechnique

- (ABPK2DDetectionResult)abpkPrevious3DSkeleton
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self->_abpkPrevious3DSkeleton;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore);
  return v3;
}

- (void)prepare:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  self->_deterministic = a3;
  if (!self->_postprocess2d)
  {
    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.humanposepostprocessing");
    v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    processingQueue = self->_processingQueue;
    self->_processingQueue = v4;

    v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    previous3DSkeletonSemaphore = self->_previous3DSkeletonSemaphore;
    self->_previous3DSkeletonSemaphore = v6;

    self->_use3DSupportSkeletonForExtrapolation = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.bodyTracking.useSupport3DSkeleton"];
    self->_shouldPush3DSupportSkeleton = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.bodytracking.pushProjected3DSkeleton"];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F4A3E8]) initWithAlgorithmMode:1];
    +[ARKitUserDefaults floatForKey:@"com.apple.arkit.bodytracking.extrapolationTimeLimitSeconds"];
    v10 = [MEMORY[0x1E4F4A3F0] get2DDetectionPostProcessWithNetworkConfig:v8 use3DSkeletonForExtrapolation:self->_use3DSupportSkeletonForExtrapolation shouldPush3DSupportSkeleton:self->_shouldPush3DSupportSkeleton withExtrapolationTime:v9];
    postprocess2d = self->_postprocess2d;
    self->_postprocess2d = v10;

    if (!self->_postprocess2d)
    {
      v12 = _ARLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        int v17 = 138543618;
        v18 = v14;
        __int16 v19 = 2048;
        v20 = self;
        _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Initialization of 2d post-processing algorithm failed", (uint8_t *)&v17, 0x16u);
      }
      v15 = [(ARTechnique *)self delegate];
      v16 = ARErrorWithCodeAndUserInfo(151, 0);
      [v15 technique:self didFailWithError:v16];
    }
  }
}

- (double)requiredTimeInterval
{
  int v2 = ARIsANEVersionEqualOrPriorToH12();
  double result = 0.001;
  if (v2) {
    return 0.007;
  }
  return result;
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12.receiver = self;
    v12.super_class = (Class)AR2DSkeletonDetectionPostProcessingTechnique;
    id v5 = [(ARImageBasedTechnique *)&v12 processData:v4];
    objc_initWeak(&location, self);
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__AR2DSkeletonDetectionPostProcessingTechnique_processData___block_invoke;
    block[3] = &unk_1E6187E00;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    dispatch_async(processingQueue, block);
    if (self->_deterministic) {
      dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global_93);
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __60__AR2DSkeletonDetectionPostProcessingTechnique_processData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _process2DSkeletonRawEspressoResultInBackground:*(void *)(a1 + 32)];
}

- (void)_process2DSkeletonRawEspressoResultInBackground:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ARLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543618;
    v30 = v7;
    __int16 v31 = 2048;
    v32 = self;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Process 2D Skeleton Raw Espresso Result In Background", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  uint64_t v8 = [v4 rotationNeeded];
  id v9 = [v4 inputImageData];
  [v9 timestamp];
  double v11 = v10;
  [v9 timestamp];
  kdebug_trace();
  objc_super v12 = [v4 inputImageData];
  size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v12 pixelBuffer]);
  v14 = [v4 inputImageData];
  size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v14 pixelBuffer]);

  v16 = [v4 imageDataForNeuralNetwork];
  size_t v17 = CVPixelBufferGetWidth((CVPixelBufferRef)[v16 pixelBuffer]);
  v18 = [v4 imageDataForNeuralNetwork];
  size_t v19 = CVPixelBufferGetHeight((CVPixelBufferRef)[v18 pixelBuffer]);

  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4A438]), "initWithType:inputResolution:outputResolution:", 1, (double)Width, (double)Height, (double)v17, (double)v19);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  postprocess2d = self->_postprocess2d;
  [v9 timestamp];
  LODWORD(postprocess2d) = -[ABPK2DDetectionPostprocess extract2DSkeletonfromBuffers:withImagePreProcessingParams:atTimestamp:previousSkeleton3D:](postprocess2d, "extract2DSkeletonfromBuffers:withImagePreProcessingParams:atTimestamp:previousSkeleton3D:", v4, v20, self->_abpkPrevious3DSkeleton);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore);
  if (postprocess2d == -6661)
  {
    v22 = objc_opt_new();
    [v22 setTimestamp:v11];
    v28 = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    [(ARImageBasedTechnique *)self pushResultData:v23 forTimestamp:v11];
  }
  else
  {
    v22 = -[ABPK2DDetectionPostprocess getRaw2DDetectionResultforRotation:croppedRect:](self->_postprocess2d, "getRaw2DDetectionResultforRotation:croppedRect:", v8, 0.0, 0.0, 1.0, 1.0);
    v23 = -[ABPK2DDetectionPostprocess get2DDetectionResultforRotation:croppedRect:](self->_postprocess2d, "get2DDetectionResultforRotation:croppedRect:", v8, 0.0, 0.0, 1.0, 1.0);
    v24 = objc_opt_new();
    [v24 setTimestamp:v11];
    [v24 setTrackedDetectionResult:v23];
    [v24 setRawDetectionResult:v22];
    if (self->_shouldPush3DSupportSkeleton)
    {
      v25 = [(ABPK2DDetectionPostprocess *)self->_postprocess2d getAligned3DSkeleton];
      [v24 setAlignedDetectionResult:v25];
    }
    v27 = v24;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    [(ARImageBasedTechnique *)self pushResultData:v26 forTimestamp:v11];

    [v9 timestamp];
    kdebug_trace();
  }
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v91 = a4;
  v110.receiver = self;
  v110.super_class = (Class)AR2DSkeletonDetectionPostProcessingTechnique;
  -[ARImageBasedTechnique requestResultDataAtTimestamp:context:](&v110, sel_requestResultDataAtTimestamp_context_, a3);
  id v5 = [v91 resultDataOfClass:objc_opt_class()];
  v92 = [v5 firstObject];

  v6 = [v92 resultDataOfClass:objc_opt_class()];
  v101 = [v6 firstObject];

  if (!v101
    || ([v101 retargetedSkeletons],
        v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = [v7 count] == 0,
        v7,
        v8))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    abpkPrevious3DSkeleton = self->_abpkPrevious3DSkeleton;
    self->_abpkPrevious3DSkeleton = 0;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore);
    goto LABEL_83;
  }
  id v9 = [v101 retargetedSkeletons];
  double v10 = [v9 firstObject];

  [v101 cameraIntrinsics];
  float32x4_t v104 = v11;
  [v101 cameraIntrinsics];
  *(_OWORD *)obja = v12;
  [v101 cameraIntrinsics];
  float32x4_t v99 = v13;
  [v10 visionTransform];
  unint64_t v14 = 0;
  float32x4_t v16 = *(float32x4_t *)obja;
  float32x4_t v15 = v104;
  v15.i32[3] = 0;
  v16.i32[3] = 0;
  float32x4_t v17 = v99;
  v17.i32[3] = 0;
  v111[0] = v18;
  v111[1] = v19;
  v111[2] = v20;
  v111[3] = v21;
  do
  {
    *(float32x4_t *)&__p[v14 / 8] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(v111[v14 / 0x10])), v16, *(float32x2_t *)&v111[v14 / 0x10], 1), v17, (float32x4_t)v111[v14 / 0x10], 2), (float32x4_t)xmmword_1B8A2B050, (float32x4_t)v111[v14 / 0x10], 3);
    v14 += 16;
  }
  while (v14 != 64);
  float32x4_t v98 = (float32x4_t)v113[0];
  float32x4_t v100 = *(float32x4_t *)__p;
  float32x4_t v96 = (float32x4_t)v113[2];
  float32x4_t v97 = (float32x4_t)v113[1];
  v89 = [v10 liftedSkeletonData];
  v22 = [v89 skeletonDetectionResult2D];
  uint64_t v23 = [v22 rotation];

  float v24 = (float)-(float)v23 * 3.14159265 / 180.0;
  __float2 v25 = __sincosf_stret(v24);
  v26 = +[ARSkeletonDefinition defaultBody2DSkeletonDefinition];
  unint64_t v27 = [v26 jointCount];

  __p[0] = 0;
  __p[1] = 0;
  *(void *)&v113[0] = 0;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(__p, v27);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  v28 = +[ARSkeletonDefinition defaultBody2DSkeletonDefinition];
  obj = [v28 jointNames];

  uint64_t v29 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
  if (!v29)
  {
    int v93 = 1;
    int v94 = 1;
    goto LABEL_72;
  }
  v30.f32[0] = -v25.__sinval;
  v30.i32[1] = LODWORD(v25.__cosval);
  float32x2_t v95 = v30;
  uint64_t v31 = *(void *)v107;
  int v93 = 1;
  int v94 = 1;
  __asm { FMOV            V10.2S, #-1.0 }
  do
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if (*(void *)v107 != v31) {
        objc_enumerationMutation(obj);
      }
      v38 = (__CFString *)*(id *)(*((void *)&v106 + 1) + 8 * i);
      if ([(__CFString *)v38 isEqualToString:@"root"])
      {

        v38 = @"hips_joint";
      }
      v39 = +[ARSkeletonDefinition defaultBody3DSkeletonDefinition];
      v40 = [v39 jointNames];
      uint64_t v41 = [v40 indexOfObject:v38];

      if (v41 != 0x7FFFFFFFFFFFFFFFLL)
      {
        float32x4_t v105 = *(float32x4_t *)([v10 jointModelTransforms] + (v41 << 6) + 48);
        [v10 estimatedScaleFactor];
        double v44 = v43;
        [v101 imageResolution];
        double v46 = v45;
        [v101 imageResolution];
        float v47 = v44;
        float32x4_t v48 = vmulq_n_f32(v105, v47);
        float32x4_t v49 = vaddq_f32(v96, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v100, v48.f32[0]), v98, *(float32x2_t *)v48.f32, 1), v97, v48, 2));
        v49.i64[0] = vdivq_f32(v49, (float32x4_t)vdupq_laneq_s32((int32x4_t)v49, 2)).u64[0];
        v49.f32[0] = v49.f32[0] / v46 + -0.5;
        *(float *)&double v50 = v49.f32[1] / v50 + -0.5;
        float32x2_t v51 = vadd_f32(vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v25.__sinval), LODWORD(v25.__cosval)), v49.f32[0]), v95, *(float *)&v50), (float32x2_t)0x3F0000003F000000);
        v52 = (float32x2_t *)__p[1];
        if (__p[1] >= (void *)*(void *)&v113[0])
        {
          int64_t v54 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          if ((unint64_t)(v54 + 1) >> 61) {
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v55 = (uint64_t)(*(void *)&v113[0] - (unint64_t)__p[0]) >> 2;
          if (v55 <= v54 + 1) {
            unint64_t v55 = v54 + 1;
          }
          if (*(void *)&v113[0] - (unint64_t)__p[0] >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v56 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v56 = v55;
          }
          if (v56) {
            v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)v113, v56);
          }
          else {
            v57 = 0;
          }
          v62 = (float32x2_t *)&v57[8 * v54];
          float32x2_t *v62 = v51;
          v53 = v62 + 1;
          v64 = (char *)__p[0];
          v63 = (char *)__p[1];
          if (__p[1] != __p[0])
          {
            do
            {
              float32x2_t v65 = *(float32x2_t *)(v63 - 8);
              v63 -= 8;
              v62[-1] = v65;
              --v62;
            }
            while (v63 != v64);
            v63 = (char *)__p[0];
          }
          __p[0] = v62;
          __p[1] = v53;
          *(void *)&v113[0] = &v57[8 * v56];
          if (v63) {
            operator delete(v63);
          }
        }
        else
        {
          *(float32x2_t *)__p[1] = v51;
          v53 = v52 + 1;
        }
        goto LABEL_66;
      }
      if ([(__CFString *)v38 isEqualToString:@"right_ear_joint"])
      {
        v42 = (float32x2_t *)__p[1];
        if (__p[1] >= (void *)*(void *)&v113[0])
        {
          int64_t v58 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          if ((unint64_t)(v58 + 1) >> 61) {
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v59 = (uint64_t)(*(void *)&v113[0] - (unint64_t)__p[0]) >> 2;
          if (v59 <= v58 + 1) {
            unint64_t v59 = v58 + 1;
          }
          if (*(void *)&v113[0] - (unint64_t)__p[0] >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v60 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v60 = v59;
          }
          if (v60) {
            v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)v113, v60);
          }
          else {
            v61 = 0;
          }
          v70 = &v61[8 * v58];
          *(float32x2_t *)v70 = _D10;
          v53 = (float32x2_t *)(v70 + 8);
          v72 = (char *)__p[0];
          v71 = (char *)__p[1];
          if (__p[1] != __p[0])
          {
            do
            {
              uint64_t v73 = *((void *)v71 - 1);
              v71 -= 8;
              *((void *)v70 - 1) = v73;
              v70 -= 8;
            }
            while (v71 != v72);
            v71 = (char *)__p[0];
          }
          __p[0] = v70;
          __p[1] = v53;
          *(void *)&v113[0] = &v61[8 * v60];
          if (v71) {
            operator delete(v71);
          }
          int v94 = 0;
          goto LABEL_66;
        }
        int v94 = 0;
      }
      else
      {
        if (![(__CFString *)v38 isEqualToString:@"left_ear_joint"]) {
          goto LABEL_67;
        }
        v42 = (float32x2_t *)__p[1];
        if (__p[1] >= (void *)*(void *)&v113[0])
        {
          int64_t v66 = ((char *)__p[1] - (char *)__p[0]) >> 3;
          if ((unint64_t)(v66 + 1) >> 61) {
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v67 = (uint64_t)(*(void *)&v113[0] - (unint64_t)__p[0]) >> 2;
          if (v67 <= v66 + 1) {
            unint64_t v67 = v66 + 1;
          }
          if (*(void *)&v113[0] - (unint64_t)__p[0] >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v68 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v68 = v67;
          }
          if (v68) {
            v69 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)v113, v68);
          }
          else {
            v69 = 0;
          }
          v74 = &v69[8 * v66];
          *(float32x2_t *)v74 = _D10;
          v53 = (float32x2_t *)(v74 + 8);
          v76 = (char *)__p[0];
          v75 = (char *)__p[1];
          if (__p[1] != __p[0])
          {
            do
            {
              uint64_t v77 = *((void *)v75 - 1);
              v75 -= 8;
              *((void *)v74 - 1) = v77;
              v74 -= 8;
            }
            while (v75 != v76);
            v75 = (char *)__p[0];
          }
          __p[0] = v74;
          __p[1] = v53;
          *(void *)&v113[0] = &v69[8 * v68];
          if (v75) {
            operator delete(v75);
          }
          int v93 = 0;
          goto LABEL_66;
        }
        int v93 = 0;
      }
      float32x2_t *v42 = _D10;
      v53 = v42 + 1;
LABEL_66:
      __p[1] = v53;
LABEL_67:
    }
    uint64_t v29 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
  }
  while (v29);
LABEL_72:

  std::vector<unsigned int>::vector((std::vector<unsigned int> *)v111, ((char *)__p[1] - (char *)__p[0]) >> 3);
  if ((uint64_t)(*((void *)&v111[0] + 1) - *(void *)&v111[0]) >= 1) {
    memset_pattern16(*(void **)&v111[0], &unk_1B8A56610, 4* (((*((void *)&v111[0] + 1) - *(void *)&v111[0]) >> 2)- (*((void *)&v111[0] + 1) - *(void *)&v111[0] > 3uLL))+ 4);
  }
  v79 = +[ARSkeletonDefinition defaultBody2DSkeletonDefinition];
  v80 = [v79 jointNames];
  uint64_t v81 = [v80 indexOfObject:@"right_ear_joint"];

  v82 = +[ARSkeletonDefinition defaultBody2DSkeletonDefinition];
  v83 = [v82 jointNames];
  uint64_t v84 = [v83 indexOfObject:@"left_ear_joint"];

  uint64_t v85 = *(void *)&v111[0];
  if (v81 != 0x7FFFFFFFFFFFFFFFLL) {
    *(_DWORD *)(*(void *)&v111[0] + 4 * v81) = v94;
  }
  if (v84 != 0x7FFFFFFFFFFFFFFFLL) {
    *(_DWORD *)(v85 + 4 * v84) = v93;
  }
  *(_DWORD *)(v85 + 4 * v84) = v93;
  v86 = (ABPK2DDetectionResult *)objc_msgSend(objc_alloc(MEMORY[0x1E4F4A3F8]), "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", 0.0, 0.0, 1.0, 1.0);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v87 = self->_abpkPrevious3DSkeleton;
  self->_abpkPrevious3DSkeleton = v86;
  v88 = v86;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_previous3DSkeletonSemaphore);
  if (*(void *)&v111[0])
  {
    *((void *)&v111[0] + 1) = *(void *)&v111[0];
    operator delete(*(void **)&v111[0]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

LABEL_83:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abpkPrevious3DSkeleton, 0);
  objc_storeStrong((id *)&self->_postprocess2d, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_previous3DSkeletonSemaphore, 0);
}

@end