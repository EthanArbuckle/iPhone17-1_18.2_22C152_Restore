@interface ADStereoExecutorParameters
- (ADStereoExecutorParameters)init;
- (ADStereoPipelineParameters)pipelineParameters;
- (id)initForPipeline:(id)a3;
@end

@implementation ADStereoExecutorParameters

- (void).cxx_destruct
{
}

- (ADStereoPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (id)initForPipeline:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADStereoExecutorParameters;
  v5 = [(ADExecutorParameters *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 pipelineParameters];
    pipelineParameters = v5->_pipelineParameters;
    v5->_pipelineParameters = (ADStereoPipelineParameters *)v6;
  }
  return v5;
}

- (ADStereoExecutorParameters)init
{
  v7.receiver = self;
  v7.super_class = (Class)ADStereoExecutorParameters;
  v2 = [(ADExecutorParameters *)&v7 init];
  if (v2
    && (uint64_t v3 = objc_opt_new(),
        pipelineParameters = v2->_pipelineParameters,
        v2->_pipelineParameters = (ADStereoPipelineParameters *)v3,
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