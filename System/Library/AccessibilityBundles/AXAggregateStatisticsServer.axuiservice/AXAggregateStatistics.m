@interface AXAggregateStatistics
+ (void)runStatistics;
- (AXAggregateStatistics)init;
- (OS_dispatch_queue)queue;
- (id)globalDevicePreferences;
- (void)_logAdaptiveVoiceShortcutsStatistics;
- (void)_logAssistiveTouchMouseStatistics;
- (void)_logBackTapStatistics;
- (void)_logCameraButtonStatistics;
- (void)_logCommandAndControlStatistics;
- (void)_logCommonStatistics;
- (void)_logCustomSoundDetectionCustomTonesHaptics;
- (void)_logLaserAXStatistics;
- (void)_logMagnifierStatistics;
- (void)_logPerAppStatistics;
- (void)_logSideButtonClickSpeed;
- (void)_logSoundDetectionCustomTonesHaptics;
- (void)_logStatistics;
- (void)_logTextSizes;
- (void)_logVoiceTriggerStatistics;
- (void)_logiOSStatistics;
- (void)_startLogging;
- (void)_updateCommandAndControlPurgability;
- (void)setQueue:(id)a3;
@end

@implementation AXAggregateStatistics

- (void)_logSoundDetectionCustomTonesHaptics
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = +[AXSDSettings sharedInstance];
  v3 = [v2 supportedSoundDetectionTypes];

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v9 = +[AXSDSettings sharedInstance];
        [v9 hasCustomToneForDetector:v8];

        v10 = +[AXSDSettings sharedInstance];
        [v10 hasCustomHapticForDetector:v8];

        AnalyticsSendEventLazy();
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_logPerAppStatistics
{
  v2 = +[AXSettings sharedInstance];
  v3 = [v2 perAppSettingsStats];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  id v5 = (char *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = v4;
        AnalyticsSendEventLazy();
      }
      uint64_t v6 = (char *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v10, v14, 16, _NSConcreteStackBlock, 3221225472, sub_98F0, &unk_18948);
    }
    while (v6);
  }
}

- (void)_logTextSizes
{
  if (qword_20E60 != -1) {
    dispatch_once(&qword_20E60, &stru_18EB0);
  }
  CFStringRef v2 = (const __CFString *)[(id)AXCPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
  v3 = (__CFString *)CFPreferencesCopyAppValue(@"UIPreferredContentSizeCategoryName", v2);
  if (v3) {
    CFStringRef v4 = v3;
  }
  else {
    CFStringRef v4 = @"UICTContentSizeCategoryL";
  }
  [(id)qword_20E58 indexOfObject:v4];
  if (([(__CFString *)v3 isEqualToString:@"UICTContentSizeCategoryAccessibilityM"] & 1) == 0&& ([(__CFString *)v3 isEqualToString:@"UICTContentSizeCategoryAccessibilityL"] & 1) == 0&& ([(__CFString *)v3 isEqualToString:@"UICTContentSizeCategoryAccessibilityXL"] & 1) == 0&& ([(__CFString *)v3 isEqualToString:@"UICTContentSizeCategoryAccessibilityXXL"] & 1) == 0)
  {
    [(__CFString *)v3 isEqualToString:@"UICTContentSizeCategoryAccessibilityXXXL"];
  }
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
}

- (void)_logCustomSoundDetectionCustomTonesHaptics
{
  CFStringRef v2 = +[AXSDSettings sharedInstance];
  v3 = [v2 decodedKShotDetectors];
  CFStringRef v4 = [v3 allValues];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = v4;
  id obj = [v4 axFilterObjectsUsingBlock:&stru_18760];
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v10 = [v9 category];
        long long v11 = +[AXSDSettings sharedInstance];
        [v11 hasCustomToneForKshotDetector:v9];

        long long v12 = +[AXSDSettings sharedInstance];
        [v12 hasCustomHapticForKshotDetector:v9];

        id v13 = v10;
        AnalyticsSendEventLazy();
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)_updateCommandAndControlPurgability
{
  CFStringRef v2 = AXLogAggregate();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CommandAndControl Purgability updating", (uint8_t *)&buf, 2u);
  }

  CFStringRef v3 = (const __CFString *)_AXSAccessibilityPreferenceDomain();
  CFStringRef v4 = (void *)CFPreferencesCopyAppValue(@"LastPurgabilityUpdate", v3);
  if (v4)
  {
    id v5 = AXLogAggregate();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "CommandAndControl Purgability was last set non-purgable at %@", (uint8_t *)&buf, 0xCu);
    }

    id v6 = +[NSDate date];
    [v6 timeIntervalSinceDate:v4];
    double v8 = v7;

    Boolean keyExistsAndHasValidFormat = 0;
    CFStringRef v9 = (const __CFString *)_AXSAccessibilityPreferenceDomain();
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"AutomationDaysToPreventVoiceControlPurging", v9, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      CFIndex v11 = AppIntegerValue;
      long long v12 = AXLogAggregate();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "CommandAndControl Purgability Using automation override timeout of %ld days", (uint8_t *)&buf, 0xCu);
      }

      double v13 = (double)(unint64_t)(86400000000000 * v11);
    }
    else
    {
      double v13 = 2.592e15;
    }
    if (v8 > v13)
    {
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      long long v14 = (void (*)(void, uint64_t, void *))off_20E80;
      v21 = off_20E80;
      if (!off_20E80)
      {
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v23 = sub_103BC;
        v24 = &unk_19758;
        v25 = &v18;
        sub_103BC((uint64_t)&buf);
        long long v14 = (void (*)(void, uint64_t, void *))v19[3];
      }
      _Block_object_dispose(&v18, 8);
      if (!v14)
      {
        sub_10A6C();
        __break(1u);
      }
      v14(0, 1936617575, &__NSArray0__struct);
      CFStringRef v15 = (const __CFString *)_AXSAccessibilityPreferenceDomain();
      CFPreferencesSetValue(@"LastPurgabilityUpdate", 0, v15, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
      long long v16 = AXLogAggregate();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "CommandAndControl assets have been marked as purgable", (uint8_t *)&buf, 2u);
      }
    }
  }
}

