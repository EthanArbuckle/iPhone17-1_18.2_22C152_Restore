@interface HFCameraAnalyticsEvent
+ (id)errorCodeForError:(id)a3;
- (HFCameraAnalyticsEvent)init;
- (HFCameraAnalyticsEvent)initWithCameraClip:(id)a3;
- (HMCameraClip)cameraClip;
- (NSDate)startDate;
- (id)sendEventForState:(unint64_t)a3;
- (void)setCameraClip:(id)a3;
@end

@implementation HFCameraAnalyticsEvent

- (HFCameraAnalyticsEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFCameraAnalyticsEvent;
  v2 = [(HFCameraAnalyticsEvent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v3;
  }
  return v2;
}

- (HFCameraAnalyticsEvent)initWithCameraClip:(id)a3
{
  id v4 = a3;
  v5 = [(HFCameraAnalyticsEvent *)self init];
  objc_super v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_cameraClip, v4);
  }

  return v6;
}

- (id)sendEventForState:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = [(HFCameraAnalyticsEvent *)self cameraClip];

  v5 = HFLogForCategory(6uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
    {
      int v9 = 138412290;
      v10 = self;
LABEL_7:
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v6)
  {
    int v9 = 138412290;
    v10 = self;
    v7 = "Unable to send event for %@";
    goto LABEL_7;
  }

  return (id)MEMORY[0x263EFFA78];
}

+ (id)errorCodeForError:(id)a3
{
  uint64_t v3 = NSNumber;
  if (a3) {
    a3 = (id)[a3 code];
  }
  id v4 = [v3 numberWithInteger:a3];
  return v4;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (HMCameraClip)cameraClip
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraClip);
  return (HMCameraClip *)WeakRetained;
}

- (void)setCameraClip:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraClip);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end