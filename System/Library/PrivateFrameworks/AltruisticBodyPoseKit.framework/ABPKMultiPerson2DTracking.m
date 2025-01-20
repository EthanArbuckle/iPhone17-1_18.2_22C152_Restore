@interface ABPKMultiPerson2DTracking
- (ABPKMultiPerson2DTracking)init;
- (BOOL)overlayResult:(id)a3 OnImage:(__CVBuffer *)a4 andGenerateOverlayImage:(__CVBuffer *)a5;
- (BOOL)overlayTrackedBodiesOnImage:(__CVBuffer *)a3 andGenerateOverlayImage:(__CVBuffer *)a4;
- (CGRect)_rotateBoundingBoxToPortrait:(CGRect)a3 withImageRes:(CGSize)a4;
- (int)runPoseEstimationWithInput:(__CVBuffer *)a3 abpkDeviceOrientation:(int64_t)a4 atTimeStamp:(double)a5 andOutput:(id)a6;
- (int)runWithInput:(__CVBuffer *)a3 abpkDeviceOrientation:(int64_t)a4 atTimeStamp:(double)a5 andOutput:(id)a6;
- (void)_endInitABPKSignpost;
- (void)_endMultiPerson2DTracking2DDetectionMLSignpostWithTimestamp:(double)a3;
- (void)_endMultiPerson2DTracking2DDetectionPostProcessingSignpostWithTimestamp:(double)a3;
- (void)_endMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:(double)a3;
- (void)_endMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:(double)a3;
- (void)_endMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:(double)a3;
- (void)_startInitABPKSignpost;
- (void)_startMultiPerson2DTracking2DDetectionMLSignpostWithTimestamp:(double)a3;
- (void)_startMultiPerson2DTracking2DDetectionPostProcessingSignpostWithTimestamp:(double)a3;
- (void)_startMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:(double)a3;
- (void)_startMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:(double)a3;
- (void)_startMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:(double)a3;
@end

@implementation ABPKMultiPerson2DTracking

- (ABPKMultiPerson2DTracking)init
{
  [(ABPKMultiPerson2DTracking *)self _startInitABPKSignpost];
  v19.receiver = self;
  v19.super_class = (Class)ABPKMultiPerson2DTracking;
  v3 = [(ABPKMultiPerson2DTracking *)&v19 init];
  if (!v3) {
    goto LABEL_6;
  }
  v4 = objc_alloc_init(ABPKPersonIDTracker);
  abpkPersonIDTracker = v3->_abpkPersonIDTracker;
  v3->_abpkPersonIDTracker = v4;

  if (!v3->_abpkPersonIDTracker)
  {
    v15 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)v18 = 0;
    v16 = " Failed to initialize ABPK Person ID Tracker ";
LABEL_13:
    _os_log_impl(&dword_21B7C6000, v15, OS_LOG_TYPE_ERROR, v16, v18, 2u);
    goto LABEL_14;
  }
  v6 = [[ABPK2DDetectionConfiguration alloc] initWithAlgorithmMode:10];
  config2D = v3->_config2D;
  v3->_config2D = v6;

  if (!v3->_config2D)
  {
    v15 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)v18 = 0;
    v16 = " Failed to initialize config for 2D Detection module ";
    goto LABEL_13;
  }
  v8 = [[ABPK2DPoseEstimation alloc] initWith2DDetectionConfig:v3->_config2D use3DSkeletonForExtrapolation:0 shouldPush3DSupportSkeleton:0];
  poseEstimation2D = v3->_poseEstimation2D;
  v3->_poseEstimation2D = v8;

  if (!v3->_poseEstimation2D)
  {
    v15 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      v16 = " Failed to initialize 2D Pose Estimation Algorithm. ";
      goto LABEL_13;
    }
LABEL_14:

    v14 = 0;
    goto LABEL_15;
  }
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  previousMultiPerson2DResult = v3->_previousMultiPerson2DResult;
  v3->_previousMultiPerson2DResult = v10;

  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  trackedBodies = v3->_trackedBodies;
  v3->_trackedBodies = v12;

  v3->_lastTrackingId = -1;
