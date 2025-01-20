@interface HMDCameraStreamMetrics
- (HMDCameraMetricsStreamLogEvent)cameraStreamMetricsLogEvent;
- (HMDCameraStreamMetrics)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5;
- (NSError)error;
- (void)dealloc;
- (void)setError:(id)a3;
@end

@implementation HMDCameraStreamMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_cameraStreamMetricsLogEvent, 0);
}

- (NSError)error
{
  return self->_error;
}

- (HMDCameraMetricsStreamLogEvent)cameraStreamMetricsLogEvent
{
  return self->_cameraStreamMetricsLogEvent;
}

- (void)setError:(id)a3
{
  id v5 = a3;
  if (!self->_error)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    id v5 = v6;
  }
}

- (void)dealloc
{
  v3 = +[HMDMetricsManager sharedLogEventSubmitter];
  v4 = [(HMDCameraStreamMetrics *)self cameraStreamMetricsLogEvent];
  id v5 = [(HMDCameraStreamMetrics *)self error];
  [v3 submitLogEvent:v4 error:v5];

  v6.receiver = self;
  v6.super_class = (Class)HMDCameraStreamMetrics;
  [(HMDCameraStreamMetrics *)&v6 dealloc];
}

- (HMDCameraStreamMetrics)initWithSessionID:(id)a3 cameraAccessory:(id)a4 isLocal:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCameraStreamMetrics;
  v10 = [(HMDCameraStreamMetrics *)&v14 init];
  if (v10)
  {
    v11 = [[HMDCameraMetricsStreamLogEvent alloc] initWithSessionID:v8 cameraAccessory:v9 isLocal:v5];
    cameraStreamMetricsLogEvent = v10->_cameraStreamMetricsLogEvent;
    v10->_cameraStreamMetricsLogEvent = v11;
  }
  return v10;
}

@end