@interface ARMLImageProcessingTechnique
+ (BOOL)isSupported;
- ($C4732ECC957FA13B9B3DF4A51A95735B)espressoNetwork;
- ($F613A077D53D3D97A8E0FDF5BAE1891D)networkInputParams;
- ($FD4688982923A924290ECB669CAF1EC2)espressoInputTensorsData;
- ($FD4688982923A924290ECB669CAF1EC2)espressoOutputTensorsData;
- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 inputTensorNames:(id)a4 outputTensorNames:(id)a5 networkInputScaleBeforeRotation:(CGSize)a6 networkFilePath:(id)a7;
- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 inputTensorNames:(id)a4 outputTensorNames:(id)a5 networkInputScaleBeforeRotation:(CGSize)a6 networkFilePath:(id)a7 useEspressoZeroCopyOutput:(BOOL)a8;
- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 networkInputScaleBeforeRotation:(CGSize)a4;
- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 networkInputScaleBeforeRotation:(CGSize)a4 delegateInference:(BOOL)a5;
- (BOOL)ARMLVerifyLoadedModelVersion:(id)a3 deviceName:(id)a4 major:(int)a5 minor:(int)a6;
- (BOOL)failedToLoadNetwork;
- (BOOL)isBusy;
- (BOOL)isLoadedModelVersionCorrect:(id)a3;
- (BOOL)networkHasConfigurations;
- (BOOL)networkProvidesConfigurationsForDeviceOrientation;
- (BOOL)preProcessNetworkInputImage:(__CVBuffer *)a3;
- (BOOL)prepComplete;
- (BOOL)shouldUseSynchronizedUltraWide;
- (BOOL)useEspressoZeroCopyOutput;
- (CGSize)allowedResamplingImageSize;
- (CGSize)networkInputScaleBeforeRotation;
- (NSArray)inputTensorNames;
- (NSArray)outputTensorNames;
- (NSString)networkFilePath;
- (NSString)networkVersionString;
- (double)requiredTimeInterval;
- (id).cxx_construct;
- (id)_resampleImage:(id)a3 rotationOfResultTensor:(int64_t)a4 networkInputSize:(CGSize)a5;
- (id)createResultDataFromTensors:(id *)a3 numberOfOutputTensors:(unint64_t)a4 imageDataForNeuralNetwork:(id)a5 inputImageData:(id)a6 rotationNeeded:(int64_t)a7 regionOfInterest:(CGSize)a8;
- (id)defaultEngineName;
- (id)networkModesForOrientation:(int64_t)a3;
- (id)processData:(id)a3;
- (id)processEspressoTensor:(id)a3;
- (id)processImageDataThroughNeuralNetwork:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6;
- (id)processingSemaphore;
- (id)resultDataClasses;
- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6;
- (int)bindInputBuffer:(unint64_t)a3 withImage:(id)a4 andOriginalImageData:(id)a5 rotationOfResultTensor:(int64_t)a6;
- (int)defaultEngine;
- (int)prepareBindInputBuffer:(unint64_t)a3 withName:(id)a4;
- (int64_t)captureBehavior;
- (int64_t)getDeviceOrientationFromImageData:(id)a3;
- (int64_t)numberOfInputChannelsToExpectInNetwork;
- (int64_t)orientationForInitializingEspresso;
- (unint64_t)espressoInputTensorsSize;
- (unint64_t)espressoOutputTensorsSize;
- (unint64_t)requiredSensorDataTypes;
- (void)_asynchronousProcessDownSampledImage:(id)a3;
- (void)_asynchronousProcessEspressoTensor:(id)a3;
- (void)_bindOutputTensor;
- (void)_captureMLRunNetworkInputImageData:(double)a3 cameraType:(int64_t)a4 imageWidth:(unint64_t)a5 imageHeight:(unint64_t)a6;
- (void)_endLoadingMLModelSignpost;
- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3;
- (void)_endMLProcessingSignpostWithTimestamp:(double)a3;
- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3;
- (void)_runNeuralNetworkAndPushResult:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6;
- (void)_startLoadingMLModelSignpost;
- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5;
- (void)_startMLProcessingSignpostWithTimestamp:(double)a3;
- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3;
- (void)changeEspressoConfig:(id)a3;
- (void)dealloc;
- (void)espressoPlan;
- (void)loadMLWithPath:(id)a3 networkMode:(id)a4;
- (void)lockOrientation:(int64_t)a3;
- (void)prepare:(BOOL)a3;
- (void)setAllowedResamplingImageSize:(CGSize)a3;
- (void)setNetworkFilePath:(id)a3;
- (void)setNetworkHasConfigurations:(BOOL)a3;
- (void)setPrepComplete:(BOOL)a3;
- (void)setUseEspressoZeroCopyOutput:(BOOL)a3;
- (void)waitForProcessingCompleteInDeterministicMode;
@end

@implementation ARMLImageProcessingTechnique

+ (BOOL)isSupported
{
  if (+[ARMLImageProcessingTechnique isSupported]::onceToken != -1) {
    dispatch_once(&+[ARMLImageProcessingTechnique isSupported]::onceToken, &__block_literal_global_121);
  }
  return +[ARMLImageProcessingTechnique isSupported]::supported;
}

uint64_t __43__ARMLImageProcessingTechnique_isSupported__block_invoke()
{
  uint64_t result = ARAppleNeuralEngine();
  +[ARMLImageProcessingTechnique isSupported]::supported = result;
  return result;
}

- (BOOL)networkProvidesConfigurationsForDeviceOrientation
{
  return 1;
}

- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 inputTensorNames:(id)a4 outputTensorNames:(id)a5 networkInputScaleBeforeRotation:(CGSize)a6 networkFilePath:(id)a7 useEspressoZeroCopyOutput:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a6.height;
  double width = a6.width;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  v19 = -[ARMLImageProcessingTechnique initWithDispatchQueue:inputTensorNames:outputTensorNames:networkInputScaleBeforeRotation:networkFilePath:](self, "initWithDispatchQueue:inputTensorNames:outputTensorNames:networkInputScaleBeforeRotation:networkFilePath:", v15, v16, v17, v18, width, height);
  v20 = v19;
  if (v19) {
    [(ARMLImageProcessingTechnique *)v19 setUseEspressoZeroCopyOutput:v8];
  }

  return v20;
}

- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 networkInputScaleBeforeRotation:(CGSize)a4
{
  return -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:](self, "initWithDispatchQueue:networkInputScaleBeforeRotation:delegateInference:", a3, 0, a4.width, a4.height);
}

- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 networkInputScaleBeforeRotation:(CGSize)a4 delegateInference:(BOOL)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARMLImageProcessingTechnique;
  v11 = [(ARImageBasedTechnique *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_processingQueue, a3);
    dispatch_semaphore_t v13 = dispatch_semaphore_create(1);
    processingSemaphore = v12->_processingSemaphore;
    v12->_processingSemaphore = (OS_dispatch_semaphore *)v13;

    v12->_prepLock._os_unfair_lock_opaque = 0;
    v12->_lockedOrientation = -1;
    v12->_allowedResamplingImageSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v12->_delegateInference = a5;
    v12->_networkInputScaleBeforeRotation.CGFloat width = width;
    v12->_networkInputScaleBeforeRotation.CGFloat height = height;
  }

  return v12;
}

- (ARMLImageProcessingTechnique)initWithDispatchQueue:(id)a3 inputTensorNames:(id)a4 outputTensorNames:(id)a5 networkInputScaleBeforeRotation:(CGSize)a6 networkFilePath:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = -[ARMLImageProcessingTechnique initWithDispatchQueue:networkInputScaleBeforeRotation:](self, "initWithDispatchQueue:networkInputScaleBeforeRotation:", v13, width, height);
  id v18 = v17;
  if (v17)
  {
    v17->_espressoInputBufferTimestamp = 0.0;
    v17->_espressoInputBufferLock._os_unfair_lock_opaque = 0;
    uint64_t v19 = [v14 copy];
    inputTensorNames = v18->_inputTensorNames;
    v18->_inputTensorNames = (NSArray *)v19;

    uint64_t v21 = [v15 copy];
    outputTensorNames = v18->_outputTensorNames;
    v18->_outputTensorNames = (NSArray *)v21;

    uint64_t v23 = [v16 copy];
    networkFilePath = v18->_networkFilePath;
    v18->_networkFilePath = (NSString *)v23;

    v18->_bgraPixelBufferPool = 0;
    v18->_failedToLoadNetwork = 1;
    [(ARMLImageProcessingTechnique *)v18 setUseEspressoZeroCopyOutput:0];
  }

  return v18;
}

- (BOOL)ARMLVerifyLoadedModelVersion:(id)a3 deviceName:(id)a4 major:(int)a5 minor:(int)a6
{
  id v9 = a4;
  id v10 = [a3 componentsSeparatedByString:@"."];
  v11 = v10;
  if (!v10 || [v10 count] != 3) {
    goto LABEL_10;
  }
  v12 = [v11 objectAtIndexedSubscript:1];
  int v13 = [v12 intValue];

  id v14 = [v11 objectAtIndexedSubscript:2];
  int v15 = [v14 intValue];

  id v16 = [v11 objectAtIndexedSubscript:0];
  int v17 = [v16 isEqual:v9];
  if (v13 == a5) {
    int v18 = v17;
  }
  else {
    int v18 = 0;
  }
  if (v18 != 1)
  {

    goto LABEL_10;
  }

  if (v15 != a6)
  {
LABEL_10:
    BOOL v19 = 0;
    goto LABEL_11;
  }
  BOOL v19 = 1;
LABEL_11:

  return v19;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  bgraPixelBufferPool = self->_bgraPixelBufferPool;
  if (bgraPixelBufferPool)
  {
    CVPixelBufferPoolRelease(bgraPixelBufferPool);
    self->_bgraPixelBufferPool = 0;
  }
  begin = self->_espressoOutputBufferPools.__begin_;
  end = self->_espressoOutputBufferPools.__end_;
  while (begin != end)
  {
    if (*begin) {
      CVPixelBufferPoolRelease(*begin);
    }
    ++begin;
  }
  v6.receiver = self;
  v6.super_class = (Class)ARMLImageProcessingTechnique;
  [(ARMLImageProcessingTechnique *)&v6 dealloc];
}

- (id)processingSemaphore
{
  return self->_processingSemaphore;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)espressoNetwork
{
  p_espressoNetwork = &self->_espressoNetwork;
  plan = self->_espressoNetwork.plan;
  uint64_t v4 = *(void *)&p_espressoNetwork->network_index;
  result.var1 = v4;
  result.var0 = plan;
  return result;
}

- (void)espressoPlan
{
  return self->_espressoPlan;
}

- (int)defaultEngine
{
  return 10007;
}

- ($FD4688982923A924290ECB669CAF1EC2)espressoOutputTensorsData
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)self->_espressoOutputTensors.__begin_;
}

- (unint64_t)espressoOutputTensorsSize
{
  return 0xCF3CF3CF3CF3CF3DLL * ((self->_espressoOutputTensors.__end_ - self->_espressoOutputTensors.__begin_) >> 3);
}

- ($FD4688982923A924290ECB669CAF1EC2)espressoInputTensorsData
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)self->_espressoInputTensors.__begin_;
}

- (unint64_t)espressoInputTensorsSize
{
  return 0xCF3CF3CF3CF3CF3DLL * ((self->_espressoInputTensors.__end_ - self->_espressoInputTensors.__begin_) >> 3);
}

- (id)defaultEngineName
{
  int v2 = [(ARMLImageProcessingTechnique *)self defaultEngine];
  if (v2 > 10005)
  {
    switch(v2)
    {
      case 0x2716:
        return @"ESPRESSO_ENGINE_ANE_RUNTIME_DIRECT";
      case 0x2717:
        return @"ESPRESSO_ENGINE_ANE_RUNTIME";
      case 0x7FFFFFFF:
        return @"ESPRESSO_ENGINE_MAX_VAL";
    }
  }
  else
  {
    switch(v2)
    {
      case 0:
        return @"ESPRESSO_ENGINE_CPU";
      case 2:
        return @"ESPRESSO_ENGINE_METAL";
      case 5:
        return @"ESPRESSO_ENGINE_MPS";
    }
  }
  return &stru_1F120C8F0;
}

- (void)lockOrientation:(int64_t)a3
{
  self->_lockedOrientation = a3;
}

- (int64_t)numberOfInputChannelsToExpectInNetwork
{
  return 4;
}

- (id)networkModesForOrientation:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 3) >= 2)
  {
    if ((unint64_t)(a3 - 1) < 2) {
      return @"portrait";
    }
    if (_ARLogGeneral(void)::onceToken != -1) {
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_289);
    }
    objc_super v6 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      BOOL v8 = NSStringFromClass(v7);
      int v9 = 138543874;
      id v10 = v8;
      __int16 v11 = 2048;
      v12 = self;
      __int16 v13 = 2048;
      int64_t v14 = a3;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find a network config for the device orientation %ld", (uint8_t *)&v9, 0x20u);
    }
  }
  return @"landscape";
}

- (BOOL)isLoadedModelVersionCorrect:(id)a3
{
  return 1;
}