- (void)_logBackTapStatistics
{
  CFStringRef v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 backTapEnabled];

  if (v3)
  {
    CFStringRef v4 = +[AXSettings sharedInstance];
    id v5 = [v4 backTapDoubleTapAction];
    BOOL v6 = v5 != 0;

    double v7 = +[AXSettings sharedInstance];
    double v8 = [v7 backTapTripleTapAction];
    BOOL v9 = v8 != 0;

    long long v10 = @"System";
  }
  else
  {
    BOOL v9 = 0;
    BOOL v6 = 0;
    long long v10 = &stru_19DD8;
  }
  v38 = +[NSMutableArray array];
  if (v6)
  {
    CFIndex v11 = +[AXSettings sharedInstance];
    long long v12 = [v11 backTapDoubleTapAction];
    [v38 addObject:v12];
  }
  if (v9)
  {
    double v13 = +[AXSettings sharedInstance];
    long long v14 = [v13 backTapTripleTapAction];
    [v38 addObject:v14];
  }
  if (_AXSAssistiveTouchScannerEnabled())
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v58 = 0x2020000000;
    char v59 = 0;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2020000000;
    char v55 = 0;
    CFStringRef v15 = +[AXSettings sharedInstance];
    long long v16 = [v15 assistiveTouchSwitches];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_74CC;
    v51[3] = &unk_187B0;
    v51[4] = &buf;
    v51[5] = &v52;
    [v16 enumerateObjectsUsingBlock:v51];

    int v17 = *((unsigned __int8 *)v53 + 24);
    if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      if (!*((unsigned char *)v53 + 24))
      {
LABEL_13:
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&buf, 8);
        goto LABEL_14;
      }
      int v17 = 1;
    }
    LOBYTE(v6) = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    LOBYTE(v9) = v17 != 0;
    long long v10 = @"SwitchControl";
    unsigned int v3 = 1;
    goto LABEL_13;
  }
LABEL_14:
  if (_AXSVoiceOverTouchEnabled())
  {
    uint64_t v18 = +[VOSCommandResolver resolverForCurrentHost];
    id v19 = [objc_alloc((Class)VOSCommandManager) initPreferringUserProfile];
    uint64_t v20 = +[VOSGesture BackTapDoubleTap];
    v21 = [v19 commandForTouchGesture:v20 withResolver:v18];
    BOOL v22 = v21 != 0;

    v23 = +[VOSGesture BackTapTripleTap];
    v24 = [v19 commandForTouchGesture:v23 withResolver:v18];
    BOOL v25 = v24 != 0;

    int v26 = v22 || v25;
    if (v22 || v25) {
      LOBYTE(v6) = v22;
    }
    if (v26) {
      LOBYTE(v9) = v25;
    }
    v27 = @"VoiceOver";
    if (!v26) {
      v27 = v10;
    }
    long long v10 = v27;

    v3 |= v26;
  }
  v43 = _NSConcreteStackBlock;
  uint64_t v44 = 3221225472;
  v45 = sub_7580;
  v46 = &unk_187D8;
  char v48 = v3;
  v28 = v10;
  v47 = v28;
  BOOL v49 = v6;
  BOOL v50 = v9;
  AnalyticsSendEventLazy();
  if (v3)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v29 = v38;
    v30 = (char *)[v29 countByEnumeratingWithState:&v39 objects:v56 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v40;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(v29);
          }
          AnalyticsSendEventLazy();
        }
        v30 = (char *)[v29 countByEnumeratingWithState:&v39 objects:v56 count:16];
      }
      while (v30);
    }

    v33 = AXLogAggregate();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v29;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "Back tap actions: %@", (uint8_t *)&buf, 0xCu);
    }

    AnalyticsSendEventLazy();
    v34 = AXLogAggregate();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = +[AXSettings sharedInstance];
      v36 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v35 backTapUsageCount]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v36;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Resettting back tap usage count due to daily logging: %@", (uint8_t *)&buf, 0xCu);
    }
    v37 = +[AXSettings sharedInstance];
    [v37 setBackTapUsageCount:0];
  }
}

