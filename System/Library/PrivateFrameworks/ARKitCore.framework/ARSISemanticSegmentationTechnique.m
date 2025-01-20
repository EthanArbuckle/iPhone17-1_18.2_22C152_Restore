@interface ARSISemanticSegmentationTechnique
+ (void)createUncertaintyMaskedSegmentationBuffer:(__CVBuffer *)a3 fromSegmentationBuffer:(__CVBuffer *)a4 uncertaintyBuffer:(__CVBuffer *)a5 maskValue:(unsigned __int8)a6;
- (ARSISemanticSegmentationTechnique)init;
- (BOOL)_scaleOutputBuffersIfNeededForTargetResolution:(CGSize)a3 segmentationPixelBuffer:(__CVBuffer *)a4 confidencePixelBuffer:(__CVBuffer *)a5 normalPixelBuffer:(__CVBuffer *)a6 uncertaintyPixelBuffer:(__CVBuffer *)a7;
- (BOOL)_scalePixelOutputBuffer:(__CVBuffer *)a3 toTargetResolution:(CGSize)a4 description:(id)a5;
- (BOOL)shouldUseSynchronizedUltraWide;
- (double)requiredTimeInterval;
- (id)_rotateImageData:(id)a3 withRotationTechnique:(id)a4 rotationNeeded:(int64_t)a5;
- (id)createResultDataFromOutputSegmentation:(__CVBuffer *)a3 outputConfidence:(__CVBuffer *)a4 outputNormalize:(__CVBuffer *)a5 outputUncertainty:(__CVBuffer *)a6 inputImageData:(id)a7 originalData:(id)a8 rotationNeeded:(int64_t)a9 regionOfInterest:(CGSize)a10;
- (id)initLegacyAlgorithmUsingSynchronizedUltrawideWhenAvailable:(BOOL)a3;
- (id)initUsingSynchronizedUltrawideWhenAvailable:(BOOL)a3;
- (id)resultDataClasses;
- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6;
- (int64_t)_mapUIDeviceOrientation:(int64_t)a3;
- (void)_captureMLRunNetworkInputImageData:(double)a3 cameraType:(int64_t)a4 imageWidth:(unint64_t)a5 imageHeight:(unint64_t)a6;
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
@end

@implementation ARSISemanticSegmentationTechnique

+ (void)createUncertaintyMaskedSegmentationBuffer:(__CVBuffer *)a3 fromSegmentationBuffer:(__CVBuffer *)a4 uncertaintyBuffer:(__CVBuffer *)a5 maskValue:(unsigned __int8)a6
{
  size_t Height = CVPixelBufferGetHeight(a4);
  size_t Width = CVPixelBufferGetWidth(a4);
  CVPixelBufferLockBaseAddress(a5, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  CVPixelBufferLockBaseAddress(a3, 0);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a4);
  v14 = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a3);
  size_t v15 = CVPixelBufferGetBytesPerRow(a5);
  v16 = (float *)CVPixelBufferGetBaseAddress(a5);
  if (Height)
  {
    uint64_t v17 = 0;
    do
    {
      size_t v18 = Width;
      v19 = BaseAddress;
      v20 = v14;
      for (i = v16; v18; --v18)
      {
        unsigned __int8 v22 = a6;
        if (*i > 0.0) {
          unsigned __int8 v22 = *v19;
        }
        *v20++ = v22;
        ++i;
        ++v19;
      }
      ++v17;
      v16 = (float *)((char *)v16 + v15);
      v14 += BytesPerRow;
      BaseAddress += BytesPerRow;
    }
    while (v17 != Height);
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  CVPixelBufferUnlockBaseAddress(a5, 1uLL);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
}

- (id)initLegacyAlgorithmUsingSynchronizedUltrawideWhenAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.semanticSegmentationTechnique");
  v12.receiver = self;
  v12.super_class = (Class)ARSISemanticSegmentationTechnique;
  v6 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v12, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v5, 1, 256.0, 192.0);
  if (v6)
  {
    v7 = _ARLogTechnique_7();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      __int16 v15 = 2048;
      v16 = v6;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Running scene segmentation technique legacy by SceneIntelligence", buf, 0x16u);
    }
    v6->_numClasses = 12;
    v6->_lastResultPushTimestamp = 0.0;
    if (v3) {
      char v10 = ARDeviceSupportsUltraWideCamera();
    }
    else {
      char v10 = 0;
    }
    v6->_shouldUseSynchronizedUltraWide = v10;
    v6->_isLegacyModel = 1;
  }

  return v6;
}

