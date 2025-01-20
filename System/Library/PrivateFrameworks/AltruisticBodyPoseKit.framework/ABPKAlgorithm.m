@interface ABPKAlgorithm
- (ABPKAlgorithm)initWithParams:(id)a3;
- (int)runWithInput:(id)a3 andGetOutput:(id)a4;
- (void)_endABPKRunWithInputSignpostWithTimestamp:(double)a3;
- (void)_endInitABPKSignpost;
- (void)_endRetargettingSignpostWithTimestamp:(double)a3;
- (void)_endScaleEstimationSignpostWithTimestamp:(double)a3;
- (void)_startABPKRunWithInputSignpostWithTimestamp:(double)a3;
- (void)_startInitABPKSignpost;
- (void)_startRetargettingSignpostWithTimestamp:(double)a3;
- (void)_startScaleEstimationSignpostWithTimestamp:(double)a3;
- (void)setExitPoint:(int64_t)a3;
@end

@implementation ABPKAlgorithm

- (ABPKAlgorithm)initWithParams:(id)a3
{
  id v5 = a3;
  [(ABPKAlgorithm *)self _startInitABPKSignpost];
  v24.receiver = self;
  v24.super_class = (Class)ABPKAlgorithm;
  v6 = [(ABPKAlgorithm *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_algParams, a3);
    v8 = [v5 config2DDetection];
    v9 = [[ABPK2DPoseEstimation alloc] initWith2DDetectionConfig:v8 use3DSkeletonForExtrapolation:0 shouldPush3DSupportSkeleton:0];
    poseEstimation2D = v7->_poseEstimation2D;
    v7->_poseEstimation2D = v9;

    if (v7->_poseEstimation2D)
    {
      v11 = objc_alloc_init(ABPK3DLifting);
      liftingAlgorithm = v7->_liftingAlgorithm;
      v7->_liftingAlgorithm = v11;

      if (v7->_liftingAlgorithm)
      {
        v13 = objc_alloc_init(ABPKCameraRegistration);
        bodyRegistration = v7->_bodyRegistration;
        v7->_bodyRegistration = v13;

        if (v7->_bodyRegistration)
        {
          v15 = objc_alloc_init(ABPKDepthBasedScaleEstimation);
          scaleEstimation = v7->_scaleEstimation;
          v7->_scaleEstimation = v15;

          if (v7->_scaleEstimation)
          {
            v17 = objc_alloc_init(ABPKRetargeting);
            retargeting = v7->_retargeting;
            v7->_retargeting = v17;

            if (v7->_retargeting)
            {
              v7->_previousValidScale = -1.0;
              [(ABPKAlgorithm *)v7 _endInitABPKSignpost];
              v19 = v7;
LABEL_21:

              goto LABEL_22;
            }
            v20 = __ABPKLogSharedInstance();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v23[0] = 0;
              v21 = " Failed to initialize the retargeting module. ";
              goto LABEL_19;
            }
LABEL_20:

            v19 = 0;
            goto LABEL_21;
          }
          v20 = __ABPKLogSharedInstance();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          v23[0] = 0;
          v21 = " Failed to initialize the Depth-based scale estimation module. ";
        }
        else
        {
          v20 = __ABPKLogSharedInstance();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          v23[0] = 0;
          v21 = " Failed to initialize the Body-Camera registration module. ";
        }
      }
      else
      {
        v20 = __ABPKLogSharedInstance();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        v23[0] = 0;
        v21 = " Failed to initialize the 3D lifting algorithm. ";
      }
    }
    else
    {
      v20 = __ABPKLogSharedInstance();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      v23[0] = 0;
      v21 = " Failed to initialize 2D Pose Estimation Algorithm. ";
    }
LABEL_19:
    _os_log_impl(&dword_21B7C6000, v20, OS_LOG_TYPE_ERROR, v21, (uint8_t *)v23, 2u);
    goto LABEL_20;
  }
  v19 = 0;
LABEL_22:

  return v19;
}

- (void)setExitPoint:(int64_t)a3
{
  self->_exitPoint = a3;
}

