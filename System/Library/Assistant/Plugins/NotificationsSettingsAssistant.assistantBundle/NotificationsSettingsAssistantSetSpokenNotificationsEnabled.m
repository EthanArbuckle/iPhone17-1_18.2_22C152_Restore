@interface NotificationsSettingsAssistantSetSpokenNotificationsEnabled
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation NotificationsSettingsAssistantSetSpokenNotificationsEnabled

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  v6 = (void (**)(id, id))a3;
  id v7 = a4;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_3454;
  v37 = sub_3464;
  id v38 = 0;
  id v8 = objc_alloc_init((Class)BBSettingsGateway);
  if ([(NotificationsSettingsAssistantSetSpokenNotificationsEnabled *)self value]) {
    id v9 = &dword_0 + 3;
  }
  else {
    id v9 = &dword_0 + 1;
  }
  if ([(NotificationsSettingsAssistantSetSpokenNotificationsEnabled *)self value]) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  v11 = [(NotificationsSettingsAssistantSetSpokenNotificationsEnabled *)self timeToReEnable];

  if (v11)
  {
    v12 = [(NotificationsSettingsAssistantSetSpokenNotificationsEnabled *)self appBundleId];

    +[AFPreferences sharedPreferences];
    if (v12) {
      v13 = {;
    }
      v14 = [(NotificationsSettingsAssistantSetSpokenNotificationsEnabled *)self appBundleId];
      v15 = [(NotificationsSettingsAssistantSetSpokenNotificationsEnabled *)self timeToReEnable];
      [v13 setSpokenNotificationTemporarilyDisabledForApp:v14 until:v15];
    }
    else {
      v13 = {;
    }
      v14 = [(NotificationsSettingsAssistantSetSpokenNotificationsEnabled *)self timeToReEnable];
      [v13 setSpokenNotificationTemporarilyDisabledUntil:v14];
    }

    id v22 = objc_alloc_init((Class)SACommandSucceeded);
    v23 = (void *)v34[5];
    v34[5] = (uint64_t)v22;

    id v18 = [(id)v34[5] dictionary];
    v6[2](v6, v18);
  }
  else
  {
    v16 = [(NotificationsSettingsAssistantSetSpokenNotificationsEnabled *)self appBundleId];

    if (v16)
    {
      v17 = [(NotificationsSettingsAssistantSetSpokenNotificationsEnabled *)self appBundleId];
      id v18 = [v8 sectionInfoForSectionID:v17];

      if (v18)
      {
        v19 = [v18 sectionID];
        if ([v18 announceSetting] == v9)
        {
          id v20 = objc_alloc((Class)SACommandFailed);
          id v21 = [v20 initWithErrorCode:SASettingValueUnchangedErrorCode];
        }
        else
        {
          [v18 setAnnounceSetting:v9];
          [v8 setSectionInfo:v18 forSectionID:v19];
          id v21 = objc_alloc_init((Class)SACommandSucceeded);
        }
        v25 = (void *)v34[5];
        v34[5] = (uint64_t)v21;
      }
      else
      {
        id v24 = objc_alloc_init((Class)SACommandFailed);
        v19 = (void *)v34[5];
        v34[5] = (uint64_t)v24;
      }

      v26 = [(id)v34[5] dictionary];
      v6[2](v6, v26);
    }
    else
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_346C;
      v27[3] = &unk_4110;
      v31 = &v33;
      uint64_t v32 = v10;
      id v28 = v8;
      v29 = self;
      v30 = v6;
      [v28 getEffectiveGlobalSpokenNotificationSettingWithCompletion:v27];

      id v18 = v28;
    }
  }

  _Block_object_dispose(&v33, 8);
}

@end