- (ARSISemanticSegmentationTechnique)init
{
  return (ARSISemanticSegmentationTechnique *)[(ARSISemanticSegmentationTechnique *)self initUsingSynchronizedUltrawideWhenAvailable:1];
}

- (id)initUsingSynchronizedUltrawideWhenAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.semanticSegmentationTechnique");
  v12.receiver = self;
  v12.super_class = (Class)ARSISemanticSegmentationTechnique;
  v6 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](&v12, sel_initWithDispatchQueue_networkInputScaleBeforeRotation_delegateInference_, v5, 1, 256.0, 192.0);
  if (v6)
  {
    v7 = _ARLogTechnique_7();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      __int16 v15 = 2048;
      v16 = v6;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Running scene segmentation technique by SceneIntelligence", buf, 0x16u);
    }
    v6->_numClasses = 34;
    v6->_lastResultPushTimestamp = 0.0;
    if (v3) {
      char v10 = ARDeviceSupportsUltraWideCamera();
    }
    else {
      char v10 = 0;
    }
    v6->_shouldUseSynchronizedUltraWide = v10;
    v6->_isLegacyModel = 0;
  }

  return v6;
}

- (void)_prepareOnce:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_isLegacyModel)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F99CA0]);
    [(ARMLImageProcessingTechnique *)self networkInputScaleBeforeRotation];
    v5 = (SISceneUnderstandingAlgorithm *)objc_msgSend(v4, "initWithInputResolution:andComputeEngine:", 1);
    sceneUnderstandingAlgorithm = self->_sceneUnderstandingAlgorithm;
    self->_sceneUnderstandingAlgorithm = v5;

    if (!self->_sceneUnderstandingAlgorithm)
    {
      v7 = _ARLogGeneral_22();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        int v19 = 138543618;
        v20 = v9;
        __int16 v21 = 2048;
        unsigned __int8 v22 = self;
        _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: SISceneUnderstandingAlgorithm could not be initialized!", (uint8_t *)&v19, 0x16u);
      }
      if (ARSkipCrashOnCrash_onceToken_1 != -1) {
        dispatch_once(&ARSkipCrashOnCrash_onceToken_1, &__block_literal_global_167);
      }
      if (!ARSkipCrashOnCrash_skipCrashOnCrash_1) {
        -[ARSISemanticSegmentationTechnique _prepareOnce:]();
      }
    }
  }
  else
  {
    +[ARKitUserDefaults floatForKey:@"com.apple.arkit.semanticSegmentation.uncertaintyThreshold"];
    int v11 = v10;
    id v12 = objc_alloc(MEMORY[0x1E4F99C98]);
    LODWORD(v13) = v11;
    v14 = (SISceneSegmentationAlgorithm *)[v12 initWithComputeEngine:1 andNetworkConfiguration:0 uncertaintyThreshold:v13];
    sceneSegmentationAlgorithm = self->_sceneSegmentationAlgorithm;
    self->_sceneSegmentationAlgorithm = v14;

    if (!self->_sceneSegmentationAlgorithm)
    {
      v16 = _ARLogGeneral_22();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = (objc_class *)objc_opt_class();
        size_t v18 = NSStringFromClass(v17);
        int v19 = 138543618;
        v20 = v18;
        __int16 v21 = 2048;
        unsigned __int8 v22 = self;
        _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: SISceneSegmentationAlgorithm could not be initialized!", (uint8_t *)&v19, 0x16u);
      }
      if (ARSkipCrashOnCrash_onceToken_1 != -1) {
        dispatch_once(&ARSkipCrashOnCrash_onceToken_1, &__block_literal_global_167);
      }
      if (!ARSkipCrashOnCrash_skipCrashOnCrash_1) {
        -[ARSISemanticSegmentationTechnique _prepareOnce:]();
      }
    }
  }
}

