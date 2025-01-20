@interface AMSUserNotificationMetricsEvent
+ (id)_centerForBundleId:(id)a3;
+ (id)_propertyValueClassesForKnownProperties;
+ (id)_stringFromInteruptionLevel:(unint64_t)a3;
+ (id)eventForBadgingForMetricsDictionary:(id)a3 bundleID:(id)a4;
+ (id)eventForContentEngagementWithNotification:(id)a3;
+ (id)eventForPostedNotification:(id)a3;
+ (id)eventForSettingsChangedWithSettings:(id)a3 bundleID:(id)a4;
+ (id)eventForSettingsChangedWithSettings:(id)a3 bundleID:(id)a4 account:(id)a5;
+ (id)eventForVideoPlaybackForNotification:(id)a3;
+ (id)eventFromMetricsDictionary:(id)a3 centerBundleId:(id)a4;
+ (id)eventFromNotificationCenterSettings:(id)a3 centerBundleId:(id)a4;
- (AMSUserNotificationMetricsEvent)initWithTopic:(id)a3 settings:(id)a4 notificationSettingsForTopic:(id)a5 centerBundleId:(id)a6;
- (BOOL)postedSuccessfully;
- (NSString)displayScheduledTime;
- (NSString)errorDescription;
- (id)_createDisplayCriteriaFromSettings:(id)a3;
- (id)_stringFromNotificationSetting:(int64_t)a3;
- (void)setDisplayScheduledTime:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setPostedSuccessfully:(BOOL)a3;
@end

@implementation AMSUserNotificationMetricsEvent

- (AMSUserNotificationMetricsEvent)initWithTopic:(id)a3 settings:(id)a4 notificationSettingsForTopic:(id)a5 centerBundleId:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v36.receiver = self;
  v36.super_class = (Class)AMSUserNotificationMetricsEvent;
  v13 = [(AMSMetricsEvent *)&v36 initWithTopic:a3];
  v14 = v13;
  if (v13)
  {
    if (v12) {
      [(AMSMetricsEvent *)v13 setProperty:v12 forBodyKey:@"app"];
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v10)
    {
      [(AMSMetricsEvent *)v14 setEventVersion:&unk_1EDD01900];
      v16 = [(AMSUserNotificationMetricsEvent *)v14 _createDisplayCriteriaFromSettings:v10];
      [v15 addEntriesFromDictionary:v16];

      if (v11)
      {
        if ([v11 count])
        {
          v29 = v15;
          id v30 = v12;
          id v31 = v10;
          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v18 = [v11 keyEnumerator];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v33 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                v24 = [v11 objectForKeyedSubscript:v23];
                v25 = [(AMSUserNotificationMetricsEvent *)v14 _createDisplayCriteriaFromSettings:v24];
                [v17 setObject:v25 forKeyedSubscript:v23];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
            }
            while (v20);
          }

          id v15 = v29;
          [v29 setObject:v17 forKeyedSubscript:@"subsections"];

          id v12 = v30;
          id v10 = v31;
        }
      }
    }
    int64_t v26 = +[AMSRestrictions explicitContentSettingForBundleID:v12];
    if (v26 != -1)
    {
      if (v26 == 1) {
        v27 = @"explicit";
      }
      else {
        v27 = @"clean";
      }
      [v15 setObject:v27 forKeyedSubscript:@"explicitEnabled"];
    }
    [(AMSMetricsEvent *)v14 setProperty:v15 forBodyKey:@"displayCriteria"];
  }
  return v14;
}

+ (id)eventForBadgingForMetricsDictionary:(id)a3 bundleID:(id)a4
{
  v4 = [a1 eventFromMetricsDictionary:a3 centerBundleId:a4];
  [v4 setCheckDiagnosticsAndUsageSetting:1];
  [v4 setEventType:@"badgeRequest"];
  return v4;
}

+ (id)eventForPostedNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 metricsEvent];
  v6 = [v4 centerBundleIdentifier];
  v7 = [a1 eventFromMetricsDictionary:v5 centerBundleId:v6];

  uint64_t v8 = [v4 interruptionLevel];
  v9 = [a1 _stringFromInteruptionLevel:v8];
  [v7 setProperty:v9 forBodyKey:@"interruptionLevel"];

  return v7;
}

