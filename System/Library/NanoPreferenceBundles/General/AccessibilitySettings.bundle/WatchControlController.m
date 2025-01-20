@interface WatchControlController
- (Class)_detailClassForInputSourceType:(unint64_t)a3;
- (id)_descriptionForInputSource:(id)a3;
- (id)_watchQuickActionsV2SwitchDescription;
- (id)focusMovementStyleDescription;
- (id)focusRingColorDescription;
- (id)highContrastFocusRingEnabled;
- (id)sideButtonConfirmWithWatchControl;
- (id)sleepOnWristDownEnabled;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)watchControlEnabled;
- (int)_accessibilitySecureIntentProvider;
- (void)_requestOnboardingEnrollment:(id)a3;
- (void)connectedDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)didCancelOnboarding;
- (void)didConfirmFromOnboarding;
- (void)didReceiveIncomingData:(id)a3;
- (void)setHighContrastFocusRingEnabled:(id)a3;
- (void)setSideButtonConfirmWithWatchControl:(id)a3 specifier:(id)a4;
- (void)setSleepOnWristDownEnabled:(id)a3;
- (void)setWatchControlEnabled:(id)a3;
- (void)viewDidLoad;
@end

@implementation WatchControlController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WatchControlController;
  [(AccessibilityBridgeBaseController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x263F214B0] sharedInstance];
  [v3 registerForIncomingData:self];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F214B0] sharedInstance];
  [v3 deregisterForIncomingData:self];

  v4.receiver = self;
  v4.super_class = (Class)WatchControlController;
  [(AccessibilityBridgeBaseController *)&v4 dealloc];
}

