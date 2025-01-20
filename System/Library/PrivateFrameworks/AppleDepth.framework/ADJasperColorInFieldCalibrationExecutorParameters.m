@interface ADJasperColorInFieldCalibrationExecutorParameters
- (ADJasperColorInFieldCalibrationExecutorParameters)init;
- (ADJasperColorInFieldCalibrationExecutorParameters)initWithPipelineParameters:(id)a3;
- (ADJasperColorInFieldCalibrationPipelineParameters)pipelineParameters;
- (BOOL)reportTelemetry;
- (id)initForDevice:(id)a3;
- (void)setReportTelemetry:(BOOL)a3;
@end

@implementation ADJasperColorInFieldCalibrationExecutorParameters

- (ADJasperColorInFieldCalibrationPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (ADJasperColorInFieldCalibrationExecutorParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)ADJasperColorInFieldCalibrationExecutorParameters;
  v2 = [(ADExecutorParameters *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ADJasperColorInFieldCalibrationPipelineParameters);
    pipelineParameters = v2->_pipelineParameters;
    v2->_pipelineParameters = v3;
  }
  return v2;
}

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADJasperColorInFieldCalibrationExecutorParameters;
  v5 = [(ADExecutorParameters *)&v9 initForDevice:v4];
  if (v5)
  {
    id v6 = [[ADJasperColorInFieldCalibrationPipelineParameters alloc] initForDevice:v4];
    v7 = (void *)v5[7];
    v5[7] = v6;

    *((unsigned char *)v5 + 48) = 1;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setReportTelemetry:(BOOL)a3
{
  self->_reportTelemetry = a3;
}

- (BOOL)reportTelemetry
{
  return self->_reportTelemetry;
}

- (ADJasperColorInFieldCalibrationExecutorParameters)initWithPipelineParameters:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADJasperColorInFieldCalibrationExecutorParameters;
  id v6 = [(ADExecutorParameters *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pipelineParameters, a3);
  }
  v7->_reportTelemetry = 1;

  return v7;
}

@end