@interface ARDepthTechnique
- (ADJasperColorPipelineParameters)pipelineParameters;
- (ARDepthTechnique)init;
- (ARDepthTechnique)initWithPrioritization:(int64_t)a3 temporalSmoothing:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (__CVBuffer)_executeLKTWithFrame:(__CVBuffer *)a3;
- (__CVBuffer)opticalFlowOutputBuffer;
- (double)requiredTimeInterval;
- (id)_rotatedPixelBufferImageData:(__CVBuffer *)a3;
- (id)createResultDataFromTensors:(id *)a3 numberOfOutputTensors:(unint64_t)a4 imageDataForNeuralNetwork:(id)a5 inputImageData:(id)a6 rotationNeeded:(int64_t)a7 regionOfInterest:(CGSize)a8;
- (id)networkModesForOrientation:(int64_t)a3;
- (id)resultDataClasses;
- (int)bindInputBuffer:(unint64_t)a3 withImage:(id)a4 andOriginalImageData:(id)a5 rotationOfResultTensor:(int64_t)a6;
- (int)prepareBindInputBuffer:(unint64_t)a3 withName:(id)a4;
- (int64_t)depthDataSource;
- (int64_t)prioritization;
- (void)_allocateLKTBuffers;
- (void)_captureMLRunNetworkInputImageData:(double)a3 cameraType:(int64_t)a4 imageWidth:(unint64_t)a5 imageHeight:(unint64_t)a6;
- (void)_endLoadingMLModelSignpost;
- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3;
- (void)_endMLProcessingSignpostWithTimestamp:(double)a3;
- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3;
- (void)_initLKT;
- (void)_startLoadingMLModelSignpost;
- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5;
- (void)_startMLProcessingSignpostWithTimestamp:(double)a3;
- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3;
- (void)_updateOpticalFlowOutputBufferInBackgroundFromImageData:(id)a3;
- (void)dealloc;
- (void)networkModeDidChange:(id)a3 toMode:(id)a4;
- (void)setOpticalFlowOutputBuffer:(__CVBuffer *)a3;
@end

@implementation ARDepthTechnique

- (ARDepthTechnique)init
{
  return [(ARDepthTechnique *)self initWithPrioritization:1 temporalSmoothing:0];
}

- (ARDepthTechnique)initWithPrioritization:(int64_t)a3 temporalSmoothing:(BOOL)a4
{
  BOOL v4 = a4;
  v55[2] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 5)
  {
    v8 = _ARLogGeneral_32();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "Unhandled ADDepthPrioritization", buf, 2u);
    }

    double v6 = 0.0;
    double v7 = 0.0;
  }
  else
  {
    double v6 = dbl_1B8A535E0[a3];
    double v7 = dbl_1B8A53608[a3];
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F4D808]) initWithInputPrioritization:a3];
  v10 = [v9 inferenceDescriptor];
  v11 = [v10 colorInput];
  v12 = [v11 name];
  v55[0] = v12;
  v13 = [v10 jasperInput];
  v14 = [v13 name];
  v55[1] = v14;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];

  v15 = [v10 depthOutput];
  v16 = [v15 name];
  v54[0] = v16;
  v17 = [v10 confidenceOutput];
  v18 = [v17 name];
  v54[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];

  if (v4)
  {
    int64_t v20 = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.appleDepth.temporalSmoothingMethod"];
    v21 = _ARLogTechnique_11();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543874;
      v49 = v23;
      __int16 v50 = 2048;
      v51 = self;
      __int16 v52 = 2048;
      int64_t v53 = v20;
      _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Temporal smoothing enabled, using method: %ld", buf, 0x20u);
    }
    v24 = v9;
    if (v20 == 2)
    {
      v25 = [v10 alphaMapOutput];

      if (v25)
      {
        v26 = [v10 alphaMapOutput];
        v27 = [v26 name];
        uint64_t v28 = [v19 arrayByAddingObject:v27];

        int v29 = 1;
        int64_t v20 = 2;
        v19 = (void *)v28;
      }
      else
      {
        int v29 = 1;
        int64_t v20 = 2;
      }
    }
    else
    {
      int v29 = 0;
    }
  }
  else
  {
    int v29 = 0;
    int64_t v20 = 0;
    v24 = v9;
  }
  v30 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.depthtechnique");
  v31 = [v10 networkURL];
  v32 = [v31 absoluteString];
  v47.receiver = self;
  v47.super_class = (Class)ARDepthTechnique;
  v33 = -[ARMLImageProcessingTechnique initWithDispatchQueue:inputTensorNames:outputTensorNames:networkInputScaleBeforeRotation:networkFilePath:](&v47, sel_initWithDispatchQueue_inputTensorNames_outputTensorNames_networkInputScaleBeforeRotation_networkFilePath_, v30, v46, v19, v32, v6, v7);

  if (v33)
  {
    v33->_prioritization = a3;
    v33->_outputSize.width = v6;
    v33->_outputSize.height = v7;
    objc_storeStrong((id *)&v33->_pipeline, v24);
    uint64_t v34 = [(ADJasperColorPipeline *)v33->_pipeline pipelineParameters];
    pipelineParameters = v33->_pipelineParameters;
    v33->_pipelineParameters = (ADJasperColorPipelineParameters *)v34;

    objc_storeStrong((id *)&v33->_inferenceDescriptor, v10);
    v36 = [v10 alphaMapOutput];
    v33->_alphamapAvailable = v36 != 0;

    v33->_outputDepthPixelBufferPool = 0;
    v33->_outputConfidencePixelBufferPool = 0;
    v33->_outputConfidenceMapPixelBufferPool = 0;
    v33->_outputAlphaPixelBufferPool = 0;
    v33->_scaledDepthOutputPixelBufferPool = 0;
    v33->_scaledConfidenceOutputPixelBufferPool = 0;
    v33->_scaledConfidenceMapPixelBufferPool = 0;
    v33->_outputTemporalConsistentDepthPixelBufferPool = 0;
    v33->_outputTemporalConsistentConfidencePixelBufferPool = 0;
    v33->_scaledTemporallyConsistentDepthOutputPixelBufferPool = 0;
    v33->_scaledTemporallyConsistentConfidenceOutputPixelBufferPool = 0;
    v33->_previousDepthBuffer = 0;
    v33->_previousConfidenceBuffer = 0;
    v33->_layout = 0;
    v33->_temporalConsistencyMethod = v20;
    if (v29) {
      [(ARDepthTechnique *)v33 _initLKT];
    }
    v33->_BOOL computeNormals = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.appleDepth.computeNormals", self];
    v37 = _ARLogTechnique_11();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      BOOL computeNormals = v33->_computeNormals;
      *(_DWORD *)buf = 138543874;
      v49 = v39;
      if (computeNormals) {
        v41 = @"Enabled";
      }
      else {
        v41 = @"Disabled";
      }
      __int16 v50 = 2048;
      v51 = v33;
      __int16 v52 = 2112;
      int64_t v53 = (int64_t)v41;
      _os_log_impl(&dword_1B88A2000, v37, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Compute normals: %@", buf, 0x20u);
    }
    if (v33->_computeNormals)
    {
      uint64_t v42 = objc_opt_new();
      normalsHelperBuffer = v33->_normalsHelperBuffer;
      v33->_normalsHelperBuffer = (ADNormalsBuffer *)v42;
    }
  }

  return v33;
}

- (void)dealloc
{
  [(ARDepthTechnique *)self setOpticalFlowOutputBuffer:0];
  CVPixelBufferRelease(self->_previousDepthBuffer);
  CVPixelBufferRelease(self->_previousConfidenceBuffer);
  CVPixelBufferRelease(self->_jasperInputBuffer);
  CVPixelBufferRelease(self->_previousWarpedDepthBuffer);
  CVPixelBufferRelease(self->_previousWarpedConfidenceBuffer);
  CVPixelBufferPoolRelease(self->_outputDepthPixelBufferPool);
  CVPixelBufferPoolRelease(self->_outputConfidencePixelBufferPool);
  CVPixelBufferPoolRelease(self->_outputConfidenceMapPixelBufferPool);
  CVPixelBufferPoolRelease(self->_outputTemporalConsistentDepthPixelBufferPool);
  CVPixelBufferPoolRelease(self->_outputTemporalConsistentConfidencePixelBufferPool);
  CVPixelBufferPoolRelease(self->_outputAlphaPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledDepthOutputPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledConfidenceOutputPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledConfidenceMapPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledTemporallyConsistentDepthOutputPixelBufferPool);
  CVPixelBufferPoolRelease(self->_scaledTemporallyConsistentConfidenceOutputPixelBufferPool);
  CVPixelBufferPoolRelease(self->_opticalFlowPixelBufferPool);
  CVPixelBufferPoolRelease(self->_normalPixelBufferPool);
  v3.receiver = self;
  v3.super_class = (Class)ARDepthTechnique;
  [(ARMLImageProcessingTechnique *)&v3 dealloc];
}