- (NSString)networkVersionString
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(ARMLImageProcessingTechnique *)self espressoNetwork];
  if (espresso_network_get_version())
  {
    int v2 = 0;
  }
  else
  {
    int v2 = [NSString stringWithUTF8String:&v4];
  }
  return (NSString *)v2;
}

- (void)loadMLWithPath:(id)a3 networkMode:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  objc_super v6 = (__CFString *)a3;
  id v7 = a4;
  if (v6)
  {
    BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v9 = [v8 fileExistsAtPath:v6];

    if (v9)
    {
      id v10 = _ARLogTechnique();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        __int16 v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        __int16 v13 = [(ARMLImageProcessingTechnique *)self defaultEngineName];
        *(_DWORD *)buf = 138543874;
        v54 = v12;
        __int16 v55 = 2048;
        v56 = self;
        __int16 v57 = 2112;
        v58 = v13;
        _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting up espresso engine '%@'.", buf, 0x20u);
      }
      [(ARMLImageProcessingTechnique *)self defaultEngine];
      context = (void *)espresso_create_context();
      self->_espressoContext = context;
      if (!context)
      {
        uint64_t v15 = (void *)espresso_create_context();
        self->_espressoContext = v15;
        if (!v15)
        {
          self->_failedToLoadNetwork = 1;
          goto LABEL_19;
        }
      }
      self->_espressoPlan = (void *)espresso_create_plan();
      [(__CFString *)v6 UTF8String];
      if (espresso_plan_add_network())
      {
        self->_failedToLoadNetwork = 1;
        goto LABEL_19;
      }
      self->_failedToLoadNetwork = 0;
      v27 = [(ARMLImageProcessingTechnique *)self networkVersionString];
      if (v27)
      {
        BOOL v28 = [(ARMLImageProcessingTechnique *)self isLoadedModelVersionCorrect:v27];
        v29 = _ARLogTechnique();
        BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
        if (v28)
        {
          if (v30)
          {
            v31 = (objc_class *)objc_opt_class();
            v32 = NSStringFromClass(v31);
            *(_DWORD *)buf = 138543874;
            v54 = v32;
            __int16 v55 = 2048;
            v56 = self;
            __int16 v57 = 2112;
            v58 = v27;
            _os_log_impl(&dword_1B88A2000, v29, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Version '%@'.", buf, 0x20u);
          }
          v33 = [(ARMLImageProcessingTechnique *)self inputTensorNames];
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke;
          v52[3] = &unk_1E6188528;
          v52[4] = self;
          [v33 enumerateObjectsUsingBlock:v52];

          v34 = [(ARMLImageProcessingTechnique *)self outputTensorNames];
          std::vector<espresso_buffer_t>::resize((uint64_t)&self->_espressoOutputTensors, [v34 count]);

          v35 = [(ARMLImageProcessingTechnique *)self outputTensorNames];
          std::vector<__CVPixelBufferPool *>::resize((uint64_t)&self->_espressoOutputBufferPools, [v35 count]);

          v36 = [(ARMLImageProcessingTechnique *)self outputTensorNames];
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_36;
          v51[3] = &unk_1E6188528;
          v51[4] = self;
          [v36 enumerateObjectsUsingBlock:v51];

          if (!espresso_plan_build())
          {
            [(ARMLImageProcessingTechnique *)self _bindOutputTensor];
            v44 = [(ARMLImageProcessingTechnique *)self inputTensorNames];
            std::vector<espresso_buffer_t>::resize((uint64_t)&self->_espressoInputTensors, [v44 count]);

            v45 = [(ARMLImageProcessingTechnique *)self inputTensorNames];
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            v50[2] = __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_39;
            v50[3] = &unk_1E6188528;
            v50[4] = self;
            [v45 enumerateObjectsUsingBlock:v50];

            v46 = [(ARMLImageProcessingTechnique *)self inputTensorNames];
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_41;
            v49[3] = &unk_1E6188528;
            v49[4] = self;
            [v46 enumerateObjectsUsingBlock:v49];

            v47 = [(ARMLImageProcessingTechnique *)self outputTensorNames];
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_43;
            v48[3] = &unk_1E6188528;
            v48[4] = self;
            [v47 enumerateObjectsUsingBlock:v48];

            goto LABEL_36;
          }
          v37 = _ARLogTechnique();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            v38 = (objc_class *)objc_opt_class();
            v39 = NSStringFromClass(v38);
            *(_DWORD *)buf = 138543874;
            v54 = v39;
            __int16 v55 = 2048;
            v56 = self;
            __int16 v57 = 2080;
            v58 = "Could not build espresso plan.";
            _os_log_impl(&dword_1B88A2000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);
          }
LABEL_35:
          self->_failedToLoadNetwork = 1;
LABEL_36:

          goto LABEL_19;
        }
        if (v30)
        {
          v42 = (objc_class *)objc_opt_class();
          v43 = NSStringFromClass(v42);
          *(_DWORD *)buf = 138543874;
          v54 = v43;
          __int16 v55 = 2048;
          v56 = self;
          __int16 v57 = 2080;
          v58 = "Version mismatch";
          _os_log_impl(&dword_1B88A2000, v29, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);
        }
      }
      else
      {
        v29 = _ARLogTechnique();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v40 = (objc_class *)objc_opt_class();
          v41 = NSStringFromClass(v40);
          *(_DWORD *)buf = 138543874;
          v54 = v41;
          __int16 v55 = 2048;
          v56 = self;
          __int16 v57 = 2080;
          v58 = "Failed to get espresso network version.";
          _os_log_impl(&dword_1B88A2000, v29, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);
        }
      }

      goto LABEL_35;
    }
    self->_failedToLoadNetwork = 1;
  }
  else
  {
    self->_failedToLoadNetwork = 1;
    id v16 = _ARLogTechnique();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = (objc_class *)objc_opt_class();
      int v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138543618;
      v54 = v18;
      __int16 v55 = 2048;
      v56 = self;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Path to network is nil, check if network is added to spatial_splitting_network_mapping.plist file.", buf, 0x16u);
    }
  }
  BOOL v19 = _ARLogTechnique();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    *(_DWORD *)buf = 138543874;
    v54 = v21;
    __int16 v55 = 2048;
    v56 = self;
    __int16 v57 = 2112;
    v58 = (const char *)v6;
    _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to load model from path '%@'", buf, 0x20u);
  }
  v22 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v23 = v22;
  if (v6) {
    v24 = v6;
  }
  else {
    v24 = @"<nil>";
  }
  [v22 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F28328]];
  v25 = [(ARTechnique *)self delegate];
  v26 = ARErrorWithCodeAndUserInfo(1004, v23);
  [v25 technique:self didFailWithError:v26];

LABEL_19:
}

void __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 UTF8String];
  if (espresso_network_declare_input())
  {
    long long v4 = _ARLogTechnique();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      objc_super v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      int v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      __int16 v13 = "Failure to declare input tensor";
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 233) = 1;
  }
}

