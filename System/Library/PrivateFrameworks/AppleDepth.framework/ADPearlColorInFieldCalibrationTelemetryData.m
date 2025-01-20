@interface ADPearlColorInFieldCalibrationTelemetryData
- (ADPearlColorInFieldCalibrationTelemetryData)init;
- (ADPearlColorInFieldCalibrationTelemetryData)initWithDictionaryRepresentation:(id)a3;
- (NSMutableArray)firedEventTimestampsArray;
- (id)persistenceData;
- (unint64_t)frontEndTime;
- (unint64_t)lastExecutionTime;
- (unint64_t)lastToleranceDetectedTime;
- (unint64_t)maxBackendRunTime;
- (unint64_t)minBackendRunTime;
- (unint64_t)timeSincePrevRun;
- (unint64_t)totalBackendTime;
- (unint64_t)totalNumRuns;
- (unsigned)largeRotationStatusBits;
- (void)increaseRunTimesByOne;
- (void)initEventTimestampsArray;
- (void)reportBackendRunTime:(unint64_t)a3;
- (void)reportFrontendRunTime:(unint64_t)a3;
- (void)reset;
- (void)setFiredEventTimestampsArray:(id)a3;
- (void)setLastToleranceDetectedTime:(unint64_t)a3;
- (void)updateLastExecutionTime:(unint64_t)a3;
@end

@implementation ADPearlColorInFieldCalibrationTelemetryData

- (void).cxx_destruct
{
}

- (void)setFiredEventTimestampsArray:(id)a3
{
}

- (NSMutableArray)firedEventTimestampsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastToleranceDetectedTime:(unint64_t)a3
{
  self->_lastToleranceDetectedTime = a3;
}

- (unint64_t)lastToleranceDetectedTime
{
  return self->_lastToleranceDetectedTime;
}

- (unsigned)largeRotationStatusBits
{
  return self->_largeRotationStatusBits;
}

- (unint64_t)totalNumRuns
{
  return self->_totalNumRuns;
}

- (unint64_t)frontEndTime
{
  return self->_frontEndTime;
}

- (unint64_t)totalBackendTime
{
  return self->_totalBackendTime;
}

- (unint64_t)timeSincePrevRun
{
  return self->_timeSincePrevRun;
}

- (unint64_t)minBackendRunTime
{
  return self->_minBackendRunTime;
}

- (unint64_t)maxBackendRunTime
{
  return self->_maxBackendRunTime;
}

- (unint64_t)lastExecutionTime
{
  return self->_lastExecutionTime;
}

- (ADPearlColorInFieldCalibrationTelemetryData)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"telemetryVersion"];

  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"telemetryVersion"];
    self->_telemetryVersion = [v6 unsignedIntValue];

    v7 = [v4 objectForKeyedSubscript:@"lastExecutionTime"];
    if (!v7)
    {
LABEL_6:
      v5 = 0;
      goto LABEL_14;
    }
    v8 = [v4 objectForKeyedSubscript:@"totalNumRuns"];
    v5 = v8;
    if (!v8)
    {

      goto LABEL_14;
    }
    if (self->_telemetryVersion < 2)
    {
    }
    else
    {
      v9 = [v4 objectForKeyedSubscript:@"lastToleranceDetectedTime"];

      if (!v9) {
        goto LABEL_6;
      }
    }
    v20.receiver = self;
    v20.super_class = (Class)ADPearlColorInFieldCalibrationTelemetryData;
    v10 = [(ADPearlColorInFieldCalibrationTelemetryData *)&v20 init];
    v11 = v10;
    if (v10)
    {
      [(ADPearlColorInFieldCalibrationTelemetryData *)v10 reset];
      v12 = [v4 objectForKeyedSubscript:@"lastExecutionTime"];
      v11->_lastExecutionTime = [v12 unsignedLongValue];

      v13 = [v4 objectForKeyedSubscript:@"totalNumRuns"];
      v11->_totalNumRuns = [v13 unsignedLongValue];

      v14 = [v4 objectForKeyedSubscript:@"lastToleranceDetectedTime"];
      v11->_lastToleranceDetectedTime = [v14 unsignedLongValue];

      v15 = [v4 objectForKeyedSubscript:@"firedEventTimestampsArray"];
      uint64_t v16 = [v15 mutableCopy];
      firedEventTimestampsArray = v11->_firedEventTimestampsArray;
      v11->_firedEventTimestampsArray = (NSMutableArray *)v16;

      v18 = v11->_firedEventTimestampsArray;
      if (!v18 || [(NSMutableArray *)v18 count] != 15) {
        [(ADPearlColorInFieldCalibrationTelemetryData *)v11 initEventTimestampsArray];
      }
    }
    self = v11;
    v5 = self;
  }
