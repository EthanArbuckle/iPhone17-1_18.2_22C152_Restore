@interface ABPK2DDetectionPostprocessHeatmap
- (ABPK2DDetectionPostprocessHeatmap)initWithInputJoints:(unint64_t)a3 andOutputJoints:(unint64_t)a4 use3DSkeletonForExtrapolation:(BOOL)a5 shouldPush3DSupportSkeleton:(BOOL)a6 withExtrapolationTime:(double)a7;
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

@implementation ABPK2DDetectionPostprocessHeatmap

- (ABPK2DDetectionPostprocessHeatmap)initWithInputJoints:(unint64_t)a3 andOutputJoints:(unint64_t)a4 use3DSkeletonForExtrapolation:(BOOL)a5 shouldPush3DSupportSkeleton:(BOOL)a6 withExtrapolationTime:(double)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v36 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)ABPK2DDetectionPostprocessHeatmap;
  v12 = [(ABPK2DDetectionPostprocessHeatmap *)&v33 init];
  v13 = v12;
  if (v12)
  {
    v12->_numberOfInputJoints = a3;
    v12->_numberOfOutputJoints = a4;
    v14 = [[ABPK2DExtrapolationFiltering alloc] initWithUse3DSkeletonForExtrapolation:v9 shouldPush3DSupportSkeleton:v8 withExtrapolationTime:a7];
    extrapolationFiltering = v13->_extrapolationFiltering;
    v13->_extrapolationFiltering = v14;

    v13->_saveKeypoints = 1;
    v13->_humansDetected = 1;
    v16 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_DEBUG, " ABPK2DDetectionPostprocessHeatmap: Initializing ", buf, 2u);
    }

    v17 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      double v18 = *(double *)&v13->_numberOfInputJoints;
      *(_DWORD *)buf = 134217984;
      double v35 = v18;
      _os_log_impl(&dword_21B7C6000, v17, OS_LOG_TYPE_DEBUG, " \t Number of input joints: %zu ", buf, 0xCu);
    }

    v19 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      double v20 = *(double *)&v13->_numberOfOutputJoints;
      *(_DWORD *)buf = 134217984;
      double v35 = v20;
      _os_log_impl(&dword_21B7C6000, v19, OS_LOG_TYPE_DEBUG, " \t Number of output joints: %zu ", buf, 0xCu);
    }

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    trackedBodies = v13->_trackedBodies;
    v13->_trackedBodies = v21;

    v13->_abpkPersonTrackerFPS = 1;
    v23 = objc_alloc_init(ABPKPersonIDTracker);
    abpkPersonIDTracker = v13->_abpkPersonIDTracker;
    v13->_abpkPersonIDTracker = v23;

    v13->_abpkPersonIDTrackerSupportedOnDevice = 1;
    if (v13->_abpkPersonIDTracker)
    {
      v25 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v25, OS_LOG_TYPE_DEBUG, " ABPKPersonIDTracker initialized in ABPK2DDetectionPostprocessHeatmap ", buf, 2u);
      }

      switch(v13->_abpkPersonTrackerFPS)
      {
        case 0:
          v26 = __ABPKLogSharedInstance();
          int v27 = 1015580809;
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_25;
          }
          *(_WORD *)buf = 0;
          v28 = " ABPKPersonIDTracker being initialized with fps: 60 ";
          break;
        case 1:
          v26 = __ABPKLogSharedInstance();
          int v27 = 1023969417;
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_25;
          }
          *(_WORD *)buf = 0;
          v28 = " ABPKPersonIDTracker being initialized with fps: 30 ";
          break;
        case 2:
          v26 = __ABPKLogSharedInstance();
          int v27 = 1045220557;
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_25;
          }
          *(_WORD *)buf = 0;
          v28 = " ABPKPersonIDTracker being initialized with fps: 5 ";
          break;
        case 3:
          v26 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21B7C6000, v26, OS_LOG_TYPE_DEBUG, " ABPKPersonIDTracker being initialized with fps: 0 ", buf, 2u);
          }
          int v27 = 2139095039;
          goto LABEL_25;
        default:
          goto LABEL_26;
      }
      _os_log_impl(&dword_21B7C6000, v26, OS_LOG_TYPE_DEBUG, v28, buf, 2u);
