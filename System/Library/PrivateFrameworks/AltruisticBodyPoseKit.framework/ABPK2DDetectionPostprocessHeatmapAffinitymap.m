@interface ABPK2DDetectionPostprocessHeatmapAffinitymap
- (ABPK2DDetectionPostprocessHeatmapAffinitymap)initWithInputJoints:(unint64_t)a3 andOutputJoints:(unint64_t)a4 use3DSkeletonForExtrapolation:(BOOL)a5 shouldPush3DSupportSkeleton:(BOOL)a6 withExtrapolationTime:(double)a7;
- (const)rawTrackedHuman;
- (const)rawTrackedHumanVector;
- (const)trackedHuman;
- (const)trackedHumanForLifting;
- (id)get2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4;
- (id)getAligned3DSkeleton;
- (id)getRaw2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4;
- (int)extract2DSkeletonfromBuffers:(id)a3 withImagePreProcessingParams:(id)a4 atTimestamp:(double)a5 previousSkeleton3D:(id)a6;
- (void)_endExtract2DSkeletonSignpostWithTimestamp:(double)a3;
- (void)_endExtractHumanSignpostWithTimestamp:(double)a3;
- (void)_endExtrapolationSignpostWithTimestamp:(double)a3;
- (void)_endMaxFilterSignpostWithTimestamp:(double)a3;
- (void)_startExtract2DSkeletonSignpostWithTimestamp:(double)a3;
- (void)_startExtractHumanSignpostWithTimestamp:(double)a3;
- (void)_startExtrapolationSignpostWithTimestamp:(double)a3;
- (void)_startMaxFilterSignpostWithTimestamp:(double)a3;
- (void)getRawTrackedHumanForLiftingSkeleton:(id)a3;
- (void)getRawTrackedHumanSkeleton:(id)a3;
- (void)getRawTrackedHumanSkeletonVector:(id)a3;
- (void)getTrackedHumanForLiftingSkeleton:(id)a3;
- (void)getTrackedHumanSkeleton:(id)a3;
@end

@implementation ABPK2DDetectionPostprocessHeatmapAffinitymap

- (ABPK2DDetectionPostprocessHeatmapAffinitymap)initWithInputJoints:(unint64_t)a3 andOutputJoints:(unint64_t)a4 use3DSkeletonForExtrapolation:(BOOL)a5 shouldPush3DSupportSkeleton:(BOOL)a6 withExtrapolationTime:(double)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)ABPK2DDetectionPostprocessHeatmapAffinitymap;
  v12 = [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)&v24 init];
  v13 = v12;
  if (v12)
  {
    v12->_unint64_t numberOfInputJoints = a3;
    v12->_unint64_t numberOfOutputJoints = a4;
    v14 = [[ABPK2DDetectionPostprocessGPU alloc] initWithNumberOfChannels:v12->_numberOfInputJoints];
    postprocessorGPU = v13->_postprocessorGPU;
    v13->_postprocessorGPU = v14;

    v16 = [[ABPK2DExtrapolationFiltering alloc] initWithUse3DSkeletonForExtrapolation:v9 shouldPush3DSupportSkeleton:v8 withExtrapolationTime:a7];
    extrapolationFiltering = v13->_extrapolationFiltering;
    v13->_extrapolationFiltering = v16;

    v13->_humansDetected = 1;
    v18 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v18, OS_LOG_TYPE_DEBUG, " ABPK2DDetectionPostprocessHeatmapAffinitymap: Initializing ", buf, 2u);
    }

    v19 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      unint64_t numberOfInputJoints = v13->_numberOfInputJoints;
      *(_DWORD *)buf = 134217984;
      unint64_t v26 = numberOfInputJoints;
      _os_log_impl(&dword_21B7C6000, v19, OS_LOG_TYPE_DEBUG, " \t Number of input joints: %zu ", buf, 0xCu);
    }

    v21 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      unint64_t numberOfOutputJoints = v13->_numberOfOutputJoints;
      *(_DWORD *)buf = 134217984;
      unint64_t v26 = numberOfOutputJoints;
      _os_log_impl(&dword_21B7C6000, v21, OS_LOG_TYPE_DEBUG, " \t Number of output joints: %zu ", buf, 0xCu);
    }
  }
  return v13;
}