LABEL_6:
  [(ABPKMultiPerson2DTracking *)v3 _endInitABPKSignpost];
  v14 = v3;
LABEL_15:

  return v14;
}

- (int)runWithInput:(__CVBuffer *)a3 abpkDeviceOrientation:(int64_t)a4 atTimeStamp:(double)a5 andOutput:(id)a6
{
  uint64_t v149 = *MEMORY[0x263EF8340];
  id v129 = a6;
  [(ABPKMultiPerson2DTracking *)self _startMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:a5];
  [(NSMutableArray *)self->_trackedBodies removeAllObjects];
  [(ABPKPersonIDTracker *)self->_abpkPersonIDTracker runWithInput:a3 atTimeStamp:self->_trackedBodies andOutput:a5];
  v132 = self;
  if ([(NSMutableArray *)self->_trackedBodies count])
  {
    v10 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v10, OS_LOG_TYPE_DEBUG, " Found full bodies in the image ", buf, 2u);
    }

    for (unint64_t i = 0; [(NSMutableArray *)v132->_trackedBodies count] > i; ++i)
    {
      v12 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = [(NSMutableArray *)v132->_trackedBodies objectAtIndexedSubscript:i];
        uint64_t v14 = [v13 objectID];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v14;
        _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " Person Tracking Id: %lu ", buf, 0xCu);
      }
      v15 = [(NSMutableArray *)v132->_trackedBodies objectAtIndexedSubscript:i];
      [v15 boundingBox];
      uint64_t v17 = v16;
      uint64_t v19 = v18;
      uint64_t v21 = v20;
      uint64_t v23 = v22;

      v24 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218752;
        *(void *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v17;
        __int16 v145 = 2048;
        uint64_t v146 = v23;
        __int16 v147 = 2048;
        uint64_t v148 = v21;
        _os_log_impl(&dword_21B7C6000, v24, OS_LOG_TYPE_DEBUG, " Bounding Box: (%f,%f,%f,%f ", buf, 0x2Au);
      }
    }
  }
  id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v128 = [(ABPKMultiPerson2DTracking *)v132 runPoseEstimationWithInput:a3 abpkDeviceOrientation:a4 atTimeStamp:v25 andOutput:a5];
  v26 = __ABPKLogSharedInstance();
  v27 = v25;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = [v25 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v28;
    _os_log_impl(&dword_21B7C6000, v26, OS_LOG_TYPE_DEBUG, " Humans detected: %lu ", buf, 0xCu);
  }

  v29 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v29, OS_LOG_TYPE_DEBUG, " ANST Bounding boxes ", buf, 2u);
  }

  for (unint64_t j = 0; [(NSMutableArray *)v132->_trackedBodies count] > j; ++j)
  {
    v31 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = j;
      _os_log_impl(&dword_21B7C6000, v31, OS_LOG_TYPE_DEBUG, " Person: %d ", buf, 8u);
    }

    v32 = [(NSMutableArray *)v132->_trackedBodies objectAtIndexedSubscript:j];
    [v32 boundingBox];
    printCGRect(v33, v34, v35, v36);
  }
  v37 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v37, OS_LOG_TYPE_DEBUG, " 2d Skeleton Bounding boxes ", buf, 2u);
  }

  for (unint64_t k = 0; [v25 count] > k; ++k)
  {
    v39 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = k;
      _os_log_impl(&dword_21B7C6000, v39, OS_LOG_TYPE_DEBUG, " Person: %d ", buf, 8u);
    }

    v40 = [v25 objectAtIndexedSubscript:k];
    [v40 boundingBox];
    printCGRect(v41, v42, v43, v44);
  }
  [(ABPKMultiPerson2DTracking *)v132 _startMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:a5];
  v45 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v45, OS_LOG_TYPE_DEBUG, " Computing tracking ids ", buf, 2u);
  }

  std::vector<unsigned long>::vector(buf, [v25 count]);
  *(double *)&unint64_t v46 = 0.0;
  v136 = 0;
  v137 = 0;
  unint64_t v138 = 0;
  while (v46 < [v25 count])
  {
    v47 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v140 = 134217984;
      double v141 = *(double *)&v46;
      _os_log_impl(&dword_21B7C6000, v47, OS_LOG_TYPE_DEBUG, " Finding tracking id for skeleton: %lu ", v140, 0xCu);
    }

    *(double *)&unint64_t v48 = 0.0;
    *(double *)&uint64_t v49 = NAN;
    float v50 = -10000.0;
    while (v48 < [(NSMutableArray *)v132->_trackedBodies count])
    {
      v51 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        v52 = [(NSMutableArray *)v132->_trackedBodies objectAtIndexedSubscript:v48];
        uint64_t v53 = [v52 objectID];
        *(_DWORD *)v140 = 134218240;
        double v141 = *(double *)&v48;
        __int16 v142 = 2048;
        uint64_t v143 = v53;
        _os_log_impl(&dword_21B7C6000, v51, OS_LOG_TYPE_DEBUG, " \t Comparing with ANST tracked body %lu with objec-id: %lu ", v140, 0x16u);
      }
      __p = 0;
      v134 = 0;
      uint64_t v135 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v136, (uint64_t)v137, (v137 - (unsigned char *)v136) >> 3);
      v54 = [(NSMutableArray *)v132->_trackedBodies objectAtIndexedSubscript:v48];
      uint64_t v55 = [v54 objectID];
      if (v134 == __p)
      {
        BOOL v58 = 0;
      }
      else
      {
        unint64_t v56 = (v134 - (unsigned char *)__p) >> 3;
        if (v56 <= 1) {
          uint64_t v57 = 1;
        }
        else {
          uint64_t v57 = (v134 - (unsigned char *)__p) >> 3;
        }
        if (*(void *)__p == v55)
        {
          BOOL v58 = 1;
        }
        else
        {
          uint64_t v59 = 1;
          do
          {
            unint64_t v60 = v59;
            if (v57 == v59) {
              break;
            }
            uint64_t v61 = *((void *)__p + v59++);
          }
          while (v61 != v55);
          BOOL v58 = v60 < v56;
        }
      }

      if (__p)
      {
        v134 = __p;
        operator delete(__p);
      }
      if (v58)
      {
        v62 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v140 = 0;
          _os_log_impl(&dword_21B7C6000, v62, OS_LOG_TYPE_DEBUG, " \t Skipping. Tracking id already assigned ", v140, 2u);
        }
        goto LABEL_57;
      }
      v63 = [v27 objectAtIndexedSubscript:v46];
      [v63 boundingBox];
      double v65 = v64;
      double v67 = v66;
      double v69 = v68;
      double v71 = v70;
      v72 = [(NSMutableArray *)v132->_trackedBodies objectAtIndexedSubscript:v48];
      [v72 boundingBox];
      float v77 = computeIOUbetweenRects(v65, v67, v69, v71, v73, v74, v75, v76);

      v78 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v140 = 134217984;
        double v141 = v77;
        _os_log_impl(&dword_21B7C6000, v78, OS_LOG_TYPE_DEBUG, " \t\t iou: %f ", v140, 0xCu);
      }

      if (v77 > v50)
      {
        v62 = [(NSMutableArray *)v132->_trackedBodies objectAtIndexedSubscript:v48];
        *(double *)&uint64_t v49 = COERCE_DOUBLE([v62 objectID]);
        float v50 = v77;
LABEL_57:
      }
      ++v48;
    }
    v79 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v140 = 134217984;
      double v141 = v50;
      _os_log_impl(&dword_21B7C6000, v79, OS_LOG_TYPE_DEBUG, " \t Maximum IOU: %f ", v140, 0xCu);
    }

    if (v50 >= 0.0)
    {
      v81 = v132;
      if (*(double *)&v49 == NAN) {
        goto LABEL_66;
      }
    }
    else
    {
      v80 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v140 = 0;
        _os_log_impl(&dword_21B7C6000, v80, OS_LOG_TYPE_DEBUG, " IOU is lower than threshold. No closest human found from the previous frame. Assigning new tracking id ", v140, 2u);
      }

      v81 = v132;
