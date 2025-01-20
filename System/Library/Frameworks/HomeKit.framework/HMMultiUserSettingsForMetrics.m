@interface HMMultiUserSettingsForMetrics
+ (id)logCategory;
+ (id)shortDescription;
- (HMMultiUserSettingsForMetrics)initWithNumSharedUsers:(int64_t)a3 numUsersWithSettings:(int64_t)a4 numUsersWithIdentifyVoiceOff:(int64_t)a5 numUsersWithPlayBackInfluencesForYouOff:(int64_t)a6 numUsersCloudShareTrustNotConfigured:(int64_t)a7 numUsersSharedBackingStoreNotStarted:(int64_t)a8 numUsersSharedBackingStoreRunning:(int64_t)a9 numUsersSharedBackingStoreNotRunningDueToError:(int64_t)a10 numUsersSharedBackingStoreNotRunningDueToStopped:(int64_t)a11 numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation:(int64_t)a12;
- (HMMultiUserSettingsForMetrics)initWithPayload:(id)a3;
- (NSNumber)numSharedUsers;
- (NSNumber)numUsersCloudShareTrustNotConfigured;
- (NSNumber)numUsersSharedBackingStoreNotRunningDueToError;
- (NSNumber)numUsersSharedBackingStoreNotRunningDueToStopped;
- (NSNumber)numUsersSharedBackingStoreNotStarted;
- (NSNumber)numUsersSharedBackingStoreRunning;
- (NSNumber)numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation;
- (NSNumber)numUsersWithIdentifyVoiceOff;
- (NSNumber)numUsersWithPlayBackInfluencesForYouOff;
- (NSNumber)numUsersWithSettings;
- (NSString)description;
- (NSString)shortDescription;
- (id)payloadCopy;
- (unint64_t)hash;
- (void)setNumSharedUsers:(id)a3;
- (void)setNumUsersCloudShareTrustNotConfigured:(id)a3;
- (void)setNumUsersSharedBackingStoreNotRunningDueToError:(id)a3;
- (void)setNumUsersSharedBackingStoreNotRunningDueToStopped:(id)a3;
- (void)setNumUsersSharedBackingStoreNotStarted:(id)a3;
- (void)setNumUsersSharedBackingStoreRunning:(id)a3;
- (void)setNumUsersSharedBackingStoreSharedZoneWaitingForShareInvitation:(id)a3;
- (void)setNumUsersWithIdentifyVoiceOff:(id)a3;
- (void)setNumUsersWithPlayBackInfluencesForYouOff:(id)a3;
- (void)setNumUsersWithSettings:(id)a3;
@end

@implementation HMMultiUserSettingsForMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation, 0);
  objc_storeStrong((id *)&self->_numUsersSharedBackingStoreNotRunningDueToStopped, 0);
  objc_storeStrong((id *)&self->_numUsersSharedBackingStoreNotRunningDueToError, 0);
  objc_storeStrong((id *)&self->_numUsersSharedBackingStoreRunning, 0);
  objc_storeStrong((id *)&self->_numUsersSharedBackingStoreNotStarted, 0);
  objc_storeStrong((id *)&self->_numUsersCloudShareTrustNotConfigured, 0);
  objc_storeStrong((id *)&self->_numUsersWithPlayBackInfluencesForYouOff, 0);
  objc_storeStrong((id *)&self->_numUsersWithIdentifyVoiceOff, 0);
  objc_storeStrong((id *)&self->_numUsersWithSettings, 0);

  objc_storeStrong((id *)&self->_numSharedUsers, 0);
}

- (void)setNumUsersSharedBackingStoreSharedZoneWaitingForShareInvitation:(id)a3
{
}

- (NSNumber)numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNumUsersSharedBackingStoreNotRunningDueToStopped:(id)a3
{
}

- (NSNumber)numUsersSharedBackingStoreNotRunningDueToStopped
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNumUsersSharedBackingStoreNotRunningDueToError:(id)a3
{
}

- (NSNumber)numUsersSharedBackingStoreNotRunningDueToError
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNumUsersSharedBackingStoreRunning:(id)a3
{
}

- (NSNumber)numUsersSharedBackingStoreRunning
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNumUsersSharedBackingStoreNotStarted:(id)a3
{
}

- (NSNumber)numUsersSharedBackingStoreNotStarted
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNumUsersCloudShareTrustNotConfigured:(id)a3
{
}

- (NSNumber)numUsersCloudShareTrustNotConfigured
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNumUsersWithPlayBackInfluencesForYouOff:(id)a3
{
}

- (NSNumber)numUsersWithPlayBackInfluencesForYouOff
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNumUsersWithIdentifyVoiceOff:(id)a3
{
}

- (NSNumber)numUsersWithIdentifyVoiceOff
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNumUsersWithSettings:(id)a3
{
}

- (NSNumber)numUsersWithSettings
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNumSharedUsers:(id)a3
{
}

- (NSNumber)numSharedUsers
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  return 0;
}

