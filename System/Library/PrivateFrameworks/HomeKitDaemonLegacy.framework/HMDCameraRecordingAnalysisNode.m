@interface HMDCameraRecordingAnalysisNode
- (HMDCameraRecordingAnalysisNode)initWithResidentDevice:(id)a3 metrics:(id)a4;
- (HMDResidentDevice)residentDevice;
- (NSDictionary)metrics;
@end

@implementation HMDCameraRecordingAnalysisNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_residentDevice, 0);
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (HMDResidentDevice)residentDevice
{
  return self->_residentDevice;
}

- (HMDCameraRecordingAnalysisNode)initWithResidentDevice:(id)a3 metrics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v15 = (HMDMultiUserNewLanguageNotificationLogEvent *)_HMFPreconditionFailure();
    [(HMDMultiUserNewLanguageNotificationLogEvent *)v15 .cxx_destruct];
    return result;
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraRecordingAnalysisNode;
  v10 = [(HMDCameraRecordingAnalysisNode *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_residentDevice, a3);
    uint64_t v12 = [v9 copy];
    metrics = v11->_metrics;
    v11->_metrics = (NSDictionary *)v12;
  }
  return v11;
}

@end