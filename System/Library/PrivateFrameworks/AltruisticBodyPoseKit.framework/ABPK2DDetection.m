@interface ABPK2DDetection
+ (CGSize)inputDimensionsForDeviceOrientation:(id)a3;
- (ABPK2DDetection)initWithNetworkConfig:(id)a3;
- (BOOL)initMLNetwork;
- (BOOL)useEspressoZeroCopyOutput;
- (id).cxx_construct;
- (id)_createResultDataFromImageDataForNeuralNetwork:(id)a3 originalImageData:(id)a4 outputPixelBuffer:(__CVBuffer *)a5 numberOfOutputTensors:(unint64_t)a6 rotationOfResultTensor:(int64_t)a7;
- (id)createException:(void *)a3 forNetwork:(id)a4;
- (id)runWithImage:(__CVBuffer *)a3 abpkOrientation:(int64_t)a4 atTimestamp:(double)a5 rotationOfResultTensor:(int64_t)a6;
- (id)runWithImageDataForNeuralNetwork:(id)a3 originalImageData:(id)a4 abpkOrientation:(int64_t)a5 atTimestamp:(double)a6 rotationOfResultTensor:(int64_t)a7;
- (id)runWithMLImage:(id)a3 originalImage:(id)a4 abpkOrientation:(int64_t)a5 atTimestamp:(double)a6 rotationOfResultTensor:(int64_t)a7;
- (void)_bindOutputTensor;
- (void)_endEvaluateBodyPoseForImageSignpostWithTimestamp:(double)a3;
- (void)_endLoadingMLModelSignpost;
- (void)_startEvaluateBodyPoseForImageSignpostWithTimestamp:(double)a3;
- (void)_startLoadingMLModelSignpost;
- (void)changeEspressoConfig:(id)a3;
- (void)dealloc;
- (void)setUseEspressoZeroCopyOutput:(BOOL)a3;
@end

@implementation ABPK2DDetection

