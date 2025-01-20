@interface AccessibilityBridgeSettingsController
- (ADASManager)headphoneLevelManager;
- (AccessibilityBridgeSettingsController)init;
- (BOOL)_deviceSupportsSideButtonClickSpeed;
- (BOOL)_gizmoSupportsAXAirPodSettings;
- (BOOL)_siriIsEnabled;
- (BOOL)_supportsLiveSpeech;
- (BOOL)_supportsWatchControl;
- (BOOL)_tapticChimesIsSupported;
- (BOOL)_tapticTimeSpeedAdjustmentSupported;
- (BOOL)_typeToSiriIsSupported;
- (BOOL)_walkieTalkieIsSupported;
- (double)_axConvertAudioBalanceValueToDisplay:(double)a3;
- (id)_watchControlDescription;
- (id)_watchQuickActionsV2Description;
- (id)accessibilityPreferenceForSpecifier:(id)a3;
- (id)accessibilityShortcut:(id)a3;
- (id)audioTranscriptionsEnabled:(id)a3;
- (id)autoAnswerCallDescription:(id)a3;
- (id)boldTextEnabled:(id)a3;
- (id)contentSizeCategories;
- (id)globalColorFilterEnabled;
- (id)headphoneNotificationsEnabled:(id)a3;
- (id)hearingDevicesComplicationPreferredDisplayMode:(id)a3;
- (id)increaseContrastEnabled:(id)a3;
- (id)isIncreaseBrightnessFloorEnabled:(id)a3;
- (id)liveSpeechEnabled:(id)a3;
- (id)monoAudioEnabled:(id)a3;
- (id)reduceMotionEnabled:(id)a3;
- (id)reduceTransparencyEnabled:(id)a3;
- (id)rttEnabled:(id)a3;
- (id)sideButtonStatus:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tapticTimeSpeed:(id)a3;
- (id)textSize:(id)a3;
- (id)touchAccommodationsEnabled:(id)a3;
- (id)voiceOverTouchEnabled:(id)a3;
- (id)zoomEnabled:(id)a3;
- (void)_previewHapticSpeed;
- (void)accessibilitySetPreference:(id)a3 specifier:(id)a4;
- (void)dealloc;
- (void)setAudioTranscriptionsEnabled:(id)a3 specifier:(id)a4;
- (void)setBoldTextEnabled:(id)a3 specifier:(id)a4;
- (void)setHeadphoneLevelManager:(id)a3;
- (void)setHeadphoneNotificationsEnabled:(id)a3 specifier:(id)a4;
- (void)setIncreaseBrightnessFloorEnabled:(id)a3 specifier:(id)a4;
- (void)setMonoAudioEnabled:(id)a3 specifier:(id)a4;
- (void)setReduceMotionEnabled:(id)a3 specifier:(id)a4;
- (void)setTapticTimeSpeed:(id)a3 specifier:(id)a4;
- (void)setTextSize:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation AccessibilityBridgeSettingsController

- (AccessibilityBridgeSettingsController)init
{
  v12.receiver = self;
  v12.super_class = (Class)AccessibilityBridgeSettingsController;
  v2 = [(AccessibilityBridgeBaseController *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(AccessibilityBridgeSettingsController *)v2 view];
    [v4 setAutoresizesSubviews:1];

    v5 = [(AccessibilityBridgeSettingsController *)v3 view];
    [v5 setAutoresizingMask:18];

    v6 = (ADASManager *)objc_alloc_init(MEMORY[0x263F28C30]);
    headphoneLevelManager = v3->_headphoneLevelManager;
    v3->_headphoneLevelManager = v6;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)headphoneLevelSettingChanged, (CFStringRef)*MEMORY[0x263F28B58], 0, (CFNotificationSuspensionBehavior)1028);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v3, (CFNotificationCallback)headphoneLevelSettingChanged, (CFStringRef)*MEMORY[0x263F28B70], 0, (CFNotificationSuspensionBehavior)1028);
    v10 = v3;
  }

  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AccessibilityBridgeSettingsController;
  [(AccessibilityBridgeBaseController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AccessibilityBridgeSettingsController;
  [(AccessibilityBridgeBaseController *)&v3 viewDidLoad];
  [(AccessibilityBridgeSettingsController *)self beginUpdates];
  [(AccessibilityBridgeSettingsController *)self reload];
  [(AccessibilityBridgeSettingsController *)self endUpdates];
}

- (id)specifiers
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  objc_super v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  id v4 = *v3;
  if (!*v3)
  {
    location = v3;
    id v109 = (id)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
    v5 = [(AccessibilityBridgeSettingsController *)self loadSpecifiersFromPlistName:@"AccessibilitySettings" target:self];
    v6 = [v5 specifierForID:@"TEXT_SIZE_SLIDER_ID"];
    v7 = NSNumber;
    v8 = [(AccessibilityBridgeSettingsController *)self contentSizeCategories];
    v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count") - 1);
    [v6 setProperty:v9 forKey:*MEMORY[0x263F60030]];

    v10 = BPSAccessoryHighlightColor();
    v11 = BPSTintedSymbol();
    uint64_t v114 = *MEMORY[0x263F60240];
    objc_msgSend(v6, "setProperty:forKey:", v11);

    objc_super v12 = BPSAccessoryHighlightColor();
    v13 = BPSTintedSymbol();
    uint64_t v113 = *MEMORY[0x263F60250];
    objc_msgSend(v6, "setProperty:forKey:", v13);

    LODWORD(v14) = *MEMORY[0x263F839C0];
    v15 = [NSNumber numberWithFloat:v14];
    v101 = v6;
    [v6 setProperty:v15 forKey:*MEMORY[0x263F602A8]];

    BOOL v16 = [(AccessibilityBridgeSettingsController *)self _supportsAudioTranscriptions];
    v17 = (uint64_t *)MEMORY[0x263F600F8];
    if (v16)
    {
      v18 = [v5 specifierForID:@"HearingDevicesComplicationGroupID"];
      if (v18)
      {
        v19 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
        v20 = settingsLocString(@"AUDIO_TRANSCRIPTIONS_FOOTER", @"AccessibilitySettings-dinnerbell");
        [v19 setProperty:v20 forKey:*v17];

        objc_msgSend(v5, "ps_addGroup:afterGroup:", v19, v18);
        v21 = (void *)MEMORY[0x263F5FC40];
        v22 = settingsLocString(@"AUDIO_TRANSCRIPTIONS_TITLE", @"AccessibilitySettings-dinnerbell");
        v23 = [v21 preferenceSpecifierNamed:v22 target:self set:sel_setAudioTranscriptionsEnabled_specifier_ get:sel_audioTranscriptionsEnabled_ detail:0 cell:6 edit:0];

        [v23 setIdentifier:@"AudioTranscriptionsSpec"];
        objc_msgSend(v5, "ps_addSpecifier:toGroup:", v23, v19);
      }
    }
    if ([(AccessibilityBridgeSettingsController *)self _supportsAutoAnswerCalls])
    {
      v24 = [v5 specifierForID:@"MotorGroupCell"];
      if (v24)
      {
        v25 = (void *)MEMORY[0x263F5FC40];
        v26 = settingsLocString(@"AutoAnswerCalls", @"AccessibilitySettings");
        v27 = [v25 preferenceSpecifierNamed:v26 target:self set:0 get:sel_autoAnswerCallDescription_ detail:objc_opt_class() cell:2 edit:0];

        objc_msgSend(v5, "ps_addSpecifier:toGroup:", v27, v24);
      }
    }
    if ([(AccessibilityBridgeSettingsController *)self _supportsWatchControl])
    {
      v28 = [v5 specifierForID:@"MotorGroupCell"];
      if (v28)
      {
        uint64_t v29 = [v5 indexOfObject:v28];
        if (v29 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v30 = v29;
          v31 = (void *)MEMORY[0x263F5FC40];
          v32 = settingsLocString(@"WATCH_CONTROL_ROW_TITLE", @"AccessibilitySettings-watchcontrol");
          v33 = [v31 preferenceSpecifierNamed:v32 target:self set:0 get:sel__watchControlDescription detail:objc_opt_class() cell:2 edit:0];

          [v5 insertObject:v33 atIndex:v30 + 1];
        }
      }
    }
    int v34 = AXActivePairedDeviceSupportsWatchQuickActionsV2();
    v35 = (uint64_t *)MEMORY[0x263F60138];
    if (v34 && AXActivePairedDeviceSupportsQuickActionsAlwaysOnState())
    {
      v36 = [v5 specifierForID:@"MotorGroupCell"];
      if (v36)
      {
        uint64_t v37 = [v5 indexOfObject:v36];
        if (v37 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v38 = v37;
          v39 = (void *)MEMORY[0x263F5FC40];
          v40 = settingsLocString(@"QUICK_ACTIONS_ROW_TITLE", @"AccessibilitySettings-quickactions");
          v41 = [v39 preferenceSpecifierNamed:v40 target:self set:0 get:sel__watchQuickActionsV2Description detail:objc_opt_class() cell:2 edit:0];

          [v41 setProperty:@"QUICK_ACTIONS" forKey:*v35];
          [v5 insertObject:v41 atIndex:v38 + 1];
        }
      }
    }
    if ([(AccessibilityBridgeSettingsController *)self _gizmoSupportsAXAirPodSettings])
    {
      v42 = [MEMORY[0x263F22808] sharedInstance];
      v43 = [v42 pairedAirPods];

      if ([v43 count])
      {
        v44 = [v5 specifierForID:@"AppSwitcherAutoSelectGroup"];
        if (v44)
        {
          v45 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"AirPodsGroup"];
          objc_msgSend(v5, "ps_addGroup:afterGroup:", v45, v44);
          [v43 count];
          uint64_t v46 = objc_opt_class();
          v47 = (void *)MEMORY[0x263F5FC40];
          v48 = AXAirPodsLocalizedStringForKey();
          v49 = [v47 preferenceSpecifierNamed:v48 target:self set:0 get:0 detail:v46 cell:2 edit:0];

          [v49 setProperty:v43 forKey:@"AirPods"];
          objc_msgSend(v5, "ps_addSpecifier:toGroup:", v49, v45);
        }
      }
    }
    if (_os_feature_enabled_impl()
      && [(AccessibilityBridgeSettingsController *)self _supportsLiveSpeech])
    {
      v50 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      v51 = (void *)MEMORY[0x263F5FC40];
      v52 = settingsLocString(@"LIVE_SPEECH_TITLE", @"AccessibilitySettings");
      v53 = [v51 preferenceSpecifierNamed:v52 target:self set:0 get:sel_liveSpeechEnabled_ detail:objc_opt_class() cell:2 edit:0];

      [v53 setProperty:@"LIVE_SPEECH_TITLE" forKey:*v35];
      v54 = [(AccessibilityBridgeBaseController *)self imageForKey:@"Speech"];
      [v53 setProperty:v54 forKey:*MEMORY[0x263F60140]];

      [v53 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60160]];
      [v53 setProperty:@"com.apple.Accessibility" forKey:*MEMORY[0x263F60070]];
      v55 = [v5 specifierForID:@"TapticTimeSpeedAdjustmentSlider"];
      if (!v55
        || (unint64_t v56 = [v5 indexOfObject:v55], v56 == 0x7FFFFFFFFFFFFFFFLL)
        || (unint64_t v57 = v56, v56 >= [v5 count] - 1))
      {
        [v5 addObject:v50];
        [v5 addObject:v53];
      }
      else
      {
        [v5 insertObject:v50 atIndex:v57 + 1];
        [v5 insertObject:v53 atIndex:v57 + 2];
      }
    }
    if (_os_feature_enabled_impl())
    {
      uint64_t v58 = [v5 indexOfSpecifierWithID:@"GrayscaleDisplay"];
      if (v58 != 0x7FFFFFFFFFFFFFFFLL) {
        [v5 removeObjectAtIndex:v58];
      }
      v59 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"COLOR_FILTERS_GROUP"];
      v60 = settingsLocString(@"COLOR_FILTERS_SECTION_FOOTER", @"AccessibilitySettings");
      [v59 setProperty:v60 forKey:*v17];

      v61 = [v5 specifierForID:@"INCREASE_CONTRAST_GROUP"];
      objc_msgSend(v5, "ps_addGroup:afterGroup:", v59, v61);

      v62 = (void *)MEMORY[0x263F5FC40];
      v63 = settingsLocString(@"COLOR_FILTERS_ROW_TITLE", @"AccessibilitySettings");
      v64 = [v62 preferenceSpecifierNamed:v63 target:self set:0 get:sel_globalColorFilterEnabled detail:objc_opt_class() cell:2 edit:0];

      [v64 setProperty:@"COLOR_FILTERS_ROW_TITLE" forKey:*v35];
      [v64 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60160]];
      [v64 setProperty:@"com.apple.Accessibility" forKey:*MEMORY[0x263F60070]];
      objc_msgSend(v5, "ps_addSpecifier:toGroup:", v64, v59);
    }
    if (AXRuntimeCheck_SupportsIncreaseBrightnessFloor() && AXActivePairedDeviceIsLighthouseEOrLater())
    {
      v65 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      v66 = settingsLocString(@"INCREASE_BRIGHTNESS_FLOOR_SECTION_FOOTER", @"AccessibilitySettings");
      [v65 setProperty:v66 forKey:*v17];

      v67 = [v5 specifierForID:@"COLOR_FILTERS_GROUP"];
      objc_msgSend(v5, "ps_addGroup:afterGroup:", v65, v67);

      v68 = (void *)MEMORY[0x263F5FC40];
      v69 = settingsLocString(@"INCREASE_BRIGHTNESS_FLOOR_ROW_TITLE", @"AccessibilitySettings");
      v70 = [v68 preferenceSpecifierNamed:v69 target:self set:sel_setIncreaseBrightnessFloorEnabled_specifier_ get:sel_isIncreaseBrightnessFloorEnabled_ detail:0 cell:6 edit:0];

      [v70 setProperty:@"INCREASE_BRIGHTNESS_FLOOR_SWITCH_ID" forKey:*v35];
      [v70 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60160]];
      [v70 setProperty:@"com.apple.Accessibility" forKey:*MEMORY[0x263F60070]];
      objc_msgSend(v5, "ps_addSpecifier:toGroup:", v70, v65);
    }
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id obj = v5;
    uint64_t v118 = [obj countByEnumeratingWithState:&v119 objects:v123 count:16];
    if (v118)
    {
      v71 = @"<A>";
      uint64_t v116 = *v35;
      uint64_t v117 = *(void *)v120;
      uint64_t v108 = *MEMORY[0x263F600C0];
      uint64_t v107 = *MEMORY[0x263F600E8];
      uint64_t v105 = *MEMORY[0x263F600E0];
      uint64_t v106 = *MEMORY[0x263F600D0];
      uint64_t v103 = *v17;
      uint64_t v104 = *MEMORY[0x263F600C8];
      uint64_t v111 = *MEMORY[0x263F28BE8];
      uint64_t v112 = *MEMORY[0x263F5FEF8];
      uint64_t v110 = *MEMORY[0x263F28BA8];
      do
      {
        uint64_t v72 = 0;
        do
        {
          if (*(void *)v120 != v117) {
            objc_enumerationMutation(obj);
          }
          v73 = *(void **)(*((void *)&v119 + 1) + 8 * v72);
          v74 = [v73 propertyForKey:v116];
          if ([v74 isEqualToString:@"MOBILITY"])
          {
            v75 = settingsLocString(@"MOBILITY_FOOTER_TEXT", @"AccessibilitySettings");
            uint64_t v76 = [v75 rangeOfString:v71];
            if (v76 != 0x7FFFFFFFFFFFFFFFLL)
            {
              NSUInteger v77 = v76;
              v78 = (objc_class *)objc_opt_class();
              v79 = NSStringFromClass(v78);
              [v73 setProperty:v79 forKey:v108];

              uint64_t v80 = [v75 rangeOfString:@"</A>"];
              NSUInteger v81 = v80 - ([(__CFString *)v71 length] + v77);
              v82 = [v75 stringByReplacingOccurrencesOfString:v71 withString:&stru_26FAF8CF0];

              v75 = [v82 stringByReplacingOccurrencesOfString:@"</A>" withString:&stru_26FAF8CF0];

              [v73 setProperty:v75 forKey:v107];
              v126.location = v77;
              v126.length = v81;
              v83 = NSStringFromRange(v126);
              [v73 setProperty:v83 forKey:v106];

              v84 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
              [v73 setProperty:v84 forKey:v105];

              [v73 setProperty:@"showHealthPane" forKey:v104];
            }
          }
          v85 = v71;
          if ([v74 isEqualToString:@"RTT"]) {
            int v86 = [MEMORY[0x263F62B00] isRTTSupported] ^ 1;
          }
          else {
            int v86 = 0;
          }
          if ([v74 hasPrefix:@"SideButton"])
          {
            BOOL v87 = [(AccessibilityBridgeSettingsController *)self _deviceSupportsSideButtonClickSpeed];
            if (AXActivePairedDeviceIsLighthouseOrLater())
            {
              v88 = settingsLocString(@"BUTTON_CLICK_SPEED", @"AccessibilitySettings");
              [v73 setName:v88];
            }
            v86 |= !v87;
            [v73 setProperty:MEMORY[0x263EFFA88] forKey:v112];
          }
          if ([v74 hasPrefix:@"TouchAccommodations"]) {
            v86 |= AXGizmoTouchAccommodationsSupported() ^ 1;
          }
          if ([v74 isEqualToString:@"TapticTimeSpeedAdjustmentSlider"])
          {
            v89 = AXHareImage();
            [v73 setProperty:v89 forKey:v113];

            v90 = AXTortoiseImage();
            [v73 setProperty:v90 forKey:v114];
          }
          if ([v74 hasPrefix:@"TapticTimeSpeedAdjustment"]) {
            v86 |= ![(AccessibilityBridgeSettingsController *)self _tapticTimeSpeedAdjustmentSupported];
          }
          if ([v74 hasPrefix:@"WalkieTalkieTapToTalk"]) {
            v86 |= ![(AccessibilityBridgeSettingsController *)self _walkieTalkieIsSupported];
          }
          if ([v74 hasPrefix:@"AppSwitcherAutoSelect"])
          {
            if (AXActivePairedDeviceIsLighthouseEOrLater())
            {
              if ([v74 isEqualToString:@"AppSwitcherAutoSelectGroup"])
              {
                v91 = settingsLocString(@"APP_SWITCHER_AUTO_SELECT_DETAILS", @"AccessibilitySettings");
                v92 = AXCFormattedString();

                objc_msgSend(v73, "setProperty:forKey:", v92, v103, 1);
              }
            }
            else
            {
              int v86 = 1;
            }
          }
          if ([v74 hasPrefix:@"TapticChimes"])
          {
            if ([(AccessibilityBridgeSettingsController *)self _tapticChimesIsSupported])
            {
              if ([v74 isEqualToString:@"TapticChimesCell"])
              {
                v93 = [MEMORY[0x263F21DC0] sharedInstance];
                v94 = [v93 tapticChimesLocalizedTitle];
                [v73 setName:v94];
              }
            }
            else
            {
              int v86 = 1;
            }
          }
          if ([v74 hasPrefix:@"HeadphoneNotificationsID"])
          {
            v95 = [(ADASManager *)self->_headphoneLevelManager getNanoPreferenceFor:v111];
            if (v95 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
              char v96 = [v95 BOOLValue];
            }
            else {
              char v96 = 0;
            }
            uint64_t v97 = [(ADASManager *)self->_headphoneLevelManager getNanoPreferenceFor:v110];
            v98 = (void *)v97;
            if (v97)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                LODWORD(v97) = [v98 BOOLValue];
                goto LABEL_84;
              }
              LODWORD(v97) = 0;
              if (v96)
              {
LABEL_86:

                goto LABEL_87;
              }
            }
            else
            {
LABEL_84:
              if (v96) {
                goto LABEL_86;
              }
            }
            v86 |= v97 ^ 1;
            goto LABEL_86;
          }
LABEL_87:
          if (![v74 hasPrefix:@"SIRI_"]
            || [(AccessibilityBridgeSettingsController *)self _siriIsEnabled]
            && [(AccessibilityBridgeSettingsController *)self _typeToSiriIsSupported])
          {
            if (([v74 hasPrefix:@"INCREASE_CONTRAST"] & 1) == 0)
            {
              if (v86) {
                goto LABEL_97;
              }
LABEL_96:
              [v109 addObject:v73];
              goto LABEL_97;
            }
            if (((!AXActivePairedDeviceIsLighthouseOrLater() | v86) & 1) == 0) {
              goto LABEL_96;
            }
          }
          else if ([v74 hasPrefix:@"INCREASE_CONTRAST"])
          {
            AXActivePairedDeviceIsLighthouseOrLater();
          }
LABEL_97:

          ++v72;
          v71 = v85;
        }
        while (v118 != v72);
        uint64_t v99 = [obj countByEnumeratingWithState:&v119 objects:v123 count:16];
        uint64_t v118 = v99;
      }
      while (v99);
    }

    objc_storeStrong(location, v109);
    id v4 = *location;
  }

  return v4;
}

