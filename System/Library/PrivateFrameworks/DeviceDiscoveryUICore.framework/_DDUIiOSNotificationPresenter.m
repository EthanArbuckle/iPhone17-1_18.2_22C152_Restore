@interface _DDUIiOSNotificationPresenter
- (BOOL)_applicationSupportsServiceIdentifier:(id)a3 serviceIdentifier:(id)a4;
- (BOOL)setup;
- (FBSOpenApplicationService)openApplicationService;
- (OS_dispatch_source)clearNotificationTimer;
- (SFWirelessSettingsController)wirelessSettingsController;
- (UNUserNotificationCenter)notificationCenter;
- (_DDUINotificationPresenterDelegate)delegate;
- (_DDUIiOSNotificationPresenter)init;
- (_DDUIiOSNotificationPresenter)initWithNotificationCenter:(id)a3 applicationRecordVendor:(id)a4 openApplicationService:(id)a5;
- (_DDUIiOSNotificationPresenterApplicationRecordVendor)applicationRecordVendor;
- (_DDUIiOSPresentedNotification)presentedNotification;
- (id)_createAppStoreNotification:(id)a3;
- (id)_createConnectNotificationWithDeviceName:(id)a3 appName:(id)a4;
- (id)_createContinuityCameraNotificationWithDeviceName:(id)a3;
- (void)_clearNotificationTimeout;
- (void)_clearPresentedNotificationIfNeeded;
- (void)_configureNotificationTimeout;
- (void)_handleContinuityCameraDisabledAlertResponseWithState:(int64_t)a3;
- (void)_setupIfNeeded;
- (void)_showContinuityCameraDisabledAlertWithState:(int64_t)a3;
- (void)dismissNotificationWithIdentifier:(id)a3;
- (void)setApplicationRecordVendor:(id)a3;
- (void)setClearNotificationTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setOpenApplicationService:(id)a3;
- (void)setPresentedNotification:(id)a3;
- (void)setSetup:(BOOL)a3;
- (void)setWirelessSettingsController:(id)a3;
- (void)showContinuityCameraConfirmation:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)showNotificationForApplication:(id)a3 deviceName:(id)a4 identifier:(id)a5 completion:(id)a6;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation _DDUIiOSNotificationPresenter

- (_DDUIiOSNotificationPresenter)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.UserNotifications.DeviceDiscoveryUIAgent"];
  uint64_t v4 = objc_opt_class();
  v5 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
  v6 = [(_DDUIiOSNotificationPresenter *)self initWithNotificationCenter:v3 applicationRecordVendor:v4 openApplicationService:v5];

  return v6;
}

- (_DDUIiOSNotificationPresenter)initWithNotificationCenter:(id)a3 applicationRecordVendor:(id)a4 openApplicationService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_DDUIiOSNotificationPresenter;
  v12 = [(_DDUIiOSNotificationPresenter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_notificationCenter, a3);
    objc_storeStrong((id *)&v13->_applicationRecordVendor, a4);
    objc_storeStrong((id *)&v13->_openApplicationService, a5);
  }

  return v13;
}

