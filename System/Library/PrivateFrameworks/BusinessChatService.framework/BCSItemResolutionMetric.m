@interface BCSItemResolutionMetric
+ (id)metricForItemIdentifier:(id)a3 postProcessingMetricHandlers:(id)a4;
- (BCSFlagMeasurement)cacheHitMeasurement;
- (BCSItemIdentifying)itemIdentifier;
- (BCSTimingMeasurement)timingMeasurement;
- (NSDictionary)coreAnalyticsPayload;
- (NSString)coreAnalyticsEventName;
- (int64_t)errorCode;
- (void)setCacheHitMeasurement:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setTimingMeasurement:(id)a3;
@end

@implementation BCSItemResolutionMetric

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.businesschatd.itemResolution";
}

- (NSDictionary)coreAnalyticsPayload
{
  v17[4] = *MEMORY[0x263EF8340];
  v16[0] = @"type";
  v3 = NSNumber;
  v4 = [(BCSItemResolutionMetric *)self itemIdentifier];
  v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "type"));
  v17[0] = v5;
  v16[1] = @"cacheHit";
  v6 = NSNumber;
  v7 = [(BCSItemResolutionMetric *)self cacheHitMeasurement];
  v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "flag"));
  v17[1] = v8;
  v16[2] = @"duration";
  v9 = NSNumber;
  v10 = [(BCSItemResolutionMetric *)self timingMeasurement];
  [v10 duration];
  v12 = [v9 numberWithInteger:(uint64_t)(v11 * 1000.0)];
  v17[2] = v12;
  v16[3] = @"errorCode";
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[BCSItemResolutionMetric errorCode](self, "errorCode"));
  v17[3] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];

  return (NSDictionary *)v14;
}

+ (id)metricForItemIdentifier:(id)a3 postProcessingMetricHandlers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)[BCSItemResolutionMetric alloc], (void *)2, v6, v5);

  return v7;
}

- (BCSItemIdentifying)itemIdentifier
{
  if (self) {
    self = (BCSItemResolutionMetric *)self->super._context;
  }
  return (BCSItemIdentifying *)self;
}

- (BCSFlagMeasurement)cacheHitMeasurement
{
  return self->cacheHitMeasurement;
}

- (void)setCacheHitMeasurement:(id)a3
{
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
  objc_storeStrong((id *)&self->timingMeasurement, 0);

  objc_storeStrong((id *)&self->cacheHitMeasurement, 0);
}

@end