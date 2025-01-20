@interface ARPlaneEstimationTechnique
+ (id)_detectPlanesWithDetector:(simd_float4)a3 types:(simd_float4)a4 camera:(uint64_t)a5 referenceFeaturePoints:(uint64_t)a6 referenceOriginTransform:(uint64_t)a7;
+ (id)detectPlanes:(unint64_t)a3 withFrame:(id)a4;
- (ARPlaneEstimationTechnique)initWithTrackingTechnique:(id)a3;
- (ARWorldTrackingTechnique)worldTrackingTechnique;
- (BOOL)isBusy;
- (BOOL)isEqual:(id)a3;
- (BOOL)reconfigurableFrom:(id)a3;
- (id)_fullDescription;
- (id)resultDataClasses;
- (void)dealloc;
- (void)reconfigureFrom:(id)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)setWorldTrackingTechnique:(id)a3;
- (void)siblingTechniquesDidChange:(id)a3;
- (void)technique:(id)a3 didDetectPlane:(id)a4 timestamp:(double)a5;
- (void)technique:(id)a3 didOutputSceneUnderstandingData:(id)a4 timestamp:(double)a5;
@end

@implementation ARPlaneEstimationTechnique

- (ARPlaneEstimationTechnique)initWithTrackingTechnique:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARPlaneEstimationTechnique;
  v6 = [(ARTechnique *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_worldTrackingTechnique, a3);
    [(ARWorldTrackingTechnique *)v7->_worldTrackingTechnique addObserver:v7];
    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    semaphoreResult = v7->_semaphoreResult;
    v7->_semaphoreResult = (OS_dispatch_semaphore *)v8;

    v10 = _ARLogTechnique();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543874;
      v16 = v12;
      __int16 v17 = 2048;
      v18 = v7;
      __int16 v19 = 2048;
      id v20 = v5;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with world tracking technique (%p)", buf, 0x20u);
    }
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogTechnique();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    dispatch_semaphore_t v8 = v5;
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: dealloc", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)ARPlaneEstimationTechnique;
  [(ARPlaneEstimationTechnique *)&v6 dealloc];
}

- (id)resultDataClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (BOOL)reconfigurableFrom:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    objc_super v6 = [(ARPlaneEstimationTechnique *)self worldTrackingTechnique];
    v7 = [v5 worldTrackingTechnique];
    char v8 = [v6 reconfigurableFrom:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)reconfigureFrom:(id)a3
{
  id v8 = a3;
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
    id v4 = v8;
    id v5 = [(ARPlaneEstimationTechnique *)self worldTrackingTechnique];
    [v5 removeObserver:self];

    objc_super v6 = [v4 worldTrackingTechnique];
    [v6 addObserver:self];

    v7 = [v4 worldTrackingTechnique];
    [(ARPlaneEstimationTechnique *)self setWorldTrackingTechnique:v7];
  }
}

- (void)siblingTechniquesDidChange:(id)a3
{
  id v6 = a3;
  id v4 = +[ARTechnique techniqueOfClass:objc_opt_class() inArray:v6];
  if (v4)
  {
    id v5 = [(ARPlaneEstimationTechnique *)self worldTrackingTechnique];
    [v5 removeObserver:self];

    [v4 addObserver:self];
    [(ARPlaneEstimationTechnique *)self setWorldTrackingTechnique:v4];
  }
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v16 = a4;
  id v6 = objc_opt_new();
  v7 = [v16 anchorsToRemove];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    worldTrackingTechnique = self->_worldTrackingTechnique;
    v10 = [v16 anchorsToRemove];
    [(ARWorldTrackingTechnique *)worldTrackingTechnique removePlanesByUUIDs:v10];
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphoreResult, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_planeResultData)
  {
    objc_msgSend(v6, "addObject:");
    planeResultData = self->_planeResultData;
    self->_planeResultData = 0;
  }
  if (self->_rawSceneUnderstandingData)
  {
    objc_msgSend(v6, "addObject:");
    rawSceneUnderstandingData = self->_rawSceneUnderstandingData;
    self->_rawSceneUnderstandingData = 0;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreResult);
  v13 = [(ARTechnique *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    v15 = [(ARTechnique *)self delegate];
    [v15 technique:self didOutputResultData:v6 timestamp:v16 context:a3];
  }
}

- (void)technique:(id)a3 didDetectPlane:(id)a4 timestamp:(double)a5
{
  id v6 = (ARPlaneData *)a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphoreResult, 0xFFFFFFFFFFFFFFFFLL);
  planeResultData = self->_planeResultData;
  self->_planeResultData = v6;
  uint64_t v8 = v6;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreResult);
}

