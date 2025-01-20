@interface HFCameraAnalyticsCameraClipExportSessionEvent
- (double)recordingDuration;
- (id)sendEventForState:(unint64_t)a3;
- (void)setRecordingDuration:(double)a3;
@end

@implementation HFCameraAnalyticsCameraClipExportSessionEvent

- (id)sendEventForState:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v5 = [(HFCameraAnalyticsEvent *)self cameraClip];

  if (v5)
  {
    v6 = [MEMORY[0x263EFF910] date];
    v7 = [(HFCameraAnalyticsEvent *)self startDate];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    uint64_t v31 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v9 * 1000.0)];
    v10 = NSNumber;
    v11 = [(HFCameraAnalyticsEvent *)self cameraClip];
    v32 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "isComplete"));

    v12 = [MEMORY[0x263F08AB0] processInfo];
    v13 = [v12 processName];

    v14 = [NSNumber numberWithInteger:a3];
    v15 = NSNumber;
    v16 = [(HFCameraAnalyticsEvent *)self cameraClip];
    [v16 duration];
    v18 = [v15 numberWithUnsignedInteger:(unint64_t)(v17 * 1000.0)];

    v19 = NSNumber;
    v20 = (void *)MEMORY[0x263EFF910];
    v21 = [(HFCameraAnalyticsEvent *)self cameraClip];
    v22 = [v21 dateOfOccurrence];
    v23 = [MEMORY[0x263EFF910] date];
    v24 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "hf_daysBetweenDates:endDate:", v22, v23));

    v25 = NSNumber;
    v26 = v31;
    [(HFCameraAnalyticsCameraClipExportSessionEvent *)self recordingDuration];
    v28 = [v25 numberWithUnsignedInt:(v27 * 1000.0)];
    v33[0] = HFCameraAnalyticsErrorState;
    v33[1] = HFCameraAnalyticsExportedLength;
    v34[0] = v14;
    v34[1] = v28;
    v33[2] = HFCameraAnalyticsIsComplete;
    v33[3] = HFCameraAnalyticsProcessName;
    v34[2] = v32;
    v34[3] = v13;
    v33[4] = HFCameraAnalyticsLatency;
    v33[5] = HFCameraAnalyticsDuration;
    v34[4] = v31;
    v34[5] = v18;
    v33[6] = HFCameraAnalyticsAge;
    v34[6] = v24;
    v29 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:7];
    +[HFCameraAnalyticsEventHandler sendEventNamed:@"com.apple.Home.CameraClipExportSession" payload:v29];
  }
  else
  {
    v26 = HFLogForCategory(6uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = self;
      _os_log_error_impl(&dword_20B986000, v26, OS_LOG_TYPE_ERROR, "Unable to send event for %@", buf, 0xCu);
    }
    v29 = (void *)MEMORY[0x263EFFA78];
  }

  return v29;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setRecordingDuration:(double)a3
{
  self->_recordingDuration = a3;
}

@end