- (ABPK2DDetection)initWithNetworkConfig:(id)a3
{
  id v5 = a3;
  v6 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v6, OS_LOG_TYPE_DEBUG, " ABPK2DDetection: Initializing ", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)ABPK2DDetection;
  v7 = [(ABPK2DDetection *)&v19 init];
  v8 = v7;
  if (v7
    && (objc_storeStrong((id *)&v7->_config2D, a3),
        +[ABPK2DMLModelConfigSelector getModelWithNetworkConfig:v8->_config2D], uint64_t v9 = objc_claimAutoreleasedReturnValue(), mlConfig = v8->_mlConfig, v8->_mlConfig = (ABPKMLModelConfiguration2D *)v9, mlConfig, [(ABPK2DDetection *)v8 setUseEspressoZeroCopyOutput:1], [(ABPK2DDetection *)v8 initMLNetwork]))
  {
    [(ABPKMLModelConfiguration2D *)v8->_mlConfig inputDimensions];
    v8->_parameters.input.resolution.width = v11;
    v8->_parameters.input.resolution.height = v12;
    [(ABPKMLModelConfiguration2D *)v8->_mlConfig biasR];
    v8->_parameters.input.preprocessor.bias_r = v13;
    [(ABPKMLModelConfiguration2D *)v8->_mlConfig biasG];
    v8->_parameters.input.preprocessor.bias_g = v14;
    [(ABPKMLModelConfiguration2D *)v8->_mlConfig biasB];
    v8->_parameters.input.preprocessor.bias_b = v15;
    [(ABPKMLModelConfiguration2D *)v8->_mlConfig scale];
    v8->_parameters.input.preprocessor.scale = v16;
    v8->_parameters.input.preprocessor.network_wants_bgr = [(ABPKMLModelConfiguration2D *)v8->_mlConfig networkWantsBGR];
    v17 = v8;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (CGSize)inputDimensionsForDeviceOrientation:(id)a3
{
  [a3 inputDimensions];
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)createException:(void *)a3 forNetwork:(id)a4
{
  id v4 = a4;
  id v5 = [NSString alloc];
  espresso_plan_get_error_info();
  v7 = (void *)[v5 initWithUTF8String:v6];
  v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = [NSString stringWithFormat:@"%@ in %@", v7, v4];
  v10 = [v8 exceptionWithName:@"EspressoPlanFailure" reason:v9 userInfo:0];

  return v10;
}

- (BOOL)initMLNetwork
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  [(ABPK2DDetection *)self _startLoadingMLModelSignpost];
  double v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ABPK2DDetection: Initializing ML Network ", (uint8_t *)&buf, 2u);
  }

  id v4 = [(ABPKMLModelConfiguration *)self->_mlConfig inputTensorNames];
  inputTensorNames = self->_inputTensorNames;
  self->_inputTensorNames = v4;

  uint64_t v6 = [(ABPKMLModelConfiguration *)self->_mlConfig outputTensorNames];
  outputTensorNames = self->_outputTensorNames;
  self->_outputTensorNames = v6;

  self->_useEspressoV2 = 0;
  v8 = [(ABPKMLModelConfiguration *)self->_mlConfig compiledMLModelPath];
  if (!v8)
  {
    uint64_t v9 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = 0;
      _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_ERROR, " Network path is nil: %@ ", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_35;
  }
  uint64_t v9 = [(ABPKMLModelConfiguration2D *)self->_mlConfig configStringForABPKDeviceOrientation:3];
  v10 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_21B7C6000, v10, OS_LOG_TYPE_DEBUG, " \t Select network config: %@ ", (uint8_t *)&buf, 0xCu);
  }

  if (![v8 hasSuffix:@".bundle"])
  {
    context = (void *)espresso_create_context();
    self->_context = context;
    if (context)
    {
      v18 = "ANE";
    }
    else
    {
      objc_super v19 = (void *)espresso_create_context();
      self->_context = v19;
      if (!v19)
      {
        v37 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_21B7C6000, v37, OS_LOG_TYPE_ERROR, " ANE not available. GPU not available. Espresso context creation failed for 2d detection model. ", (uint8_t *)&buf, 2u);
        }

        goto LABEL_35;
      }
      v18 = "GPU";
    }
    v20 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_21B7C6000, v20, OS_LOG_TYPE_DEFAULT, " \t Deploying 2d detection model on %s ", (uint8_t *)&buf, 0xCu);
    }

    Espresso::get_internal_context((uint64_t *)&buf, (Espresso *)self->_context, v21);
    *(_DWORD *)(buf + 68) = 1;
    v22 = [v8 stringByAppendingPathComponent:@"model.espresso.net"];
    v23 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v55 = 138412290;
      v56 = v22;
      _os_log_impl(&dword_21B7C6000, v23, OS_LOG_TYPE_DEFAULT, " %@ ", v55, 0xCu);
    }

    id v24 = objc_alloc_init(MEMORY[0x263F08850]);
    char v25 = [v24 fileExistsAtPath:v22 isDirectory:0];
    if (v25)
    {
      self->_plan = (void *)espresso_create_plan();
      [v22 UTF8String];
      if (!espresso_plan_add_network())
      {
        [v9 UTF8String];
        if (!espresso_network_select_configuration())
        {
          if (![(ABPKMLModelConfiguration2D *)self->_mlConfig applyPreProcessing]
            || ([(NSArray *)self->_inputTensorNames objectAtIndexedSubscript:0],
                id v26 = objc_claimAutoreleasedReturnValue(),
                [v26 UTF8String],
                BOOL v27 = espresso_set_image_preprocessing_params() == 0,
                v26,
                v27))
          {
            v28 = self->_inputTensorNames;
            v53[0] = MEMORY[0x263EF8330];
            v53[1] = 3221225472;
            v53[2] = __32__ABPK2DDetection_initMLNetwork__block_invoke;
            v53[3] = &unk_2643B6ED0;
            v53[4] = self;
            id v29 = v8;
            id v54 = v29;
            [(NSArray *)v28 enumerateObjectsUsingBlock:v53];
            std::vector<espresso_buffer_t>::resize((uint64_t)&self->_espressoOutputTensors, [(NSArray *)self->_outputTensorNames count]);
            std::vector<__CVPixelBufferPool *>::resize((uint64_t)&self->_espressoOutputBufferPools, [(NSArray *)self->_outputTensorNames count]);
            std::vector<__CVPixelBufferPool *>::resize((uint64_t)&self->_outputBuffers, [(NSArray *)self->_outputTensorNames count]);
            v30 = self->_outputTensorNames;
            v51[0] = MEMORY[0x263EF8330];
            v51[1] = 3221225472;
            v51[2] = __32__ABPK2DDetection_initMLNetwork__block_invoke_17;
            v51[3] = &unk_2643B6ED0;
            v51[4] = self;
            id v31 = v29;
            id v52 = v31;
            [(NSArray *)v30 enumerateObjectsUsingBlock:v51];
            if (espresso_plan_build())
            {
              v39 = __ABPKLogSharedInstance();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v55 = 0;
                _os_log_impl(&dword_21B7C6000, v39, OS_LOG_TYPE_ERROR, " Could not build plan ", v55, 2u);
              }

              id v40 = [(ABPK2DDetection *)self createException:self->_plan forNetwork:v31];
              objc_exception_throw(v40);
            }
            [(ABPK2DDetection *)self _bindOutputTensor];
            v32 = self->_inputTensorNames;
            v49[0] = MEMORY[0x263EF8330];
            v49[1] = 3221225472;
            v49[2] = __32__ABPK2DDetection_initMLNetwork__block_invoke_18;
            v49[3] = &unk_2643B6ED0;
            v49[4] = self;
            id v33 = v31;
            id v50 = v33;
            [(NSArray *)v32 enumerateObjectsUsingBlock:v49];
            v34 = self->_outputTensorNames;
            uint64_t v43 = MEMORY[0x263EF8330];
            uint64_t v44 = 3221225472;
            v45 = __32__ABPK2DDetection_initMLNetwork__block_invoke_19;
            v46 = &unk_2643B6ED0;
            v47 = self;
            id v48 = v33;
            [(NSArray *)v34 enumerateObjectsUsingBlock:&v43];

            goto LABEL_28;
          }
          v41 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v55 = 0;
            _os_log_impl(&dword_21B7C6000, v41, OS_LOG_TYPE_ERROR, " Could not set preprocessing parameters for the input image ", v55, 2u);
          }
        }
      }
      id v42 = [(ABPK2DDetection *)self createException:self->_plan forNetwork:v8];
      objc_exception_throw(v42);
    }
    v35 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v55 = 138412290;
      v56 = v22;
      _os_log_impl(&dword_21B7C6000, v35, OS_LOG_TYPE_ERROR, " Network path is invalid: %@ ", v55, 0xCu);
    }