- (void)technique:(id)a3 didOutputSceneUnderstandingData:(id)a4 timestamp:(double)a5
{
  id v6 = (ARRawSceneUnderstandingData *)a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphoreResult, 0xFFFFFFFFFFFFFFFFLL);
  rawSceneUnderstandingData = self->_rawSceneUnderstandingData;
  self->_rawSceneUnderstandingData = v6;
  uint64_t v8 = v6;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreResult);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARPlaneEstimationTechnique;
  if ([(ARTechnique *)&v10 isEqual:v4])
  {
    id v5 = v4;
    id v6 = [(ARPlaneEstimationTechnique *)self worldTrackingTechnique];
    v7 = [v5 worldTrackingTechnique];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_fullDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)ARPlaneEstimationTechnique;
  id v4 = [(ARTechnique *)&v7 _fullDescription];
  id v5 = [v3 stringWithFormat:@"%@\n", v4];

  [v5 appendFormat:@"Plane Result Data: %@\n", self->_planeResultData];
  [v5 appendFormat:@"Scene Understanding Data: %@\n", self->_rawSceneUnderstandingData];
  return v5;
}

- (BOOL)isBusy
{
  intptr_t v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphoreResult, 0);
  if (!v3) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphoreResult);
  }
  return v3 != 0;
}

+ (id)detectPlanes:(unint64_t)a3 withFrame:(id)a4
{
  id v6 = a4;
  CV3DSurfaceDetectionDefaultParameters();
  CV3DSurfaceDetectionCreateWithArgs();
  objc_super v7 = [v6 camera];
  BOOL v8 = [v6 referenceFeaturePoints];
  [v6 referenceOriginTransform];
  __int16 v9 = objc_msgSend(a1, "_detectPlanesWithDetector:types:camera:referenceFeaturePoints:referenceOriginTransform:", 0, a3, v7, v8);

  CV3DSurfaceDetectionRelease();
  return v9;
}

