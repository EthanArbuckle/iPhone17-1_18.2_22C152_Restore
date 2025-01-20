@interface ADMonocularPipeline
- (ADMonocularPipeline)initWithInputPrioritization:(int64_t)a3;
- (ADMonocularPipeline)initWithInputPrioritization:(int64_t)a3 andParameters:(id)a4;
- (ADMonocularPipelineParameters)pipelineParameters;
- (id)inferenceDescriptor;
- (id)processedDepthOutputDescriptor;
- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4;
- (void)setPipelineParameters:(id)a3;
@end

@implementation ADMonocularPipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_processedDepthDesc, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

- (void)setPipelineParameters:(id)a3
{
}

- (ADMonocularPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4
{
  kdebug_trace();
  int64_t v6 = +[ADUtils postProcessDepth:a3 depthOutput:a4];
  kdebug_trace();
  return v6;
}

- (id)processedDepthOutputDescriptor
{
  return self->_processedDepthDesc;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (ADMonocularPipeline)initWithInputPrioritization:(int64_t)a3 andParameters:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a4;
  int v22 = 335687604;
  int64_t v23 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  kdebug_trace();
  v21.receiver = self;
  v21.super_class = (Class)ADMonocularPipeline;
  v8 = [(ADMonocularPipeline *)&v21 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  v8->_prioritization = a3;
  if ((unint64_t)(a3 - 1) >= 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v20 = +[ADUtils prioritizationAsString:a3];
      *(_DWORD *)buf = 138412290;
      v28 = v20;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "no monocular models for prioritization %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  uint64_t v10 = +[ADNetworkProvider providerForNetwork:*((void *)&off_26425B8D8 + a3 - 1)];
  networkProvider = v9->_networkProvider;
  v9->_networkProvider = (ADNetworkProvider *)v10;

  if (!v9->_networkProvider)
  {
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v9->_pipelineParameters, a4);
  v12 = [[ADEspressoMonocularInferenceDescriptor alloc] initWithNetworkProvider:v9->_networkProvider];
  inferenceDesc = v9->_inferenceDesc;
  v9->_inferenceDesc = v12;

  v14 = [(ADEspressoMonocularInferenceDescriptor *)v9->_inferenceDesc depthOutput];
  v15 = [v14 imageDescriptor];
  uint64_t v16 = [v15 cloneWithDifferentFormat:1717855600];
  processedDepthDesc = v9->_processedDepthDesc;
  v9->_processedDepthDesc = (ADImageDescriptor *)v16;

LABEL_5:
  v18 = v9;
LABEL_9:
  kdebug_trace();

  return v18;
}

- (ADMonocularPipeline)initWithInputPrioritization:(int64_t)a3
{
  v5 = objc_opt_new();
  int64_t v6 = [(ADMonocularPipeline *)self initWithInputPrioritization:a3 andParameters:v5];

  return v6;
}

@end