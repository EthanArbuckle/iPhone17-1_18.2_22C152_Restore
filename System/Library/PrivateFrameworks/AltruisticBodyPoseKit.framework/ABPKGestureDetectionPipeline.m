@interface ABPKGestureDetectionPipeline
- (ABPKGestureDetectionPipeline)init;
- (ABPKGestureDetectionPipeline)initWithFrequency:(unsigned int)a3;
- (BOOL)overlayResult:(id)a3 OnImage:(__CVBuffer *)a4 andGenerateOverlayImage:(__CVBuffer *)a5;
- (int)runPoseEstimationWithInput:(__CVBuffer *)a3 abpkDeviceOrientation:(int64_t)a4 atTimeStamp:(double)a5 andOutput:(id)a6;
- (int)runWithInput:(__CVBuffer *)a3 abpkDeviceOrientation:(int64_t)a4 atTimeStamp:(double)a5 andOutput:(id)a6;
- (vector<float)extractDataForJointIdx:()(ext_vector_type(2 fromPoseTimeArray:;
- (void)_endGestureDetection2DDetectionMLSignpostWithTimestamp:(double)a3;
- (void)_endGestureDetection2DDetectionPostProcessingSignpostWithTimestamp:(double)a3;
- (void)_endGestureDetectionAlgorithmSignpostWithTimestamp:(double)a3;
- (void)_endGestureDetectionImagePreProcessingSignpostWithTimestamp:(double)a3;
- (void)_endGestureDetectionPersonTrackingSignpostWithTimestamp:(double)a3;
- (void)_endGestureDetectionRunWithInputSignpostWithTimestamp:(double)a3;
- (void)_endInitABPKSignpost;
- (void)_startGestureDetection2DDetectionMLSignpostWithTimestamp:(double)a3;
- (void)_startGestureDetection2DDetectionPostProcessingSignpostWithTimestamp:(double)a3;
- (void)_startGestureDetectionAlgorithmSignpostWithTimestamp:(double)a3;
- (void)_startGestureDetectionImagePreProcessingSignpostWithTimestamp:(double)a3;
- (void)_startGestureDetectionPersonTrackingSignpostWithTimestamp:(double)a3;
- (void)_startGestureDetectionRunWithInputSignpostWithTimestamp:(double)a3;
- (void)_startInitABPKSignpost;
- (void)runGestureDetection:(id)a3 withTrackingId:(unsigned int)a4 andResult:(id)a5;
@end

@implementation ABPKGestureDetectionPipeline

- (ABPKGestureDetectionPipeline)init
{
  return [(ABPKGestureDetectionPipeline *)self initWithFrequency:30];
}

- (ABPKGestureDetectionPipeline)initWithFrequency:(unsigned int)a3
{
  v4 = self;
  uint64_t v32 = *MEMORY[0x263EF8340];
  [(ABPKGestureDetectionPipeline *)self _startInitABPKSignpost];
  if (a3 > 0x1E || ((1 << a3) & 0x40000420) == 0)
  {
    v26 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v31 = a3;
      _os_log_impl(&dword_21B7C6000, v26, OS_LOG_TYPE_ERROR, " Failed to initialize Gesture Detection Pipeline. Unsupported Frequency: %d ", buf, 8u);
    }

    goto LABEL_29;
  }
  v4->_unsigned int fps = a3;
  unsigned int v5 = (unsigned __int16)a3 / 3u + 1;
  v4->_unsigned int maxPreviousPoses = 2 * (a3 & 0x7FFF);
  v4->_unsigned int raisingMaxPreviousPoses = v5;
  v4->_unsigned int wavingMinPeriodicFrames = v5;
  v4->_unsigned int wavingAngleChangeLastFrames = ((139812 * ((5 * (_WORD)a3) & 0x3FFFu)) >> 20) + 1;
  v6 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v6, OS_LOG_TYPE_DEBUG, " Gesture Detection Config parameters: ", buf, 2u);
  }

  v7 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    unsigned int fps = v4->_fps;
    *(_DWORD *)buf = 67109120;
    unsigned int v31 = fps;
    _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_DEBUG, " \t _fps: %d ", buf, 8u);
  }

  v9 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    unsigned int maxPreviousPoses = v4->_maxPreviousPoses;
    *(_DWORD *)buf = 67109120;
    unsigned int v31 = maxPreviousPoses;
    _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_DEBUG, " \t maxPreviousPoses: %d ", buf, 8u);
  }

  v11 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unsigned int raisingMaxPreviousPoses = v4->_raisingMaxPreviousPoses;
    *(_DWORD *)buf = 67109120;
    unsigned int v31 = raisingMaxPreviousPoses;
    _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_DEBUG, " \t raisingMaxPreviousPoses: %d, ", buf, 8u);
  }

  v13 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    unsigned int wavingMinPeriodicFrames = v4->_wavingMinPeriodicFrames;
    *(_DWORD *)buf = 67109120;
    unsigned int v31 = wavingMinPeriodicFrames;
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " \t wavingMinPeriodicFrames: %d ", buf, 8u);
  }

  v15 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    unsigned int wavingAngleChangeLastFrames = v4->_wavingAngleChangeLastFrames;
    *(_DWORD *)buf = 67109120;
    unsigned int v31 = wavingAngleChangeLastFrames;
    _os_log_impl(&dword_21B7C6000, v15, OS_LOG_TYPE_DEBUG, " \t wavingAngleChangeLastFrames: %d ", buf, 8u);
  }

  v29.receiver = v4;
  v29.super_class = (Class)ABPKGestureDetectionPipeline;
  v4 = [(ABPKGestureDetectionPipeline *)&v29 init];
  if (!v4) {
    goto LABEL_19;
  }
  v17 = [[ABPK2DDetectionConfiguration alloc] initWithAlgorithmMode:0];
  config2D = v4->_config2D;
  v4->_config2D = v17;

  if (!v4->_config2D)
  {
    v27 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v27, OS_LOG_TYPE_ERROR, " Failed to initialize config for 2D Detection module ", buf, 2u);
    }
    goto LABEL_28;
  }
  v19 = [[ABPK2DPoseEstimation alloc] initWith2DDetectionConfig:v4->_config2D use3DSkeletonForExtrapolation:0 shouldPush3DSupportSkeleton:0];
  poseEstimation2D = v4->_poseEstimation2D;
  v4->_poseEstimation2D = v19;

  if (!v4->_poseEstimation2D)
  {
    v27 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v27, OS_LOG_TYPE_ERROR, " Failed to initialize 2D Pose Estimation Algorithm. ", buf, 2u);
    }
