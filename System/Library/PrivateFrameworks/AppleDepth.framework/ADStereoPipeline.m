@interface ADStereoPipeline
- (ADStereoPipeline)initWithInputAlignment:(unint64_t)a3 andPrioritization:(int64_t)a4;
- (ADStereoPipeline)initWithInputAlignment:(unint64_t)a3 prioritization:(int64_t)a4 andParameters:(id)a5;
- (ADStereoPipelineParameters)pipelineParameters;
- (BOOL)shouldPreProcessColorInputs;
- (id)inferenceDescriptor;
- (int64_t)adjustForEngine:(unint64_t)a3;
- (int64_t)preProcessColorInput:(__CVBuffer *)a3 toBuffer:(__CVBuffer *)a4;
- (unint64_t)stereoImagesAlignment;
- (void)setPipelineParameters:(id)a3;
@end

@implementation ADStereoPipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

- (BOOL)shouldPreProcessColorInputs
{
  return self->_shouldPreProcessColorInputs;
}

- (unint64_t)stereoImagesAlignment
{
  return self->_stereoImagesAlignment;
}

- (void)setPipelineParameters:(id)a3
{
}

- (ADStereoPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (ADStereoPipeline)initWithInputAlignment:(unint64_t)a3 andPrioritization:(int64_t)a4
{
  return [(ADStereoPipeline *)self initWithInputAlignment:a3 prioritization:a4 andParameters:0];
}

- (ADStereoPipeline)initWithInputAlignment:(unint64_t)a3 prioritization:(int64_t)a4 andParameters:(id)a5
{
  id v8 = a5;
  int v23 = 335687464;
  int64_t v24 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  kdebug_trace();
  v22.receiver = self;
  v22.super_class = (Class)ADStereoPipeline;
  v9 = [(ADStereoPipeline *)&v22 init];
  if (!v9) {
    goto LABEL_27;
  }
  if (!v8) {
    id v8 = (id)objc_opt_new();
  }
  p_pipelineParameters = (id *)&v9->_pipelineParameters;
  objc_storeStrong((id *)&v9->_pipelineParameters, v8);
  v9->_unint64_t stereoImagesAlignment = a3;
  v9->_prioritization = a4;
  if ([MEMORY[0x263F28048] hasANE])
  {
    ADCommonUtils::runtimePlatformANEVersionString(buf);
    if (v30 < 0)
    {
      v13 = *(void **)buf;
      if (v29) {
        int v11 = atoi((const char *)(*(void *)buf + 1));
      }
      else {
        int v11 = -1;
      }
      operator delete(v13);
    }
    else if (v30)
    {
      int v11 = atoi((const char *)&buf[1]);
    }
    else
    {
      int v11 = -1;
    }
    BOOL v12 = v11 > 13;
  }
  else
  {
    BOOL v12 = 0;
  }
  v14 = &unk_26C698568;
  if ([*p_pipelineParameters networkVariantOverride] != 1)
  {
    if ([*p_pipelineParameters networkVariantOverride] == 255)
    {
      if (!v12)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ADStereoPipeline requested V3 networks, but runtime does not support them", buf, 2u);
          v20 = 0;
          goto LABEL_30;
        }
        goto LABEL_29;
      }
      v14 = &unk_26C698580;
    }
    else
    {
      v15 = &unk_26C698580;
      if (!v12) {
        v15 = &unk_26C698568;
      }
      if (a4 == 1) {
        v14 = &unk_26C698598;
      }
      else {
        v14 = v15;
      }
    }
  }
  unint64_t stereoImagesAlignment = v9->_stereoImagesAlignment;
  if (stereoImagesAlignment > [v14 count]) {
    goto LABEL_29;
  }
  v17 = [v14 objectAtIndexedSubscript:v9->_stereoImagesAlignment];
  uint64_t v18 = +[ADNetworkProvider providerForNetwork:v17];
  networkProvider = v9->_networkProvider;
  v9->_networkProvider = (ADNetworkProvider *)v18;

  if (!v9->_networkProvider || [(ADStereoPipeline *)v9 adjustForEngine:3])
  {
LABEL_29:
    v20 = 0;
    goto LABEL_30;
  }
LABEL_27:
  v20 = v9;
LABEL_30:
  kdebug_trace();

  return v20;
}

- (int64_t)preProcessColorInput:(__CVBuffer *)a3 toBuffer:(__CVBuffer *)a4
{
  kdebug_trace();
  if (self->_shouldPreProcessColorInputs)
  {
    +[ADUtils convertRGBAFloat:a3 toPlanar:a4];
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = -22951;
  }
  kdebug_trace();
  return v7;
}

- (int64_t)adjustForEngine:(unint64_t)a3
{
  self->_shouldPreProcessColorInputs = 0;
  int64_t prioritization = self->_prioritization;
  if (prioritization == 4 || prioritization == 1)
  {
    v6 = [ADEspressoStereoInferenceDescriptor alloc];
    networkProvider = self->_networkProvider;
    uint64_t v8 = 1919365990;
LABEL_10:
    uint64_t v9 = 1717856627;
    goto LABEL_11;
  }
  if (a3 - 3 > 1)
  {
    self->_shouldPreProcessColorInputs = 1;
    v6 = [ADEspressoStereoInferenceDescriptor alloc];
    networkProvider = self->_networkProvider;
    uint64_t v8 = 1380410945;
    goto LABEL_10;
  }
  v6 = [ADEspressoStereoInferenceDescriptor alloc];
  networkProvider = self->_networkProvider;
  uint64_t v8 = 1380411457;
  uint64_t v9 = 1751411059;
LABEL_11:
  v10 = [(ADEspressoStereoInferenceDescriptor *)v6 initWithNetworkProvider:networkProvider inputColorFormat:v8 outputDisparityFormat:v9];
  inferenceDesc = self->_inferenceDesc;
  self->_inferenceDesc = v10;

  return 0;
}

@end