@interface VoiceOverController
- (BOOL)_gizmoHasTapticTime;
- (BOOL)_gizmoLocaleIsRTL;
- (BOOL)_gizmoSupportsBraille;
- (BOOL)_gizmoSupportsDetents;
- (BOOL)_gizmoVoiceOverHandGesturesEnabled;
- (VoiceOverController)init;
- (id)areVoiceOverHandGesturesEnabled;
- (id)instructionsText;
- (id)speakingRate:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)voiceOverDelayUntilSpeakInterval:(id)a3;
- (id)voiceOverDigitalCrownNavigationEnabled:(id)a3;
- (id)voiceOverDoubleTapInterval:(id)a3;
- (id)voiceOverGestureDirectionSummary:(id)a3;
- (id)voiceOverTapticTimeSummary:(id)a3;
- (id)voiceOverTouchEnabled:(id)a3;
- (void)dealloc;
- (void)setSpeakingRate:(id)a3 specifier:(id)a4;
- (void)setVoiceOverTouchEnabled:(id)a3 specifier:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)voiceOverSetDigitalCrownNavigationEnabled:(id)a3 specifier:(id)a4;
@end

@implementation VoiceOverController

- (VoiceOverController)init
{
  v6.receiver = self;
  v6.super_class = (Class)VoiceOverController;
  v2 = [(AccessibilityBridgeBaseController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_reload name:@"AXVoiceOverReloadNotification" object:0];

    v4 = v2;
  }

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VoiceOverController;
  [(AccessibilityBridgeBaseController *)&v4 viewWillAppear:a3];
  [(VoiceOverController *)self reload];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)VoiceOverController;
  [(AccessibilityBridgeBaseController *)&v5 dealloc];
}

- (id)specifiers
{
  v2 = self;
  uint64_t v61 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v41 = (int)*MEMORY[0x263F5FDB8];
    v43 = (void *)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
    [(VoiceOverController *)v2 loadSpecifiersFromPlistName:@"VoiceOverSettings" target:v2];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v50)
    {
      uint64_t v4 = *MEMORY[0x263F60170];
      uint64_t v42 = *MEMORY[0x263F600A8];
      uint64_t v46 = *MEMORY[0x263F60240];
      uint64_t v47 = *MEMORY[0x263F60250];
      uint64_t v48 = *MEMORY[0x263F60170];
      uint64_t v49 = *(void *)v57;
      uint64_t v45 = *MEMORY[0x263F60138];
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v57 != v49) {
            objc_enumerationMutation(obj);
          }
          objc_super v6 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v7 = [v6 propertyForKey:v4];
          int v8 = [v7 isEqualToString:@"VoiceOverTouchEnabled"];

          if (v8)
          {
            v9 = NSNumber;
            v10 = [MEMORY[0x263F85B10] sharedInstance];
            v11 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "featureEnabled") ^ 1);
            [v6 setProperty:v11 forKey:v42];
          }
          v12 = [v6 propertyForKey:v4];
          int v13 = [v12 isEqualToString:@"VoiceOverTouchSpeakingRate"];

          if (v13)
          {
            v14 = AXHareImage();
            [v6 setProperty:v14 forKey:v47];

            v15 = AXTortoiseImage();
            [v6 setProperty:v15 forKey:v46];
          }
          if (AXActivePairedDeviceIsLighthouseOrLater())
          {
            v16 = [v6 propertyForKey:v4];
            int v55 = [v16 hasPrefix:@"VoiceOverTouchVolume"];
          }
          else
          {
            int v55 = 0;
          }
          v17 = [v6 propertyForKey:v4];
          int v18 = [v17 isEqualToString:@"VoiceOverTouchVolume"];

          if (v18)
          {
            v19 = AXVolumeMaxImage();
            [v6 setProperty:v19 forKey:v47];

            v20 = AXVolumeMinImage();
            [v6 setProperty:v20 forKey:v46];
          }
          if ([(VoiceOverController *)v2 _gizmoHasTapticTime])
          {
            int v54 = 0;
          }
          else
          {
            v21 = [v6 propertyForKey:v4];
            int v54 = [v21 hasPrefix:@"TapticTime"];
          }
          if ([(VoiceOverController *)v2 _gizmoLocaleIsRTL])
          {
            int v53 = 0;
          }
          else
          {
            v22 = [v6 propertyForKey:v4];
            int v53 = [v22 hasPrefix:@"GestureDirection"];
          }
          if ([(VoiceOverController *)v2 _gizmoSupportsBraille])
          {
            int v52 = 0;
          }
          else
          {
            v23 = [v6 propertyForKey:v45];
            int v52 = [v23 hasPrefix:@"Braille"];
          }
          if ([(VoiceOverController *)v2 _gizmoSupportsDetents]
            && !AXActivePairedDeviceIsLighthouseOrLater())
          {
            int v51 = 0;
          }
          else
          {
            v24 = [v6 propertyForKey:v45];
            int v51 = [v24 hasPrefix:@"Detents"];
          }
          if (AXActivePairedDeviceIsLighthouseOrLater())
          {
            int v25 = 0;
          }
          else
          {
            v26 = [v6 propertyForKey:v45];
            if ([v26 hasPrefix:@"Speech"])
            {
              int v25 = 1;
            }
            else
            {
              v27 = [v6 propertyForKey:v45];
              int v25 = [v27 hasPrefix:@"Audio"];
            }
          }
          if (AXActivePairedDeviceIsLighthouseOrLater())
          {
            int v28 = 0;
          }
          else
          {
            v29 = [v6 propertyForKey:v45];
            int v28 = [v29 hasPrefix:@"SleepOnWristDown"];
          }
          if (AXActivePairedDeviceIsLighthouseOrLater())
          {
            v30 = [v6 propertyForKey:v45];
            int v31 = [v30 hasPrefix:@"RotorLanguages"];
          }
          else
          {
            int v31 = 0;
          }
          if ([(VoiceOverController *)v2 _gizmoVoiceOverHandGesturesEnabled])
          {
            int v32 = 0;
          }
          else
          {
            v33 = [v6 propertyForKey:v45];
            int v32 = [v33 hasPrefix:@"HandGestures"];
          }
          if (AXActivePairedDeviceIsLighthouseEOrLater())
          {
            int v34 = 0;
          }
          else
          {
            v35 = [v6 propertyForKey:v45];
            int v34 = [v35 hasPrefix:@"VoiceOverDoubleTapInterval"];
          }
          if (AXActivePairedDeviceIsMoonstoneOrLater())
          {
            int v36 = 0;
          }
          else
          {
            [v6 propertyForKey:v45];
            v38 = v37 = v2;
            int v36 = [v38 hasPrefix:@"VoiceOverDelayUntilSpeak"];

            v2 = v37;
          }
          if (((v36 | v34 | v32 | v31 | v28 | v25 | v51 | v52 | v53 | v54 | v55) & 1) == 0) {
            [v43 addObject:v6];
          }
          uint64_t v4 = v48;
        }
        uint64_t v50 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v50);
    }
    v39 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v41);
    *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v41) = (Class)v43;

    v3 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v41);
  }

  return v3;
}

