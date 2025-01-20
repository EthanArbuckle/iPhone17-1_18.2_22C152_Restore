@interface ADJasperColorInfieldCalibrationFlow
- (ADJasperColorInFieldCalibrationExecutor)executor;
- (ADJasperColorInFieldCalibrationResult)lastExecutionResult;
- (ADJasperColorInfieldCalibrationFlow)initWithExecutor:(id)a3 andIntersessionData:(id)a4;
- (void)handleMatch:(id)a3;
- (void)pushColor:(double)a3 pose:(double)a4 calibration:(double)a5 metadata:(double)a6 timestamp:(uint64_t)a7;
- (void)pushPointCloud:(double)a3 pose:(double)a4 calibration:(double)a5 timestamp:(double)a6;
@end

@implementation ADJasperColorInfieldCalibrationFlow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastExecutionResult, 0);
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_intersessionData, 0);
  objc_storeStrong((id *)&self->_streamSync, 0);
}

- (ADJasperColorInFieldCalibrationResult)lastExecutionResult
{
  return self->_lastExecutionResult;
}

- (ADJasperColorInFieldCalibrationExecutor)executor
{
  return self->_executor;
}

- (void)pushColor:(double)a3 pose:(double)a4 calibration:(double)a5 metadata:(double)a6 timestamp:(uint64_t)a7
{
  objc_msgSend(a1[2], "pushData:streamIndex:timestamp:pose:calibration:meta:", a8, 0, a9, a10, a6, a2, a3, a4, a5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11) {
    [a1 handleMatch:v11];
  }
}

- (void)handleMatch:(id)a3
{
  id v5 = a3;
  [(ADJasperColorInFieldCalibrationResult *)self->_lastExecutionResult setExecuted:0];
  v4 = [v5 matchedObjectsForStream:0];
  [v4 firstObject];
  objc_claimAutoreleasedReturnValue();

  [v5 matchedObjectsForStream:1];
  [(id)objc_claimAutoreleasedReturnValue() count];
  operator new[]();
}

- (void)pushPointCloud:(double)a3 pose:(double)a4 calibration:(double)a5 timestamp:(double)a6
{
  objc_msgSend(a1[2], "pushData:streamIndex:timestamp:pose:calibration:", a8, 1, a9, a6, a2, a3, a4, a5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10) {
    [a1 handleMatch:v10];
  }
}

- (ADJasperColorInfieldCalibrationFlow)initWithExecutor:(id)a3 andIntersessionData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ADJasperColorInfieldCalibrationFlow;
  v9 = [(ADJasperColorInfieldCalibrationFlow *)&v20 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intersessionData, a4);
    objc_storeStrong((id *)&v10->_executor, a3);
    uint64_t v11 = objc_opt_new();
    lastExecutionResult = v10->_lastExecutionResult;
    v10->_lastExecutionResult = (ADJasperColorInFieldCalibrationResult *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F26CF8]) initWithStreamCount:2 allowedMatchTimeInterval:0.0170000009];
    streamSync = v10->_streamSync;
    v10->_streamSync = (ADStreamSync *)v13;

    [(ADStreamSync *)v10->_streamSync setStream:0 queueSize:10];
    v15 = v10->_streamSync;
    v16 = [(ADJasperColorInFieldCalibrationExecutor *)v10->_executor pipeline];
    v17 = [v16 pipelineParameters];
    v18 = [v17 pcAggregationParameters];
    -[ADStreamSync setStream:queueSize:aggregationCount:allowedAggregationInterval:](v15, "setStream:queueSize:aggregationCount:allowedAggregationInterval:", 1, 10, [v18 aggregationSize], 0.0549999997);
  }
  return v10;
}

@end