- (int)extract2DSkeletonfromBuffers:(id)a3 withImagePreProcessingParams:(id)a4 atTimestamp:(double)a5 previousSkeleton3D:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self _startExtract2DSkeletonSignpostWithTimestamp:a5];
  v13 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " ABPK2DDetectionPostprocessHeatmapAffinitymap: Extracting 2D skeleton from buffers ", buf, 2u);
  }

  objc_storeStrong((id *)&self->_imagePreProcessingParams, a4);
  uint64_t v14 = [v10 rotationNeeded];
  CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v10 heatMapBuffer], 0);
  CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v10 affinityMapBuffer], 0);
  BaseAddress = CVPixelBufferGetBaseAddress((CVPixelBufferRef)[v10 affinityMapBuffer]);
  [v10 affinityMapShape];
  int8x8_t v51 = v16;
  [v10 affinityMapShape];
  *(void *)buf = self->_numberOfInputJoints + 1;
  int8x8_t v18 = vext_s8(v51, v17, 4uLL);
  *(void *)&long long v19 = v18.i32[0];
  *((void *)&v19 + 1) = v18.i32[1];
  long long v64 = v19;
  uint64_t v61 = 36;
  long long v62 = v19;
  [v10 affinityMapStrides];
  v60[0] = v20;
  [v10 affinityMapStrides];
  v60[1] = v21;
  [v10 affinityMapStrides];
  v60[2] = v22;
  unsigned int v59 = 0;
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v10 heatMapBuffer]);
  [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self _startMaxFilterSignpostWithTimestamp:a5];
  uint64_t v24 = -[ABPK2DDetectionPostprocessGPU process:counter:shape:](self->_postprocessorGPU, "process:counter:shape:", IOSurface, &v59, (double)*((unint64_t *)&v19 + 1), (double)(unint64_t)v19);
  [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self _endMaxFilterSignpostWithTimestamp:a5];
  [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self _startExtractHumanSignpostWithTimestamp:a5];
  long long v57 = 0uLL;
  uint64_t v58 = 0;
  if (self->_numberOfInputJoints == 17) {
    abpk::extractHumansLegacy(v24, v24, (uint64_t)BaseAddress, (uint64_t *)buf, (uint64_t)&v61, v60, 0, v59, (uint64_t *)v55);
  }
  else {
    abpk::extractHumans(v24, v24, (uint64_t)BaseAddress, (uint64_t *)buf, (uint64_t)&v61, v60, 0, v59, (uint64_t *)v55);
  }
  std::vector<abpk::Human>::__vdeallocate((void **)&v57);
  long long v57 = *(_OWORD *)v55;
  uint64_t v58 = v56;
  uint64_t v56 = 0;
  memset(v55, 0, sizeof(v55));
  v65 = v55;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)&v65);
  [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self _endExtractHumanSignpostWithTimestamp:a5];
  CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v10 heatMapBuffer], 0);
  CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v10 affinityMapBuffer], 0);
  CVPixelBufferRelease((CVPixelBufferRef)[v10 heatMapBuffer]);
  CVPixelBufferRelease((CVPixelBufferRef)[v10 affinityMapBuffer]);
  if (*((void *)&v57 + 1) == (void)v57)
  {
    if (self->_humansDetected)
    {
      v47 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_21B7C6000, v47, OS_LOG_TYPE_DEBUG, " No humans detected in the image ", v55, 2u);
      }

      self->_humansDetected = 0;
    }
    int v45 = -6661;
  }
  else
  {
    if (!self->_humansDetected)
    {
      v25 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_21B7C6000, v25, OS_LOG_TYPE_DEBUG, " Humans detected in the image ", v55, 2u);
      }

      self->_humansDetected = 1;
    }
    unint64_t v26 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_21B7C6000, v26, OS_LOG_TYPE_DEBUG, " \t Converting 2d points from ML space to image space ", v55, 2u);
    }

    [v11 inputResolution];
    double v49 = v27;
    double v50 = v28;
    [v11 outputResolution];
    v32 = (void *)*((void *)&v57 + 1);
    v31 = (void *)v57;
    if ((void)v57 != *((void *)&v57 + 1))
    {
      double v33 = v29;
      double v34 = v30;
      v35.f64[0] = v49;
      v35.f64[1] = v50;
      float64x2_t v52 = v35;
      do
      {
        v36 = (void *)*v31;
        v37 = (void *)v31[1];
        while (v36 != v37)
        {
          LODWORD(v38) = HIDWORD(*v36);
          if (COERCE_FLOAT(*v36) != -1.0 && v38 != -1.0)
          {
            *(float *)&double v40 = v33 * COERCE_FLOAT(*v36);
            float v41 = v34 * v38;
            *((float *)&v40 + 1) = v41;
            +[ABPKImagePreProcessingParams convert2DPoint:v11 toInputSpaceWithParams:v40];
            void *v36 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v42), v52));
          }
          ++v36;
        }
        v31 += 15;
      }
      while (v31 != v32);
    }
    [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self _startExtrapolationSignpostWithTimestamp:a5];
    v43 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_21B7C6000, v43, OS_LOG_TYPE_DEBUG, " \t Performing extrapolation ", v55, 2u);
    }

    extrapolationFiltering = self->_extrapolationFiltering;
    long long v53 = v57;
    uint64_t v54 = v58;
    uint64_t v58 = 0;
    long long v57 = 0uLL;
    int v45 = -[ABPK2DExtrapolationFiltering performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:](extrapolationFiltering, "performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:", &v53, v14, v12, v49, v50, a5);
    *(void *)v55 = &v53;
    std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)v55);
    [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self _endExtrapolationSignpostWithTimestamp:a5];
    [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self _endExtract2DSkeletonSignpostWithTimestamp:a5];
    if (v45)
    {
      v46 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_21B7C6000, v46, OS_LOG_TYPE_ERROR, " 2D Extrapolation failed ", v55, 2u);
      }
    }
  }
  *(void *)v55 = &v57;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)v55);

  return v45;
}