- (void)_logVoiceTriggerStatistics
{
  uint64_t v10 = 0;
  CFIndex v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = sub_7270;
  long long v14 = sub_7280;
  id v15 = 0;
  CFStringRef v2 = +[AXSettings sharedInstance];
  unsigned int v3 = [v2 assistiveTouchSwitches];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_7288;
  v9[3] = &unk_18788;
  v9[4] = &v10;
  [v3 enumerateObjectsUsingBlock:v9];

  uint64_t v4 = v11[5];
  id v5 = objc_opt_new();
  BOOL v6 = +[NSNumber numberWithBool:v4 != 0];
  [v5 setObject:v6 forKeyedSubscript:@"enabled"];

  uint64_t v7 = v11[5];
  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:@"name"];
  }
  id v8 = v5;
  AnalyticsSendEventLazy();

  _Block_object_dispose(&v10, 8);
}

- (void)_logCommonStatistics
{
  AnalyticsSendEventLazy();
  if (_AXSVoiceOverTouchEnabled())
  {
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    CFStringRef v2 = +[AXSettings sharedInstance];
    id v3 = [v2 imageCaptionGenderStrategy];

    if ((unint64_t)v3 > 2) {
      CFStringRef v4 = @"unknown";
    }
    else {
      CFStringRef v4 = *(&off_19858 + (void)v3);
    }
    v77 = _NSConcreteStackBlock;
    uint64_t v78 = 3221225472;
    v79 = sub_9ED0;
    v80 = &unk_18658;
    v81 = (__CFString *)v4;
    AnalyticsSendEventLazy();
  }
  int v5 = _AXSAccessibilitySecureIntentProvider();
  uint64_t v6 = v5 == 1;
  if (v5 == 2) {
    uint64_t v6 = 2;
  }
  v72 = _NSConcreteStackBlock;
  uint64_t v73 = 3221225472;
  v74 = sub_9F54;
  v75 = &unk_18630;
  uint64_t v76 = v6;
  AnalyticsSendEventLazy();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v7 = +[AXSettings sharedInstance];
  id v8 = [v7 voiceOverBrailleDisplays];

  id v9 = [v8 countByEnumeratingWithState:&v68 objects:v90 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v69;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v69 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v83 = 0;
          v84 = &v83;
          uint64_t v85 = 0x2020000000;
          double v13 = (id *)qword_20E90;
          uint64_t v86 = qword_20E90;
          if (!qword_20E90)
          {
            v82[0] = _NSConcreteStackBlock;
            v82[1] = 3221225472;
            v82[2] = sub_10570;
            v82[3] = &unk_19758;
            v82[4] = &v83;
            sub_10570((uint64_t)v82);
            double v13 = (id *)v84[3];
          }
          _Block_object_dispose(&v83, 8);
          if (!v13)
          {
            sub_10A6C();
            __break(1u);
            goto LABEL_27;
          }
          id v14 = *v13;
          id v15 = [v12 objectForKey:v14];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFStringRef v88 = @"displayidentifier";
            v89 = v15;
            long long v16 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
            AnalyticsSendEvent();
          }
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v68 objects:v90 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (_AXSGreenRedFilterEnabled())
  {
    CFStringRef v17 = @"green-red";
  }
  else if (_AXSRedGreenFilterEnabled())
  {
    CFStringRef v17 = @"red-green";
  }
  else
  {
LABEL_27:
    if (_AXSGrayscaleEnabled())
    {
      CFStringRef v17 = @"grayscale";
    }
    else if (_AXSBlueYellowFilterEnabled())
    {
      CFStringRef v17 = @"blue-yellow";
    }
    else
    {
      if (!_AXSColorTintFilterEnabled()) {
        goto LABEL_34;
      }
      CFStringRef v17 = @"color-tint";
    }
  }
  v63 = _NSConcreteStackBlock;
  uint64_t v64 = 3221225472;
  v65 = sub_A040;
  v66 = &unk_18658;
  v67 = (__CFString *)v17;
  AnalyticsSendEventLazy();

LABEL_34:
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  if (_AXSHoverTextEnabled())
  {
    uint64_t v18 = +[AXSettings sharedInstance];
    id v19 = [v18 hoverTextDisplayMode];

    if ((unint64_t)v19 > 4) {
      CFStringRef v20 = @"unknown";
    }
    else {
      CFStringRef v20 = *(&off_19870 + (void)v19);
    }
    uint64_t v58 = _NSConcreteStackBlock;
    uint64_t v59 = 3221225472;
    v60 = sub_A234;
    v61 = &unk_18658;
    v62 = (__CFString *)v20;
    AnalyticsSendEventLazy();
  }
  AnalyticsSendEventLazy();
  LOBYTE(v82[0]) = 0;
  v21 = +[AXSettings sharedInstance];
  id v22 = [v21 speechVoiceIdentifierForLanguage:0 sourceKey:AXSpeechSourceKeyVoiceOver exists:v82];

  v53 = _NSConcreteStackBlock;
  uint64_t v54 = 3221225472;
  char v55 = sub_A370;
  v56 = &unk_18678;
  char v57 = v82[0];
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  [(AXAggregateStatistics *)self _logTextSizes];
  AnalyticsSendEventLazy();
  if (_AXSAssistiveTouchScannerEnabled())
  {
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    v23 = +[AXSettings sharedInstance];
    v24 = [v23 assistiveTouchSwitches];

    char v48 = _NSConcreteStackBlock;
    uint64_t v49 = 3221225472;
    BOOL v50 = sub_B1A0;
    v51 = &unk_18658;
    id v52 = v24;
    AnalyticsSendEventLazy();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v52;
    char v25 = 0;
    id v26 = [obj countByEnumeratingWithState:&v44 objects:v87 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v45;
      uint64_t v28 = SCATSwitchSourceMFI;
      uint64_t v29 = SCATSwitchSourceCamera;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v45 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
          v32 = [v31 source];
          unsigned __int8 v33 = [v32 isEqualToString:v28];

          if ((v33 & 1) == 0)
          {
            v34 = [v31 source];
            unsigned __int8 v35 = [v34 isEqualToString:v29];

            v25 |= v35;
          }
        }
        id v26 = [obj countByEnumeratingWithState:&v44 objects:v87 count:16];
      }
      while (v26);
    }

    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
  }
  id v36 = (id)_AXSTripleClickCopyOptions();
  AnalyticsSendEventLazy();
  v37 = +[AXSettings sharedInstance];
  if (![v37 didTriggerSOSValueSet]) {
    goto LABEL_53;
  }
  int IsD22 = AXDeviceIsD22();

  if (IsD22)
  {
    long long v39 = +[AXSettings sharedInstance];
    [v39 didTriggerSOSToday];

    id v43 = v36;
    AnalyticsSendEventLazy();
    long long v40 = +[AXSettings sharedInstance];
    [v40 setDidTriggerSOSToday:0];

    v37 = v43;
LABEL_53:
  }
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
}