LABEL_28:

LABEL_29:
    v25 = 0;
    goto LABEL_30;
  }
  v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  joints2DBufferDict = v4->_joints2DBufferDict;
  v4->_joints2DBufferDict = v21;

  v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  previousGestureDetectionResult = v4->_previousGestureDetectionResult;
  v4->_previousGestureDetectionResult = v23;

  v4->_lastTrackingId = -1;
LABEL_19:
  [(ABPKGestureDetectionPipeline *)v4 _endInitABPKSignpost];
  v4 = v4;
  v25 = v4;
LABEL_30:

  return v25;
}

- (int)runWithInput:(__CVBuffer *)a3 abpkDeviceOrientation:(int64_t)a4 atTimeStamp:(double)a5 andOutput:(id)a6
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v105 = a6;
  [(ABPKGestureDetectionPipeline *)self _startGestureDetectionRunWithInputSignpostWithTimestamp:a5];
  id v110 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v104 = -[ABPKGestureDetectionPipeline runPoseEstimationWithInput:abpkDeviceOrientation:atTimeStamp:andOutput:](self, "runPoseEstimationWithInput:abpkDeviceOrientation:atTimeStamp:andOutput:", a3, a4, a5);
  v10 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = [v110 count];
    _os_log_impl(&dword_21B7C6000, v10, OS_LOG_TYPE_DEBUG, " Humans detected: %lu ", (uint8_t *)buf, 0xCu);
  }

  [(ABPKGestureDetectionPipeline *)self _startGestureDetectionPersonTrackingSignpostWithTimestamp:a5];
  v11 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_DEBUG, " Computing tracking ids ", (uint8_t *)buf, 2u);
  }

  std::vector<unsigned long>::vector(buf, [v110 count]);
  v114 = 0;
  v115 = 0;
  unint64_t v116 = 0;
  if ([(NSMutableArray *)self->_previousGestureDetectionResult count])
  {
    *(double *)&unint64_t v12 = 0.0;
    while (1)
    {
      if (v12 >= [v110 count]) {
        goto LABEL_76;
      }
      v13 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v118 = 134217984;
        double v119 = *(double *)&v12;
        _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " Finding tracking for current skeleton: %lu ", v118, 0xCu);
      }

      *(double *)&unint64_t v14 = 0.0;
      uint64_t v106 = -1000;
      float v15 = 10000.0;
      while (v14 < [(NSMutableArray *)self->_previousGestureDetectionResult count])
      {
        v16 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v17 = [(NSMutableArray *)self->_previousGestureDetectionResult objectAtIndexedSubscript:v14];
          int v18 = [v17 trackingId];
          *(_DWORD *)v118 = 134218240;
          double v119 = *(double *)&v14;
          __int16 v120 = 1024;
          int v121 = v18;
          _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_DEBUG, " \t Comparing with previous skeleton %lu with tracking_id: %u ", v118, 0x12u);
        }
        __p = 0;
        v112 = 0;
        uint64_t v113 = 0;
        std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v114, (uint64_t)v115, (v115 - (unsigned char *)v114) >> 3);
        v19 = [(NSMutableArray *)self->_previousGestureDetectionResult objectAtIndexedSubscript:v14];
        int v20 = [v19 trackingId];
        if (v112 == __p)
        {
          BOOL v23 = 0;
        }
        else
        {
          unint64_t v21 = (v112 - (unsigned char *)__p) >> 3;
          if (v21 <= 1) {
            uint64_t v22 = 1;
          }
          else {
            uint64_t v22 = (v112 - (unsigned char *)__p) >> 3;
          }
          if (*(void *)__p == v20)
          {
            BOOL v23 = 1;
          }
          else
          {
            uint64_t v24 = 1;
            do
            {
              unint64_t v25 = v24;
              if (v22 == v24) {
                break;
              }
              uint64_t v26 = *((void *)__p + v24++);
            }
            while (v26 != v20);
            BOOL v23 = v25 < v21;
          }
        }

        if (__p)
        {
          v112 = __p;
          operator delete(__p);
        }
        if (v23)
        {
          v27 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v118 = 0;
            _os_log_impl(&dword_21B7C6000, v27, OS_LOG_TYPE_DEBUG, " \t Skipping. Tracking id already assigned ", v118, 2u);
          }
          goto LABEL_38;
        }
        v28 = [v110 objectAtIndexedSubscript:v12];
        objc_super v29 = (int32x2_t *)[v28 keypoints2d];
        v30 = [(NSMutableArray *)self->_previousGestureDetectionResult objectAtIndexedSubscript:v14];
        unsigned int v31 = [v30 skeleton2D];
        uint64_t v32 = (float32x2_t *)[v31 keypoints2d];
        v33 = [v110 objectAtIndexedSubscript:v12];
        v34 = [v33 skeletonDefinition];
        uint64_t v35 = [v34 jointCount];
        for (float i = 0.0; v35; --v35)
        {
          *(int32x2_t *)v37.f32 = vrev64_s32(*v29);
          *(float32x2_t *)&v37.u32[2] = *v32;
          if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcltzq_f32(v37))) & 1) == 0)
          {
            float32x2_t v38 = vsub_f32((float32x2_t)*v29, *v32);
            float i = i + sqrtf(vaddv_f32(vmul_f32(v38, v38)));
          }
          ++v32;
          ++v29;
        }

        v39 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v118 = 134217984;
          double v119 = i;
          _os_log_impl(&dword_21B7C6000, v39, OS_LOG_TYPE_DEBUG, " \t\t distance: %f ", v118, 0xCu);
        }

        if (i < v15)
        {
          v27 = [(NSMutableArray *)self->_previousGestureDetectionResult objectAtIndexedSubscript:v14];
          uint64_t v106 = [v27 trackingId];
          float v15 = i;
LABEL_38:
        }
        ++v14;
      }
      v40 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v118 = 134217984;
        double v119 = v15;
        _os_log_impl(&dword_21B7C6000, v40, OS_LOG_TYPE_DEBUG, " \t Minimum Distance: %f ", v118, 0xCu);
      }

      if (v15 <= 1500.0)
      {
        unint64_t v42 = v106;
        if (v106 == -1000) {
          goto LABEL_47;
        }
      }
      else
      {
        v41 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v118 = 0;
          _os_log_impl(&dword_21B7C6000, v41, OS_LOG_TYPE_DEBUG, " Distance is higher than threshold. No closest human found from the previous frame. Assigning new tracking id ", v118, 2u);
        }