void __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 UTF8String];
  if (espresso_network_declare_output())
  {
    long long v4 = _ARLogTechnique();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      objc_super v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      int v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      __int16 v13 = "Failure to declare output tensor";
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 233) = 1;
  }
}

void __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_39(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) prepareBindInputBuffer:a3 withName:a2])
  {
    long long v4 = _ARLogTechnique();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      objc_super v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      int v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      __int16 v13 = "Failure to bind input tensor";
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 233) = 1;
  }
}

void __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a2;
  [v3 UTF8String];
  if (espresso_network_query_blob_dimensions())
  {
    long long v4 = _ARLogTechnique();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      objc_super v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      int v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      __int16 v13 = "Failure to determine input tensor shape";
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 233) = 1;
  }
}

void __59__ARMLImageProcessingTechnique_loadMLWithPath_networkMode___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a2;
  [v3 UTF8String];
  if (espresso_network_query_blob_dimensions())
  {
    long long v4 = _ARLogTechnique();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      objc_super v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      int v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      __int16 v13 = "Failure to determine output tensor shape";
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 233) = 1;
  }
}

- (void)_bindOutputTensor
{
  id v3 = [(ARMLImageProcessingTechnique *)self outputTensorNames];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__ARMLImageProcessingTechnique__bindOutputTensor__block_invoke;
  v4[3] = &unk_1E6188528;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

void __49__ARMLImageProcessingTechnique__bindOutputTensor__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) useEspressoZeroCopyOutput])
  {
    objc_super v6 = [*(id *)(a1 + 32) outputTensorNames];
    id v7 = [v6 objectAtIndexedSubscript:a3];
    [v7 UTF8String];
    int v8 = espresso_network_bind_buffer();

    if (v8)
    {
      int v9 = _ARLogTechnique();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        __int16 v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        id v41 = v11;
        __int16 v42 = 2048;
        uint64_t v43 = v12;
        __int16 v44 = 2080;
        v45 = "Failure to bind output tensor";
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);
      }
LABEL_10:
      *(unsigned char *)(*(void *)(a1 + 32) + 233) = 1;
      goto LABEL_21;
    }
    CVPixelBufferRef pixelBufferOut = 0;
    int v17 = *(__IOSurface **)v52;
    uint64_t v50 = *MEMORY[0x1E4F24D68];
    uint64_t v51 = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v18 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    CVReturn v19 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v17, v18, &pixelBufferOut);
    if (!CVPixelBufferGetIOSurface(pixelBufferOut))
    {
      v20 = _ARLogTechnique();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = *(void *)(a1 + 32);
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138544130;
        id v41 = v22;
        __int16 v42 = 2048;
        uint64_t v43 = v23;
        __int16 v44 = 2112;
        v45 = v25;
        __int16 v46 = 2048;
        uint64_t v47 = v26;
        _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ (%p): Could not get IOSurface", buf, 0x2Au);
      }
    }
    if (v19)
    {
      v31 = _ARLogTechnique();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v34 = *(void *)(a1 + 32);
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (char *)objc_claimAutoreleasedReturnValue();
        uint64_t v37 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138544386;
        id v41 = v33;
        __int16 v42 = 2048;
        uint64_t v43 = v34;
        __int16 v44 = 2112;
        v45 = v36;
        __int16 v46 = 2048;
        uint64_t v47 = v37;
        __int16 v48 = 1024;
        CVReturn v49 = v19;
        _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ (%p): Could not create CVPixelBuffer for neural network: %d", buf, 0x30u);
      }
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Error: Could not create CVPixelBuffer for neural network";
      __cxa_throw(exception, MEMORY[0x1E4FBA308], 0);
    }
    [v5 UTF8String];
    if (espresso_network_bind_direct_cvpixelbuffer())
    {
      v27 = _ARLogTechnique();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        BOOL v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        uint64_t v30 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        id v41 = v29;
        __int16 v42 = 2048;
        uint64_t v43 = v30;
        __int16 v44 = 2080;
        v45 = "Failure to bind direct cvpixelbuffer output";
        _os_log_impl(&dword_1B88A2000, v27, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);
      }
    }
    CVPixelBufferRelease(pixelBufferOut);
  }
  else
  {
    [v5 UTF8String];
    if (espresso_network_bind_buffer())
    {
      __int16 v13 = _ARLogTechnique();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        long long v14 = (objc_class *)objc_opt_class();
        long long v15 = NSStringFromClass(v14);
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)v52 = 138543874;
        *(void *)&v52[4] = v15;
        __int16 v53 = 2048;
        uint64_t v54 = v16;
        __int16 v55 = 2080;
        v56 = "Failure to bind output tensor";
        _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", v52, 0x20u);
      }
      goto LABEL_10;
    }
  }
LABEL_21:
}

- (void)changeEspressoConfig:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = (NSString *)a3;
  previous_network_configuration = self->_previous_network_configuration;
  if (previous_network_configuration == v5
    || [(NSString *)previous_network_configuration isEqualToString:v5])
  {
    goto LABEL_3;
  }
  [(ARMLImageProcessingTechnique *)self _startLoadingMLModelSignpost];
  espresso_plan_build_clean();
  id v7 = v5;
  [(NSString *)v7 UTF8String];
  if (espresso_network_select_configuration())
  {
    int v8 = _ARLogTechnique();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = (objc_class *)objc_opt_class();
      __int16 v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2048;
      CFDictionaryRef v18 = self;
      __int16 v19 = 2080;
      v20 = "Can't set mode";
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);
    }
LABEL_11:

    self->_failedToLoadNetwork = 1;
    goto LABEL_12;
  }
  if (espresso_plan_build())
  {
    int v8 = _ARLogTechnique();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2048;
      CFDictionaryRef v18 = self;
      __int16 v19 = 2080;
      v20 = "Could not rebuild espresso plan";
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);
    }
    goto LABEL_11;
  }
  [(ARMLImageProcessingTechnique *)self _bindOutputTensor];
  __int16 v13 = [(ARMLImageProcessingTechnique *)self inputTensorNames];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__ARMLImageProcessingTechnique_changeEspressoConfig___block_invoke;
  v14[3] = &unk_1E6188528;
  v14[4] = self;
  [v13 enumerateObjectsUsingBlock:v14];

  [(ARMLImageProcessingTechnique *)self _endLoadingMLModelSignpost];
  [(ARMLImageProcessingTechnique *)self networkModeDidChange:self->_previous_network_configuration toMode:v7];
LABEL_3:
  objc_storeStrong((id *)&self->_previous_network_configuration, a3);
LABEL_12:
}