LABEL_66:
      uint64_t v49 = v81->_lastTrackingId + 1;
      v81->_lastTrackingId = v49;
    }
    *(double *)(*(void *)buf + 8 * v46) = *(double *)&v49;
    v82 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v140 = 134217984;
      double v141 = *(double *)&v49;
      _os_log_impl(&dword_21B7C6000, v82, OS_LOG_TYPE_DEBUG, " \t Tracking id: %lu ", v140, 0xCu);
    }

    v83 = v137;
    if ((unint64_t)v137 >= v138)
    {
      v86 = (char *)v136;
      uint64_t v87 = (v137 - (unsigned char *)v136) >> 3;
      unint64_t v88 = v87 + 1;
      if ((unint64_t)(v87 + 1) >> 61) {
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      }
      v85 = v27;
      uint64_t v89 = v138 - (void)v136;
      if ((uint64_t)(v138 - (void)v136) >> 2 > v88) {
        unint64_t v88 = v89 >> 2;
      }
      if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v90 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v90 = v88;
      }
      if (v90)
      {
        v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v138, v90);
        v86 = (char *)v136;
        v83 = v137;
      }
      else
      {
        v91 = 0;
      }
      v92 = &v91[8 * v87];
      *(double *)v92 = *(double *)&v49;
      v84 = v92 + 8;
      while (v83 != v86)
      {
        uint64_t v93 = *((void *)v83 - 1);
        v83 -= 8;
        *((void *)v92 - 1) = v93;
        v92 -= 8;
      }
      v136 = v92;
      v137 = v84;
      unint64_t v138 = (unint64_t)&v91[8 * v90];
      if (v86) {
        operator delete(v86);
      }
    }
    else
    {
      *(double *)v137 = *(double *)&v49;
      v84 = v83 + 8;
      v85 = v27;
    }
    v137 = v84;
    v94 = [v85 objectAtIndexedSubscript:v46];
    v95 = [v94 skeletonDefinition];
    uint64_t v96 = [v95 jointCount];

    id v130 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v97 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v98 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v96)
    {
      for (uint64_t m = 0; m != v96; ++m)
      {
        v100 = [v27 objectAtIndexedSubscript:v46];
        double v131 = *(double *)([v100 keypoints2d] + 8 * m);

        v101 = [v27 objectAtIndexedSubscript:v46];
        int v102 = *(_DWORD *)([v101 confidences] + 4 * m);

        v103 = [v27 objectAtIndexedSubscript:v46];
        uint64_t v104 = *(unsigned int *)([v103 visibility] + 4 * m);

        v105 = [NSNumber numberWithFloat:v131];
        v139[0] = v105;
        HIDWORD(v106) = HIDWORD(v131);
        LODWORD(v106) = HIDWORD(v131);
        v107 = [NSNumber numberWithFloat:v106];
        v139[1] = v107;
        v108 = [MEMORY[0x263EFF8C0] arrayWithObjects:v139 count:2];
        [v130 addObject:v108];

        LODWORD(v109) = v102;
        v110 = [NSNumber numberWithFloat:v109];
        [v97 addObject:v110];

        v111 = [NSNumber numberWithUnsignedInt:v104];
        [v98 addObject:v111];
      }
    }

    ++v46;
    id v25 = v27;
  }
  [(ABPKMultiPerson2DTracking *)v132 _endMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:a5];
  v112 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v140 = 0;
    _os_log_impl(&dword_21B7C6000, v112, OS_LOG_TYPE_DEBUG, " Creating result ", v140, 2u);
  }

  if (v128)
  {
    v113 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v140 = 0;
      _os_log_impl(&dword_21B7C6000, v113, OS_LOG_TYPE_ERROR, " Pose not valid. Skipping ", v140, 2u);
    }

    previousMultiPerson2DResult = v132->_previousMultiPerson2DResult;
    v132->_previousMultiPerson2DResult = 0;

    v115 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&uint64_t v116 = COERCE_DOUBLE([(NSMutableArray *)v132->_previousMultiPerson2DResult count]);
      *(_DWORD *)v140 = 134217984;
      double v141 = *(double *)&v116;
      _os_log_impl(&dword_21B7C6000, v115, OS_LOG_TYPE_DEBUG, " _previousMultiPerson2DResult count: %lu ", v140, 0xCu);
    }

    int v117 = -6661;
    v118 = v27;
  }
  else
  {
    for (unint64_t n = 0; n < [v27 count]; ++n)
    {
      v120 = [v27 objectAtIndexedSubscript:n];
      uint64_t v121 = *(void *)(*(void *)buf + 8 * n);
      v122 = objc_alloc_init(ABPKSinglePerson2DResult);
      [(ABPKSinglePerson2DResult *)v122 set2dSkeleton:v120 isPoseValid:1 trackingId:v121];
      [v129 addObject:v122];
    }
    uint64_t v123 = [v129 mutableCopy];
    v124 = v132->_previousMultiPerson2DResult;
    v132->_previousMultiPerson2DResult = (NSMutableArray *)v123;

    v125 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&uint64_t v126 = COERCE_DOUBLE([(NSMutableArray *)v132->_previousMultiPerson2DResult count]);
      *(_DWORD *)v140 = 134217984;
      double v141 = *(double *)&v126;
      _os_log_impl(&dword_21B7C6000, v125, OS_LOG_TYPE_DEBUG, " _previousMultiPerson2DResult count: %lu ", v140, 0xCu);
    }

    v118 = v27;
    [(ABPKMultiPerson2DTracking *)v132 _endMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:a5];
    int v117 = 0;
  }
  if (v136)
  {
    v137 = (char *)v136;
    operator delete(v136);
  }
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }

  return v117;
}