LABEL_28:
    if (*((void *)&buf + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
    }
    if (v25) {
      goto LABEL_31;
    }
LABEL_35:
    BOOL v36 = 0;
    goto LABEL_36;
  }
  self->_useEspressoV2 = 1;
  CGFloat v11 = [[ABPKMLNetworkV2 alloc] initWithNetworkPath:v8 networkConfig:v9 inputNames:self->_inputTensorNames outputNames:self->_outputTensorNames useSurface:1];
  networkV2 = self->_networkV2;
  self->_networkV2 = v11;

  float v13 = [(ABPKMLNetworkV2 *)self->_networkV2 inputBuffers];
  inputBufferDict = self->_inputBufferDict;
  self->_inputBufferDict = v13;

  float v15 = [(ABPKMLNetworkV2 *)self->_networkV2 outputBuffers];
  outputBufferDict = self->_outputBufferDict;
  self->_outputBufferDict = v15;

LABEL_31:
  [(ABPK2DDetection *)self _endLoadingMLModelSignpost];
  BOOL v36 = 1;
LABEL_36:

  return v36;
}

void __32__ABPK2DDetection_initMLNetwork__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = a2;
  [v5 UTF8String];
  if (espresso_network_declare_input())
  {
    double v3 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_ERROR, " Could not declare input tensor: %@ ", buf, 0xCu);
    }

    id v4 = [*(id *)(a1 + 32) createException:*(void *)(*(void *)(a1 + 32) + 40) forNetwork:*(void *)(a1 + 40)];
    objc_exception_throw(v4);
  }
}

void __32__ABPK2DDetection_initMLNetwork__block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = a2;
  [v5 UTF8String];
  if (espresso_network_declare_output())
  {
    double v3 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_ERROR, " Could not declare output tensor: %@ ", buf, 0xCu);
    }

    id v4 = [*(id *)(a1 + 32) createException:*(void *)(*(void *)(a1 + 32) + 40) forNetwork:*(void *)(a1 + 40)];
    objc_exception_throw(v4);
  }
}

void __32__ABPK2DDetection_initMLNetwork__block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  [v3 UTF8String];
  if (espresso_network_query_blob_dimensions())
  {
    id v5 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_ERROR, " Could not obtain dimension for input tensor: %@ ", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) createException:*(void *)(*(void *)(a1 + 32) + 40) forNetwork:*(void *)(a1 + 40)];
    objc_exception_throw(v6);
  }
  id v4 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138413314;
    id v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v17;
    __int16 v11 = 2048;
    uint64_t v12 = *((void *)&v17 + 1);
    __int16 v13 = 2048;
    uint64_t v14 = v18;
    __int16 v15 = 2048;
    uint64_t v16 = *((void *)&v18 + 1);
    _os_log_impl(&dword_21B7C6000, v4, OS_LOG_TYPE_DEBUG, " \t Tensor %@ dimensions %zu %zu %zu %zu ", (uint8_t *)&v7, 0x34u);
  }
}

void __32__ABPK2DDetection_initMLNetwork__block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  [v3 UTF8String];
  if (espresso_network_query_blob_dimensions())
  {
    id v5 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_ERROR, " Could not obtain dimension for output tensor: %@ ", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) createException:*(void *)(*(void *)(a1 + 32) + 40) forNetwork:*(void *)(a1 + 40)];
    objc_exception_throw(v6);
  }
  id v4 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138413314;
    id v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v17;
    __int16 v11 = 2048;
    uint64_t v12 = *((void *)&v17 + 1);
    __int16 v13 = 2048;
    uint64_t v14 = v18;
    __int16 v15 = 2048;
    uint64_t v16 = *((void *)&v18 + 1);
    _os_log_impl(&dword_21B7C6000, v4, OS_LOG_TYPE_DEBUG, " \t Tensor %@ dimensions %zu %zu %zu %zu ", (uint8_t *)&v7, 0x34u);
  }
}

- (void)_bindOutputTensor
{
  outputTensorNames = self->_outputTensorNames;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__ABPK2DDetection__bindOutputTensor__block_invoke;
  v3[3] = &unk_2643B6E30;
  v3[4] = self;
  [(NSArray *)outputTensorNames enumerateObjectsUsingBlock:v3];
}

