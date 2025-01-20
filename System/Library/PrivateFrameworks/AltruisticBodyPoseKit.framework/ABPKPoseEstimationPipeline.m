@interface ABPKPoseEstimationPipeline
- (ABPKPoseEstimationPipeline)init;
- (BOOL)initAlgorithmModules;
- (int)runABPKPoseEstimationWithInputData:(id)a3 andGetOutput:(id)a4;
- (void)_endExecuteAlgorithmSignpost;
- (void)_endImagePreprocessingSignpost;
- (void)_endInitABPKOutputSignpost;
- (void)_endInitABPKSignpost;
- (void)_endRetargettingSignpostWithTimestamp:(double)a3;
- (void)_endScaleEstimationSignpostWithTimestamp:(double)a3;
- (void)_startExecuteAlgorithmSignpost;
- (void)_startImagePreprocessingSignpost;
- (void)_startInitABPKOutputSignpost;
- (void)_startInitABPKSignpost;
- (void)_startRetargettingSignpostWithTimestamp:(double)a3;
- (void)_startScaleEstimationSignpostWithTimestamp:(double)a3;
- (void)computeRootTransforms:(float32x4_t)a3 withCameraExtrinsics:(float32x4_t)a4 withVioPose:(uint64_t)a5 withVioPoseValidity:(uint64_t)a6;
- (void)dealloc;
- (void)initializeOutput;
- (void)runABPKAlgorithmWithInputData:(id)a3 andGetOutput:(id)a4;
- (void)saveInputData:(id)a3 andOutputData:(id)a4 ToDir:(id)a5 withFileNamePrefix:(id)a6;
- (void)setExitPoint:(int64_t)a3;
@end

@implementation ABPKPoseEstimationPipeline

- (ABPKPoseEstimationPipeline)init
{
  v11.receiver = self;
  v11.super_class = (Class)ABPKPoseEstimationPipeline;
  v2 = [(ABPKPoseEstimationPipeline *)&v11 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_11;
  }
  v2->_exitPoint = 7;
  v4 = [[ABPK2DDetectionConfiguration alloc] initWithAlgorithmMode:1];
  config2D = v3->_config2D;
  v3->_config2D = v4;

  if (!v3->_config2D)
  {
    v7 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 0;
      v8 = " Failed to initialize config for 2D Detection module ";
LABEL_9:
      _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v10, 2u);
    }
LABEL_10:

LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  v3->_deviceANEVersionPriorOrEqualToH12 = determineDeviceANEVersionPriorOrEqualToH12();
  v3->_useLSTM3D = 1;
  if (![(ABPKPoseEstimationPipeline *)v3 initAlgorithmModules])
  {
    v7 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 0;
      v8 = " Failed to initialize algorithm modules ";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  [(ABPKPoseEstimationPipeline *)v3 initializeOutput];
  v3->_previousValidScale = -1.0;
  v3->_consistent2DSkeletonMissing = 0;
  v6 = v3;
LABEL_12:

  return v6;
}

- (BOOL)initAlgorithmModules
{
  [(ABPKPoseEstimationPipeline *)self _startInitABPKSignpost];
  v3 = [[ABPK2DPoseEstimation alloc] initWith2DDetectionConfig:self->_config2D use3DSkeletonForExtrapolation:0 shouldPush3DSupportSkeleton:0];
  poseEstimation2D = self->_poseEstimation2D;
  self->_poseEstimation2D = v3;

  if (self->_poseEstimation2D)
  {
    if (self->_deviceANEVersionPriorOrEqualToH12)
    {
      v5 = objc_alloc_init(ABPK3DLifting);
      liftingAlgorithm = self->_liftingAlgorithm;
      self->_liftingAlgorithm = v5;

      if (!self->_liftingAlgorithm)
      {
        v7 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          __int16 v26 = 0;
          v8 = " Failed to initialize the 3D lifting algorithm. ";
          v9 = (uint8_t *)&v26;
LABEL_25:
          _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
    }
    else if (self->_useLSTM3D)
    {
      v10 = objc_alloc_init(ABPK3DLiftingLSTM);
      liftingAlgorithmLSTM = self->_liftingAlgorithmLSTM;
      self->_liftingAlgorithmLSTM = v10;

      if (!self->_liftingAlgorithmLSTM)
      {
        v7 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          __int16 v25 = 0;
          v8 = " Failed to initialize the new 3D lifting LSTM algorithm. ";
          v9 = (uint8_t *)&v25;
          goto LABEL_25;
        }
        goto LABEL_26;
      }
    }
    else
    {
      v12 = objc_alloc_init(ABPK3DLiftingSequence);
      liftingAlgorithmSequence = self->_liftingAlgorithmSequence;
      self->_liftingAlgorithmSequence = v12;

      if (!self->_liftingAlgorithmSequence)
      {
        v7 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v8 = " Failed to initialize the new 3D lifting sequence algorithm. ";
          v9 = buf;
          goto LABEL_25;
        }
        goto LABEL_26;
      }
    }
    v14 = objc_alloc_init(ABPKCameraRegistration);
    bodyRegistration = self->_bodyRegistration;
    self->_bodyRegistration = v14;

    if (self->_bodyRegistration)
    {
      v16 = objc_alloc_init(ABPKDepthBasedScaleEstimation);
      scaleEstimation = self->_scaleEstimation;
      self->_scaleEstimation = v16;

      if (self->_scaleEstimation)
      {
        v18 = objc_alloc_init(ABPKRetargeting);
        retargeting = self->_retargeting;
        self->_retargeting = v18;

        if (self->_retargeting)
        {
          [(ABPKPoseEstimationPipeline *)self _endInitABPKSignpost];
          return 1;
        }
        v7 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          __int16 v21 = 0;
          v8 = " Failed to initialize the retargeting module. ";
          v9 = (uint8_t *)&v21;
          goto LABEL_25;
        }
      }
      else
      {
        v7 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          __int16 v22 = 0;
          v8 = " Failed to initialize the Depth-based scale estimation module. ";
          v9 = (uint8_t *)&v22;
          goto LABEL_25;
        }
      }
    }
    else
    {
      v7 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = 0;
        v8 = " Failed to initialize the Body-Camera registration module. ";
        v9 = (uint8_t *)&v23;
        goto LABEL_25;
      }
    }
    goto LABEL_26;
  }
  v7 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __int16 v27 = 0;
    v8 = " Failed to initialize 2D Pose Estimation Algorithm. ";
    v9 = (uint8_t *)&v27;
    goto LABEL_25;
  }
