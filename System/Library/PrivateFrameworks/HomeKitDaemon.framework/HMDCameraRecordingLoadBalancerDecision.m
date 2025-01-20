@interface HMDCameraRecordingLoadBalancerDecision
- (BOOL)isExpired;
- (HMDCameraRecordingAnalysisNode)analysisNode;
- (HMDCameraRecordingLoadBalancerDecision)initWithCameraUUID:(id)a3 numberOfAvailableDevices:(int64_t)a4 totalNumberOfJobSlots:(int64_t)a5 remainingNumberOfJobSlots:(int64_t)a6 analysisNode:(id)a7 decisionDate:(id)a8;
- (NSDate)decisionDate;
- (NSUUID)cameraUUID;
- (NSUUID)deviceUUID;
- (id)attributeDescriptions;
- (int64_t)numberOfAvailableDevices;
- (int64_t)remainingNumberOfJobSlots;
- (int64_t)totalNumberOfJobSlots;
@end

@implementation HMDCameraRecordingLoadBalancerDecision

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decisionDate, 0);
  objc_storeStrong((id *)&self->_analysisNode, 0);
  objc_storeStrong((id *)&self->_cameraUUID, 0);
}

- (NSDate)decisionDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (HMDCameraRecordingAnalysisNode)analysisNode
{
  return (HMDCameraRecordingAnalysisNode *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)remainingNumberOfJobSlots
{
  return self->_remainingNumberOfJobSlots;
}

- (int64_t)totalNumberOfJobSlots
{
  return self->_totalNumberOfJobSlots;
}

- (int64_t)numberOfAvailableDevices
{
  return self->_numberOfAvailableDevices;
}

- (NSUUID)cameraUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v23[6] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = [(HMDCameraRecordingLoadBalancerDecision *)self cameraUUID];
  v21 = (void *)[v3 initWithName:@"Camera UUID" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v20 = [(HMDCameraRecordingLoadBalancerDecision *)self deviceUUID];
  v5 = (void *)[v4 initWithName:@"Device UUID" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCameraRecordingLoadBalancerDecision numberOfAvailableDevices](self, "numberOfAvailableDevices"));
  v8 = (void *)[v6 initWithName:@"Available Devices Count" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCameraRecordingLoadBalancerDecision totalNumberOfJobSlots](self, "totalNumberOfJobSlots"));
  v11 = (void *)[v9 initWithName:@"Total Job Slots Count" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCameraRecordingLoadBalancerDecision remainingNumberOfJobSlots](self, "remainingNumberOfJobSlots"));
  v14 = (void *)[v12 initWithName:@"Remaining Job Slots Count" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  v16 = [(HMDCameraRecordingLoadBalancerDecision *)self decisionDate];
  v17 = (void *)[v15 initWithName:@"Decision Date" value:v16];
  v23[5] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:6];

  return v18;
}

- (BOOL)isExpired
{
  v2 = [(HMDCameraRecordingLoadBalancerDecision *)self decisionDate];
  [v2 timeIntervalSinceNow];
  BOOL v4 = v3 < -15.0;

  return v4;
}

- (NSUUID)deviceUUID
{
  v2 = [(HMDCameraRecordingLoadBalancerDecision *)self analysisNode];
  double v3 = [v2 residentDevice];
  BOOL v4 = [v3 device];
  v5 = [v4 identifier];

  return (NSUUID *)v5;
}

- (HMDCameraRecordingLoadBalancerDecision)initWithCameraUUID:(id)a3 numberOfAvailableDevices:(int64_t)a4 totalNumberOfJobSlots:(int64_t)a5 remainingNumberOfJobSlots:(int64_t)a6 analysisNode:(id)a7 decisionDate:(id)a8
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v18 = v17;
  if (!v17)
  {
LABEL_7:
    v22 = (void *)_HMFPreconditionFailure();
    return (HMDCameraRecordingLoadBalancerDecision *)+[_MKFMatterCommandAction fetchRequest];
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDCameraRecordingLoadBalancerDecision;
  v19 = [(HMDCameraRecordingLoadBalancerDecision *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_cameraUUID, a3);
    v20->_numberOfAvailableDevices = a4;
    v20->_totalNumberOfJobSlots = a5;
    v20->_remainingNumberOfJobSlots = a6;
    objc_storeStrong((id *)&v20->_analysisNode, a7);
    objc_storeStrong((id *)&v20->_decisionDate, a8);
  }

  return v20;
}

@end