LABEL_47:
        unint64_t v42 = self->_lastTrackingId + 1;
        self->_lastTrackingId = v42;
      }
      double v107 = *(double *)&v42;
      *(void *)(*(void *)&buf[0] + 8 * v12) = v42;
      v43 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v118 = 134217984;
        double v119 = v107;
        _os_log_impl(&dword_21B7C6000, v43, OS_LOG_TYPE_DEBUG, " \t Tracking id: %lu ", v118, 0xCu);
      }

      v44 = v115;
      if ((unint64_t)v115 >= v116)
      {
        v46 = (char *)v114;
        uint64_t v47 = (v115 - (unsigned char *)v114) >> 3;
        unint64_t v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 61) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v49 = v116 - (void)v114;
        if ((uint64_t)(v116 - (void)v114) >> 2 > v48) {
          unint64_t v48 = v49 >> 2;
        }
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v50 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v50 = v48;
        }
        if (v50)
        {
          v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v116, v50);
          v46 = (char *)v114;
          v44 = v115;
        }
        else
        {
          v51 = 0;
        }
        v52 = &v51[8 * v47];
        *(double *)v52 = v107;
        v45 = v52 + 8;
        while (v44 != v46)
        {
          uint64_t v53 = *((void *)v44 - 1);
          v44 -= 8;
          *((void *)v52 - 1) = v53;
          v52 -= 8;
        }
        v114 = v52;
        v115 = v45;
        unint64_t v116 = (unint64_t)&v51[8 * v50];
        if (v46) {
          operator delete(v46);
        }
      }
      else
      {
        *(double *)v115 = v107;
        v45 = v44 + 8;
      }
      v115 = v45;
      v54 = [v110 objectAtIndexedSubscript:v12];
      v55 = [v54 skeletonDefinition];
      uint64_t v56 = [v55 jointCount];

      id v108 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (v56)
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          v60 = [v110 objectAtIndexedSubscript:v12];
          double v109 = *(double *)([v60 keypoints2d] + 8 * j);

          v61 = [v110 objectAtIndexedSubscript:v12];
          int v62 = *(_DWORD *)([v61 confidences] + 4 * j);

          v63 = [v110 objectAtIndexedSubscript:v12];
          uint64_t v64 = *(unsigned int *)([v63 visibility] + 4 * j);

          v65 = [NSNumber numberWithFloat:v109];
          v117[0] = v65;
          HIDWORD(v66) = HIDWORD(v109);
          LODWORD(v66) = HIDWORD(v109);
          v67 = [NSNumber numberWithFloat:v66];
          v117[1] = v67;
          v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:2];
          [v108 addObject:v68];

          LODWORD(v69) = v62;
          v70 = [NSNumber numberWithFloat:v69];
          [v57 addObject:v70];

          v71 = [NSNumber numberWithUnsignedInt:v64];
          [v58 addObject:v71];
        }
      }
      v72 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *(void *)&v107);
      v73 = [(NSMutableDictionary *)self->_joints2DBufferDict objectForKeyedSubscript:v72];
      BOOL v74 = v73 == 0;

      if (v74)
      {
        joints2DBufferDict = self->_joints2DBufferDict;
        v76 = [[ABPKCircularArray alloc] initWithCapacity:self->_maxPreviousPoses];
        [(NSMutableDictionary *)joints2DBufferDict setValue:v76 forKey:v72];
      }
      v77 = [(NSMutableDictionary *)self->_joints2DBufferDict objectForKeyedSubscript:v72];
      [v77 add:v108];

      ++v12;
    }
  }
  for (unint64_t k = 0; k < [v110 count]; ++k)
  {
    *(void *)(*(void *)&buf[0] + 8 * k) = self->_lastTrackingId + 1;
    v79 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", k);
    v80 = self->_joints2DBufferDict;
    v81 = [[ABPKCircularArray alloc] initWithCapacity:self->_maxPreviousPoses];
    [(NSMutableDictionary *)v80 setValue:v81 forKey:v79];
  }
  self->_lastTrackingId += [v110 count];
