@interface AR3DSkeletonRegistrationTechnique
- (BOOL)_estimateCameraPoseFromMatchingImageData:(id)a3 to3DData:(id)a4 worldTrackingPose:(id)a5 pCameraFromBody:(id *)a6 depthData:(id)a7 pScaleOut:(float *)a8;
- (BOOL)automaticSkeletonScaleEstimationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)reconfigurableFrom:(id)a3;
- (float)_estimateScaleFromDepthData:(__n128)a3 imageData:(__n128)a4 cameraPoseFromBody:(__n128)a5 skeleton:(uint64_t)a6;
- (float)_estimateScaleFromJasperCloud:(double)a3 cameraPoseFromBody:(double)a4 skeleton:(double)a5;
- (id).cxx_construct;
- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5;
- (void)prepare:(BOOL)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)resetState;
- (void)setAutomaticSkeletonScaleEstimationEnabled:(BOOL)a3;
@end

@implementation AR3DSkeletonRegistrationTechnique

- (void)prepare:(BOOL)a3
{
  if (!*(void *)&self->_btrts.__fill_)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F4A420]);
    v5 = *(void **)&self->_btrts.__fill_;
    *(void *)&self->_btrts.__fill_ = v4;
  }
  if (!self->_currentWorldTrackingPose)
  {
    v6 = (ARWorldTrackingPoseData *)objc_alloc_init(MEMORY[0x1E4F4A428]);
    currentWorldTrackingPose = self->_currentWorldTrackingPose;
    self->_currentWorldTrackingPose = v6;
  }
  [(AR3DSkeletonRegistrationTechnique *)self resetState];
}

- (void)resetState
{
  self->_is_tracking = 0;
  self->_last_btr_poses_idx = -1;
  _ZNSt3__115allocate_sharedB8ne180100IN5arkit3btr15ScaleCorrectionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v7);
  shared_ptr<arkit::btr::ScaleCorrection> v3 = v7;
  shared_ptr<arkit::btr::ScaleCorrection> v7 = (shared_ptr<arkit::btr::ScaleCorrection>)0;
  cntrl = self->_scaler.__cntrl_;
  self->_scaler = v3;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    if (v7.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v7.__cntrl_);
    }
  }
  for (uint64_t i = 488; i != 3008; i += 504)
  {
    v6 = (void *)((char *)&self->_last_btr_poses + i);
    void *v6 = 0;
    v6[1] = 0;
  }
  self->_estimatedScale = 1.0;
  [(ARWorldTrackingPoseData *)self->_currentWorldTrackingPose resetState];
}

- (id)processResultData:(id)a3 timestamp:(double)a4 context:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_99];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v8 = [v6 objectAtIndexedSubscript:v7];
  }
  tie = self->_btrts.__tie_;
  self->_btrts.__tie_ = v8;

  return v6;
}

