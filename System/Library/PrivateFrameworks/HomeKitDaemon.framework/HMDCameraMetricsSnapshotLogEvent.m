@interface HMDCameraMetricsSnapshotLogEvent
- (BOOL)snapshotForNotification;
- (HMDCameraMetricsSnapshotLogEvent)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5 snapshotForNotification:(BOOL)a6;
- (NSNumber)referenceTimestamp;
- (void)setReferenceTimestamp:(id)a3;
@end

@implementation HMDCameraMetricsSnapshotLogEvent

- (void).cxx_destruct
{
}

- (void)setReferenceTimestamp:(id)a3
{
}

- (NSNumber)referenceTimestamp
{
  return self->_referenceTimestamp;
}

- (BOOL)snapshotForNotification
{
  return self->_snapshotForNotification;
}

- (HMDCameraMetricsSnapshotLogEvent)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5 snapshotForNotification:(BOOL)a6
{
  v8.receiver = self;
  v8.super_class = (Class)HMDCameraMetricsSnapshotLogEvent;
  result = [(HMDCameraMetricsLogEvent *)&v8 initWithSessionID:a3 cameraAccessory:a4 isLocal:a5];
  if (result) {
    result->_snapshotForNotification = a6;
  }
  return result;
}

@end