- (NSString)description
{
  v15 = NSString;
  v14 = [(HMMultiUserSettingsForMetrics *)self numSharedUsers];
  v3 = [(HMMultiUserSettingsForMetrics *)self numUsersWithSettings];
  v4 = [(HMMultiUserSettingsForMetrics *)self numUsersWithIdentifyVoiceOff];
  v5 = [(HMMultiUserSettingsForMetrics *)self numUsersWithPlayBackInfluencesForYouOff];
  v6 = [(HMMultiUserSettingsForMetrics *)self numUsersCloudShareTrustNotConfigured];
  v7 = [(HMMultiUserSettingsForMetrics *)self numUsersSharedBackingStoreNotStarted];
  v8 = [(HMMultiUserSettingsForMetrics *)self numUsersSharedBackingStoreRunning];
  v9 = [(HMMultiUserSettingsForMetrics *)self numUsersSharedBackingStoreNotRunningDueToError];
  v10 = [(HMMultiUserSettingsForMetrics *)self numUsersSharedBackingStoreNotRunningDueToStopped];
  v11 = [(HMMultiUserSettingsForMetrics *)self numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation];
  v12 = [v15 stringWithFormat:@"<HMMultiUserSettingsForMetrics> {\n            numSharedUsers: %@\n            numUsersWithSettings: %@\n            numUsersWithIdentifyVoiceOff: %@\n            numUsersWithPlayBackInfluencesForYouOff: %@\n            numUsersCloudShareTrustNotConfigured: %@\n            numUsersSharedBackingStoreNotStarted: %@\n            numUsersSharedBackingStoreRunning: %@\n            numUsersSharedBackingStoreNotRunningDueToError: %@\n            numUsersSharedBackingStoreNotRunningDueToStopped: %@\n            numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation: %@\n}", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)payloadCopy
{
  v16[10] = *MEMORY[0x1E4F143B8];
  v15[0] = @"numSharedUsers";
  v14 = [(HMMultiUserSettingsForMetrics *)self numSharedUsers];
  v16[0] = v14;
  v15[1] = @"numUsersWithSettings";
  v3 = [(HMMultiUserSettingsForMetrics *)self numUsersWithSettings];
  v16[1] = v3;
  v15[2] = @"numUsersCloudShareTrustNotConfigured";
  v4 = [(HMMultiUserSettingsForMetrics *)self numUsersCloudShareTrustNotConfigured];
  v16[2] = v4;
  v15[3] = @"numUsersWithIdentifyVoiceOff";
  v5 = [(HMMultiUserSettingsForMetrics *)self numUsersWithIdentifyVoiceOff];
  v16[3] = v5;
  v15[4] = @"numUsersWithPlayBackInfluencesForYouOff";
  v6 = [(HMMultiUserSettingsForMetrics *)self numUsersWithPlayBackInfluencesForYouOff];
  v16[4] = v6;
  v15[5] = @"numUsersSharedBackingStoreNotStarted";
  v7 = [(HMMultiUserSettingsForMetrics *)self numUsersSharedBackingStoreNotStarted];
  v16[5] = v7;
  v15[6] = @"numUsersSharedBackingStoreRunning";
  v8 = [(HMMultiUserSettingsForMetrics *)self numUsersSharedBackingStoreRunning];
  v16[6] = v8;
  v15[7] = @"numUsersSharedBackingStoreNotRunningDueToError";
  v9 = [(HMMultiUserSettingsForMetrics *)self numUsersSharedBackingStoreNotRunningDueToError];
  v16[7] = v9;
  v15[8] = @"numUsersSharedBackingStoreNotRunningDueToStopped";
  v10 = [(HMMultiUserSettingsForMetrics *)self numUsersSharedBackingStoreNotRunningDueToStopped];
  v16[8] = v10;
  v15[9] = @"numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation";
  v11 = [(HMMultiUserSettingsForMetrics *)self numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation];
  v16[9] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:10];

  return v12;
}