void __36__ABPK2DDetection__bindOutputTensor__block_invoke(uint64_t a1, void *a2)
{
  buf[21] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) useEspressoZeroCopyOutput])
  {
    id v4 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v3;
      _os_log_impl(&dword_21B7C6000, v4, OS_LOG_TYPE_DEBUG, " \t Bind Output Tensor %@  ", (uint8_t *)buf, 0xCu);
    }

    id v5 = v3;
    [v5 UTF8String];
    espresso_network_bind_buffer();
    CVPixelBufferRef pixelBufferOut = 0;
    id v6 = (__IOSurface *)buf[0];
    uint64_t v25 = *MEMORY[0x263F04178];
    uint64_t v26 = MEMORY[0x263EFFA78];
    CFDictionaryRef v7 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    CVReturn v8 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v6, v7, &pixelBufferOut);
    if (!CVPixelBufferGetIOSurface(pixelBufferOut))
    {
      __int16 v9 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = (objc_class *)objc_opt_class();
        __int16 v11 = NSStringFromClass(v10);
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v19 = 138412546;
        v20 = v11;
        __int16 v21 = 2048;
        uint64_t v22 = v12;
        _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_ERROR, " %@ (%p): Could not get IOSurface ", v19, 0x16u);
      }
    }
    if (v8)
    {
      __int16 v13 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = (objc_class *)objc_opt_class();
        __int16 v15 = NSStringFromClass(v14);
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v19 = 138412802;
        v20 = v15;
        __int16 v21 = 2048;
        uint64_t v22 = v16;
        __int16 v23 = 1024;
        CVReturn v24 = v8;
        _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_ERROR, " %@ (%p): Could not create CVPixelBuffer for neural network: %d ", v19, 0x1Cu);
      }
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Error: Could not create CVPixelBuffer for neural network";
      __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
    }
    [v5 UTF8String];
    espresso_network_bind_direct_cvpixelbuffer();
    CVPixelBufferRelease(pixelBufferOut);
  }
  else
  {
    [v3 UTF8String];
    espresso_network_bind_buffer();
  }
}

- (id)runWithImageDataForNeuralNetwork:(id)a3 originalImageData:(id)a4 abpkOrientation:(int64_t)a5 atTimestamp:(double)a6 rotationOfResultTensor:(int64_t)a7
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v81 = a3;
  id v82 = a4;
  uint64_t v10 = (__CVBuffer *)[v81 pixelBuffer];
  __int16 v11 = v10;
  if (!v10)
  {
    uint64_t v14 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)long long buf = 0;
    id v40 = " Input image is nil ";
LABEL_42:
    _os_log_impl(&dword_21B7C6000, v14, OS_LOG_TYPE_ERROR, v40, buf, 2u);
    goto LABEL_43;
  }
  if (CVPixelBufferGetPixelFormatType(v10) != 1111970369)
  {
    uint64_t v14 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)long long buf = 0;
    id v40 = " Input image format is not valid ";
    goto LABEL_42;
  }
  if (!CVPixelBufferGetIOSurface(v11))
  {
    uint64_t v14 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      id v40 = " Input image pixelbuffer not backed by IOSurface ";
      goto LABEL_42;
    }
