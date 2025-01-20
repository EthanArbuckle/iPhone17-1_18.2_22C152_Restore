@interface HMDLegacyPrimaryElectionConfirmationLogEvent
- (BOOL)changedPrimary;
- (HMDLegacyPrimaryElectionConfirmationLogEvent)init;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)criteria;
- (unint64_t)availableResidentCount;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)residentsRespondedCount;
- (void)setAvailableResidentCount:(unint64_t)a3;
- (void)setChangedPrimary:(BOOL)a3;
- (void)setCriteria:(id)a3;
- (void)setResidentsRespondedCount:(unint64_t)a3;
@end

@implementation HMDLegacyPrimaryElectionConfirmationLogEvent

- (void).cxx_destruct
{
}

- (void)setChangedPrimary:(BOOL)a3
{
  self->_changedPrimary = a3;
}

- (BOOL)changedPrimary
{
  return self->_changedPrimary;
}

- (void)setCriteria:(id)a3
{
}

- (NSString)criteria
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResidentsRespondedCount:(unint64_t)a3
{
  self->_residentsRespondedCount = a3;
}

- (unint64_t)residentsRespondedCount
{
  return self->_residentsRespondedCount;
}

- (void)setAvailableResidentCount:(unint64_t)a3
{
  self->_availableResidentCount = a3;
}

- (unint64_t)availableResidentCount
{
  return self->_availableResidentCount;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v13[5] = *MEMORY[0x1E4F143B8];
  if ([(HMDLegacyPrimaryElectionConfirmationLogEvent *)self availableResidentCount])
  {
    unint64_t v3 = [(HMDLegacyPrimaryElectionConfirmationLogEvent *)self residentsRespondedCount];
    double v4 = (double)(100
                * (v3
                 / [(HMDLegacyPrimaryElectionConfirmationLogEvent *)self availableResidentCount]));
  }
  else
  {
    double v4 = 0.0;
  }
  v12[0] = @"availableResidents";
  v5 = +[HMDLogEventHistograms configurationDataHistogram];
  v6 = objc_msgSend(v5, "intervalIndexForValue:", -[HMDLegacyPrimaryElectionConfirmationLogEvent availableResidentCount](self, "availableResidentCount"));
  v13[0] = v6;
  v12[1] = @"respondedResidentsPercentage";
  v7 = [NSNumber numberWithDouble:v4];
  v13[1] = v7;
  v12[2] = @"criteria";
  v8 = [(HMDLegacyPrimaryElectionConfirmationLogEvent *)self criteria];
  v13[2] = v8;
  v12[3] = @"changedPrimary";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDLegacyPrimaryElectionConfirmationLogEvent changedPrimary](self, "changedPrimary"));
  v12[4] = @"eventCount";
  v13[3] = v9;
  v13[4] = &unk_1F2DC8DA0;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];

  return (NSDictionary *)v10;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.election.legacy.confirmation";
}

- (HMDLegacyPrimaryElectionConfirmationLogEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)HMDLegacyPrimaryElectionConfirmationLogEvent;
  v2 = [(HMMLogEvent *)&v5 init];
  criteria = v2->_criteria;
  v2->_criteria = (NSString *)@"unknown";

  return v2;
}

@end