+ (id)eventForContentEngagementWithNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 metricsEvent];
  v6 = [v4 centerBundleIdentifier];
  v7 = [a1 eventFromMetricsDictionary:v5 centerBundleId:v6];

  [v7 setProperty:@"longpress" forBodyKey:@"gestureType"];
  [v7 setProperty:@"navigate" forBodyKey:@"actionType"];
  [v7 setProperty:@"notification" forBodyKey:@"targetType"];
  uint64_t v8 = [v4 interruptionLevel];

  v9 = [a1 _stringFromInteruptionLevel:v8];
  [v7 setProperty:v9 forBodyKey:@"interruptionLevel"];

  id v10 = [v7 propertyForBodyKey:@"displayCriteria"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  id v12 = (void *)[v11 mutableCopy];
  v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v15 = v14;

  [v7 setProperty:v15 forBodyKey:@"displayCriteria"];
  return v7;
}

+ (id)eventForSettingsChangedWithSettings:(id)a3 bundleID:(id)a4 account:(id)a5
{
  id v7 = a5;
  uint64_t v8 = +[AMSUserNotificationMetricsEvent eventFromNotificationCenterSettings:a3 centerBundleId:a4];
  [v8 setProperty:@"Settings" forBodyKey:@"pageType"];
  [v8 setProperty:@"Notifications" forBodyKey:@"pageContext"];
  [v8 setEventType:@"click"];
  if (v7)
  {
    if ((objc_msgSend(v7, "ams_isLocalAccount") & 1) == 0)
    {
      v9 = objc_msgSend(v7, "ams_DSID");

      if (v9)
      {
        id v10 = objc_msgSend(v7, "ams_DSID");
        [v8 setProperty:v10 forBodyKey:@"dsId"];
      }
    }
  }

  return v8;
}

+ (id)eventForVideoPlaybackForNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 metricsEvent];
  v6 = [v4 centerBundleIdentifier];

  id v7 = [a1 eventFromMetricsDictionary:v5 centerBundleId:v6];

  [v7 setProperty:@"notification" forBodyKey:@"actionContext"];
  [v7 setProperty:@"play" forBodyKey:@"actionType"];
  [v7 setProperty:@"play" forBodyKey:@"targetId"];
  [v7 setProperty:@"button" forBodyKey:@"targetType"];
  return v7;
}

+ (id)eventFromMetricsDictionary:(id)a3 centerBundleId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:@"topic"];
  uint64_t v8 = +[AMSUserNotificationMetricsEvent _centerForBundleId:v6];
  v9 = [v8 notificationSettings];
  id v10 = [v8 notificationSettingsForTopics];
  id v11 = [[AMSUserNotificationMetricsEvent alloc] initWithTopic:v7 settings:v9 notificationSettingsForTopic:v10 centerBundleId:v6];

  if (v5) {
    [(AMSMetricsEvent *)v11 addPropertiesWithDictionary:v5];
  }

  return v11;
}

+ (id)eventFromNotificationCenterSettings:(id)a3 centerBundleId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[AMSUserNotificationMetricsEvent _centerForBundleId:v5];
  uint64_t v8 = [v7 notificationSettingsForTopics];
  v9 = [[AMSUserNotificationMetricsEvent alloc] initWithTopic:@"xp_amp_notifications" settings:v6 notificationSettingsForTopic:v8 centerBundleId:v5];

  return v9;
}

- (NSString)displayScheduledTime
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"displayScheduledTime"];
}

- (NSString)errorDescription
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"errorDescription"];
}

- (BOOL)postedSuccessfully
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"postedSuccessfully"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDisplayScheduledTime:(id)a3
{
}

- (void)setErrorDescription:(id)a3
{
}

- (void)setPostedSuccessfully:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"postedSuccessfully"];
}

