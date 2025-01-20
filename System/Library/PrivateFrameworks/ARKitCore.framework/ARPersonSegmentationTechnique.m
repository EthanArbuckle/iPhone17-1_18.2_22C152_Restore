@interface ARPersonSegmentationTechnique
- (ARPersonSegmentationTechnique)init;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLoadedModelVersionCorrect:(id)a3;
- (BOOL)shouldOperateOnHighResolutionImages;
- (__CVBuffer)_createCopyWithCVPixelBufferPoolForBuffer:(__CVBuffer *)a3;
- (double)requiredTimeInterval;
- (id)processData:(id)a3;
- (id)resultDataClasses;
- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6;
- (void)_prepareOnce:(BOOL)a3;
- (void)dealloc;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)setShouldOperateOnHighResolutionImages:(BOOL)a3;
@end

@implementation ARPersonSegmentationTechnique

- (ARPersonSegmentationTechnique)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.personsegmentationtechnique");
  v9.receiver = self;
  v9.super_class = (Class)ARPersonSegmentationTechnique;
  v4 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v9, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v3, 1, 256.0, 192.0);
  if (v4)
  {
    v5 = _ARLogTechnique_5();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      __int16 v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Running person segmentation by ARPersonSegmentationTechnique.", buf, 0x16u);
    }
    v4->_outputSegmentationCopyPixelBufferPool = 0;
    v4->_scaledSegmentationOutputPixelBufferPool = 0;
    v4->_shouldOperateOnHighResolutionImages = 0;
  }

  return v4;
}

- (void)_prepareOnce:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F99C88]);
  [v4 setRunByE5RT:1];
  [v4 setEngineType:1];
  v5 = (SIPeopleSegmentationAlgorithm *)[objc_alloc(MEMORY[0x1E4F99C78]) initWithNetworkConfiguration:v4];
  algorithm = self->_algorithm;
  self->_algorithm = v5;

  v7 = (SIImageInputData *)objc_alloc_init(MEMORY[0x1E4F99C70]);
  imageInputData = self->_imageInputData;
  self->_imageInputData = v7;

  if (!self->_algorithm)
  {
    if (_ARLogGeneral_onceToken_19 != -1) {
      dispatch_once(&_ARLogGeneral_onceToken_19, &__block_literal_global_77_0);
    }
    objc_super v9 = (void *)_ARLogGeneral_logObj_19;
    if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_19, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = (objc_class *)objc_opt_class();
      __int16 v12 = NSStringFromClass(v11);
      int v13 = 138543618;
      uint64_t v14 = v12;
      __int16 v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: SIPeopleSegmentationAlgorithm could not be initialized!", (uint8_t *)&v13, 0x16u);
    }
    if (ARSkipCrashOnCrash_onceToken_0 != -1) {
      dispatch_once(&ARSkipCrashOnCrash_onceToken_0, &__block_literal_global_80);
    }
    if (!ARSkipCrashOnCrash_skipCrashOnCrash_0) {
      -[ARPersonSegmentationTechnique _prepareOnce:]();
    }
  }
  if ([(ARPersonSegmentationTechnique *)self shouldOperateOnHighResolutionImages]) {
    [(SIPeopleSegmentationAlgorithm *)self->_algorithm setSnapEveryFrameCount:1];
  }
}

- (void)dealloc
{
  CVPixelBufferPoolRelease(self->_outputSegmentationCopyPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledSegmentationOutputPixelBufferPool);
  v3.receiver = self;
  v3.super_class = (Class)ARPersonSegmentationTechnique;
  [(ARMLImageProcessingTechnique *)&v3 dealloc];
}

- (double)requiredTimeInterval
{
  return 0.016;
}

