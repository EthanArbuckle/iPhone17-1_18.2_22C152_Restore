@interface ADJasperColorInFieldCalibrationTelemetryData
- (ADJasperColorInFieldCalibrationTelemetryData)init;
- (ADJasperColorInFieldCalibrationTelemetryData)initWithDictionaryRepresentation:(id)a3;
- (NSMutableArray)firedEventTimestampsArray;
- (float)getAverageNumValidPoints;
- (id)persistenceData;
- (unint64_t)frontEndTime;
- (unint64_t)lastExecutionTime;
- (unint64_t)lastToleranceDetectedTime;
- (unint64_t)maxBackEndRunTime;
- (unint64_t)minBackEndRunTime;
- (unint64_t)timeSincePrevRun;
- (unint64_t)totalBackEndTime;
- (unint64_t)totalNumRuns;
- (unint64_t)validPointsSum;
- (unint64_t)validPointsSumEventsCount;
- (void)increaseRunTimesByOne;
- (void)initEventTimestampsArray;
- (void)reportBackendRunTime:(unint64_t)a3;
- (void)reportFrontendRunTime:(unint64_t)a3;
- (void)reset;
- (void)setFiredEventTimestampsArray:(id)a3;
- (void)setLastToleranceDetectedTime:(unint64_t)a3;
- (void)updateLastExecutionTime:(unint64_t)a3;
- (void)updateValidPointsSum:(unint64_t)a3;
@end

@implementation ADJasperColorInFieldCalibrationTelemetryData

- (ADJasperColorInFieldCalibrationTelemetryData)initWithDictionaryRepresentation:(id)a3
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
    v20.super_class = (Class)ADJasperColorInFieldCalibrationTelemetryData;
    v10 = [(ADJasperColorInFieldCalibrationTelemetryData *)&v20 init];
    v11 = v10;
    if (v10)
    {
      [(ADJasperColorInFieldCalibrationTelemetryData *)v10 reset];
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
        [(ADJasperColorInFieldCalibrationTelemetryData *)v11 initEventTimestampsArray];
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

- (void)reset
{
  *(_OWORD *)&self->_maxBackEndRunTime = xmmword_215FC4650;
  self->_validPointsSum = 0;
  self->_validPointsSumEventsCount = 0;
  self->_totalBackEndTime = 0;
  self->_frontEndTime = 0;
  self->_timeSincePrevRun = 0;
}

- (void).cxx_destruct
{
}

- (void)setFiredEventTimestampsArray:(id)a3
{
}

- (NSMutableArray)firedEventTimestampsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastToleranceDetectedTime:(unint64_t)a3
{
  self->_lastToleranceDetectedTime = a3;
}

- (unint64_t)lastToleranceDetectedTime
{
  return self->_lastToleranceDetectedTime;
}

- (unint64_t)totalNumRuns
{
  return self->_totalNumRuns;
}

- (unint64_t)frontEndTime
{
  return self->_frontEndTime;
}

- (unint64_t)totalBackEndTime
{
  return self->_totalBackEndTime;
}

- (unint64_t)timeSincePrevRun
{
  return self->_timeSincePrevRun;
}

- (unint64_t)minBackEndRunTime
{
  return self->_minBackEndRunTime;
}

- (unint64_t)maxBackEndRunTime
{
  return self->_maxBackEndRunTime;
}

- (unint64_t)validPointsSumEventsCount
{
  return self->_validPointsSumEventsCount;
}

- (unint64_t)validPointsSum
{
  return self->_validPointsSum;
}

- (unint64_t)lastExecutionTime
{
  return self->_lastExecutionTime;
}

- (float)getAverageNumValidPoints
{
  unint64_t validPointsSumEventsCount = self->_validPointsSumEventsCount;
  if (validPointsSumEventsCount) {
    return (float)self->_validPointsSum / (float)validPointsSumEventsCount;
  }
  else {
    return 0.0;
  }
}

- (void)updateValidPointsSum:(unint64_t)a3
{
  int64x2_t v3 = vdupq_n_s64(1uLL);
  v3.i64[0] = a3;
  *(int64x2_t *)&self->_validPointsSum = vaddq_s64(*(int64x2_t *)&self->_validPointsSum, v3);
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

- (void)reportBackendRunTime:(unint64_t)a3
{
  unint64_t v3 = (unint64_t)(float)a3;
  if (self->_maxBackEndRunTime < a3) {
    self->_maxBackEndRunTime = v3;
  }
  if (self->_minBackEndRunTime > a3) {
    self->_minBackEndRunTime = v3;
  }
  self->_totalBackEndTime = (unint64_t)(float)((float)a3 + (float)self->_totalBackEndTime);
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

- (ADJasperColorInFieldCalibrationTelemetryData)init
{
  v5.receiver = self;
  v5.super_class = (Class)ADJasperColorInFieldCalibrationTelemetryData;
  v2 = [(ADJasperColorInFieldCalibrationTelemetryData *)&v5 init];
  unint64_t v3 = v2;
  if (v2)
  {
    [(ADJasperColorInFieldCalibrationTelemetryData *)v2 reset];
    v3->_unint64_t lastExecutionTime = 0;
    v3->_totalNumRuns = 0;
    v3->_lastToleranceDetectedTime = 0;
    v3->_telemetryVersion = 3;
    [(ADJasperColorInFieldCalibrationTelemetryData *)v3 initEventTimestampsArray];
  }
  return v3;
}

@end