- (void)_logMagnifierStatistics
{
  id v15 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Accessibility.Magnifier"];
  AnalyticsSendEventLazy();
  [v15 setBool:0 forKey:@"peopleDetectionEnabledForAnalytics"];
  id v14 = v15;
  AnalyticsSendEventLazy();
  [v14 setBool:0 forKey:@"doorDetectionEnabledForAnalytics"];
  id v13 = v14;
  AnalyticsSendEventLazy();
  id v12 = v13;
  AnalyticsSendEventLazy();
  id v11 = v12;
  AnalyticsSendEventLazy();
  id v10 = v11;
  AnalyticsSendEventLazy();
  [v10 setBool:0 forKey:@"pointSpeakEnabledForAnalytics"];
  id v9 = v10;
  AnalyticsSendEventLazy();
  id v8 = v9;
  AnalyticsSendEventLazy();
  [v8 setBool:0 forKey:@"textDetectionEnabledForAnalytics"];
  id v7 = v8;
  AnalyticsSendEventLazy();
  [v7 setBool:0 forKey:@"objectUnderstandingEnabledForAnalytics"];
  id v6 = v7;
  AnalyticsSendEventLazy();
  id v5 = v6;
  AnalyticsSendEventLazy();
  [v5 setBool:0 forKey:@"savedActivityForAnalytics"];
  id v4 = v5;
  AnalyticsSendEventLazy();
  [v4 setBool:0 forKey:@"switchedActivityForAnalytics"];
  id v3 = v4;
  AnalyticsSendEventLazy();
  [v3 setBool:0 forKey:@"readerModeEnabledForAnalytics"];
  id v2 = v3;
  AnalyticsSendEventLazy();
  objc_msgSend(v2, "setBool:forKey:", 0, @"readerModeSpeechEnabledForAnalytics", _NSConcreteStackBlock, 3221225472, sub_8514, &unk_18658);
}