- (id)specifiers
{
  v91[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v7 = settingsLocString(@"WATCH_CONTROL_SWITCH_SECTION_FOOTER", @"AccessibilitySettings-watchcontrol");
    v8 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
    int v9 = [v8 BOOLForKey:@"VoiceOverTouchEnabled"];

    uint64_t v88 = v3;
    if (v9)
    {
      v10 = NSString;
      v11 = settingsLocString(@"WATCH_CONTROL_VOICEOVER_INSTRUCTION", @"AccessibilitySettings-watchcontrol");
      uint64_t v12 = [v10 stringWithFormat:@"%@\n\n%@", v11, v7];

      v7 = (void *)v12;
    }
    v86 = v7;
    uint64_t v84 = *MEMORY[0x263F600F8];
    objc_msgSend(v6, "setProperty:forKey:", v7);
    v87 = v6;
    [v5 addObject:v6];
    v13 = (void *)MEMORY[0x263F5FC40];
    v14 = settingsLocString(@"WATCH_CONTROL_ROW_TITLE", @"AccessibilitySettings-watchcontrol");
    v15 = self;
    v16 = [v13 preferenceSpecifierNamed:v14 target:self set:sel_setWatchControlEnabled_ get:sel_watchControlEnabled detail:0 cell:6 edit:0];

    v17 = [NSNumber numberWithInt:v9 ^ 1u];
    uint64_t v83 = *MEMORY[0x263F600A8];
    objc_msgSend(v16, "setProperty:forKey:", v17);

    v85 = v16;
    [v5 addObject:v16];
    v18 = (void *)MEMORY[0x263F5FC40];
    v19 = settingsLocString(@"WATCH_CONTROL_INPUTS_SECTION", @"AccessibilitySettings-watchcontrol");
    v20 = [v18 groupSpecifierWithName:v19];
    v21 = v5;
    [v5 addObject:v20];

    v22 = [MEMORY[0x263F85B10] sharedInstance];
    v89 = [v22 enabledInputSourceTypes];

    uint64_t v23 = 0;
    char v24 = 1;
    do
    {
      char v25 = v24;
      v26 = AXGetActivePairedDevice();
      int IsSupportedOnDevice = WCInputSourceTypeIsSupportedOnDevice();

      if (IsSupportedOnDevice)
      {
        v28 = [NSNumber numberWithUnsignedInteger:v23];
        v29 = [v89 objectForKeyedSubscript:v28];
        uint64_t v30 = [v29 BOOLValue];

        v31 = (void *)MEMORY[0x263F5FC40];
        v32 = WCNameForInputSourceType();
        v33 = objc_msgSend(v31, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v32, v15, 0, sel__descriptionForInputSource_, -[WatchControlController _detailClassForInputSourceType:](v15, "_detailClassForInputSourceType:", v23), 2, 0);

        v90[0] = @"InputSource";
        v34 = [NSNumber numberWithUnsignedInteger:v23];
        v90[1] = @"InputSourceEnabled";
        v91[0] = v34;
        v35 = [NSNumber numberWithBool:v30];
        v91[1] = v35;
        v36 = [NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
        [v33 setUserInfo:v36];

        [v5 addObject:v33];
      }
      char v24 = 0;
      uint64_t v23 = 1;
    }
    while ((v25 & 1) != 0);
    v37 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v5 addObject:v37];

    v38 = (void *)MEMORY[0x263F5FC40];
    v39 = settingsLocString(@"WATCH_CONTROL_MOVEMENT_STYLE", @"AccessibilitySettings-watchcontrol");
    v40 = [v38 preferenceSpecifierNamed:v39 target:v15 set:0 get:sel_focusMovementStyleDescription detail:objc_opt_class() cell:2 edit:0];
    [v21 addObject:v40];

    if (AXActivePairedDeviceIsLighthouseOrLater())
    {
      v41 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      [v21 addObject:v41];

      v42 = (void *)MEMORY[0x263F5FC40];
      v43 = settingsLocString(@"WATCH_CONTROL_SLEEP_ON_WRIST_DOWN", @"AccessibilitySettings-watchcontrol");
      v44 = [v42 preferenceSpecifierNamed:v43 target:v15 set:sel_setSleepOnWristDownEnabled_ get:sel_sleepOnWristDownEnabled detail:0 cell:6 edit:0];

      [v44 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5FEF8]];
      [v21 addObject:v44];
    }
    v45 = (void *)MEMORY[0x263F5FC40];
    v46 = settingsLocString(@"WATCH_CONTROL_APPEARANCE_SECTION", @"AccessibilitySettings-watchcontrol");
    v47 = [v45 groupSpecifierWithName:v46];
    [v21 addObject:v47];

    v48 = (void *)MEMORY[0x263F5FC40];
    v49 = settingsLocString(@"WATCH_CONTROL_FOCUS_RING_HIGH_CONTRAST", @"AccessibilitySettings-watchcontrol");
    v50 = [v48 preferenceSpecifierNamed:v49 target:v15 set:sel_setHighContrastFocusRingEnabled_ get:sel_highContrastFocusRingEnabled detail:0 cell:6 edit:0];
    [v21 addObject:v50];

    v51 = (void *)MEMORY[0x263F5FC40];
    v52 = settingsLocString(@"WATCH_CONTROL_FOCUS_RING_COLOR", @"AccessibilitySettings-watchcontrol");
    v53 = [v51 preferenceSpecifierNamed:v52 target:v15 set:0 get:sel_focusRingColorDescription detail:objc_opt_class() cell:2 edit:0];
    [v21 addObject:v53];

    v54 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v21 addObject:v54];

    v55 = (void *)MEMORY[0x263F5FC40];
    v56 = settingsLocString(@"WATCH_CONTROL_CUSTOMIZE_ACTION_MENU", @"AccessibilitySettings-watchcontrol");
    v57 = [v55 preferenceSpecifierNamed:v56 target:v15 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v21 addObject:v57];

    v58 = (void *)MEMORY[0x263F5FC40];
    v59 = settingsLocString(@"SIDE_BUTTON_CONFIRM_SECTION_TITLE", @"AccessibilitySettings-watchcontrol");
    v60 = [v58 groupSpecifierWithName:v59];

    v61 = settingsLocString(@"SIDE_BUTTON_CONFIRM_SECTION_FOOTER", @"AccessibilitySettings-watchcontrol");
    [v60 setProperty:v61 forKey:v84];

    [v21 addObject:v60];
    v62 = [MEMORY[0x263F214B0] sharedInstance];
    v63 = [v62 connectedDevices];
    uint64_t v64 = [v63 count];

    int v65 = [(WatchControlController *)v15 _accessibilitySecureIntentProvider];
    v66 = (void *)MEMORY[0x263F5FC40];
    if (v65)
    {
      v67 = settingsLocString(@"SIDE_BUTTON_CONFIRM_WITH_WATCH_CONTROL", @"AccessibilitySettings-watchcontrol");
      v68 = [v66 preferenceSpecifierNamed:v67 target:v15 set:sel_setSideButtonConfirmWithWatchControl_specifier_ get:sel_sideButtonConfirmWithWatchControl detail:0 cell:6 edit:0];

      v69 = [NSNumber numberWithBool:v64 != 0];
      [v68 setProperty:v69 forKey:v83];

      uint64_t v70 = *MEMORY[0x263F60138];
      [v68 setProperty:@"SideButtonOptOutSpecifier" forKey:*MEMORY[0x263F60138]];
      [v21 addObject:v68];
      if (v64)
      {
        v71 = [(AccessibilityBridgeBaseController *)v15 accessibilityDomainAccessor];
        v72 = [(AccessibilityBridgeBaseController *)v15 gizmoValueForKey:@"WatchControlDisableSideButtonConfirm" domainAccessor:v71];
        int v73 = [v72 BOOLValue];

        if (v73) {
          [(AccessibilityBridgeBaseController *)v15 setGizmoAccessibilityPref:MEMORY[0x263EFFA80] forKey:@"WatchControlDisableSideButtonConfirm" reloadSpecifiers:0];
        }
      }
    }
    else
    {
      v74 = settingsLocString(@"SIDE_BUTTON_CONFIRM_ENROLLMENT_WITH_WATCH_CONTROL", @"AccessibilitySettings-watchcontrol");
      v68 = [v66 preferenceSpecifierNamed:v74 target:v15 set:0 get:0 detail:0 cell:13 edit:0];

      [v68 setButtonAction:sel__requestOnboardingEnrollment_];
      v75 = [NSNumber numberWithBool:v64 != 0];
      [v68 setProperty:v75 forKey:v83];

      uint64_t v70 = *MEMORY[0x263F60138];
      [v68 setProperty:@"SideButtonEnrollmentSpecifier" forKey:*MEMORY[0x263F60138]];
      [v68 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
      [v21 addObject:v68];
    }

    if (AXActivePairedDeviceSupportsWatchQuickActionsV2()
      && (AXActivePairedDeviceSupportsQuickActionsAlwaysOnState() & 1) == 0)
    {
      v76 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
      v77 = settingsLocString(@"QUICK_ACTIONS_SWITCH_FOOTER", @"AccessibilitySettings-elton");
      [v76 setProperty:v77 forKey:v84];

      [v21 addObject:v76];
      v78 = (void *)MEMORY[0x263F5FC40];
      v79 = settingsLocString(@"QUICK_ACTIONS_ROW_TITLE", @"AccessibilitySettings-quickactions");
      v80 = [v78 preferenceSpecifierNamed:v79 target:v15 set:0 get:sel__watchQuickActionsV2SwitchDescription detail:objc_opt_class() cell:2 edit:0];

      [v80 setProperty:@"QUICK_ACTIONS" forKey:v70];
      [v21 addObject:v80];
    }
    v81 = *(Class *)((char *)&v15->super.super.super.super.super.super.isa + v88);
    *(Class *)((char *)&v15->super.super.super.super.super.super.isa + v88) = (Class)v21;

    objc_super v4 = *(Class *)((char *)&v15->super.super.super.super.super.super.isa + v88);
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)WatchControlController;
  id v6 = a4;
  v7 = [(WatchControlController *)&v15 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = -[WatchControlController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v15.receiver, v15.super_class);

  uint64_t v9 = *MEMORY[0x263F60138];
  v10 = [v8 propertyForKey:*MEMORY[0x263F60138]];
  if ([v10 isEqualToString:@"SideButtonEnrollmentSpecifier"])
  {
  }
  else
  {
    v11 = [v8 propertyForKey:v9];
    int v12 = [v11 isEqualToString:@"SideButtonOptOutSpecifier"];

    if (!v12) {
      goto LABEL_5;
    }
  }
  v13 = [v7 textLabel];
  [v13 setNumberOfLines:0];

LABEL_5:

  return v7;
}

