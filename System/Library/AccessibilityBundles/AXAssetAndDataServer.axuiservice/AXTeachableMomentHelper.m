@interface AXTeachableMomentHelper
+ (id)_preferencesURLSubpathForFeature:(id)a3;
+ (id)notificationCenter;
+ (void)_sendUserNotification:(id)a3 title:(id)a4 message:(id)a5 threadIdentifier:(id)a6 teachableItems:(id)a7 feature:(id)a8;
+ (void)handleTeachableMomentsNotifications;
@end

@implementation AXTeachableMomentHelper

+ (void)handleTeachableMomentsNotifications
{
  v2 = +[NSMutableArray array];
  if (_AXSVoiceOverTouchEnabled()) {
    [v2 addObject:AXTeachableFeatureVoiceOver];
  }
  if (_AXSVoiceOverTouchEnabled())
  {
    v3 = +[AXSettings sharedInstance];
    v4 = [v3 voiceOverBrailleDisplays];
    if ([v4 count])
    {
    }
    else
    {
      v5 = +[AXSettings sharedInstance];
      unsigned int v6 = [v5 voiceOverBrailleGesturesEnabled];

      if (!v6) {
        goto LABEL_8;
      }
    }
    [v2 addObject:AXTeachableFeatureBraille];
  }
LABEL_8:
  if (UIAccessibilityIsSwitchControlRunning()) {
    [v2 addObject:AXTeachableFeatureSwitchControl];
  }
  if (_AXSAssistiveTouchEnabled()) {
    [v2 addObject:AXTeachableFeatureAssistiveTouch];
  }
  if (_AXSHoverTextEnabled()) {
    [v2 addObject:AXTeachableFeatureHoverText];
  }
  if (_AXSClarityUIEnabled()) {
    [v2 addObject:AXTeachableFeatureAssistiveAccess];
  }
  v7 = (const void *)_AXSTripleClickCopyOptions();
  int v8 = _AXSTripleClickContainsOption();
  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    [v2 addObject:AXTeachableFeatureLiveSpeech];
  }
  v9 = AXLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v2;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "TeachableMoment: Checking for teachable moments: %@", buf, 0xCu);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v2;
  id v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (+[AXTeachableMomentsManager teachableMomentSeenForNotification:v14])
        {
          v15 = AXLogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v14;
            _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "TeachableMoment: Already saw notification for: %@", buf, 0xCu);
          }
        }
        else
        {
          v15 = +[AXTeachableMomentsManager teachableItemsForFeature:v14];
          if ([v15 count])
          {
            v16 = +[AXTeachableMomentsManager notificationTitleForFeature:v14];
            v17 = +[AXTeachableMomentsManager summaryForFeature:v14];
            v18 = [a1 notificationCenter];
            v19 = AXLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "TeachableMoment: Checking authorization", buf, 2u);
            }

            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_5088;
            v25[3] = &unk_10478;
            id v31 = a1;
            id v26 = v18;
            id v27 = v16;
            id v28 = v17;
            v29 = v14;
            v30 = v15;
            id v20 = v17;
            id v21 = v16;
            v22 = v18;
            [v22 requestAuthorizationWithOptions:32 completionHandler:v25];
          }
          else
          {
            v22 = AXLogCommon();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v14;
              _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "TeachableMoment: No items for %@", buf, 0xCu);
            }
          }
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v11);
  }
}

+ (id)notificationCenter
{
  v2 = (void *)qword_15A70;
  if (!qword_15A70)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v3 = (void *)qword_15A78;
    uint64_t v21 = qword_15A78;
    if (!qword_15A78)
    {
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      v15 = sub_59C0;
      v16 = &unk_104C8;
      v17 = &v18;
      sub_59C0((uint64_t)&v13);
      v3 = (void *)v19[3];
    }
    v4 = v3;
    _Block_object_dispose(&v18, 8);
    id v5 = [[v4 alloc] initWithBundleIdentifier:@"com.apple.accessibility.TeachableMomentsNotifications"];
    unsigned int v6 = (void *)qword_15A70;
    qword_15A70 = (uint64_t)v5;

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v7 = (void *)qword_15A88;
    uint64_t v21 = qword_15A88;
    if (!qword_15A88)
    {
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      v15 = sub_5B88;
      v16 = &unk_104C8;
      v17 = &v18;
      sub_5B88((uint64_t)&v13);
      v7 = (void *)v19[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v18, 8);
    v9 = [v8 categoryWithIdentifier:@"com.apple.accessibility.TeachableMomentsNotifications.message" actions:&__NSArray0__struct intentIdentifiers:&__NSArray0__struct options:0];
    id v10 = (void *)qword_15A70;
    id v11 = +[NSSet setWithObject:v9];
    [v10 setNotificationCategories:v11];

    v2 = (void *)qword_15A70;
  }

  return v2;
}

