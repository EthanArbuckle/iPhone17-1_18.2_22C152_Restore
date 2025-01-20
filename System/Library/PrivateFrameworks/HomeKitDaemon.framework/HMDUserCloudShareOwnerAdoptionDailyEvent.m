@interface HMDUserCloudShareOwnerAdoptionDailyEvent
- (HMDUserCloudShareOwnerAdoptionDailyEvent)initWithConfigureState:(int64_t)a3 isPrimaryResident:(BOOL)a4 trustStatusCounts:(CloudShareTrustManagerTrustStatusCounts *)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)configureState;
- (NSNumber)hasSharedUser;
- (NSNumber)isPrimaryResident;
- (NSNumber)percentageOfAcceptedParticipantsWithoutCloudShareID;
- (NSNumber)percentageOfNonAcceptedParticipantsWithKnownCapability;
- (NSNumber)percentageOfParticipantsHaveAccepted;
- (NSNumber)percentageOfParticipantsHaveCloudShareIDAndHaveAccepted;
- (NSNumber)percentageOfParticipantsHaveCloudShareIDButNotAccepted;
- (NSNumber)percentageOfParticipatingUsersThatNotAccepted;
- (NSNumber)percentageOfUsersThatAreNotParticipant;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDUserCloudShareOwnerAdoptionDailyEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentageOfAcceptedParticipantsWithoutCloudShareID, 0);
  objc_storeStrong((id *)&self->_percentageOfParticipatingUsersThatNotAccepted, 0);
  objc_storeStrong((id *)&self->_percentageOfUsersThatAreNotParticipant, 0);
  objc_storeStrong((id *)&self->_percentageOfNonAcceptedParticipantsWithKnownCapability, 0);
  objc_storeStrong((id *)&self->_percentageOfParticipantsHaveCloudShareIDButNotAccepted, 0);
  objc_storeStrong((id *)&self->_percentageOfParticipantsHaveCloudShareIDAndHaveAccepted, 0);
  objc_storeStrong((id *)&self->_percentageOfParticipantsHaveAccepted, 0);
  objc_storeStrong((id *)&self->_hasSharedUser, 0);
  objc_storeStrong((id *)&self->_isPrimaryResident, 0);
  objc_storeStrong((id *)&self->_configureState, 0);
}

- (NSNumber)percentageOfAcceptedParticipantsWithoutCloudShareID
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (NSNumber)percentageOfParticipatingUsersThatNotAccepted
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (NSNumber)percentageOfUsersThatAreNotParticipant
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSNumber)percentageOfNonAcceptedParticipantsWithKnownCapability
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)percentageOfParticipantsHaveCloudShareIDButNotAccepted
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)percentageOfParticipantsHaveCloudShareIDAndHaveAccepted
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)percentageOfParticipantsHaveAccepted
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)hasSharedUser
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)isPrimaryResident
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
  v16[10] = *MEMORY[0x263EF8340];
  v15[0] = @"configureState";
  v14 = [(HMDUserCloudShareOwnerAdoptionDailyEvent *)self configureState];
  v16[0] = v14;
  v15[1] = @"isPrimaryResident";
  v3 = [(HMDUserCloudShareOwnerAdoptionDailyEvent *)self isPrimaryResident];
  v16[1] = v3;
  v15[2] = @"hasSharedUser";
  v4 = [(HMDUserCloudShareOwnerAdoptionDailyEvent *)self hasSharedUser];
  v16[2] = v4;
  v15[3] = @"percentageOfParticipantsHaveAccepted";
  v5 = [(HMDUserCloudShareOwnerAdoptionDailyEvent *)self percentageOfParticipantsHaveAccepted];
  v16[3] = v5;
  v15[4] = @"percentageOfParticipantsHaveCloudShareIDAndHaveAccepted";
  v6 = [(HMDUserCloudShareOwnerAdoptionDailyEvent *)self percentageOfParticipantsHaveCloudShareIDAndHaveAccepted];
  v16[4] = v6;
  v15[5] = @"percentageOfParticipantsHaveCloudShareIDButNotAccepted";
  v7 = [(HMDUserCloudShareOwnerAdoptionDailyEvent *)self percentageOfParticipantsHaveCloudShareIDButNotAccepted];
  v16[5] = v7;
  v15[6] = @"percentageOfNonAcceptedParticipantsWithKnownCapability";
  v8 = [(HMDUserCloudShareOwnerAdoptionDailyEvent *)self percentageOfNonAcceptedParticipantsWithKnownCapability];
  v16[6] = v8;
  v15[7] = @"percentageOfUsersThatAreNotParticipant";
  v9 = [(HMDUserCloudShareOwnerAdoptionDailyEvent *)self percentageOfUsersThatAreNotParticipant];
  v16[7] = v9;
  v15[8] = @"percentageOfParticipatingUsersThatNotAccepted";
  v10 = [(HMDUserCloudShareOwnerAdoptionDailyEvent *)self percentageOfParticipatingUsersThatNotAccepted];
  v16[8] = v10;
  v15[9] = @"percentageOfAcceptedParticipantsWithoutCloudShareID";
  v11 = [(HMDUserCloudShareOwnerAdoptionDailyEvent *)self percentageOfAcceptedParticipantsWithoutCloudShareID];
  v16[9] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:10];

  return (NSDictionary *)v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.trustManager.adoption.owner";
}