- (void)getRawTrackedHumanSkeleton:(id)a3
{
  id v6 = a3;
  v4 = [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self rawTrackedHuman];
  uint64_t v5 = *v4;
  [(ABPKImagePreProcessingParams *)self->_imagePreProcessingParams inputResolution];
  objc_msgSend(v6, "setNormalizedKeypoints2d:withImageRes:", v5);
  [v6 setJointVisibility:v4[3]];
  [v6 setJointConfidences:v4[6]];
  [v6 setHasMissingJoints:v4[13] < (unint64_t)((uint64_t)(v4[1] - *v4) >> 3)];
}

- (void)getRawTrackedHumanSkeletonVector:(id)a3
{
  id v9 = a3;
  v4 = [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self rawTrackedHumanVector];
  uint64_t v5 = *v4;
  id v6 = v4[1];
  if (*v4 != v6)
  {
    do
    {
      v7 = objc_alloc_init(ABPK2dSkeleton);
      uint64_t v8 = *v5;
      [(ABPKImagePreProcessingParams *)self->_imagePreProcessingParams inputResolution];
      -[ABPK2dSkeleton setNormalizedKeypoints2d:withImageRes:](v7, "setNormalizedKeypoints2d:withImageRes:", v8);
      [(ABPK2dSkeleton *)v7 setJointVisibility:v5[3]];
      [(ABPK2dSkeleton *)v7 setJointConfidences:v5[6]];
      [(ABPK2dSkeleton *)v7 setHasMissingJoints:v5[13] < (unint64_t)((v5[1] - *v5) >> 3)];
      [v9 addObject:v7];

      v5 += 15;
    }
    while (v5 != v6);
  }
}

- (void)getTrackedHumanSkeleton:(id)a3
{
  id v6 = a3;
  v4 = [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self trackedHuman];
  uint64_t v5 = *v4;
  [(ABPKImagePreProcessingParams *)self->_imagePreProcessingParams inputResolution];
  objc_msgSend(v6, "setNormalizedKeypoints2d:withImageRes:", v5);
  [v6 setJointVisibility:v4[3]];
  [v6 setJointConfidences:v4[6]];
  [v6 setHasMissingJoints:v4[13] < (unint64_t)((uint64_t)(v4[1] - *v4) >> 3)];
}

- (void)getTrackedHumanForLiftingSkeleton:(id)a3
{
  id v6 = a3;
  v4 = [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self trackedHumanForLifting];
  uint64_t v5 = *v4;
  [(ABPKImagePreProcessingParams *)self->_imagePreProcessingParams inputResolution];
  objc_msgSend(v6, "setNormalizedKeypoints2d:withImageRes:", v5);
  [v6 setJointVisibility:v4[3]];
  [v6 setJointConfidences:v4[6]];
  [v6 setHasMissingJoints:v4[13] < (unint64_t)((uint64_t)(v4[1] - *v4) >> 3)];
}

