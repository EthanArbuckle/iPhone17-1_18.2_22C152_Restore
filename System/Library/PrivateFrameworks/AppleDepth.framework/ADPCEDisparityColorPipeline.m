@interface ADPCEDisparityColorPipeline
- (ADPCEDisparityColorPipeline)init;
- (ADPCEDisparityColorPipeline)initWithParameters:(id)a3;
- (ADPCEDisparityColorPipeline)initWithParameters:(id)a3 inputSource:(unint64_t)a4;
- (ADPCEDisparityColorPipeline)initWithParameters:(id)a3 inputSource:(unint64_t)a4 metalDevice:(id)a5;
- (ADPCEDisparityColorPipelineParameters)pipelineParameters;
- (float)disparityScaleForLayout:(unint64_t)a3;
- (id)inferenceDescriptor;
- (id)initForInputSource:(unint64_t)a3;
- (id)initForInputSource:(unint64_t)a3 metalDevice:(id)a4;
- (int64_t)adjustForEngine:(unint64_t)a3;
- (int64_t)encodeDisparityPostprocessingToCommandBuffer:(id)a3 input:(id)a4 output:(id)a5;
- (int64_t)encodeDisparityPreprocessingToCommandBuffer:(id)a3 input:(id)a4 normalizationMultiplier:(float)a5 normalizationOffset:(float)a6 invalidValue:(unsigned __int16)a7 rotation:(int64_t)a8 output:(id)a9;
- (int64_t)rebuildMetalPreprocessingKernels;
- (void)setPipelineParameters:(id)a3;
@end

@implementation ADPCEDisparityColorPipeline

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (id)initForInputSource:(unint64_t)a3 metalDevice:(id)a4
{
  return [(ADPCEDisparityColorPipeline *)self initWithParameters:0 inputSource:a3 metalDevice:a4];
}