LABEL_26:

  return 0;
}

- (void)initializeOutput
{
  [(ABPKPoseEstimationPipeline *)self _startInitABPKOutputSignpost];
  v3 = [[ABPK2dSkeleton alloc] initWithType:0];
  rawDetection2dSkeleton = self->_rawDetection2dSkeleton;
  self->_rawDetection2dSkeleton = v3;

  v5 = [[ABPK2dSkeleton alloc] initWithType:0];
  detection2dSkeleton = self->_detection2dSkeleton;
  self->_detection2dSkeleton = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  rawDetection2dSkeletonArray = self->_rawDetection2dSkeletonArray;
  self->_rawDetection2dSkeletonArray = v7;

  v9 = [[ABPKSkeleton alloc] initWithType:3];
  liftingSkeleton = self->_liftingSkeleton;
  self->_liftingSkeleton = v9;

  objc_super v11 = [[ABPK2dSkeleton alloc] initWithType:2];
  registered2dSkeleton = self->_registered2dSkeleton;
  self->_registered2dSkeleton = v11;

  v13 = [[ABPKSkeleton alloc] initWithType:4];
  retargetedSkeleton = self->_retargetedSkeleton;
  self->_retargetedSkeleton = v13;

  [(ABPKPoseEstimationPipeline *)self _endInitABPKOutputSignpost];
}

- (void)dealloc
{
  mlImage = self->_mlImage;
  if (mlImage) {
    CVPixelBufferRelease(mlImage);
  }
  v4.receiver = self;
  v4.super_class = (Class)ABPKPoseEstimationPipeline;
  [(ABPKPoseEstimationPipeline *)&v4 dealloc];
}

- (void)setExitPoint:(int64_t)a3
{
  self->_exitPoint = a3;
}

- (void)runABPKAlgorithmWithInputData:(id)a3 andGetOutput:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  [(ABPKPoseEstimationPipeline *)self _startExecuteAlgorithmSignpost];
  +[ABPKTime nowInSeconds];
  *(float *)&double v7 = v7;
  [v6 setTimeABPKAlgorithmStart:v7];
  v8 = objc_alloc_init(ABPKAlgorithmState);
  [v6 setAlgState:v8];

  [v23 timestamp];
  objc_msgSend(v6, "setTimestamp:");
  objc_msgSend(v6, "setAlgorithmReturnCode:", -[ABPKPoseEstimationPipeline runABPKPoseEstimationWithInputData:andGetOutput:](self, "runABPKPoseEstimationWithInputData:andGetOutput:", v23, v6));
  [v6 setRawDetection2dSkeletonABPK:self->_rawDetection2dSkeleton];
  [v6 setRawDetection2dSkeletonABPKArray:self->_rawDetection2dSkeletonArray];
  [v6 setDetection2dSkeletonABPK:self->_detection2dSkeleton];
  [v6 setLiftingSkeletonABPK:self->_liftingSkeleton];
  [v6 setRegistered2dSkeletonABPK:self->_registered2dSkeleton];
  [v6 setRetargetedSkeletonABPK:self->_retargetedSkeleton];
  v9 = [v23 cameraParams];
  [v9 extrinsics];
  double v21 = v11;
  double v22 = v10;
  double v19 = v13;
  double v20 = v12;
  [v23 vioPose];
  -[ABPKPoseEstimationPipeline computeRootTransforms:withCameraExtrinsics:withVioPose:withVioPoseValidity:](self, "computeRootTransforms:withCameraExtrinsics:withVioPose:withVioPoseValidity:", v6, [v23 isVioPoseValid], v22, v21, v20, v19, v14, v15, v16, v17);

  +[ABPKTime nowInSeconds];
  *(float *)&double v18 = v18;
  [v6 setTimeABPKAlgorithmFinished:v18];
  [(ABPKPoseEstimationPipeline *)self _endExecuteAlgorithmSignpost];
}

