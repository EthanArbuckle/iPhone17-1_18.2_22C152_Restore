@interface HMDCameraRecordingSessionCoordinationLogEvent
- (BOOL)isUsingRemoteDeviceAnalysisNode;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)retryCount;
- (void)setRetryCount:(unint64_t)a3;
- (void)setUsingRemoteDeviceAnalysisNode:(BOOL)a3;
@end

@implementation HMDCameraRecordingSessionCoordinationLogEvent

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setUsingRemoteDeviceAnalysisNode:(BOOL)a3
{
  self->_usingRemoteDeviceAnalysisNode = a3;
}

- (BOOL)isUsingRemoteDeviceAnalysisNode
{
  return self->_usingRemoteDeviceAnalysisNode;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCameraRecordingSessionCoordinationLogEvent isUsingRemoteDeviceAnalysisNode](self, "isUsingRemoteDeviceAnalysisNode"));
  [v3 setObject:v4 forKeyedSubscript:@"analysisNodeIsRemoteDevice"];

  v5 = [(HMMLogEvent *)self error];
  v6 = [v5 domain];
  [v3 setObject:v6 forKeyedSubscript:@"errorDomain"];

  v7 = NSNumber;
  v8 = [(HMMLogEvent *)self error];
  v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "code"));
  [v3 setObject:v9 forKeyedSubscript:@"errorCode"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraRecordingSessionCoordinationLogEvent retryCount](self, "retryCount"));
  [v3 setObject:v10 forKeyedSubscript:@"retryCount"];

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  [v3 setObject:v11 forKeyedSubscript:@"durationInMS"];

  v12 = (void *)[v3 copy];
  return (NSDictionary *)v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homekit.daemon.camera.recording.coordinationevent";
}

@end