- (ADPCEDisparityColorPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (float)disparityScaleForLayout:(unint64_t)a3
{
  if ([(ADPCEDisparityColorPipelineParameters *)self->_pipelineParameters trainingWidth])
  {
    v5 = [(ADEspressoPCEDisparityColorInferenceDescriptor *)self->_inferenceDesc colorInput];
    v6 = [v5 imageDescriptor];
    [v6 sizeForLayout:a3];
    float v8 = v7 / (double)[(ADPCEDisparityColorPipelineParameters *)self->_pipelineParameters trainingWidth];
  }
  else
  {
    float v8 = 1.0;
  }
  [(ADPCEDisparityColorPipelineParameters *)self->_pipelineParameters disparityScaleForModelZoom];
  return v8 * v9;
}

- (ADPCEDisparityColorPipeline)initWithParameters:(id)a3 inputSource:(unint64_t)a4 metalDevice:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v35 = 335686912;
  long long v36 = 0u;
  long long v37 = 0u;
  kdebug_trace();
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = a4;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Initializing ADPCEDisparityColorPipeline for input source #%d", buf, 8u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v39) = a4;
    _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Initializing ADPCEDisparityColorPipeline for input source #%d", buf, 8u);
  }
  v34.receiver = self;
  v34.super_class = (Class)ADPCEDisparityColorPipeline;
  v10 = [(ADPCEDisparityColorPipeline *)&v34 init];
  v11 = v10;
  if (v10)
  {
    if (!v8) {
      id v8 = (id)objc_opt_new();
    }
    p_pipelineParameters = (id *)&v10->_pipelineParameters;
    objc_storeStrong((id *)&v10->_pipelineParameters, v8);
    switch(a4)
    {
      case 0uLL:
        uint64_t v13 = +[ADNetworkProvider providerForNetwork:@"CinVidStereoWideSuperwide"];
        goto LABEL_13;
      case 1uLL:
      case 3uLL:
        uint64_t v13 = +[ADNetworkProvider providerForNetwork:@"CinVidStereoTeleWide"];
        goto LABEL_13;
      case 2uLL:
        uint64_t v13 = +[ADNetworkProvider providerForNetwork:@"CinVidPearl"];
LABEL_13:
        networkProvider = v10->_networkProvider;
        v10->_networkProvider = (ADNetworkProvider *)v13;

        if (!v10->_networkProvider) {
          goto LABEL_55;
        }
        [*p_pipelineParameters pceBias];
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            [*p_pipelineParameters pceBias];
            *(_DWORD *)buf = 134217984;
            double v39 = v15;
            _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Init with PCE bias value: %f", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          [*p_pipelineParameters pceBias];
          *(_DWORD *)buf = 134217984;
          double v39 = v28;
          _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Init with PCE bias value: %f", buf, 0xCu);
        }
        [*p_pipelineParameters outputDisparityBias];
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            [*p_pipelineParameters outputDisparityBias];
            *(_DWORD *)buf = 134217984;
            double v39 = v19;
            _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Init with output disparity bias value: %f", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          [*p_pipelineParameters outputDisparityBias];
          *(_DWORD *)buf = 134217984;
          double v39 = v29;
          _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Init with output disparity bias value: %f", buf, 0xCu);
        }
        if ([*p_pipelineParameters trainingWidth] == -1)
        {
          v20 = [(ADNetworkProvider *)v10->_networkProvider metadataForKey:TRAINING_WIDTH_METADATA_KEY];
          v21 = v20;
          if (v20)
          {
            objc_msgSend(*p_pipelineParameters, "setTrainingWidth:", objc_msgSend(v20, "unsignedLongValue"));
            if (ADDebugUtilsADVerboseLogsEnabled)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Reading training width from network", buf, 2u);
              }
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Reading training width from network", buf, 2u);
            }
          }
          else
          {
            [*p_pipelineParameters setTrainingWidth:0];
          }
        }
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = [*p_pipelineParameters trainingWidth];
            uint64_t v23 = [*p_pipelineParameters trainingWidth];
            v24 = "";
            if (!v23) {
              v24 = " (no scaling)";
            }
            *(_DWORD *)buf = 134218242;
            double v39 = *(double *)&v22;
            __int16 v40 = 2080;
            v41 = v24;
            _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Init with reference training width value: %ld%s", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v30 = [*p_pipelineParameters trainingWidth];
          uint64_t v31 = [*p_pipelineParameters trainingWidth];
          v32 = "";
          if (!v31) {
            v32 = " (no scaling)";
          }
          *(_DWORD *)buf = 134218242;
          double v39 = *(double *)&v30;
          __int16 v40 = 2080;
          v41 = v32;
          _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Init with reference training width value: %ld%s", buf, 0x16u);
        }
        [*p_pipelineParameters disparityScaleForModelZoom];
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            [*p_pipelineParameters disparityScaleForModelZoom];
            *(_DWORD *)buf = 134217984;
            double v39 = v25;
            _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Init with disparityScaleForModelZoom value: %f", buf, 0xCu);
            if (v9) {
              goto LABEL_53;
            }
            goto LABEL_47;
          }
          goto LABEL_46;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
LABEL_46:
          if (v9) {
            goto LABEL_53;
          }
          goto LABEL_47;
        }
        [*p_pipelineParameters disparityScaleForModelZoom];
        *(_DWORD *)buf = 134217984;
        double v39 = v33;
        _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Init with disparityScaleForModelZoom value: %f", buf, 0xCu);
        if (v9) {
          goto LABEL_53;
        }
LABEL_47:
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Metal device not provided, using default device", buf, 2u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Metal device not provided, using default device", buf, 2u);
        }
        id v9 = MTLCreateSystemDefaultDevice();
        if (!v9)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot create default metal device", buf, 2u);
          }
          id v9 = 0;
          v26 = 0;
          break;
        }