void __53__ARMLImageProcessingTechnique_changeEspressoConfig___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) prepareBindInputBuffer:a3 withName:a2])
  {
    long long v4 = _ARLogTechnique();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = (objc_class *)objc_opt_class();
      objc_super v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      int v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      __int16 v13 = "Failure to bind input tensor";
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", (uint8_t *)&v8, 0x20u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 233) = 1;
  }
}

- (double)requiredTimeInterval
{
  return 0.016;
}

- (int64_t)captureBehavior
{
  return 1;
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (id)resultDataClasses
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:MEMORY[0x1E4F1CBF0]];
}

- (int64_t)orientationForInitializingEspresso
{
  return 3;
}

- (void)prepare:(BOOL)a3
{
  BOOL v3 = a3;
  p_prepLock = &self->_prepLock;
  os_unfair_lock_lock(&self->_prepLock);
  self->_deterministic = v3;
  if (self->_hasBegunPrep)
  {
    os_unfair_lock_unlock(p_prepLock);
  }
  else
  {
    self->_hasBegunPrep = 1;
    os_unfair_lock_unlock(p_prepLock);
    [(ARMLImageProcessingTechnique *)self _prepareOnce:v3];
    if (!self->_delegateInference)
    {
      [(ARMLImageProcessingTechnique *)self _startLoadingMLModelSignpost];
      [(ARMLImageProcessingTechnique *)self loadMLWithPath:self->_networkFilePath networkMode:0];
      previous_network_configuration = self->_previous_network_configuration;
      self->_previous_network_configuration = 0;

      [(ARMLImageProcessingTechnique *)self _endLoadingMLModelSignpost];
    }
    [(ARMLImageProcessingTechnique *)self setPrepComplete:1];
  }
}

- (void)waitForProcessingCompleteInDeterministicMode
{
  if (self->_deterministic) {
    dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global_57_0);
  }
}

- (id)processData:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ARMLImageProcessingTechnique;
  id v5 = [(ARImageBasedTechnique *)&v7 processData:v4];
  if ([(ARMLImageProcessingTechnique *)self prepComplete])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(ARMLImageProcessingTechnique *)self requiredSensorDataTypes] & 1) != 0)
    {
      [(ARMLImageProcessingTechnique *)self _asynchronousProcessDownSampledImage:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(ARMLImageProcessingTechnique *)self _asynchronousProcessEspressoTensor:v4];
      }
    }
    [(ARMLImageProcessingTechnique *)self waitForProcessingCompleteInDeterministicMode];
  }
  return v4;
}

- (void)_asynchronousProcessDownSampledImage:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if ([(ARMLImageProcessingTechnique *)self shouldUseSynchronizedUltraWide])
  {
    objc_super v6 = [v4 latestResizedUltraWideImageData];

    id v5 = v4;
    if (v6)
    {
      objc_super v7 = [v4 latestResizedUltraWideImageData];

      if (v7)
      {
        id v5 = [v4 latestResizedUltraWideImageData];
        int v8 = v4;
      }
      else
      {
        int v8 = [v4 originalImageData];
        [v8 timestamp];
        -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", MEMORY[0x1E4F1CBF0]);
        id v5 = v4;
      }
    }
  }
  double width = self->_networkInputScaleBeforeRotation.width;
  double height = self->_networkInputScaleBeforeRotation.height;
  if (-[ARMLImageProcessingTechnique networkProvidesConfigurationsForDeviceOrientation](self, "networkProvidesConfigurationsForDeviceOrientation")&& ([v5 rotationOfResultTensor] == 90 || objc_msgSend(v5, "rotationOfResultTensor") == -90))
  {
    double height = self->_networkInputScaleBeforeRotation.width;
    double width = self->_networkInputScaleBeforeRotation.height;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v11 = [v5 downScalingResults];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (!v12)
  {

LABEL_27:
    uint64_t v21 = [v5 downScalingResults];
    id v22 = [v21 firstObject];
    __int16 v13 = -[ARMLImageProcessingTechnique _resampleImage:rotationOfResultTensor:networkInputSize:](self, "_resampleImage:rotationOfResultTensor:networkInputSize:", v22, [v5 rotationOfResultTensor], width, height);

    goto LABEL_28;
  }
  __int16 v13 = 0;
  uint64_t v14 = *(void *)v51;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v51 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      [v16 imageResolution];
      if (v18 == width && v17 == height)
      {
        id v20 = v16;

        __int16 v13 = v20;
      }
    }
    uint64_t v12 = [v11 countByEnumeratingWithState:&v50 objects:v56 count:16];
  }
  while (v12);

  if (!v13) {
    goto LABEL_27;
  }
LABEL_28:
  uint64_t v23 = (void *)[v5 rotationOfResultTensor];
  [v13 regionOfInterest];
  v25 = v24;
  v27 = v26;
  BOOL v28 = objc_opt_new();
  [v5 timestamp];
  objc_msgSend(v28, "setTimestamp:");
  if ([(ARMLImageProcessingTechnique *)self shouldUseSynchronizedUltraWide]
    && [v13 undistortedPixelBuffer]
    || [v13 undistortedPixelBuffer])
  {
    uint64_t v29 = [v13 undistortedPixelBuffer];
  }
  else
  {
    uint64_t v29 = [v13 pixelBuffer];
  }
  [v28 setPixelBuffer:v29];
  uint64_t v54 = @"croppedRect";
  uint64_t v30 = (void *)MEMORY[0x1E4F29238];
  [v13 cropRegion];
  v49[0] = v31;
  v49[1] = v32;
  v49[2] = v33;
  v49[3] = v34;
  v35 = [v30 valueWithBytes:v49 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  __int16 v55 = v35;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  [v28 setMetaData:v36];

  uint64_t v37 = [v5 originalImageData];
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_processingSemaphore, 0))
  {
    [v5 timestamp];
    kdebug_trace();
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_processingSemaphore);
  }
  os_unfair_lock_lock(&self->_espressoInputBufferLock);
  [v37 timestamp];
  self->_espressoInputBufferTimestamp = v38;
  os_unfair_lock_unlock(&self->_espressoInputBufferLock);
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __69__ARMLImageProcessingTechnique__asynchronousProcessDownSampledImage___block_invoke;
  v43[3] = &unk_1E6188550;
  objc_copyWeak(v47, &location);
  id v44 = v37;
  id v45 = v28;
  id v46 = v5;
  v47[1] = v25;
  v47[2] = v27;
  v47[3] = v23;
  id v40 = v5;
  id v41 = v28;
  id v42 = v37;
  dispatch_async(processingQueue, v43);

  objc_destroyWeak(v47);
  objc_destroyWeak(&location);
}