LABEL_43:
    v41 = 0;
    goto LABEL_44;
  }
  uint64_t v12 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = convertABPKDeviceOrientationEnumToString(a5);
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " \t Device Orientation: %@ ", buf, 0xCu);
  }
  uint64_t v14 = [(ABPKMLModelConfiguration2D *)self->_mlConfig configStringForABPKDeviceOrientation:a5];
  __int16 v15 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl(&dword_21B7C6000, v15, OS_LOG_TYPE_DEBUG, " \t Selected network mode: %@ ", buf, 0xCu);
  }

  if (!v14)
  {
    v76 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21B7C6000, v76, OS_LOG_TYPE_ERROR, " Invalid network mode specified ", buf, 2u);
    }

    id v77 = [(ABPK2DDetection *)self createException:self->_plan forNetwork:self->_netSubPath];
    objc_exception_throw(v77);
  }
  uint64_t v16 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    size_t Height = CVPixelBufferGetHeight(v11);
    size_t Width = CVPixelBufferGetWidth(v11);
    *(_DWORD *)long long buf = 134218240;
    *(void *)&uint8_t buf[4] = Height;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = Width;
    _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_DEBUG, " \t Binding image with (height,width) = (%zu,%zu) ", buf, 0x16u);
  }

  [(ABPK2DDetection *)self changeEspressoConfig:v14];
  if (self->_useEspressoV2)
  {
    inputBufferDict = self->_inputBufferDict;
    v20 = [(NSArray *)self->_inputTensorNames objectAtIndexedSubscript:0];
    v80 = [(NSMutableDictionary *)inputBufferDict objectForKeyedSubscript:v20];

    CVPixelBufferLockBaseAddress(v11, 0);
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v11);
    uint64_t v22 = [(NSArray *)self->_inputTensorNames objectAtIndexedSubscript:0];
    [v80 setInput:v22 FromIOSurface:IOSurface];

    [(ABPKMLNetworkV2 *)self->_networkV2 execute];
    CVPixelBufferUnlockBaseAddress(v11, 0);
    __int16 v23 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21B7C6000, v23, OS_LOG_TYPE_DEBUG, " \t Creating AR2DSkeletonRawEspressoResult with heatmap only ", buf, 2u);
    }

    unint64_t v24 = 0;
    memset(buf, 0, 24);
    while (v24 < [(NSArray *)self->_outputTensorNames count])
    {
      outputBufferDict = self->_outputBufferDict;
      uint64_t v26 = [(NSArray *)self->_outputTensorNames objectAtIndexedSubscript:v24];
      BOOL v27 = [(NSMutableDictionary *)outputBufferDict objectForKeyedSubscript:v26];

      CVPixelBufferRef v28 = CVPixelBufferRetain((CVPixelBufferRef)[v27 pixelBuffer]);
      CVPixelBufferRef v29 = v28;
      long long v30 = *(_OWORD *)&buf[8];
      if (*(void *)&buf[8] >= *(void *)&buf[16])
      {
        uint64_t v32 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3;
        if ((unint64_t)(v32 + 1) >> 61) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v33 = (uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 2;
        if (v33 <= v32 + 1) {
          unint64_t v33 = v32 + 1;
        }
        if (*(void *)&buf[16] - *(void *)buf >= 0x7FFFFFFFFFFFFFF8uLL) {
          unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v34 = v33;
        }
        if (v34) {
          v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&buf[16], v34);
        }
        else {
          v35 = 0;
        }
        BOOL v36 = (CVPixelBufferRef *)&v35[8 * v32];
        *BOOL v36 = v29;
        id v31 = v36 + 1;
        v38 = *(char **)buf;
        v37 = *(char **)&buf[8];
        if (*(void *)&buf[8] != *(void *)buf)
        {
          do
          {
            v39 = (__CVBuffer *)*((void *)v37 - 1);
            v37 -= 8;
            *--BOOL v36 = v39;
          }
          while (v37 != v38);
          v37 = *(char **)buf;
        }
        *(void *)long long buf = v36;
        *(void *)&buf[8] = v31;
        *(void *)&uint8_t buf[16] = &v35[8 * v34];
        if (v37) {
          operator delete(v37);
        }
      }
      else
      {
        **(void **)&buf[8] = v28;
        id v31 = (void *)(v30 + 8);
      }
      *(void *)&buf[8] = v31;

      ++v24;
    }
    v41 = -[ABPK2DDetection _createResultDataFromImageDataForNeuralNetwork:originalImageData:outputPixelBuffer:numberOfOutputTensors:rotationOfResultTensor:](self, "_createResultDataFromImageDataForNeuralNetwork:originalImageData:outputPixelBuffer:numberOfOutputTensors:rotationOfResultTensor:", v81, v82);
    if (*(void *)buf)
    {
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }

    goto LABEL_44;
  }
  CVPixelBufferLockBaseAddress(v11, 0);
  unint64_t v43 = 0;
  __p = 0;
  v84 = 0;
  v85 = 0;
  while (v43 < [(NSArray *)self->_outputTensorNames count])
  {
    id v44 = [(NSArray *)self->_outputTensorNames objectAtIndexedSubscript:v43];
    [v44 UTF8String];
    espresso_network_query_blob_dimensions();

    unint64_t v45 = *(void *)buf;
    long long v46 = *(_OWORD *)&buf[8];
    BOOL v47 = [(ABPK2DDetection *)self useEspressoZeroCopyOutput];
    double v48 = (double)(unint64_t)(*((void *)&v46 + 1) * v46);
    double v49 = (double)v45;
    id v50 = &self->_espressoOutputBufferPools.__begin_[v43];
    if (v47)
    {
      CVPixelBufferRef v51 = ABPKCreateCVPixelBufferFromPoolWithZeroCopyOption(v50, 1278226536, self, @"Espresso Output", 1, v49, v48);
      CVPixelBufferRef v52 = v51;
      if (v84 >= v85)
      {
        uint64_t v57 = (v84 - __p) >> 3;
        if ((unint64_t)(v57 + 1) >> 61) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v58 = (v85 - __p) >> 2;
        if (v58 <= v57 + 1) {
          unint64_t v58 = v57 + 1;
        }
        if ((unint64_t)(v85 - __p) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v59 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v59 = v58;
        }
        if (v59) {
          v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v85, v59);
        }
        else {
          v60 = 0;
        }
        v65 = (CVPixelBufferRef *)&v60[8 * v57];
        CVPixelBufferRef *v65 = v52;
        v53 = (char *)(v65 + 1);
        v66 = v84;
        if (v84 != __p)
        {
          do
          {
            v67 = (__CVBuffer *)*((void *)v66 - 1);
            v66 -= 8;
            *--v65 = v67;
          }
          while (v66 != __p);
          v66 = __p;
        }
        __p = (char *)v65;
        v85 = &v60[8 * v59];
        if (v66) {
          operator delete(v66);
        }
      }
      else
      {
        *(void *)v84 = v51;
        v53 = v84 + 8;
      }
      v84 = v53;
      id v68 = [(NSArray *)self->_outputTensorNames objectAtIndexedSubscript:v43];
      [v68 UTF8String];
      espresso_network_bind_direct_cvpixelbuffer();
    }
    else
    {
      CVPixelBufferRef v54 = ABPKCreateCVPixelBufferFromPoolWithZeroCopyOption(v50, 1278226536, self, @"Espresso Output", 0, v49, v48);
      CVPixelBufferRef v55 = v54;
      if (v84 >= v85)
      {
        uint64_t v61 = (v84 - __p) >> 3;
        if ((unint64_t)(v61 + 1) >> 61) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v62 = (v85 - __p) >> 2;
        if (v62 <= v61 + 1) {
          unint64_t v62 = v61 + 1;
        }
        if ((unint64_t)(v85 - __p) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v63 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v63 = v62;
        }
        if (v63) {
          v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v85, v63);
        }
        else {
          v64 = 0;
        }
        v69 = (CVPixelBufferRef *)&v64[8 * v61];
        CVPixelBufferRef *v69 = v55;
        v56 = (char *)(v69 + 1);
        v70 = v84;
        if (v84 != __p)
        {
          do
          {
            v71 = (__CVBuffer *)*((void *)v70 - 1);
            v70 -= 8;
            *--v69 = v71;
          }
          while (v70 != __p);
          v70 = __p;
        }
        __p = (char *)v69;
        v85 = &v64[8 * v63];
        if (v70) {
          operator delete(v70);
        }
      }
      else
      {
        *(void *)v84 = v54;
        v56 = v84 + 8;
      }
      v84 = v56;
      id v68 = [(NSArray *)self->_outputTensorNames objectAtIndexedSubscript:v43];
      [v68 UTF8String];
      espresso_network_bind_cvpixelbuffer();
    }

    ++v43;
  }
  id v72 = [(NSArray *)self->_inputTensorNames objectAtIndexedSubscript:0];
  [v72 UTF8String];
  BOOL v73 = espresso_network_bind_direct_cvpixelbuffer() == 0;

  if (!v73)
  {
    v78 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21B7C6000, v78, OS_LOG_TYPE_ERROR, " Could not direct bind input image as CVPixelBuffer ", buf, 2u);
    }