- (int64_t)depthDataSource
{
  return 2;
}

- (void)_initLKT
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  self->_currentFrameIndex = 0;
  objc_super v3 = [(ADJasperColorPipeline *)self->_pipeline LKTTexturesDescriptor];
  lktDescriptor = self->_lktDescriptor;
  self->_lktDescriptor = v3;

  ARCreateFixedPriorityDispatchQueue("com.apple.arkit.depthtechnique.lkt");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  lktProcessingQueue = self->_lktProcessingQueue;
  self->_lktProcessingQueue = v5;

  self->_opticalFlowOutputBufferLock._os_unfair_lock_opaque = 0;
  double v7 = [MEMORY[0x1E4F1CA48] array];
  features = self->_features;
  self->_features = v7;

  v9 = [MEMORY[0x1E4F1CA48] array];
  derivatives = self->_derivatives;
  self->_derivatives = v9;

  v11 = [MEMORY[0x1E4F1CA48] array];
  pyramids = self->_pyramids;
  self->_pyramids = v11;

  self->_int64_t storedFramesCount = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.appleDepth.temporalFilteringStoredFrames"];
  v13 = _ARLogTechnique_11();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    int64_t storedFramesCount = self->_storedFramesCount;
    int v27 = 138543874;
    uint64_t v28 = v15;
    __int16 v29 = 2048;
    v30 = self;
    __int16 v31 = 2048;
    int64_t v32 = storedFramesCount;
    _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using %ti stored frames for temporal filtering", (uint8_t *)&v27, 0x20u);
  }
  v17 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v17;

  v19 = self->_device;
  if (v19)
  {
    int64_t v20 = (MTLCommandQueue *)[(MTLDevice *)v19 newCommandQueue];
    commandQueue = self->_commandQueue;
    self->_commandQueue = v20;

    if (self->_commandQueue)
    {
      [(ARDepthTechnique *)self _allocateLKTBuffers];
      return;
    }
    v22 = _ARLogTechnique_11();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v26);
      int v27 = 138543618;
      uint64_t v28 = v24;
      __int16 v29 = 2048;
      v30 = self;
      v25 = "%{public}@ <%p>: Couldn't create command queue for temporal filtering";
      goto LABEL_10;
    }
  }
  else
  {
    v22 = _ARLogTechnique_11();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      int v27 = 138543618;
      uint64_t v28 = v24;
      __int16 v29 = 2048;
      v30 = self;
      v25 = "%{public}@ <%p>: Couldn't create system default device for temporal filtering";
LABEL_10:
      _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v27, 0x16u);
    }
  }
}

- (void)_allocateLKTBuffers
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_features removeAllObjects];
  [(NSMutableArray *)self->_derivatives removeAllObjects];
  [(NSMutableArray *)self->_pyramids removeAllObjects];
  CVPixelBufferRelease(self->_previousDepthBuffer);
  self->_previousDepthBuffer = 0;
  id v3 = objc_alloc(MEMORY[0x1E4F4D818]);
  device = self->_device;
  [(ADLKTTexturesDescriptor *)self->_lktDescriptor inputSizeForLayout:self->_layout];
  double v6 = v5;
  double v8 = v7;
  lktDescriptor = self->_lktDescriptor;
  if (lktDescriptor)
  {
    [(ADLKTTexturesDescriptor *)lktDescriptor opticalFlowConfig];
    uint64_t v10 = v59;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v61 = 0;
    long long v59 = 0u;
    long long v60 = 0u;
  }
  v11 = (ADLKTOpticalFlow *)objc_msgSend(v3, "initWithDevice:inputSize:scales:", device, v10, v6, v8);
  lkt = self->_lkt;
  self->_lkt = v11;

  if (self->_lkt)
  {
    if (self->_storedFramesCount >= 1)
    {
      int64_t v13 = 0;
      do
      {
        v14 = [MEMORY[0x1E4F1CA48] array];
        [(NSMutableArray *)self->_features setObject:v14 atIndexedSubscript:v13];

        v15 = [MEMORY[0x1E4F1CA48] array];
        [(NSMutableArray *)self->_derivatives setObject:v15 atIndexedSubscript:v13];

        v16 = [MEMORY[0x1E4F1CA48] array];
        [(NSMutableArray *)self->_pyramids setObject:v16 atIndexedSubscript:v13];

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        v17 = [(ADLKTTexturesDescriptor *)self->_lktDescriptor pyramidsDescriptors];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v55 objects:v64 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v56 != v19) {
                objc_enumerationMutation(v17);
              }
              v21 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              v22 = [(NSMutableArray *)self->_pyramids objectAtIndexedSubscript:v13];
              [v21 sizeForLayout:self->_layout];
              v25 = textureForSizeWithPixelFormatAndMetalDevice([v21 pixelFormat], self->_device, v23, v24);
              [v22 addObject:v25];
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v55 objects:v64 count:16];
          }
          while (v18);
        }

        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v26 = [(ADLKTTexturesDescriptor *)self->_lktDescriptor featuresDescriptors];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v63 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v52 != v28) {
                objc_enumerationMutation(v26);
              }
              v30 = *(void **)(*((void *)&v51 + 1) + 8 * j);
              __int16 v31 = [(NSMutableArray *)self->_features objectAtIndexedSubscript:v13];
              [v30 sizeForLayout:self->_layout];
              uint64_t v34 = textureForSizeWithPixelFormatAndMetalDevice([v30 pixelFormat], self->_device, v32, v33);
              [v31 addObject:v34];
            }
            uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v63 count:16];
          }
          while (v27);
        }

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v35 = [(ADLKTTexturesDescriptor *)self->_lktDescriptor derivitivesDescriptors];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v47 objects:v62 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v48;
          do
          {
            for (uint64_t k = 0; k != v36; ++k)
            {
              if (*(void *)v48 != v37) {
                objc_enumerationMutation(v35);
              }
              v39 = *(void **)(*((void *)&v47 + 1) + 8 * k);
              v40 = [(NSMutableArray *)self->_derivatives objectAtIndexedSubscript:v13];
              [v39 sizeForLayout:self->_layout];
              v43 = textureForSizeWithPixelFormatAndMetalDevice([v39 pixelFormat], self->_device, v41, v42);
              [v40 addObject:v43];
            }
            uint64_t v36 = [v35 countByEnumeratingWithState:&v47 objects:v62 count:16];
          }
          while (v36);
        }

        ++v13;
      }
      while (v13 < self->_storedFramesCount);
    }
  }
  else
  {
    v44 = _ARLogTechnique_11();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v45 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v45);
      *(_DWORD *)buf = 138543618;
      v66 = v46;
      __int16 v67 = 2048;
      v68 = self;
      _os_log_impl(&dword_1B88A2000, v44, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Couldn't create DFLKTOpticalFlow for temporal filtering", buf, 0x16u);
    }
  }
}

