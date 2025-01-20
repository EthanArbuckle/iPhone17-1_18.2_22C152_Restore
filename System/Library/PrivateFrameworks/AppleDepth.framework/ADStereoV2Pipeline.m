@interface ADStereoV2Pipeline
- (ADStereoV2Pipeline)init;
- (ADStereoV2Pipeline)initWithParameters:(id)a3;
- (ADStereoV2PipelineParameters)pipelineParameters;
- (BOOL)shouldPreProcessColorInputs;
- (id)inferenceDescriptor;
- (int64_t)adjustForEngine:(unint64_t)a3;
- (int64_t)preProcessColorInput:(__CVBuffer *)a3 toBuffer:(__CVBuffer *)a4;
- (void)setPipelineParameters:(id)a3;
@end

@implementation ADStereoV2Pipeline

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

- (void)setPipelineParameters:(id)a3
{
}

- (ADStereoV2PipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (ADStereoV2Pipeline)init
{
  return [(ADStereoV2Pipeline *)self initWithParameters:0];
}

- (ADStereoV2Pipeline)initWithParameters:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v30 = 335687204;
  long long v31 = 0u;
  long long v32 = 0u;
  kdebug_trace();
  v29.receiver = self;
  v29.super_class = (Class)ADStereoV2Pipeline;
  v5 = [(ADStereoV2Pipeline *)&v29 init];
  if (!v5) {
    goto LABEL_20;
  }
  if (!v4) {
    id v4 = (id)objc_opt_new();
  }
  p_pipelineParameters = (id *)&v5->_pipelineParameters;
  objc_storeStrong((id *)&v5->_pipelineParameters, v4);
  v7 = [(ADPipelineParameters *)v5->_pipelineParameters deviceName];
  v8 = [v7 uppercaseString];
  if ([v8 hasPrefix:@"D83"])
  {
    v9 = @"RTFSD_0deg";
LABEL_16:

    goto LABEL_17;
  }
  v10 = [*p_pipelineParameters deviceName];
  v11 = [v10 uppercaseString];
  if ([v11 hasPrefix:@"D84"])
  {
    v9 = @"RTFSD_0deg";
LABEL_15:

    goto LABEL_16;
  }
  v28 = [*p_pipelineParameters deviceName];
  v27 = [v28 uppercaseString];
  if ([v27 hasPrefix:@"D93"]) {
    goto LABEL_13;
  }
  v25 = [*p_pipelineParameters deviceName];
  v12 = [v25 uppercaseString];
  if ([v12 hasPrefix:@"D94"])
  {
LABEL_12:

LABEL_13:
    v9 = @"RTFSD_0deg";
LABEL_14:

    goto LABEL_15;
  }
  v24 = [*p_pipelineParameters deviceName];
  v23 = [v24 uppercaseString];
  if ([v23 hasPrefix:@"D47"])
  {

    goto LABEL_12;
  }
  v22 = [*p_pipelineParameters deviceName];
  v17 = [v22 uppercaseString];
  char v21 = [v17 hasPrefix:@"D48"];

  if (v21)
  {
    v9 = @"RTFSD_0deg";
    goto LABEL_17;
  }
  v7 = [*p_pipelineParameters deviceName];
  v8 = [v7 uppercaseString];
  if ([v8 hasPrefix:@"D27"])
  {
    v9 = @"RTFSD_45deg";
    goto LABEL_16;
  }
  v10 = [*p_pipelineParameters deviceName];
  v11 = [v10 uppercaseString];
  if ([v11 hasPrefix:@"D28"])
  {
    v9 = @"RTFSD_45deg";
    goto LABEL_15;
  }
  v28 = [*p_pipelineParameters deviceName];
  v27 = [v28 uppercaseString];
  if ([v27 hasPrefix:@"D37"])
  {
    v9 = @"RTFSD_45deg";
    goto LABEL_14;
  }
  v18 = [*p_pipelineParameters deviceName];
  v19 = [v18 uppercaseString];
  char v26 = [v19 hasPrefix:@"D38"];

  if (v26)
  {
    v9 = @"RTFSD_45deg";
LABEL_17:
    uint64_t v13 = +[ADNetworkProvider providerForNetwork:v9];
    networkProvider = v5->_networkProvider;
    v5->_networkProvider = (ADNetworkProvider *)v13;

    if (!v5->_networkProvider)
    {
      v15 = 0;
      goto LABEL_22;
    }
    if ([(ADStereoV2Pipeline *)v5 adjustForEngine:3]) {
      goto LABEL_19;
    }
LABEL_20:
    v15 = v5;
    goto LABEL_22;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v20 = [*p_pipelineParameters deviceName];
    *(_DWORD *)buf = 138543362;
    v34 = v20;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unsupported device \"%{public}@\"", buf, 0xCu);
  }
LABEL_19:
  v15 = 0;
LABEL_22:
  kdebug_trace();

  return v15;
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
  if (a3 - 3 > 1)
  {
    self->_shouldPreProcessColorInputs = 1;
    id v4 = [ADEspressoStereoV2InferenceDescriptor alloc];
    networkProvider = self->_networkProvider;
    uint64_t v6 = 1380410945;
    uint64_t v7 = 1717856627;
  }
  else
  {
    self->_shouldPreProcessColorInputs = 0;
    id v4 = [ADEspressoStereoV2InferenceDescriptor alloc];
    networkProvider = self->_networkProvider;
    uint64_t v6 = 1380411457;
    uint64_t v7 = 1751411059;
  }
  v8 = [(ADEspressoStereoV2InferenceDescriptor *)v4 initWithNetworkProvider:networkProvider inputColorFormat:v6 outputDisparityFormat:v7];
  inferenceDesc = self->_inferenceDesc;
  self->_inferenceDesc = v8;

  return 0;
}

@end