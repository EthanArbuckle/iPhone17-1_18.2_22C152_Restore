@interface BCSChatSuggestFetchMetric
+ (id)metricWithPostProcessingMetricHandlers:(id)a3;
- (BCSTimingMeasurement)timingMeasurement;
- (NSDictionary)coreAnalyticsPayload;
- (NSString)coreAnalyticsEventName;
- (int64_t)errorCode;
- (void)setErrorCode:(int64_t)a3;
- (void)setTimingMeasurement:(id)a3;
@end

@implementation BCSChatSuggestFetchMetric

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.businesschatd.chatSuggestFetch";
}

- (NSDictionary)coreAnalyticsPayload
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"duration";
  v3 = NSNumber;
  v4 = [(BCSChatSuggestFetchMetric *)self timingMeasurement];
  [v4 duration];
  v6 = [v3 numberWithInteger:(uint64_t)(v5 * 1000.0)];
  v10[1] = @"errorCode";
  v11[0] = v6;
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[BCSChatSuggestFetchMetric errorCode](self, "errorCode"));
  v11[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return (NSDictionary *)v8;
}

+ (id)metricWithPostProcessingMetricHandlers:(id)a3
{
  id v3 = a3;
  v4 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)[BCSChatSuggestFetchMetric alloc], (void *)7, 0, v3);

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