LABEL_76:
  [(ABPKGestureDetectionPipeline *)self _endGestureDetectionPersonTrackingSignpostWithTimestamp:a5];
  [(ABPKGestureDetectionPipeline *)self _startGestureDetectionAlgorithmSignpostWithTimestamp:a5];
  if (v104)
  {
    v82 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v118 = 0;
      _os_log_impl(&dword_21B7C6000, v82, OS_LOG_TYPE_ERROR, " Pose not valid. Skipping ", v118, 2u);
    }

    previousGestureDetectionResult = self->_previousGestureDetectionResult;
    self->_previousGestureDetectionResult = 0;

    v84 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&uint64_t v85 = COERCE_DOUBLE([(NSMutableArray *)self->_previousGestureDetectionResult count]);
      *(_DWORD *)v118 = 134217984;
      double v119 = *(double *)&v85;
      _os_log_impl(&dword_21B7C6000, v84, OS_LOG_TYPE_DEBUG, " _previousGestureDetectionResult count: %lu ", v118, 0xCu);
    }

    v86 = [(NSMutableDictionary *)self->_joints2DBufferDict allKeys];
    for (unint64_t m = 0; [v86 count] > m; ++m)
    {
      v88 = self->_joints2DBufferDict;
      v89 = [v86 objectAtIndexedSubscript:m];
      [(NSMutableDictionary *)v88 removeObjectForKey:v89];
    }
    int v90 = -6661;
  }
  else
  {
    double Current = CFAbsoluteTimeGetCurrent();
    v92 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v118 = 0;
      _os_log_impl(&dword_21B7C6000, v92, OS_LOG_TYPE_ERROR, " Pose valid. Running the gesture detection pipeline ", v118, 2u);
    }

    for (unint64_t n = 0; n < [v110 count]; ++n)
    {
      v94 = objc_alloc_init(ABPKGestureDetectionResult);
      uint64_t v95 = *(void *)(*(void *)&buf[0] + 8 * n);
      v96 = [v110 objectAtIndexedSubscript:n];
      [(ABPKGestureDetectionPipeline *)self runGestureDetection:v96 withTrackingId:v95 andResult:v94];

      [v105 addObject:v94];
    }
    v97 = (NSMutableArray *)[v105 mutableCopy];
    v98 = self->_previousGestureDetectionResult;
    self->_previousGestureDetectionResult = v97;

    v99 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&uint64_t v100 = COERCE_DOUBLE([(NSMutableArray *)self->_previousGestureDetectionResult count]);
      *(_DWORD *)v118 = 134217984;
      double v119 = *(double *)&v100;
      _os_log_impl(&dword_21B7C6000, v99, OS_LOG_TYPE_DEBUG, " _previousGestureDetectionResult count: %lu ", v118, 0xCu);
    }

    double v101 = CFAbsoluteTimeGetCurrent();
    v102 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v118 = 134217984;
      double v119 = v101 - Current;
      _os_log_impl(&dword_21B7C6000, v102, OS_LOG_TYPE_DEBUG, " timeGestureDetection: %f ", v118, 0xCu);
    }

    [(ABPKGestureDetectionPipeline *)self _endGestureDetectionAlgorithmSignpostWithTimestamp:a5];
    [(ABPKGestureDetectionPipeline *)self _endGestureDetectionRunWithInputSignpostWithTimestamp:a5];
    int v90 = 0;
  }
  if (v114)
  {
    v115 = (char *)v114;
    operator delete(v114);
  }
  if (*(void *)&buf[0])
  {
    *((void *)&buf[0] + 1) = *(void *)&buf[0];
    operator delete(*(void **)&buf[0]);
  }

  return v90;
}

