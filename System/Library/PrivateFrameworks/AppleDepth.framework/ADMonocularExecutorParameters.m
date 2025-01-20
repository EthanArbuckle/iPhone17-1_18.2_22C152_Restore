@interface ADMonocularExecutorParameters
- (ADMonocularPipelineParameters)pipelineParameters;
- (id)initForPipeline:(id)a3;
@end

@implementation ADMonocularExecutorParameters

- (void).cxx_destruct
{
}

- (ADMonocularPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (id)initForPipeline:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADMonocularExecutorParameters;
  v5 = [(ADExecutorParameters *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 pipelineParameters];
    pipelineParameters = v5->_pipelineParameters;
    v5->_pipelineParameters = (ADMonocularPipelineParameters *)v6;
  }
  return v5;
}

@end