- (int)runABPKPoseEstimationWithInputData:(id)a3 andGetOutput:(id)a4
{
  uint64_t v199 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v6 image]);
  size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v6 image]);
  double v10 = __ABPKLogSharedInstance();
  double v11 = (double)Width;
  double v12 = (double)Height;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)&buf[4] = (double)Height;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (double)Width;
    _os_log_impl(&dword_21B7C6000, v10, OS_LOG_TYPE_DEBUG, " Sensor image resolution: (height,width):(%f,%f) ", buf, 0x16u);
  }

  double v13 = [v6 cameraParams];
  uint64_t v14 = [v13 deviceOrientation];

  double v15 = [v6 cameraParams];
  [v7 setCameraParams:v15];

  if ([(ABPK2DDetectionConfiguration *)self->_config2D abpkDeviceOrientation] != v14)
  {
    double v16 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      double v17 = convertABPKDeviceOrientationEnumToString([(ABPK2DDetectionConfiguration *)self->_config2D abpkDeviceOrientation]);
      double v18 = convertABPKDeviceOrientationEnumToString(v14);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_DEBUG, " Device orientation changed from %@ to %@ ", buf, 0x16u);
    }
    [(ABPK2DDetectionConfiguration *)self->_config2D setAbpkDeviceOrientation:v14];
  }
  +[ABPK2DMLModelConfigSelector inputDimensionsForModelWithABPKNetworkConfig:self->_config2D];
  double v20 = v19;
  double v22 = v21;
  if (!self->_imagePreprocessor || self->_inputResolution.width == v11 && self->_inputResolution.height == v12)
  {
    id v23 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v20;
      _os_log_impl(&dword_21B7C6000, v23, OS_LOG_TYPE_DEBUG, " ML image resolution: (height,width):(%f,%f) ", buf, 0x16u);
    }

    v24 = -[ABPKImagePreProcessingParams initWithType:inputResolution:outputResolution:]([ABPKImagePreProcessingParams alloc], "initWithType:inputResolution:outputResolution:", 2, v11, v12, v20, v22);
    objc_storeStrong((id *)&self->_imagePreProcessingParams, v24);
    [(ABPKImagePreProcessingParams *)v24 printData];
    __int16 v25 = [[ABPKImagePreProcessing alloc] initWithPreProcessingParams:v24];
    if (!v25)
    {
      v28 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v28, OS_LOG_TYPE_ERROR, " Could not initialize imagePreprocessor ", buf, 2u);
      }

      goto LABEL_27;
    }
    self->_inputResolution.width = v11;
    self->_inputResolution.height = v12;
    imagePreprocessor = self->_imagePreprocessor;
    self->_imagePreprocessor = v25;
  }
  [(ABPKPoseEstimationPipeline *)self _startImagePreprocessingSignpost];
  if ([(ABPK2DDetectionConfiguration *)self->_config2D abpkDeviceOrientation] != v14
    || !self->_mlImage)
  {
    uint64_t v194 = *MEMORY[0x263F04130];
    uint64_t v195 = MEMORY[0x263EFFA78];
    v24 = [NSDictionary dictionaryWithObjects:&v195 forKeys:&v194 count:1];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)v20, (unint64_t)v22, 0x42475241u, (CFDictionaryRef)v24, &self->_mlImage))
    {
      __int16 v27 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v27, OS_LOG_TYPE_ERROR, " Could not create mlImage buffer of type kCVPixelFormatType_32BGRA ", buf, 2u);
      }