- (Class)_detailClassForInputSourceType:(unint64_t)a3
{
  uint64_t v3 = objc_opt_class();

  return (Class)v3;
}

- (id)_descriptionForInputSource:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"InputSource"];

  id v6 = [v3 userInfo];

  v7 = [v6 objectForKeyedSubscript:@"InputSourceEnabled"];

  v8 = 0;
  if (v5 && v7)
  {
    uint64_t v9 = [v5 unsignedIntegerValue];
    char v10 = [v7 BOOLValue];
    if (v9 == 1)
    {
      v11 = [MEMORY[0x263F85B10] sharedInstance];
      int v12 = [v11 dwellControlEnabled];

      if (!v12)
      {
        v8 = 0;
        goto LABEL_12;
      }
      v13 = @"WATCH_CONTROL_DWELL_CONTROL_ENABLED_STATE";
      v14 = @"AccessibilitySettings-watchcontrol";
    }
    else
    {
      if (v10) {
        v13 = @"ON";
      }
      else {
        v13 = @"OFF";
      }
      v14 = @"AccessibilitySettings";
    }
    v8 = settingsLocString(v13, v14);
  }
LABEL_12:

  return v8;
}

- (id)watchControlEnabled
{
  v2 = NSNumber;
  id v3 = [MEMORY[0x263F85B10] sharedInstance];
  objc_super v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "featureEnabled"));

  return v4;
}

