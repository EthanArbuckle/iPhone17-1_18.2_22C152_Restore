@interface HMDCameraSnapshotMetrics
- (HMDCameraMetricsSnapshotLogEvent)cameraSnapshotMetricsLogEvent;
- (HMDCameraSnapshotMetrics)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5 snapshotForNotification:(BOOL)a6;
- (NSError)error;
- (void)dealloc;
- (void)setError:(id)a3;
@end

@implementation HMDCameraSnapshotMetrics

- (void)setError:(id)a3
{
}

- (void)dealloc
{
  v3 = +[HMDMetricsManager sharedLogEventSubmitter];
  v4 = [(HMDCameraSnapshotMetrics *)self cameraSnapshotMetricsLogEvent];
  v5 = [(HMDCameraSnapshotMetrics *)self error];
  [v3 submitLogEvent:v4 error:v5];

  v6.receiver = self;
  v6.super_class = (Class)HMDCameraSnapshotMetrics;
  [(HMDCameraSnapshotMetrics *)&v6 dealloc];
}

- (NSError)error
{
  return self->_error;
}

- (HMDCameraMetricsSnapshotLogEvent)cameraSnapshotMetricsLogEvent
{
  return self->_cameraSnapshotMetricsLogEvent;
}

- (HMDCameraSnapshotMetrics)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5 snapshotForNotification:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDCameraSnapshotMetrics;
  v12 = [(HMDCameraSnapshotMetrics *)&v16 init];
  if (v12)
  {
    v13 = [[HMDCameraMetricsSnapshotLogEvent alloc] initWithSessionID:v10 cameraAccessory:v11 isLocal:v7 snapshotForNotification:v6];
    cameraSnapshotMetricsLogEvent = v12->_cameraSnapshotMetricsLogEvent;
    v12->_cameraSnapshotMetricsLogEvent = v13;
  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cameraSnapshotMetricsLogEvent, 0);
}

@end