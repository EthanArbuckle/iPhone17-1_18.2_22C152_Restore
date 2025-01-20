@interface ARFaceLightEstimationTechnique
+ (float)_computeShSmoothingAlpha:(double)a3;
+ (shared_ptr<arkit::FaceTrackingData>)_transformFaceTrackingData:(id)a3;
- (ARFaceLightEstimationTechnique)init;
- (id).cxx_construct;
- (id)processData:(id)a3;
- (unint64_t)requiredSensorDataTypes;
- (void)_processFaceDataInBackground:(id)a3 pixelBuffer:(__CVBuffer *)a4 lightIntensity:(float)a5 timestamp:(double)a6;
- (void)dealloc;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
@end

@implementation ARFaceLightEstimationTechnique

- (ARFaceLightEstimationTechnique)init
{
  v11.receiver = self;
  v11.super_class = (Class)ARFaceLightEstimationTechnique;
  v2 = [(ARTechnique *)&v11 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    resultSemaphore = v2->_resultSemaphore;
    v2->_resultSemaphore = (OS_dispatch_semaphore *)v3;

    v2->_lightIntensity = 1.0;
    v2->_temperature = 6500.0;
    +[ARFaceLightEstimationTechnique _computeShSmoothingAlpha:0.0166666675];
    v2->_shSmoothingAlpha = v5;
    uint64_t v6 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.technique.faceLightEstimation");
    lightEstimationQueue = v2->_lightEstimationQueue;
    v2->_lightEstimationQueue = (OS_dispatch_queue *)v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    estimatingSemaphore = v2->_estimatingSemaphore;
    v2->_estimatingSemaphore = (OS_dispatch_semaphore *)v8;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ARFaceLightEstimationTechnique;
  [(ARFaceLightEstimationTechnique *)&v2 dealloc];
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

+ (float)_computeShSmoothingAlpha:(double)a3
{
  return 1.0 - exp(a3 / -0.191625923);
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v6 = (arkit *)[v5 temperature];
    self->_temperature = arkit::mapColorTemperature(v6, v7);
    [v5 exposureTargetOffset];
    float v11 = ARMapExposureOffset(v8);
    self->_lightIntensity = arkit::ExponentialSmoother<float>::step((uint64_t)&self->_smoother, &v11, 1.0 / (float)[v5 captureFramesPerSecond], 0.016667, 0.2);
    +[ARFaceLightEstimationTechnique _computeShSmoothingAlpha:](ARFaceLightEstimationTechnique, "_computeShSmoothingAlpha:", (float)(1.0 / (float)[v5 captureFramesPerSecond]));
    self->_shSmoothingAlpha = v9;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  }
  return v4;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  float v7 = [v6 imageData];
  float v8 = (__CVBuffer *)[v7 pixelBuffer];

  float v9 = [v6 resultDataOfClass:objc_opt_class()];
  v10 = [v9 firstObject];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v39 = v10;
  float v11 = [v10 trackedFaces];
  v12 = 0;
  uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v47;
    float v15 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        [v17 transform];
        float32x4_t v19 = vmulq_f32(v18, v18);
        float v20 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0]);
        if (v20 < v15 && [v17 isValid])
        {
          id v21 = v17;

          float v15 = v20;
          v12 = v21;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v13);
  }

  if (([v12 isValid] & 1) == 0)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    lastLightEstimate = self->_lastLightEstimate;
    if (lastLightEstimate) {
      [(ARDirectionalLightEstimate *)lastLightEstimate setConfidenceRating:0.0];
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  }
  int v23 = [v12 isValid];
  if (v8) {
    int v24 = v23;
  }
  else {
    int v24 = 0;
  }
  if (v24 == 1 && !dispatch_semaphore_wait((dispatch_semaphore_t)self->_estimatingSemaphore, 0))
  {
    kdebug_trace();
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    CVPixelBufferRef v25 = CVPixelBufferRetain(v8);
    float lightIntensity = self->_lightIntensity;
    id v27 = v12;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
    objc_initWeak(&location, self);
    v28 = self->_estimatingSemaphore;
    lightEstimationQueue = self->_lightEstimationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__ARFaceLightEstimationTechnique_requestResultDataAtTimestamp_context___block_invoke;
    block[3] = &unk_1E6187648;
    objc_copyWeak(v43, &location);
    v43[1] = v25;
    float v44 = lightIntensity;
    v43[2] = *(id *)&a3;
    id v41 = v27;
    v42 = v28;
    v30 = v28;
    id v31 = v27;
    dispatch_async(lightEstimationQueue, block);

    objc_destroyWeak(v43);
    objc_destroyWeak(&location);
  }
  v32 = objc_opt_new();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v33 = self->_lastLightEstimate;
  if (v33) {
    v34 = (ARLightEstimate *)[(ARDirectionalLightEstimate *)v33 copy];
  }
  else {
    v34 = [[ARLightEstimate alloc] initWithAmbientIntensity:self->_lightIntensity * 1000.0 temperature:self->_temperature];
  }
  [v32 setLightEstimate:v34];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  v35 = [(ARTechnique *)self delegate];
  char v36 = objc_opt_respondsToSelector();

  if (v36)
  {
    v37 = [(ARTechnique *)self delegate];
    v50 = v32;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    [v37 technique:self didOutputResultData:v38 timestamp:v6 context:a3];
  }
}