LABEL_27:
      int v30 = -6660;
      goto LABEL_28;
    }
  }
  int v29 = -[ABPKImagePreProcessing preprocessData:outputBuffer:](self->_imagePreprocessor, "preprocessData:outputBuffer:", [v6 image], self->_mlImage);
  [(ABPKImagePreProcessing *)self->_imagePreprocessor logProfilingDetails];
  [(ABPKPoseEstimationPipeline *)self _endImagePreprocessingSignpost];
  if (v29)
  {
    __ABPKLogSharedInstance();
    v24 = (ABPKImagePreProcessingParams *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, &v24->super, OS_LOG_TYPE_ERROR, " Could not pre-process image ", buf, 2u);
    }
    goto LABEL_27;
  }
  if (self->_exitPoint)
  {
    v32 = [v7 algState];
    objc_msgSend(v32, "setImage_preprocessing:", 1);

    v33 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v33, OS_LOG_TYPE_DEBUG, " Running 2d pose estimation ", buf, 2u);
    }

    v34 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v34, OS_LOG_TYPE_DEBUG, " \t Running the ML model ", buf, 2u);
    }

    v35 = [ABPKMLImageData alloc];
    mlImage = self->_mlImage;
    [v6 timestamp];
    v24 = -[ABPKMLImageData initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:](v35, "initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:", mlImage, v14, self->_imagePreProcessingParams);
    if ([(ABPK2DPoseEstimation *)self->_poseEstimation2D runWithMLImageData:v24 rotationOfResultTensor:0] == -6661)
    {
      v37 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v37, OS_LOG_TYPE_ERROR, " 2D Pose estimation failed. ", buf, 2u);
      }

      ++self->_consistent2DSkeletonMissing;
      int v30 = -6661;
      goto LABEL_28;
    }
    [(ABPK2DPoseEstimation *)self->_poseEstimation2D getRawTrackedHumanSkeleton:self->_rawDetection2dSkeleton];
    [(ABPK2DPoseEstimation *)self->_poseEstimation2D getRawTrackedHumanSkeletonVector:self->_rawDetection2dSkeletonArray];
    [(ABPK2DPoseEstimation *)self->_poseEstimation2D getTrackedHumanSkeleton:self->_detection2dSkeleton];
    v187 = [[ABPK2dSkeleton alloc] initWithType:1];
    -[ABPK2DPoseEstimation getTrackedHumanForLiftingSkeleton:](self->_poseEstimation2D, "getTrackedHumanForLiftingSkeleton:");
    v38 = [v7 algState];
    [v38 setDetection2d:1];

    if (self->_deviceANEVersionPriorOrEqualToH12)
    {
      if ([(ABPK2dSkeleton *)v187 hasMissingJoints])
      {
        __ABPKLogSharedInstance();
        v39 = (ABPK2dSkeleton *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v39->super, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B7C6000, &v39->super, OS_LOG_TYPE_DEBUG, " \t\t Extrapolation for missing joints failed. Cannot run lifting network using old 3D lifting model on rOS. New 3D lifting model should still work on iOS. ", buf, 2u);
        }
        int v30 = -6667;
        goto LABEL_163;
      }
    }
    else if (!self->_rawDetection2dSkeleton)
    {
      int v30 = -6667;
LABEL_164:

      goto LABEL_28;
    }
    if (self->_exitPoint == 2)
    {
      __ABPKLogSharedInstance();
      v39 = (ABPK2dSkeleton *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v39->super, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, &v39->super, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPoint2DDetectionPostProcessing ", buf, 2u);
      }
      int v30 = 0;
      goto LABEL_163;
    }
    v40 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v40, OS_LOG_TYPE_DEBUG, " Performing 2d-3d lifting ", buf, 2u);
    }

    v41 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v41, OS_LOG_TYPE_DEBUG, " \t Pre-processing data ", buf, 2u);
    }

    if (self->_deviceANEVersionPriorOrEqualToH12)
    {
      v42 = [ABPK2D3DLiftingData alloc];
      uint64_t v43 = [(ABPK2dSkeleton *)v187 normalizedKeypoints2d];
      v44 = [(ABPK2dSkeleton *)v187 skeletonDefinition];
      v39 = -[ABPK2D3DLiftingData initWithJoints:numberOfJoints:](v42, "initWithJoints:numberOfJoints:", v43, [v44 jointCount]);

      v45 = [ABPK2DDetectionResult alloc];
      uint64_t v46 = [(ABPK2dSkeleton *)self->_detection2dSkeleton normalizedKeypoints2d];
      v47 = [(ABPK2dSkeleton *)self->_detection2dSkeleton visibility];
      v48 = [(ABPK2dSkeleton *)self->_detection2dSkeleton skeletonDefinition];
      v185 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v45, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v46, v47, [v48 jointCount], 0, v39, 0.0, 0.0, 1.0, 1.0);

      if (!v39)
      {
        v51 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v64 = " Exiting from point: kABPKAlgorithmExitPoint3DLiftingPreprocessing ";
LABEL_79:
          _os_log_impl(&dword_21B7C6000, v51, OS_LOG_TYPE_DEBUG, v64, buf, 2u);
        }
LABEL_80:
        int v30 = 0;
LABEL_81:

LABEL_162:
LABEL_163:

        goto LABEL_164;
      }
      v49 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v49, OS_LOG_TYPE_DEBUG, " \t Running the lifting model ", buf, 2u);
      }

      liftingAlgorithm = self->_liftingAlgorithm;
      [v6 timestamp];
      if (-[ABPK3DLifting runLiftingModelWithData:atTimestamp:](liftingAlgorithm, "runLiftingModelWithData:atTimestamp:", v185))
      {
        v51 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B7C6000, v51, OS_LOG_TYPE_DEBUG, " \t\t Failed to run Lifting ML model ", buf, 2u);
        }
        int v30 = -6662;
        goto LABEL_81;
      }
      if (self->_exitPoint == 4)
      {
        v51 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v64 = " Exiting from point: kABPKAlgorithmExitPoint3DLiftingModelOutput ";
          goto LABEL_79;
        }
        goto LABEL_80;
      }
      v68 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v68, OS_LOG_TYPE_DEBUG, " \t Post-processing output ", buf, 2u);
      }

      v69 = [(ABPK3DLifting *)self->_liftingAlgorithm getLiftingResults];
      if (!v69)
      {
        int v30 = -6662;
        goto LABEL_162;
      }
      v70 = [v7 algState];
      [v70 setLifting3d:1];

      [(ABPKSkeleton *)self->_liftingSkeleton setModelPoses:[(ABPK3DLifting *)self->_liftingAlgorithm get3DLiftingResultsAsModelPoses] andUpdateLocalPoses:1];