- (BOOL)_deviceSupportsSideButtonClickSpeed
{
  v2 = AXGetActivePairedDevice();
  objc_super v3 = [v2 valueForProperty:*MEMORY[0x263F57590]];
  id v4 = [v3 lowercaseString];

  if (([v4 hasPrefix:@"n27"] & 1) != 0
    || ([v4 hasPrefix:@"n28"] & 1) != 0
    || ([v4 hasPrefix:@"n74"] & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    int v5 = [v4 hasPrefix:@"n75"] ^ 1;
  }

  return v5;
}

- (id)voiceOverTouchEnabled:(id)a3
{
  objc_super v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  if ([v3 BOOLForKey:@"VoiceOverTouchEnabled"]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  int v5 = settingsLocString(v4, @"AccessibilitySettings");

  return v5;
}

- (id)zoomEnabled:(id)a3
{
  objc_super v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  if ([v3 BOOLForKey:@"ZoomTouchEnabled"]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  int v5 = settingsLocString(v4, @"AccessibilitySettings");

  return v5;
}

- (id)touchAccommodationsEnabled:(id)a3
{
  if (AXGizmoTouchAccommodationsEnabled()) {
    objc_super v3 = @"ON";
  }
  else {
    objc_super v3 = @"OFF";
  }

  return settingsLocString(v3, @"AccessibilitySettings");
}

- (id)reduceTransparencyEnabled:(id)a3
{
  objc_super v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  if ([v3 BOOLForKey:@"EnhancedBackgroundContrastEnabled"]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  int v5 = settingsLocString(v4, @"AccessibilitySettings");

  return v5;
}

- (id)increaseContrastEnabled:(id)a3
{
  objc_super v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  if ([v3 BOOLForKey:@"DarkenSystemColors"]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  int v5 = settingsLocString(v4, @"AccessibilitySettings");

  return v5;
}

- (id)reduceMotionEnabled:(id)a3
{
  objc_super v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  if ([v3 BOOLForKey:@"ReduceMotionEnabled"]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  int v5 = settingsLocString(v4, @"AccessibilitySettings");

  return v5;
}

- (void)setReduceMotionEnabled:(id)a3 specifier:(id)a4
{
}

- (void)setBoldTextEnabled:(id)a3 specifier:(id)a4
{
}

- (id)boldTextEnabled:(id)a3
{
  objc_super v3 = NSNumber;
  id v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  int v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLForKey:", @"EnhancedTextLegibilityEnabled"));

  return v5;
}

- (id)contentSizeCategories
{
  if (contentSizeCategories_onceToken != -1) {
    dispatch_once(&contentSizeCategories_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)contentSizeCategories_contentSizeCategories;

  return v2;
}

void __62__AccessibilityBridgeSettingsController_contentSizeCategories__block_invoke()
{
  v13[7] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F83488];
  v13[0] = *MEMORY[0x263F83458];
  v13[1] = v0;
  uint64_t v1 = *MEMORY[0x263F83450];
  v13[2] = *MEMORY[0x263F83468];
  v13[3] = v1;
  uint64_t v2 = *MEMORY[0x263F83430];
  v13[4] = *MEMORY[0x263F83440];
  v13[5] = v2;
  v13[6] = *MEMORY[0x263F83420];
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:7];
  id v4 = (void *)contentSizeCategories_contentSizeCategories;
  contentSizeCategories_contentSizeCategories = v3;

  int v5 = AXGetActivePairedDevice();
  if (v5)
  {
    unint64_t v6 = [MEMORY[0x263F5B978] sizeFromDevice:v5];
    if (v6 <= 0x15 && ((1 << v6) & 0x386080) != 0)
    {
      v7 = (void *)contentSizeCategories_contentSizeCategories;
      uint64_t v8 = *MEMORY[0x263F83410];
      v12[0] = *MEMORY[0x263F83418];
      v12[1] = v8;
      v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
      uint64_t v10 = [v7 arrayByAddingObjectsFromArray:v9];
      v11 = (void *)contentSizeCategories_contentSizeCategories;
      contentSizeCategories_contentSizeCategories = v10;
    }
  }
}

- (void)setTextSize:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 integerValue];
  unint64_t v6 = [(AccessibilityBridgeSettingsController *)self contentSizeCategories];
  id v11 = [v6 objectAtIndex:v5];

  v7 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.UIKit"];
  [v7 setObject:v11 forKey:@"UIPreferredContentSizeCategoryName"];
  id v8 = (id)[v7 synchronize];
  v9 = objc_opt_new();
  uint64_t v10 = [MEMORY[0x263EFFA08] setWithObject:@"UIPreferredContentSizeCategoryName"];
  [v9 synchronizeNanoDomain:@"com.apple.UIKit" keys:v10];
}

- (id)textSize:(id)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.UIKit"];
  id v5 = (id)[v4 synchronize];
  id v6 = [v4 objectForKey:@"UIPreferredContentSizeCategoryName"];
  if (!v6) {
    id v6 = (id)*MEMORY[0x263F83488];
  }
  v7 = NSNumber;
  id v8 = [(AccessibilityBridgeSettingsController *)self contentSizeCategories];
  v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "indexOfObject:", v6));

  return v9;
}

