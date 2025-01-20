@interface HMDMultiUserSettingsLogEvent
- (HMDMultiUserSettingsLogEvent)initWithMultiUserSettings:(id)a3;
- (HMMultiUserSettingsForMetrics)multiUserSettings;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDMultiUserSettingsLogEvent

- (void).cxx_destruct
{
}

- (HMMultiUserSettingsForMetrics)multiUserSettings
{
  return (HMMultiUserSettingsForMetrics *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v16[10] = *MEMORY[0x263EF8340];
  v2 = [(HMDMultiUserSettingsLogEvent *)self multiUserSettings];
  v15[0] = @"numSharedUsers";
  v14 = [v2 numSharedUsers];
  v16[0] = v14;
  v15[1] = @"numUsersWithSettings";
  v13 = [v2 numUsersWithSettings];
  v16[1] = v13;
  v15[2] = @"numUsersWithIdentifyVoiceOff";
  v3 = [v2 numUsersWithIdentifyVoiceOff];
  v16[2] = v3;
  v15[3] = @"numUsersWithPlayBackInfluencesForYouOff";
  v4 = [v2 numUsersWithPlayBackInfluencesForYouOff];
  v16[3] = v4;
  v15[4] = @"numUsersCloudShareTrustNotConfigured";
  v5 = [v2 numUsersCloudShareTrustNotConfigured];
  v16[4] = v5;
  v15[5] = @"numUsersSharedBackingStoreNotStarted";
  v6 = [v2 numUsersSharedBackingStoreNotStarted];
  v16[5] = v6;
  v15[6] = @"numUsersSharedBackingStoreRunning";
  v7 = [v2 numUsersSharedBackingStoreRunning];
  v16[6] = v7;
  v15[7] = @"numUsersSharedBackingStoreNotRunningDueToError";
  v8 = [v2 numUsersSharedBackingStoreNotRunningDueToError];
  v16[7] = v8;
  v15[8] = @"numUsersSharedBackingStoreNotRunningDueToStopped";
  v9 = [v2 numUsersSharedBackingStoreNotRunningDueToStopped];
  v16[8] = v9;
  v15[9] = @"numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation";
  v10 = [v2 numUsersSharedBackingStoreSharedZoneWaitingForShareInvitation];
  v16[9] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:10];

  return (NSDictionary *)v11;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.HMDMultiUserSettingsLogEvent";
}

- (HMDMultiUserSettingsLogEvent)initWithMultiUserSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDMultiUserSettingsLogEvent;
  v6 = [(HMMLogEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_multiUserSettings, a3);
  }

  return v7;
}

@end