intptr_t __71__ARFaceLightEstimationTechnique_requestResultDataAtTimestamp_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  LODWORD(v3) = *(_DWORD *)(a1 + 72);
  [WeakRetained _processFaceDataInBackground:*(void *)(a1 + 32) pixelBuffer:*(void *)(a1 + 56) lightIntensity:v3 timestamp:*(double *)(a1 + 64)];

  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
  id v4 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v4);
}

- (void)_processFaceDataInBackground:(id)a3 pixelBuffer:(__CVBuffer *)a4 lightIntensity:(float)a5 timestamp:(double)a6
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_lightEstimationQueue);
  float v11 = objc_opt_class();
  if (v11)
  {
    [v11 _transformFaceTrackingData:v10];
  }
  else
  {
    uint64_t v35 = 0;
    char v36 = 0;
  }
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  arkit::wrap(a4, v34);
  uint64_t v32 = 0x3F19999A00000032;
  char v33 = 1;
  BOOL v30 = [(ARTechnique *)self powerUsage] == 0;
  char v31 = 1;
  float shSmoothingAlpha = self->_shSmoothingAlpha;
  v29[1] = -1130113270;
  *(float *)v29 = shSmoothingAlpha;
  arkit::FacialLightEstimation::estimateLight((uint64_t)&self->_faceLightEstimator, (uint64_t)v29, v35, (uint64_t)v34, (uint64_t)v27);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  float v13 = v27[0] * v27[0];
  for (uint64_t i = 1; i != 9; i += 4)
  {
    float32x4_t v15 = vmulq_f32(*(float32x4_t *)&v27[i], *(float32x4_t *)&v27[i]);
    float v13 = (float)((float)((float)(v13 + v15.f32[0]) + v15.f32[1]) + v15.f32[2]) + v15.f32[3];
  }
  uint64_t v16 = 0;
  float v17 = (float)(a5 * 4.0) * (float)(1.0 / sqrtf(v13));
  int v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  do
  {
    *(float *)((char *)&v24 + v16 * 4) = v17 * v27[v16];
    ++v16;
  }
  while (v16 != 9);
  kdebug_trace();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  float v18 = v28;
  if (v28 > 0.0)
  {
    float32x4_t v19 = [ARDirectionalLightEstimate alloc];
    v22[0] = v24;
    v22[1] = v25;
    int v23 = v26;
    float v20 = [(ARDirectionalLightEstimate *)v19 initWithSphericalHarmonics:v22 ambientIntensity:(float)(a5 * 1000.0) temperature:self->_temperature];
    lastLightEstimate = self->_lastLightEstimate;
    self->_lastLightEstimate = v20;

    [(ARDirectionalLightEstimate *)self->_lastLightEstimate setTimestamp:a6];
  }
  [(ARDirectionalLightEstimate *)self->_lastLightEstimate setConfidenceRating:v18];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
}