+ (id)_preferencesURLSubpathForFeature:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:AXTeachableFeatureVoiceOver])
  {
    CFStringRef v4 = @"VOICEOVER_TITLE";
  }
  else if ([v3 isEqualToString:AXTeachableFeatureBraille])
  {
    CFStringRef v4 = @"VOICEOVER_TITLE/Braille#Braille";
  }
  else if ([v3 isEqualToString:AXTeachableFeatureSwitchControl])
  {
    CFStringRef v4 = @"ScannerSwitchTitle";
  }
  else if ([v3 isEqualToString:AXTeachableFeatureAssistiveTouch])
  {
    CFStringRef v4 = @"TOUCH_REACHABILITY_TITLE/AIR_TOUCH_TITLE";
  }
  else if ([v3 isEqualToString:AXTeachableFeatureAssistiveAccess])
  {
    CFStringRef v4 = @"CLARITY_UI_TITLE";
  }
  else if ([v3 isEqualToString:AXTeachableFeatureLiveSpeech])
  {
    CFStringRef v4 = @"LIVE_SPEECH_TITLE";
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return (id)v4;
}

+ (void)_sendUserNotification:(id)a3 title:(id)a4 message:(id)a5 threadIdentifier:(id)a6 teachableItems:(id)a7 feature:(id)a8
{
  id v33 = a3;
  id v14 = a4;
  id v35 = a5;
  id v34 = a6;
  id v15 = a7;
  id v16 = a8;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v17 = (void *)qword_15A90;
  uint64_t v40 = qword_15A90;
  if (!qword_15A90)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v44 = sub_5BE0;
    v45 = &unk_104C8;
    v46 = &v37;
    sub_5BE0((uint64_t)&buf);
    v17 = (void *)v38[3];
  }
  id v18 = v17;
  _Block_object_dispose(&v37, 8);
  v19 = objc_opt_new();
  [v19 setBody:v35];
  [v19 setCategoryIdentifier:@"com.apple.accessibility.TeachableMomentsNotifications.message"];
  [v19 setTitle:v14];
  [v19 setThreadIdentifier:v34];
  [v19 setShouldSuppressDefaultAction:0];
  [v19 setShouldAuthenticateDefaultAction:0];
  uint64_t v20 = [a1 _preferencesURLSubpathForFeature:v16];
  if ([v20 length])
  {
    [@"prefs:root=ACCESSIBILITY" stringByAppendingFormat:@"&path=%@", v20];
    uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v21 = @"prefs:root=ACCESSIBILITY";
  }
  v22 = +[NSURL URLWithString:v21];
  [v19 setDefaultActionURL:v22];

  v23 = +[NSKeyedArchiver archivedDataWithRootObject:v15 requiringSecureCoding:1 error:0];
  v41[0] = @"title";
  v41[1] = @"teachableItems";
  v42[0] = v14;
  v42[1] = v23;
  v24 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
  [v19 setUserInfo:v24];

  v25 = +[NSDate date];
  id v26 = [v25 dateByAddingTimeInterval:604800.0];
  [v19 setExpirationDate:v26];

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  id v27 = (void *)qword_15A98;
  uint64_t v40 = qword_15A98;
  if (!qword_15A98)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v44 = sub_5C38;
    v45 = &unk_104C8;
    v46 = &v37;
    sub_5C38((uint64_t)&buf);
    id v27 = (void *)v38[3];
  }
  id v28 = v27;
  _Block_object_dispose(&v37, 8);
  v29 = +[NSUUID UUID];
  v30 = [v29 UUIDString];
  id v31 = [v28 requestWithIdentifier:v30 content:v19 trigger:0];

  long long v32 = AXLogCommon();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v31;
    _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "TeachableMoments: Posting local notification: %@", (uint8_t *)&buf, 0xCu);
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_5950;
  v36[3] = &unk_104A0;
  v36[4] = v16;
  [v33 addNotificationRequest:v31 withCompletionHandler:v36];
}

@end