- (void)setSpeakingRate:(id)a3 specifier:(id)a4
{
  [a3 floatValue];

  +[VOSettingsHelper setSpeakingRate:](_TtC21AccessibilitySettings16VOSettingsHelper, "setSpeakingRate:");
}

- (id)speakingRate:(id)a3
{
  v3 = NSNumber;
  +[VOSettingsHelper speakingRate];

  return (id)objc_msgSend(v3, "numberWithFloat:");
}

- (id)voiceOverTouchEnabled:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F8B3F8];
  objc_super v5 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  objc_super v6 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v4 domainAccessor:v5];

  return v6;
}

- (void)setVoiceOverTouchEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  int v6 = [v5 BOOLValue];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __58__VoiceOverController_setVoiceOverTouchEnabled_specifier___block_invoke;
  v15 = &unk_2651F2158;
  v16 = self;
  id v17 = v5;
  id v7 = v5;
  int v8 = (void (**)(void))MEMORY[0x24C53FB60](&v12);
  v9 = [(VoiceOverController *)self areVoiceOverHandGesturesEnabled];
  int v10 = [v9 BOOLValue];

  if (AXActivePairedDeviceSupportsHasEltonEnabled() && v6 && v10)
  {
    v11 = settingsLocString(@"GREY_FEATURE_NAME_VOICEOVER", @"AccessibilitySettings-elton");
    [(AccessibilityBridgeBaseController *)self presentDisableEltonAlert:v11 greyOptional:1 confirmBlock:v8 disableGreyBlock:&__block_literal_global_4];
  }
  else
  {
    v8[2](v8);
  }
}

uint64_t __58__VoiceOverController_setVoiceOverTouchEnabled_specifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setGizmoAccessibilityPref:*(void *)(a1 + 40) forKey:*MEMORY[0x263F8B3F8]];
}

void __58__VoiceOverController_setVoiceOverTouchEnabled_specifier___block_invoke_2()
{
  id v0 = [MEMORY[0x263F85B10] sharedInstance];
  [v0 setVoiceOverHandGestures:0];
}

- (id)voiceOverGestureDirectionSummary:(id)a3
{
  v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v4 = [v3 objectForKey:@"VoiceOverNavigationDirectionMode"];

  if (v4 && [v4 integerValue] != 2) {
    id v5 = @"VOICEOVER_RTL_GESTURE_DIRECTION";
  }
  else {
    id v5 = @"VOICEOVER_LTR_GESTURE_DIRECTION";
  }
  int v6 = settingsLocString(v5, @"VoiceOverSettings");

  return v6;
}