LABEL_25:

      LODWORD(v13->_timeLastABPKTrackerRunThreshold) = v27;
LABEL_26:
      v30 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        double timeLastABPKTrackerRunThreshold = v13->_timeLastABPKTrackerRunThreshold;
        *(_DWORD *)buf = 134217984;
        double v35 = timeLastABPKTrackerRunThreshold;
        _os_log_impl(&dword_21B7C6000, v30, OS_LOG_TYPE_DEBUG, " ABPKPersonIDTracker _timeLastABPKTrackerRunThreshold: %f ", buf, 0xCu);
      }

      v13->_timeLastABPKTrackerRun = 0.0;
    }
    else
    {
      v29 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v29, OS_LOG_TYPE_ERROR, " Failed to initialize ABPK Person ID Tracker ", buf, 2u);
      }

      v13->_abpkPersonIDTrackerSupportedOnDevice = 0;
    }
  }
  return v13;
}

- (int)extract2DSkeletonfromBuffers:(id)a3 withImagePreProcessingParams:(id)a4 atTimestamp:(double)a5 previousSkeleton3D:(id)a6
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v75 = a6;
  [(ABPK2DDetectionPostprocessHeatmap *)self _startExtract2DSkeletonSignpostWithTimestamp:a5];
  v12 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " ABPK2DDetectionPostprocessHeatmap: Extracting 2D skeleton from buffers ", buf, 2u);
  }

  objc_storeStrong((id *)&self->_imagePreProcessingParams, a4);
  uint64_t v13 = [v10 rotationNeeded];
  v14 = (__CVBuffer *)[v10 heatMapBuffer];
  CVPixelBufferLockBaseAddress(v14, 1uLL);
  [v10 heatMapShape];
  int v76 = v15;
  [v10 heatMapShape];
  __n128 v73 = v16;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v14);
  [(ABPK2DDetectionPostprocessHeatmap *)self _startMaxFilterSignpostWithTimestamp:a5];
  [(ABPK2DDetectionPostprocessHeatmap *)self _endMaxFilterSignpostWithTimestamp:a5];
  [(ABPK2DDetectionPostprocessHeatmap *)self _startExtractHumanSignpostWithTimestamp:a5];
  BaseAddress = CVPixelBufferGetBaseAddress(v14);
  __n128 v19 = v73;
  v19.n128_u16[0] = 11878;
  abpk::parsePersonsfromHeatmapBuffer((uint64_t)BaseAddress, v73.n128_i32[1], BytesPerRow >> 1, (uint64_t *)buf, v19);
  double v20 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v87 = 134217984;
    *(void *)&v87[4] = 0x6DB6DB6DB6DB6DB7 * ((v83 - *(void *)buf) >> 3);
    _os_log_impl(&dword_21B7C6000, v20, OS_LOG_TYPE_DEBUG, " \t Persons detected: %lu ", v87, 0xCu);
  }

  v21 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v87 = 0;
    _os_log_impl(&dword_21B7C6000, v21, OS_LOG_TYPE_DEBUG, " \t Converting person to human type ", v87, 2u);
  }

  abpk::filterValidPersons((__n128 **)buf, v76, v73.n128_i32[1], 0.099976);
  v22 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v87 = 134217984;
    *(void *)&v87[4] = 0x6DB6DB6DB6DB6DB7 * ((v83 - *(void *)buf) >> 3);
    _os_log_impl(&dword_21B7C6000, v22, OS_LOG_TYPE_DEBUG, " \t Valid Persons detected: %lu ", v87, 0xCu);
  }

  abpk::convertPersonsToHuman((uint64_t **)buf, self->_numberOfOutputJoints, (uint64_t *)v87);
  v23 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v84 = 134217984;
    *(void *)&v84[4] = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(*(void *)&v87[8] - *(void *)v87) >> 3);
    _os_log_impl(&dword_21B7C6000, v23, OS_LOG_TYPE_DEBUG, " \t Humans detected: %lu ", v84, 0xCu);
  }

  CVPixelBufferUnlockBaseAddress(v14, 1uLL);
  CVPixelBufferRelease(v14);
  [(ABPK2DDetectionPostprocessHeatmap *)self _endExtractHumanSignpostWithTimestamp:a5];
  uint64_t v25 = *(void *)buf;
  uint64_t v24 = v83;
  if (v83 != *(void *)buf)
  {
    if (!self->_humansDetected)
    {
      v26 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v84 = 0;
        _os_log_impl(&dword_21B7C6000, v26, OS_LOG_TYPE_DEBUG, " Humans detected in the image ", v84, 2u);
      }

      self->_humansDetected = 1;
      uint64_t v25 = *(void *)buf;
      uint64_t v24 = v83;
    }
    if (0x6DB6DB6DB6DB6DB7 * ((v24 - v25) >> 3) != 0xEEEEEEEEEEEEEEEFLL
                                                    * ((uint64_t)(*(void *)&v87[8] - *(void *)v87) >> 3))
    {
      v56 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v84 = 0;
        _os_log_impl(&dword_21B7C6000, v56, OS_LOG_TYPE_ERROR, " convertPersonsToHuman failed. Count difference. ", v84, 2u);
      }

      v57 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v84 = 134217984;
        *(void *)&v84[4] = 0x6DB6DB6DB6DB6DB7 * ((v83 - *(void *)buf) >> 3);
        _os_log_impl(&dword_21B7C6000, v57, OS_LOG_TYPE_ERROR, " Persons count: %zu ", v84, 0xCu);
      }

      v58 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v84 = 134217984;
        *(void *)&v84[4] = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(*(void *)&v87[8] - *(void *)v87) >> 3);
        _os_log_impl(&dword_21B7C6000, v58, OS_LOG_TYPE_ERROR, " Humans count %zu ", v84, 0xCu);
      }

      goto LABEL_69;
    }
    if (self->_numberOfOutputJoints != (uint64_t)(*(void *)(*(void *)v87 + 8) - **(void **)v87) >> 3)
    {
      v59 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v84 = 0;
        _os_log_impl(&dword_21B7C6000, v59, OS_LOG_TYPE_ERROR, " convertPersonsToHuman failed. Invalid number of joints in the converted human type. ", v84, 2u);
      }

      v60 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        uint64_t v61 = (uint64_t)(*(void *)(*(void *)v87 + 8) - **(void **)v87) >> 3;
        unint64_t numberOfOutputJoints = self->_numberOfOutputJoints;
        *(_DWORD *)v84 = 134218240;
        *(void *)&v84[4] = v61;
        __int16 v85 = 2048;
        unint64_t v86 = numberOfOutputJoints;
        _os_log_impl(&dword_21B7C6000, v60, OS_LOG_TYPE_ERROR, " Actual joints: %zu. Expected: %zu ", v84, 0x16u);
      }

      goto LABEL_69;
    }
    int v27 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_21B7C6000, v27, OS_LOG_TYPE_DEBUG, " \t Converting 2d points from ML space to image space ", v84, 2u);
    }

    [v11 inputResolution];
    double v72 = v28;
    double v74 = v29;
    [v11 outputResolution];
    v32 = *(void **)v87;
    objc_super v33 = *(void **)&v87[8];
    if (*(void *)v87 != *(void *)&v87[8])
    {
      double v34 = v30;
      double v35 = v31;
      v36.f64[0] = v72;
      v36.f64[1] = v74;
      float64x2_t v77 = v36;
      do
      {
        v37 = (void *)*v32;
        v38 = (void *)v32[1];
        while (v37 != v38)
        {
          LODWORD(v39) = HIDWORD(*v37);
          if (COERCE_FLOAT(*v37) != -1.0 && v39 != -1.0)
          {
            *(float *)&double v41 = v34 * COERCE_FLOAT(*v37);
            float v42 = v35 * v39;
            *((float *)&v41 + 1) = v42;
            +[ABPKImagePreProcessingParams convert2DPoint:v11 toInputSpaceWithParams:v41];
            void *v37 = vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(v43), v77));
          }
          ++v37;
        }
        v32 += 15;
      }
      while (v32 != v33);
    }
    [(NSMutableArray *)self->_trackedBodies removeAllObjects];
    if (self->_abpkPersonIDTrackerSupportedOnDevice)
    {
      v44 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v45 = [v10 inputImageData];
        size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v45 pixelBuffer]);
        v47 = [v10 inputImageData];
        size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v47 pixelBuffer]);
        *(_DWORD *)v84 = 134218240;
        *(void *)&v84[4] = Width;
        __int16 v85 = 2048;
        unint64_t v86 = Height;
        _os_log_impl(&dword_21B7C6000, v44, OS_LOG_TYPE_DEBUG, " \t Running ANSTTracker on image with resolution: (w,h)=(%lu,%lu) ", v84, 0x16u);
      }
      abpkPersonIDTracker = self->_abpkPersonIDTracker;
      v50 = [v10 imageDataForNeuralNetwork];
      BOOL v51 = -[ABPKPersonIDTracker runWithInput:atTimeStamp:andOutput:](abpkPersonIDTracker, "runWithInput:atTimeStamp:andOutput:", [v50 pixelBuffer], self->_trackedBodies, a5) == 0;

      if (v51)
      {
        v52 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v84 = 0;
          _os_log_impl(&dword_21B7C6000, v52, OS_LOG_TYPE_DEBUG, " \t _abpkPersonIDTracker ran successfully ", v84, 2u);
        }
      }
      v53 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v54 = [(NSMutableArray *)self->_trackedBodies count];
        *(_DWORD *)v84 = 134217984;
        *(void *)&v84[4] = v54;
        _os_log_impl(&dword_21B7C6000, v53, OS_LOG_TYPE_DEBUG, " \t _trackedBodies count: %lu ", v84, 0xCu);
      }
    }
    else
    {
      BOOL v51 = 0;
    }
    [(ABPK2DDetectionPostprocessHeatmap *)self _startExtrapolationSignpostWithTimestamp:a5];
    v63 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_21B7C6000, v63, OS_LOG_TYPE_DEBUG, " \t Performing extrapolation ", v84, 2u);
    }

    if (v51 && [(NSMutableArray *)self->_trackedBodies count])
    {
      extrapolationFiltering = self->_extrapolationFiltering;
      long long v80 = *(_OWORD *)v87;
      uint64_t v81 = v88;
      uint64_t v88 = 0;
      memset(v87, 0, sizeof(v87));
      v65 = &v80;
      int v66 = -[ABPK2DExtrapolationFiltering performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:personTracker:](extrapolationFiltering, "performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:personTracker:", &v80, v13, v75, self->_trackedBodies, v72, v74, a5);
    }
    else
    {
      v67 = self->_extrapolationFiltering;
      long long v78 = *(_OWORD *)v87;
      uint64_t v79 = v88;
      uint64_t v88 = 0;
      memset(v87, 0, sizeof(v87));
      v65 = &v78;
      int v66 = -[ABPK2DExtrapolationFiltering performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:](v67, "performExtrapolationOnHumans:withImageResolution:atTimestamp:rotationNeeded:previousSkeleton3D:", &v78, v13, v75, v72, v74, a5);
    }
    int v68 = v66;
    *(void *)v84 = v65;
    std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)v84);
    [(ABPK2DDetectionPostprocessHeatmap *)self _endExtrapolationSignpostWithTimestamp:a5];
    [(ABPK2DDetectionPostprocessHeatmap *)self _endExtract2DSkeletonSignpostWithTimestamp:a5];
    if (!v68)
    {
      int v70 = 0;
      goto LABEL_70;
    }
    v69 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_21B7C6000, v69, OS_LOG_TYPE_ERROR, " 2D Extrapolation failed ", v84, 2u);
    }

    goto LABEL_68;
  }
  if (self->_humansDetected)
  {
    v55 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v84 = 0;
      _os_log_impl(&dword_21B7C6000, v55, OS_LOG_TYPE_DEBUG, " No humans detected in the image ", v84, 2u);
    }

