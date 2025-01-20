@interface CAMApplicationDelegate
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (CAMBurstController)burstController;
- (CAMCameraRollController)cameraRollController;
- (CAMIrisVideoController)irisVideoController;
- (CAMKeepAliveController)keepAliveController;
- (CAMLibrarySelectionController)librarySelectionController;
- (CAMLocationController)locationController;
- (CAMMotionController)motionController;
- (CAMNebulaDaemonProxyManager)nebulaDaemonProxyManager;
- (CAMPersistenceController)persistenceController;
- (CAMPowerController)powerController;
- (CAMProtectionController)protectionController;
- (CAMRemoteShutterController)remoteShutterController;
- (CAMSubsystems)subsystems;
- (CAMTimelapseController)timelapseController;
- (CAMViewfinderViewController)viewfinderViewController;
- (CUCaptureController)captureController;
- (UIWindow)window;
- (id)_userInfoForMode:(int64_t)a3 devicePosition:(int64_t)a4;
- (void)_requestAuthorizationForNotificationCenter:(id)a3;
- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)applicationDidEnterBackground:(id)a3;
- (void)prepareForDefaultImageSnapshotForScreen:(id)a3;
- (void)setSubsystems:(id)a3;
- (void)setWindow:(id)a3;
- (void)updateShortcutItemsForApplication:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CAMApplicationDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  CAMSignpostWithIDAndArgs(2, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  PLDebugEnableCoreDataMultithreadedAsserts();
  v8 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Camera launched.", buf, 2u);
  }

  v9 = [[CAMSubsystems alloc] initWithLaunchOptions:v7];
  [(CAMApplicationDelegate *)self setSubsystems:v9];
  id v10 = v6;
  [v10 _configureExtendedLaunchTestIfNeeded];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v12 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v13 = *MEMORY[0x263EF97C8];
  v14 = [MEMORY[0x263F08A48] mainQueue];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke;
  v48[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
  *(CFAbsoluteTime *)&v48[4] = Current;
  id v15 = (id)[v12 addObserverForName:v13 object:0 queue:v14 usingBlock:v48];

  v16 = [(CAMApplicationDelegate *)self viewfinderViewController];
  v17 = [MEMORY[0x263F82B60] mainScreen];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v18 = [v10 connectedScenes];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    v36 = v16;
    id v37 = v10;
    uint64_t v21 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v24 = [v23 screen];

          v17 = (void *)v24;
          goto LABEL_13;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v20) {
        continue;
      }
      break;
    }
LABEL_13:
    v16 = v36;
  }

  v25 = [CAMSecureWindow alloc];
  [v17 bounds];
  v26 = -[CAMSecureWindow initWithFrame:](v25, "initWithFrame:");
  [(CAMSecureWindow *)v26 setRootViewController:v16];
  [(CAMSecureWindow *)v26 makeKeyAndVisible];
  [(CAMApplicationDelegate *)self setWindow:v26];
  id v27 = +[CAMCaptureCapabilities capabilities];
  if ([v27 shouldEnableUserNotifications])
  {
    char v28 = [(id)*MEMORY[0x263F83300] launchedToTest];

    if (v28) {
      goto LABEL_18;
    }
    v29 = [MEMORY[0x263F1DFB0] currentNotificationCenter];
    [v29 setDelegate:self];
    uint64_t v38 = MEMORY[0x263EF8330];
    uint64_t v39 = 3221225472;
    v40 = __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_216;
    v41 = &unk_263FA6C68;
    v42 = self;
    id v43 = v29;
    id v27 = v29;
    [v27 getNotificationSettingsWithCompletionHandler:&v38];
  }
LABEL_18:
  v30 = objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x263F83360], v36, v37, v38, v39, v40, v41, v42);
  v31 = [v30 configurationRequest];
  v32 = [(CAMApplicationDelegate *)self viewfinderViewController];
  v33 = v32;
  if (v31) {
    objc_msgSend(v32, "generateOrUpdateAnalyticsSessionEventIfNeededWithCaptureMode:captureDevice:", objc_msgSend(v31, "requestedCaptureMode"), objc_msgSend(v31, "requestedCaptureDevice"));
  }
  else {
    [v32 generateAnalyticsSessionEventIfNeeded];
  }

  CAMSignpostWithIDAndArgs(3, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  BOOL v34 = [(CAMSubsystems *)v9 isConfiguredFromLaunchOptions];

  return !v34;
}

void __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 32);
    int v4 = 134217984;
    CFAbsoluteTime v5 = v3;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "Preview started %f seconds after launch", (uint8_t *)&v4, 0xCu);
  }
}

