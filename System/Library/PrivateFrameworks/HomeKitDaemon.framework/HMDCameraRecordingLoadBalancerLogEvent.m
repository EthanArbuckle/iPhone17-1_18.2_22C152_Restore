@interface HMDCameraRecordingLoadBalancerLogEvent
- (BOOL)selectedResidentHasActiveSessionWithCamera;
- (HMDCameraRecordingLoadBalancerLogEvent)initWithNumberOfResidents:(id)a3 numberOfRetries:(id)a4 totalNumberOfJobSlots:(id)a5 remainingNumberOfJobSlots:(id)a6 selectedResidentDeviceType:(id)a7 selectedResidentNumberOfActiveStreams:(id)a8 selectedResidentSystemResourceUsageLevel:(id)a9 selectedResidentJobSlots:(id)a10 selectedResidentPartialJobSlots:(id)a11 selectedResidentHasActiveSessionWithCamera:(BOOL)a12;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)numberOfResidents;
- (NSNumber)numberOfRetries;
- (NSNumber)remainingNumberOfJobSlots;
- (NSNumber)selectedResidentJobSlots;
- (NSNumber)selectedResidentNumberOfActiveStreams;
- (NSNumber)selectedResidentPartialJobSlots;
- (NSNumber)selectedResidentSystemResourceUsageLevel;
- (NSNumber)totalNumberOfJobSlots;
- (NSString)coreAnalyticsEventName;
- (NSString)selectedResidentDeviceType;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDCameraRecordingLoadBalancerLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedResidentPartialJobSlots, 0);
  objc_storeStrong((id *)&self->_selectedResidentJobSlots, 0);
  objc_storeStrong((id *)&self->_selectedResidentNumberOfActiveStreams, 0);
  objc_storeStrong((id *)&self->_selectedResidentSystemResourceUsageLevel, 0);
  objc_storeStrong((id *)&self->_selectedResidentDeviceType, 0);
  objc_storeStrong((id *)&self->_remainingNumberOfJobSlots, 0);
  objc_storeStrong((id *)&self->_totalNumberOfJobSlots, 0);
  objc_storeStrong((id *)&self->_numberOfRetries, 0);
  objc_storeStrong((id *)&self->_numberOfResidents, 0);
}

- (BOOL)selectedResidentHasActiveSessionWithCamera
{
  return self->_selectedResidentHasActiveSessionWithCamera;
}

- (NSNumber)selectedResidentPartialJobSlots
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (NSNumber)selectedResidentJobSlots
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (NSNumber)selectedResidentNumberOfActiveStreams
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSNumber)selectedResidentSystemResourceUsageLevel
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)selectedResidentDeviceType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)remainingNumberOfJobSlots
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)totalNumberOfJobSlots
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)numberOfRetries
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)numberOfResidents
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDCameraRecordingLoadBalancerLogEvent *)self numberOfResidents];
  [v3 setObject:v4 forKeyedSubscript:@"numberOfResidents"];

  v5 = [(HMDCameraRecordingLoadBalancerLogEvent *)self numberOfRetries];
  [v3 setObject:v5 forKeyedSubscript:@"numberOfRetries"];

  v6 = [(HMDCameraRecordingLoadBalancerLogEvent *)self totalNumberOfJobSlots];
  [v3 setObject:v6 forKeyedSubscript:@"totalNumberOfJobSlots"];

  v7 = [(HMDCameraRecordingLoadBalancerLogEvent *)self remainingNumberOfJobSlots];
  [v3 setObject:v7 forKeyedSubscript:@"remainingNumberOfJobSlots"];

  v8 = [(HMDCameraRecordingLoadBalancerLogEvent *)self selectedResidentDeviceType];
  [v3 setObject:v8 forKeyedSubscript:@"selectedResidentDeviceType"];

  v9 = [(HMDCameraRecordingLoadBalancerLogEvent *)self selectedResidentNumberOfActiveStreams];
  [v3 setObject:v9 forKeyedSubscript:@"selectedResidentNumberOfActiveStreams"];

  v10 = [(HMDCameraRecordingLoadBalancerLogEvent *)self selectedResidentSystemResourceUsageLevel];
  [v3 setObject:v10 forKeyedSubscript:@"selectedResidentSystemResourceUsageLevel"];

  v11 = [(HMDCameraRecordingLoadBalancerLogEvent *)self selectedResidentJobSlots];
  [v3 setObject:v11 forKeyedSubscript:@"selectedResidentFullJobSlots"];

  v12 = [(HMDCameraRecordingLoadBalancerLogEvent *)self selectedResidentPartialJobSlots];
  [v3 setObject:v12 forKeyedSubscript:@"selectedResidentPartialJobSlots"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCameraRecordingLoadBalancerLogEvent selectedResidentHasActiveSessionWithCamera](self, "selectedResidentHasActiveSessionWithCamera"));
  [v3 setObject:v13 forKeyedSubscript:@"selectedResidentHasActiveSessionWithCamera"];

  v14 = (void *)[v3 copy];
  return (NSDictionary *)v14;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.camera-load-balancing";
}

