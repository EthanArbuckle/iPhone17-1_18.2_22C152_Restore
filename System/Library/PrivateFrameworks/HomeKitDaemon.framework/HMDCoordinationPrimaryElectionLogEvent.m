@interface HMDCoordinationPrimaryElectionLogEvent
- (BOOL)didChangePrimary;
- (BOOL)isPrimary;
- (HMDCoordinationPrimaryElectionLogEvent)initWithIsPrimary:(BOOL)a3 didChangePrimary:(BOOL)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDCoordinationPrimaryElectionLogEvent

- (BOOL)didChangePrimary
{
  return self->_didChangePrimary;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(HMDCoordinationPrimaryElectionLogEvent *)self isPrimary]) {
    v4 = &unk_26E470498;
  }
  else {
    v4 = &unk_26E4704B0;
  }
  [v3 setObject:v4 forKeyedSubscript:@"isPrimary"];
  if ([(HMDCoordinationPrimaryElectionLogEvent *)self didChangePrimary]) {
    v5 = &unk_26E470498;
  }
  else {
    v5 = &unk_26E4704B0;
  }
  [v3 setObject:v5 forKeyedSubscript:@"didChangePrimary"];
  v6 = (void *)[v3 copy];

  return (NSDictionary *)v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.CoordinationPrimaryElection";
}

- (HMDCoordinationPrimaryElectionLogEvent)initWithIsPrimary:(BOOL)a3 didChangePrimary:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDCoordinationPrimaryElectionLogEvent;
  result = [(HMMLogEvent *)&v7 init];
  if (result)
  {
    result->_isPrimary = a3;
    result->_didChangePrimary = a4;
  }
  return result;
}

@end