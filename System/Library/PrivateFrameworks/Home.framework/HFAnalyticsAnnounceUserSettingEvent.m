@interface HFAnalyticsAnnounceUserSettingEvent
- (HFAnalyticsAnnounceUserSettingEvent)initWithData:(id)a3;
- (NSNumber)announceEnabledForUser;
- (NSNumber)announceSettingChangeFailed;
- (NSNumber)settingChangedByAdmin;
- (NSNumber)settingChangedByOwner;
- (NSNumber)settingChangedDuringOnboarding;
- (NSNumber)settingChangedForAdminUser;
- (NSNumber)settingChangedForCurrentUser;
- (NSNumber)settingChangedFromHomePodSettings;
- (NSNumber)settingChangedFromUserSettings;
- (NSString)processName;
- (id)payload;
- (void)setAnnounceEnabledForUser:(id)a3;
- (void)setAnnounceSettingChangeFailed:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setSettingChangedByAdmin:(id)a3;
- (void)setSettingChangedByOwner:(id)a3;
- (void)setSettingChangedDuringOnboarding:(id)a3;
- (void)setSettingChangedForAdminUser:(id)a3;
- (void)setSettingChangedForCurrentUser:(id)a3;
- (void)setSettingChangedFromHomePodSettings:(id)a3;
- (void)setSettingChangedFromUserSettings:(id)a3;
@end

@implementation HFAnalyticsAnnounceUserSettingEvent

- (HFAnalyticsAnnounceUserSettingEvent)initWithData:(id)a3
{
  id v4 = a3;
  id obj = [v4 objectForKeyedSubscript:@"announceIsEnabledForUser"];
  if (!obj) {
    NSLog(&cfstr_Hfanalyticsann_6.isa);
  }
  v5 = [v4 objectForKeyedSubscript:@"announceSettingChangedForCurrentUser"];
  if (!v5) {
    NSLog(&cfstr_Hfanalyticsann_7.isa);
  }
  v6 = [v4 objectForKeyedSubscript:@"announceSettingChangedEnabledForAdminUser"];
  if (!v6) {
    NSLog(&cfstr_Hfanalyticsann_8.isa);
  }
  v7 = [v4 objectForKeyedSubscript:@"announceSettingChangedByOwner"];
  if (!v7) {
    NSLog(&cfstr_Hfanalyticsann_0.isa);
  }
  v8 = [v4 objectForKeyedSubscript:@"announceSettingChangedByAdmin"];
  if (!v8) {
    NSLog(&cfstr_Hfanalyticsann_1.isa);
  }
  v9 = [v4 objectForKeyedSubscript:@"announceSettingChangedDuringOnboarding"];
  if (!v9) {
    NSLog(&cfstr_Hfanalyticsann_2.isa);
  }
  v10 = [v4 objectForKeyedSubscript:@"announceSettingChangedFromUserSettings"];
  if (!v10) {
    NSLog(&cfstr_Hfanalyticsann_3.isa);
  }
  v11 = [v4 objectForKeyedSubscript:@"announceSettingChangedFromHomePodSettings"];
  if (!v11) {
    NSLog(&cfstr_Hfanalyticsann_4.isa);
  }
  v12 = [v4 objectForKeyedSubscript:@"announceSettingChangeFailed"];
  if (!v12) {
    NSLog(&cfstr_Hfanalyticsann_5.isa);
  }
  v27.receiver = self;
  v27.super_class = (Class)HFAnalyticsAnnounceUserSettingEvent;
  v13 = [(HFAnalyticsEvent *)&v27 initWithEventType:21];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_announceEnabledForUser, obj);
    objc_storeStrong((id *)&v14->_settingChangedForCurrentUser, v5);
    objc_storeStrong((id *)&v14->_settingChangedForAdminUser, v6);
    objc_storeStrong((id *)&v14->_settingChangedByOwner, v7);
    objc_storeStrong((id *)&v14->_settingChangedByAdmin, v8);
    objc_storeStrong((id *)&v14->_settingChangedDuringOnboarding, v9);
    objc_storeStrong((id *)&v14->_settingChangedFromUserSettings, v10);
    objc_storeStrong((id *)&v14->_settingChangedFromHomePodSettings, v11);
    objc_storeStrong((id *)&v14->_announceSettingChangeFailed, v12);
    [MEMORY[0x263F08AB0] processInfo];
    v25 = v10;
    v15 = v9;
    v16 = v8;
    v17 = v7;
    v18 = v6;
    v19 = v5;
    v21 = v20 = v12;
    uint64_t v22 = [v21 processName];
    processName = v14->_processName;
    v14->_processName = (NSString *)v22;

    v12 = v20;
    v5 = v19;
    v6 = v18;
    v7 = v17;
    v8 = v16;
    v9 = v15;
    v10 = v25;
  }

  return v14;
}

