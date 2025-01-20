@interface ABPKAlgorithmRA
- (ABPKAlgorithmRA)initWithCameraParams:(id)a3;
- (ABPKAlgorithmRA)initWithCameraParams:(id)a3 andAlgorithmMode:(int64_t)a4;
- (int)preprocessInputImage:(__CVBuffer *)a3;
- (void)_endABPKAlgoInitSignpost;
- (void)_endExecuteAlgorithmSignpost;
- (void)_endImagePreprocessingSignpost;
- (void)_startABPKAlgoInitSignpost;
- (void)_startExecuteAlgorithmSignpost;
- (void)_startImagePreprocessingSignpost;
- (void)computeRootTransforms:(uint64_t)a1 withVioPose:(uint64_t)a2 withVioPoseValidity:(void *)a3;
- (void)dealloc;
- (void)runABPKAlgorithmWithInputData:(id)a3 andGetOutput:(id)a4;
- (void)saveInputData:(id)a3 andOutputData:(id)a4 ToDir:(id)a5 withFileNamePrefix:(id)a6;
- (void)setExitPoint:(int64_t)a3;
@end

@implementation ABPKAlgorithmRA

- (ABPKAlgorithmRA)initWithCameraParams:(id)a3
{
  return [(ABPKAlgorithmRA *)self initWithCameraParams:a3 andAlgorithmMode:1];
}

- (ABPKAlgorithmRA)initWithCameraParams:(id)a3 andAlgorithmMode:(int64_t)a4
{
  v36[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ABPKAlgorithmRA;
  v7 = [(ABPKAlgorithmRA *)&v34 init];
  if (v7)
  {
    v8 = objc_alloc_init(ABPKAlgInput);
    v9 = (void *)*((void *)v7 + 24);
    *((void *)v7 + 24) = v8;

    objc_storeStrong((id *)v7 + 5, a3);
    *((void *)v7 + 2) = 7;
    [*((id *)v7 + 5) inputRes];
    *((void *)v7 + 3) = v10;
    *((void *)v7 + 4) = v11;
    v12 = [[ABPK2DDetectionConfiguration alloc] initWithAlgorithmMode:1];
    if (v12)
    {
      v13 = -[ABPKImagePreProcessingParams initWithType:inputResolution:outputResolution:]([ABPKImagePreProcessingParams alloc], "initWithType:inputResolution:outputResolution:", 2, *((double *)v7 + 3), *((double *)v7 + 4), *((double *)v7 + 10), *((double *)v7 + 11));
      v14 = (void *)*((void *)v7 + 13);
      *((void *)v7 + 13) = v13;

      if (*((void *)v7 + 13))
      {
        *((_OWORD *)v7 + 7) = *(_OWORD *)(v7 + 24);
        [*((id *)v7 + 5) intrinsics];
        *((_DWORD *)v7 + 34) = v15;
        *((void *)v7 + 16) = v16;
        *((_DWORD *)v7 + 38) = v17;
        *((void *)v7 + 18) = v18;
        *((_DWORD *)v7 + 42) = v19;
        *((void *)v7 + 20) = v20;
        v21 = -[ABPKAlgorithmParams initWithRegIntrinsics:regImageResolution:]([ABPKAlgorithmParams alloc], "initWithRegIntrinsics:regImageResolution:", *((double *)v7 + 16), *((double *)v7 + 18), *((double *)v7 + 20), *((double *)v7 + 14), *((double *)v7 + 15));
        v22 = (void *)*((void *)v7 + 6);
        *((void *)v7 + 6) = v21;

        [*((id *)v7 + 6) setConfig2DDetection:v12];
        v23 = [[ABPKAlgorithm alloc] initWithParams:*((void *)v7 + 6)];
        v24 = (void *)*((void *)v7 + 1);
        *((void *)v7 + 1) = v23;

        if (!*((void *)v7 + 1))
        {
          v30 = 0;
LABEL_23:

          goto LABEL_24;
        }
        v25 = [[ABPKImagePreProcessing alloc] initWithPreProcessingParams:*((void *)v7 + 13)];
        v26 = (void *)*((void *)v7 + 12);
        *((void *)v7 + 12) = v25;

        if (*((void *)v7 + 12))
        {
          v27 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v33 = 0;
            _os_log_impl(&dword_21B7C6000, v27, OS_LOG_TYPE_DEBUG, " Image Preprocessing ", v33, 2u);
          }

          uint64_t v35 = *MEMORY[0x263F04130];
          v36[0] = MEMORY[0x263EFFA78];
          CFDictionaryRef v28 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
          if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)*((double *)v7 + 10), (unint64_t)*((double *)v7 + 11), 0x42475241u, v28, (CVPixelBufferRef *)v7 + 22))
          {
            v30 = v7;
            goto LABEL_22;
          }
          v29 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v33 = 0;
            _os_log_impl(&dword_21B7C6000, v29, OS_LOG_TYPE_ERROR, " Could not create mlImage buffer of type kCVPixelFormatType_32BGRA ", v33, 2u);
          }

LABEL_21:
          v30 = 0;
LABEL_22:

          goto LABEL_23;
        }
        __ABPKLogSharedInstance();
        CFDictionaryRef v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        *(_WORD *)v33 = 0;
        v31 = " Could not initialize imagePreprocessor ";
      }
      else
      {
        __ABPKLogSharedInstance();
        CFDictionaryRef v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        *(_WORD *)v33 = 0;
        v31 = " Failed to initialize Image Preprocessing Parameters ";
      }
    }
    else
    {
      __ABPKLogSharedInstance();
      CFDictionaryRef v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      *(_WORD *)v33 = 0;
      v31 = " Failed to initialize config for 2D Detection module ";
    }
    _os_log_impl(&dword_21B7C6000, (os_log_t)v28, OS_LOG_TYPE_ERROR, v31, v33, 2u);
    goto LABEL_21;
  }
  v30 = 0;