- (void)_setupIfNeeded
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (![(_DDUIiOSNotificationPresenter *)self setup])
  {
    v3 = [(_DDUIiOSNotificationPresenter *)self notificationCenter];
    [v3 setDelegate:self];

    uint64_t v4 = [(_DDUIiOSNotificationPresenter *)self notificationCenter];
    [v4 setWantsNotificationResponsesDelivered];

    v5 = [(_DDUIiOSNotificationPresenter *)self notificationCenter];
    [v5 requestAuthorizationWithOptions:4 completionHandler:&__block_literal_global_2];

    v27 = DDUICoreLocalizedString(@"LAUNCH_APPLICTION");
    v25 = DDUICoreLocalizedString(@"LAUNCH_APP_STORE");
    v6 = DDUICoreLocalizedString(@"CONTINUITYCAMERA_ACCEPT");
    v7 = DDUICoreLocalizedString(@"CONTINUITYCAMERA_DECLINE");
    v26 = [MEMORY[0x1E4F445D8] actionWithIdentifier:@"OPEN_APPLICATION" title:v27 options:1];
    v8 = (void *)MEMORY[0x1E4F44600];
    v30[0] = v26;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    v23 = [v8 categoryWithIdentifier:@"LAUNCH_CATEGORY" actions:v9 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];

    v24 = [MEMORY[0x1E4F445D8] actionWithIdentifier:@"OPEN_APP_STORE" title:v25 options:1];
    id v10 = (void *)MEMORY[0x1E4F44600];
    v29 = v24;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
    v13 = [v10 categoryWithIdentifier:@"APP_STORE_CATEGORY" actions:v11 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];

    v14 = [MEMORY[0x1E4F445D8] actionWithIdentifier:@"CONTINUITYCAPTURE_ACCEPT" title:v6 options:1];
    objc_super v15 = [MEMORY[0x1E4F445D8] actionWithIdentifier:@"CONTINUITYCAPTURE_DECLINE" title:v7 options:1];
    v16 = (void *)MEMORY[0x1E4F44600];
    v28[0] = v14;
    v28[1] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v18 = [v16 categoryWithIdentifier:@"CONTINUITYCAPTURE_CATEGORY" actions:v17 intentIdentifiers:v12 options:0];

    v19 = [(_DDUIiOSNotificationPresenter *)self notificationCenter];
    v20 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v23, v13, v18, 0);
    [v19 setNotificationCategories:v20];

    v21 = (SFWirelessSettingsController *)objc_alloc_init(MEMORY[0x1E4F9F718]);
    wirelessSettingsController = self->_wirelessSettingsController;
    self->_wirelessSettingsController = v21;

    [(_DDUIiOSNotificationPresenter *)self setSetup:1];
  }
}

- (void)dismissNotificationWithIdentifier:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];

  if (v4)
  {
    v5 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];
    v6 = [v5 notificationID];
    v7 = [v9 UUIDString];
    int v8 = [v6 isEqualToString:v7];

    if (v8) {
      [(_DDUIiOSNotificationPresenter *)self _clearPresentedNotificationIfNeeded];
    }
  }
}