LABEL_68:
    self->_humansDetected = 0;
  }
LABEL_69:
  int v70 = -6661;
LABEL_70:
  *(void *)v84 = v87;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)v84);
  *(void *)v87 = buf;
  std::vector<abpk::HeatmapPersonData>::__destroy_vector::operator()[abi:ne180100]((void ***)v87);

  return v70;
}

- (void)getRawTrackedHumanSkeleton:(id)a3
{
  id v6 = a3;
  v4 = [(ABPK2DDetectionPostprocessHeatmap *)self rawTrackedHuman];
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
  v4 = [(ABPK2DDetectionPostprocessHeatmap *)self rawTrackedHumanVector];
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
  v4 = [(ABPK2DDetectionPostprocessHeatmap *)self trackedHuman];
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
  v4 = [(ABPK2DDetectionPostprocessHeatmap *)self trackedHumanForLifting];
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
  v4 = [(ABPK2DDetectionPostprocessHeatmap *)self rawTrackedHuman];
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
  id v6 = [(ABPK2DDetectionPostprocessHeatmap *)self trackedHuman];
  v7 = [(ABPK2DDetectionPostprocessHeatmap *)self trackedHumanForLifting];
  if (v7[13] >= (unint64_t)((uint64_t)(v7[1] - *v7) >> 3)) {
    uint64_t v8 = -[ABPK2D3DLiftingData initWithHumanForLifting:imageSize:rotation:croppedRect:]([ABPK2D3DLiftingData alloc], "initWithHumanForLifting:imageSize:rotation:croppedRect:", v7, a3, 1000.0, 1000.0, 0.0, 0.0, 1.0, 1.0);
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [ABPK2DDetectionResult alloc];
  uint64_t v10 = *(void *)abpk::Human::jointVector((abpk::Human *)v6);
  uint64_t v11 = v6[3];
  v14 = v6;
  uint64_t v12 = *v6;
  uint64_t v13 = v14[1];
  [(ABPKImagePreProcessingParams *)self->_imagePreProcessingParams inputResolution];
  int v15 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:](v9, "initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:", v10, v11, (v13 - v12) >> 3, a3, v8);

  return v15;
}

