@interface HFCameraAnalyticsCameraClipPlaybackSessionEvent
- (id)sendEventForState:(unint64_t)a3;
@end

@implementation HFCameraAnalyticsCameraClipPlaybackSessionEvent

- (id)sendEventForState:(unint64_t)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v5 = [(HFCameraAnalyticsEvent *)self cameraClip];

  if (v5)
  {
    v6 = [MEMORY[0x263EFF910] date];
    v7 = [(HFCameraAnalyticsEvent *)self startDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    uint64_t v33 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v9 * 1000.0)];
    v10 = NSNumber;
    v11 = [(HFCameraAnalyticsEvent *)self cameraClip];
    v35 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "isComplete"));

    v12 = [MEMORY[0x263F08AB0] processInfo];
    v34 = [v12 processName];

    v13 = [NSNumber numberWithInteger:a3];
    v14 = NSNumber;
    v15 = [(HFCameraAnalyticsEvent *)self cameraClip];
    [v15 duration];
    v17 = [v14 numberWithUnsignedInteger:(unint64_t)v16];

    v18 = NSNumber;
    v19 = (void *)MEMORY[0x263EFF910];
    v20 = [(HFCameraAnalyticsEvent *)self cameraClip];
    v21 = [v20 dateOfOccurrence];
    v22 = [MEMORY[0x263EFF910] date];
    v23 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "hf_minutesBetweenDates:endDate:", v21, v22));

    v24 = NSNumber;
    v25 = v33;
    v26 = (void *)MEMORY[0x263EFF910];
    v27 = [(HFCameraAnalyticsEvent *)self cameraClip];
    v28 = [v27 dateOfOccurrence];
    v29 = [MEMORY[0x263EFF910] date];
    v30 = objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v26, "hf_daysBetweenDates:endDate:", v28, v29));

    v36[0] = HFCameraAnalyticsErrorState;
    v36[1] = HFCameraAnalyticsIsComplete;
    v37[0] = v13;
    v37[1] = v35;
    v36[2] = HFCameraAnalyticsProcessName;
    v36[3] = HFCameraAnalyticsLatency;
    v37[2] = v34;
    v37[3] = v33;
    v36[4] = HFCameraAnalyticsDuration;
    v36[5] = HFCameraAnalyticsAge;
    v37[4] = v17;
    v37[5] = v30;
    v36[6] = HFCameraAnalyticsAgeInMinutes;
    v37[6] = v23;
    v31 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:7];
    +[HFCameraAnalyticsEventHandler sendEventNamed:@"com.apple.Home.CameraClipPlaybackSession" payload:v31];
  }
  else
  {
    v25 = HFLogForCategory(6uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = self;
      _os_log_error_impl(&dword_20B986000, v25, OS_LOG_TYPE_ERROR, "Unable to send event for %@", buf, 0xCu);
    }
    v31 = (void *)MEMORY[0x263EFFA78];
  }

  return v31;
}

@end