- (int)runPoseEstimationWithInput:(__CVBuffer *)a3 abpkDeviceOrientation:(int64_t)a4 atTimeStamp:(double)a5 andOutput:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a6;
  [(ABPKGestureDetectionPipeline *)self _startGestureDetectionImagePreProcessingSignpostWithTimestamp:a5];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  v13 = __ABPKLogSharedInstance();
  double v14 = (double)Width;
  double v15 = (double)Height;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)&uint8_t buf[4] = (double)Height;
    __int16 v42 = 2048;
    double v43 = (double)Width;
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " Sensor image resolution: (height,width):(%f,%f) ", buf, 0x16u);
  }

  if ([(ABPK2DDetectionConfiguration *)self->_config2D abpkDeviceOrientation] != a4)
  {
    v16 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = convertABPKDeviceOrientationEnumToString([(ABPK2DDetectionConfiguration *)self->_config2D abpkDeviceOrientation]);
      convertABPKDeviceOrientationEnumToString(a4);
      double v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      __int16 v42 = 2112;
      double v43 = v18;
      _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_DEBUG, " Device orientation changed from %@ to %@ ", buf, 0x16u);
    }
    [(ABPK2DDetectionConfiguration *)self->_config2D setAbpkDeviceOrientation:a4];
  }
  +[ABPK2DMLModelConfigSelector inputDimensionsForModelWithABPKNetworkConfig:self->_config2D];
  double v20 = v19;
  double v22 = v21;
  BOOL v23 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)&uint8_t buf[4] = v22;
    __int16 v42 = 2048;
    double v43 = v20;
    _os_log_impl(&dword_21B7C6000, v23, OS_LOG_TYPE_DEBUG, " ML image resolution: (height,width):(%f,%f) ", buf, 0x16u);
  }

  uint64_t v24 = -[ABPKImagePreProcessingParams initWithType:inputResolution:outputResolution:]([ABPKImagePreProcessingParams alloc], "initWithType:inputResolution:outputResolution:", 2, v14, v15, v20, v22);
  unint64_t v25 = [[ABPKImagePreProcessing alloc] initWithPreProcessingParams:v24];
  if (v25)
  {
    *(void *)buf = 0;
    uint64_t v26 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)float32x2_t v38 = 0;
      _os_log_impl(&dword_21B7C6000, v26, OS_LOG_TYPE_DEBUG, " Image Preprocessing ", v38, 2u);
    }

    uint64_t v39 = *MEMORY[0x263F04130];
    uint64_t v40 = MEMORY[0x263EFFA78];
    CFDictionaryRef v27 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)v20, (unint64_t)v22, 0x42475241u, v27, (CVPixelBufferRef *)buf))
    {
      v28 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)float32x2_t v38 = 0;
        objc_super v29 = " Could not create mlImage buffer of type kCVPixelFormatType_32BGRA ";
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
        [(ABPKGestureDetectionPipeline *)self _endGestureDetectionImagePreProcessingSignpostWithTimestamp:a5];
        [(ABPKGestureDetectionPipeline *)self _startGestureDetection2DDetectionMLSignpostWithTimestamp:a5];
        v34 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)float32x2_t v38 = 0;
          _os_log_impl(&dword_21B7C6000, v34, OS_LOG_TYPE_DEBUG, " Running 2d pose estimation ", v38, 2u);
        }

        uint64_t v35 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)float32x2_t v38 = 0;
          _os_log_impl(&dword_21B7C6000, v35, OS_LOG_TYPE_DEBUG, " \t Running the ML model ", v38, 2u);
        }

        v36 = [ABPKMLImageData alloc];
        v28 = [(ABPKMLImageData *)v36 initWithPixelBuffer:*(void *)buf timestamp:a4 abpkDeviceOrientation:v24 preprocessingParameters:a5];
        if ([(ABPK2DPoseEstimation *)self->_poseEstimation2D runWithMLImageData:v28 rotationOfResultTensor:0] == -6661)
        {
          float32x4_t v37 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)float32x2_t v38 = 0;
            _os_log_impl(&dword_21B7C6000, v37, OS_LOG_TYPE_ERROR, " 2D Pose estimation failed. ", v38, 2u);
          }

          int v31 = -6661;
        }
        else
        {
          [(ABPK2DPoseEstimation *)self->_poseEstimation2D getRawTrackedHumanSkeletonVector:v10];
          CVPixelBufferRelease(*(CVPixelBufferRef *)buf);
          [(ABPKGestureDetectionPipeline *)self _endGestureDetection2DDetectionPostProcessingSignpostWithTimestamp:a5];
          int v31 = 0;
        }
        goto LABEL_23;
      }
      v28 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)float32x2_t v38 = 0;
        objc_super v29 = " Could not pre-process image ";
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