- (void)_logiOSStatistics
{
  if (_AXSVoiceOverTouchEnabled())
  {
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    id v2 = +[AXSettings sharedInstance];
    id v3 = [v2 customPronunciationSubstitutions];

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id obj = v3;
    uint64_t v4 = 0;
    id v5 = [obj countByEnumeratingWithState:&v106 objects:v124 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v107;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v107 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = [*(id *)(*((void *)&v106 + 1) + 8 * i) phonemes];
          if (v8) {
            ++v4;
          }
        }
        id v5 = [obj countByEnumeratingWithState:&v106 objects:v124 count:16];
      }
      while (v5);
    }

    v101 = _NSConcreteStackBlock;
    uint64_t v102 = 3221225472;
    v103 = sub_C7E0;
    v104 = &unk_18630;
    uint64_t v105 = v4;
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    id v9 = +[AXSettings sharedInstance];
    id v10 = [v9 voiceOverBrailleTableIdentifier];
    unsigned int v11 = [v10 isEqualToString:@"com.apple.scrod.braille.table.duxbury.eng-xueb"];

    id v12 = +[AXSettings sharedInstance];
    id v13 = [v12 voiceOverBrailleTableIdentifier];
    LODWORD(v10) = [v13 isEqualToString:@"com.apple.scrod.braille.table.duxbury.eng-xna"];

    if ((v11 | v10) == 1)
    {
      v96 = _NSConcreteStackBlock;
      uint64_t v97 = 3221225472;
      v98 = sub_CA44;
      v99 = &unk_18678;
      char v100 = v11;
      AnalyticsSendEventLazy();
    }
    AnalyticsSendEventLazy();
    AnalyticsSendEventLazy();
    id v14 = +[AXSettings sharedInstance];
    id v15 = [v14 voiceOverKeyboardModifierChoice];

    v91 = _NSConcreteStackBlock;
    uint64_t v92 = 3221225472;
    v93 = sub_CCB4;
    v94 = &unk_18630;
    id v95 = v15;
    AnalyticsSendEventLazy();
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v16 = +[AXSettings sharedInstance];
    id v45 = [v16 selectedSpeechVoiceIdentifiersForSourceKey:AXSpeechSourceKeyVoiceOver];

    id v17 = [v45 countByEnumeratingWithState:&v87 objects:v123 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v88;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v88 != v18) {
            objc_enumerationMutation(v45);
          }
          uint64_t v20 = *(void *)(*((void *)&v87 + 1) + 8 * (void)j);
          v82 = _NSConcreteStackBlock;
          uint64_t v83 = 3221225472;
          v84 = sub_CD68;
          uint64_t v85 = &unk_18658;
          uint64_t v86 = v20;
          AnalyticsSendEventLazy();
          v77 = _NSConcreteStackBlock;
          uint64_t v78 = 3221225472;
          v79 = sub_CDEC;
          v80 = &unk_18658;
          uint64_t v81 = v20;
          AnalyticsSendEventLazy();
        }
        id v17 = [v45 countByEnumeratingWithState:&v87 objects:v123 count:16];
      }
      while (v17);
    }
  }
  AnalyticsSendEventLazy();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v21 = +[AXSDSettings sharedInstance];
  id v22 = [v21 enabledSoundDetectionTypes];

  id v23 = [v22 countByEnumeratingWithState:&v73 objects:v122 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v74;
    do
    {
      for (k = 0; k != v23; k = (char *)k + 1)
      {
        if (*(void *)v74 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void *)(*((void *)&v73 + 1) + 8 * (void)k);
        long long v68 = _NSConcreteStackBlock;
        uint64_t v69 = 3221225472;
        long long v70 = sub_CFAC;
        long long v71 = &unk_18658;
        uint64_t v72 = v26;
        AnalyticsSendEventLazy();
      }
      id v23 = [v22 countByEnumeratingWithState:&v73 objects:v122 count:16];
    }
    while (v23);
  }

  AnalyticsSendEventLazy();
  if (_AXSHapticMusicEnabled())
  {
    hapticMusicClient = self->_hapticMusicClient;
    if (!hapticMusicClient)
    {
      uint64_t v28 = (AXUIClient *)[objc_alloc((Class)AXUIClient) initWithIdentifier:@"HapticMusicClient-AggStats" serviceBundleName:@"AXHapticMusicServer"];
      uint64_t v29 = self->_hapticMusicClient;
      self->_hapticMusicClient = v28;

      hapticMusicClient = self->_hapticMusicClient;
    }
    v30 = +[AXAccessQueue mainAccessQueue];
    [(AXUIClient *)hapticMusicClient sendAsynchronousMessage:&__NSDictionary0__struct withIdentifier:6 targetAccessQueue:v30 completion:&stru_19090];
  }
  if (AXDeviceSupportsBootSound()) {
    AnalyticsSendEventLazy();
  }
  AnalyticsSendEventLazy();
  id v31 = objc_alloc((Class)NSUserDefaults);
  v63 = _NSConcreteStackBlock;
  uint64_t v64 = 3221225472;
  v65 = sub_D304;
  v66 = &unk_18658;
  id v46 = [v31 initWithSuiteName:AX_SpringBoardBundleName];
  id v67 = v46;
  AnalyticsSendEventLazy();
  CFPreferencesAppSynchronize(@"com.apple.backboardd");
  uint64_t v58 = _NSConcreteStackBlock;
  uint64_t v59 = 3221225472;
  v60 = sub_D3C8;
  v61 = &unk_18678;
  Boolean AppBooleanValue = CFPreferencesGetAppBooleanValue(@"BKEnableALS", @"com.apple.backboardd", 0);
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  [(AXAggregateStatistics *)self _logSideButtonClickSpeed];
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  v53 = _NSConcreteStackBlock;
  uint64_t v54 = 3221225472;
  char v55 = sub_ED5C;
  v56 = &unk_18630;
  uint64_t Type = MADisplayFilterPrefGetType();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  if (_AXSQuickSpeakEnabled() || _AXSSpeakThisEnabled())
  {
    AnalyticsSendEventLazy();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v32 = +[AXSettings sharedInstance];
    id obja = [v32 selectedSpeechVoiceIdentifiersForSourceKey:AXSpeechSourceKeySpeechFeatures];

    unsigned __int8 v33 = (char *)[obja countByEnumeratingWithState:&v49 objects:v121 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v50;
      do
      {
        for (m = 0; m != v33; ++m)
        {
          if (*(void *)v50 != v34) {
            objc_enumerationMutation(obja);
          }
          AnalyticsSendEventLazy();
          AnalyticsSendEventLazy();
        }
        unsigned __int8 v33 = (char *)[obja countByEnumeratingWithState:&v49 objects:v121 count:16];
      }
      while (v33);
    }
  }
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  if (_AXSAccessibilityHasNoticedOpaqueTouchDevice()) {
    AnalyticsSendEventLazy();
  }
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  if (_AXSCommandAndControlEnabled()) {
    [(AXAggregateStatistics *)self _logCommandAndControlStatistics];
  }
  else {
    [(AXAggregateStatistics *)self _updateCommandAndControlPurgability];
  }
  [(AXAggregateStatistics *)self _logVoiceTriggerStatistics];
  [(AXAggregateStatistics *)self _logBackTapStatistics];
  CFStringRef v119 = @"enabled";
  id v36 = +[NSNumber numberWithUnsignedChar:_AXSFullKeyboardAccessEnabled()];
  v120 = v36;
  v37 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
  AnalyticsSendEvent();

  [(AXAggregateStatistics *)self _logAssistiveTouchMouseStatistics];
  [(AXAggregateStatistics *)self _logLaserAXStatistics];
  [(AXAggregateStatistics *)self _logPerAppStatistics];
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x2050000000;
  v38 = (void *)qword_20EC0;
  uint64_t v118 = qword_20EC0;
  if (!qword_20EC0)
  {
    v110 = _NSConcreteStackBlock;
    uint64_t v111 = 3221225472;
    v112 = sub_255C;
    v113 = &unk_19758;
    v114 = &v115;
    sub_255C((uint64_t)&v110);
    v38 = (void *)v116[3];
  }
  id v39 = v38;
  _Block_object_dispose(&v115, 8);
  long long v40 = [v39 sharedInstance];
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x2020000000;
  long long v41 = (void *)qword_20ED0;
  uint64_t v118 = qword_20ED0;
  if (!qword_20ED0)
  {
    v110 = _NSConcreteStackBlock;
    uint64_t v111 = 3221225472;
    v112 = sub_10A1C;
    v113 = &unk_19758;
    v114 = &v115;
    long long v42 = (void *)sub_5CC0();
    id v43 = dlsym(v42, "AXHearingControlCenterBundleID");
    *(void *)(v114[1] + 24) = v43;
    qword_20ED0 = *(void *)(v114[1] + 24);
    long long v41 = (void *)v116[3];
  }
  _Block_object_dispose(&v115, 8);
  if (!v41)
  {
    sub_10A6C();
    __break(1u);
  }
  [v40 getEnabledStateOfModuleWithIdentifier:*v41 completionHandler:&stru_19730];

  [(AXAggregateStatistics *)self _logSoundDetectionCustomTonesHaptics];
  [(AXAggregateStatistics *)self _logCustomSoundDetectionCustomTonesHaptics];
  [(AXAggregateStatistics *)self _logMagnifierStatistics];
  [(AXAggregateStatistics *)self _logAdaptiveVoiceShortcutsStatistics];
  if (AXDeviceSupportsCameraButton()) {
    [(AXAggregateStatistics *)self _logCameraButtonStatistics];
  }
}