LABEL_129:

      self->_consistent2DSkeletonMissing = 0;
      if (self->_exitPoint == 5)
      {
        v105 = __ABPKLogSharedInstance();
        v185 = (ABPK2DDetectionResult *)v105;
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B7C6000, v105, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPoint3DLiftingPostProcessing ", buf, 2u);
        }
      }
      else
      {
        v106 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B7C6000, v106, OS_LOG_TYPE_DEBUG, " Performing camera registration ", buf, 2u);
        }

        bodyRegistration = self->_bodyRegistration;
        v108 = [v6 cameraParams];
        [v108 intrinsics];
        double v182 = v110;
        double v186 = v109;
        double v178 = v111;
        v112 = [v6 cameraParams];
        [v112 inputRes];
        -[ABPKCameraRegistration runCameraRegistrationWithImageIntrinsics:imageResolution:liftingResult:](bodyRegistration, "runCameraRegistrationWithImageIntrinsics:imageResolution:liftingResult:", v69, v186, v182, v178, v113, v114);
        v185 = (ABPK2DDetectionResult *)objc_claimAutoreleasedReturnValue();

        if (([(ABPK2DDetectionResult *)v185 success] & 1) == 0)
        {
          int v30 = -6664;
LABEL_161:
          v39 = (ABPK2dSkeleton *)v69;
          goto LABEL_162;
        }
        v115 = [v7 algState];
        [v115 setRegistration:1];

        liftingSkeleton = self->_liftingSkeleton;
        [(ABPK2DDetectionResult *)v185 cameraFromBodyPose];
        -[ABPKSkeleton setCameraRootTransform:](liftingSkeleton, "setCameraRootTransform:");
        [(ABPK2DDetectionResult *)v185 cameraFromBodyPose];
        long long v174 = v118;
        long long v176 = v117;
        long long v179 = v120;
        long long v183 = v119;
        *(double *)v121.i64 = simd_matrix4x4((float32x4_t)_PromotedConst);
        uint64_t v125 = 0;
        *(_OWORD *)__p = v176;
        long long v189 = v174;
        long long v190 = v183;
        long long v191 = v179;
        do
        {
          *(float32x4_t *)&buf[v125 * 8] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v121, COERCE_FLOAT(*(_OWORD *)&__p[v125])), v122, (float32x2_t)__p[v125], 1), v123, *(float32x4_t *)&__p[v125], 2), v124, *(float32x4_t *)&__p[v125], 3);
          v125 += 2;
        }
        while (v125 != 8);
        double v180 = *(double *)&buf[16];
        double v184 = *(double *)buf;
        double v175 = *(double *)&v198;
        double v177 = *(double *)&v197;
        -[ABPKSkeleton setRenderingCameraRootTransform:](self->_liftingSkeleton, "setRenderingCameraRootTransform:");
        registered2dSkeleton = self->_registered2dSkeleton;
        uint64_t v127 = [(ABPK2DDetectionResult *)v185 joints2d];
        v128 = [v6 cameraParams];
        [v128 inputRes];
        -[ABPK2dSkeleton setKeypoints2d:withImageRes:](registered2dSkeleton, "setKeypoints2d:withImageRes:", v127);

        if (self->_exitPoint == 6)
        {
          v129 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21B7C6000, v129, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPointCameraRegistration ", buf, 2u);
          }
        }
        else
        {
          [v6 timestamp];
          -[ABPKPoseEstimationPipeline _startScaleEstimationSignpostWithTimestamp:](self, "_startScaleEstimationSignpostWithTimestamp:");
          if (![v6 isDepthDataValid]) {
            goto LABEL_146;
          }
          if (![v6 depthMap]) {
            goto LABEL_146;
          }
          if (![v6 depthConfidenceBuffer]) {
            goto LABEL_146;
          }
          scaleEstimation = self->_scaleEstimation;
          uint64_t v131 = [v6 depthMap];
          uint64_t v132 = [v6 depthConfidenceBuffer];
          [v6 timestamp];
          double v134 = v133;
          v135 = [v6 cameraParams];
          [v135 inputRes];
          double v137 = v136;
          double v139 = v138;
          v140 = [v6 cameraParams];
          [v140 intrinsics];
          double v172 = v142;
          double v173 = v141;
          double v171 = v143;
          [(ABPK2DDetectionResult *)v185 cameraFromBodyPose];
          -[ABPKDepthBasedScaleEstimation estimateScaleFromDepthData:depthConfidenceData:timestamp:imageResolution:imageIntrinsics:cameraFromBodyPose:liftingResult:](scaleEstimation, "estimateScaleFromDepthData:depthConfidenceData:timestamp:imageResolution:imageIntrinsics:cameraFromBodyPose:liftingResult:", v131, v132, v69, v134, v137, v139, v173, v172, v171, v144, v145, v146, v147, v148, v149, v150, v151);
          float previousValidScale = v152;

          if (previousValidScale != -1.0) {
            self->_float previousValidScale = previousValidScale;
          }
          else {
LABEL_146:
          }
            float previousValidScale = self->_previousValidScale;
          v154 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&buf[4] = previousValidScale;
            _os_log_impl(&dword_21B7C6000, v154, OS_LOG_TYPE_DEBUG, " Estimated Scale: %f ", buf, 0xCu);
          }

          *(float *)&double v155 = previousValidScale;
          [(ABPK3DLiftingResult *)v69 setEstimatedScale:v155];
          *(float *)&double v156 = previousValidScale;
          [(ABPKSkeleton *)self->_liftingSkeleton setEstimatedScale:v156];
          [(ABPKSkeleton *)self->_liftingSkeleton updateJointPosesAndRootTransformUsingDepthEstimatedScale];
          [v6 timestamp];
          -[ABPKPoseEstimationPipeline _endScaleEstimationSignpostWithTimestamp:](self, "_endScaleEstimationSignpostWithTimestamp:");
          v157 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21B7C6000, v157, OS_LOG_TYPE_DEBUG, " Performing retargeting ", buf, 2u);
          }

          [v6 timestamp];
          -[ABPKPoseEstimationPipeline _startRetargettingSignpostWithTimestamp:](self, "_startRetargettingSignpostWithTimestamp:");
          v129 = [(ABPKRetargeting *)self->_retargeting processData:v69];
          v158 = [v7 algState];
          [v158 setRetargeting:1];

          v159 = (const void *)[v129 jointModelTransforms];
          uint64_t v160 = [v129 jointModelTransforms];
          uint64_t v161 = [v129 jointTransformCount];
          memset(buf, 0, 24);
          std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(buf, v159, v160 + (v161 << 6), (v160 + (v161 << 6) - (uint64_t)v159) >> 6);
          v162 = (const void *)[v129 jointLocalTransforms];
          uint64_t v163 = [v129 jointLocalTransforms];
          uint64_t v164 = [v129 jointTransformCount];
          __p[0] = 0;
          __p[1] = 0;
          *(void *)&long long v189 = 0;
          std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(__p, v162, v163 + (v164 << 6), (v163 + (v164 << 6) - (uint64_t)v162) >> 6);
          [(ABPKSkeleton *)self->_retargetedSkeleton setModelPoses:*(void *)buf andUpdateLocalPoses:0];
          retargetedSkeleton = self->_retargetedSkeleton;
          [(ABPK2DDetectionResult *)v185 cameraFromBodyPose];
          -[ABPKSkeleton setCameraRootTransform:](retargetedSkeleton, "setCameraRootTransform:");
          -[ABPKSkeleton setRenderingCameraRootTransform:](self->_retargetedSkeleton, "setRenderingCameraRootTransform:", v184, v180, v177, v175);
          *(float *)&double v166 = previousValidScale;
          [(ABPKSkeleton *)self->_retargetedSkeleton setEstimatedScale:v166];
          [v6 timestamp];
          -[ABPKPoseEstimationPipeline _endRetargettingSignpostWithTimestamp:](self, "_endRetargettingSignpostWithTimestamp:");
          [(ABPKSkeleton *)self->_retargetedSkeleton computeHeight];
          float v168 = v167;
          v169 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v192 = 134217984;
            double v193 = v168;
            _os_log_impl(&dword_21B7C6000, v169, OS_LOG_TYPE_DEBUG, " skeletonHeight: %f ", v192, 0xCu);
          }

          v170 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v170, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v192 = 134217984;
            double v193 = previousValidScale;
            _os_log_impl(&dword_21B7C6000, v170, OS_LOG_TYPE_DEBUG, " Estimated Scale: %f ", v192, 0xCu);
          }

          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(void *)buf)
          {
            *(void *)&buf[8] = *(void *)buf;
            operator delete(*(void **)buf);
          }
        }
      }
      int v30 = 0;
      goto LABEL_161;
    }
    v39 = [[ABPK2dSkeleton alloc] initWithType:1];
    [(ABPK2DPoseEstimation *)self->_poseEstimation2D getRawTrackedHumanForLiftingSkeleton:v39];
    v52 = [ABPK2D3DLiftingData alloc];
    uint64_t v53 = [(ABPK2dSkeleton *)v39 normalizedKeypoints2d];
    v54 = [(ABPK2dSkeleton *)v39 skeletonDefinition];
    v185 = -[ABPK2D3DLiftingData initWithJoints:numberOfJoints:](v52, "initWithJoints:numberOfJoints:", v53, [v54 jointCount]);

    v55 = [ABPK2DDetectionResult alloc];
    uint64_t v56 = [(ABPK2dSkeleton *)self->_rawDetection2dSkeleton normalizedKeypoints2d];
    v57 = [(ABPK2dSkeleton *)self->_rawDetection2dSkeleton visibility];
    v58 = [(ABPK2dSkeleton *)self->_rawDetection2dSkeleton skeletonDefinition];
    v181 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v55, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v56, v57, [v58 jointCount], 0, v185, 0.0, 0.0, 1.0, 1.0);

    if (self->_useLSTM3D)
    {
      if (self->_consistent2DSkeletonMissing >= 6)
      {
        v59 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B7C6000, v59, OS_LOG_TYPE_DEBUG, " \t Last detected person was many frames ago. New 2D person detected. Resetting LSTM for 3D lifting. ", buf, 2u);
        }

        [(ABPK3DLiftingLSTM *)self->_liftingAlgorithmLSTM resetCellStateAndHiddenStateInput];
      }
      v60 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v60, OS_LOG_TYPE_DEBUG, " \t Running the LSTM lifting model ", buf, 2u);
      }

      liftingAlgorithmLSTM = self->_liftingAlgorithmLSTM;
      [v6 timestamp];
      if (-[ABPK3DLiftingLSTM runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:](liftingAlgorithmLSTM, "runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:", v181, v14, v11, v12, v62))
      {
        v63 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
LABEL_87:
          _os_log_impl(&dword_21B7C6000, v63, OS_LOG_TYPE_DEBUG, " \t\t Failed to run Lifting ML model ", buf, 2u);
          goto LABEL_88;
        }
        goto LABEL_88;
      }
      if (self->_exitPoint == 4)
      {
        v63 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
LABEL_99:
          _os_log_impl(&dword_21B7C6000, v63, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPoint3DLiftingModelOutput ", buf, 2u);
          goto LABEL_100;
        }
        goto LABEL_100;
      }
      v71 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v71, OS_LOG_TYPE_DEBUG, " \t Post-processing output ", buf, 2u);
      }

      v72 = [(ABPK3DLiftingLSTM *)self->_liftingAlgorithmLSTM getLiftingResults];
      v73 = v72;
      if (v72)
      {
        if ([v72 rawNetworkOutputJoints]) {
          objc_msgSend(v7, "setRawLiftingNetworkOutputJoints:", objc_msgSend(v73, "rawNetworkOutputJoints"));
        }
        v74 = [(ABPK2dSkeleton *)self->_detection2dSkeleton skeletonDefinition];
        uint64_t v75 = [v74 jointCount];

        v76 = [(ABPK2dSkeleton *)self->_detection2dSkeleton normalizedKeypoints2d];
        uint64_t v77 = [(ABPK2dSkeleton *)self->_detection2dSkeleton normalizedKeypoints2d];
        memset(buf, 0, 24);
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(buf, v76, v77 + 8 * v75, (v77 + 8 * v75 - (uint64_t)v76) >> 3);
        if (v75)
        {
          uint64_t v78 = 0;
          __asm { FMOV            V8.2S, #-1.0 }
          do
          {
            if (![(ABPK2dSkeleton *)self->_rawDetection2dSkeleton visibility][4 * v78]) {
              *(void *)(*(void *)buf + 8 * v78) = _D8;
            }
            ++v78;
          }
          while (v75 != v78);
        }
        v84 = [ABPK2DDetectionResult alloc];
        uint64_t v85 = *(void *)buf;
        v86 = [(ABPK2dSkeleton *)self->_rawDetection2dSkeleton visibility];
        v87 = [(ABPK2dSkeleton *)self->_rawDetection2dSkeleton skeletonDefinition];
        v88 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v84, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v85, v86, [v87 jointCount], 0, v185, 0.0, 0.0, 1.0, 1.0);

        v69 = -[ABPK3DLiftingResult initWithJoints:numberOfJoints:referenceDetectionResult:]([ABPK3DLiftingResult alloc], "initWithJoints:numberOfJoints:referenceDetectionResult:", [v73 joints], 17, v88);
        v89 = [v7 algState];
        [v89 setLifting3d:1];

        [(ABPKSkeleton *)self->_liftingSkeleton setModelPoses:[(ABPK3DLiftingLSTM *)self->_liftingAlgorithmLSTM get3DLiftingResultsAsModelPoses] andUpdateLocalPoses:1];
LABEL_126:
        if (*(void *)buf)
        {
          *(void *)&buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }

        goto LABEL_129;
      }
    }
    else
    {
      v65 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v65, OS_LOG_TYPE_DEBUG, " \t Running the TCN lifting model ", buf, 2u);
      }

      liftingAlgorithmSequence = self->_liftingAlgorithmSequence;
      [v6 timestamp];
      if (-[ABPK3DLiftingSequence runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:](liftingAlgorithmSequence, "runLiftingModelWithData:imageResolution:deviceOrientation:atTimestamp:", v181, v14, v11, v12, v67))
      {
        v63 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_87;
        }