- (void)setMonoAudioEnabled:(id)a3 specifier:(id)a4
{
}

- (id)monoAudioEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLForKey:", @"MonoAudioEnabled"));

  return v5;
}

- (void)setHeadphoneNotificationsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(ADASManager *)self->_headphoneLevelManager getPreferenceFor:*MEMORY[0x263F28BE8]];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v7 = [v6 BOOLValue];
  }
  else {
    int v7 = 0;
  }
  if ([v5 BOOLValue])
  {
    headphoneLevelManager = self->_headphoneLevelManager;
    uint64_t v9 = *MEMORY[0x263F28BE0];
    uint64_t v10 = MEMORY[0x263EFFA88];
LABEL_10:
    id v21 = (id)[(ADASManager *)headphoneLevelManager setNanoPreferenceFor:v9 value:v10];
    goto LABEL_11;
  }
  if (!v7)
  {
    headphoneLevelManager = self->_headphoneLevelManager;
    uint64_t v9 = *MEMORY[0x263F28BE0];
    uint64_t v10 = MEMORY[0x263EFFA80];
    goto LABEL_10;
  }
  id v11 = (void *)MEMORY[0x263F82418];
  objc_super v12 = settingsLocString(@"HEADPHONE_NOTIFICATIONS_ALERT_TITLE", @"AccessibilitySettings");
  v13 = settingsLocString(@"HEADPHONE_NOTIFICATIONS_ALERT_MESSAGE", @"AccessibilitySettings");
  double v14 = [v11 alertControllerWithTitle:v12 message:v13 preferredStyle:1];

  v15 = (void *)MEMORY[0x263F82400];
  BOOL v16 = settingsLocString(@"HEADPHONE_NOTIFICATIONS_ALERT_OPTION_ON", @"AccessibilitySettings");
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __84__AccessibilityBridgeSettingsController_setHeadphoneNotificationsEnabled_specifier___block_invoke;
  v23[3] = &unk_2651F20C0;
  v23[4] = self;
  v17 = [v15 actionWithTitle:v16 style:1 handler:v23];
  [v14 addAction:v17];

  v18 = (void *)MEMORY[0x263F82400];
  v19 = settingsLocString(@"HEADPHONE_NOTIFICATIONS_ALERT_OPTION_OFF", @"AccessibilitySettings");
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __84__AccessibilityBridgeSettingsController_setHeadphoneNotificationsEnabled_specifier___block_invoke_2;
  v22[3] = &unk_2651F20C0;
  v22[4] = self;
  v20 = [v18 actionWithTitle:v19 style:0 handler:v22];
  [v14 addAction:v20];

  [(AccessibilityBridgeSettingsController *)self presentViewController:v14 animated:1 completion:0];