- (void)setWatchControlEnabled:(id)a3
{
  int v4 = [a3 BOOLValue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__WatchControlController_setWatchControlEnabled___block_invoke;
  v7[3] = &unk_2651F24B0;
  char v8 = v4;
  v7[4] = self;
  v5 = (void (**)(void))MEMORY[0x24C53FB60](v7);
  if (AXActivePairedDeviceSupportsHasEltonEnabled() && v4)
  {
    id v6 = settingsLocString(@"GREY_FEATURE_NAME_WATCH_CONTROL", @"AccessibilitySettings-elton");
    [(AccessibilityBridgeBaseController *)self presentDisableEltonAlert:v6 greyOptional:0 confirmBlock:v5 disableGreyBlock:0];
  }
  else
  {
    v5[2](v5);
  }
}

void __49__WatchControlController_setWatchControlEnabled___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = [MEMORY[0x263F85B10] sharedInstance];
    char v3 = [v2 hasShownInitialOnboarding];

    if ((v3 & 1) == 0)
    {
      int v4 = [MEMORY[0x263F85B10] sharedInstance];
      [v4 setHasShownInitialOnboarding:1];

      [MEMORY[0x263F85B08] presentOnboardingFromViewController:*(void *)(a1 + 32) withObserver:*(void *)(a1 + 32)];
    }
  }
  id v5 = [MEMORY[0x263F85B10] sharedInstance];
  [v5 setFeatureEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setHighContrastFocusRingEnabled:(id)a3
{
  char v3 = (void *)MEMORY[0x263F85B10];
  id v4 = a3;
  id v6 = [v3 sharedInstance];
  uint64_t v5 = [v4 BOOLValue];

  [v6 setFocusRingHighContrastEnabled:v5];
}

- (id)highContrastFocusRingEnabled
{
  v2 = NSNumber;
  char v3 = [MEMORY[0x263F85B10] sharedInstance];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "focusRingHighContrastEnabled"));

  return v4;
}

- (id)focusRingColorDescription
{
  v2 = [MEMORY[0x263F85B10] sharedInstance];
  [v2 focusRingColor];
  char v3 = WCNameForCursorColor();

  return v3;
}

- (id)focusMovementStyleDescription
{
  v2 = [MEMORY[0x263F85B10] sharedInstance];
  [v2 focusMovementStyle];
  char v3 = WCNameForFocusMovementStyle();

  return v3;
}

- (void)setSleepOnWristDownEnabled:(id)a3
{
}

- (id)sleepOnWristDownEnabled
{
  uint64_t v3 = *MEMORY[0x263F22A50];
  id v4 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  uint64_t v5 = [(AccessibilityBridgeBaseController *)self gizmoValueForKey:v3 domainAccessor:v4];
  id v6 = v5;
  if (!v5) {
    uint64_t v5 = &unk_26FB00640;
  }
  id v7 = v5;

  return v7;
}

- (void)setSideButtonConfirmWithWatchControl:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue])
  {
    uint64_t v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_246A39000, v5, OS_LOG_TYPE_DEFAULT, "cannot enable this from Bridge", v7, 2u);
    }
  }
  else
  {
    uint64_t v6 = MEMORY[0x263EFFA88];
    [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v6 forKey:@"WatchControlDisableSideButtonConfirm" reloadSpecifiers:0];
  }
}

- (id)sideButtonConfirmWithWatchControl
{
  v2 = NSNumber;
  BOOL v3 = [(WatchControlController *)self _accessibilitySecureIntentProvider] != 0;

  return (id)[v2 numberWithInt:v3];
}

- (int)_accessibilitySecureIntentProvider
{
  v2 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x263F8B370]];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (void)_requestOnboardingEnrollment:(id)a3
{
  id v4 = (id)objc_opt_new();
  [v4 setModalInPresentation:1];
  [(WatchControlController *)self presentModalViewController:v4 withTransition:3];
}

- (id)_watchQuickActionsV2SwitchDescription
{
  v2 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x263F8B430]];
  int v4 = [v3 intValue];

  if (v4 == 2) {
    uint64_t v5 = @"OFF";
  }
  else {
    uint64_t v5 = @"ON";
  }

  return settingsLocString(v5, @"AccessibilitySettings");
}

- (void)didReceiveIncomingData:(id)a3
{
  BOOL v3 = [a3 objectForKeyedSubscript:*MEMORY[0x263F214A0]];
  int v4 = [v3 objectForKeyedSubscript:@"ASTDisableEnrollment"];
  int v5 = [v4 BOOLValue];

  if (v5) {
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

uint64_t __49__WatchControlController_didReceiveIncomingData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)connectedDevicesDidChange:(id)a3
{
  BOOL v3 = [(WatchControlController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

uint64_t __52__WatchControlController_connectedDevicesDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)didConfirmFromOnboarding
{
  id v2 = [MEMORY[0x263F85B10] sharedInstance];
  [v2 setHasShownInitialOnboarding:1];
}

- (void)didCancelOnboarding
{
  BOOL v3 = [MEMORY[0x263F85B10] sharedInstance];
  [v3 setFeatureEnabled:0];

  [(WatchControlController *)self reloadSpecifiers];
}

@end