- (void)showNotificationForApplication:(id)a3 deviceName:(id)a4 identifier:(id)a5 completion:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, uint64_t))a6;
  v14 = [(_DDUIiOSNotificationPresenter *)self applicationRecordVendor];
  objc_super v15 = [v10 applicationID];
  v16 = [v14 bundleRecordWithApplicationIdentifier:v15 error:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = v16;
    v18 = [v10 serviceIdentifier];
    BOOL v19 = [(_DDUIiOSNotificationPresenter *)self _applicationSupportsServiceIdentifier:v17 serviceIdentifier:v18];

    if (!v19)
    {
      [(_DDUIiOSNotificationPresenter *)self _clearPresentedNotificationIfNeeded];
      v13[2](v13, 4);

      goto LABEL_17;
    }
    id v33 = v11;
    if (v17
      && ([v17 iTunesMetadata],
          v20 = objc_claimAutoreleasedReturnValue(),
          uint64_t v21 = [v20 storeItemIdentifier],
          uint64_t v22 = [v10 adamID],
          v20,
          v21 == v22))
    {
      v23 = [v17 localizedName];
      v24 = [(_DDUIiOSNotificationPresenter *)self _createConnectNotificationWithDeviceName:v11 appName:v23];
      char v25 = 0;
    }
    else
    {
      v13[2](v13, 3);
      v23 = [v10 appName];
      v24 = [(_DDUIiOSNotificationPresenter *)self _createAppStoreNotification:v23];
      char v25 = 1;
    }

    v27 = _DDUICoreLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v10;
      __int16 v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_1CFC71000, v27, OS_LOG_TYPE_DEFAULT, "Posting app launch request notification {applicationInfo: %@, applicationRecord: %@}", buf, 0x16u);
    }
  }
  else
  {
    id v33 = v11;
    v13[2](v13, 3);
    v26 = [v10 appName];
    v24 = [(_DDUIiOSNotificationPresenter *)self _createAppStoreNotification:v26];

    v17 = _DDUICoreLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v10;
      __int16 v39 = 2112;
      v40 = v16;
      _os_log_impl(&dword_1CFC71000, v17, OS_LOG_TYPE_DEFAULT, "Posting app not installed notification {applicationInfo: %@, bundleRecord: %@}", buf, 0x16u);
    }
    char v25 = 1;
  }

  [(_DDUIiOSNotificationPresenter *)self _setupIfNeeded];
  [(_DDUIiOSNotificationPresenter *)self _clearPresentedNotificationIfNeeded];
  v28 = [v12 UUIDString];
  v29 = objc_alloc_init(_DDUIiOSPresentedNotification);
  [(_DDUIiOSPresentedNotification *)v29 setApplicationInfo:v10];
  [(_DDUIiOSPresentedNotification *)v29 setNotificationID:v28];
  if ((v25 & 1) == 0) {
    [(_DDUIiOSPresentedNotification *)v29 setCompletion:v13];
  }
  v30 = objc_msgSend(MEMORY[0x1E4F44628], "requestWithIdentifier:content:trigger:", v28, v24, 0, v33);
  v31 = [(_DDUIiOSNotificationPresenter *)self notificationCenter];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __97___DDUIiOSNotificationPresenter_showNotificationForApplication_deviceName_identifier_completion___block_invoke;
  v35[3] = &unk_1E685FDA8;
  id v36 = v28;
  id v32 = v28;
  [v31 addNotificationRequest:v30 withCompletionHandler:v35];

  [(_DDUIiOSNotificationPresenter *)self setPresentedNotification:v29];
  [(_DDUIiOSNotificationPresenter *)self _configureNotificationTimeout];

  id v11 = v34;
LABEL_17:
}

- (void)showContinuityCameraConfirmation:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(_DDUIiOSNotificationPresenter *)self _setupIfNeeded];
  [(_DDUIiOSNotificationPresenter *)self _clearPresentedNotificationIfNeeded];
  id v11 = [v10 name];
  id v12 = [(_DDUIiOSNotificationPresenter *)self _createContinuityCameraNotificationWithDeviceName:v11];

  v13 = [v9 UUIDString];

  v14 = objc_alloc_init(_DDUIiOSPresentedNotification);
  [(_DDUIiOSPresentedNotification *)v14 setNotificationID:v13];
  [(_DDUIiOSPresentedNotification *)v14 setCompletion:v8];

  objc_super v15 = [v10 identifier];

  [(_DDUIiOSPresentedNotification *)v14 setRemoteDeviceIdentifier:v15];
  v16 = [MEMORY[0x1E4F44628] requestWithIdentifier:v13 content:v12 trigger:0];
  v17 = [(_DDUIiOSNotificationPresenter *)self notificationCenter];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88___DDUIiOSNotificationPresenter_showContinuityCameraConfirmation_identifier_completion___block_invoke;
  v19[3] = &unk_1E685FDA8;
  id v20 = v13;
  id v18 = v13;
  [v17 addNotificationRequest:v16 withCompletionHandler:v19];

  [(_DDUIiOSNotificationPresenter *)self setPresentedNotification:v14];
  [(_DDUIiOSNotificationPresenter *)self _configureNotificationTimeout];
}

- (BOOL)_applicationSupportsServiceIdentifier:(id)a3 serviceIdentifier:(id)a4
{
  id v5 = a4;
  v6 = DDUIFetchInfoPlistFromRecord(a3);
  v7 = [v6 advertisesByIdentifier];
  id v8 = [v7 objectForKeyedSubscript:v5];

  return v8 != 0;
}