LABEL_107:

    id v79 = [(ABPK2DDetection *)self createException:self->_plan forNetwork:self->_netSubPath];
    objc_exception_throw(v79);
  }
  if (espresso_plan_execute_sync())
  {
    v78 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21B7C6000, v78, OS_LOG_TYPE_ERROR, " Could not execute plan ", buf, 2u);
    }
    goto LABEL_107;
  }
  CVPixelBufferUnlockBaseAddress(v11, 0);
  for (unint64_t i = 0; i < [(NSArray *)self->_outputTensorNames count]; ++i)
    self->_outputBuffers.__begin_[i] = CVPixelBufferRetain(*(CVPixelBufferRef *)&__p[8 * i]);
  v41 = -[ABPK2DDetection _createResultDataFromImageDataForNeuralNetwork:originalImageData:outputPixelBuffer:numberOfOutputTensors:rotationOfResultTensor:](self, "_createResultDataFromImageDataForNeuralNetwork:originalImageData:outputPixelBuffer:numberOfOutputTensors:rotationOfResultTensor:", v81, v82);
  if ([(ABPK2DDetection *)self useEspressoZeroCopyOutput])
  {
    for (unint64_t j = 0; j < [(NSArray *)self->_outputTensorNames count]; ++j)
      CVPixelBufferRelease(*(CVPixelBufferRef *)&__p[8 * j]);
  }
  if (__p) {
    operator delete(__p);
  }
LABEL_44:

  return v41;
}

- (id)runWithMLImage:(id)a3 originalImage:(id)a4 abpkOrientation:(int64_t)a5 atTimestamp:(double)a6 rotationOfResultTensor:(int64_t)a7
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  [(ABPK2DDetection *)self _startEvaluateBodyPoseForImageSignpostWithTimestamp:a6];
  CVPixelBufferRetain((CVPixelBufferRef)[v12 pixelBuffer]);
  uint64_t v14 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134217984;
    double v18 = a6;
    _os_log_impl(&dword_21B7C6000, v14, OS_LOG_TYPE_DEBUG, " %f ABPK2DDetection: runWithImage ", (uint8_t *)&v17, 0xCu);
  }

  __int16 v15 = [(ABPK2DDetection *)self runWithImageDataForNeuralNetwork:v12 originalImageData:v13 abpkOrientation:a5 atTimestamp:a7 rotationOfResultTensor:a6];
  [(ABPK2DDetection *)self _endEvaluateBodyPoseForImageSignpostWithTimestamp:a6];
  CVPixelBufferRelease((CVPixelBufferRef)[v12 pixelBuffer]);

  return v15;
}

- (id)runWithImage:(__CVBuffer *)a3 abpkOrientation:(int64_t)a4 atTimestamp:(double)a5 rotationOfResultTensor:(int64_t)a6
{
  -[ABPK2DDetection _startEvaluateBodyPoseForImageSignpostWithTimestamp:](self, "_startEvaluateBodyPoseForImageSignpostWithTimestamp:");
  __int16 v11 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int16 v15 = 0;
    _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_DEBUG, " ABPK2DDetection: runWithImage ", v15, 2u);
  }

  id v12 = [[ABPKMLImageData alloc] initWithPixelBuffer:a3 timestamp:a4 abpkDeviceOrientation:0 preprocessingParameters:a5];
  id v13 = [(ABPK2DDetection *)self runWithImageDataForNeuralNetwork:v12 originalImageData:0 abpkOrientation:a4 atTimestamp:a6 rotationOfResultTensor:a5];
  [(ABPK2DDetection *)self _endEvaluateBodyPoseForImageSignpostWithTimestamp:a5];

  return v13;
}