LABEL_88:
        int v30 = -6662;
LABEL_101:

LABEL_102:
        goto LABEL_162;
      }
      if (self->_exitPoint == 4)
      {
        v63 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          goto LABEL_99;
        }
LABEL_100:
        int v30 = 0;
        goto LABEL_101;
      }
      v90 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v90, OS_LOG_TYPE_DEBUG, " \t Post-processing output ", buf, 2u);
      }

      v91 = [(ABPK3DLiftingSequence *)self->_liftingAlgorithmSequence getLiftingResults];
      v92 = v91;
      if (v91)
      {
        if ([v91 rawNetworkOutputJoints]) {
          objc_msgSend(v7, "setRawLiftingNetworkOutputJoints:", objc_msgSend(v92, "rawNetworkOutputJoints"));
        }
        v93 = [(ABPK2dSkeleton *)self->_detection2dSkeleton skeletonDefinition];
        uint64_t v94 = [v93 jointCount];

        v95 = [(ABPK2dSkeleton *)self->_detection2dSkeleton normalizedKeypoints2d];
        uint64_t v96 = [(ABPK2dSkeleton *)self->_detection2dSkeleton normalizedKeypoints2d];
        memset(buf, 0, 24);
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(buf, v95, v96 + 8 * v94, (v96 + 8 * v94 - (uint64_t)v95) >> 3);
        if (v94)
        {
          uint64_t v97 = 0;
          __asm { FMOV            V8.2S, #-1.0 }
          do
          {
            if (![(ABPK2dSkeleton *)self->_rawDetection2dSkeleton visibility][4 * v97]) {
              *(void *)(*(void *)buf + 8 * v97) = _D8;
            }
            ++v97;
          }
          while (v94 != v97);
        }
        v99 = [ABPK2DDetectionResult alloc];
        uint64_t v100 = *(void *)buf;
        v101 = [(ABPK2dSkeleton *)self->_rawDetection2dSkeleton visibility];
        v102 = [(ABPK2dSkeleton *)self->_rawDetection2dSkeleton skeletonDefinition];
        v103 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v99, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v100, v101, [v102 jointCount], 0, v185, 0.0, 0.0, 1.0, 1.0);

        v69 = -[ABPK3DLiftingResult initWithJoints:numberOfJoints:referenceDetectionResult:]([ABPK3DLiftingResult alloc], "initWithJoints:numberOfJoints:referenceDetectionResult:", [v92 joints], 17, v103);
        v104 = [v7 algState];
        [v104 setLifting3d:1];

        [(ABPKSkeleton *)self->_liftingSkeleton setModelPoses:[(ABPK3DLiftingSequence *)self->_liftingAlgorithmSequence get3DLiftingResultsAsModelPoses] andUpdateLocalPoses:1];
        goto LABEL_126;
      }
    }
    int v30 = -6662;
    goto LABEL_102;
  }
  __ABPKLogSharedInstance();
  v24 = (ABPKImagePreProcessingParams *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, &v24->super, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPointImagePreProcessing ", buf, 2u);
  }
  int v30 = 0;