LABEL_14:

  return v5;
}

- (id)persistenceData
{
  v11[5] = *MEMORY[0x263EF8340];
  v10[0] = @"lastExecutionTime";
  v3 = [NSNumber numberWithUnsignedLong:self->_lastExecutionTime];
  v11[0] = v3;
  v10[1] = @"totalNumRuns";
  id v4 = [NSNumber numberWithUnsignedLong:self->_totalNumRuns];
  v11[1] = v4;
  v10[2] = @"telemetryVersion";
  v5 = [NSNumber numberWithUnsignedInt:3];
  v11[2] = v5;
  v10[3] = @"lastToleranceDetectedTime";
  v6 = [NSNumber numberWithUnsignedLong:self->_lastToleranceDetectedTime];
  v10[4] = @"firedEventTimestampsArray";
  firedEventTimestampsArray = self->_firedEventTimestampsArray;
  v11[3] = v6;
  v11[4] = firedEventTimestampsArray;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (void)updateLastExecutionTime:(unint64_t)a3
{
  unint64_t lastExecutionTime = self->_lastExecutionTime;
  if (lastExecutionTime) {
    self->_timeSincePrevRun = a3 - lastExecutionTime;
  }
  self->_unint64_t lastExecutionTime = a3;
}

- (void)increaseRunTimesByOne
{
}

- (void)reportFrontendRunTime:(unint64_t)a3
{
  self->_frontEndTime = (unint64_t)(float)((float)a3 + (float)self->_frontEndTime);
}

- (void)reset
{
  *(_OWORD *)&self->_maxBackendRunTime = xmmword_215FC4650;
  self->_totalBackendTime = 0;
  self->_frontEndTime = 0;
  self->_timeSincePrevRun = 0;
}

- (void)reportBackendRunTime:(unint64_t)a3
{
  unint64_t v3 = (unint64_t)(float)a3;
  if (self->_maxBackendRunTime < a3) {
    self->_maxBackendRunTime = v3;
  }
  if (self->_minBackendRunTime > a3) {
    self->_minBackendRunTime = v3;
  }
  self->_totalBackendTime = (unint64_t)(float)((float)a3 + (float)self->_totalBackendTime);
}

- (ADPearlColorInFieldCalibrationTelemetryData)init
{
  v5.receiver = self;
  v5.super_class = (Class)ADPearlColorInFieldCalibrationTelemetryData;
  v2 = [(ADPearlColorInFieldCalibrationTelemetryData *)&v5 init];
  unint64_t v3 = v2;
  if (v2)
  {
    [(ADPearlColorInFieldCalibrationTelemetryData *)v2 reset];
    v3->_unint64_t lastExecutionTime = 0;
    v3->_totalNumRuns = 0;
    v3->_lastToleranceDetectedTime = 0;
    v3->_telemetryVersion = 3;
    [(ADPearlColorInFieldCalibrationTelemetryData *)v3 initEventTimestampsArray];
  }
  return v3;
}

- (void)initEventTimestampsArray
{
  unint64_t v3 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:15];
  firedEventTimestampsArray = self->_firedEventTimestampsArray;
  self->_firedEventTimestampsArray = v3;

  id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:");
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
  [(NSMutableArray *)self->_firedEventTimestampsArray addObject:v5];
}

@end