uint64_t __73__AR3DSkeletonRegistrationTechnique_processResultData_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
  long long v34 = *MEMORY[0x1E4F149A0];
  long long v35 = v7;
  float32x4_t v8 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 48);
  long long v36 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
  float32x4_t v37 = v8;
  float v33 = -1.0;
  v9 = [v6 imageData];
  [v9 timestamp];
  kdebug_trace();

  v10 = [v6 resultDataOfClass:objc_opt_class()];
  v11 = [v10 firstObject];

  v12 = [v6 resultDataOfClass:objc_opt_class()];
  v13 = [v12 firstObject];

  v14 = [v11 detectedSkeletons];
  v15 = [v14 firstObject];
  LODWORD(v16) = 981668463;
  v17 = [v15 createResultScaledByFactor:v16];

  v18 = _ARLogGeneral();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138543618;
    v41 = v20;
    __int16 v42 = 2048;
    v43 = self;
    _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Estimating camera pose and scale", buf, 0x16u);
  }
  v21 = [v6 imageData];
  BOOL v22 = [(AR3DSkeletonRegistrationTechnique *)self _estimateCameraPoseFromMatchingImageData:v21 to3DData:v17 worldTrackingPose:self->_btrts.__tie_ pCameraFromBody:&v34 depthData:v13 pScaleOut:&v33];

  v23 = [v6 imageData];
  [v23 timestamp];
  kdebug_trace();

  v24 = _ARLogGeneral();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    *(_DWORD *)buf = 138543618;
    v41 = v26;
    __int16 v42 = 2048;
    v43 = self;
    _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Creating result", buf, 0x16u);
  }
  if (v22)
  {
    self->_last_detection_timestamp = a3;
    self->_is_tracking = 1;
    if (v33 > 0.0) {
      self->_estimatedScale = v33;
    }
    v27 = objc_opt_new();
    [v27 setTimestamp:a3];
    *(float *)&double v28 = self->_estimatedScale;
    [v27 setEstimatedScaleFactor:v28];
    float32x4_t v29 = vmulq_n_f32(v37, self->_estimatedScale);
    v29.i32[3] = 1.0;
    float32x4_t v37 = v29;
    objc_msgSend(v27, "setVisionTransform:", *(double *)&v34, *(double *)&v35, *(double *)&v36);
    v30 = [(ARTechnique *)self delegate];
    v39 = v27;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    [v30 technique:self didOutputResultData:v31 timestamp:v6 context:a3];
  }
  else
  {
    if (self->_is_tracking && a3 - self->_last_detection_timestamp > 1.0) {
      [(AR3DSkeletonRegistrationTechnique *)self resetState];
    }
    v27 = objc_opt_new();
    LODWORD(v32) = -1.0;
    [v27 setEstimatedScaleFactor:v32];
    [v27 setTimestamp:a3];
    v30 = [(ARTechnique *)self delegate];
    v38 = v27;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    [v30 technique:self didOutputResultData:v31 timestamp:v6 context:a3];
  }
}

- (BOOL)reconfigurableFrom:(id)a3
{
  return 0;
}