- (vector<float)extractDataForJointIdx:()(ext_vector_type(2 fromPoseTimeArray:
{
  v7 = v4;
  id v19 = a4;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(v7, self->_maxPreviousPoses);
  if (self->_maxPreviousPoses)
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [v19 objectAtIndexedSubscript:v8];
      id v10 = [v9 objectAtIndexedSubscript:a3];
      v11 = [v10 objectAtIndexedSubscript:0];
      [v11 floatValue];
      *(void *)&long long v20 = v12;
      v13 = [v19 objectAtIndexedSubscript:v8];
      double v14 = [v13 objectAtIndexedSubscript:a3];
      double v15 = [v14 objectAtIndexedSubscript:1];
      [v15 floatValue];
      long long v16 = v20;
      DWORD1(v16) = v17;
      long long v20 = v16;

      *(void *)(*v7 + 8 * v8++) = v20;
    }
    while (v8 < self->_maxPreviousPoses);
  }

  return v18;
}

- (void)runGestureDetection:(id)a3 withTrackingId:(unsigned int)a4 andResult:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  BOOL v53 = detectFaceVisible(*(_DWORD *)([v8 visibility] + 56), *(_DWORD *)(objc_msgSend(v8, "visibility") + 60), *(_DWORD *)objc_msgSend(v8, "visibility"), *(_DWORD *)(objc_msgSend(v8, "visibility") + 68), *(_DWORD *)(objc_msgSend(v8, "visibility") + 72));
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v6);
  v11 = [(NSMutableDictionary *)self->_joints2DBufferDict objectForKeyedSubscript:v10];
  uint64_t v12 = [v11 contents];

  v13 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = [v12 count];
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " poseTimeArray size: %lu ", (uint8_t *)buf, 0xCu);
  }

  if ([v12 count] >= (unint64_t)self->_maxPreviousPoses)
  {
    v52 = v9;
    [(ABPKGestureDetectionPipeline *)self extractDataForJointIdx:1 fromPoseTimeArray:v12];
    [(ABPKGestureDetectionPipeline *)self extractDataForJointIdx:0 fromPoseTimeArray:v12];
    [(ABPKGestureDetectionPipeline *)self extractDataForJointIdx:7 fromPoseTimeArray:v12];
    [(ABPKGestureDetectionPipeline *)self extractDataForJointIdx:6 fromPoseTimeArray:v12];
    [(ABPKGestureDetectionPipeline *)self extractDataForJointIdx:5 fromPoseTimeArray:v12];
    [(ABPKGestureDetectionPipeline *)self extractDataForJointIdx:4 fromPoseTimeArray:v12];
    [(ABPKGestureDetectionPipeline *)self extractDataForJointIdx:3 fromPoseTimeArray:v12];
    [(ABPKGestureDetectionPipeline *)self extractDataForJointIdx:2 fromPoseTimeArray:v12];
    double v15 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_21B7C6000, v15, OS_LOG_TYPE_DEBUG, " Starting waving left hand detection ", v54, 2u);
    }

    BOOL v16 = detectWavingHand((float32x2_t *)v65, (float32x2_t *)v63, (float32x2_t *)v61, *(uint64_t *)&buf[0], (uint64_t)v67, self->_maxPreviousPoses, self->_wavingAngleChangeLastFrames, self->_wavingMinPeriodicFrames);
    int v17 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_21B7C6000, v17, OS_LOG_TYPE_DEBUG, " Starting waving right hand detection ", v54, 2u);
    }

    BOOL v18 = detectWavingHand((float32x2_t *)v59, (float32x2_t *)v57, (float32x2_t *)__p, *(uint64_t *)&buf[0], (uint64_t)v67, self->_maxPreviousPoses, self->_wavingAngleChangeLastFrames, self->_wavingMinPeriodicFrames);
    unsigned int maxPreviousPoses = self->_maxPreviousPoses;
    unsigned int raisingMaxPreviousPoses = self->_raisingMaxPreviousPoses;
    uint64_t v21 = maxPreviousPoses - raisingMaxPreviousPoses;
    if (maxPreviousPoses != raisingMaxPreviousPoses)
    {
      uint64_t v22 = *(void *)&buf[0];
      BOOL v23 = (const void *)(*(void *)&buf[0] + 8 * v21);
      uint64_t v24 = *((void *)&buf[0] + 1) - (void)v23;
      if (*((const void **)&buf[0] + 1) != v23) {
        memmove(*(void **)&buf[0], v23, *((void *)&buf[0] + 1) - (void)v23);
      }
      *((void *)&buf[0] + 1) = v22 + v24;
      unint64_t v25 = v67;
      uint64_t v26 = &v67[8 * v21];
      int64_t v27 = v68 - v26;
      if (v68 != v26) {
        memmove(v67, v26, v68 - v26);
      }
      v68 = &v25[v27];
      v28 = (char *)v65;
      objc_super v29 = (char *)v65 + 8 * v21;
      uint64_t v30 = v66 - v29;
      if (v66 != v29) {
        memmove(v65, v29, v66 - v29);
      }
      double v66 = &v28[v30];
      int v31 = (char *)v63;
      int v32 = (char *)v63 + 8 * v21;
      uint64_t v33 = v64 - v32;
      if (v64 != v32) {
        memmove(v63, v32, v64 - v32);
      }
      uint64_t v64 = &v31[v33];
      v34 = (char *)v61;
      uint64_t v35 = (char *)v61 + 8 * v21;
      uint64_t v36 = v62 - v35;
      if (v62 != v35) {
        memmove(v61, v35, v62 - v35);
      }
      int v62 = &v34[v36];
      float32x4_t v37 = (char *)v59;
      float32x2_t v38 = (char *)v59 + 8 * v21;
      uint64_t v39 = v60 - v38;
      if (v60 != v38) {
        memmove(v59, v38, v60 - v38);
      }
      v60 = &v37[v39];
      uint64_t v40 = (char *)v57;
      v41 = (char *)v57 + 8 * v21;
      uint64_t v42 = v58 - v41;
      if (v58 != v41) {
        memmove(v57, v41, v58 - v41);
      }
      id v58 = &v40[v42];
      double v43 = (char *)__p;
      uint64_t v44 = (char *)__p + 8 * v21;
      uint64_t v45 = v56 - v44;
      if (v56 != v44) {
        memmove(__p, v44, v56 - v44);
      }
      uint64_t v56 = &v43[v45];
    }
    v46 = __ABPKLogSharedInstance();
    id v9 = v52;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_21B7C6000, v46, OS_LOG_TYPE_DEBUG, " Starting raising left hand detection ", v54, 2u);
    }

    BOOL v47 = detectRaisingHand((uint64_t)v65, (uint64_t)v63, (uint64_t)v61, *(uint64_t *)&buf[0], (uint64_t)v67, self->_raisingMaxPreviousPoses);
    unint64_t v48 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_21B7C6000, v48, OS_LOG_TYPE_DEBUG, " Starting raising right hand detection ", v54, 2u);
    }

    BOOL v49 = detectRaisingHand((uint64_t)v59, (uint64_t)v57, (uint64_t)__p, *(uint64_t *)&buf[0], (uint64_t)v67, self->_raisingMaxPreviousPoses);
    id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
    v51 = v50;
    if (v47 || v49) {
      [v50 addObject:&unk_26CB94B60];
    }
    if (v16 || v18) {
      [v51 addObject:&unk_26CB94B78];
    }
    if (v53) {
      [v51 addObject:&unk_26CB94B90];
    }
    [v52 set2dSkeleton:v8 isPoseValid:1 trackingId:v6 gestureTypes:v51];

    if (__p)
    {
      uint64_t v56 = (char *)__p;
      operator delete(__p);
    }
    if (v57)
    {
      id v58 = (char *)v57;
      operator delete(v57);
    }
    if (v59)
    {
      v60 = (char *)v59;
      operator delete(v59);
    }
    if (v61)
    {
      int v62 = (char *)v61;
      operator delete(v61);
    }
    if (v63)
    {
      uint64_t v64 = (char *)v63;
      operator delete(v63);
    }
    if (v65)
    {
      double v66 = (char *)v65;
      operator delete(v65);
    }
    if (v67)
    {
      v68 = v67;
      operator delete(v67);
    }
    if (*(void *)&buf[0])
    {
      *((void *)&buf[0] + 1) = *(void *)&buf[0];
      operator delete(*(void **)&buf[0]);
    }
  }
  else
  {
    double v14 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21B7C6000, v14, OS_LOG_TYPE_DEBUG, " Pose history not sufficient for gesture detection ", (uint8_t *)buf, 2u);
    }

    [v9 set2dSkeleton:v8 isPoseValid:1 trackingId:v6 gestureTypes:MEMORY[0x263EFFA68]];
  }
}