- (id)resultDataClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (int v5 = -[ARPersonSegmentationTechnique shouldOperateOnHighResolutionImages](self, "shouldOperateOnHighResolutionImages"), [v4 originalImageData], v6 = objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "isHighResolution"), v6, v5 == v7))
  {
    v11.receiver = self;
    v11.super_class = (Class)ARPersonSegmentationTechnique;
    id v8 = [(ARMLImageProcessingTechnique *)&v11 processData:v4];
  }
  else
  {
    id v8 = v4;
  }
  objc_super v9 = v8;

  return v9;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6 = a4;
  int v7 = [(ARPersonSegmentationTechnique *)self shouldOperateOnHighResolutionImages];
  id v8 = [v6 imageData];
  int v9 = [v8 isHighResolution];

  if (v7 == v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ARPersonSegmentationTechnique;
    [(ARImageBasedTechnique *)&v13 requestResultDataAtTimestamp:v6 context:a3];
  }
  else
  {
    v10 = [(ARTechnique *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      __int16 v12 = [(ARTechnique *)self delegate];
      [v12 technique:self didOutputResultData:MEMORY[0x1E4F1CBF0] timestamp:v6 context:a3];
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)ARPersonSegmentationTechnique;
  if ([(ARTechnique *)&v7 isEqual:v4]) {
    BOOL v5 = self->_shouldOperateOnHighResolutionImages == v4[376];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isLoadedModelVersionCorrect:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ARPersonSegmentationTechnique;
  return [(ARMLImageProcessingTechnique *)&v4 ARMLVerifyLoadedModelVersion:a3 deviceName:@"D" major:1 minor:4];
}

- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (self->_algorithm) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_43;
  }
  int64_t v15 = [(ARMLImageProcessingTechnique *)self getDeviceOrientationFromImageData:v12];
  int64_t v16 = v15;
  if ((unint64_t)(v15 - 3) <= 1)
  {
    [(SIPeopleSegmentationAlgorithm *)self->_algorithm switchConfiguration:0];
    p_peopleSegmentationOutputLandscape = &self->_peopleSegmentationOutputLandscape;
    peopleSegmentationOutputLandscape = self->_peopleSegmentationOutputLandscape;
    if (peopleSegmentationOutputLandscape)
    {
      uint64_t v19 = 0;
      goto LABEL_16;
    }
    id v25 = objc_alloc(MEMORY[0x1E4F99C80]);
    v21 = [(SIPeopleSegmentationAlgorithm *)self->_algorithm networkConfiguration];
    uint64_t v26 = [v25 initWithConfig:v21];
    uint64_t v19 = 0;
    v23 = *p_peopleSegmentationOutputLandscape;
    *p_peopleSegmentationOutputLandscape = (SIPeopleSegmentationData *)v26;
LABEL_15:

    peopleSegmentationOutputLandscape = *p_peopleSegmentationOutputLandscape;
    goto LABEL_16;
  }
  if ((unint64_t)(v15 - 1) > 1)
  {
    uint64_t v19 = 0;
    v24 = 0;
    goto LABEL_17;
  }
  uint64_t v19 = 1;
  [(SIPeopleSegmentationAlgorithm *)self->_algorithm switchConfiguration:1];
  p_peopleSegmentationOutputLandscape = &self->_peopleSegmentationOutputPortrait;
  peopleSegmentationOutputLandscape = self->_peopleSegmentationOutputPortrait;
  if (!peopleSegmentationOutputLandscape)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F99C80]);
    v21 = [(SIPeopleSegmentationAlgorithm *)self->_algorithm networkConfiguration];
    uint64_t v22 = [v20 initWithConfig:v21];
    v23 = *p_peopleSegmentationOutputLandscape;
    *p_peopleSegmentationOutputLandscape = (SIPeopleSegmentationData *)v22;
    uint64_t v19 = 1;
    goto LABEL_15;
  }
LABEL_16:
  v24 = peopleSegmentationOutputLandscape;