LABEL_11:
}

uint64_t __84__AccessibilityBridgeSettingsController_setHeadphoneNotificationsEnabled_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"HeadphoneNotificationsID" animated:1];
}

id __84__AccessibilityBridgeSettingsController_setHeadphoneNotificationsEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 1408) setNanoPreferenceFor:*MEMORY[0x263F28BE0] value:MEMORY[0x263EFFA80]];
}

- (id)headphoneNotificationsEnabled:(id)a3
{
  return (id)[(ADASManager *)self->_headphoneLevelManager getNanoPreferenceFor:*MEMORY[0x263F28BE0]];
}

- (id)accessibilityShortcut:(id)a3
{
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  id v4 = [v3 objectForKey:@"TripleClickOptions"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v4 = (void *)MEMORY[0x263EFFA68];
  }
  if ((unint64_t)[v4 count] < 2)
  {
    if ([v4 count])
    {
      id v6 = [v4 firstObject];
      uint64_t v7 = [v6 intValue];

      if ((int)v7 <= 10)
      {
        switch(v7)
        {
          case 1:
            id v5 = @"TRIPLE_CLICK_VOICEOVER_LONG";
            break;
          case 4:
            id v5 = @"TRIPLE_CLICK_ZOOM_LONG";
            break;
          case 8:
            id v5 = @"TRIPLE_CLICK_HEARING_DEVICES_LONG";
            break;
          default:
LABEL_24:
            uint64_t v9 = [MEMORY[0x263F229B8] titleForTripleClickOption:v7];
            goto LABEL_12;
        }
      }
      else
      {
        switch((int)v7)
        {
          case 20:
            id v5 = @"TRIPLE_CLICK_REDUCE_TRANSPARENCY_LONG";
            break;
          case 21:
            id v5 = @"TRIPLE_CLICK_INCREASE_CONTRAST_LONG";
            break;
          case 22:
          case 25:
            goto LABEL_24;
          case 23:
            id v5 = @"WATCH_CONTROL_TRIPLE_CLICK_TITLE";
            id v8 = @"AccessibilitySettings-watchcontrol";
            goto LABEL_11;
          case 24:
            id v5 = @"TRIPLE_CLICK_REDUCE_MOTION_LONG";
            break;
          case 26:
            id v5 = @"TRIPLE_CLICK_LEFT_RIGHT_BALANCE_LONG";
            break;
          default:
            if (v7 == 11)
            {
              id v5 = @"TRIPLE_CLICK_TOUCH_ACCOMMODATIONS_LONG";
            }
            else
            {
              if (v7 != 41) {
                goto LABEL_24;
              }
              id v5 = @"TRIPLE_CLICK_INCREASE_BRIGHTNESS_FLOOR";
            }
            break;
        }
      }
    }
    else
    {
      id v5 = @"TRIPLE_CLICK_OFF";
    }
  }
  else
  {
    id v5 = @"TRIPLE_CLICK_MULTIPLE_OPTIONS";
  }
  id v8 = @"TripleClickSettings";
LABEL_11:
  uint64_t v9 = settingsLocString(v5, v8);
LABEL_12:
  uint64_t v10 = (void *)v9;

  return v10;
}

