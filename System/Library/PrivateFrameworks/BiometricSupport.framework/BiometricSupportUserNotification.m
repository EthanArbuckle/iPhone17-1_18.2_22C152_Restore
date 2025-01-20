@interface BiometricSupportUserNotification
+ (BOOL)didDisplayPearlGlassesBannerNotificationRecently:(double)a3;
+ (BOOL)displayPearlGlassesBannerNotification;
+ (void)displayPearlInterlockIssueNotification:(BOOL)a3;
+ (void)displayPearlIssueNotification;
+ (void)displaySensorIssueNotificationWithHeader:(id)a3 message:(id)a4 button:(id)a5;
+ (void)displayStopAlertWithHeader:(id)a3 andMessage:(id)a4;
+ (void)displayTouchIDIssueNotification;
@end

@implementation BiometricSupportUserNotification

+ (void)displayTouchIDIssueNotification
{
  id v8 = (id)MGCopyAnswer();
  v3 = +[BKLocalization getLocalizedString:@"TOUCH_ID_ISSUE_NOTIFICATION_TITLE"];
  v4 = [v8 uppercaseString];
  v5 = [@"TOUCH_ID_ISSUE_NOTIFICATION_TEXT_" stringByAppendingString:v4];
  v6 = +[BKLocalization getLocalizedString:v5];
  v7 = +[BKLocalization getLocalizedString:@"TOUCH_ID_ISSUE_NOTIFICATION_CONFIRM"];
  [a1 displaySensorIssueNotificationWithHeader:v3 message:v6 button:v7];
}

+ (void)displayPearlIssueNotification
{
  id v8 = (id)MGCopyAnswer();
  v3 = +[BKLocalization getLocalizedString:@"FACE_ID_ISSUE_NOTIFICATION_TITLE"];
  v4 = [v8 uppercaseString];
  v5 = [@"FACE_ID_ISSUE_NOTIFICATION_TEXT_" stringByAppendingString:v4];
  v6 = +[BKLocalization getLocalizedString:v5];
  v7 = +[BKLocalization getLocalizedString:@"FACE_ID_ISSUE_NOTIFICATION_CONFIRM"];
  [a1 displaySensorIssueNotificationWithHeader:v3 message:v6 button:v7];
}

+ (void)displayPearlInterlockIssueNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = &_os_log_internal;
  if (__osLogTrace) {
    v5 = __osLogTrace;
  }
  else {
    v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEFAULT, "postPearlInterlockFollowUpItem\n", (uint8_t *)&v21, 2u);
  }
  uint64_t v6 = displayPearlInterlockIssueNotification__count;
  if (displayPearlInterlockIssueNotification__count == -1)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.BiometricKit"];
    uint64_t v6 = [v7 countOfPendingFollowUpItems:0];
    displayPearlInterlockIssueNotification__count = v6;
    if (!v3)
    {
LABEL_17:
      int v18 = 1;
      if (v3 || v6 < 1)
      {
        id v8 = v7;
      }
      else
      {
        id v8 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.BiometricKit"];

        if (__osLog) {
          v19 = __osLog;
        }
        else {
          v19 = v4;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_21FFF3000, v19, OS_LOG_TYPE_DEFAULT, "Clearing item\n", (uint8_t *)&v21, 2u);
        }
        int v18 = [v8 clearPendingFollowUpItems:0];
        displayPearlInterlockIssueNotification__count = [v8 countOfPendingFollowUpItems:0];
      }
      goto LABEL_26;
    }
  }
  else
  {
    v7 = 0;
    if (!v3) {
      goto LABEL_17;
    }
  }
  if (v6) {
    goto LABEL_17;
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.BiometricKit"];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10 = [NSURL URLWithString:@"https://support.apple.com/HT208186?cid=iOS_SettingsUI_iphone_article_HT208186"];
  v11 = (void *)MEMORY[0x263F35378];
  v12 = +[BKLocalization getLocalizedString:@"FACE_ID_INTERLOCK_ACTION"];
  v13 = [v11 actionWithLabel:v12 url:v10];

  [v9 addObject:v13];
  id v14 = objc_alloc_init(MEMORY[0x263F35388]);
  [v14 setUniqueIdentifier:@"com.apple.faceid.CamInterlockError"];
  v15 = +[BKLocalization getLocalizedString:@"FACE_ID_INTERLOCK_TITLE"];
  [v14 setTitle:v15];

  v16 = +[BKLocalization getLocalizedString:@"FACE_ID_INTERLOCK_INFORMATIVE_TEXT"];
  [v14 setInformativeText:v16];

  [v14 setActions:v9];
  if (__osLog) {
    v17 = __osLog;
  }
  else {
    v17 = v4;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    id v22 = v14;
    _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_DEFAULT, "Posting item: %@\n", (uint8_t *)&v21, 0xCu);
  }
  int v18 = [v8 postFollowUpItem:v14 error:0];
  displayPearlInterlockIssueNotification__count = [v8 countOfPendingFollowUpItems:0];