- (void)dealloc
{
  outputSegmentationPixelBufferPool = self->_outputSegmentationPixelBufferPool;
  if (outputSegmentationPixelBufferPool)
  {
    CVPixelBufferPoolRelease(outputSegmentationPixelBufferPool);
    self->_outputSegmentationPixelBufferPool = 0;
  }
  outputConfidencePixelBufferPool = self->_outputConfidencePixelBufferPool;
  if (outputConfidencePixelBufferPool)
  {
    CVPixelBufferPoolRelease(outputConfidencePixelBufferPool);
    self->_outputConfidencePixelBufferPool = 0;
  }
  outputNormalPixelBufferPool = self->_outputNormalPixelBufferPool;
  if (outputNormalPixelBufferPool)
  {
    CVPixelBufferPoolRelease(outputNormalPixelBufferPool);
    self->_outputNormalPixelBufferPool = 0;
  }
  scaledSegmentationOutputPixelBufferPool = self->_scaledSegmentationOutputPixelBufferPool;
  if (scaledSegmentationOutputPixelBufferPool)
  {
    CVPixelBufferPoolRelease(scaledSegmentationOutputPixelBufferPool);
    self->_scaledSegmentationOutputPixelBufferPool = 0;
  }
  scaledConfidencePixelBufferPool = self->_scaledConfidencePixelBufferPool;
  if (scaledConfidencePixelBufferPool)
  {
    CVPixelBufferPoolRelease(scaledConfidencePixelBufferPool);
    self->_scaledConfidencePixelBufferPool = 0;
  }
  scaledNormalsPixelBufferPool = self->_scaledNormalsPixelBufferPool;
  if (scaledNormalsPixelBufferPool)
  {
    CVPixelBufferPoolRelease(scaledNormalsPixelBufferPool);
    self->_scaledNormalsPixelBufferPool = 0;
  }
  outputUncertaintyPixelBufferPool = self->_outputUncertaintyPixelBufferPool;
  if (outputUncertaintyPixelBufferPool)
  {
    CVPixelBufferPoolRelease(outputUncertaintyPixelBufferPool);
    self->_outputUncertaintyPixelBufferPool = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)ARSISemanticSegmentationTechnique;
  [(ARMLImageProcessingTechnique *)&v10 dealloc];
}

- (double)requiredTimeInterval
{
  return 0.045;
}

- (id)resultDataClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (self->_sceneSegmentationAlgorithm)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_10:
    size_t v18 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_34;
  }
  if (self->_sceneUnderstandingAlgorithm) {
    BOOL v17 = v11 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17) {
    goto LABEL_10;
  }