- (id)hearingDevicesComplicationPreferredDisplayMode:(id)a3
{
  id v4 = [(id)objc_opt_class() domainAccessorForDomain:*MEMORY[0x263F8B1E8]];
  id v5 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:@"HearingAidComplicationPreferredDisplayMode" domainAccessor:v4];
  [v5 integerValue];

  return (id)nameForComplicationPreferredDisplayMode();
}

- (id)accessibilityPreferenceForSpecifier:(id)a3
{
  uint64_t v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  CFNumberRef v4 = [v3 objectForKey:*MEMORY[0x263F8B2D0]];

  objc_opt_class();
  float valuePtr = 0.0;
  float v5 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v4)
  {
    CFNumberGetValue(v4, kCFNumberFloatType, &valuePtr);
    float v5 = valuePtr;
  }
  float v6 = fabsf(v5);
  *(float *)&double v7 = __exp10f(v6 + v6) + -1.0;
  if (v5 < 0.0) {
    *(float *)&double v7 = -*(float *)&v7;
  }
  *(float *)&double v7 = (float)(*(float *)&v7 / 198.0) + 0.5;
  id v8 = [NSNumber numberWithFloat:v7];

  return v8;
}

- (void)accessibilitySetPreference:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [v5 floatValue];
  float v7 = (float)(v6 + -0.5) * 198.0;
  float v8 = log10f(fabsf(v7) + 1.0) * 0.5;
  if (v7 >= 0.0) {
    float v9 = v8;
  }
  else {
    float v9 = -v8;
  }
  [v5 floatValue];
  float v11 = v10;

  if (fabsf(v11 + -0.5) < 0.03 && ([(UISlider *)self->_leftRightSlider isTracking] & 1) == 0)
  {
    float v11 = 0.5;
    LODWORD(v12) = 0.5;
    [(UISlider *)self->_leftRightSlider setValue:1 animated:v12];
    float v9 = 0.0;
  }
  [(AccessibilityBridgeSettingsController *)self _axConvertAudioBalanceValueToDisplay:v11];
  -[AXUISettingsLeftRightSliderCell setDisplayValue:](self->_leftRightCell, "setDisplayValue:");
  double v13 = fabsf(v9);
  if (v13 < 0.1)
  {
    hapticGenerator = self->_hapticGenerator;
    if (!hapticGenerator)
    {
      v15 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x263F82830]) initWithStyle:1];
      BOOL v16 = self->_hapticGenerator;
      self->_hapticGenerator = v15;

      hapticGenerator = self->_hapticGenerator;
    }
    [(UIImpactFeedbackGenerator *)hapticGenerator impactOccurred];
  }
  *(float *)&double v13 = v9;
  id v17 = [NSNumber numberWithFloat:v13];
  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v17 forKey:*MEMORY[0x263F8B2D0] reloadSpecifiers:0];
}

- (double)_axConvertAudioBalanceValueToDisplay:(double)a3
{
  if (a3 >= 0.5) {
    double v3 = a3 + -0.5;
  }
  else {
    double v3 = -(0.5 - a3);
  }
  return v3 + v3;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v20 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  float v8 = (void *)MEMORY[0x263F8B2D0];
  if (isKindOfClass)
  {
    float v9 = [v20 specifier];
    float v10 = [v9 properties];
    float v11 = [v10 objectForKey:*MEMORY[0x263F60170]];
    int v12 = [v11 isEqualToString:*v8];

    if (v12)
    {
      double v13 = [MEMORY[0x263F825C8] colorWithRed:0.654901961 green:0.654901961 blue:0.654901961 alpha:1.0];
      [(UISlider *)self->_leftRightSlider setMinimumTrackTintColor:v13];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_leftRightCell, a4);
    double v14 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    v15 = [v14 objectForKey:*v8];

    [v15 floatValue];
    float v17 = v16;
    float v18 = fabsf(v16);
    float v19 = __exp10f(v18 + v18) + -1.0;
    if (v17 < 0.0) {
      float v19 = -v19;
    }
    [(AccessibilityBridgeSettingsController *)self _axConvertAudioBalanceValueToDisplay:(float)((float)(v19 / 198.0) + 0.5)];
    -[AXUISettingsLeftRightSliderCell setDisplayValue:](self->_leftRightCell, "setDisplayValue:");
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v29.receiver = self;
  v29.super_class = (Class)AccessibilityBridgeSettingsController;
  float v7 = [(AccessibilityBridgeSettingsController *)&v29 tableView:a3 cellForRowAtIndexPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v8 = [v7 specifier];
    float v9 = [v8 properties];
    float v10 = [v9 objectForKey:*MEMORY[0x263F60170]];
    int v11 = [v10 isEqualToString:*MEMORY[0x263F8B2D0]];

    if (v11)
    {
      int v12 = [v7 control];
      objc_storeStrong((id *)&self->_leftRightSlider, v12);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __73__AccessibilityBridgeSettingsController_tableView_cellForRowAtIndexPath___block_invoke;
      v27[3] = &unk_2651F2108;
      id v13 = v12;
      id v28 = v13;
      [v7 setAccessibilityLabelBlock:v27];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __73__AccessibilityBridgeSettingsController_tableView_cellForRowAtIndexPath___block_invoke_2;
      v25[3] = &unk_2651F2108;
      id v14 = v13;
      id v26 = v14;
      [v7 setAccessibilityValueBlock:v25];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __73__AccessibilityBridgeSettingsController_tableView_cellForRowAtIndexPath___block_invoke_3;
      v23[3] = &unk_2651F2130;
      id v24 = v14;
      id v15 = v14;
      [v7 setAccessibilityTraitsBlock:v23];
    }
  }
  float v16 = [(AccessibilityBridgeSettingsController *)self specifierAtIndexPath:v6];
  float v17 = [v16 identifier];
  int v18 = [v17 isEqualToString:@"AudioTranscriptionsSpec"];

  if (v18)
  {
    float v19 = [v7 textLabel];
    [v19 setNumberOfLines:0];

    id v20 = [v7 textLabel];
    LODWORD(v21) = 0.5;
    [v20 _setHyphenationFactor:v21];
  }

  return v7;
}

uint64_t __73__AccessibilityBridgeSettingsController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityLabel];
}