- (CAMTimelapseController)timelapseController
{
  return [(CAMSubsystems *)self->_subsystems timelapseController];
}

- (CUCaptureController)captureController
{
  return [(CAMSubsystems *)self->_subsystems captureController];
}

- (CAMPersistenceController)persistenceController
{
  return [(CAMSubsystems *)self->_subsystems persistenceController];
}

- (CAMViewfinderViewController)viewfinderViewController
{
  return [(CAMSubsystems *)self->_subsystems viewfinderViewController];
}

- (void)setWindow:(id)a3
{
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v9 = +[CAMUserPreferences preferences];
  int v4 = [v9 forceEnableQRBanners];
  [v9 setForceEnableQRBanners:0];
  if (v4 && ([v9 QRBannersEnabledInSettings] & 1) == 0)
  {
    CFAbsoluteTime v5 = [(CAMApplicationDelegate *)self viewfinderViewController];
    uint64_t v6 = [(CAMApplicationDelegate *)self viewfinderViewController];
    uint64_t v7 = [v6 currentCaptureMode];
    v8 = [(CAMApplicationDelegate *)self viewfinderViewController];
    objc_msgSend(v5, "changeToMode:device:", v7, objc_msgSend(v8, "currentCaptureDevice"));
  }
}

- (void)prepareForDefaultImageSnapshotForScreen:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMApplicationDelegate *)self viewfinderViewController];
  [v5 prepareForDefaultImageSnapshotForScreen:v4];
}

- (CAMCameraRollController)cameraRollController
{
  return [(CAMSubsystems *)self->_subsystems cameraRollController];
}

- (CAMMotionController)motionController
{
  return [(CAMSubsystems *)self->_subsystems motionController];
}

- (CAMLocationController)locationController
{
  return [(CAMSubsystems *)self->_subsystems locationController];
}

- (CAMPowerController)powerController
{
  return [(CAMSubsystems *)self->_subsystems powerController];
}

- (CAMBurstController)burstController
{
  return [(CAMSubsystems *)self->_subsystems burstController];
}

- (CAMKeepAliveController)keepAliveController
{
  return [(CAMSubsystems *)self->_subsystems keepAliveController];
}

- (CAMProtectionController)protectionController
{
  return [(CAMSubsystems *)self->_subsystems protectionController];
}

- (CAMRemoteShutterController)remoteShutterController
{
  return [(CAMSubsystems *)self->_subsystems remoteShutterController];
}

- (CAMLibrarySelectionController)librarySelectionController
{
  return [(CAMSubsystems *)self->_subsystems librarySelectionController];
}

- (CAMNebulaDaemonProxyManager)nebulaDaemonProxyManager
{
  return [(CAMSubsystems *)self->_subsystems nebulaDaemonProxyManager];
}

- (CAMIrisVideoController)irisVideoController
{
  return [(CAMSubsystems *)self->_subsystems irisVideoController];
}

void __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_216(uint64_t a1, void *a2)
{
  if (![a2 authorizationStatus])
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_2;
    v4[3] = &unk_263FA0408;
    CFAbsoluteTime v3 = *(void **)(a1 + 40);
    v4[4] = *(void *)(a1 + 32);
    id v5 = v3;
    cam_perform_on_main_asap(v4);
  }
}

void __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_2(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    v2 = [MEMORY[0x263F82418] alertControllerWithTitle:@"INTERNAL: Please Allow Notifications" message:@"Camera will notify you when it detects errors and prompt you to file radars." preferredStyle:1];
    CFAbsoluteTime v3 = (void *)MEMORY[0x263F82400];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_3;
    v12 = &unk_263FA1DF0;
    id v4 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = v4;
    id v5 = [v3 actionWithTitle:@"OK" style:0 handler:&v9];
    objc_msgSend(v2, "addAction:", v5, v9, v10, v11, v12, v13);

    uint64_t v6 = [*(id *)(a1 + 32) viewfinderViewController];
    [v6 presentViewController:v2 animated:1 completion:0];
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    [v7 _requestAuthorizationForNotificationCenter:v8];
  }
}

uint64_t __68__CAMApplicationDelegate_application_didFinishLaunchingWithOptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestAuthorizationForNotificationCenter:*(void *)(a1 + 40)];
}

- (void)_requestAuthorizationForNotificationCenter:(id)a3
{
}

