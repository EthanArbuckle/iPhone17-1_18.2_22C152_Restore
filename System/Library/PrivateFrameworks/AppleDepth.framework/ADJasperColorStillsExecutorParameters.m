@interface ADJasperColorStillsExecutorParameters
- (ADJasperColorStillsPipelineParameters)pipelineParameters;
- (BOOL)performJasperToColorTransformCorrection;
- (id)initForDevice:(id)a3;
- (void)setPerformJasperToColorTransformCorrection:(BOOL)a3;
@end

@implementation ADJasperColorStillsExecutorParameters

- (void).cxx_destruct
{
}

- (void)setPerformJasperToColorTransformCorrection:(BOOL)a3
{
  self->_performJasperToColorTransformCorrection = a3;
}

- (BOOL)performJasperToColorTransformCorrection
{
  return self->_performJasperToColorTransformCorrection;
}

- (ADJasperColorStillsPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADJasperColorStillsExecutorParameters;
  v5 = [(ADExecutorParameters *)&v9 initForDevice:v4];
  if (v5)
  {
    id v6 = [[ADJasperColorStillsPipelineParameters alloc] initForDevice:v4];
    v7 = (void *)v5[7];
    v5[7] = v6;

    *((unsigned char *)v5 + 48) = 1;
  }

  return v5;
}

@end