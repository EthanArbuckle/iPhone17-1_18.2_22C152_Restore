@interface BCSMegashardFetchMetric
+ (id)metricForMegashardType:(int64_t)a3 postProcessingMetricHandlers:(id)a4;
- (NSDictionary)coreAnalyticsPayload;
- (NSString)coreAnalyticsEventName;
- (int64_t)errorCode;
- (int64_t)hoursSinceLastSuccessfulFetch;
- (int64_t)type;
- (unint64_t)reason;
- (void)setErrorCode:(int64_t)a3;
- (void)setHoursSinceLastSuccessfulFetch:(int64_t)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation BCSMegashardFetchMetric

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.businesschatd.megashardPrefetch";
}

- (NSDictionary)coreAnalyticsPayload
{
  v11[5] = *MEMORY[0x263EF8340];
  v10[0] = @"type";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[BCSMegashardFetchMetric type](self, "type"));
  v11[0] = v3;
  v10[1] = @"reason";
  v4 = NSStringFromBCSFetchReason([(BCSMegashardFetchMetric *)self reason]);
  v11[1] = v4;
  v10[2] = @"errorCode";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[BCSMegashardFetchMetric errorCode](self, "errorCode"));
  v11[2] = v5;
  v10[3] = @"isUsingCellular";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((id)objc_opt_class(), "isUsingExpensiveNetwork"));
  v11[3] = v6;
  v10[4] = @"timeSinceLastSuccess";
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[BCSMegashardFetchMetric hoursSinceLastSuccessfulFetch](self, "hoursSinceLastSuccessfulFetch"));
  v11[4] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return (NSDictionary *)v8;
}

+ (id)metricForMegashardType:(int64_t)a3 postProcessingMetricHandlers:(id)a4
{
  id v5 = a4;
  v6 = [BCSMegashardFetchMetric alloc];
  v7 = [NSNumber numberWithInteger:a3];
  v8 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)&v6->super.super.isa, (void *)9, v7, v5);

  return v8;
}

- (int64_t)type
{
  if (self) {
    self = (BCSMegashardFetchMetric *)self->super._context;
  }
  return [(BCSMegashardFetchMetric *)self integerValue];
}

- (unint64_t)reason
{
  return self->reason;
}

- (void)setReason:(unint64_t)a3
{
  self->reason = a3;
}

- (int64_t)hoursSinceLastSuccessfulFetch
{
  return self->hoursSinceLastSuccessfulFetch;
}

- (void)setHoursSinceLastSuccessfulFetch:(int64_t)a3
{
  self->hoursSinceLastSuccessfulFetch = a3;
}

- (int64_t)errorCode
{
  return self->errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->errorCode = a3;
}

@end