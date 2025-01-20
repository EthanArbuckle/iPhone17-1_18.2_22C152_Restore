@interface ADJasperColorV2ExecutorParameters
- (ADJasperColorV2PipelineParameters)pipelineParameters;
- (BOOL)outputHighConfidencePixelsOnly;
- (id)initForDevice:(id)a3;
- (void)setOutputHighConfidencePixelsOnly:(BOOL)a3;
@end

@implementation ADJasperColorV2ExecutorParameters

- (void).cxx_destruct
{
}

- (ADJasperColorV2PipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (BOOL)outputHighConfidencePixelsOnly
{
  return [(ADJasperColorV2PipelineParameters *)self->_pipelineParameters outputHighConfidencePixelsOnly];
}

- (void)setOutputHighConfidencePixelsOnly:(BOOL)a3
{
}

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADJasperColorV2ExecutorParameters;
  v5 = [(ADExecutorParameters *)&v9 initForDevice:v4];
  if (v5)
  {
    id v6 = [[ADJasperColorV2PipelineParameters alloc] initForDevice:v4];
    v7 = (void *)v5[6];
    v5[6] = v6;
  }
  return v5;
}

@end