LABEL_53:
        objc_storeStrong((id *)&v10->_metalDevice, v9);
        if (![(ADPCEDisparityColorPipeline *)v10 adjustForEngine:3]) {
          goto LABEL_56;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v16 = &_os_log_internal;
          v17 = "adjustForEngine failed";
          uint32_t v18 = 2;
LABEL_62:
          _os_log_error_impl(&dword_215F16000, v16, OS_LOG_TYPE_ERROR, v17, buf, v18);
          v26 = 0;
        }
        else
        {
LABEL_55:
          v26 = 0;
        }
        break;
      default:
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_55;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v39) = a4;
        v16 = &_os_log_internal;
        v17 = "Unsupported input source: %d";
        uint32_t v18 = 8;
        goto LABEL_62;
    }
  }
  else
  {
LABEL_56:
    v26 = v10;
  }
  kdebug_trace();

  return v26;
}

- (int64_t)rebuildMetalPreprocessingKernels
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 URLForResource:@"default" withExtension:@"metallib" subdirectory:0];

  metalDevice = self->_metalDevice;
  id v63 = 0;
  v6 = (void *)[(MTLDevice *)metalDevice newLibraryWithURL:v4 error:&v63];
  id v7 = v63;
  if (v6)
  {
    id v8 = [(ADEspressoPCEDisparityColorInferenceDescriptor *)self->_inferenceDesc disparityInput];
    id v9 = [v8 imageDescriptor];
    if ([v9 pixelFormat] == 1751411059) {
      uint64_t v10 = 16;
    }
    else {
      uint64_t v10 = 32;
    }

    long long v68 = xmmword_215FC46A0;
    v11 = objc_opt_new();
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"ADPCEDisparityColorPipelineUtils::preprocessPCEDisparityToF%d", v10);
    v56 = objc_msgSend(NSString, "stringWithFormat:", @"ADPCEDisparityColorPipelineUtils::preprocessF%dPCEDisparity", v10);
    [v11 setConstantValue:&v68 type:33 withName:@"RotationMode"];
    id v62 = v7;
    uint64_t v13 = (void *)[v6 newFunctionWithName:v12 constantValues:v11 error:&v62];
    id v14 = v62;

    if (v13)
    {
      float v15 = self->_metalDevice;
      id v61 = v14;
      v16 = (MTLComputePipelineState *)[(MTLDevice *)v15 newComputePipelineStateWithFunction:v13 error:&v61];
      id v17 = v61;

      uint32_t v18 = self->_preprocessPipelineForRawPCE[0];
      self->_preprocessPipelineForRawPCE[0] = v16;

      if (v17)
      {
LABEL_7:
        id v14 = v17;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          v52 = [v17 description];
          *(_DWORD *)buf = 138412546;
          v65 = v12;
          __int16 v66 = 2112;
          v67 = v52;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot create compute pipeline for %@: %@", buf, 0x16u);
        }
        goto LABEL_44;
      }
      id v60 = 0;
      v20 = (void *)[v6 newFunctionWithName:v56 constantValues:v11 error:&v60];
      id v14 = v60;

      if (!v20 || v14) {
        goto LABEL_41;
      }
      v21 = self->_metalDevice;
      id v59 = 0;
      uint64_t v22 = (MTLComputePipelineState *)[(MTLDevice *)v21 newComputePipelineStateWithFunction:v20 error:&v59];
      id v14 = v59;
      uint64_t v23 = self->_preprocessPipelineForFloatPCE[0];
      self->_preprocessPipelineForFloatPCE[0] = v22;

      if (v14) {
        goto LABEL_16;
      }

      [v11 setConstantValue:(char *)&v68 + 4 type:33 withName:@"RotationMode"];
      id v62 = 0;
      uint64_t v13 = (void *)[v6 newFunctionWithName:v12 constantValues:v11 error:&v62];
      id v14 = v62;
      if (v13)
      {
        v24 = self->_metalDevice;
        id v61 = v14;
        float v25 = (MTLComputePipelineState *)[(MTLDevice *)v24 newComputePipelineStateWithFunction:v13 error:&v61];
        id v17 = v61;

        v26 = self->_preprocessPipelineForRawPCE[1];
        self->_preprocessPipelineForRawPCE[1] = v25;

        if (v17) {
          goto LABEL_7;
        }
        id v60 = 0;
        v20 = (void *)[v6 newFunctionWithName:v56 constantValues:v11 error:&v60];
        id v14 = v60;

        if (!v20 || v14) {
          goto LABEL_41;
        }
        v27 = self->_metalDevice;
        id v59 = 0;
        float v28 = (MTLComputePipelineState *)[(MTLDevice *)v27 newComputePipelineStateWithFunction:v20 error:&v59];
        id v14 = v59;
        float v29 = self->_preprocessPipelineForFloatPCE[1];
        self->_preprocessPipelineForFloatPCE[1] = v28;

        if (v14) {
          goto LABEL_16;
        }

        [v11 setConstantValue:(char *)&v68 + 8 type:33 withName:@"RotationMode"];
        id v62 = 0;
        uint64_t v13 = (void *)[v6 newFunctionWithName:v12 constantValues:v11 error:&v62];
        id v14 = v62;
        if (v13)
        {
          uint64_t v30 = self->_metalDevice;
          id v61 = v14;
          uint64_t v31 = (MTLComputePipelineState *)[(MTLDevice *)v30 newComputePipelineStateWithFunction:v13 error:&v61];
          id v17 = v61;

          v32 = self->_preprocessPipelineForRawPCE[2];
          self->_preprocessPipelineForRawPCE[2] = v31;

          if (v17) {
            goto LABEL_7;
          }
          id v60 = 0;
          v20 = (void *)[v6 newFunctionWithName:v56 constantValues:v11 error:&v60];
          id v14 = v60;

          if (!v20 || v14) {
            goto LABEL_41;
          }
          float v33 = self->_metalDevice;
          id v59 = 0;
          objc_super v34 = (MTLComputePipelineState *)[(MTLDevice *)v33 newComputePipelineStateWithFunction:v20 error:&v59];
          id v14 = v59;
          int v35 = self->_preprocessPipelineForFloatPCE[2];
          self->_preprocessPipelineForFloatPCE[2] = v34;

          if (v14) {
            goto LABEL_16;
          }

          [v11 setConstantValue:(unint64_t)&v68 | 0xC type:33 withName:@"RotationMode"];
          id v62 = 0;
          uint64_t v13 = (void *)[v6 newFunctionWithName:v12 constantValues:v11 error:&v62];
          id v14 = v62;
          if (v13)
          {
            long long v36 = self->_metalDevice;
            id v61 = v14;
            long long v37 = (MTLComputePipelineState *)[(MTLDevice *)v36 newComputePipelineStateWithFunction:v13 error:&v61];
            id v17 = v61;

            v38 = self->_preprocessPipelineForRawPCE[3];
            self->_preprocessPipelineForRawPCE[3] = v37;

            if (v17) {
              goto LABEL_7;
            }
            id v60 = 0;
            v20 = (void *)[v6 newFunctionWithName:v56 constantValues:v11 error:&v60];
            id v14 = v60;

            if (v20 && !v14)
            {
              double v39 = self->_metalDevice;
              id v59 = 0;
              __int16 v40 = (MTLComputePipelineState *)[(MTLDevice *)v39 newComputePipelineStateWithFunction:v20 error:&v59];
              id v14 = v59;
              v41 = self->_preprocessPipelineForFloatPCE[3];
              self->_preprocessPipelineForFloatPCE[3] = v40;

              if (!v14)
              {

                uint64_t v42 = objc_msgSend(NSString, "stringWithFormat:", @"ADPCEDisparityColorPipelineUtils::postprocessF%dDisparity", v10);
                id v58 = 0;
                v43 = (void *)[v6 newFunctionWithName:v42 constantValues:v11 error:&v58];
                id v44 = v58;
                id v14 = v44;
                if (!v43 || v44)
                {
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                  {
                    v55 = [v14 description];
                    *(_DWORD *)buf = 138412546;
                    v65 = v42;
                    __int16 v66 = 2112;
                    v67 = v55;
                    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot find metal function %@: %@", buf, 0x16u);
                  }
                }
                else
                {
                  v45 = self->_metalDevice;
                  id v57 = 0;
                  v46 = (MTLComputePipelineState *)[(MTLDevice *)v45 newComputePipelineStateWithFunction:v43 error:&v57];
                  id v14 = v57;
                  postprocessPipeline = self->_postprocessPipeline;
                  self->_postprocessPipeline = v46;

                  if (!v14)
                  {
                    int64_t v19 = 0;
                    goto LABEL_50;
                  }
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
                  {
                    v48 = [v14 description];
                    *(_DWORD *)buf = 138412546;
                    v65 = v42;
                    __int16 v66 = 2112;
                    v67 = v48;
                    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot create compute pipeline for %@: %@", buf, 0x16u);
                  }
                }
                int64_t v19 = -22950;
LABEL_50:

                goto LABEL_45;
              }
LABEL_16:
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                v54 = [v14 description];
                *(_DWORD *)buf = 138412546;
                v65 = v56;
                __int16 v66 = 2112;
                v67 = v54;
                _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot create compute pipeline for %@: %@", buf, 0x16u);
              }
LABEL_43:

LABEL_44:
              int64_t v19 = -22950;
LABEL_45:

              id v7 = v14;
              goto LABEL_46;
            }
LABEL_41:
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              v53 = [v14 description];
              *(_DWORD *)buf = 138412546;
              v65 = v56;
              __int16 v66 = 2112;
              v67 = v53;
              _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot find metal function %@: %@", buf, 0x16u);
            }
            goto LABEL_43;
          }
        }
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v49 = [v14 description];
      *(_DWORD *)buf = 138412546;
      v65 = v12;
      __int16 v66 = 2112;
      v67 = v49;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot find metal function %@: %@", buf, 0x16u);
    }
    goto LABEL_44;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v51 = [v7 description];
    *(_DWORD *)buf = 138412290;
    v65 = v51;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot load metal library: %@", buf, 0xCu);
  }
  int64_t v19 = -22950;
