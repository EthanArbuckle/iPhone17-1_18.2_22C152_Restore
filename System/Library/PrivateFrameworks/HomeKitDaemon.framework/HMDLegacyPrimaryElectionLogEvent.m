@interface HMDLegacyPrimaryElectionLogEvent
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)criteria;
- (NSString)reason;
- (unint64_t)availableResidentCount;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setAvailableResidentCount:(unint64_t)a3;
- (void)setCriteria:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation HMDLegacyPrimaryElectionLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)setAvailableResidentCount:(unint64_t)a3
{
  self->_availableResidentCount = a3;
}

- (unint64_t)availableResidentCount
{
  return self->_availableResidentCount;
}

- (void)setCriteria:(id)a3
{
}

- (NSString)criteria
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReason:(id)a3
{
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"reason";
  v3 = [(HMDLegacyPrimaryElectionLogEvent *)self reason];
  v10[0] = v3;
  v9[1] = @"criteria";
  v4 = [(HMDLegacyPrimaryElectionLogEvent *)self criteria];
  v10[1] = v4;
  v9[2] = @"availableResidents";
  v5 = +[HMDLogEventHistograms configurationDataHistogram];
  v6 = objc_msgSend(v5, "intervalIndexForValue:", -[HMDLegacyPrimaryElectionLogEvent availableResidentCount](self, "availableResidentCount"));
  v9[3] = @"eventCount";
  v10[2] = v6;
  v10[3] = &unk_26E473900;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.election.legacy";
}

@end