LABEL_26:
  if (__osLogTrace) {
    v20 = __osLogTrace;
  }
  else {
    v20 = v4;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 67109120;
    LODWORD(v22) = v18;
    _os_log_impl(&dword_21FFF3000, v20, OS_LOG_TYPE_DEFAULT, "postPearlInterlockFollowUpItem -> %d\n", (uint8_t *)&v21, 8u);
  }
}

+ (BOOL)displayPearlGlassesBannerNotification
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = &_os_log_internal;
  if (__osLogTrace) {
    BOOL v3 = __osLogTrace;
  }
  else {
    BOOL v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEFAULT, "displayPearlGlassesBannerNotification\n", (uint8_t *)&v18, 2u);
  }
  v4 = [MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:@"/tmp/biokit_glasses_banner_notification"];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
    char v7 = [v6 createFileAtPath:@"/tmp/biokit_glasses_banner_notification" contents:0 attributes:0];

    if ((v7 & 1) == 0)
    {
      id v8 = (__osLog ? __osLog : v2);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412290;
        v19 = @"/tmp/biokit_glasses_banner_notification";
        _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "displayPearlGlassesBannerNotification: cannot create mark file %@\n", (uint8_t *)&v18, 0xCu);
      }
    }
    id v9 = objc_alloc_init(MEMORY[0x263F1DEF0]);
    v10 = +[BKLocalization getLocalizedString:@"FACE_ID_GLASSES_BANNER_TITLE" fromFile:@"biometrickitd-Periocular"];
    [v9 setTitle:v10];

    v11 = +[BKLocalization getLocalizedString:@"FACE_ID_GLASSES_BANNER_BODY" fromFile:@"biometrickitd-Periocular"];
    [v9 setBody:v11];

    v12 = [NSURL URLWithString:@"prefs:root=TOUCHID_PASSCODE"];
    [v9 setDefaultActionURL:v12];

    v13 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"com.apple.BiometricKit.GlassesBanner" content:v9 trigger:0 destinations:1];
    id v14 = (void *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.Preferences"];
    [v14 addNotificationRequest:v13 withCompletionHandler:&__block_literal_global_0];
  }
  int v15 = v5 ^ 1;
  if (__osLogTrace) {
    v16 = __osLogTrace;
  }
  else {
    v16 = v2;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 67109120;
    LODWORD(v19) = v15;
    _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_DEFAULT, "displayPearlGlassesBannerNotification -> %d\n", (uint8_t *)&v18, 8u);
  }
  return v15;
}

void __73__BiometricSupportUserNotification_displayPearlGlassesBannerNotification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (__osLog) {
    BOOL v3 = __osLog;
  }
  else {
    BOOL v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_INFO, "displayPearlGlassesBannerNotification addNotificationRequest callback, error = %@\n", (uint8_t *)&v4, 0xCu);
  }
}