LABEL_46:

  return v19;
}

- (int64_t)adjustForEngine:(unint64_t)a3
{
  unint64_t v4 = a3 - 3;
  v5 = [ADEspressoPCEDisparityColorInferenceDescriptor alloc];
  if (v4 >= 2) {
    uint64_t v6 = 1717856627;
  }
  else {
    uint64_t v6 = 1751411059;
  }
  id v7 = [(ADEspressoPCEDisparityColorInferenceDescriptor *)v5 initWithNetworkProvider:self->_networkProvider inputColorFormat:1111970369 disparityFormat:v6];
  inferenceDesc = self->_inferenceDesc;
  self->_inferenceDesc = v7;

  return [(ADPCEDisparityColorPipeline *)self rebuildMetalPreprocessingKernels];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_postprocessPipeline, 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForFloatPCE[3], 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForFloatPCE[2], 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForFloatPCE[1], 0);
  objc_storeStrong((id *)self->_preprocessPipelineForFloatPCE, 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForRawPCE[3], 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForRawPCE[2], 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForRawPCE[1], 0);
  objc_storeStrong((id *)self->_preprocessPipelineForRawPCE, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

- (void)setPipelineParameters:(id)a3
{
}

- (int64_t)encodeDisparityPostprocessingToCommandBuffer:(id)a3 input:(id)a4 output:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  v11 = [(ADEspressoPCEDisparityColorInferenceDescriptor *)self->_inferenceDesc disparityOutput];
  v12 = [v11 imageDescriptor];
  int v13 = [v12 pixelFormat];

  if (v13 == 1751411059)
  {
    if ([v9 pixelFormat] != 25) {
      goto LABEL_3;
    }
  }
  else if ([v9 pixelFormat] != 55)
  {
LABEL_3:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v14 = [(ADEspressoPCEDisparityColorInferenceDescriptor *)self->_inferenceDesc disparityOutput];
      float v15 = [v14 imageDescriptor];
      PixelBufferUtils::pixelFormatAsString([v15 pixelFormat], (char *)&__p);
      int v16 = SHIBYTE(v30);
      id v17 = (void **)__p;
      int v18 = [v9 pixelFormat];
      p_p = &__p;
      if (v16 < 0) {
        p_p = v17;
      }
      *(_DWORD *)buf = 136446466;
      float v33 = p_p;
      __int16 v34 = 1024;
      int v35 = v18;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Expected output pixelbuffer format (%{public}s) does not match provided texture format (%d)", buf, 0x12u);
      if (SHIBYTE(v30) < 0) {
        operator delete(__p);
      }
    }
LABEL_15:
    int64_t v25 = -22953;
    goto LABEL_20;
  }
  uint64_t v20 = [v9 pixelFormat];
  if (v20 != [v10 pixelFormat])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p) = 67109376;
      HIDWORD(__p) = [v9 pixelFormat];
      __int16 v28 = 1024;
      int v29 = [v10 pixelFormat];
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Input texture format (%d) does not match output texture format (%d)", (uint8_t *)&__p, 0xEu);
    }
    goto LABEL_15;
  }
  [(ADPCEDisparityColorPipelineParameters *)self->_pipelineParameters outputDisparityBias];
  int v30 = v21;
  -[ADPCEDisparityColorPipeline disparityScaleForLayout:](self, "disparityScaleForLayout:", objc_msgSend(MEMORY[0x263F26CA8], "layoutForSize:", (double)(unint64_t)objc_msgSend(v10, "width"), (double)(unint64_t)objc_msgSend(v10, "height")));
  int v31 = v22;
  uint64_t v23 = [v8 computeCommandEncoder];
  v24 = v23;
  if (v23)
  {
    [v23 setComputePipelineState:self->_postprocessPipeline];
    [v24 setTexture:v9 atIndex:0];
    [v24 setTexture:v10 atIndex:1];
    [v24 setBytes:&__p length:28 atIndex:0];
    +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v24, self->_postprocessPipeline, [v10 width], objc_msgSend(v10, "height"));
    [v24 endEncoding];
    int64_t v25 = 0;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed getting command encoder", buf, 2u);
    }
    int64_t v25 = -22950;
  }