- (void)changeEspressoConfig:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  previous_network_configuration = self->_previous_network_configuration;
  if (previous_network_configuration != v4
    && ![(NSString *)previous_network_configuration isEqualToString:v4])
  {
    if (self->_useEspressoV2)
    {
      [(ABPKMLNetworkV2 *)self->_networkV2 changeNetWorkConfig:v4];
      goto LABEL_10;
    }
    [(ABPK2DDetection *)self _startLoadingMLModelSignpost];
    id v6 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v19 = v4;
      _os_log_impl(&dword_21B7C6000, v6, OS_LOG_TYPE_DEBUG, " \t Changing network config to: %@ ", buf, 0xCu);
    }

    espresso_plan_build_clean();
    CFDictionaryRef v7 = v4;
    [(NSString *)v7 UTF8String];
    if (espresso_network_select_configuration())
    {
      __int16 v11 = __ABPKLogSharedInstance();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v19 = v7;
      id v12 = " Could not select network configuration: %@ ";
      id v13 = v11;
      uint32_t v14 = 12;
    }
    else
    {
      if (!espresso_plan_build())
      {
        [(ABPK2DDetection *)self _bindOutputTensor];
        inputTensorNames = self->_inputTensorNames;
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __40__ABPK2DDetection_changeEspressoConfig___block_invoke;
        v17[3] = &unk_2643B6E30;
        v17[4] = self;
        [(NSArray *)inputTensorNames enumerateObjectsUsingBlock:v17];
        outputTensorNames = self->_outputTensorNames;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __40__ABPK2DDetection_changeEspressoConfig___block_invoke_26;
        v16[3] = &unk_2643B6E30;
        v16[4] = self;
        [(NSArray *)outputTensorNames enumerateObjectsUsingBlock:v16];
        [(ABPK2DDetection *)self _endLoadingMLModelSignpost];
        goto LABEL_10;
      }
      __int16 v11 = __ABPKLogSharedInstance();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_16:

        id v15 = [(ABPK2DDetection *)self createException:self->_plan forNetwork:self->_netSubPath];
        objc_exception_throw(v15);
      }
      *(_WORD *)long long buf = 0;
      id v12 = " Could not build plan ";
      id v13 = v11;
      uint32_t v14 = 2;
    }
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_16;
  }
LABEL_10:
  uint64_t v10 = self->_previous_network_configuration;
  self->_previous_network_configuration = v4;
}

void __40__ABPK2DDetection_changeEspressoConfig___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  [v3 UTF8String];
  if (espresso_network_query_blob_dimensions())
  {
    id v5 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_ERROR, " Could not obtain dimension for input tensor: %@ ", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) createException:*(void *)(*(void *)(a1 + 32) + 40) forNetwork:*(void *)(*(void *)(a1 + 32) + 464)];
    objc_exception_throw(v6);
  }
  id v4 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138413314;
    id v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v17;
    __int16 v11 = 2048;
    uint64_t v12 = *((void *)&v17 + 1);
    __int16 v13 = 2048;
    uint64_t v14 = v18;
    __int16 v15 = 2048;
    uint64_t v16 = *((void *)&v18 + 1);
    _os_log_impl(&dword_21B7C6000, v4, OS_LOG_TYPE_DEBUG, " \t Tensor %@ dimensions %zu %zu %zu %zu ", (uint8_t *)&v7, 0x34u);
  }
}

void __40__ABPK2DDetection_changeEspressoConfig___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  [v3 UTF8String];
  if (espresso_network_query_blob_dimensions())
  {
    id v5 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_ERROR, " Could not obtain dimension for output tensor: %@ ", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) createException:*(void *)(*(void *)(a1 + 32) + 40) forNetwork:*(void *)(*(void *)(a1 + 32) + 464)];
    objc_exception_throw(v6);
  }
  id v4 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138413314;
    id v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v17;
    __int16 v11 = 2048;
    uint64_t v12 = *((void *)&v17 + 1);
    __int16 v13 = 2048;
    uint64_t v14 = v18;
    __int16 v15 = 2048;
    uint64_t v16 = *((void *)&v18 + 1);
    _os_log_impl(&dword_21B7C6000, v4, OS_LOG_TYPE_DEBUG, " \t Tensor %@ dimensions %zu %zu %zu %zu ", (uint8_t *)&v7, 0x34u);
  }
}