+ (BOOL)didDisplayPearlGlassesBannerNotificationRecently:(double)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v4 = &_os_log_internal;
  if (__osLogTrace) {
    id v5 = __osLogTrace;
  }
  else {
    id v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    double v19 = a3;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_DEFAULT, "didDisplayPearlGlassesBannerNotificationRecently:%f\n", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  char v7 = [v6 attributesOfItemAtPath:@"/tmp/biokit_glasses_banner_notification" error:0];
  if (v7)
  {
    if (__osLog) {
      id v8 = __osLog;
    }
    else {
      id v8 = v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEBUG, "Glasses banner markfile found, attributes retrieved\n", (uint8_t *)&v18, 2u);
    }
    id v9 = [v7 fileCreationDate];
    v10 = v9;
    if (v9)
    {
      [v9 timeIntervalSinceNow];
      double v12 = -v11;
      if (__osLog) {
        v13 = __osLog;
      }
      else {
        v13 = v4;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v18 = 134217984;
        double v19 = v12;
        _os_log_impl(&dword_21FFF3000, v13, OS_LOG_TYPE_INFO, "Glasses banner mark file age is %f\n", (uint8_t *)&v18, 0xCu);
      }
      BOOL v14 = v12 < a3;
    }
    else
    {
      if (__osLog) {
        int v15 = __osLog;
      }
      else {
        int v15 = v4;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_ERROR, "Cannot get glasses banner markfile creation date\n", (uint8_t *)&v18, 2u);
      }
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  if (__osLogTrace) {
    v16 = __osLogTrace;
  }
  else {
    v16 = v4;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 67109120;
    LODWORD(v19) = v14;
    _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_DEFAULT, "didDisplayPearlGlassesBannerNotificationRecently -> %d\n", (uint8_t *)&v18, 8u);
  }

  return v14;
}

+ (void)displaySensorIssueNotificationWithHeader:(id)a3 message:(id)a4 button:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263F08850] defaultManager];
  char v11 = [v10 fileExistsAtPath:@"/tmp/biokit_hw_issue_notification"];

  if ((v11 & 1) == 0)
  {
    double v12 = [MEMORY[0x263F08850] defaultManager];
    [v12 createFileAtPath:@"/tmp/biokit_hw_issue_notification" contents:0 attributes:0];

    v13 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__BiometricSupportUserNotification_displaySensorIssueNotificationWithHeader_message_button___block_invoke;
    block[3] = &unk_26454E560;
    id v15 = v7;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v13, block);
  }
}

void __92__BiometricSupportUserNotification_displaySensorIssueNotificationWithHeader_message_button___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  SInt32 error = 0;
  CFOptionFlags responseFlags = 0;
  uint64_t v1 = *MEMORY[0x263EFFFC8];
  long long v12 = *(_OWORD *)(a1 + 32);
  uint64_t v2 = *MEMORY[0x263EFFFD8];
  v11[0] = v1;
  v11[1] = v2;
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *MEMORY[0x263EFFFE0];
  v11[2] = *MEMORY[0x263F00000];
  v11[3] = v4;
  uint64_t v13 = v3;
  uint64_t v14 = MEMORY[0x263EFFA88];
  uint64_t v5 = *MEMORY[0x263F795C0];
  v11[4] = *MEMORY[0x263F79628];
  v11[5] = v5;
  uint64_t v15 = MEMORY[0x263EFFA88];
  uint64_t v16 = MEMORY[0x263EFFA80];
  CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:&v12 forKeys:v11 count:6];
  id v7 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, &error, v6);
  if (v7)
  {
    id v8 = v7;
    CFUserNotificationReceiveResponse(v7, 0.0, &responseFlags);
    CFRelease(v8);
  }
}

+ (void)displayStopAlertWithHeader:(id)a3 andMessage:(id)a4
{
}

@end