- (BOOL)_estimateCameraPoseFromMatchingImageData:(id)a3 to3DData:(id)a4 worldTrackingPose:(id)a5 pCameraFromBody:(id *)a6 depthData:(id)a7 pScaleOut:(float *)a8
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v13)
  {
    double v32 = _ARLogTechnique();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      float v33 = (objc_class *)objc_opt_class();
      long long v34 = NSStringFromClass(v33);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing image data.", buf, 0x16u);
    }
    goto LABEL_21;
  }
  if (!v14)
  {
    double v32 = _ARLogTechnique();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      long long v35 = (objc_class *)objc_opt_class();
      long long v36 = NSStringFromClass(v35);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing lifted data.", buf, 0x16u);
    }
    goto LABEL_21;
  }
  if (!v15)
  {
    double v32 = _ARLogTechnique();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      float32x4_t v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v38;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing currentWorldTrackingPose", buf, 0x16u);
    }
    goto LABEL_21;
  }
  if (self->_is_tracking
    || ([v15 worldTrackingState],
        v39 = objc_claimAutoreleasedReturnValue(),
        uint64_t v40 = [v39 vioTrackingState],
        v39,
        !v40))
  {
    long long v110 = 0u;
    long long v111 = 0u;
    long long v109 = 0u;
    [v13 cameraIntrinsics];
    DWORD2(v109) = v17;
    DWORD2(v110) = v18;
    *(void *)&long long v109 = v19;
    *(void *)&long long v110 = v20;
    DWORD2(v111) = v21;
    *(void *)&long long v111 = v22;
    v23 = [v14 skeletonDetectionResult2D];
    v24 = v23;
    if (v23)
    {
      v25 = [v23 liftingData];

      if (v25)
      {
        if (ARIsANEVersionEqualOrPriorToH12())
        {
          v100 = *(void **)&self->_btrts.__fill_;
          [v13 imageResolution];
          double v27 = v26;
          double v29 = v28;
          v30 = [v24 liftingData];
          v31 = objc_msgSend(v100, "estimateCameraPoseFromMatchingwithImageIntrinsics:imageResolution:joints2d:jointsLifted3D:jointsLifted3DCount:", objc_msgSend(v30, "rotatedJoints"), objc_msgSend(v14, "joints"), objc_msgSend(v14, "jointCount"), *(double *)&v109, *(double *)&v110, *(double *)&v111, v27, v29);
        }
        else
        {
          uint64_t v49 = [v24 jointCount];
          v101 = [v24 liftingData];
          v50 = (const void *)[v101 rotatedJoints];
          v51 = [v24 liftingData];
          uint64_t v52 = [v51 rotatedJoints];
          memset(buf, 0, 24);
          _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(buf, v50, v52 + 8 * v49, (v52 + 8 * v49 - (uint64_t)v50) >> 3);

          unint64_t v53 = 0;
          __asm { FMOV            V8.2S, #-1.0 }
          while ([v24 jointCount] > v53)
          {
            if (!*(_DWORD *)([v24 jointTrackingStates] + 4 * v53)) {
              *(void *)(*(void *)buf + 8 * v53) = _D8;
            }
            ++v53;
          }
          v59 = *(void **)&self->_btrts.__fill_;
          [v13 imageResolution];
          v31 = objc_msgSend(v59, "estimateCameraPoseFromMatchingwithImageIntrinsics:imageResolution:joints2d:jointsLifted3D:jointsLifted3DCount:", *(void *)buf, objc_msgSend(v14, "joints"), objc_msgSend(v14, "jointCount"), *(double *)&v109, *(double *)&v110, *(double *)&v111, v60, v61);
          if (*(void *)buf)
          {
            *(void *)&buf[8] = *(void *)buf;
            operator delete(*(void **)buf);
          }
        }
        if (v31 && [v31 registrationValid])
        {
          [v31 cameraFromBodyPose];
          *(_OWORD *)a6 = v62;
          *((_OWORD *)a6 + 1) = v63;
          *((_OWORD *)a6 + 2) = v64;
          *((_OWORD *)a6 + 3) = v65;
          if ([(AR3DSkeletonRegistrationTechnique *)self automaticSkeletonScaleEstimationEnabled])
          {
            v66 = [v15 worldTrackingState];
            BOOL v67 = [v66 vioTrackingState] == 0;

            if (v67)
            {
              self->_int last_btr_poses_idx = (self->_last_btr_poses_idx + 1) % 5;
              [v31 cameraFromBodyPose];
              *(_OWORD *)buf = v71;
              *(_OWORD *)&buf[16] = v72;
              long long v113 = v73;
              long long v114 = v74;
              int last_btr_poses_idx = self->_last_btr_poses_idx;
              [v13 timestamp];
              p_last_btr_poses = &self->_last_btr_poses;
              v76 = [v15 worldTrackingState];
              uint64_t v77 = [v76 state];

              BOOL v78 = [v15 worldMappingStatus] != 3 && objc_msgSend(v15, "worldMappingStatus") != 2;
              if (v77 == 2 || v78)
              {
                [v15 timestamp];
                uint64_t v80 = 0;
                while (1)
                {
                  uint64_t v81 = (uint64_t)p_last_btr_poses + v80 * 504;
                  if (vabdd_f64(p_last_btr_poses->__elems_[v80].timestamp_obj, v79) < 0.0085) {
                    break;
                  }
                  if (++v80 == 5) {
                    goto LABEL_62;
                  }
                }
                [v15 visionCameraTransform];
                uint64_t v82 = 0;
                v104[0] = v83;
                v104[1] = v84;
                v104[2] = v85;
                v104[3] = v86;
                long long v105 = xmmword_1B8A56900;
                long long v106 = unk_1B8A56910;
                long long v107 = xmmword_1B8A56920;
                long long v108 = unk_1B8A56930;
                v87 = &v105;
                do
                {
                  for (uint64_t i = 0; i != 4; ++i)
                    LODWORD(v87[i]) = *((_DWORD *)&v104[i] + (v82 & 3));
                  ++v82;
                  v87 = (long long *)((char *)v87 + 4);
                }
                while (v82 != 3);
                v89 = (char *)p_last_btr_poses + v80 * 504;
                long long v90 = v106;
                *(_OWORD *)(v89 + 420) = v105;
                *(_OWORD *)(v89 + 436) = v90;
                long long v91 = v108;
                *(_OWORD *)(v89 + 452) = v107;
                *(_OWORD *)(v89 + 468) = v91;
                [v15 timestamp];
                *((void *)v89 + 62) = v92;
                if (ARDeviceSupportsJasper())
                {
                  BOOL v93 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.bodytracking.useAppleDepthForScale"];
                  long long v94 = *(_OWORD *)a6;
                  long long v95 = *((_OWORD *)a6 + 1);
                  long long v96 = *((_OWORD *)a6 + 2);
                  long long v97 = *((_OWORD *)a6 + 3);
                  if (v93) {
                    -[AR3DSkeletonRegistrationTechnique _estimateScaleFromDepthData:imageData:cameraPoseFromBody:skeleton:](self, "_estimateScaleFromDepthData:imageData:cameraPoseFromBody:skeleton:", v16, v13, v14, *(double *)&v94, *(double *)&v95, *(double *)&v96, *(double *)&v97);
                  }
                  else {
                    -[AR3DSkeletonRegistrationTechnique _estimateScaleFromJasperCloud:cameraPoseFromBody:skeleton:](self, "_estimateScaleFromJasperCloud:cameraPoseFromBody:skeleton:", v13, v14, *(double *)&v94, *(double *)&v95, *(double *)&v96, *(double *)&v97);
                  }
                }
                else
                {
                  *(void *)&long long v105 = 13;
                  float v98 = arkit::btr::ScaleCorrection::EstimateScale((uint64_t)self->_scaler.__ptr_, v81, (float *)&v105);
                }
                *a8 = v98;
              }
            }
            else
            {
              v68 = _ARLogTechnique();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
              {
                v69 = (objc_class *)objc_opt_class();
                v70 = NSStringFromClass(v69);
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v70;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = self;
                _os_log_impl(&dword_1B88A2000, v68, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Scale estimation skip (tracking not nominal", buf, 0x16u);
              }
            }
          }
LABEL_62:
          BOOL v43 = 1;
          goto LABEL_42;
        }
      }
      else
      {
        v31 = _ARLogTechnique();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v47 = (objc_class *)objc_opt_class();
          v48 = NSStringFromClass(v47);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v48;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = self;
          _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing lifting data", buf, 0x16u);
        }
      }
    }
    else
    {
      v31 = _ARLogTechnique();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v45 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v45);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v46;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Missing 2D joints", buf, 0x16u);
      }
    }
    BOOL v43 = 0;
LABEL_42:

    goto LABEL_22;
  }
  double v32 = _ARLogTechnique();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v41 = (objc_class *)objc_opt_class();
    __int16 v42 = NSStringFromClass(v41);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v42;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Tracking state not nominal", buf, 0x16u);
  }