- (void)_configureNotificationTimeout
{
  v3 = DDUICorePrimaryQueue();
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
  [(_DDUIiOSNotificationPresenter *)self setClearNotificationTimer:v4];

  id v5 = [(_DDUIiOSNotificationPresenter *)self clearNotificationTimer];
  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);

  v7 = [(_DDUIiOSNotificationPresenter *)self clearNotificationTimer];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __62___DDUIiOSNotificationPresenter__configureNotificationTimeout__block_invoke;
  handler[3] = &unk_1E685FA40;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);

  id v8 = [(_DDUIiOSNotificationPresenter *)self clearNotificationTimer];
  dispatch_resume(v8);
}

- (void)_clearNotificationTimeout
{
  v3 = [(_DDUIiOSNotificationPresenter *)self clearNotificationTimer];

  if (v3)
  {
    dispatch_source_t v4 = [(_DDUIiOSNotificationPresenter *)self clearNotificationTimer];
    dispatch_source_cancel(v4);

    [(_DDUIiOSNotificationPresenter *)self setClearNotificationTimer:0];
  }
}

- (void)_clearPresentedNotificationIfNeeded
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];

  if (v3)
  {
    [(_DDUIiOSNotificationPresenter *)self _clearNotificationTimeout];
    dispatch_source_t v4 = [(_DDUIiOSNotificationPresenter *)self notificationCenter];
    id v5 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];
    dispatch_time_t v6 = [v5 notificationID];
    v8[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v4 removeDeliveredNotificationsWithIdentifiers:v7];

    [(_DDUIiOSNotificationPresenter *)self setPresentedNotification:0];
  }
}

- (void)_handleContinuityCameraDisabledAlertResponseWithState:(int64_t)a3
{
  v3 = @"prefs:root=General";
  if (a3 == 1) {
    v3 = @"prefs:root=General&path=CONTINUITY_SPEC";
  }
  if (a3) {
    dispatch_source_t v4 = v3;
  }
  else {
    dispatch_source_t v4 = @"prefs:root=WIFI";
  }
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  dispatch_time_t v6 = dispatch_queue_create("RPOpenURL", 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87___DDUIiOSNotificationPresenter__handleContinuityCameraDisabledAlertResponseWithState___block_invoke;
  block[3] = &unk_1E685FA40;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)_showContinuityCameraDisabledAlertWithState:(int64_t)a3
{
  id v5 = DDUICorePrimaryQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77___DDUIiOSNotificationPresenter__showContinuityCameraDisabledAlertWithState___block_invoke;
  v6[3] = &unk_1E685FF30;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (id)_createConnectNotificationWithDeviceName:(id)a3 appName:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F445B0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setTitle:v7];

  id v9 = DDUICoreLocalizedString(@"CONNECT_IPHONE");
  id v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v6, 0);

  [v8 setBody:v10];
  id v11 = [MEMORY[0x1E4F44610] iconForSystemImageNamed:@"appletv.fill"];
  [v8 setIcon:v11];
  [v8 setCategoryIdentifier:@"LAUNCH_CATEGORY"];
  [v8 setShouldIgnoreDoNotDisturb:1];
  [v8 setShouldBackgroundDefaultAction:1];
  [v8 setShouldAuthenticateDefaultAction:1];

  return v8;
}

- (id)_createAppStoreNotification:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F445B0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = DDUICoreLocalizedString(@"APP_STORE_TITLE");
  [v5 setTitle:v6];

  id v7 = DDUICoreLocalizedString(@"APP_STORE_BODY");
  id v8 = objc_msgSend(NSString, "stringWithFormat:", v7, v4, 0);

  [v5 setBody:v8];
  id v9 = [MEMORY[0x1E4F44610] iconForSystemImageNamed:@"appletv.fill"];
  [v5 setIcon:v9];
  [v5 setCategoryIdentifier:@"APP_STORE_CATEGORY"];
  [v5 setShouldIgnoreDoNotDisturb:1];
  [v5 setShouldBackgroundDefaultAction:1];
  [v5 setShouldAuthenticateDefaultAction:1];

  return v5;
}