- (id)_createResultDataFromImageDataForNeuralNetwork:(id)a3 originalImageData:(id)a4 outputPixelBuffer:(__CVBuffer *)a5 numberOfOutputTensors:(unint64_t)a6 rotationOfResultTensor:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  __int16 v13 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " ABPK2DDetection: Create result data ", buf, 2u);
  }

  int v14 = [(ABPKMLModelConfiguration2D *)self->_mlConfig networkEstimatesAffinityMaps];
  mlConfig = self->_mlConfig;
  if (v14)
  {
    id v38 = v11;
    int v16 = [(ABPKMLModelConfiguration2D *)mlConfig heatMapChannels];
    int v17 = [(ABPKMLModelConfiguration2D *)self->_mlConfig affinityMapChannels];
    int Width = CVPixelBufferGetWidth(*a5);
    int Height = CVPixelBufferGetHeight(*a5);
    int64_t v20 = a7;
    int v21 = CVPixelBufferGetWidth(a5[1]);
    int v22 = CVPixelBufferGetHeight(a5[1]);
    __int16 v23 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v40 = 0;
      _os_log_impl(&dword_21B7C6000, v23, OS_LOG_TYPE_DEBUG, " \t Creating AR2DSkeletonRawEspressoResult with heatmap and affinitymap ", v40, 2u);
    }

    unint64_t v24 = [ABPK2DSkeletonRawEspressoResult alloc];
    LODWORD(v25) = Width;
    LODWORD(v26) = 1;
    LODWORD(v27) = v21;
    HIDWORD(v25) = Height / v16;
    LODWORD(v28) = 1;
    HIDWORD(v28) = Width;
    HIDWORD(v27) = v22 / v17;
    HIDWORD(v26) = v21;
    CVPixelBufferRef v29 = [(ABPK2DSkeletonRawEspressoResult *)v24 initWithMLImage:v38 originalImageData:v12 heatMapBuffer:*a5 heatMapShape:a5[1] heatMapStrides:v20 affinityMapBuffer:v25 affinityMapShape:v28 affinityMapStrides:v27 rotationNeeded:v26];
    id v11 = v38;
  }
  else
  {
    int v30 = [(ABPKMLModelConfiguration2D *)mlConfig heatMapChannels];
    int v31 = CVPixelBufferGetWidth(*a5);
    int v32 = CVPixelBufferGetHeight(*a5);
    unint64_t v33 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_21B7C6000, v33, OS_LOG_TYPE_DEBUG, " \t Creating AR2DSkeletonRawEspressoResult with heatmap only ", v39, 2u);
    }

    unint64_t v34 = [ABPK2DSkeletonRawEspressoResult alloc];
    LODWORD(v35) = v31;
    LODWORD(v36) = 1;
    HIDWORD(v35) = v32 / v30;
    HIDWORD(v36) = v31;
    CVPixelBufferRef v29 = [(ABPK2DSkeletonRawEspressoResult *)v34 initWithMLImage:v11 originalImageData:v12 heatMapBuffer:*a5 heatMapShape:a7 heatMapStrides:v35 rotationNeeded:v36];
  }

  return v29;
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  begin = self->_espressoOutputBufferPools.__begin_;
  end = self->_espressoOutputBufferPools.__end_;
  while (begin != end)
  {
    if (*begin) {
      CVPixelBufferPoolRelease(*begin);
    }
    ++begin;
  }
  v5.receiver = self;
  v5.super_class = (Class)ABPK2DDetection;
  [(ABPK2DDetection *)&v5 dealloc];
}

- (void)_startLoadingMLModelSignpost
{
}

- (void)_endLoadingMLModelSignpost
{
}

- (void)_startEvaluateBodyPoseForImageSignpostWithTimestamp:(double)a3
{
}

- (void)_endEvaluateBodyPoseForImageSignpostWithTimestamp:(double)a3
{
}

- (BOOL)useEspressoZeroCopyOutput
{
  return self->_useEspressoZeroCopyOutput;
}

- (void)setUseEspressoZeroCopyOutput:(BOOL)a3
{
  self->_useEspressoZeroCopyOutput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBufferDict, 0);
  objc_storeStrong((id *)&self->_inputBufferDict, 0);
  objc_storeStrong((id *)&self->_networkV2, 0);
  begin = self->_espressoOutputBufferPools.__begin_;
  if (begin)
  {
    self->_espressoOutputBufferPools.__end_ = begin;
    operator delete(begin);
  }
  id v4 = self->_espressoOutputTensors.__begin_;
  if (v4)
  {
    self->_espressoOutputTensors.__end_ = v4;
    operator delete(v4);
  }
  objc_super v5 = self->_outputBuffers.__begin_;
  if (v5)
  {
    self->_outputBuffers.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_netPath, 0);
  objc_storeStrong((id *)&self->_netSubPath, 0);
  objc_storeStrong((id *)&self->_outputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputTensorNames, 0);
  objc_storeStrong((id *)&self->_previous_network_configuration, 0);
  objc_storeStrong((id *)&self->_mlConfig, 0);
  objc_storeStrong((id *)&self->_config2D, 0);
}

- (id).cxx_construct
{
  *((void *)self + 68) = 0;
  *((_OWORD *)self + 32) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *((_OWORD *)self + 3MEMORY[0x270ED9F50](875757692, 0, 0, 0, 0) = 0u;
  *((_OWORD *)self + 31) = 0u;
  return self;
}

@end