LABEL_21:

  BOOL v43 = 0;
LABEL_22:

  return v43;
}

- (float)_estimateScaleFromDepthData:(__n128)a3 imageData:(__n128)a4 cameraPoseFromBody:(__n128)a5 skeleton:(uint64_t)a6
{
  id v12 = a7;
  id v13 = a8;
  id v14 = a9;
  float v15 = 1.0;
  if ([a1 automaticSkeletonScaleEstimationEnabled])
  {
    float v15 = -1.0;
    if (v12)
    {
      uint64_t v16 = [v12 depthBuffer];
      if (v14)
      {
        if (v13 && v16)
        {
          id v17 = objc_alloc(MEMORY[0x1E4F4A418]);
          uint64_t v18 = [v14 joints];
          uint64_t v19 = [v14 jointCount];
          uint64_t v20 = [v14 skeletonDetectionResult2D];
          int v21 = (void *)[v17 initWithJoints:v18 numberOfJoints:v19 referenceDetectionResult:v20];

          uint64_t v22 = (void *)a1[474];
          uint64_t v23 = [v12 depthBuffer];
          uint64_t v24 = [v12 confidenceBuffer];
          [v13 timestamp];
          double v26 = v25;
          [v13 imageResolution];
          double v28 = v27;
          double v30 = v29;
          [v13 cameraIntrinsics];
          objc_msgSend(v22, "estimateScaleFromDepthData:depthConfidenceData:timestamp:imageResolution:imageIntrinsics:cameraFromBodyPose:liftingResult:", v23, v24, v21, v26, v28, v30, v31, v32, v33, *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5);
          float v15 = v34;
        }
      }
    }
  }

  return v15;
}