LABEL_3:
  [v11 timestamp];
  -[ARSISemanticSegmentationTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:");
  if (self->_isLegacyModel)
  {
    [MEMORY[0x1E4F99CA0] outputResolution];
    double v14 = v13;
    double v16 = v15;
  }
  else if (self->_shouldUseSynchronizedUltraWide)
  {
    double v16 = height;
    double v14 = width;
  }
  else
  {
    int v19 = (__CVBuffer *)[v11 pixelBuffer];
    if (v19)
    {
      v20 = v19;
      double v14 = (double)CVPixelBufferGetWidth(v19);
      double v16 = (double)CVPixelBufferGetHeight(v20);
    }
    else
    {
      double v14 = *MEMORY[0x1E4F1DB30];
      double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
  }
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  CVPixelBufferRef v70 = 0;
  CVPixelBufferRef v70 = ARCreateCVPixelBufferFromPool(&self->_outputSegmentationPixelBufferPool, 1278226488, self, @"segmentation output label", v14, v16);
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  CVPixelBufferRef v66 = 0;
  CVPixelBufferRef v66 = ARCreateCVPixelBufferFromPool(&self->_outputConfidencePixelBufferPool, 1278226534, self, @"segmentation output confidence", v14, v16);
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  CVPixelBufferRef v62 = 0;
  CVPixelBufferRef v62 = ARCreateCVPixelBufferFromPool(&self->_outputNormalPixelBufferPool, 1380410945, self, @"segmentation output normal", v14, v16);
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  CVPixelBufferRef v58 = 0;
  CVPixelBufferRef v58 = ARCreateCVPixelBufferFromPool(&self->_outputUncertaintyPixelBufferPool, 1278226534, self, @"segmentation output uncertainty", v14, v16);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v49 = __125__ARSISemanticSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke;
  v50 = &unk_1E6186FF0;
  v51 = &v67;
  v52 = &v63;
  v53 = &v55;
  v54 = &v59;
  if (!v68[3] || !v64[3] || !v56[3] || self->_isLegacyModel && !v60[3])
  {
    v29 = _ARLogTechnique_7();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138543618;
      v73 = v31;
      __int16 v74 = 2048;
      v75 = self;
      _os_log_impl(&dword_1B88A2000, v29, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Pixelbuffer is nil. Returning empty result.", buf, 0x16u);
    }
    size_t v18 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_32;
  }
  int64_t v21 = [(ARMLImageProcessingTechnique *)self getDeviceOrientationFromImageData:v12];
  int64_t v22 = v21;
  if (!self->_isLegacyModel)
  {
    if ((unint64_t)(v21 - 3) < 2) {
      uint64_t v33 = 1;
    }
    else {
      uint64_t v33 = 2 * ((unint64_t)(v21 - 1) < 2);
    }
    sceneSegmentationAlgorithm = self->_sceneSegmentationAlgorithm;
    uint64_t v35 = [v11 pixelBuffer];
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)v68[3]);
    IOSurfaceRef v37 = CVPixelBufferGetIOSurface((CVPixelBufferRef)v64[3]);
    [(SISceneSegmentationAlgorithm *)sceneSegmentationAlgorithm runWithInput:v35 output:IOSurface confidenceOutput:v37 uncertaintyOutput:CVPixelBufferGetIOSurface((CVPixelBufferRef)v56[3]) resampleOutput:1 networkConfiguration:v33];
    if (!self->_shouldUseSynchronizedUltraWide
      && !-[ARSISemanticSegmentationTechnique _scaleOutputBuffersIfNeededForTargetResolution:segmentationPixelBuffer:confidencePixelBuffer:normalPixelBuffer:uncertaintyPixelBuffer:](self, "_scaleOutputBuffersIfNeededForTargetResolution:segmentationPixelBuffer:confidencePixelBuffer:normalPixelBuffer:uncertaintyPixelBuffer:", v68 + 3, v64 + 3, 0, v56 + 3, width, height))
    {
      v38 = _ARLogGeneral_22();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = (objc_class *)objc_opt_class();
        v40 = NSStringFromClass(v39);
        *(_DWORD *)buf = 138543618;
        v73 = v40;
        __int16 v74 = 2048;
        v75 = self;
        _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Output buffer scaling failed. (Non-legacy)", buf, 0x16u);
      }
      if (ARSkipCrashOnCrash_onceToken_1 != -1) {
        dispatch_once(&ARSkipCrashOnCrash_onceToken_1, &__block_literal_global_167);
      }
      if (!ARSkipCrashOnCrash_skipCrashOnCrash_1)
      {
        v41 = NSString;
        v42 = [NSString stringWithFormat:@"Output buffer scaling failed. (Non-legacy)"];
        id v43 = [v41 stringWithFormat:@"ARCrash: %@", v42];
        qword_1E9EECB28 = (uint64_t)strdup((const char *)[v43 UTF8String]);

        abort();
      }
      goto LABEL_28;
    }
    goto LABEL_42;
  }
  sceneUnderstandingAlgorithm = self->_sceneUnderstandingAlgorithm;
  uint64_t v23 = [v11 pixelBuffer];
  IOSurfaceRef v24 = CVPixelBufferGetIOSurface((CVPixelBufferRef)v68[3]);
  IOSurfaceRef v25 = CVPixelBufferGetIOSurface((CVPixelBufferRef)v64[3]);
  [(SISceneUnderstandingAlgorithm *)sceneUnderstandingAlgorithm runWithInput:v23 output:v24 confidenceOutput:v25 normalsOutput:CVPixelBufferGetIOSurface((CVPixelBufferRef)v60[3]) orientation:[(ARSISemanticSegmentationTechnique *)self _mapUIDeviceOrientation:v22]];
  if (-[ARSISemanticSegmentationTechnique _scaleOutputBuffersIfNeededForTargetResolution:segmentationPixelBuffer:confidencePixelBuffer:normalPixelBuffer:uncertaintyPixelBuffer:](self, "_scaleOutputBuffersIfNeededForTargetResolution:segmentationPixelBuffer:confidencePixelBuffer:normalPixelBuffer:uncertaintyPixelBuffer:", v68 + 3, v64 + 3, v60 + 3, 0, width, height))
  {
LABEL_42:
    [v11 timestamp];
    -[ARSISemanticSegmentationTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
    v29 = -[ARSISemanticSegmentationTechnique createResultDataFromOutputSegmentation:outputConfidence:outputNormalize:outputUncertainty:inputImageData:originalData:rotationNeeded:regionOfInterest:](self, "createResultDataFromOutputSegmentation:outputConfidence:outputNormalize:outputUncertainty:inputImageData:originalData:rotationNeeded:regionOfInterest:", v68[3], v64[3], v60[3], v56[3], v12, v11, width, height, a6);
    v71 = v29;
    size_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
LABEL_32:

    goto LABEL_33;
  }
  v26 = _ARLogGeneral_22();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138543618;
    v73 = v28;
    __int16 v74 = 2048;
    v75 = self;
    _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Output buffer scaling failed. (legacy)", buf, 0x16u);
  }
  if (ARSkipCrashOnCrash_onceToken_1 != -1) {
    dispatch_once(&ARSkipCrashOnCrash_onceToken_1, &__block_literal_global_167);
  }
  if (!ARSkipCrashOnCrash_skipCrashOnCrash_1)
  {
    v44 = NSString;
    v45 = [NSString stringWithFormat:@"Output buffer scaling failed. (legacy)"];
    id v46 = [v44 stringWithFormat:@"ARCrash: %@", v45];
    qword_1E9EECB28 = (uint64_t)strdup((const char *)[v46 UTF8String]);

    abort();
  }
