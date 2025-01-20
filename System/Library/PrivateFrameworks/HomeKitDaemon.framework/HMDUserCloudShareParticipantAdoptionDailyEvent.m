@interface HMDUserCloudShareParticipantAdoptionDailyEvent
- (HMDUserCloudShareParticipantAdoptionDailyEvent)initWithConfigureState:(int64_t)a3 hasOwnerCloudShareID:(BOOL)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)configureState;
- (NSNumber)hasOwnerCloudShareID;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDUserCloudShareParticipantAdoptionDailyEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasOwnerCloudShareID, 0);
  objc_storeStrong((id *)&self->_configureState, 0);
}

- (NSNumber)hasOwnerCloudShareID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)configureState
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"configureState";
  v3 = [(HMDUserCloudShareParticipantAdoptionDailyEvent *)self configureState];
  v7[1] = @"hasOwnerCloudShareID";
  v8[0] = v3;
  v4 = [(HMDUserCloudShareParticipantAdoptionDailyEvent *)self hasOwnerCloudShareID];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.trustManager.adoption.participant";
}

- (HMDUserCloudShareParticipantAdoptionDailyEvent)initWithConfigureState:(int64_t)a3 hasOwnerCloudShareID:(BOOL)a4
{
  BOOL v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDUserCloudShareParticipantAdoptionDailyEvent;
  v6 = [(HMMLogEvent *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [NSNumber numberWithInteger:a3];
    configureState = v6->_configureState;
    v6->_configureState = (NSNumber *)v7;

    uint64_t v9 = [NSNumber numberWithBool:v4];
    hasOwnerCloudShareID = v6->_hasOwnerCloudShareID;
    v6->_hasOwnerCloudShareID = (NSNumber *)v9;
  }
  return v6;
}

@end