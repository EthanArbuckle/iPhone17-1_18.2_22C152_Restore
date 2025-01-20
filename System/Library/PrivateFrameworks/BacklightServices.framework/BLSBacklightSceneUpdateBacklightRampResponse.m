@interface BLSBacklightSceneUpdateBacklightRampResponse
- (BLSBacklightSceneUpdateBacklightRampResponse)initWithRampDuration:(double)a3;
- (double)rampDuration;
@end

@implementation BLSBacklightSceneUpdateBacklightRampResponse

- (BLSBacklightSceneUpdateBacklightRampResponse)initWithRampDuration:(double)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v6 forSetting:0];

  v9.receiver = self;
  v9.super_class = (Class)BLSBacklightSceneUpdateBacklightRampResponse;
  v7 = [(BLSBacklightSceneUpdateBacklightRampResponse *)&v9 initWithInfo:v5 error:0];

  return v7;
}

- (double)rampDuration
{
  v2 = [(BLSBacklightSceneUpdateBacklightRampResponse *)self info];
  v3 = [v2 objectForSetting:0];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

@end