@interface ADExecutorParameters
- (ADExecutorParameters)init;
- (ADLogManager)logger;
- (ADTimeProfiler)timeProfiler;
- (BOOL)powerMeasureMode;
- (NSString)intermediatesOutputPath;
- (id)initForDevice:(id)a3;
- (int64_t)stepsToSkip;
- (void)setIntermediatesOutputPath:(id)a3;
- (void)setLogger:(id)a3;
- (void)setPowerMeasureMode:(BOOL)a3;
- (void)setStepsToSkip:(int64_t)a3;
- (void)setTimeProfiler:(id)a3;
@end

@implementation ADExecutorParameters

- (ADExecutorParameters)init
{
  v3 = +[ADDeviceConfiguration getDeviceName];
  v4 = [(ADExecutorParameters *)self initForDevice:v3];

  return v4;
}

- (id)initForDevice:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ADExecutorParameters;
  v3 = [(ADExecutorParameters *)&v14 init];
  v4 = v3;
  if (v3)
  {
    v3->_stepsToSkip = 0;
    v3->_powerMeasureMode = 0;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    v7 = [v6 lowercaseString];

    if ([v7 hasPrefix:@"ad"])
    {
      uint64_t v8 = [v7 substringFromIndex:2];

      v9 = (void *)v8;
    }
    else
    {
      v9 = v7;
    }
    v10 = [v9 stringByReplacingOccurrencesOfString:@"parameters" withString:&stru_26C6879A8];

    uint64_t v11 = +[ADLogManager defaultLoggerWithName:v10];
    logger = v4->_logger;
    v4->_logger = (ADLogManager *)v11;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeProfiler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_intermediatesOutputPath, 0);
}

- (void)setTimeProfiler:(id)a3
{
}

- (ADTimeProfiler)timeProfiler
{
  return self->_timeProfiler;
}

- (void)setStepsToSkip:(int64_t)a3
{
  self->_stepsToSkip = a3;
}

- (int64_t)stepsToSkip
{
  return self->_stepsToSkip;
}

- (void)setPowerMeasureMode:(BOOL)a3
{
  self->_powerMeasureMode = a3;
}

- (BOOL)powerMeasureMode
{
  return self->_powerMeasureMode;
}

- (void)setLogger:(id)a3
{
}

- (ADLogManager)logger
{
  return self->_logger;
}

- (void)setIntermediatesOutputPath:(id)a3
{
}

- (NSString)intermediatesOutputPath
{
  return self->_intermediatesOutputPath;
}

@end