LABEL_28:
  size_t v18 = 0;
LABEL_33:
  v49(v48);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
LABEL_34:

  return v18;
}

void __125__ARSISemanticSegmentationTechnique_runNeuralNetworkWithImageData_originalImageData_regionOfInterest_rotationOfResultTensor___block_invoke(void *a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(a1[4] + 8) + 24));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(a1[5] + 8) + 24));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(a1[6] + 8) + 24));
  v2 = *(__CVBuffer **)(*(void *)(a1[7] + 8) + 24);
  CVPixelBufferRelease(v2);
}

- (BOOL)_scaleOutputBuffersIfNeededForTargetResolution:(CGSize)a3 segmentationPixelBuffer:(__CVBuffer *)a4 confidencePixelBuffer:(__CVBuffer *)a5 normalPixelBuffer:(__CVBuffer *)a6 uncertaintyPixelBuffer:(__CVBuffer *)a7
{
  double height = a3.height;
  double width = a3.width;
  double v14 = *a4;
  if (*a4)
  {
    double v15 = (double)CVPixelBufferGetWidth(*a4);
    double v16 = (double)CVPixelBufferGetHeight(v14);
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB30];
    double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  BOOL v17 = width == v15 && height == v16;
  if (v17
    || (BOOL v18 = -[ARSISemanticSegmentationTechnique _scalePixelOutputBuffer:toTargetResolution:description:](self, "_scalePixelOutputBuffer:toTargetResolution:description:", a4, @"Scaled Segmentation Output", width, height))&& (BOOL v18 = -[ARSISemanticSegmentationTechnique _scalePixelOutputBuffer:toTargetResolution:description:](self, "_scalePixelOutputBuffer:toTargetResolution:description:", a5, @"Scaled Confidence Output", width, height))&& (!a6|| (BOOL v18 = -[ARSISemanticSegmentationTechnique _scalePixelOutputBuffer:toTargetResolution:description:](self, "_scalePixelOutputBuffer:toTargetResolution:description:", a6, @"Scaled Normals Output",
                 width,
                 height)))
    && (!a7
     || (BOOL v18 = [(ARSISemanticSegmentationTechnique *)self _scalePixelOutputBuffer:a7, @"Scaled Uncertainty Output", width, height toTargetResolution description])))
  {
    LOBYTE(v18) = 1;
  }
  return v18;
}