void __69__ARMLImageProcessingTechnique__asynchronousProcessDownSampledImage___block_invoke(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) timestamp];
    double v3 = v2;
    id v4 = (os_unfair_lock_s *)(WeakRetained + 120);
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 30);
    double v5 = *((double *)WeakRetained + 14);
    if (v5 == 0.0 || v3 == v5)
    {
      kdebug_trace();
      *((void *)WeakRetained + 14) = 0;
      os_unfair_lock_unlock(v4);
      dispatch_semaphore_wait(*((dispatch_semaphore_t *)WeakRetained + 12), 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = [*(id *)(a1 + 48) originalImageData];
      objc_msgSend(WeakRetained, "_runNeuralNetworkAndPushResult:originalImageData:regionOfInterest:rotationOfResultTensor:", v7, v8, *(void *)(a1 + 80), *(double *)(a1 + 64), *(double *)(a1 + 72));
    }
    else
    {
      os_unfair_lock_unlock(v4);
      kdebug_trace();
      if ([WeakRetained shouldUseSynchronizedUltraWide])
      {
        [*(id *)(a1 + 32) timestampOfSynchronizedWideImageData];
        double v3 = v9;
      }
      [WeakRetained pushResultData:MEMORY[0x1E4F1CBF0] forTimestamp:v3];
    }
  }
}

- (void)_runNeuralNetworkAndPushResult:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  id v14 = a3;
  id v11 = a4;
  [v11 timestamp];
  -[ARMLImageProcessingTechnique _startMLProcessingSignpostWithTimestamp:](self, "_startMLProcessingSignpostWithTimestamp:");
  uint64_t v12 = -[ARMLImageProcessingTechnique runNeuralNetworkWithImageData:originalImageData:regionOfInterest:rotationOfResultTensor:](self, "runNeuralNetworkWithImageData:originalImageData:regionOfInterest:rotationOfResultTensor:", v14, v11, a6, width, height);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_processingSemaphore);
  if ([(ARMLImageProcessingTechnique *)self shouldUseSynchronizedUltraWide]) {
    [v11 timestampOfSynchronizedWideImageData];
  }
  else {
    [v11 timestamp];
  }
  if (v12) {
    __int16 v13 = v12;
  }
  else {
    __int16 v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v13);
  [v11 timestamp];
  -[ARMLImageProcessingTechnique _endMLProcessingSignpostWithTimestamp:](self, "_endMLProcessingSignpostWithTimestamp:");
}

