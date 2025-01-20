@interface HMDCameraMetricsLogEvent
- (BOOL)isLocal;
- (HMDAccessory)accessory;
- (HMDCameraMetricsLogEvent)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5;
- (HMDCameraSessionID)sessionID;
@end

@implementation HMDCameraMetricsLogEvent

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (HMDCameraMetricsLogEvent)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [v10 home];
  v12 = [v11 uuid];
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraMetricsLogEvent;
  v13 = [(HMMHomeLogEvent *)&v15 initWithHomeUUID:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_sessionID, a3);
    objc_storeWeak((id *)&v13->_accessory, v10);
    v13->_isLocal = a5;
  }

  return v13;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (HMDCameraSessionID)sessionID
{
  return self->_sessionID;
}

@end