- (void)setOpticalFlowOutputBuffer:(__CVBuffer *)a3
{
  opticalFlowOutputBuffer = self->_opticalFlowOutputBuffer;
  if (opticalFlowOutputBuffer != a3)
  {
    CVPixelBufferRelease(opticalFlowOutputBuffer);
    self->_opticalFlowOutputBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (__CVBuffer)_executeLKTWithFrame:(__CVBuffer *)a3
{
  int64_t currentFrameIndex = self->_currentFrameIndex;
  int64_t storedFramesCount = currentFrameIndex;
  if (!currentFrameIndex) {
    int64_t storedFramesCount = self->_storedFramesCount;
  }
  int64_t v27 = storedFramesCount;
  uint64_t v7 = bindPixelBufferToMTL2DTextureWithMetalDevice(a3, self->_device);
  double v8 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  lkt = self->_lkt;
  uint64_t v10 = [(NSMutableArray *)self->_pyramids objectAtIndexedSubscript:currentFrameIndex];
  v11 = [(NSMutableArray *)self->_features objectAtIndexedSubscript:currentFrameIndex];
  v12 = [(NSMutableArray *)self->_derivatives objectAtIndexedSubscript:currentFrameIndex];
  int64_t v13 = lkt;
  v14 = (void *)v7;
  [(ADLKTOpticalFlow *)v13 encodePyramidFeaturesToCommandBuffer:v8 colorTexture:v7 outPyramidsArray:v10 outFeaturesArray:v11 outDerivitiveArray:v12];

  [v8 commit];
  if (!self->_previousDepthBuffer)
  {
    v17 = 0;
LABEL_10:
    [v8 waitUntilCompleted];
    self->_int64_t currentFrameIndex = (currentFrameIndex + 1) % self->_storedFramesCount;
    goto LABEL_11;
  }
  if (a3)
  {
    double Width = (double)CVPixelBufferGetWidth(a3);
    double Height = (double)CVPixelBufferGetHeight(a3);
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  uint64_t v18 = ARCreateCVPixelBufferFromPool(&self->_opticalFlowPixelBufferPool, 843264104, self, @"Optical Flow", Width, Height);
  v17 = v18;
  if (v18)
  {
    int64_t v19 = v27 - 1;
    __int16 v29 = bindPixelBufferToMTL2DTextureWithMetalDevice(v18, self->_device);
    int64_t v20 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];

    uint64_t v28 = self->_lkt;
    v21 = [(NSMutableArray *)self->_features objectAtIndexedSubscript:currentFrameIndex];
    v22 = [(NSMutableArray *)self->_derivatives objectAtIndexedSubscript:currentFrameIndex];
    [(NSMutableArray *)self->_features objectAtIndexedSubscript:v19];
    double v23 = v30 = (void *)v7;
    double v24 = [(NSMutableArray *)self->_derivatives objectAtIndexedSubscript:v19];
    v25 = [(NSMutableArray *)self->_pyramids objectAtIndexedSubscript:currentFrameIndex];
    [(ADLKTOpticalFlow *)v28 encodeOpticalFlowSolverToCommandBuffer:v20 currentFeaturesArray:v21 currentDerivitiveArray:v22 previousFeaturesArray:v23 previousDerivitiveArray:v24 currentPyramidsArray:v25 outShiftMap:v29];

    v14 = v30;
    [v20 commit];

    double v8 = v20;
    goto LABEL_10;
  }
LABEL_11:

  return v17;
}

- (double)requiredTimeInterval
{
  return dbl_1B8A535D0[self->_prioritization == 3];
}

- (id)resultDataClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (int)prepareBindInputBuffer:(unint64_t)a3 withName:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(ADEspressoJasperColorInferenceDescriptor *)self->_inferenceDescriptor colorInput];
  double v8 = [v7 name];
  char v9 = [v6 isEqualToString:v8];

  if (v9) {
    goto LABEL_2;
  }
  if (a3 > 1)
  {
    int v10 = -1;
    goto LABEL_10;
  }
  [(ARMLImageProcessingTechnique *)self espressoNetwork];
  [v6 UTF8String];
  [(ARMLImageProcessingTechnique *)self espressoInputTensorsData];
  int v10 = espresso_network_bind_buffer();
  if (v10) {
    goto LABEL_10;
  }
  CVPixelBufferRelease(self->_jasperInputBuffer);
  CFAllocatorRef v27 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v30 = [(ADEspressoJasperColorInferenceDescriptor *)self->_inferenceDescriptor jasperInput];
  __int16 v29 = [v30 imageDescriptor];
  [v29 sizeForLayout:self->_layout];
  size_t v25 = (unint64_t)v11;
  uint64_t v28 = [(ADEspressoJasperColorInferenceDescriptor *)self->_inferenceDescriptor jasperInput];
  v26 = [v28 imageDescriptor];
  [v26 sizeForLayout:self->_layout];
  size_t v24 = (unint64_t)v12;
  int64_t v13 = [(ADEspressoJasperColorInferenceDescriptor *)self->_inferenceDescriptor jasperInput];
  v14 = [v13 imageDescriptor];
  OSType v15 = [v14 pixelFormat];
  v16 = (void *)[(ARMLImageProcessingTechnique *)self espressoInputTensorsData][168 * a3];
  v17 = [(ADEspressoJasperColorInferenceDescriptor *)self->_inferenceDescriptor jasperInput];
  uint64_t v18 = [v17 imageDescriptor];
  [v18 sizeForLayout:self->_layout];
  LODWORD(v16) = CVPixelBufferCreateWithBytes(v27, v25, v24, v15, v16, vcvtd_n_u64_f64(v19, 2uLL), 0, 0, 0, &self->_jasperInputBuffer);

  if (!v16)
  {
LABEL_2:
    int v10 = 0;
  }
  else
  {
    int64_t v20 = _ARLogTechnique_11();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543618;
      double v32 = v22;
      __int16 v33 = 2048;
      uint64_t v34 = self;
      _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Couldn't allocate pixel buffer for jasper point projection", buf, 0x16u);
    }
    int v10 = -4;
  }
LABEL_10:

  return v10;
}

- (void)_updateOpticalFlowOutputBufferInBackgroundFromImageData:(id)a3
{
  lktProcessingQueue = self->_lktProcessingQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(lktProcessingQueue);
  os_unfair_lock_lock(&self->_opticalFlowOutputBufferLock);
  [v5 timestamp];
  kdebug_trace();
  id v6 = -[ARDepthTechnique _executeLKTWithFrame:](self, "_executeLKTWithFrame:", [v5 pixelBuffer]);
  [(ARDepthTechnique *)self setOpticalFlowOutputBuffer:v6];
  CVPixelBufferRelease(v6);
  [v5 timestamp];

  kdebug_trace();
  os_unfair_lock_unlock(&self->_opticalFlowOutputBufferLock);
}

- (int)bindInputBuffer:(unint64_t)a3 withImage:(id)a4 andOriginalImageData:(id)a5 rotationOfResultTensor:(int64_t)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (a3 != 1)
  {
    if (!a3)
    {
      if (self->_temporalConsistencyMethod == 2 && [v10 pixelBuffer])
      {
        objc_initWeak((id *)location, self);
        lktProcessingQueue = self->_lktProcessingQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __90__ARDepthTechnique_bindInputBuffer_withImage_andOriginalImageData_rotationOfResultTensor___block_invoke;
        block[3] = &unk_1E6185200;
        objc_copyWeak(&v36, (id *)location);
        id v35 = v10;
        dispatch_async(lktProcessingQueue, block);

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)location);
      }
      v33.receiver = self;
      v33.super_class = (Class)ARDepthTechnique;
      int v13 = [(ARMLImageProcessingTechnique *)&v33 bindInputBuffer:0 withImage:v10 andOriginalImageData:v11 rotationOfResultTensor:a6];
      goto LABEL_26;
    }
    v16 = _ARLogTechnique_11();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      *(_DWORD *)location = 138543874;
      *(void *)&location[4] = v18;
      __int16 v38 = 2048;
      v39 = self;
      __int16 v40 = 2048;
      unint64_t v41 = a3;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Index not supported: %lu", location, 0x20u);
    }
LABEL_18:

    int v13 = -1;
    goto LABEL_26;
  }
  unint64_t v14 = [(ARMLImageProcessingTechnique *)self getDeviceOrientationFromImageData:v11]- 1;
  if (v14 > 2) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = qword_1B8A53630[v14];
  }
  v16 = [v11 originalImage];
  double v19 = [v16 pointCloud];
  int64_t v20 = [v19 depthPointCloud];

  if (!v20)
  {
    size_t v25 = _ARLogTechnique_11();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      CFAllocatorRef v27 = NSStringFromClass(v26);
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v27;
      __int16 v38 = 2048;
      v39 = self;
      _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No depth point cloud found", location, 0x16u);
    }
    goto LABEL_18;
  }
  v21 = (__CVBuffer *)[v16 pixelBuffer];
  if (v21)
  {
    v22 = v21;
    double Width = (double)CVPixelBufferGetWidth(v21);
    double Height = (double)CVPixelBufferGetHeight(v22);
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  [v10 timestamp];
  kdebug_trace();
  uint64_t v28 = -[ADJasperColorPipeline projectJasperPoints:cropTo:rotateBy:projectedPointsBuffer:](self->_pipeline, "projectJasperPoints:cropTo:rotateBy:projectedPointsBuffer:", v20, v15, self->_jasperInputBuffer, 0.0, 0.0, Width, Height);
  [v10 timestamp];
  [v20 length];
  kdebug_trace();
  if (v28)
  {
    __int16 v29 = _ARLogTechnique_11();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = (objc_class *)objc_opt_class();
      __int16 v31 = NSStringFromClass(v30);
      *(_DWORD *)location = 138543874;
      *(void *)&location[4] = v31;
      __int16 v38 = 2048;
      v39 = self;
      __int16 v40 = 2048;
      unint64_t v41 = -1;
      _os_log_impl(&dword_1B88A2000, v29, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Couldn't project jasper points: %ld", location, 0x20u);
    }
    int v13 = -1;
  }
  else
  {
    int v13 = 0;
  }

LABEL_26:
  return v13;
}