- (id)runNeuralNetworkWithImageData:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = -[ARMLImageProcessingTechnique processImageDataThroughNeuralNetwork:originalImageData:regionOfInterest:rotationOfResultTensor:](self, "processImageDataThroughNeuralNetwork:originalImageData:regionOfInterest:rotationOfResultTensor:", v11, v12, a6, width, height);
  id v14 = (void *)v13;
  if (v13)
  {
    v17[0] = v13;
    long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  else
  {
    long long v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (void)_asynchronousProcessEspressoTensor:(id)a3
{
  id v4 = a3;
  if (self->_failedToLoadNetwork || dispatch_semaphore_wait((dispatch_semaphore_t)self->_processingSemaphore, 0))
  {
    [v4 timestamp];
    -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", MEMORY[0x1E4F1CBF0]);
  }
  else
  {
    double v5 = self->_processingSemaphore;
    objc_initWeak(&location, self);
    processingQueue = self->_processingQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__ARMLImageProcessingTechnique__asynchronousProcessEspressoTensor___block_invoke;
    v8[3] = &unk_1E6185AE8;
    objc_copyWeak(&v11, &location);
    double v9 = v5;
    id v10 = v4;
    uint64_t v7 = v5;
    dispatch_async(processingQueue, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __67__ARMLImageProcessingTechnique__asynchronousProcessEspressoTensor___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [*(id *)(a1 + 40) timestamp];
    -[dispatch_semaphore_t _startMLProcessingSignpostWithTimestamp:](WeakRetained, "_startMLProcessingSignpostWithTimestamp:");
    double v3 = [(dispatch_semaphore_t *)WeakRetained processEspressoTensor:*(void *)(a1 + 40)];
    dispatch_semaphore_signal(WeakRetained[12]);
    if (v3)
    {
      v5[0] = v3;
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    }
    else
    {
      id v4 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [*(id *)(a1 + 40) timestamp];
    -[dispatch_semaphore_t pushResultData:forTimestamp:](WeakRetained, "pushResultData:forTimestamp:", v4);
    if (v3) {

    }
    [*(id *)(a1 + 40) timestamp];
    -[dispatch_semaphore_t _endMLProcessingSignpostWithTimestamp:](WeakRetained, "_endMLProcessingSignpostWithTimestamp:");
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (id)_resampleImage:(id)a3 rotationOfResultTensor:(int64_t)a4 networkInputSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a3;
  double v9 = ARCreateCVPixelBufferFromPool(&self->_bgraPixelBufferPool, 1111970369, self, @"Down Scale Output", width, height);
  if (v9)
  {
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v8 pixelBuffer], 0);
    CVPixelBufferLockBaseAddress(v9, 0);
    memset(&src, 0, sizeof(src));
    ARWrapCVPixelBufferVImage((__CVBuffer *)[v8 pixelBuffer], &src.data);
    memset(&v27, 0, sizeof(v27));
    ARWrapCVPixelBufferVImage(v9, &v27.data);
    vImageScale_ARGB8888(&src, &v27, 0, 0x10u);
    CVPixelBufferUnlockBaseAddress(v9, 0);
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v8 pixelBuffer], 0);
    [v8 imageResolution];
    double v11 = v10;
    [v8 imageResolution];
    double v13 = v12;
    [v8 regionOfInterest];
    double v15 = v14;
    [v8 regionOfInterest];
    double v17 = v16;
    double v18 = [ARMLImageDownScalingResult alloc];
    [v8 cropRegion];
    double v20 = v19;
    double v22 = v21;
    *(float *)&double v19 = width / v11;
    *(float *)&double v21 = height / v13;
    v25 = -[ARMLImageDownScalingResult initWithPixelBuffer:regionOfInterest:cropRegion:](v18, "initWithPixelBuffer:regionOfInterest:cropRegion:", v9, v15 * *(float *)&v19, v17 * *(float *)&v21, v20, v22, v23, v24);
    CVPixelBufferRelease(v9);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- ($F613A077D53D3D97A8E0FDF5BAE1891D)networkInputParams
{
  *(_DWORD *)&retstr->var4 = 0;
  *(_OWORD *)&retstr->var0 = xmmword_1B8A592F8;
  return self;
}

- (int)prepareBindInputBuffer:(unint64_t)a3 withName:(id)a4
{
  return 0;
}

- (int)bindInputBuffer:(unint64_t)a3 withImage:(id)a4 andOriginalImageData:(id)a5 rotationOfResultTensor:(int64_t)a6
{
  id v8 = a4;
  id v9 = [(NSArray *)self->_inputTensorNames objectAtIndexedSubscript:a3];
  [v9 UTF8String];
  [v8 pixelBuffer];
  int v10 = espresso_network_bind_direct_cvpixelbuffer();

  return v10;
}

- (id)processImageDataThroughNeuralNetwork:(id)a3 originalImageData:(id)a4 regionOfInterest:(CGSize)a5 rotationOfResultTensor:(int64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v66 = a4;
  double v12 = 0;
  if (v11 && !self->_failedToLoadNetwork)
  {
    int64_t v64 = [(ARMLImageProcessingTechnique *)self getDeviceOrientationFromImageData:v66];
    v65 = -[ARMLImageProcessingTechnique networkModesForOrientation:](self, "networkModesForOrientation:");
    -[ARMLImageProcessingTechnique changeEspressoConfig:](self, "changeEspressoConfig:");
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v11 pixelBuffer], 0);
    [v11 timestamp];
    -[ARMLImageProcessingTechnique _startMLRunNetworkSignpostWithTimestamp:](self, "_startMLRunNetworkSignpostWithTimestamp:");
    [v11 timestamp];
    double v14 = v13;
    double v15 = [v66 cameraType];
    unsigned int v16 = [v15 isEqualToString:*MEMORY[0x1E4F15828]];
    size_t v17 = CVPixelBufferGetWidth((CVPixelBufferRef)[v11 pixelBuffer]);
    -[ARMLImageProcessingTechnique _captureMLRunNetworkInputImageData:cameraType:imageWidth:imageHeight:](self, "_captureMLRunNetworkInputImageData:cameraType:imageWidth:imageHeight:", v16, v17, CVPixelBufferGetHeight((CVPixelBufferRef)[v11 pixelBuffer]), v14);

    __p = 0;
    v68 = 0;
    v69 = 0;
    if ([(ARMLImageProcessingTechnique *)self useEspressoZeroCopyOutput])
    {
      for (unint64_t i = 0; ; ++i)
      {
        double v19 = [(ARMLImageProcessingTechnique *)self outputTensorNames];
        BOOL v20 = i < [v19 count];

        if (!v20) {
          break;
        }
        [v11 timestamp];
        kdebug_trace();
        id v21 = [(NSArray *)self->_outputTensorNames objectAtIndexedSubscript:i];
        [v21 UTF8String];
        int blob_dimensions = espresso_network_query_blob_dimensions();

        if (blob_dimensions)
        {
          double v23 = _ARLogTechnique();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            double v24 = (objc_class *)objc_opt_class();
            v25 = NSStringFromClass(v24);
            *(_DWORD *)buf = 138543874;
            v71 = v25;
            __int16 v72 = 2048;
            v73 = self;
            __int16 v74 = 2080;
            v75 = "Failure to query network output dimensions";
            _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);
          }
        }
        unint64_t v26 = *(void *)v76;
        uint64_t v27 = *(void *)&v76[8];
        uint64_t v28 = *(void *)&v76[16];
        kdebug_trace();
        CVPixelBufferRef v29 = ARCreateCVPixelBufferFromPool(&self->_espressoOutputBufferPools.__begin_[i], 1278226536, self, @"Espresso Output", (double)v26, (double)(unint64_t)(v28 * v27));
        kdebug_trace();
        if (v68 >= v69)
        {
          uint64_t v31 = (v68 - __p) >> 3;
          if ((unint64_t)(v31 + 1) >> 61) {
            std::vector<cva::Matrix<float,3u,1u,false>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v32 = (v69 - __p) >> 2;
          if (v32 <= v31 + 1) {
            unint64_t v32 = v31 + 1;
          }
          if ((unint64_t)(v69 - __p) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v33 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v33 = v32;
          }
          if (v33) {
            uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<unsigned int,2u,1u,false>>>((uint64_t)&v69, v33);
          }
          else {
            uint64_t v34 = 0;
          }
          v35 = (CVPixelBufferRef *)&v34[8 * v31];
          CVPixelBufferRef *v35 = v29;
          uint64_t v30 = (char *)(v35 + 1);
          v36 = v68;
          if (v68 != __p)
          {
            do
            {
              uint64_t v37 = (__CVBuffer *)*((void *)v36 - 1);
              v36 -= 8;
              *--v35 = v37;
            }
            while (v36 != __p);
            v36 = __p;
          }
          __p = (char *)v35;
          v69 = &v34[8 * v33];
          if (v36) {
            operator delete(v36);
          }
        }
        else
        {
          *(void *)v68 = v29;
          uint64_t v30 = v68 + 8;
        }
        v68 = v30;
        double v38 = [(ARMLImageProcessingTechnique *)self outputTensorNames];
        id v39 = [v38 objectAtIndexedSubscript:i];
        [v39 UTF8String];
        int v40 = espresso_network_bind_direct_cvpixelbuffer();

        if (v40)
        {
          id v41 = _ARLogTechnique();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            id v42 = (objc_class *)objc_opt_class();
            uint64_t v43 = NSStringFromClass(v42);
            *(_DWORD *)buf = 138543874;
            v71 = v43;
            __int16 v72 = 2048;
            v73 = self;
            __int16 v74 = 2080;
            v75 = "Failure to bind direct cvpixelbuffer output";
            _os_log_impl(&dword_1B88A2000, v41, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", buf, 0x20u);
          }
        }
        kdebug_trace();
      }
    }
    for (unint64_t j = 0; ; ++j)
    {
      id v45 = [(ARMLImageProcessingTechnique *)self inputTensorNames];
      BOOL v46 = j < [v45 count];

      if (!v46) {
        break;
      }
      if ([(ARMLImageProcessingTechnique *)self bindInputBuffer:j withImage:v11 andOriginalImageData:v66 rotationOfResultTensor:a6])
      {
        [v11 timestamp];
        -[ARMLImageProcessingTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
        long long v50 = _ARLogTechnique();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          long long v51 = (objc_class *)objc_opt_class();
          long long v52 = NSStringFromClass(v51);
          *(_DWORD *)v76 = 138543874;
          *(void *)&v76[4] = v52;
          *(_WORD *)&v76[12] = 2048;
          *(void *)&v76[14] = self;
          *(_WORD *)&v76[22] = 2048;
          v77 = (const char *)j;
          _os_log_impl(&dword_1B88A2000, v50, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to bind input buffer for index: '%lu'.", v76, 0x20u);
        }
        CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v11 pixelBuffer], 0);
        double v12 = 0;
        goto LABEL_42;
      }
    }
    if (espresso_plan_execute_sync())
    {
      uint64_t v47 = _ARLogTechnique();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        __int16 v48 = (objc_class *)objc_opt_class();
        CVReturn v49 = NSStringFromClass(v48);
        *(_DWORD *)v76 = 138543874;
        *(void *)&v76[4] = v49;
        *(_WORD *)&v76[12] = 2048;
        *(void *)&v76[14] = self;
        *(_WORD *)&v76[22] = 2080;
        v77 = "Failure to run network.";
        _os_log_impl(&dword_1B88A2000, v47, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %s", v76, 0x20u);
      }
      CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v11 pixelBuffer], 0);
      [v11 timestamp];
      -[ARMLImageProcessingTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
      double v12 = 0;
    }
    else
    {
      [v11 timestamp];
      -[ARMLImageProcessingTechnique _endMLRunNetworkSignpostWithTimestamp:](self, "_endMLRunNetworkSignpostWithTimestamp:");
      CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v11 pixelBuffer], 0);
      uint64_t v54 = (__CVBuffer *)[v11 pixelBuffer];
      [v11 timestamp];
      double v56 = v55;
      if (v54)
      {
        size_t v57 = CVPixelBufferGetWidth(v54);
        size_t v58 = CVPixelBufferGetHeight(v54);
        double v59 = (double)v57;
        double v60 = (double)v58;
      }
      else
      {
        double v59 = *MEMORY[0x1E4F1DB30];
        double v60 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      -[ARMLImageProcessingTechnique _startMLCreateResultSignpostWithTimestamp:orientation:outputSize:](self, "_startMLCreateResultSignpostWithTimestamp:orientation:outputSize:", v64, v56, v59, v60);
      if ([(ARMLImageProcessingTechnique *)self useEspressoZeroCopyOutput]) {
        -[ARMLImageProcessingTechnique createResultDataFromPixelBuffer:numberOfOutputTensors:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:](self, "createResultDataFromPixelBuffer:numberOfOutputTensors:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:", width, height);
      }
      else {
      double v12 = -[ARMLImageProcessingTechnique createResultDataFromTensors:numberOfOutputTensors:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:](self, "createResultDataFromTensors:numberOfOutputTensors:imageDataForNeuralNetwork:inputImageData:rotationNeeded:regionOfInterest:", width, height);
      }
      [v11 timestamp];
      -[ARMLImageProcessingTechnique _endMLCreateResultSignpostWithTimestamp:](self, "_endMLCreateResultSignpostWithTimestamp:");
      if ([(ARMLImageProcessingTechnique *)self useEspressoZeroCopyOutput])
      {
        for (unint64_t k = 0; ; ++k)
        {
          v62 = [(ARMLImageProcessingTechnique *)self outputTensorNames];
          BOOL v63 = k < [v62 count];

          if (!v63) {
            break;
          }
          CVPixelBufferRelease(*(CVPixelBufferRef *)&__p[8 * k]);
        }
      }
    }