LABEL_20:
  kdebug_trace();

  return v25;
}

- (int64_t)encodeDisparityPreprocessingToCommandBuffer:(id)a3 input:(id)a4 normalizationMultiplier:(float)a5 normalizationOffset:(float)a6 invalidValue:(unsigned __int16)a7 rotation:(int64_t)a8 output:(id)a9
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v16 = a4;
  id v17 = a9;
  LODWORD(v44) = 335681660;
  kdebug_trace();
  uint64_t v18 = [v16 pixelFormat];
  if ([v16 pixelFormat] == 25)
  {
    BOOL v19 = 1;
  }
  else
  {
    uint64_t v24 = [v16 pixelFormat];
    BOOL v19 = v24 == 55;
    if (v18 != 23 && v24 != 55)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = [v16 pixelFormat];
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unsupported input texture format %d", buf, 8u);
      }
      int64_t v23 = -22951;
      goto LABEL_27;
    }
  }
  uint64_t v20 = [(ADEspressoPCEDisparityColorInferenceDescriptor *)self->_inferenceDesc disparityInput];
  int v21 = [v20 imageDescriptor];
  int v22 = [v21 pixelFormat];

  if (v22 == 1751411059)
  {
    if ([v17 pixelFormat] != 25) {
      goto LABEL_5;
    }
  }
  else if ([v17 pixelFormat] != 55)
  {
LABEL_5:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      long long v37 = [(ADEspressoPCEDisparityColorInferenceDescriptor *)self->_inferenceDesc disparityInput];
      v38 = [v37 imageDescriptor];
      PixelBufferUtils::pixelFormatAsString([v38 pixelFormat], (char *)buf);
      int v39 = SHIBYTE(v48);
      __int16 v40 = *(uint8_t **)buf;
      int v41 = [v17 pixelFormat];
      uint64_t v42 = buf;
      if (v39 < 0) {
        uint64_t v42 = v40;
      }
      *(_DWORD *)v50 = 136446466;
      v51 = v42;
      __int16 v52 = 1024;
      int v53 = v41;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Expected output pixelbuffer format (%{public}s) does not match provided texture format (%d)", v50, 0x12u);
      if (SHIBYTE(v48) < 0) {
        operator delete(*(void **)buf);
      }
    }