- (void)_logLaserAXStatistics
{
  id v3 = +[AXSettings sharedInstance];
  unsigned int v4 = [v3 laserEnabled];

  if (v4)
  {
    id v5 = +[AXMouseEventListener sharedInstance];
    uint64_t v6 = [v5 discoveredMouseDevices];

    if (v6)
    {
      LODWORD(v9) = _AXSPointerStrokeColor();
      AnalyticsSendEventLazy();
      if (_AXSVoiceOverTouchEnabled()) {
        AnalyticsSendEventLazy();
      }
      id v7 = +[AXSettings sharedInstance];
      unsigned int v8 = [v7 zoomEnabled];

      if (v8) {
        AnalyticsSendEventLazy();
      }
    }
  }
}

- (void)_logSideButtonClickSpeed
{
}

- (void)_logAssistiveTouchMouseStatistics
{
  if (_AXSAssistiveTouchEnabled())
  {
    if (!_AXSAssistiveTouchScannerEnabled())
    {
      id v2 = +[AXMouseEventListener sharedInstance];
      id v3 = [v2 discoveredMouseDevices];

      if (v3)
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v17 = 0u;
        long long v16 = 0u;
        unsigned int v4 = +[AXSettings sharedInstance];
        id v5 = [v4 assistiveTouchMouseCustomizedClickActions];

        id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v17;
          do
          {
            for (i = 0; i != v7; i = (char *)i + 1)
            {
              if (*(void *)v17 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
              AnalyticsSendEventLazy();
              if ([v10 hasCustomActions]) {
                AnalyticsSendEventLazy();
              }
            }
            id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
          }
          while (v7);
        }

        AnalyticsSendEventLazy();
        AnalyticsSendEventLazy();
        unsigned int v11 = +[AXSettings sharedInstance];
        unsigned int v12 = [v11 assistiveTouchMouseDwellControlEnabled];

        if (v12)
        {
          id v13 = +[AXSettings sharedInstance];
          id v14 = [v13 assistiveTouchMouseDwellControlCornerCustomization];

          if ([v14 count])
          {
            id v15 = v14;
            AnalyticsSendEventLazy();
          }
        }
      }
    }
  }
}