void __69__CAMApplicationDelegate__requestAuthorizationForNotificationCenter___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  if (v4 && a2)
  {
    id v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __69__CAMApplicationDelegate__requestAuthorizationForNotificationCenter___block_invoke_cold_1(v4, v5);
    }
  }
}

- (void)updateShortcutItemsForApplication:(id)a3
{
  id v24 = a3;
  CAMSignpostWithIDAndArgs(53, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = +[CAMCaptureCapabilities capabilities];
  int v6 = [v5 isBackPortraitModeSupported];
  int v7 = [v5 isFrontPortraitModeSupported];
  int v23 = [v5 isBackSlomoSupported];
  uint64_t v8 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v9 = v8;
  if (v6)
  {
    uint64_t v10 = [v8 localizedStringForKey:@"Take Portrait" value:&stru_26BD78BA0 table:@"InfoPlist"];
    v11 = [(CAMApplicationDelegate *)self _userInfoForMode:6 devicePosition:0];
    v12 = [MEMORY[0x263F82470] iconWithSystemImageName:@"f.cursive.circle"];
    id v13 = objc_alloc(MEMORY[0x263F82478]);
    id v14 = @"com.apple.camera.shortcuts.portrait";
  }
  else
  {
    uint64_t v10 = [v8 localizedStringForKey:@"Take Photo" value:&stru_26BD78BA0 table:@"InfoPlist"];
    v11 = [(CAMApplicationDelegate *)self _userInfoForMode:0 devicePosition:0];
    v12 = [MEMORY[0x263F82470] iconWithSystemImageName:@"camera"];
    id v13 = objc_alloc(MEMORY[0x263F82478]);
    id v14 = @"com.apple.camera.shortcuts.photo";
  }
  id v15 = (void *)[v13 initWithType:v14 localizedTitle:v10 localizedSubtitle:0 icon:v12 userInfo:v11];
  [v4 addObject:v15];

  if (v7)
  {
    v16 = v9;
    v17 = [v9 localizedStringForKey:@"Take Portrait Selfie" value:&stru_26BD78BA0 table:@"InfoPlist"];
    v18 = [(CAMApplicationDelegate *)self _userInfoForMode:6 devicePosition:1];
    uint64_t v19 = [MEMORY[0x263F82470] iconWithSystemImageName:@"f.cursive.circle"];
    id v20 = objc_alloc(MEMORY[0x263F82478]);
    uint64_t v21 = @"com.apple.camera.shortcuts.portraitselfie";
  }
  else
  {
    v16 = v9;
    if (!v23) {
      goto LABEL_9;
    }
    v17 = [v9 localizedStringForKey:@"Record Slo-mo" value:&stru_26BD78BA0 table:@"InfoPlist"];
    v18 = [(CAMApplicationDelegate *)self _userInfoForMode:2 devicePosition:0];
    uint64_t v19 = [MEMORY[0x263F82470] iconWithSystemImageName:@"slowmo"];
    id v20 = objc_alloc(MEMORY[0x263F82478]);
    uint64_t v21 = @"com.apple.camera.shortcuts.slomo";
  }
  v22 = (void *)[v20 initWithType:v21 localizedTitle:v17 localizedSubtitle:0 icon:v19 userInfo:v18];
  [v4 addObject:v22];

LABEL_9:
  [v24 setShortcutItems:v4];
  CAMSignpostWithIDAndArgs(54, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = [(CAMApplicationDelegate *)self viewfinderViewController];
  int v8 = [v7 isRecording];

  if (v8)
  {
    uint64_t v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring launching with a URL request since we're currently recording", (uint8_t *)&v23, 2u);
    }
  }
  else
  {
    uint64_t v9 = +[CAMUserPreferences preferences];
    uint64_t v10 = [[CAMUserPreferenceOverrides alloc] initWithShortcutItem:v6];
    v11 = [(CAMUserPreferenceOverrides *)v10 captureMode];
    unint64_t v12 = [v11 integerValue];
    if (v12 > 9) {
      id v13 = 0;
    }
    else {
      id v13 = off_263FA6CB0[v12];
    }

    id v14 = [(CAMUserPreferenceOverrides *)v10 captureDevice];
    unint64_t v15 = [v14 integerValue];
    if (v15 > 0xB) {
      v16 = 0;
    }
    else {
      v16 = off_263FA6D00[v15];
    }

    v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543618;
      id v24 = v13;
      __int16 v25 = 2114;
      v26 = v16;
      _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "Launched with a shortcut request for mode:%{public}@ device:%{public}@", (uint8_t *)&v23, 0x16u);
    }

    v18 = [(CAMUserPreferenceOverrides *)v10 wantsQRCodes];
    int v19 = [v18 BOOLValue];

    if (v19)
    {
      [v9 setForceEnableQRBanners:1];
      id v20 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_2099F8000, v20, OS_LOG_TYPE_DEFAULT, "Launched with a URL request to force enable QR scanning", (uint8_t *)&v23, 2u);
      }
    }
    uint64_t v21 = [(CAMApplicationDelegate *)self viewfinderViewController];
    [v21 readUserPreferencesAndHandleChangesWithOverrides:v10];

    v22 = [(CAMApplicationDelegate *)self viewfinderViewController];
    [v22 generateAnalyticsSessionEventIfNeeded];
  }
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6 = a4;
  int v7 = [(CAMApplicationDelegate *)self viewfinderViewController];
  char v8 = [v7 handleURLIfNeeded:v6];

  return v8;
}