void __90__ARDepthTechnique_bindInputBuffer_withImage_andOriginalImageData_rotationOfResultTensor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateOpticalFlowOutputBufferInBackgroundFromImageData:*(void *)(a1 + 32)];
}

- (id)networkModesForOrientation:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 3) > 1)
  {
    if ((unint64_t)(a3 - 1) > 1)
    {
      id v5 = _ARLogGeneral_32();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = (objc_class *)objc_opt_class();
        uint64_t v7 = NSStringFromClass(v6);
        int v10 = 138543874;
        id v11 = v7;
        __int16 v12 = 2048;
        int v13 = self;
        __int16 v14 = 2048;
        int64_t v15 = a3;
        _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find a network config for the device orientation %ld", (uint8_t *)&v10, 0x20u);
      }
    }
    else
    {
      self->_layout = 0;
    }
  }
  else
  {
    self->_layout = 1;
  }
  double v8 = [(ADEspressoJasperColorInferenceDescriptor *)self->_inferenceDescriptor configurationNameForLayout:"configurationNameForLayout:"];
  return v8;
}

- (void)networkModeDidChange:(id)a3 toMode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ARDepthTechnique;
  [(ARMLImageProcessingTechnique *)&v5 networkModeDidChange:a3 toMode:a4];
  CVPixelBufferRelease(self->_previousDepthBuffer);
  self->_previousDepthBuffer = 0;
  CVPixelBufferRelease(self->_previousConfidenceBuffer);
  self->_previousConfidenceBuffer = 0;
  if (self->_temporalConsistencyMethod == 2) {
    [(ARDepthTechnique *)self _allocateLKTBuffers];
  }
}

- (id)createResultDataFromTensors:(id *)a3 numberOfOutputTensors:(unint64_t)a4 imageDataForNeuralNetwork:(id)a5 inputImageData:(id)a6 rotationNeeded:(int64_t)a7 regionOfInterest:(CGSize)a8
{
  double height = a8.height;
  double width = a8.width;
  uint64_t v303 = *MEMORY[0x1E4F143B8];
  id v223 = a5;
  id v224 = a6;
  unint64_t var5 = a3->var5;
  unint64_t var4 = a3->var4;
  double v13 = (double)var4;
  double v14 = (double)var5;
  uint64_t v297 = 0;
  v298 = &v297;
  uint64_t v299 = 0x2020000000;
  CVPixelBufferRef v300 = 0;
  p_outputDepthPixelBufferPool = &self->_outputDepthPixelBufferPool;
  v225 = self;
  CVPixelBufferRef v300 = ARCreateCVPixelBufferFromPool(&self->_outputDepthPixelBufferPool, 1717855600, self, @"Depth Output", (double)var4, (double)var5);
  if (!v298[3])
  {
    double v32 = 0;
    goto LABEL_146;
  }
  v293[0] = MEMORY[0x1E4F143A8];
  v293[1] = 3221225472;
  v294 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke;
  v295 = &unk_1E6185480;
  v296 = &v297;
  uint64_t v289 = 0;
  v290 = &v289;
  uint64_t v291 = 0x2020000000;
  CVPixelBufferRef v292 = 0;
  CVPixelBufferRef v292 = ARCreateCVPixelBufferFromPool(&self->_outputConfidencePixelBufferPool, 1717855600, self, @"Confidence Ouput", v13, v14);
  if (v290[3])
  {
    v285[0] = MEMORY[0x1E4F143A8];
    v285[1] = 3221225472;
    v286 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_2;
    v287 = &unk_1E6185480;
    v288 = &v289;
    uint64_t v281 = 0;
    v282 = &v281;
    uint64_t v283 = 0x2020000000;
    CVPixelBufferRef v284 = 0;
    CVPixelBufferRef v284 = ARCreateCVPixelBufferFromPool(&self->_outputConfidenceMapPixelBufferPool, 1278226488, self, @"Confidence Map Ouput", v13, v14);
    if (!v282[3])
    {
      double v32 = 0;
LABEL_144:
      _Block_object_dispose(&v281, 8);
      v286((uint64_t)v285);
      goto LABEL_145;
    }
    v277[0] = MEMORY[0x1E4F143A8];
    v277[1] = 3221225472;
    v278 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_3;
    v279 = &unk_1E6185480;
    v280 = &v281;
    CVPixelBufferRef v276 = 0;
    CVPixelBufferRef v275 = 0;
    v212 = [(ADEspressoJasperColorInferenceDescriptor *)self->_inferenceDescriptor depthOutput];
    v210 = [v212 imageDescriptor];
    [v210 sizeForLayout:self->_layout];
    double v16 = v15;
    v17 = [(ADEspressoJasperColorInferenceDescriptor *)self->_inferenceDescriptor depthOutput];
    uint64_t v18 = [v17 imageDescriptor];
    [v18 sizeForLayout:self->_layout];
    double v20 = v19;
    v21 = [(ADEspressoJasperColorInferenceDescriptor *)self->_inferenceDescriptor depthOutput];
    v22 = [v21 imageDescriptor];
    OSType v23 = [v22 pixelFormat];
    size_t v24 = *(void **)[(ARMLImageProcessingTechnique *)self espressoOutputTensorsData];
    size_t v25 = [(ADEspressoJasperColorInferenceDescriptor *)v225->_inferenceDescriptor depthOutput];
    v26 = [v25 imageDescriptor];
    [v26 sizeForLayout:v225->_layout];
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CVReturn v28 = CVPixelBufferCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)v16, (unint64_t)v20, v23, v24, vcvtd_n_u64_f64(v27, 2uLL), 0, 0, 0, &v276);

    if (v28)
    {
      __int16 v29 = _ARLogTechnique_11();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        __int16 v31 = NSStringFromClass(v30);
        buf.columns[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v31;
        buf.columns[0].i16[6] = 2048;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
        _os_log_impl(&dword_1B88A2000, v29, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Couldn't allocate pixel buffer for raw depth output", (uint8_t *)&buf, 0x16u);
      }
      double v32 = 0;
      goto LABEL_143;
    }
    v271[0] = MEMORY[0x1E4F143A8];
    v271[1] = 3221225472;
    v272 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_32;
    v273 = &__block_descriptor_40_e5_v8__0l;
    CVPixelBufferRef v274 = v276;
    v213 = [(ADEspressoJasperColorInferenceDescriptor *)v225->_inferenceDescriptor confidenceOutput];
    v211 = [v213 imageDescriptor];
    [v211 sizeForLayout:v225->_layout];
    double v34 = v33;
    id v35 = [(ADEspressoJasperColorInferenceDescriptor *)v225->_inferenceDescriptor confidenceOutput];
    id v36 = [v35 imageDescriptor];
    [v36 sizeForLayout:v225->_layout];
    double v38 = v37;
    v39 = [(ADEspressoJasperColorInferenceDescriptor *)v225->_inferenceDescriptor confidenceOutput];
    __int16 v40 = [v39 imageDescriptor];
    OSType v41 = [v40 pixelFormat];
    uint64_t v42 = (void *)[(ARMLImageProcessingTechnique *)v225 espressoOutputTensorsData][168];
    v43 = [(ADEspressoJasperColorInferenceDescriptor *)v225->_inferenceDescriptor confidenceOutput];
    v44 = [v43 imageDescriptor];
    [v44 sizeForLayout:v225->_layout];
    CVReturn v46 = CVPixelBufferCreateWithBytes(allocator, (unint64_t)v34, (unint64_t)v38, v41, v42, vcvtd_n_u64_f64(v45, 2uLL), 0, 0, 0, &v275);

    if (v46)
    {
      long long v47 = _ARLogTechnique_11();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        long long v48 = (objc_class *)objc_opt_class();
        long long v49 = NSStringFromClass(v48);
        buf.columns[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v49;
        buf.columns[0].i16[6] = 2048;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
        _os_log_impl(&dword_1B88A2000, v47, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Couldn't allocate pixel buffer for raw confidence output", (uint8_t *)&buf, 0x16u);
      }
      double v32 = 0;
      goto LABEL_142;
    }
    v267[0] = MEMORY[0x1E4F143A8];
    v267[1] = 3221225472;
    v268 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_33;
    v269 = &__block_descriptor_40_e5_v8__0l;
    CVPixelBufferRef v270 = v275;
    [v224 timestamp];
    uint64_t v50 = (uint64_t)v225;
    kdebug_trace();
    uint64_t v51 = [(ADJasperColorPipeline *)v225->_pipeline postProcessWithDepth:v276 confidence:v275 depthOutput:v298[3] confidenceOutput:v290[3]];
    [v224 timestamp];
    kdebug_trace();
    if (v51)
    {
      long long v52 = _ARLogTechnique_11();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        long long v53 = (objc_class *)objc_opt_class();
        NSStringFromClass(v53);
        id v54 = (id)objc_claimAutoreleasedReturnValue();
        buf.columns[0].i32[0] = 138543874;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v54;
        buf.columns[0].i16[6] = 2048;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
        buf.columns[1].i16[3] = 2048;
        buf.columns[1].i64[1] = v51;
        _os_log_impl(&dword_1B88A2000, v52, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to post process AppleDepth pipeline output: %li", (uint8_t *)&buf, 0x20u);
      }
      uint64_t v50 = (uint64_t)v225;
    }
    uint64_t v55 = [*(id *)(v50 + 344) postProcessConfidence:v275 confidenceOutput:v282[3] confidenceUnits:1];
    if (v55)
    {
      long long v56 = _ARLogTechnique_11();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        long long v57 = (objc_class *)objc_opt_class();
        long long v58 = NSStringFromClass(v57);
        buf.columns[0].i32[0] = 138543874;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v58;
        buf.columns[0].i16[6] = 2048;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = v50;
        buf.columns[1].i16[3] = 2048;
        buf.columns[1].i64[1] = v55;
        _os_log_impl(&dword_1B88A2000, v56, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to post process AppleDepth confidence map output: %li", (uint8_t *)&buf, 0x20u);
      }
      double v32 = 0;
LABEL_141:
      v268((uint64_t)v267);
LABEL_142:
      v272((uint64_t)v271);
LABEL_143:
      v278((uint64_t)v277);
      goto LABEL_144;
    }
    uint64_t v263 = 0;
    v264 = &v263;
    uint64_t v265 = 0x2020000000;
    uint64_t v266 = 0;
    uint64_t v259 = 0;
    v260 = &v259;
    uint64_t v261 = 0x2020000000;
    uint64_t v262 = 0;
    v254[0] = MEMORY[0x1E4F143A8];
    v254[1] = 3221225472;
    v255 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_34;
    v256 = &unk_1E61877B8;
    v257 = &v263;
    v258 = &v259;
    uint64_t v59 = *(void *)(v50 + 720);
    if (*(void *)(v50 + 360) && v59 == 2)
    {
      buf.columns[0].i64[0] = 0;
      buf.columns[0].i64[1] = (uint64_t)&buf;
      buf.columns[1] = (simd_float4)0x2020000000uLL;
      v250[0] = MEMORY[0x1E4F143A8];
      v250[1] = 3221225472;
      v251 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_2_35;
      v252 = &unk_1E6185480;
      p_simd_float4x4 buf = &buf;
      if (*(unsigned char *)(v50 + 376))
      {
        long long v60 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 432), 1717855600, (void *)v50, @"Alpha Ouput", v13, v14);
        *(void *)(buf.columns[0].i64[1] + 24) = v60;
        if (v60)
        {
          CVPixelBufferLockBaseAddress(v60, 0);
          BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(buf.columns[0].i64[1] + 24));
          memcpy(BaseAddress, *(const void **)([(id)v50 espressoOutputTensorsData] + 336), vcvtd_n_u64_f64(v13 * v14, 2uLL));
          CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(buf.columns[0].i64[1] + 24), 0);
        }
        else
        {
          v63 = _ARLogTechnique_11();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v64 = (objc_class *)objc_opt_class();
            v65 = NSStringFromClass(v64);
            v301.columns[0].i32[0] = 138543618;
            *(uint64_t *)((char *)v301.columns[0].i64 + 4) = (uint64_t)v65;
            v301.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&v301.columns[0].i64[1] + 6) = (uint64_t)v225;
            _os_log_impl(&dword_1B88A2000, v63, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create alpha buffer for generating optical flow result pixelbuffer", (uint8_t *)&v301, 0x16u);
          }
          uint64_t v50 = (uint64_t)v225;
        }
      }
      if (*(void *)(v50 + 504))
      {
        CVPixelBufferRef v66 = ARCreateCVPixelBufferFromPool(p_outputDepthPixelBufferPool, 1717855600, (void *)v50, @"temporally smoothed depth buffer", v13, v14);
        v264[3] = (uint64_t)v66;
        if (!v66)
        {
          v68 = _ARLogTechnique_11();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v72 = (objc_class *)objc_opt_class();
            v73 = NSStringFromClass(v72);
            v301.columns[0].i32[0] = 138543618;
            *(uint64_t *)((char *)v301.columns[0].i64 + 4) = (uint64_t)v73;
            v301.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&v301.columns[0].i64[1] + 6) = v50;
            _os_log_impl(&dword_1B88A2000, v68, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create pixel buffer for generating optical flow result pixelbuffer", (uint8_t *)&v301, 0x16u);
          }
          goto LABEL_43;
        }
        os_unfair_lock_lock((os_unfair_lock_t)(v50 + 640));
        [v224 timestamp];
        kdebug_trace();
        uint64_t v67 = [*(id *)(v50 + 344) warpAndFuseWithCurrDepth:v298[3] prevDepth:*(void *)(v50 + 504) opticalFlow:*(void *)(v50 + 744) alphaMap:*(void *)(buf.columns[0].i64[1] + 24) depthOutput:v264[3]];
        [v224 timestamp];
        kdebug_trace();
        [(id)v50 setOpticalFlowOutputBuffer:0];
        os_unfair_lock_unlock((os_unfair_lock_t)(v50 + 640));
        if (v67)
        {
          v68 = _ARLogTechnique_11();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            uint64_t v69 = (objc_class *)objc_opt_class();
            v70 = NSStringFromClass(v69);
            v301.columns[0].i32[0] = 138543874;
            *(uint64_t *)((char *)v301.columns[0].i64 + 4) = (uint64_t)v70;
            v301.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&v301.columns[0].i64[1] + 6) = v50;
            v301.columns[1].i16[3] = 2048;
            v301.columns[1].i64[1] = v67;
            _os_log_impl(&dword_1B88A2000, v68, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to warp and fuse AppleDepth pipeline output: %li", (uint8_t *)&v301, 0x20u);
          }