LABEL_28:

  return v30;
}

- (void)computeRootTransforms:(float32x4_t)a3 withCameraExtrinsics:(float32x4_t)a4 withVioPose:(uint64_t)a5 withVioPoseValidity:(uint64_t)a6
{
  id v33 = a7;
  id v7 = [v33 liftingSkeletonABPK];
  [v7 cameraRootTransform];
  long long v21 = v9;
  long long v22 = v8;
  long long v23 = v11;
  long long v24 = v10;
  double v12 = [v33 liftingSkeletonABPK];
  double v13 = v12;
  uint64_t v14 = 0;
  v34[0] = v22;
  v34[1] = v21;
  v34[2] = v24;
  v34[3] = v23;
  do
  {
    *(long long *)((char *)&v35 + v14 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, COERCE_FLOAT(v34[v14])), a2, *(float32x2_t *)&v34[v14], 1), a3, (float32x4_t)v34[v14], 2), a4, (float32x4_t)v34[v14], 3);
    ++v14;
  }
  while (v14 != 4);
  objc_msgSend(v12, "setDeviceRootTransform:", *(double *)&v35, *(double *)&v36, *(double *)&v37, *(double *)&v38);

  double v15 = [v33 liftingSkeletonABPK];
  [v15 deviceRootTransform];
  double v30 = v17;
  double v32 = v16;
  double v26 = v19;
  double v28 = v18;
  double v20 = [v33 retargetedSkeletonABPK];
  objc_msgSend(v20, "setDeviceRootTransform:", v32, v30, v28, v26);
}

