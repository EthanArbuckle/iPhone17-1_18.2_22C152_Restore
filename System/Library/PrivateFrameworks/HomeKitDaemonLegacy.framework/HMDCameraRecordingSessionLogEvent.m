@interface HMDCameraRecordingSessionLogEvent
+ (BOOL)isRecordingSessionAlreadyInProgressError:(id)a3;
- (BOOL)didReadFirstFragment;
- (HMDCameraRecordingSessionLogEvent)initWithAccessoryIdentifier:(id)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)accessoryIdentifier;
- (NSString)coreAnalyticsEventName;
- (int64_t)retryCount;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setDidReadFirstFragment:(BOOL)a3;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation HMDCameraRecordingSessionLogEvent

- (void).cxx_destruct
{
}

- (void)setDidReadFirstFragment:(BOOL)a3
{
  self->_didReadFirstFragment = a3;
}

- (BOOL)didReadFirstFragment
{
  return self->_didReadFirstFragment;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 4;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMMLogEvent *)self error];
  v5 = [v4 domain];
  [v3 setObject:v5 forKeyedSubscript:@"errorDomain"];

  v6 = NSNumber;
  v7 = [(HMMLogEvent *)self error];
  v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "code"));
  [v3 setObject:v8 forKeyedSubscript:@"errorCode"];

  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCameraRecordingSessionLogEvent retryCount](self, "retryCount"));
  [v3 setObject:v9 forKeyedSubscript:@"retryCount"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCameraRecordingSessionLogEvent didReadFirstFragment](self, "didReadFirstFragment"));
  [v3 setObject:v10 forKeyedSubscript:@"didReadFirstFragment"];

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  [v3 setObject:v11 forKeyedSubscript:@"durationInMS"];

  v12 = (void *)[v3 copy];
  return (NSDictionary *)v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homekit.daemon.camera.recording.bulksessionevent";
}

- (HMDCameraRecordingSessionLogEvent)initWithAccessoryIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraRecordingSessionLogEvent;
  v5 = [(HMMLogEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    accessoryIdentifier = v5->_accessoryIdentifier;
    v5->_accessoryIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)isRecordingSessionAlreadyInProgressError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F2D140]]) {
    BOOL v5 = [v3 code] == 15 || objc_msgSend(v3, "code") == 3303 || objc_msgSend(v3, "code") == 3304;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end