- (id)_userInfoForMode:(int64_t)a3 devicePosition:(int64_t)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"CAMCaptureMode";
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v12[1] = @"CAMCaptureDevice";
  v13[0] = v6;
  int v7 = NSNumber;
  char v8 = +[CAMUserPreferences preferences];
  uint64_t v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "defaultDeviceForModeChange:devicePosition:spatialVideoEnabled:", a3, a4, 0));
  v13[1] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __102__CAMApplicationDelegate_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  v10[3] = &unk_263FA6C90;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [v8 getDeliveredNotificationsWithCompletionHandler:v10];
}

void __102__CAMApplicationDelegate_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v76 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [*(id *)(a1 + 32) notification];
  id v5 = [v4 request];
  id v6 = [v5 content];
  id v7 = [v6 userInfo];
  v77 = objc_msgSend(v7, "objectForKeyedSubscript:");

  id v8 = [*(id *)(a1 + 32) notification];
  id v9 = [v8 request];
  uint64_t v10 = [v9 content];
  id v11 = [v10 userInfo];
  uint64_t v73 = [v11 objectForKeyedSubscript:@"keywordIDs"];

  id v12 = NSString;
  id v13 = [*(id *)(a1 + 32) notification];
  id v14 = [v13 request];
  unint64_t v15 = [v14 content];
  v16 = [v15 userInfo];
  v17 = objc_msgSend(v16, "objectForKeyedSubscript:");
  v18 = [v12 stringWithFormat:@"%@\n", v17];

  int v19 = [*(id *)(a1 + 32) notification];
  id v20 = [v19 request];
  uint64_t v21 = [v20 content];
  v22 = [v21 userInfo];
  v74 = objc_msgSend(v22, "objectForKeyedSubscript:");

  int v23 = [*(id *)(a1 + 32) notification];
  id v24 = [v23 request];
  __int16 v25 = [v24 content];
  v26 = [v25 userInfo];
  uint64_t v71 = [v26 objectForKeyedSubscript:@"componentID"];

  uint64_t v27 = [*(id *)(a1 + 32) notification];
  char v28 = [v27 request];
  v29 = [v28 content];
  v30 = [v29 userInfo];
  uint64_t v70 = [v30 objectForKeyedSubscript:@"componentName"];

  uint64_t v72 = a1;
  v31 = [*(id *)(a1 + 32) notification];
  v32 = [v31 request];
  v33 = [v32 content];
  BOOL v34 = [v33 userInfo];
  uint64_t v69 = [v34 objectForKeyedSubscript:@"componentVersion"];

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v3;
  uint64_t v35 = [obj countByEnumeratingWithState:&v78 objects:v82 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v79 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        v40 = [v39 request];
        v41 = [v40 content];
        v42 = [v41 userInfo];
        id v43 = [v42 objectForKeyedSubscript:@"error"];
        int v44 = [v77 isEqualToString:v43];

        long long v45 = [v39 request];
        long long v46 = [v45 content];
        long long v47 = [v46 userInfo];
        v48 = v47;
        if (v44)
        {
          v49 = [v47 objectForKeyedSubscript:@"captureID"];
          uint64_t v50 = [v18 stringByAppendingFormat:@"%@\n", v49];

          v18 = (void *)v50;
        }
        else
        {
          uint64_t v51 = [v47 objectForKeyedSubscript:@"prewarmReason"];
          int v52 = [v74 isEqualToString:v51];

          if (!v52) {
            continue;
          }
        }
        v53 = [v39 request];
        v54 = [v53 identifier];
        [v76 addObject:v54];
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v78 objects:v82 count:16];
    }
    while (v36);
  }

  [*(id *)(v72 + 40) removeDeliveredNotificationsWithIdentifiers:v76];
  v55 = [*(id *)(v72 + 32) notification];
  v56 = [v55 request];
  v57 = [v56 content];

  id v58 = objc_alloc_init(MEMORY[0x263F08790]);
  [v58 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  v59 = [*(id *)(v72 + 32) notification];
  v60 = [v59 date];
  v61 = [v58 stringFromDate:v60];

  if (v77)
  {
    v62 = [NSString stringWithFormat:@"A capture error occurred on %@ while I was ...\n\nError occurred for captureIDs:\n%@", v61, v18];
    v63 = [v57 title];
    BYTE2(v68) = 0;
    LOWORD(v68) = 1;
    v64 = (void *)v73;
    +[CAMTapToRadarUtilities fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:](CAMTapToRadarUtilities, "fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:", v63, v62, @"Other Bug", @"Not Applicable", @"1576982", @"CameraCapture (New Bugs)", @"iOS", v73, MEMORY[0x263EFFA68], v68);
    v66 = (void *)v70;
    v65 = (void *)v71;
    v67 = (void *)v69;
LABEL_16:

    goto LABEL_17;
  }
  v64 = (void *)v73;
  v66 = (void *)v70;
  v65 = (void *)v71;
  v67 = (void *)v69;
  if (v74)
  {
    v62 = [NSString stringWithFormat:@"Accidental Camera launch with prewarm reason %@", v74];
    v63 = [NSString stringWithFormat:@"Camera accidentally launched on %@ while I was ...", v61];
    BYTE2(v68) = 1;
    LOWORD(v68) = 1;
    +[CAMTapToRadarUtilities fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:](CAMTapToRadarUtilities, "fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:", v62, v63, @"Other Bug", @"Not Applicable", v71, v70, v69, v73, MEMORY[0x263EFFA68], v68);
    goto LABEL_16;
  }
LABEL_17:
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(CAMApplicationDelegate *)self viewfinderViewController];
  id v8 = [v6 userInfo];

  if (v8)
  {
    id v9 = [v8 objectForKeyedSubscript:@"userAction"];
    uint64_t v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      int v19 = v9;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Continuing user activity:%{public}@", (uint8_t *)&v18, 0xCu);
    }

    if ([v9 isEqual:@"documentScanning"])
    {
      [v7 presentDocumentScanningViewControllerAnimated:1];
      goto LABEL_23;
    }
    if (![v9 isEqual:@"cameraRoll"]) {
      goto LABEL_23;
    }
    id v11 = [v8 objectForKeyedSubscript:@"cameraRollActionType"];
    id v12 = v11;
    if (v11)
    {
      if ([v11 isEqual:&stru_26BD78BA0])
      {
        uint64_t v13 = 0;
LABEL_17:
        id v14 = [v8 objectForKeyedSubscript:@"cameraRollIndex"];
LABEL_18:
        +[CAMViewfinderLockScreenExtensionHelper beginDelayingAppearance];
        if (v14) {
          uint64_t v15 = [v14 unsignedIntValue];
        }
        else {
          uint64_t v15 = 0;
        }
        [v7 presentCameraRollViewControllerAnimated:0 withAction:v13 selectedAssetIndexFromEnd:v15];
        +[CAMViewfinderLockScreenExtensionHelper endDelayingAppearance];
        goto LABEL_22;
      }
      if ([v12 isEqual:@"edit"])
      {
        uint64_t v13 = 1;
        goto LABEL_17;
      }
      if ([v12 isEqual:@"menu"])
      {
        uint64_t v13 = 2;
        goto LABEL_17;
      }
      int v17 = [v12 isEqual:@"share"];
      id v14 = [v8 objectForKeyedSubscript:@"cameraRollIndex"];
      if (v17)
      {
        uint64_t v13 = 3;
        goto LABEL_18;
      }
    }
    else
    {
      id v14 = [v8 objectForKeyedSubscript:@"cameraRollIndex"];
    }
LABEL_22:

    goto LABEL_23;
  }
  id v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Skipping continue user activity, no userInfo", (uint8_t *)&v18, 2u);
  }
LABEL_23:

  return v8 != 0;
}

- (UIWindow)window
{
  return self->_window;
}

- (CAMSubsystems)subsystems
{
  return self->_subsystems;
}

- (void)setSubsystems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsystems, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

void __69__CAMApplicationDelegate__requestAuthorizationForNotificationCenter___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 code];
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Error requesting authorization for UNNotificationRequest. Received: %ld", (uint8_t *)&v3, 0xCu);
}

@end