- (void)getRawTrackedHumanForLiftingSkeleton:(id)a3
{
  id v6 = a3;
  v4 = [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self rawTrackedHuman];
  uint64_t v5 = *v4;
  [(ABPKImagePreProcessingParams *)self->_imagePreProcessingParams inputResolution];
  objc_msgSend(v6, "setNormalizedKeypoints2d:withImageRes:", v5);
  [v6 setJointVisibility:v4[3]];
  [v6 setJointConfidences:v4[6]];
}

- (id)getAligned3DSkeleton
{
  return [(ABPK2DExtrapolationFiltering *)self->_extrapolationFiltering aligned3DSkeleton];
}

- (id)get2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4
{
  id v6 = [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self trackedHuman];
  v7 = [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self trackedHumanForLifting];
  if (v7[13] >= (unint64_t)((uint64_t)(v7[1] - *v7) >> 3)) {
    uint64_t v8 = -[ABPK2D3DLiftingData initWithHumanForLifting:imageSize:rotation:croppedRect:]([ABPK2D3DLiftingData alloc], "initWithHumanForLifting:imageSize:rotation:croppedRect:", v7, a3, 1000.0, 1000.0, 0.0, 0.0, 1.0, 1.0);
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [ABPK2DDetectionResult alloc];
  uint64_t v10 = *(void *)abpk::Human::jointVector((abpk::Human *)v6);
  uint64_t v11 = v6[3];
  uint64_t v14 = v6;
  uint64_t v12 = *v6;
  uint64_t v13 = v14[1];
  [(ABPKImagePreProcessingParams *)self->_imagePreProcessingParams inputResolution];
  v15 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:](v9, "initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:", v10, v11, (v13 - v12) >> 3, a3, v8);

  return v15;
}

- (id)getRaw2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4
{
  id v6 = [(ABPK2DDetectionPostprocessHeatmapAffinitymap *)self rawTrackedHuman];
  v7 = -[ABPK2D3DLiftingData initWithHumanForLifting:imageSize:rotation:croppedRect:]([ABPK2D3DLiftingData alloc], "initWithHumanForLifting:imageSize:rotation:croppedRect:", v6, a3, 1000.0, 1000.0, 0.0, 0.0, 1.0, 1.0);
  uint64_t v8 = [ABPK2DDetectionResult alloc];
  uint64_t v9 = *(void *)abpk::Human::jointVector((abpk::Human *)v6);
  uint64_t v10 = v6[3];
  uint64_t v13 = v6;
  uint64_t v11 = *v6;
  uint64_t v12 = v13[1];
  [(ABPKImagePreProcessingParams *)self->_imagePreProcessingParams inputResolution];
  uint64_t v14 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:](v8, "initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:", v9, v10, (v12 - v11) >> 3, a3, v7);

  return v14;
}

- (const)rawTrackedHuman
{
  return [(ABPK2DExtrapolationFiltering *)self->_extrapolationFiltering rawTrackedHuman];
}

- (const)trackedHuman
{
  return [(ABPK2DExtrapolationFiltering *)self->_extrapolationFiltering trackedHuman];
}

- (const)rawTrackedHumanVector
{
  return [(ABPK2DExtrapolationFiltering *)self->_extrapolationFiltering rawTrackedHumanVector];
}

- (const)trackedHumanForLifting
{
  return [(ABPK2DExtrapolationFiltering *)self->_extrapolationFiltering trackedHumanForLifting];
}

- (void)_startExtract2DSkeletonSignpostWithTimestamp:(double)a3
{
}

- (void)_endExtract2DSkeletonSignpostWithTimestamp:(double)a3
{
}

- (void)_startMaxFilterSignpostWithTimestamp:(double)a3
{
}

- (void)_endMaxFilterSignpostWithTimestamp:(double)a3
{
}

- (void)_startExtractHumanSignpostWithTimestamp:(double)a3
{
}

- (void)_endExtractHumanSignpostWithTimestamp:(double)a3
{
}

- (void)_startExtrapolationSignpostWithTimestamp:(double)a3
{
}

- (void)_endExtrapolationSignpostWithTimestamp:(double)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extrapolationFiltering, 0);
  objc_storeStrong((id *)&self->_imagePreProcessingParams, 0);
  objc_storeStrong((id *)&self->_postprocessorGPU, 0);
}

@end