- (id)payload
{
  v16.receiver = self;
  v16.super_class = (Class)HFAnalyticsAnnounceUserSettingEvent;
  v3 = [(HFAnalyticsEvent *)&v16 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsAnnounceUserSettingEvent *)self announceEnabledForUser];
  [v4 setObject:v5 forKeyedSubscript:@"intercomIsEnabledForUser"];

  v6 = [(HFAnalyticsAnnounceUserSettingEvent *)self settingChangedForCurrentUser];
  [v4 setObject:v6 forKeyedSubscript:@"intercomSettingChangedForCurrentUser"];

  v7 = [(HFAnalyticsAnnounceUserSettingEvent *)self settingChangedForAdminUser];
  [v4 setObject:v7 forKeyedSubscript:@"intercomSettingChangedForAdminUser"];

  v8 = [(HFAnalyticsAnnounceUserSettingEvent *)self settingChangedByOwner];
  [v4 setObject:v8 forKeyedSubscript:@"intercomSettingChangedByOwner"];

  v9 = [(HFAnalyticsAnnounceUserSettingEvent *)self settingChangedByAdmin];
  [v4 setObject:v9 forKeyedSubscript:@"intercomSettingChangedByAdmin"];

  v10 = [(HFAnalyticsAnnounceUserSettingEvent *)self settingChangedDuringOnboarding];
  [v4 setObject:v10 forKeyedSubscript:@"intercomSettingChangedDuringOnboarding"];

  v11 = [(HFAnalyticsAnnounceUserSettingEvent *)self settingChangedFromUserSettings];
  [v4 setObject:v11 forKeyedSubscript:@"intercomSettingChangedFromUserSettings"];

  v12 = [(HFAnalyticsAnnounceUserSettingEvent *)self settingChangedFromHomePodSettings];
  [v4 setObject:v12 forKeyedSubscript:@"intercomSettingChangedFromHomePodSettings"];

  v13 = [(HFAnalyticsAnnounceUserSettingEvent *)self announceSettingChangeFailed];
  [v4 setObject:v13 forKeyedSubscript:@"intercomSettingChangeFailed"];

  v14 = [(HFAnalyticsAnnounceUserSettingEvent *)self processName];
  [v4 setObject:v14 forKeyedSubscript:@"processName"];

  return v4;
}

- (NSNumber)announceEnabledForUser
{
  return self->_announceEnabledForUser;
}

- (void)setAnnounceEnabledForUser:(id)a3
{
}

- (NSNumber)settingChangedForCurrentUser
{
  return self->_settingChangedForCurrentUser;
}

- (void)setSettingChangedForCurrentUser:(id)a3
{
}

- (NSNumber)settingChangedForAdminUser
{
  return self->_settingChangedForAdminUser;
}

- (void)setSettingChangedForAdminUser:(id)a3
{
}

- (NSNumber)settingChangedByOwner
{
  return self->_settingChangedByOwner;
}

- (void)setSettingChangedByOwner:(id)a3
{
}

- (NSNumber)settingChangedByAdmin
{
  return self->_settingChangedByAdmin;
}

- (void)setSettingChangedByAdmin:(id)a3
{
}

- (NSNumber)settingChangedDuringOnboarding
{
  return self->_settingChangedDuringOnboarding;
}

- (void)setSettingChangedDuringOnboarding:(id)a3
{
}

- (NSNumber)settingChangedFromUserSettings
{
  return self->_settingChangedFromUserSettings;
}

- (void)setSettingChangedFromUserSettings:(id)a3
{
}

- (NSNumber)settingChangedFromHomePodSettings
{
  return self->_settingChangedFromHomePodSettings;
}

- (void)setSettingChangedFromHomePodSettings:(id)a3
{
}

- (NSNumber)announceSettingChangeFailed
{
  return self->_announceSettingChangeFailed;
}

- (void)setAnnounceSettingChangeFailed:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_announceSettingChangeFailed, 0);
  objc_storeStrong((id *)&self->_settingChangedFromHomePodSettings, 0);
  objc_storeStrong((id *)&self->_settingChangedFromUserSettings, 0);
  objc_storeStrong((id *)&self->_settingChangedDuringOnboarding, 0);
  objc_storeStrong((id *)&self->_settingChangedByAdmin, 0);
  objc_storeStrong((id *)&self->_settingChangedByOwner, 0);
  objc_storeStrong((id *)&self->_settingChangedForAdminUser, 0);
  objc_storeStrong((id *)&self->_settingChangedForCurrentUser, 0);
  objc_storeStrong((id *)&self->_announceEnabledForUser, 0);
}

@end