+ (id)_detectPlanesWithDetector:(simd_float4)a3 types:(simd_float4)a4 camera:(uint64_t)a5 referenceFeaturePoints:(uint64_t)a6 referenceOriginTransform:(uint64_t)a7
{
  v68.columns[2] = a3;
  v68.columns[3] = a4;
  v68.columns[0] = a1;
  v68.columns[1] = a2;
  id v12 = a9;
  id v13 = a10;
  [v12 transform];
  simd_float4 v64 = v15;
  simd_float4 v65 = v14;
  simd_float4 v66 = v17;
  simd_float4 v67 = v16;
  *(double *)v18.i64 = ARRenderingToVisionCoordinateTransform();
  float32x4_t v62 = v19;
  float32x4_t v63 = v18;
  float32x4_t v60 = v21;
  float32x4_t v61 = v20;
  *(double *)v22.i64 = ARVisionCameraToRenderingCoordinateTransform();
  simd_float4 v56 = v23;
  simd_float4 v57 = v22;
  simd_float4 v58 = v25;
  simd_float4 v59 = v24;
  simd_float4x4 v96 = __invert_f4(v68);
  uint64_t v26 = 0;
  v92.columns[0] = v65;
  v92.columns[1] = v64;
  v92.columns[2] = v67;
  v92.columns[3] = v66;
  do
  {
    v88.columns[v26] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v96.columns[0], COERCE_FLOAT(*(_OWORD *)&v92.columns[v26])), (float32x4_t)v96.columns[1], *(float32x2_t *)v92.columns[v26].f32, 1), (float32x4_t)v96.columns[2], (float32x4_t)v92.columns[v26], 2), (float32x4_t)v96.columns[3], (float32x4_t)v92.columns[v26], 3);
    ++v26;
  }
  while (v26 != 4);
  uint64_t v27 = 0;
  simd_float4x4 v92 = v88;
  do
  {
    v88.columns[v27] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v63, COERCE_FLOAT(*(_OWORD *)&v92.columns[v27])), v62, *(float32x2_t *)v92.columns[v27].f32, 1), v61, (float32x4_t)v92.columns[v27], 2), v60, (float32x4_t)v92.columns[v27], 3);
    ++v27;
  }
  while (v27 != 4);
  uint64_t v28 = 0;
  float32x4_t v29 = (float32x4_t)v88.columns[0];
  float32x4_t v30 = (float32x4_t)v88.columns[1];
  float32x4_t v31 = (float32x4_t)v88.columns[2];
  float32x4_t v32 = (float32x4_t)v88.columns[3];
  v92.columns[0] = v57;
  v92.columns[1] = v56;
  v92.columns[2] = v59;
  v92.columns[3] = v58;
  do
  {
    v88.columns[v28] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(_OWORD *)&v92.columns[v28])), v30, *(float32x2_t *)v92.columns[v28].f32, 1), v31, (float32x4_t)v92.columns[v28], 2), v32, (float32x4_t)v92.columns[v28], 3);
    ++v28;
  }
  while (v28 != 4);
  simd_float4x4 v97 = __invert_f4(v88);
  __n128 v71 = (__n128)v97.columns[1];
  __n128 v72 = (__n128)v97.columns[0];
  __n128 v69 = (__n128)v97.columns[3];
  __n128 v70 = (__n128)v97.columns[2];
  std::vector<CV3DSurfaceDetectionPoint3D>::vector(&v92, [v13 count]);
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  for (unint64_t i = 0; i < objc_msgSend(v13, "count", *(_OWORD *)&v56, *(_OWORD *)&v57, *(_OWORD *)&v58, *(_OWORD *)&v59); ++i)
  {
    v36 = (float *)([v13 points] + v34);
    v37 = (double *)(v92.columns[0].i64[0] + v33);
    double *v37 = (float)-v36[2];
    v37[1] = (float)-*v36;
    v37[2] = v36[1];
    v34 += 16;
    v33 += 24;
  }
  v88.columns[0].i64[0] = v92.columns[0].i64[0];
  uint64_t v38 = [v13 count];
  v88.columns[0].i64[1] = 0;
  v88.columns[1].i64[0] = v38;
  __p = 0;
  v86 = 0;
  uint64_t v87 = 0;
  if ([v13 vergenceAngleCosines])
  {
    unint64_t v39 = [v13 count];
    std::vector<double>::reserve(&__p, v39);
    uint64_t v40 = [v13 vergenceAngleCosines];
    p_p = &__p;
    if (v39)
    {
      v41 = (float *)v40;
      uint64_t v42 = 4 * v39;
      do
      {
        double v93 = *v41;
        std::back_insert_iterator<std::vector<double>>::operator=[abi:ne180100]((uint64_t *)&p_p, &v93);
        ++v41;
        v42 -= 4;
      }
      while (v42);
    }
    v88.columns[0].i64[1] = (uint64_t)__p;
  }
  [v13 count];
  kdebug_trace();
  [v12 principalPoint];
  uint64_t v44 = v43;
  [v12 principalPoint];
  uint64_t v46 = v45;
  [v12 focalLength];
  uint64_t v48 = v47;
  [v12 focalLength];
  uint64_t v50 = v49;
  [v12 imageResolution];
  double v52 = v51;
  [v12 imageResolution];
  v88.columns[1].i64[1] = v48;
  v88.columns[2].i64[0] = v50;
  v88.columns[2].i64[1] = v44;
  v88.columns[3].i64[0] = v46;
  v88.columns[3].i32[2] = v52;
  v88.columns[3].i32[3] = v53;
  ARMatrix4x4ColumnMajorRotationAndTranslation((uint64_t)v89 + 8, &v90, v72, v71, v70, v69);
  LODWORD(v89[0]) = ARSurfaceOrientationForPlaneDetectionType(a8);
  long long v82 = v89[4];
  float64x2_t v83 = v90;
  uint64_t v84 = v91;
  long long v80 = v89[2];
  long long v81 = v89[3];
  simd_float4x4 v77 = v88;
  long long v78 = v89[0];
  long long v79 = v89[1];
  v54 = (void *)CV3DSurfaceDetectionSingleShotSurfaces();
  kdebug_trace();
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v74 = __117__ARPlaneEstimationTechnique__detectPlanesWithDetector_types_camera_referenceFeaturePoints_referenceOriginTransform___block_invoke;
  v75 = &__block_descriptor_40_e5_v8__0l;
  v76 = v54;
  if (v54)
  {
    v54 = +[ARPlaneData anchorForDetectionResult:v54];
  }
  v74((uint64_t)v73);
  if (__p)
  {
    v86 = __p;
    operator delete(__p);
  }
  if (v92.columns[0].i64[0])
  {
    v92.columns[0].i64[1] = v92.columns[0].i64[0];
    operator delete((void *)v92.columns[0].i64[0]);
  }

  return v54;
}

uint64_t __117__ARPlaneEstimationTechnique__detectPlanesWithDetector_types_camera_referenceFeaturePoints_referenceOriginTransform___block_invoke(uint64_t a1)
{
  return MEMORY[0x1F410A088](*(void *)(a1 + 32));
}

- (ARWorldTrackingTechnique)worldTrackingTechnique
{
  return self->_worldTrackingTechnique;
}

- (void)setWorldTrackingTechnique:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_worldTrackingTechnique, 0);
  objc_storeStrong((id *)&self->_rawSceneUnderstandingData, 0);
  objc_storeStrong((id *)&self->_planeResultData, 0);
  objc_storeStrong((id *)&self->_semaphoreResult, 0);
}

@end