@interface HFAnalyticsCameraRecordingCloudUpgradeResultEvent
- (HFAnalyticsCameraRecordingCloudUpgradeResultEvent)initWithData:(id)a3;
- (id)payload;
- (unint64_t)iCloudPlanUpgradeState;
- (unint64_t)iCloudUpgradeOfferPresented;
- (unint64_t)numCamerasWithRecording;
- (void)setICloudPlanUpgradeState:(unint64_t)a3;
- (void)setICloudUpgradeOfferPresented:(unint64_t)a3;
- (void)setNumCamerasWithRecording:(unint64_t)a3;
@end

@implementation HFAnalyticsCameraRecordingCloudUpgradeResultEvent

- (HFAnalyticsCameraRecordingCloudUpgradeResultEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"numCameras"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    NSLog(&cfstr_ErrorHfanalyti_7.isa);
  }
  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"offerPresented"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10) {
    NSLog(&cfstr_ErrorHfanalyti_8.isa);
  }
  objc_opt_class();
  v11 = [v4 objectForKeyedSubscript:@"iCloudUpgradeState"];
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (!v13) {
    NSLog(&cfstr_ErrorHfanalyti_9.isa);
  }
  v16.receiver = self;
  v16.super_class = (Class)HFAnalyticsCameraRecordingCloudUpgradeResultEvent;
  v14 = [(HFAnalyticsEvent *)&v16 initWithEventType:2];
  if (v14)
  {
    v14->_numCamerasWithRecording = [v7 integerValue];
    v14->_iCloudUpgradeOfferPresented = [v10 integerValue];
    v14->_iCloudPlanUpgradeState = [v13 integerValue];
  }

  return v14;
}

- (id)payload
{
  v9.receiver = self;
  v9.super_class = (Class)HFAnalyticsCameraRecordingCloudUpgradeResultEvent;
  v3 = [(HFAnalyticsEvent *)&v9 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFAnalyticsCameraRecordingCloudUpgradeResultEvent numCamerasWithRecording](self, "numCamerasWithRecording"));
  [v4 setObject:v5 forKeyedSubscript:@"numCamerasWithRecording"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFAnalyticsCameraRecordingCloudUpgradeResultEvent iCloudUpgradeOfferPresented](self, "iCloudUpgradeOfferPresented"));
  [v4 setObject:v6 forKeyedSubscript:@"iCloudUpgradeOfferPresented"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFAnalyticsCameraRecordingCloudUpgradeResultEvent iCloudPlanUpgradeState](self, "iCloudPlanUpgradeState"));
  [v4 setObject:v7 forKeyedSubscript:@"iCloudPlanUpgradeState"];

  return v4;
}

- (unint64_t)numCamerasWithRecording
{
  return self->_numCamerasWithRecording;
}

- (void)setNumCamerasWithRecording:(unint64_t)a3
{
  self->_numCamerasWithRecording = a3;
}

- (unint64_t)iCloudUpgradeOfferPresented
{
  return self->_iCloudUpgradeOfferPresented;
}

- (void)setICloudUpgradeOfferPresented:(unint64_t)a3
{
  self->_iCloudUpgradeOfferPresented = a3;
}

- (unint64_t)iCloudPlanUpgradeState
{
  return self->_iCloudPlanUpgradeState;
}

- (void)setICloudPlanUpgradeState:(unint64_t)a3
{
  self->_iCloudPlanUpgradeState = a3;
}

@end