- (int)runPoseEstimationWithInput:(__CVBuffer *)a3 abpkDeviceOrientation:(int64_t)a4 atTimeStamp:(double)a5 andOutput:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a6;
  [(ABPKMultiPerson2DTracking *)self _startMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:a5];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  v13 = __ABPKLogSharedInstance();
  double v14 = (double)Width;
  double v15 = (double)Height;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)&buf[4] = (double)Height;
    __int16 v42 = 2048;
    double v43 = (double)Width;
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " Sensor image resolution: (height,width):(%f,%f) ", buf, 0x16u);
  }

  if ([(ABPK2DDetectionConfiguration *)self->_config2D abpkDeviceOrientation] != a4)
  {
    uint64_t v16 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = convertABPKDeviceOrientationEnumToString([(ABPK2DDetectionConfiguration *)self->_config2D abpkDeviceOrientation]);
      convertABPKDeviceOrientationEnumToString(a4);
      double v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v17;
      __int16 v42 = 2112;
      double v43 = v18;
      _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_DEBUG, " Device orientation changed from %@ to %@ ", buf, 0x16u);
    }
    [(ABPK2DDetectionConfiguration *)self->_config2D setAbpkDeviceOrientation:a4];
  }
  +[ABPK2DMLModelConfigSelector inputDimensionsForModelWithABPKNetworkConfig:self->_config2D];
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)&buf[4] = v22;
    __int16 v42 = 2048;
    double v43 = v20;
    _os_log_impl(&dword_21B7C6000, v23, OS_LOG_TYPE_DEBUG, " ML image resolution: (height,width):(%f,%f) ", buf, 0x16u);
  }

  v24 = -[ABPKImagePreProcessingParams initWithType:inputResolution:outputResolution:]([ABPKImagePreProcessingParams alloc], "initWithType:inputResolution:outputResolution:", 2, v14, v15, v20, v22);
  id v25 = [[ABPKImagePreProcessing alloc] initWithPreProcessingParams:v24];
  if (v25)
  {
    *(void *)buf = 0;
    v26 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_21B7C6000, v26, OS_LOG_TYPE_DEBUG, " Image Preprocessing ", v38, 2u);
    }

    uint64_t v39 = *MEMORY[0x263F04130];
    uint64_t v40 = MEMORY[0x263EFFA78];
    CFDictionaryRef v27 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)v20, (unint64_t)v22, 0x42475241u, v27, (CVPixelBufferRef *)buf))
    {
      uint64_t v28 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v38 = 0;
        v29 = " Could not create mlImage buffer of type kCVPixelFormatType_32BGRA ";
LABEL_21:
        _os_log_impl(&dword_21B7C6000, v28, OS_LOG_TYPE_ERROR, v29, v38, 2u);
      }
    }
    else
    {
      int v32 = [(ABPKImagePreProcessing *)v25 preprocessData:a3 outputBuffer:*(void *)buf];
      [(ABPKImagePreProcessing *)v25 logProfilingDetails];
      if (!v32)
      {
        [(ABPKMultiPerson2DTracking *)self _endMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:a5];
        [(ABPKMultiPerson2DTracking *)self _startMultiPerson2DTracking2DDetectionMLSignpostWithTimestamp:a5];
        double v34 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v38 = 0;
          _os_log_impl(&dword_21B7C6000, v34, OS_LOG_TYPE_DEBUG, " Running 2d pose estimation ", v38, 2u);
        }

        double v35 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v38 = 0;
          _os_log_impl(&dword_21B7C6000, v35, OS_LOG_TYPE_DEBUG, " \t Running the ML model ", v38, 2u);
        }

        double v36 = [ABPKMLImageData alloc];
        uint64_t v28 = [(ABPKMLImageData *)v36 initWithPixelBuffer:*(void *)buf timestamp:a4 abpkDeviceOrientation:v24 preprocessingParameters:a5];
        if ([(ABPK2DPoseEstimation *)self->_poseEstimation2D runWithMLImageData:v28 rotationOfResultTensor:0] == -6661)
        {
          v37 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v38 = 0;
            _os_log_impl(&dword_21B7C6000, v37, OS_LOG_TYPE_ERROR, " 2D Pose estimation failed. ", v38, 2u);
          }

          int v31 = -6661;
        }
        else
        {
          [(ABPK2DPoseEstimation *)self->_poseEstimation2D getRawTrackedHumanSkeletonVector:v10];
          CVPixelBufferRelease(*(CVPixelBufferRef *)buf);
          [(ABPKMultiPerson2DTracking *)self _endMultiPerson2DTracking2DDetectionPostProcessingSignpostWithTimestamp:a5];
          int v31 = 0;
        }
        goto LABEL_23;
      }
      uint64_t v28 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v38 = 0;
        v29 = " Could not pre-process image ";
        goto LABEL_21;
      }
    }
    int v31 = -6660;