LABEL_43:

          uint64_t v50 = (uint64_t)v225;
LABEL_46:
          v251((uint64_t)v250);
          _Block_object_dispose(&buf, 8);
          goto LABEL_94;
        }
        CVPixelBufferRelease(*(CVPixelBufferRef *)(v50 + 504));
        v71 = v264;
      }
      else
      {
        v71 = v298;
      }
      v74 = (__CVBuffer *)v71[3];
      *(void *)(v50 + 504) = v74;
      CVPixelBufferRetain(v74);
      goto LABEL_46;
    }
    if (v59 != 1)
    {
      if (var4 == (int)width && var5 == (int)height) {
        goto LABEL_96;
      }
LABEL_94:
      CVPixelBufferRef v137 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 440), 1717855600, (void *)v50, @"Scaled Depth Ouput", width, height);
      v138 = v137;
      if (!v137) {
        goto LABEL_130;
      }
      v246[0] = MEMORY[0x1E4F143A8];
      v246[1] = 3221225472;
      v247 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_54;
      v248 = &__block_descriptor_40_e5_v8__0l;
      CVPixelBufferRef v249 = v137;
      [v224 timestamp];
      kdebug_trace();
      __int32 v139 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)v298[3], v138, 4uLL);
      [v224 timestamp];
      kdebug_trace();
      if (v139)
      {
        v140 = _ARLogTechnique_11();
        if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
        {
          v141 = (objc_class *)objc_opt_class();
          NSStringFromClass(v141);
          id v142 = (id)objc_claimAutoreleasedReturnValue();
          buf.columns[0].i32[0] = 138543874;
          *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v142;
          buf.columns[0].i16[6] = 2048;
          *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
          buf.columns[1].i16[3] = 1024;
          buf.columns[1].i32[2] = v139;
          _os_log_impl(&dword_1B88A2000, v140, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample pixel buffer: %i", (uint8_t *)&buf, 0x1Cu);
        }
        uint64_t v50 = (uint64_t)v225;
      }
      else
      {
        CVPixelBufferRelease((CVPixelBufferRef)v298[3]);
        CVPixelBufferRef v163 = CVPixelBufferRetain(v138);
        v298[3] = (uint64_t)v163;
      }
      v247((uint64_t)v246);
      if (v139) {
        goto LABEL_130;
      }
      if (v264[3])
      {
        v164 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 464), 1717855600, (void *)v50, @"Scaled Temporally Consistent Depth Ouput", width, height);
        v165 = v164;
        if (!v164) {
          goto LABEL_130;
        }
        v242[0] = MEMORY[0x1E4F143A8];
        v242[1] = 3221225472;
        v243 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_58;
        v244 = &__block_descriptor_40_e5_v8__0l;
        v245 = v164;
        __int32 v166 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)v264[3], v164, 4uLL);
        if (v166)
        {
          v167 = _ARLogTechnique_11();
          if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
          {
            v168 = (objc_class *)objc_opt_class();
            NSStringFromClass(v168);
            id v169 = (id)objc_claimAutoreleasedReturnValue();
            buf.columns[0].i32[0] = 138543874;
            *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v169;
            buf.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
            buf.columns[1].i16[3] = 1024;
            buf.columns[1].i32[2] = v166;
            _os_log_impl(&dword_1B88A2000, v167, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample temporally consistent depth buffer: %i", (uint8_t *)&buf, 0x1Cu);
          }
          uint64_t v50 = (uint64_t)v225;
        }
        else
        {
          CVPixelBufferRelease((CVPixelBufferRef)v264[3]);
          CVPixelBufferRef v173 = CVPixelBufferRetain(v165);
          v264[3] = (uint64_t)v173;
        }
        v243((uint64_t)v242);
        if (v166) {
          goto LABEL_130;
        }
      }
      v174 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 448), 1717855600, (void *)v50, @"Scaled Depth Confidence Ouput", width, height);
      v175 = v174;
      if (!v174) {
        goto LABEL_130;
      }
      v238[0] = MEMORY[0x1E4F143A8];
      v238[1] = 3221225472;
      v239 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_62;
      v240 = &__block_descriptor_40_e5_v8__0l;
      v241 = v174;
      __int32 v176 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)v290[3], v174, 4uLL);
      if (v176)
      {
        v177 = _ARLogTechnique_11();
        if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
        {
          v178 = (objc_class *)objc_opt_class();
          NSStringFromClass(v178);
          id v179 = (id)objc_claimAutoreleasedReturnValue();
          buf.columns[0].i32[0] = 138543874;
          *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v179;
          buf.columns[0].i16[6] = 2048;
          *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
          buf.columns[1].i16[3] = 1024;
          buf.columns[1].i32[2] = v176;
          _os_log_impl(&dword_1B88A2000, v177, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample pixel buffer: %i", (uint8_t *)&buf, 0x1Cu);
        }
        uint64_t v50 = (uint64_t)v225;
      }
      else
      {
        CVPixelBufferRelease((CVPixelBufferRef)v290[3]);
        CVPixelBufferRef v180 = CVPixelBufferRetain(v175);
        v290[3] = (uint64_t)v180;
      }
      v239((uint64_t)v238);
      if (v176) {
        goto LABEL_130;
      }
      if (v260[3])
      {
        v181 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 464), 1717855600, (void *)v50, @"Scaled Temporally Consistent Depth Confidence Ouput", width, height);
        v182 = v181;
        if (!v181) {
          goto LABEL_130;
        }
        v234[0] = MEMORY[0x1E4F143A8];
        v234[1] = 3221225472;
        v235 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_66;
        v236 = &__block_descriptor_40_e5_v8__0l;
        v237 = v181;
        __int32 v183 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)v260[3], v181, 4uLL);
        if (v183)
        {
          v184 = _ARLogTechnique_11();
          if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
          {
            v185 = (objc_class *)objc_opt_class();
            NSStringFromClass(v185);
            id v186 = (id)objc_claimAutoreleasedReturnValue();
            buf.columns[0].i32[0] = 138543874;
            *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v186;
            buf.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
            buf.columns[1].i16[3] = 1024;
            buf.columns[1].i32[2] = v183;
            _os_log_impl(&dword_1B88A2000, v184, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample temporally consistent confidence buffer: %i", (uint8_t *)&buf, 0x1Cu);
          }
        }
        else
        {
          CVPixelBufferRelease((CVPixelBufferRef)v260[3]);
          CVPixelBufferRef v187 = CVPixelBufferRetain(v182);
          v260[3] = (uint64_t)v187;
        }
        v235((uint64_t)v234);
        uint64_t v50 = (uint64_t)v225;
        if (v183) {
          goto LABEL_130;
        }
      }
      v188 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v50 + 456), 1278226488, (void *)v50, @"Scaled Depth Confidence Map Ouput", width, height);
      v189 = v188;
      if (!v188) {
        goto LABEL_130;
      }
      v230[0] = MEMORY[0x1E4F143A8];
      v230[1] = 3221225472;
      v231 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_70;
      v232 = &__block_descriptor_40_e5_v8__0l;
      v233 = v188;
      __int32 v190 = ARResizeBufferWithNearestNeighbors((__CVBuffer *)v282[3], v188, 1uLL);
      if (v190)
      {
        v191 = _ARLogTechnique_11();
        if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
        {
          v192 = (objc_class *)objc_opt_class();
          NSStringFromClass(v192);
          id v193 = (id)objc_claimAutoreleasedReturnValue();
          buf.columns[0].i32[0] = 138543874;
          *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v193;
          buf.columns[0].i16[6] = 2048;
          *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
          buf.columns[1].i16[3] = 1024;
          buf.columns[1].i32[2] = v190;
          _os_log_impl(&dword_1B88A2000, v191, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample confidence buffer: %i", (uint8_t *)&buf, 0x1Cu);
        }
      }
      else
      {
        CVPixelBufferRelease((CVPixelBufferRef)v282[3]);
        CVPixelBufferRef v194 = CVPixelBufferRetain(v189);
        v282[3] = (uint64_t)v194;
      }
      v231((uint64_t)v230);
      uint64_t v50 = (uint64_t)v225;
      if (v190)
      {
LABEL_130:
        double v32 = 0;
      }
      else
      {
LABEL_96:
        v127 = *(void **)(v50 + 616);
        int64_t v128 = a7;
        if (!v127 || [v127 rotationAngle] != a7 || objc_msgSend(*(id *)(v50 + 616), "mirrorMode"))
        {
          v129 = [[ARImageRotationTechnique alloc] initWithRotation:a7 mirror:0];
          v130 = *(void **)(v50 + 616);
          *(void *)(v50 + 616) = v129;

          uint64_t v50 = (uint64_t)v225;
          int64_t v128 = a7;
        }
        v131 = *(void **)(v50 + 624);
        if (!v131 || [v131 rotationAngle] != v128 || objc_msgSend(*(id *)(v50 + 624), "mirrorMode"))
        {
          v132 = [[ARImageRotationTechnique alloc] initWithRotation:v128 mirror:0];
          v133 = *(void **)(v50 + 624);
          *(void *)(v50 + 624) = v132;

          uint64_t v50 = (uint64_t)v225;
        }
        [v224 timestamp];
        kdebug_trace();
        v222 = [(id)v50 _rotatedPixelBufferImageData:v298[3]];
        v134 = [(id)v50 _rotatedPixelBufferImageData:v290[3]];
        v135 = [(id)v50 _rotatedPixelBufferImageData:v282[3]];
        if (v264[3])
        {
          objc_msgSend((id)v50, "_rotatedPixelBufferImageData:");
          id v136 = (id)objc_claimAutoreleasedReturnValue();

          uint64_t v50 = (uint64_t)v225;
        }
        else
        {
          id v136 = 0;
        }
        if (v260[3])
        {
          objc_msgSend((id)v50, "_rotatedPixelBufferImageData:");
          id v143 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v143 = 0;
        }
        [v224 timestamp];
        kdebug_trace();
        if (v136 && v143)
        {
          v144 = [ARMLDepthData alloc];
          [v224 timestamp];
          v146 = -[ARMLDepthData initWithTimestamp:depthBuffer:confidenceBuffer:source:](v144, "initWithTimestamp:depthBuffer:confidenceBuffer:source:", [v136 pixelBuffer], objc_msgSend(v143, "pixelBuffer"), 2, v145);
          -[ARMLDepthData setSingleFrameDepthBuffer:](v146, "setSingleFrameDepthBuffer:", [v222 pixelBuffer]);
          -[ARMLDepthData setSingleFrameConfidenceBuffer:](v146, "setSingleFrameConfidenceBuffer:", [v134 pixelBuffer]);
        }
        else
        {
          v147 = [ARMLDepthData alloc];
          [v224 timestamp];
          v146 = -[ARMLDepthData initWithTimestamp:depthBuffer:confidenceBuffer:source:](v147, "initWithTimestamp:depthBuffer:confidenceBuffer:source:", [v222 pixelBuffer], objc_msgSend(v134, "pixelBuffer"), 2, v148);
        }
        -[ARMLDepthData setConfidenceMap:](v146, "setConfidenceMap:", [v135 pixelBuffer]);
        v149 = [v224 originalImage];
        [(ARMLDepthData *)v146 setSourceImageData:v149];

        if (v225->_computeNormals)
        {
          v150 = [(ARMLDepthData *)v146 singleFrameDepthBuffer];
          v151 = v150;
          if (v150)
          {
            size_t v152 = CVPixelBufferGetWidth(v150);
            size_t v153 = CVPixelBufferGetHeight(v151);
            double v154 = (double)v152;
            double v155 = (double)v153;
          }
          else
          {
            double v154 = *MEMORY[0x1E4F1DB30];
            double v155 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          }
          CVPixelBufferRef v156 = ARCreateCVPixelBufferFromPool(&v225->_normalPixelBufferPool, 1380410945, v225, @"Normals Map", v154, v155);
          v226[0] = MEMORY[0x1E4F143A8];
          v226[1] = 3221225472;
          v227 = __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_75;
          v228 = &__block_descriptor_40_e5_v8__0l;
          CVPixelBufferRef v229 = v156;
          if (v156)
          {
            [v224 cameraIntrinsics];
            uint64_t v218 = v158;
            double v220 = v157;
            [v224 timestamp];
            kdebug_trace();
            uint64_t v159 = objc_msgSend(MEMORY[0x1E4F4D850], "normalsFromDepth:focalLength:principalPoint:normalsOutput:withHelperBuffer:", -[ARMLDepthData depthBuffer](v146, "depthBuffer"), v156, v225->_normalsHelperBuffer, v220, *(float *)&v218, *((float *)&v218 + 1));
            [v224 timestamp];
            kdebug_trace();
            if (v159)
            {
              v160 = _ARLogTechnique_11();
              if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
              {
                v161 = (objc_class *)objc_opt_class();
                NSStringFromClass(v161);
                id v162 = (id)objc_claimAutoreleasedReturnValue();
                buf.columns[0].i32[0] = 138543874;
                *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v162;
                buf.columns[0].i16[6] = 2048;
                *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
                buf.columns[1].i16[3] = 2048;
                buf.columns[1].i64[1] = v159;
                _os_log_impl(&dword_1B88A2000, v160, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to generate normal map: %li", (uint8_t *)&buf, 0x20u);
              }
            }
            else
            {
              [(ARMLDepthData *)v146 setNormalsBuffer:v156];
            }
          }
          v227((uint64_t)v226);
        }
        [(ARMLDepthData *)v146 timestamp];
        kdebug_trace();
        [(ARMLDepthData *)v146 timestamp];
        v170 = [(ARMLDepthData *)v146 sourceImageData];
        v171 = [v170 cameraType];
        [v171 isEqualToString:*MEMORY[0x1E4F15828]];
        kdebug_trace();

        [(ARMLDepthData *)v146 timestamp];
        [v224 cameraIntrinsics];
        [v224 cameraIntrinsics];
        [v224 cameraIntrinsics];
        kdebug_trace();
        double v32 = v146;
      }
      v255((uint64_t)v254);
      _Block_object_dispose(&v259, 8);
      _Block_object_dispose(&v263, 8);
      goto LABEL_141;
    }
    if (a7 == -90)
    {
      uint64_t v62 = 3;
    }
    else if (a7 == 180)
    {
      uint64_t v62 = 2;
    }
    else
    {
      uint64_t v62 = a7 == 90;
    }
    *(double *)v75.i64 = matrixForImageRotation(v62);
    simd_float4 v203 = v76;
    simd_float4 v205 = v75;
    simd_float4 v199 = v78;
    simd_float4 v201 = v77;
    v79 = (void *)MEMORY[0x1E4F4D860];
    [v224 visionTransform];
    objc_msgSend(v79, "transformMetersToMillimiters:");
    float32x4_t v219 = v80;
    float32x4_t v215 = v81;
    *(_OWORD *)allocatora = v82;
    float32x4_t v207 = v83;
    v84 = [v224 calibrationData];

    if (v84)
    {
      id v85 = objc_alloc(MEMORY[0x1E4F4D840]);
      v86 = [v224 calibrationData];
      v87 = objc_msgSend(v85, "ar_initWithImageData:calibrationData:", v224, v86);

      v88 = objc_opt_new();
      [v87 setDistortionModel:v88];

      [v87 adjustForImageRotation:v62];
      [v87 referenceDimensions];
      v89 = v225;
      double v91 = v90;
      [v87 referenceDimensions];
      double v93 = (double)var5;
      if (v91 * v13 != v92 * v14)
      {
        [v87 referenceDimensions];
        double v95 = v94;
        [v87 referenceDimensions];
        double v93 = v95 * v13 / v96;
      }
      objc_msgSend(v87, "scale:", v13, v93);
    }
    else
    {
      v87 = 0;
      v89 = v225;
    }
    previousDepthBuffer = v89->_previousDepthBuffer;
    v98 = &OBJC_IVAR___ARFrame__exifData;
    if (!previousDepthBuffer || !v89->_previousConfidenceBuffer)
    {
      CVPixelBufferRelease(previousDepthBuffer);
      v225->_previousDepthBuffer = CVPixelBufferRetain((CVPixelBufferRef)v298[3]);
      CVPixelBufferRelease(v225->_previousConfidenceBuffer);
      CVPixelBufferRef v111 = CVPixelBufferRetain((CVPixelBufferRef)v290[3]);
      v112 = v225;
      v225->_previousConfidenceBuffer = v111;
LABEL_93:
      *(float32x4_t *)v112->_anon_220 = v219;
      *(float32x4_t *)&v112->_anon_220[16] = v215;
      *(_OWORD *)&v112->_anon_220[32] = *(_OWORD *)allocatora;
      *(float32x4_t *)&v112->_anon_220[48] = v207;
      objc_storeStrong((id *)((char *)&v112->super.super.super.super.isa + v98[469]), v87);

      uint64_t v50 = (uint64_t)v225;
      goto LABEL_94;
    }
    p_outputTemporalConsistentDepthPixelBufferPool = &v89->_outputTemporalConsistentDepthPixelBufferPool;
    CVPixelBufferRef v100 = ARCreateCVPixelBufferFromPool(&v89->_outputTemporalConsistentDepthPixelBufferPool, 1717855600, v89, @"temporally consistent depth buffer", v13, v14);
    v264[3] = (uint64_t)v100;
    CVPixelBufferRef v101 = ARCreateCVPixelBufferFromPool(&v225->_outputTemporalConsistentConfidencePixelBufferPool, 1717855600, v225, @"temporally consistent confidence buffer", v13, v14);
    v260[3] = (uint64_t)v101;
    if (!v264[3] || !v101)
    {
      v113 = _ARLogTechnique_11();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        v114 = (objc_class *)objc_opt_class();
        v115 = NSStringFromClass(v114);
        buf.columns[0].i32[0] = 138543618;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v115;
        buf.columns[0].i16[6] = 2048;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
        _os_log_impl(&dword_1B88A2000, v113, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create pixel buffer for generating optical flow result pixelbuffer", (uint8_t *)&buf, 0x16u);
      }
      v112 = v225;
      v98 = &OBJC_IVAR___ARFrame__exifData;
      goto LABEL_93;
    }
    os_unfair_lock_lock(&v225->_opticalFlowOutputBufferLock);
    [v224 timestamp];
    kdebug_trace();
    simd_float4x4 v305 = __invert_f4(*(simd_float4x4 *)v225->_anon_220);
    uint64_t v102 = 0;
    simd_float4x4 v301 = v305;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v102] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v219, COERCE_FLOAT(*(_OWORD *)&v301.columns[v102])), v215, *(float32x2_t *)v301.columns[v102].f32, 1), *(float32x4_t *)allocatora, (float32x4_t)v301.columns[v102], 2), v207, (float32x4_t)v301.columns[v102], 3);
      ++v102;
    }
    while (v102 != 4);
    float32x4_t v197 = (float32x4_t)buf.columns[1];
    locuint64_t k = (float32x4_t)buf.columns[0];
    float32x4_t v195 = (float32x4_t)buf.columns[3];
    float32x4_t v196 = (float32x4_t)buf.columns[2];
    v306.columns[1] = v203;
    v306.columns[0] = v205;
    v306.columns[3] = v199;
    v306.columns[2] = v201;
    simd_float4x4 v307 = __invert_f4(v306);
    uint64_t v103 = 0;
    v301.columns[0] = v205;
    v301.columns[1] = v203;
    v301.columns[2] = v201;
    v301.columns[3] = v199;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v103] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(lock, COERCE_FLOAT(*(_OWORD *)&v301.columns[v103])), v197, *(float32x2_t *)v301.columns[v103].f32, 1), v196, (float32x4_t)v301.columns[v103], 2), v195, (float32x4_t)v301.columns[v103], 3);
      ++v103;
    }
    while (v103 != 4);
    uint64_t v104 = 0;
    simd_float4x4 v301 = buf;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v104] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v307.columns[0], COERCE_FLOAT(*(_OWORD *)&v301.columns[v104])), (float32x4_t)v307.columns[1], *(float32x2_t *)v301.columns[v104].f32, 1), (float32x4_t)v307.columns[2], (float32x4_t)v301.columns[v104], 2), (float32x4_t)v307.columns[3], (float32x4_t)v301.columns[v104], 3);
      ++v104;
    }
    while (v104 != 4);
    double v204 = *(double *)buf.columns[1].i64;
    double v206 = *(double *)buf.columns[0].i64;
    double v200 = *(double *)buf.columns[3].i64;
    double v202 = *(double *)buf.columns[2].i64;
    previousWarpedDepthBuffer = v225->_previousWarpedDepthBuffer;
    if (previousWarpedDepthBuffer)
    {
      size_t v106 = CVPixelBufferGetWidth(v225->_previousWarpedDepthBuffer);
      double v107 = (double)CVPixelBufferGetHeight(previousWarpedDepthBuffer);
      BOOL v108 = v13 == (double)v106 && v14 == v107;
      v109 = v225;
      if (v108)
      {
LABEL_76:
        previousWarpedConfidenceBuffer = v109->_previousWarpedConfidenceBuffer;
        if (previousWarpedConfidenceBuffer)
        {
          size_t v118 = CVPixelBufferGetWidth(v109->_previousWarpedConfidenceBuffer);
          double v119 = (double)CVPixelBufferGetHeight(previousWarpedConfidenceBuffer);
          v120 = v225->_previousWarpedConfidenceBuffer;
          if (v13 == (double)v118 && v14 == v119) {
            goto LABEL_85;
          }
        }
        else
        {
          v120 = 0;
        }
        CVPixelBufferRelease(v120);
        v120 = ARCreateCVPixelBufferFromPool(&v225->_outputTemporalConsistentConfidencePixelBufferPool, 1717855600, v225, @"temporally consistent depth buffer", v13, v14);
        v225->_previousWarpedConfidenceBuffer = v120;
LABEL_85:
        uint64_t v122 = -[ADJasperColorPipeline warpPreviousDepth:intoCurrentDepth:previousConfidence:intoCurrentConfidence:previousNormals:intoCurrentNormals:usingPoseDelta:previousCalibration:currentCalibration:](v225->_pipeline, "warpPreviousDepth:intoCurrentDepth:previousConfidence:intoCurrentConfidence:previousNormals:intoCurrentNormals:usingPoseDelta:previousCalibration:currentCalibration:", v225->_previousDepthBuffer, v225->_previousWarpedDepthBuffer, v225->_previousConfidenceBuffer, v120, 0, 0, v206, v204, v202, v200, v225->_previousCameraCalibration, v87);
        if (!v122) {
          uint64_t v122 = [(ADJasperColorPipeline *)v225->_pipeline fuseCurrentDepth:v298[3] previousDepth:v225->_previousWarpedDepthBuffer intoOutputDepth:v264[3] currentConfidence:v290[3] previousConfidence:v225->_previousWarpedConfidenceBuffer intoOutputConfidence:v260[3] currentNormals:0 previousNormals:0 intoOutputNormals:0 usingAlpha:0];
        }
        [v224 timestamp];
        kdebug_trace();
        os_unfair_lock_unlock(&v225->_opticalFlowOutputBufferLock);
        if (v122)
        {
          v123 = _ARLogTechnique_11();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
          {
            v124 = (objc_class *)objc_opt_class();
            NSStringFromClass(v124);
            id v125 = (id)objc_claimAutoreleasedReturnValue();
            buf.columns[0].i32[0] = 138543874;
            *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v125;
            buf.columns[0].i16[6] = 2048;
            *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v225;
            buf.columns[1].i16[3] = 2048;
            buf.columns[1].i64[1] = v122;
            _os_log_impl(&dword_1B88A2000, v123, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to warp and fuse AppleDepth pipeline output: %li", (uint8_t *)&buf, 0x20u);
          }
          v112 = v225;
        }
        else
        {
          CVPixelBufferRelease(v225->_previousDepthBuffer);
          v225->_previousDepthBuffer = CVPixelBufferRetain((CVPixelBufferRef)v264[3]);
          CVPixelBufferRelease(v225->_previousConfidenceBuffer);
          CVPixelBufferRef v126 = CVPixelBufferRetain((CVPixelBufferRef)v260[3]);
          v112 = v225;
          v225->_previousConfidenceBuffer = v126;
        }
        v98 = &OBJC_IVAR___ARFrame__exifData;
        goto LABEL_93;
      }
      v110 = v225->_previousWarpedDepthBuffer;
    }
    else
    {
      v110 = 0;
    }
    CVPixelBufferRelease(v110);
    CVPixelBufferRef v116 = ARCreateCVPixelBufferFromPool(p_outputTemporalConsistentDepthPixelBufferPool, 1717855600, v225, @"temporally consistent depth buffer", v13, v14);
    v109 = v225;
    v225->_previousWarpedDepthBuffer = v116;
    goto LABEL_76;
  }
  double v32 = 0;
