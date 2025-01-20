@interface HMAccessory(HFUserNotificationServiceSettings)
- (HFUserNotificationServiceSettings)hf_userNotificationSettings;
- (id)_audioAnalysisEventBulletinNotifications;
- (id)hf_updateUserNotificationSettings:()HFUserNotificationServiceSettings;
@end

@implementation HMAccessory(HFUserNotificationServiceSettings)

- (id)_audioAnalysisEventBulletinNotifications
{
  v2 = objc_opt_new();
  v3 = objc_msgSend(a1, "_hf_audioAnalysisEventBulletinBoardNotification");
  objc_msgSend(v2, "na_safeAddObject:", v3);

  v4 = (void *)[v2 copy];
  return v4;
}

- (HFUserNotificationServiceSettings)hf_userNotificationSettings
{
  v2 = [a1 bulletinBoardNotificationByEndpoint];

  v3 = [HFUserNotificationServiceSettings alloc];
  if (v2)
  {
    v4 = [a1 bulletinBoardNotificationByEndpoint];
    v5 = [v4 allValues];
    v6 = [(HFUserNotificationServiceSettings *)v3 initWithBulletinBoardNotifications:v5];
  }
  else
  {
    v4 = [a1 _audioAnalysisEventBulletinNotifications];
    v6 = [(HFUserNotificationServiceSettings *)v3 initWithBulletinBoardNotifications:v4];
  }

  return v6;
}

- (id)hf_updateUserNotificationSettings:()HFUserNotificationServiceSettings
{
  id v4 = a3;
  v5 = [a1 bulletinBoardNotificationByEndpoint];

  if (v5)
  {
    v6 = [a1 bulletinBoardNotificationByEndpoint];
    v7 = [v6 allValues];
    v8 = [v4 applySettingsToBulletinBoardNotifications:v7];
  }
  else
  {
    v9 = objc_msgSend(a1, "hf_userNotificationSettings");

    if (v9)
    {
      v6 = [a1 _audioAnalysisEventBulletinNotifications];
      [v4 applySettingsToBulletinBoardNotifications:v6];
    }
    else
    {
      v10 = (void *)MEMORY[0x263F58190];
      v6 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 32);
      [v10 futureWithError:v6];
    v8 = };
  }

  return v8;
}

@end