- (BOOL)overlayResult:(id)a3 OnImage:(__CVBuffer *)a4 andGenerateOverlayImage:(__CVBuffer *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = operator new(0xC0uLL);
  unint64_t v9 = 0;
  *id v8 = xmmword_21B813570;
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
  long long v21 = 0x8000100uLL;
  while (v9 < objc_msgSend(v7, "count", v21))
  {
    uint64_t v12 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v21;
      unint64_t v23 = v9;
      _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " \x10Overlaying result for Person: %lu ", buf, 0xCu);
    }

    v13 = [v7 objectAtIndexedSubscript:v9];
    double v14 = [v13 gestureTypes];
    uint64_t v15 = [v14 count];

    unsigned int v16 = [v13 trackingId];
    if (v15)
    {
      int v17 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v17, OS_LOG_TYPE_DEBUG, " Gesture detected ", buf, 2u);
      }

      *(void *)&long long v18 = 0xFF00000000;
    }
    else
    {
      long long v18 = v8[v16 % 0xC];
    }
    if (v9) {
      id v19 = a5;
    }
    else {
      id v19 = a4;
    }
    [v13 overlayResultOnImage:v19 withResult:a5 withColor:*(double *)&v18];

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

- (void)_startGestureDetectionRunWithInputSignpostWithTimestamp:(double)a3
{
}

- (void)_endGestureDetectionRunWithInputSignpostWithTimestamp:(double)a3
{
}

- (void)_startGestureDetectionImagePreProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_endGestureDetectionImagePreProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_startGestureDetection2DDetectionMLSignpostWithTimestamp:(double)a3
{
}

- (void)_endGestureDetection2DDetectionMLSignpostWithTimestamp:(double)a3
{
}

- (void)_startGestureDetection2DDetectionPostProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_endGestureDetection2DDetectionPostProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_startGestureDetectionPersonTrackingSignpostWithTimestamp:(double)a3
{
}

- (void)_endGestureDetectionPersonTrackingSignpostWithTimestamp:(double)a3
{
}

- (void)_startGestureDetectionAlgorithmSignpostWithTimestamp:(double)a3
{
}

- (void)_endGestureDetectionAlgorithmSignpostWithTimestamp:(double)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousGestureDetectionResult, 0);
  objc_storeStrong((id *)&self->_joints2DBufferDict, 0);
  objc_storeStrong((id *)&self->_poseEstimation2D, 0);
  objc_storeStrong((id *)&self->_config2D, 0);
}

@end