LABEL_24:

  return v30;
}

- (void)dealloc
{
  mlImage = self->_mlImage;
  if (mlImage) {
    CVPixelBufferRelease(mlImage);
  }
  v4.receiver = self;
  v4.super_class = (Class)ABPKAlgorithmRA;
  [(ABPKAlgorithmRA *)&v4 dealloc];
}

- (void)setExitPoint:(int64_t)a3
{
  self->_exitPoint = a3;
  -[ABPKAlgorithm setExitPoint:](self->_abpkAlgorithm, "setExitPoint:");
}

- (void)runABPKAlgorithmWithInputData:(id)a3 andGetOutput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ABPKAlgorithmRA *)self _startExecuteAlgorithmSignpost];
  +[ABPKTime nowInSeconds];
  *(float *)&double v8 = v8;
  [v7 setTimeABPKAlgorithmStart:v8];
  [v7 setAlgorithmParams:self->_algParams];
  v9 = objc_alloc_init(ABPKAlgorithmState);
  [v7 setAlgState:v9];

  [v6 timestamp];
  objc_msgSend(v7, "setTimestamp:");
  [(ABPKAlgorithmRA *)self _startImagePreprocessingSignpost];
  LODWORD(v9) = -[ABPKAlgorithmRA preprocessInputImage:](self, "preprocessInputImage:", [v6 image]);
  [(ABPKAlgorithmRA *)self _endImagePreprocessingSignpost];
  if (v9)
  {
    uint64_t v10 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v10, OS_LOG_TYPE_DEFAULT, " Could not preprocess input data ", buf, 2u);
    }

    [v7 setAlgorithmReturnCode:4294960636];
  }
  else
  {
    uint64_t v11 = [v7 algState];
    objc_msgSend(v11, "setImage_preprocessing:", 1);

    [v7 setMlImage:self->_mlImage];
    if (self->_exitPoint)
    {
      [(ABPKAlgorithmRA *)self _startABPKAlgoInitSignpost];
      -[ABPKAlgInput setImage:](self->_algorithmInput, "setImage:", [v7 mlImage]);
      [(ABPKCameraParams *)self->_abpkCameraParams inputRes];
      -[ABPKAlgInput setImageResolution:](self->_algorithmInput, "setImageResolution:");
      [(ABPKCameraParams *)self->_abpkCameraParams intrinsics];
      -[ABPKAlgInput setImageCameraIntrinsics:](self->_algorithmInput, "setImageCameraIntrinsics:");
      -[ABPKAlgInput setDepthMap:](self->_algorithmInput, "setDepthMap:", [v6 depthMap]);
      [(ABPKAlgInput *)self->_algorithmInput setImagePreProcessingParams:self->_imagePreProcessingParams];
      [v6 timestamp];
      -[ABPKAlgInput setTimestamp:](self->_algorithmInput, "setTimestamp:");
      -[ABPKAlgInput setDepthConfidenceBuffer:](self->_algorithmInput, "setDepthConfidenceBuffer:", [v6 depthConfidenceBuffer]);
      -[ABPKAlgInput setIsDepthDataValid:](self->_algorithmInput, "setIsDepthDataValid:", [v6 isDepthDataValid]);
      v12 = [v7 algState];
      [(ABPKAlgOutput *)self->_algorithmOutput setAlgState:v12];

      [(ABPKAlgorithmRA *)self _endABPKAlgoInitSignpost];
      uint64_t v13 = [(ABPKAlgorithm *)self->_abpkAlgorithm runWithInput:self->_algorithmInput andGetOutput:self->_algorithmOutput];
      algorithmOutput = self->_algorithmOutput;
      [v6 vioPose];
      -[ABPKAlgorithmRA computeRootTransforms:withVioPose:withVioPoseValidity:](self, "computeRootTransforms:withVioPose:withVioPoseValidity:", algorithmOutput, [v6 isVioPoseValid], v15, v16, v17, v18);
      int v19 = [(ABPKAlgOutput *)self->_algorithmOutput rawDetection2dSkeletonABPK];
      [v7 setRawDetection2dSkeletonABPK:v19];

      uint64_t v20 = [(ABPKAlgOutput *)self->_algorithmOutput rawDetection2dSkeletonABPKArray];
      [v7 setRawDetection2dSkeletonABPKArray:v20];

      v21 = [(ABPKAlgOutput *)self->_algorithmOutput detection2dSkeletonABPK];
      [v7 setDetection2dSkeletonABPK:v21];

      v22 = [(ABPKAlgOutput *)self->_algorithmOutput liftingSkeletonABPK];
      [v7 setLiftingSkeletonABPK:v22];

      v23 = [(ABPKAlgOutput *)self->_algorithmOutput registered2dSkeletonABPK];
      [v7 setRegistered2dSkeletonABPK:v23];

      v24 = [(ABPKAlgOutput *)self->_algorithmOutput retargetedSkeletonABPK];
      [v7 setRetargetedSkeletonABPK:v24];

      v25 = [(ABPKAlgOutput *)self->_algorithmOutput algState];
      [v7 setAlgState:v25];

      [v7 setAlgorithmReturnCode:v13];
      [(ABPKAlgorithmRA *)self _endExecuteAlgorithmSignpost];
      +[ABPKTime nowInSeconds];
      *(float *)&double v26 = v26;
      [v7 setTimeABPKAlgorithmFinished:v26];
    }
    else
    {
      v27 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_21B7C6000, v27, OS_LOG_TYPE_DEBUG, " Exiting from point: kABPKAlgorithmExitPointImagePreProcessing ", v29, 2u);
      }

      +[ABPKTime nowInSeconds];
      *(float *)&double v28 = v28;
      [v7 setTimeABPKAlgorithmFinished:v28];
    }
  }
}