LABEL_145:
  _Block_object_dispose(&v289, 8);
  v294((uint64_t)v293);
LABEL_146:
  _Block_object_dispose(&v297, 8);

  return v32;
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke(uint64_t a1)
{
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_2(uint64_t a1)
{
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_3(uint64_t a1)
{
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_32(uint64_t a1)
{
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_33(uint64_t a1)
{
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_34(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  v2 = *(__CVBuffer **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  CVPixelBufferRelease(v2);
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_2_35(uint64_t a1)
{
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_54(uint64_t a1)
{
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_58(uint64_t a1)
{
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_62(uint64_t a1)
{
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_66(uint64_t a1)
{
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_70(uint64_t a1)
{
}

void __143__ARDepthTechnique_createResultDataFromTensors_numberOfOutputTensors_imageDataForNeuralNetwork_inputImageData_rotationNeeded_regionOfInterest___block_invoke_75(uint64_t a1)
{
}

- (id)_rotatedPixelBufferImageData:(__CVBuffer *)a3
{
  objc_super v5 = objc_opt_new();
  [v5 setPixelBuffer:a3];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  uint64_t v7 = &OBJC_IVAR___ARDepthTechnique__float32RotationTechnique;
  if (PixelFormatType == 1278226488) {
    uint64_t v7 = &OBJC_IVAR___ARDepthTechnique__oneComponent8RotationTechnique;
  }
  double v8 = [*(id *)((char *)&self->super.super.super.super.isa + *v7) processData:v5];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARDepthTechnique;
  if ([(ARTechnique *)&v9 isEqual:v4])
  {
    objc_super v5 = v4;
    int64_t v6 = [(ARDepthTechnique *)self prioritization];
    BOOL v7 = v6 == [v5 prioritization] && self->_temporalConsistencyMethod == v5[90];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
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

- (ADJasperColorPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (int64_t)prioritization
{
  return self->_prioritization;
}

- (__CVBuffer)opticalFlowOutputBuffer
{
  return self->_opticalFlowOutputBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_normalsHelperBuffer, 0);
  objc_storeStrong((id *)&self->_derivatives, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_pyramids, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_lktProcessingQueue, 0);
  objc_storeStrong((id *)&self->_oneComponent8RotationTechnique, 0);
  objc_storeStrong((id *)&self->_float32RotationTechnique, 0);
  objc_storeStrong((id *)&self->_previousCameraCalibration, 0);
  objc_storeStrong((id *)&self->_lktDescriptor, 0);
  objc_storeStrong((id *)&self->_lkt, 0);
  objc_storeStrong((id *)&self->_inferenceDescriptor, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end