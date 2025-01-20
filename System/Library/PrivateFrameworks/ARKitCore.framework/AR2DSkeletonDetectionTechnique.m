@interface AR2DSkeletonDetectionTechnique
+ (CGSize)inputDimensionsForMLModel;
- (AR2DSkeletonDetectionTechnique)init;
- (double)requiredTimeInterval;
- (id)processImageDataThroughNeuralNetwork:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6;
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
@end

@implementation AR2DSkeletonDetectionTechnique

+ (CGSize)inputDimensionsForMLModel
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F4A3E8]) initWithAlgorithmMode:1];
  if (v3)
  {
    [MEMORY[0x1E4F4A408] inputDimensionsForModelWithABPKNetworkConfig:v3];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    v8 = _ARLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v13 = 138543618;
      v14 = v10;
      __int16 v15 = 2048;
      id v16 = a1;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to initialize config for ABPK 2D Detection module", (uint8_t *)&v13, 0x16u);
    }
    double v5 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v11 = v5;
  double v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (AR2DSkeletonDetectionTechnique)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    double v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    double v12 = v5;
    __int16 v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Initializing", buf, 0x16u);
  }
  double v6 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.abpk.humanpose2d");
  [(id)objc_opt_class() inputDimensionsForMLModel];
  v10.receiver = self;
  v10.super_class = (Class)AR2DSkeletonDetectionTechnique;
  double v7 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v10, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v6, 1);
  v8 = v7;
  if (v7) {
    [(ARMLImageProcessingTechnique *)v7 setUseEspressoZeroCopyOutput:1];
  }

  return v8;
}

- (void)_prepareOnce:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F4A3E8]) initWithAlgorithmMode:1];
  double v5 = (ABPK2DDetection *)[objc_alloc(MEMORY[0x1E4F4A3E0]) initWithNetworkConfig:v4];
  algorithm = self->_algorithm;
  self->_algorithm = v5;

  if (!self->_algorithm)
  {
    double v7 = _ARLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      __int16 v15 = 2048;
      id v16 = self;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: ABPK2DDetection could not be initialized!", buf, 0x16u);
    }
    if (ARSkipCrashOnCrash(void)::onceToken != -1) {
      dispatch_once(&ARSkipCrashOnCrash(void)::onceToken, &__block_literal_global_88);
    }
    if (!ARSkipCrashOnCrash(void)::skipCrashOnCrash)
    {
      objc_super v10 = NSString;
      double v11 = [NSString stringWithFormat:@"ABPK2DDetection could not be initialized!"];
      id v12 = [v10 stringWithFormat:@"ARCrash: %@", v11];
      qword_1E9EECB28 = (uint64_t)strdup((const char *)[v12 UTF8String]);

      abort();
    }
  }
}

- (double)requiredTimeInterval
{
  if (-[AR2DSkeletonDetectionTechnique requiredTimeInterval]::onceToken != -1) {
    dispatch_once(&-[AR2DSkeletonDetectionTechnique requiredTimeInterval]::onceToken, &__block_literal_global_3);
  }
  return *(double *)&-[AR2DSkeletonDetectionTechnique requiredTimeInterval]::sTimeInterval;
}

uint64_t __54__AR2DSkeletonDetectionTechnique_requiredTimeInterval__block_invoke()
{
  uint64_t result = ARIsANEVersionEqualOrPriorToH12();
  double v1 = 0.008;
  if (result) {
    double v1 = 0.016;
  }
  -[AR2DSkeletonDetectionTechnique requiredTimeInterval]::sTimeInterval = *(void *)&v1;
  return result;
}

- (id)processImageDataThroughNeuralNetwork:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  [v9 timestamp];
  -[AR2DSkeletonDetectionTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:");
  double v11 = _ARLogGeneral();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = (objc_class *)objc_opt_class();
    __int16 v13 = NSStringFromClass(v12);
    int v31 = 138543618;
    v32 = v13;
    __int16 v33 = 2048;
    v34 = self;
    _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: processImageDataThroughNeuralNetwork", (uint8_t *)&v31, 0x16u);
  }
  int64_t v14 = [(ARMLImageProcessingTechnique *)self getDeviceOrientationFromImageData:v10];
  [v10 imageResolution];
  double v16 = v15;
  double v18 = v17;
  [v9 imageResolution];
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4A438]), "initWithType:inputResolution:outputResolution:", 1, v16, v18, v19, v20);
  id v22 = objc_alloc(MEMORY[0x1E4F4A440]);
  uint64_t v23 = [v9 pixelBuffer];
  [v9 timestamp];
  v24 = objc_msgSend(v22, "initWithPixelBuffer:timestamp:abpkDeviceOrientation:preprocessingParameters:", v23, v14, v21);
  id v25 = objc_alloc(MEMORY[0x1E4F4A430]);
  uint64_t v26 = [v10 pixelBuffer];
  [v10 timestamp];
  v27 = objc_msgSend(v25, "initWithPixelBuffer:timestamp:", v26);
  algorithm = self->_algorithm;
  [v24 timestamp];
  v29 = -[ABPK2DDetection runWithMLImage:originalImage:abpkOrientation:atTimestamp:rotationOfResultTensor:](algorithm, "runWithMLImage:originalImage:abpkOrientation:atTimestamp:rotationOfResultTensor:", v24, v27, v14, a6);
  [v9 timestamp];
  -[AR2DSkeletonDetectionTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");

  return v29;
}

- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  __int16 v13 = _ARLogGeneral();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int64_t v14 = (objc_class *)objc_opt_class();
    double v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543618;
    id v22 = v15;
    __int16 v23 = 2048;
    v24 = self;
    _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: runNeuralNetworkWithImageData", buf, 0x16u);
  }
  if (self->_algorithm) {
    BOOL v16 = v11 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    double v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    [v12 timestamp];
    -[AR2DSkeletonDetectionTechnique _startMLProcessingSignpostWithTimestamp:](self, "_startMLProcessingSignpostWithTimestamp:");
    double v18 = -[AR2DSkeletonDetectionTechnique processImageDataThroughNeuralNetwork:originalImageData:regionOfInterest:rotationOfResultTensor:](self, "processImageDataThroughNeuralNetwork:originalImageData:regionOfInterest:rotationOfResultTensor:", v11, v12, a6, width, height);
    [v12 timestamp];
    -[AR2DSkeletonDetectionTechnique _endMLProcessingSignpostWithTimestamp:](self, "_endMLProcessingSignpostWithTimestamp:");
    if (v18)
    {
      double v20 = v18;
      double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    }
    else
    {
      double v17 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v17;
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

- (void).cxx_destruct
{
}

@end