LABEL_42:
    if (__p) {
      operator delete(__p);
    }
  }
  return v12;
}

- (id)processEspressoTensor:(id)a3
{
  return 0;
}

- (id)createResultDataFromTensors:(id *)a3 numberOfOutputTensors:(unint64_t)a4 imageDataForNeuralNetwork:(id)a5 inputImageData:(id)a6 rotationNeeded:(int64_t)a7 regionOfInterest:(CGSize)a8
{
  return 0;
}

- (BOOL)preProcessNetworkInputImage:(__CVBuffer *)a3
{
  return 1;
}

- (BOOL)shouldUseSynchronizedUltraWide
{
  return 0;
}

- (int64_t)getDeviceOrientationFromImageData:(id)a3
{
  id v4 = a3;
  if (![v4 deviceOrientation])
  {
    int64_t lockedOrientation = self->_lockedOrientation;
    if ((lockedOrientation & 0x80000000) == 0) {
      goto LABEL_6;
    }
    objc_super v6 = +[ARBKSAccelerometer sharedWeakAccelerometerHandle];
    uint64_t v7 = v6;
    if (v6)
    {
      int64_t lockedOrientation = [v6 currentOrientation];

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)ARMLImageProcessingTechnique;
  int64_t lockedOrientation = [(ARImageBasedTechnique *)&v9 getDeviceOrientationFromImageData:v4];
LABEL_6:

  return lockedOrientation;
}

- (BOOL)isBusy
{
  intptr_t v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_processingSemaphore, 0);
  if (!v3) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_processingSemaphore);
  }
  return v3 != 0;
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

- (void)_captureMLRunNetworkInputImageData:(double)a3 cameraType:(int64_t)a4 imageWidth:(unint64_t)a5 imageHeight:(unint64_t)a6
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

- (NSString)networkFilePath
{
  return self->_networkFilePath;
}

- (void)setNetworkFilePath:(id)a3
{
}

- (BOOL)failedToLoadNetwork
{
  return self->_failedToLoadNetwork;
}

- (CGSize)networkInputScaleBeforeRotation
{
  double width = self->_networkInputScaleBeforeRotation.width;
  double height = self->_networkInputScaleBeforeRotation.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)useEspressoZeroCopyOutput
{
  return self->_useEspressoZeroCopyOutput;
}

- (void)setUseEspressoZeroCopyOutput:(BOOL)a3
{
  self->_useEspressoZeroCopyOutput = a3;
}

- (BOOL)prepComplete
{
  return self->_prepComplete;
}

- (void)setPrepComplete:(BOOL)a3
{
  self->_prepComplete = a3;
}

- (NSArray)inputTensorNames
{
  return self->_inputTensorNames;
}

- (NSArray)outputTensorNames
{
  return self->_outputTensorNames;
}

- (CGSize)allowedResamplingImageSize
{
  double width = self->_allowedResamplingImageSize.width;
  double height = self->_allowedResamplingImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAllowedResamplingImageSize:(CGSize)a3
{
  self->_allowedResamplingImageSize = a3;
}

- (BOOL)networkHasConfigurations
{
  return self->_networkHasConfigurations;
}

- (void)setNetworkHasConfigurations:(BOOL)a3
{
  self->_networkHasConfigurations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputTensorNames, 0);
  objc_storeStrong((id *)&self->_networkFilePath, 0);
  objc_storeStrong((id *)&self->_previous_network_configuration, 0);
  begin = self->_espressoInputTensors.__begin_;
  if (begin)
  {
    self->_espressoInputTensors.__end_ = begin;
    operator delete(begin);
  }
  id v4 = self->_espressoOutputBufferPools.__begin_;
  if (v4)
  {
    self->_espressoOutputBufferPools.__end_ = v4;
    operator delete(v4);
  }
  double v5 = self->_espressoOutputTensors.__begin_;
  if (v5)
  {
    self->_espressoOutputTensors.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_processingSemaphore, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 27) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 26) = 0;
  return self;
}

@end