uint64_t __73__AccessibilityBridgeSettingsController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityValue];
}

uint64_t __73__AccessibilityBridgeSettingsController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityTraits];
}

- (id)sideButtonStatus:(id)a3
{
  double v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [v3 doubleForKey:@"SideButtonDoubleTapInterval"];
  double v5 = v4;

  if (vabdd_f64(v5, *MEMORY[0x263F212C8]) >= 0.00999999978)
  {
    if (vabdd_f64(v5, *MEMORY[0x263F212C0]) >= 0.00999999978) {
      id v6 = @"SIDE_CLICK_SPEED_DEFAULT";
    }
    else {
      id v6 = @"SIDE_CLICK_SPEED_SLOW";
    }
  }
  else
  {
    id v6 = @"SIDE_CLICK_SPEED_SLOWEST";
  }
  float v7 = settingsLocString(v6, @"SideButtonSettings");

  return v7;
}

- (id)rttEnabled:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F62AE0], "sharedInstance", a3);
  if ([v3 TTYSoftwareEnabled]) {
    double v4 = @"ON";
  }
  else {
    double v4 = @"OFF";
  }
  double v5 = settingsLocString(v4, @"AccessibilitySettings");

  return v5;
}

- (BOOL)_supportsWatchControl
{
  uint64_t v2 = AXGetActivePairedDevice();
  double v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"D7B1DB8F-6F20-44A7-B454-95B8A418D208"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

- (id)_watchControlDescription
{
  uint64_t v2 = [MEMORY[0x263F85B10] sharedInstance];
  if ([v2 featureEnabled]) {
    double v3 = @"ON";
  }
  else {
    double v3 = @"OFF";
  }
  char v4 = settingsLocString(v3, @"AccessibilitySettings");

  return v4;
}

- (id)_watchQuickActionsV2Description
{
  uint64_t v2 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  double v3 = [v2 objectForKey:*MEMORY[0x263F8B430]];
  int v4 = [v3 intValue];

  double v5 = [MEMORY[0x263F85B10] sharedInstance];
  int v6 = [v5 featureEnabled];

  if (v4) {
    int v7 = 0;
  }
  else {
    int v7 = v6;
  }
  if (v4 == 1) {
    int v7 = 1;
  }
  if (v7) {
    float v8 = @"ON";
  }
  else {
    float v8 = @"OFF";
  }
  float v9 = settingsLocString(v8, @"AccessibilitySettings");

  return v9;
}

- (BOOL)_gizmoSupportsAXAirPodSettings
{
  if (!AXActivePairedDeviceIsHunterOrLater()) {
    return 0;
  }
  uint64_t v2 = AXGetActivePairedDevice();
  double v3 = [v2 valueForProperty:*MEMORY[0x263F575B0]];
  char v4 = [v3 BOOLValue];

  char v5 = v4 ^ 1;
  return v5;
}

- (BOOL)_tapticTimeSpeedAdjustmentSupported
{
  uint64_t v2 = AXGetActivePairedDevice();
  NRWatchOSVersionForRemoteDevice();
  char IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();

  return IsGreaterThanOrEqual;
}

- (BOOL)_tapticChimesIsSupported
{
  uint64_t v2 = AXGetActivePairedDevice();
  double v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"78E1881C-F6E1-421F-BC90-A1EBF1784BB1"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

- (BOOL)_siriIsEnabled
{
  uint64_t v2 = [MEMORY[0x263F285A0] sharedPreferences];
  char v3 = [v2 nanoAssistantEnabled];

  return v3;
}

- (BOOL)_typeToSiriIsSupported
{
  uint64_t v2 = AXGetActivePairedDevice();
  char v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0EEFEB2D-0DDD-44CC-B240-BA8EDE9A1BC5"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

- (BOOL)_walkieTalkieIsSupported
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F57520]);
  char v3 = (void *)[v2 initWithDomain:*MEMORY[0x263F7F298]];
  id v4 = (id)[v3 synchronize];
  char v13 = 0;
  char v5 = [v3 BOOLForKey:*MEMORY[0x263F7F290] keyExistsAndHasValidFormat:&v13];
  if (v13) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 1;
  }
  _TCSInitializeLogging();
  int v7 = (void *)*MEMORY[0x263F7F288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F7F288], OS_LOG_TYPE_DEFAULT))
  {
    float v8 = v7;
    float v9 = NSStringFromBOOL();
    float v10 = NSStringFromBOOL();
    int v11 = NSStringFromBOOL();
    *(_DWORD *)buf = 136315906;
    id v15 = "-[AccessibilityBridgeSettingsController _walkieTalkieIsSupported]";
    __int16 v16 = 2112;
    float v17 = v9;
    __int16 v18 = 2112;
    float v19 = v10;
    __int16 v20 = 2112;
    double v21 = v11;
    _os_log_impl(&dword_246A39000, v8, OS_LOG_TYPE_DEFAULT, "%s returning %@ (keyExists=%@ isWalkieTalkieInstalled=%@)", buf, 0x2Au);
  }
  return v6;
}

- (void)_previewHapticSpeed
{
  id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v2 = [v8 timeZone];
  char v3 = [MEMORY[0x263EFF910] date];
  id v4 = [v8 componentsInTimeZone:v2 fromDate:v3];

  [v4 setHour:3];
  [v4 setMinute:0];
  char v5 = [v4 date];
  BOOL v6 = [MEMORY[0x263F229A8] sharedInstance];
  [v6 setDateOverride:v5];

  int v7 = [MEMORY[0x263F229A8] sharedInstance];
  [v7 outputHours:1];
}