- (float)_estimateScaleFromJasperCloud:(double)a3 cameraPoseFromBody:(double)a4 skeleton:(double)a5
{
  id v10 = a7;
  id v11 = a8;
  float v12 = -1.0;
  if (v10)
  {
    id v13 = [v10 pointCloud];
    if (v13)
    {
      id v14 = [v10 pointCloud];
      float v15 = [v14 depthPointCloud];

      if (v11)
      {
        if (v15)
        {
          id v16 = objc_alloc(MEMORY[0x1E4F4A418]);
          uint64_t v17 = [v11 joints];
          uint64_t v18 = [v11 jointCount];
          uint64_t v19 = [v11 skeletonDetectionResult2D];
          uint64_t v20 = (void *)[v16 initWithJoints:v17 numberOfJoints:v18 referenceDetectionResult:v19];

          int v21 = *(void **)(a1 + 3792);
          uint64_t v22 = [v10 pointCloud];
          uint64_t v23 = [v22 depthPointCloud];
          objc_msgSend(v21, "estimateScaleFromJasperCloud:cameraFromBodyPose:liftingResult:", v23, v20, a2, a3, a4, a5);
          float v12 = v24;
        }
      }
    }
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AR3DSkeletonRegistrationTechnique;
  if ([(ARTechnique *)&v9 isEqual:v4])
  {
    id v5 = v4;
    BOOL v6 = [(AR3DSkeletonRegistrationTechnique *)self automaticSkeletonScaleEstimationEnabled];
    int v7 = v6 ^ [v5 automaticSkeletonScaleEstimationEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)automaticSkeletonScaleEstimationEnabled
{
  return (BOOL)self->_abpkRegistration;
}

- (void)setAutomaticSkeletonScaleEstimationEnabled:(BOOL)a3
{
  LOBYTE(self->_abpkRegistration) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentWorldTrackingPose, 0);
  objc_storeStrong((id *)&self->_btrts.__fill_, 0);
  objc_storeStrong(&self->_btrts.__tie_, 0);
  uint64_t v3 = MEMORY[0x1E4FBA400];
  uint64_t v4 = *MEMORY[0x1E4FBA400];
  self->_btrf.__tie_ = (void *)*MEMORY[0x1E4FBA400];
  id v5 = *(void **)(v3 + 24);
  *(void **)((char *)&self->_btrf.__tie_ + *(void *)(v4 - 24)) = v5;
  MEMORY[0x1BA9C54E0](&self->_btrf.__fill_);
  std::ostream::~ostream();
  MEMORY[0x1BA9C5670](&self->_btrts.__sb_.__om_);
  *(void *)&self->_dumps_dir.__r_.var0 = v4;
  *(void *)((char *)&self->_dumps_dir.__r_.var0 + *(void *)(v4 - 24)) = v5;
  MEMORY[0x1BA9C54E0](&self->_dumps_dir.var0);
  std::ostream::~ostream();
  MEMORY[0x1BA9C5670](&self->_btrf.__sb_.__om_);
  if (*((char *)&self->_dumps_dir.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_dumps_dir.__r_.__value_.var0.__l.__data_);
  }
  cntrl = self->_scaler.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  uint64_t v3 = 0;
  self->_scaler.__ptr_ = 0;
  self->_scaler.__cntrl_ = 0;
  p_last_btr_poses = &self->_last_btr_poses;
  do
  {
    id v5 = (char *)p_last_btr_poses + v3 * 504;
    *((_DWORD *)v5 + 88) = 0;
    m_data = (_OWORD *)p_last_btr_poses->__elems_[v3].cam_from_obj.m_data;
    *((_OWORD *)v5 + 20) = 0uLL;
    *((_OWORD *)v5 + 21) = 0uLL;
    *((_OWORD *)v5 + 18) = 0uLL;
    *((_OWORD *)v5 + 19) = 0uLL;
    *((_OWORD *)v5 + 16) = 0uLL;
    *((_OWORD *)v5 + 17) = 0uLL;
    *((_OWORD *)v5 + 14) = 0uLL;
    *((_OWORD *)v5 + 15) = 0uLL;
    *((_OWORD *)v5 + 12) = 0uLL;
    *((_OWORD *)v5 + 13) = 0uLL;
    *((_OWORD *)v5 + 10) = 0uLL;
    *((_OWORD *)v5 + 11) = 0uLL;
    *((_OWORD *)v5 + 8) = 0uLL;
    *((_OWORD *)v5 + 9) = 0uLL;
    *((_OWORD *)v5 + 6) = 0uLL;
    *((_OWORD *)v5 + 7) = 0uLL;
    *((_OWORD *)v5 + 4) = 0uLL;
    *((_OWORD *)v5 + 5) = 0uLL;
    *((_OWORD *)v5 + 2) = 0uLL;
    *((_OWORD *)v5 + 3) = 0uLL;
    *(_OWORD *)id v5 = 0uLL;
    *((_OWORD *)v5 + 1) = 0uLL;
    _OWORD *m_data = xmmword_1B8A56900;
    m_data[1] = unk_1B8A56910;
    m_data[2] = xmmword_1B8A56920;
    m_data[3] = unk_1B8A56930;
    int v7 = (_OWORD *)p_last_btr_poses->__elems_[v3].cam_from_vio.m_data;
    *int v7 = xmmword_1B8A56900;
    v7[1] = unk_1B8A56910;
    v7[2] = xmmword_1B8A56920;
    v7[3] = unk_1B8A56930;
    ++v3;
    *((void *)v5 + 61) = 0;
    *((void *)v5 + 62) = 0;
  }
  while (v3 != 5);
  *(_OWORD *)&self->_dumps_dir.__r_.__value_.var0.__l.__size_ = 0uLL;
  self->_dumps_dir.__r_.__value_.var0.__l.__data_ = 0;
  p_var0 = &self->_dumps_dir.__r_.var0;
  uint64_t v9 = MEMORY[0x1E4FBA468] + 64;
  *(void *)&self->_btrf.__sb_.__om_ = MEMORY[0x1E4FBA468] + 64;
  id v10 = *(void **)(MEMORY[0x1E4FBA400] + 16);
  id v11 = *(void **)(MEMORY[0x1E4FBA400] + 8);
  *(void *)&self->_dumps_dir.__r_.var0 = v11;
  float v12 = v10;
  *(void *)((char *)p_var0 + *(v11 - 3)) = v10;
  id v13 = (std::ios_base *)((char *)p_var0 + *(void *)(*(void *)p_var0 - 24));
  std::ios_base::init(v13, &self->_dumps_dir.var0);
  uint64_t v14 = MEMORY[0x1E4FBA468] + 24;
  v13[1].__vftable = 0;
  v13[1].__fmtflags_ = -1;
  *(void *)p_var0 = v14;
  *(void *)&self->_btrf.__sb_.__om_ = v9;
  MEMORY[0x1BA9C54D0](&self->_dumps_dir.var0);
  uint64_t v15 = MEMORY[0x1E4FBA468] + 64;
  *(void *)&self->_btrts.__sb_.__om_ = MEMORY[0x1E4FBA468] + 64;
  self->_btrf.__tie_ = v11;
  *(void **)((char *)&self->_btrf.__tie_ + *(v11 - 3)) = v12;
  id v16 = (std::ios_base *)((char *)&self->_btrf.__tie_ + *((void *)self->_btrf.__tie_ - 3));
  std::ios_base::init(v16, &self->_btrf.__fill_);
  uint64_t v17 = (void *)(MEMORY[0x1E4FBA468] + 24);
  v16[1].__vftable = 0;
  v16[1].__fmtflags_ = -1;
  self->_btrf.__tie_ = v17;
  *(void *)&self->_btrts.__sb_.__om_ = v15;
  MEMORY[0x1BA9C54D0](&self->_btrf.__fill_);
  return self;
}

@end