- (BOOL)_scalePixelOutputBuffer:(__CVBuffer *)a3 toTargetResolution:(CGSize)a4 description:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (a3)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(*a3);
    CVPixelBufferRef v11 = ARCreateCVPixelBufferFromPool(&self->_scaledSegmentationOutputPixelBufferPool, PixelFormatType, self, v9, width, height);
    if (v11)
    {
      id v12 = v11;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      int64_t v22 = __92__ARSISemanticSegmentationTechnique__scalePixelOutputBuffer_toTargetResolution_description___block_invoke;
      uint64_t v23 = &__block_descriptor_40_e5_v8__0l;
      CVPixelBufferRef v24 = v11;
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(*a3);
      if (IOSurface)
      {
        size_t BytesPerElement = IOSurfaceGetBytesPerElement(IOSurface);
        int v15 = ARResizeBufferWithNearestNeighbors(*a3, v12, BytesPerElement);
        if (!v15)
        {
          CVPixelBufferRelease(*a3);
          *a3 = CVPixelBufferRetain(v12);
          BOOL v19 = 1;
          goto LABEL_11;
        }
        double v16 = _ARLogTechnique_7();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          BOOL v17 = (objc_class *)objc_opt_class();
          BOOL v18 = NSStringFromClass(v17);
          *(_DWORD *)buf = 138544130;
          v26 = v18;
          __int16 v27 = 2048;
          v28 = self;
          __int16 v29 = 2112;
          id v30 = v9;
          __int16 v31 = 1024;
          int v32 = v15;
          _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample pixel buffer (%@): %i", buf, 0x26u);
        }
      }
      BOOL v19 = 0;
LABEL_11:
      v22((uint64_t)v21);
      goto LABEL_12;
    }
  }
  BOOL v19 = 0;
LABEL_12:

  return v19;
}

void __92__ARSISemanticSegmentationTechnique__scalePixelOutputBuffer_toTargetResolution_description___block_invoke(uint64_t a1)
{
}

- (id)createResultDataFromOutputSegmentation:(__CVBuffer *)a3 outputConfidence:(__CVBuffer *)a4 outputNormalize:(__CVBuffer *)a5 outputUncertainty:(__CVBuffer *)a6 inputImageData:(id)a7 originalData:(id)a8 rotationNeeded:(int64_t)a9 regionOfInterest:(CGSize)a10
{
  id v15 = a7;
  double v16 = objc_opt_new();
  [v16 setPixelBuffer:a3];
  BOOL v17 = objc_opt_new();
  [v17 setPixelBuffer:a4];
  segmentationRotationTechnique = self->_segmentationRotationTechnique;
  if (!segmentationRotationTechnique
    || [(ARImageRotationTechnique *)segmentationRotationTechnique rotationAngle] != a9
    || [(ARImageRotationTechnique *)self->_segmentationRotationTechnique mirrorMode])
  {
    BOOL v19 = [[ARImageRotationTechnique alloc] initWithRotation:a9 mirror:0];
    v20 = self->_segmentationRotationTechnique;
    self->_segmentationRotationTechnique = v19;

    int64_t v21 = [[ARImageRotationTechnique alloc] initWithRotation:a9 mirror:0];
    confidenceUncertaintyRotationTechnique = self->_confidenceUncertaintyRotationTechnique;
    self->_confidenceUncertaintyRotationTechnique = v21;
  }
  uint64_t v23 = [(ARSISemanticSegmentationTechnique *)self _rotateImageData:v16 withRotationTechnique:self->_segmentationRotationTechnique rotationNeeded:a9];
  [(ARSISemanticSegmentationTechnique *)self _rotateImageData:v17 withRotationTechnique:self->_confidenceUncertaintyRotationTechnique rotationNeeded:a9];
  id v46 = v45 = v23;
  if (!a6 || self->_isLegacyModel)
  {
    __int16 v31 = [ARSegmentationData alloc];
    [v15 timestamp];
    id v30 = -[ARSegmentationData initWithTimestamp:segmentationBuffer:confidenceBuffer:source:](v31, "initWithTimestamp:segmentationBuffer:confidenceBuffer:source:", [v23 pixelBuffer], objc_msgSend(v46, "pixelBuffer"), 2, v32);
  }
  else
  {
    id v43 = a5;
    CVPixelBufferRef v24 = objc_opt_new();
    [v24 setPixelBuffer:a6];
    [(ARSISemanticSegmentationTechnique *)self _rotateImageData:v24 withRotationTechnique:self->_confidenceUncertaintyRotationTechnique rotationNeeded:a9];
    v44 = v17;
    IOSurfaceRef v25 = v16;
    __int16 v27 = v26 = v15;
    v28 = [ARSegmentationData alloc];
    [v26 timestamp];
    id v30 = -[ARSegmentationData initWithTimestamp:segmentationBuffer:confidenceBuffer:uncertaintyBuffer:source:](v28, "initWithTimestamp:segmentationBuffer:confidenceBuffer:uncertaintyBuffer:source:", [v23 pixelBuffer], objc_msgSend(v46, "pixelBuffer"), objc_msgSend(v27, "pixelBuffer"), 2, v29);

    id v15 = v26;
    double v16 = v25;
    BOOL v17 = v44;

    a5 = v43;
  }
  if (a5 && self->_isLegacyModel)
  {
    normalsRotationTechnique = self->_normalsRotationTechnique;
    if (!normalsRotationTechnique
      || [(ARImageRotationTechnique *)normalsRotationTechnique rotationAngle] != a9
      || [(ARImageRotationTechnique *)self->_normalsRotationTechnique mirrorMode])
    {
      v34 = [[ARImageRotationTechnique alloc] initWithRotation:a9 mirror:0];
      uint64_t v35 = self->_normalsRotationTechnique;
      self->_normalsRotationTechnique = v34;
    }
    v36 = objc_opt_new();
    [v36 setPixelBuffer:a5];
    IOSurfaceRef v37 = [(ARSISemanticSegmentationTechnique *)self _rotateImageData:v36 withRotationTechnique:self->_normalsRotationTechnique rotationNeeded:a9];
    -[ARSegmentationData setNormalsBuffer:](v30, "setNormalsBuffer:", [v37 pixelBuffer]);
  }
  v38 = [v15 originalImage];
  [(ARSegmentationData *)v30 setSourceImageData:v38];

  v39 = [(ARSegmentationData *)v30 sourceImageData];
  [v39 timestamp];
  v40 = [(ARSegmentationData *)v30 sourceImageData];
  v41 = [v40 cameraType];
  [v41 isEqualToString:*MEMORY[0x1E4F15828]];
  CVPixelBufferGetWidth([(ARSegmentationData *)v30 segmentationBuffer]);
  CVPixelBufferGetHeight([(ARSegmentationData *)v30 segmentationBuffer]);
  kdebug_trace();

  return v30;
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

- (void)_captureMLRunNetworkInputImageData:(double)a3 cameraType:(int64_t)a4 imageWidth:(unint64_t)a5 imageHeight:(unint64_t)a6
{
}

- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5
{
}

- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3
{
}

- (int64_t)_mapUIDeviceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  else {
    return qword_1B8A52FF8[a3 - 1];
  }
}