- (void)saveInputData:(id)a3 andOutputData:(id)a4 ToDir:(id)a5 withFileNamePrefix:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " \t\t Recording input data ", buf, 2u);
  }

  [v9 saveDataToDir:v11 withFileNamePrefix:v12];
  uint64_t v14 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v15 = 0;
    _os_log_impl(&dword_21B7C6000, v14, OS_LOG_TYPE_DEBUG, " \t\t Recording output data ", v15, 2u);
  }

  [v10 saveDataToDir:v11 withFileNamePrefix:v12];
}

- (void)_startInitABPKSignpost
{
}

- (void)_endInitABPKSignpost
{
}

- (void)_startInitABPKOutputSignpost
{
}

- (void)_endInitABPKOutputSignpost
{
}

- (void)_startExecuteAlgorithmSignpost
{
}

- (void)_endExecuteAlgorithmSignpost
{
}

- (void)_startImagePreprocessingSignpost
{
}

- (void)_endImagePreprocessingSignpost
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
  objc_storeStrong((id *)&self->_imagePreProcessingParams, 0);
  objc_storeStrong((id *)&self->_imagePreprocessor, 0);
  objc_storeStrong((id *)&self->_retargetedSkeleton, 0);
  objc_storeStrong((id *)&self->_registered2dSkeleton, 0);
  objc_storeStrong((id *)&self->_liftingSkeleton, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeletonArray, 0);
  objc_storeStrong((id *)&self->_detection2dSkeleton, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeleton, 0);
  objc_storeStrong((id *)&self->_retargeting, 0);
  objc_storeStrong((id *)&self->_scaleEstimation, 0);
  objc_storeStrong((id *)&self->_bodyRegistration, 0);
  objc_storeStrong((id *)&self->_liftingAlgorithmLSTM, 0);
  objc_storeStrong((id *)&self->_liftingAlgorithmSequence, 0);
  objc_storeStrong((id *)&self->_liftingAlgorithm, 0);
  objc_storeStrong((id *)&self->_postprocess2d, 0);
  objc_storeStrong((id *)&self->_poseEstimation2D, 0);
  objc_storeStrong((id *)&self->_config2D, 0);
  objc_storeStrong((id *)&self->_saveDirectory, 0);
}

@end