+ (id)_centerForBundleId:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[AMSProcessInfo currentProcess];
    id v5 = [v4 bundleIdentifier];
    int v6 = [v3 isEqualToString:v5];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    }
    else
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v3];
    }
    uint64_t v8 = (void *)v7;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_createDisplayCriteriaFromSettings:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v6 = -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 alertSetting]);
  [v5 setObject:v6 forKeyedSubscript:@"alertSetting"];

  uint64_t v7 = -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 badgeSetting]);
  [v5 setObject:v7 forKeyedSubscript:@"badgeSetting"];

  uint64_t v8 = -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 carPlaySetting]);
  [v5 setObject:v8 forKeyedSubscript:@"carPlaySetting"];

  v9 = -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 criticalAlertSetting]);
  [v5 setObject:v9 forKeyedSubscript:@"criticalAlertSetting"];

  id v10 = -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 directMessagesSetting]);
  [v5 setObject:v10 forKeyedSubscript:@"directMessagesSetting"];

  id v11 = -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 lockScreenSetting]);
  [v5 setObject:v11 forKeyedSubscript:@"lockScreenSetting"];

  id v12 = -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 notificationCenterSetting]);
  [v5 setObject:v12 forKeyedSubscript:@"notificationCenterSetting"];

  v13 = -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 scheduledDeliverySetting]);
  [v5 setObject:v13 forKeyedSubscript:@"scheduledDeliverySetting"];

  id v14 = -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 soundSetting]);
  [v5 setObject:v14 forKeyedSubscript:@"soundSetting"];

  id v15 = -[AMSUserNotificationMetricsEvent _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 timeSensitiveSetting]);
  [v5 setObject:v15 forKeyedSubscript:@"timeSensitiveSetting"];

  unint64_t v16 = [v4 alertStyle];
  if (v16 > 2) {
    id v17 = &stru_1EDCA7308;
  }
  else {
    id v17 = off_1E55A8660[v16];
  }
  [v5 setObject:v17 forKeyedSubscript:@"alertStyle"];
  unint64_t v18 = [v4 authorizationStatus];
  if (v18 > 4) {
    uint64_t v19 = &stru_1EDCA7308;
  }
  else {
    uint64_t v19 = off_1E55A8678[v18];
  }
  [v5 setObject:v19 forKeyedSubscript:@"authorizationStatus"];
  unint64_t v20 = [v4 groupingSetting];
  if (v20 > 2) {
    uint64_t v21 = &stru_1EDCA7308;
  }
  else {
    uint64_t v21 = off_1E55A86A0[v20];
  }
  [v5 setObject:v21 forKeyedSubscript:@"groupingSetting"];
  if ([v4 providesAppNotificationSettings]) {
    v22 = @"yes";
  }
  else {
    v22 = @"no";
  }
  [v5 setObject:v22 forKeyedSubscript:@"providesAppNotificationSettings"];
  unint64_t v23 = [v4 showPreviewsSetting];
  if (v23 > 2) {
    v24 = &stru_1EDCA7308;
  }
  else {
    v24 = off_1E55A86B8[v23];
  }
  [v5 setObject:v24 forKeyedSubscript:@"showPreviewsSetting"];

  return v5;
}

+ (id)_stringFromInteruptionLevel:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"passive";
  }
  else {
    return off_1E55A86D0[a3 - 1];
  }
}

- (id)_stringFromNotificationSetting:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return &stru_1EDCA7308;
  }
  else {
    return off_1E55A86E8[a3];
  }
}

+ (id)_propertyValueClassesForKnownProperties
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"errorDescription";
  v9[0] = objc_opt_class();
  v8[1] = @"postedSuccessfully";
  v9[1] = objc_opt_class();
  v8[2] = @"displayScheduledTime";
  v9[2] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  id v4 = (void *)[v3 mutableCopy];

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AMSUserNotificationMetricsEvent;
  id v5 = objc_msgSendSuper2(&v7, sel__propertyValueClassesForKnownProperties);
  [v4 addEntriesFromDictionary:v5];

  return v4;
}

+ (id)eventForSettingsChangedWithSettings:(id)a3 bundleID:(id)a4
{
  return (id)[a1 eventForSettingsChangedWithSettings:a3 bundleID:a4 account:0];
}

@end