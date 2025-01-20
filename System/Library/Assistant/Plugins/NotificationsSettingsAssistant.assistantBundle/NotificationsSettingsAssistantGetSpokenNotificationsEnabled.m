@interface NotificationsSettingsAssistantGetSpokenNotificationsEnabled
- (void)performWithCompletion:(id)a3;
@end

@implementation NotificationsSettingsAssistantGetSpokenNotificationsEnabled

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = objc_alloc_init((Class)SASettingGetBoolResponse);
  id v6 = objc_alloc_init((Class)SASettingBooleanEntity);
  [v5 setSetting:v6];
  id v7 = objc_alloc_init((Class)BBSettingsGateway);
  v8 = [(NotificationsSettingsAssistantGetSpokenNotificationsEnabled *)self appBundleId];

  if (v8)
  {
    v9 = [(NotificationsSettingsAssistantGetSpokenNotificationsEnabled *)self appBundleId];
    v10 = [v7 effectiveSectionInfoForSectionID:v9];

    if (v10)
    {
      unint64_t v11 = (unint64_t)[v10 announceSetting];
      if (v11 > 3)
      {
LABEL_8:
        v13 = [v5 dictionary];
        v4[2](v4, v13);

        goto LABEL_9;
      }
      uint64_t v12 = (0xCu >> (v11 & 0xF)) & 1;
    }
    else
    {
      uint64_t v12 = 0;
    }
    [v6 setValue:v12];
    goto LABEL_8;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_3048;
  v14[3] = &unk_40E8;
  id v15 = v6;
  v17 = v4;
  id v16 = v5;
  [v7 getEffectiveGlobalSpokenNotificationSettingWithCompletion:v14];

LABEL_9:
}

@end