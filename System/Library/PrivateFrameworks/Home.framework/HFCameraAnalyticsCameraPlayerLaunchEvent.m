@interface HFCameraAnalyticsCameraPlayerLaunchEvent
- (void)launchedRecordingWithError:(id)a3;
- (void)launchedStreamWithError:(id)a3;
@end

@implementation HFCameraAnalyticsCameraPlayerLaunchEvent

- (void)launchedStreamWithError:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  v6 = [v4 date];
  v7 = [(HFCameraAnalyticsEvent *)self startDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  v10 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v9 * 1000.0)];
  v11 = [MEMORY[0x263F08AB0] processInfo];
  v12 = [v11 processName];

  v13 = +[HFCameraAnalyticsEvent errorCodeForError:v5];

  v15[0] = HFCameraAnalyticsErrorCode;
  v15[1] = HFCameraAnalyticsProcessName;
  v16[0] = v13;
  v16[1] = v12;
  v15[2] = HFCameraAnalyticsLatency;
  v16[2] = v10;
  v14 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  +[HFCameraAnalyticsEventHandler sendEventNamed:@"com.apple.Home.CameraStreamLaunch" payload:v14];
}

- (void)launchedRecordingWithError:(id)a3
{
  v29[6] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  v6 = [v4 date];
  v7 = [(HFCameraAnalyticsEvent *)self startDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  v27 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v9 * 1000.0)];
  v10 = NSNumber;
  v11 = [(HFCameraAnalyticsEvent *)self cameraClip];
  v12 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "isComplete"));

  v13 = [MEMORY[0x263F08AB0] processInfo];
  v14 = [v13 processName];

  v15 = +[HFCameraAnalyticsEvent errorCodeForError:v5];

  v16 = NSNumber;
  v17 = [(HFCameraAnalyticsEvent *)self cameraClip];
  [v17 duration];
  v19 = [v16 numberWithUnsignedInteger:(unint64_t)v18];

  v20 = NSNumber;
  v21 = (void *)MEMORY[0x263EFF910];
  v22 = [(HFCameraAnalyticsEvent *)self cameraClip];
  v23 = [v22 dateOfOccurrence];
  v24 = [MEMORY[0x263EFF910] date];
  v25 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "hf_daysBetweenDates:endDate:", v23, v24));

  v28[0] = HFCameraAnalyticsErrorCode;
  v28[1] = HFCameraAnalyticsIsComplete;
  v29[0] = v15;
  v29[1] = v12;
  v28[2] = HFCameraAnalyticsProcessName;
  v28[3] = HFCameraAnalyticsLatency;
  v29[2] = v14;
  v29[3] = v27;
  v28[4] = HFCameraAnalyticsDuration;
  v28[5] = HFCameraAnalyticsAge;
  v29[4] = v19;
  v29[5] = v25;
  v26 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
  +[HFCameraAnalyticsEventHandler sendEventNamed:@"com.apple.Home.CameraClipLaunch" payload:v26];
}

@end