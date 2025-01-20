@interface ARSIPersonDetectionTechnique
- (ARPersonDetectionData)latestResult;
- (ARSIPersonDetectionTechnique)init;
- (BOOL)isLoadedModelVersionCorrect:(id)a3;
- (double)requiredTimeInterval;
- (id)createResultDataFromAlgorithmOutput:(id)a3 imageDataForNeuralNetwork:(id)a4 inputImageData:(id)a5 rotationNeeded:(int64_t)a6 regionOfInterest:(CGSize)a7;
- (id)resultDataClasses;
- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6;
- (void)_endLoadingMLModelSignpost;
- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3;
- (void)_endMLProcessingSignpostWithTimestamp:(double)a3;
- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3;
- (void)_prepareOnce:(BOOL)a3;
- (void)_startLoadingMLModelSignpost;
- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5;
- (void)_startMLProcessingSignpostWithTimestamp:(double)a3;
- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3;
- (void)dealloc;
- (void)setLatestResult:(id)a3;
@end

@implementation ARSIPersonDetectionTechnique

- (ARSIPersonDetectionTechnique)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.persondetectiontechnique");
  v10.receiver = self;
  v10.super_class = (Class)ARSIPersonDetectionTechnique;
  v4 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v10, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v3, 1, 256.0, 256.0);
  if (v4)
  {
    v5 = _ARLogTechnique();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      __int16 v13 = 2048;
      v14 = v4;
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Running person detection technique by SceneIntelligence", buf, 0x16u);
    }
    v4->_lastTimestamp = -1.0;
    v4->_imageNetworkSize = (CGSize)vdupq_n_s64(0x4070000000000000uLL);
    v8 = +[ARKitUserDefaults objectForKey:@"com.apple.arkit.personDetectionTechnique.mergeLargelyOverlappingBoundingBoxes" useCache:0];
    v4->_mergeLargelyOverlappingBoxes = [v8 BOOLValue];

    -[ARMLImageProcessingTechnique setAllowedResamplingImageSize:](v4, "setAllowedResamplingImageSize:", 256.0, 256.0);
  }

  return v4;
}

- (void)_prepareOnce:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (SIPersonDetectorAlgorithm *)[objc_alloc(MEMORY[0x1E4F99C90]) initWithComputeEngine:1 andNetworkConfiguration:0];
  algorithm = self->_algorithm;
  self->_algorithm = v4;

  if (!self->_algorithm)
  {
    if (_ARLogGeneral(void)::onceToken != -1) {
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_110);
    }
    v6 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543618;
      __int16 v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = self;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: SIPersonDetectorAlgorithm could not be initialized!", buf, 0x16u);
    }
    if (ARSkipCrashOnCrash(void)::onceToken != -1) {
      dispatch_once(&ARSkipCrashOnCrash(void)::onceToken, &__block_literal_global_113);
    }
    if (!ARSkipCrashOnCrash(void)::skipCrashOnCrash)
    {
      v9 = NSString;
      objc_super v10 = [NSString stringWithFormat:@"SIPersonDetectorAlgorithm could not be initialized!"];
      id v11 = [v9 stringWithFormat:@"ARCrash: %@", v10];
      qword_1E9EECB28 = (uint64_t)strdup((const char *)[v11 UTF8String]);

      abort();
    }
  }
}

- (void)dealloc
{
  depthPixelBufferPool = self->_depthPixelBufferPool;
  if (depthPixelBufferPool)
  {
    CVPixelBufferPoolRelease(depthPixelBufferPool);
    self->_depthPixelBufferPool = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ARSIPersonDetectionTechnique;
  [(ARMLImageProcessingTechnique *)&v4 dealloc];
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

- (BOOL)isLoadedModelVersionCorrect:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ARSIPersonDetectionTechnique;
  return [(ARMLImageProcessingTechnique *)&v4 ARMLVerifyLoadedModelVersion:a3 deviceName:@"D" major:2 minor:1];
}

- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = v10;
  if (self->_algorithm) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    [v10 timestamp];
    -[ARSIPersonDetectionTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:");
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    -[SIPersonDetectorAlgorithm runWithInput:output:](self->_algorithm, "runWithInput:output:", [v11 pixelBuffer], v13);
    [v11 timestamp];
    -[ARSIPersonDetectionTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
    __int16 v14 = -[ARSIPersonDetectionTechnique createResultDataFromAlgorithmOutput:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:](self, "createResultDataFromAlgorithmOutput:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:", v13, v11, v11, a6, width, height);
    v17[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  return v15;
}

- (id)createResultDataFromAlgorithmOutput:(id)a3 imageDataForNeuralNetwork:(id)a4 inputImageData:(id)a5 rotationNeeded:(int64_t)a6 regionOfInterest:(CGSize)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = objc_opt_new();
  uint64_t v13 = [v10 count];
  if (v13)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      uint64_t v15 = [v10 objectAtIndexedSubscript:i];
      [v15 boundingBox];
      ARCGRectRotate(a6, v16, v17, v18, v19);
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;

      v28 = -[ARPersonDetectionResult initWithBoundingBox:]([ARPersonDetectionResult alloc], "initWithBoundingBox:", v21, v23, v25, v27);
      [v12 addObject:v28];
    }
  }
  v29 = objc_opt_new();
  [v29 setDetectedObjects:v12];
  [v11 timestamp];
  objc_msgSend(v29, "setTimestamp:");
  if (self->_mergeLargelyOverlappingBoxes)
  {
    LODWORD(v30) = 1058642330;
    v31 = [v29 mergeOverlappingDetectionsWithThreshold:v30];

    v32 = _ARLogTechnique();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      v35 = [v31 detectedObjects];
      int v37 = 138544130;
      id v38 = v34;
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 1024;
      int v42 = [v35 count];
      __int16 v43 = 1024;
      int v44 = [v12 count];
      _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Detections %d / %d.", (uint8_t *)&v37, 0x22u);
    }
  }
  else
  {
    v31 = v29;
  }

  return v31;
}

- (void)_startLoadingMLModelSignpost
{
}

- (void)_endLoadingMLModelSignpost
{
}

- (void)_startMLProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_endMLProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3
{
}

- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3
{
}

- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5
{
}

- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3
{
}

- (ARPersonDetectionData)latestResult
{
  return (ARPersonDetectionData *)objc_getProperty(self, a2, 368, 1);
}

- (void)setLatestResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestResult, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

@end