LABEL_17:
  [v11 timestamp];
  -[ARMLImageProcessingTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:");
  -[SIImageInputData setInputImageBuffer:](self->_imageInputData, "setInputImageBuffer:", [v11 pixelBuffer]);
  [(SIPeopleSegmentationAlgorithm *)self->_algorithm runWithInput:self->_imageInputData output:v24 resolutionConfiguration:v19];
  [v11 timestamp];
  -[ARMLImageProcessingTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
  [v11 timestamp];
  double v28 = v27;
  v29 = (__CVBuffer *)[(SIImageInputData *)self->_imageInputData inputImageBuffer];
  if (v29)
  {
    v30 = v29;
    double v31 = (double)CVPixelBufferGetWidth(v29);
    double v32 = (double)CVPixelBufferGetHeight(v30);
  }
  else
  {
    double v31 = *MEMORY[0x1E4F1DB30];
    double v32 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  -[ARMLImageProcessingTechnique _startMLCreateResultSignpostWithTimestamp:orientation:outputSize:](self, "_startMLCreateResultSignpostWithTimestamp:orientation:outputSize:", v16, v28, v31, v32);
  [(SIPeopleSegmentationAlgorithm *)self->_algorithm getOutputResolution];
  double v34 = v33;
  double v36 = v35;
  v37 = objc_opt_new();
  if ((int)v34 == (int)width && (int)v36 == (int)height)
  {
    objc_msgSend(v37, "setPixelBuffer:", -[SIPeopleSegmentationData segmentation](v24, "segmentation"));
    goto LABEL_30;
  }
  v39 = ARCreateCVPixelBufferFromPool(&self->_scaledSegmentationOutputPixelBufferPool, 1278226488, self, @"Scaled Segmentation", width, height);
  if (!v39)
  {
    v55 = _ARLogTechnique_5();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v56 = (objc_class *)objc_opt_class();
      v57 = NSStringFromClass(v56);
      *(_DWORD *)buf = 138543618;
      v66 = v57;
      __int16 v67 = 2048;
      v68 = self;
      _os_log_impl(&dword_1B88A2000, v55, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create scaled person segmentation buffer", buf, 0x16u);
    }
    goto LABEL_41;
  }
  v40 = v39;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v61 = __121__ARPersonSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke;
  v62 = &__block_descriptor_40_e5_v8__0l;
  v63 = v39;
  int v41 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)[(SIPeopleSegmentationData *)v24 segmentation], v39, 1uLL);
  if (!v41)
  {
    [v37 setPixelBuffer:v40];
    v61((uint64_t)v60);
LABEL_30:
    segmentationRotationTechnique = self->_segmentationRotationTechnique;
    if (!segmentationRotationTechnique
      || [(ARImageRotationTechnique *)segmentationRotationTechnique rotationAngle] != a6
      || [(ARImageRotationTechnique *)self->_segmentationRotationTechnique mirrorMode])
    {
      v46 = [[ARImageRotationTechnique alloc] initWithRotation:a6 mirror:0];
      v47 = self->_segmentationRotationTechnique;
      self->_segmentationRotationTechnique = v46;
    }
    v48 = [(ARImageRotationTechnique *)self->_segmentationRotationTechnique processData:v37];
    uint64_t v49 = [v48 pixelBuffer];
    LODWORD(v49) = v49 == [(SIPeopleSegmentationData *)v24 segmentation];
    v50 = (__CVBuffer *)[v48 pixelBuffer];
    if (v49) {
      v51 = [(ARPersonSegmentationTechnique *)self _createCopyWithCVPixelBufferPoolForBuffer:v50];
    }
    else {
      v51 = CVPixelBufferRetain(v50);
    }
    v52 = v51;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __121__ARPersonSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke_33;
    v59[3] = &__block_descriptor_40_e5_v8__0l;
    v59[4] = v51;
    v53 = [ARSegmentationData alloc];
    [v12 timestamp];
    v54 = -[ARSegmentationData initWithTimestamp:segmentationBuffer:](v53, "initWithTimestamp:segmentationBuffer:", v52);
    v64 = v54;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    [v11 timestamp];
    -[ARMLImageProcessingTechnique _endMLCreateResultSignpostWithTimestamp:](self, "_endMLCreateResultSignpostWithTimestamp:");

    __121__ARPersonSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke_33((uint64_t)v59);
    goto LABEL_42;
  }
  v42 = _ARLogTechnique_5();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    v43 = (objc_class *)objc_opt_class();
    v44 = NSStringFromClass(v43);
    *(_DWORD *)buf = 138543874;
    v66 = v44;
    __int16 v67 = 2048;
    v68 = self;
    __int16 v69 = 1024;
    int v70 = v41;
    _os_log_impl(&dword_1B88A2000, v42, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample pixel buffer: %i", buf, 0x1Cu);
  }
  v61((uint64_t)v60);
LABEL_41:
  uint64_t v14 = 0;
LABEL_42:

LABEL_43:
  return v14;
}

void __121__ARPersonSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke(uint64_t a1)
{
}

void __121__ARPersonSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke_33(uint64_t a1)
{
}

- (__CVBuffer)_createCopyWithCVPixelBufferPoolForBuffer:(__CVBuffer *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_outputSegmentationCopyPixelBufferPool = &self->_outputSegmentationCopyPixelBufferPool;
  double Width = (double)CVPixelBufferGetWidth(a3);
  double Height = (double)CVPixelBufferGetHeight(a3);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  int v9 = ARCreateCVPixelBufferFromPool(p_outputSegmentationCopyPixelBufferPool, PixelFormatType, self, @"Copied person segmentation output", Width, Height);
  if (!v9)
  {
    uint64_t v14 = _ARLogTechnique_5();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int64_t v15 = (objc_class *)objc_opt_class();
      int64_t v16 = NSStringFromClass(v15);
      int v18 = 138543618;
      uint64_t v19 = v16;
      __int16 v20 = 2048;
      v21 = self;
      _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create a copied buffer for person segmentation result", (uint8_t *)&v18, 0x16u);
    }
    return 0;
  }
  v10 = v9;
  if ((ARPixelBufferCopy(a3, v9) & 1) == 0)
  {
    id v11 = _ARLogTechnique_5();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = (objc_class *)objc_opt_class();
      BOOL v13 = NSStringFromClass(v12);
      int v18 = 138543618;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      v21 = self;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to copy for person segmentation result", (uint8_t *)&v18, 0x16u);
    }
    CVPixelBufferRelease(v10);
    return 0;
  }
  return v10;
}

- (BOOL)shouldOperateOnHighResolutionImages
{
  return self->_shouldOperateOnHighResolutionImages;
}

- (void)setShouldOperateOnHighResolutionImages:(BOOL)a3
{
  self->_shouldOperateOnHighResolutionImages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleSegmentationOutputPortrait, 0);
  objc_storeStrong((id *)&self->_peopleSegmentationOutputLandscape, 0);
  objc_storeStrong((id *)&self->_imageInputData, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
  objc_storeStrong((id *)&self->_segmentationRotationTechnique, 0);
}

- (void)_prepareOnce:.cold.1()
{
  v0 = NSString;
  v1 = [NSString stringWithFormat:@"SIPeopleSegmentationAlgorithm could not be initialized!"];
  id v2 = [v0 stringWithFormat:@"ARCrash: %@", v1];
  qword_1E9EECB28 = (uint64_t)strdup((const char *)[v2 UTF8String]);

  abort();
}

@end