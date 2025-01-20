@interface HFCameraAnalyticsCameraTimelapseLoadEvent
- (id)sendEventForState:(unint64_t)a3;
@end

@implementation HFCameraAnalyticsCameraTimelapseLoadEvent

- (id)sendEventForState:(unint64_t)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF910] date];
  v6 = [(HFCameraAnalyticsEvent *)self startDate];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  v9 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v8 * 1000.0)];
  v10 = [MEMORY[0x263F08AB0] processInfo];
  v11 = [v10 processName];

  v12 = [NSNumber numberWithInteger:a3];
  v15[0] = HFCameraAnalyticsLoadState;
  v15[1] = HFCameraAnalyticsProcessName;
  v16[0] = v12;
  v16[1] = v11;
  v15[2] = HFCameraAnalyticsLatency;
  v16[2] = v9;
  v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  +[HFCameraAnalyticsEventHandler sendEventNamed:@"com.apple.Home.CameraClipTimelapseLoad" payload:v13];

  return v13;
}

@end