+ (void)runStatistics
{
  if (qword_20E50 != -1) {
    dispatch_once(&qword_20E50, &stru_185E8);
  }
}

- (AXAggregateStatistics)init
{
  v11.receiver = self;
  v11.super_class = (Class)AXAggregateStatistics;
  id v2 = [(AXAggregateStatistics *)&v11 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("ax-aggd-stats", v3);
    [(AXAggregateStatistics *)v2 setQueue:v4];

    id v5 = [(AXAggregateStatistics *)v2 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_642C;
    block[3] = &unk_18610;
    id v6 = v2;
    id v10 = v6;
    dispatch_async(v5, block);

    id v7 = v6;
  }

  return v2;
}

- (void)_startLogging
{
  id v3 = +[AXSubsystemAXAggregateLogging sharedInstance];
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    id v5 = +[AXSubsystemAXAggregateLogging identifier];
    id v6 = AXLoggerForFacility();

    os_log_type_t v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = AXColorizeFormatLog();
      uint64_t v9 = _AXStringForArgs();
      if (os_log_type_enabled(v6, v7))
      {
        int v10 = 138543362;
        objc_super v11 = v9;
        _os_log_impl(&dword_0, v6, v7, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(AXAggregateStatistics *)self _logStatistics];
}

- (void)_logCommandAndControlStatistics
{
  uint64_t v54 = 0;
  char v55 = &v54;
  uint64_t v56 = 0x2050000000;
  id v2 = (void *)qword_20E68;
  uint64_t v57 = qword_20E68;
  if (!qword_20E68)
  {
    long long v49 = _NSConcreteStackBlock;
    uint64_t v50 = 3221225472;
    long long v51 = sub_1019C;
    long long v52 = &unk_19758;
    v53 = &v54;
    sub_1019C((uint64_t)&v49);
    id v2 = (void *)v55[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v54, 8);
  unsigned __int8 v4 = [v3 sharedPreferences];
  char v25 = [v4 alwaysShowOverlayType];
  if ([v25 isEqualToString:@"NumberedElements"])
  {
    uint64_t v5 = 1;
  }
  else if ([v25 isEqualToString:@"NamedElements"])
  {
    uint64_t v5 = 3;
  }
  else
  {
    unsigned int v6 = [v25 isEqualToString:@"NumberedGrid"];
    uint64_t v5 = 2;
    if (!v6) {
      uint64_t v5 = 0;
    }
  }
  long long v44 = _NSConcreteStackBlock;
  uint64_t v45 = 3221225472;
  id v46 = sub_6B64;
  long long v47 = &unk_18630;
  uint64_t v48 = v5;
  AnalyticsSendEventLazy();
  id v39 = _NSConcreteStackBlock;
  uint64_t v40 = 3221225472;
  long long v41 = sub_6C18;
  long long v42 = &unk_18658;
  id v24 = v4;
  id v43 = v24;
  AnalyticsSendEventLazy();
  uint64_t v54 = 0;
  char v55 = &v54;
  uint64_t v56 = 0x2050000000;
  os_log_type_t v7 = (void *)qword_20E78;
  uint64_t v57 = qword_20E78;
  if (!qword_20E78)
  {
    long long v49 = _NSConcreteStackBlock;
    uint64_t v50 = 3221225472;
    long long v51 = sub_10364;
    long long v52 = &unk_19758;
    v53 = &v54;
    sub_10364((uint64_t)&v49);
    os_log_type_t v7 = (void *)v55[3];
  }
  uint64_t v8 = v7;
  _Block_object_dispose(&v54, 8);
  id v26 = objc_alloc_init(v8);
  [v26 setUsedByPreferences:1];
  id obj = [v26 nestedCommandGroupsAndItems];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v29 = [obj countByEnumeratingWithState:&v35 objects:v59 count:16];
  if (v29)
  {
    char v9 = 0;
    char v10 = 0;
    uint64_t v28 = *(void *)v36;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v28)
        {
          uint64_t v12 = v11;
          objc_enumerationMutation(obj);
          uint64_t v11 = v12;
        }
        uint64_t v30 = v11;
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
        if (([v13 isGroup] & 1) == 0)
        {
          id v22 = v13;
          _AXAssert();
        }
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v14 = objc_msgSend(v13, "commandsArray", v22);
        id v15 = [v14 countByEnumeratingWithState:&v31 objects:v58 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v32;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v14);
              }
              long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              if ([v18 isGroup])
              {
                id v22 = v13;
                id v23 = v18;
                _AXAssert();
              }
              unsigned __int8 v19 = objc_msgSend(v18, "isEnabled", v22, v23);
              if ([v18 isCustom])
              {
                uint64_t v20 = [v18 customType];
                unsigned __int8 v21 = [v20 isEqualToString:@"RunGesture"];
              }
              else
              {
                unsigned __int8 v21 = 0;
              }
              v10 |= v19 ^ 1;
              v9 |= v21;
            }
            id v15 = [v14 countByEnumeratingWithState:&v31 objects:v58 count:16];
          }
          while (v15);
        }

        uint64_t v11 = v30 + 1;
      }
      while ((id)(v30 + 1) != v29);
      id v29 = [obj countByEnumeratingWithState:&v35 objects:v59 count:16];
    }
    while (v29);
  }
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
}

- (void)_logAdaptiveVoiceShortcutsStatistics
{
  AnalyticsSendEventLazy();

  AnalyticsSendEventLazy();
}

- (id)globalDevicePreferences
{
  id v2 = +[BKSMousePointerService sharedInstance];
  id v3 = [v2 globalDevicePreferences];

  if (!v3)
  {
    id v3 = +[BKSMousePointerDevicePreferences defaultPreferencesForHardwareType:9];
  }

  return v3;
}

- (void)_logCameraButtonStatistics
{
  id v2 = objc_alloc((Class)NSUserDefaults);
  id v3 = [v2 initWithSuiteName:AX_CameraBundleName];
  AnalyticsSendEventLazy();
  id v7 = v3;
  AnalyticsSendEventLazy();
  id v6 = v7;
  AnalyticsSendEventLazy();
  AnalyticsSendEventLazy();
  id v5 = v6;
  AnalyticsSendEventLazy();
  id v4 = v5;
  AnalyticsSendEventLazy();
}

- (void)_logStatistics
{
  [(AXAggregateStatistics *)self _logCommonStatistics];

  [(AXAggregateStatistics *)self _logiOSStatistics];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_hapticMusicClient, 0);
}

@end