- (HMMultiUserSettingsForMetrics)initWithPayload:(id)a3
{
  id v3 = a3;
  v15 = objc_msgSend(v3, "hmf_numberForKey:", @"numSharedUsers");
  v14 = objc_msgSend(v3, "hmf_numberForKey:", @"numUsersWithSettings");
  v12 = objc_msgSend(v3, "hmf_numberForKey:", @"numUsersCloudShareTrustNotConfigured");
  v13 = objc_msgSend(v3, "hmf_numberForKey:", @"numUsersWithIdentifyVoiceOff");
  v11 = objc_msgSend(v3, "hmf_numberForKey:", @"numUsersWithPlayBackInfluencesForYouOff");
  v10 = objc_msgSend(v3, "hmf_numberForKey:", @"numUsersSharedBackingStoreNotStarted");
  v8 = objc_msgSend(v3, "hmf_numberForKey:", @"numUsersSharedBackingStoreRunning");
  v4 = objc_msgSend(v3, "hmf_numberForKey:", @"numUsersSharedBackingStoreNotRunningDueToError");
  v9 = objc_msgSend(v3, "hmf_numberForKey:", @"numUsersSharedBackingStoreNotRunningDueToStopped");
  v5 = objc_msgSend(v3, "hmf_numberForKey:", @"numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation");

  v6 = -[HMMultiUserSettingsForMetrics initWithNumSharedUsers:numUsersWithSettings:numUsersWithIdentifyVoiceOff:numUsersWithPlayBackInfluencesForYouOff:numUsersCloudShareTrustNotConfigured:numUsersSharedBackingStoreNotStarted:numUsersSharedBackingStoreRunning:numUsersSharedBackingStoreNotRunningDueToError:numUsersSharedBackingStoreNotRunningDueToStopped:numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation:](self, "initWithNumSharedUsers:numUsersWithSettings:numUsersWithIdentifyVoiceOff:numUsersWithPlayBackInfluencesForYouOff:numUsersCloudShareTrustNotConfigured:numUsersSharedBackingStoreNotStarted:numUsersSharedBackingStoreRunning:numUsersSharedBackingStoreNotRunningDueToError:numUsersSharedBackingStoreNotRunningDueToStopped:numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation:", (int)[v15 intValue], (int)objc_msgSend(v14, "intValue"), (int)objc_msgSend(v13, "intValue"), (int)objc_msgSend(v11, "intValue"), (int)objc_msgSend(v12, "intValue"), (int)objc_msgSend(v10, "intValue"), (int)objc_msgSend(v8, "intValue"), (int)objc_msgSend(v4, "intValue"), (int)objc_msgSend(v9, "intValue"), (int)objc_msgSend(v5, "intValue"));
  return v6;
}

- (HMMultiUserSettingsForMetrics)initWithNumSharedUsers:(int64_t)a3 numUsersWithSettings:(int64_t)a4 numUsersWithIdentifyVoiceOff:(int64_t)a5 numUsersWithPlayBackInfluencesForYouOff:(int64_t)a6 numUsersCloudShareTrustNotConfigured:(int64_t)a7 numUsersSharedBackingStoreNotStarted:(int64_t)a8 numUsersSharedBackingStoreRunning:(int64_t)a9 numUsersSharedBackingStoreNotRunningDueToError:(int64_t)a10 numUsersSharedBackingStoreNotRunningDueToStopped:(int64_t)a11 numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation:(int64_t)a12
{
  v40.receiver = self;
  v40.super_class = (Class)HMMultiUserSettingsForMetrics;
  v18 = [(HMMultiUserSettingsForMetrics *)&v40 init];
  if (v18)
  {
    uint64_t v19 = [NSNumber numberWithInteger:a3];
    numSharedUsers = v18->_numSharedUsers;
    v18->_numSharedUsers = (NSNumber *)v19;

    uint64_t v21 = [NSNumber numberWithInteger:a4];
    numUsersWithSettings = v18->_numUsersWithSettings;
    v18->_numUsersWithSettings = (NSNumber *)v21;

    uint64_t v23 = [NSNumber numberWithInteger:a5];
    numUsersWithIdentifyVoiceOff = v18->_numUsersWithIdentifyVoiceOff;
    v18->_numUsersWithIdentifyVoiceOff = (NSNumber *)v23;

    uint64_t v25 = [NSNumber numberWithInteger:a6];
    numUsersWithPlayBackInfluencesForYouOff = v18->_numUsersWithPlayBackInfluencesForYouOff;
    v18->_numUsersWithPlayBackInfluencesForYouOff = (NSNumber *)v25;

    uint64_t v27 = [NSNumber numberWithInteger:a7];
    numUsersCloudShareTrustNotConfigured = v18->_numUsersCloudShareTrustNotConfigured;
    v18->_numUsersCloudShareTrustNotConfigured = (NSNumber *)v27;

    uint64_t v29 = [NSNumber numberWithInteger:a8];
    numUsersSharedBackingStoreNotStarted = v18->_numUsersSharedBackingStoreNotStarted;
    v18->_numUsersSharedBackingStoreNotStarted = (NSNumber *)v29;

    uint64_t v31 = [NSNumber numberWithInteger:a9];
    numUsersSharedBackingStoreRunning = v18->_numUsersSharedBackingStoreRunning;
    v18->_numUsersSharedBackingStoreRunning = (NSNumber *)v31;

    uint64_t v33 = [NSNumber numberWithInteger:a10];
    numUsersSharedBackingStoreNotRunningDueToError = v18->_numUsersSharedBackingStoreNotRunningDueToError;
    v18->_numUsersSharedBackingStoreNotRunningDueToError = (NSNumber *)v33;

    uint64_t v35 = [NSNumber numberWithInteger:a11];
    numUsersSharedBackingStoreNotRunningDueToStopped = v18->_numUsersSharedBackingStoreNotRunningDueToStopped;
    v18->_numUsersSharedBackingStoreNotRunningDueToStopped = (NSNumber *)v35;

    uint64_t v37 = [NSNumber numberWithInteger:a12];
    numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation = v18->_numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation;
    v18->_numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation = (NSNumber *)v37;
  }
  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_43342 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_43342, &__block_literal_global_43343);
  }
  v2 = (void *)logCategory__hmf_once_v1_43344;

  return v2;
}

uint64_t __44__HMMultiUserSettingsForMetrics_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_43344;
  logCategory__hmf_once_v1_43344 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end