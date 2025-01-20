@interface HMCameraProfile(HFUserNotificationServiceSettings)
- (HFUserNotificationServiceSettings)hf_userNotificationSettings;
- (id)_hf_doorbellBulletinNotification;
- (id)_hf_legacyMotionSensorBulletinNotification;
- (id)_hf_smartDetectionBulletinNotification;
- (id)hf_bulletinNotifications;
- (id)hf_updateUserNotificationSettings:()HFUserNotificationServiceSettings;
@end

@implementation HMCameraProfile(HFUserNotificationServiceSettings)

- (id)_hf_doorbellBulletinNotification
{
  v1 = [a1 accessory];
  v2 = objc_msgSend(v1, "hf_serviceOfType:", *MEMORY[0x263F0D6C0]);
  v3 = [v2 bulletinBoardNotification];

  return v3;
}

- (id)_hf_legacyMotionSensorBulletinNotification
{
  v1 = [a1 accessory];
  v2 = objc_msgSend(v1, "hf_serviceOfType:", *MEMORY[0x263F0D7A8]);
  v3 = [v2 bulletinBoardNotification];

  return v3;
}

- (id)_hf_smartDetectionBulletinNotification
{
  v1 = [a1 userSettings];
  v2 = [v1 smartNotificationBulletin];

  return v2;
}

- (id)hf_bulletinNotifications
{
  v2 = objc_opt_new();
  v3 = objc_msgSend(a1, "_hf_legacyMotionSensorBulletinNotification");
  objc_msgSend(v2, "na_safeAddObject:", v3);

  v4 = objc_msgSend(a1, "_hf_smartDetectionBulletinNotification");
  objc_msgSend(v2, "na_safeAddObject:", v4);

  v5 = objc_msgSend(a1, "_hf_doorbellBulletinNotification");
  objc_msgSend(v2, "na_safeAddObject:", v5);

  return v2;
}

- (HFUserNotificationServiceSettings)hf_userNotificationSettings
{
  v2 = [HFUserNotificationServiceSettings alloc];
  v3 = objc_msgSend(a1, "hf_bulletinNotifications");
  v4 = [(HFUserNotificationServiceSettings *)v2 initWithBulletinBoardNotifications:v3];

  return v4;
}

- (id)hf_updateUserNotificationSettings:()HFUserNotificationServiceSettings
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hf_userNotificationSettings");

  if (v5)
  {
    v6 = objc_msgSend(a1, "hf_bulletinNotifications");
    [v4 applySettingsToBulletinBoardNotifications:v6];
  }
  else
  {
    v7 = (void *)MEMORY[0x263F58190];
    v6 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 32);
    [v7 futureWithError:v6];
  v8 = };

  return v8;
}

@end