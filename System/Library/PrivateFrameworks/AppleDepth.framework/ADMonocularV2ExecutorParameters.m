@interface ADMonocularV2ExecutorParameters
- (ADMonocularV2ExecutorParameters)init;
- (ADMonocularV2PipelineParameters)pipelineParameters;
- (id)initForPipeline:(id)a3;
@end

@implementation ADMonocularV2ExecutorParameters

- (void).cxx_destruct
{
}

- (ADMonocularV2PipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (id)initForPipeline:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADMonocularV2ExecutorParameters;
  v5 = [(ADExecutorParameters *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 pipelineParameters];
    pipelineParameters = v5->_pipelineParameters;
    v5->_pipelineParameters = (ADMonocularV2PipelineParameters *)v6;
  }
  return v5;
}

- (ADMonocularV2ExecutorParameters)init
{
  v7.receiver = self;
  v7.super_class = (Class)ADMonocularV2ExecutorParameters;
  v2 = [(ADExecutorParameters *)&v7 init];
  if (v2
    && (uint64_t v3 = objc_opt_new(),
        pipelineParameters = v2->_pipelineParameters,
        v2->_pipelineParameters = (ADMonocularV2PipelineParameters *)v3,
        pipelineParameters,
        !v2->_pipelineParameters))
  {
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

@end