- (void)setAudioTranscriptionsEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __81__AccessibilityBridgeSettingsController_setAudioTranscriptionsEnabled_specifier___block_invoke;
  v32[3] = &unk_2651F2158;
  v32[4] = self;
  id v8 = v6;
  id v33 = v8;
  float v9 = (void (**)(void))MEMORY[0x24C53FB60](v32);
  if ([v8 BOOLValue]
    && ([MEMORY[0x263F285A0] sharedPreferences],
        float v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 nanoDictationEnabled],
        v10,
        (v11 & 1) == 0))
  {
    int v12 = (void *)MEMORY[0x263F82418];
    char v13 = settingsLocString(@"DICTATION_OPT_IN_TITLE", @"AccessibilitySettings-dinnerbell");
    id v14 = settingsLocString(@"DICTATION_OPT_IN_MESSAGE", @"AccessibilitySettings-dinnerbell");
    id v15 = [v12 alertControllerWithTitle:v13 message:v14 preferredStyle:1];

    __int16 v16 = (void *)MEMORY[0x263F82400];
    float v17 = settingsLocString(@"DICTATION_OPT_IN_ENABLE", @"AccessibilitySettings-dinnerbell");
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __81__AccessibilityBridgeSettingsController_setAudioTranscriptionsEnabled_specifier___block_invoke_2;
    v30[3] = &unk_2651F2180;
    v31 = v9;
    v25 = [v16 actionWithTitle:v17 style:0 handler:v30];

    [v15 addAction:v25];
    __int16 v18 = (void *)MEMORY[0x263F82400];
    float v19 = settingsLocString(@"DICTATION_OPT_IN_NOT_NOW", @"AccessibilitySettings-dinnerbell");
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __81__AccessibilityBridgeSettingsController_setAudioTranscriptionsEnabled_specifier___block_invoke_3;
    v28[3] = &unk_2651F21A8;
    v28[4] = self;
    id v20 = v7;
    id v29 = v20;
    double v21 = [v18 actionWithTitle:v19 style:0 handler:v28];

    [v15 addAction:v21];
    uint64_t v22 = (void *)MEMORY[0x263F82400];
    v23 = settingsLocString(@"DICTATION_OPT_IN_ABOUT", @"AccessibilitySettings-dinnerbell");
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __81__AccessibilityBridgeSettingsController_setAudioTranscriptionsEnabled_specifier___block_invoke_4;
    v26[3] = &unk_2651F21A8;
    v26[4] = self;
    id v27 = v20;
    id v24 = [v22 actionWithTitle:v23 style:1 handler:v26];

    [v15 addAction:v24];
    [(AccessibilityBridgeSettingsController *)self presentViewController:v15 animated:1 completion:0];
  }
  else
  {
    v9[2](v9);
  }
}

uint64_t __81__AccessibilityBridgeSettingsController_setAudioTranscriptionsEnabled_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setGizmoAccessibilityPref:*(void *)(a1 + 40) forKey:@"ShowAudioTranscriptionsEnabled"];
}

uint64_t __81__AccessibilityBridgeSettingsController_setAudioTranscriptionsEnabled_specifier___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x263F285A0] sharedPreferences];
  [v2 setNanoDictationEnabled:1];

  char v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

uint64_t __81__AccessibilityBridgeSettingsController_setAudioTranscriptionsEnabled_specifier___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

void __81__AccessibilityBridgeSettingsController_setAudioTranscriptionsEnabled_specifier___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
  id v2 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.siri"];
  [v2 setPresentingViewController:*(void *)(a1 + 32)];
  [v2 present];
}

- (id)audioTranscriptionsEnabled:(id)a3
{
  char v7 = 0;
  char v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v4 = [v3 BOOLForKey:@"ShowAudioTranscriptionsEnabled" keyExistsAndHasValidFormat:&v7];

  if (v7)
  {
    char v5 = [NSNumber numberWithBool:v4];
  }
  else
  {
    char v5 = (void *)MEMORY[0x263EFFA80];
  }

  return v5;
}

- (id)autoAnswerCallDescription:(id)a3
{
  uint64_t v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  char v5 = [v4 BOOLForKey:*MEMORY[0x263F22A58]];

  if (v5)
  {
    char v9 = 0;
    id v6 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    [v6 floatForKey:*MEMORY[0x263F22A60] keyExistsAndHasValidFormat:&v9];

    char v7 = AXLocDuration();
  }
  else
  {
    char v7 = settingsLocString(@"OFF", @"AccessibilitySettings");
  }

  return v7;
}

- (void)setTapticTimeSpeed:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  [v5 floatValue];
  int v7 = v6;
  id v8 = [MEMORY[0x263F22938] sharedInstance];
  LODWORD(v9) = v7;
  [v8 setVoiceOverTapticTimeSpeed:v9];

  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v5 forKey:*MEMORY[0x263F22B48]];

  [(AccessibilityBridgeSettingsController *)self _previewHapticSpeed];
}

- (id)tapticTimeSpeed:(id)a3
{
  char v9 = 0;
  char v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [v3 floatForKey:*MEMORY[0x263F22B48] keyExistsAndHasValidFormat:&v9];
  float v5 = v4;

  LODWORD(v6) = *MEMORY[0x263F212B0];
  if (v9) {
    *(float *)&double v6 = v5;
  }
  int v7 = [NSNumber numberWithFloat:v6];

  return v7;
}

- (BOOL)_supportsLiveSpeech
{
  id v2 = AXGetActivePairedDevice();
  char v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"9A815CF5-4377-41E5-A00A-161FC5C51956"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

- (id)liveSpeechEnabled:(id)a3
{
  char v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  char v4 = [v3 objectForKey:@"TripleClickOptions"];

  if ([v4 containsObject:&unk_26FB00418]) {
    float v5 = @"ON";
  }
  else {
    float v5 = @"OFF";
  }
  double v6 = settingsLocString(v5, @"AccessibilitySettings");

  return v6;
}

- (id)globalColorFilterEnabled
{
  char v7 = 0;
  id v2 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  unsigned __int8 v3 = [v2 BOOLForKey:@"ColorFiltersEnabled" keyExistsAndHasValidFormat:&v7];

  if (((v7 != 0) & v3) != 0) {
    char v4 = @"ON";
  }
  else {
    char v4 = @"OFF";
  }
  float v5 = settingsLocString(v4, @"AccessibilitySettings");

  return v5;
}

- (id)isIncreaseBrightnessFloorEnabled:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F8B2B8];
  float v5 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  double v6 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v4 domainAccessor:v5];

  return v6;
}

- (void)setIncreaseBrightnessFloorEnabled:(id)a3 specifier:(id)a4
{
}

- (ADASManager)headphoneLevelManager
{
  return self->_headphoneLevelManager;
}

- (void)setHeadphoneLevelManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headphoneLevelManager, 0);
  objc_storeStrong((id *)&self->_hapticGenerator, 0);
  objc_storeStrong((id *)&self->_leftRightCell, 0);

  objc_storeStrong((id *)&self->_leftRightSlider, 0);
}

@end