- (HMDCameraRecordingLoadBalancerLogEvent)initWithNumberOfResidents:(id)a3 numberOfRetries:(id)a4 totalNumberOfJobSlots:(id)a5 remainingNumberOfJobSlots:(id)a6 selectedResidentDeviceType:(id)a7 selectedResidentNumberOfActiveStreams:(id)a8 selectedResidentSystemResourceUsageLevel:(id)a9 selectedResidentJobSlots:(id)a10 selectedResidentPartialJobSlots:(id)a11 selectedResidentHasActiveSessionWithCamera:(BOOL)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  v47.receiver = self;
  v47.super_class = (Class)HMDCameraRecordingLoadBalancerLogEvent;
  v27 = [(HMMLogEvent *)&v47 init];
  if (v27)
  {
    uint64_t v28 = [v18 copy];
    numberOfResidents = v27->_numberOfResidents;
    v27->_numberOfResidents = (NSNumber *)v28;

    uint64_t v30 = [v19 copy];
    numberOfRetries = v27->_numberOfRetries;
    v27->_numberOfRetries = (NSNumber *)v30;

    uint64_t v32 = [v20 copy];
    totalNumberOfJobSlots = v27->_totalNumberOfJobSlots;
    v27->_totalNumberOfJobSlots = (NSNumber *)v32;

    uint64_t v34 = [v21 copy];
    remainingNumberOfJobSlots = v27->_remainingNumberOfJobSlots;
    v27->_remainingNumberOfJobSlots = (NSNumber *)v34;

    uint64_t v36 = [v22 copy];
    selectedResidentDeviceType = v27->_selectedResidentDeviceType;
    v27->_selectedResidentDeviceType = (NSString *)v36;

    uint64_t v38 = [v23 copy];
    selectedResidentNumberOfActiveStreams = v27->_selectedResidentNumberOfActiveStreams;
    v27->_selectedResidentNumberOfActiveStreams = (NSNumber *)v38;

    uint64_t v40 = [v24 copy];
    selectedResidentSystemResourceUsageLevel = v27->_selectedResidentSystemResourceUsageLevel;
    v27->_selectedResidentSystemResourceUsageLevel = (NSNumber *)v40;

    uint64_t v42 = [v25 copy];
    selectedResidentJobSlots = v27->_selectedResidentJobSlots;
    v27->_selectedResidentJobSlots = (NSNumber *)v42;

    uint64_t v44 = [v26 copy];
    selectedResidentPartialJobSlots = v27->_selectedResidentPartialJobSlots;
    v27->_selectedResidentPartialJobSlots = (NSNumber *)v44;

    v27->_selectedResidentHasActiveSessionWithCamera = a12;
  }

  return v27;
}

@end