- (int)runWithInput:(id)a3 andGetOutput:(id)a4
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v110 = a4;
  [v6 timestamp];
  -[ABPKAlgorithm _startABPKRunWithInputSignpostWithTimestamp:](self, "_startABPKRunWithInputSignpostWithTimestamp:");
  v7 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_DEBUG, " Running 2d pose estimation ", (uint8_t *)&buf, 2u);
  }

  v8 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21B7C6000, v8, OS_LOG_TYPE_DEBUG, " \t Running the ML model ", (uint8_t *)&buf, 2u);
  }

  v9 = [ABPKMLImageData alloc];
  uint64_t v10 = [v6 image];
  [v6 timestamp];
  double v12 = v11;
  v13 = [v6 imagePreProcessingParams];
  v109 = [(ABPKMLImageData *)v9 initWithPixelBuffer:v10 timestamp:3 abpkDeviceOrientation:v13 preprocessingParameters:v12];

  if ([(ABPK2DPoseEstimation *)self->_poseEstimation2D runWithMLImageData:v109 rotationOfResultTensor:0] != -6661)
  {
    poseEstimation2D = self->_poseEstimation2D;
    v17 = [v110 rawDetection2dSkeletonABPK];
    [(ABPK2DPoseEstimation *)poseEstimation2D getRawTrackedHumanSkeleton:v17];

    v18 = self->_poseEstimation2D;
    v19 = [v110 rawDetection2dSkeletonABPKArray];
    [(ABPK2DPoseEstimation *)v18 getRawTrackedHumanSkeletonVector:v19];

    v20 = self->_poseEstimation2D;
    v21 = [v110 detection2dSkeletonABPK];
    [(ABPK2DPoseEstimation *)v20 getTrackedHumanSkeleton:v21];

    v14 = [[ABPK2dSkeleton alloc] initWithType:1];
    [(ABPK2DPoseEstimation *)self->_poseEstimation2D getTrackedHumanForLiftingSkeleton:v14];
    v22 = [v110 algState];
    [v22 setDetection2d:1];

    if ([(ABPK2dSkeleton *)v14 missingJoints])
    {
      v23 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21B7C6000, v23, OS_LOG_TYPE_DEBUG, " \t\t Extrapolation for missing joints failed. Cannot run lifting network. ", (uint8_t *)&buf, 2u);
      }
      int v15 = -6667;
      goto LABEL_36;
    }
    if (self->_exitPoint == 2)
    {
      v23 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21B7C6000, v23, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPoint2DDetectionPostProcessing ", (uint8_t *)&buf, 2u);
      }
      int v15 = 0;
      goto LABEL_36;
    }
    objc_super v24 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21B7C6000, v24, OS_LOG_TYPE_DEBUG, " Performing 2d-3d lifting ", (uint8_t *)&buf, 2u);
    }

    v25 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21B7C6000, v25, OS_LOG_TYPE_DEBUG, " \t Pre-processing data ", (uint8_t *)&buf, 2u);
    }

    v26 = [ABPK2D3DLiftingData alloc];
    uint64_t v27 = [(ABPK2dSkeleton *)v14 normalizedKeypoints2d];
    v28 = [(ABPK2dSkeleton *)v14 skeletonDefinition];
    uint64_t v108 = -[ABPK2D3DLiftingData initWithJoints:numberOfJoints:](v26, "initWithJoints:numberOfJoints:", v27, [v28 jointCount]);

    v29 = [ABPK2DDetectionResult alloc];
    v30 = [v110 detection2dSkeletonABPK];
    uint64_t v31 = [v30 normalizedKeypoints2d];
    v32 = [v110 detection2dSkeletonABPK];
    uint64_t v33 = [v32 visibility];
    v34 = [v110 detection2dSkeletonABPK];
    v35 = [v34 skeletonDefinition];
    v36 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v29, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v31, v33, [v35 jointCount], 0, v108, 0.0, 0.0, 1.0, 1.0);

    if (!v108)
    {
      v39 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        v40 = " Exiting from point: kABPKAlgorithmExitPoint3DLiftingPreprocessing ";
LABEL_33:
        _os_log_impl(&dword_21B7C6000, v39, OS_LOG_TYPE_DEBUG, v40, (uint8_t *)&buf, 2u);
      }
LABEL_34:
      int v15 = 0;
      goto LABEL_35;
    }
    v37 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21B7C6000, v37, OS_LOG_TYPE_DEBUG, " \t Running the lifting model ", (uint8_t *)&buf, 2u);
    }

    liftingAlgorithm = self->_liftingAlgorithm;
    [v6 timestamp];
    if (-[ABPK3DLifting runLiftingModelWithData:atTimestamp:](liftingAlgorithm, "runLiftingModelWithData:atTimestamp:", v36))
    {
      v39 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21B7C6000, v39, OS_LOG_TYPE_DEBUG, " \t\t Failed to run Lifting ML model ", (uint8_t *)&buf, 2u);
      }
LABEL_27:
      int v15 = -6662;
