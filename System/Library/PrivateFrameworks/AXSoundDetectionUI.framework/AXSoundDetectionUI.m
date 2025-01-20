void sub_226F22D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2647F4798;
    uint64_t v6 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AXSettings");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getAXSettingsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_226F237C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _accessibilitySDUISupportBundle()
{
  if (_accessibilitySDUISupportBundle_onceToken != -1) {
    dispatch_once(&_accessibilitySDUISupportBundle_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)_accessibilitySDUISupportBundle_AXBundle;
  return v0;
}

uint64_t ___accessibilitySDUISupportBundle_block_invoke()
{
  _accessibilitySDUISupportBundle_AXBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

void AXSDSoundDetectionRequestNotificationAuthorization()
{
  id v2 = +[AXSDListenEngine sharedInstance];
  if ([v2 supportsVirtualAudioDevice]) {
    uint64_t v0 = 40;
  }
  else {
    uint64_t v0 = 32;
  }
  v1 = AXSDSoundDetectionNotificationCenter();
  [v1 requestAuthorizationWithOptions:v0 completionHandler:&__block_literal_global_5];
}

id AXSDSoundDetectionNotificationCenter()
{
  if (AXSDSoundDetectionNotificationCenter_onceToken != -1) {
    dispatch_once(&AXSDSoundDetectionNotificationCenter_onceToken, &__block_literal_global_128);
  }
  uint64_t v0 = (void *)AXSDSoundDetectionNotificationCenter_NotificationCenter;
  return v0;
}

void __AXSDSoundDetectionRequestNotificationAuthorization_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_INFO, "Requested authorization to show notification for sound detection: %d %@", (uint8_t *)v6, 0x12u);
  }
}

void AXSDSoundDetectionGenerateUserNotificationForDetectionType(void *a1, float a2)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [MEMORY[0x263F21DA0] sharedInstance];
  uint64_t v5 = [v4 soundDetectionState];

  if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x263F21DA0] sharedInstance];
    __int16 v7 = [v6 enabledSoundDetectionTypes];

    if ([v7 containsObject:v3])
    {
      id v8 = [MEMORY[0x263F21DA0] sharedInstance];
      uint64_t v9 = [v8 soundDetectionSnoozeDictionary];

      v10 = [v9 objectForKey:v3];
      if (v10
        && ([MEMORY[0x263EFF910] date],
            v11 = objc_claimAutoreleasedReturnValue(),
            [v10 laterDate:v11],
            v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v12 isEqualToDate:v10],
            v12,
            v11,
            v13))
      {
        v14 = AXLogUltron();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v3;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v10;
          _os_log_impl(&dword_226F20000, v14, OS_LOG_TYPE_DEFAULT, "Not generating user notification for detection. Notifications for %@ are snoozed until %@", buf, 0x16u);
        }
      }
      else
      {
        id v15 = v3;
        v16 = AXLogUltron();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          AXSDSoundDetectionGenerateUserNotificationForDetectionType_cold_1((uint64_t)v15, v16, a2);
        }

        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = ___SoundDetectionSendNotification_block_invoke;
        v47 = &unk_2647F4990;
        id v17 = v15;
        id v48 = v17;
        AnalyticsSendEventLazy();
        v18 = [MEMORY[0x263F1DF00] soundWithAlertType:29];
        v19 = [MEMORY[0x263F21DA0] sharedInstance];
        uint64_t v20 = [v19 soundAlertTopicForSoundDetectionType:v17];

        if (v20) {
          [v18 setAlertTopic:v20];
        }
        v21 = objc_opt_new();
        v22 = AXSDSoundDetectionLocalizedStringForType();
        [v21 setTitle:v22];

        v23 = AXSDSoundDetectionLocalizedStringForType();
        [v21 setBody:v23];

        v44[0] = @"SDNotificationDetectorKey";
        v44[1] = @"SDNotificationConfidenceKey";
        v45[0] = v17;
        *(float *)&double v24 = a2;
        v25 = [NSNumber numberWithFloat:v24];
        v45[1] = v25;
        v26 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
        [v21 setUserInfo:v26];

        [v21 setSound:v18];
        [v21 setInterruptionLevel:2];
        if (AXSDIsConnectedToCarPlay()
          && ((id)*MEMORY[0x263F21D20] == v17 || (id)*MEMORY[0x263F21D88] == v17))
        {
          objc_msgSend(v21, "setShouldSuppressDefaultAction:", 0, v20, v18);
          v28 = @"com.apple.SoundDetectionCarPlayNotifications.message";
          uint64_t v29 = 15;
        }
        else
        {
          v27 = objc_msgSend(NSURL, "URLWithString:", @"prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE/Sounds", v20, v18);
          [v21 setDefaultActionURL:v27];

          v28 = @"com.apple.SoundDetectionNotifications.message";
          uint64_t v29 = 7;
        }
        [v21 setCategoryIdentifier:v28];
        v30 = (void *)MEMORY[0x263F1DF48];
        v31 = [MEMORY[0x263F08C38] UUID];
        v32 = [v31 UUIDString];
        v33 = [v30 requestWithIdentifier:v32 content:v21 trigger:0 destinations:v29];

        v34 = AXLogUltron();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          LODWORD(v40) = 138412290;
          *(void *)((char *)&v40 + 4) = v33;
          _os_log_impl(&dword_226F20000, v34, OS_LOG_TYPE_INFO, "Posting local notification: %@", (uint8_t *)&v40, 0xCu);
        }

        v35 = AXSDSoundDetectionNotificationCenter();
        *(void *)&long long v40 = MEMORY[0x263EF8330];
        *((void *)&v40 + 1) = 3221225472;
        v41 = ___SoundDetectionSendNotification_block_invoke_182;
        v42 = &unk_2647F49B8;
        id v43 = v17;
        id v36 = v17;
        [v35 addNotificationRequest:v33 withCompletionHandler:&v40];

        v14 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:30.0];
        v37 = [MEMORY[0x263F21DA0] sharedInstance];
        [v37 addSnoozeDateToSnoozeDictionary:v14 forKey:v36];
      }
    }
    else
    {
      uint64_t v9 = AXLogUltron();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        AXSDSoundDetectionGenerateUserNotificationForDetectionType_cold_2();
      }
    }
  }
  else
  {
    __int16 v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226F20000, v7, OS_LOG_TYPE_DEFAULT, "Not generating user notification because feature is off", buf, 2u);
    }
  }
}

void _SoundDetectionSendNotificationForCustomDetector(void *a1, float a2)
{
  v28[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [MEMORY[0x263F21DA0] sharedInstance];
  uint64_t v5 = [v4 detectorForIdentifier:v3];

  uint64_t v6 = AXLogUltron();
  __int16 v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      _SoundDetectionSendNotificationForCustomDetector_cold_2(v5);
    }

    __int16 v7 = [MEMORY[0x263F1DF00] soundWithAlertType:29];
    id v8 = objc_opt_new();
    uint64_t v9 = [v5 name];
    [v8 setTitle:v9];

    v10 = _accessibilitySDUISupportBundle();
    v11 = [v10 localizedStringForKey:@"CustomDetectionBody" value:@"CustomDetectionBody" table:@"SoundDetectionSupport"];

    v12 = NSString;
    int v13 = [v5 name];
    v14 = objc_msgSend(v12, "localizedStringWithFormat:", v11, v13);
    [v8 setBody:v14];

    [v8 setCategoryIdentifier:@"com.apple.SoundDetectionNotifications.message"];
    id v15 = [NSURL URLWithString:@"prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE/Sounds"];
    [v8 setDefaultActionURL:v15];

    [v8 setSound:v7];
    v27[0] = @"SDNotificationDetectorKey";
    v27[1] = @"SDNotificationConfidenceKey";
    v28[0] = v3;
    *(float *)&double v16 = a2;
    id v17 = [NSNumber numberWithFloat:v16];
    v28[1] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    [v8 setUserInfo:v18];

    [v8 setInterruptionLevel:2];
    v19 = (void *)MEMORY[0x263F1DF48];
    uint64_t v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    v22 = [v19 requestWithIdentifier:v21 content:v8 trigger:0];

    v23 = AXLogUltron();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v22;
      _os_log_impl(&dword_226F20000, v23, OS_LOG_TYPE_INFO, "Posting local notification: %@", buf, 0xCu);
    }

    double v24 = AXSDSoundDetectionNotificationCenter();
    [v24 addNotificationRequest:v22 withCompletionHandler:&__block_literal_global_34];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    _SoundDetectionSendNotificationForCustomDetector_cold_1(v7);
  }
}

void AXSDSoundDetectionGenerateUserNotificationForCustomDetector(void *a1, float a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [MEMORY[0x263F21DA0] sharedInstance];
  uint64_t v5 = [v4 soundDetectionSnoozeDictionary];

  uint64_t v6 = [v5 objectForKey:v3];
  if (v6
    && ([MEMORY[0x263EFF910] date],
        __int16 v7 = objc_claimAutoreleasedReturnValue(),
        [v6 laterDate:v7],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToDate:v6],
        v8,
        v7,
        v9))
  {
    v10 = AXLogUltron();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_226F20000, v10, OS_LOG_TYPE_DEFAULT, "Not generating user notification for detection. Notifications for %@ are snoozed until %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    _SoundDetectionSendNotificationForCustomDetector(v3, a2);
    v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:30.0];
    v11 = [MEMORY[0x263F21DA0] sharedInstance];
    [v11 addSnoozeDateToSnoozeDictionary:v10 forKey:v3];
  }
}

void AXSDSoundDetectionSendKShotModelReadyNotification(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    _SoundDetectionSendNotificationForCustomDetector_cold_2(v1);
  }

  id v3 = [MEMORY[0x263F1DF00] soundWithAlertType:29];
  id v4 = objc_opt_new();
  uint64_t v5 = [v1 name];
  [v4 setTitle:v5];

  uint64_t v6 = _accessibilitySDUISupportBundle();
  __int16 v7 = [v6 localizedStringForKey:@"ModelReady" value:@"ModelReady" table:@"SoundDetectionSupport"];

  id v8 = NSString;
  int v9 = [v1 name];
  v10 = objc_msgSend(v8, "localizedStringWithFormat:", v7, v9);
  [v4 setBody:v10];

  [v4 setCategoryIdentifier:@"com.apple.SoundDetectionNotifications.modelReady"];
  v11 = [v1 identifier];
  int v12 = [@"prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE/Sounds/" stringByAppendingString:v11];

  id v13 = [NSURL URLWithString:v12];
  [v4 setDefaultActionURL:v13];

  [v4 setSound:v3];
  [v4 setInterruptionLevel:2];
  __int16 v14 = (void *)MEMORY[0x263F1DF48];
  id v15 = [MEMORY[0x263F08C38] UUID];
  uint64_t v16 = [v15 UUIDString];
  id v17 = [v14 requestWithIdentifier:v16 content:v4 trigger:0];

  v18 = AXLogUltron();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v17;
    _os_log_impl(&dword_226F20000, v18, OS_LOG_TYPE_INFO, "Posting local notification: %@", buf, 0xCu);
  }

  v19 = AXSDSoundDetectionNotificationCenter();
  [v19 addNotificationRequest:v17 withCompletionHandler:&__block_literal_global_45];
}

void __AXSDSoundDetectionSendKShotModelReadyNotification_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = AXLogUltron();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ___SoundDetectionSendNotificationForCustomDetector_block_invoke_cold_1();
    }
  }
}

void AXSDSoundDetectionSendKShotModelFailedNotification(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    AXSDSoundDetectionSendKShotModelFailedNotification_cold_1();
  }

  id v3 = [MEMORY[0x263F1DF00] soundWithAlertType:29];
  id v4 = objc_opt_new();
  uint64_t v5 = [v1 name];
  [v4 setTitle:v5];

  uint64_t v6 = _accessibilitySDUISupportBundle();
  __int16 v7 = [v6 localizedStringForKey:@"ModelFailed" value:@"ModelFailed" table:@"SoundDetectionSupport"];

  id v8 = NSString;
  int v9 = [v1 name];
  v10 = objc_msgSend(v8, "localizedStringWithFormat:", v7, v9);
  [v4 setBody:v10];

  [v4 setCategoryIdentifier:@"com.apple.SoundDetectionNotifications.modelReady"];
  v11 = [v1 identifier];
  if (v11)
  {
    [@"prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE/Sounds/" stringByAppendingString:v11];
    int v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v12 = @"prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE/Sounds/";
  }
  id v13 = [NSURL URLWithString:v12];
  [v4 setDefaultActionURL:v13];

  [v4 setSound:v3];
  [v4 setInterruptionLevel:2];
  __int16 v14 = (void *)MEMORY[0x263F1DF48];
  id v15 = [MEMORY[0x263F08C38] UUID];
  uint64_t v16 = [v15 UUIDString];
  id v17 = [v14 requestWithIdentifier:v16 content:v4 trigger:0];

  v18 = AXLogUltron();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v17;
    _os_log_impl(&dword_226F20000, v18, OS_LOG_TYPE_INFO, "Posting local notification: %@", buf, 0xCu);
  }

  v19 = AXSDSoundDetectionNotificationCenter();
  [v19 addNotificationRequest:v17 withCompletionHandler:&__block_literal_global_50];
}

void __AXSDSoundDetectionSendKShotModelFailedNotification_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = AXLogUltron();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ___SoundDetectionSendNotificationForCustomDetector_block_invoke_cold_1();
    }
  }
}

void AXSDKShotGatherFilesAndGenerateRadarForDetector(void *a1)
{
  v30[10] = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [v1 identifier];

  if (v2)
  {
    id v3 = [v1 identifier];
    uint64_t v27 = [@"/" stringByAppendingString:v3];

    uint64_t v29 = [@"/var/mobile/Library/Accessibility/SoundDetectionKShot/TrainingFiles" stringByAppendingString:v27];
    v28 = [v1 modelURLString];
    id v4 = [v29 stringByAppendingString:@","];
    v25 = [v4 stringByAppendingString:v28];

    v26 = objc_opt_new();
    [v26 setScheme:@"tap-to-radar"];
    [v26 setHost:@"new"];
    uint64_t v5 = (void *)MEMORY[0x263F08BD0];
    uint64_t v6 = NSString;
    __int16 v7 = [v1 name];
    id v8 = [v1 identifier];
    int v9 = [v6 stringWithFormat:@"AX Sound Recognition KShot issue with detector named: %@ with ID %@", v7, v8];
    v23 = [v5 queryItemWithName:@"Title" value:v9];

    uint64_t v22 = [MEMORY[0x263F08BD0] queryItemWithName:@"Description", @"[Add any details about what issue was happening with this detection or enrollment, did you get a model error notification etc.]" value];
    v21 = [MEMORY[0x263F08BD0] queryItemWithName:@"Classification" value:@"Performance"];
    v10 = [MEMORY[0x263F08BD0] queryItemWithName:@"Reproducibility" value:@"I Didn't Try"];
    v11 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentName" value:@"Accessibility Sound Detection"];
    [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentID" value:@"1074027"];
    v12 = id v24 = v1;
    id v13 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentVersion" value:@"All"];
    __int16 v14 = [MEMORY[0x263F08BD0] queryItemWithName:@"Attachments" value:v25];
    id v15 = [MEMORY[0x263F08BD0] queryItemWithName:@"AutoDiagnostics" value:@"log-archive-only"];
    uint64_t v16 = [MEMORY[0x263F08BD0] queryItemWithName:@"DeviceClasses" value:@"iPhone,iPad"];
    v30[0] = v23;
    v30[1] = v22;
    v30[2] = v10;
    v30[3] = v21;
    v30[4] = v11;
    v30[5] = v12;
    v30[6] = v13;
    v30[7] = v14;
    v30[8] = v15;
    v30[9] = v16;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:10];
    [v26 setQueryItems:v17];

    v18 = [v26 URL];
    v19 = [MEMORY[0x263F01880] defaultWorkspace];
    [v19 openURL:v18 withOptions:0];

    uint64_t v20 = v27;
    id v1 = v24;
  }
  else
  {
    uint64_t v20 = AXLogUltron();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      AXSDKShotGatherFilesAndGenerateRadarForDetector_cold_1();
    }
  }
}

void __AXSDSoundDetectionNotificationCenter_block_invoke()
{
  v25[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.SoundDetectionNotifications"];
  id v1 = (void *)AXSDSoundDetectionNotificationCenter_NotificationCenter;
  AXSDSoundDetectionNotificationCenter_NotificationCenter = v0;

  id v2 = AXSDSoundDetectionBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"SnoozeActionShort" value:@"SnoozeActionShort" table:@"SoundDetectionSupport"];

  id v4 = AXSDSoundDetectionBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"SnoozeActionMedium" value:@"SnoozeActionMedium" table:@"SoundDetectionSupport"];

  uint64_t v6 = AXSDSoundDetectionBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"SnoozeActionLong" value:@"SnoozeActionLong" table:@"SoundDetectionSupport"];

  id v8 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
  int v9 = [MEMORY[0x263F1DF18] iconWithSystemImageName:@"clock"];
  id v24 = (void *)v3;
  v10 = [MEMORY[0x263F1DF10] actionWithIdentifier:@"com.apple.SoundDetectionNotification.action.snooze.short" title:v3 options:0 icon:v9];
  v23 = (void *)v5;
  v11 = [MEMORY[0x263F1DF10] actionWithIdentifier:@"com.apple.SoundDetectionNotification.action.snooze.medium" title:v5 options:0 icon:v9];
  uint64_t v22 = (void *)v7;
  int v12 = [MEMORY[0x263F1DF10] actionWithIdentifier:@"com.apple.SoundDetectionNotification.action.snooze.long" title:v7 options:0 icon:v9];
  v25[0] = v10;
  v25[1] = v11;
  v25[2] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  [v8 addObjectsFromArray:v13];

  if ([MEMORY[0x263F472B0] isInternalInstall]
    && +[AXSDUltronInternalRecordingManager isEnrolled])
  {
    __int16 v14 = [MEMORY[0x263F1DF18] iconWithSystemImageName:@"ant.circle.fill"];
    id v15 = [MEMORY[0x263F1DF10] actionWithIdentifier:@"com.apple.SoundDetectionNotification.action.radar" title:@"False Positive: File a Radar" options:0 icon:v14];
    [v8 addObject:v15];
  }
  uint64_t v16 = MEMORY[0x263EFFA68];
  id v17 = [MEMORY[0x263F1DF28] categoryWithIdentifier:@"com.apple.SoundDetectionCarPlayNotifications.message" actions:MEMORY[0x263EFFA68] intentIdentifiers:MEMORY[0x263EFFA68] options:2];
  v18 = [MEMORY[0x263F1DF28] categoryWithIdentifier:@"com.apple.SoundDetectionNotifications.message" actions:v8 intentIdentifiers:v16 options:0];
  v19 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v18, v17, 0);
  uint64_t v20 = [MEMORY[0x263F1DF28] categoryWithIdentifier:@"com.apple.SoundDetectionNotifications.modelReady" actions:v16 intentIdentifiers:v16 options:0];
  v21 = [v19 setByAddingObject:v20];

  [(id)AXSDSoundDetectionNotificationCenter_NotificationCenter setNotificationCategories:v21];
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_226F2B4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_226F2CCBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226F2E014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226F2E948(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_226F2FA60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_226F317EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __getAXEventRepresentationClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("AXEventRepresentation");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAXEventRepresentationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAXEventRepresentationClass_block_invoke_cold_1();
    AccessibilityUtilitiesLibrary();
  }
}

void AccessibilityUtilitiesLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2647F4B68;
    uint64_t v3 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

AXSDKShotDetector *__getAXEventTapManagerClass_block_invoke(uint64_t a1)
{
  AccessibilityUtilitiesLibrary();
  uint64_t result = (AXSDKShotDetector *)objc_getClass("AXEventTapManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getAXEventTapManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AXSDKShotDetector *)__getAXEventTapManagerClass_block_invoke_cold_1();
    return [(AXSDKShotDetector *)v3 initWithName:v5];
  }
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_226F346D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226F34CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&a9, 8) = a1;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_226F39460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getAXSettingsClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2647F4E00;
    uint64_t v6 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AXSettings");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getAXSettingsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXSettingsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_fault_impl(a1, v4, OS_LOG_TYPE_FAULT, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_226F3B64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_2(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id OUTLINED_FUNCTION_3_3(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_6_0(void *a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return v0;
}

id sub_226F4111C()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  id result = objc_msgSend(*v1, sel_containsListenDelegate_, v0);
  if (result) {
    return objc_msgSend(*v1, sel_isListening);
  }
  return result;
}

uint64_t sub_226F41244()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_currentDetectors);
  uint64_t v2 = sub_226F7AB58();

  uint64_t v3 = sub_226F46544(v2);
  swift_bridgeObjectRelease();
  return v3;
}

void sub_226F412B0(uint64_t a1)
{
  sub_226F46D98(0, (unint64_t *)&qword_268162770);
  sub_226F46DD4();
  int64_t v2 = 0;
  v13[1] = (id)sub_226F7AC08();
  uint64_t v3 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    sub_226F44B18(v13, *(id *)(*(void *)(a1 + 48) + 8 * v9));
  }
  int64_t v12 = v10 + 4;
  if (v12 >= v7)
  {
LABEL_23:
    swift_release();
    return;
  }
  unint64_t v11 = *(void *)(v3 + 8 * v12);
  if (v11)
  {
    int64_t v2 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v2 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v2 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v2);
    ++v12;
    if (v11) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
}

id sub_226F41450()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)AXSDKShotModelManager), sel_init);
  id v1 = (objc_class *)type metadata accessor for AXSDKShotNSControllerImplementation();
  int64_t v2 = (char *)objc_allocWithZone(v1);
  *(void *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager] = v0;
  type metadata accessor for AXSDKShotMonitor();
  id v3 = v0;
  uint64_t inited = swift_initStaticObject();
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_226F7AA58();
  __swift_project_value_buffer(v5, (uint64_t)qword_268162638);
  unint64_t v6 = sub_226F7AA48();
  os_log_type_t v7 = sub_226F7AC58();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl(&dword_226F20000, v6, v7, "AXSDKShotMonitor: Start Monitoring", v8, 2u);
    MEMORY[0x22A66FDC0](v8, -1, -1);
  }

  *(void *)(inited + 16) = sub_226F5EA2C();
  swift_release();
  v11.receiver = v2;
  v11.super_class = v1;
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  objc_msgSend(v3, sel_setDelegate_, v9);

  return v9;
}

id AXSDKShotNSControllerImplementation.__allocating_init(modelManager:)(void *a1)
{
  int64_t v2 = v1;
  uint64_t v4 = (char *)objc_allocWithZone(v2);
  *(void *)&v4[OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager] = a1;
  type metadata accessor for AXSDKShotMonitor();
  id v5 = a1;
  uint64_t inited = swift_initStaticObject();
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_226F7AA58();
  __swift_project_value_buffer(v7, (uint64_t)qword_268162638);
  unint64_t v8 = sub_226F7AA48();
  os_log_type_t v9 = sub_226F7AC58();
  if (os_log_type_enabled(v8, v9))
  {
    int64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v10 = 0;
    _os_log_impl(&dword_226F20000, v8, v9, "AXSDKShotMonitor: Start Monitoring", v10, 2u);
    MEMORY[0x22A66FDC0](v10, -1, -1);
  }

  *(void *)(inited + 16) = sub_226F5EA2C();
  swift_release();
  v13.receiver = v4;
  v13.super_class = v2;
  id v11 = objc_msgSendSuper2(&v13, sel_init);

  return v11;
}

id AXSDKShotNSControllerImplementation.init(modelManager:)(void *a1)
{
  int64_t v2 = v1;
  *(void *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager] = a1;
  type metadata accessor for AXSDKShotMonitor();
  id v4 = a1;
  uint64_t inited = swift_initStaticObject();
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_226F7AA58();
  __swift_project_value_buffer(v6, (uint64_t)qword_268162638);
  uint64_t v7 = sub_226F7AA48();
  os_log_type_t v8 = sub_226F7AC58();
  if (os_log_type_enabled(v7, v8))
  {
    os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v9 = 0;
    _os_log_impl(&dword_226F20000, v7, v8, "AXSDKShotMonitor: Start Monitoring", v9, 2u);
    MEMORY[0x22A66FDC0](v9, -1, -1);
  }

  *(void *)(inited + 16) = sub_226F5EA2C();
  swift_release();
  v12.receiver = v2;
  v12.super_class = (Class)type metadata accessor for AXSDKShotNSControllerImplementation();
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

void sub_226F41904()
{
}

id AXSDKShotNSControllerImplementation.__deallocating_deinit()
{
  id v1 = v0;
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226F7AA58();
  __swift_project_value_buffer(v2, (uint64_t)qword_268162638);
  id v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC58();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226F20000, v3, v4, "AXSDKShotMonitor: Stop Monitoring", v5, 2u);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }

  if (qword_268162080)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681620A0);
    sub_226F7ABD8();
    swift_task_isCancelled();
    swift_release();
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AXSDKShotNSControllerImplementation();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

void sub_226F41ADC()
{
  id v1 = (id *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  if (objc_msgSend(*v1, sel_containsListenDelegate_, v0)
    && (objc_msgSend(*v1, sel_isListening) & 1) != 0)
  {
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_226F7AA58();
    __swift_project_value_buffer(v2, (uint64_t)qword_268162650);
    id v3 = v0;
    os_log_type_t v4 = sub_226F7AA48();
    os_log_type_t v5 = sub_226F7AC58();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v24 = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      os_log_type_t v8 = v3;
      id v9 = objc_msgSend(v8, sel_description);
      uint64_t v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v12 = v11;

      sub_226F44310(v10, v12, &v24);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v4, v5, "[%s]: custom sound recognition is already listening.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v7, -1, -1);
      MEMORY[0x22A66FDC0](v6, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_226F7AA58();
    __swift_project_value_buffer(v13, (uint64_t)qword_268162650);
    __int16 v14 = v0;
    id v15 = sub_226F7AA48();
    os_log_type_t v16 = sub_226F7AC58();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v24 = v18;
      *(_DWORD *)id v17 = 136315138;
      v19 = v14;
      id v20 = objc_msgSend(v19, sel_description);
      uint64_t v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v23 = v22;

      sub_226F44310(v21, v23, &v24);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v15, v16, "[%s]: will start listening", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v18, -1, -1);
      MEMORY[0x22A66FDC0](v17, -1, -1);
    }
    else
    {
    }
    sub_226F45E40(v14, v14, (uint64_t)&unk_26DB21718, (uint64_t)sub_226F46ED8, (uint64_t)&block_descriptor_47);
  }
}

void sub_226F41F18()
{
  uint64_t v1 = sub_226F7AA78();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  os_log_type_t v4 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226F7AA98();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  os_log_type_t v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (id *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  if (objc_msgSend(*v9, sel_containsListenDelegate_, v0)
    && objc_msgSend(*v9, sel_isListening))
  {
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_226F7AA58();
    __swift_project_value_buffer(v10, (uint64_t)qword_268162650);
    unint64_t v11 = v0;
    unint64_t v12 = sub_226F7AA48();
    os_log_type_t v13 = sub_226F7AC58();
    int v14 = v13;
    if (os_log_type_enabled(v12, v13))
    {
      int v42 = v14;
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      aBlock[0] = v41;
      uint64_t v44 = v6;
      *(_DWORD *)id v15 = 136315138;
      v39[1] = v15 + 4;
      long long v40 = v15;
      os_log_type_t v16 = v11;
      uint64_t v45 = v2;
      id v17 = v16;
      id v18 = objc_msgSend(v16, sel_description);
      uint64_t v19 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      id v43 = v11;
      unint64_t v21 = v20;

      uint64_t v47 = sub_226F44310(v19, v21, aBlock);
      uint64_t v6 = v44;
      sub_226F7ACD8();

      uint64_t v2 = v45;
      unint64_t v11 = v43;
      swift_bridgeObjectRelease();
      unint64_t v22 = v40;
      _os_log_impl(&dword_226F20000, v12, (os_log_type_t)v42, "[%s]: will stop listening", v40, 0xCu);
      uint64_t v23 = v41;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v23, -1, -1);
      MEMORY[0x22A66FDC0](v22, -1, -1);
    }
    else
    {
    }
    sub_226F46D98(0, (unint64_t *)&qword_2681622D0);
    v35 = (void *)sub_226F7AC88();
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v11;
    aBlock[4] = (uint64_t)sub_226F466B4;
    aBlock[5] = v36;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_226F42574;
    aBlock[3] = (uint64_t)&block_descriptor;
    v37 = _Block_copy(aBlock);
    v38 = v11;
    swift_release();
    sub_226F7AA88();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_226F46AA0((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
    sub_226F4671C();
    sub_226F7ACF8();
    MEMORY[0x22A66F0C0](0, v8, v4, v37);
    _Block_release(v37);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_226F7AA58();
    __swift_project_value_buffer(v24, (uint64_t)qword_268162650);
    v25 = v0;
    v26 = sub_226F7AA48();
    os_log_type_t v27 = sub_226F7AC58();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      aBlock[0] = v29;
      *(_DWORD *)v28 = 136315138;
      v30 = v25;
      id v31 = objc_msgSend(v30, sel_description);
      uint64_t v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v34 = v33;

      uint64_t v47 = sub_226F44310(v32, v34, aBlock);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v26, v27, "[%s]: custom sound recognition is already stopped.", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v29, -1, -1);
      MEMORY[0x22A66FDC0](v28, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_226F42574(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_226F42600(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_addCustomDetector_, a1);
}

id sub_226F42634(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_removeCustomDetector_, a1);
}

uint64_t sub_226F42668()
{
  uint64_t v1 = sub_226F7AA78();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  os_log_type_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226F7AA98();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  os_log_type_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226F46D98(0, (unint64_t *)&qword_2681622D0);
  id v9 = (void *)sub_226F7AC88();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  aBlock[4] = sub_226F467C0;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_226F42574;
  aBlock[3] = &block_descriptor_6;
  unint64_t v11 = _Block_copy(aBlock);
  id v12 = v0;
  swift_release();
  sub_226F7AA88();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_226F46AA0((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  sub_226F4671C();
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Void __swiftcall AXSDKShotNSControllerImplementation.listenEngineDidStart(withInputFormat:)(AVAudioFormat_optional *withInputFormat)
{
  uint64_t v3 = sub_226F7AA78();
  v57 = *(uint8_t **)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_226F7AA98();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  id v9 = (char *)v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (withInputFormat)
  {
    v56 = v9;
    uint64_t v10 = qword_268162058;
    unint64_t v11 = withInputFormat;
    if (v10 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_226F7AA58();
    __swift_project_value_buffer(v12, (uint64_t)qword_268162650);
    id v13 = v1;
    int v14 = sub_226F7AA48();
    os_log_type_t v15 = sub_226F7AC58();
    int v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      int v53 = v16;
      id v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      aBlock[0] = v52;
      v51 = v17;
      *(_DWORD *)id v17 = 136315138;
      v50[1] = v17 + 4;
      id v18 = v13;
      uint64_t v55 = v3;
      id v19 = v18;
      id v20 = objc_msgSend(v18, sel_description);
      id v21 = v13;
      uint64_t v22 = v7;
      uint64_t v23 = v5;
      uint64_t v24 = v11;
      uint64_t v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      uint64_t v54 = v6;
      unint64_t v27 = v26;

      uint64_t v28 = v25;
      unint64_t v11 = v24;
      uint64_t v5 = v23;
      uint64_t v7 = v22;
      id v13 = v21;
      uint64_t v59 = sub_226F44310(v28, v27, aBlock);
      sub_226F7ACD8();

      uint64_t v6 = v54;
      uint64_t v3 = v55;
      swift_bridgeObjectRelease();
      uint64_t v29 = v51;
      _os_log_impl(&dword_226F20000, v14, (os_log_type_t)v53, "[%s]: listen engine did start", v51, 0xCu);
      uint64_t v30 = v52;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v30, -1, -1);
      MEMORY[0x22A66FDC0](v29, -1, -1);
    }
    else
    {
    }
    sub_226F46D98(0, (unint64_t *)&qword_2681622D0);
    int v42 = (void *)sub_226F7AC88();
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = v13;
    *(void *)(v43 + 24) = v11;
    aBlock[4] = (uint64_t)sub_226F4681C;
    aBlock[5] = v43;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_226F42574;
    aBlock[3] = (uint64_t)&block_descriptor_12;
    uint64_t v44 = _Block_copy(aBlock);
    uint64_t v45 = v11;
    v46 = v13;
    uint64_t v47 = v45;
    id v48 = v46;
    swift_release();
    uint64_t v49 = v56;
    sub_226F7AA88();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_226F46AA0((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
    sub_226F4671C();
    sub_226F7ACF8();
    MEMORY[0x22A66F0C0](0, v49, v5, v44);
    _Block_release(v44);

    (*((void (**)(char *, uint64_t))v57 + 1))(v5, v3);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v49, v6);
  }
  else
  {
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_226F7AA58();
    __swift_project_value_buffer(v31, (uint64_t)qword_268162650);
    id v32 = v1;
    unint64_t v33 = sub_226F7AA48();
    os_log_type_t v34 = sub_226F7AC48();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      *(_DWORD *)v35 = 136315138;
      v57 = v35 + 4;
      aBlock[0] = v36;
      id v37 = v32;
      id v38 = objc_msgSend(v37, sel_description);
      uint64_t v39 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v41 = v40;

      uint64_t v59 = sub_226F44310(v39, v41, aBlock);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v33, v34, "[%s]: Listen Engine did not return an audio format. This should NOT happen; bailing. File a radar!",
        v35,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v36, -1, -1);
      MEMORY[0x22A66FDC0](v35, -1, -1);
    }
    else
    {
    }
    sub_226F41F18();
  }
}

Swift::Void __swiftcall AXSDKShotNSControllerImplementation.receivedBuffer(_:at:)(AVAudioPCMBuffer _, AVAudioTime *at)
{
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_processAudioBuffer_atTime_, _.super.super.isa, _.super._impl);
}

void AXSDKShotNSControllerImplementation.listenEngineFailedToStartWithError(_:)(void *a1)
{
  if (a1)
  {
    id v3 = a1;
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_226F7AA58();
    __swift_project_value_buffer(v4, (uint64_t)qword_268162650);
    id v5 = a1;
    id v6 = v1;
    id v7 = a1;
    id v8 = v6;
    oslog = sub_226F7AA48();
    os_log_type_t v9 = sub_226F7AC48();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      unint64_t v11 = (void *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v31 = v12;
      *(_DWORD *)uint64_t v10 = 136315394;
      id v13 = v8;
      id v14 = objc_msgSend(v13, sel_description);
      uint64_t v15 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v17 = v16;

      sub_226F44310(v15, v17, &v31);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2112;
      id v18 = a1;
      uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
      sub_226F7ACD8();
      void *v11 = v30;

      _os_log_impl(&dword_226F20000, oslog, v9, "[%s]: listen engine failed to start with error: %@", (uint8_t *)v10, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v11, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v12, -1, -1);
      MEMORY[0x22A66FDC0](v10, -1, -1);

      return;
    }
  }
  else
  {
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_226F7AA58();
    __swift_project_value_buffer(v19, (uint64_t)qword_268162650);
    oslog = v1;
    id v20 = sub_226F7AA48();
    os_log_type_t v21 = sub_226F7AC48();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v31 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v24 = oslog;
      id v25 = [v24 description];
      uint64_t v26 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v28 = v27;

      sub_226F44310(v26, v28, &v31);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v20, v21, "[%s]: listen engine failed to start.", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v23, -1, -1);
      MEMORY[0x22A66FDC0](v22, -1, -1);

      return;
    }
  }
}

Swift::Void __swiftcall AXSDKShotNSControllerImplementation.receivedObservation(_:forDetector:)(SNClassificationResult _, SNClassifySoundRequest forDetector)
{
  uint64_t isa = (uint64_t)_.super.isa;
  id v5 = [(objc_class *)_.super.isa classifications];
  sub_226F46D98(0, &qword_2681620D0);
  uint64_t v6 = sub_226F7AB58();

  if ((v6 & 0xC000000000000001) != 0)
  {
    id v7 = (id)MEMORY[0x22A66F200](0, v6);
  }
  else
  {
    if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_23;
    }
    id v7 = *(id *)(v6 + 32);
  }
  id v8 = v7;
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v8, sel_identifier);

  uint64_t v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v12 = v11;

  if (v10 == 49 && v12 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = sub_226F7AF18();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0) {
      return;
    }
  }
  id v15 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_currentRequests);
  id v16 = objc_msgSend(v15, sel_allKeysForObject_, forDetector.super.isa);

  uint64_t v17 = sub_226F7AB58();
  if (!*(void *)(v17 + 16))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  sub_226F46838(v17 + 32, (uint64_t)&v24);
  swift_bridgeObjectRelease();
  if (!*((void *)&v25 + 1))
  {
LABEL_19:
    sub_226F46894((uint64_t)&v24);
    return;
  }
  if (swift_dynamicCast())
  {
    id v18 = objc_msgSend((id)isa, sel_classifications);
    uint64_t isa = sub_226F7AB58();

    if ((isa & 0xC000000000000001) == 0)
    {
      if (!*(void *)((isa & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      id v19 = *(id *)(isa + 32);
LABEL_17:
      id v20 = v19;
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_confidence);
      double v22 = v21;

      uint64_t v23 = (void *)sub_226F7AAD8();
      swift_bridgeObjectRelease();
      *(float *)&double v22 = v22;
      AXSDSoundDetectionGenerateUserNotificationForCustomDetector(v23, *(float *)&v22);

      return;
    }
LABEL_23:
    id v19 = (id)MEMORY[0x22A66F200](0, isa);
    goto LABEL_17;
  }
}

Swift::Void __swiftcall AXSDKShotNSControllerImplementation.receivedCompletion(_:)(SNClassifySoundRequest a1)
{
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_226F7AA58();
  __swift_project_value_buffer(v3, (uint64_t)qword_268162650);
  id v4 = v1;
  id v5 = a1.super.isa;
  id v18 = v4;
  uint64_t v6 = v5;
  id v7 = sub_226F7AA48();
  os_log_type_t v8 = sub_226F7AC58();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v19 = v17;
    *(_DWORD *)uint64_t v9 = 136315394;
    id v11 = v18;
    id v12 = objc_msgSend(v11, sel_description);
    uint64_t v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v15 = v14;

    sub_226F44310(v13, v15, &v19);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    id v16 = v6;
    sub_226F7ACD8();
    void *v10 = v6;

    _os_log_impl(&dword_226F20000, v7, v8, "[%s]: received completion for: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v17, -1, -1);
    MEMORY[0x22A66FDC0](v9, -1, -1);
  }
  else
  {
  }
}

void AXSDKShotNSControllerImplementation.receivedError(_:fromDetector:)(void *a1, void *a2)
{
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_226F7AA58();
  __swift_project_value_buffer(v5, (uint64_t)qword_268162650);
  id v6 = v2;
  id v7 = a2;
  id v8 = a1;
  id v9 = v6;
  id v10 = v7;
  id v11 = a1;
  oslog = sub_226F7AA48();
  os_log_type_t v12 = sub_226F7AC48();
  if (os_log_type_enabled(oslog, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    unint64_t v14 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v25 = v22;
    *(_DWORD *)uint64_t v13 = 136315650;
    id v15 = v9;
    id v16 = objc_msgSend(v15, sel_description);
    uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v19 = v18;

    sub_226F44310(v17, v19, &v25);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2112;
    id v20 = v10;
    sub_226F7ACD8();
    void *v14 = v10;

    *(_WORD *)(v13 + 22) = 2112;
    id v21 = a1;
    uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
    sub_226F7ACD8();
    v14[1] = v24;

    _os_log_impl(&dword_226F20000, oslog, v12, "[%s]: received error during detection of detector: %@. error: %@", (uint8_t *)v13, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v22, -1, -1);
    MEMORY[0x22A66FDC0](v13, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_226F43EDC(uint64_t a1, uint64_t a2)
{
  return sub_226F440D4(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_226F43EF4(uint64_t a1, id *a2)
{
  uint64_t result = sub_226F7AAE8();
  *a2 = 0;
  return result;
}

uint64_t sub_226F43F6C(uint64_t a1, id *a2)
{
  char v3 = sub_226F7AAF8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_226F43FEC@<X0>(uint64_t *a1@<X8>)
{
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v2 = sub_226F7AAD8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_226F44030()
{
  uint64_t v0 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v2 = v1;
  if (v0 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_226F7AF18();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_226F440BC(uint64_t a1, uint64_t a2)
{
  return sub_226F440D4(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_226F440D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_226F44118()
{
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  sub_226F7AB28();
  return swift_bridgeObjectRelease();
}

uint64_t sub_226F4416C()
{
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  sub_226F7AFA8();
  sub_226F7AB28();
  uint64_t v0 = sub_226F7AFC8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_226F441E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_226F7AAD8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_226F44228@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_226F44254(uint64_t a1)
{
  uint64_t v2 = sub_226F46AA0(&qword_268162740, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
  uint64_t v3 = sub_226F46AA0(&qword_268162170, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_226F44310(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_226F443E4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_226F46838((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_226F46838((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_226F443E4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_226F7ACE8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_226F445A0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_226F7ADF8();
  if (!v8)
  {
    sub_226F7AE88();
    __break(1u);
LABEL_17:
    uint64_t result = sub_226F7AED8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_226F445A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_226F44638(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_226F44818(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_226F44818(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_226F44638(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_226F447B0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_226F7ADC8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_226F7AE88();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_226F7AB38();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_226F7AED8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_226F7AE88();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_226F447B0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681621A0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_226F44818(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681621A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_226F7AED8();
  __break(1u);
  return result;
}

uint64_t sub_226F44968(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_226F7AFA8();
  swift_bridgeObjectRetain();
  sub_226F7AB28();
  uint64_t v8 = sub_226F7AFC8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_226F7AF18() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_226F7AF18() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_226F45068(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_226F44B18(void *a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_226F7AD48();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_226F46D98(0, (unint64_t *)&qword_268162770);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_226F7AD38();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_226F6A1AC(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_226F6A674();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_226F44FE4((uint64_t)v8, v22);
    *unint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_226F7ACB8();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_226F46D98(0, (unint64_t *)&qword_268162770);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_226F7ACC8();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_226F7ACC8();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    id v8 = a2;
    sub_226F45204((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_226F44DB8(void *a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  sub_226F7AFA8();
  swift_bridgeObjectRetain();
  sub_226F7AB28();
  uint64_t v7 = sub_226F7AFC8();
  swift_bridgeObjectRelease();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    id v24 = a2;
    sub_226F4538C((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  uint64_t v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v12 = v11;
  if (v10 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = sub_226F7AF18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = ~v8;
      do
      {
        unint64_t v9 = (v9 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        uint64_t v19 = v18;
        if (v17 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v19 == v20) {
          goto LABEL_16;
        }
        char v22 = sub_226F7AF18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  uint64_t v26 = *(void **)(*(void *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  id v27 = v26;
  return 0;
}

unint64_t sub_226F44FE4(uint64_t a1, uint64_t a2)
{
  sub_226F7ACB8();
  unint64_t result = sub_226F7AD18();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_226F45068(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  size_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_226F6A394();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_226F6AC28();
      goto LABEL_22;
    }
    sub_226F455BC();
  }
  uint64_t v11 = *v4;
  sub_226F7AFA8();
  sub_226F7AB28();
  unint64_t result = sub_226F7AFC8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    char v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_226F7AF18(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_226F7AF28();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_226F7AF18();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void sub_226F45204(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_226F6A674();
  }
  else
  {
    if (v7 > v6)
    {
      sub_226F6ADDC();
      goto LABEL_14;
    }
    sub_226F4586C();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_226F7ACB8();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_226F46D98(0, (unint64_t *)&qword_268162770);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_226F7ACC8();

    if (v12)
    {
LABEL_13:
      sub_226F7AF28();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_226F7ACC8();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

uint64_t sub_226F4538C(uint64_t result, unint64_t a2, char a3)
{
  unint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_22;
  }
  if (a3)
  {
    sub_226F6A914();
  }
  else
  {
    if (v8 > v7)
    {
      unint64_t result = (uint64_t)sub_226F6AF88();
LABEL_22:
      uint64_t v25 = *v4;
      *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(void *)(*(void *)(v25 + 48) + 8 * a2) = v6;
      uint64_t v26 = *(void *)(v25 + 16);
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (!v27)
      {
        *(void *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_226F45AE8();
  }
  uint64_t v9 = *v3;
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  sub_226F7AFA8();
  sub_226F7AB28();
  uint64_t v10 = sub_226F7AFC8();
  unint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v12 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v14 = v13;
  if (v12 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  char v17 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  unint64_t result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    uint64_t v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v19 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      uint64_t v21 = v20;
      if (v19 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v21 == v22) {
        goto LABEL_25;
      }
      char v24 = sub_226F7AF18();
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for AXSDSoundDetectionType();
  unint64_t result = sub_226F7AF28();
  __break(1u);
  return result;
}

uint64_t sub_226F455BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681621A8);
  uint64_t v3 = sub_226F7AD98();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_226F7AFA8();
    swift_bridgeObjectRetain();
    sub_226F7AB28();
    uint64_t result = sub_226F7AFC8();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_226F4586C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162198);
  uint64_t v3 = sub_226F7AD98();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  BOOL v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_226F7ACB8();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_226F45AE8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162180);
  uint64_t v3 = sub_226F7AD98();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  BOOL v27 = v0;
  uint64_t v28 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v13);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    sub_226F7AFA8();
    id v18 = v17;
    sub_226F7AB28();
    uint64_t v19 = sub_226F7AFC8();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v4 + 48) + 8 * v11) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_226F45DC8(void *a1, void *a2)
{
}

void sub_226F45DF0(void *a1, void *a2)
{
}

void sub_226F45E18(void *a1, void *a2)
{
}

void sub_226F45E40(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v62 = a4;
  uint64_t v63 = a5;
  uint64_t v61 = a3;
  uint64_t v7 = sub_226F7AA78();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  v66 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_226F7AA98();
  uint64_t v65 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  v64 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_226F7AA58();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_268162638);
  id v14 = a2;
  id v15 = a1;
  int64_t v16 = (char *)v14;
  id v17 = v15;
  uint64_t v60 = v13;
  id v18 = sub_226F7AA48();
  os_log_type_t v19 = sub_226F7AC58();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v58 = v10;
    uint64_t v21 = v20;
    uint64_t v57 = swift_slowAlloc();
    aBlock[0] = v57;
    *(_DWORD *)uint64_t v21 = 136315394;
    uint64_t v56 = v21 + 4;
    unint64_t v22 = v16;
    uint64_t v59 = v7;
    char v23 = v22;
    uint64_t v24 = v8;
    id v25 = objc_msgSend(v22, sel_description);
    uint64_t v26 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v28 = v27;

    uint64_t v8 = v24;
    uint64_t v69 = sub_226F44310(v26, v28, aBlock);
    sub_226F7ACD8();

    uint64_t v7 = v59;
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v69 = (uint64_t)v17;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268162178);
    uint64_t v29 = sub_226F7AB18();
    uint64_t v69 = sub_226F44310(v29, v30, aBlock);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v18, v19, "[%s]: start listening with delegate: %s", (uint8_t *)v21, 0x16u);
    uint64_t v31 = v57;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v31, -1, -1);
    uint64_t v32 = v21;
    uint64_t v10 = v58;
    MEMORY[0x22A66FDC0](v32, -1, -1);
  }
  else
  {
  }
  unint64_t v33 = (id *)&v16[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  if (objc_msgSend(*v33, sel_containsListenDelegate_, v17))
  {
    os_log_type_t v34 = v16;
    id v35 = v17;
    uint64_t v36 = v34;
    id v37 = v35;
    id v38 = sub_226F7AA48();
    os_log_type_t v39 = sub_226F7AC38();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      aBlock[0] = v41;
      *(_DWORD *)uint64_t v40 = 136315394;
      int v42 = v36;
      id v43 = objc_msgSend(v42, sel_description);
      uint64_t v44 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v46 = v45;

      uint64_t v67 = sub_226F44310(v44, v46, aBlock);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2080;
      uint64_t v67 = (uint64_t)v37;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268162178);
      uint64_t v47 = sub_226F7AB18();
      uint64_t v67 = sub_226F44310(v47, v48, aBlock);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v38, v39, "[%s]: listen engine already contains delegate: %s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v41, -1, -1);
      MEMORY[0x22A66FDC0](v40, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    sub_226F46D98(0, (unint64_t *)&qword_2681622D0);
    uint64_t v49 = (void *)sub_226F7AC88();
    uint64_t v50 = swift_allocObject();
    *(void *)(v50 + 16) = v16;
    *(void *)(v50 + 24) = v17;
    aBlock[4] = v62;
    aBlock[5] = v50;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_226F42574;
    aBlock[3] = v63;
    v51 = _Block_copy(aBlock);
    uint64_t v52 = v16;
    id v53 = v17;
    swift_release();
    uint64_t v54 = v64;
    sub_226F7AA88();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_226F46AA0((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
    sub_226F4671C();
    uint64_t v55 = v66;
    sub_226F7ACF8();
    MEMORY[0x22A66F0C0](0, v54, v55, v51);
    _Block_release(v51);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v55, v7);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v54, v10);
  }
}

uint64_t sub_226F46544(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_226F7AC08();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_226F44968(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for AXSDKShotNSControllerImplementation()
{
  return self;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_226F4667C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_226F466B4()
{
  uint64_t v1 = *(char **)(v0 + 16);
  sub_226F492E4(v1, v1);
  uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager];
  return objc_msgSend(v2, sel_stopDetection);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_226F4671C()
{
  unint64_t result = qword_2681620C0;
  if (!qword_2681620C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268162720);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681620C0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

id sub_226F467C0()
{
  return objc_msgSend(*(id *)(*(void *)(v0 + 16)+ OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_removeAllDetectors);
}

uint64_t sub_226F467DC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_226F4681C()
{
  return objc_msgSend(*(id *)(*(void *)(v0 + 16)+ OBJC_IVAR____TtC18AXSoundDetectionUI35AXSDKShotNSControllerImplementation_modelManager), sel_startDetectionWithFormat_, *(void *)(v0 + 24));
}

uint64_t sub_226F46838(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_226F46894(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681620D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t method lookup function for AXSDKShotNSControllerImplementation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXSDKShotNSControllerImplementation);
}

uint64_t dispatch thunk of AXSDKShotNSControllerImplementation.currentDetectionTypes.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AXSDKShotNSControllerImplementation.__allocating_init(modelManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of AXSDKShotNSControllerImplementation.add(customDetector:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AXSDKShotNSControllerImplementation.remove(customDetector:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AXSDKShotNSControllerImplementation.removeAllListenTypes()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

void type metadata accessor for AXSDSoundDetectionType()
{
  if (!qword_268162148)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268162148);
    }
  }
}

uint64_t sub_226F46A58()
{
  return sub_226F46AA0(&qword_268162150, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
}

uint64_t sub_226F46AA0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_226F46AE8()
{
  return sub_226F46AA0(&qword_268162158, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
}

uint64_t sub_226F46B30()
{
  return sub_226F46AA0((unint64_t *)&unk_268162160, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
}

id sub_226F46B7C()
{
  return sub_226F48748(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_226F46B88(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_226F7AE98();
    swift_bridgeObjectRelease();
  }
  sub_226F46D98(0, (unint64_t *)&qword_268162770);
  sub_226F46DD4();
  uint64_t result = sub_226F7AC08();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_226F7AE98();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)MEMORY[0x22A66F200](i, a1);
        sub_226F44B18(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_226F44B18(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_226F46CDC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for AXSDSoundDetectionType();
  sub_226F46AA0(&qword_268162740, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
  uint64_t result = sub_226F7AC08();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (void **)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      sub_226F44DB8(&v6, v5);

      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_226F46D98(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_226F46DD4()
{
  unint64_t result = qword_268162190;
  if (!qword_268162190)
  {
    sub_226F46D98(255, (unint64_t *)&qword_268162770);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268162190);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t objectdestroy_22Tm()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t AXSDSoundDetectionType.detectorIdentifier.getter@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162210);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_226F7A948();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  AXSDSoundDetectionType.builtInDetectorIdentifier.getter(a1, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_226F47C58((uint64_t)v5);
    uint64_t v10 = sub_226F7A938();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a2, 1, 1, v10);
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v12(v9, v5, v6);
    v12(a2, v9, v6);
    uint64_t v13 = *MEMORY[0x263F178D0];
    uint64_t v14 = sub_226F7A938();
    uint64_t v15 = *(void *)(v14 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 104))(a2, v13, v14);
    return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(a2, 0, 1, v14);
  }
}

uint64_t AXSDSoundDetectionType.builtInDetectorIdentifier.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v6 = v5;
  if (v4 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  char v9 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
LABEL_15:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17908];
LABEL_16:
    uint64_t v21 = *v20;
    uint64_t v22 = sub_226F7A948();
    uint64_t v105 = *(void *)(v22 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v105 + 104))(a2, v21, v22);
    char v23 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v105 + 56);
    return v23(a2, 0, 1, v22);
  }
  uint64_t v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v12 = v11;
  if (v10 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_20;
  }
  char v15 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
LABEL_20:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17940];
    goto LABEL_16;
  }
  uint64_t v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v18 = v17;
  if (v16 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v18 == v19)
  {
    swift_bridgeObjectRelease_n();
LABEL_22:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17920];
    goto LABEL_16;
  }
  char v25 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_22;
  }
  uint64_t v26 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v28 = v27;
  if (v26 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v28 == v29)
  {
    swift_bridgeObjectRelease_n();
LABEL_27:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17928];
    goto LABEL_16;
  }
  char v30 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v30) {
    goto LABEL_27;
  }
  uint64_t v31 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v33 = v32;
  if (v31 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v33 == v34)
  {
    swift_bridgeObjectRelease_n();
LABEL_32:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17930];
    goto LABEL_16;
  }
  char v35 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v35) {
    goto LABEL_32;
  }
  uint64_t v36 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v38 = v37;
  if (v36 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v38 == v39)
  {
    swift_bridgeObjectRelease_n();
LABEL_37:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17910];
    goto LABEL_16;
  }
  char v40 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v40) {
    goto LABEL_37;
  }
  uint64_t v41 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v43 = v42;
  if (v41 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v43 == v44)
  {
    swift_bridgeObjectRelease_n();
LABEL_42:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F178F8];
    goto LABEL_16;
  }
  char v45 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v45) {
    goto LABEL_42;
  }
  uint64_t v46 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v48 = v47;
  if (v46 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v48 == v49)
  {
    swift_bridgeObjectRelease_n();
LABEL_47:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17938];
    goto LABEL_16;
  }
  char v50 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v50) {
    goto LABEL_47;
  }
  uint64_t v51 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v53 = v52;
  if (v51 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v53 == v54)
  {
    swift_bridgeObjectRelease_n();
LABEL_52:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17950];
    goto LABEL_16;
  }
  char v55 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v55) {
    goto LABEL_52;
  }
  uint64_t v56 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v58 = v57;
  if (v56 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v58 == v59)
  {
    swift_bridgeObjectRelease_n();
LABEL_57:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17948];
    goto LABEL_16;
  }
  char v60 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v60) {
    goto LABEL_57;
  }
  uint64_t v61 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v63 = v62;
  if (v61 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v63 == v64)
  {
    swift_bridgeObjectRelease_n();
LABEL_62:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17958];
    goto LABEL_16;
  }
  char v65 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v65) {
    goto LABEL_62;
  }
  uint64_t v66 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v68 = v67;
  if (v66 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v68 == v69)
  {
    swift_bridgeObjectRelease_n();
LABEL_67:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F178F0];
    goto LABEL_16;
  }
  char v70 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v70) {
    goto LABEL_67;
  }
  uint64_t v71 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v73 = v72;
  if (v71 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v73 == v74)
  {
    swift_bridgeObjectRelease_n();
LABEL_72:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17900];
    goto LABEL_16;
  }
  char v75 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v75) {
    goto LABEL_72;
  }
  uint64_t v76 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v78 = v77;
  if (v76 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v78 == v79)
  {
    swift_bridgeObjectRelease_n();
LABEL_77:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F17918];
    goto LABEL_16;
  }
  char v80 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v80) {
    goto LABEL_77;
  }
  uint64_t v81 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v83 = v82;
  if (v81 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v83 == v84)
  {
    swift_bridgeObjectRelease_n();
LABEL_82:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F178D8];
    goto LABEL_16;
  }
  char v85 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v85) {
    goto LABEL_82;
  }
  uint64_t v86 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v88 = v87;
  if (v86 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v88 == v89)
  {
    swift_bridgeObjectRelease_n();
LABEL_87:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F178E0];
    goto LABEL_16;
  }
  char v90 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v90) {
    goto LABEL_87;
  }
  uint64_t v91 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v93 = v92;
  if (v91 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v93 == v94)
  {
    swift_bridgeObjectRelease_n();
LABEL_92:
    uint64_t v20 = (unsigned int *)MEMORY[0x263F178E8];
    goto LABEL_16;
  }
  char v95 = sub_226F7AF18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v95) {
    goto LABEL_92;
  }
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v96 = sub_226F7AA58();
  __swift_project_value_buffer(v96, (uint64_t)qword_268162638);
  id v97 = a1;
  v98 = sub_226F7AA48();
  os_log_type_t v99 = sub_226F7AC48();
  if (os_log_type_enabled(v98, v99))
  {
    v100 = (uint8_t *)swift_slowAlloc();
    uint64_t v101 = swift_slowAlloc();
    uint64_t v106 = v101;
    *(_DWORD *)v100 = 136315138;
    uint64_t v102 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    sub_226F44310(v102, v103, &v106);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v98, v99, "Couldn't find a SoundRecognition.BuiltInDetectorIdentifier for: %s", v100, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v101, -1, -1);
    MEMORY[0x22A66FDC0](v100, -1, -1);
  }
  else
  {
  }
  uint64_t v104 = sub_226F7A948();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v104 - 8) + 56))(a2, 1, 1, v104);
}

uint64_t sub_226F47C58(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162210);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t AccessibilitySoundRecognition.BuiltInDetectorIdentifier.description.getter()
{
  id v0 = AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter();
  if (!v0) {
    return 0x6E776F6E6B6E55;
  }
  uint64_t v1 = v0;
  uint64_t v2 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

  return v2;
}

id AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter()
{
  uint64_t v1 = sub_226F7A948();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  int v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == *MEMORY[0x263F178E0])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D90];
LABEL_35:
    id v7 = *v6;
    id v8 = *v6;
    return v7;
  }
  if (v5 == *MEMORY[0x263F178F8])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D38];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17908])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D08];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17920])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D18];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17928])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D20];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17930])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D28];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17910])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D30];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17940])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D10];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17938])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D40];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17948])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D50];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17950])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D48];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17958])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D58];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F178F0])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D60];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17900])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D70];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F17918])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D80];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F178D8])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D88];
    goto LABEL_35;
  }
  if (v5 == *MEMORY[0x263F178E8])
  {
    uint64_t v6 = (id *)MEMORY[0x263F21D98];
    goto LABEL_35;
  }
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_226F7AA58();
  __swift_project_value_buffer(v10, (uint64_t)qword_268162638);
  uint64_t v11 = sub_226F7AA48();
  os_log_type_t v12 = sub_226F7AC48();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_226F20000, v11, v12, "Couldn't find a AXSDSoundDetectionType for the builtin identifier.", v13, 2u);
    MEMORY[0x22A66FDC0](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return 0;
}

uint64_t sub_226F480F8()
{
  id v0 = AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter();
  if (!v0) {
    return 0x6E776F6E6B6E55;
  }
  uint64_t v1 = v0;
  uint64_t v2 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

  return v2;
}

id sub_226F48158()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

double sub_226F481B0()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return (double)(unint64_t)objc_msgSend(*v1, sel_bufferSize);
}

uint64_t sub_226F4820C()
{
  return 0;
}

uint64_t sub_226F48214()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_isEnabled);
  swift_beginAccess();
  return *v1;
}

id sub_226F4825C(uint64_t a1)
{
  return sub_226F49264(a1, v1);
}

void sub_226F48264(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

id sub_226F4831C()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return objc_msgSend(*v1, sel_isListening);
}

id AXSDNSBaseControllerImplementation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id AXSDNSBaseControllerImplementation.init()()
{
  v0[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_debug] = 0;
  v0[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_isEnabled] = 0;
  uint64_t v1 = qword_268162050;
  uint64_t v2 = v0;
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_226F7AA58();
  __swift_project_value_buffer(v3, (uint64_t)qword_268162638);
  uint64_t v4 = sub_226F7AA48();
  os_log_type_t v5 = sub_226F7AC38();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_226F20000, v4, v5, "Initializing Base Non Secure Controller", v6, 2u);
    MEMORY[0x22A66FDC0](v6, -1, -1);
  }

  id v7 = objc_msgSend(self, sel_sharedInstance);
  *(void *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener] = v7;

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for AXSDNSBaseControllerImplementation();
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_226F48518()
{
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_226F7AA58();
  __swift_project_value_buffer(v1, (uint64_t)qword_268162638);
  id v2 = v0;
  uint64_t v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC38();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = v6;
    *(_DWORD *)os_log_type_t v5 = 136315138;
    id v7 = v2;
    id v8 = objc_msgSend(v7, sel_description);
    uint64_t v9 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v11 = v10;

    sub_226F44310(v9, v11, &v12);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v3, v4, "[%s]: start listening", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v6, -1, -1);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }
  else
  {
  }
  sub_226F45DC8(v2, v2);
}

id sub_226F48748(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return objc_msgSend(*v3, sel_addListenDelegate_, a2);
}

uint64_t sub_226F487A4()
{
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_226F7AA58();
  __swift_project_value_buffer(v1, (uint64_t)qword_268162638);
  id v2 = v0;
  uint64_t v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC38();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v13 = v6;
    *(_DWORD *)os_log_type_t v5 = 136315138;
    id v7 = v2;
    id v8 = objc_msgSend(v7, sel_description);
    uint64_t v9 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v11 = v10;

    sub_226F44310(v9, v11, &v13);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v3, v4, "[%s]: stop listening", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v6, -1, -1);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }
  else
  {
  }
  return sub_226F49654(v2, v2, (uint64_t)&unk_26DB21808, (uint64_t)sub_226F49B60, (uint64_t)&block_descriptor_24);
}

id AXSDNSBaseControllerImplementation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXSDNSBaseControllerImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall AXSDNSBaseControllerImplementation.listenEngineDidStart(withInputFormat:)(AVAudioFormat_optional *withInputFormat)
{
  v19[1] = *MEMORY[0x263EF8340];
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_226F7AA58();
  __swift_project_value_buffer(v3, (uint64_t)qword_268162638);
  os_log_type_t v4 = withInputFormat;
  id v5 = v1;
  uint64_t v6 = v4;
  id v18 = v5;
  id v7 = sub_226F7AA48();
  os_log_type_t v8 = sub_226F7AC58();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v16 = (void *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v19[0] = v17;
    *(_DWORD *)uint64_t v9 = 136315394;
    id v10 = v18;
    id v11 = objc_msgSend(v10, sel_description);
    uint64_t v12 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v14 = v13;

    sub_226F44310(v12, v14, v19);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    if (withInputFormat) {
      char v15 = v6;
    }
    sub_226F7ACD8();
    void *v16 = withInputFormat;

    _os_log_impl(&dword_226F20000, v7, v8, "[%s]: listen engine did start with format: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v16, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v17, -1, -1);
    MEMORY[0x22A66FDC0](v9, -1, -1);
  }
  else
  {
  }
}

void AXSDNSBaseControllerImplementation.listenEngineFailedToStartWithError(_:)(void *a1)
{
  if (a1)
  {
    id v3 = a1;
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_226F7AA58();
    __swift_project_value_buffer(v4, (uint64_t)qword_268162638);
    id v5 = a1;
    id v6 = v1;
    id v7 = a1;
    id v8 = v6;
    oslog = sub_226F7AA48();
    os_log_type_t v9 = sub_226F7AC48();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      id v11 = (void *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v31 = v12;
      *(_DWORD *)uint64_t v10 = 136315394;
      id v13 = v8;
      id v14 = objc_msgSend(v13, sel_description);
      uint64_t v15 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v17 = v16;

      sub_226F44310(v15, v17, &v31);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2112;
      id v18 = a1;
      uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
      sub_226F7ACD8();
      void *v11 = v30;

      _os_log_impl(&dword_226F20000, oslog, v9, "[%s]: listen engine failed to start: %@", (uint8_t *)v10, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v11, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v12, -1, -1);
      MEMORY[0x22A66FDC0](v10, -1, -1);

      return;
    }
  }
  else
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_226F7AA58();
    __swift_project_value_buffer(v19, (uint64_t)qword_268162638);
    oslog = v1;
    uint64_t v20 = sub_226F7AA48();
    os_log_type_t v21 = sub_226F7AC48();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v31 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v24 = oslog;
      id v25 = [v24 description];
      uint64_t v26 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v28 = v27;

      sub_226F44310(v26, v28, &v31);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v20, v21, "[%s]: listen engine failed to start.", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v23, -1, -1);
      MEMORY[0x22A66FDC0](v22, -1, -1);

      return;
    }
  }
}

id sub_226F49264(uint64_t a1, uint64_t a2)
{
  id v3 = (id *)(a2 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return objc_msgSend(*v3, sel_containsListenDelegate_, a1);
}

uint64_t type metadata accessor for AXSDNSBaseControllerImplementation()
{
  return self;
}

uint64_t sub_226F492E4(void *a1, void *a2)
{
  return sub_226F49654(a1, a2, (uint64_t)&unk_26DB21858, (uint64_t)sub_226F49B60, (uint64_t)&block_descriptor_31);
}

id sub_226F4930C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = (void **)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_226F49374@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_isEnabled);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_226F493C8(char *a1, void *a2)
{
  char v2 = *a1;
  id v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_isEnabled);
  uint64_t result = swift_beginAccess();
  *id v3 = v2;
  return result;
}

uint64_t method lookup function for AXSDNSBaseControllerImplementation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXSDNSBaseControllerImplementation);
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.listener.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.isListening.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.listenerBufferSize.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.isListenerListening.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.isSecure.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.isEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.listenerContains(delegate:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.startListening()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AXSDNSBaseControllerImplementation.stopListening()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t sub_226F49604(void *a1, void *a2)
{
  return sub_226F49654(a1, a2, (uint64_t)&unk_26DB217B8, (uint64_t)sub_226F49B60, (uint64_t)&block_descriptor_17);
}

uint64_t sub_226F4962C(void *a1, void *a2)
{
  return sub_226F49654(a1, a2, (uint64_t)&unk_26DB21768, (uint64_t)sub_226F49B60, (uint64_t)&block_descriptor_0);
}

uint64_t sub_226F49654(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v51 = a3;
  uint64_t v9 = sub_226F7AA78();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v54 = (char *)v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_226F7AA98();
  uint64_t v53 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v52 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_226F7AA58();
  __swift_project_value_buffer(v14, (uint64_t)qword_268162638);
  id v15 = a2;
  id v16 = a1;
  id v17 = v15;
  id v18 = v16;
  uint64_t v19 = sub_226F7AA48();
  os_log_type_t v20 = sub_226F7AC58();
  int v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v22 = swift_slowAlloc();
    int v46 = v21;
    uint64_t v23 = v22;
    uint64_t v47 = swift_slowAlloc();
    aBlock[0] = v47;
    *(_DWORD *)uint64_t v23 = 136315394;
    v45[1] = v23 + 4;
    id v24 = v17;
    uint64_t v49 = a5;
    id v25 = v24;
    id v26 = objc_msgSend(v24, sel_description);
    uint64_t v50 = v9;
    id v27 = v26;
    uint64_t v28 = v12;
    uint64_t v29 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    uint64_t v48 = a4;
    uint64_t v30 = v10;
    unint64_t v32 = v31;

    uint64_t v33 = v29;
    uint64_t v12 = v28;
    uint64_t v55 = sub_226F44310(v33, v32, aBlock);
    sub_226F7ACD8();

    uint64_t v10 = v30;
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2080;
    uint64_t v55 = (uint64_t)v18;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268162178);
    uint64_t v34 = sub_226F7AB18();
    uint64_t v55 = sub_226F44310(v34, v35, aBlock);
    a5 = v49;
    uint64_t v9 = v50;
    sub_226F7ACD8();

    a4 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v19, (os_log_type_t)v46, "[%s]: stop listening with delegate: %s", (uint8_t *)v23, 0x16u);
    uint64_t v36 = v47;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v36, -1, -1);
    MEMORY[0x22A66FDC0](v23, -1, -1);
  }
  else
  {
  }
  sub_226F49B1C();
  uint64_t v37 = (void *)sub_226F7AC88();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v17;
  *(void *)(v38 + 24) = v18;
  aBlock[4] = a4;
  aBlock[5] = v38;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_226F42574;
  aBlock[3] = a5;
  uint64_t v39 = _Block_copy(aBlock);
  id v40 = v17;
  id v41 = v18;
  swift_release();
  uint64_t v42 = v52;
  sub_226F7AA88();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_226F49B7C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  sub_226F4671C();
  uint64_t v43 = v54;
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v42, v43, v39);
  _Block_release(v39);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v43, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v42, v12);
}

unint64_t sub_226F49B1C()
{
  unint64_t result = qword_2681622D0;
  if (!qword_2681622D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2681622D0);
  }
  return result;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_226F49B7C()
{
  unint64_t result = qword_2681620B0;
  if (!qword_2681620B0)
  {
    sub_226F7AA78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681620B0);
  }
  return result;
}

id sub_226F49BE0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = (id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
  swift_beginAccess();
  return objc_msgSend(*v2, sel_removeListenDelegate_, v1);
}

uint64_t sub_226F49CBC()
{
  uint64_t v1 = (unint64_t *)(v0
                          + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors);
  swift_beginAccess();
  unint64_t v2 = *v1;
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v23 = MEMORY[0x263F8EE78];
  if (!(v2 >> 62))
  {
    uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_226F7AE98();
  uint64_t v4 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_31;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v7 = (id)MEMORY[0x22A66F200](i, v2);
    }
    else {
      id v7 = *(id *)(v2 + 8 * i + 32);
    }
    id v8 = v7;
    if (objc_msgSend(v7, sel_isCustom, v23))
    {
      sub_226F7AE08();
      sub_226F7AE28();
      sub_226F7AE38();
      sub_226F7AE18();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = v23;
  if (v23 < 0) {
    goto LABEL_27;
  }
LABEL_16:
  if ((v9 & 0x4000000000000000) == 0)
  {
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_28:
      swift_release();
      uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_29:
      uint64_t v22 = sub_226F46544(v12);
      swift_bridgeObjectRelease();
      return v22;
    }
    goto LABEL_18;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_226F7AE98();
  swift_release();
  if (!v10) {
    goto LABEL_28;
  }
LABEL_18:
  uint64_t v24 = v3;
  uint64_t result = sub_226F4BE98(0, v10 & ~(v10 >> 63), 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    uint64_t v11 = 0;
    uint64_t v12 = v3;
    do
    {
      if ((v9 & 0xC000000000000001) != 0) {
        id v13 = (id)MEMORY[0x22A66F200](v11, v9);
      }
      else {
        id v13 = *(id *)(v9 + 8 * v11 + 32);
      }
      uint64_t v14 = v13;
      id v15 = objc_msgSend(v13, sel_identifier, v24);
      uint64_t v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      uint64_t v18 = v17;

      uint64_t v24 = v12;
      unint64_t v20 = *(void *)(v12 + 16);
      unint64_t v19 = *(void *)(v12 + 24);
      if (v20 >= v19 >> 1) {
        sub_226F4BE98(v19 > 1, v20 + 1, 1);
      }
      ++v11;
      *(void *)(v12 + 16) = v20 + 1;
      uint64_t v21 = v12 + 16 * v20;
      *(void *)(v21 + 32) = v16;
      *(void *)(v21 + 40) = v18;
    }
    while (v10 != v11);
    swift_release();
    goto LABEL_29;
  }
LABEL_31:
  __break(1u);
  return result;
}

id AXSDKShotSecureControllerImplementation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id AXSDKShotSecureControllerImplementation.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation_detectorQueueManager;
  id v2 = objc_allocWithZone((Class)AXSDDetectorQueueManager);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = objc_msgSend(v2, sel_init);

  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_226F7AA58();
  __swift_project_value_buffer(v4, (uint64_t)qword_268162650);
  id v5 = sub_226F7AA48();
  os_log_type_t v6 = sub_226F7AC38();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_226F20000, v5, v6, "Initializing Secure Custom Sound Detection Controller", v7, 2u);
    MEMORY[0x22A66FDC0](v7, -1, -1);
  }

  type metadata accessor for AXSDKShotMonitor();
  uint64_t inited = swift_initStaticObject();
  if (qword_268162050 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v4, (uint64_t)qword_268162638);
  uint64_t v9 = sub_226F7AA48();
  os_log_type_t v10 = sub_226F7AC58();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_226F20000, v9, v10, "AXSDKShotMonitor: Start Monitoring", v11, 2u);
    MEMORY[0x22A66FDC0](v11, -1, -1);
  }

  *(void *)(inited + 16) = sub_226F5EA2C();
  swift_release();
  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for AXSDKShotSecureControllerImplementation();
  return objc_msgSendSuper2(&v13, sel_init);
}

void sub_226F4A1C8()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC18AXSoundDetectionUI39AXSDKShotSecureControllerImplementation_detectorQueueManager));
}

id AXSDKShotSecureControllerImplementation.__deallocating_deinit()
{
  uint64_t v1 = v0;
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226F7AA58();
  __swift_project_value_buffer(v2, (uint64_t)qword_268162638);
  uint64_t v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC58();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226F20000, v3, v4, "AXSDKShotMonitor: Stop Monitoring", v5, 2u);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }

  if (qword_268162080)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681620A0);
    sub_226F7ABD8();
    swift_task_isCancelled();
    swift_release();
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AXSDKShotSecureControllerImplementation();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_226F4A3A0(void *a1)
{
  return sub_226F4A448(a1, "[%s]: adding custom detector: %@", (uint64_t (*)(void))sub_226F60DE0);
}

uint64_t sub_226F4A428(void *a1)
{
  return sub_226F4A448(a1, "[%s]: removing custom detector: %@", (uint64_t (*)(void))sub_226F61330);
}

uint64_t sub_226F4A448(void *a1, char *a2, uint64_t (*a3)(void))
{
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_226F7AA58();
  __swift_project_value_buffer(v7, (uint64_t)qword_268162650);
  id v8 = v3;
  id v9 = a1;
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = sub_226F7AA48();
  os_log_type_t v13 = sub_226F7AC58();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v23 = (void *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v26 = v24;
    *(_DWORD *)uint64_t v14 = 136315394;
    format = a2;
    id v15 = v10;
    id v25 = a3;
    id v16 = objc_msgSend(v15, sel_description);
    uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v19 = v18;

    sub_226F44310(v17, v19, &v26);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2112;
    id v20 = v11;
    a3 = v25;
    sub_226F7ACD8();
    void *v23 = v11;

    _os_log_impl(&dword_226F20000, v12, v13, format, (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v23, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v24, -1, -1);
    MEMORY[0x22A66FDC0](v14, -1, -1);
  }
  else
  {
  }
  return a3(v11);
}

void sub_226F4A828(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_226F7A9A8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v9 = (char *)v92 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)v92 - v10;
  if (objc_msgSend(a2, sel_isCustom))
  {
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v12(v11, a1, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v11, v5);
    if (v13 == *MEMORY[0x263F17978])
    {
      if (qword_268162058 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_226F7AA58();
      __swift_project_value_buffer(v14, (uint64_t)qword_268162650);
      id v15 = v2;
      id v16 = a2;
      id v17 = v15;
      id v18 = v16;
      unint64_t v19 = sub_226F7AA48();
      os_log_type_t v20 = sub_226F7AC28();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        os_log_t v97 = (os_log_t)v22;
        *(_DWORD *)uint64_t v21 = 136315394;
        id v23 = v17;
        id v24 = objc_msgSend(v23, sel_description);
        uint64_t v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v27 = v26;

        uint64_t v96 = sub_226F44310(v25, v27, (uint64_t *)&v97);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 12) = 2080;
        id v28 = objc_msgSend(v18, sel_identifier);
        uint64_t v29 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v31 = v30;

        uint64_t v96 = sub_226F44310(v29, v31, (uint64_t *)&v97);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_226F20000, v19, v20, "[%s]: Custom Detector: %s is INACTIVE", (uint8_t *)v21, 0x16u);
        swift_arrayDestroy();
        uint64_t v32 = v22;
LABEL_11:
        MEMORY[0x22A66FDC0](v32, -1, -1);
        MEMORY[0x22A66FDC0](v21, -1, -1);

        return;
      }
    }
    else if (v13 == *MEMORY[0x263F17970])
    {
      if (qword_268162058 != -1) {
        swift_once();
      }
      uint64_t v46 = sub_226F7AA58();
      __swift_project_value_buffer(v46, (uint64_t)qword_268162650);
      id v47 = v2;
      id v48 = a2;
      id v49 = v47;
      id v50 = v48;
      uint64_t v51 = sub_226F7AA48();
      os_log_type_t v52 = sub_226F7AC28();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v53 = swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        os_log_t v97 = (os_log_t)v54;
        *(_DWORD *)uint64_t v53 = 136315394;
        id v55 = v49;
        id v56 = objc_msgSend(v55, sel_description);
        uint64_t v57 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v59 = v58;

        uint64_t v96 = sub_226F44310(v57, v59, (uint64_t *)&v97);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 12) = 2080;
        id v60 = objc_msgSend(v50, sel_identifier);
        uint64_t v61 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v63 = v62;

        uint64_t v96 = sub_226F44310(v61, v63, (uint64_t *)&v97);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_226F20000, v51, v52, "[%s]: Custom Detector: %s is ACTIVE", (uint8_t *)v53, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v54, -1, -1);
        MEMORY[0x22A66FDC0](v53, -1, -1);
      }
      else
      {
      }
      id v91 = objc_msgSend(v50, sel_identifier);
      if (!v91)
      {
        _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        id v91 = (id)sub_226F7AAD8();
        swift_bridgeObjectRelease();
      }
      AXSDSoundDetectionGenerateUserNotificationForCustomDetector(v91, 100.0);
    }
    else
    {
      if (qword_268162058 != -1) {
        swift_once();
      }
      uint64_t v65 = sub_226F7AA58();
      __swift_project_value_buffer(v65, (uint64_t)qword_268162650);
      v12(v9, a1, v5);
      id v66 = v2;
      id v67 = a2;
      id v68 = v66;
      id v69 = v67;
      char v70 = sub_226F7AA48();
      os_log_type_t v71 = sub_226F7AC48();
      int v72 = v71;
      if (os_log_type_enabled(v70, v71))
      {
        uint64_t v73 = swift_slowAlloc();
        os_log_t v94 = v70;
        uint64_t v74 = v73;
        char v95 = swift_slowAlloc();
        os_log_t v97 = v95;
        *(_DWORD *)uint64_t v74 = 136315650;
        int v93 = v72;
        v92[1] = v74 + 4;
        id v75 = v68;
        id v76 = objc_msgSend(v75, sel_description);
        uint64_t v77 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        uint64_t v78 = v69;
        unint64_t v80 = v79;

        uint64_t v96 = sub_226F44310(v77, v80, (uint64_t *)&v97);
        v92[2] = &v97;
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v74 + 12) = 2080;
        id v81 = objc_msgSend(v78, sel_identifier);
        uint64_t v82 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v84 = v83;

        uint64_t v96 = sub_226F44310(v82, v84, (uint64_t *)&v97);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v74 + 22) = 2080;
        uint64_t v85 = sub_226F4C41C(&qword_268162250, MEMORY[0x263F17980]);
        uint64_t v86 = sub_226F57104(v5, v85);
        uint64_t v96 = sub_226F44310(v86, v87, (uint64_t *)&v97);
        sub_226F7ACD8();
        swift_bridgeObjectRelease();
        uint64_t v88 = *(void (**)(char *, uint64_t))(v6 + 8);
        v88(v9, v5);
        os_log_t v89 = v94;
        _os_log_impl(&dword_226F20000, v94, (os_log_type_t)v93, "[%s]: Custom Detector: %s. FATAL ERROR - result is unknown and not handled. Result: %s", (uint8_t *)v74, 0x20u);
        char v90 = v95;
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v90, -1, -1);
        MEMORY[0x22A66FDC0](v74, -1, -1);
      }
      else
      {

        uint64_t v88 = *(void (**)(char *, uint64_t))(v6 + 8);
        v88(v9, v5);
      }
      v88(v11, v5);
    }
  }
  else
  {
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_226F7AA58();
    __swift_project_value_buffer(v33, (uint64_t)qword_268162650);
    id v34 = v2;
    id v35 = a2;
    char v95 = v34;
    id v36 = v35;
    unint64_t v19 = sub_226F7AA48();
    os_log_type_t v37 = sub_226F7AC48();
    if (os_log_type_enabled(v19, v37))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v38 = (void *)swift_slowAlloc();
      os_log_t v94 = (os_log_t)swift_slowAlloc();
      os_log_t v97 = v94;
      *(_DWORD *)uint64_t v21 = 136315394;
      uint64_t v39 = v95;
      id v40 = [v39 description];
      uint64_t v41 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v43 = v42;

      uint64_t v96 = sub_226F44310(v41, v43, (uint64_t *)&v97);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2112;
      uint64_t v96 = (uint64_t)v36;
      id v44 = v36;
      sub_226F7ACD8();
      void *v38 = v36;

      _os_log_impl(&dword_226F20000, v19, v37, "[%s]: Received detection for non-custom detector: %@", (uint8_t *)v21, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v38, -1, -1);
      os_log_t v45 = v94;
      swift_arrayDestroy();
      uint64_t v32 = (uint64_t)v45;
      goto LABEL_11;
    }

    uint64_t v64 = v95;
  }
}

uint64_t AXSDKShotDetector.detectorIdentifier.getter@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162240);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_226F7A928();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(v2, sel_identifier);
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

  sub_226F7A8F8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_226F4C3C0((uint64_t)v6, &qword_268162240);
    uint64_t v12 = sub_226F7A938();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a1, 1, 1, v12);
  }
  else
  {
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v14(v10, v6, v7);
    v14(a1, v10, v7);
    uint64_t v15 = *MEMORY[0x263F178C8];
    uint64_t v16 = sub_226F7A938();
    uint64_t v17 = *(void *)(v16 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 104))(a1, v15, v16);
    return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
  }
}

uint64_t AccessibilitySoundRecognition.DetectorIdentifier.customDetector.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_226F7A938();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_226F7A928();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  if ((*(unsigned int (**)(unsigned char *, uint64_t))(v3 + 88))(v5, v2) != *MEMORY[0x263F178C8])
  {
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  (*(void (**)(unsigned char *, uint64_t))(v3 + 96))(v5, v2);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 32))(v9, v5, v6);
  id v10 = objc_msgSend(self, sel_sharedInstance);
  id v11 = objc_msgSend(v10, sel_decodedKShotDetectors);

  sub_226F4C1F0();
  uint64_t v12 = sub_226F7AAB8();

  MEMORY[0x270FA5388](v13);
  *(void *)&v19[-16] = v9;
  sub_226F4BC6C((uint64_t (*)(void *))sub_226F4C230, (uint64_t)&v19[-32], v12);
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  if (!v15) {
    return 0;
  }
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_226F4B8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_226F7A928();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162260);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162240);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v27 = (uint64_t)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v26 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v26 - v17;
  sub_226F7A8F8();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v16, a2, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v16, 0, 1, v3);
  uint64_t v19 = (uint64_t)&v10[*(int *)(v8 + 56)];
  sub_226F4C358((uint64_t)v18, (uint64_t)v10);
  sub_226F4C358((uint64_t)v16, v19);
  os_log_type_t v20 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v20((uint64_t)v10, 1, v3) == 1)
  {
    uint64_t v21 = &qword_268162240;
    sub_226F4C3C0((uint64_t)v16, &qword_268162240);
    sub_226F4C3C0((uint64_t)v18, &qword_268162240);
    if (v20(v19, 1, v3) == 1)
    {
      char v22 = -1;
    }
    else
    {
      uint64_t v21 = &qword_268162260;
      char v22 = 0;
    }
  }
  else
  {
    sub_226F4C358((uint64_t)v10, v27);
    if (v20(v19, 1, v3) == 1)
    {
      sub_226F4C3C0((uint64_t)v16, &qword_268162240);
      sub_226F4C3C0((uint64_t)v18, &qword_268162240);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v27, v3);
      char v22 = 0;
      uint64_t v21 = &qword_268162260;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v6, v19, v3);
      sub_226F4C41C(&qword_268162268, MEMORY[0x263F07508]);
      uint64_t v23 = v27;
      char v22 = sub_226F7AAC8();
      id v24 = *(void (**)(char *, uint64_t))(v4 + 8);
      v24(v6, v3);
      uint64_t v21 = &qword_268162240;
      sub_226F4C3C0((uint64_t)v16, &qword_268162240);
      sub_226F4C3C0((uint64_t)v18, &qword_268162240);
      v24((char *)v23, v3);
    }
  }
  sub_226F4C3C0((uint64_t)v10, v21);
  return v22 & 1;
}

uint64_t sub_226F4BC6C(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v23 = a3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v25 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    uint64_t v17 = (uint64_t *)(*(void *)(a3 + 48) + 16 * i);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    os_log_type_t v20 = *(void **)(*(void *)(a3 + 56) + 8 * i);
    v24[0] = *v17;
    v24[1] = v18;
    v24[2] = v20;
    swift_bridgeObjectRetain();
    id v21 = v20;
    char v22 = a1(v24);
    if (v4)
    {
      swift_release();

      swift_bridgeObjectRelease();
      return v19;
    }
    if (v22)
    {
      swift_release();
      return v19;
    }

    uint64_t result = swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v11++, 1)) {
      break;
    }
    if (v11 >= v25) {
      goto LABEL_28;
    }
    unint64_t v15 = *(void *)(v23 + 8 * v11);
    if (!v15)
    {
      int64_t v16 = v11 + 1;
      if (v11 + 1 >= v25) {
        goto LABEL_28;
      }
      unint64_t v15 = *(void *)(v23 + 8 * v16);
      if (v15) {
        goto LABEL_16;
      }
      int64_t v16 = v11 + 2;
      if (v11 + 2 >= v25) {
        goto LABEL_28;
      }
      unint64_t v15 = *(void *)(v23 + 8 * v16);
      if (v15) {
        goto LABEL_16;
      }
      int64_t v16 = v11 + 3;
      if (v11 + 3 >= v25) {
        goto LABEL_28;
      }
      unint64_t v15 = *(void *)(v23 + 8 * v16);
      if (v15)
      {
LABEL_16:
        int64_t v11 = v16;
        goto LABEL_17;
      }
      int64_t v16 = v11 + 4;
      if (v11 + 4 < v25)
      {
        unint64_t v15 = *(void *)(v23 + 8 * v16);
        if (!v15)
        {
          while (1)
          {
            int64_t v11 = v16 + 1;
            if (__OFADD__(v16, 1)) {
              goto LABEL_31;
            }
            if (v11 >= v25) {
              goto LABEL_28;
            }
            unint64_t v15 = *(void *)(v23 + 8 * v11);
            ++v16;
            if (v15) {
              goto LABEL_17;
            }
          }
        }
        goto LABEL_16;
      }
LABEL_28:
      swift_release();
      return 0;
    }
LABEL_17:
    unint64_t v9 = (v15 - 1) & v15;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_226F4BE98(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_226F4BED8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_226F4BEB8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_226F4C044(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_226F4BED8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162270);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_226F7AED8();
  __break(1u);
  return result;
}

uint64_t sub_226F4C044(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268162258);
    id v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    id v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    type metadata accessor for AXSDSoundDetectionType();
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_226F7AED8();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AXSDKShotSecureControllerImplementation()
{
  return self;
}

unint64_t sub_226F4C1F0()
{
  unint64_t result = qword_268162248;
  if (!qword_268162248)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268162248);
  }
  return result;
}

uint64_t sub_226F4C230(uint64_t a1)
{
  return sub_226F4B8A0(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t method lookup function for AXSDKShotSecureControllerImplementation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXSDKShotSecureControllerImplementation);
}

uint64_t dispatch thunk of AXSDKShotSecureControllerImplementation.currentDetectionTypes.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AXSDKShotSecureControllerImplementation.add(customDetector:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXSDKShotSecureControllerImplementation.remove(customDetector:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AXSDKShotSecureControllerImplementation.removeAllListenTypes()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t sub_226F4C358(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226F4C3C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_226F4C41C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_226F4C464(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_226F4C47C()
{
  return sub_226F7AFC8();
}

uint64_t sub_226F4C4C4()
{
  return sub_226F7AFB8();
}

uint64_t sub_226F4C4F0()
{
  return sub_226F7AFC8();
}

double sub_226F4C544()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_sampleLength;
  swift_beginAccess();
  return *(double *)v1;
}

id sub_226F4C5D8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_226F4C690(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = a1;
}

void sub_226F4C6E4(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

uint64_t (*sub_226F4C748())()
{
  return j__swift_endAccess;
}

void sub_226F4C7A8(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

void *sub_226F4C80C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

double sub_226F4C85C()
{
  return (double)(unint64_t)objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener), sel_bufferSize);
}

id sub_226F4C8A4()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener), sel_isListening);
}

uint64_t sub_226F4C8D0()
{
  return *(void *)(v0
                   + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount);
}

uint64_t sub_226F4C8E0(uint64_t result)
{
  if (__OFADD__(result, 2)) {
    __break(1u);
  }
  else {
    *(void *)(v1
  }
              + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount) = result + 2;
  return result;
}

void *(*sub_226F4C8FC(void *a1))(void *result, char a2)
{
  uint64_t v2 = OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount;
  a1[1] = v1;
  a1[2] = v2;
  *a1 = *(void *)(v1 + v2);
  return sub_226F4C930;
}

void *sub_226F4C930(void *result, char a2)
{
  uint64_t v2 = *result + 2;
  BOOL v3 = __OFADD__(*result, 2);
  if (a2)
  {
    if (!v3)
    {
LABEL_8:
      *(void *)(result[1] + result[2]) = v2;
      return result;
    }
    __break(1u);
  }
  if (!v3) {
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t sub_226F4CA70()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  id v2 = objc_msgSend(*v1, sel_currentDetectors);
  type metadata accessor for AXSDSoundDetectionType();
  uint64_t v3 = sub_226F7AB58();

  uint64_t v4 = sub_226F46CDC(v3);
  swift_bridgeObjectRelease();
  return v4;
}

void sub_226F4CB0C(char a1)
{
  int v2 = a1 & 1;
  uint64_t v3 = (unsigned __int8 *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining];
  swift_beginAccess();
  if (*v3 != v2)
  {
    id v4 = objc_msgSend(self, sel_sharedInstance);
    objc_msgSend(v4, sel_setIsActivelyTrainingAKShotModel_, *v3);

    if (*v3 == 1)
    {
      if (qword_268162058 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_226F7AA58();
      __swift_project_value_buffer(v5, (uint64_t)qword_268162650);
      unint64_t v6 = v1;
      int64_t v7 = sub_226F7AA48();
      os_log_type_t v8 = sub_226F7AC58();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        uint64_t v10 = swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 136315138;
        aBlock[0] = v10;
        int64_t v11 = v6;
        id v12 = objc_msgSend(v11, sel_description);
        uint64_t v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v15 = v14;

        uint64_t v33 = sub_226F44310(v13, v15, aBlock);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_226F20000, v7, v8, "[%s]: BEGIN actively training kshot model", v9, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v10, -1, -1);
        MEMORY[0x22A66FDC0](v9, -1, -1);
      }
      else
      {
      }
      uint64_t v27 = *(void **)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_dispatchTimer];
      double v28 = *(double *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_maximumActiveTrainingDuration];
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = v6;
      aBlock[4] = (uint64_t)sub_226F55864;
      aBlock[5] = v29;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_226F42574;
      aBlock[3] = (uint64_t)&block_descriptor_87;
      unint64_t v30 = _Block_copy(aBlock);
      unint64_t v31 = v6;
      swift_release();
      objc_msgSend(v27, sel_afterDelay_processBlock_, v30, v28);
      _Block_release(v30);
    }
    else
    {
      objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_dispatchTimer], sel_cancel);
      if (qword_268162058 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_226F7AA58();
      __swift_project_value_buffer(v16, (uint64_t)qword_268162650);
      uint64_t v17 = v1;
      uint64_t v18 = sub_226F7AA48();
      os_log_type_t v19 = sub_226F7AC58();
      if (os_log_type_enabled(v18, v19))
      {
        os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        aBlock[0] = v21;
        *(_DWORD *)os_log_type_t v20 = 136315138;
        char v22 = v17;
        id v23 = objc_msgSend(v22, sel_description);
        uint64_t v24 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v26 = v25;

        uint64_t v33 = sub_226F44310(v24, v26, aBlock);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_226F20000, v18, v19, "[%s]: END actively training kshot model", v20, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v21, -1, -1);
        MEMORY[0x22A66FDC0](v20, -1, -1);
      }
      else
      {
      }
    }
  }
}

uint64_t sub_226F4CFD4(uint64_t a1)
{
  uint64_t v1 = (unsigned char *)(a1
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining);
  swift_beginAccess();
  uint64_t v2 = *v1;
  unsigned char *v1 = 0;
  return sub_226F4CB0C(v2);
}

uint64_t sub_226F4D028()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining);
  swift_beginAccess();
  return *v1;
}

id AXSDKShotNSRecordingControllerImplementation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AXSDKShotNSRecordingControllerImplementation.init()()
{
  uint64_t v34 = sub_226F7AC78();
  uint64_t v1 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_226F7AC68();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_226F7AA98();
  MEMORY[0x270FA5388](v5 - 8);
  *(void *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_sampleLength] = 0x3EF7C6F8C751F177;
  *(void *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_maximumActiveTrainingDuration] = 0x408C200000000000;
  *(void *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_maxNumberOfTrainings] = 5;
  v0[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining] = 0;
  uint64_t v6 = qword_268162058;
  int64_t v7 = v0;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_226F7AA58();
  __swift_project_value_buffer(v8, (uint64_t)qword_268162650);
  uint64_t v9 = sub_226F7AA48();
  os_log_type_t v10 = sub_226F7AC38();
  if (os_log_type_enabled(v9, v10))
  {
    int64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v11 = 0;
    _os_log_impl(&dword_226F20000, v9, v10, "Initializing KShot Recording Controller", v11, 2u);
    MEMORY[0x22A66FDC0](v11, -1, -1);
  }

  id v12 = objc_msgSend(self, sel_sharedInstance);
  *(void *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener] = v12;
  uint64_t v13 = MEMORY[0x263F8EE78];
  *(void *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerHandlers] = sub_226F4D684(MEMORY[0x263F8EE78]);
  sub_226F49B1C();
  sub_226F7AA88();
  uint64_t v35 = v13;
  sub_226F5581C(&qword_2681622D8, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681622E0);
  sub_226F54380(&qword_2681622E8, &qword_2681622E0);
  sub_226F7ACF8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v34);
  *(void *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerQueue] = sub_226F7ACA8();
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F472D0]), sel_init);
  *(void *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_xpcHelperService] = v14;
  id v15 = objc_msgSend(objc_allocWithZone((Class)AXSDDetectorManager), sel_init);
  *(void *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager] = v15;
  id v16 = objc_msgSend(objc_allocWithZone((Class)AXSDKShotDetectorQueueManager), sel_init);
  *(void *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager] = v16;
  uint64_t v17 = (void *)sub_226F7AC88();
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F21398]), sel_initWithTargetSerialQueue_, v17);

  if (v18)
  {
    *(void *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_dispatchTimer] = v18;
    objc_msgSend(v18, sel_setAutomaticallyCancelPendingBlockUponSchedulingNewBlock_, 1);
    id v19 = v18;
    os_log_type_t v20 = (void *)sub_226F7AAD8();
    objc_msgSend(v19, sel_setLabel_, v20);

    uint64_t v21 = (objc_class *)type metadata accessor for AXSDKShotNSRecordingControllerImplementation();
    v36.receiver = v7;
    v36.super_class = v21;
    char v22 = (char *)objc_msgSendSuper2(&v36, sel_init);
    id v23 = (double *)&v22[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_sampleLength];
    swift_beginAccess();
    double v24 = *v23;
    unint64_t v25 = *(void **)&v22[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener];
    unint64_t v26 = v22;
    id v27 = objc_msgSend(objc_allocWithZone((Class)AXSDKShotRecordingManager), sel_initWithSampleLength_bufferSize_, v24, (double)(unint64_t)objc_msgSend(v25, sel_bufferSize));
    uint64_t v28 = OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager;
    uint64_t v29 = *(void **)&v26[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager];
    *(void *)&v26[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager] = v27;

    unint64_t v30 = *(void **)&v26[v28];
    if (v30) {
      objc_msgSend(v30, sel_setDelegate_, v26);
    }
    unint64_t v31 = (id *)&v26[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager];
    swift_beginAccess();
    objc_msgSend(*v31, sel_setDelegate_, v26);
    objc_msgSend(*(id *)&v26[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager], sel_setDelegate_, v26);
    id v32 = *(id *)&v26[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_xpcHelperService];
    objc_msgSend(v32, sel_setDelegate_, v26);
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_226F4D684(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162780);
  uint64_t v2 = (void *)sub_226F7AEC8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 40);
  while (1)
  {
    long long v11 = *v4;
    id v5 = *((id *)v4 - 1);
    swift_retain();
    unint64_t result = sub_226F740A4((uint64_t)v5);
    if (v7) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v2[6] + 8 * result) = v5;
    *(_OWORD *)(v2[7] + 16 * result) = v11;
    uint64_t v8 = v2[2];
    BOOL v9 = __OFADD__(v8, 1);
    uint64_t v10 = v8 + 1;
    if (v9) {
      goto LABEL_11;
    }
    v2[2] = v10;
    uint64_t v4 = (_OWORD *)((char *)v4 + 24);
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_226F4D7A4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162528);
  uint64_t v2 = (void *)sub_226F7AEC8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_retain();
    unint64_t result = sub_226F74054((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_226F4D8B0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162520);
  uint64_t v2 = (void *)sub_226F7AEC8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_bridgeObjectRetain();
    unint64_t result = sub_226F740F4((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_226F4D9E0()
{
  return sub_226F4FAC8("[%s]: start listening", (uint64_t)&unk_26DB218A8, (uint64_t)sub_226F5434C, (uint64_t)&block_descriptor_1);
}

void sub_226F4DA58(void *a1)
{
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_226F7AA58();
  __swift_project_value_buffer(v3, (uint64_t)qword_268162650);
  id v4 = v1;
  id v5 = a1;
  id v6 = (char *)v4;
  id v7 = v5;
  char v8 = sub_226F7AA48();
  os_log_type_t v9 = sub_226F7AC58();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v30 = v29;
    *(_DWORD *)uint64_t v10 = 136315394;
    BOOL v11 = v6;
    id v12 = objc_msgSend(v11, sel_description);
    uint64_t v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v15 = v14;

    sub_226F44310(v13, v15, &v30);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    id v16 = v7;
    sub_226F7ACD8();
    void *v28 = v7;

    _os_log_impl(&dword_226F20000, v8, v9, "[%s]: start listening to train detector: %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v28, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v29, -1, -1);
    MEMORY[0x22A66FDC0](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v17 = OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager;
  if (*(void *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager])
  {
    objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager], sel_addGeneralApplianceDetector);
    objc_msgSend(*(id *)&v6[v17], sel_setTargetDetector_, v7);
    sub_226F4D9E0();
  }
  else
  {
    id v18 = v6;
    id v19 = sub_226F7AA48();
    os_log_type_t v20 = sub_226F7AC48();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v30 = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      id v23 = v18;
      id v24 = objc_msgSend(v23, sel_description);
      uint64_t v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v27 = v26;

      sub_226F44310(v25, v27, &v30);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v19, v20, "[%s]: kshot recording manager failed to start. can not start listening to train detector.", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v22, -1, -1);
      MEMORY[0x22A66FDC0](v21, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_226F4DECC()
{
  uint64_t v1 = sub_226F7AA78();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226F7AA98();
  uint64_t v33 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v32 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_226F7AA58();
  __swift_project_value_buffer(v7, (uint64_t)qword_268162650);
  char v8 = v0;
  os_log_type_t v9 = sub_226F7AA48();
  os_log_type_t v10 = sub_226F7AC58();
  if (os_log_type_enabled(v9, v10))
  {
    BOOL v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    aBlock[0] = v29;
    uint64_t v30 = v4;
    *(_DWORD *)BOOL v11 = 136315138;
    unint64_t v27 = v11 + 4;
    uint64_t v28 = v11;
    id v12 = v8;
    uint64_t v13 = v5;
    uint64_t v14 = v1;
    id v15 = objc_msgSend(v12, sel_description);
    uint64_t v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    uint64_t v31 = v2;
    unint64_t v18 = v17;

    uint64_t v1 = v14;
    uint64_t v5 = v13;
    uint64_t v34 = sub_226F44310(v16, v18, aBlock);
    id v4 = v30;
    sub_226F7ACD8();

    uint64_t v2 = v31;
    swift_bridgeObjectRelease();
    id v19 = v28;
    _os_log_impl(&dword_226F20000, v9, v10, "[%s]: stop listening.", v28, 0xCu);
    uint64_t v20 = v29;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v20, -1, -1);
    MEMORY[0x22A66FDC0](v19, -1, -1);
  }
  else
  {
  }
  objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager], sel_stopListening);
  sub_226F49B1C();
  uint64_t v21 = (void *)sub_226F7AC88();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v8;
  aBlock[4] = (uint64_t)sub_226F543D0;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_226F42574;
  aBlock[3] = (uint64_t)&block_descriptor_6_0;
  id v23 = _Block_copy(aBlock);
  id v24 = v8;
  swift_release();
  uint64_t v25 = v32;
  sub_226F7AA88();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_226F5581C((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  sub_226F54380((unint64_t *)&qword_2681620C0, (uint64_t *)&unk_268162720);
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v25, v4, v23);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v25, v5);
}

id sub_226F4E368(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener), sel_removeListenDelegate_, a1);
  uint64_t v2 = (id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  objc_msgSend(*v2, sel_removeAllDetectors);
  objc_msgSend(*v2, sel_stopDetection);
  return objc_msgSend(*(id *)(a1+ OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager), sel_reset);
}

uint64_t sub_226F4E44C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v46 = a2;
  uint64_t v6 = sub_226F7AA78();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v49 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_226F7AA98();
  uint64_t v48 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v47 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_226F7AA58();
  __swift_project_value_buffer(v11, (uint64_t)qword_268162650);
  id v12 = v3;
  id v13 = a1;
  id v14 = v12;
  id v15 = v13;
  uint64_t v16 = sub_226F7AA48();
  os_log_type_t v17 = sub_226F7AC58();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v44 = v9;
    uint64_t v19 = v18;
    uint64_t v41 = (void *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    aBlock[0] = v42;
    *(_DWORD *)uint64_t v19 = 136315394;
    v40[1] = v19 + 4;
    id v20 = v14;
    id v21 = objc_msgSend(v20, sel_description);
    uint64_t v45 = v6;
    id v22 = v21;
    uint64_t v23 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    uint64_t v43 = a3;
    uint64_t v24 = v7;
    uint64_t v25 = v23;
    unint64_t v27 = v26;

    uint64_t v28 = v25;
    uint64_t v7 = v24;
    uint64_t v50 = sub_226F44310(v28, v27, aBlock);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2112;
    uint64_t v50 = (uint64_t)v15;
    id v29 = v15;
    uint64_t v6 = v45;
    a3 = v43;
    sub_226F7ACD8();
    LOBYTE(v20) = v17;
    uint64_t v30 = v41;
    *uint64_t v41 = v15;

    _os_log_impl(&dword_226F20000, v16, (os_log_type_t)v20, "[%s]: registering listener: %@", (uint8_t *)v19, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v30, -1, -1);
    uint64_t v31 = v42;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v31, -1, -1);
    uint64_t v32 = v19;
    uint64_t v9 = v44;
    MEMORY[0x22A66FDC0](v32, -1, -1);
  }
  else
  {
  }
  uint64_t v33 = (void *)swift_allocObject();
  v33[2] = v14;
  v33[3] = v15;
  v33[4] = v46;
  v33[5] = a3;
  aBlock[4] = (uint64_t)sub_226F54420;
  aBlock[5] = (uint64_t)v33;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_226F42574;
  aBlock[3] = (uint64_t)&block_descriptor_12_0;
  uint64_t v34 = _Block_copy(aBlock);
  id v35 = v14;
  id v36 = v15;
  swift_retain();
  os_log_type_t v37 = v47;
  sub_226F7AA88();
  uint64_t v50 = MEMORY[0x263F8EE78];
  sub_226F5581C((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  sub_226F54380((unint64_t *)&qword_2681620C0, (uint64_t *)&unk_268162720);
  uint64_t v38 = v49;
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v37, v38, v34);
  _Block_release(v34);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v38, v6);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v37, v9);
  return swift_release();
}

uint64_t sub_226F4E97C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  uint64_t v9 = (uint64_t *)(a1
                 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerHandlers);
  swift_beginAccess();
  id v10 = a2;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v9;
  *uint64_t v9 = 0x8000000000000000;
  sub_226F74BC8((uint64_t)sub_226F5586C, v8, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v9 = v13;

  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_226F4EB0C(void *a1)
{
  uint64_t v3 = sub_226F7AA78();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v39 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_226F7AA98();
  uint64_t v38 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  os_log_type_t v37 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_226F7AA58();
  __swift_project_value_buffer(v7, (uint64_t)qword_268162650);
  id v8 = v1;
  id v9 = a1;
  id v10 = v8;
  id v11 = v9;
  id v12 = sub_226F7AA48();
  os_log_type_t v13 = sub_226F7AC58();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v34 = (void *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    aBlock[0] = v35;
    *(_DWORD *)uint64_t v14 = 136315394;
    v33[1] = v14 + 4;
    id v15 = v10;
    id v16 = objc_msgSend(v15, sel_description);
    uint64_t v36 = v3;
    id v17 = v16;
    uint64_t v18 = v4;
    uint64_t v19 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v21 = v20;

    uint64_t v22 = v19;
    uint64_t v4 = v18;
    uint64_t v41 = sub_226F44310(v22, v21, aBlock);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2112;
    uint64_t v41 = (uint64_t)v11;
    id v23 = v11;
    uint64_t v3 = v36;
    sub_226F7ACD8();
    uint64_t v24 = v34;
    void *v34 = v11;

    _os_log_impl(&dword_226F20000, v12, v13, "[%s]: deregister listener: %@", (uint8_t *)v14, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v24, -1, -1);
    uint64_t v25 = v35;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v25, -1, -1);
    MEMORY[0x22A66FDC0](v14, -1, -1);
  }
  else
  {
  }
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v10;
  *(void *)(v26 + 24) = v11;
  aBlock[4] = (uint64_t)sub_226F5446C;
  aBlock[5] = v26;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_226F42574;
  aBlock[3] = (uint64_t)&block_descriptor_18;
  unint64_t v27 = _Block_copy(aBlock);
  id v28 = v10;
  id v29 = v11;
  uint64_t v30 = v37;
  sub_226F7AA88();
  uint64_t v41 = MEMORY[0x263F8EE78];
  sub_226F5581C((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  sub_226F54380((unint64_t *)&qword_2681620C0, (uint64_t *)&unk_268162720);
  uint64_t v31 = v39;
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v30, v31, v27);
  _Block_release(v27);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v31, v3);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v30, v40);
  return swift_release();
}

uint64_t sub_226F4F010(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t *)(a1
                 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerHandlers);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_226F740A4(a2);
  LOBYTE(a2) = v5;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return swift_endAccess();
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v3;
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_226F6CB08();
    uint64_t v7 = v9;
  }

  sub_226F6C7A8(v4, v7);
  *uint64_t v3 = v7;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_226F4F16C(uint64_t a1, unint64_t a2)
{
  id v5 = objc_msgSend(self, sel_sharedInstance);
  uint64_t v6 = (void *)sub_226F7AAD8();
  id v7 = objc_msgSend(v5, sel_detectorWithIdentifier_, v6);

  if (v7)
  {
    if (objc_msgSend(v7, sel_isCustom))
    {

      return 1;
    }
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_226F7AA58();
    __swift_project_value_buffer(v21, (uint64_t)qword_268162650);
    id v22 = v2;
    swift_bridgeObjectRetain_n();
    id v23 = v7;
    id v24 = v22;
    id v25 = v23;
    uint64_t v26 = sub_226F7AA48();
    os_log_type_t v27 = sub_226F7AC48();
    if (os_log_type_enabled(v26, v27))
    {
      os_log_type_t type = v27;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v35 = (void *)swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = v37;
      *(_DWORD *)uint64_t v28 = 136315650;
      id v29 = v24;
      id v30 = objc_msgSend(v29, sel_description);
      uint64_t v31 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v33 = v32;

      sub_226F44310(v31, v33, &v38);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_226F44310(a1, a2, &v38);
      sub_226F7ACD8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v28 + 22) = 2112;
      id v34 = v25;
      sub_226F7ACD8();
      void *v35 = v7;

      _os_log_impl(&dword_226F20000, v26, type, "[%s]: detector with identifier: %s is not a custom detector. Specified detector: %@", (uint8_t *)v28, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v35, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v37, -1, -1);
      MEMORY[0x22A66FDC0](v28, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_226F7AA58();
    __swift_project_value_buffer(v9, (uint64_t)qword_268162650);
    id v10 = v2;
    swift_bridgeObjectRetain_n();
    id v11 = v10;
    id v12 = sub_226F7AA48();
    os_log_type_t v13 = sub_226F7AC48();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v38 = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      id v16 = v11;
      id v17 = objc_msgSend(v16, sel_description);
      uint64_t v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v20 = v19;

      sub_226F44310(v18, v20, &v38);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_226F44310(a1, a2, &v38);
      sub_226F7ACD8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_226F20000, v12, v13, "[%s]: no custom detector found with identifier: %s. can not retrain.", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v15, -1, -1);
      MEMORY[0x22A66FDC0](v14, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return 0;
}

id sub_226F4F738(void *a1)
{
  return sub_226F4F7C8(a1, "[%s]: adding listen type: %s", (SEL *)&selRef_addListenType_);
}

id sub_226F4F7B4(void *a1)
{
  return sub_226F4F7C8(a1, "[%s]: removing listen type: %s", (SEL *)&selRef_removeListenType_);
}

id sub_226F4F7C8(void *a1, char *a2, SEL *a3)
{
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_226F7AA58();
  __swift_project_value_buffer(v7, (uint64_t)qword_268162650);
  id v8 = v3;
  id v9 = a1;
  id v10 = (char *)v8;
  id v11 = v9;
  id v12 = sub_226F7AA48();
  os_log_type_t v13 = sub_226F7AC58();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v26 = v24;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v15 = v10;
    format = a2;
    id v16 = objc_msgSend(v15, sel_description);
    id v25 = a3;
    uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v19 = v18;

    sub_226F44310(v17, v19, &v26);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v20 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    sub_226F44310(v20, v21, &v26);
    a3 = v25;
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v12, v13, format, (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v24, -1, -1);
    MEMORY[0x22A66FDC0](v14, -1, -1);
  }
  else
  {
  }
  return objc_msgSend(*(id *)&v10[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorQueueManager], *a3, v11);
}

uint64_t sub_226F4FA98()
{
  return sub_226F4FAC8("[%s]: removing all listen types", (uint64_t)&unk_26DB219E8, (uint64_t)sub_226F54474, (uint64_t)&block_descriptor_24_0);
}

uint64_t sub_226F4FAC8(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_226F7AA78();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v47 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_226F7AA98();
  uint64_t v46 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v45 = (char *)v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_226F7AA58();
  __swift_project_value_buffer(v13, (uint64_t)qword_268162650);
  id v14 = v4;
  uint64_t v15 = sub_226F7AA48();
  os_log_type_t v16 = sub_226F7AC58();
  int v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v42 = a4;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v43 = v11;
    int v40 = v17;
    uint64_t v19 = v18;
    uint64_t v41 = swift_slowAlloc();
    aBlock[0] = v41;
    uint64_t v39 = (uint8_t *)v19;
    *(_DWORD *)uint64_t v19 = 136315138;
    v38[1] = (const char *)(v19 + 4);
    id v20 = v14;
    uint64_t v21 = a3;
    id v22 = objc_msgSend(v20, sel_description);
    uint64_t v23 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v38[0] = a1;
    uint64_t v24 = v8;
    uint64_t v25 = v23;
    uint64_t v44 = v9;
    unint64_t v27 = v26;

    a3 = v21;
    uint64_t v28 = v25;
    uint64_t v8 = v24;
    uint64_t v48 = sub_226F44310(v28, v27, aBlock);
    sub_226F7ACD8();

    a4 = v42;
    uint64_t v9 = v44;
    swift_bridgeObjectRelease();
    id v29 = v39;
    _os_log_impl(&dword_226F20000, v15, (os_log_type_t)v40, v38[0], v39, 0xCu);
    uint64_t v30 = v41;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v30, -1, -1);
    uint64_t v11 = v43;
    MEMORY[0x22A66FDC0](v29, -1, -1);
  }
  else
  {
  }
  sub_226F49B1C();
  uint64_t v31 = (void *)sub_226F7AC88();
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = v14;
  aBlock[4] = a3;
  aBlock[5] = v32;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_226F42574;
  aBlock[3] = a4;
  unint64_t v33 = _Block_copy(aBlock);
  id v34 = v14;
  swift_release();
  uint64_t v35 = v45;
  sub_226F7AA88();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_226F5581C((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  sub_226F54380((unint64_t *)&qword_2681620C0, (uint64_t *)&unk_268162720);
  uint64_t v36 = v47;
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v35, v36, v33);
  _Block_release(v33);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v36, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v35, v11);
}

void sub_226F4FFB0(void *a1)
{
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_226F7AA58();
  __swift_project_value_buffer(v3, (uint64_t)qword_268162650);
  id v4 = v1;
  id v5 = a1;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = sub_226F7AA48();
  os_log_type_t v9 = sub_226F7AC58();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v35 = v32;
    *(_DWORD *)uint64_t v10 = 136315394;
    id v12 = v6;
    id v33 = v6;
    id v13 = objc_msgSend(v12, sel_description);
    uint64_t v14 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v16 = v15;

    sub_226F44310(v14, v16, &v35);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    id v17 = v7;
    id v6 = v33;
    sub_226F7ACD8();
    void *v11 = v7;

    _os_log_impl(&dword_226F20000, v8, v9, "[%s]: handle ML error with detector: %@.", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v32, -1, -1);
    MEMORY[0x22A66FDC0](v10, -1, -1);
  }
  else
  {
  }
  if ((unint64_t)objc_msgSend(v7, sel_trainings) >= 5)
  {
    id v18 = v6;
    id v19 = v7;
    id v20 = v18;
    id v21 = v19;
    id v22 = sub_226F7AA48();
    os_log_type_t v23 = sub_226F7AC48();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = (void *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = v34;
      *(_DWORD *)uint64_t v24 = 136315650;
      id v26 = v20;
      id v27 = objc_msgSend(v26, sel_description);
      uint64_t v28 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v30 = v29;

      sub_226F44310(v28, v30, &v35);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2048;

      sub_226F7ACD8();
      *(_WORD *)(v24 + 22) = 2112;
      id v31 = v21;
      sub_226F7ACD8();
      void *v25 = v21;

      _os_log_impl(&dword_226F20000, v22, v23, "[%s]: attempted %ld trainings. marking detector as failed. Detector: %@", (uint8_t *)v24, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v25, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v34, -1, -1);
      MEMORY[0x22A66FDC0](v24, -1, -1);
    }
    else
    {
    }
    sub_226F54754(v21, 0);
  }
}

void sub_226F5046C(void *a1, uint64_t a2, char *a3)
{
  v74[3] = *MEMORY[0x263EF8340];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162310);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  os_log_type_t v71 = ((char *)v63 - v12);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v63 - v13;
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_226F7AA58();
  uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)qword_268162650);
  sub_226F55768(a2, (uint64_t)v14);
  id v17 = v3;
  id v18 = a1;
  id v19 = (char *)v17;
  id v20 = v18;
  id v21 = sub_226F7AA48();
  os_log_type_t v22 = sub_226F7AC58();
  int v23 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v24 = swift_slowAlloc();
    int v65 = v23;
    uint64_t v25 = v24;
    uint64_t v64 = (void *)swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    v74[0] = v66;
    *(_DWORD *)uint64_t v25 = 136315650;
    uint64_t v67 = v16;
    id v26 = v19;
    char v70 = a3;
    id v27 = v26;
    id v28 = objc_msgSend(v26, sel_description);
    uint64_t v68 = a2;
    id v29 = v28;
    uint64_t v30 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    v63[1] = v7;
    uint64_t v31 = v30;
    uint64_t v69 = (uint64_t)v10;
    unint64_t v33 = v32;

    uint64_t v73 = sub_226F44310(v31, v33, v74);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2112;
    uint64_t v73 = (uint64_t)v20;
    id v34 = v20;
    sub_226F7ACD8();
    uint64_t v35 = v64;
    void *v64 = v20;

    *(_WORD *)(v25 + 22) = 2080;
    sub_226F55768((uint64_t)v14, (uint64_t)v71);
    uint64_t v36 = sub_226F7AB18();
    uint64_t v73 = sub_226F44310(v36, v37, v74);
    a2 = v68;
    a3 = v70;
    sub_226F7ACD8();
    uint64_t v10 = (char *)v69;
    swift_bridgeObjectRelease();
    sub_226F544CC((uint64_t)v14);
    _os_log_impl(&dword_226F20000, v21, (os_log_type_t)v65, "[%s]: handle ML result with detector: %@ - model URL: %s", (uint8_t *)v25, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v35, -1, -1);
    uint64_t v38 = v66;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v38, -1, -1);
    MEMORY[0x22A66FDC0](v25, -1, -1);
  }
  else
  {

    sub_226F544CC((uint64_t)v14);
  }

  uint64_t v39 = &v19[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining];
  swift_beginAccess();
  char v40 = *v39;
  char *v39 = 0;
  sub_226F4CB0C(v40);
  sub_226F55768(a2, (uint64_t)v10);
  uint64_t v41 = sub_226F7A898();
  LODWORD(v39) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 48))(v10, 1, v41);
  sub_226F544CC((uint64_t)v10);
  if (v39 == 1)
  {
    uint64_t v42 = v19;
    id v43 = v20;
    uint64_t v44 = a3;
    uint64_t v45 = v42;
    id v46 = v43;
    id v47 = a3;
    uint64_t v48 = sub_226F7AA48();
    os_log_type_t v49 = sub_226F7AC48();
    os_log_type_t v71 = v48;
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = swift_slowAlloc();
      uint64_t v51 = (void *)swift_slowAlloc();
      uint64_t v69 = swift_slowAlloc();
      uint64_t v73 = v69;
      *(_DWORD *)uint64_t v50 = 136315650;
      char v70 = v45;
      os_log_type_t v52 = v45;
      id v53 = objc_msgSend(v52, sel_description);
      uint64_t v54 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      id v55 = a3;
      unint64_t v57 = v56;

      uint64_t v72 = sub_226F44310(v54, v57, &v73);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v50 + 12) = 2112;
      uint64_t v72 = (uint64_t)v46;
      id v58 = v46;
      sub_226F7ACD8();
      void *v51 = v46;

      *(_WORD *)(v50 + 22) = 2112;
      if (v55)
      {
        unint64_t v59 = v55;
        uint64_t v60 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v72 = v60;
        sub_226F7ACD8();
      }
      else
      {
        uint64_t v72 = 0;
        sub_226F7ACD8();
        uint64_t v60 = 0;
      }
      v51[1] = v60;

      uint64_t v61 = v71;
      _os_log_impl(&dword_226F20000, v71, v49, "[%s]: k-shot model creation failed for detector: %@ - error: %@", (uint8_t *)v50, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v51, -1, -1);
      uint64_t v62 = v69;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v62, -1, -1);
      MEMORY[0x22A66FDC0](v50, -1, -1);
    }
    else
    {
    }
    sub_226F4FFB0(v46);
  }
  else
  {
    sub_226F54754(v20, 1);
  }
}

void sub_226F50B6C(void *a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_226F7A8E8();
  uint64_t v138 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v137 = (char *)&v135 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162310);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  v141 = (char *)&v135 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v143 = (uint64_t)&v135 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v147 = (char *)&v135 - v13;
  MEMORY[0x270FA5388](v12);
  v151 = (uint64_t *)((char *)&v135 - v14);
  uint64_t v157 = sub_226F7A898();
  uint64_t v15 = *(void *)(v157 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v157);
  id v18 = (char *)&v135 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  v146 = (char *)&v135 - v20;
  MEMORY[0x270FA5388](v19);
  v148 = (char *)&v135 - v21;
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_226F7AA58();
  uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)qword_268162650);
  id v24 = v1;
  id v25 = a1;
  id v26 = (char *)v24;
  id v27 = v25;
  id v28 = sub_226F7AA48();
  os_log_type_t v29 = sub_226F7AC58();
  BOOL v30 = os_log_type_enabled(v28, v29);
  v140 = v18;
  uint64_t v139 = v5;
  uint64_t v152 = v23;
  v153 = v26;
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v145 = v2;
    uint64_t v32 = v31;
    v144 = (void *)swift_slowAlloc();
    id v149 = (id)swift_slowAlloc();
    aBlock[0] = (uint64_t)v149;
    *(_DWORD *)uint64_t v32 = 136315394;
    unint64_t v33 = v26;
    id v34 = objc_msgSend(v33, sel_description);
    uint64_t v150 = v15;
    id v35 = v34;
    uint64_t v36 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v38 = v37;

    uint64_t v156 = sub_226F44310(v36, v38, aBlock);
    sub_226F7ACD8();

    uint64_t v39 = v157;
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2112;
    uint64_t v156 = (uint64_t)v27;
    id v40 = v27;
    uint64_t v41 = v150;
    sub_226F7ACD8();
    uint64_t v42 = v144;
    void *v144 = v27;

    _os_log_impl(&dword_226F20000, v28, v29, "[%s]: kicking off training of detector: %@", (uint8_t *)v32, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v42, -1, -1);
    id v43 = v149;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v43, -1, -1);
    uint64_t v44 = v32;
    uint64_t v3 = v145;
    MEMORY[0x22A66FDC0](v44, -1, -1);

    uint64_t v45 = v153;
  }
  else
  {

    uint64_t v45 = v26;
    uint64_t v41 = v15;
    uint64_t v39 = v157;
  }
  id v46 = (id *)&v45[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector];
  swift_beginAccess();
  id v47 = *v46;
  id *v46 = v27;
  id v48 = v27;

  if (*v46)
  {
    v144 = *v46;
    AXSDSoundDetectionRequestNotificationAuthorization();
    id v142 = self;
    id v49 = objc_msgSend(v142, sel_sharedInstance);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    uint64_t v50 = (void *)sub_226F7AAD8();
    swift_bridgeObjectRelease();
    id v149 = v49;
    id v51 = objc_msgSend(v49, sel_detectorWithName_, v50);

    if (!v51)
    {
      id v55 = (void (*)(void, void, void, void))v151;
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v41 + 56))(v151, 1, 1, v39);
LABEL_13:
      sub_226F544CC((uint64_t)v55);
      unint64_t v57 = v153;
      id v58 = sub_226F7AA48();
      os_log_type_t v59 = sub_226F7AC58();
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v60 = (uint8_t *)swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        aBlock[0] = v61;
        *(_DWORD *)uint64_t v60 = 136315138;
        uint64_t v157 = (uint64_t)(v60 + 4);
        uint64_t v62 = v57;
        id v63 = objc_msgSend(v62, sel_description);
        uint64_t v64 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v66 = v65;

        uint64_t v155 = sub_226F44310(v64, v66, aBlock);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_226F20000, v58, v59, "[%s]: unable to train detector. Hallucinator asset is not downloaded.", v60, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v61, -1, -1);
        MEMORY[0x22A66FDC0](v60, -1, -1);
      }
      else
      {
      }
      uint64_t v67 = v144;
      id v68 = objc_msgSend(v142, sel_sharedInstance);
      objc_msgSend(v68, sel_downloadDetectors);

      sub_226F5452C();
      swift_allocError();
      *uint64_t v69 = 0;
      swift_willThrow();
LABEL_27:

      return;
    }
    id v52 = objc_msgSend(v51, sel_modelURL);

    if (v52)
    {
      uint64_t v53 = (uint64_t)v147;
      sub_226F7A878();

      uint64_t v54 = *(void **)(v41 + 56);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v54)(v53, 0, 1, v39);
    }
    else
    {
      uint64_t v54 = *(void **)(v41 + 56);
      uint64_t v53 = (uint64_t)v147;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(v147, 1, 1, v39);
    }
    id v55 = (void (*)(void, void, void, void))v151;
    sub_226F54580(v53, (uint64_t)v151);
    unint64_t v56 = *(unsigned int (**)(void, void, void))(v41 + 48);
    if (v56(v55, 1, v39) == 1) {
      goto LABEL_13;
    }
    v151 = v54;
    id v136 = v48;
    uint64_t v145 = v3;
    char v70 = v148;
    v147 = *(char **)(v41 + 32);
    ((void (*)(char *, void (*)(void, void, void, void), uint64_t))v147)(v148, v55, v39);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    os_log_type_t v71 = v146;
    sub_226F7A868();
    swift_bridgeObjectRelease();
    uint64_t v72 = v71;
    uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v41 + 40);
    v73(v70, v72, v39);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    uint64_t v74 = (void *)sub_226F7AAD8();
    swift_bridgeObjectRelease();
    id v75 = objc_msgSend(v149, sel_detectorWithName_, v74);

    uint64_t v150 = v41;
    if (!v75)
    {
      uint64_t v79 = v143;
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v151)(v143, 1, 1, v39);
LABEL_23:
      sub_226F544CC(v79);
      id v81 = v153;
      uint64_t v82 = sub_226F7AA48();
      os_log_type_t v83 = sub_226F7AC58();
      if (os_log_type_enabled(v82, v83))
      {
        unint64_t v84 = (uint8_t *)swift_slowAlloc();
        uint64_t v85 = swift_slowAlloc();
        aBlock[0] = v85;
        *(_DWORD *)unint64_t v84 = 136315138;
        v153 = (char *)(v84 + 4);
        uint64_t v86 = v81;
        id v87 = objc_msgSend(v86, sel_description);
        uint64_t v88 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v90 = v89;

        uint64_t v155 = sub_226F44310(v88, v90, aBlock);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_226F20000, v82, v83, "[%s]: unable to train detector. Model Weights asset is not downloaded.", v84, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v85, -1, -1);
        MEMORY[0x22A66FDC0](v84, -1, -1);
      }
      else
      {
      }
      uint64_t v91 = v157;
      uint64_t v92 = v150;
      id v93 = objc_msgSend(v142, sel_sharedInstance);
      objc_msgSend(v93, sel_downloadDetectors);

      sub_226F5452C();
      swift_allocError();
      *os_log_t v94 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v92 + 8))(v148, v91);
      uint64_t v67 = v144;
      goto LABEL_27;
    }
    id v76 = objc_msgSend(v75, sel_modelURL);

    if (v76)
    {
      uint64_t v77 = (uint64_t)v141;
      sub_226F7A878();

      uint64_t v78 = 0;
    }
    else
    {
      uint64_t v78 = 1;
      uint64_t v77 = (uint64_t)v141;
    }
    uint64_t v80 = v157;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v151)(v77, v78, 1, v157);
    uint64_t v79 = v143;
    sub_226F54580(v77, v143);
    if (v56(v79, 1, v80) == 1) {
      goto LABEL_23;
    }
    char v95 = v140;
    uint64_t v96 = v157;
    ((void (*)(char *, uint64_t, uint64_t))v147)(v140, v79, v157);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    os_log_t v97 = v146;
    sub_226F7A868();
    swift_bridgeObjectRelease();
    v73(v95, v97, v96);
    v98 = v153;
    os_log_type_t v99 = sub_226F7AA48();
    os_log_type_t v100 = sub_226F7AC58();
    int v101 = v100;
    if (os_log_type_enabled(v99, v100))
    {
      uint64_t v102 = swift_slowAlloc();
      uint64_t v152 = swift_slowAlloc();
      aBlock[0] = v152;
      *(_DWORD *)uint64_t v102 = 136315650;
      LODWORD(v151) = v101;
      unint64_t v103 = v98;
      id v104 = objc_msgSend(v103, sel_description);
      v153 = v98;
      id v105 = v104;
      uint64_t v106 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      v107 = v95;
      unint64_t v109 = v108;

      uint64_t v155 = sub_226F44310(v106, v109, aBlock);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v102 + 12) = 2080;
      swift_beginAccess();
      sub_226F5581C((unint64_t *)&unk_268162320, MEMORY[0x263F06EA8]);
      uint64_t v110 = sub_226F7AF08();
      uint64_t v155 = sub_226F44310(v110, v111, aBlock);
      sub_226F7ACD8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v102 + 22) = 2080;
      swift_beginAccess();
      uint64_t v112 = sub_226F7AF08();
      uint64_t v155 = sub_226F44310(v112, v113, aBlock);
      v98 = v153;
      char v95 = v107;
      sub_226F7ACD8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v99, (os_log_type_t)v151, "[%s]: using model paths: \n\t hallucinator model: %s \n\t model weights path: %s", (uint8_t *)v102, 0x20u);
      uint64_t v114 = v152;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v114, -1, -1);
      MEMORY[0x22A66FDC0](v102, -1, -1);
    }
    else
    {
    }
    v115 = v136;
    v116 = &v98[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining];
    swift_beginAccess();
    char v117 = *v116;
    char *v116 = 1;
    sub_226F4CB0C(v117);
    v118 = (char *)objc_msgSend(v115, sel_trainings);
    v119 = v144;
    if (v118 == (char *)-1)
    {
      __break(1u);
    }
    else
    {
      objc_msgSend(v115, sel_setTrainings_, v118 + 1);
      v120 = v137;
      sub_226F7A8D8();
      v121 = (void *)sub_226F7A8A8();
      (*(void (**)(char *, uint64_t))(v138 + 8))(v120, v139);
      objc_msgSend(v115, sel_setLastAttemptedTrainingDate_, v121);

      id v122 = objc_msgSend(self, sel_sharedInstance);
      objc_msgSend(v122, sel_updateKShotDetector_, v115);

      v123 = *(void **)&v98[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_xpcHelperService];
      id v124 = objc_msgSend(v119, sel_identifier);
      if (!v124)
      {
        _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        id v124 = (id)sub_226F7AAD8();
        swift_bridgeObjectRelease();
      }
      v125 = v148;
      swift_beginAccess();
      v126 = (void *)sub_226F7A858();
      swift_beginAccess();
      v127 = (void *)sub_226F7A858();
      uint64_t v128 = swift_allocObject();
      *(void *)(v128 + 16) = v98;
      *(void *)(v128 + 24) = v119;
      aBlock[4] = (uint64_t)sub_226F545E8;
      aBlock[5] = v128;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_226F51D5C;
      aBlock[3] = (uint64_t)&block_descriptor_30;
      v129 = v95;
      v130 = _Block_copy(aBlock);
      v131 = v98;
      id v132 = v119;
      swift_release();
      objc_msgSend(v123, sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_, v124, v126, v127, v130);
      _Block_release(v130);

      v133 = *(void (**)(char *, uint64_t))(v150 + 8);
      uint64_t v134 = v157;
      v133(v129, v157);
      v133(v125, v134);
    }
  }
}

uint64_t sub_226F51D5C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162310);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_226F7A878();
    uint64_t v10 = sub_226F7A898();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_226F7A898();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  id v12 = a3;
  v9(v8, a3);
  swift_release();

  return sub_226F544CC((uint64_t)v8);
}

id AXSDKShotNSRecordingControllerImplementation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXSDKShotNSRecordingControllerImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void AXSDKShotNSRecordingControllerImplementation.listenEngineFailedToStartWithError(_:)(void *a1)
{
  if (a1)
  {
    id v3 = a1;
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_226F7AA58();
    __swift_project_value_buffer(v4, (uint64_t)qword_268162650);
    id v5 = a1;
    id v6 = v1;
    id v7 = a1;
    id v8 = v6;
    oslog = sub_226F7AA48();
    os_log_type_t v9 = sub_226F7AC48();
    if (os_log_type_enabled(oslog, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v31 = v12;
      *(_DWORD *)uint64_t v10 = 136315394;
      id v13 = v8;
      id v14 = objc_msgSend(v13, sel_description);
      uint64_t v15 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v17 = v16;

      sub_226F44310(v15, v17, &v31);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2112;
      id v18 = a1;
      uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
      sub_226F7ACD8();
      void *v11 = v30;

      _os_log_impl(&dword_226F20000, oslog, v9, "[%s]: listen engine failed to start with error: %@", (uint8_t *)v10, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v11, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v12, -1, -1);
      MEMORY[0x22A66FDC0](v10, -1, -1);

      return;
    }
  }
  else
  {
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_226F7AA58();
    __swift_project_value_buffer(v19, (uint64_t)qword_268162650);
    oslog = v1;
    uint64_t v20 = sub_226F7AA48();
    os_log_type_t v21 = sub_226F7AC48();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v31 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      id v24 = oslog;
      id v25 = [v24 description];
      uint64_t v26 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v28 = v27;

      sub_226F44310(v26, v28, &v31);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v20, v21, "[%s]: listen engine failed to start.", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v23, -1, -1);
      MEMORY[0x22A66FDC0](v22, -1, -1);

      return;
    }
  }
}

Swift::Void __swiftcall AXSDKShotNSRecordingControllerImplementation.listenEngineDidStart(withInputFormat:)(AVAudioFormat_optional *withInputFormat)
{
  objc_super v2 = v1;
  uint64_t aBlock[6] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_226F7AA78();
  uint64_t v51 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v49 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_226F7AA98();
  uint64_t v48 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  id v47 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_226F7AA58();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_268162650);
  os_log_type_t v9 = withInputFormat;
  id v10 = v2;
  uint64_t v11 = v9;
  id v12 = v10;
  id v13 = sub_226F7AA48();
  os_log_type_t v14 = sub_226F7AC48();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v44 = v8;
    uint64_t v46 = v4;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v42 = (void *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    aBlock[0] = v43;
    *(_DWORD *)uint64_t v15 = 136315394;
    id v45 = v12;
    id v16 = v12;
    id v17 = objc_msgSend(v16, sel_description);
    uint64_t v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v20 = v19;

    uint64_t v52 = sub_226F44310(v18, v20, aBlock);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2112;
    if (withInputFormat)
    {
      uint64_t v52 = (uint64_t)v11;
      os_log_type_t v21 = v11;
    }
    else
    {
      uint64_t v52 = 0;
    }
    sub_226F7ACD8();
    uint64_t v30 = v42;
    void *v42 = withInputFormat;

    _os_log_impl(&dword_226F20000, v13, v14, "[%s]: listen engine did start with format: %@", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v30, -1, -1);
    uint64_t v31 = v43;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v31, -1, -1);
    MEMORY[0x22A66FDC0](v15, -1, -1);

    id v12 = v45;
    uint64_t v4 = v46;
    if (!withInputFormat) {
      goto LABEL_10;
    }
LABEL_7:
    sub_226F49B1C();
    uint64_t v22 = v11;
    uint64_t v23 = (void *)sub_226F7AC88();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v12;
    *(void *)(v24 + 24) = v22;
    aBlock[4] = (uint64_t)sub_226F54618;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_226F42574;
    aBlock[3] = (uint64_t)&block_descriptor_36;
    id v25 = _Block_copy(aBlock);
    id v26 = v12;
    unint64_t v27 = v22;
    swift_release();
    unint64_t v28 = v47;
    sub_226F7AA88();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_226F5581C((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
    sub_226F54380((unint64_t *)&qword_2681620C0, (uint64_t *)&unk_268162720);
    os_log_type_t v29 = v49;
    sub_226F7ACF8();
    MEMORY[0x22A66F0C0](0, v28, v29, v25);
    _Block_release(v25);

    (*(void (**)(char *, uint64_t))(v51 + 8))(v29, v4);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v28, v50);
    return;
  }

  if (withInputFormat) {
    goto LABEL_7;
  }
LABEL_10:
  id v32 = v12;
  unint64_t v33 = sub_226F7AA48();
  os_log_type_t v34 = sub_226F7AC48();
  if (os_log_type_enabled(v33, v34))
  {
    id v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    aBlock[0] = v36;
    *(_DWORD *)id v35 = 136315138;
    id v37 = v32;
    id v38 = objc_msgSend(v37, sel_description);
    uint64_t v39 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v41 = v40;

    uint64_t v52 = sub_226F44310(v39, v41, aBlock);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v33, v34, "[%s]: listen engine did not return an audio format. This should NOT happen; bailing. File a radar!",
      v35,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v36, -1, -1);
    MEMORY[0x22A66FDC0](v35, -1, -1);
  }
  else
  {
  }
}

Swift::Void __swiftcall AXSDKShotNSRecordingControllerImplementation.receivedBuffer(_:at:)(AVAudioPCMBuffer _, AVAudioTime *at)
{
  impl = _.super._impl;
  Class isa = _.super.super.isa;
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_226F7AA58();
  __swift_project_value_buffer(v5, (uint64_t)qword_268162650);
  id v6 = v2;
  uint64_t v7 = isa;
  id v8 = impl;
  id v9 = v6;
  id v10 = v7;
  id v11 = v8;
  id v12 = sub_226F7AA48();
  os_log_type_t v13 = sub_226F7AC58();
  if (os_log_type_enabled(v12, v13))
  {
    os_log_type_t type = v13;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = (void *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v26 = v24;
    *(_DWORD *)uint64_t v14 = 136315650;
    id v16 = v9;
    id v17 = objc_msgSend(v16, sel_description);
    id v25 = v9;
    uint64_t v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v20 = v19;

    sub_226F44310(v18, v20, &v26);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2112;
    os_log_type_t v21 = v10;
    sub_226F7ACD8();
    *uint64_t v15 = v10;

    *(_WORD *)(v14 + 22) = 2112;
    id v22 = v11;
    id v9 = v25;
    sub_226F7ACD8();
    v15[1] = v11;

    _os_log_impl(&dword_226F20000, v12, type, "[%s]: received buffer: %@ - at time: %@", (uint8_t *)v14, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v24, -1, -1);
    MEMORY[0x22A66FDC0](v14, -1, -1);
  }
  else
  {
  }
  objc_msgSend(v9, sel_receivedBuffer_atTime_isFile_, v10, v11, 0);
}

Swift::Void __swiftcall AXSDKShotNSRecordingControllerImplementation.receivedBuffer(_:at:isFile:)(AVAudioPCMBuffer _, AVAudioTime *at, Swift::Bool isFile)
{
  char v4 = (char)at;
  impl = _.super._impl;
  Class isa = _.super.super.isa;
  uint64_t v7 = (id *)&v3[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager];
  swift_beginAccess();
  objc_msgSend(*v7, sel_processAudioBuffer_atTime_, isa, impl);
  id v8 = *(void **)&v3[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager];
  if (v8)
  {
    objc_msgSend(v8, sel_trackBuffer_atTime_isFile_, isa, impl, v4 & 1);
  }
  else
  {
    if (qword_268162058 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_226F7AA58();
    __swift_project_value_buffer(v9, (uint64_t)qword_268162650);
    id v10 = v3;
    id v11 = sub_226F7AA48();
    os_log_type_t v12 = sub_226F7AC48();
    if (os_log_type_enabled(v11, v12))
    {
      os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v20 = v14;
      *(_DWORD *)os_log_type_t v13 = 136315138;
      uint64_t v15 = v10;
      id v16 = objc_msgSend(v15, sel_description);
      uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v19 = v18;

      sub_226F44310(v17, v19, &v20);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v11, v12, "[%s]: kshot recording manager failed to start. can not start listening to train detector.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v14, -1, -1);
      MEMORY[0x22A66FDC0](v13, -1, -1);
    }
    else
    {
    }
  }
}

void AXSDKShotNSRecordingControllerImplementation.receivedObservation(_:forDetector:)(void *a1, void *a2)
{
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_226F7AA58();
  __swift_project_value_buffer(v5, (uint64_t)qword_268162650);
  id v6 = v2;
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = (char *)v6;
  id v10 = v7;
  id v11 = v8;
  os_log_type_t v12 = sub_226F7AA48();
  os_log_type_t v13 = sub_226F7AC58();
  if (os_log_type_enabled(v12, v13))
  {
    os_log_type_t type = v13;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v37 = v36;
    *(_DWORD *)uint64_t v14 = 136315650;
    uint64_t v15 = v9;
    id v16 = objc_msgSend(v15, sel_description);
    uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v19 = v18;

    sub_226F44310(v17, v19, &v37);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2048;
    objc_msgSend(v10, sel_confidence);
    sub_226F7ACD8();

    *(_WORD *)(v14 + 22) = 2080;
    id v20 = objc_msgSend(v11, sel_soundIdentifier);
    uint64_t v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v23 = v22;

    sub_226F44310(v21, v23, &v37);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v12, type, "[%s]: received observation: %f - for request: %s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v36, -1, -1);
    MEMORY[0x22A66FDC0](v14, -1, -1);
  }
  else
  {
  }
  uint64_t v24 = *(void **)&v9[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_recordingManager];
  if (v24)
  {
    objc_msgSend(v24, sel_receivedObservation_forDetector_, v10, v11);
  }
  else
  {
    id v25 = v9;
    uint64_t v26 = sub_226F7AA48();
    os_log_type_t v27 = sub_226F7AC48();
    if (os_log_type_enabled(v26, v27))
    {
      unint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v37 = v29;
      *(_DWORD *)unint64_t v28 = 136315138;
      uint64_t v30 = v25;
      id v31 = objc_msgSend(v30, sel_description);
      uint64_t v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v34 = v33;

      sub_226F44310(v32, v34, &v37);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v26, v27, "[%s]: kshot recording manager failed to start. can not start listening to train detector.", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v29, -1, -1);
      MEMORY[0x22A66FDC0](v28, -1, -1);
    }
    else
    {
    }
  }
}

void AXSDKShotNSRecordingControllerImplementation.receivedCompletion(_:)(void *a1)
{
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_226F7AA58();
  __swift_project_value_buffer(v3, (uint64_t)qword_268162650);
  id v4 = v1;
  id v5 = a1;
  id v18 = v4;
  id v6 = v5;
  id v7 = sub_226F7AA48();
  os_log_type_t v8 = sub_226F7AC48();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    id v10 = (void *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v19 = v17;
    *(_DWORD *)uint64_t v9 = 136315394;
    id v11 = v18;
    id v12 = objc_msgSend(v11, sel_description);
    uint64_t v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v15 = v14;

    sub_226F44310(v13, v15, &v19);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    id v16 = v6;
    sub_226F7ACD8();
    void *v10 = v6;

    _os_log_impl(&dword_226F20000, v7, v8, "[%s]: received completion for request: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v17, -1, -1);
    MEMORY[0x22A66FDC0](v9, -1, -1);
  }
  else
  {
  }
}

void AXSDKShotNSRecordingControllerImplementation.receivedError(_:fromDetector:)(void *a1, void *a2)
{
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_226F7AA58();
  __swift_project_value_buffer(v5, (uint64_t)qword_268162650);
  id v6 = v2;
  id v7 = a2;
  id v8 = a1;
  id v9 = v6;
  id v10 = v7;
  id v11 = a1;
  oslog = sub_226F7AA48();
  os_log_type_t v12 = sub_226F7AC48();
  if (os_log_type_enabled(oslog, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    unint64_t v14 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v25 = v22;
    *(_DWORD *)uint64_t v13 = 136315650;
    id v15 = v9;
    id v16 = objc_msgSend(v15, sel_description);
    uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v19 = v18;

    sub_226F44310(v17, v19, &v25);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2112;
    id v20 = v10;
    sub_226F7ACD8();
    void *v14 = v10;

    *(_WORD *)(v13 + 22) = 2112;
    id v21 = a1;
    uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
    sub_226F7ACD8();
    v14[1] = v24;

    _os_log_impl(&dword_226F20000, oslog, v12, "[%s]: received error for request: %@ - error: %@", (uint8_t *)v13, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v22, -1, -1);
    MEMORY[0x22A66FDC0](v13, -1, -1);
  }
  else
  {
  }
}

Swift::Void __swiftcall AXSDKShotNSRecordingControllerImplementation.assetsReadyAndDetectorsAdded()()
{
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_226F7AA58();
  __swift_project_value_buffer(v1, (uint64_t)qword_268162650);
  id v2 = v0;
  uint64_t v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC58();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    id v7 = v2;
    id v8 = objc_msgSend(v7, sel_description);
    uint64_t v9 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v11 = v10;

    sub_226F44310(v9, v11, &v12);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v3, v4, "[%s]: assets ready and detectors added.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v6, -1, -1);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }
  else
  {
  }
  sub_226F4D9E0();
}

Swift::Void __swiftcall AXSDKShotNSRecordingControllerImplementation.savedTrainingRecording(for:)(AXSDKShotDetector_optional *a1)
{
  if (!a1) {
    return;
  }
  uint64_t v3 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listenerHandlers);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v4 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(v4 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  unint64_t v10 = a1;
  swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      goto LABEL_6;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v9) {
      goto LABEL_22;
    }
    unint64_t v20 = *(void *)(v5 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v9) {
        goto LABEL_22;
      }
      unint64_t v20 = *(void *)(v5 + 8 * v11);
      if (!v20)
      {
        int64_t v11 = v19 + 2;
        if (v19 + 2 >= v9) {
          goto LABEL_22;
        }
        unint64_t v20 = *(void *)(v5 + 8 * v11);
        if (!v20) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v8 = (v20 - 1) & v20;
    unint64_t v13 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_6:
    uint64_t v14 = *(void *)(v4 + 56);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = *(_OWORD *)(v14 + 16 * v13);
    id v16 = (void *)swift_allocObject();
    v16[2] = sub_226F546AC;
    v16[3] = v15;
    v16[4] = v10;
    aBlock[4] = sub_226F54724;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_226F42574;
    aBlock[3] = &block_descriptor_45;
    uint64_t v17 = _Block_copy(aBlock);
    unint64_t v18 = v10;
    swift_retain();
    swift_retain();
    swift_release();
    AXPerformBlockOnMainThread();
    _Block_release(v17);
    swift_release();
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v9)
  {
LABEL_22:
    swift_release();

    return;
  }
  unint64_t v20 = *(void *)(v5 + 8 * v21);
  if (v20)
  {
    int64_t v11 = v21;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v9) {
      goto LABEL_22;
    }
    unint64_t v20 = *(void *)(v5 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_21;
    }
  }
LABEL_25:
  __break(1u);
}

void AXSDKShotNSRecordingControllerImplementation.hearingMLHelperService(_:eventOccurred:)()
{
}

uint64_t type metadata accessor for AXSDKShotNSRecordingControllerImplementation()
{
  return self;
}

uint64_t sub_226F54314()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_226F5434C()
{
  return objc_msgSend(*(id *)(*(void *)(v0 + 16)+ OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_listener), sel_addListenDelegate_);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_226F54380(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_226F543D0()
{
  return sub_226F4E368(*(void *)(v0 + 16));
}

uint64_t sub_226F543D8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_226F54420()
{
  return sub_226F4E97C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_226F5442C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_226F5446C()
{
  return sub_226F4F010(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

id sub_226F54474()
{
  uint64_t v1 = (id *)(*(void *)(v0 + 16)
            + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  return objc_msgSend(*v1, sel_removeAllDetectors);
}

uint64_t sub_226F544CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162310);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_226F5452C()
{
  unint64_t result = qword_268162318;
  if (!qword_268162318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268162318);
  }
  return result;
}

uint64_t sub_226F54580(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_226F545E8(uint64_t a1, char *a2)
{
  sub_226F5046C(*(void **)(v2 + 24), a1, a2);
}

id sub_226F54618()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = (id *)(*(void *)(v0 + 16)
            + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  return objc_msgSend(*v2, sel_startGeneralApplianceDetectionWithFormat_, v1);
}

uint64_t sub_226F54674()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_226F546AC(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_226F546E4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_226F54724()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 32));
}

void sub_226F54754(void *a1, char a2)
{
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  if (a2)
  {
    uint64_t v5 = (__CFString *)sub_226F7AAD8();
    CFNotificationCenterPostNotification(v4, v5, 0, 0, 1u);

    AXSDSoundDetectionSendKShotModelReadyNotification(a1);
    id v6 = objc_msgSend(self, sel_sharedInstance);
    objc_msgSend(v6, sel_setKShotDetectorIsEnabled_isEnabled_, a1, 1);
  }
  else
  {
    uint64_t v7 = (__CFString *)sub_226F7AAD8();
    CFNotificationCenterPostNotification(v4, v7, 0, 0, 1u);

    AXSDSoundDetectionSendKShotModelFailedNotification(a1);
    id v8 = objc_msgSend(self, sel_sharedInstance);
    objc_msgSend(v8, sel_setKShotDetectorModelFailed_modelFailed_, a1, 1);

    objc_msgSend(a1, sel_setModelFailed_, 1);
  }
  int64_t v9 = self;
  id v10 = objc_msgSend(v9, sel_sharedInstance);
  objc_msgSend(v10, sel_setIsActivelyTrainingAKShotModel_, 0);

  id v11 = objc_msgSend(v9, sel_sharedInstance);
  objc_msgSend(v11, sel_updateKShotDetector_, a1);
}

void sub_226F54930()
{
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_226F7AA58();
  __swift_project_value_buffer(v1, (uint64_t)qword_268162650);
  uint64_t v2 = v0;
  uint64_t v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC48();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    v29[0] = v27;
    *(_DWORD *)uint64_t v5 = 136315650;
    id v6 = v2;
    id v7 = objc_msgSend(v6, sel_description);
    uint64_t v8 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v10 = v9;

    sub_226F44310(v8, v10, v29);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2048;
    sub_226F7ACD8();
    *(_WORD *)(v5 + 22) = 2080;
    id v11 = (id *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector];
    swift_beginAccess();
    id v12 = *v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268162530);
    uint64_t v13 = sub_226F7AB18();
    uint64_t v28 = sub_226F44310(v13, v14, v29);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v3, v4, "[%s]: Invalid event occured - code: %ld - detector: %s", (uint8_t *)v5, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v27, -1, -1);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }
  else
  {
  }
  uint64_t v15 = (id *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector];
  swift_beginAccess();
  if (*v15)
  {
    id v16 = *v15;
    sub_226F54754(v16, 0);
  }
  else
  {
    uint64_t v17 = v2;
    unint64_t v18 = sub_226F7AA48();
    os_log_type_t v19 = sub_226F7AC48();
    if (os_log_type_enabled(v18, v19))
    {
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v28 = v21;
      *(_DWORD *)unint64_t v20 = 136315138;
      uint64_t v22 = v17;
      id v23 = objc_msgSend(v22, sel_description);
      uint64_t v24 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v26 = v25;

      sub_226F44310(v24, v26, &v28);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v18, v19, "[%s]: No training detector set!", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v21, -1, -1);
      MEMORY[0x22A66FDC0](v20, -1, -1);
    }
    else
    {
    }
  }
}

double sub_226F54D60@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (double *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_sampleLength);
  swift_beginAccess();
  double result = *v3;
  *a2 = *(void *)v3;
  return result;
}

uint64_t sub_226F54DB4(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_sampleLength);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

id sub_226F54E0C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_detectorManager);
  swift_beginAccess();
  os_log_type_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_226F54E74@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_trainingDetector);
  swift_beginAccess();
  os_log_type_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

void *sub_226F54EDC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*result
                  + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount);
  return result;
}

void *sub_226F54EF4(void *result, void *a2)
{
  if (__OFADD__(*result, 2)) {
    __break(1u);
  }
  else {
    *(void *)(*a2
  }
              + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation__visualizationBucketCount) = *result + 2;
  return result;
}

uint64_t sub_226F54F18@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1
               + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_226F54F6C(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (char *)(*a2
              + OBJC_IVAR____TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation_isActivelyTraining);
  swift_beginAccess();
  char v4 = *v3;
  *uint64_t v3 = v2;
  sub_226F4CB0C(v4);
}

uint64_t method lookup function for AXSDKShotNSRecordingControllerImplementation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXSDKShotNSRecordingControllerImplementation);
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.sampleLength.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.detectorManager.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.detectorManager.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.detectorManager.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.trainingDetector.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.listenerBufferSize.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.isListening.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.visualizationBucketCount.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.visualizationBucketCount.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.visualizationBucketCount.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.currentDetectionTypes.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.isSecure.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.isActivelyTraining.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.startListening()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.startListening(toTrainDetector:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.stopListening()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.register(listener:forRecordingUpdates:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.deregister(listener:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.retrainModel(withIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.add(listenType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.remove(listenType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.removeAllListenTypes()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of AXSDKShotNSRecordingControllerImplementation.kickoffMLTrainingOf(detector:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AXSDKShotRecordingError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AXSDKShotRecordingError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x226F556C0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_226F556E8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_226F556F4(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AXSDKShotRecordingError()
{
  return &type metadata for AXSDKShotRecordingError;
}

unint64_t sub_226F55714()
{
  unint64_t result = qword_268162510;
  if (!qword_268162510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268162510);
  }
  return result;
}

uint64_t sub_226F55768(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_226F557D0()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_226F55808()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_226F5581C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_226F55864()
{
  return sub_226F4CFD4(*(void *)(v0 + 16));
}

uint64_t sub_226F5586C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_226F55990()
{
  uint64_t v1 = (unint64_t *)(v0
                          + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors);
  swift_beginAccess();
  unint64_t v2 = *v1;
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v20 = MEMORY[0x263F8EE78];
  if (!(v2 >> 62))
  {
    uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_226F7AE98();
  uint64_t v4 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_31;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v7 = (id)MEMORY[0x22A66F200](i, v2);
    }
    else {
      id v7 = *(id *)(v2 + 8 * i + 32);
    }
    int v8 = v7;
    if (objc_msgSend(v7, sel_isCustom, v20))
    {
    }
    else
    {
      sub_226F7AE08();
      sub_226F7AE28();
      sub_226F7AE38();
      sub_226F7AE18();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = v20;
  if (v20 < 0) {
    goto LABEL_27;
  }
LABEL_16:
  if ((v9 & 0x4000000000000000) == 0)
  {
    uint64_t v10 = *(void *)(v9 + 16);
    if (!v10)
    {
LABEL_28:
      swift_release();
      uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_29:
      uint64_t v19 = sub_226F46CDC(v12);
      swift_bridgeObjectRelease();
      return v19;
    }
    goto LABEL_18;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_226F7AE98();
  swift_release();
  if (!v10) {
    goto LABEL_28;
  }
LABEL_18:
  uint64_t v21 = v3;
  uint64_t result = sub_226F4BEB8(0, v10 & ~(v10 >> 63), 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    uint64_t v11 = 0;
    uint64_t v12 = v3;
    do
    {
      if ((v9 & 0xC000000000000001) != 0) {
        id v13 = (id)MEMORY[0x22A66F200](v11, v9);
      }
      else {
        id v13 = *(id *)(v9 + 8 * v11 + 32);
      }
      unint64_t v14 = v13;
      id v15 = objc_msgSend(v13, sel_identifier, v21);
      _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

      uint64_t v16 = sub_226F7AAD8();
      swift_bridgeObjectRelease();
      uint64_t v21 = v12;
      unint64_t v18 = *(void *)(v12 + 16);
      unint64_t v17 = *(void *)(v12 + 24);
      if (v18 >= v17 >> 1) {
        sub_226F4BEB8(v17 > 1, v18 + 1, 1);
      }
      ++v11;
      *(void *)(v12 + 16) = v18 + 1;
      *(void *)(v12 + 8 * v18 + 32) = v16;
    }
    while (v10 != v11);
    swift_release();
    goto LABEL_29;
  }
LABEL_31:
  __break(1u);
  return result;
}

id AXSDSecureControllerImplementation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id AXSDSecureControllerImplementation.init()()
{
  id v1 = v0;
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226F7AA58();
  __swift_project_value_buffer(v2, (uint64_t)qword_268162638);
  uint64_t v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC58();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_226F20000, v3, v4, "Initializing Secure Sound Detection Controller", v5, 2u);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AXSDSecureControllerImplementation();
  return objc_msgSendSuper2(&v7, sel_init);
}

id AXSDSecureControllerImplementation.__deallocating_deinit()
{
  id v1 = v0;
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226F7AA58();
  __swift_project_value_buffer(v2, (uint64_t)qword_268162638);
  uint64_t v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC58();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_226F20000, v3, v4, "Deinitializing Secure Sound Detection Controller", v5, 2u);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AXSDSecureControllerImplementation();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_226F5606C(uint64_t a1)
{
  return sub_226F56124(a1, (void (*)(void))sub_226F56084);
}

void sub_226F56084(void *a1)
{
}

uint64_t sub_226F5610C(uint64_t a1)
{
  return sub_226F56124(a1, (void (*)(void))sub_226F561B8);
}

uint64_t sub_226F56124(uint64_t result, void (*a2)(void))
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v4 = result;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    do
    {
      unsigned int v6 = *(void **)(v4 + 8 * v5++ + 32);
      id v7 = v6;
      a2();
    }
    while (v2 != v5);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_226F561B8(void *a1)
{
}

void sub_226F561D8(void *a1, char *a2, void (*a3)(void))
{
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_226F7AA58();
  __swift_project_value_buffer(v7, (uint64_t)qword_268162638);
  id v8 = v3;
  id v9 = a1;
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = sub_226F7AA48();
  os_log_type_t v13 = sub_226F7AC58();
  uint64_t v43 = v10;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v42 = a3;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v45 = v41;
    *(_DWORD *)uint64_t v14 = 136315394;
    id v15 = v10;
    format = a2;
    id v16 = objc_msgSend(v15, sel_description);
    uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v19 = v18;

    sub_226F44310(v17, v19, &v45);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v20 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    sub_226F44310(v20, v21, &v45);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v12, v13, format, (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v41, -1, -1);
    uint64_t v22 = v14;
    a3 = v42;
    MEMORY[0x22A66FDC0](v22, -1, -1);
  }
  else
  {
  }
  id v23 = objc_msgSend(self, sel_sharedInstance);
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  uint64_t v24 = (void *)sub_226F7AAD8();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v23, sel_detectorWithIdentifier_, v24);

  if (v25)
  {
    a3(v25);
  }
  else
  {
    id v26 = v43;
    id v27 = v11;
    id v28 = v26;
    id v29 = v27;
    uint64_t v30 = sub_226F7AA48();
    uint64_t v31 = sub_226F7AC48();
    if (os_log_type_enabled(v30, (os_log_type_t)v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      uint64_t v45 = v44;
      *(_DWORD *)uint64_t v32 = 136315394;
      id v33 = v28;
      id v34 = objc_msgSend(v33, sel_description);
      uint64_t v35 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v37 = v36;

      sub_226F44310(v35, v37, &v45);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      uint64_t v38 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      sub_226F44310(v38, v39, &v45);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v30, (os_log_type_t)v31, "[%s]: unable to locate detector for listen type: %s", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v44, -1, -1);
      MEMORY[0x22A66FDC0](v32, -1, -1);
    }
    else
    {
    }
  }
}

void sub_226F567AC(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_226F7A9A8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  id v9 = (char *)v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)v77 - v10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12((char *)v77 - v10, a1, v5);
  int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v11, v5);
  if (v13 == *MEMORY[0x263F17978])
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_226F7AA58();
    __swift_project_value_buffer(v14, (uint64_t)qword_268162638);
    id v15 = v2;
    id v16 = a2;
    id v17 = v15;
    id v18 = v16;
    unint64_t v19 = sub_226F7AA48();
    os_log_type_t v20 = sub_226F7AC28();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v82 = v22;
      *(_DWORD *)uint64_t v21 = 136315394;
      id v23 = v17;
      id v24 = objc_msgSend(v23, sel_description);
      uint64_t v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v27 = v26;

      uint64_t v81 = sub_226F44310(v25, v27, &v82);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      id v28 = objc_msgSend(v18, sel_identifier);
      uint64_t v29 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v31 = v30;

      uint64_t v81 = sub_226F44310(v29, v31, &v82);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v19, v20, "[%s]: Detector: %s is INACTIVE", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v22, -1, -1);
      MEMORY[0x22A66FDC0](v21, -1, -1);
    }
    else
    {
    }
  }
  else if (v13 == *MEMORY[0x263F17970])
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_226F7AA58();
    __swift_project_value_buffer(v32, (uint64_t)qword_268162638);
    id v33 = v2;
    id v34 = a2;
    id v35 = v33;
    id v36 = v34;
    unint64_t v37 = sub_226F7AA48();
    os_log_type_t v38 = sub_226F7AC28();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v82 = v40;
      *(_DWORD *)uint64_t v39 = 136315394;
      id v41 = v35;
      id v42 = objc_msgSend(v41, sel_description);
      uint64_t v43 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v45 = v44;

      uint64_t v81 = sub_226F44310(v43, v45, &v82);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2080;
      id v46 = objc_msgSend(v36, sel_identifier);
      uint64_t v47 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v49 = v48;

      uint64_t v81 = sub_226F44310(v47, v49, &v82);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v37, v38, "[%s]: Detector: %s is ACTIVE", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v40, -1, -1);
      MEMORY[0x22A66FDC0](v39, -1, -1);
    }
    else
    {
    }
    id v76 = objc_msgSend(v36, sel_identifier);
    if (!v76)
    {
      _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      id v76 = (id)sub_226F7AAD8();
      swift_bridgeObjectRelease();
    }
    AXSDSoundDetectionGenerateUserNotificationForDetectionType(v76, 100.0);
  }
  else
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_226F7AA58();
    __swift_project_value_buffer(v50, (uint64_t)qword_268162638);
    v12(v9, a1, v5);
    id v51 = v2;
    id v52 = a2;
    id v53 = v51;
    id v54 = v52;
    id v55 = sub_226F7AA48();
    os_log_type_t v56 = sub_226F7AC48();
    int v57 = v56;
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v58 = swift_slowAlloc();
      os_log_t v79 = v55;
      uint64_t v59 = v58;
      uint64_t v80 = swift_slowAlloc();
      uint64_t v82 = v80;
      *(_DWORD *)uint64_t v59 = 136315650;
      int v78 = v57;
      v77[1] = v59 + 4;
      id v60 = v53;
      id v61 = objc_msgSend(v60, sel_description);
      uint64_t v62 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      id v63 = v54;
      unint64_t v65 = v64;

      uint64_t v81 = sub_226F44310(v62, v65, &v82);
      v77[2] = &v82;
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 12) = 2080;
      id v66 = objc_msgSend(v63, sel_identifier);
      uint64_t v67 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v69 = v68;

      uint64_t v81 = sub_226F44310(v67, v69, &v82);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 22) = 2080;
      uint64_t v70 = sub_226F573A0(&qword_268162250, MEMORY[0x263F17980]);
      uint64_t v71 = sub_226F57104(v5, v70);
      uint64_t v81 = sub_226F44310(v71, v72, &v82);
      sub_226F7ACD8();
      swift_bridgeObjectRelease();
      uint64_t v73 = *(void (**)(char *, uint64_t))(v6 + 8);
      v73(v9, v5);
      os_log_t v74 = v79;
      _os_log_impl(&dword_226F20000, v79, (os_log_type_t)v78, "[%s]: Detector: %s. FATAL ERROR - result is unknown and not handled. Result: %s", (uint8_t *)v59, 0x20u);
      uint64_t v75 = v80;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v75, -1, -1);
      MEMORY[0x22A66FDC0](v59, -1, -1);
    }
    else
    {

      uint64_t v73 = *(void (**)(char *, uint64_t))(v6 + 8);
      v73(v9, v5);
    }
    v73(v11, v5);
  }
}

uint64_t AccessibilitySoundRecognition.Detection.description.getter()
{
  uint64_t v0 = sub_226F7A9A8();
  uint64_t v1 = sub_226F573A0(&qword_268162250, MEMORY[0x263F17980]);
  return sub_226F57104(v0, v1);
}

uint64_t sub_226F57104(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  uint64_t v7 = sub_226F57104(a1, a2);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  return v7;
}

uint64_t type metadata accessor for AXSDSecureControllerImplementation()
{
  return self;
}

uint64_t method lookup function for AXSDSecureControllerImplementation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXSDSecureControllerImplementation);
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.currentDetectionTypes.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.add(listenTypes:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.add(listenType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.remove(listenTypes:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.remove(listenType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of AXSDSecureControllerImplementation.removeAllListenTypes()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t sub_226F573A0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_226F57444()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_226F574F8(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_226F5754C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_226F575B8())()
{
  return j__swift_endAccess;
}

BOOL sub_226F5762C()
{
  return *(void *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask) != 0;
}

uint64_t sub_226F5764C()
{
  return 1;
}

id AXSASecureControllerImplementation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id AXSASecureControllerImplementation.init()()
{
  id v1 = v0;
  uint64_t v2 = sub_226F7AA58();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate] = 0;
  if (qword_268162060 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_268162668);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_226F7AA48();
  os_log_type_t v8 = sub_226F7AC38();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_226F20000, v7, v8, "Initializing Secure Sound Actions Controller", v9, 2u);
    MEMORY[0x22A66FDC0](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v10 = (objc_class *)type metadata accessor for AXSASecureControllerImplementation();
  v13.receiver = v1;
  v13.super_class = v10;
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t sub_226F57938()
{
  id v1 = v0;
  uint64_t v2 = sub_226F7AA58();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)v64 - v8;
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)v64 - v10;
  uint64_t v12 = OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask;
  if (*(void *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask])
  {
    if (qword_268162060 != -1) {
      swift_once();
    }
    uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)qword_268162668);
    swift_beginAccess();
    uint64_t v71 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v71(v9, v13, v2);
    uint64_t v14 = v1;
    id v15 = sub_226F7AA48();
    os_log_type_t v16 = sub_226F7AC58();
    LODWORD(v72) = v16;
    BOOL v17 = os_log_type_enabled(v15, v16);
    uint64_t v70 = v14;
    if (v17)
    {
      uint64_t v73 = v2;
      uint64_t v18 = swift_slowAlloc();
      unint64_t v69 = v1;
      unint64_t v19 = (uint8_t *)v18;
      uint64_t v67 = swift_slowAlloc();
      uint64_t v75 = (void (*)(void, void, void))v67;
      unint64_t v65 = v19;
      id v66 = (uint8_t *)v15;
      *(_DWORD *)unint64_t v19 = 136315138;
      v64[1] = v19 + 4;
      os_log_type_t v20 = v14;
      uint64_t v21 = v13;
      id v22 = [(uint8_t *)v20 description];
      uint64_t v23 = v12;
      uint64_t v24 = v3;
      uint64_t v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v68 = v6;
      unint64_t v27 = v26;

      uint64_t v13 = v21;
      uint64_t v28 = v25;
      uint64_t v3 = v24;
      uint64_t v12 = v23;
      uint64_t v74 = sub_226F44310(v28, v27, (uint64_t *)&v75);
      sub_226F7ACD8();

      uint64_t v2 = v73;
      uint64_t v6 = v68;
      swift_bridgeObjectRelease();
      uint64_t v29 = v65;
      uint64_t v14 = v66;
      _os_log_impl(&dword_226F20000, (os_log_t)v66, (os_log_type_t)v72, "[%s]: sound actions will stop listening.", v65, 0xCu);
      uint64_t v30 = v67;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v30, -1, -1);
      unint64_t v31 = v29;
      id v1 = v69;
      MEMORY[0x22A66FDC0](v31, -1, -1);
    }
    else
    {
    }
    unint64_t v45 = *(void (**)(char *, uint64_t))(v3 + 8);
    v45(v9, v2);
    if (*(void *)&v1[v12])
    {
      swift_retain();
      if ((swift_task_isCancelled() & 1) == 0)
      {
        v71(v6, v13, v2);
        id v46 = v70;
        uint64_t v47 = sub_226F7AA48();
        unint64_t v48 = v6;
        os_log_type_t v49 = sub_226F7AC58();
        if (os_log_type_enabled(v47, v49))
        {
          uint64_t v72 = v3;
          uint64_t v50 = (uint8_t *)swift_slowAlloc();
          uint64_t v71 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc();
          uint64_t v75 = (void (*)(void, void, void))v71;
          uint64_t v73 = v2;
          uint64_t v70 = v50;
          *(_DWORD *)uint64_t v50 = 136315138;
          uint64_t v67 = (uint64_t)(v50 + 4);
          id v51 = v46;
          unint64_t v69 = v1;
          id v52 = v51;
          id v53 = [(uint8_t *)v51 description];
          uint64_t v54 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
          unint64_t v68 = v48;
          uint64_t v55 = v12;
          uint64_t v56 = v54;
          unint64_t v58 = v57;

          uint64_t v59 = v56;
          uint64_t v12 = v55;
          uint64_t v74 = sub_226F44310(v59, v58, (uint64_t *)&v75);
          sub_226F7ACD8();

          id v1 = v69;
          swift_bridgeObjectRelease();
          id v60 = v70;
          _os_log_impl(&dword_226F20000, v47, v49, "[%s]: sound actions cancelled current task.", v70, 0xCu);
          id v61 = v71;
          swift_arrayDestroy();
          MEMORY[0x22A66FDC0](v61, -1, -1);
          MEMORY[0x22A66FDC0](v60, -1, -1);

          uint64_t v62 = v73;
          id v63 = v68;
        }
        else
        {

          id v63 = v48;
          uint64_t v62 = v2;
        }
        v45(v63, v62);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681620A0);
        sub_226F7ABD8();
      }
      swift_release();
    }
    *(void *)&v1[v12] = 0;
    return swift_release();
  }
  else
  {
    if (qword_268162060 != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v2, (uint64_t)qword_268162668);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v32, v2);
    id v33 = v1;
    id v34 = sub_226F7AA48();
    os_log_type_t v35 = sub_226F7AC58();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v73 = v2;
      uint64_t v36 = v3;
      unint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v72 = swift_slowAlloc();
      uint64_t v75 = (void (*)(void, void, void))v72;
      *(_DWORD *)unint64_t v37 = 136315138;
      uint64_t v71 = (void (*)(char *, uint64_t, uint64_t))(v37 + 4);
      os_log_type_t v38 = v33;
      id v39 = objc_msgSend(v38, sel_description);
      uint64_t v40 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v42 = v41;

      uint64_t v74 = sub_226F44310(v40, v42, (uint64_t *)&v75);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v34, v35, "[%s]: sound actions has already stopped listening.", v37, 0xCu);
      uint64_t v43 = v72;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v43, -1, -1);
      MEMORY[0x22A66FDC0](v37, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v11, v73);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v11, v2);
    }
  }
}

uint64_t sub_226F580C4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162550);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_226F7ABC8();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  _DWORD v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  id v8 = v0;
  if (v7 == 1)
  {
    sub_226F5ACEC((uint64_t)v3);
  }
  else
  {
    sub_226F7ABB8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_226F7AB98();
      uint64_t v11 = v10;
      swift_unknownObjectRelease();
      if (v11 | v9)
      {
        v13[0] = 0;
        v13[1] = 0;
        id v13[2] = v9;
        v13[3] = v11;
      }
    }
  }
  return swift_task_create();
}

uint64_t sub_226F582DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[11] = a4;
  uint64_t v5 = sub_226F7AE48();
  v4[12] = v5;
  v4[13] = *(void *)(v5 - 8);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  uint64_t v6 = sub_226F7AE68();
  v4[16] = v6;
  v4[17] = *(void *)(v6 - 8);
  v4[18] = swift_task_alloc();
  uint64_t v7 = sub_226F7AA58();
  v4[19] = v7;
  v4[20] = *(void *)(v7 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v8 = sub_226F7A9C8();
  v4[22] = v8;
  v4[23] = *(void *)(v8 - 8);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162568);
  v4[26] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162570);
  v4[27] = v9;
  v4[28] = *(void *)(v9 - 8);
  v4[29] = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162578);
  v4[30] = v10;
  v4[31] = *(void *)(v10 - 8);
  v4[32] = swift_task_alloc();
  uint64_t v11 = sub_226F7AA08();
  v4[33] = v11;
  v4[34] = *(void *)(v11 - 8);
  v4[35] = swift_task_alloc();
  uint64_t v12 = sub_226F7A9E8();
  v4[36] = v12;
  v4[37] = *(void *)(v12 - 8);
  v4[38] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_226F58678, 0, 0);
}

uint64_t sub_226F58678()
{
  if (sub_226F7ABE8())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    sub_226F7A9D8();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[39] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_226F58808;
    uint64_t v4 = v0[38];
    uint64_t v5 = v0[35];
    return MEMORY[0x270EFE170](v5, v4);
  }
}

uint64_t sub_226F58808()
{
  *(void *)(*(void *)v1 + 320) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_226F59974;
  }
  else {
    uint64_t v2 = sub_226F5891C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_226F5891C()
{
  sub_226F7A9F8();
  sub_226F7AA18();
  unint64_t v1 = sub_226F5AD94();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[41] = v2;
  void *v2 = v0;
  v2[1] = sub_226F589F0;
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[27];
  return MEMORY[0x270FA1E80](v3, v4, v1);
}

uint64_t sub_226F589F0()
{
  *(void *)(*(void *)v1 + 336) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_226F5906C;
  }
  else {
    uint64_t v2 = sub_226F58B04;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_226F58B04()
{
  uint64_t v61 = v0;
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 184);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v5 = *(void *)(v0 + 296);
    uint64_t v4 = *(void *)(v0 + 304);
    uint64_t v7 = *(void *)(v0 + 280);
    uint64_t v6 = *(void *)(v0 + 288);
    uint64_t v8 = *(void *)(v0 + 264);
    uint64_t v9 = *(void *)(v0 + 272);
    uint64_t v11 = *(void *)(v0 + 248);
    uint64_t v10 = *(void *)(v0 + 256);
    uint64_t v12 = *(void *)(v0 + 240);
    (*(void (**)(void, void))(*(void *)(v0 + 224) + 8))(*(void *)(v0 + 232), *(void *)(v0 + 216));
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v14 = *(void *)(v0 + 104);
    uint64_t v13 = *(void *)(v0 + 112);
    uint64_t v15 = *(void *)(v0 + 96);
    sub_226F7AE58();
    *(_OWORD *)(v0 + 64) = xmmword_226F7E140;
    *(void *)(v0 + 4_Block_object_dispose(&a9, 8) = 0;
    *(void *)(v0 + 40) = 0;
    *(unsigned char *)(v0 + 56) = 1;
    uint64_t v16 = sub_226F5AD4C(&qword_268162580, MEMORY[0x263F8F710]);
    sub_226F7AF48();
    sub_226F5AD4C(&qword_268162588, MEMORY[0x263F8F6D8]);
    sub_226F7AE78();
    BOOL v17 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    *(void *)(v0 + 36_Block_object_dispose(&a9, 8) = v17;
    *(void *)(v0 + 376) = (v14 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v17(v13, v15);
    uint64_t v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 384) = v18;
    void *v18 = v0;
    v18[1] = sub_226F59708;
    uint64_t v20 = *(void *)(v0 + 120);
    uint64_t v19 = *(void *)(v0 + 128);
    return MEMORY[0x270FA2380](v20, v0 + 40, v19, v16);
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(*(void *)(v0 + 200), v1, v2);
    if (qword_268162060 != -1) {
      swift_once();
    }
    uint64_t v22 = *(void *)(v0 + 192);
    uint64_t v21 = *(void *)(v0 + 200);
    uint64_t v23 = *(void *)(v0 + 176);
    uint64_t v24 = *(void *)(v0 + 184);
    uint64_t v26 = *(void *)(v0 + 160);
    uint64_t v25 = *(void *)(v0 + 168);
    uint64_t v27 = *(void *)(v0 + 152);
    uint64_t v28 = *(void **)(v0 + 88);
    uint64_t v29 = __swift_project_value_buffer(v27, (uint64_t)qword_268162668);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v25, v29, v27);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, v21, v23);
    id v30 = v28;
    unint64_t v31 = sub_226F7AA48();
    os_log_type_t v32 = sub_226F7AC58();
    BOOL v33 = os_log_type_enabled(v31, v32);
    uint64_t v35 = *(void *)(v0 + 184);
    uint64_t v34 = *(void *)(v0 + 192);
    uint64_t v36 = *(void *)(v0 + 168);
    uint64_t v37 = *(void *)(v0 + 176);
    uint64_t v38 = *(void *)(v0 + 152);
    uint64_t v39 = *(void *)(v0 + 160);
    uint64_t v40 = *(void **)(v0 + 88);
    if (v33)
    {
      os_log_type_t type = v32;
      uint64_t v41 = swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      uint64_t v60 = v59;
      *(_DWORD *)uint64_t v41 = 136315394;
      uint64_t v55 = v37;
      id v42 = v40;
      id v43 = objc_msgSend(v42, sel_description);
      uint64_t v56 = v38;
      uint64_t v57 = v36;
      uint64_t v44 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v46 = v45;

      *(void *)(v41 + 4) = sub_226F44310(v44, v46, &v60);
      swift_bridgeObjectRelease();

      *(_WORD *)(v41 + 12) = 2080;
      uint64_t v47 = sub_226F7A9B8();
      *(void *)(v41 + 14) = sub_226F44310(v47, v48, &v60);
      swift_bridgeObjectRelease();
      os_log_type_t v49 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      v49(v34, v55);
      _os_log_impl(&dword_226F20000, v31, type, "[%s]: Detected Sound Action event: %s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v59, -1, -1);
      MEMORY[0x22A66FDC0](v41, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v57, v56);
    }
    else
    {

      os_log_type_t v49 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      v49(v34, v37);

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v36, v38);
    }
    *(void *)(v0 + 344) = v49;
    uint64_t v50 = sub_226F7A9B8();
    uint64_t v52 = v51;
    *(void *)(v0 + 352) = v51;
    id v53 = (void *)swift_task_alloc();
    *(void *)(v0 + 360) = v53;
    *id v53 = v0;
    v53[1] = sub_226F5952C;
    return sub_226F59D54(v50, v52);
  }
}

uint64_t sub_226F5906C()
{
  *(void *)(v0 + 80) = *(void *)(v0 + 336);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681620A0);
  swift_willThrowTypedImpl();
  return MEMORY[0x270FA2498](sub_226F590F8, 0, 0);
}

uint64_t sub_226F590F8()
{
  uint64_t v37 = v0;
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 248);
  (*(void (**)(void, void))(*(void *)(v0 + 224) + 8))(*(void *)(v0 + 232), *(void *)(v0 + 216));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v7 = *(void **)(v0 + 336);
  (*(void (**)(void, void))(*(void *)(v0 + 296) + 8))(*(void *)(v0 + 304), *(void *)(v0 + 288));
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v8 = *(void **)(v0 + 88);
  __swift_project_value_buffer(*(void *)(v0 + 152), (uint64_t)qword_268162638);
  id v9 = v8;
  id v10 = v7;
  id v11 = v9;
  id v12 = v7;
  uint64_t v13 = sub_226F7AA48();
  os_log_type_t v14 = sub_226F7AC58();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v16 = *(void **)(v0 + 88);
  if (v15)
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v36 = v35;
    *(_DWORD *)uint64_t v17 = 136315394;
    id v19 = v16;
    id v20 = objc_msgSend(v19, sel_description);
    uint64_t v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v23 = v22;

    *(void *)(v17 + 4) = sub_226F44310(v21, v23, &v36);
    swift_bridgeObjectRelease();

    *(_WORD *)(v17 + 12) = 2112;
    id v24 = v7;
    uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v17 + 14) = v25;
    void *v18 = v25;

    _os_log_impl(&dword_226F20000, v13, v14, "[%s]: session failed with %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v35, -1, -1);
    MEMORY[0x22A66FDC0](v17, -1, -1);
  }
  else
  {
  }
  uint64_t v27 = *(void *)(v0 + 104);
  uint64_t v26 = *(void *)(v0 + 112);
  uint64_t v28 = *(void *)(v0 + 96);
  sub_226F7AE58();
  *(_OWORD *)(v0 + 64) = xmmword_226F7E140;
  *(void *)(v0 + 4_Block_object_dispose(&a9, 8) = 0;
  *(void *)(v0 + 40) = 0;
  *(unsigned char *)(v0 + 56) = 1;
  uint64_t v29 = sub_226F5AD4C(&qword_268162580, MEMORY[0x263F8F710]);
  sub_226F7AF48();
  sub_226F5AD4C(&qword_268162588, MEMORY[0x263F8F6D8]);
  sub_226F7AE78();
  id v30 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  *(void *)(v0 + 36_Block_object_dispose(&a9, 8) = v30;
  *(void *)(v0 + 376) = (v27 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v30(v26, v28);
  unint64_t v31 = (void *)swift_task_alloc();
  *(void *)(v0 + 384) = v31;
  void *v31 = v0;
  v31[1] = sub_226F59708;
  uint64_t v33 = *(void *)(v0 + 120);
  uint64_t v32 = *(void *)(v0 + 128);
  return MEMORY[0x270FA2380](v33, v0 + 40, v32, v29);
}

uint64_t sub_226F5952C()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_226F59644, 0, 0);
}

uint64_t sub_226F59644()
{
  (*(void (**)(void, void))(v0 + 344))(*(void *)(v0 + 200), *(void *)(v0 + 176));
  unint64_t v1 = sub_226F5AD94();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32_Block_object_dispose(&a9, 8) = v2;
  void *v2 = v0;
  v2[1] = sub_226F589F0;
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 216);
  return MEMORY[0x270FA1E80](v3, v4, v1);
}

uint64_t sub_226F59708()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 392) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 368))(*(void *)(v2 + 120), *(void *)(v2 + 96));
    uint64_t v3 = sub_226F59860;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 136);
    uint64_t v4 = *(void *)(v2 + 144);
    uint64_t v6 = *(void *)(v2 + 128);
    (*(void (**)(void, void))(v2 + 368))(*(void *)(v2 + 120), *(void *)(v2 + 96));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_226F5ADF0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_226F59860()
{
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_226F59974()
{
  uint64_t v31 = v0;
  unint64_t v1 = *(void **)(v0 + 320);
  (*(void (**)(void, void))(*(void *)(v0 + 296) + 8))(*(void *)(v0 + 304), *(void *)(v0 + 288));
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void **)(v0 + 88);
  __swift_project_value_buffer(*(void *)(v0 + 152), (uint64_t)qword_268162638);
  id v3 = v2;
  id v4 = v1;
  id v5 = v3;
  id v6 = v1;
  uint64_t v7 = sub_226F7AA48();
  os_log_type_t v8 = sub_226F7AC58();
  BOOL v9 = os_log_type_enabled(v7, v8);
  id v10 = *(void **)(v0 + 88);
  if (v9)
  {
    uint64_t v11 = swift_slowAlloc();
    id v12 = (void *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v30 = v29;
    *(_DWORD *)uint64_t v11 = 136315394;
    id v13 = v10;
    id v14 = objc_msgSend(v13, sel_description);
    uint64_t v15 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v17 = v16;

    *(void *)(v11 + 4) = sub_226F44310(v15, v17, &v30);
    swift_bridgeObjectRelease();

    *(_WORD *)(v11 + 12) = 2112;
    id v18 = v1;
    uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v11 + 14) = v19;
    void *v12 = v19;

    _os_log_impl(&dword_226F20000, v7, v8, "[%s]: session failed with %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v29, -1, -1);
    MEMORY[0x22A66FDC0](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v21 = *(void *)(v0 + 104);
  uint64_t v20 = *(void *)(v0 + 112);
  uint64_t v22 = *(void *)(v0 + 96);
  sub_226F7AE58();
  *(_OWORD *)(v0 + 64) = xmmword_226F7E140;
  *(void *)(v0 + 4_Block_object_dispose(&a9, 8) = 0;
  *(void *)(v0 + 40) = 0;
  *(unsigned char *)(v0 + 56) = 1;
  uint64_t v23 = sub_226F5AD4C(&qword_268162580, MEMORY[0x263F8F710]);
  sub_226F7AF48();
  sub_226F5AD4C(&qword_268162588, MEMORY[0x263F8F6D8]);
  sub_226F7AE78();
  id v24 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  *(void *)(v0 + 36_Block_object_dispose(&a9, 8) = v24;
  *(void *)(v0 + 376) = (v21 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v24(v20, v22);
  uint64_t v25 = (void *)swift_task_alloc();
  *(void *)(v0 + 384) = v25;
  void *v25 = v0;
  v25[1] = sub_226F59708;
  uint64_t v27 = *(void *)(v0 + 120);
  uint64_t v26 = *(void *)(v0 + 128);
  return MEMORY[0x270FA2380](v27, v0 + 40, v26, v23);
}

uint64_t sub_226F59D54(uint64_t a1, uint64_t a2)
{
  v3[15] = a2;
  v3[16] = v2;
  v3[14] = a1;
  uint64_t v4 = sub_226F7AA58();
  v3[17] = v4;
  v3[18] = *(void *)(v4 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_226F59E28, 0, 0);
}

uint64_t sub_226F59E28()
{
  unint64_t v46 = v0;
  swift_bridgeObjectRetain();
  unsigned __int8 v1 = sub_226F5E144();
  if (v1 == 14)
  {
    if (qword_268162060 != -1) {
      swift_once();
    }
    uint64_t v3 = v0[18];
    uint64_t v2 = v0[19];
    uint64_t v4 = v0[17];
    uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_268162668);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_226F7AA48();
    os_log_type_t v7 = sub_226F7AC48();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v10 = v0[18];
    uint64_t v9 = v0[19];
    uint64_t v11 = v0[17];
    unint64_t v12 = v0[15];
    if (v8)
    {
      uint64_t v44 = v0[19];
      uint64_t v41 = v0[14];
      uint64_t v43 = v0[17];
      id v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v45 = v14;
      *(_DWORD *)id v13 = 136315138;
      swift_bridgeObjectRetain();
      v0[11] = sub_226F44310(v41, v12, &v45);
      sub_226F7ACD8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_226F20000, v6, v7, "no sound action type found for identifier: %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v14, -1, -1);
      MEMORY[0x22A66FDC0](v13, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v44, v43);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    }
  }
  else
  {
    unsigned __int8 v15 = v1;
    if (qword_268162060 != -1) {
      swift_once();
    }
    uint64_t v16 = v0[20];
    uint64_t v18 = v0[17];
    uint64_t v17 = v0[18];
    uint64_t v19 = (void *)v0[16];
    uint64_t v20 = __swift_project_value_buffer(v18, (uint64_t)qword_268162668);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v20, v18);
    id v21 = v19;
    uint64_t v22 = sub_226F7AA48();
    os_log_type_t v23 = sub_226F7AC58();
    BOOL v24 = os_log_type_enabled(v22, v23);
    uint64_t v25 = v0[20];
    uint64_t v26 = v0[17];
    uint64_t v27 = v0[18];
    uint64_t v28 = (void *)v0[16];
    if (v24)
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v45 = v42;
      *(_DWORD *)uint64_t v29 = 136315394;
      os_log_type_t type = v23;
      id v30 = v28;
      id v31 = objc_msgSend(v30, sel_description);
      uint64_t v39 = v26;
      uint64_t v40 = v25;
      uint64_t v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v34 = v33;

      v0[12] = sub_226F44310(v32, v34, &v45);
      sub_226F7ACD8();
      swift_bridgeObjectRelease();

      *(_WORD *)(v29 + 12) = 2048;
      v0[13] = v15 + 1;
      sub_226F7ACD8();
      _os_log_impl(&dword_226F20000, v22, type, "[%s]: posting voice trigger event to system: %ld", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v42, -1, -1);
      MEMORY[0x22A66FDC0](v29, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v40, v39);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    }
    uint64_t v35 = (id *)(v0[16] + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate);
    swift_beginAccess();
    if (*v35) {
      objc_msgSend(*v35, sel_postEventToSystemWithSoundActionEvent_, v15 + 1);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v36 = (uint64_t (*)(void))v0[1];
  return v36();
}

id AXSASecureControllerImplementation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXSASecureControllerImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AXSASecureControllerImplementation()
{
  return self;
}

uint64_t sub_226F5A3E0()
{
  unsigned __int8 v1 = v0;
  uint64_t v2 = sub_226F7AA58();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  BOOL v8 = (char *)v38 - v7;
  uint64_t v9 = OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask;
  if (*(void *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_currentTask])
  {
    if (qword_268162060 != -1) {
      swift_once();
    }
    uint64_t v10 = __swift_project_value_buffer(v2, (uint64_t)qword_268162668);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v10, v2);
    uint64_t v11 = v1;
    unint64_t v12 = sub_226F7AA48();
    os_log_type_t v13 = sub_226F7AC58();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v45 = v42;
      uint64_t v43 = v2;
      *(_DWORD *)uint64_t v14 = 136315138;
      uint64_t v41 = (uint64_t)(v14 + 4);
      unsigned __int8 v15 = v11;
      id v16 = objc_msgSend(v15, sel_description);
      uint64_t v17 = v3;
      uint64_t v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v20 = v19;

      uint64_t v44 = sub_226F44310(v18, v20, &v45);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v12, v13, "[%s]: sound actions is already listening.", v14, 0xCu);
      uint64_t v21 = v42;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v21, -1, -1);
      MEMORY[0x22A66FDC0](v14, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v8, v43);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    }
  }
  else
  {
    if (qword_268162060 != -1) {
      swift_once();
    }
    uint64_t v23 = __swift_project_value_buffer(v2, (uint64_t)qword_268162668);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v23, v2);
    BOOL v24 = v1;
    uint64_t v25 = sub_226F7AA48();
    os_log_type_t v26 = sub_226F7AC58();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v45 = v41;
      uint64_t v39 = v27;
      *(_DWORD *)uint64_t v27 = 136315138;
      v38[1] = v27 + 4;
      uint64_t v28 = v24;
      uint64_t v42 = (uint64_t)v24;
      uint64_t v29 = v28;
      id v30 = objc_msgSend(v28, sel_description);
      uint64_t v40 = v3;
      id v31 = v30;
      uint64_t v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      uint64_t v43 = v2;
      uint64_t v33 = v32;
      unint64_t v35 = v34;

      uint64_t v44 = sub_226F44310(v33, v35, &v45);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      uint64_t v36 = v39;
      _os_log_impl(&dword_226F20000, v25, v26, "[%s]: sound actions will start listening.", v39, 0xCu);
      uint64_t v37 = v41;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v37, -1, -1);
      MEMORY[0x22A66FDC0](v36, -1, -1);

      (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v43);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
    *(void *)&v1[v9] = sub_226F580C4();
    return swift_release();
  }
}

uint64_t sub_226F5A8F0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSASecureControllerImplementation_delegate);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t method lookup function for AXSASecureControllerImplementation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXSASecureControllerImplementation);
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.isListening.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.isSecure.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.startListening()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.startListening(onQueue:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AXSASecureControllerImplementation.stopListening()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t sub_226F5AB04()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_226F5AB44(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_226F5ABF8;
  return sub_226F582DC(a1, v4, v5, v6);
}

uint64_t sub_226F5ABF8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unsigned __int8 v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_226F5ACEC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162550);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_226F5AD4C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_226F5AD94()
{
  unint64_t result = qword_268162590;
  if (!qword_268162590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268162570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268162590);
  }
  return result;
}

uint64_t sub_226F5AE50()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_226F5AF04(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_226F5AF58(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_226F5AFC4())()
{
  return j__swift_endAccess;
}

id AXSANSControllerImplementation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

char *AXSANSControllerImplementation.init()()
{
  uint64_t v12 = sub_226F7AC78();
  uint64_t v1 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_226F7AC68();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_226F7AA98();
  MEMORY[0x270FA5388](v5 - 8);
  *(void *)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate] = 0;
  id v6 = objc_allocWithZone((Class)AXSDVoiceTriggerModelManager);
  uint64_t v7 = v0;
  id v8 = objc_msgSend(v6, sel_initWithError_, 0);
  *(void *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager] = v8;
  sub_226F49B1C();
  sub_226F7AA88();
  uint64_t v14 = MEMORY[0x263F8EE78];
  sub_226F5E038(&qword_2681622D8, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681622E0);
  sub_226F54380(&qword_2681622E8, &qword_2681622E0);
  sub_226F7ACF8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v12);
  *(void *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_processingQueue] = sub_226F7ACA8();

  uint64_t v9 = (objc_class *)type metadata accessor for AXSANSControllerImplementation();
  v13.receiver = v7;
  v13.super_class = v9;
  uint64_t v10 = (char *)objc_msgSendSuper2(&v13, sel_init);
  objc_msgSend(*(id *)&v10[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager], sel_setDelegate_, v10);
  return v10;
}

uint64_t type metadata accessor for AXSANSControllerImplementation()
{
  return self;
}

void sub_226F5B404()
{
}

void sub_226F5B45C(void *a1)
{
  v87[6] = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_226F7AA58();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v72[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = &v72[-v9];
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = &v72[-v11];
  if (qword_268162060 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v3, (uint64_t)qword_268162668);
  swift_beginAccess();
  uint64_t v14 = *(void **)(v4 + 16);
  id v81 = (id)(v4 + 16);
  uint64_t v82 = (void (*)(unsigned char *, uint64_t))v13;
  uint64_t v80 = v14;
  ((void (*)(unsigned char *, uint64_t, uint64_t))v14)(v12, v13, v3);
  id v15 = a1;
  id v16 = v1;
  id v17 = v15;
  uint64_t v18 = (char *)v16;
  uint64_t v19 = v4;
  unint64_t v20 = sub_226F7AA48();
  int v21 = sub_226F7AC58();
  BOOL v22 = os_log_type_enabled(v20, (os_log_type_t)v21);
  uint64_t v84 = v19;
  if (v22)
  {
    int v73 = v21;
    id v76 = v17;
    int v78 = v7;
    os_log_t v79 = v10;
    uint64_t v83 = v3;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v74 = (void *)swift_slowAlloc();
    uint64_t v75 = swift_slowAlloc();
    v87[0] = v75;
    *(_DWORD *)uint64_t v23 = 136315394;
    uint64_t v77 = v18;
    BOOL v24 = a1;
    uint64_t v25 = v18;
    id v26 = objc_msgSend(v25, sel_description);
    uint64_t v27 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v29 = v28;

    uint64_t v86 = sub_226F44310(v27, v29, v87);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2112;
    if (v24)
    {
      id v17 = v76;
      uint64_t v86 = (uint64_t)v76;
      id v30 = v76;
      sub_226F7ACD8();
      uint64_t v3 = v83;
      uint64_t v31 = v84;
    }
    else
    {
      uint64_t v86 = 0;
      sub_226F7ACD8();
      uint64_t v3 = v83;
      uint64_t v31 = v84;
      id v17 = v76;
    }
    a1 = v24;
    uint64_t v33 = v74;
    *uint64_t v74 = v24;

    _os_log_impl(&dword_226F20000, v20, (os_log_type_t)v73, "[%s]: start listening with queue: %@", (uint8_t *)v23, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v33, -1, -1);
    uint64_t v34 = v75;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v34, -1, -1);
    MEMORY[0x22A66FDC0](v23, -1, -1);

    uint64_t v32 = *(void (**)(unsigned char *, uint64_t))(v31 + 8);
    v32(v12, v3);
    uint64_t v7 = v78;
    uint64_t v10 = v79;
    uint64_t v18 = v77;
  }
  else
  {

    uint64_t v32 = *(void (**)(unsigned char *, uint64_t))(v19 + 8);
    v32(v12, v3);
  }
  unint64_t v35 = (id *)&v18[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  if (objc_msgSend(*v35, sel_containsListenDelegate_, v18)
    && (objc_msgSend(*v35, sel_isListening) & 1) != 0)
  {
    ((void (*)(unsigned char *, void (*)(unsigned char *, uint64_t), uint64_t))v80)(v7, v82, v3);
    uint64_t v36 = v18;
    uint64_t v37 = sub_226F7AA48();
    os_log_type_t v38 = sub_226F7AC58();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = swift_slowAlloc();
      uint64_t v82 = v32;
      uint64_t v40 = (uint8_t *)v39;
      uint64_t v41 = swift_slowAlloc();
      uint64_t v86 = v41;
      int v78 = v7;
      *(_DWORD *)uint64_t v40 = 136315138;
      uint64_t v42 = v36;
      id v43 = objc_msgSend(v42, sel_description);
      uint64_t v44 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      uint64_t v83 = v3;
      uint64_t v45 = v44;
      unint64_t v47 = v46;

      uint64_t v85 = sub_226F44310(v45, v47, &v86);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v37, v38, "[%s]: Sound Actions is already listening. startListening is a no-op.", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v41, -1, -1);
      MEMORY[0x22A66FDC0](v40, -1, -1);

      v82(v78, v83);
    }
    else
    {

      v32(v7, v3);
    }
  }
  else
  {
    p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___AXSDDetectorStoreDelegate + 16);
    if (a1)
    {
      int v78 = a1;
      ((void (*)(unsigned char *, void (*)(unsigned char *, uint64_t), uint64_t))v80)(v10, v82, v3);
      id v49 = v17;
      uint64_t v50 = v18;
      id v51 = v49;
      uint64_t v52 = v50;
      id v53 = v10;
      uint64_t v54 = v52;
      id v55 = v51;
      uint64_t v56 = sub_226F7AA48();
      os_log_type_t v57 = sub_226F7AC58();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v58 = swift_slowAlloc();
        uint64_t v82 = v32;
        uint64_t v59 = v58;
        uint64_t v80 = (void *)swift_slowAlloc();
        id v81 = (id)swift_slowAlloc();
        uint64_t v86 = (uint64_t)v81;
        *(_DWORD *)uint64_t v59 = 136315394;
        uint64_t v77 = (char *)(v59 + 4);
        uint64_t v60 = v54;
        id v61 = objc_msgSend(v60, sel_description);
        os_log_t v79 = v53;
        uint64_t v62 = v55;
        id v63 = v61;
        uint64_t v64 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        uint64_t v83 = v3;
        uint64_t v65 = v64;
        unint64_t v67 = v66;

        uint64_t v85 = sub_226F44310(v65, v67, &v86);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v59 + 12) = 2112;
        uint64_t v85 = (uint64_t)v62;
        id v68 = v62;
        id v55 = v62;
        sub_226F7ACD8();
        unint64_t v69 = v80;
        *uint64_t v80 = v78;

        _os_log_impl(&dword_226F20000, v56, v57, "[%s]: updating dispatch queue to: %@", (uint8_t *)v59, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v69, -1, -1);
        id v70 = v81;
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v70, -1, -1);
        MEMORY[0x22A66FDC0](v59, -1, -1);

        v82(v79, v83);
      }
      else
      {

        v32(v53, v3);
      }
      p_prots = &OBJC_PROTOCOL___AXSDDetectorStoreDelegate.prots;
      uint64_t v71 = *(void **)&v54[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_processingQueue];
      *(void *)&v54[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_processingQueue] = v55;
    }
    objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager], sel_setProcessingQueue_, *(uint64_t *)((char *)&p_prots[182]->count + (void)v18));
    sub_226F45DF0(v18, v18);
  }
}

uint64_t sub_226F5BD94()
{
  uint64_t v1 = sub_226F7AA78();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = sub_226F7AA98();
  uint64_t v5 = *(void *)(v14[0] - 8);
  MEMORY[0x270FA5388](v14[0]);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226F49604(v0, v0);
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_processingQueue];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_226F5E004;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_226F42574;
  aBlock[3] = &block_descriptor_2;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = v8;
  uint64_t v12 = v0;
  sub_226F7AA88();
  v14[1] = MEMORY[0x263F8EE78];
  sub_226F5E038((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  sub_226F54380((unint64_t *)&qword_2681620C0, (uint64_t *)&unk_268162720);
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v7, v4, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, void))(v5 + 8))(v7, v14[0]);
  return swift_release();
}

uint64_t sub_226F5C09C()
{
  return swift_unknownObjectRelease();
}

id AXSANSControllerImplementation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXSANSControllerImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall AXSANSControllerImplementation.receivedBuffer(_:at:)(AVAudioPCMBuffer _, AVAudioTime *at)
{
  impl = _.super._impl;
  Class isa = _.super.super.isa;
  uint64_t v5 = sub_226F7AA78();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = sub_226F7AA98();
  uint64_t v9 = *(void *)(v19[0] - 8);
  MEMORY[0x270FA5388](v19[0]);
  id v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void **)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_processingQueue];
  uint64_t v13 = (void *)swift_allocObject();
  id v13[2] = v2;
  v13[3] = isa;
  void v13[4] = impl;
  aBlock[4] = sub_226F5E0C8;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_226F42574;
  aBlock[3] = &block_descriptor_6_1;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v12;
  id v16 = v2;
  id v17 = isa;
  id v18 = impl;
  sub_226F7AA88();
  v19[1] = MEMORY[0x263F8EE78];
  sub_226F5E038((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  sub_226F54380((unint64_t *)&qword_2681620C0, (uint64_t *)&unk_268162720);
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, void))(v9 + 8))(v11, v19[0]);
  swift_release();
}

Swift::Void __swiftcall AXSANSControllerImplementation.listenEngineDidStart(withInputFormat:)(AVAudioFormat_optional *withInputFormat)
{
  uint64_t v3 = sub_226F7AA78();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_226F7AA98();
  uint64_t v62 = *(void (***)(char *, uint64_t))(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v61 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_226F7AA58();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v52 - v14;
  if (withInputFormat)
  {
    os_log_type_t v57 = v6;
    uint64_t v60 = (uint8_t *)v3;
    uint64_t v16 = qword_268162060;
    id v17 = withInputFormat;
    if (v16 != -1) {
      swift_once();
    }
    uint64_t v58 = v7;
    uint64_t v59 = v4;
    uint64_t v18 = __swift_project_value_buffer(v9, (uint64_t)qword_268162668);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v15, v18, v9);
    uint64_t v19 = v1;
    unint64_t v20 = sub_226F7AA48();
    os_log_type_t v21 = sub_226F7AC58();
    if (os_log_type_enabled(v20, v21))
    {
      BOOL v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      aBlock[0] = v53;
      uint64_t v54 = v10;
      *(_DWORD *)BOOL v22 = 136315138;
      uint64_t v52 = v22 + 4;
      uint64_t v23 = v19;
      id v24 = objc_msgSend(v23, sel_description);
      uint64_t v56 = v9;
      id v25 = v24;
      uint64_t v26 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      id v55 = v17;
      unint64_t v28 = v27;

      uint64_t v65 = sub_226F44310(v26, v28, aBlock);
      sub_226F7ACD8();

      id v17 = v55;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v20, v21, "[%s]: listen engine did start", v22, 0xCu);
      uint64_t v29 = v53;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v29, -1, -1);
      MEMORY[0x22A66FDC0](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v54 + 8))(v15, v56);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    }
    id v43 = *(void **)&v19[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_processingQueue];
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = v19;
    *(void *)(v44 + 24) = v17;
    aBlock[4] = (uint64_t)sub_226F5E128;
    aBlock[5] = v44;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_226F42574;
    aBlock[3] = (uint64_t)&block_descriptor_12_1;
    uint64_t v45 = _Block_copy(aBlock);
    unint64_t v46 = v17;
    unint64_t v47 = v19;
    id v48 = v43;
    id v49 = v61;
    sub_226F7AA88();
    uint64_t v65 = MEMORY[0x263F8EE78];
    sub_226F5E038((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
    sub_226F54380((unint64_t *)&qword_2681620C0, (uint64_t *)&unk_268162720);
    uint64_t v50 = v57;
    id v51 = v60;
    sub_226F7ACF8();
    MEMORY[0x22A66F0C0](0, v49, v50, v45);
    _Block_release(v45);

    (*(void (**)(char *, uint8_t *))(v59 + 8))(v50, v51);
    v62[1](v49, v58);
    swift_release();
  }
  else
  {
    if (qword_268162060 != -1) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v9, (uint64_t)qword_268162668);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v30, v9);
    id v31 = v1;
    uint64_t v32 = sub_226F7AA48();
    os_log_type_t v33 = sub_226F7AC48();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v56 = v9;
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      id v61 = (char *)swift_slowAlloc();
      uint64_t v64 = v61;
      *(_DWORD *)uint64_t v34 = 136315138;
      uint64_t v60 = v34 + 4;
      id v35 = v31;
      id v36 = objc_msgSend(v35, sel_description);
      uint64_t v62 = (void (**)(char *, uint64_t))v31;
      uint64_t v37 = v10;
      id v38 = v36;
      uint64_t v39 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v41 = v40;

      uint64_t v65 = sub_226F44310(v39, v41, (uint64_t *)&v64);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v32, v33, "[%s]: listen engine did not return an audio format - this should NOT happen; bailing. File a radar!",
        v34,
        0xCu);
      uint64_t v42 = v61;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v42, -1, -1);
      MEMORY[0x22A66FDC0](v34, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v56);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    sub_226F5BD94();
  }
}

uint64_t AXSANSControllerImplementation.listenEngineFailedToStartWithError(_:)(void *a1)
{
  uint64_t v74[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_226F7AA58();
  uint64_t v72 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v63 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v63 - v10;
  if (qword_268162060 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v3, (uint64_t)qword_268162668);
  swift_beginAccess();
  id v70 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 16);
  v70(v11, v12, v3);
  id v13 = v1;
  id v14 = a1;
  id v15 = v13;
  id v16 = a1;
  id v17 = sub_226F7AA48();
  os_log_type_t v18 = sub_226F7AC48();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v71 = v3;
  if (v19)
  {
    os_log_t v65 = v17;
    uint64_t v67 = v12;
    uint64_t v68 = (uint64_t)v6;
    unint64_t v69 = v9;
    uint64_t v20 = swift_slowAlloc();
    id v63 = (void *)swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    v74[0] = v64;
    *(_DWORD *)uint64_t v20 = 136315394;
    id v66 = v15;
    id v21 = v15;
    id v22 = objc_msgSend(v21, sel_description);
    uint64_t v23 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v25 = v24;

    uint64_t v73 = sub_226F44310(v23, v25, v74);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2112;
    if (a1)
    {
      id v26 = a1;
      uint64_t v27 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v73 = v27;
      sub_226F7ACD8();
    }
    else
    {
      uint64_t v73 = 0;
      sub_226F7ACD8();
      uint64_t v27 = 0;
    }
    id v48 = v63;
    *id v63 = v27;

    os_log_t v49 = v65;
    _os_log_impl(&dword_226F20000, v65, v18, "[%s]: listen engine failed to start: %@", (uint8_t *)v20, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v48, -1, -1);
    uint64_t v50 = v64;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v50, -1, -1);
    MEMORY[0x22A66FDC0](v20, -1, -1);

    uint64_t v3 = v71;
    unint64_t v28 = *(void (**)(char *, uint64_t))(v72 + 8);
    v28(v11, v71);
    uint64_t v6 = (char *)v68;
    uint64_t v9 = v69;
    id v15 = v66;
    uint64_t v12 = v67;
    if (!a1) {
      goto LABEL_12;
    }
  }
  else
  {

    unint64_t v28 = *(void (**)(char *, uint64_t))(v72 + 8);
    v28(v11, v3);
    if (!a1)
    {
LABEL_12:
      v70(v6, v12, v3);
      id v51 = v15;
      uint64_t v52 = sub_226F7AA48();
      os_log_type_t v53 = sub_226F7AC48();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v54 = (uint8_t *)swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        id v70 = (void (*)(char *, uint64_t, uint64_t))v28;
        uint64_t v56 = v55;
        v74[0] = v55;
        uint64_t v68 = (uint64_t)v6;
        *(_DWORD *)uint64_t v54 = 136315138;
        id v57 = v51;
        id v58 = objc_msgSend(v57, sel_description);
        uint64_t v59 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v61 = v60;

        uint64_t v73 = sub_226F44310(v59, v61, v74);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_226F20000, v52, v53, "[%s]: listen engine failed to start.", v54, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v56, -1, -1);
        MEMORY[0x22A66FDC0](v54, -1, -1);

        uint64_t v46 = v68;
        return ((uint64_t (*)(uint64_t, uint64_t))v70)(v46, v71);
      }

      unint64_t v47 = v6;
      return ((uint64_t (*)(char *, uint64_t))v28)(v47, v3);
    }
  }
  v70(v9, v12, v3);
  id v29 = a1;
  id v30 = v15;
  id v31 = a1;
  id v32 = v30;
  id v33 = a1;
  uint64_t v34 = sub_226F7AA48();
  os_log_type_t v35 = sub_226F7AC48();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = swift_slowAlloc();
    uint64_t v37 = (void *)swift_slowAlloc();
    uint64_t v68 = swift_slowAlloc();
    v74[0] = v68;
    *(_DWORD *)uint64_t v36 = 136315394;
    unint64_t v69 = v9;
    id v38 = v32;
    id v39 = objc_msgSend(v38, sel_description);
    uint64_t v40 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    id v70 = (void (*)(char *, uint64_t, uint64_t))v28;
    unint64_t v42 = v41;

    uint64_t v73 = sub_226F44310(v40, v42, v74);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v36 + 12) = 2112;
    id v43 = a1;
    uint64_t v44 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v73 = v44;
    sub_226F7ACD8();
    void *v37 = v44;

    _os_log_impl(&dword_226F20000, v34, v35, "[%s]: listen engine failed to start with error: %@", (uint8_t *)v36, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v37, -1, -1);
    uint64_t v45 = v68;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v45, -1, -1);
    MEMORY[0x22A66FDC0](v36, -1, -1);

    uint64_t v46 = (uint64_t)v69;
    return ((uint64_t (*)(uint64_t, uint64_t))v70)(v46, v71);
  }

  unint64_t v47 = v9;
  return ((uint64_t (*)(char *, uint64_t))v28)(v47, v3);
}

uint64_t AXSANSControllerImplementation.receivedError(_:fromDetector:)(void *a1, void *a2)
{
  uint64_t v5 = sub_226F7AA58();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268162060 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v5, (uint64_t)qword_268162668);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  id v10 = v2;
  id v11 = a2;
  id v12 = a1;
  id v13 = v10;
  id v14 = v11;
  id v15 = a1;
  id v16 = sub_226F7AA48();
  os_log_type_t v17 = sub_226F7AC48();
  int v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v19 = swift_slowAlloc();
    os_log_type_t v35 = (void *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v42 = v40;
    *(_DWORD *)uint64_t v19 = 136315650;
    id v20 = v13;
    id v21 = objc_msgSend(v20, sel_description);
    int v37 = v18;
    id v22 = v21;
    uint64_t v23 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    uint64_t v39 = v5;
    uint64_t v24 = v23;
    os_log_t v36 = v16;
    unint64_t v26 = v25;

    uint64_t v41 = sub_226F44310(v24, v26, &v42);
    id v38 = v8;
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2112;
    uint64_t v41 = (uint64_t)v14;
    id v27 = v14;
    sub_226F7ACD8();
    unint64_t v28 = v35;
    void *v35 = v14;

    *(_WORD *)(v19 + 22) = 2112;
    id v29 = a1;
    uint64_t v30 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v41 = v30;
    sub_226F7ACD8();
    v28[1] = v30;

    os_log_t v31 = v36;
    _os_log_impl(&dword_226F20000, v36, (os_log_type_t)v37, "[%s]: received error for sound action: %@. error: %@", (uint8_t *)v19, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v28, -1, -1);
    uint64_t v32 = v40;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v32, -1, -1);
    MEMORY[0x22A66FDC0](v19, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v38, v39);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t AXSANSControllerImplementation.listeningStoppedWithError(_:)(void *a1)
{
  uint64_t v3 = sub_226F7AA58();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v43 - v8;
  if (a1)
  {
    id v10 = a1;
    if (qword_268162060 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v3, (uint64_t)qword_268162668);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v11, v3);
    id v12 = a1;
    id v13 = v1;
    id v14 = a1;
    id v15 = v13;
    id v16 = sub_226F7AA48();
    os_log_type_t v17 = sub_226F7AC48();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v44 = (void *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v48 = v45;
      *(_DWORD *)uint64_t v18 = 136315394;
      v43[1] = v18 + 4;
      id v19 = v15;
      id v20 = objc_msgSend(v19, sel_description);
      uint64_t v46 = v3;
      id v21 = v20;
      uint64_t v22 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v24 = v23;

      uint64_t v47 = sub_226F44310(v22, v24, &v48);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2112;
      id v25 = a1;
      uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v47 = v26;
      sub_226F7ACD8();
      id v27 = v44;
      *uint64_t v44 = v26;

      _os_log_impl(&dword_226F20000, v16, v17, "[%s]: listen stopped with error: %@", (uint8_t *)v18, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v27, -1, -1);
      uint64_t v28 = v45;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v28, -1, -1);
      MEMORY[0x22A66FDC0](v18, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v46);
    }

    uint64_t v41 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
    uint64_t v42 = v9;
  }
  else
  {
    if (qword_268162060 != -1) {
      swift_once();
    }
    uint64_t v30 = __swift_project_value_buffer(v3, (uint64_t)qword_268162668);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v30, v3);
    id v31 = v1;
    uint64_t v32 = sub_226F7AA48();
    os_log_type_t v33 = sub_226F7AC28();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v46 = v3;
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v48 = v45;
      *(_DWORD *)uint64_t v34 = 136315138;
      uint64_t v44 = v34 + 4;
      id v35 = v31;
      id v36 = objc_msgSend(v35, sel_description);
      uint64_t v37 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v39 = v38;

      uint64_t v47 = sub_226F44310(v37, v39, &v48);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v32, v33, "[%s]: listen engine stopped.", v34, 0xCu);
      uint64_t v40 = v45;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v40, -1, -1);
      MEMORY[0x22A66FDC0](v34, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v46);
    }

    uint64_t v41 = *(uint64_t (**)(char *, uint64_t))(v4 + 8);
    uint64_t v42 = v7;
  }
  return v41(v42, v3);
}

uint64_t sub_226F5DFCC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_226F5E004()
{
  return objc_msgSend(*(id *)(*(void *)(v0 + 16)+ OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager), sel_stopListening);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_226F5E038(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_226F5E080()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_226F5E0C8()
{
  return objc_msgSend(*(id *)(v0[2] + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager), sel_processAudioBuffer_atTime_, v0[3], v0[4]);
}

uint64_t sub_226F5E0E8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_226F5E128()
{
  return objc_msgSend(*(id *)(*(void *)(v0 + 16)+ OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_modelManager), sel_startListeningWithFormat_, *(void *)(v0 + 24));
}

uint64_t sub_226F5E144()
{
  unint64_t v0 = sub_226F7AEF8();
  swift_bridgeObjectRelease();
  if (v0 >= 0xE) {
    return 14;
  }
  else {
    return v0;
  }
}

id _s18AXSoundDetectionUI30AXSANSControllerImplementationC19receivedObservation_11forDetectorySo20SNSoundActionsResultC_So20SNDetectSoundRequestCtF_0(void *a1)
{
  uint64_t v3 = sub_226F7AA58();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v57 - v8;
  if (qword_268162060 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v3, (uint64_t)qword_268162668);
  swift_beginAccess();
  uint64_t v11 = *(void (**)(char *, uint8_t *, uint64_t))(v4 + 16);
  uint64_t v61 = v4 + 16;
  uint64_t v62 = (uint8_t *)v10;
  unint64_t v60 = v11;
  v11(v9, (uint8_t *)v10, v3);
  id v12 = a1;
  id v13 = v1;
  id v14 = v12;
  id v15 = (char *)v13;
  id v16 = sub_226F7AA48();
  os_log_type_t v17 = sub_226F7AC38();
  BOOL v18 = os_log_type_enabled(v16, v17);
  id v19 = &off_2647F5000;
  os_log_t v65 = v7;
  if (v18)
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v63 = v4;
    uint64_t v21 = v20;
    uint64_t v58 = swift_slowAlloc();
    v66[0] = v58;
    *(_DWORD *)uint64_t v21 = 136315650;
    uint64_t v22 = v15;
    uint64_t v64 = v3;
    unint64_t v23 = v22;
    id v24 = objc_msgSend(v22, sel_description);
    uint64_t v25 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    uint64_t v59 = v15;
    unint64_t v27 = v26;

    uint64_t v67 = sub_226F44310(v25, v27, v66);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    id v28 = objc_msgSend(v14, sel_name);
    uint64_t v29 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v31 = v30;

    id v15 = v59;
    uint64_t v32 = v29;
    uint64_t v3 = v64;
    uint64_t v67 = sub_226F44310(v32, v31, v66);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 22) = 2048;
    objc_msgSend(v14, sel_confidence);
    uint64_t v67 = v33;
    id v19 = &off_2647F5000;
    sub_226F7ACD8();

    _os_log_impl(&dword_226F20000, v16, v17, "[%s]: received sound action: %s with confidence: %f.", (uint8_t *)v21, 0x20u);
    uint64_t v34 = v58;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v34, -1, -1);
    uint64_t v35 = v21;
    uint64_t v4 = v63;
    MEMORY[0x22A66FDC0](v35, -1, -1);
  }
  else
  {
  }
  id v36 = *(void (**)(char *, uint64_t))(v4 + 8);
  v36(v9, v3);
  id result = [v14 (SEL)v19[218]];
  if (v38 >= 0.5)
  {
    id v39 = objc_msgSend(v14, sel_name);
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

    unsigned __int8 v40 = sub_226F5E144();
    if (v40 == 14)
    {
      uint64_t v41 = v65;
      v60(v65, v62, v3);
      id v42 = v14;
      id v43 = sub_226F7AA48();
      os_log_type_t v44 = sub_226F7AC48();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = swift_slowAlloc();
        uint64_t v64 = v3;
        uint64_t v46 = (uint8_t *)v45;
        uint64_t v47 = swift_slowAlloc();
        v66[0] = v47;
        *(_DWORD *)uint64_t v46 = 136315138;
        uint64_t v62 = v46 + 4;
        id v48 = objc_msgSend(v42, sel_name);
        uint64_t v49 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        uint64_t v63 = v4;
        uint64_t v50 = v49;
        unint64_t v52 = v51;

        uint64_t v67 = sub_226F44310(v50, v52, v66);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_226F20000, v43, v44, "no action type found for result name: %s", v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v47, -1, -1);
        MEMORY[0x22A66FDC0](v46, -1, -1);

        uint64_t v53 = v64;
        uint64_t v54 = v65;
      }
      else
      {

        uint64_t v54 = v41;
        uint64_t v53 = v3;
      }
      return (id)((uint64_t (*)(char *, uint64_t))v36)(v54, v53);
    }
    else
    {
      unsigned __int8 v55 = v40;
      uint64_t v56 = (id *)&v15[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate];
      swift_beginAccess();
      id result = *v56;
      if (*v56) {
        return objc_msgSend(result, sel_postEventToSystemWithSoundActionEvent_, v55 + 1);
      }
    }
  }
  return result;
}

uint64_t sub_226F5E780@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSANSControllerImplementation_delegate);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t method lookup function for AXSANSControllerImplementation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXSANSControllerImplementation);
}

uint64_t dispatch thunk of AXSANSControllerImplementation.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AXSANSControllerImplementation.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AXSANSControllerImplementation.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AXSANSControllerImplementation.startListening(onQueue:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t sub_226F5E8F4()
{
  uint64_t v1 = v0;
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226F7AA58();
  __swift_project_value_buffer(v2, (uint64_t)qword_268162638);
  uint64_t v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC58();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_226F20000, v3, v4, "AXSDKShotMonitor: Stop Monitoring", v5, 2u);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }

  if (!*(void *)(v1 + 16)) {
    return 0;
  }
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681620A0);
  sub_226F7ABD8();
  char isCancelled = swift_task_isCancelled();
  swift_release();
  return isCancelled & 1;
}

uint64_t sub_226F5EA2C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162550);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_226F7ABC8();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  _DWORD v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_226F4C3C0((uint64_t)v3, &qword_268162550);
  }
  else
  {
    sub_226F7ABB8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_226F7AB98();
      uint64_t v10 = v9;
      swift_unknownObjectRelease();
      if (v10 | v8)
      {
        v12[0] = 0;
        v12[1] = 0;
        v12[2] = v8;
        uint64_t v12[3] = v10;
      }
    }
  }
  return swift_task_create();
}

uint64_t sub_226F5EC50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  uint64_t v5 = sub_226F7AE48();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  uint64_t v6 = sub_226F7AE68();
  v4[12] = v6;
  v4[13] = *(void *)(v6 - 8);
  v4[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_226F5ED7C, 0, 0);
}

uint64_t sub_226F5ED7C()
{
  if (sub_226F7ABE8())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    uint64_t v3 = self;
    *(void *)(v0 + 120) = v3;
    id v4 = objc_msgSend(v3, sel_sharedInstance);
    unsigned __int8 v5 = objc_msgSend(v4, sel_isActivelyTrainingAKShotModel);

    if (v5)
    {
      if (qword_268162058 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_226F7AA58();
      __swift_project_value_buffer(v6, (uint64_t)qword_268162650);
      int v7 = sub_226F7AA48();
      os_log_type_t v8 = sub_226F7AC58();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_226F20000, v7, v8, "AXSDKShotMonitor: Not checking detectors. Currently training a KShot Model.", v9, 2u);
        MEMORY[0x22A66FDC0](v9, -1, -1);
      }
    }
    else
    {
      sub_226F5F5A4();
    }
    uint64_t v11 = *(void *)(v0 + 72);
    uint64_t v10 = *(void *)(v0 + 80);
    uint64_t v12 = *(void *)(v0 + 64);
    sub_226F7AE58();
    *(_OWORD *)(v0 + 40) = xmmword_226F7E200;
    *(void *)(v0 + 24) = 0;
    *(void *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    uint64_t v13 = sub_226F605DC(&qword_268162580, MEMORY[0x263F8F710]);
    sub_226F7AF48();
    sub_226F605DC(&qword_268162588, MEMORY[0x263F8F6D8]);
    sub_226F7AE78();
    id v14 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    *(void *)(v0 + 12_Block_object_dispose(&a9, 8) = v14;
    *(void *)(v0 + 136) = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v14(v10, v12);
    id v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v15;
    *id v15 = v0;
    v15[1] = sub_226F5F09C;
    uint64_t v17 = *(void *)(v0 + 88);
    uint64_t v16 = *(void *)(v0 + 96);
    return MEMORY[0x270FA2380](v17, v0 + 16, v16, v13);
  }
}

uint64_t sub_226F5F09C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 128))(*(void *)(v2 + 88), *(void *)(v2 + 64));
    uint64_t v3 = sub_226F5F508;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 104);
    uint64_t v4 = *(void *)(v2 + 112);
    uint64_t v6 = *(void *)(v2 + 96);
    (*(void (**)(void, void))(v2 + 128))(*(void *)(v2 + 88), *(void *)(v2 + 64));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_226F5F1F4;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_226F5F1F4()
{
  if (sub_226F7ABE8())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    id v3 = objc_msgSend(*(id *)(v0 + 120), sel_sharedInstance);
    unsigned __int8 v4 = objc_msgSend(v3, sel_isActivelyTrainingAKShotModel);

    if (v4)
    {
      if (qword_268162058 != -1) {
        swift_once();
      }
      uint64_t v5 = sub_226F7AA58();
      __swift_project_value_buffer(v5, (uint64_t)qword_268162650);
      uint64_t v6 = sub_226F7AA48();
      os_log_type_t v7 = sub_226F7AC58();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_226F20000, v6, v7, "AXSDKShotMonitor: Not checking detectors. Currently training a KShot Model.", v8, 2u);
        MEMORY[0x22A66FDC0](v8, -1, -1);
      }
    }
    else
    {
      sub_226F5F5A4();
    }
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v11 = *(void *)(v0 + 64);
    sub_226F7AE58();
    *(_OWORD *)(v0 + 40) = xmmword_226F7E200;
    *(void *)(v0 + 24) = 0;
    *(void *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    uint64_t v12 = sub_226F605DC(&qword_268162580, MEMORY[0x263F8F710]);
    sub_226F7AF48();
    sub_226F605DC(&qword_268162588, MEMORY[0x263F8F6D8]);
    sub_226F7AE78();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    *(void *)(v0 + 12_Block_object_dispose(&a9, 8) = v13;
    *(void *)(v0 + 136) = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v13(v9, v11);
    id v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v14;
    void *v14 = v0;
    v14[1] = sub_226F5F09C;
    uint64_t v16 = *(void *)(v0 + 88);
    uint64_t v15 = *(void *)(v0 + 96);
    return MEMORY[0x270FA2380](v16, v0 + 16, v15, v12);
  }
}

uint64_t sub_226F5F508()
{
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

void sub_226F5F5A4()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  id v1 = objc_msgSend(v0, sel_customDetectors);

  sub_226F46D98(0, (unint64_t *)&qword_268162770);
  unint64_t v2 = sub_226F7AB58();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_226F7AE98();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_29;
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    unint64_t v5 = v2 & 0xC000000000000001;
    uint64_t v6 = &selRef_setDateFormat_;
    while (1)
    {
      if (v5) {
        id v7 = (id)MEMORY[0x22A66F200](v4, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v4 + 32);
      }
      id v8 = v7;
      self;
      uint64_t v9 = swift_dynamicCastObjCClass();
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        id v8 = v8;
        if ([v10 v6[253]])
        {
          if (qword_268162050 != -1) {
            swift_once();
          }
          uint64_t v11 = sub_226F7AA58();
          __swift_project_value_buffer(v11, (uint64_t)qword_268162638);
          uint64_t v12 = v8;
          uint64_t v13 = sub_226F7AA48();
          os_log_type_t v14 = sub_226F7AC58();
          if (os_log_type_enabled(v13, v14))
          {
            uint64_t v15 = swift_slowAlloc();
            uint64_t v16 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v15 = 138412290;
            *(void *)(v15 + 4) = v10;
            void *v16 = v10;
            _os_log_impl(&dword_226F20000, v13, v14, "AXSDKShotMonitor: Checking if detector should be retrained: %@.", (uint8_t *)v15, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
            swift_arrayDestroy();
            MEMORY[0x22A66FDC0](v16, -1, -1);
            MEMORY[0x22A66FDC0](v15, -1, -1);
          }
          else
          {

            uint64_t v13 = v12;
          }

          char v17 = sub_226F5F9B0(v10);
          uint64_t v18 = sub_226F7AA48();
          os_log_type_t v19 = sub_226F7AC58();
          if (os_log_type_enabled(v18, v19))
          {
            uint64_t v20 = swift_slowAlloc();
            uint64_t v21 = swift_slowAlloc();
            uint64_t v24 = v21;
            *(_DWORD *)uint64_t v20 = 136315138;
            if (v17) {
              uint64_t v22 = 0x4653534543435553;
            }
            else {
              uint64_t v22 = 0x204552554C494146;
            }
            if (v17) {
              unint64_t v23 = 0xEC000000594C4C55;
            }
            else {
              unint64_t v23 = 0xEA00000000004F54;
            }
            *(void *)(v20 + 4) = sub_226F44310(v22, v23, &v24);
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_226F20000, v18, v19, "AXSDKShotMonitor: %s start retraining of detector.", (uint8_t *)v20, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22A66FDC0](v21, -1, -1);
            MEMORY[0x22A66FDC0](v20, -1, -1);
          }
          else
          {
          }
          unint64_t v5 = v2 & 0xC000000000000001;
          uint64_t v6 = &selRef_setDateFormat_;
          goto LABEL_7;
        }
      }
LABEL_7:
      if (v3 == ++v4) {
        goto LABEL_29;
      }
    }
  }
  __break(1u);
}

uint64_t sub_226F5F9B0(void *a1)
{
  uint64_t v2 = sub_226F7AA78();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_226F7AA98();
  uint64_t v68 = *(void *)(v6 - 8);
  unint64_t v69 = (void *)v6;
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162620);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_226F7A8E8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v61 - v17;
  if (objc_msgSend(a1, sel_modelFailed))
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_226F7AA58();
    __swift_project_value_buffer(v19, (uint64_t)qword_268162638);
    id v20 = a1;
    uint64_t v21 = sub_226F7AA48();
    os_log_type_t v22 = sub_226F7AC58();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v23 = 138412290;
      aBlock[0] = v20;
      id v25 = v20;
      sub_226F7ACD8();
      *uint64_t v24 = v20;

      _os_log_impl(&dword_226F20000, v21, v22, "Detector is already marked as failed. Not attempting retraining. Detector: %@", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v24, -1, -1);
      MEMORY[0x22A66FDC0](v23, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  uint64_t v65 = v3;
  id v26 = objc_msgSend(a1, sel_lastAttemptedTrainingDate);
  if (!v26)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_15;
  }
  unint64_t v27 = v26;
  id v66 = v18;
  sub_226F7A8B8();

  id v28 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v28(v11, v16, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
LABEL_15:
    sub_226F4C3C0((uint64_t)v11, &qword_268162620);
    sub_226F7A8D8();
    id v42 = (void *)sub_226F7A8A8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    objc_msgSend(a1, sel_setLastAttemptedTrainingDate_, v42);

    return 0;
  }
  uint64_t v63 = v2;
  uint64_t v29 = v66;
  v28(v66, v11, v12);
  sub_226F7A8D8();
  sub_226F7A8C8();
  double v31 = v30;
  uint64_t v32 = *(void (**)(char *, uint64_t))(v13 + 8);
  v32(v16, v12);
  if (fabs(v31) < 900.0)
  {
    uint64_t v64 = v32;
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_226F7AA58();
    __swift_project_value_buffer(v33, (uint64_t)qword_268162638);
    id v34 = a1;
    swift_retain_n();
    id v35 = v34;
    id v36 = sub_226F7AA48();
    os_log_type_t v37 = sub_226F7AC58();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = swift_slowAlloc();
      unint64_t v69 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v38 = 134218498;
      aBlock[0] = 0x408C200000000000;
      sub_226F7ACD8();
      swift_release_n();
      *(_WORD *)(v38 + 12) = 2048;
      *(double *)aBlock = v31;
      sub_226F7ACD8();
      *(_WORD *)(v38 + 22) = 2112;
      aBlock[0] = v35;
      id v39 = v35;
      sub_226F7ACD8();
      unsigned __int8 v40 = v69;
      *unint64_t v69 = v35;

      _os_log_impl(&dword_226F20000, v36, v37, "It's too early to attempt retrain of detector. Waiting: %f. Current time difference is: %f. Not attempting retraining. Detector: %@", (uint8_t *)v38, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v40, -1, -1);
      uint64_t v41 = v38;
      uint64_t v29 = v66;
      MEMORY[0x22A66FDC0](v41, -1, -1);
    }
    else
    {
      swift_release_n();
    }
    v64(v29, v12);
    return 0;
  }
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_226F7AA58();
  __swift_project_value_buffer(v44, (uint64_t)qword_268162638);
  uint64_t v45 = a1;
  uint64_t v46 = sub_226F7AA48();
  os_log_type_t v47 = sub_226F7AC58();
  int v48 = v47;
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v49 = swift_slowAlloc();
    LODWORD(v67) = v48;
    uint64_t v50 = (uint8_t *)v49;
    uint64_t v62 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v50 = 138412290;
    v61[1] = v50 + 4;
    uint64_t v64 = v32;
    unint64_t v51 = v50;
    aBlock[0] = v45;
    unint64_t v52 = v45;
    uint64_t v53 = v45;
    sub_226F7ACD8();
    uint64_t v54 = v62;
    *uint64_t v62 = v52;

    uint64_t v45 = v52;
    _os_log_impl(&dword_226F20000, v46, (os_log_type_t)v67, "Attempting to retrain detector. Detector: %@", v51, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v54, -1, -1);
    unsigned __int8 v55 = v51;
    uint64_t v32 = v64;
    MEMORY[0x22A66FDC0](v55, -1, -1);
  }
  else
  {

    uint64_t v46 = v45;
  }

  sub_226F46D98(0, (unint64_t *)&qword_2681622D0);
  uint64_t v56 = (void *)sub_226F7AC88();
  uint64_t v57 = swift_allocObject();
  *(void *)(v57 + 16) = v45;
  aBlock[4] = sub_226F604C8;
  aBlock[5] = v57;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_226F42574;
  aBlock[3] = &block_descriptor_3;
  uint64_t v58 = _Block_copy(aBlock);
  uint64_t v59 = v45;
  swift_release();
  sub_226F7AA88();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_226F605DC((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  sub_226F4671C();
  uint64_t v60 = v63;
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v8, v5, v58);
  _Block_release(v58);

  (*(void (**)(char *, uint64_t))(v65 + 8))(v5, v60);
  (*(void (**)(char *, void *))(v68 + 8))(v8, v69);
  v32(v66, v12);
  return 1;
}

void sub_226F603C4(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v2, sel_retrainDetector_, a1);
}

uint64_t sub_226F60434()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for AXSDKShotMonitor()
{
  return self;
}

uint64_t sub_226F60490()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_226F604C8()
{
  sub_226F603C4(*(void *)(v0 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_226F604E8()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_226F60528(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_226F5ABF8;
  return sub_226F5EC50(a1, v4, v5, v6);
}

uint64_t sub_226F605DC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_226F60624(uint64_t a1)
{
  return sub_226F60764(a1, qword_268162638, MEMORY[0x263F21260]);
}

uint64_t static Logger.ultron.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226F606AC(&qword_268162050, (uint64_t)qword_268162638, a1);
}

id sub_226F60668(uint64_t a1)
{
  return sub_226F60764(a1, qword_268162650, MEMORY[0x263F21268]);
}

uint64_t static Logger.kshot.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_226F606AC(&qword_268162058, (uint64_t)qword_268162650, a1);
}

uint64_t sub_226F606AC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_226F7AA58();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

id sub_226F60744(uint64_t a1)
{
  return sub_226F60764(a1, qword_268162668, MEMORY[0x263F21250]);
}

id sub_226F60764(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v5 = sub_226F7AA58();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  id result = (id)a3();
  if (result) {
    return (id)sub_226F7AA68();
  }
  __break(1u);
  return result;
}

uint64_t static Logger.soundActions.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_268162060 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226F7AA58();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_268162668);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static Logger.soundActions.setter(uint64_t a1)
{
  if (qword_268162060 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226F7AA58();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_268162668);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static Logger.soundActions.modify())()
{
  if (qword_268162060 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_226F7AA58();
  __swift_project_value_buffer(v0, (uint64_t)qword_268162668);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_226F60A84(uint64_t a1)
{
  uint64_t v2 = sub_226F7A928();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_226F7A948();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_226F7A938();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v21 = a1;
  v14(v13, a1, v10);
  int v15 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v13, v10);
  if (v15 == *MEMORY[0x263F178D0])
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    id v16 = AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter();
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    }
    else
    {
      uint64_t v18 = 0x6E776F6E6B6E55;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else if (v15 == *MEMORY[0x263F178C8])
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v13, v2);
    uint64_t v18 = sub_226F7A918();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    uint64_t v18 = 0x6E776F6E6B6E55;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v21, v10);
  return v18;
}

void sub_226F60DE0(void *a1)
{
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_226F7AA58();
  __swift_project_value_buffer(v3, (uint64_t)qword_268162638);
  id v4 = v1;
  id v5 = a1;
  uint64_t v6 = (char *)v4;
  id v7 = v5;
  uint64_t v8 = sub_226F7AA48();
  os_log_type_t v9 = sub_226F7AC58();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    v42[0] = v38;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v12 = v6;
    id v39 = v6;
    id v13 = objc_msgSend(v12, sel_description);
    uint64_t v14 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v16 = v15;

    sub_226F44310(v14, v16, v42);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    uint64_t v41 = (uint64_t)v7;
    id v17 = v7;
    uint64_t v6 = v39;
    sub_226F7ACD8();
    void *v11 = v7;

    _os_log_impl(&dword_226F20000, v8, v9, "[%s]: adding detector: %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v38, -1, -1);
    MEMORY[0x22A66FDC0](v10, -1, -1);
  }
  else
  {
  }
  uint64_t v18 = (uint64_t *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors];
  swift_beginAccess();
  id v19 = v7;
  unint64_t v20 = swift_bridgeObjectRetain();
  char v21 = sub_226F6D360(v20, v19);
  swift_bridgeObjectRelease();

  if (v21)
  {
    os_log_type_t v22 = v6;
    id v23 = v19;
    uint64_t v24 = v22;
    id v25 = v23;
    id v26 = sub_226F7AA48();
    os_log_type_t v27 = sub_226F7AC38();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = (void *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v41 = v40;
      *(_DWORD *)uint64_t v28 = 136315394;
      double v30 = v24;
      id v31 = objc_msgSend(v30, sel_description);
      uint64_t v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v34 = v33;

      sub_226F44310(v32, v34, &v41);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2112;
      id v35 = v25;
      sub_226F7ACD8();
      *uint64_t v29 = v25;

      _os_log_impl(&dword_226F20000, v26, v27, "[%s]: already added detector: %@. ignoring", (uint8_t *)v28, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v29, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v40, -1, -1);
      MEMORY[0x22A66FDC0](v28, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    uint64_t v41 = *v18;
    id v36 = v19;
    uint64_t v37 = swift_bridgeObjectRetain();
    MEMORY[0x22A66EF70](v37);
    if (*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_226F7AB78();
    }
    sub_226F7AB88();
    sub_226F7AB68();
    uint64_t *v18 = v41;
    swift_bridgeObjectRetain();
    sub_226F61E4C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void sub_226F61330(void *a1)
{
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_226F7AA58();
  __swift_project_value_buffer(v3, (uint64_t)qword_268162638);
  id v4 = v1;
  id v5 = a1;
  uint64_t v6 = (char *)v4;
  id v7 = v5;
  uint64_t v8 = sub_226F7AA48();
  os_log_type_t v9 = sub_226F7AC58();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    char v21 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v23[0] = v22;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v11 = v6;
    id v12 = objc_msgSend(v11, sel_description);
    uint64_t v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v15 = v14;

    unint64_t v24 = sub_226F44310(v13, v15, v23);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    unint64_t v24 = (unint64_t)v7;
    id v16 = v7;
    sub_226F7ACD8();
    void *v21 = v7;

    _os_log_impl(&dword_226F20000, v8, v9, "[%s]: removing detector: %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v21, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v22, -1, -1);
    MEMORY[0x22A66FDC0](v10, -1, -1);
  }
  else
  {
  }
  id v17 = (unint64_t *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors];
  swift_beginAccess();
  unint64_t v24 = *v17;
  id v18 = v7;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_226F6D6CC(&v24, v18);

  if (v24 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_226F7AE98();
    swift_bridgeObjectRelease();
    if (v20 >= v19) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v20 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v20 >= v19)
    {
LABEL_8:
      sub_226F6DAA0(v19, v20);
      *id v17 = v24;
      swift_bridgeObjectRetain();
      sub_226F61E4C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
}

uint64_t sub_226F61688()
{
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_226F7AA58();
  __swift_project_value_buffer(v1, (uint64_t)qword_268162638);
  uint64_t v2 = v0;
  uint64_t v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC58();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v14[0] = v6;
    *(_DWORD *)id v5 = 136315138;
    id v7 = v2;
    id v8 = objc_msgSend(v7, sel_description);
    uint64_t v9 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v11 = v10;

    sub_226F44310(v9, v11, v14);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v3, v4, "[%s]: removing all detectors", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v6, -1, -1);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }
  else
  {
  }
  id v12 = &v2[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors];
  swift_beginAccess();
  *(void *)id v12 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  sub_226F61E4C();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_226F618BC()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled];
  swift_beginAccess();
  if (*v1)
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_226F7AA58();
    __swift_project_value_buffer(v2, (uint64_t)qword_268162638);
    uint64_t v3 = v0;
    os_log_type_t v4 = sub_226F7AA48();
    os_log_type_t v5 = sub_226F7AC58();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      v13[0] = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      id v8 = v3;
      id v9 = objc_msgSend(v8, sel_description);
      uint64_t v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v12 = v11;

      sub_226F44310(v10, v12, v13);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v4, v5, "[%s]: sound recognition is already listening.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v7, -1, -1);
      MEMORY[0x22A66FDC0](v6, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    char *v1 = 1;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_226F6DDAC();
    swift_bridgeObjectRelease();
  }
}

void sub_226F61B10()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled];
  swift_beginAccess();
  if (*v1 == 1)
  {
    char *v1 = 0;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_226F6E0B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_226F7AA58();
    __swift_project_value_buffer(v2, (uint64_t)qword_268162638);
    uint64_t v3 = v0;
    os_log_type_t v4 = sub_226F7AA48();
    os_log_type_t v5 = sub_226F7AC58();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      v13[0] = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      id v8 = v3;
      id v9 = objc_msgSend(v8, sel_description);
      uint64_t v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v12 = v11;

      uint64_t v13[3] = sub_226F44310(v10, v12, v13);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v4, v5, "[%s]: sound recognition is already stopped.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v7, -1, -1);
      MEMORY[0x22A66FDC0](v6, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_226F61D64()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_226F61DB0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled);
  swift_beginAccess();
  return *v1;
}

BOOL sub_226F61DF8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks;
  swift_beginAccess();
  return *(void *)(*(void *)v1 + 16) != 0;
}

uint64_t sub_226F61E4C()
{
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled);
  uint64_t result = swift_beginAccess();
  if (*v1 == 1)
  {
    unint64_t v3 = swift_bridgeObjectRetain();
    uint64_t v4 = sub_226F46B88(v3);
    swift_bridgeObjectRelease();
    unint64_t v5 = swift_bridgeObjectRetain();
    uint64_t v6 = sub_226F46B88(v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_226F640A0(v6, v4);
    uint64_t v8 = sub_226F640A0(v4, v6);
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_226F6B134(v7);
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_226F6B134(v8);
    swift_bridgeObjectRelease();
    if (v10 < 0 || (v10 & 0x4000000000000000) != 0)
    {
      swift_retain();
      uint64_t result = sub_226F7AE98();
      uint64_t v11 = result;
      if (!result) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v11 = *(void *)(v10 + 16);
      uint64_t result = swift_retain();
      if (!v11) {
        goto LABEL_12;
      }
    }
    if (v11 < 1)
    {
      __break(1u);
      goto LABEL_25;
    }
    for (uint64_t i = 0; i != v11; ++i)
    {
      if ((v10 & 0xC000000000000001) != 0) {
        id v13 = (id)MEMORY[0x22A66F200](i, v10);
      }
      else {
        id v13 = *(id *)(v10 + 8 * i + 32);
      }
      unint64_t v14 = v13;
      sub_226F63514(v13);
    }
LABEL_12:
    swift_release();
    if (v9 < 0 || (v9 & 0x4000000000000000) != 0)
    {
      swift_retain();
      uint64_t result = sub_226F7AE98();
      uint64_t v15 = result;
      if (result)
      {
LABEL_15:
        if (v15 >= 1)
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if ((v9 & 0xC000000000000001) != 0) {
              id v17 = (id)MEMORY[0x22A66F200](j, v9);
            }
            else {
              id v17 = *(id *)(v9 + 8 * j + 32);
            }
            id v18 = v17;
            sub_226F631C0(v17);
          }
          goto LABEL_22;
        }
LABEL_25:
        __break(1u);
        return result;
      }
    }
    else
    {
      uint64_t v15 = *(void *)(v9 + 16);
      uint64_t result = swift_retain();
      if (v15) {
        goto LABEL_15;
      }
    }
LABEL_22:
    swift_release_n();
    return swift_release();
  }
  return result;
}

uint64_t sub_226F62058(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268162550);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v96 = (uint64_t)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162210);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_226F7A948();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626D0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_226F7A938();
  uint64_t v97 = *(void *)(v16 - 8);
  uint64_t v98 = v16;
  uint64_t v17 = *(void *)(v97 + 64);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  MEMORY[0x270FA5388](v18);
  char v95 = (char *)&v85 - v19;
  uint64_t v20 = &off_2647F5000;
  if (!objc_msgSend(a1, sel_isCustom))
  {
    uint64_t v90 = v9;
    uint64_t v91 = v8;
    os_log_t v94 = v15;
    unint64_t v89 = (char *)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_226F7AA58();
    uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)qword_268162638);
    id v24 = v2;
    id v25 = a1;
    id v26 = v24;
    id v27 = v25;
    uint64_t v92 = (void (*)(char *, uint64_t, uint64_t))v23;
    uint64_t v28 = sub_226F7AA48();
    os_log_type_t v29 = sub_226F7AC58();
    BOOL v30 = os_log_type_enabled(v28, v29);
    uint64_t v88 = v12;
    if (v30)
    {
      uint64_t v31 = swift_slowAlloc();
      id v93 = v26;
      uint64_t v32 = v27;
      uint64_t v33 = v31;
      uint64_t v85 = (void *)swift_slowAlloc();
      uint64_t v86 = swift_slowAlloc();
      uint64_t v100 = v86;
      *(_DWORD *)uint64_t v33 = 136315394;
      id v34 = v93;
      uint64_t v87 = v10;
      id v35 = v34;
      id v36 = objc_msgSend(v34, sel_description);
      uint64_t v37 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v39 = v38;

      uint64_t v99 = sub_226F44310(v37, v39, &v100);
      uint64_t v20 = &off_2647F5000;
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2112;
      uint64_t v99 = (uint64_t)v32;
      id v40 = v32;
      uint64_t v10 = v87;
      sub_226F7ACD8();
      uint64_t v41 = v85;
      *uint64_t v85 = v32;

      _os_log_impl(&dword_226F20000, v28, v29, "[%s]: creating task for sound recognition detector: %@", (uint8_t *)v33, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v41, -1, -1);
      uint64_t v42 = v86;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v42, -1, -1);
      uint64_t v43 = v33;
      id v27 = v32;
      id v26 = v93;
      MEMORY[0x22A66FDC0](v43, -1, -1);
    }
    else
    {
    }
    unsigned __int8 v44 = [v27 (SEL)v20[343]];
    uint64_t v45 = (uint64_t)v94;
    if ((v44 & 1) == 0)
    {
      id v46 = objc_msgSend(v27, sel_identifier);
      if (!v46)
      {
        _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        id v46 = (id)sub_226F7AAD8();
        swift_bridgeObjectRelease();
      }
      uint64_t v47 = (uint64_t)v91;
      AXSDSoundDetectionType.builtInDetectorIdentifier.getter(v46, (uint64_t)v91);
      int v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
      uint64_t v49 = v10;
      uint64_t v50 = v90;
      if (v48(v47, 1, v90) == 1)
      {
        sub_226F4C3C0(v47, (uint64_t *)&unk_268162210);
        uint64_t v51 = 1;
      }
      else
      {
        unint64_t v52 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 32);
        uint64_t v53 = v88;
        v52(v88, v47, v50);
        v52((char *)v45, (uint64_t)v53, v50);
        (*(void (**)(uint64_t, void, uint64_t))(v97 + 104))(v45, *MEMORY[0x263F178D0], v98);
        uint64_t v51 = 0;
      }
      uint64_t v54 = v97;
      uint64_t v55 = v98;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v97 + 56))(v45, v51, 1, v98);

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v45, 1, v55) != 1)
      {
        id v93 = v26;
        uint64_t v72 = v97;
        uint64_t v73 = v98;
        uint64_t v92 = *(void (**)(char *, uint64_t, uint64_t))(v97 + 32);
        uint64_t v74 = v95;
        v92(v95, v45, v98);
        uint64_t v75 = sub_226F7ABC8();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v75 - 8) + 56))(v96, 1, 1, v75);
        id v76 = v89;
        (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v89, v74, v73);
        uint64_t v77 = v27;
        unint64_t v78 = (*(unsigned __int8 *)(v72 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
        unint64_t v79 = (v17 + v78 + 7) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v80 = (char *)swift_allocObject();
        *((void *)v80 + 2) = 0;
        *((void *)v80 + 3) = 0;
        id v81 = (void (*)(char *, char *, uint64_t))v92;
        id v82 = v93;
        *((void *)v80 + 4) = v93;
        v81(&v80[v78], v76, v73);
        *(void *)&v80[v79] = v77;
        id v83 = v82;
        id v84 = v77;
        uint64_t v71 = sub_226F639D4(v96, (uint64_t)&unk_2681626E0, (uint64_t)v80);
        (*(void (**)(char *, uint64_t))(v72 + 8))(v74, v73);
        return v71;
      }
      sub_226F4C3C0(v45, &qword_2681626D0);
    }
    id v56 = v26;
    id v57 = v27;
    id v58 = v56;
    id v59 = v57;
    uint64_t v60 = sub_226F7AA48();
    os_log_type_t v61 = sub_226F7AC48();
    if (os_log_type_enabled(v60, v61))
    {
      uint64_t v62 = swift_slowAlloc();
      uint64_t v63 = (void *)swift_slowAlloc();
      uint64_t v98 = swift_slowAlloc();
      uint64_t v100 = v98;
      *(_DWORD *)uint64_t v62 = 136315394;
      id v64 = v58;
      id v65 = objc_msgSend(v64, sel_description);
      uint64_t v66 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v68 = v67;

      uint64_t v99 = sub_226F44310(v66, v68, &v100);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v62 + 12) = 2112;
      uint64_t v99 = (uint64_t)v59;
      id v69 = v59;
      sub_226F7ACD8();
      *uint64_t v63 = v59;

      _os_log_impl(&dword_226F20000, v60, v61, "[%s]: unable to find identifier for detector: %@", (uint8_t *)v62, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v63, -1, -1);
      uint64_t v70 = v98;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v70, -1, -1);
      MEMORY[0x22A66FDC0](v62, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return sub_226F629BC(a1);
}

uint64_t sub_226F629BC(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162550);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162310);
  ((void (*)(void))MEMORY[0x270FA5388])();
  id v82 = (void (*)(uint64_t, char *, uint64_t))((char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_226F7A898();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = v10;
  MEMORY[0x270FA5388](v9);
  unint64_t v79 = (char *)&v74 - v12;
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_226F7AA58();
  uint64_t v14 = __swift_project_value_buffer(v13, (uint64_t)qword_268162650);
  id v15 = v2;
  id v16 = a1;
  id v17 = v15;
  id v18 = v16;
  uint64_t v81 = v14;
  uint64_t v19 = sub_226F7AA48();
  os_log_type_t v20 = sub_226F7AC58();
  BOOL v21 = os_log_type_enabled(v19, v20);
  unint64_t v78 = v11;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    id v83 = v17;
    id v24 = (void *)v23;
    uint64_t v74 = swift_slowAlloc();
    uint64_t v85 = v74;
    *(_DWORD *)uint64_t v22 = 136315394;
    uint64_t v75 = v8;
    id v25 = v83;
    id v76 = v5;
    id v26 = v25;
    id v27 = objc_msgSend(v25, sel_description);
    uint64_t v80 = v7;
    id v28 = v27;
    uint64_t v29 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v31 = v30;

    uint64_t v84 = sub_226F44310(v29, v31, &v85);
    sub_226F7ACD8();

    uint64_t v5 = v76;
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2112;
    uint64_t v84 = (uint64_t)v18;
    id v32 = v18;
    uint64_t v7 = v80;
    sub_226F7ACD8();
    *id v24 = v18;

    uint64_t v8 = v75;
    _os_log_impl(&dword_226F20000, v19, v20, "[%s]: creating task for sound recognition detector: %@", (uint8_t *)v22, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    uint64_t v33 = v24;
    id v17 = v83;
    MEMORY[0x22A66FDC0](v33, -1, -1);
    uint64_t v34 = v74;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v34, -1, -1);
    MEMORY[0x22A66FDC0](v22, -1, -1);
  }
  else
  {
  }
  unsigned int v35 = objc_msgSend(v18, sel_isCustom);
  uint64_t v36 = (uint64_t)v82;
  if (v35)
  {
    self;
    uint64_t v37 = swift_dynamicCastObjCClass();
    if (v37)
    {
      unint64_t v38 = (void *)v37;
      id v83 = v17;
      id v39 = v18;
      id v40 = objc_msgSend(v38, sel_modelURL);
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = v78;
        sub_226F7A878();

        uint64_t v43 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
        v43(v36, v42, v7);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v36, 0, 1, v7);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v36, 1, v7) != 1)
        {
          unsigned __int8 v44 = v79;
          v43((uint64_t)v79, (char *)v36, v7);
          uint64_t v45 = sub_226F7ABC8();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v5, 1, 1, v45);
          (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v42, v44, v7);
          uint64_t v46 = *(unsigned __int8 *)(v8 + 80);
          uint64_t v80 = v7;
          uint64_t v47 = (v46 + 48) & ~v46;
          id v82 = v43;
          int v48 = v39;
          uint64_t v49 = v8;
          unint64_t v50 = (v77 + v47 + 7) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v51 = (char *)swift_allocObject();
          *((void *)v51 + 2) = 0;
          *((void *)v51 + 3) = 0;
          unint64_t v52 = (void (*)(char *, char *, uint64_t))v82;
          id v53 = v83;
          *((void *)v51 + 4) = v83;
          *((void *)v51 + 5) = v38;
          uint64_t v54 = v80;
          v52(&v51[v47], v42, v80);
          *(void *)&v51[v50] = v48;
          id v55 = v53;
          id v56 = v48;
          uint64_t v57 = sub_226F639D4((uint64_t)v5, (uint64_t)&unk_2681626A0, (uint64_t)v51);
          (*(void (**)(char *, uint64_t))(v49 + 8))(v79, v54);
          return v57;
        }
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v36, 1, 1, v7);
      }

      sub_226F4C3C0(v36, &qword_268162310);
      id v17 = v83;
    }
  }
  id v58 = v17;
  id v59 = v18;
  id v60 = v58;
  id v61 = v59;
  uint64_t v62 = sub_226F7AA48();
  os_log_type_t v63 = sub_226F7AC48();
  if (os_log_type_enabled(v62, v63))
  {
    uint64_t v64 = swift_slowAlloc();
    id v65 = (void *)swift_slowAlloc();
    id v83 = (id)swift_slowAlloc();
    uint64_t v85 = (uint64_t)v83;
    *(_DWORD *)uint64_t v64 = 136315394;
    id v66 = v60;
    id v67 = objc_msgSend(v66, sel_description);
    uint64_t v68 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v70 = v69;

    uint64_t v84 = sub_226F44310(v68, v70, &v85);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v64 + 12) = 2112;
    uint64_t v84 = (uint64_t)v61;
    id v71 = v61;
    sub_226F7ACD8();
    *id v65 = v61;

    _os_log_impl(&dword_226F20000, v62, v63, "[%s]: unable to locate mlModel found for custom detector: %@", (uint8_t *)v64, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v65, -1, -1);
    id v72 = v83;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v72, -1, -1);
    MEMORY[0x22A66FDC0](v64, -1, -1);
  }
  else
  {
  }
  return 0;
}

void sub_226F631C0(void *a1)
{
  unint64_t v3 = (uint64_t *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks];
  swift_beginAccess();
  if (!*(void *)(*v3 + 16)
    || (id v4 = a1,
        swift_bridgeObjectRetain(),
        sub_226F74054((uint64_t)v4),
        char v6 = v5,
        v4,
        swift_bridgeObjectRelease(),
        (v6 & 1) == 0))
  {
    uint64_t v7 = sub_226F62058(a1);
    if (v7)
    {
      uint64_t v8 = v7;
      swift_beginAccess();
      id v9 = a1;
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v28 = *v3;
      *unint64_t v3 = 0x8000000000000000;
      sub_226F74A54(v8, v9, isUniquelyReferenced_nonNull_native);
      *unint64_t v3 = v28;

      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_release();
    }
    else
    {
      if (qword_268162050 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_226F7AA58();
      __swift_project_value_buffer(v11, (uint64_t)qword_268162638);
      id v12 = a1;
      uint64_t v13 = v1;
      id v14 = v12;
      id v15 = v13;
      id v16 = sub_226F7AA48();
      os_log_type_t v17 = sub_226F7AC58();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = swift_slowAlloc();
        uint64_t v19 = (void *)swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        v27[0] = v26;
        *(_DWORD *)uint64_t v18 = 136315394;
        os_log_type_t v20 = v15;
        id v21 = objc_msgSend(v20, sel_description);
        uint64_t v22 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v24 = v23;

        uint64_t v28 = sub_226F44310(v22, v24, v27);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v18 + 12) = 2112;
        uint64_t v28 = (uint64_t)v14;
        id v25 = v14;
        sub_226F7ACD8();
        void *v19 = v14;

        _os_log_impl(&dword_226F20000, v16, v17, "[%s]: unable to create a task for detector: %@", (uint8_t *)v18, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v19, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v26, -1, -1);
        MEMORY[0x22A66FDC0](v18, -1, -1);
      }
      else
      {
      }
    }
  }
}

uint64_t sub_226F63514(void *a1)
{
  unint64_t v3 = &v1[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks];
  swift_beginAccess();
  if (*(void *)(*(void *)v3 + 16))
  {
    id v4 = a1;
    swift_bridgeObjectRetain();
    sub_226F74054((uint64_t)v4);
    if (v5)
    {
      swift_retain();

      swift_bridgeObjectRelease();
      if (qword_268162050 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_226F7AA58();
      __swift_project_value_buffer(v6, (uint64_t)qword_268162638);
      id v7 = v4;
      uint64_t v8 = v1;
      id v9 = v7;
      uint64_t v10 = v8;
      uint64_t v11 = sub_226F7AA48();
      os_log_type_t v12 = sub_226F7AC58();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = swift_slowAlloc();
        uint64_t v22 = (void *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        v24[0] = v23;
        *(_DWORD *)uint64_t v13 = 136315394;
        id v14 = v10;
        id v15 = objc_msgSend(v14, sel_description);
        uint64_t v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v18 = v17;

        sub_226F44310(v16, v18, v24);
        sub_226F7ACD8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v13 + 12) = 2112;
        id v19 = v9;
        sub_226F7ACD8();
        void *v22 = v9;

        _os_log_impl(&dword_226F20000, v11, v12, "[%s]: removing task for detector: %@.", (uint8_t *)v13, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v22, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v23, -1, -1);
        MEMORY[0x22A66FDC0](v13, -1, -1);
      }
      else
      {
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681620A0);
      sub_226F7ABD8();
      swift_release();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
  }
  swift_beginAccess();
  id v20 = a1;
  sub_226F6C52C((uint64_t)v20);
  swift_endAccess();

  return swift_release();
}

BOOL sub_226F6387C()
{
  uint64_t v1 = (char *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled);
  swift_beginAccess();
  char v2 = *v1;
  uint64_t v3 = v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks;
  if (v2)
  {
    swift_beginAccess();
    uint64_t v4 = swift_bridgeObjectRetain();
    sub_226F412B0(v4);
    uint64_t v6 = v5;
    id v7 = (void *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors);
    swift_beginAccess();
    unint64_t v8 = swift_bridgeObjectRetain();
    uint64_t v9 = sub_226F46B88(v8);
    swift_bridgeObjectRelease();
    sub_226F694F8(v6, v9);
    char v11 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0) {
      return 0;
    }
    uint64_t v12 = *(void *)(*(void *)v3 + 16);
    if (*v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_226F7AE98();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = *(void *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    return v12 == v13;
  }
  else
  {
    swift_beginAccess();
    return *(void *)(*(void *)v3 + 16) == 0;
  }
}

uint64_t sub_226F639D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_226F7ABC8();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_226F7ABB8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_226F4C3C0(a1, &qword_268162550);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_226F7AB98();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_226F63B5C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain_n();
  sub_226F61E4C();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id AXSDSecureBaseControllerImplementation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id AXSDSecureBaseControllerImplementation.init()()
{
  uint64_t v1 = qword_268162050;
  uint64_t v2 = v0;
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_226F7AA58();
  __swift_project_value_buffer(v3, (uint64_t)qword_268162638);
  uint64_t v4 = sub_226F7AA48();
  os_log_type_t v5 = sub_226F7AC58();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_226F20000, v4, v5, "Initializing Base Secure Sound Detection Controller", v6, 2u);
    MEMORY[0x22A66FDC0](v6, -1, -1);
  }

  uint64_t v7 = MEMORY[0x263F8EE78];
  *(void *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors] = MEMORY[0x263F8EE78];
  *(void *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentTasks] = sub_226F4D7A4(v7);
  v2[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled] = 0;

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for AXSDSecureBaseControllerImplementation();
  return objc_msgSendSuper2(&v9, sel_init);
}

id AXSDSecureBaseControllerImplementation.__deallocating_deinit()
{
  uint64_t v1 = v0;
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226F7AA58();
  __swift_project_value_buffer(v2, (uint64_t)qword_268162638);
  uint64_t v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC58();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl(&dword_226F20000, v3, v4, "Deinitializing Base Secure Sound Detection Controller", v5, 2u);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AXSDSecureBaseControllerImplementation();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_226F640A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_226F7AD38();
    if ((v2 & 0xC000000000000001) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    if (v4 > *(void *)(v2 + 16) >> 3) {
      goto LABEL_10;
    }
LABEL_13:
    sub_226F6B230(a1);
    return v2;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  if ((a2 & 0xC000000000000001) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  if (v2 < 0) {
    uint64_t v5 = v2;
  }
  else {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFFF8;
  }
  if (v4 <= sub_226F7AD38() / 8) {
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_226F7AD38();
  uint64_t v7 = sub_226F6A1AC(v5, v6);
  swift_bridgeObjectRelease();
  uint64_t v2 = v7;
LABEL_10:
  return sub_226F6B524(a1, v2);
}

uint64_t sub_226F641A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[17] = a5;
  v6[18] = a6;
  v6[16] = a4;
  uint64_t v7 = sub_226F7AE48();
  v6[19] = v7;
  v6[20] = *(void *)(v7 - 8);
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  uint64_t v8 = sub_226F7AE68();
  v6[23] = v8;
  v6[24] = *(void *)(v8 - 8);
  v6[25] = swift_task_alloc();
  uint64_t v9 = sub_226F7A9A8();
  v6[26] = v9;
  v6[27] = *(void *)(v9 - 8);
  v6[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681626A8);
  v6[29] = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626B0);
  v6[30] = v10;
  v6[31] = *(void *)(v10 - 8);
  v6[32] = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626B8);
  v6[33] = v11;
  v6[34] = *(void *)(v11 - 8);
  v6[35] = swift_task_alloc();
  uint64_t v12 = sub_226F7A998();
  v6[36] = v12;
  v6[37] = *(void *)(v12 - 8);
  v6[38] = swift_task_alloc();
  uint64_t v13 = sub_226F7A978();
  v6[39] = v13;
  v6[40] = *(void *)(v13 - 8);
  v6[41] = swift_task_alloc();
  v6[42] = swift_task_alloc();
  uint64_t v14 = sub_226F7A938();
  v6[43] = v14;
  v6[44] = *(void *)(v14 - 8);
  v6[45] = swift_task_alloc();
  v6[46] = swift_task_alloc();
  v6[47] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_226F64564, 0, 0);
}

uint64_t sub_226F64564()
{
  id v61 = v0;
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[16];
  uint64_t v2 = v0[47];
  uint64_t v3 = v0[43];
  uint64_t v4 = v0[44];
  uint64_t v5 = v0[17];
  uint64_t v6 = sub_226F7AA58();
  v0[48] = __swift_project_value_buffer(v6, (uint64_t)qword_268162638);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[49] = v7;
  v0[50] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v2, v5, v3);
  id v8 = v1;
  uint64_t v9 = sub_226F7AA48();
  os_log_type_t v10 = sub_226F7AC58();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = v0[47];
  uint64_t v13 = v0[43];
  uint64_t v14 = v0[44];
  id v15 = (void *)v0[16];
  if (v11)
  {
    uint64_t v57 = v0[43];
    uint64_t v16 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    uint64_t v60 = v58;
    *(_DWORD *)uint64_t v16 = 136315394;
    id v17 = v15;
    id v18 = objc_msgSend(v17, sel_description);
    uint64_t v19 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    log = v9;
    uint64_t v20 = v12;
    unint64_t v22 = v21;

    v0[14] = sub_226F44310(v19, v22, &v60);
    sub_226F7ACD8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v16 + 12) = 2080;
    uint64_t v23 = AccessibilitySoundRecognition.DetectorIdentifier.description.getter();
    v0[15] = sub_226F44310(v23, v24, &v60);
    sub_226F7ACD8();
    swift_bridgeObjectRelease();
    id v25 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v25(v20, v57);
    uint64_t v9 = log;
    _os_log_impl(&dword_226F20000, log, v10, "[%s]: Starting sound recogntion task for identifier: %s.", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v58, -1, -1);
    MEMORY[0x22A66FDC0](v16, -1, -1);
  }
  else
  {

    id v25 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v25(v12, v13);
  }

  v0[51] = v25;
  if (sub_226F7ABE8())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = (uint64_t (*)(void))v0[1];
    return v26();
  }
  else
  {
    v0[52] = v25;
    uint64_t v28 = v0[42];
    uint64_t v30 = v0[40];
    uint64_t v29 = v0[41];
    uint64_t v31 = v0[39];
    id v32 = (void *)v0[16];
    ((void (*)(void, void, void))v0[49])(v0[46], v0[17], v0[43]);
    sub_226F7A968();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v29, v28, v31);
    id v33 = v32;
    uint64_t v34 = sub_226F7AA48();
    os_log_type_t v35 = sub_226F7AC58();
    BOOL v36 = os_log_type_enabled(v34, v35);
    uint64_t v38 = v0[40];
    uint64_t v37 = v0[41];
    id v39 = v0[39];
    id v40 = (void *)v0[16];
    if (v36)
    {
      os_log_t loga = (os_log_t)v0[39];
      uint64_t v41 = swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      uint64_t v60 = v59;
      *(_DWORD *)uint64_t v41 = 136315394;
      os_log_type_t type = v35;
      id v42 = v40;
      uint64_t v53 = v37;
      id v43 = objc_msgSend(v42, sel_description);
      uint64_t v44 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v46 = v45;

      v0[12] = sub_226F44310(v44, v46, &v60);
      sub_226F7ACD8();
      swift_bridgeObjectRelease();

      *(_WORD *)(v41 + 12) = 2080;
      sub_226F6EB54(&qword_2681626C8, MEMORY[0x263F17960]);
      uint64_t v47 = sub_226F7AF08();
      v0[13] = sub_226F44310(v47, v48, &v60);
      sub_226F7ACD8();
      swift_bridgeObjectRelease();
      uint64_t v49 = *(void (**)(uint64_t, os_log_t))(v38 + 8);
      v49(v53, loga);
      _os_log_impl(&dword_226F20000, v34, type, "[%s]: running request %s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v59, -1, -1);
      MEMORY[0x22A66FDC0](v41, -1, -1);
    }
    else
    {

      uint64_t v49 = *(void (**)(uint64_t, os_log_t))(v38 + 8);
      v49(v37, v39);
    }

    v0[53] = v49;
    unint64_t v50 = (void *)swift_task_alloc();
    v0[54] = v50;
    *unint64_t v50 = v0;
    v50[1] = sub_226F64BCC;
    uint64_t v51 = v0[42];
    uint64_t v52 = v0[38];
    return MEMORY[0x270EFE168](v52, v51);
  }
}

uint64_t sub_226F64BCC()
{
  *(void *)(*(void *)v1 + 440) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_226F661A8;
  }
  else {
    uint64_t v2 = sub_226F64CE0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_226F64CE0()
{
  sub_226F7A988();
  sub_226F7AA18();
  unint64_t v1 = sub_226F6E894();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[56] = v2;
  void *v2 = v0;
  v2[1] = sub_226F64DB4;
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[30];
  return MEMORY[0x270FA1E80](v3, v4, v1);
}

uint64_t sub_226F64DB4()
{
  *(void *)(*(void *)v1 + 456) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_226F65458;
  }
  else {
    uint64_t v2 = sub_226F64EC8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_226F64EC8()
{
  uint64_t v51 = v0;
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 216);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    unint64_t v48 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    uint64_t v4 = *(void *)(v0 + 336);
    uint64_t v5 = *(void *)(v0 + 312);
    uint64_t v7 = *(void *)(v0 + 296);
    uint64_t v6 = *(void *)(v0 + 304);
    uint64_t v9 = *(void *)(v0 + 280);
    uint64_t v8 = *(void *)(v0 + 288);
    uint64_t v10 = *(void *)(v0 + 264);
    uint64_t v11 = *(void *)(v0 + 272);
    (*(void (**)(void, void))(*(void *)(v0 + 248) + 8))(*(void *)(v0 + 256), *(void *)(v0 + 240));
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    v48(v4, v5);
    uint64_t v12 = *(void **)(v0 + 128);
    (*(void (**)(void, void, void))(v0 + 392))(*(void *)(v0 + 360), *(void *)(v0 + 136), *(void *)(v0 + 344));
    id v13 = v12;
    uint64_t v14 = sub_226F7AA48();
    os_log_type_t v15 = sub_226F7AC58();
    BOOL v16 = os_log_type_enabled(v14, v15);
    uint64_t v17 = *(void *)(v0 + 360);
    uint64_t v18 = *(void *)(v0 + 344);
    uint64_t v19 = *(void **)(v0 + 128);
    if (v16)
    {
      uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
      uint64_t v20 = swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v50 = v47;
      *(_DWORD *)uint64_t v20 = 136315394;
      id v21 = v19;
      uint64_t v46 = v18;
      id v22 = objc_msgSend(v21, sel_description);
      uint64_t v23 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v25 = v24;

      *(void *)(v0 + 56) = sub_226F44310(v23, v25, &v50);
      sub_226F7ACD8();
      swift_bridgeObjectRelease();

      *(_WORD *)(v20 + 12) = 2080;
      uint64_t v26 = AccessibilitySoundRecognition.DetectorIdentifier.description.getter();
      *(void *)(v0 + 64) = sub_226F44310(v26, v27, &v50);
      sub_226F7ACD8();
      uint64_t v28 = (void *)(v0 + 408);
      swift_bridgeObjectRelease();
      v49(v17, v46);
      _os_log_impl(&dword_226F20000, v14, v15, "[%s]: Restarting sound recogntion task for identifier: %s.", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v47, -1, -1);
      MEMORY[0x22A66FDC0](v20, -1, -1);
    }
    else
    {
      uint64_t v28 = (void *)(v0 + 416);
      BOOL v36 = *(void (**)(uint64_t, uint64_t))(v0 + 416);

      v36(v17, v18);
    }

    *(void *)(v0 + 464) = *v28;
    uint64_t v38 = *(void *)(v0 + 160);
    uint64_t v37 = *(void *)(v0 + 168);
    uint64_t v39 = *(void *)(v0 + 152);
    sub_226F7AE58();
    *(_OWORD *)(v0 + 40) = xmmword_226F7E140;
    *(void *)(v0 + 24) = 0;
    *(void *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    uint64_t v40 = sub_226F6EB54(&qword_268162580, MEMORY[0x263F8F710]);
    sub_226F7AF48();
    sub_226F6EB54(&qword_268162588, MEMORY[0x263F8F6D8]);
    sub_226F7AE78();
    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    *(void *)(v0 + 472) = v41;
    *(void *)(v0 + 480) = (v38 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v41(v37, v39);
    id v42 = (void *)swift_task_alloc();
    *(void *)(v0 + 48_Block_object_dispose(&a9, 8) = v42;
    void *v42 = v0;
    v42[1] = sub_226F65B28;
    uint64_t v44 = *(void *)(v0 + 176);
    uint64_t v43 = *(void *)(v0 + 184);
    return MEMORY[0x270FA2380](v44, v0 + 16, v43, v40);
  }
  else
  {
    uint64_t v29 = *(void *)(v0 + 224);
    uint64_t v30 = *(void *)(v0 + 144);
    uint64_t v31 = *(void **)(v0 + 128);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v29, v1, v2);
    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v31) + 0x140))(v29, v30);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v29, v2);
    unint64_t v32 = sub_226F6E894();
    id v33 = (void *)swift_task_alloc();
    *(void *)(v0 + 44_Block_object_dispose(&a9, 8) = v33;
    void *v33 = v0;
    v33[1] = sub_226F64DB4;
    uint64_t v34 = *(void *)(v0 + 232);
    uint64_t v35 = *(void *)(v0 + 240);
    return MEMORY[0x270FA1E80](v34, v35, v32);
  }
}

uint64_t sub_226F65458()
{
  *(void *)(v0 + 8_Block_object_dispose(&a9, 8) = *(void *)(v0 + 456);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681620A0);
  swift_willThrowTypedImpl();
  return MEMORY[0x270FA2498](sub_226F654E4, 0, 0);
}

uint64_t sub_226F654E4()
{
  uint64_t v60 = v0;
  uint64_t v2 = *(void *)(v0 + 296);
  uint64_t v1 = *(void *)(v0 + 304);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v3 = *(void *)(v0 + 288);
  uint64_t v5 = *(void *)(v0 + 264);
  uint64_t v6 = *(void *)(v0 + 272);
  (*(void (**)(void, void))(*(void *)(v0 + 248) + 8))(*(void *)(v0 + 256), *(void *)(v0 + 240));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v7 = *(void **)(v0 + 456);
  uint64_t v8 = *(void **)(v0 + 128);
  (*(void (**)(void, void))(v0 + 424))(*(void *)(v0 + 336), *(void *)(v0 + 312));
  id v9 = v8;
  id v10 = v7;
  id v11 = v9;
  id v12 = v7;
  id v13 = sub_226F7AA48();
  os_log_type_t v14 = sub_226F7AC58();
  os_log_type_t v15 = &off_226F7D000;
  BOOL v16 = &off_2647F5000;
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v17 = *(void **)(v0 + 128);
    uint64_t v18 = swift_slowAlloc();
    id v56 = (void *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    uint64_t v59 = v57;
    *(_DWORD *)uint64_t v18 = 136315394;
    id v19 = v17;
    id v20 = objc_msgSend(v19, sel_description);
    uint64_t v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v23 = v22;

    *(void *)(v0 + 72) = sub_226F44310(v21, v23, &v59);
    sub_226F7ACD8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v18 + 12) = 2112;
    id v24 = v7;
    uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v25;
    BOOL v16 = &off_2647F5000;
    sub_226F7ACD8();
    void *v56 = v25;
    os_log_type_t v15 = &off_226F7D000;

    _os_log_impl(&dword_226F20000, v13, v14, "[%s]: session failed with %@", (uint8_t *)v18, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v56, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v57, -1, -1);
    MEMORY[0x22A66FDC0](v18, -1, -1);
  }
  else
  {
    uint64_t v26 = *(void **)(v0 + 128);
  }
  unint64_t v27 = *(void **)(v0 + 128);
  (*(void (**)(void, void, void))(v0 + 392))(*(void *)(v0 + 360), *(void *)(v0 + 136), *(void *)(v0 + 344));
  id v28 = v27;
  uint64_t v29 = sub_226F7AA48();
  os_log_type_t v30 = sub_226F7AC58();
  BOOL v31 = os_log_type_enabled(v29, v30);
  uint64_t v32 = *(void *)(v0 + 360);
  uint64_t v33 = *(void *)(v0 + 344);
  uint64_t v34 = *(void **)(v0 + 128);
  if (v31)
  {
    uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
    uint64_t v35 = swift_slowAlloc();
    uint64_t v55 = swift_slowAlloc();
    uint64_t v59 = v55;
    *(_DWORD *)uint64_t v35 = *((void *)v15 + 401);
    uint64_t v54 = v33;
    id v36 = v34;
    id v37 = [v36 (SEL)v16[260]];
    uint64_t v38 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v40 = v39;

    *(void *)(v0 + 56) = sub_226F44310(v38, v40, &v59);
    sub_226F7ACD8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v35 + 12) = 2080;
    uint64_t v41 = AccessibilitySoundRecognition.DetectorIdentifier.description.getter();
    *(void *)(v0 + 64) = sub_226F44310(v41, v42, &v59);
    sub_226F7ACD8();
    uint64_t v43 = (void *)(v0 + 408);
    swift_bridgeObjectRelease();
    v58(v32, v54);
    _os_log_impl(&dword_226F20000, v29, v30, "[%s]: Restarting sound recogntion task for identifier: %s.", (uint8_t *)v35, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v55, -1, -1);
    MEMORY[0x22A66FDC0](v35, -1, -1);
  }
  else
  {
    uint64_t v43 = (void *)(v0 + 416);
    uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v0 + 416);

    v44(v32, v33);
  }

  *(void *)(v0 + 464) = *v43;
  uint64_t v46 = *(void *)(v0 + 160);
  uint64_t v45 = *(void *)(v0 + 168);
  uint64_t v47 = *(void *)(v0 + 152);
  sub_226F7AE58();
  *(_OWORD *)(v0 + 40) = xmmword_226F7E140;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 32) = 1;
  uint64_t v48 = sub_226F6EB54(&qword_268162580, MEMORY[0x263F8F710]);
  sub_226F7AF48();
  sub_226F6EB54(&qword_268162588, MEMORY[0x263F8F6D8]);
  sub_226F7AE78();
  uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
  *(void *)(v0 + 472) = v49;
  *(void *)(v0 + 480) = (v46 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v49(v45, v47);
  uint64_t v50 = (void *)swift_task_alloc();
  *(void *)(v0 + 48_Block_object_dispose(&a9, 8) = v50;
  *uint64_t v50 = v0;
  v50[1] = sub_226F65B28;
  uint64_t v52 = *(void *)(v0 + 176);
  uint64_t v51 = *(void *)(v0 + 184);
  return MEMORY[0x270FA2380](v52, v0 + 16, v51, v48);
}

uint64_t sub_226F65B28()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 496) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 472))(*(void *)(v2 + 176), *(void *)(v2 + 152));
    uint64_t v3 = sub_226F6607C;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 192);
    uint64_t v4 = *(void *)(v2 + 200);
    uint64_t v6 = *(void *)(v2 + 184);
    (*(void (**)(void, void))(v2 + 472))(*(void *)(v2 + 176), *(void *)(v2 + 152));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_226F65C80;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_226F65C80()
{
  uint64_t v32 = v0;
  if (sub_226F7ABE8())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    *(void *)(v0 + 416) = *(void *)(v0 + 464);
    uint64_t v3 = *(void *)(v0 + 336);
    uint64_t v5 = *(void *)(v0 + 320);
    uint64_t v4 = *(void *)(v0 + 328);
    uint64_t v6 = *(void *)(v0 + 312);
    uint64_t v7 = *(void **)(v0 + 128);
    (*(void (**)(void, void, void))(v0 + 392))(*(void *)(v0 + 368), *(void *)(v0 + 136), *(void *)(v0 + 344));
    sub_226F7A968();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v3, v6);
    id v8 = v7;
    id v9 = sub_226F7AA48();
    os_log_type_t v10 = sub_226F7AC58();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v13 = *(void *)(v0 + 320);
    uint64_t v12 = *(void *)(v0 + 328);
    uint64_t v14 = *(void *)(v0 + 312);
    os_log_type_t v15 = *(void **)(v0 + 128);
    if (v11)
    {
      os_log_type_t type = v10;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v31 = v30;
      *(_DWORD *)uint64_t v16 = 136315394;
      id v17 = v15;
      id v18 = objc_msgSend(v17, sel_description);
      uint64_t v28 = v14;
      uint64_t v19 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v21 = v20;

      *(void *)(v0 + 96) = sub_226F44310(v19, v21, &v31);
      sub_226F7ACD8();
      swift_bridgeObjectRelease();

      *(_WORD *)(v16 + 12) = 2080;
      sub_226F6EB54(&qword_2681626C8, MEMORY[0x263F17960]);
      uint64_t v22 = sub_226F7AF08();
      *(void *)(v0 + 104) = sub_226F44310(v22, v23, &v31);
      sub_226F7ACD8();
      swift_bridgeObjectRelease();
      id v24 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
      v24(v12, v28);
      _os_log_impl(&dword_226F20000, v9, type, "[%s]: running request %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v30, -1, -1);
      MEMORY[0x22A66FDC0](v16, -1, -1);
    }
    else
    {

      id v24 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
      v24(v12, v14);
    }

    *(void *)(v0 + 424) = v24;
    uint64_t v25 = (void *)swift_task_alloc();
    *(void *)(v0 + 432) = v25;
    void *v25 = v0;
    v25[1] = sub_226F64BCC;
    uint64_t v26 = *(void *)(v0 + 336);
    uint64_t v27 = *(void *)(v0 + 304);
    return MEMORY[0x270EFE168](v27, v26);
  }
}

uint64_t sub_226F6607C()
{
  (*(void (**)(void, void))(v0[24] + 8))(v0[25], v0[23]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_226F661A8()
{
  uint64_t v54 = v0;
  uint64_t v1 = *(void **)(v0 + 440);
  uint64_t v2 = *(void **)(v0 + 128);
  (*(void (**)(void, void))(v0 + 424))(*(void *)(v0 + 336), *(void *)(v0 + 312));
  id v3 = v2;
  id v4 = v1;
  id v5 = v3;
  id v6 = v1;
  uint64_t v7 = sub_226F7AA48();
  os_log_type_t v8 = sub_226F7AC58();
  id v9 = &off_226F7D000;
  os_log_type_t v10 = &off_2647F5000;
  if (os_log_type_enabled(v7, v8))
  {
    BOOL v11 = *(void **)(v0 + 128);
    uint64_t v12 = swift_slowAlloc();
    uint64_t v50 = (void *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    uint64_t v53 = v51;
    *(_DWORD *)uint64_t v12 = 136315394;
    id v13 = v11;
    id v14 = objc_msgSend(v13, sel_description);
    uint64_t v15 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v17 = v16;

    *(void *)(v0 + 72) = sub_226F44310(v15, v17, &v53);
    sub_226F7ACD8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 12) = 2112;
    id v18 = v1;
    uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 80) = v19;
    os_log_type_t v10 = &off_2647F5000;
    sub_226F7ACD8();
    *uint64_t v50 = v19;
    id v9 = &off_226F7D000;

    _os_log_impl(&dword_226F20000, v7, v8, "[%s]: session failed with %@", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v50, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v51, -1, -1);
    MEMORY[0x22A66FDC0](v12, -1, -1);
  }
  else
  {
    unint64_t v20 = *(void **)(v0 + 128);
  }
  unint64_t v21 = *(void **)(v0 + 128);
  (*(void (**)(void, void, void))(v0 + 392))(*(void *)(v0 + 360), *(void *)(v0 + 136), *(void *)(v0 + 344));
  id v22 = v21;
  unint64_t v23 = sub_226F7AA48();
  os_log_type_t v24 = sub_226F7AC58();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v26 = *(void *)(v0 + 360);
  uint64_t v27 = *(void *)(v0 + 344);
  uint64_t v28 = *(void **)(v0 + 128);
  if (v25)
  {
    uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v0 + 408);
    uint64_t v29 = swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    uint64_t v53 = v49;
    *(_DWORD *)uint64_t v29 = *((void *)v9 + 401);
    uint64_t v48 = v27;
    id v30 = v28;
    id v31 = [v30 (SEL)v10[260]];
    uint64_t v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v34 = v33;

    *(void *)(v0 + 56) = sub_226F44310(v32, v34, &v53);
    sub_226F7ACD8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v29 + 12) = 2080;
    uint64_t v35 = AccessibilitySoundRecognition.DetectorIdentifier.description.getter();
    *(void *)(v0 + 64) = sub_226F44310(v35, v36, &v53);
    sub_226F7ACD8();
    id v37 = (void *)(v0 + 408);
    swift_bridgeObjectRelease();
    v52(v26, v48);
    _os_log_impl(&dword_226F20000, v23, v24, "[%s]: Restarting sound recogntion task for identifier: %s.", (uint8_t *)v29, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v49, -1, -1);
    MEMORY[0x22A66FDC0](v29, -1, -1);
  }
  else
  {
    id v37 = (void *)(v0 + 416);
    uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v0 + 416);

    v38(v26, v27);
  }

  *(void *)(v0 + 464) = *v37;
  uint64_t v40 = *(void *)(v0 + 160);
  uint64_t v39 = *(void *)(v0 + 168);
  uint64_t v41 = *(void *)(v0 + 152);
  sub_226F7AE58();
  *(_OWORD *)(v0 + 40) = xmmword_226F7E140;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 32) = 1;
  uint64_t v42 = sub_226F6EB54(&qword_268162580, MEMORY[0x263F8F710]);
  sub_226F7AF48();
  sub_226F6EB54(&qword_268162588, MEMORY[0x263F8F6D8]);
  sub_226F7AE78();
  uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  *(void *)(v0 + 472) = v43;
  *(void *)(v0 + 480) = (v40 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v43(v39, v41);
  uint64_t v44 = (void *)swift_task_alloc();
  *(void *)(v0 + 48_Block_object_dispose(&a9, 8) = v44;
  *uint64_t v44 = v0;
  v44[1] = sub_226F65B28;
  uint64_t v46 = *(void *)(v0 + 176);
  uint64_t v45 = *(void *)(v0 + 184);
  return MEMORY[0x270FA2380](v46, v0 + 16, v45, v42);
}

uint64_t sub_226F66798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[14] = a6;
  v7[15] = a7;
  v7[12] = a4;
  v7[13] = a5;
  uint64_t v8 = sub_226F7AE48();
  v7[16] = v8;
  v7[17] = *(void *)(v8 - 8);
  v7[18] = swift_task_alloc();
  v7[19] = swift_task_alloc();
  uint64_t v9 = sub_226F7AE68();
  v7[20] = v9;
  v7[21] = *(void *)(v9 - 8);
  v7[22] = swift_task_alloc();
  uint64_t v10 = sub_226F7A9A8();
  v7[23] = v10;
  v7[24] = *(void *)(v10 - 8);
  v7[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681626A8);
  v7[26] = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626B0);
  v7[27] = v11;
  v7[28] = *(void *)(v11 - 8);
  v7[29] = swift_task_alloc();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626B8);
  v7[30] = v12;
  v7[31] = *(void *)(v12 - 8);
  v7[32] = swift_task_alloc();
  uint64_t v13 = sub_226F7A998();
  v7[33] = v13;
  v7[34] = *(void *)(v13 - 8);
  v7[35] = swift_task_alloc();
  uint64_t v14 = sub_226F7A898();
  v7[36] = v14;
  v7[37] = *(void *)(v14 - 8);
  v7[38] = swift_task_alloc();
  uint64_t v15 = sub_226F7A978();
  v7[39] = v15;
  v7[40] = *(void *)(v15 - 8);
  v7[41] = swift_task_alloc();
  v7[42] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_226F66B38, 0, 0);
}

uint64_t sub_226F66B38()
{
  uint64_t v54 = v0;
  if (qword_268162058 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = (void *)v0[13];
  uint64_t v3 = sub_226F7AA58();
  v0[43] = __swift_project_value_buffer(v3, (uint64_t)qword_268162650);
  id v4 = v1;
  id v5 = v2;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = sub_226F7AA48();
  os_log_type_t v9 = sub_226F7AC58();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v12 = (void *)v0[12];
  uint64_t v11 = (void *)v0[13];
  if (v10)
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    v53[0] = v51;
    *(_DWORD *)uint64_t v13 = 136315394;
    id v14 = v12;
    id v15 = objc_msgSend(v14, sel_description);
    uint64_t v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v18 = v17;

    v0[10] = sub_226F44310(v16, v18, v53);
    sub_226F7ACD8();
    swift_bridgeObjectRelease();

    *(_WORD *)(v13 + 12) = 2080;
    id v19 = objc_msgSend(v11, sel_identifier);
    uint64_t v20 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v22 = v21;

    v0[11] = sub_226F44310(v20, v22, v53);
    sub_226F7ACD8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_226F20000, v8, v9, "[%s]: Starting custom sound recogntion task for identifier: %s.", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v51, -1, -1);
    MEMORY[0x22A66FDC0](v13, -1, -1);
  }
  else
  {
  }
  if (sub_226F7ABE8())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
  else
  {
    uint64_t v25 = v0[36];
    uint64_t v26 = *(void (**)(void, void, uint64_t))(v0[37] + 16);
    v0[44] = v26;
    v26(v0[38], v0[14], v25);
    sub_226F7A958();
    uint64_t v27 = (void *)v0[12];
    (*(void (**)(void, void, void))(v0[40] + 16))(v0[41], v0[42], v0[39]);
    id v28 = v27;
    uint64_t v29 = sub_226F7AA48();
    os_log_type_t v30 = sub_226F7AC58();
    BOOL v31 = os_log_type_enabled(v29, v30);
    uint64_t v33 = v0[40];
    uint64_t v32 = v0[41];
    unint64_t v34 = v0[39];
    uint64_t v35 = (void *)v0[12];
    if (v31)
    {
      os_log_t log = (os_log_t)v0[39];
      uint64_t v36 = swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      v53[0] = v52;
      *(_DWORD *)uint64_t v36 = 136315394;
      id v37 = v35;
      uint64_t v48 = v32;
      id v38 = objc_msgSend(v37, sel_description);
      uint64_t v39 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      os_log_type_t type = v30;
      unint64_t v41 = v40;

      v0[8] = sub_226F44310(v39, v41, v53);
      sub_226F7ACD8();
      swift_bridgeObjectRelease();

      *(_WORD *)(v36 + 12) = 2080;
      sub_226F6EB54(&qword_2681626C8, MEMORY[0x263F17960]);
      uint64_t v42 = sub_226F7AF08();
      v0[9] = sub_226F44310(v42, v43, v53);
      sub_226F7ACD8();
      swift_bridgeObjectRelease();
      uint64_t v44 = *(void (**)(uint64_t, os_log_t))(v33 + 8);
      v44(v48, log);
      _os_log_impl(&dword_226F20000, v29, type, "[%s]: running request %s", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v52, -1, -1);
      MEMORY[0x22A66FDC0](v36, -1, -1);
    }
    else
    {

      uint64_t v44 = *(void (**)(uint64_t, os_log_t))(v33 + 8);
      v44(v32, v34);
    }

    v0[45] = v44;
    uint64_t v45 = (void *)swift_task_alloc();
    v0[46] = v45;
    *uint64_t v45 = v0;
    v45[1] = sub_226F67640;
    uint64_t v46 = v0[42];
    uint64_t v47 = v0[35];
    return MEMORY[0x270EFE168](v47, v46);
  }
}

uint64_t sub_226F67640()
{
  *(void *)(*(void *)v1 + 376) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_226F68FBC;
  }
  else {
    uint64_t v2 = sub_226F67754;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_226F67754()
{
  sub_226F7A988();
  sub_226F7AA18();
  unint64_t v1 = sub_226F6E894();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[48] = v2;
  void *v2 = v0;
  v2[1] = sub_226F67828;
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[27];
  return MEMORY[0x270FA1E80](v3, v4, v1);
}

uint64_t sub_226F67828()
{
  *(void *)(*(void *)v1 + 392) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_226F67E60;
  }
  else {
    uint64_t v2 = sub_226F6793C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_226F6793C()
{
  uint64_t v51 = v0;
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
    uint64_t v4 = *(void *)(v0 + 336);
    uint64_t v5 = *(void *)(v0 + 312);
    uint64_t v7 = *(void *)(v0 + 272);
    uint64_t v6 = *(void *)(v0 + 280);
    uint64_t v9 = *(void *)(v0 + 256);
    uint64_t v8 = *(void *)(v0 + 264);
    uint64_t v10 = *(void *)(v0 + 240);
    uint64_t v11 = *(void *)(v0 + 248);
    (*(void (**)(void, void))(*(void *)(v0 + 224) + 8))(*(void *)(v0 + 232), *(void *)(v0 + 216));
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    v49(v4, v5);
    uint64_t v12 = *(void **)(v0 + 104);
    id v13 = *(id *)(v0 + 96);
    id v14 = v12;
    id v15 = v13;
    id v16 = v14;
    unint64_t v17 = sub_226F7AA48();
    os_log_type_t v18 = sub_226F7AC58();
    BOOL v19 = os_log_type_enabled(v17, v18);
    unint64_t v21 = *(void **)(v0 + 96);
    uint64_t v20 = *(void **)(v0 + 104);
    if (v19)
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v50 = v23;
      *(_DWORD *)uint64_t v22 = 136315394;
      id v24 = v21;
      id v25 = objc_msgSend(v24, sel_description);
      uint64_t v26 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v28 = v27;

      *(void *)(v22 + 4) = sub_226F44310(v26, v28, &v50);
      swift_bridgeObjectRelease();

      *(_WORD *)(v22 + 12) = 2080;
      id v29 = objc_msgSend(v20, sel_identifier);
      uint64_t v30 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v32 = v31;

      *(void *)(v22 + 14) = sub_226F44310(v30, v32, &v50);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_226F20000, v17, v18, "[%s]: Restarting custom sound recogntion task for identifier: %s.", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v23, -1, -1);
      MEMORY[0x22A66FDC0](v22, -1, -1);
    }
    else
    {
    }
    uint64_t v41 = *(void *)(v0 + 136);
    uint64_t v40 = *(void *)(v0 + 144);
    uint64_t v42 = *(void *)(v0 + 128);
    sub_226F7AE58();
    *(_OWORD *)(v0 + 40) = xmmword_226F7E140;
    *(void *)(v0 + 24) = 0;
    *(void *)(v0 + 16) = 0;
    *(unsigned char *)(v0 + 32) = 1;
    uint64_t v43 = sub_226F6EB54(&qword_268162580, MEMORY[0x263F8F710]);
    sub_226F7AF48();
    sub_226F6EB54(&qword_268162588, MEMORY[0x263F8F6D8]);
    sub_226F7AE78();
    uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
    *(void *)(v0 + 400) = v44;
    *(void *)(v0 + 40_Block_object_dispose(&a9, 8) = (v41 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v44(v40, v42);
    uint64_t v45 = (void *)swift_task_alloc();
    *(void *)(v0 + 416) = v45;
    *uint64_t v45 = v0;
    v45[1] = sub_226F6848C;
    uint64_t v47 = *(void *)(v0 + 152);
    uint64_t v46 = *(void *)(v0 + 160);
    return MEMORY[0x270FA2380](v47, v0 + 16, v46, v43);
  }
  else
  {
    uint64_t v33 = *(void *)(v0 + 200);
    uint64_t v34 = *(void *)(v0 + 120);
    uint64_t v35 = *(void **)(v0 + 96);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v33, v1, v2);
    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v35) + 0x140))(v33, v34);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v33, v2);
    unint64_t v36 = sub_226F6E894();
    id v37 = (void *)swift_task_alloc();
    *(void *)(v0 + 384) = v37;
    void *v37 = v0;
    v37[1] = sub_226F67828;
    uint64_t v38 = *(void *)(v0 + 208);
    uint64_t v39 = *(void *)(v0 + 216);
    return MEMORY[0x270FA1E80](v38, v39, v36);
  }
}

uint64_t sub_226F67E60()
{
  *(void *)(v0 + 56) = *(void *)(v0 + 392);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681620A0);
  swift_willThrowTypedImpl();
  return MEMORY[0x270FA2498](sub_226F67EEC, 0, 0);
}

uint64_t sub_226F67EEC()
{
  uint64_t v62 = v0;
  uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 312);
  uint64_t v4 = *(void *)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 280);
  uint64_t v6 = *(void *)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 264);
  uint64_t v7 = *(void *)(v0 + 240);
  uint64_t v8 = *(void *)(v0 + 248);
  (*(void (**)(void, void))(*(void *)(v0 + 224) + 8))(*(void *)(v0 + 232), *(void *)(v0 + 216));
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v59(v1, v2);
  uint64_t v9 = *(void **)(v0 + 392);
  id v10 = *(id *)(v0 + 96);
  id v11 = v9;
  id v12 = v10;
  id v13 = v9;
  id v14 = sub_226F7AA48();
  os_log_type_t v15 = sub_226F7AC58();
  BOOL v16 = os_log_type_enabled(v14, v15);
  unint64_t v17 = *(void **)(v0 + 96);
  os_log_type_t v18 = &off_226F7D000;
  BOOL v19 = &off_2647F5000;
  if (v16)
  {
    uint64_t v20 = swift_slowAlloc();
    unint64_t v21 = (void *)swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    uint64_t v61 = v60;
    *(_DWORD *)uint64_t v20 = 136315394;
    id v22 = v17;
    id v23 = objc_msgSend(v22, sel_description);
    uint64_t v24 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v26 = v25;

    BOOL v19 = &off_2647F5000;
    *(void *)(v20 + 4) = sub_226F44310(v24, v26, &v61);
    swift_bridgeObjectRelease();

    os_log_type_t v18 = &off_226F7D000;
    *(_WORD *)(v20 + 12) = 2112;
    id v27 = v9;
    uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v20 + 14) = v28;
    void *v21 = v28;

    _os_log_impl(&dword_226F20000, v14, v15, "[%s]: session failed with %@", (uint8_t *)v20, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v21, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v60, -1, -1);
    MEMORY[0x22A66FDC0](v20, -1, -1);
  }
  else
  {
  }
  id v29 = *(void **)(v0 + 104);
  id v30 = *(id *)(v0 + 96);
  id v31 = v29;
  id v32 = v30;
  id v33 = v31;
  uint64_t v34 = sub_226F7AA48();
  os_log_type_t v35 = sub_226F7AC58();
  BOOL v36 = os_log_type_enabled(v34, v35);
  uint64_t v38 = *(void **)(v0 + 96);
  id v37 = *(void **)(v0 + 104);
  if (v36)
  {
    uint64_t v39 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    uint64_t v61 = v40;
    *(_DWORD *)uint64_t v39 = *((void *)v18 + 401);
    id v41 = v38;
    id v42 = [v41 (SEL)v19[260]];
    uint64_t v43 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v45 = v44;

    *(void *)(v39 + 4) = sub_226F44310(v43, v45, &v61);
    swift_bridgeObjectRelease();

    *(_WORD *)(v39 + 12) = 2080;
    id v46 = objc_msgSend(v37, sel_identifier);
    uint64_t v47 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v49 = v48;

    *(void *)(v39 + 14) = sub_226F44310(v47, v49, &v61);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_226F20000, v34, v35, "[%s]: Restarting custom sound recogntion task for identifier: %s.", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v40, -1, -1);
    MEMORY[0x22A66FDC0](v39, -1, -1);
  }
  else
  {
  }
  uint64_t v51 = *(void *)(v0 + 136);
  uint64_t v50 = *(void *)(v0 + 144);
  uint64_t v52 = *(void *)(v0 + 128);
  sub_226F7AE58();
  *(_OWORD *)(v0 + 40) = xmmword_226F7E140;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 32) = 1;
  uint64_t v53 = sub_226F6EB54(&qword_268162580, MEMORY[0x263F8F710]);
  sub_226F7AF48();
  sub_226F6EB54(&qword_268162588, MEMORY[0x263F8F6D8]);
  sub_226F7AE78();
  uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
  *(void *)(v0 + 400) = v54;
  *(void *)(v0 + 40_Block_object_dispose(&a9, 8) = (v51 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v54(v50, v52);
  uint64_t v55 = (void *)swift_task_alloc();
  *(void *)(v0 + 416) = v55;
  *uint64_t v55 = v0;
  v55[1] = sub_226F6848C;
  uint64_t v57 = *(void *)(v0 + 152);
  uint64_t v56 = *(void *)(v0 + 160);
  return MEMORY[0x270FA2380](v57, v0 + 16, v56, v53);
}

uint64_t sub_226F6848C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 424) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 400))(*(void *)(v2 + 152), *(void *)(v2 + 128));
    uint64_t v3 = sub_226F68EAC;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 168);
    uint64_t v4 = *(void *)(v2 + 176);
    uint64_t v6 = *(void *)(v2 + 160);
    (*(void (**)(void, void))(v2 + 400))(*(void *)(v2 + 152), *(void *)(v2 + 128));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v3 = sub_226F685E4;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_226F685E4()
{
  uint64_t v78 = v0;
  if (sub_226F7ABE8())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    uint64_t v3 = *(void **)(v0 + 424);
    (*(void (**)(void, void, void))(v0 + 352))(*(void *)(v0 + 304), *(void *)(v0 + 112), *(void *)(v0 + 288));
    sub_226F7A958();
    if (v3)
    {
      id v4 = *(id *)(v0 + 96);
      id v5 = v3;
      id v6 = v4;
      id v7 = v3;
      uint64_t v8 = sub_226F7AA48();
      os_log_type_t v9 = sub_226F7AC58();
      BOOL v10 = os_log_type_enabled(v8, v9);
      id v11 = *(void **)(v0 + 96);
      id v12 = &off_226F7D000;
      id v13 = &off_2647F5000;
      if (v10)
      {
        uint64_t v14 = swift_slowAlloc();
        os_log_type_t v15 = (void *)swift_slowAlloc();
        uint64_t v75 = swift_slowAlloc();
        v77[0] = v75;
        *(_DWORD *)uint64_t v14 = 136315394;
        id v16 = v11;
        id v17 = objc_msgSend(v16, sel_description);
        uint64_t v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v20 = v19;

        id v13 = &off_2647F5000;
        *(void *)(v14 + 4) = sub_226F44310(v18, v20, v77);
        swift_bridgeObjectRelease();

        id v12 = &off_226F7D000;
        *(_WORD *)(v14 + 12) = 2112;
        id v21 = v3;
        uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v14 + 14) = v22;
        *os_log_type_t v15 = v22;

        _os_log_impl(&dword_226F20000, v8, v9, "[%s]: session failed with %@", (uint8_t *)v14, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v15, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v75, -1, -1);
        MEMORY[0x22A66FDC0](v14, -1, -1);
      }
      else
      {
      }
      id v41 = *(void **)(v0 + 104);
      id v42 = *(id *)(v0 + 96);
      id v43 = v41;
      id v44 = v42;
      id v45 = v43;
      id v46 = sub_226F7AA48();
      os_log_type_t v47 = sub_226F7AC58();
      BOOL v48 = os_log_type_enabled(v46, v47);
      uint64_t v50 = *(void **)(v0 + 96);
      unint64_t v49 = *(void **)(v0 + 104);
      if (v48)
      {
        uint64_t v51 = swift_slowAlloc();
        uint64_t v52 = swift_slowAlloc();
        v77[0] = v52;
        *(_DWORD *)uint64_t v51 = *((void *)v12 + 401);
        id v53 = v50;
        id v54 = [v53 (SEL)v13[260]];
        uint64_t v55 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v57 = v56;

        *(void *)(v51 + 4) = sub_226F44310(v55, v57, v77);
        swift_bridgeObjectRelease();

        *(_WORD *)(v51 + 12) = 2080;
        id v58 = objc_msgSend(v49, sel_identifier);
        uint64_t v59 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v61 = v60;

        *(void *)(v51 + 14) = sub_226F44310(v59, v61, v77);
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_226F20000, v46, v47, "[%s]: Restarting custom sound recogntion task for identifier: %s.", (uint8_t *)v51, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v52, -1, -1);
        MEMORY[0x22A66FDC0](v51, -1, -1);
      }
      else
      {
      }
      uint64_t v63 = *(void *)(v0 + 136);
      uint64_t v62 = *(void *)(v0 + 144);
      uint64_t v64 = *(void *)(v0 + 128);
      sub_226F7AE58();
      *(_OWORD *)(v0 + 40) = xmmword_226F7E140;
      *(void *)(v0 + 24) = 0;
      *(void *)(v0 + 16) = 0;
      *(unsigned char *)(v0 + 32) = 1;
      uint64_t v65 = sub_226F6EB54(&qword_268162580, MEMORY[0x263F8F710]);
      sub_226F7AF48();
      sub_226F6EB54(&qword_268162588, MEMORY[0x263F8F6D8]);
      sub_226F7AE78();
      id v66 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
      *(void *)(v0 + 400) = v66;
      *(void *)(v0 + 40_Block_object_dispose(&a9, 8) = (v63 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v66(v62, v64);
      id v67 = (void *)swift_task_alloc();
      *(void *)(v0 + 416) = v67;
      *id v67 = v0;
      v67[1] = sub_226F6848C;
      uint64_t v69 = *(void *)(v0 + 152);
      uint64_t v68 = *(void *)(v0 + 160);
      return MEMORY[0x270FA2380](v69, v0 + 16, v68, v65);
    }
    else
    {
      id v23 = *(void **)(v0 + 96);
      (*(void (**)(void, void, void))(*(void *)(v0 + 320) + 16))(*(void *)(v0 + 328), *(void *)(v0 + 336), *(void *)(v0 + 312));
      id v24 = v23;
      unint64_t v25 = sub_226F7AA48();
      os_log_type_t v26 = sub_226F7AC58();
      BOOL v27 = os_log_type_enabled(v25, v26);
      uint64_t v29 = *(void *)(v0 + 320);
      uint64_t v28 = *(void *)(v0 + 328);
      uint64_t v30 = *(void *)(v0 + 312);
      id v31 = *(void **)(v0 + 96);
      if (v27)
      {
        os_log_type_t type = v26;
        uint64_t v32 = swift_slowAlloc();
        uint64_t v76 = swift_slowAlloc();
        v77[0] = v76;
        *(_DWORD *)uint64_t v32 = 136315394;
        id v33 = v31;
        id v34 = objc_msgSend(v33, sel_description);
        uint64_t v73 = v30;
        uint64_t v35 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        unint64_t v37 = v36;

        *(void *)(v0 + 64) = sub_226F44310(v35, v37, v77);
        sub_226F7ACD8();
        swift_bridgeObjectRelease();

        *(_WORD *)(v32 + 12) = 2080;
        sub_226F6EB54(&qword_2681626C8, MEMORY[0x263F17960]);
        uint64_t v38 = sub_226F7AF08();
        *(void *)(v0 + 72) = sub_226F44310(v38, v39, v77);
        sub_226F7ACD8();
        swift_bridgeObjectRelease();
        uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
        v40(v28, v73);
        _os_log_impl(&dword_226F20000, v25, type, "[%s]: running request %s", (uint8_t *)v32, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22A66FDC0](v76, -1, -1);
        MEMORY[0x22A66FDC0](v32, -1, -1);
      }
      else
      {

        uint64_t v40 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
        v40(v28, v30);
      }

      *(void *)(v0 + 360) = v40;
      unint64_t v70 = (void *)swift_task_alloc();
      *(void *)(v0 + 36_Block_object_dispose(&a9, 8) = v70;
      *unint64_t v70 = v0;
      v70[1] = sub_226F67640;
      uint64_t v71 = *(void *)(v0 + 336);
      uint64_t v72 = *(void *)(v0 + 280);
      return MEMORY[0x270EFE168](v72, v71);
    }
  }
}

uint64_t sub_226F68EAC()
{
  (*(void (**)(void, void))(v0[21] + 8))(v0[22], v0[20]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_226F68FBC()
{
  uint64_t v53 = v0;
  (*(void (**)(void, void))(v0 + 360))(*(void *)(v0 + 336), *(void *)(v0 + 312));
  uint64_t v1 = *(void **)(v0 + 376);
  id v2 = *(id *)(v0 + 96);
  id v3 = v1;
  id v4 = v2;
  id v5 = v1;
  id v6 = sub_226F7AA48();
  os_log_type_t v7 = sub_226F7AC58();
  BOOL v8 = os_log_type_enabled(v6, v7);
  os_log_type_t v9 = *(void **)(v0 + 96);
  BOOL v10 = &off_226F7D000;
  id v11 = &off_2647F5000;
  if (v8)
  {
    uint64_t v12 = swift_slowAlloc();
    id v13 = (void *)swift_slowAlloc();
    uint64_t v51 = swift_slowAlloc();
    uint64_t v52 = v51;
    *(_DWORD *)uint64_t v12 = 136315394;
    id v14 = v9;
    id v15 = objc_msgSend(v14, sel_description);
    uint64_t v16 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v18 = v17;

    id v11 = &off_2647F5000;
    *(void *)(v12 + 4) = sub_226F44310(v16, v18, &v52);
    swift_bridgeObjectRelease();

    BOOL v10 = &off_226F7D000;
    *(_WORD *)(v12 + 12) = 2112;
    id v19 = v1;
    uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v12 + 14) = v20;
    *id v13 = v20;

    _os_log_impl(&dword_226F20000, v6, v7, "[%s]: session failed with %@", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v13, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v51, -1, -1);
    MEMORY[0x22A66FDC0](v12, -1, -1);
  }
  else
  {
  }
  id v21 = *(void **)(v0 + 104);
  id v22 = *(id *)(v0 + 96);
  id v23 = v21;
  id v24 = v22;
  id v25 = v23;
  os_log_type_t v26 = sub_226F7AA48();
  os_log_type_t v27 = sub_226F7AC58();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v30 = *(void **)(v0 + 96);
  uint64_t v29 = *(void **)(v0 + 104);
  if (v28)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v52 = v32;
    *(_DWORD *)uint64_t v31 = *((void *)v10 + 401);
    id v33 = v30;
    id v34 = [v33 (SEL)v11[260]];
    uint64_t v35 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v37 = v36;

    *(void *)(v31 + 4) = sub_226F44310(v35, v37, &v52);
    swift_bridgeObjectRelease();

    *(_WORD *)(v31 + 12) = 2080;
    id v38 = objc_msgSend(v29, sel_identifier);
    uint64_t v39 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v41 = v40;

    *(void *)(v31 + 14) = sub_226F44310(v39, v41, &v52);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_226F20000, v26, v27, "[%s]: Restarting custom sound recogntion task for identifier: %s.", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v32, -1, -1);
    MEMORY[0x22A66FDC0](v31, -1, -1);
  }
  else
  {
  }
  uint64_t v43 = *(void *)(v0 + 136);
  uint64_t v42 = *(void *)(v0 + 144);
  uint64_t v44 = *(void *)(v0 + 128);
  sub_226F7AE58();
  *(_OWORD *)(v0 + 40) = xmmword_226F7E140;
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 32) = 1;
  uint64_t v45 = sub_226F6EB54(&qword_268162580, MEMORY[0x263F8F710]);
  sub_226F7AF48();
  sub_226F6EB54(&qword_268162588, MEMORY[0x263F8F6D8]);
  sub_226F7AE78();
  id v46 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
  *(void *)(v0 + 400) = v46;
  *(void *)(v0 + 40_Block_object_dispose(&a9, 8) = (v43 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v46(v42, v44);
  os_log_type_t v47 = (void *)swift_task_alloc();
  *(void *)(v0 + 416) = v47;
  void *v47 = v0;
  v47[1] = sub_226F6848C;
  uint64_t v49 = *(void *)(v0 + 152);
  uint64_t v48 = *(void *)(v0 + 160);
  return MEMORY[0x270FA2380](v49, v0 + 16, v48, v45);
}

void sub_226F694F8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0) {
      uint64_t v5 = a1;
    }
    else {
      uint64_t v5 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    if (v4)
    {
      if (a2 < 0) {
        unint64_t v6 = a2;
      }
      else {
        unint64_t v6 = a2 & 0xFFFFFFFFFFFFFF8;
      }
      goto LABEL_57;
    }
    uint64_t v7 = v5;
    uint64_t v8 = a2;
    goto LABEL_18;
  }
  if (v4)
  {
    if (a2 < 0) {
      uint64_t v7 = a2;
    }
    else {
      uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t v8 = a1;
LABEL_18:
    sub_226F6CE74(v7, v8);
    return;
  }
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  uint64_t v28 = a1 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(a1 + 56);
  unint64_t v6 = sub_226F6EB14();
  int64_t v12 = 0;
  int64_t v29 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = a2 + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_46;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_56;
    }
    if (v16 >= v29) {
      return;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v29) {
        return;
      }
      unint64_t v17 = *(void *)(v28 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v29) {
          return;
        }
        unint64_t v17 = *(void *)(v28 + 8 * v12);
        if (!v17)
        {
          int64_t v12 = v16 + 3;
          if (v16 + 3 >= v29) {
            return;
          }
          unint64_t v17 = *(void *)(v28 + 8 * v12);
          if (!v17) {
            break;
          }
        }
      }
    }
LABEL_45:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_46:
    id v19 = *(id *)(*(void *)(a1 + 48) + 8 * v15);
    uint64_t v20 = sub_226F7ACB8();
    uint64_t v21 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v22 = v20 & ~v21;
    if (((*(void *)(v13 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
      goto LABEL_53;
    }
    int64_t v30 = v12;
    id v23 = *(id *)(*(void *)(a2 + 48) + 8 * v22);
    char v24 = sub_226F7ACC8();

    if ((v24 & 1) == 0)
    {
      uint64_t v25 = ~v21;
      while (1)
      {
        unint64_t v22 = (v22 + 1) & v25;
        if (((*(void *)(v13 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
          break;
        }
        id v26 = *(id *)(*(void *)(a2 + 48) + 8 * v22);
        char v27 = sub_226F7ACC8();

        if (v27) {
          goto LABEL_27;
        }
      }
LABEL_53:

      return;
    }
LABEL_27:

    int64_t v12 = v30;
  }
  int64_t v18 = v16 + 4;
  if (v18 >= v29) {
    return;
  }
  unint64_t v17 = *(void *)(v28 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_45;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v29) {
      return;
    }
    unint64_t v17 = *(void *)(v28 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_45;
    }
  }
LABEL_56:
  __break(1u);
LABEL_57:
  MEMORY[0x270F9E868](v6, v5);
}

uint64_t AccessibilitySoundRecognition.DetectorIdentifier.identifier.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_226F7A928();
  os_log_t v54 = *(os_log_t *)(v2 - 8);
  uint64_t v55 = v2;
  MEMORY[0x270FA5388](v2);
  unint64_t v4 = (char *)v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226F7A948();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)v52 - v10;
  uint64_t v12 = sub_226F7A938();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v53 = (char *)v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  id v58 = (char *)v52 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v57 = (char *)v52 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v52 - v20;
  unint64_t v22 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v56 = v1;
  uint64_t v23 = v1;
  char v24 = v22;
  v22((char *)v52 - v20, (char *)v23, v12);
  int v25 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v21, v12);
  if (v25 == *MEMORY[0x263F178D0])
  {
    (*(void (**)(char *, uint64_t))(v13 + 96))(v21, v12);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v21, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    id v26 = AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter();
    if (v26)
    {
      char v27 = v26;
      uint64_t v28 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    }
    else
    {
      uint64_t v28 = 0x6E776F6E6B6E55;
    }
    uint64_t v50 = *(void (**)(char *, uint64_t))(v6 + 8);
    v50(v9, v5);
    v50(v11, v5);
  }
  else if (v25 == *MEMORY[0x263F178C8])
  {
    (*(void (**)(char *, uint64_t))(v13 + 96))(v21, v12);
    os_log_t v30 = v54;
    uint64_t v29 = v55;
    ((void (*)(char *, char *, uint64_t))v54[4].isa)(v4, v21, v55);
    uint64_t v28 = sub_226F7A908();
    ((void (*)(char *, uint64_t))v30[1].isa)(v4, v29);
  }
  else
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_226F7AA58();
    __swift_project_value_buffer(v31, (uint64_t)qword_268162638);
    uint64_t v32 = v56;
    id v33 = v57;
    id v34 = v24;
    v24(v57, (char *)v56, v12);
    uint64_t v35 = v58;
    v24(v58, (char *)v32, v12);
    unint64_t v36 = sub_226F7AA48();
    os_log_type_t v37 = sub_226F7AC48();
    int v38 = v37;
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v39 = swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      uint64_t v60 = v56;
      *(_DWORD *)uint64_t v39 = 136315394;
      LODWORD(v55) = v38;
      uint64_t v40 = (uint64_t)v53;
      v34(v53, v33, v12);
      uint64_t v41 = sub_226F60A84(v40);
      uint64_t v59 = sub_226F44310(v41, v42, &v60);
      os_log_t v54 = v36;
      v52[1] = &v60;
      sub_226F7ACD8();
      swift_bridgeObjectRelease();
      uint64_t v43 = (void (*)(uint64_t, char *, uint64_t))v34;
      uint64_t v44 = *(void (**)(char *, uint64_t))(v13 + 8);
      v44(v57, v12);
      *(_WORD *)(v39 + 12) = 2080;
      unint64_t v57 = (char *)(v39 + 14);
      uint64_t v45 = v58;
      v43(v40, v58, v12);
      uint64_t v46 = sub_226F60A84(v40);
      uint64_t v59 = sub_226F44310(v46, v47, &v60);
      sub_226F7ACD8();
      swift_bridgeObjectRelease();
      v44(v45, v12);
      os_log_t v48 = v54;
      _os_log_impl(&dword_226F20000, v54, (os_log_type_t)v55, "[%s]: FATAL ERROR - DetectorIdentifier: %s, is unknown and not handled.", (uint8_t *)v39, 0x16u);
      uint64_t v49 = v56;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v49, -1, -1);
      MEMORY[0x22A66FDC0](v39, -1, -1);
    }
    else
    {
      uint64_t v44 = *(void (**)(char *, uint64_t))(v13 + 8);
      v44(v33, v12);
      v44(v35, v12);
    }
    v44(v21, v12);
    return 0;
  }
  return v28;
}

uint64_t AccessibilitySoundRecognition.DetectorIdentifier.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_226F7A928();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_226F7A948();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_226F7A938();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v1, v10);
  int v14 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v13, v10);
  if (v14 == *MEMORY[0x263F178D0])
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    id v15 = AccessibilitySoundRecognition.BuiltInDetectorIdentifier.listenType.getter();
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    }
    else
    {
      uint64_t v17 = 0x6E776F6E6B6E55;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else if (v14 == *MEMORY[0x263F178C8])
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v13, v10);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v13, v2);
    uint64_t v17 = sub_226F7A918();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    uint64_t v17 = 0x6E776F6E6B6E55;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  return v17;
}

uint64_t sub_226F6A1AC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268162198);
    uint64_t v2 = sub_226F7ADA8();
    uint64_t v14 = v2;
    sub_226F7AD28();
    if (sub_226F7AD68())
    {
      sub_226F6EB14();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_226F6A674();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_226F7ACB8();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v_Block_object_dispose(&a9, 8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_226F7AD68());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_226F6A394()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681621A8);
  uint64_t v3 = sub_226F7AD98();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    os_log_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_226F7AFA8();
      sub_226F7AB28();
      uint64_t result = sub_226F7AFC8();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_226F6A674()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162198);
  uint64_t v3 = sub_226F7AD98();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_226F7ACB8();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_226F6A914()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162180);
  uint64_t v3 = sub_226F7AD98();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v27 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v29 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v28 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28) {
          goto LABEL_33;
        }
        unint64_t v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v28) {
            goto LABEL_33;
          }
          unint64_t v15 = v29[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v28) {
              goto LABEL_33;
            }
            unint64_t v15 = v29[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v27;
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v29 = -1 << v26;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v28) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = v29[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
      _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      sub_226F7AFA8();
      sub_226F7AB28();
      uint64_t v18 = sub_226F7AFC8();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = v18 & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

void *sub_226F6AC28()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681621A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_226F7AD88();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_226F6ADDC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162198);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_226F7AD88();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_226F6AF88()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162180);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_226F7AD88();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_226F6B134(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_226F7AD38();
    if (v2) {
      goto LABEL_3;
    }
    return MEMORY[0x263F8EE78];
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_3:
  if (v2 <= 0)
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162750);
    uint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = _swift_stdlib_malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_226F6CFC8(&v8, v3 + 4, v2, a1);
  uint64_t result = sub_226F6EB0C();
  if (v6 == (void *)v2) {
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void sub_226F6B230(uint64_t a1)
{
  if ((*(void *)v1 & 0xC000000000000001) != 0)
  {
    if (!sub_226F7AD38()) {
      return;
    }
LABEL_5:
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_226F7AD28();
      sub_226F6EB14();
      sub_226F6EB54((unint64_t *)&qword_268162190, (void (*)(uint64_t))sub_226F6EB14);
      sub_226F7AC18();
      a1 = v20;
      uint64_t v18 = v21;
      uint64_t v3 = v22;
      uint64_t v4 = v23;
      unint64_t v5 = v24;
    }
    else
    {
      uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
      uint64_t v18 = a1 + 56;
      uint64_t v3 = ~v6;
      uint64_t v7 = -v6;
      if (v7 < 64) {
        uint64_t v8 = ~(-1 << v7);
      }
      else {
        uint64_t v8 = -1;
      }
      unint64_t v5 = v8 & *(void *)(a1 + 56);
      swift_bridgeObjectRetain();
      uint64_t v4 = 0;
    }
    int64_t v9 = (unint64_t)(v3 + 64) >> 6;
    if (a1 < 0) {
      goto LABEL_14;
    }
    while (1)
    {
      if (v5)
      {
        uint64_t v10 = (v5 - 1) & v5;
        unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
        uint64_t v12 = v4;
      }
      else
      {
        int64_t v14 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          return;
        }
        if (v14 >= v9) {
          goto LABEL_36;
        }
        unint64_t v15 = *(void *)(v18 + 8 * v14);
        uint64_t v12 = v4 + 1;
        if (!v15)
        {
          uint64_t v12 = v4 + 2;
          if (v4 + 2 >= v9) {
            goto LABEL_36;
          }
          unint64_t v15 = *(void *)(v18 + 8 * v12);
          if (!v15)
          {
            uint64_t v12 = v4 + 3;
            if (v4 + 3 >= v9) {
              goto LABEL_36;
            }
            unint64_t v15 = *(void *)(v18 + 8 * v12);
            if (!v15)
            {
              uint64_t v12 = v4 + 4;
              if (v4 + 4 >= v9) {
                goto LABEL_36;
              }
              unint64_t v15 = *(void *)(v18 + 8 * v12);
              if (!v15)
              {
                uint64_t v12 = v4 + 5;
                if (v4 + 5 >= v9) {
                  goto LABEL_36;
                }
                unint64_t v15 = *(void *)(v18 + 8 * v12);
                if (!v15)
                {
                  uint64_t v16 = v4 + 6;
                  while (v9 != v16)
                  {
                    unint64_t v15 = *(void *)(v18 + 8 * v16++);
                    if (v15)
                    {
                      uint64_t v12 = v16 - 1;
                      goto LABEL_32;
                    }
                  }
LABEL_36:
                  sub_226F6EB0C();
                  return;
                }
              }
            }
          }
        }
LABEL_32:
        uint64_t v10 = (v15 - 1) & v15;
        unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
      }
      id v13 = *(id *)(*(void *)(a1 + 48) + 8 * v11);
      if (!v13) {
        goto LABEL_36;
      }
      while (1)
      {
        uint64_t v17 = (void *)sub_226F6BA64(v13);

        uint64_t v4 = v12;
        unint64_t v5 = v10;
        if ((a1 & 0x8000000000000000) == 0) {
          break;
        }
LABEL_14:
        if (sub_226F7AD68())
        {
          sub_226F6EB14();
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v13 = v19;
          swift_unknownObjectRelease();
          uint64_t v12 = v4;
          uint64_t v10 = v5;
          if (v19) {
            continue;
          }
        }
        goto LABEL_36;
      }
    }
  }
  if (*(void *)(*(void *)v1 + 16)) {
    goto LABEL_5;
  }
}

uint64_t sub_226F6B524(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v51 = *MEMORY[0x263EF8340];
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_226F7AD28();
    sub_226F6EB14();
    sub_226F6EB54((unint64_t *)&qword_268162190, (void (*)(uint64_t))sub_226F6EB14);
    sub_226F7AC18();
    uint64_t v3 = v46;
    uint64_t v4 = v47;
    uint64_t v6 = v48;
    int64_t v5 = v49;
    unint64_t v7 = v50;
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v4 = a1 + 56;
    uint64_t v6 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    int64_t v5 = 0;
  }
  uint64_t v41 = v3;
  uint64_t v42 = v4;
  uint64_t v43 = v6;
  int64_t v44 = v5;
  unint64_t v45 = v7;
  uint64_t v11 = v2 + 56;
  while (1)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v7)
      {
        uint64_t v12 = (v7 - 1) & v7;
        unint64_t v13 = __clz(__rbit64(v7)) | (v5 << 6);
LABEL_14:
        int64_t v14 = *(void **)(*(void *)(v3 + 48) + 8 * v13);
        id v15 = v14;
        goto LABEL_15;
      }
      int64_t v25 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        __break(1u);
      }
      int64_t v26 = (unint64_t)(v6 + 64) >> 6;
      if (v25 >= v26)
      {
        int64_t v14 = 0;
        uint64_t v12 = 0;
        goto LABEL_15;
      }
      unint64_t v27 = *(void *)(v42 + 8 * v25);
      if (v27)
      {
LABEL_28:
        uint64_t v12 = (v27 - 1) & v27;
        unint64_t v13 = __clz(__rbit64(v27)) + (v25 << 6);
        int64_t v5 = v25;
        goto LABEL_14;
      }
      int64_t v28 = v5 + 2;
      if (v5 + 2 >= v26) {
        goto LABEL_44;
      }
      unint64_t v27 = *(void *)(v42 + 8 * v28);
      if (v27)
      {
LABEL_32:
        int64_t v25 = v28;
        goto LABEL_28;
      }
      if (v5 + 3 < v26)
      {
        unint64_t v27 = *(void *)(v42 + 8 * (v5 + 3));
        if (v27)
        {
          int64_t v25 = v5 + 3;
          goto LABEL_28;
        }
        int64_t v28 = v5 + 4;
        if (v5 + 4 >= v26)
        {
          int64_t v14 = 0;
          uint64_t v12 = 0;
          v5 += 3;
LABEL_15:
          int64_t v44 = v5;
          unint64_t v45 = v12;
          if (!v14) {
            goto LABEL_53;
          }
          goto LABEL_19;
        }
        unint64_t v27 = *(void *)(v42 + 8 * v28);
        if (v27) {
          goto LABEL_32;
        }
        int64_t v25 = v5 + 5;
        if (v5 + 5 < v26)
        {
          unint64_t v27 = *(void *)(v42 + 8 * v25);
          if (v27) {
            goto LABEL_28;
          }
          int64_t v25 = v26 - 1;
          int64_t v29 = v5 + 6;
          while (v26 != v29)
          {
            unint64_t v27 = *(void *)(v42 + 8 * v29++);
            if (v27)
            {
              int64_t v25 = v29 - 1;
              goto LABEL_28;
            }
          }
LABEL_44:
          int64_t v14 = 0;
          uint64_t v12 = 0;
          int64_t v5 = v25;
          goto LABEL_15;
        }
      }
      int64_t v14 = 0;
      uint64_t v12 = 0;
      int64_t v5 = v28;
      goto LABEL_15;
    }
    uint64_t v16 = sub_226F7AD68();
    if (!v16
      || (uint64_t v39 = v16,
          sub_226F6EB14(),
          swift_unknownObjectRetain(),
          swift_dynamicCast(),
          int64_t v14 = v40,
          swift_unknownObjectRelease(),
          !v40))
    {
LABEL_53:
      sub_226F6EB0C();
      return v2;
    }
LABEL_19:
    uint64_t v17 = sub_226F7ACB8();
    uint64_t v18 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v19 = v17 & ~v18;
    if (((*(void *)(v11 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
      goto LABEL_10;
    }
    sub_226F6EB14();
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v19);
    char v21 = sub_226F7ACC8();

    if (v21) {
      break;
    }
    uint64_t v22 = ~v18;
    while (1)
    {
      unint64_t v19 = (v19 + 1) & v22;
      if (((*(void *)(v11 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
        break;
      }
      id v23 = *(id *)(*(void *)(v2 + 48) + 8 * v19);
      char v24 = sub_226F7ACC8();

      if (v24) {
        goto LABEL_47;
      }
    }
LABEL_10:

    uint64_t v3 = v41;
    uint64_t v6 = v43;
    int64_t v5 = v44;
    unint64_t v7 = v45;
  }
LABEL_47:

  char v31 = *(unsigned char *)(v2 + 32);
  unint64_t v32 = (unint64_t)((1 << v31) + 63) >> 6;
  size_t v33 = 8 * v32;
  if ((v31 & 0x3Fu) < 0xE
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    memcpy((char *)&v39 - ((v33 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v33);
    sub_226F6BC2C((unint64_t *)((char *)&v39 - ((v33 + 15) & 0x3FFFFFFFFFFFFFF0)), v32, v2, v19, &v41);
    uint64_t v35 = v34;
    swift_release();
    sub_226F6EB0C();
  }
  else
  {
    unint64_t v36 = (void *)swift_slowAlloc();
    memcpy(v36, (const void *)(v2 + 56), v33);
    sub_226F6BC2C((unint64_t *)v36, v32, v2, v19, &v41);
    uint64_t v35 = v37;
    swift_release();
    sub_226F6EB0C();
    MEMORY[0x22A66FDC0](v36, -1, -1);
  }
  return v35;
}

uint64_t sub_226F6BA64(void *a1)
{
  uint64_t v3 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v4 = a1;
    char v5 = sub_226F7AD78();

    if (v5)
    {
      uint64_t v6 = sub_226F6C1FC();
      swift_bridgeObjectRelease();
      return v6;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_226F7ACB8();
  uint64_t v8 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
    goto LABEL_12;
  }
  sub_226F6EB14();
  id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
  char v11 = sub_226F7ACC8();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v12;
      if (((*(void *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_12;
      }
      id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v9);
      char v14 = sub_226F7ACC8();
    }
    while ((v14 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v1;
  uint64_t v18 = *v1;
  uint64_t *v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_226F6ADDC();
    uint64_t v16 = v18;
  }
  uint64_t v6 = *(void *)(*(void *)(v16 + 48) + 8 * v9);
  sub_226F6C388(v9);
  uint64_t *v1 = v18;
  swift_bridgeObjectRelease();
  return v6;
}

void sub_226F6BC2C(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  char v5 = a5;
  uint64_t v7 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v39 = a3 + 56;
  while (2)
  {
    uint64_t v36 = v8;
    do
    {
      while (1)
      {
        if ((*v5 & 0x8000000000000000) == 0)
        {
          int64_t v10 = v5[3];
          unint64_t v9 = v5[4];
          if (v9)
          {
            uint64_t v11 = (v9 - 1) & v9;
            unint64_t v12 = __clz(__rbit64(v9)) | (v10 << 6);
LABEL_7:
            id v13 = *(void **)(*(void *)(*v5 + 48) + 8 * v12);
            id v14 = v13;
            goto LABEL_8;
          }
          int64_t v27 = v10 + 1;
          if (__OFADD__(v10, 1))
          {
            __break(1u);
            goto LABEL_49;
          }
          int64_t v28 = (unint64_t)(v5[2] + 64) >> 6;
          if (v27 >= v28)
          {
            id v13 = 0;
            uint64_t v11 = 0;
            goto LABEL_8;
          }
          uint64_t v29 = v5[1];
          unint64_t v30 = *(void *)(v29 + 8 * v27);
          if (v30)
          {
LABEL_22:
            uint64_t v11 = (v30 - 1) & v30;
            unint64_t v12 = __clz(__rbit64(v30)) + (v27 << 6);
            int64_t v10 = v27;
            goto LABEL_7;
          }
          int64_t v33 = v10 + 2;
          if (v10 + 2 >= v28) {
            goto LABEL_41;
          }
          unint64_t v30 = *(void *)(v29 + 8 * v33);
          if (v30)
          {
LABEL_29:
            int64_t v27 = v33;
            goto LABEL_22;
          }
          if (v10 + 3 < v28)
          {
            unint64_t v30 = *(void *)(v29 + 8 * (v10 + 3));
            if (v30)
            {
              int64_t v27 = v10 + 3;
              goto LABEL_22;
            }
            int64_t v33 = v10 + 4;
            if (v10 + 4 >= v28)
            {
              id v13 = 0;
              uint64_t v11 = 0;
              v10 += 3;
LABEL_8:
              v5[3] = v10;
              v5[4] = v11;
              if (!v13) {
                goto LABEL_47;
              }
              goto LABEL_12;
            }
            unint64_t v30 = *(void *)(v29 + 8 * v33);
            if (v30) {
              goto LABEL_29;
            }
            int64_t v27 = v10 + 5;
            if (v10 + 5 < v28)
            {
              unint64_t v30 = *(void *)(v29 + 8 * v27);
              if (v30) {
                goto LABEL_22;
              }
              int64_t v27 = v28 - 1;
              int64_t v34 = v10 + 6;
              while (v28 != v34)
              {
                unint64_t v30 = *(void *)(v29 + 8 * v34++);
                if (v30)
                {
                  int64_t v27 = v34 - 1;
                  goto LABEL_22;
                }
              }
LABEL_41:
              id v13 = 0;
              uint64_t v11 = 0;
              int64_t v10 = v27;
              goto LABEL_8;
            }
          }
          id v13 = 0;
          uint64_t v11 = 0;
          int64_t v10 = v33;
          goto LABEL_8;
        }
        if (!sub_226F7AD68()
          || (sub_226F6EB14(),
              swift_unknownObjectRetain(),
              swift_dynamicCast(),
              id v13 = v40,
              swift_unknownObjectRelease(),
              !v40))
        {
LABEL_47:
          swift_retain();
          sub_226F6BF9C(a1, a2, v36, a3);
          return;
        }
LABEL_12:
        uint64_t v15 = sub_226F7ACB8();
        uint64_t v16 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v17 = v15 & ~v16;
        unint64_t v18 = v17 >> 6;
        uint64_t v19 = 1 << v17;
        if (((1 << v17) & *(void *)(v39 + 8 * (v17 >> 6))) == 0) {
          goto LABEL_3;
        }
        sub_226F6EB14();
        id v20 = *(id *)(*(void *)(a3 + 48) + 8 * v17);
        char v21 = sub_226F7ACC8();

        if (v21) {
          break;
        }
        uint64_t v22 = ~v16;
        for (unint64_t i = v17 + 1; ; unint64_t i = v24 + 1)
        {
          unint64_t v24 = i & v22;
          if (((*(void *)(v39 + (((i & v22) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v22)) & 1) == 0) {
            break;
          }
          id v25 = *(id *)(*(void *)(a3 + 48) + 8 * v24);
          char v26 = sub_226F7ACC8();

          if (v26)
          {

            unint64_t v18 = v24 >> 6;
            uint64_t v19 = 1 << v24;
            goto LABEL_25;
          }
        }
LABEL_3:

        char v5 = a5;
      }

LABEL_25:
      unint64_t v31 = a1[v18];
      a1[v18] = v31 & ~v19;
      BOOL v32 = (v19 & v31) == 0;
      char v5 = a5;
    }
    while (v32);
    uint64_t v8 = v36 - 1;
    if (__OFSUB__(v36, 1))
    {
LABEL_49:
      __break(1u);
      return;
    }
    if (v36 != 1) {
      continue;
    }
    break;
  }
}

uint64_t sub_226F6BF9C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162198);
  uint64_t result = sub_226F7ADB8();
  uint64_t v9 = result;
  int64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    id v18 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_226F7ACB8();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_226F6C1FC()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_226F7AD38();
  uint64_t v3 = swift_unknownObjectRetain();
  uint64_t v4 = sub_226F6A1AC(v3, v2);
  uint64_t v15 = v4;
  swift_retain();
  uint64_t v5 = sub_226F7ACB8();
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if ((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    sub_226F6EB14();
    id v8 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
    char v9 = sub_226F7ACC8();

    if (v9)
    {
LABEL_6:
      swift_release();
      uint64_t v13 = *(void *)(*(void *)(v4 + 48) + 8 * v7);
      sub_226F6C388(v7);
      if (sub_226F7ACC8())
      {
        uint64_t *v1 = v15;
        return v13;
      }
      __break(1u);
    }
    else
    {
      uint64_t v10 = ~v6;
      while (1)
      {
        unint64_t v7 = (v7 + 1) & v10;
        if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          break;
        }
        id v11 = *(id *)(*(void *)(v4 + 48) + 8 * v7);
        char v12 = sub_226F7ACC8();

        if (v12) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_226F6C388(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_226F7AD08();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        uint64_t v11 = sub_226F7ACB8();

        unint64_t v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(v3 + 48);
            unint64_t v16 = (void *)(v15 + 8 * v2);
            uint64_t v17 = (void *)(v15 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v16 >= v17 + 1))
            {
              void *v16 = *v17;
              int64_t v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v18 = *(void *)(v3 + 16);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_226F6C52C(uint64_t a1)
{
  int64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_226F74054(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v10 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_226F6C95C();
    uint64_t v7 = v10;
  }

  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_226F6C5F4(v4, v7);
  uint64_t *v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

void sub_226F6C5F4(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_226F7AD08();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        uint64_t v11 = sub_226F7ACB8();

        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            uint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1) {
              void *v16 = *v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            BOOL v19 = (void *)(v18 + 8 * v3);
            uint64_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              void *v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << a1) - 1;
  }
  uint64_t *v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

void sub_226F6C7A8(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_226F7AD08();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        uint64_t v11 = sub_226F7ACB8();

        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            uint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1) {
              void *v16 = *v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            BOOL v19 = (_OWORD *)(v18 + 16 * v3);
            uint64_t v20 = (_OWORD *)(v18 + 16 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              _OWORD *v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << a1) - 1;
  }
  uint64_t *v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

void *sub_226F6C95C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162528);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_226F7AEA8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_226F6CB08()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162780);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_226F7AEA8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    long long v19 = *(_OWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v1_Block_object_dispose(&a9, 8) = v19;
    id v20 = v17;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_226F6CCC8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162520);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_226F7AEA8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_226F6CE74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3 != sub_226F7AD38()) {
    return;
  }
  int64_t v4 = 0;
  uint64_t v5 = a2 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v11 = v10 | (v4 << 6);
LABEL_6:
    id v12 = *(id *)(*(void *)(a2 + 48) + 8 * v11);
    char v13 = sub_226F7AD78();

    if ((v13 & 1) == 0) {
      return;
    }
  }
  int64_t v14 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v14);
  ++v4;
  if (v15) {
    goto LABEL_19;
  }
  int64_t v4 = v14 + 1;
  if (v14 + 1 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v4);
  if (v15)
  {
LABEL_19:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v4 << 6);
    goto LABEL_6;
  }
  int64_t v16 = v14 + 2;
  if (v16 >= v9) {
    return;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
    int64_t v4 = v16;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v4 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v4);
    ++v16;
    if (v15) {
      goto LABEL_19;
    }
  }
LABEL_23:
  __break(1u);
}

void *sub_226F6CFC8(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = a2;
  uint64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_226F7AD28();
    sub_226F6EB14();
    sub_226F6EB54((unint64_t *)&qword_268162190, (void (*)(uint64_t))sub_226F6EB14);
    uint64_t result = (void *)sub_226F7AC18();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    uint64_t v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    *uint64_t v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    uint64_t v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  uint64_t v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_226F7AD68()) {
        goto LABEL_45;
      }
      sub_226F6EB14();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      unint64_t v15 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    unint64_t v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

void sub_226F6D2E4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_226F7AE98();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x22A66F210);
}

uint64_t sub_226F6D360(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_226F7AE98();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      unint64_t v21 = v2;
      unint64_t v22 = v2 & 0xC000000000000001;
      uint64_t v4 = 4;
      while (1)
      {
        uint64_t v5 = v4 - 4;
        if (v22)
        {
          id v6 = (id)MEMORY[0x22A66F200](v4 - 4, v2);
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v6 = *(id *)(v2 + 8 * v4);
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v8 = v3;
        uint64_t v9 = v6;
        id v10 = objc_msgSend(v6, sel_identifier);
        uint64_t v11 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        uint64_t v13 = v12;

        id v14 = objc_msgSend(a2, sel_identifier);
        uint64_t v15 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        uint64_t v17 = v16;

        BOOL v18 = v11 == v15 && v13 == v17;
        if (v18)
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          char v19 = 1;
          goto LABEL_22;
        }
        char v19 = sub_226F7AF18();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0)
        {
          ++v4;
          uint64_t v3 = v8;
          BOOL v18 = v7 == v8;
          unint64_t v2 = v21;
          if (!v18) {
            continue;
          }
        }
        goto LABEL_22;
      }
    }
  }
  char v19 = 0;
LABEL_22:
  swift_bridgeObjectRelease();
  return v19 & 1;
}

uint64_t sub_226F6D528(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v5)
  {
    uint64_t v6 = 0;
    uint64_t v20 = v3;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x22A66F200](v6, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      id v9 = objc_msgSend(v7, sel_identifier, v20);
      uint64_t v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      uint64_t v12 = v11;

      id v13 = objc_msgSend(a2, sel_identifier);
      uint64_t v3 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      uint64_t v15 = v14;

      if (v10 == v3 && v12 == v15)
      {

        swift_bridgeObjectRelease_n();
        return v6;
      }
      char v17 = sub_226F7AF18();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17) {
        return v6;
      }
      uint64_t v18 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        break;
      }
      ++v6;
      if (v18 == v5) {
        return 0;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_226F7AE98();
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_226F6D6CC(unint64_t *a1, void *a2)
{
  unint64_t v5 = swift_bridgeObjectRetain();
  id v40 = a2;
  unint64_t v41 = sub_226F6D528(v5, a2);
  char v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v39 = v2;
  if (v2) {
    return v41;
  }
  if ((v7 & 1) == 0)
  {
    id v8 = (id)(v41 + 1);
    if (__OFADD__(v41, 1)) {
      goto LABEL_60;
    }
    if (*a1 >> 62)
    {
LABEL_61:
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_226F7AE98();
      swift_bridgeObjectRelease();
      if (v8 != (id)v37) {
        goto LABEL_6;
      }
    }
    else if (v8 != *(id *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (unint64_t i = v41 + 5; ; ++i)
      {
        unint64_t v10 = i - 4;
        unint64_t v11 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          id v12 = (id)MEMORY[0x22A66F200](i - 4);
        }
        else
        {
          if ((v10 & 0x8000000000000000) != 0)
          {
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
LABEL_55:
            __break(1u);
LABEL_56:
            __break(1u);
LABEL_57:
            __break(1u);
LABEL_58:
            __break(1u);
LABEL_59:
            __break(1u);
LABEL_60:
            __break(1u);
            goto LABEL_61;
          }
          if (v10 >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_51;
          }
          id v12 = *(id *)(v11 + 8 * i);
        }
        id v13 = v12;
        id v14 = objc_msgSend(v12, sel_identifier, v39);
        uint64_t v15 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        uint64_t v17 = v16;

        id v8 = objc_msgSend(v40, sel_identifier);
        uint64_t v18 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
        uint64_t v20 = v19;

        if (v15 == v18 && v17 == v20)
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_38;
        }
        char v22 = sub_226F7AF18();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v22) {
          goto LABEL_38;
        }
        if (v10 != v41) {
          break;
        }
LABEL_35:
        if (__OFADD__(v41, 1)) {
          goto LABEL_53;
        }
        ++v41;
LABEL_38:
        id v8 = (id)(i - 3);
        if (__OFADD__(v10, 1)) {
          goto LABEL_52;
        }
        if (*a1 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v34 = sub_226F7AE98();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v34 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (v8 == (id)v34) {
          return v41;
        }
      }
      unint64_t v23 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        id v24 = (id)MEMORY[0x22A66F200](v41, *a1);
        unint64_t v23 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_21:
          if ((v10 & 0x8000000000000000) != 0) {
            goto LABEL_56;
          }
          if (v10 >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_57;
          }
          id v25 = *(id *)(v23 + 8 * i);
          goto LABEL_24;
        }
      }
      else
      {
        if ((v41 & 0x8000000000000000) != 0) {
          goto LABEL_54;
        }
        if (v41 >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_55;
        }
        id v24 = *(id *)(v23 + 8 * v41 + 32);
        if ((v23 & 0xC000000000000001) == 0) {
          goto LABEL_21;
        }
      }
      id v25 = (id)MEMORY[0x22A66F200](i - 4, v23);
      unint64_t v23 = *a1;
LABEL_24:
      int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v23;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v23 & 0x8000000000000000) != 0
        || (v23 & 0x4000000000000000) != 0)
      {
        sub_226F6D2E4(v23);
        unint64_t v23 = v27;
        *a1 = v27;
      }
      uint64_t v28 = *(void **)((v23 & 0xFFFFFFFFFFFFFF8) + 8 * v41 + 0x20);
      *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 8 * v41 + 0x20) = v25;

      sub_226F7AB68();
      unint64_t v29 = *a1;
      int v30 = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *a1 = v29;
      if (!v30 || (v29 & 0x8000000000000000) != 0 || (v29 & 0x4000000000000000) != 0)
      {
        sub_226F6D2E4(v29);
        unint64_t v29 = v31;
        *a1 = v31;
      }
      if ((v10 & 0x8000000000000000) != 0) {
        goto LABEL_58;
      }
      uint64_t v32 = v29 & 0xFFFFFFFFFFFFFF8;
      if (v10 >= *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_59;
      }
      int64_t v33 = *(void **)(v32 + 8 * i);
      *(void *)(v32 + 8 * i) = v24;

      sub_226F7AB68();
      goto LABEL_35;
    }
    return v41;
  }
  unint64_t v35 = *a1;
  if (!(v35 >> 62)) {
    return *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_226F7AE98();
  swift_bridgeObjectRelease();
  return v38;
}

uint64_t sub_226F6DAA0(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_226F7AE98();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_226F7AE98();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_226F7AE98();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *uint64_t v3 = MEMORY[0x22A66F210](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  id v14 = (char *)(v11 + 32 + 8 * v4);
  sub_226F6EB14();
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_226F7AE98();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_226F7AED8();
          __break(1u);
          return result;
        }
        uint64_t v17 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v17[8 * v16]) {
          memmove(v14, v17, 8 * v16);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_27:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_226F7AE98();
        swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  return sub_226F7AB68();
}

uint64_t sub_226F6DDAC()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled];
  swift_beginAccess();
  if (*v1 != 1)
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_226F7AA58();
    __swift_project_value_buffer(v9, (uint64_t)qword_268162638);
    unint64_t v10 = v0;
    uint64_t v11 = sub_226F7AA48();
    os_log_type_t v12 = sub_226F7AC48();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      v21[0] = v14;
      uint64_t v15 = v10;
      id v16 = objc_msgSend(v15, sel_description);
      uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v19 = v18;

      v21[7] = sub_226F44310(v17, v19, v21);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v11, v12, "[%s]: trying to start sound analysis while the feature is not enabled. Need to enable it first.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v14, -1, -1);
      MEMORY[0x22A66FDC0](v13, -1, -1);
    }
    else
    {
    }
    sub_226F6EB9C();
    swift_allocError();
    *uint64_t v20 = 0;
    return swift_willThrow();
  }
  uint64_t v2 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors];
  swift_beginAccess();
  unint64_t v3 = *(void *)v2;
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_226F7AE98();
    uint64_t v4 = result;
    if (result) {
      goto LABEL_4;
    }
    return swift_bridgeObjectRelease_n();
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain_n();
  if (!v4) {
    return swift_bridgeObjectRelease_n();
  }
LABEL_4:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x22A66F200](i, v3);
      }
      else {
        id v7 = *(id *)(v3 + 8 * i + 32);
      }
      uint64_t v8 = v7;
      sub_226F631C0(v7);
    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_226F6E0B0()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled];
  swift_beginAccess();
  if ((*v1 & 1) == 0)
  {
    uint64_t v13 = &v0[OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors];
    swift_beginAccess();
    unint64_t v14 = *(void *)v13;
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t result = sub_226F7AE98();
      uint64_t v15 = result;
      if (!result) {
        return swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain_n();
      if (!v15) {
        return swift_bridgeObjectRelease_n();
      }
    }
    if (v15 < 1)
    {
      __break(1u);
      return result;
    }
    for (uint64_t i = 0; i != v15; ++i)
    {
      if ((v14 & 0xC000000000000001) != 0) {
        id v18 = (id)MEMORY[0x22A66F200](i, v14);
      }
      else {
        id v18 = *(id *)(v14 + 8 * i + 32);
      }
      unint64_t v19 = v18;
      sub_226F63514(v18);
    }
    return swift_bridgeObjectRelease_n();
  }
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226F7AA58();
  __swift_project_value_buffer(v2, (uint64_t)qword_268162638);
  unint64_t v3 = v0;
  uint64_t v4 = sub_226F7AA48();
  os_log_type_t v5 = sub_226F7AC48();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    v21[0] = v7;
    uint64_t v8 = v3;
    id v9 = objc_msgSend(v8, sel_description);
    uint64_t v10 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v12 = v11;

    v21[7] = sub_226F44310(v10, v12, v21);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v4, v5, "[%s]: trying to stop sound analysis while the feature is enabled. Need to disable it first.", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v7, -1, -1);
    MEMORY[0x22A66FDC0](v6, -1, -1);
  }
  else
  {
  }
  sub_226F6EB9C();
  swift_allocError();
  *uint64_t v20 = 1;
  return swift_willThrow();
}

uint64_t type metadata accessor for AXSDSecureBaseControllerImplementation()
{
  return self;
}

uint64_t sub_226F6E3D8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_currentDetectors);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_226F6E434@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_226F6E488(char *a1, void *a2)
{
  char v2 = *a1;
  unint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI38AXSDSecureBaseControllerImplementation_isEnabled);
  uint64_t result = swift_beginAccess();
  *unint64_t v3 = v2;
  return result;
}

uint64_t method lookup function for AXSDSecureBaseControllerImplementation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXSDSecureBaseControllerImplementation);
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.currentDetectors.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.isEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.isListening.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.isSecure.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.startListening()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.stopListening()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AXSDSecureBaseControllerImplementation.verifyTasks()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t sub_226F6E664()
{
  uint64_t v1 = sub_226F7A898();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_226F6E75C(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_226F7A898() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[5];
  uint64_t v10 = (uint64_t)v1 + v5;
  uint64_t v11 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  void *v12 = v2;
  v12[1] = sub_226F6ED4C;
  return sub_226F66798(a1, v6, v7, v8, v9, v10, v11);
}

unint64_t sub_226F6E894()
{
  unint64_t result = qword_2681626C0;
  if (!qword_2681626C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681626B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681626C0);
  }
  return result;
}

uint64_t sub_226F6E8F0()
{
  uint64_t v1 = sub_226F7A938();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

uint64_t sub_226F6E9E0(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_226F7A938() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_226F5ABF8;
  return sub_226F641A8(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_226F6EB0C()
{
  return swift_release();
}

unint64_t sub_226F6EB14()
{
  unint64_t result = qword_268162770;
  if (!qword_268162770)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268162770);
  }
  return result;
}

uint64_t sub_226F6EB54(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_226F6EB9C()
{
  unint64_t result = qword_2681626E8;
  if (!qword_2681626E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681626E8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SoundRecognitionError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x226F6ECBCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SoundRecognitionError()
{
  return &type metadata for SoundRecognitionError;
}

unint64_t sub_226F6ECF8()
{
  unint64_t result = qword_2681626F0;
  if (!qword_2681626F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681626F0);
  }
  return result;
}

uint64_t sub_226F6ED54()
{
  return _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
}

uint64_t *sub_226F6ED5C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_226F7A898();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_226F6EEC8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = sub_226F7A898();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

void *sub_226F6EF7C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_226F7A898();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_226F6F0AC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_226F7A898();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    sub_226F6F250((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_226F7A898();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_226F6F250(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_226F6F2B0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_226F7A898();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_226F6F3E0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_226F7A898();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    sub_226F6F250((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_226F7A898();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_226F6F584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_226F6F598);
}

uint64_t sub_226F6F598(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_226F6F608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_226F6F61C);
}

uint64_t sub_226F6F61C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_226F6F6A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 1, v2);
}

uint64_t sub_226F6F70C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 1, v4);
}

uint64_t type metadata accessor for AXSDError()
{
  uint64_t result = qword_268162700;
  if (!qword_268162700) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_226F6F7CC()
{
  uint64_t result = sub_226F7A898();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

id sub_226F6F890()
{
  unint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_226F6F948(void *a1)
{
  int v3 = (void **)(v1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *int v3 = a1;
}

void sub_226F6F99C(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  int v3 = (void **)(*a2 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *int v3 = v2;
  id v5 = v2;
}

uint64_t (*sub_226F6FA00())()
{
  return j__swift_endAccess;
}

uint64_t sub_226F6FB70()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  id v2 = objc_msgSend(*v1, sel_currentDetectors);
  type metadata accessor for AXSDSoundDetectionType();
  uint64_t v3 = sub_226F7AB58();

  uint64_t v4 = sub_226F46CDC(v3);
  swift_bridgeObjectRelease();
  return v4;
}

id sub_226F6FCA0()
{
  id v1 = objc_allocWithZone((Class)AXSDDetectorManager);
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_init);
  id v4 = objc_msgSend(objc_allocWithZone((Class)AXSDDetectorQueueManager), sel_init);

  id v5 = objc_allocWithZone((Class)type metadata accessor for AXSDNSControllerImplementation());
  id v6 = v3;
  id v7 = v4;
  id v8 = sub_226F7527C(v6, v7);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  id v9 = v8;
  objc_msgSend(v6, sel_setDelegate_, v9);
  objc_msgSend(v7, sel_setDelegate_, v9);

  return v9;
}

id AXSDNSControllerImplementation.__allocating_init(detectorManager:queueManager:)(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = sub_226F7527C(a1, a2);

  return v6;
}

id AXSDNSControllerImplementation.init(detectorManager:queueManager:)(void *a1, void *a2)
{
  id v4 = sub_226F7527C(a1, a2);

  return v4;
}

id sub_226F6FE5C(void *a1)
{
  return sub_226F6FEEC(a1, "[%s]: adding listen type: %s", (SEL *)&selRef_addListenType_);
}

id sub_226F6FED8(void *a1)
{
  return sub_226F6FEEC(a1, "[%s]: removing listen type: %s", (SEL *)&selRef_removeListenType_);
}

id sub_226F6FEEC(void *a1, char *a2, SEL *a3)
{
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_226F7AA58();
  __swift_project_value_buffer(v7, (uint64_t)qword_268162638);
  id v8 = v3;
  id v9 = a1;
  int v10 = (char *)v8;
  id v11 = v9;
  unint64_t v12 = sub_226F7AA48();
  os_log_type_t v13 = sub_226F7AC58();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v26 = v24;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v15 = v10;
    format = a2;
    id v16 = objc_msgSend(v15, sel_description);
    id v25 = a3;
    uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v19 = v18;

    sub_226F44310(v17, v19, &v26);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v20 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    sub_226F44310(v20, v21, &v26);
    a3 = v25;
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v12, v13, format, (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v24, -1, -1);
    MEMORY[0x22A66FDC0](v14, -1, -1);
  }
  else
  {
  }
  return objc_msgSend(*(id *)&v10[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorQueueManager], *a3, v11);
}

uint64_t sub_226F701BC()
{
  uint64_t v1 = sub_226F7AA78();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226F7AA98();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v36 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_226F7AA58();
  __swift_project_value_buffer(v8, (uint64_t)qword_268162638);
  id v9 = v0;
  int v10 = sub_226F7AA48();
  os_log_type_t v11 = sub_226F7AC58();
  int v12 = v11;
  if (os_log_type_enabled(v10, v11))
  {
    int v33 = v12;
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    aBlock[0] = v32;
    uint64_t v34 = v6;
    *(_DWORD *)os_log_type_t v13 = 136315138;
    int v30 = v13 + 4;
    unint64_t v31 = v13;
    id v14 = v9;
    uint64_t v15 = v4;
    uint64_t v16 = v5;
    uint64_t v17 = v1;
    id v18 = objc_msgSend(v14, sel_description);
    uint64_t v19 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    uint64_t v35 = v2;
    unint64_t v21 = v20;

    uint64_t v1 = v17;
    uint64_t v5 = v16;
    id v4 = v15;
    uint64_t v37 = sub_226F44310(v19, v21, aBlock);
    uint64_t v6 = v34;
    sub_226F7ACD8();

    uint64_t v2 = v35;
    swift_bridgeObjectRelease();
    uint64_t v22 = v31;
    _os_log_impl(&dword_226F20000, v10, (os_log_type_t)v33, "[%s]: removing all listen types", v31, 0xCu);
    uint64_t v23 = v32;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v23, -1, -1);
    MEMORY[0x22A66FDC0](v22, -1, -1);
  }
  else
  {
  }
  sub_226F46D98(0, (unint64_t *)&qword_2681622D0);
  uint64_t v24 = (void *)sub_226F7AC88();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v9;
  aBlock[4] = (uint64_t)sub_226F75400;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_226F42574;
  aBlock[3] = (uint64_t)&block_descriptor_4;
  uint64_t v26 = _Block_copy(aBlock);
  id v27 = v9;
  swift_release();
  uint64_t v28 = v36;
  sub_226F7AA88();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_226F75450((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  sub_226F4671C();
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v28, v4, v26);
  _Block_release(v26);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v28, v5);
}

void _s18AXSoundDetectionUI30AXSDNSControllerImplementationC28assetsReadyAndDetectorsAddedyyF_0()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v1, sel_description);
  uint64_t v3 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  unint64_t v5 = v4;

  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_226F7AA58();
  __swift_project_value_buffer(v6, (uint64_t)qword_268162638);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = sub_226F7AA48();
  os_log_type_t v8 = sub_226F7AC58();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v16 = v10;
    *(_DWORD *)id v9 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_226F44310(v3, v5, &v16);
    sub_226F7ACD8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_226F20000, v7, v8, "[%s]: start listening", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v10, -1, -1);
    MEMORY[0x22A66FDC0](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorQueueManager], sel_prepareToListen, v15, v16))
  {
    swift_bridgeObjectRelease();
    sub_226F45E18(v1, v1);
  }
  else
  {
    swift_bridgeObjectRetain();
    os_log_type_t v11 = sub_226F7AA48();
    os_log_type_t v12 = sub_226F7AC58();
    if (os_log_type_enabled(v11, v12))
    {
      os_log_type_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v16 = v14;
      *(_DWORD *)os_log_type_t v13 = 136315138;
      swift_bridgeObjectRetain();
      sub_226F44310(v3, v5, &v16);
      sub_226F7ACD8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_226F20000, v11, v12, "[%s]: detector queue manager not ready, returning", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v14, -1, -1);
      MEMORY[0x22A66FDC0](v13, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_226F70A00()
{
  uint64_t v1 = sub_226F7AA78();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_226F7AA98();
  uint64_t v29 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v28 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v0;
  id v8 = objc_msgSend(v7, sel_description);
  uint64_t v9 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  unint64_t v11 = v10;

  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_226F7AA58();
  __swift_project_value_buffer(v12, (uint64_t)qword_268162638);
  swift_bridgeObjectRetain();
  os_log_type_t v13 = sub_226F7AA48();
  os_log_type_t v14 = sub_226F7AC58();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v25 = v9;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v27 = v1;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    aBlock[0] = v17;
    uint64_t v26 = v4;
    *(_DWORD *)uint64_t v16 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_226F44310(v25, v11, aBlock);
    unint64_t v4 = v26;
    sub_226F7ACD8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_226F20000, v13, v14, "[%s]: stop listening", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v17, -1, -1);
    id v18 = v16;
    uint64_t v1 = v27;
    MEMORY[0x22A66FDC0](v18, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorQueueManager], sel_stopListening);
  sub_226F46D98(0, (unint64_t *)&qword_2681622D0);
  uint64_t v19 = (void *)sub_226F7AC88();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v7;
  aBlock[4] = (uint64_t)sub_226F75424;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_226F42574;
  aBlock[3] = (uint64_t)&block_descriptor_6_2;
  unint64_t v21 = _Block_copy(aBlock);
  uint64_t v22 = v7;
  swift_release();
  uint64_t v23 = v28;
  sub_226F7AA88();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_226F75450((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  sub_226F4671C();
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v23, v4, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v23, v5);
}

id sub_226F70E94(char *a1)
{
  sub_226F4962C(a1, a1);
  uint64_t v2 = (id *)&a1[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager];
  swift_beginAccess();
  return objc_msgSend(*v2, sel_stopDetection);
}

uint64_t sub_226F70F3C()
{
  return swift_bridgeObjectRelease();
}

id AXSDNSControllerImplementation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXSDNSControllerImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t AXSDNSControllerImplementation.pipe(inFileURL:)(uint64_t a1)
{
  objc_super v2 = v1;
  v40[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_226F7A898();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_226F7A848() & 1) == 0)
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_226F7AA58();
    __swift_project_value_buffer(v12, (uint64_t)qword_268162638);
    uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v38(v7, a1, v4);
    id v13 = v1;
    os_log_type_t v14 = sub_226F7AA48();
    os_log_type_t v15 = sub_226F7AC58();
    int v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v35 = (void *)swift_slowAlloc();
      v40[0] = v35;
      *(_DWORD *)uint64_t v17 = 136315394;
      v33[1] = v17 + 4;
      id v18 = v13;
      id v19 = objc_msgSend(v18, sel_description);
      uint64_t v36 = v5 + 16;
      id v20 = v19;
      uint64_t v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      int v34 = v16;
      uint64_t v22 = v21;
      uint64_t v37 = a1;
      unint64_t v24 = v23;

      uint64_t v39 = sub_226F44310(v22, v24, (uint64_t *)v40);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2080;
      sub_226F75450((unint64_t *)&unk_268162320, MEMORY[0x263F06EA8]);
      uint64_t v25 = sub_226F7AF08();
      uint64_t v39 = sub_226F44310(v25, v26, (uint64_t *)v40);
      a1 = v37;
      sub_226F7ACD8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      _os_log_impl(&dword_226F20000, v14, (os_log_type_t)v34, "[%s]: piped in fileURL: %s is not a valid file URL", (uint8_t *)v17, 0x16u);
      uint64_t v27 = v35;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v27, -1, -1);
      MEMORY[0x22A66FDC0](v17, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }

    type metadata accessor for AXSDError();
    sub_226F75450(&qword_268162730, (void (*)(uint64_t))type metadata accessor for AXSDError);
    swift_allocError();
    uint64_t v29 = v28;
    v38(v28, a1, v4);
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 0, 1, v30);
    goto LABEL_11;
  }
  sub_226F7A888();
  id v8 = (void *)sub_226F7AAD8();
  swift_bridgeObjectRelease();
  v40[0] = 0;
  id v9 = objc_msgSend(v2, sel_pipeInFilePath_error_, v8, v40);

  id v10 = v40[0];
  if (!v9)
  {
    id v31 = v40[0];
    sub_226F7A838();

LABEL_11:
    swift_willThrow();
    return v4;
  }
  type metadata accessor for AXSDSoundDetectionType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162738);
  sub_226F75450(&qword_268162740, (void (*)(uint64_t))type metadata accessor for AXSDSoundDetectionType);
  uint64_t v4 = sub_226F7AAB8();
  id v11 = v10;

  return v4;
}

uint64_t AXSDNSControllerImplementation.pipe(inFilePath:)(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = v2;
  id v6 = objc_msgSend(v5, sel_description);
  uint64_t v7 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  unint64_t v9 = v8;

  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_226F7AA58();
  __swift_project_value_buffer(v10, (uint64_t)qword_268162638);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  id v11 = sub_226F7AA48();
  os_log_type_t v12 = sub_226F7AC58();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = a1;
    v25[0] = swift_slowAlloc();
    uint64_t v14 = v25[0];
    *(_DWORD *)uint64_t v13 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_226F44310(v7, v9, v25);
    sub_226F7ACD8();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_226F44310(v24, a2, v25);
    sub_226F7ACD8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_226F20000, v11, v12, "[%s]: AUTOMATION: piped in file: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v14, -1, -1);
    MEMORY[0x22A66FDC0](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  unint64_t v15 = sub_226F4D8B0(MEMORY[0x263F8EE78]);
  uint64_t v16 = OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recentDetections;
  *(void *)&v5[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recentDetections] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = (id *)&v5[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  id v18 = *v17;
  id v19 = (void *)sub_226F7AAD8();
  objc_msgSend(v18, sel_pipeInFile_, v19);

  uint64_t result = *(void *)&v5[v16];
  if (result)
  {
    *(void *)&v5[v16] = 0;
  }
  else
  {
    type metadata accessor for AXSDError();
    sub_226F75450(&qword_268162730, (void (*)(uint64_t))type metadata accessor for AXSDError);
    swift_allocError();
    uint64_t v22 = v21;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681626F8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
    swift_willThrow();
    *(void *)&v5[v16] = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

id AXSDNSControllerImplementation.trackObservation(_:forDetector:)(void *a1, void *a2)
{
  id result = objc_msgSend(self, sel_isInternalInstall);
  if (!result) {
    return result;
  }
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recentDetections);
  if (!v6) {
    return result;
  }
  swift_bridgeObjectRetain_n();
  id v7 = objc_msgSend(a2, sel_soundIdentifier);
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

  unint64_t v8 = (void *)sub_226F7AAD8();
  swift_bridgeObjectRelease();
  id v9 = (id)AXSDSoundDetectionTypeForIdentifier();

  if (*(void *)(v6 + 16))
  {
    id v10 = v9;
    unint64_t v11 = sub_226F740F4((uint64_t)v10);
    if (v12)
    {
      uint64_t v13 = *(void *)(*(void *)(v6 + 56) + 8 * v11);
      swift_bridgeObjectRetain();

      swift_bridgeObjectRelease();
      id v14 = a1;
      MEMORY[0x22A66EF70]();
      if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_226F7AB78();
      }
      sub_226F7AB88();
      sub_226F7AB68();
      id v15 = v10;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_226F74D4C(v13, v15, isUniquelyReferenced_nonNull_native);

      swift_bridgeObjectRelease();
      return (id)swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162750);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_226F7E410;
  *(void *)(v17 + 32) = a1;
  uint64_t v20 = v17;
  sub_226F7AB68();
  id v18 = a1;
  char v19 = swift_isUniquelyReferenced_nonNull_native();
  sub_226F7513C(v20, v9, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return (id)swift_bridgeObjectRelease();
}

Swift::Void __swiftcall AXSDNSControllerImplementation.receivedBuffer(_:at:)(AVAudioPCMBuffer _, AVAudioTime *at)
{
  impl = _.super._impl;
  Class isa = _.super.super.isa;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for AXSDNSControllerImplementation();
  objc_msgSendSuper2(&v5, sel_receivedBuffer_atTime_, isa, impl);
  objc_msgSend(v2, sel_receivedBuffer_atTime_isFile_, isa, impl, 0);
}

Swift::Void __swiftcall AXSDNSControllerImplementation.listenEngineDidStart(withInputFormat:)(AVAudioFormat_optional *withInputFormat)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_226F7AA78();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_226F7AA98();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = (objc_class *)type metadata accessor for AXSDNSControllerImplementation();
  v32.receiver = v2;
  v32.super_class = v12;
  [(AVAudioFormat_optional *)&v32 listenEngineDidStartWithInputFormat:withInputFormat];
  if (withInputFormat)
  {
    sub_226F46D98(0, (unint64_t *)&qword_2681622D0);
    uint64_t v30 = v8;
    uint64_t v13 = withInputFormat;
    id v14 = (void *)sub_226F7AC88();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v2;
    *(void *)(v15 + 24) = v13;
    aBlock[4] = (uint64_t)sub_226F7555C;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_226F42574;
    aBlock[3] = (uint64_t)&block_descriptor_12_2;
    uint64_t v16 = _Block_copy(aBlock);
    uint64_t v17 = v13;
    id v18 = v2;
    swift_release();
    sub_226F7AA88();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_226F75450((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
    sub_226F4671C();
    sub_226F7ACF8();
    MEMORY[0x22A66F0C0](0, v11, v7, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v30);
  }
  else
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_226F7AA58();
    __swift_project_value_buffer(v19, (uint64_t)qword_268162638);
    id v20 = v2;
    uint64_t v21 = sub_226F7AA48();
    os_log_type_t v22 = sub_226F7AC48();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      aBlock[0] = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      id v25 = v20;
      id v26 = objc_msgSend(v25, sel_description);
      uint64_t v27 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v29 = v28;

      uint64_t aBlock[6] = sub_226F44310(v27, v29, aBlock);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_226F20000, v21, v22, "[%s]: Listen Engine did not return an audio format. This should NOT happen; bailing. File a radar!",
        v23,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v24, -1, -1);
      MEMORY[0x22A66FDC0](v23, -1, -1);
    }
    else
    {
    }
  }
}

void sub_226F72480(uint64_t a1, void *a2)
{
  uint64_t v4 = (id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  objc_msgSend(*v4, sel_startDetectionWithFormat_, a2);
  if (objc_msgSend(self, sel_isInternalInstall)
    && objc_msgSend(self, sel_isEnrolled))
  {
    uint64_t v5 = OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager;
    if (!*(void *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager))
    {
      objc_msgSend(a2, sel_sampleRate);
      double v7 = 1.0 / v6;
      uint64_t v8 = (id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener);
      swift_beginAccess();
      id v9 = objc_msgSend(objc_allocWithZone((Class)AXSDUltronInternalRecordingManager), sel_initWithSampleLength_bufferSize_, v7, (double)(unint64_t)objc_msgSend(*v8, sel_bufferSize));
      uint64_t v10 = *(void **)(a1 + v5);
      *(void *)(a1 + v5) = v9;
    }
  }
}

Swift::Void __swiftcall AXSDNSControllerImplementation.listenEngineReceivedAudioFile(_:)(AVAudioFile a1)
{
  Class isa = a1.super.isa;
  uint64_t v91 = sub_226F7AA78();
  uint64_t v3 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  unint64_t v89 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_226F7AA98();
  uint64_t v5 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  uint64_t v86 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_226F7AA58();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_268162638);
  id v9 = isa;
  id v10 = v1;
  unint64_t v11 = v9;
  id v12 = v10;
  uint64_t v85 = v8;
  uint64_t v13 = sub_226F7AA48();
  os_log_type_t v14 = sub_226F7AC28();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v90 = v3;
  uint64_t v87 = v5;
  uint64_t v84 = v11;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v82 = swift_slowAlloc();
    uint64_t aBlock = v82;
    *(_DWORD *)uint64_t v16 = 136315650;
    id v18 = v12;
    id v19 = objc_msgSend(v18, sel_description);
    uint64_t v20 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    uint64_t v83 = (uint64_t)v12;
    unint64_t v22 = v21;

    uint64_t v92 = sub_226F44310(v20, v22, &aBlock);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2112;
    uint64_t v92 = (uint64_t)v11;
    uint64_t v23 = v11;
    sub_226F7ACD8();
    *uint64_t v17 = v11;

    *(_WORD *)(v16 + 22) = 2112;
    id v12 = (id)v83;
    id v24 = [(objc_class *)v23 processingFormat];
    uint64_t v92 = (uint64_t)v24;
    sub_226F7ACD8();
    v17[1] = v24;

    _os_log_impl(&dword_226F20000, v13, v14, "[%s]: Received audio file: %@ with audio format: %@", (uint8_t *)v16, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v17, -1, -1);
    uint64_t v25 = v82;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v25, -1, -1);
    MEMORY[0x22A66FDC0](v16, -1, -1);
  }
  else
  {
  }
  id v26 = v12;
  uint64_t v27 = sub_226F7AA48();
  os_log_type_t v28 = sub_226F7AC38();
  if (os_log_type_enabled(v27, v28))
  {
    unint64_t v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v83 = swift_slowAlloc();
    uint64_t aBlock = v83;
    *(_DWORD *)unint64_t v29 = 136315138;
    uint64_t v82 = (uint64_t)(v29 + 4);
    id v30 = v26;
    id v31 = objc_msgSend(v30, sel_description);
    uint64_t v32 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v34 = v33;

    uint64_t v92 = sub_226F44310(v32, v34, &aBlock);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v27, v28, "[%s]: Stopping detector manager.", v29, 0xCu);
    uint64_t v35 = v83;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v35, -1, -1);
    MEMORY[0x22A66FDC0](v29, -1, -1);
  }
  else
  {
  }
  uint64_t v36 = v90;
  sub_226F46D98(0, (unint64_t *)&qword_2681622D0);
  uint64_t v37 = (void *)sub_226F7AC88();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = v26;
  uint64_t v97 = sub_226F75564;
  uint64_t v98 = v38;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v94 = 1107296256;
  char v95 = sub_226F42574;
  uint64_t v96 = &block_descriptor_18_0;
  uint64_t v39 = _Block_copy(&aBlock);
  id v40 = v26;
  swift_release();
  unint64_t v41 = v86;
  sub_226F7AA88();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  uint64_t v42 = sub_226F75450((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  unint64_t v44 = sub_226F4671C();
  unint64_t v45 = v89;
  unint64_t v81 = v44;
  uint64_t v82 = v43;
  uint64_t v46 = v91;
  uint64_t v83 = v42;
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v41, v45, v39);
  _Block_release(v39);

  int64_t v49 = *(void (**)(void, void))(v36 + 8);
  uint64_t v47 = v36 + 8;
  uint64_t v48 = v49;
  v49(v45, v46);
  uint64_t v50 = v87 + 8;
  uint64_t v80 = *(void (**)(char *, uint64_t))(v87 + 8);
  v80(v41, v88);
  uint64_t v51 = v84;
  id v52 = v40;
  uint64_t v53 = v51;
  id v54 = v52;
  uint64_t v55 = sub_226F7AA48();
  os_log_type_t v56 = sub_226F7AC38();
  int v57 = v56;
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v58 = swift_slowAlloc();
    uint64_t v87 = v50;
    uint64_t v59 = v58;
    uint64_t v84 = (void *)swift_slowAlloc();
    uint64_t v85 = swift_slowAlloc();
    uint64_t aBlock = v85;
    *(_DWORD *)uint64_t v59 = 136315394;
    uint64_t v78 = v59 + 4;
    id v60 = v54;
    uint64_t v90 = v47;
    id v61 = v60;
    id v62 = objc_msgSend(v60, sel_description);
    uint64_t v63 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    int v79 = v57;
    uint64_t v64 = v48;
    unint64_t v66 = v65;

    uint64_t v92 = sub_226F44310(v63, v66, &aBlock);
    sub_226F7ACD8();

    uint64_t v48 = v64;
    swift_bridgeObjectRelease();
    *(_WORD *)(v59 + 12) = 2112;
    id v67 = objc_msgSend(v53, sel_processingFormat);
    uint64_t v92 = (uint64_t)v67;
    sub_226F7ACD8();
    uint64_t v68 = v84;
    *uint64_t v84 = v67;

    _os_log_impl(&dword_226F20000, v55, (os_log_type_t)v79, "[%s]: Starting detector manager with audio format: %@", (uint8_t *)v59, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v68, -1, -1);
    uint64_t v69 = v85;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v69, -1, -1);
    MEMORY[0x22A66FDC0](v59, -1, -1);
  }
  else
  {
  }
  unint64_t v70 = (void *)sub_226F7AC88();
  uint64_t v71 = swift_allocObject();
  *(void *)(v71 + 16) = v54;
  *(void *)(v71 + 24) = v53;
  uint64_t v97 = sub_226F755B0;
  uint64_t v98 = v71;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v94 = 1107296256;
  char v95 = sub_226F42574;
  uint64_t v96 = &block_descriptor_24_1;
  uint64_t v72 = _Block_copy(&aBlock);
  uint64_t v73 = v53;
  id v74 = v54;
  swift_release();
  uint64_t v75 = v86;
  sub_226F7AA88();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  uint64_t v76 = v89;
  uint64_t v77 = v91;
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v75, v76, v72);
  _Block_release(v72);

  v48(v76, v77);
  v80(v75, v88);
}

void sub_226F73048(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  id v4 = *v3;
  id v5 = objc_msgSend(a2, sel_processingFormat);
  objc_msgSend(v4, sel_startDetectionWithFormat_, v5);
}

Swift::Void __swiftcall AXSDNSControllerImplementation.listenEngineFinishedAudioFile(_:)(AVAudioFile a1)
{
  Class isa = a1.super.isa;
  uint64_t v3 = sub_226F7AA78();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v88 = (char *)&v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_226F7AA98();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v93 = v6;
  uint64_t v94 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v92 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_226F7AA58();
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_268162638);
  id v11 = v1;
  id v12 = isa;
  id v13 = v11;
  os_log_type_t v14 = v12;
  uint64_t v91 = v10;
  BOOL v15 = sub_226F7AA48();
  os_log_type_t v16 = sub_226F7AC28();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v89 = v3;
  uint64_t v90 = v4;
  if (v17)
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v86 = (void *)swift_slowAlloc();
    uint64_t v87 = swift_slowAlloc();
    uint64_t aBlock = v87;
    *(_DWORD *)uint64_t v18 = 136315394;
    id v19 = v13;
    id v20 = objc_msgSend(v19, sel_description);
    uint64_t v21 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v23 = v22;

    uint64_t v96 = sub_226F44310(v21, v23, &aBlock);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2112;
    uint64_t v96 = (uint64_t)v14;
    id v24 = v14;
    sub_226F7ACD8();
    uint64_t v25 = v86;
    *uint64_t v86 = v14;

    _os_log_impl(&dword_226F20000, v15, v16, "[%s]: Finished processing audio file: %@.", (uint8_t *)v18, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v25, -1, -1);
    uint64_t v26 = v87;
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v26, -1, -1);
    MEMORY[0x22A66FDC0](v18, -1, -1);
  }
  else
  {
  }
  id v27 = v13;
  os_log_type_t v28 = sub_226F7AA48();
  os_log_type_t v29 = sub_226F7AC38();
  if (os_log_type_enabled(v28, v29))
  {
    id v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t aBlock = v31;
    *(_DWORD *)id v30 = 136315138;
    uint64_t v87 = (uint64_t)(v30 + 4);
    id v32 = v27;
    id v33 = objc_msgSend(v32, sel_description);
    uint64_t v34 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    unint64_t v36 = v35;

    uint64_t v96 = sub_226F44310(v34, v36, &aBlock);
    sub_226F7ACD8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_226F20000, v28, v29, "[%s]: Stopping detector manager.", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v31, -1, -1);
    MEMORY[0x22A66FDC0](v30, -1, -1);
  }
  else
  {
  }
  uint64_t v37 = v89;
  uint64_t v38 = v90;
  uint64_t v39 = v88;
  uint64_t v40 = v94;
  uint64_t v84 = sub_226F46D98(0, (unint64_t *)&qword_2681622D0);
  unint64_t v41 = (void *)sub_226F7AC88();
  uint64_t v42 = swift_allocObject();
  *(void *)(v42 + 16) = v27;
  int v101 = sub_226F75564;
  uint64_t v102 = v42;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v98 = 1107296256;
  uint64_t v99 = sub_226F42574;
  uint64_t v100 = &block_descriptor_30_0;
  uint64_t v43 = _Block_copy(&aBlock);
  unint64_t v44 = (char *)v27;
  swift_release();
  unint64_t v45 = v92;
  sub_226F7AA88();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  uint64_t v46 = sub_226F75450((unint64_t *)&qword_2681620B0, MEMORY[0x263F8F030]);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162720);
  unint64_t v48 = sub_226F4671C();
  uint64_t v86 = (void *)v47;
  unint64_t v85 = v48;
  uint64_t v87 = v46;
  sub_226F7ACF8();
  MEMORY[0x22A66F0C0](0, v45, v39, v43);
  _Block_release(v43);

  uint64_t v51 = *(void (**)(char *, uint64_t))(v38 + 8);
  uint64_t v50 = v38 + 8;
  int64_t v49 = v51;
  v51(v39, v37);
  id v54 = *(void (**)(char *, uint64_t))(v40 + 8);
  uint64_t v52 = v40 + 8;
  uint64_t v53 = v54;
  v54(v45, v93);
  uint64_t v55 = (id *)&v44[OBJC_IVAR____TtC18AXSoundDetectionUI34AXSDNSBaseControllerImplementation_listener];
  swift_beginAccess();
  id v56 = objc_msgSend(*v55, sel_audioFormat);
  if (v56)
  {
    int v57 = v56;
    uint64_t v82 = v53;
    uint64_t v83 = v49;
    uint64_t v94 = v52;
    uint64_t v58 = v44;
    id v59 = v57;
    id v60 = v58;
    id v61 = v59;
    id v62 = sub_226F7AA48();
    os_log_type_t v63 = sub_226F7AC38();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = swift_slowAlloc();
      uint64_t v90 = v50;
      uint64_t v65 = v64;
      unint64_t v81 = (void *)swift_slowAlloc();
      uint64_t v91 = swift_slowAlloc();
      uint64_t aBlock = v91;
      *(_DWORD *)uint64_t v65 = 136315394;
      uint64_t v80 = v65 + 4;
      unint64_t v66 = v60;
      id v67 = objc_msgSend(v66, sel_description);
      uint64_t v68 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v70 = v69;

      uint64_t v95 = sub_226F44310(v68, v70, &aBlock);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v65 + 12) = 2112;
      uint64_t v95 = (uint64_t)v61;
      id v71 = v61;
      uint64_t v37 = v89;
      sub_226F7ACD8();
      uint64_t v72 = v81;
      *unint64_t v81 = v57;

      uint64_t v39 = v88;
      _os_log_impl(&dword_226F20000, v62, v63, "[%s]: Starting detector manager with audio format: %@", (uint8_t *)v65, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v72, -1, -1);
      uint64_t v73 = v91;
      swift_arrayDestroy();
      MEMORY[0x22A66FDC0](v73, -1, -1);
      MEMORY[0x22A66FDC0](v65, -1, -1);
    }
    else
    {
    }
    id v74 = (void *)sub_226F7AC88();
    uint64_t v75 = swift_allocObject();
    *(void *)(v75 + 16) = v60;
    *(void *)(v75 + 24) = v61;
    int v101 = sub_226F75610;
    uint64_t v102 = v75;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v98 = 1107296256;
    uint64_t v99 = sub_226F42574;
    uint64_t v100 = &block_descriptor_36_0;
    uint64_t v76 = _Block_copy(&aBlock);
    uint64_t v77 = v60;
    id v78 = v61;
    swift_release();
    int v79 = v92;
    sub_226F7AA88();
    uint64_t aBlock = MEMORY[0x263F8EE78];
    sub_226F7ACF8();
    MEMORY[0x22A66F0C0](0, v79, v39, v76);
    _Block_release(v76);

    v83(v39, v37);
    v82(v79, v93);
  }
}

void AXSDNSControllerImplementation.receivedObservation(_:forDetector:)(void *a1, void *a2)
{
  uint64_t v3 = v2;
  if (objc_msgSend(a1, sel_detected))
  {
    if (qword_268162050 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_226F7AA58();
    __swift_project_value_buffer(v6, (uint64_t)qword_268162638);
    id v7 = a2;
    id v8 = a1;
    id v9 = v7;
    id v10 = v8;
    id v11 = sub_226F7AA48();
    os_log_type_t v12 = sub_226F7AC28();
    id v13 = &selRef_setDateFormat_;
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v27 = v3;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v28 = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      id v16 = objc_msgSend(v9, sel_soundIdentifier);
      uint64_t v17 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      unint64_t v19 = v18;

      sub_226F44310(v17, v19, &v28);
      sub_226F7ACD8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 12) = 2048;
      objc_msgSend(v10, sel_confidence);
      id v13 = &selRef_setDateFormat_;
      sub_226F7ACD8();

      _os_log_impl(&dword_226F20000, v11, v12, "Detected type: %s at confidence level: %f", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      uint64_t v20 = v15;
      uint64_t v3 = v27;
      MEMORY[0x22A66FDC0](v20, -1, -1);
      MEMORY[0x22A66FDC0](v14, -1, -1);
    }
    else
    {
    }
    id v21 = [v9 v13[72]];
    _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();

    unint64_t v22 = (void *)sub_226F7AAD8();
    swift_bridgeObjectRelease();
    id v23 = (id)AXSDSoundDetectionTypeForIdentifier();

    id v24 = v23;
    objc_msgSend(v10, sel_confidence);
    *(float *)&double v25 = v25;
    AXSDSoundDetectionGenerateUserNotificationForDetectionType(v24, *(float *)&v25);

    uint64_t v26 = self;
    if (objc_msgSend(v26, sel_isInternalInstall)
      && objc_msgSend(self, sel_isEnrolled))
    {
      objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager), sel_saveDetectionResult_, v10);
    }
    if (objc_msgSend(v26, sel_isInternalInstall))
    {
      if (*(void *)(v3 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recentDetections)) {
        AXSDNSControllerImplementation.trackObservation(_:forDetector:)(v10, v9);
      }
    }
  }
}

unint64_t sub_226F74054(uint64_t a1)
{
  uint64_t v2 = sub_226F7ACB8();
  return sub_226F74EB0(a1, v2, (unint64_t *)&qword_268162770);
}

unint64_t sub_226F740A4(uint64_t a1)
{
  uint64_t v2 = sub_226F7ACB8();
  return sub_226F74EB0(a1, v2, &qword_268162778);
}

unint64_t sub_226F740F4(uint64_t a1)
{
  _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
  sub_226F7AFA8();
  sub_226F7AB28();
  uint64_t v2 = sub_226F7AFC8();
  swift_bridgeObjectRelease();
  return sub_226F74FC4(a1, v2);
}

uint64_t sub_226F74188(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162528);
  uint64_t v6 = sub_226F7AEB8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  unint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    id v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_retain();
    }
    uint64_t result = sub_226F7ACB8();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  id v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_226F74460(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268162780);
  uint64_t v6 = sub_226F7AEB8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v32 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v20 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v21 = v20 | (v15 << 6);
      }
      else
      {
        int64_t v22 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v22 >= v12) {
          goto LABEL_33;
        }
        unint64_t v23 = v9[v22];
        ++v15;
        if (!v23)
        {
          int64_t v15 = v22 + 1;
          if (v22 + 1 >= v12) {
            goto LABEL_33;
          }
          unint64_t v23 = v9[v15];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v12)
            {
LABEL_33:
              swift_release();
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v32;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v9 = -1 << v31;
              }
              uint64_t v3 = v32;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v23 = v9[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v15 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_42;
                }
                if (v15 >= v12) {
                  goto LABEL_33;
                }
                unint64_t v23 = v9[v15];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v15 = v24;
          }
        }
LABEL_30:
        unint64_t v11 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v15 << 6);
      }
      uint64_t v29 = *(void **)(*(void *)(v5 + 48) + 8 * v21);
      long long v33 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v21);
      if ((a2 & 1) == 0)
      {
        id v30 = v29;
        swift_retain();
      }
      uint64_t result = sub_226F7ACB8();
      uint64_t v16 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v27 = v18 == v26;
          if (v18 == v26) {
            unint64_t v18 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v13 + 8 * v18);
        }
        while (v28 == -1);
        unint64_t v19 = __clz(__rbit64(~v28)) + (v18 << 6);
      }
      *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(void *)(*(void *)(v7 + 48) + 8 * v19) = v29;
      *(_OWORD *)(*(void *)(v7 + 56) + 16 * v19) = v33;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_226F74734(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268162520);
  char v37 = a2;
  uint64_t v6 = sub_226F7AEB8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v34 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v35) {
          goto LABEL_33;
        }
        unint64_t v23 = v36[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v23 = v36[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v34;
              if (v37)
              {
                uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
                if (v33 >= 64) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v36 = -1 << v33;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v23 = v36[v13];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v24;
          }
        }
LABEL_30:
        unint64_t v10 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = 8 * v21;
      id v30 = *(void **)(*(void *)(v5 + 48) + v29);
      uint64_t v31 = *(void *)(*(void *)(v5 + 56) + v29);
      if ((v37 & 1) == 0)
      {
        id v32 = v30;
        swift_bridgeObjectRetain();
      }
      _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
      sub_226F7AFA8();
      sub_226F7AB28();
      uint64_t v14 = sub_226F7AFC8();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v16 = v14 & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v27 = v17 == v26;
          if (v17 == v26) {
            unint64_t v17 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v17);
        }
        while (v28 == -1);
        unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(void *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 8 * v18;
      *(void *)(*(void *)(v7 + 48) + v19) = v30;
      *(void *)(*(void *)(v7 + 56) + v19) = v31;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

id sub_226F74A54(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_226F74054((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_226F6C95C();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_release();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_226F74188(v12, a3 & 1);
  unint64_t v18 = sub_226F74054((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_226F46D98(0, (unint64_t *)&qword_268162770);
    id result = (id)sub_226F7AF38();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v23;
  return a2;
}

id sub_226F74BC8(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = *v4;
  unint64_t v11 = sub_226F740A4((uint64_t)a3);
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v15 = v10;
  uint64_t v16 = *(void *)(v9 + 24);
  if (v16 >= v14 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_226F6CB08();
LABEL_7:
    unint64_t v17 = (void *)*v5;
    if (v15)
    {
LABEL_8:
      unint64_t v18 = (void *)(v17[7] + 16 * v11);
      id result = (id)swift_release();
      void *v18 = a1;
      v18[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_226F74460(v14, a4 & 1);
  unint64_t v20 = sub_226F740A4((uint64_t)a3);
  if ((v15 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_226F46D98(0, &qword_268162778);
    id result = (id)sub_226F7AF38();
    __break(1u);
    return result;
  }
  unint64_t v11 = v20;
  unint64_t v17 = (void *)*v5;
  if (v15) {
    goto LABEL_8;
  }
LABEL_11:
  v17[(v11 >> 6) + 8] |= 1 << v11;
  *(void *)(v17[6] + 8 * v11) = a3;
  BOOL v22 = (void *)(v17[7] + 16 * v11);
  void *v22 = a1;
  v22[1] = a2;
  uint64_t v23 = v17[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v17[2] = v25;
  return a3;
}

id sub_226F74D4C(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_226F740F4((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_226F6CCC8();
LABEL_7:
    char v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_bridgeObjectRelease();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_226F74734(v12, a3 & 1);
  unint64_t v18 = sub_226F740F4((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    type metadata accessor for AXSDSoundDetectionType();
    id result = (id)sub_226F7AF38();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  char v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v23;
  return a2;
}

unint64_t sub_226F74EB0(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a2 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_226F46D98(0, a3);
    id v7 = *(id *)(*(void *)(v3 + 48) + 8 * i);
    char v8 = sub_226F7ACC8();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v5;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v3 + 48) + 8 * i);
        char v11 = sub_226F7ACC8();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_226F74FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
    uint64_t v8 = v7;
    if (v6 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_226F7AF18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0();
          uint64_t v15 = v14;
          if (v13 == _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0() && v15 == v16) {
            break;
          }
          char v18 = sub_226F7AF18();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_226F7513C(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_226F740F4((uint64_t)a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_226F6CCC8();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = *(void *)(v17 + 8 * v10);
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v21 = 8 * v10;
    *(void *)(v16[6] + v21) = a2;
    *(void *)(v16[7] + v21) = a1;
    uint64_t v22 = v16[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v16[2] = v24;
      id v25 = a2;
      return 0;
    }
    goto LABEL_14;
  }
  sub_226F74734(v13, a3 & 1);
  unint64_t v19 = sub_226F740F4((uint64_t)a2);
  if ((v14 & 1) == (v20 & 1))
  {
    unint64_t v10 = v19;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for AXSDSoundDetectionType();
  uint64_t result = sub_226F7AF38();
  __break(1u);
  return result;
}

id sub_226F7527C(void *a1, void *a2)
{
  *(void *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager] = 0;
  *(void *)&v2[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recentDetections] = 0;
  uint64_t v5 = qword_268162050;
  uint64_t v6 = v2;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_226F7AA58();
  __swift_project_value_buffer(v7, (uint64_t)qword_268162638);
  uint64_t v8 = sub_226F7AA48();
  os_log_type_t v9 = sub_226F7AC38();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v10 = 0;
    _os_log_impl(&dword_226F20000, v8, v9, "Initializing NS Sound Detection Controller", v10, 2u);
    MEMORY[0x22A66FDC0](v10, -1, -1);
  }

  *(void *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager] = a1;
  *(void *)&v6[OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorQueueManager] = a2;
  id v11 = a1;
  id v12 = a2;

  v14.receiver = v6;
  v14.super_class = (Class)type metadata accessor for AXSDNSControllerImplementation();
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t sub_226F753C8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_226F75400()
{
  return sub_226F755B8((SEL *)&selRef_removeAllDetectors);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

id sub_226F75424()
{
  return sub_226F70E94(*(char **)(v0 + 16));
}

uint64_t type metadata accessor for AXSDNSControllerImplementation()
{
  return self;
}

uint64_t sub_226F75450(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id _s18AXSoundDetectionUI30AXSDNSControllerImplementationC14receivedBuffer_2at6isFileySo16AVAudioPCMBufferC_So0K4TimeCSbtF_0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (id *)(v2 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  objc_msgSend(*v5, sel_processAudioBuffer_atTime_, a1, a2);
  id result = objc_msgSend(self, sel_isInternalInstall);
  if (result)
  {
    id result = objc_msgSend(self, sel_isEnrolled);
    if (result) {
      return objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_recordingManager), sel_trackBuffer_atTime_, a1, a2);
    }
  }
  return result;
}

void sub_226F7555C()
{
  sub_226F72480(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

id sub_226F75564()
{
  return sub_226F755B8((SEL *)&selRef_stopDetection);
}

uint64_t sub_226F75570()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_226F755B0()
{
  sub_226F73048(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

id sub_226F755B8(SEL *a1)
{
  uint64_t v3 = (id *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  return [*v3 *a1];
}

id sub_226F75610()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = (id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  return objc_msgSend(*v2, sel_startDetectionWithFormat_, v1);
}

void _s18AXSoundDetectionUI30AXSDNSControllerImplementationC18receivedCompletionyySo20SNDetectSoundRequestCF_0(void *a1)
{
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_226F7AA58();
  __swift_project_value_buffer(v2, (uint64_t)qword_268162638);
  id v8 = a1;
  uint64_t v3 = sub_226F7AA48();
  os_log_type_t v4 = sub_226F7AC38();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    id v7 = v8;
    sub_226F7ACD8();
    *uint64_t v6 = v8;

    _os_log_impl(&dword_226F20000, v3, v4, "Received completion for request: %@", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v6, -1, -1);
    MEMORY[0x22A66FDC0](v5, -1, -1);
  }
  else
  {
  }
}

void _s18AXSoundDetectionUI30AXSDNSControllerImplementationC13receivedError_12fromDetectorys0G0_p_So20SNDetectSoundRequestCtF_0(void *a1, void *a2)
{
  if (qword_268162050 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_226F7AA58();
  __swift_project_value_buffer(v4, (uint64_t)qword_268162638);
  id v5 = a2;
  id v6 = a1;
  id v7 = v5;
  id v8 = a1;
  osos_log_t log = sub_226F7AA48();
  os_log_type_t v9 = sub_226F7AC48();
  if (os_log_type_enabled(oslog, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    id v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412546;
    id v12 = v7;
    sub_226F7ACD8();
    void *v11 = v7;

    *(_WORD *)(v10 + 12) = 2112;
    id v13 = a1;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    sub_226F7ACD8();
    v11[1] = v15;

    _os_log_impl(&dword_226F20000, oslog, v9, "Received error for request: %@ - error: %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681620C8);
    swift_arrayDestroy();
    MEMORY[0x22A66FDC0](v11, -1, -1);
    MEMORY[0x22A66FDC0](v10, -1, -1);
  }
  else
  {
  }
}

id sub_226F75A78@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC18AXSoundDetectionUI30AXSDNSControllerImplementation_detectorManager);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for AXSDNSControllerImplementation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AXSDNSControllerImplementation);
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.detectorManager.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.detectorManager.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.detectorManager.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.currentDetectionTypes.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.__allocating_init(detectorManager:queueManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.add(listenType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.remove(listenType:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AXSDNSControllerImplementation.removeAllListenTypes()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t __getAXSettingsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXSDDetectorStore addObserver:](v0);
}

void AXSDSoundDetectionGenerateUserNotificationForDetectionType_cold_1(uint64_t a1, NSObject *a2, float a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_226F20000, a2, OS_LOG_TYPE_DEBUG, "Requesting send notification for detection: %@ w/ confidence %f", (uint8_t *)&v3, 0x16u);
}

void AXSDSoundDetectionGenerateUserNotificationForDetectionType_cold_2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_226F20000, v1, OS_LOG_TYPE_FAULT, "Asked to send notification for type %{public}@, but it's not in the list of detectors %@", v2, 0x16u);
}

void _SoundDetectionSendNotificationForCustomDetector_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_226F20000, log, OS_LOG_TYPE_ERROR, "Unable to send notification since detector is nil", v1, 2u);
}

void _SoundDetectionSendNotificationForCustomDetector_cold_2(void *a1)
{
  uint64_t v2 = [a1 name];
  __int16 v3 = [a1 identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_226F20000, v4, v5, "Requesting send notification for detector: %@ %@", v6, v7, v8, v9, v10);
}

void AXSDSoundDetectionSendKShotModelFailedNotification_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_226F20000, v0, OS_LOG_TYPE_DEBUG, "Requesting send notification for detector: %@", v1, 0xCu);
}

void AXSDKShotGatherFilesAndGenerateRadarForDetector_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_226F20000, v0, OS_LOG_TYPE_FAULT, "no detector identifier! %@", v1, 0xCu);
}

uint64_t __getAXEventRepresentationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getAXEventTapManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getAXEventTapManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXSDKShotDetector mlModel](v0);
}

#error "226F79FE0: call analysis failed (funcsize=36)"

#error "226F7A0F8: call analysis failed (funcsize=36)"

#error "226F7A254: call analysis failed (funcsize=36)"

#error "226F7A36C: call analysis failed (funcsize=36)"

#error "226F7A748: call analysis failed (funcsize=39)"

#error "226F7A7EC: call analysis failed (funcsize=39)"

uint64_t sub_226F7A828()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_226F7A838()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_226F7A848()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_226F7A858()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_226F7A868()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_226F7A878()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_226F7A888()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_226F7A898()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_226F7A8A8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_226F7A8B8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_226F7A8C8()
{
  return MEMORY[0x270EF0BE8]();
}

uint64_t sub_226F7A8D8()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_226F7A8E8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_226F7A8F8()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_226F7A908()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_226F7A918()
{
  return MEMORY[0x270EF0C70]();
}

uint64_t sub_226F7A928()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_226F7A938()
{
  return MEMORY[0x270EFE0F0]();
}

uint64_t sub_226F7A948()
{
  return MEMORY[0x270EFE0F8]();
}

uint64_t sub_226F7A958()
{
  return MEMORY[0x270EFE100]();
}

uint64_t sub_226F7A968()
{
  return MEMORY[0x270EFE108]();
}

uint64_t sub_226F7A978()
{
  return MEMORY[0x270EFE110]();
}

uint64_t sub_226F7A988()
{
  return MEMORY[0x270EFE118]();
}

uint64_t sub_226F7A998()
{
  return MEMORY[0x270EFE120]();
}

uint64_t sub_226F7A9A8()
{
  return MEMORY[0x270EFE128]();
}

uint64_t sub_226F7A9B8()
{
  return MEMORY[0x270EFE130]();
}

uint64_t sub_226F7A9C8()
{
  return MEMORY[0x270EFE138]();
}

uint64_t sub_226F7A9D8()
{
  return MEMORY[0x270EFE140]();
}

uint64_t sub_226F7A9E8()
{
  return MEMORY[0x270EFE148]();
}

uint64_t sub_226F7A9F8()
{
  return MEMORY[0x270EFE150]();
}

uint64_t sub_226F7AA08()
{
  return MEMORY[0x270EFE158]();
}

uint64_t sub_226F7AA18()
{
  return MEMORY[0x270EFE160]();
}

uint64_t sub_226F7AA48()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_226F7AA58()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_226F7AA68()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_226F7AA78()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_226F7AA88()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_226F7AA98()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_226F7AAA8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_226F7AAB8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_226F7AAC8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_226F7AAD8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_226F7AAE8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_226F7AAF8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t _sSo22AXSDSoundDetectionTypea07AXSoundB2UIE11descriptionSSvg_0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_226F7AB18()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_226F7AB28()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_226F7AB38()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_226F7AB48()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_226F7AB58()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_226F7AB68()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_226F7AB78()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_226F7AB88()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_226F7AB98()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_226F7ABB8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_226F7ABC8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_226F7ABD8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_226F7ABE8()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_226F7ABF8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_226F7AC08()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_226F7AC18()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_226F7AC28()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_226F7AC38()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_226F7AC48()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_226F7AC58()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_226F7AC68()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_226F7AC78()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_226F7AC88()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_226F7AC98()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_226F7ACA8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_226F7ACB8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_226F7ACC8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_226F7ACD8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_226F7ACE8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_226F7ACF8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_226F7AD08()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_226F7AD18()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_226F7AD28()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_226F7AD38()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_226F7AD48()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_226F7AD68()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_226F7AD78()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_226F7AD88()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_226F7AD98()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_226F7ADA8()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_226F7ADB8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_226F7ADC8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_226F7ADD8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_226F7ADE8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_226F7ADF8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_226F7AE08()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_226F7AE18()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_226F7AE28()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_226F7AE38()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_226F7AE48()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_226F7AE58()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_226F7AE68()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_226F7AE78()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_226F7AE88()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_226F7AE98()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_226F7AEA8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_226F7AEB8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_226F7AEC8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_226F7AED8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_226F7AEF8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_226F7AF08()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_226F7AF18()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_226F7AF28()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_226F7AF38()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_226F7AF48()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_226F7AF68()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_226F7AF78()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_226F7AF88()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_226F7AF98()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_226F7AFA8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_226F7AFB8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_226F7AFC8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AXIsSoundDetectionMedinaSupportEnabled()
{
  return MEMORY[0x270F099E0]();
}

uint64_t AXLogSoundActions()
{
  return MEMORY[0x270F09378]();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x270F093E0]();
}

uint64_t AXLogUltronKShot()
{
  return MEMORY[0x270F093E8]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F09428]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

uint64_t AXSDIsConnectedToCarPlay()
{
  return MEMORY[0x270F099E8]();
}

uint64_t AXSDSoundDetectionBundle()
{
  return MEMORY[0x270F099F0]();
}

uint64_t AXSDSoundDetectionCategories()
{
  return MEMORY[0x270F099F8]();
}

uint64_t AXSDSoundDetectionLocalizedStringForType()
{
  return MEMORY[0x270F09A08]();
}

uint64_t AXSDSoundDetectionLocalizedTitleForType()
{
  return MEMORY[0x270F09A10]();
}

uint64_t AXSDSoundDetectionTypeForIdentifier()
{
  return MEMORY[0x270F09A18]();
}

uint64_t AXSDSoundDetectionTypesForCategory()
{
  return MEMORY[0x270F09A20]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

uint64_t _AXAssertIsMainThread()
{
  return MEMORY[0x270F095E0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint64_t bmTypeForSoundDetectionType()
{
  return MEMORY[0x270F09A28]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x270FA2470]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}