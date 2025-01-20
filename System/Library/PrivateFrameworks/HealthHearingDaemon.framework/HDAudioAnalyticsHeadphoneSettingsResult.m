@interface HDAudioAnalyticsHeadphoneSettingsResult
- (HDAudioAnalyticsHeadphoneSettingsDeviceResult)activePairedWatch;
- (HDAudioAnalyticsHeadphoneSettingsDeviceResult)localDevice;
- (HDAudioAnalyticsHeadphoneSettingsResult)initWithLocalDevice:(id)a3 activePairedWatch:(id)a4;
- (void)setActivePairedWatch:(id)a3;
- (void)setLocalDevice:(id)a3;
@end

@implementation HDAudioAnalyticsHeadphoneSettingsResult

- (HDAudioAnalyticsHeadphoneSettingsResult)initWithLocalDevice:(id)a3 activePairedWatch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDAudioAnalyticsHeadphoneSettingsResult;
  v8 = [(HDAudioAnalyticsHeadphoneSettingsResult *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(HDAudioAnalyticsHeadphoneSettingsResult *)v8 setLocalDevice:v6];
    [(HDAudioAnalyticsHeadphoneSettingsResult *)v9 setActivePairedWatch:v7];
    v10 = v9;
  }

  return v9;
}

- (HDAudioAnalyticsHeadphoneSettingsDeviceResult)localDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(id)a3
{
}

- (HDAudioAnalyticsHeadphoneSettingsDeviceResult)activePairedWatch
{
  return self->_activePairedWatch;
}

- (void)setActivePairedWatch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePairedWatch, 0);
  objc_storeStrong((id *)&self->_localDevice, 0);
}

@end