LABEL_23:

    goto LABEL_24;
  }
  v30 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v30, OS_LOG_TYPE_ERROR, " Could not initialize imagePreprocessor ", buf, 2u);
  }

  int v31 = -6660;
LABEL_24:

  return v31;
}

- (CGRect)_rotateBoundingBoxToPortrait:(CGRect)a3 withImageRes:(CGSize)a4
{
  CGFloat width = a3.size.width;
  CGFloat v5 = a4.width * 0.5 - (a3.origin.y - a4.width * 0.5);
  double v6 = a4.height * 0.5 + a3.origin.x - a4.height * 0.5;
  double v7 = v5 - a3.size.height;
  double height = a3.size.height;
  double v9 = width;
  result.size.double height = v9;
  result.size.CGFloat width = height;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (BOOL)overlayTrackedBodiesOnImage:(__CVBuffer *)a3 andGenerateOverlayImage:(__CVBuffer *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  double v7 = operator new(0xC0uLL);
  *double v7 = xmmword_21B813570;
  v7[1] = xmmword_21B813580;
  *(void *)&long long v8 = 255;
  *((void *)&v8 + 1) = 255;
  v7[2] = xmmword_21B813590;
  v7[3] = v8;
  v7[4] = xmmword_21B8135A0;
  v7[5] = xmmword_21B8135B0;
  *(void *)&long long v9 = 0xFF000000FFLL;
  *((void *)&v9 + 1) = 0xFF000000FFLL;
  v7[6] = v9;
  v7[7] = 0u;
  v7[8] = xmmword_21B8135C0;
  v7[9] = xmmword_21B8135D0;
  v7[10] = xmmword_21B8135E0;
  v7[11] = xmmword_21B8135F0;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  v12 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    size_t v33 = Height;
    __int16 v34 = 2048;
    size_t v35 = Width;
    _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " \x10overlayTrackedBodiesOnImage inputimage res: (h,w) = (%lu,%lu) ", buf, 0x16u);
  }

  unint64_t v13 = 0;
  *(void *)&long long v14 = 134217984;
  long long v30 = v14;
  while (v13 < [(NSMutableArray *)self->_trackedBodies count])
  {
    double v15 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = [(NSMutableArray *)self->_trackedBodies objectAtIndexedSubscript:v13];
      uint64_t v17 = [v16 objectID];
      *(_DWORD *)buf = v30;
      size_t v33 = v17;
      _os_log_impl(&dword_21B7C6000, v15, OS_LOG_TYPE_DEBUG, " \x10Overlaying result for Tracked Body with iD: %lu ", buf, 0xCu);
    }
    double v18 = [(NSMutableArray *)self->_trackedBodies objectAtIndexedSubscript:v13];
    long long v31 = v7[[v18 objectID] % 0xCuLL];

    double v19 = [(NSMutableArray *)self->_trackedBodies objectAtIndexedSubscript:v13];
    [v19 boundingBox];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    if (v13) {
      uint64_t v28 = a4;
    }
    else {
      uint64_t v28 = a3;
    }
    overlay2dBoundingBox((uint64_t)v28, (uint64_t)a4, v21, v23, v25, v27, *(double *)&v31);
    ++v13;
  }
  operator delete(v7);
  return 1;
}