- (HMDUserCloudShareOwnerAdoptionDailyEvent)initWithConfigureState:(int64_t)a3 isPrimaryResident:(BOOL)a4 trustStatusCounts:(CloudShareTrustManagerTrustStatusCounts *)a5
{
  BOOL v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)HMDUserCloudShareOwnerAdoptionDailyEvent;
  v8 = [(HMMLogEvent *)&v30 init];
  if (v8)
  {
    uint64_t v9 = [NSNumber numberWithInteger:a3];
    configureState = v8->_configureState;
    v8->_configureState = (NSNumber *)v9;

    uint64_t v11 = [NSNumber numberWithBool:v6];
    isPrimaryResident = v8->_isPrimaryResident;
    v8->_isPrimaryResident = (NSNumber *)v11;

    uint64_t v13 = [NSNumber numberWithInteger:a5->var0];
    hasSharedUser = v8->_hasSharedUser;
    v8->_hasSharedUser = (NSNumber *)v13;

    uint64_t v15 = [NSNumber numberWithUnsignedInteger:a5->var1];
    percentageOfParticipantsHaveAccepted = v8->_percentageOfParticipantsHaveAccepted;
    v8->_percentageOfParticipantsHaveAccepted = (NSNumber *)v15;

    uint64_t v17 = [NSNumber numberWithUnsignedInteger:a5->var2];
    percentageOfParticipantsHaveCloudShareIDAndHaveAccepted = v8->_percentageOfParticipantsHaveCloudShareIDAndHaveAccepted;
    v8->_percentageOfParticipantsHaveCloudShareIDAndHaveAccepted = (NSNumber *)v17;

    uint64_t v19 = [NSNumber numberWithUnsignedInteger:a5->var3];
    percentageOfParticipantsHaveCloudShareIDButNotAccepted = v8->_percentageOfParticipantsHaveCloudShareIDButNotAccepted;
    v8->_percentageOfParticipantsHaveCloudShareIDButNotAccepted = (NSNumber *)v19;

    uint64_t v21 = [NSNumber numberWithUnsignedInteger:a5->var4];
    percentageOfNonAcceptedParticipantsWithKnownCapability = v8->_percentageOfNonAcceptedParticipantsWithKnownCapability;
    v8->_percentageOfNonAcceptedParticipantsWithKnownCapability = (NSNumber *)v21;

    uint64_t v23 = [NSNumber numberWithUnsignedInteger:a5->var5];
    percentageOfUsersThatAreNotParticipant = v8->_percentageOfUsersThatAreNotParticipant;
    v8->_percentageOfUsersThatAreNotParticipant = (NSNumber *)v23;

    uint64_t v25 = [NSNumber numberWithUnsignedInteger:a5->var6];
    percentageOfParticipatingUsersThatNotAccepted = v8->_percentageOfParticipatingUsersThatNotAccepted;
    v8->_percentageOfParticipatingUsersThatNotAccepted = (NSNumber *)v25;

    uint64_t v27 = [NSNumber numberWithUnsignedInteger:a5->var7];
    percentageOfAcceptedParticipantsWithoutCloudShareID = v8->_percentageOfAcceptedParticipantsWithoutCloudShareID;
    v8->_percentageOfAcceptedParticipantsWithoutCloudShareID = (NSNumber *)v27;
  }
  return v8;
}

@end