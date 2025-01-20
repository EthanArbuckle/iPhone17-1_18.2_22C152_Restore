@interface BCSBusinessLinkFetchMetric
+ (id)metricWithPostProcessingMetricHandlers:(id)a3;
- (BCSTimingMeasurement)timingMeasurement;
- (BOOL)isChoppingEnabled;
- (NSDictionary)coreAnalyticsPayload;
- (NSString)coreAnalyticsEventName;
- (int64_t)errorCode;
- (int64_t)successfulChop;
- (void)setChoppingEnabled:(BOOL)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setSuccessfulChop:(int64_t)a3;
- (void)setTimingMeasurement:(id)a3;
@end

@implementation BCSBusinessLinkFetchMetric

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.businesschatd.linkURLFetch";
}

- (NSDictionary)coreAnalyticsPayload
{
  v13[4] = *MEMORY[0x263EF8340];
  v12[0] = @"choppingEnabled";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BCSBusinessLinkFetchMetric isChoppingEnabled](self, "isChoppingEnabled"));
  v13[0] = v3;
  v12[1] = @"successfulChop";
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[BCSBusinessLinkFetchMetric successfulChop](self, "successfulChop"));
  v13[1] = v4;
  v12[2] = @"duration";
  v5 = NSNumber;
  v6 = [(BCSBusinessLinkFetchMetric *)self timingMeasurement];
  [v6 duration];
  v8 = [v5 numberWithInteger:(uint64_t)(v7 * 1000.0)];
  v13[2] = v8;
  v12[3] = @"errorCode";
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[BCSBusinessLinkFetchMetric errorCode](self, "errorCode"));
  v13[3] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

  return (NSDictionary *)v10;
}

+ (id)metricWithPostProcessingMetricHandlers:(id)a3
{
  id v3 = a3;
  v4 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)[BCSBusinessLinkFetchMetric alloc], (void *)4, 0, v3);

  return v4;
}

- (BOOL)isChoppingEnabled
{
  return self->choppingEnabled;
}

- (void)setChoppingEnabled:(BOOL)a3
{
  self->choppingEnabled = a3;
}

- (int64_t)successfulChop
{
  return self->successfulChop;
}

- (void)setSuccessfulChop:(int64_t)a3
{
  self->successfulChop = a3;
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