@interface HMDCameraRecordingReachabilityLogEvent
- (BOOL)didCreateEventModel;
- (BOOL)reachable;
- (HMDCameraRecordingReachabilityLogEvent)initWithReachability:(BOOL)a3 didCreateEventModel:(BOOL)a4 reachabilityChangeDebounceCount:(unint64_t)a5 offlineDuration:(double)a6 hapAccessory:(id)a7;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)accessoryIdentifier;
- (NSString)coreAnalyticsEventName;
- (double)offlineDuration;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)reachabilityChangeDebounceCount;
@end

@implementation HMDCameraRecordingReachabilityLogEvent

- (void).cxx_destruct
{
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (double)offlineDuration
{
  return self->_offlineDuration;
}

- (unint64_t)reachabilityChangeDebounceCount
{
  return self->_reachabilityChangeDebounceCount;
}

- (BOOL)didCreateEventModel
{
  return self->_didCreateEventModel;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2147483652;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCameraRecordingReachabilityLogEvent reachable](self, "reachable"));
  [v3 setObject:v4 forKeyedSubscript:@"reachable"];

  if ([(HMDCameraRecordingReachabilityLogEvent *)self reachable]) {
    v5 = &unk_26E470AB0;
  }
  else {
    v5 = &unk_26E470AC8;
  }
  [v3 setObject:v5 forKeyedSubscript:@"isReachable_INT"];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDCameraRecordingReachabilityLogEvent didCreateEventModel](self, "didCreateEventModel"));
  [v3 setObject:v6 forKeyedSubscript:@"didCreateEventModel"];

  if ([(HMDCameraRecordingReachabilityLogEvent *)self didCreateEventModel]) {
    v7 = &unk_26E470AB0;
  }
  else {
    v7 = &unk_26E470AC8;
  }
  [v3 setObject:v7 forKeyedSubscript:@"didCreateEventModel_INT"];
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCameraRecordingReachabilityLogEvent reachabilityChangeDebounceCount](self, "reachabilityChangeDebounceCount"));
  [v3 setObject:v8 forKeyedSubscript:@"reachabilityChangeDebounceCount_INT"];

  v9 = NSNumber;
  [(HMDCameraRecordingReachabilityLogEvent *)self offlineDuration];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v3 setObject:v10 forKeyedSubscript:@"offlineDurationSeconds"];

  v11 = (void *)[v3 copy];
  return (NSDictionary *)v11;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.camera-recording-reachability";
}

- (HMDCameraRecordingReachabilityLogEvent)initWithReachability:(BOOL)a3 didCreateEventModel:(BOOL)a4 reachabilityChangeDebounceCount:(unint64_t)a5 offlineDuration:(double)a6 hapAccessory:(id)a7
{
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraRecordingReachabilityLogEvent;
  v13 = [(HMMLogEvent *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_reachable = a3;
    v13->_didCreateEventModel = a4;
    v13->_reachabilityChangeDebounceCount = a5;
    v13->_offlineDuration = a6;
    uint64_t v15 = [v12 identifier];
    accessoryIdentifier = v14->_accessoryIdentifier;
    v14->_accessoryIdentifier = (NSString *)v15;
  }
  return v14;
}

@end