LABEL_35:

      v23 = v108;
LABEL_36:

      goto LABEL_37;
    }
    if (self->_exitPoint == 4)
    {
      v39 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        v40 = " Exiting from point: kABPKAlgorithmExitPoint3DLiftingModelOutput ";
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    v42 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21B7C6000, v42, OS_LOG_TYPE_DEBUG, " \t Post-processing output ", (uint8_t *)&buf, 2u);
    }

    v39 = [(ABPK3DLifting *)self->_liftingAlgorithm getLiftingResults];
    if (!v39) {
      goto LABEL_27;
    }
    v43 = [v110 algState];
    [v43 setLifting3d:1];

    v44 = [(ABPK3DLifting *)self->_liftingAlgorithm get3DLiftingResultsAsModelPoses];
    v45 = [v110 liftingSkeletonABPK];
    [v45 setModelPoses:v44 andUpdateLocalPoses:1];

    if (self->_exitPoint == 5)
    {
      v46 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21B7C6000, v46, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPoint3DLiftingPostProcessing ", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      v47 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_21B7C6000, v47, OS_LOG_TYPE_DEBUG, " Performing camera registration ", (uint8_t *)&buf, 2u);
      }

      bodyRegistration = self->_bodyRegistration;
      [v6 imageCameraIntrinsics];
      double v104 = v50;
      double v106 = v49;
      double v102 = v51;
      [v6 imageResolution];
      v46 = -[ABPKCameraRegistration runCameraRegistrationWithImageIntrinsics:imageResolution:liftingResult:](bodyRegistration, "runCameraRegistrationWithImageIntrinsics:imageResolution:liftingResult:", v39, v106, v104, v102, v52, v53);
      if (([v46 success] & 1) == 0)
      {
        int v15 = -6664;
LABEL_70:

        goto LABEL_35;
      }
      v54 = [v110 algState];
      [v54 setRegistration:1];

      v55 = [v110 liftingSkeletonABPK];
      [v46 cameraFromBodyPose];
      objc_msgSend(v55, "setCameraRootTransform:");

      v56 = [v110 registered2dSkeletonABPK];
      uint64_t v57 = [v46 joints2d];
      [(ABPKAlgorithmParams *)self->_algParams regImageResolution];
      objc_msgSend(v56, "setKeypoints2d:withImageRes:", v57);

      if (self->_exitPoint == 6)
      {
        v58 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_21B7C6000, v58, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPointCameraRegistration ", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        [v6 timestamp];
        -[ABPKAlgorithm _startScaleEstimationSignpostWithTimestamp:](self, "_startScaleEstimationSignpostWithTimestamp:");
        if (![v6 isDepthDataValid]) {
          goto LABEL_55;
        }
        if (![v6 depthMap]) {
          goto LABEL_55;
        }
        if (![v6 depthConfidenceBuffer]) {
          goto LABEL_55;
        }
        scaleEstimation = self->_scaleEstimation;
        uint64_t v60 = [v6 depthMap];
        uint64_t v61 = [v6 depthConfidenceBuffer];
        [v6 timestamp];
        double v63 = v62;
        [v6 imageResolution];
        double v65 = v64;
        double v67 = v66;
        [v6 imageCameraIntrinsics];
        double v105 = v69;
        double v107 = v68;
        double v103 = v70;
        [v46 cameraFromBodyPose];
        -[ABPKDepthBasedScaleEstimation estimateScaleFromDepthData:depthConfidenceData:timestamp:imageResolution:imageIntrinsics:cameraFromBodyPose:liftingResult:](scaleEstimation, "estimateScaleFromDepthData:depthConfidenceData:timestamp:imageResolution:imageIntrinsics:cameraFromBodyPose:liftingResult:", v60, v61, v39, v63, v65, v67, v107, v105, v103, v71, v72, v73, v74, v75, v76, v77, v78);
        float previousValidScale = v79;
        if (v79 != -1.0) {
          self->_float previousValidScale = v79;
        }
        else {
LABEL_55:
        }
          float previousValidScale = self->_previousValidScale;
        v81 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 134217984;
          *(double *)((char *)&buf + 4) = previousValidScale;
          _os_log_impl(&dword_21B7C6000, v81, OS_LOG_TYPE_DEBUG, " Estimated Scale: %f ", (uint8_t *)&buf, 0xCu);
        }

        *(float *)&double v82 = previousValidScale;
        [v39 setEstimatedScale:v82];
        v83 = [v110 liftingSkeletonABPK];
        *(float *)&double v84 = previousValidScale;
        [v83 setEstimatedScale:v84];

        [v6 timestamp];
        -[ABPKAlgorithm _endScaleEstimationSignpostWithTimestamp:](self, "_endScaleEstimationSignpostWithTimestamp:");
        v85 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_21B7C6000, v85, OS_LOG_TYPE_DEBUG, " Performing retargeting ", (uint8_t *)&buf, 2u);
        }

        [v6 timestamp];
        -[ABPKAlgorithm _startRetargettingSignpostWithTimestamp:](self, "_startRetargettingSignpostWithTimestamp:");
        v58 = [(ABPKRetargeting *)self->_retargeting processData:v39];
        v86 = [v110 algState];
        [v86 setRetargeting:1];

        v87 = (const void *)[v58 jointModelTransforms];
        uint64_t v88 = [v58 jointModelTransforms];
        uint64_t v89 = [v58 jointTransformCount];
        long long buf = 0uLL;
        uint64_t v117 = 0;
        std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(&buf, v87, v88 + (v89 << 6), (v88 + (v89 << 6) - (uint64_t)v87) >> 6);
        v90 = (const void *)[v58 jointLocalTransforms];
        uint64_t v91 = [v58 jointLocalTransforms];
        uint64_t v92 = [v58 jointTransformCount];
        __p = 0;
        v112 = 0;
        uint64_t v113 = 0;
        std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(&__p, v90, v91 + (v92 << 6), (v91 + (v92 << 6) - (uint64_t)v90) >> 6);
        v93 = [v110 retargetedSkeletonABPK];
        [v93 setModelPoses:(void)buf andUpdateLocalPoses:0];

        v94 = [v110 retargetedSkeletonABPK];
        [v46 cameraFromBodyPose];
        objc_msgSend(v94, "setCameraRootTransform:");

        v95 = [v110 retargetedSkeletonABPK];
        *(float *)&double v96 = previousValidScale;
        [v95 setEstimatedScale:v96];

        [v6 timestamp];
        -[ABPKAlgorithm _endRetargettingSignpostWithTimestamp:](self, "_endRetargettingSignpostWithTimestamp:");
        v97 = [v110 retargetedSkeletonABPK];
        [v97 computeHeight];
        float v99 = v98;

        v100 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v114 = 134217984;
          double v115 = v99;
          _os_log_impl(&dword_21B7C6000, v100, OS_LOG_TYPE_DEBUG, " skeletonHeight: %f ", v114, 0xCu);
        }

        v101 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v114 = 134217984;
          double v115 = previousValidScale;
          _os_log_impl(&dword_21B7C6000, v101, OS_LOG_TYPE_DEBUG, " Estimated Scale: %f ", v114, 0xCu);
        }

        [v6 timestamp];
        -[ABPKAlgorithm _endABPKRunWithInputSignpostWithTimestamp:](self, "_endABPKRunWithInputSignpostWithTimestamp:");
        if (__p)
        {
          v112 = __p;
          operator delete(__p);
        }
        if ((void)buf)
        {
          *((void *)&buf + 1) = buf;
          operator delete((void *)buf);
        }
      }
    }
    int v15 = 0;
    goto LABEL_70;
  }
  __ABPKLogSharedInstance();
  v14 = (ABPK2dSkeleton *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21B7C6000, &v14->super, OS_LOG_TYPE_ERROR, " 2D Pose estimation failed. ", (uint8_t *)&buf, 2u);
  }
  int v15 = -6661;
LABEL_37:

  return v15;
}

- (void)_startInitABPKSignpost
{
}

- (void)_endInitABPKSignpost
{
}

- (void)_startABPKRunWithInputSignpostWithTimestamp:(double)a3
{
}

- (void)_endABPKRunWithInputSignpostWithTimestamp:(double)a3
{
}

- (void)_startScaleEstimationSignpostWithTimestamp:(double)a3
{
}

- (void)_endScaleEstimationSignpostWithTimestamp:(double)a3
{
}

- (void)_startRetargettingSignpostWithTimestamp:(double)a3
{
}

- (void)_endRetargettingSignpostWithTimestamp:(double)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retargeting, 0);
  objc_storeStrong((id *)&self->_scaleEstimation, 0);
  objc_storeStrong((id *)&self->_bodyRegistration, 0);
  objc_storeStrong((id *)&self->_liftingAlgorithm, 0);
  objc_storeStrong((id *)&self->_postprocess2d, 0);
  objc_storeStrong((id *)&self->_poseEstimation2D, 0);
  objc_storeStrong((id *)&self->_algParams, 0);
}

@end