+ (shared_ptr<arkit::FaceTrackingData>)_transformFaceTrackingData:(id)a3
{
  id v36 = a3;
  unint64_t v3 = [v36 vertexCount];
  uint64_t v4 = [v36 imageVertices];
  uint64_t v5 = [v36 vertices];
  uint64_t v6 = [v36 normals];
  [v36 transform];
  simd_float4x4 v46 = __invert_f4(v45);
  float32x4_t v33 = (float32x4_t)v46.columns[0];
  float32x4_t v34 = (float32x4_t)v46.columns[1];
  float32x4_t v37 = (float32x4_t)v46.columns[2];
  float32x4_t v35 = (float32x4_t)v46.columns[3];
  __p = 0;
  id v41 = 0;
  v42 = 0;
  std::vector<arkit::Landmark>::reserve((char **)&__p, v3);
  if (v3)
  {
    uint64_t v7 = 0;
    float32x4_t v8 = vaddq_f32(v35, vmlaq_f32(vmlaq_f32(vmulq_f32(v33, (float32x4_t)0), (float32x4_t)0, v34), (float32x4_t)0, v37));
    float32x4_t v38 = v8;
    do
    {
      float32x4_t v9 = *(float32x4_t *)(v6 + 16 * v7);
      int32x4_t v10 = (int32x4_t)vmulq_f32(v9, v9);
      v10.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v10, 2), vadd_f32(*(float32x2_t *)v10.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v10.i8, 1))).u32[0];
      float32x2_t v11 = vrsqrte_f32((float32x2_t)v10.u32[0]);
      float32x2_t v12 = vmul_f32(v11, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v11, v11)));
      float32x4_t v13 = vmulq_n_f32(v9, vmul_f32(v12, vrsqrts_f32((float32x2_t)v10.u32[0], vmul_f32(v12, v12))).f32[0]);
      if (v7 == 859 || v7 == 431) {
        float32x4_t v13 = vnegq_f32(v13);
      }
      uint64_t v14 = *(void *)(v4 + 8 * v7);
      float32x4_t v15 = vsubq_f32(v8, *(float32x4_t *)(v5 + 16 * v7));
      int32x4_t v16 = (int32x4_t)vmulq_f32(v15, v15);
      v16.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2), vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v16.i8, 1))).u32[0];
      float32x2_t v17 = vrsqrte_f32((float32x2_t)v16.u32[0]);
      float32x2_t v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v17, v17)));
      float32x4_t v19 = vmulq_f32(vmulq_n_f32(v15, vmul_f32(v18, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v18, v18))).f32[0]), v13);
      BOOL v20 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0] > 0.34202;
      id v21 = v41;
      if (v41 >= v42)
      {
        unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * ((v41 - (unsigned char *)__p) >> 2);
        unint64_t v24 = v23 + 1;
        if (v23 + 1 > 0x1555555555555555) {
          std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * ((v42 - (unsigned char *)__p) >> 2) > v24) {
          unint64_t v24 = 0x5555555555555556 * ((v42 - (unsigned char *)__p) >> 2);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((v42 - (unsigned char *)__p) >> 2) >= 0xAAAAAAAAAAAAAAALL) {
          unint64_t v25 = 0x1555555555555555;
        }
        else {
          unint64_t v25 = v24;
        }
        int v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<float,3u,1u,false>>>((uint64_t)&v42, v25);
        float v28 = &v26[12 * v23];
        *(void *)float v28 = v14;
        v28[8] = v20;
        BOOL v30 = __p;
        v29 = v41;
        char v31 = v28;
        if (v41 != __p)
        {
          do
          {
            uint64_t v32 = *(void *)(v29 - 12);
            v29 -= 12;
            *(void *)(v31 - 12) = v32;
            v31 -= 12;
            v31[8] = v29[8];
          }
          while (v29 != v30);
          v29 = __p;
        }
        v22 = v28 + 12;
        __p = v31;
        id v41 = v28 + 12;
        v42 = &v26[12 * v27];
        if (v29) {
          operator delete(v29);
        }
        float32x4_t v8 = v38;
      }
      else
      {
        *(void *)id v41 = v14;
        v21[8] = v20;
        v22 = v21 + 12;
      }
      id v41 = v22;
      ++v7;
    }
    while (v7 != v3);
  }
  *(double *)v44.columns[0].i64 = ARMatrix3x3FromMatrix4x4(objc_msgSend(v36, "transform", *(_OWORD *)&v33, *(_OWORD *)&v34, *(_OWORD *)&v35));
  ARCVAMatrixFromMatrix(v44, (uint64_t)v39);
  operator new();
}

- (void).cxx_destruct
{
  p_faceLightEstimator = &self->_faceLightEstimator;
  begin = self->_faceLightEstimator.m_inliers.__begin_;
  if (begin)
  {
    p_faceLightEstimator->m_inliers.__end_ = begin;
    operator delete(begin);
  }
  cntrl = (std::__shared_weak_count *)p_faceLightEstimator->m_precomputedFaceData.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  free(p_faceLightEstimator->m_validRtfs.m_data);
  uint64_t v6 = p_faceLightEstimator->m_sampleIndices_all.__begin_;
  if (v6)
  {
    p_faceLightEstimator->m_sampleIndices_all.__end_ = v6;
    operator delete(v6);
  }
  uint64_t v7 = p_faceLightEstimator->m_validChromaSampleIDS.__begin_;
  if (v7)
  {
    p_faceLightEstimator->m_validChromaSampleIDS.__end_ = v7;
    operator delete(v7);
  }
  free(p_faceLightEstimator->m_validSampleIntensities.m_data);
  objc_storeStrong((id *)&self->_estimatingSemaphore, 0);
  objc_storeStrong((id *)&self->_lightEstimationQueue, 0);
  objc_storeStrong((id *)&self->_lastLightEstimate, 0);
  objc_storeStrong((id *)&self->_resultSemaphore, 0);
}

- (id).cxx_construct
{
  self->_smoother.state.var0.__null_state_ = 0;
  self->_smoother.state.__engaged_ = 0;
  arkit::FacialLightEstimation::FacialLightEstimation((arkit::FacialLightEstimation *)&self->_faceLightEstimator);
  return self;
}

@end