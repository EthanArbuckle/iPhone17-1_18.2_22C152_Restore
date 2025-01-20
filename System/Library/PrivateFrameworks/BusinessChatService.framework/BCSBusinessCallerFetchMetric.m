@interface BCSBusinessCallerFetchMetric
+ (id)metricWithPostProcessingMetricHandlers:(id)a3;
- (BCSTimingMeasurement)timingMeasurement;
- (int64_t)errorCode;
- (void)setErrorCode:(int64_t)a3;
- (void)setTimingMeasurement:(id)a3;
@end

@implementation BCSBusinessCallerFetchMetric

+ (id)metricWithPostProcessingMetricHandlers:(id)a3
{
  id v3 = a3;
  v4 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)[BCSBusinessCallerFetchMetric alloc], (void *)8, 0, v3);

  return v4;
}

- (BCSTimingMeasurement)timingMeasurement
{
  return self->timingMeasurement;
}

- (void)setTimingMeasurement:(id)a3
{
}

- (int64_t)errorCode
{
  return self->errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->errorCode = a3;
}

- (void).cxx_destruct
{
}

@end