- (id)getRaw2DDetectionResultforRotation:(int64_t)a3 croppedRect:(CGRect)a4
{
  id v6 = [(ABPK2DDetectionPostprocessHeatmap *)self rawTrackedHuman];
  v7 = -[ABPK2D3DLiftingData initWithHumanForLifting:imageSize:rotation:croppedRect:]([ABPK2D3DLiftingData alloc], "initWithHumanForLifting:imageSize:rotation:croppedRect:", v6, a3, 1000.0, 1000.0, 0.0, 0.0, 1.0, 1.0);
  uint64_t v8 = [ABPK2DDetectionResult alloc];
  uint64_t v9 = *(void *)abpk::Human::jointVector((abpk::Human *)v6);
  uint64_t v10 = v6[3];
  uint64_t v13 = v6;
  uint64_t v11 = *v6;
  uint64_t v12 = v13[1];
  [(ABPKImagePreProcessingParams *)self->_imagePreProcessingParams inputResolution];
  v14 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:](v8, "initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:", v9, v10, (v12 - v11) >> 3, a3, v7);

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
  objc_storeStrong((id *)&self->_trackedBodies, 0);
  objc_storeStrong((id *)&self->_abpkPersonIDTracker, 0);
  objc_storeStrong((id *)&self->_extrapolationFiltering, 0);
  objc_storeStrong((id *)&self->_imagePreProcessingParams, 0);
}

@end