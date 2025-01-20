@interface BCSConfigResolutionMetric
+ (id)metricForConfigType:(int64_t)a3 postProcessingMetricHandlers:(id)a4;
- (BCSFlagMeasurement)cacheHitMeasurement;
- (BCSTimingMeasurement)timingMeasurement;
- (NSDictionary)coreAnalyticsPayload;
- (NSString)coreAnalyticsEventName;
- (int64_t)errorCode;
- (int64_t)type;
- (void)setCacheHitMeasurement:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setTimingMeasurement:(id)a3;
@end

@implementation BCSConfigResolutionMetric

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.businesschatd.configResolution";
}

- (NSDictionary)coreAnalyticsPayload
{
  v15[4] = *MEMORY[0x263EF8340];
  v14[0] = @"type";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[BCSConfigResolutionMetric type](self, "type"));
  v15[0] = v3;
  v14[1] = @"cacheHit";
  v4 = NSNumber;
  v5 = [(BCSConfigResolutionMetric *)self cacheHitMeasurement];
  v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "flag"));
  v15[1] = v6;
  v14[2] = @"duration";
  v7 = NSNumber;
  v8 = [(BCSConfigResolutionMetric *)self timingMeasurement];
  [v8 duration];
  v10 = [v7 numberWithInteger:(uint64_t)(v9 * 1000.0)];
  v15[2] = v10;
  v14[3] = @"errorCode";
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[BCSConfigResolutionMetric errorCode](self, "errorCode"));
  v15[3] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

  return (NSDictionary *)v12;
}

+ (id)metricForConfigType:(int64_t)a3 postProcessingMetricHandlers:(id)a4
{
  id v5 = a4;
  v6 = [BCSConfigResolutionMetric alloc];
  v7 = [NSNumber numberWithInteger:a3];
  v8 = -[BCSMetric _initWithType:context:postProcessingMetricHandlers:]((id *)&v6->super.super.isa, 0, v7, v5);

  return v8;
}

- (int64_t)type
{
  if (self) {
    self = (BCSConfigResolutionMetric *)self->super._context;
  }
  return [(BCSConfigResolutionMetric *)self integerValue];
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