- (id)voiceOverTapticTimeSummary:(id)a3
{
  v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v4 = [v3 objectForKey:@"VoiceOverTapticTimeMode"];

  id v5 = @"ON";
  if (v4 && ![v4 BOOLValue]) {
    id v5 = @"OFF";
  }
  int v6 = settingsLocString(v5, @"AccessibilitySettings");

  return v6;
}

- (id)voiceOverDigitalCrownNavigationEnabled:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x263F22B60]));

  return v5;
}

- (void)voiceOverSetDigitalCrownNavigationEnabled:(id)a3 specifier:(id)a4
{
}

- (id)voiceOverDelayUntilSpeakInterval:(id)a3
{
  v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [v3 doubleForKey:@"VoiceOverDelayUntilSpeakUnderTouch"];

  return (id)AXLocalizedTimeSummary();
}

- (id)voiceOverDoubleTapInterval:(id)a3
{
  v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  [v3 doubleForKey:@"VoiceOverDoubleTapInterval"];

  return (id)AXLocalizedTimeSummary();
}

- (BOOL)_gizmoHasTapticTime
{
  v2 = AXGetActivePairedDevice();
  NRWatchOSVersionForRemoteDevice();
  char IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();

  return IsGreaterThanOrEqual;
}

- (BOOL)_gizmoSupportsBraille
{
  v2 = AXGetActivePairedDevice();
  v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"8620D455-7F5A-4871-B19E-88F914C977A7"];
  char v4 = [v2 supportsCapability:v3];

  return v4;
}

- (BOOL)_gizmoSupportsDetents
{
  v2 = AXGetActivePairedDevice();
  if (AXActivePairedDeviceIsHunterOrLater())
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1E189BE1-6A71-44AA-B116-0066A83035E8"];
    char v4 = [v2 supportsCapability:v3];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_gizmoLocaleIsRTL
{
  v2 = [(id)objc_opt_class() domainAccessorForDomain:@".GlobalPreferences"];
  id v3 = (id)[v2 synchronize];
  uint64_t v4 = [v2 objectForKey:@"AppleLocale"];
  if (v4) {
    id v5 = (__CFString *)v4;
  }
  else {
    id v5 = @"en_US";
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v5];
  }
  else
  {
    int v6 = 0;
  }
  id v7 = (void *)MEMORY[0x263EFF960];
  int v8 = [v6 objectForKey:*MEMORY[0x263EFF508]];
  LOBYTE(v7) = [v7 characterDirectionForLanguage:v8] == 2;

  return (char)v7;
}

- (BOOL)_gizmoVoiceOverHandGesturesEnabled
{
  return [MEMORY[0x263F84DC8] isVoiceOverGreyFeatureOn];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)VoiceOverController;
  id v6 = a4;
  id v7 = [(VoiceOverController *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  int v8 = -[VoiceOverController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v14.receiver, v14.super_class);

  v9 = [v8 identifier];
  LODWORD(v6) = [v9 isEqualToString:@"DigitalCrownNavigation"];

  if (v6)
  {
    int v10 = [v7 textLabel];
    [v10 setNumberOfLines:0];

    v11 = [v7 textLabel];
    LODWORD(v12) = 0.5;
    [v11 _setHyphenationFactor:v12];
  }

  return v7;
}

- (id)areVoiceOverHandGesturesEnabled
{
  v2 = NSNumber;
  id v3 = [MEMORY[0x263F85B10] sharedInstance];
  uint64_t v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "voiceOverHandGesturesEnabled"));

  return v4;
}

- (id)instructionsText
{
  v2 = NSString;
  id v3 = settingsLocString(@"VOICEOVER_INTRO", @"VoiceOverSettings");
  uint64_t v4 = settingsLocString(@"SELECT_ITEM_INSTRUCTION", @"VoiceOverSettings");
  id v5 = settingsLocString(@"PRESS_ITEM_INSTRUCTION", @"VoiceOverSettings");
  id v6 = settingsLocString(@"SCROLL_ITEM_INSTRUCTION", @"VoiceOverSettings");
  id v7 = [v2 stringWithFormat:@"%@\n%@\n%@\n%@", v3, v4, v5, v6];

  int v8 = [MEMORY[0x263F85B10] sharedInstance];
  LODWORD(v3) = [v8 featureEnabled];

  if (v3)
  {
    v9 = NSString;
    int v10 = settingsLocString(@"VOICEOVER_WATCH_CONTROL_INSTRUCTION", @"VoiceOverSettings");
    uint64_t v11 = [v9 stringWithFormat:@"%@\n\n%@", v10, v7];

    id v7 = (void *)v11;
  }

  return v7;
}

@end