- (id)_rotateImageData:(id)a3 withRotationTechnique:(id)a4 rotationNeeded:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [a4 processData:v8];

  if (a5 && v9 == v8)
  {
    objc_super v10 = _ARLogTechnique_7();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CVPixelBufferRef v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v16 = 138543618;
      BOOL v17 = v12;
      __int16 v18 = 2048;
      BOOL v19 = self;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not rotate image data.", (uint8_t *)&v16, 0x16u);
    }
    double v13 = [(ARTechnique *)self delegate];
    double v14 = ARErrorWithCodeAndUserInfo(151, 0);
    [v13 technique:self didFailWithError:v14];
  }
  return v9;
}

- (BOOL)shouldUseSynchronizedUltraWide
{
  return self->_shouldUseSynchronizedUltraWide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneUnderstandingAlgorithm, 0);
  objc_storeStrong((id *)&self->_sceneSegmentationAlgorithm, 0);
  objc_storeStrong((id *)&self->_confidenceUncertaintyRotationTechnique, 0);
  objc_storeStrong((id *)&self->_segmentationRotationTechnique, 0);
  objc_storeStrong((id *)&self->_normalsRotationTechnique, 0);
}

- (void)_prepareOnce:.cold.1()
{
  v0 = NSString;
  v1 = [NSString stringWithFormat:@"SISceneSegmentationAlgorithm could not be initialized!"];
  id v2 = [v0 stringWithFormat:@"ARCrash: %@", v1];
  qword_1E9EECB28 = (uint64_t)strdup((const char *)[v2 UTF8String]);

  abort();
}

- (void)_prepareOnce:.cold.2()
{
  v0 = NSString;
  v1 = [NSString stringWithFormat:@"SISceneUnderstandingAlgorithm could not be initialized!"];
  id v2 = [v0 stringWithFormat:@"ARCrash: %@", v1];
  qword_1E9EECB28 = (uint64_t)strdup((const char *)[v2 UTF8String]);

  abort();
}

@end