- (void)computeRootTransforms:(uint64_t)a1 withVioPose:(uint64_t)a2 withVioPoseValidity:(void *)a3
{
  id v34 = a3;
  [*(id *)(a1 + 40) extrinsics];
  float32x4_t v30 = v5;
  float32x4_t v32 = v4;
  float32x4_t v26 = v7;
  float32x4_t v28 = v6;
  double v8 = [v34 liftingSkeletonABPK];
  [v8 cameraRootTransform];
  long long v22 = v10;
  long long v23 = v9;
  long long v24 = v12;
  long long v25 = v11;
  uint64_t v13 = [v34 liftingSkeletonABPK];
  v14 = v13;
  uint64_t v15 = 0;
  v35[0] = v23;
  v35[1] = v22;
  v35[2] = v25;
  v35[3] = v24;
  do
  {
    *(long long *)((char *)&v36 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(v35[v15])), v30, *(float32x2_t *)&v35[v15], 1), v28, (float32x4_t)v35[v15], 2), v26, (float32x4_t)v35[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  objc_msgSend(v13, "setDeviceRootTransform:", *(double *)&v36, *(double *)&v37, *(double *)&v38, *(double *)&v39);

  double v16 = [v34 liftingSkeletonABPK];
  [v16 deviceRootTransform];
  double v31 = v18;
  double v33 = v17;
  double v27 = v20;
  double v29 = v19;
  v21 = [v34 retargetedSkeletonABPK];
  objc_msgSend(v21, "setDeviceRootTransform:", v33, v31, v29, v27);
}

- (int)preprocessInputImage:(__CVBuffer *)a3
{
  float32x4_t v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)float32x4_t v7 = 0;
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_DEBUG, " Pre-processing image ", v7, 2u);
  }

  return [(ABPKImagePreProcessing *)self->_imagePreprocessor preprocessData:a3 outputBuffer:self->_mlImage];
}

- (void)saveInputData:(id)a3 andOutputData:(id)a4 ToDir:(id)a5 withFileNamePrefix:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " \t\t Recording input data ", buf, 2u);
  }

  [v9 saveDataToDir:v11 withFileNamePrefix:v12];
  v14 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_21B7C6000, v14, OS_LOG_TYPE_DEBUG, " \t\t Recording output data ", v15, 2u);
  }

  [v10 saveDataToDir:v11 withFileNamePrefix:v12];
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

- (void)_startABPKAlgoInitSignpost
{
}

- (void)_endABPKAlgoInitSignpost
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmOutput, 0);
  objc_storeStrong((id *)&self->_algorithmInput, 0);
  objc_storeStrong((id *)&self->_saveDirectory, 0);
  objc_storeStrong((id *)&self->_imagePreProcessingParams, 0);
  objc_storeStrong((id *)&self->_imagePreprocessor, 0);
  objc_storeStrong((id *)&self->_paddingParameters, 0);
  objc_storeStrong((id *)&self->_cropParameters, 0);
  objc_storeStrong((id *)&self->_imagePreProcessingType, 0);
  objc_storeStrong((id *)&self->_algParams, 0);
  objc_storeStrong((id *)&self->_abpkCameraParams, 0);
  objc_storeStrong((id *)&self->_abpkAlgorithm, 0);
}

@end