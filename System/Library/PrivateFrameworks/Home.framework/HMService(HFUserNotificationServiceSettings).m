@interface HMService(HFUserNotificationServiceSettings)
- (HFUserNotificationServiceSettings)hf_userNotificationSettings;
- (id)hf_updateUserNotificationSettings:()HFUserNotificationServiceSettings;
@end

@implementation HMService(HFUserNotificationServiceSettings)

- (HFUserNotificationServiceSettings)hf_userNotificationSettings
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [a1 bulletinBoardNotification];

  if (v2)
  {
    v3 = [HFUserNotificationServiceSettings alloc];
    v4 = [a1 bulletinBoardNotification];
    v8[0] = v4;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    v6 = [(HFUserNotificationServiceSettings *)v3 initWithBulletinBoardNotifications:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)hf_updateUserNotificationSettings:()HFUserNotificationServiceSettings
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(a1, "hf_userNotificationSettings");

  if (v5)
  {
    v6 = [a1 bulletinBoardNotification];
    v11[0] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    v8 = [v4 applySettingsToBulletinBoardNotifications:v7];
  }
  else
  {
    v9 = (void *)MEMORY[0x263F58190];
    v6 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 32);
    v8 = [v9 futureWithError:v6];
  }

  return v8;
}

@end