- (id)_createContinuityCameraNotificationWithDeviceName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  id v5 = DDUICoreLocalizedString(@"CONTINUITYCAMERA_TITLE");
  [v4 setTitle:v5];

  int DeviceClass = GestaltGetDeviceClass();
  if (DeviceClass == 3)
  {
    id v7 = @"CONNECT_CONTINUITYCAMERA_IPAD";
    goto LABEL_5;
  }
  if (DeviceClass == 1)
  {
    id v7 = @"CONNECT_CONTINUITYCAMERA_IPHONE";
LABEL_5:
    id v8 = DDUICoreLocalizedString(v7);
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  id v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v3);
  [v4 setBody:v9];

  id v10 = [MEMORY[0x1E4F44610] iconForSystemImageNamed:@"rectangle.inset.filled.and.camera"];
  [v4 setIcon:v10];
  id v11 = [MEMORY[0x1E4F44640] defaultSound];
  [v4 setSound:v11];

  [v4 setCategoryIdentifier:@"CONTINUITYCAPTURE_CATEGORY"];
  [v4 setShouldIgnoreDoNotDisturb:1];
  [v4 setShouldBackgroundDefaultAction:1];
  [v4 setShouldAuthenticateDefaultAction:1];
  [v4 setShouldSuppressDefaultAction:1];

  return v4;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];

  if (v9)
  {
    id v10 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];
    id v11 = [v10 notificationID];
    id v12 = [v7 notification];
    v13 = [v12 request];
    v14 = [v13 identifier];
    char v15 = [v11 isEqual:v14];

    if (v15)
    {
      v16 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];
      v17 = [v16 completion];

      id v18 = [v7 notification];
      BOOL v19 = [v18 request];
      id v20 = [v19 content];
      uint64_t v21 = [v20 categoryIdentifier];
      int v22 = [v21 isEqualToString:@"LAUNCH_CATEGORY"];

      if (v22)
      {
        v23 = _DDUICoreLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];
          char v25 = [v24 applicationInfo];
          v26 = [v25 bundleID];
          *(_DWORD *)buf = 138412290;
          id v61 = v26;
          _os_log_impl(&dword_1CFC71000, v23, OS_LOG_TYPE_DEFAULT, "Attempting to launch application %@", buf, 0xCu);
        }
        uint64_t v58 = *MEMORY[0x1E4F62688];
        uint64_t v59 = MEMORY[0x1E4F1CC38];
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        v28 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v27];
        v29 = [(_DDUIiOSNotificationPresenter *)self openApplicationService];
        v30 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];
        v31 = [v30 applicationInfo];
        id v32 = [v31 bundleID];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __109___DDUIiOSNotificationPresenter_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
        v56[3] = &unk_1E685FF58;
        id v57 = v17;
        [v29 openApplication:v32 withOptions:v28 completion:v56];

        goto LABEL_16;
      }
      v35 = [v7 notification];
      id v36 = [v35 request];
      v37 = [v36 content];
      id v38 = [v37 categoryIdentifier];
      int v39 = [v38 isEqualToString:@"APP_STORE_CATEGORY"];

      if (v39)
      {
        v27 = [(_DDUIiOSNotificationPresenter *)self delegate];
        v28 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];
        v40 = [v28 applicationInfo];
        [v27 deepLinkToAppStoreForApplication:v40];
LABEL_15:

LABEL_16:
LABEL_17:
        [(_DDUIiOSNotificationPresenter *)self _clearNotificationTimeout];
        [(_DDUIiOSNotificationPresenter *)self setPresentedNotification:0];
        v8[2](v8);

        goto LABEL_18;
      }
      uint64_t v41 = [v7 notification];
      v42 = [v41 request];
      v43 = [v42 content];
      v44 = [v43 categoryIdentifier];
      int v45 = [v44 isEqualToString:@"CONTINUITYCAPTURE_CATEGORY"];

      if (!v45) {
        goto LABEL_17;
      }
      v46 = _DDUICoreLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v61 = v7;
        _os_log_impl(&dword_1CFC71000, v46, OS_LOG_TYPE_DEFAULT, "Received Continuity Camera confirmation response: %@\n", buf, 0xCu);
      }

      v47 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];
      v27 = [v47 completion];

      v48 = [(_DDUIiOSNotificationPresenter *)self presentedNotification];
      v28 = [v48 remoteDeviceIdentifier];

      v49 = [v7 actionIdentifier];
      int v50 = [v49 isEqualToString:@"CONTINUITYCAPTURE_ACCEPT"];

      if (!v50)
      {
        v51 = [v7 actionIdentifier];
        int v52 = [v51 isEqualToString:@"CONTINUITYCAPTURE_DECLINE"];

        if (v52) {
          uint64_t v53 = 7;
        }
        else {
          uint64_t v53 = 2;
        }
        v27[2](v27, v53);
        goto LABEL_16;
      }
      v40 = +[_DDUIRemoteDisplaySessionHandler sharedInstance];
      if ([v40 isWifiStateOn])
      {
        if ([v40 isContinuityCaptureUserPreferenceEnabled])
        {
          [v40 enterSessionWithRemoteDeviceID:v28 reason:@"Phone accepted confirmation notification"];
          v27[2](v27, 1);
          goto LABEL_15;
        }
        v54 = self;
        uint64_t v55 = 1;
      }
      else
      {
        v54 = self;
        uint64_t v55 = 0;
      }
      [(_DDUIiOSNotificationPresenter *)v54 _showContinuityCameraDisabledAlertWithState:v55];
      v27[2](v27, 2);
      goto LABEL_15;
    }
    id v33 = _DDUICoreLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v34 = "Notification selected -- doesn't match presented ID, ignoring";
      goto LABEL_11;
    }
  }
  else
  {
    id v33 = _DDUICoreLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v34 = "Notification selected -- nothing should be presented, ignoring";
LABEL_11:
      _os_log_impl(&dword_1CFC71000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 2u);
    }
  }

  v8[2](v8);
LABEL_18:
}

- (_DDUINotificationPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_DDUINotificationPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)setup
{
  return self->_setup;
}

- (void)setSetup:(BOOL)a3
{
  self->_setup = a3;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (_DDUIiOSNotificationPresenterApplicationRecordVendor)applicationRecordVendor
{
  return self->_applicationRecordVendor;
}

- (void)setApplicationRecordVendor:(id)a3
{
}

- (FBSOpenApplicationService)openApplicationService
{
  return self->_openApplicationService;
}

- (void)setOpenApplicationService:(id)a3
{
}

- (SFWirelessSettingsController)wirelessSettingsController
{
  return self->_wirelessSettingsController;
}

- (void)setWirelessSettingsController:(id)a3
{
}

- (_DDUIiOSPresentedNotification)presentedNotification
{
  return self->_presentedNotification;
}

- (void)setPresentedNotification:(id)a3
{
}

- (OS_dispatch_source)clearNotificationTimer
{
  return self->_clearNotificationTimer;
}

- (void)setClearNotificationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearNotificationTimer, 0);
  objc_storeStrong((id *)&self->_presentedNotification, 0);
  objc_storeStrong((id *)&self->_wirelessSettingsController, 0);
  objc_storeStrong((id *)&self->_openApplicationService, 0);
  objc_storeStrong((id *)&self->_applicationRecordVendor, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end