LABEL_6:
    int64_t v23 = -22953;
    goto LABEL_27;
  }
  if (v19)
  {
    uint64_t v25 = [v16 pixelFormat];
    if (v25 != [v17 pixelFormat])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = [v16 pixelFormat];
        LOWORD(v46) = 1024;
        *(_DWORD *)((char *)&v46 + 2) = [v17 pixelFormat];
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Input texture format (%d) does not match output texture format (%d)", buf, 0xEu);
      }
      goto LABEL_6;
    }
  }
  uint64_t v26 = 1;
  uint64_t v27 = (int)a8;
  if (a8 == 1) {
    uint64_t v27 = 3;
  }
  if (a8 != 3) {
    uint64_t v26 = v27;
  }
  preprocessPipelineForRawPCE = self->_preprocessPipelineForRawPCE;
  if (v18 != 23) {
    preprocessPipelineForRawPCE = self->_preprocessPipelineForFloatPCE;
  }
  int v29 = preprocessPipelineForRawPCE[v26];
  [(ADPCEDisparityColorPipelineParameters *)self->_pipelineParameters minDisparity];
  LODWORD(v46) = v30;
  [(ADPCEDisparityColorPipelineParameters *)self->_pipelineParameters maxDisparity];
  HIDWORD(v46) = v31;
  *(float *)buf = a5;
  *(float *)&uint8_t buf[4] = a6;
  unsigned __int16 v47 = a7;
  [(ADPCEDisparityColorPipelineParameters *)self->_pipelineParameters pceBias];
  int v48 = v32;
  -[ADPCEDisparityColorPipeline disparityScaleForLayout:](self, "disparityScaleForLayout:", objc_msgSend(MEMORY[0x263F26CA8], "layoutForSize:", (double)(unint64_t)objc_msgSend(v17, "width"), (double)(unint64_t)objc_msgSend(v17, "height")));
  int v49 = v33;
  __int16 v34 = [v43 computeCommandEncoder];
  int v35 = v34;
  if (v34)
  {
    [v34 setComputePipelineState:v29];
    [v35 setTexture:v16 atIndex:0];
    [v35 setTexture:v17 atIndex:1];
    [v35 setBytes:buf length:28 atIndex:0];
    +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v35, v29, [v17 width], objc_msgSend(v17, "height"));
    [v35 endEncoding];
    int64_t v23 = 0;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v50 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed getting command encoder", v50, 2u);
    }
    int64_t v23 = -22950;
  }

LABEL_27:
  kdebug_trace();

  return v23;
}

- (ADPCEDisparityColorPipeline)initWithParameters:(id)a3 inputSource:(unint64_t)a4
{
  return [(ADPCEDisparityColorPipeline *)self initWithParameters:a3 inputSource:a4 metalDevice:0];
}

- (ADPCEDisparityColorPipeline)initWithParameters:(id)a3
{
  return [(ADPCEDisparityColorPipeline *)self initWithParameters:a3 inputSource:0 metalDevice:0];
}

- (id)initForInputSource:(unint64_t)a3
{
  return [(ADPCEDisparityColorPipeline *)self initWithParameters:0 inputSource:a3 metalDevice:0];
}

- (ADPCEDisparityColorPipeline)init
{
  return [(ADPCEDisparityColorPipeline *)self initWithParameters:0];
}

@end