- (BOOL)overlayResult:(id)a3 OnImage:(__CVBuffer *)a4 andGenerateOverlayImage:(__CVBuffer *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v8 = operator new(0xC0uLL);
  unint64_t v9 = 0;
  _OWORD *v8 = xmmword_21B813570;
  v8[1] = xmmword_21B813580;
  *(void *)&long long v10 = 255;
  *((void *)&v10 + 1) = 255;
  v8[2] = xmmword_21B813590;
  v8[3] = v10;
  v8[4] = xmmword_21B8135A0;
  v8[5] = xmmword_21B8135B0;
  *(void *)&long long v11 = 0xFF000000FFLL;
  *((void *)&v11 + 1) = 0xFF000000FFLL;
  v8[6] = v11;
  v8[7] = 0u;
  v8[8] = xmmword_21B8135C0;
  v8[9] = xmmword_21B8135D0;
  v8[10] = xmmword_21B8135E0;
  v8[11] = xmmword_21B8135F0;
  long long v17 = 0x8000100uLL;
  while (v9 < objc_msgSend(v7, "count", v17))
  {
    v12 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v17;
      unint64_t v19 = v9;
      _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " \x10Overlaying result for Person: %lu ", buf, 0xCu);
    }

    unint64_t v13 = [v7 objectAtIndexedSubscript:v9];
    long long v14 = v8[[v13 trackingId] % 0xC];
    if (v9) {
      double v15 = a5;
    }
    else {
      double v15 = a4;
    }
    [v13 overlayResultOnImage:v15 withResult:a5 withColor:*(double *)&v14];

    ++v9;
  }
  operator delete(v8);

  return 1;
}

- (void)_startInitABPKSignpost
{
}

- (void)_endInitABPKSignpost
{
}

- (void)_startMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:(double)a3
{
}

- (void)_endMultiPerson2DTrackingRunWithInputSignpostWithTimestamp:(double)a3
{
}

- (void)_startMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_endMultiPerson2DTrackingImagePreProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_startMultiPerson2DTracking2DDetectionMLSignpostWithTimestamp:(double)a3
{
}

- (void)_endMultiPerson2DTracking2DDetectionMLSignpostWithTimestamp:(double)a3
{
}

- (void)_startMultiPerson2DTracking2DDetectionPostProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_endMultiPerson2DTracking2DDetectionPostProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_startMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:(double)a3
{
}

- (void)_endMultiPerson2DTrackingPersonTrackingSignpostWithTimestamp:(double)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedBodies, 0);
  objc_storeStrong((id *)&self->_previousMultiPerson2DResult, 0);
  objc_storeStrong((id *)&self->_poseEstimation2D, 0);
  objc_storeStrong((id *)&self->_config2D, 0);
  objc_storeStrong((id *)&self->_abpkPersonIDTracker, 0);
}

@end